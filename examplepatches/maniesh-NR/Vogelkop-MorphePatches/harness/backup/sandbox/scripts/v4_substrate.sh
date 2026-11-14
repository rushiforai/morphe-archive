#!/bin/bash
# Provision v4 toolchain + build the APKEditor-merged stock substrate (B0 recipe).
set -euo pipefail
V4=/tmp/v4
mkdir -p $V4/tools $V4/merge_in

# ---- 1. tools ----
if [ ! -f $V4/tools/APKEditor-1.4.9.jar ]; then
  curl -sL --max-time 300 -o $V4/tools/APKEditor-1.4.9.jar \
    "https://github.com/REAndroid/APKEditor/releases/download/V1.4.9/APKEditor-1.4.9.jar"
fi
if [ ! -f $V4/tools/apktool_3.0.3.jar ]; then
  curl -sL --max-time 300 -o $V4/tools/apktool_3.0.3.jar \
    "https://github.com/iBotPeaches/Apktool/releases/download/v3.0.3/apktool_3.0.3.jar"
fi
if [ ! -f $V4/tools/morphe.keystore ]; then
  curl -sL --max-time 120 -o $V4/tools/morphe.keystore \
    "https://github.com/maniesh-NR/Vogelkop-MorphePatches/releases/download/sandbox-storage/morphe.keystore"
fi
ls -la $V4/tools/
echo "apktool sha256: $(sha256sum $V4/tools/apktool_3.0.3.jar | cut -c1-16)... (recycled original was 15478013 bytes)"

# ---- 2. extract stock base + 27 non-pangle splits ----
python3 - << 'EOF'
import zipfile
z = zipfile.ZipFile('/home/z/my-project/upload/com.opera.browser.beta_104.0.5262.91143-1910404306_2dpi_25lang_19feat_c2b59ea30fab5744c9b5462fed6dd891_apkmirror.com.apkm')
keep = [n for n in z.namelist() if n == 'base.apk' or n.startswith('split_config.')]
assert len(keep) == 28, keep
for n in keep:
    open('/tmp/v4/merge_in/'+n,'wb').write(z.read(n))
print(f"merge_in: {len(keep)} apks (pangle excluded)")
EOF

# ---- 3. APKEditor merge (B0b method) ----
if [ ! -f $V4/substrate.apk ]; then
  java -Xmx3g -jar $V4/tools/APKEditor-1.4.9.jar m -i $V4/merge_in -o $V4/substrate.apk 2>&1 | tail -5
fi
ls -la $V4/substrate.apk

# ---- 4. substrate sanity ----
BT=/tmp/bt/bt36/android-16
$BT/aapt2 dump badging $V4/substrate.apk > $V4/substrate-badging.txt 2>&1 || { echo BADGING-FAIL; tail -5 $V4/substrate-badging.txt; exit 1; }
head -2 $V4/substrate-badging.txt
python3 - << 'EOF'
import zipfile
z = zipfile.ZipFile('/tmp/v4/substrate.apk')
names = z.namelist()
sos = [n for n in names if n.startswith('lib/') and n.endswith('.so')]
arsc_stored = z.getinfo('resources.arsc').compress_type == 0
so_deflated = [n for n in sos if z.getinfo(n).compress_type != 0]
print(f"entries={len(names)} dex={sum(1 for n in names if n.startswith('classes') and n.endswith('.dex'))} "
      f"so={len(sos)} so_deflated={len(so_deflated)} arsc_stored={arsc_stored}")
meta = [n for n in names if n.startswith('META-INF/') and (n.endswith('.SF') or n.endswith('.RSA') or n.endswith('.DSA'))]
print("stale v1 sig files:", meta if meta else "none")
EOF
echo SUBSTRATE-OK
