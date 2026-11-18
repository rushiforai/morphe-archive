# Verify Myspoti custom branding

Build the normal Dutch App Patches bundle with `./gradlew :patches:buildAndroid :patches:test`. Use the repository's normal authenticated build environment.
The resulting bundle contains the Myspoti patches, including the opt-in **Android Auto Up next** addition for original 2.3.0 / 1121, 2.4.0 / 1142 and 2.4.1 / 1175, and for Orpheon 1.0.0 / 1194; no separate pack is needed. On 2.4.0, 2.4.1 and Orpheon the native queue is kept and the default **Allow any Android Auto host** patch opens the library to every Android Auto host. **Android Auto Up next** can still restrict browsing to an explicit host package list. Queue research is tracked in `docs/research/2026-11-05-myspoti-up-next.md`, the 2.4.0 port in `docs/research/2026-11-07-myspoti-2.4.0-port.md` and the 2.4.1/Orpheon port in `docs/research/2026-11-13-myspoti-2.4.1-orpheon-port.md`.

Run the APK regression matrix against an original publisher APK:

```sh
python3 scripts/myspoti/verify_branding.py --bundle /path/to/patches.mpp --apk /path/to/myspoti.apk --cli /path/to/morphe-desktop-all.jar --aapt2 /path/to/sdk/build-tools/36.1.0/aapt2 --output /path/to/verification
```

Requires Java, Python 3, APKtool and Android SDK aapt2. The matrix checks every
icon, original branding, independent name/icon selection, punctuation and
icon-style names, resource-like names, and branding combined with the default
Android Auto host patch.
It rebuilds APKs, checks resolved labels, inspects manifest/resource references,
compares the bundled image bytes and proves branding-only outputs preserve DEX.
Outputs are unsigned APKs and a `verification.json` report. This does not install
an APK or verify a device launcher or signed-in account.

To use the bundle in Morphe, import the `.mpp`, select Myspoti or Orpheon and enable
**Custom branding**. Set **App name** and choose **App icon**. Keep **Allow any
Android Auto host** enabled if wanted. Original icon and an empty name preserve
those respective values. Repatch to change branding again.
