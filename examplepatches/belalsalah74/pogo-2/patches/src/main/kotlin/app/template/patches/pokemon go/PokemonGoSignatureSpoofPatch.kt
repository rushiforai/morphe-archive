package app.pokemongo

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private val COMPATIBILITY_POKEMON_GO_SIGNATURE_SPOOF = Compatibility(
    name = "Pokémon GO",
    packageName = "com.nianticlabs.pokemongo",
    targets = listOf(AppTarget(version = "0.431.0")),
)

private const val FAKE_SIGNATURE_PERMISSION = "android.permission.FAKE_PACKAGE_SIGNATURE"
private const val FAKE_SIGNATURE_META = "fake-signature"

/**
 * Hex of Niantic's original DER-encoded signing certificate (SHA-1
 * 321187995bc7cdc2b5fc91b11a96e2baa8602c62), read from the official 0.431.0 APK's
 * v3 signing block. This is the format PackageManager's "fake-signature"
 * mechanism expects (Signature(String hex)).
 */
private const val NIANTIC_CERT_HEX =
    "308203973082027fa00302010202044a471aa3300d06092a864886f70d01010b0500307c310b3009060355040613024341311330110603550408130a43616c69666f726e6961311630140603550407130d53616e204672616e636973636f31163014060355040a130d4e69616e7469632c20496e632e31163014060355040b130d4e69616e7469632c20496e632e3110300e06035504031307556e6b6e6f776e301e170d3136303331373230323834355a170d3433303830333230323834355a307c310b3009060355040613024341311330110603550408130a43616c69666f726e6961311630140603550407130d53616e204672616e636973636f31163014060355040a130d4e69616e7469632c20496e632e31163014060355040b130d4e69616e7469632c20496e632e3110300e06035504031307556e6b6e6f776e30820122300d06092a864886f70d01010105000382010f003082010a0282010100aa812842fa760977a5cbe876fe0c8ea4deaca00190a70db401a8dcc47cf043bcf4997c4031667d7c14168d28f5c3889469fad14e63e46605d6ebbfb4b5b1905effceb24345c9a5c30f5a5a6af0b794dcf5976f9f0157f780ca06576556bf7c412113e0d1edbfe9255010255dcd028a78e1c7fc337c361645d343f1ca5b7d467ba9704e43acd26351a50e9d2764d5f00349b48384e6aa960138cce0ce89541f8b76e2a8de8fab864469c7fe1a482c6237231b20e4708774adc36556ffc9da3b074c6b79b1b691b6d8605bcb3ab67379be4ca96714a36427e2709caa463534314a37e8d78b67bc5cd1e1d445ec2997e6e3ab1841fe16a720370f47d85b0fb155710203010001a321301f301d0603551d0e04160414635db1908868c07f63dd43c59bb123d733dfafc9300d06092a864886f70d01010b0500038201010045d516c8d4ed76a7bd37a3cc017e003ab4674c558b011dc5ed15e575075ff9af2c1d16234944b3d7b095b8b5c245c06cc0506c00934e305f493aa40f82e12d52f0ea61bf4c7229ea8ce071fba7c8799288f1cb4d91b1272d8bdd80d31a3e4256ceee58d4b572b5e44b0d554ebd11855f24ee50e73d712cd114bf15a7f2927c8045a5c69893259a35a63605066aa34429c753d6f8a744fd6e5b054a4f9f626e610657c0a5a0947747f382c8b8e9109cd2b1aa725f24d5bb53c1505933bd6c4a706f7510cd7def895e0a7d052fb54f405c4a2e221e065314e4dae10459145b9b115cd5a330b1c5a8cc49e77afd555b40868e7e453f0a74b415d556ba4baa001f55"

/**
 * For devices/ROMs with signature spoofing support (microG-style
 * FAKE_PACKAGE_SIGNATURE). Declares the permission and the "fake-signature"
 * metadata so the OS reports Niantic's certificate for this app. It does nothing on a
 * stock ROM, and the permission must still be granted on the device
 * (adb shell pm grant com.nianticlabs.pokemongo android.permission.FAKE_PACKAGE_SIGNATURE).
 * Keep the original package name; this patch does not rename it.
 */
@Suppress("unused")
val pokemonGoSpoofSignature = resourcePatch(
    name = "Spoof signature (ROM support)",
    description = "Adds FAKE_PACKAGE_SIGNATURE and fake-signature metadata with Niantic's original certificate " +
        "for ROMs/microG setups that support signature spoofing. Pokémon GO 0.431.0.",
) {
    compatibleWith(COMPATIBILITY_POKEMON_GO_SIGNATURE_SPOOF)

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.getElementsByTagName("manifest").item(0) as? Element
                ?: error("<manifest> not found in AndroidManifest.xml")
            val application = document.getElementsByTagName("application").item(0) as? Element
                ?: error("<application> not found in AndroidManifest.xml")

            // uses-permission (add once)
            val permissions = document.getElementsByTagName("uses-permission")
            var hasPermission = false
            for (i in 0 until permissions.length) {
                val node = permissions.item(i) as? Element ?: continue
                if (node.getAttribute("android:name") == FAKE_SIGNATURE_PERMISSION) {
                    hasPermission = true
                    break
                }
            }
            if (!hasPermission) {
                val permission = document.createElement("uses-permission")
                permission.setAttribute("android:name", FAKE_SIGNATURE_PERMISSION)
                manifest.insertBefore(permission, application)
            }

            // meta-data (replace any existing fake-signature entry)
            val metas = application.getElementsByTagName("meta-data")
            val stale = ArrayList<Element>()
            for (i in 0 until metas.length) {
                val node = metas.item(i) as? Element ?: continue
                if (node.getAttribute("android:name") == FAKE_SIGNATURE_META) stale.add(node)
            }
            stale.forEach { it.parentNode.removeChild(it) }

            val meta = document.createElement("meta-data")
            meta.setAttribute("android:name", FAKE_SIGNATURE_META)
            meta.setAttribute("android:value", NIANTIC_CERT_HEX)
            application.appendChild(meta)
        }
    }
}
