#!/usr/bin/env bash
# Keep only Kim Launcher's own code in decompiled/ (drops libraries, images and 3D models).
set -euo pipefail
cd "${1:-decompiled}"
keep_dirs="com/kimkim byd K1 L1 M1 N1 Z1"
for side in java smali; do
  mkdir -p "$side.keep/A0" "$side.keep/com"
  for d in $keep_dirs; do mkdir -p "$side.keep/$(dirname $d)" && mv "$side/$d" "$side.keep/$d"; done
  mv "$side/A0/g.${side}" "$side.keep/A0/"
done
mkdir -p java.keep/r2 smali.keep/r2 && mv java/p115r2/a.java java.keep/r2/ && mv smali/r2.1/a.smali smali.keep/r2/
rm -rf java smali && mv java.keep java && mv smali.keep smali
mkdir -p dart.keep && mv dart/asm/byd_launcher dart.keep/byd_launcher && mv dart/pp.txt dart/blutter_frida.js dart.keep/
rm -rf dart && mv dart.keep dart
mkdir -p res.keep/res && mv resources/AndroidManifest.xml res.keep/ && mv resources/res/xml resources/res/values res.keep/res/ \
  && mv resources/assets/flutter_assets/assets/kim_guide res.keep/kim_guide
rm -rf resources && mv res.keep resources
du -sh *
