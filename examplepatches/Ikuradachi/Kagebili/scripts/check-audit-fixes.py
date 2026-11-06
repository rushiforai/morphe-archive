"""Check emitted audit fixes: <emitted-smali-root> <original-smali-root> [all|chronos|discover]."""
from pathlib import Path
import re
import sys

from home_smali import method

emitted, original = map(Path, sys.argv[1:3])
mode = sys.argv[3] if len(sys.argv) > 3 else 'all'
assert mode in ('all', 'chronos', 'discover')


def original_file(relative):
    candidates = list(original.glob('*/' + relative))
    if (original / relative).is_file():
        candidates.append(original / relative)
    assert len(candidates) == 1, (relative, candidates)
    return candidates[0]


def current_file(relative):
    path = emitted / relative
    return path if path.is_file() else original_file(relative)


def instructions(text):
    result, annotation = [], False
    for line in text.splitlines():
        line = line.strip()
        if line.startswith('.annotation'):
            annotation = True
        elif line == '.end annotation':
            annotation = False
        elif not annotation and line and not line.startswith(('.', '#')):
            result.append(line)
    return result


def normalized(lines):
    labels, index = {}, 0
    for line in lines:
        if line.startswith(':'):
            labels[line] = index
        else:
            index += 1
    return [re.sub(r'(?<!\S):\w+', lambda m: f'@{labels[m[0]]}', line)
            for line in lines if not line.startswith(':')]


if mode in ('all', 'chronos'):
    relative = 'cj/h.smali'
    before = method(original_file(relative).read_text(), 'e')
    after = method(current_file(relative).read_text(), 'e')
    assert normalized(instructions(after)) == normalized(instructions(before)), 'Generic Chronos dispatcher changed'
    assert instructions(after)[0].startswith('const-string '), 'Dispatcher returns before transport/callback routing'
    print('PASS: generic Chronos transport and callback routing preserved')

if mode in ('all', 'discover'):
    relative = 'com/bilibili/bangumi/ui/page/discover/HomeDiscoverFragment.smali'
    text = current_file(relative).read_text()
    before = method(original_file(relative).read_text(), 'p7')
    after = instructions(method(text, 'p7'))
    assert after[:2] == [
        'invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;',
        'move-result-object p1',
    ], 'Discover suppression bypasses native empty-state renderer'
    assert normalized(after[2:]) == normalized(instructions(before)), 'Discover native renderer changed'
    setup = instructions(method(text, 'onViewCreated'))
    returns = [i for i, line in enumerate(setup) if line == 'return-void']
    assert len(returns) == 1 and '->morpheHideDiscoverTrending(' in setup[returns[0] - 1], 'Discover init guard missing'
    helper = instructions(method(text, 'morpheHideDiscoverTrending'))
    calls = [line for line in helper if line.startswith('invoke-')]
    assert any('->p7(Ljava/util/List;)V' in line for line in calls), 'Initialization does not render native empty state'
    assert any('->setOnClickListener(Landroid/view/View$OnClickListener;)V' in line for line in calls)
    assert any('->setEnabled(Z)V' in line for line in calls)
    assert any('->setVisibility(I)V' in line for line in calls)
    # Execute the small injected init helper against native binding/list/control mocks.
    for missing in ('none', 'binding', 'refresh'):
        refresh = {'listener': 'native', 'enabled': True, 'visibility': 0}
        binding = {'refresh': None if missing == 'refresh' else refresh}
        fragment = {'binding': None if missing == 'binding' else binding, 'rendered': False}
        regs, result, pc = {'p0': fragment}, None, 0
        labels = {line: i for i, line in enumerate(helper) if line.startswith(':')}
        for _ in range(60):
            line = helper[pc]; pc += 1
            if line.startswith(':'): continue
            if line == 'return-void': break
            if line.startswith('iget-object '):
                dst, src, field = line[len('iget-object '):].split(', ')
                regs[dst] = regs[src]['binding' if src == 'p0' else 'refresh']
            elif line.startswith('if-eqz '):
                reg, label = line[len('if-eqz '):].split(', ')
                if regs[reg] is None or regs[reg] == 0: pc = labels[label]
            elif line.startswith('invoke-static {}'):
                assert 'Collections;->emptyList()' in line; result = []
            elif line.startswith('move-result-object '): regs[line.split()[1]] = result
            elif line.startswith('const'):
                reg, value = line.split(' ', 1)[1].split(', '); regs[reg] = int(value, 0)
            elif line.startswith('invoke-virtual '):
                match = re.fullmatch(r'invoke-virtual \{([^}]+)\}, .*;->([^ (]+)\(.*', line)
                args = [regs[reg] for reg in match[1].split(', ')]
                if match[2] == 'p7':
                    assert args[1] == []; fragment['rendered'] = True
                else:
                    key = {'setOnClickListener': 'listener', 'setEnabled': 'enabled', 'setVisibility': 'visibility'}[match[2]]
                    args[0][key] = args[1]
            else: raise AssertionError(line)
        else: raise AssertionError('Discover helper did not terminate')
        assert fragment['rendered'] == (missing != 'binding')
        if missing == 'none': assert refresh == {'listener': 0, 'enabled': 0, 'visibility': 8}
    print('PASS: native Discover empty-state rendering, init suppression and absent bindings')
