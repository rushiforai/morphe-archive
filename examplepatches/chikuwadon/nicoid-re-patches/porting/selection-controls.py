#!/usr/bin/env python3
"""Refresh saved-list selection whenever native selection mode changes."""
import pathlib
import re
import sys

HOOK = '    invoke-static/range {p0 .. p0}, Le/e/a/BulkSelection;->modeChanged(Ljava/lang/Object;)V\n\n'

def apply(root):
    for name, method in [('NicoidVideoListFragment', 'Y'), ('NicoidCacheManagerActivity', 's')]:
        matches = list(root.glob('smali*/com/sauzask/nicoid/' + name + '.smali'))
        if len(matches) != 1:
            raise ValueError('Expected one class: ' + name)
        path = matches[0]
        text = path.read_text()
        pattern = r'(?ms)^\.method public ' + method + r'\(\)V\n.*?^\.end method'
        match = re.search(pattern, text)
        if match is None:
            raise ValueError('Missing selection method: ' + name)
        body = match.group()
        if 'BulkSelection;->modeChanged' in body:
            continue
        patched, count = re.subn(r'(?m)^    return-void$', HOOK + '    return-void', body)
        if count != 1:
            raise ValueError('Unexpected selection return count: ' + name)
        path.write_text(text[:match.start()] + patched + text[match.end():])

if __name__ == '__main__':
    apply(pathlib.Path(sys.argv[1]))
