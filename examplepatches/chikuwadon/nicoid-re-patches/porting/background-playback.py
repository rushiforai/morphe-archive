#!/usr/bin/env python3
"""Fix service reuse and implicit background routing on the verified nicoid 6.49 APK."""
import pathlib
import re
import sys


def apply(decoded):
    smali = pathlib.Path(decoded) / 'smali'
    routes = [
        'com/sauzask/nicoid/NicoidVideoListFragment$e.smali',
        'com/sauzask/nicoid/NicoidCacheManagerActivity$b.smali',
        'com/sauzask/nicoid/NicoidNicorepoActivity$a.smali',
    ]
    for name in routes:
        path = smali / name
        source = path.read_text()
        pattern = r'sget-boolean ([pv]\d+), Lcom/sauzask/nicoid/NicoidPopupViewService;->o0:Z'
        source, count = re.subn(pattern, lambda m:
            'invoke-static {}, Le/e/a/PlaybackRouting;->isPopupActive()Z\n\n'
            '    move-result ' + m[1], source)
        assert count == 1, (name, count)
        path.write_text(source)

    path = smali / 'com/sauzask/nicoid/NicoidPopupViewService.smali'
    source = path.read_text()
    marker = '.method public final a(Z)V'
    start = source.index(marker)
    insertion = source.index('\n', source.index('    .registers ', start)) + 1
    # a(false) also tears down a video when reusing the same Service instance.
    # Cancel the old media session, playback timers and popup callbacks before
    # releasing its VideoView. onDestroy alone does not cover this transition.
    source = source[:insertion] + '\n    invoke-static {p0}, Le/e/a/ModernEnhancements;->destroy(Ljava/lang/Object;)V\n' + source[insertion:]
    path.write_text(source)


if __name__ == '__main__':
    apply(sys.argv[1])
