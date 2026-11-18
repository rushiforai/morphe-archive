#!/usr/bin/env python3
"""Check the emitted Kick Sleep timer hooks after apktool decode.

Usage: python3 -I tests/kick/verify_sleep_timer.py <apktool-dir>
Requires a Kick APK patched with Sleep timer. APK-free tests (tests/shared/test_sleep_timer.py) exercise the timer.

Kick's player (kick-player-v3, on Media3) reports every start, resume and pause to its Media3 listener as
playWhenReady. The patch adds onPlayWhenReadyChanged(boolean, int) to that listener, handing the listener's player and
the value to KickPlayer, calls KickPlayer.onStop first thing in the player's close(), and fills KickPlayer's pause
bridge with Kick's own pause: the player's ExoPlayer's pause().
"""
from pathlib import Path
import re
import sys

PLAYER = 'Lcom/kick/mobile/playerv3/player/VideoPlayer;'
KICK_PLAYER = 'Lio/github/jordanwoodson/extension/shared/kick/KickPlayer;'


def method(text, signature):
    found = [m for m in re.findall(r'\.method[^\n]*\n.*?\.end method', text, re.S) if m.split('\n', 1)[0].endswith(signature)]
    assert len(found) == 1, f'expected one method {signature}, found {len(found)}'
    return found[0]


def code(body):
    """The method's instructions, without directives, labels and blank lines."""
    return [line.strip() for line in body.split('\n')[1:-1]
            if line.strip() and not line.strip().startswith(('.', ':', '#'))]


def one(root, relative):
    files = list(Path(root).glob('smali*/' + relative))
    assert len(files) == 1, f'expected exactly one {relative}, found {len(files)}'
    return files[0].read_text()


def main():
    if len(sys.argv) != 2:
        sys.exit(__doc__)
    root = sys.argv[1]
    player = one(root, 'com/kick/mobile/playerv3/player/VideoPlayer.smali')
    listener_type = re.search(r'\.field private final playerListener:(L[^;]+;)', player)
    assert listener_type, 'the player has no playerListener field'
    listener = one(root, listener_type.group(1)[1:-1] + '.smali')
    added = code(method(listener, 'onPlayWhenReadyChanged(ZI)V'))
    outer = re.escape(listener_type.group(1)) + r'->[\w$]+:' + re.escape(PLAYER)
    assert len(added) == 3 and re.fullmatch(r'iget-object v0, p0, ' + outer, added[0]), added
    assert added[1] == f'invoke-static {{v0, p1}}, {KICK_PLAYER}->onPlayWhenReady(Ljava/lang/Object;Z)V', added
    assert added[2] == 'return-void', added

    close = code(method(player, 'close()V'))
    stops = [line for line in close if line.endswith(f'{KICK_PLAYER}->onStop(Ljava/lang/Object;)V')]
    assert len(stops) == 1 and close.index(stops[0]) <= 2 and re.match(r'invoke-static \{(p0|v\d+)\}', stops[0]), close

    bridge = code(method(one(root, 'io/github/jordanwoodson/extension/shared/kick/KickPlayer.smali'),
                         'pausePlayer(Ljava/lang/Object;)Z'))
    assert f'check-cast p0, {PLAYER}' in bridge, bridge
    assert any(line.endswith(f'{PLAYER}->getPlayer()Landroidx/media3/exoplayer/ExoPlayer;') for line in bridge), bridge
    assert any(line.endswith('Landroidx/media3/exoplayer/ExoPlayer;->pause()V') for line in bridge), bridge
    print('PASS Kick sleep timer: playWhenReady and close reach KickPlayer, and its pause is Kick\'s own')


if __name__ == '__main__':
    main()
