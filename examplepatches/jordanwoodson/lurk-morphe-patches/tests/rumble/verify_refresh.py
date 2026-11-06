#!/usr/bin/env python3
"""Inspect pinned Rumble 3.21.0 emitted fatal-panel/reload seams.

Usage: python3 tests/rumble/verify_refresh.py <patched-apktool-directory>
Companion to RefreshProbe: this checks the fatal branch reaches the mobile panel
and generated catch metadata. ART executes the panel prefix, click, bridge and x4;
neither test demonstrates live failed-stream recovery.
"""
from pathlib import Path
import re
import sys


def read(root, suffix):
    paths = list(root.glob('smali*/' + suffix))
    assert len(paths) == 1, f'Expected one pinned class: {suffix}'
    return paths[0].read_text()


def verify(root):
    ui = read(root, 'Rg/P.smali')
    gate = re.search(r'instance-of (\w+), \w+, LPg/j\$a;\s+if-eqz \1, (:\w+)', ui)
    assert gate, 'Missing fatal-state guard'
    target = re.search(r'^\s*' + re.escape(gate[2]) + r'\s*$', ui[gate.end():], re.M)
    assert target, 'Missing fatal branch end'
    fatal = ui[gate.end():gate.end() + target.start()]
    assert 'LSg/E;->b(Lt1/o;LNg/o;LRg/Q;' in fatal, 'Fatal branch no longer reaches mobile error panel'
    assert 'LSg/z0;->b(' in fatal, 'Pinned alternate TV branch changed'
    player = read(root, 'com/rumble/videoplayer/player/a.smali')
    reload = re.search(r'\.method public static lurkReload\(Ljava/lang/Object;\)V(.*?)\.end method', player, re.S)
    assert reload, 'Missing generated reload'
    body = reload[1]
    caught = re.search(r'\.catchall \{(:\w+) \.\. (:\w+)\} (:\w+)', body)
    assert caught, 'Generated reload lacks catchall metadata'
    def label(name):
        match = re.search(r'^\s*' + re.escape(name) + r'\s*$', body, re.M)
        assert match, name
        return match.end()
    protected = body[label(caught[1]):label(caught[2])]
    assert 'invoke-virtual {p0, v0}, Lcom/rumble/videoplayer/player/a;->x4(LPg/l;)V' in protected
    handler = body[label(caught[3]):]
    assert re.search(r'move-exception v2\s+iput-object v1, p0, [^\n]+->f:Lkotlin/jvm/functions/Function2;\s+throw v2', handler), 'Handler must restore exact callback then rethrow'
    assert body.count('iput-object v1, p0, Lcom/rumble/videoplayer/player/a;->f:Lkotlin/jvm/functions/Function2;') == 2
    print('PASS: emitted fatal mobile-panel branch and reload catchall restoration metadata')


if __name__ == '__main__':
    assert len(sys.argv) == 2, __doc__
    verify(Path(sys.argv[1]))
