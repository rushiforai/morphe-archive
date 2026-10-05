package app.riky.patches.capcut

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.riky.patches.shared.Constants.COMPATIBILITY_CAPCUT
import org.w3c.dom.Element

private const val VPN_SERVICE = "app.riky.extension.capcut.tunnel.WireGuardVpnService"
private const val VPN_CONSENT = "app.riky.extension.capcut.tunnel.VpnConsentActivity"
private const val TUNNEL_IMPORT = "app.riky.extension.capcut.tunnel.TunnelImportActivity"
private val payloadClass = object {}.javaClass

/**
 * Manifest + native payload for the CapCut-scoped WireGuard tunnel.
 * ABI set follows libs already present in the target APK when staged;
 * otherwise falls back to CapCut 9.0.0's known ARM ABIs.
 */
internal val capcutNetworkTunnelResourcesPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { doc ->
            val manifest = doc.documentElement
            val application = doc.getElementsByTagName("application").item(0) as Element
            if (manifest.hasAttribute("split") || application.getAttribute("android:isSplitRequired") == "true") {
                throw PatchException(
                    "CapCut network tunnel needs a merged APK. Open the complete APK, not a split.",
                )
            }
            application.setAttribute("android:extractNativeLibs", "true")

            listOf(
                "INTERNET",
                "ACCESS_NETWORK_STATE",
                "FOREGROUND_SERVICE",
                "FOREGROUND_SERVICE_SYSTEM_EXEMPTED",
                "POST_NOTIFICATIONS",
            ).forEach { name ->
                val permission = "android.permission.$name"
                val existing = doc.getElementsByTagName("uses-permission")
                if ((0 until existing.length).none {
                        (existing.item(it) as Element).getAttribute("android:name") == permission
                    }
                ) {
                    manifest.appendChild(
                        doc.createElement("uses-permission").apply {
                            setAttribute("android:name", permission)
                        },
                    )
                }
            }

            application.appendChild(
                doc.createElement("service").apply {
                    setAttribute("android:name", VPN_SERVICE)
                    setAttribute("android:permission", "android.permission.BIND_VPN_SERVICE")
                    setAttribute("android:exported", "false")
                    setAttribute("android:foregroundServiceType", "systemExempted")
                    appendChild(
                        doc.createElement("intent-filter").apply {
                            appendChild(
                                doc.createElement("action").apply {
                                    setAttribute("android:name", "android.net.VpnService")
                                },
                            )
                        },
                    )
                    appendChild(
                        doc.createElement("meta-data").apply {
                            setAttribute("android:name", "android.net.VpnService.SUPPORTS_ALWAYS_ON")
                            setAttribute("android:value", "false")
                        },
                    )
                },
            )

            application.appendChild(
                doc.createElement("activity").apply {
                    setAttribute("android:name", VPN_CONSENT)
                    setAttribute("android:exported", "false")
                    setAttribute("android:excludeFromRecents", "true")
                    setAttribute("android:theme", "@android:style/Theme.Translucent.NoTitleBar")
                },
            )

            application.appendChild(
                doc.createElement("activity").apply {
                    setAttribute("android:name", TUNNEL_IMPORT)
                    setAttribute("android:exported", "true")
                    setAttribute("android:excludeFromRecents", "true")
                    setAttribute(
                        "android:theme",
                        "@android:style/Theme.DeviceDefault.Light.NoActionBar",
                    )
                },
            )
        }

        val supported = setOf("arm64-v8a", "armeabi-v7a", "x86", "x86_64")
        val staged = get("lib").listFiles()?.filter { it.isDirectory }?.map { it.name }.orEmpty()
        val abis = when {
            staged.isEmpty() -> listOf("arm64-v8a", "armeabi-v7a") // CapCut 9.0.0; natives may not be staged
            staged.any { it !in supported } ->
                throw PatchException("CapCut network tunnel cannot determine supported target ABIs: $staged")
            else -> staged
        }
        abis.forEach { abi ->
            val path = "/wireguard/native/$abi/libwg-go.so"
            val source = payloadClass.getResourceAsStream(path)
                ?: throw PatchException("Missing WireGuard native payload for $abi")
            val destination = get("lib/$abi/libwg-go.so")
            if (destination.exists()) throw PatchException("Target already contains libwg-go.so")
            destination.parentFile.mkdirs()
            source.use { input -> destination.outputStream().use { input.copyTo(it) } }
        }

        listOf(
            "NOTICE",
            "Apache-2.0.txt",
            "MIT-wireguard-go.txt",
            "AndroidX-Apache-2.0.txt",
            "Kotlin-Apache-2.0.txt",
            "Go-BSD.txt",
            "Go-crypto-BSD.txt",
            "Go-net-BSD.txt",
            "Go-sys-BSD.txt",
        ).forEach { name ->
            val source = payloadClass.getResourceAsStream("/wireguard/licenses/$name")
                ?: throw PatchException("Missing WireGuard notice: $name")
            val destination = get("assets/riky-tunnel/$name")
            destination.parentFile.mkdirs()
            source.use { input -> destination.outputStream().use { input.copyTo(it) } }
        }

        // Optional private tester conf (Option 1b). Never commit real keys —
        // place at patches/src/main/resources/capcut-tunnel/default.conf (gitignored).
        payloadClass.getResourceAsStream("/capcut-tunnel/default.conf")?.use { input ->
            val destination = get("assets/riky-tunnel/default.conf")
            destination.parentFile.mkdirs()
            destination.outputStream().use { input.copyTo(it) }
        }
    }
}

@Suppress("unused")
val capcutNetworkTunnelPatch = bytecodePatch(
    name = "CapCut network tunnel",
    description = "Opt-in CapCut-only WireGuard tunnel. Import your own wg-quick .conf "
        + "(paste or file) in-app; traffic is scoped to CapCut only. "
        + "Requires Android VPN consent once. Independent of Unlock Premium.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_CAPCUT)
    dependsOn(capcutNetworkTunnelResourcesPatch)
    extendWith("extensions/extension.mpe")

    execute {
        ScaffoldApplicationOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static/range {p0 .. p0}, " +
                "Lapp/riky/extension/capcut/tunnel/WireGuardManager;" +
                "->initialize(Landroid/content/Context;)V",
        )
    }
}
