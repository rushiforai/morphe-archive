"""Verify the menu-only PRO artwork override without changing account data."""
import argparse
from pathlib import Path
import re

from flitsmeister15_features_contracts import ORIGINAL_METHOD_HASHES
from verify_flitsmeister import canonical, digest, invoke_args, method, run_fragment

HEADER = 'Lwwb;->b(ZLjava/lang/String;Landroid/graphics/Bitmap;Landroidx/compose/ui/graphics/painter/Painter;Ls39;Ljava/lang/String;Ls39;Ljava/lang/String;ZLandroidx/compose/runtime/Composer;I)V'
FACTORY = 'Lxy0;->a(Lfoi;Landroidx/compose/runtime/Composer;)Lyy0;'
PRO = 'Lfoi$b;->a:Lfoi$b;'


def verify(root: Path, unlock: bool, notices: bool):
    body = method(root, HEADER)
    raw = body.splitlines()
    instruction_rows = [i for i, line in enumerate(raw)
                        if line.strip() and not line.strip().startswith(('.', ':', '#'))]
    factory_row = next(i for i in instruction_rows if FACTORY in raw[i])
    factory_position = instruction_rows.index(factory_row)
    removed = set()
    if unlock:
        row = instruction_rows[factory_position - 1]
        assert raw[row].strip() == 'sget-object v9, ' + PRO, 'Native PRO badge must be forced only at menu rendering'
        removed.add(row)
        factory_position -= 1
    if notices:
        rows = instruction_rows[factory_position - 4:factory_position]
        expected = ['const/4 v13, 0x0', None, 'const/4 v13, 0x0', None] if unlock else [
            'instance-of v13, v9, Lfoi$b;', None,
            'instance-of v13, v9, Lfoi$c;', None,
        ]
        for row, wanted in zip(rows, expected):
            actual = raw[row].strip()
            if wanted is None:
                assert re.fullmatch(r'if-nez v13, :\w+', actual), 'Retain menu notice branch destinations'
            else:
                assert actual == wanted, 'Only the menu profile predicates may change'
        removed.update(rows)
    normalized = '\n'.join(line for i, line in enumerate(raw) if i not in removed)
    assert digest(normalized) == ORIGINAL_METHOD_HASHES[HEADER], 'Preserve complete avatar/name/profile/navigation rendering'

    ins = canonical(body)
    badge = next(i for i, line in enumerate(ins) if FACTORY in line)
    args = invoke_args(ins[badge])
    join = next(i for i in range(badge, len(ins)) if 'Composer;->endNode()V' in ins[i])
    start = badge - int(unlock) - 4 * int(notices)
    for variant in ('a', 'b', 'c', 'd'):
        calls = []
        def boundary(ref, values):
            calls.append((ref, values))
            if ref == FACTORY:
                return {'badge': values[0]}
            assert ref.startswith('Lwwb;->a('), ref
        registers = {'v' + str(i): 'original-' + str(i) for i in range(80)}
        registers[args[0]] = 'Lfoi$' + variant + ';'
        registers[args[1]] = 'composer'
        run_fragment(ins, start, registers, boundary,
                     stop=lambda pc, line, regs, seen: pc == join,
                     fields=lambda ref: 'Lfoi$b;' if ref == PRO else 0 if ref == 'Lyy0;->j:I' else ref)
        rendered = [values[0] for ref, values in calls if ref == FACTORY]
        hidden = notices and not unlock and variant in ('b', 'c')
        assert rendered == ([] if hidden else ['Lfoi$b;' if unlock else 'Lfoi$' + variant + ';'])
    return {'profile_badge_cases': 4, 'cosmetic_pro': unlock}


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('decoded', type=Path)
    parser.add_argument('--unlock', action='store_true')
    parser.add_argument('--notices', action='store_true')
    args = parser.parse_args()
    print(verify(args.decoded, args.unlock, args.notices))
