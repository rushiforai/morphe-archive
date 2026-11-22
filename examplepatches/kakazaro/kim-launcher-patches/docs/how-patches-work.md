# How a Morphe patch works

Using this project's own patches as the examples.

## 1. The big idea: you edit a copy, once, on your computer

A patch **does not change the app while it runs**. It runs once on your PC, takes the original APK,
edits some of its code, and writes a **new APK**. You install that new APK. The original app is never
touched.

```
original.apk ──> [Morphe + your patches, on your PC] ──> patched.apk ──> install on the car
```

## 2. What is inside an APK

An APK is a zip file. The part that matters for patches is `classes.dex`: the app's compiled
Kotlin/Java code. You can't read a dex, but it converts losslessly to **smali**, a text form of the
same instructions. Everything in `.work/smali/` is the app's code as smali.

Example, the start of the real update method (`byd/vd.c`), in smali:

```smali
.method public static c(ILjava/lang/String;ZZ)Ljava/util/LinkedHashMap;
    .locals 29
    ...checks the server, downloads the APK, opens the installer...
.end method
```

Smali is low level: no `if (x) {...}`, just small steps over **registers** (`v0`, `v1`, ...,
temporary variables), like `const-string v1, "hello"` or `invoke-static {v0}, Foo;->bar()V`.
`.locals 29` means the method has 29 working registers, so `v0` and `v1` are free to use at the start.

## 3. Step A: find the method (Fingerprint)

The app is **obfuscated**: the update method is called `byd/vd.c`, and in the next app version it
could be `Z2/qa.f`. So a patch can't say "edit K1/uc.c". Instead it describes the method by things
that don't change between versions, called a **fingerprint**:

```kotlin
private object OtaUpdateFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/util/LinkedHashMap;",
    parameters = listOf("I", "Ljava/lang/String;", "Z", "Z"),
    strings = listOf("/otaAndroidLatest?vehicleId=", "kim-launcher-update.apk", ...),
)
```

Morphe scans every method in the dex and returns the one whose shape and text strings match.
Strings are the best anchors, since developers rarely change messages and URLs. If **zero or
several** methods match, the patch fails with an error. It never guesses.

## 4. Step B: edit it (addInstructions)

```kotlin
OtaUpdateFingerprint.method.addInstructions(0, "const/16 p2, 0x0")
```

`0` means "insert before the first instruction". Result in the new APK:

```smali
.method public static c(ILjava/lang/String;ZZ)Ljava/util/LinkedHashMap;
    .locals 29
    const/16 p2, 0x0      <-- added: the "install" flag is now always false
    ...the original code runs as before...
.end method
```

Same as writing `install = false;` as the first line of the method. The check still runs and caches
its result, but the download and installer step is never reached.

## 5. Why patches are version-specific, and safe to fail

- Hook points are found by fingerprint, so a new app version often still works. If the code changed
  too much, the patch **stops with an error** instead of producing a broken APK.
- Each patch declares which versions it was written for (`KimCompatibility.kt`: `1.0.2787`).
- Always test after patching. We verified the smali assembles, but nothing replaces a real run.

## 6. How I find where to hook (you can do this too)

1. **Search for a visible string.** For updates: `kim-launcher-update.apk`. A string appears in
   exactly one class, which finds it.
2. **Read the smali** around it (`.work/smali/smali/K1/uc.1.smali`) and work out who calls it and
   what happens on failure.
3. **Pick the smallest safe edit**: start of a method, just before a `return`, or a branch.
4. **Write the fingerprint** from stable things (signature + strings), and check it matches only one method.
5. **Test offline**: assemble the edited smali and decompile it again (we did this for both patches).

Tools: apktool (APK to smali), JADX (APK to readable Java, easier to understand, sometimes wrong).

## 7. What patches can't do here

The app's UI and many features are Dart, compiled into `libapp.so`. It is a native binary, not
dex, so Morphe's tools can't edit it. Patches can only change what the Kotlin/Java side does, which is
why some features (Kim search, nearby places) can't be turned off with a patch.

## 7b. Gotcha: reading the right file on Windows

Obfuscated names differ only by case (`K1/Uc` and `K1/uc`), and Windows treats them as one file.
Tools rename one of them, so the class you want may sit under another name:

| What | Where |
|---|---|
| `K1/uc` (the updater we patch), Java | `decompiled/java/K1/C0351uc.java`, method `c(...)` at line 141 |
| `K1/uc`, smali | `decompiled/smali/K1/uc.1.smali`, method `c(...)` at line 626 |
| `K1/Uc` (an unrelated enum) | `decompiled/java/K1/Uc.java`, `decompiled/smali/K1/Uc.smali` |

Java and smali names differ too (`C0351uc` vs `K1/uc`), which is one more reason fingerprints use
signatures and strings instead of names.

## 8. Where things live in this repo

| Path | Role |
|---|---|
| `patches/src/main/kotlin/.../kim/KimCompatibility.kt` | which app and version the patches are for |
| `patches/src/main/kotlin/.../kim/NotifyOnlyOtaUpdatesPatch.kt` | simplest example: fingerprint + one edit |
