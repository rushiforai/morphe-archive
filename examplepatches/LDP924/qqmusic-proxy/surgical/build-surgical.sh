#!/bin/bash
# 手术版全链构建：原版 APK → 3 dex 重编 + classes27 新增 → 签名
# 依赖：qqmusic.apk（腾讯原版 20.9.0.8）放本目录；tools.sh 环境已 source
set -e
cd "$(dirname "$0")"
source ./tools.sh
IN=qqmusic.apk
OUT=qqmusic-surgical-final.apk
mkdir -p work && cd work

# 1. 提取原版 3 个手术 dex
python3 - << 'PY'
import zipfile
z = zipfile.ZipFile('../' + 'qqmusic.apk')
for n in ('classes.dex', 'classes6.dex', 'classes21.dex'):
    open(n, 'wb').write(z.read(n))
PY

# 2. baksmali 三个 dex
for d in classes classes6 classes21; do
  rm -rf ${d}_smali
  $JAVA_HOME/bin/java -Xmx3100m -cp "$BAKSMALI_CP" com.android.tools.smali.baksmali.Main d ${d}.dex -o ${d}_smali
done

# 3. 应用 smali-patches（emua 整方法替换 + cyclone 三处 + AboutFragment 插一条）
python3 ../apply-patches.py classes_smali classes6_smali classes21_smali

# 4. 运行时 4 类：javac + d8 → classes27
mkdir -p rt && cp -r ../runtime-src/* rt/
( cd rt/app/patches/qqmusic/ldp924 && \
  $JAVA_HOME/bin/javac -source 8 -target 8 -Xlint:-options -bootclasspath $AJ -d /tmp/rtc *.java && \
  $JAVA_HOME/bin/java -cp "$BT/lib/d8.jar" com.android.tools.r8.D8 --release --min-api 26 \
    --lib $AJ --output /tmp/rtd /tmp/rtc/app/patches/qqmusic/ldp924/*.class )
cp /tmp/rtd/classes.dex ../surg_c27.dex

# 5. smali 回编三个 dex
$JAVA_HOME/bin/java -Xmx3100m -cp "$SMALI_CP" com.android.tools.smali.smali.Main a classes_smali -o ../surg_main.dex
$JAVA_HOME/bin/java -Xmx3100m -cp "$SMALI_CP" com.android.tools.smali.smali.Main a classes6_smali -o ../surg_c6.dex
$JAVA_HOME/bin/java -Xmx3100m -cp "$SMALI_CP" com.android.tools.smali.smali.Main a classes21_smali -o ../surg_c21.dex

# 6. 组包 + 对齐 + 签名（自建 keystore，见下）
cd ..
python3 - << 'PY'
import zipfile
zin = zipfile.ZipFile('qqmusic.apk')
zout = zipfile.ZipFile('qqmusic-surgical.apk', 'w', zipfile.ZIP_DEFLATED)
replaced = {'classes.dex': 'surg_main.dex', 'classes6.dex': 'surg_c6.dex',
            'classes21.dex': 'surg_c21.dex'}
for item in zin.infolist():
    name = item.filename
    if name.startswith('META-INF/'):
        continue
    if name in replaced:
        zout.write(replaced[name], name)
    else:
        zout.writestr(item, zin.read(name))
zout.write('surg_c27.dex', 'classes27.dex')
zout.close()
PY
$BT/zipalign -f -p 4 qqmusic-surgical.apk ${OUT%.apk}-aligned.apk
# 签名：keytool -genkeypair -keystore surgical.keystore -alias <你自己定> ...（密钥不进仓库，自建）
$JAVA_HOME/bin/java -jar $BT/lib/apksigner.jar sign --ks surgical.keystore \
  --ks-pass env:KS_PASS --v1-signing-enabled true --v2-signing-enabled true \
  --out $OUT ${OUT%.apk}-aligned.apk
echo "完成: $OUT"
