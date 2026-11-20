"""Check the popup-only default, reset, and shared settings routes in the patched APK."""
from pathlib import Path
import re
import sys

root = Path(sys.argv[1])


def method(owner, name):
    paths = list(root.glob(f'*/e/e/a/{owner}.smali'))
    assert len(paths) == 1, owner
    source = paths[0].read_text()
    match = re.search(rf'^\.method (?:[^\n]* )?{re.escape(name)}\([^\n]*\n(.*?)^\.end method',
                      source, re.M | re.S)
    assert match, (owner, name)
    return match[1]


def execute_set_method(body, argument):
    registers = {'p0': argument}
    body = re.sub(r"(?ms)^ +\.annotation .*?^ +\.end annotation", "", body)
    result = None
    for line in body.splitlines():
        line = line.strip()
        if not line or line.startswith(('.', '"', ')')):
            continue
        if line.startswith('const-string'):
            dst, literal = line.split(' ', 1)[1].split(', ', 1)
            registers[dst] = literal.strip('"')
        elif line.startswith('new-instance'):
            registers[line.split()[1].rstrip(',')] = set()
        elif line.startswith('invoke-'):
            args = [registers[reg] for reg in
                    re.search(r'\{([^}]*)\}', line)[1].split(', ') if reg]
            if '->emptySet(' in line:
                result = frozenset()
            elif '->getStringSet(' in line:
                result = args[0].get(args[1], args[2])
            elif 'HashSet;-><init>(' in line:
                args[0].update(args[1])
            elif 'Set;->remove(' in line:
                args[0].discard(args[1])
            elif 'AmbientLight;->resetHidden(' in line:
                args[0].discard('ambient')
            else:
                raise AssertionError(line)
        elif line.startswith('move-result-object'):
            registers[line.split()[-1]] = result
        elif line.startswith('return-object'):
            return registers[line.split()[-1]]
        elif line == 'return-void':
            return None
        else:
            raise AssertionError(line)


key = 'player_buttons_hidden_v1'
button = 'popup_portrait'
hidden = method('PopupControl222', 'hidden')
for values in ({}, {key: set()}, {key: {'mute'}}, {key: {'mute', button}}):
    expected = values.get(key, set())
    result = execute_set_method(hidden, values)
    assert result == expected and result is not expected
    assert (button not in result) == (button not in expected)
custom = {'mute', button, 'ambient'}
execute_set_method(method('PopupControl222', 'reset'), custom)
assert custom == {'mute'}
assert button in method('PopupControl222', 'bind')
assert '->restore(Ljava/lang/Object;Z)Z' in method('PopupControl222$1', 'onClick')
assert '->hidden(Landroid/content/SharedPreferences;)' in method('PopupControls193', 'update')
normal = method('PlayerButtons193', 'button')
assert button not in normal
assert '->hidden(Landroid/content/SharedPreferences;)' in method('PlayerButtons193', 'show')
assert '->setChecked(Z)V' in method('PlayerButtons193', 'lambda$0')
assert key in method('PlayerButtons193', 'save')
on_change = method('PopupControls193', 'onSharedPreferenceChanged')
assert on_change.index('->removeCallbacks(') < on_change.index('->post(')
assert '->removeCallbacks(' in method('PopupControls193', 'onViewDetachedFromWindow')
print('PASS: patched popup settings default ON, explicit choice, reset, popup-only binding and callback cleanup')
