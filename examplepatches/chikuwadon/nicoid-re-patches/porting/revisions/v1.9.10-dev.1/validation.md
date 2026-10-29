# v1.9.10-dev.1 verification revision

Baseline: official v1.9.9. No main-branch or release change.

Implemented: ranking captions including API ranking paths and reflected toolbar access (#89); texture-backed popup output with post-layout scaling of retained frames (#90); invisible collapse gesture target (#91); unified explicit background-entry routing (#92); independent horizontal-video-swipe setting (#93); final settings placement; search form content sizing; bounded tab swipe presentation; redundant view, icon and preference work reductions; playlist snapshot/count reuse; unchanged feed restoration.

Tab swipe scope: cached same-host pages use live Views. Cross-Activity pages use a bounded preview of an already loaded page (or its label when unavailable), and perform the existing Activity route only after settlement. This is not a completed migration of every screen to a shared host. No neighboring search request is started solely for a drag. Physical-device smoothness and media playback regression remain unverified.

Validation: 34 Robolectric tests across SDK 28 and 34 passed; 48,818 invocation-word checks and 11,612 defined-target dispatch checks passed; 800 PNG entries and 28 icon families preserve legacy bitmap contracts; original extension payload/input hashes/translations retained. Existing playback-policy (139 checks), ranking-filter and content/history suites passed. No emulator, physical device, Cast receiver or live account/API regression was available.

Log finding: the supplied log records EOS around 10:16:40 and window resizing afterwards, with player release only at close around 10:16:47. It also reports repeated drawable-owner warnings; icon ConstantState cloning was added. The log does not prove the exact renderer matrix state.

MPP SHA256: a72f5ca15cbc7f49c59b0eb4f5e180e7f1f44a6ef0293156b72f0b77f490ad0f

Rebuild: this revision uses a staged baseline workspace. Place official v1.9.9 as base.mpp, decode its helpers/native/executor DEX into those named directories with baksmali 2.5.2, overlay native-overrides onto native, convert baseline helpers to helpers.jar with dex2jar 2.4, and provide tools/ecj.jar (3.38), tools/r8.jar (8.3.37), tools/android.jar (android-all 14), plus the smali 2.5.2 classpath in tools. resources.zip is baseline resources with the search root and scroll child layout_height values at byte offsets 724 and 916 changed from -1 to -2. Run build.py; it uses Java 17. verify.py additionally uses runtime-classpath.txt and Robolectric 4.13 with SDK 28/34 instrumentation i6. No private log or credentials are stored in this revision.
