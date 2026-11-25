"""Independently verify Podimo guest-playback and Android Auto patch output."""
import argparse
import hashlib
from pathlib import Path
import re

from atv_smali import methods
from podimo_contracts import (
    BASE_SHA256, BANNER, CALLER_GATE, CHAIN, EXTENSION_PREFIXES, FILTER_CALL, FOR_YOU_MAPPER,
    GATEWAY_URL, HIDDEN_BANNER, LIBRARY_RESULT, PATCH_METHODS, REGISTER_TOTALS, ROOT_BROWSE,
    ROOT_TABS, SUCCESS_RESULT, TREE_FILTER, TREE_FOR, UNLOCK, URL_CTOR, WEBSITE_URL,
)
from verify_weerplaza import canonical_method


def original_contract(root: Path) -> None:
    """The supplied build must expose every pinned method exactly as decoded before patching."""
    for cls, signature, locals_, count in UNLOCK:
        code = canonical_method(root, cls, signature)
        assert _locals(root, cls, signature) == locals_, f'{cls}.{signature} locals drifted'
        assert len(code) == count, f'{cls}.{signature} instruction count drifted: {len(code)}'
    cls, signature, locals_, count = BANNER
    code = canonical_method(root, cls, signature)
    assert _locals(root, cls, signature) == locals_, 'Banner builder locals drifted'
    assert len(code) == count, f'Banner builder instruction count drifted: {len(code)}'
    cls, signature, locals_, count = URL_CTOR
    code = canonical_method(root, cls, signature)
    assert _locals(root, cls, signature) == locals_, 'URL map constructor locals drifted'
    assert len(code) == count, 'URL map constructor instruction count drifted'
    urls = [line for line in code if 'const-string' in line and 'graphql' in line]
    assert [GATEWAY_URL] == [_unquote(urls[0])], 'Production GraphQL URL contract drifted'
    for cls, signature, locals_, count in (FOR_YOU_MAPPER, ROOT_BROWSE, CALLER_GATE):
        code = canonical_method(root, cls, signature)
        assert _locals(root, cls, signature) == locals_, f'{cls}.{signature} car hook locals drifted'
        assert len(code) == count, f'{cls}.{signature} car hook instruction count drifted: {len(code)}'
    for cls, signature, needles in CHAIN:
        code = '\n'.join(canonical_method(root, cls, signature))
        for needle in needles:
            assert needle in code, f'{cls}.{signature} missing swap-chain evidence: {needle}'
    pinned = UNLOCK + [BANNER, URL_CTOR, FOR_YOU_MAPPER, ROOT_BROWSE, CALLER_GATE]
    for cls, signature, locals_, _ in pinned:
        parameters = signature.split('(', 1)[1].split(')')[0]
        total = locals_ + _parameter_slots(parameters) + 1
        expected = REGISTER_TOTALS[f'{cls}->{signature}']
        assert total == expected, f'{cls}.{signature} register total {total} != pinned {expected}'


def _parameter_slots(parameters: str) -> int:
    """Count register slots from a smali parameter list; J and D occupy two slots."""
    if not parameters:
        return 0
    return sum(2 if kind in ('J', 'D') else 1
               for kind in re.findall(r'\[*L[^;]+;|\[*[ZBCSIJFD]', parameters))


def _locals(root: Path, cls: str, signature: str) -> int:
    paths = list(root.glob(f'smali*/{cls}.smali')) + list(root.glob(f'smali/smali*/{cls}.smali'))
    assert len(paths) == 1, cls
    match = re.search(r'^\.method[^\n]* ' + re.escape(signature) + r'\n(.*?)^\.end method',
                      paths[0].read_text(), re.M | re.S)
    found = re.search(r'\.locals (\d+)', match[1])
    assert found, f'{cls}.{signature} needs explicit locals'
    return int(found.group(1))


def _unquote(const_line: str) -> str:
    parts = const_line.split(', ', 2)
    return parts[-1].strip('"')


def _plain(rows: list[str]) -> list[str]:
    """Drop resolved label targets so spliced bodies compare by instruction identity."""
    return [re.sub(r'@-?\d+', '@', line) for line in rows]


def _splice(rows: list[str], index: int, block: list[str]) -> list[str]:
    return rows[:index] + block + rows[index:]


