#!/usr/bin/env python3
"""Regression for paused automatic mode transfer and interrupted seek previews.

This is a bytecode-source contract test, not an Android-device playback test.
"""
from pathlib import Path
from tempfile import TemporaryDirectory
import io
import sys
import tarfile

HERE = Path(__file__).resolve().parents[1]
ROOT = HERE.parents[2]
sys.path.insert(0, str(HERE))
sys.path.insert(0, str(ROOT / 'porting/revisions/v2.1.0-release'))
from overlay import protect_playback_intent

FILES=('PlaybackTransfer221.smali','MiniSession225.smali','Media3VideoPlayer.smali')

with TemporaryDirectory(prefix='nicoid-paused-handoff-regression-') as tmpname:
    tmp=Path(tmpname)
    dest=tmp/'e/e/a'
    dest.mkdir(parents=True)
    if len(sys.argv) > 1:
        source = Path(sys.argv[1])
        for filename in FILES:
            (dest/filename).write_bytes((source/filename).read_bytes())
    else:
        from verify_dev28 import verified_archive
        with tarfile.open(fileobj=io.BytesIO(verified_archive()),mode='r:gz') as archive:
            for filename in FILES:
                member=archive.extractfile('helpers-smali/e/e/a/'+filename)
                assert member is not None
                (dest/filename).write_bytes(member.read())

    original={name:(dest/name).read_text() for name in FILES}
    protect_playback_intent(tmp)
    updated={name:(dest/name).read_text() for name in FILES}
    transfer=updated['PlaybackTransfer221.smali']
    mini=updated['MiniSession225.smali']
    media=updated['Media3VideoPlayer.smali']

    def method(body, signature):
        start=body.index(signature)
        end=body.index('.end method',start)
        return body[start:end]

    policy=method(transfer,'.method public static policy(Ljava/lang/Object;Z)I')
    assert 'PlaybackTransfer221;->isPlaying(Ljava/lang/Object;)Z' in policy
    assert policy.index(':cond_2b') < policy.index(':nicoid_autotransfer_playing_212') < policy.index('app_switch_playback')
    assert 'if-nez v2, :nicoid_autotransfer_playing_212\n    return v0' in policy
    assert policy.count('    :nicoid_autotransfer_playing_212')==1

    back=method(mini,'.method public static back(Ljava/lang/Object;Z)Z')
    assert 'if-nez p1, :nicoid_backmini_playing_212\n    return v0' in back
    assert back.index(':nicoid_backmini_playing_212') < back.index('MiniSession225;->minimize(')
    assert back.count('    :nicoid_backmini_playing_212')==1

    # Only an *explicit transport action* may recover from abandoned scrub mode;
    # seekTo itself must retain preview behavior while the thumb is being dragged.
    for name in ('start','pause'):
        transport=method(media,'.method public '+name+'()V')
        assert transport.count('Media3VideoPlayer;->endScrubbing()V')==1
    seek=method(media,'.method public seekTo(J)V')
    assert seek == method(original['Media3VideoPlayer.smali'],'.method public seekTo(J)V')
    assert 'Media3VideoPlayer;->endScrubbing()V' not in seek
    assert media.count('.method endScrubbing()V')==1
    for name in FILES:
        assert len(updated[name])>len(original[name])
    print('PASS: paused automatic handoff cannot promote to playback; manual seek remains unchanged')
