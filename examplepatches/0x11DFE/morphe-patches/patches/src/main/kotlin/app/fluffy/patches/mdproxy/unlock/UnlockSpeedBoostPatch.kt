package app.fluffy.patches.mdproxy.unlock

import app.fluffy.patches.mdproxy.BoostInterstitialFlowFingerprint
import app.fluffy.patches.mdproxy.SelectedServerGetterFingerprint
import app.fluffy.patches.mdproxy.ServerRowBoostClickFingerprint
import app.fluffy.patches.shared.Constants.COMPATIBILITY_MDPROXY
import app.fluffy.patches.waypoint.clearBody
import app.fluffy.patches.waypoint.ensureRegisters
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val unlockSpeedBoostPatch = bytecodePatch(
    name = "Unlock Speed Boost",
    description = "Grants the per-server boost on tap instead of after an interstitial. " +
        "Same storage, rocket icon and toast as the ad flow. The 3-minute interstitial " +
        "while connected is gone as well. Use together with 'Remove Ads'.",
) {
    compatibleWith(COMPATIBILITY_MDPROXY)

    execute {
        val flow = BoostInterstitialFlowFingerprint
        val original = flow.originalMethod
            ?: throw PatchException("boost gate not found")

        // Resolve the R8-renamed helpers from the app's own call sites.
        fun callsOf(method: com.android.tools.smali.dexlib2.iface.Method) =
            method.implementation!!.instructions
                .filterIsInstance<ReferenceInstruction>()
                .mapNotNull { it.reference as? MethodReference }

        val mmkvGetter = callsOf(original)
            .firstOrNull { it.parameterTypes.isEmpty() && it.returnType == "Lcom/tencent/mmkv/MMKV;" }
            ?: throw PatchException("MMKV instance getter not found in boost gate")

        val boostedReader = callsOf(original)
            .firstOrNull {
                it.definingClass == mmkvGetter.definingClass &&
                    it.parameterTypes.isEmpty() &&
                    it.returnType == "Ljava/lang/String;"
            }
            ?: throw PatchException("BoostedServer reader not found in boost gate")

        val toast = callsOf(ServerRowBoostClickFingerprint.originalMethod)
            .firstOrNull {
                it.parameterTypes == listOf("Landroid/content/Context;", "Ljava/lang/String;") &&
                    it.returnType == "V"
            }
            ?: throw PatchException("toast helper not found in boost handler")

        val selRef = SelectedServerGetterFingerprint.originalMethod
            ?: throw PatchException("selected-server getter not found")
        val selectedServer = "${selRef.definingClass}->${selRef.name}()Ljava/lang/String;"

        flow.method.apply {
            clearBody()
            // v0-v6 scratch + p0/p1/p2 = 10 registers.
            ensureRegisters(10)
            addInstructions(
                0,
                """
                    if-eqz p2, :cond_mrp_done
                    invoke-static {}, $selectedServer
                    move-result-object v0
                    new-instance v1, Ljava/text/SimpleDateFormat;
                    const-string v2, "yyyy-MM-dd HH:mm:ss"
                    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;
                    move-result-object v3
                    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V
                    new-instance v2, Ljava/util/Date;
                    invoke-direct {v2}, Ljava/util/Date;-><init>()V
                    invoke-virtual {v1, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;
                    move-result-object v1
                    new-instance v2, Lorg/json/JSONObject;
                    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V
                    const-string v3, "name"
                    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
                    const-string v3, "dateCreated"
                    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
                    new-instance v3, Lorg/json/JSONArray;
                    invoke-static {}, ${boostedReader.definingClass}->${boostedReader.name}()Ljava/lang/String;
                    move-result-object v4
                    invoke-direct {v3, v4}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
                    invoke-virtual {v3, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
                    invoke-virtual {v3}, Lorg/json/JSONArray;->toString()Ljava/lang/String;
                    move-result-object v4
                    invoke-static {}, ${mmkvGetter.definingClass}->${mmkvGetter.name}()Lcom/tencent/mmkv/MMKV;
                    move-result-object v5
                    const-string v6, "BoostedServer"
                    invoke-virtual {v5, v6, v4}, Lcom/tencent/mmkv/MMKV;->i(Ljava/lang/String;Ljava/lang/String;)Z
                    const-string v6, "Server Boosted!!!"
                    invoke-static {p1, v6}, ${toast.definingClass}->${toast.name}(Landroid/content/Context;Ljava/lang/String;)V
                    :cond_mrp_done
                    return-void
                """.trimIndent(),
            )
        }

        println("MD Proxy: speed boost granted instantly without the interstitial")
    }
}
