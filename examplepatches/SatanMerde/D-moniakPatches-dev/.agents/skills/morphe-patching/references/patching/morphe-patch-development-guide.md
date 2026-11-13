# Morphe Patch Development Guide

Complete guide for creating, building, and deploying Morphe patches — from APK analysis to working release.

---

## Table of Contents

1. [Prerequisites & Tools](#prerequisites--tools)
2. [Project Setup](#project-setup)
3. [APK Analysis Workflow](#apk-analysis-workflow)
4. [Creating Fingerprints](#creating-fingerprints)
5. [Writing Patches](#writing-patches)
6. [Building & Testing](#building--testing)
7. [Deploying](#deploying)
8. [Troubleshooting](#troubleshooting)
9. [Real-World Example: Teleprompter Premium](#real-world-example-teleprompter-premium)

---

## Prerequisites & Tools

### Core tools

| Tool | Purpose | Install |
|------|---------|---------|
| JDK 21 | Recommended patch-build toolchain; matches template CI and runs the CLI | `apt install openjdk-21-jdk` |
| jadx | Decompile APK → Java source | `apt install jadx` |
| baksmali | Disassemble DEX → smali for local analysis | `apt install libsmali-java` |
| apktool | Decode/rebuild APK resources & manifest | `apt install apktool` |
| aapt | Read APK manifest, permissions, resources | Part of Android SDK / `apt install aapt` |
| ripgrep (rg) | Fast regex search across files | `apt install ripgrep` |
| gh CLI | GitHub releases, actions, auth | `apt install gh` |

### Analysis & identification tools

| Tool | Purpose | Install / Run |
|------|---------|---------------|
| androguard | Python APK analyzer — permissions, call graphs, certificates, xrefs | `uvx androguard analyze -i app.apk` |
| APKiD | Identify packers, obfuscators, protections on APK | `uvx apkid app.apk` |
| dex2jar | Convert DEX → JAR for Java decompilers | `apt install dex2jar` → `d2j-dex2jar` |
| strings | Extract printable strings from binary files | Built-in (`binutils`) |

`uvx` runs Python CLI tools without installing them globally — always uses latest version.

### Signing & manipulation tools

| Tool | Purpose | Install |
|------|---------|---------|
| uber-apk-signer | Sign, zipalign, verify APKs (v1/v2/v3) | [GitHub JAR](https://github.com/patrickfav/uber-apk-signer/releases) |
| apksigner | Official Android APK signing tool | Part of Android build-tools |
| smali | Assemble smali → DEX for local tests only; Gradle builds use the pinned fork | `apt install libsmali-java` |

### Quick install all

```bash
# apt packages
sudo apt install -y openjdk-21-jdk jadx libsmali-java apktool aapt ripgrep dex2jar gh

# Python tools via uvx (no install needed, runs latest)
uvx apkid app.apk
uvx androguard analyze -i app.apk
```

### GitHub auth

```bash
gh auth login
TOKEN=$(gh auth token)
mkdir -p ~/.gradle
cat > ~/.gradle/gradle.properties << EOF
gpr.user = <GitHub username>
gpr.key = $TOKEN
EOF
```

---

## Project Setup

### Clone the template

```bash
mkdir morphe && cd morphe
git clone https://github.com/MorpheApp/morphe-patches-template
git clone https://github.com/MorpheApp/morphe-desktop
```

### Patch project structure

```
morphe-patches-template/
├── patches/src/main/kotlin/app/<group>/patches/
│   └── <app>/
│       ├── shared/Constants.kt          # App compatibility
│       └── <category>/
│           ├── Fingerprints.kt          # Method fingerprints
│           └── SomePatch.kt            # Patch logic
├── extensions/                          # Java runtime code (optional)
├── gradle.properties                    # Version
├── settings.gradle.kts                  # Plugin config
└── .releaserc                          # Semantic release config
```

---

## APK Analysis Workflow

Every patch starts with deep APK analysis. Always create a dedicated project folder.

### Step 1: Create analysis project

```bash
APP="teleprompter"
mkdir -p analysis/$APP/{apk,decompiled,smali,notes}
cp MyApp.apk analysis/$APP/apk/
cd analysis/$APP
```

After analysis, the folder looks like:
```
analysis/teleprompter/
├── apk/
│   └── MyApp.apk
├── decompiled/
│   └── sources/                # jadx output
│       └── com/example/...
├── smali/
│   ├── classes/                # from classes.dex
│   ├── classes2/               # from classes2.dex
│   └── classes5/               # etc.
└── notes/
    └── findings.md
```

### Step 2: Identify the APK

```bash
# Basic info: package, version, SDK
aapt dump badging apk/MyApp.apk | head -5

# Identify protections/obfuscators
uvx apkid apk/MyApp.apk

# Full permission and component list
uvx androguard analyze -i apk/MyApp.apk
```

**APKiD output tells you:**
- Compiler used (dx, d8, r8)
- Obfuscator (ProGuard, R8, DexGuard)
- Packer (if any — makes patching harder)

### Step 3: Check APK type and install requirements

```bash
# Split APK requirements
aapt dump xmltree apk/MyApp.apk AndroidManifest.xml | rg -i "split|requiredSplit"

# Native libraries
unzip -l apk/MyApp.apk | rg "\.so|lib/"

# DEX files
unzip -l apk/MyApp.apk | rg "\.dex"

# App framework (React Native, Flutter, etc.)
unzip -l apk/MyApp.apk | rg "index.android.bundle|libflutter|libapp"
```

**Decision table:**

| Distribution you will patch | Recommended value | Enforced value |
|---|---|---|
| Complete single APK | `APK` | `APK_REQUIRED` |
| APKMirror container | `APKM` | `APKM_REQUIRED` |
| Bundletool container | `APKS` | `APKS_REQUIRED` |
| APKPure container | `XAPK` | `XAPK_REQUIRED` |

Non-`_REQUIRED` values recommend a format in Manager; `_REQUIRED` rejects other formats. Choose
based on the complete artifact users must supply, not merely the presence of `requiredSplitTypes`.
For split apps, preserve and patch the full container; an extracted base APK may omit code,
resources, or native libraries.

Architecture indicators:

| What you see | Meaning |
|---|---|
| `index.android.bundle` in assets | React Native; core logic may be JS/Hermes |
| `libflutter.so` and `libapp.so` | Flutter; core Dart logic is native AOT |

### Step 4: Decompile to Java

```bash
# Primary path — remote decompile on Kaggle (4 cores, 28GB RAM).
# Explain that Kaggle receives the URL and APK, then obtain explicit approval first.
.kiro/jadx-decompile "<apk-download-url>" analysis/$APP/
cd analysis/$APP && unzip *_decompiled.zip -d decompiled/

# Local jadx (only for small APKs or quick re-decompile)
jadx -d decompiled apk/MyApp.apk
```

jadx gives readable Java — use this to understand app logic.

### Step 5: Search for target code with ripgrep

```bash
# --- Subscription/Premium checks ---
rg "getEntitlements|isPremium|isSubscribed|checkLicense|hasPurchased" decompiled/sources/ -g "*.java" -l

# RevenueCat specific
rg "CustomerInfo|EntitlementInfos|getActive" decompiled/sources/ -g "*.java" -l

# Google Play Billing
rg "BillingClient|queryPurchases|isAcknowledged" decompiled/sources/ -g "*.java" -l

# --- Ad-related code ---
rg "showAd|loadAd|interstitial|AdMob|adView|mobidetect" decompiled/sources/ -g "*.java" -l

# --- Find specific method signatures ---
rg "public static boolean.*CustomerInfo" decompiled/sources/ -g "*.java"

# --- Find who calls a method ---
rg "\.e\(customerInfo\)" decompiled/sources/ -g "*.java" -C 3

# --- Search for strings in DEX (binary) ---
strings apk/MyApp.apk | rg -i "premium|entitlement|license"

# --- Find base64 encoded URLs ---
strings apk/MyApp.apk | rg "aHR0c" | while read b; do echo "$b" | base64 -d 2>/dev/null; echo; done
```

**Useful ripgrep flags:**

| Flag | Purpose |
|------|---------|
| `-g "*.java"` | Filter by file type |
| `-l` | List matching files only |
| `-C 3` | Show 3 lines of context |
| `-A 10` | Show 10 lines after match |
| `-c` | Count matches per file |
| `-i` | Case insensitive |
| `--max-count 3` | Max 3 matches per file |
| `-o` | Show only matching text |

### Step 6: Read the target method

```bash
# Read full Java method with context
rg "public static boolean e\(CustomerInfo" decompiled/sources/ -g "*.java" -A 10

# Or read the whole file
cat decompiled/sources/yz/u.java
```

### Step 7: Get actual smali bytecode

**Critical step.** The patcher works on smali, not Java. Always verify.

```bash
# Disassemble ALL DEX files at once
for dex in $(unzip -l apk/MyApp.apk | rg "\.dex" | awk '{print $4}'); do
    name=$(basename $dex .dex)
    unzip -o apk/MyApp.apk $dex -d /tmp/dex_extract
    baksmali d /tmp/dex_extract/$dex -o smali/$name
    echo "Disassembled $dex → smali/$name"
done

# Find the target class across all DEX outputs
find smali/ -name "u.smali" -path "*/yz/*"

# Read the target method
rg -A 30 "\.method public static e\(Lcom/revenuecat" smali/classes5/yz/u.smali
```

From smali, note:
- **Method signature**: `.method public static e(Lcom/revenuecat/purchases/CustomerInfo;)Z`
- **Access flags**: `public static` (NOT `final` — be precise)
- **Register count**: `.registers 2`
- **Instruction sequence**: the invoke-virtual calls, their order, class names

### Step 8: Cross-reference with androguard (optional)

```bash
# Find all methods that reference a class
uvx androguard analyze -i apk/MyApp.apk << 'EOF'
from androguard.misc import AnalyzeAPK
a, d, dx = AnalyzeAPK("apk/MyApp.apk")
for method in dx.find_methods(classname=".*CustomerInfo.*"):
    print(method.get_method().get_class_name(), method.get_method().get_name())
EOF
```

### Step 9: Document findings

Save everything in `notes/findings.md`:
```markdown
# MyApp Analysis

## Target: Premium bypass
- Package: com.example.app
- Version: 1.0.0
- APK Type: XAPK (split APKs required)
- Obfuscator: R8

## Target method
- Class: yz/u (obfuscated)
- Method: public static boolean e(CustomerInfo)
- DEX: classes5.dex
- Purpose: Returns true if user has active entitlements

## Fingerprint strategy
- returnType: Z (boolean)
- accessFlags: PUBLIC, STATIC
- parameters: CustomerInfo
- filters: getEntitlements() → getActive()
```

---

## Creating Fingerprints

Fingerprints identify obfuscated methods by their stable characteristics.

### Rules

- **Never** use obfuscated class/method names
- Use `filters` (ordered) over `strings` (unordered)
- Only access `instructionMatches` if `filters` is defined
- Declare as `object` classes for named stack traces
- Verify against smali, not jadx output

### Building a fingerprint from smali

Given smali:
```smali
.method public static e(Lcom/revenuecat/purchases/CustomerInfo;)Z
    invoke-virtual {p0}, Lcom/revenuecat/purchases/CustomerInfo;->getEntitlements()Lcom/revenuecat/purchases/EntitlementInfos;
    move-result-object p0
    invoke-virtual {p0}, Lcom/revenuecat/purchases/EntitlementInfos;->getActive()Ljava/util/Map;
    ...
.end method
```

Map to fingerprint:

| Smali | Fingerprint field |
|-------|------------------|
| `public static` | `accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC)` |
| `(Lcom/.../CustomerInfo;)` | `parameters = listOf("Lcom/revenuecat/purchases/CustomerInfo;")` |
| `Z` | `returnType = "Z"` |
| `invoke-virtual ... getEntitlements` | `methodCall(definingClass = "...", name = "getEntitlements")` |
| `invoke-virtual ... getActive` | `methodCall(definingClass = "...", name = "getActive")` |

```kotlin
object EntitlementCheckFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Lcom/revenuecat/purchases/CustomerInfo;"),
    filters = listOf(
        methodCall(definingClass = "Lcom/revenuecat/purchases/CustomerInfo;", name = "getEntitlements"),
        methodCall(definingClass = "Lcom/revenuecat/purchases/EntitlementInfos;", name = "getActive")
    )
)
```

### For non-obfuscated methods

```kotlin
object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lapp/example/MainActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)
```

### Filter types

| Filter | Usage |
|--------|-------|
| `string("text")` | Match const-string instruction |
| `methodCall(definingClass, name)` | Match invoke-* instruction |
| `methodCall(smali = "Landroid/net/Uri;->parse(...)...")` | Smali shorthand |
| `fieldAccess(opcode, definingClass, type)` | Match field get/put |
| `opcode(Opcode.X)` | Match specific opcode |
| `literal(value)` | Match const literal |
| `resourceLiteral(ResourceType.ID, "name")` | Match the APK's resolved resource ID literal |
| `newInstance(type)` / `instanceOf(type)` / `checkCast(type)` | Match type operations |
| `anyInstruction(f1, f2)` | Match either (version differences) |

Filters match in order. Use `MatchAfterImmediately`, `MatchAfterWithin(n)`, or first-filter
`MatchFirst()` only when smali requires distance constraints. `MatchAfterAtLeast` and
`MatchAfterRange` are deprecated. Access flags match the exact bitmask; list every smali flag.

---

## Writing Patches

### Patch types

| Type | Use When | Performance |
|------|----------|-------------|
| `bytecodePatch` | Modifying Dalvik bytecode | Fast — no resource decoding |
| `rawResourcePatch` | Modifying raw files/assets | Medium |
| `resourcePatch` | Modifying decoded XML | Slow — decodes all resources |

Always prefer `bytecodePatch`.

### Compatibility declaration

```kotlin
object Constants {
    val COMPATIBILITY_APP = Compatibility(
        name = "App Name",
        packageName = "com.example.app",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0x6200EE,
        targets = listOf(
            AppTarget(version = "6.8.2"),
            AppTarget(version = "6.8.1")
        )
    )
}
```

### Pattern: Return true/false at method start

```kotlin
@Suppress("unused")
val myPatch = bytecodePatch(
    name = "My Patch",
    description = "Does something useful."
) {
    compatibleWith(COMPATIBILITY_APP)
    execute {
        MyFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)
    }
}
```

### Pattern: Override value at matched instruction

```kotlin
execute {
    MyFingerprint.let {
        val index = it.instructionMatches[0].index
        val reg = it.instructionMatches[0].getInstruction<OneRegisterInstruction>().registerA
        it.method.addInstructions(index + 1, "const/4 v$reg, 0x0")
    }
}
```

### Pattern: With extension (Java runtime code)

```kotlin
val myPatch = bytecodePatch(name = "My Patch") {
    compatibleWith(COMPATIBILITY_APP)
    extendWith("extensions/extension.mpe")
    execute {
        MyFingerprint.method.addInstructions(1, """
            invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;
            move-result-object v0
            invoke-static {v0}, Lapp/example/MyExt;->hook(Landroid/content/Context;)V
        """)
    }
}
```

Extension at `extensions/extension/src/main/java/app/example/MyExt.java`:
```java
public class MyExt {
    public static void hook(Context context) {
        // Complex logic here
    }
}
```

---

## Building & Testing

### Build patches

```bash
cd morphe-patches-template
./gradlew buildAndroid
# → patches/build/libs/patches-<version>.mpp
```

### Build CLI

```bash
cd morphe-desktop
./gradlew build
# → build/libs/morphe-desktop-<version>-all.jar
```

### Test with CLI

```bash
# List patches
java -jar morphe-cli.jar list-patches --patches patches.mpp --with-packages --with-versions

# Patch an APK
java -jar morphe-cli.jar patch --patches patches.mpp --out patched.apk input.apk

# Patch + install via ADB
java -jar morphe-cli.jar patch --patches patches.mpp --out patched.apk input.apk --install

# Enable specific patch only
java -jar morphe-cli.jar patch --patches patches.mpp --exclusive -e "Patch Name" input.apk
```

### Quick dev script

```bash
#!/bin/sh
cd morphe-desktop && ./gradlew build && cd ..
cd morphe-patches-template && ./gradlew buildAndroid && cd ..
java -Xms152m -jar morphe-desktop/build/libs/morphe-desktop-*-all.jar \
  patch --patches morphe-patches-template/patches/build/libs/patches-*.mpp \
  --out morphe.apk $1 --install
```

---

## Deploying

### Branch strategy

| Branch | Purpose | Release Type |
|--------|---------|-------------|
| `dev` | Testing & development | Pre-release (`v1.2.0-dev.1`) |
| `main` | Stable releases | Stable (`v1.2.0`) |

Stable releases come from `main`. Pre-releases on `dev` are available to users who explicitly
enable the pre-release channel for the patch source; stable remains the normal default.

### Setup: Enable dev branch

**.releaserc:**
```json
{
  "branches": [
    "main",
    { "name": "dev", "prerelease": true }
  ]
}
```

**.github/workflows/release.yml:**
```yaml
on:
  push:
    branches:
      - main
      - dev
```

### Development workflow

```bash
# 1. Create dev branch (first time only)
git checkout -b dev
git push -u origin dev

# 2. Make changes on dev
git add .
git commit -m "feat: add new patch"
git push
# → Creates pre-release v1.x.0-dev.1

# 3. Test the pre-release .mpp with Morphe Manager

# 4. When tested and working, merge to main
git checkout main
git pull
git merge dev
git push
# → Creates stable release v1.x.0

# 5. Go back to dev for next changes
git checkout dev
git pull
```

### Important: Always `git pull` after push

GitHub Actions auto-updates these files after each release:
- `CHANGELOG.md` — release notes
- `gradle.properties` — version number
- `patches-bundle.json` — download URL for Morphe Manager
- `patches-list.json` — patch metadata, including categories
- `README.md` — generated patch listing

Released MPP files also receive a build-provenance attestation.

**Always run `git pull` before making new changes**, otherwise you'll get push rejections:

```bash
# After pushing and waiting for build to complete:
git pull          # pulls the auto-updated files

# Or when pushing new changes:
git pull --rebase  # rebase your changes on top of auto-updates
git push
```

### Conventional commits

| Prefix | Release Type | Example |
|--------|-------------|---------|
| `feat:` | Minor (1.x.0) | `feat: add new app patch` |
| `fix:` | Patch (1.0.x) | `fix: update fingerprint for new version` |
| `docs:` | No release | `docs: update README` |
| `chore:` | No release | `chore: cleanup files` |

### Add to Morphe Manager

Users add your patches via URL:
```
https://morphe.software/add-source?github=<username>/<repo>
```

Or add a clickable badge in README:
```markdown
[![Add to Morphe Manager](https://img.shields.io/badge/Add%20to-Morphe%20Manager-blue?style=for-the-badge)](https://morphe.software/add-source?github=<username>/<repo>)
```

### How Morphe Manager finds releases

1. Reads `patches-bundle.json` from your repo (auto-updated by GitHub Actions)
2. Downloads the `.mpp` file from the selected release channel (stable by default)
3. Uses dev pre-releases only when the user enables the pre-release channel for that source

### Clean repo reset (fresh start)

⚠️ **Destructive and explicit-only.** This deletes releases, tags, workflow runs, branch history,
and force-pushes `main`. Explain the impact and wait for confirmation before running any command.

```bash
# Delete all releases, tags, action runs
for tag in $(gh release list --limit 50 --json tagName -q '.[].tagName'); do
    gh release delete "$tag" --yes --cleanup-tag
done
gh run list --limit 50 --json databaseId -q '.[].databaseId' | while read id; do
    gh run delete "$id"
done

# Fresh single commit
git checkout --orphan fresh
git add . && git commit -m "feat: initial release"
git branch -D main && git branch -m main
git push --force origin main
```

### Remove old assets from a release

```bash
# If a release has duplicate .mpp files
gh release delete-asset v1.2.0 patches-1.1.0.mpp --repo <user>/<repo> --yes
```

---

## Troubleshooting

| Error | Cause | Fix |
|-------|-------|-----|
| `Fingerprint declared no instruction filters` | Accessing `instructionMatches` without `filters` | Add `filters` or don't use `instructionMatches` |
| `Failed to match the fingerprint` | Fingerprint doesn't match any method | Verify smali, check `strings` vs `filters`, use `classFingerprint` |
| "Not compatible with your device" | `requiredSplitTypes` in manifest | Use XAPK/APKM with correct `ApkFileType` |
| Fingerprint not matching | Method changed or wrong DEX | Verify with `baksmali` on correct DEX |
| Patched app crashes | Wrong smali registers | Check `adb logcat`, verify register numbers |
| Build auth failure | Missing gradle credentials | Set `gpr.user`/`gpr.key` in `~/.gradle/gradle.properties` |
| Wrong ABI in XAPK | 32-bit XAPK on 64-bit device | Download arm64_v8a variant |
| Google login fails | Signature mismatch after re-signing | Expected — can't fix without MicroG support patch |
| `strings` fingerprint not matching | `strings` matches method-level, not class-level | Use `classFingerprint` with `strings` to find class first |
| Release has duplicate .mpp | Semantic-release carried old asset | Delete old asset with `gh release delete-asset` |
| `fix:` commit didn't release | Network timeout in GitHub Actions | Rerun: `gh run rerun <id> --repo <user>/<repo>` |

### Fingerprint debugging tips

1. **`strings` field** matches strings **within the method**, not the class
2. **`classFingerprint`** finds the class first (can use `strings`), then matches method within it
3. **`filters`** must appear in the **same order** as in the target method
4. **Obfuscated names** (`a`, `b`, `H`) change between versions — avoid in fingerprints
5. **Non-obfuscated names** (`isPremium`, `getEntitlements`) are safe to use
6. **Always verify** fingerprints against smali, not jadx output

### Known limitations of patched apps

- **Google login/Drive** — fails due to signature mismatch (app re-signed by Morphe)
- **Server-validated features** — can't bypass (e.g., AI credits, cloud publishing)
- **Split APK apps** — must use XAPK/APKM format, not standalone base APK

---

## Real-World Example: Teleprompter Premium

### Analysis

```bash
mkdir -p analysis/teleprompter/{apk,decompiled,smali,notes}

# Check APK type
aapt dump badging base.apk | head -3
# → com.solid.teleprompter, v6.8.2, minSdk 32

aapt dump xmltree base.apk AndroidManifest.xml | rg "split"
# → requiredSplitTypes="base__abi,base__density" → MUST use XAPK

# Identify protections
uvx apkid base.apk
# → compiler: r8

# Decompile
jadx -d analysis/teleprompter/decompiled base.apk

# Find subscription code
rg "getEntitlements|isPremium" analysis/teleprompter/decompiled/sources/ -g "*.java" -l
# → yz/u.java

rg "public static boolean.*CustomerInfo" analysis/teleprompter/decompiled/sources/ -g "*.java" -A 5

# Verify in smali (class is in classes5.dex)
unzip -o base.apk classes5.dex -d /tmp/
baksmali d /tmp/classes5.dex -o analysis/teleprompter/smali/classes5
rg -A 20 "\.method public static e\(Lcom/revenuecat" analysis/teleprompter/smali/classes5/yz/u.smali
```

### Files

**Fingerprints.kt:**
```kotlin
object EntitlementCheckFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Lcom/revenuecat/purchases/CustomerInfo;"),
    filters = listOf(
        methodCall(definingClass = "Lcom/revenuecat/purchases/CustomerInfo;", name = "getEntitlements"),
        methodCall(definingClass = "Lcom/revenuecat/purchases/EntitlementInfos;", name = "getActive")
    )
)
```

**TeleprompterPremiumPatch.kt:**
```kotlin
@Suppress("unused")
val teleprompterPremiumPatch = bytecodePatch(
    name = "Teleprompter Premium",
    description = "Unlocks premium features in Teleprompter Vlog & Scripts app."
) {
    compatibleWith(COMPATIBILITY_TELEPROMPTER)
    execute {
        EntitlementCheckFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)
    }
}
```

**Constants.kt:**
```kotlin
val COMPATIBILITY_TELEPROMPTER = Compatibility(
    name = "Prompter Pal",
    packageName = "com.solid.teleprompter",
    apkFileType = ApkFileType.XAPK,
    appIconColor = 0x6200EE,
    targets = listOf(
        AppTarget(version = "6.8.2"),
        AppTarget(version = "6.8.1")
    )
)
```

---

## Common Smali Patterns

```smali
# Return true
const/4 v0, 0x1
return v0

# Return false
const/4 v0, 0x0
return v0

# Call static extension
invoke-static {}, Lcom/example/Ext;->hook()V

# Get context from Activity
invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;
move-result-object v0
invoke-static {v0}, Lcom/example/Ext;->hook(Landroid/content/Context;)V

# Conditional branch
invoke-static {}, Lcom/example/Ext;->check()Z
move-result v0
if-eqz v0, :skip
return-void
:skip
nop
```

---

## Key Imports

```kotlin
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import app.morphe.patcher.methodCall
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.opcode
import app.morphe.patcher.literal
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.newInstance
import app.morphe.patcher.instanceOf
import app.morphe.patcher.checkCast
import app.morphe.patcher.anyInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
```
