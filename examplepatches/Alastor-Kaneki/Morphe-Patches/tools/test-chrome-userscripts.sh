#!/usr/bin/env sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
OUT="$ROOT/build/chrome-userscript-test"
STUB="$OUT/stub/dev/alastorkaneki/morphe/extension/chromeuserscripts"
rm -rf "$OUT"
mkdir -p "$STUB"

cat > "$STUB/Userscript.java" <<'JAVA'
package dev.alastorkaneki.morphe.extension.chromeuserscripts;

import java.util.ArrayList;
import java.util.List;

public final class Userscript {
    public static final String KIND_JAVASCRIPT = "javascript";
    public static final String KIND_CSS = "css";
    public String id;
    public String name = "Untitled userscript";
    public String namespace = "";
    public String version = "1.0.0";
    public String description = "";
    public String author = "";
    public String icon = "";
    public String runAt = "document-end";
    public String injectInto = "page";
    public String updateUrl = "";
    public String downloadUrl = "";
    public String installUrl = "";
    public String kind = KIND_JAVASCRIPT;
    public String source = "";
    public boolean enabled = true;
    public boolean noFrames;
    public long installedAt = System.currentTimeMillis();
    public long updatedAt = installedAt;
    public int sortOrder;
    public final List<String> matches = new ArrayList<>();
    public final List<String> includes = new ArrayList<>();
    public final List<String> excludes = new ArrayList<>();
    public final List<String> excludeMatches = new ArrayList<>();
    public final List<String> grants = new ArrayList<>();
    public final List<String> requires = new ArrayList<>();
    public final List<String> resources = new ArrayList<>();
    public final List<String> requireSources = new ArrayList<>();
    public final List<String> tags = new ArrayList<>();
}
JAVA

javac -d "$OUT/classes" \
  "$STUB/Userscript.java" \
  "$ROOT/extensions/extension/src/main/java/dev/alastorkaneki/morphe/extension/chromeuserscripts/UserscriptMetadataParser.java" \
  "$ROOT/extensions/extension/src/main/java/dev/alastorkaneki/morphe/extension/chromeuserscripts/ViolentmonkeyCompat.java" \
  "$ROOT/extensions/extension/src/main/java/dev/alastorkaneki/morphe/extension/chromeuserscripts/UrlPatternMatcher.java" \
  "$ROOT/extensions/extension/src/main/java/dev/alastorkaneki/morphe/extension/chromeuserscripts/ScriptInjector.java" \
  "$ROOT/tools/ChromeUserscriptSelfTest.java"

java -cp "$OUT/classes" ChromeUserscriptSelfTest
