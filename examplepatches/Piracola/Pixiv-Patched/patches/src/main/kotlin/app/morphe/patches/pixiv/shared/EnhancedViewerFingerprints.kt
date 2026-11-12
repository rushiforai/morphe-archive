package app.morphe.patches.pixiv.shared

import app.morphe.patcher.fingerprint
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PIXIV_IMAGE_VIEW = "Ljp/pxv/android/feature/commonlist/view/PixivImageView;"
private const val PAGER_ADAPTER = "Landroidx/viewpager/widget/PagerAdapter;"
private const val DRAWABLE = "Landroid/graphics/drawable/Drawable;"
private const val PROGRESS_BAR = "Landroid/widget/ProgressBar;"

/**
 * The fullscreen artwork viewer's pager entry: `instantiateItem(ViewGroup, int)Object`.
 *
 * The adapter class is renamed on every Pixiv release, so it is recognised by what it builds - a
 * `PagerAdapter` callback that takes a `PixivImageView` and adds that page to the pager. Pixiv's
 * other `PagerAdapter`, the one that hosts fragments, has the same callback shape but never touches
 * an image view.
 */
internal val fullScreenPagerItemFingerprint = fingerprint {
    returns("Ljava/lang/Object;")
    parameters("Landroid/view/ViewGroup;", "I")
    custom { method, classDef ->
        classDef.superclass == PAGER_ADAPTER &&
            method.referencesType(PIXIV_IMAGE_VIEW) &&
            method.callsMethod("Landroid/view/ViewGroup;", "addView", 1)
    }
}

/**
 * The Glide target that receives one page's full resolution drawable: `onResourceReady(Object, ...)`.
 *
 * Pixiv has several such targets, all renamed with the release. The fullscreen page's is the one
 * that also hides the page's loading `ProgressBar`, and that is exactly the moment the placeholder
 * has to step aside.
 */
internal val fullResTargetFingerprint = fingerprint {
    returns("V")
    custom { method, _ ->
        method.parameterTypes.size == 2 &&
            method.referencesType(PIXIV_IMAGE_VIEW) &&
            method.referencesType(DRAWABLE) &&
            method.referencesType(PROGRESS_BAR)
    }
}

/** True when the method names the type anywhere: a cast, an allocation or a signature of a call. */
private fun Method.referencesType(type: String): Boolean =
    implementation?.instructions?.any { instruction ->
        when (val reference = (instruction as? ReferenceInstruction)?.reference) {
            is TypeReference -> reference.type == type
            is MethodReference ->
                reference.definingClass == type ||
                    reference.returnType == type ||
                    reference.parameterTypes.any { it.toString() == type }
            is FieldReference -> reference.type == type
            else -> false
        }
    } == true

private fun Method.callsMethod(owner: String, name: String, parameterCount: Int = -1): Boolean =
    implementation?.instructions?.any { instruction ->
        (instruction as? ReferenceInstruction)?.reference.let {
            it is MethodReference && it.definingClass == owner && it.name == name &&
                (parameterCount < 0 || it.parameterTypes.size == parameterCount)
        }
    } == true
