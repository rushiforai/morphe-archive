# MyGate Surprise Delivery — Morphe patch source

An **unofficial, experimental** patch source for MyGate Android **7.31.0** (`com.mygate.user`). It replaces the built-in Raise Alert widget with a compact **Approve Delivery · 1 hour** widget. **Each tap submits one independent request** (queued if another submission is already pending).

**Use as a remote Morphe patch source**: open Morphe → **Sources** → **+** → **Remote**, then enter:

`https://github.com/chaosmanage/mygate-surprise-delivery-morphe-patches`

Or use the [Add to Morphe](https://morphe.software/add-source?github=chaosmanage/mygate-surprise-delivery-morphe-patches&app=com.mygate.user) deep link.

Morphe downloads the latest `.mpp` from the [GitHub Releases](https://github.com/chaosmanage/mygate-surprise-delivery-morphe-patches/releases) page and you can tap **Update** in Morphe to fetch new versions. No repeated downloads of `.mpp` files are required.

**Every tap creates a new request (v1.3.0).** While a previous approval is still processing, additional taps are queued and sent sequentially. Five taps initiate five requests. There is no approval cooldown or active-approval suppression. The MyGate backend may independently reject requests; successful approval of each cannot be guaranteed.

**v1.3.1 Android bundle fix:** Includes `classes.dex` for Morphe Manager, not just desktop JVM `.class` files. Earlier GitHub bundles could show 0 patches on Android. Each tap continues to initiate a separate request (no cooldown).

**v1.3.2 DNS fallback:** When Android cannot resolve `ack.mygate.in`, the patch tries the two public IPs that were checked against the same MyGate HTTPS hostname (104.18.14.11, 104.18.15.11). TLS certificate and hostname checks remain enabled. These Cloudflare IPs may change, and this fix does not guarantee network reachability or MyGate server acceptance. This does not contact any additional resolver, proxy, or service.

## Important limitations

- Works only with the specified **MyGate 7.31.0** APK. Start from that original APK when applying the patch.
- **One-tap approval is not confirmed working on a real device.** The code applies, builds, and signs through Morphe Desktop, but the earlier phone build reported a network/transport error. Version 1.3.0 retains session-refresh handling and error diagnostics, plus a rapid-tap request queue; a successful server-side approval is not yet verified.
- Requires your own valid MyGate login, eligible flat, internet connection, and server permission for Surprise Delivery. It does not bypass entitlement checks.
- Replaces the **Raise Alert** widget, rather than adding a second widget provider. Existing widgets may need to be removed and added again after patching.
- The patch modifies a third-party app; there is no endorsement or affiliation with MyGate or Morphe.
- **No APK, credential, signing key, or private user data is included in this repository.** The source contains only the patch implementation and build assets.

## Source and development

This repository uses the [official Morphe patches template](https://github.com/MorpheApp/morphe-patches-template). `patches/src/main/kotlin/com/mygate/quickpatch/QuickDeliveryPatch.kt` is the patch entry point; `extension-src/QuickApproveWidget.smali` is editable source for the bundled bytecode extension. Resources live in `patches/src/main/resources/`. The checked-in `mygate_quickapprove_extension.dex` is built from that `.smali` source.

For reproducible builds, install Java 21 and run:

```bash
git clone https://github.com/MorpheApp/morphe-patcher.git ../morphe-patcher
git -C ../morphe-patcher checkout 5003d688333c40317703d45a091a496d831dd27e
git clone https://github.com/MorpheApp/morphe-patches-gradle-plugin.git ../morphe-patches-gradle-plugin
git -C ../morphe-patches-gradle-plugin checkout 444bb41a1d841d9cd72a073397fc11ec96c7fcd3
./gradlew :patches:buildAndroid
```

Before building after a change to the smali extension, assemble it with `smali` to `patches/src/main/resources/mygate_quickapprove_extension.dex`. Morphe Desktop CLI can test the `.mpp` against MyGate version 7.31.0; authenticated network approval can only be verified on Android.

The [official release workflow](.github/workflows/release.yml) publishes new bundles and updates Morphe-compatible `patches-bundle.json` metadata when versioned commits are released. **Published releases are separate from passing live approval tests.**

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.3.2](https://github.com/chaosmanage/mygate-surprise-delivery-morphe-patches/releases/tag/v1.3.2)**&nbsp;&nbsp;&middot;&nbsp;&nbsp;`main`&nbsp;&nbsp;&middot;&nbsp;&nbsp;**1 patches** across **1 apps**&nbsp;&nbsp;&middot;&nbsp;&nbsp;[Full details](PATCHES.md)

| # | App | Patches | Version | Package |
|---|---|---|---|---|
| 1 | [**MyGate**](PATCHES.md#mygate-commygateuser) | 1 | `7.31.0` | [`com.mygate.user`](https://play.google.com/store/apps/details?id=com.mygate.user) |
<!-- PATCHES_END -->

Licensed under the GPL-3.0 license of the Morphe patches template.
