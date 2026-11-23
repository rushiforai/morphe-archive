package patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal data class AdvertisingUi2703Target(
    val owner: String, val name: String, val returnType: String,
    val marker: String, val reference: String,
)

/** Dedicated display placements complement the restored audio/preroll controls. */
internal val advertisingUi2703Targets = listOf(
    AdvertisingUi2703Target("LIlIIlIIIlIllll;", "IIlIlIlIlIllllll", "Z", "banner",
        "Lcom/deezer/feature/ads/config/model/AdsConfigDataModel;->getConfig()Ljava/util/HashMap;"),
    AdvertisingUi2703Target("LIIIIlIIlIllllII;", "IIlllIlllIlll", "V",
        "/104134276/deezer_app_android_phone/homepage/native1/",
        "Lcom/google/android/gms/ads/AdLoader${'$'}Builder;->build()Lcom/google/android/gms/ads/AdLoader;"),
)

internal fun hideAdvertisingUi2703(method: MutableMethod) {
    val target = advertisingUi2703Targets.singleOrNull {
        method.definingClass == it.owner && method.name == it.name &&
            method.returnType == it.returnType && method.parameterTypes.isEmpty()
    } ?: error("Deezer cosmetic advertising placement changed")
    val code = method.instructions.toList()
    check(code.isNotEmpty() && method.implementation!!.registerCount > 0 &&
        code.first().opcode != Opcode.RETURN_VOID &&
        !(code.first().opcode == Opcode.CONST_4 && code.getOrNull(1)?.opcode == Opcode.RETURN)) {
        "Deezer cosmetic advertising placement already hidden or changed"
    }
    check(code.any { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == target.marker } &&
        code.any { (it as? ReferenceInstruction)?.reference?.toString() == target.reference }) {
        "Deezer cosmetic advertising placement evidence changed"
    }
    // The banner predicate controls local AdView placement. The Home method only requests
    // its native display ad. No ad-completion callback or playback continuation is invoked.
    method.addInstructions(0, if (target.returnType == "Z") "const/4 v0, 0x0\nreturn v0" else "return-void")
}

@Suppress("unused")
val deezerRemoveAdvertising = bytecodePatch(
    name = "Remove advertising",
    description = "Removes display, audio, preroll and video advertising using Deezer's existing " +
        "no-ad paths and playback continuation.",
    default = true,
) {
    compatibleWith(deezer)
    dependsOn(deezerBase)
    execute {
        // Restore the 26 audio/preroll paths alongside the newer display controls.
        val emptyMap = "new-instance v0, Ljava/util/HashMap;\n" +
            "invoke-direct {v0}, Ljava/util/HashMap;-><init>()V\nreturn-object v0"
        for (name in listOf("getConfig", "getSections")) {
            exact("Lcom/deezer/feature/ads/config/model/AdsConfigDataModel;", name,
                "Ljava/util/HashMap;").method.addInstructions(0, emptyMap)
        }
        exact("LIIlIllIIllllll;", "IIlllIIlIIllIIII", "V", "Ljava/lang/Runnable;", "Z", "Z")
            .method.addInstructions(0,
                "invoke-interface/range {p1 .. p1}, Ljava/lang/Runnable;->run()V\nreturn-void")
        exact("LIIllIlIllIlllIII;", "IllIlIlIIlIllIll", "V", "Landroid/content/Intent;")
            .method.addInstructions(0, "return-void")
        exact("LlIIIlIIIIIlIlII;", "IIlIlIlIlIllllll", "V").method.addInstructions(0,
            "const/4 v0, 0x0\niput-object v0, p0, LlIIIlIIIIIlIlII;->IlIllIIIlIIIlIIl:LIIlIllIllIllllIl;\nreturn-void")
        closeAfterSuperOnCreate("Lcom/deezer/feature/ads/audio/model/video/VideoAdsActivity;")
        closeAfterSuperOnCreate("Lcom/deezer/feature/ads/audio/model/vast/VastVideoAdsActivity;")
        advertisingUi2703Targets.forEach { target ->
            hideAdvertisingUi2703(exact(target.owner, target.name, target.returnType).method)
        }
    }
}
