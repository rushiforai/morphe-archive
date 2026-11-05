#!/usr/bin/env python3
"""Inspect pinned Rumble 3.22.0 emitted fatal-panel/reload seams.

Usage: python3 tests/rumble/verify_refresh.py <patched-apktool-directory>
Companion to RefreshProbe: this checks the fatal branch reaches the mobile panel
and that the generated reload replays the current source through the quality
switch. ART executes the panel prefix, click, bridge and P4; neither test
demonstrates live failed-stream recovery.
"""
from pathlib import Path
import re
import sys


def read(root, suffix):
    paths = list(root.glob('smali*/' + suffix))
    assert len(paths) == 1, f'Expected one pinned class: {suffix}'
    return paths[0].read_text()


def verify(root):
    ui = read(root, 'Yg/Q.smali')
    gate = re.search(r'instance-of (\w+), \w+, LWg/k\$a;\s+if-eqz \1, (:\w+)', ui)
    assert gate, 'Missing fatal-state guard'
    target = re.search(r'^\s*' + re.escape(gate[2]) + r'\s*$', ui[gate.end():], re.M)
    assert target, 'Missing fatal branch end'
    fatal = ui[gate.end():gate.end() + target.start()]
    assert 'LZg/M;->b(Ls1/o;LUg/s;LYg/S;' in fatal, 'Fatal branch no longer reaches mobile error panel'
    assert 'LZg/J0;->b(' in fatal, 'Pinned alternate TV branch changed'
    player = read(root, 'com/rumble/videoplayer/player/a.smali')
    reload = re.search(r'\.method public static lurkReload\(Ljava/lang/Object;\)V(.*?)\.end method', player, re.S)
    assert reload, 'Missing generated reload'
    body = reload[1]
    assert re.search(r'iget-object v0, p0, Lcom/rumble/videoplayer/player/a;->\w+:LWg/m;\s+if-eqz v0, (:\w+)\s+'
                     r'invoke-virtual \{p0, v0\}, Lcom/rumble/videoplayer/player/a;->P4\(LWg/m;\)V', body), \
        'Reload must replay the current source through the quality switch'
    assert '.catch' not in body, 'The quality switch saves nothing since 3.22.0: the reload needs no handler'
    print('PASS: emitted fatal mobile-panel branch and reload through the quality switch')


if __name__ == '__main__':
    assert len(sys.argv) == 2, __doc__
    verify(Path(sys.argv[1]))
