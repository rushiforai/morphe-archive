#!/usr/bin/env python3
"""Patch contracts for post-related menu restoration and the explicit-play watchdog."""
from pathlib import Path
r=Path(__file__).resolve().parents[1]
a=(r/'AmbientCard217.java').read_text()
b=(r/'Media3Stall275.java').read_text()
c=(r/'overlay.py').read_text()
d=(r/'stage_candidate.py').read_text()
assert 'scheduleLateScans()' in a and '900L' in a and 'beforeDraw();' in a
assert 'MAIN.removeCallbacks(pending)' in a and '++scanEpoch' in a
assert 'Panel panel = PANELS.get(layer);' in a
assert 'Media3Stall275;->onPlay(Ljava/lang/Object;)V' in c
assert 'Media3Stall275;->onPause(Ljava/lang/Object;)V' in c
assert "for name in ('setVideoUri', 'release', 'stopForReplacement'):" in c
assert 'candidates=list(re.finditer' in c
assert 'playing(p) || initialMediaItem==null' in b
assert 'currentState==2 && !attempted' in b
assert 'MAIN.postDelayed(this,SECOND_MS);' in b
assert 'prepare.invoke(p)' in b
assert 'Media3Stall275.java' in d and 'Media3Stall275.smali' in d
assert "('e/e/a/Media3VideoPlayer.smali','Media3Stall275;->onPlay')" in d
print('PASS: dev.7 scheduled menu rebuild scan, bounded manual-play recovery, source and output method hooks')
