#!/bin/zsh
# SPDX-License-Identifier: GPL-3.0-only
# Copyright (C) 2026 ShortEnigma0
# Part of expertraw-morphe-patches standalone patcher. See LICENSE in the repository root.
# Developer helper: rebuild the Java mod helpers (java/src) into smali/ for the patcher.
# Only needed if you change the Java sources. Requires JDK 17+ and the Android SDK
# (platform android-37.0, build-tools 37.0.0, cmdline-tools for baksmali).
set -e
cd "$(dirname "$0")"
SDK=${ANDROID_HOME:-~/Library/Android/sdk}; BT=$SDK/build-tools/37.0.0; AJ=$SDK/platforms/android-37.0/android.jar
L=$SDK/cmdline-tools/latest/lib/external
BAK="$L/com/android/tools/smali/smali-baksmali/3.0.9/smali-baksmali-3.0.9.jar:$L/com/android/tools/smali/smali-dexlib2/3.0.9/smali-dexlib2-3.0.9.jar:$L/com/android/tools/smali/smali-util/3.0.9/smali-util-3.0.9.jar:$L/com/beust/jcommander/1.64/jcommander-1.64.jar:$L/com/google/guava/guava/33.4.0-jre/guava-33.4.0-jre.jar:$L/com/google/guava/failureaccess/1.0.2/failureaccess-1.0.2.jar"
rm -rf out && mkdir -p out/stubs out/classes out/dex out/smali
javac -nowarn --release 17 -cp "$AJ" -d out/stubs $(find stubs -name '*.java')
javac -nowarn --release 17 -cp "$AJ:out/stubs" -d out/classes $(find src -name '*.java')
$BT/d8 --min-api 34 --lib "$AJ" --classpath out/stubs --output out/dex $(find out/classes -name '*.class')
java -cp "$BAK" com.android.tools.smali.baksmali.Main d -o out/smali out/dex/classes.dex
cp out/smali/com/samsung/android/app/galaxyraw/mod/*.smali ../smali/
rm -rf out
echo "updated ../smali"
