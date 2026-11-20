#!/usr/bin/env python3
"""Source contract for pause-preserving popup return and failed-seek recovery."""
import sys,io,tarfile
from pathlib import Path
from tempfile import TemporaryDirectory
HERE=Path(__file__).resolve().parents[1]
ROOT=HERE.parents[2]
sys.path.insert(0,str(HERE))
sys.path.insert(0,str(ROOT/'porting/revisions/v2.1.0-release'))
from verify_dev28 import verified_archive
from overlay import protect_retained_return_and_seek

def method(text,signature):
    i=text.index(signature);j=text.index('.end method',i)
    return text[i:j]

with TemporaryDirectory() as d:
    base=Path(d);folder=base/'e/e/a';folder.mkdir(parents=True)
    with tarfile.open(fileobj=io.BytesIO(verified_archive()),mode='r:gz') as tf:
        for name in ('Media3VideoPlayer.smali','PopupReturn244.smali'):
            (folder/name).write_bytes(tf.extractfile('helpers-smali/e/e/a/'+name).read())
    original={p.name:p.read_text() for p in folder.iterdir()}
    protect_retained_return_and_seek(base)
    popup=(folder/'PopupReturn244.smali').read_text()
    media=(folder/'Media3VideoPlayer.smali').read_text()
    done=method(popup,'.method static synthetic lambda$1(Le/e/a/PopupReturn244$Pending;Ljava/lang/Object;)V')
    assert done.index('MiniCompletion;->restoreReturned(')<done.index('Pending;->playing:Z')<done.index('PlaybackTransfer221;->portrait(')
    assert 'MediaSessionHandoff;->playback' in done
    assert 'Media3VideoPlayer;->pauseForHandoff()V' in done
    assert 'nicoid_return_legacy_pause_213' in done
    assert 'Media3VideoPlayer;->play()V' not in done
    assert media.count('.method public pauseForHandoff()V')==1
    paused=method(media,'.method public pauseForHandoff()V')
    assert '->released:Z' in paused and 'ExoPlayer;->pause()V' in paused
    seek=method(media,'.method public seekTo(J)V')
    assert seek.index('Media3VideoPlayer;->endScrubbing()V')<seek.index('ExoPlayer;->seekTo(J)V')
    assert 'Media3VideoPlayer;->endScrubbing()V' not in method(original['Media3VideoPlayer.smali'],'.method public seekTo(J)V')
    fail=method(media,'.method public onPlayerError(Landroidx/media3/common/PlaybackException;)V')
    assert fail.index('->networkAttempts:I')<fail.index('const/4 p1, 0x1')
    assert 'const/4 v1, 0x6' in fail and 'if-ge v0, v1, :cond_57' in fail
    play=method(media,'.method public start()V')
    assert play.index('ExoPlayer;->prepare()V')<play.index('ExoPlayer;->play()V')
    assert original['PopupReturn244.smali']!=popup
print('PASS: paused return persists, failed seek is recoverable and network retries terminate')
