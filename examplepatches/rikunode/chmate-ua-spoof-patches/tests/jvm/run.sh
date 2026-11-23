#!/usr/bin/env bash
# Compiles the Android-free extension classes with JVM test doubles and runs the UA echo test.
# Requires a JDK 17+ on PATH or JAVA_HOME. Output goes to tests/jvm/build (ignored).
set -euo pipefail
cd "$(dirname "$0")"
JAVAC="${JAVA_HOME:+$JAVA_HOME/bin/}javac"
JAVA="${JAVA_HOME:+$JAVA_HOME/bin/}java"
EXT=../../extensions/chmateuaspoof/src/main/java/app/morphe/extension/chmateuaspoof
rm -rf build && mkdir -p build
"$JAVAC" -encoding UTF-8 -d build $EXT/UaSpoof.java $EXT/UaSpoofRules.java \
  fakes/okhttp3/Headers.java fakes/o/zzdA.java fakes/app/morphe/extension/chmate/ReadingAuth.java \
  UaSpoofJvmTest.java
"$JAVA" -cp build UaSpoofJvmTest