def patched_contract(original: Path, patched: Path, selected: set[str]) -> None:
    """Only the selected patches' methods may differ, by exactly the expected edits."""
    before, after = methods(original), methods(patched)
    assert before, 'Empty original method inventory'
    added = set(after) - set(before)
    unexpected_added = {key for key in added if not key.startswith(EXTENSION_PREFIXES)}
    assert not unexpected_added, f'Podimo patch added unexpected classes: {sorted(unexpected_added)}'
    assert before.keys() <= after.keys(), 'Podimo patch removed methods'
    changed = {key for key in before if before[key] != after[key]}
    expected = {key for name in selected for key in PATCH_METHODS[name]}
    assert changed == expected, f'Unexpected Podimo changes: {sorted(changed - expected)} / missing: {sorted(expected - changed)}'

    # (class, signature, inserted prefix) pairs the unlock patch may touch.
    gates = [(cls, signature, SUCCESS_RESULT) for cls, signature, _, _ in UNLOCK]
    gates.append((BANNER[0], BANNER[1], HIDDEN_BANNER))
    for cls, signature, prefix in gates:
        key = f'L{cls};->{signature}'
        body = canonical_method(patched, cls, signature)
        if key not in expected:
            assert body == canonical_method(original, cls, signature), f'{cls}.{signature} must stay original'
            continue
        if cls == BANNER[0]:
            # The invisible banner is spliced in front of the pill row assembly,
            # not prepended to the method.
            original_body = _plain(canonical_method(original, cls, signature))
            row = next(i for i, line in enumerate(original_body) if line == 'new-instance v1, Lwv/f;')
            assert _plain(body) == _splice(original_body, row, _plain(HIDDEN_BANNER)), \
                f'{cls}.{signature} banner splice changed'
            continue
        assert body[:len(prefix)] == prefix, f'{cls}.{signature} missing patch prefix'
        tail = [re.sub(r'@(-?\d+)', lambda m: '@' + str(int(m.group(1)) - len(prefix)), line)
                for line in body[len(prefix):]]
        assert tail == canonical_method(original, cls, signature), f'{cls}.{signature} original body must be preserved after the prefix'

    cls, signature = URL_CTOR[0], URL_CTOR[1]
    key = f'L{cls};->{signature}'
    body = canonical_method(patched, cls, signature)
    original_body = canonical_method(original, cls, signature)
    if key not in expected:
        assert body == original_body, 'URL constructor must stay original'
    else:
        replaced = [line for line in body if 'const-string' in line and 'graphql' in line]
        assert _unquote(replaced[0]) == WEBSITE_URL, 'Patched production GraphQL URL'
        assert body == [line.replace(GATEWAY_URL, WEBSITE_URL) if GATEWAY_URL in line else line
                        for line in original_body], \
            'URL constructor changed outside the production constant'

    car_hooks = [
        (FOR_YOU_MAPPER, _for_you_model(original)),
        (ROOT_BROWSE, _root_model(original)),
        (CALLER_GATE, _gate_model(original)),
    ]
    for (cls, signature, _, _), model in car_hooks:
        key = f'L{cls};->{signature}'
        body = canonical_method(patched, cls, signature)
        if key not in expected:
            assert body == canonical_method(original, cls, signature), f'{cls}.{signature} must stay original'
            continue
        assert _plain(body) == model, f'{cls}.{signature} Android Auto hook changed'


def _for_you_model(original: Path) -> list[str]:
    """Both for-you filter sites each gain the CarBrowse filter call after their move-result."""
    body = _plain(canonical_method(original, *FOR_YOU_MAPPER[:2]))
    sites = [i for i, line in enumerate(body) if FILTER_CALL in line]
    assert len(sites) == 2, f'Expected two for-you filter sites, found {len(sites)}'
    block = [f'invoke-static {{v1}}, {TREE_FILTER}', 'move-result-object v1']
    for index in sorted(sites, reverse=True):
        assert body[index + 1].startswith('move-result-object '), 'Filter site result contract changed'
        body = _splice(body, index + 2, block)
    return body


def _root_model(original: Path) -> list[str]:
    """The tab list passes through the CarBrowse root filter just before the library result."""
    body = _plain(canonical_method(original, *ROOT_BROWSE[:2]))
    index = next(i for i, line in enumerate(body) if LIBRARY_RESULT in line)
    return _splice(body, index, [f'invoke-static {{p0, p1}}, {ROOT_TABS}', 'move-result-object p1'])


def _gate_model(original: Path) -> list[str]:
    """The allow-all CarBrowse lookup returns before any certificate check; the
    cast restores the declared tree type for the verifier and the app's
    original validation stays in place as unreachable code."""
    prefix = [f'invoke-static {{p0, p2}}, {TREE_FOR}', 'move-result-object v0',
              'check-cast v0, Lhs/b;', 'return-object v0']
    return prefix + _plain(canonical_method(original, *CALLER_GATE[:2]))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('original', type=Path, help='decoded original base.apk tree')
    parser.add_argument('--patched', type=Path, help='decoded patched base.apk tree')
    parser.add_argument('-e', '--enable', action='append', default=[],
                        help='applied patch name; repeatable. All patches when omitted')
    parser.add_argument('--apk', type=Path, help='original base.apk for the recorded digest')
    arguments = parser.parse_args()
    if arguments.apk is not None:
        digest = hashlib.sha256(arguments.apk.read_bytes()).hexdigest()
        assert digest == BASE_SHA256, f'Unexpected base.apk: {digest}'
    original_contract(arguments.original)
    if arguments.patched is not None:
        selected = set(arguments.enable) or set(PATCH_METHODS)
        assert selected <= set(PATCH_METHODS), selected - set(PATCH_METHODS)
        patched_contract(arguments.original, arguments.patched, selected)
        print('PASS: Podimo contracts verified including patched output')
    else:
        print('PASS: Podimo contracts verified')


if __name__ == '__main__':
    main()
