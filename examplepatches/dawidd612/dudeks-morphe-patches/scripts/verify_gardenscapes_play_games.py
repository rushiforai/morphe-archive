"""Compare original/patched DEX semantics; requires androguard==4.1.4.

Only two GoogleGameCenter methods may gain a prefix. All original game method
bodies must survive, including their authentication result and token handling.
"""
import io
import sys
import zipfile
from loguru import logger
logger.remove()
from androguard.core.dex import DEX

CENTER = 'Lcom/playrix/gplay/GoogleGameCenter;'
HOOK = 'Lpl/dudek/extension/gardenscapes/PlayGamesDiagnostics;'


def methods(archive):
    result = {}
    for name in archive.namelist():
        if '/' in name or not name.startswith('classes') or not name.endswith('.dex'):
            continue
        dex = DEX(archive.read(name))
        for cls in dex.get_classes():
            for method in cls.get_methods():
                key = (cls.get_name(), method.get_name(), method.get_descriptor())
                result[key] = [(i.get_name(), i.get_output()) for i in method.get_instructions()]
    return result


def verify(source, patched):
    with zipfile.ZipFile(io.BytesIO(source.read('com.playrix.gardenscapes.apk'))) as base:
        before = methods(base)
    after = methods(patched)
    callbacks = [key for key, code in before.items()
                 if key[1] == 'onComplete' and any('"signIn complete "' in x[1] for x in code)]
    assert len(callbacks) == 1, 'Ambiguous sign-in callback'
    entry = (CENTER, 'signIn', '(J Z)V')
    allowed = {entry, callbacks[0]}
    changed = set()
    for key, original in before.items():
        assert key in after, ('Removed game method', key)
        modified = after[key]
        if original == modified:
            continue
        assert key in allowed, ('Unexpected game method change', key)
        assert original and modified[-len(original):] == original, ('Original body changed', key)
        prefix = modified[:-len(original)]
        assert prefix[0][0] in ('if-nez', 'iget-boolean'), ('Missing silent-request guard', key)
        assert any(HOOK + '->show' in x[1] for x in prefix), ('Missing status hook', key)
        changed.add(key)
    assert changed == allowed, ('Missing diagnostic hooks', changed)
    added = set(after) - set(before)
    assert added and all(k[0].startswith('Lpl/dudek/extension/gardenscapes/') for k in added), added
    callback_prefix = after[callbacks[0]][:-len(before[callbacks[0]])]
    assert any('->getStatusCode()I' in x[1] for x in callback_prefix)
    assert not any('->getMessage()' in x[1] or '->toString()' in x[1] for x in callback_prefix)
    assert any(k[0] == HOOK and k[1] == 'show' for k in added)
    print('PASS: two guarded Play Games prefixes, original method bodies preserved, only diagnostic extension added')


if __name__ == '__main__':
    with zipfile.ZipFile(sys.argv[1]) as source, zipfile.ZipFile(sys.argv[2]) as patched:
        verify(source, patched)
