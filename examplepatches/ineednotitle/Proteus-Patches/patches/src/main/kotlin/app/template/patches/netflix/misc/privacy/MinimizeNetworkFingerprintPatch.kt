package app.template.patches.netflix.misc.privacy

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.netflix.nativehook.bundleGadgetPatch
import app.template.patches.shared.Constants.NETFLIX_COMPATIBILITY

// ─────────────────────────────────────────────────────────────────────────────
// Minimize local-network fingerprinting (OPT-IN, default OFF).
//
// The appboot builds a device signal `u.ifList` from the nrdp native interface
// list — function c() maps each interface to
//   {connected, default, ip:e.ipAddress, ipv6:i(e), mac:e.macAddress,
//    name:e.ifname, ssid:e.ssid, type:e.physicalLayerType}
// i.e. it reports your LOCAL IP(s), MAC address and Wi-Fi SSID. This patch, when
// enabled, flips the FP_ENABLED flag in the bundled ad-kill script so its runtime
// FP pass blanks ip/ipv6/mac/ssid (keeping the harmless ifname/type) before the
// signal is sent — reducing what the app fingerprints about your network.
//
// HONEST SCOPE: this only changes what is REPORTED, not the device's real
// networking. It does NOT stop Netflix's server-side "household / I'm traveling"
// check — that is driven by your PUBLIC IP, which the servers see on every
// connection regardless of the app (only a VPN/proxy changes that).
//
// Delivery: the FP pass lives in the gadget's bundled script
// (lib/armeabi-v7a/libgadget.script.so) shipped OFF; this patch just turns it on,
// so it composes with the ad kills without a second script.
//
// CREDIT: ported from ajstrick81/morphe-androidtv-patches (GPL-3.0).
// ─────────────────────────────────────────────────────────────────────────────
@Suppress("unused")
val minimizeNetworkFingerprintPatch = resourcePatch(
    name = "Minimize Network Fingerprint",
    description = "Blanks the local IP / MAC / Wi-Fi SSID the Netflix app reports about your " +
        "network (keeps interface name/type) and stops the app from reporting your advertising " +
        "ID (GAID) in its ad-collection telemetry. Reduces network + ad fingerprinting. Does NOT " +
        "stop the server-side \"I'm traveling\"/household check (that's driven by your public IP " +
        "— use a VPN for that). Opt-in / experimental; test on-device.",
    default = false,
) {
    compatibleWith(NETFLIX_COMPATIBILITY)

    // The ad-kill gadget must have written the bundled script first.
    dependsOn(bundleGadgetPatch)

    execute {
        val script = get("lib/armeabi-v7a/libgadget.script.so")
        var text = script.readText()
        require(text.contains("FP_ENABLED=false")) {
            "minimizeNetworkFingerprintPatch: FP_ENABLED flag not found in bundled script — " +
                "killads.js/BundleGadgetPatch out of sync."
        }
        require(text.contains("GAID_ENABLED=false")) {
            "minimizeNetworkFingerprintPatch: GAID_ENABLED flag not found in bundled script — " +
                "killads.js/BundleGadgetPatch out of sync."
        }
        text = text.replaceFirst("FP_ENABLED=false", "FP_ENABLED=true")
        text = text.replaceFirst("GAID_ENABLED=false", "GAID_ENABLED=true")
        script.writeText(text)
    }
}
