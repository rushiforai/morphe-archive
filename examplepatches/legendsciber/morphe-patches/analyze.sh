#!/data/data/com.termux/files/usr/bin/bash
# MCToolbox APK'sini cozer ve "minecraft kurulum konumu kontrolu" ile ilgili
# kodu bulmak icin arama yapar. Sonuc: ~/mct_analysis.txt
set -e

APK="/storage/emulated/0/Download/io.mrarm.mctoolbox_5.4.58-157_minAPI19(arm64-v8a,armeabi-v7a)(nodpi)_apkmirror.com.apk"
OUT="$HOME/mct_analysis.txt"
DEC="$HOME/mct_decoded"

command -v apktool >/dev/null || pkg install -y apktool

echo "[1/3] APK kopyalaniyor..."
cp "$APK" "$HOME/mctoolbox.apk"

if [ ! -d "$DEC" ]; then
    echo "[2/3] APK cozuluyor (birkac dakika surebilir)..."
    apktool d -f "$HOME/mctoolbox.apk" -o "$DEC" > "$HOME/mct_apktool.log" 2>&1
else
    echo "[2/3] Zaten cozulmus: $DEC"
fi

echo "[3/3] Arama yapiliyor..."
{
echo "=== smali klasorleri ==="
ls -d "$DEC"/smali* 2>/dev/null

echo ""
echo "=== io/mrarm altindaki siniflar (ilk 250) ==="
find "$DEC"/smali*/io/mrarm -name "*.smali" 2>/dev/null | sed "s|$DEC/||" | sort | head -250

echo ""
echo "=== 'install' gecen const-string'ler (io/mrarm) ==="
grep -rn -E 'const-string.*[Ii]nstall' "$DEC"/smali*/io/mrarm --include="*.smali" 2>/dev/null | head -120

echo ""
echo "=== com.mojang.minecraftpe referanslari (ilk 150) ==="
grep -rn -E 'com/mojang/minecraftpe|com\.mojang\.minecraftpe' "$DEC"/smali*/io/mrarm --include="*.smali" 2>/dev/null | head -150

echo ""
echo "=== getPackageInfo/getApplicationInfo/sourceDir kullanimlari (ilk 100) ==="
grep -rn -E 'getPackageInfo|getApplicationInfo|->sourceDir|publicSourceDir' "$DEC"/smali*/io/mrarm --include="*.smali" 2>/dev/null | head -100

echo ""
echo "=== 'location'/'path' gecen sinif adlari ==="
find "$DEC"/smali*/io/mrarm -name "*.smali" 2>/dev/null | grep -iE 'locat|path|install|check' | sed "s|$DEC/||" | head -60
} > "$OUT" 2>&1

echo "Bitti! Sonuc: $OUT ($(wc -l < "$OUT") satir)"
