# Real Taobao 10.66.30: optional 24-subclass DinamicX TEXT extension

Date 2026-10-24. Original APK SHA-256:
`3e709717a60fdeeb59354df60fb6cf279ffb023c01e095e16bccfbad75f683dd`.

**Purpose:** The original four-hook patch only modifies the base text widget
classes. On the exact user's Taobao 10.66.30 APK, 43 classes derive from
`tb/gi6`; 31 subclasses override the TEXT attribute method and 24 write
additional String/CharSequence fields. A subclass's p3 remains Chinese when
only the parent method changes its own p3. The extension translates the input
**before** these 24 subclass implementations and their own field writes.

## Candidate screening

- Actual classes/method signatures confirmed in the original 13 DEX corpus.
- **24** subclass attribute methods `onSetStringAttribute(JLjava/lang/String;)V`
  have own string/CharSequence field stores.
- Each of the 24 invokes the superclass attribute handler; none has fewer
  than **3 local registers**, as required for scratch v0/v1/v2.
- Text translation is only attempted if the long attribute ID is exactly
  `38178040921`, so non-TEXT properties are left unchanged.
- Additional patch is separately opt-in; the original four-hook experiment
  remains unchanged. To test 28 hooks, enable both separate patches.
- No native/JNI, network, login, locale or resource patch is included.

## Exact binary test performed

Production Morphe Patcher 2.0 bundle from GitHub Actions, Morphe Desktop
1.19.0 stable, STRIP_SAFE mode, **two patches enabled**:

1. `TaobaoLingo: Native DinamicX English labels (experimental)`
2. `TaobaoLingo: Extended DinamicX subclass English labels (experimental)`

Morphe reported **2 patches applied, 0 failures**, and exactly **26 changed
class definitions** (2 original target classes plus 24 subclasses), out of
102,873. No unrelated libs were stripped.

Signed locally with a fresh disposable test key (never committed or
distributed), then verified with the **official Android SDK apksigner**:
V1 PASS, V2 PASS, V3 PASS. Candidate SHA-256:
`eaf84db7d440165f2e9f8e5891a3babbe5b19624991ff5a30374374acd74ba81`.

Independent bytecode verification against the original APK using the extended
mode of `tests/VerifyDinamicXNativeLabels.java`:

- Total method inventory identical, **595,518 implemented methods**.
- Exactly **28 altered methods**: the original four plus all 24 listed
  subclass TEXT handlers. **0 other methods** altered.
- Every original method's instruction sequence preserved as suffix,
  with unchanged register counts and exception-handler counts.
- All 28 prefixes contain the expected Chinese→English exact-match labels.
- All 26 TEXT-attribute prefixes contain the exact TEXT-only guard.
- Non-DEX app resources, including native shared libraries, unchanged.
- Verification complete without modifying any original APK source contents
  or uploading binaries to GitHub.

## Critical limitations

**No real Taobao UI text has yet been demonstrated in English.**
The new 24-subclass path has been *compiled, applied to the actual Taobao APK,
and independently verified*, but NOT exercised on an ARM64 Android device.
The separate Android 15 synthetic fixture tested only the original four
base hooks, not the extension. The 24 write-site candidates have not been
proven to represent visible text on the My Taobao page; this is an experiment
to close a concrete possible bypass, not a confirmed fix.

**Account navigation, login, signing identity checks and home-screen
rendering are still unresolved.** Every APK signed with a diagnostic key
differs from official Taobao's signer.

This experimental subclass extension is **disabled by default** in the patch
source; it is not a safe automatic upgrade to an installed Taobao application.
