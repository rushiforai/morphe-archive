package app.revanced.patches.tarotcounter

import com.android.tools.smali.dexlib2.AccessFlags
import app.morphe.patcher.fingerprint
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Version 3.12.4 moved the ad-unit IDs from helper methods into string resources.
// Its banner loader and app-open loader are the current bytecode equivalents.
internal val bannerAdLoaderFingerprint = fingerprint {
    accessFlags(AccessFlags.PUBLIC)
    parameters(
        "Lnet/aasuited/belotescore/base/ABaseActivity;",
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Landroid/widget/FrameLayout;",
        "Z",
    )
    custom { method, _ ->
        method.returnType.first() == 'L' &&
            method.implementation?.instructions
                ?.filterIsInstance<ReferenceInstruction>()
                ?.mapNotNull { it.reference as? MethodReference }
                ?.let { references ->
                    references.any { it.definingClass == "Lcom/google/android/gms/ads/AdView;" && it.name == "<init>" } &&
                        references.any { it.name == "setAdUnitId" }
                } == true
    }
}

internal val openAdLoadFingerprint = fingerprint {
    accessFlags(AccessFlags.PUBLIC, AccessFlags.FINAL)
    returns("V")
    custom { method, _ ->
        method.parameterTypes.isEmpty() &&
            method.implementation?.instructions
                ?.filterIsInstance<ReferenceInstruction>()
                ?.mapNotNull { it.reference as? MethodReference }
                ?.any {
                    it.name == "load" &&
                        it.returnType == "V" &&
                        it.parameterTypes.take(2) == listOf("Landroid/content/Context;", "Ljava/lang/String;")
                } == true
    }
}
