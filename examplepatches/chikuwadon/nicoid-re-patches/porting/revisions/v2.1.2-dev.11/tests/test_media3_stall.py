"""Verify that playback observation adds no timer or buffering-time prepare."""
from pathlib import Path
import sys
from tempfile import TemporaryDirectory
from io import BytesIO
import tarfile

HERE = Path(__file__).resolve().parents[1]
sys.path[:0] = [str(HERE), str(HERE.parent / 'v2.1.0-release')]
from overlay import protect_retained_return_and_seek, trace_playback_state
from verify_dev28 import verified_archive

with TemporaryDirectory() as directory:
    folder = Path(directory) / 'e/e/a'
    folder.mkdir(parents=True)
    with tarfile.open(fileobj=BytesIO(verified_archive()), mode='r:gz') as inputs:
        for name in ('Media3VideoPlayer.smali', 'PopupReturn244.smali'):
            (folder / name).write_bytes(inputs.extractfile('helpers-smali/e/e/a/' + name).read())
    protect_retained_return_and_seek(Path(directory))
    trace_playback_state(Path(directory))
    source = (folder / 'Media3VideoPlayer.smali').read_text()
    start = source.split('.method public start()V', 1)[1].split('.end method', 1)[0]
    assert start.index('ExoPlayer;->getPlaybackState()I') < start.index('if-ne v0, v1, :nicoid_manual_resume_ready_213')
    assert start.index('removeCallbacks(Ljava/lang/Runnable;)V') < start.index('->retryNetworkPlayback()V')
    assert start.index('->retryNetworkPlayback()V') < start.index('ExoPlayer;->play()V')
    for hook in ('onStart', 'onPause', 'onEvents', 'onError', 'onHandoffPause', 'onPlayIntentChange'):
        assert 'Media3Diagnostics276;->' + hook in source
    assert 'Media3Stall275' not in source
    diagnostics = (HERE / 'Media3Diagnostics276.java').read_text()
    assert 'Class.forName(PLAYER_API' in diagnostics and 'api.getMethod(name).invoke(player)' in diagnostics
    assert 'postDelayed' not in diagnostics and '"prepare"' not in diagnostics
print('PASS: real player state diagnostics, idle-only prepare, and single network recovery path')
