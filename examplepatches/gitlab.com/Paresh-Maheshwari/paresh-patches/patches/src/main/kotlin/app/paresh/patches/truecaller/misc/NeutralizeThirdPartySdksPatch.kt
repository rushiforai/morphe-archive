package app.paresh.patches.truecaller.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.paresh.patches.truecaller.shared.Constants.COMPATIBILITY_TRUECALLER
import com.android.tools.smali.dexlib2.AccessFlags

// --- Fingerprints for obfuscated classes ---

// CleverTap wrapper factory — returns object, takes Context + CleverTapInstanceConfig + obfuscated
private object CleverTapFactoryFingerprint : Fingerprint(
    returnType = "L",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf(
        "Landroid/content/Context;",
        "Lcom/clevertap/android/sdk/CleverTapInstanceConfig;",
        "L",
    ),
)

// Vungle/LiftoffMonetize init — static final, takes Context + String + listener interface
private object VungleInitFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "L",
    ),
    custom = { _, classDef ->
        classDef.type.startsWith("Lcom/vungle/ads/")
    },
)

// Mintegral init — implements MBridgeSDK interface, init(Map, Context)
private object MintegralInitFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("Ljava/util/Map;", "Landroid/content/Context;"),
    custom = { _, classDef ->
        classDef.interfaces.contains("Lcom/mbridge/msdk/MBridgeSDK;")
    },
)

// Presence stream start — implements PresenceManager, no params, final void
private object PresenceStreamFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
    custom = { method, classDef ->
        classDef.interfaces.contains("Lcom/truecaller/presence/PresenceManager;")
                && method.implementation != null
                && method.implementation!!.registerCount >= 4
    },
)

@Suppress("unused")
val neutralizeThirdPartySdksPatch = bytecodePatch(
    name = "Neutralize third-party SDKs",
    description = "Disables telemetry, ad, and tracking SDK initializations. Fixes #84.",
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        // 1. Microsoft Clarity — return null
        mutableClassDefBy("Lcom/microsoft/clarity/Clarity;").methods
            .first { it.name == "initialize" && it.parameterTypes.size == 2 }
            .addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")

        // 2. CleverTap — return null
        CleverTapFactoryFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")

        // 3. AppsFlyer — return void
        mutableClassDefBy("Lcom/appsflyer/internal/AFa1ySDK;").methods
            .first { it.name == "start" && it.parameterTypes.size == 1 && it.parameterTypes[0] == "Landroid/content/Context;" }
            .returnEarly()

        // 4. Moloco — return void
        mutableClassDefBy("Lcom/moloco/sdk/publisher/Moloco;").methods
            .first { it.name == "initialize" && it.parameterTypes.size == 2 }
            .returnEarly()

        // 5. Huawei HMS InitProvider — return true
        mutableClassDefBy("Lcom/huawei/hms/aaid/InitProvider;").methods
            .first { it.name == "onCreate" && it.returnType == "Z" }
            .returnEarly(true)

        // 6. Freshchat — return false
        mutableClassDefBy("Lcom/freshchat/consumer/sdk/Freshchat;").methods
            .first { it.name == "init" && it.returnType == "Z" }
            .returnEarly(false)

        // 7. InMobi — return void
        mutableClassDefBy("Lcom/inmobi/sdk/InMobiSdk;").methods
            .first { it.name == "init" && it.parameterTypes.size == 4 }
            .returnEarly()

        // 8. Appnext — return void
        mutableClassDefBy("Lcom/appnext/nexdk/AppnextSDK;").methods
            .first { it.name == "initialize" && it.parameterTypes.size == 1 }
            .returnEarly()

        // 9. Vungle — return void
        VungleInitFingerprint.method.returnEarly()

        // 10. Fyber — return void
        mutableClassDefBy("Lcom/fyber/inneractive/sdk/external/InneractiveAdManager;").methods
            .first { it.name == "initialize" && it.parameterTypes.size == 3 }
            .returnEarly()

        // 11. Mintegral — return void
        MintegralInitFingerprint.method.returnEarly()

        // 12. IronSource — return void
        mutableClassDefBy("Lcom/ironsource/mediationsdk/IronSource;").methods
            .first { it.name == "init" && it.parameterTypes.size == 4 }
            .returnEarly()

        // 13. PubNative HyBid — return void
        mutableClassDefBy("Lnet/pubnative/lite/sdk/HyBid;").methods
            .first { it.name == "initialize" && it.parameterTypes.size == 3 }
            .returnEarly()

        // 14. Presence gRPC stream — return void
        PresenceStreamFingerprint.method.returnEarly()

        // 15. Google ML Kit — return empty list
        mutableClassDefBy("Lcom/google/mlkit/common/internal/CommonComponentRegistrar;").methods
            .first { it.name == "getComponents" && it.returnType == "Ljava/util/List;" }
            .addInstructions(0, """
                new-instance v0, Ljava/util/ArrayList;
                invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
                return-object v0
            """)
    }
}
