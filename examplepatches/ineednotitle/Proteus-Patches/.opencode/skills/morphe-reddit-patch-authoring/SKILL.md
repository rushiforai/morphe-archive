---
name: morphe-reddit-patch-authoring
description: Use when adding, fixing, or reviewing a Proteus/Morphe Reddit (com.reddit.frontpage) bytecode patch, especially when a patch applies but a render surface ignores it. Covers fingerprints, shared anchors, reflection helpers, JVM tests, buildAndroid, and APK apply verification.
---

# Morphe Reddit patch authoring

Use this workflow for Reddit patches in this repo. It assumes the Morphe
patcher DSL and a Java Android extension compiled against the SDK only.

## 1. Find both sides of the patch

Every runtime feature has three pieces:

1. Patch entry: `patches/src/main/kotlin/app/template/patches/reddit/<feature>/...Patch.kt`
2. Shared anchor: `patches/src/main/kotlin/app/template/patches/reddit/shared/...`
3. Runtime helper: `extensions/extension/src/main/java/app/template/extension/extension/Reddit*Helper.java`

Read the helper first. It defines the injection contract (method name,
parameter types, return type). The patch must call exactly that signature.

## 2. Pick the real render choke point

Do not assume `Listing.children` covers everything. In Reddit 2026.42.0:

- Feed/listings: `Lcom/reddit/domain/model/listing/Listing;` in `classes6.dex`
- Comment threads: `Lc5l0;` TreeData in `classes8.dex`, emitted by the
  obfuscated comment tree store `com.reddit.comments.tree.c`
- Every GraphQL/REST comment object: full
  `Lcom/reddit/domain/model/Comment;<init>` in `classes6.dex`

If a patch applies cleanly but a surface is unchanged, verify the render path
before changing the detector. Use the `morphe-runtime-anchor-verification`
skill.

## 3. Author the fingerprint

Match structure, not names, when possible:

```kotlin
internal val SomeFingerprint = Fingerprint(
    definingClass = "Lsome/obfuscated/Class;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    filters = listOf(
        fieldAccess(Opcode.IPUT_OBJECT, "Lsome/obfuscated/Class;->a:Ljava/util/List;"),
        fieldAccess(Opcode.IPUT_OBJECT, "Lsome/obfuscated/Class;->b:Ljava/util/Map;"),
    ),
)
```

Rules:

- Use the DEX descriptor, not the jadx `defpackage` name. `Lc5l0;` is not
  `Ldefpackage/c5l0;`.
- Include every field write that makes the match unique.
- Resolve instruction indexes from the current instruction list. Other patches
  may have inserted instructions before the same field write.
- Guard `invoke-static` arguments to v0-v15. Use `invoke-static/range` for
  wide/high registers (for example `Comment.<init>` with ~100 parameters).
- Do not split a smali method reference across lines with `\`; triple-quoted
  Kotlin strings do not continue lines. Put the whole instruction on one line.

## 4. Inject safely

The standard helper shape is `(List) -> List` or `(Map) -> Map`, writing back
into the same register:

```kotlin
method.addInstructions(
    index,
    """
        invoke-static { v$register }, $HELPER->helper(Ljava/util/List;)Ljava/util/List;
        move-result-object v$register
    """.trimIndent(),
)
```

For constructors with ordered field writes, insert before the field write and
let later writes see the filtered value. Keep patch order deterministic:
AutoMod filters the comment map before deleted-comment restore runs.

## 5. Write the helper fail-safe

The extension cannot import Reddit models. Resolve them reflectively and never
throw into app code:

- Cache `java.lang.reflect.Method`/`Field` per class.
- Prefer public getters; fall back to declared fields with `setAccessible`.
- Return the original list/map when nothing matched, so `move-result-object`
  is cheap.
- One-time `System.out.println("[Proteus] ...")` probe + throttled drop logs.
- Catch `Throwable` and keep stock behavior on archive/network/model drift.

## 6. Test the helper, then build the bundle

```bash
JAVA_HOME=/tmp/opencode/jdk21 \
ANDROID_HOME=/tmp/opencode/android-sdk \
GITHUB_ACTOR=local GITHUB_TOKEN=dummy \
bash ./gradlew --init-script /tmp/opencode/local.init.gradle.kts \
  :extensions:extension:test :patches:buildAndroid
```

Always rerun `:patches:buildAndroid` after tests. Gradle test tasks can leave a
JVM-only `patches-*.mpp` artifact; publishing that produces a broken bundle.

## 7. Apply to the real APK and read the patched DEX

```bash
JAVA_HOME=/tmp/opencode/jdk21 /tmp/opencode/jdk21/bin/java -Xmx4g \
  -jar /tmp/opencode/tools/morphe-desktop.jar patch \
  --exclusive --unsigned \
  --patches=patches/build/libs/patches-2.2.10.mpp \
  --enable="Block AutoMod comments" \
  --enable="Show deleted posts and comments" \
  --out=/tmp/opencode/reddit42-test.apk \
  --result-file=/tmp/opencode/reddit42-test-result.json \
  /tmp/opencode/reddit-xapk/com.reddit.frontpage.apk
```

Then unzip `classes*.dex` and dexdump the patched class. Confirm the injected
instructions are present and the field write still uses the filtered register.
A successful patch report alone does not prove the hook is on the right path.

## 8. Update the docs in the patch file

Keep the KDoc honest: name the anchor, the helper method, what is batched, what
is off-main-thread, and what still degrades to stock behavior. If the anchor
changes, update `docs/` and the patch description too.
