import sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from scene_lib import Scene, BASES

for code in BASES:
    s = Scene(code)
    print(code, s.sha[:12], 'size', len(s.data))
    for key in ('QSVLRendererXRC2', 'QSVLRendererXRD2', 'QSVLRendererXR4Init', 'SetupSwapchains', 'FlipFrame',
                'GetProjectionLayers', 'GetStreamLayers', 'GetEyeToHeadTransform', 'SetEyeToHeadPoses',
                'QSVLRendererXRC1', 'QSVLRendererXRD1', 'QSVLRendererXRD0'):
        for n, v in s.sym(key):
            if 'QSVLRendererXR' in n or 'QSVLClientXR' in n:
                print('   %-70s %#x size %#x' % (n[:70], v, s.sizes[n]))
