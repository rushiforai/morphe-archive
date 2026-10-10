#!/bin/sh
# Extract the 348.10 bundle into work/348 and build the HBC index (developer-only, never committed).
set -e
cd "$(dirname "$0")/../.."
APKM="${1:-$(ls /home/user/uploaded_files/*.apkm | head -1)}"
mkdir -p work/348
[ -f work/348/assets/index.android.bundle ] || {
  unzip -o -q "$APKM" base.apk -d work/348
  unzip -o -q work/348/base.apk assets/index.android.bundle -d work/348
}
sha256sum work/348/assets/index.android.bundle
python3 -c "import sys; sys.path.insert(0,'scripts/hbc'); from hbc import Bundle; B=Bundle('work/348/assets/index.android.bundle'); print(len(B.modules),'modules indexed')"
