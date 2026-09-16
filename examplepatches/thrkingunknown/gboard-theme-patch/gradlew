#!/bin/sh

APP_HOME=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
MAX_FD=maximum
warn () { echo "$*" >&2; }
die () { echo >&2; exit 1; }

if [ -n "$JAVA_HOME" ]; then
  JAVACMD="$JAVA_HOME/bin/java"
else
  JAVACMD=java
fi
command -v "$JAVACMD" >/dev/null 2>&1 || die "ERROR: Java is required."
exec "$JAVACMD" "-Dorg.gradle.appname=gradlew" -jar "$APP_HOME/gradle/wrapper/gradle-wrapper.jar" "$@"
