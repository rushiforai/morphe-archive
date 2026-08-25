#!/data/data/com.termux/files/usr/bin/bash
# MCToolbox kurulum-kontrolunun tam akisini cikarir -> ~/mct_analysis2.txt
DEC="$HOME/mct_decoded"
OUT="$HOME/mct_analysis2.txt"
MA="$DEC/smali/io/mrarm/mctoolbox/MinecraftActivity.smali"
EA="$DEC/smali/io/mrarm/mctoolbox/ErrorActivity.smali"
RA="$DEC/smali/io/mrarm/mctoolbox/RelaunchActivity.smali"

{
echo "=== MinecraftActivity: V (PackageInfo) alani tum kullanimlar ==="
grep -n -e '->V:Landroid/content/pm/PackageInfo;' "$MA"

echo ""
echo "=== MinecraftActivity: W/Ljd0 alani kullanimlari ==="
grep -n -e '->W:Ljd0;' "$MA"

echo ""
echo "=== sourceDir / nativeLibraryDir / splitSourceDirs kullanimlari (tum io/mrarm) ==="
grep -rn -E 'sourceDir|nativeLibraryDir|publicSourceDir' "$DEC/smali/io/mrarm" --include="*.smali" | head -60

echo ""
echo "=== Ljd0 sinifi nerede ==="
find "$DEC/smali" -name "jd0.smali" | head -3

echo ""
echo "=== ErrorActivity satir 300-480 ==="
sed -n '300,480p' "$EA"

echo ""
echo "=== RelaunchActivity satir 350-430 ==="
sed -n '350,430p' "$RA"

echo ""
echo "=== RelaunchActivity satir 850-930 ==="
sed -n '850,930p' "$RA"

echo ""
echo "=== i60.c imzasi ==="
find "$DEC/smali" -name "i60.smali" -exec sed -n '1,80p' {} \;
} > "$OUT" 2>&1

echo "Bitti: $OUT ($(wc -l < "$OUT") satir)"
