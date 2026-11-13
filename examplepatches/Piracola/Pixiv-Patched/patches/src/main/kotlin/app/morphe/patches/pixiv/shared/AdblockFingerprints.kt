package app.morphe.patches.pixiv.shared

import app.morphe.patcher.fingerprint
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val OVERLAY_AD_VIEW = "Ljp/pxv/android/feature/advertisement/view/OverlayAppLovinView;"
private const val INTERSTITIAL_AD = "Lcom/applovin/mediation/ads/MaxInterstitialAd;"

/** Named types only: a cast, an allocation or a call signature. Fields are invisible to it. */
private fun Method.referencesType(type: String): Boolean =
    implementation?.instructions?.any { instruction ->
        (instruction as? ReferenceInstruction)?.reference.let { it is TypeReference && it.type == type }
    } == true

private fun Method.callsMethod(owner: String, name: String, parameterCount: Int = -1): Boolean =
    implementation?.instructions?.any { instruction ->
        (instruction as? ReferenceInstruction)?.reference.let {
            it is MethodReference && it.definingClass == owner && it.name == name &&
                (parameterCount < 0 || it.parameterTypes.size == parameterCount)
        }
    } == true

/**
 * The constructor of Pixiv's per-screen banner binder: it inflates the four overlay ad views into a
 * frame and adds that frame to the screen. Its class name changes with every release, but the ad
 * view classes it builds live in a fixed package.
 */
internal val bannerBinderConstructorFingerprint = fingerprint {
    returns("V")
    custom { method, _ ->
        method.name == "<init>" &&
            method.referencesType(OVERLAY_AD_VIEW) &&
            method.callsMethod("Landroid/view/ViewGroup;", "addView", 1)
    }
}

/**
 * The "show the banner frame again" callback: a no-argument method of that same binder class which
 * calls `View.setVisibility` with a literal zero (VISIBLE). Its companion hider passes a different
 * constant, so the literal is what tells the two apart.
 */
internal val bannerShowFingerprint = fingerprint {
    returns("V")
    custom { method, classDef ->
        if (method.parameterTypes.isNotEmpty()) return@custom false
        val binder = classDef.methods.any { candidate ->
            candidate.name == "<init>" && candidate.referencesType(OVERLAY_AD_VIEW)
        }
        if (!binder) return@custom false
        val instructions = method.implementation?.instructions ?: return@custom false
        val hasVisibleConstant = instructions.any { instruction ->
            instruction.opcode == Opcode.CONST_4 &&
                (instruction as? NarrowLiteralInstruction)?.narrowLiteral == 0
        }
        hasVisibleConstant && method.callsMethod("Landroid/view/View;", "setVisibility")
    }
}

/** The AppLovin interstitial load entry: builds the ad object and calls `loadAd` in one method. */
internal val interstitialLoadFingerprint = fingerprint {
    returns("V")
    custom { method, _ ->
        method.parameterTypes.size == 1 &&
            method.referencesType(INTERSTITIAL_AD) &&
            method.callsMethod(INTERSTITIAL_AD, "loadAd")
    }
}
