#!/bin/bash
# Build build/notes-patches.mpp without Gradle (the Morphe Gradle plugin needs a GitHub token with
# read:packages). Extension: javac + d8. Patches: kotlinc from the Gradle cache, compiled against the
# patcher bundled in the Morphe CLI jar (tools/morphe-cli.jar, fetched with gh on first run).
cd "$(dirname "$0")/.." || exit 1
P=$(pwd); O=$P/build/local
SDK=${ANDROID_HOME:-/opt/android-sdk}; BT=$SDK/build-tools/35.0.0; JAR=$SDK/platforms/android-35/android.jar
JAVA21=${JAVA21:-/usr/lib/jvm/java-21-openjdk/bin/java}
CLI=$P/tools/morphe-cli.jar
if [ ! -f "$CLI" ]; then
    gh release download -R MorpheApp/morphe-cli -p 'morphe-desktop-*-all.jar' -O "$CLI" || exit 1
fi
G=~/.gradle/caches/modules-2/files-2.1
k() { find $G/$1 -name "$2" | sort | tail -1; }
KV=2.4.10
KCP=$(k org.jetbrains.kotlin/kotlin-compiler-embeddable "kotlin-compiler-embeddable-$KV.jar"):$(k org.jetbrains.kotlin/kotlin-stdlib "kotlin-stdlib-$KV.jar"):$(k org.jetbrains.kotlin/kotlin-script-runtime "kotlin-script-runtime-$KV.jar"):$(k org.jetbrains.kotlin/kotlin-reflect "kotlin-reflect-$KV.jar"):$(k org.jetbrains.kotlin/kotlin-daemon-embeddable "kotlin-daemon-embeddable-$KV.jar"):$(k org.jetbrains.kotlinx/kotlinx-coroutines-core-jvm 'kotlinx-coroutines-core-jvm-1.10*.jar'):$(k org.jetbrains/annotations 'annotations-13.0.jar')
rm -rf "$O"; mkdir -p $O/ext/classes $O/ext/dex $O/classes/extensions
javac -nowarn --release 17 -cp $JAR -d $O/ext/classes $(find extensions/extension/src/main/java -name '*.java') || exit 1
java -cp $BT/lib/d8.jar com.android.tools.r8.D8 --min-api 29 --lib $JAR --output $O/ext/dex $(find $O/ext/classes -name '*.class') || exit 1
$JAVA21 -cp "$KCP" org.jetbrains.kotlin.cli.jvm.K2JVMCompiler -no-stdlib -no-reflect -nowarn -jvm-target 17 -cp "$CLI" \
    -d $O/classes $(find patches/src/main/kotlin -name '*.kt' -not -path '*/util/*') || exit 1
cp -r patches/src/main/resources/* $O/classes/
cp $O/ext/dex/classes.dex $O/classes/extensions/extension.mpe
printf 'Manifest-Version: 1.0\nName: Jibon Notes patches\nDescription: local build\nVersion: 0.0.1-local\nAuthor: Jibon Krishna Joy\nLicense: GPLv3\nPatcher-Version: 2.0.0\n' > $O/MANIFEST.MF
mkdir -p build && (cd $O/classes && jar cfm $P/build/notes-patches.mpp $O/MANIFEST.MF .) && echo "$P/build/notes-patches.mpp"
