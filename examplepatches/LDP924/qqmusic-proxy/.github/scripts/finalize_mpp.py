#!/usr/bin/env python3
"""合并 D8 产出的 classes.dex 进 patches mpp + 修正 manifest 版本号。

Morphe Manager 在 Android 端只认 .mpp 里的 dex（loadPatchesFromDex），
gradle 插件的 ZFile 合并在部分环境不生效，这里手动完成最终封装。
输出固定名 patches.mpp 供 release 上传。
"""
import zipfile, shutil, os, glob, sys

VER = os.environ.get('PATCH_VERSION', '1.0.0')
DEXZIP = 'patches/build/morphe/classes.zip'

# glob 找主 mpp（跳过 javadoc/sources）
cands = [f for f in glob.glob('patches/build/libs/patches*.mpp')
         if 'javadoc' not in f and 'sources' not in f]
if not cands:
    print('ERROR: no main mpp in patches/build/libs/', file=sys.stderr)
    sys.exit(1)
src = sorted(cands, key=os.path.getmtime)[-1]
MPP = 'patches/build/libs/patches.mpp'

tmp = MPP + '.tmp'
with zipfile.ZipFile(src) as zin:
    with zipfile.ZipFile(tmp, 'w', zipfile.ZIP_DEFLATED) as zout:
        for item in zin.namelist():
            if item == 'classes.dex' or item == 'META-INF/MANIFEST.MF':
                continue
            zout.writestr(item, zin.read(item))
        with zipfile.ZipFile(DEXZIP) as zsrc:
            zout.writestr('classes.dex', zsrc.read('classes.dex'))
        mf = zin.read('META-INF/MANIFEST.MF').decode()
        if 'Version: unspecified' in mf:
            mf = mf.replace('Version: unspecified', f'Version: {VER}')
        zout.writestr('META-INF/MANIFEST.MF', mf)
shutil.move(tmp, MPP)

with zipfile.ZipFile(MPP) as z:
    assert 'classes.dex' in z.namelist(), 'dex missing!'
    mf = z.read('META-INF/MANIFEST.MF').decode()
    assert 'unspecified' not in mf, 'version unresolved!'
    print('mpp finalized from', src.split('/')[-1], '| version:', VER, '| dex ok')
