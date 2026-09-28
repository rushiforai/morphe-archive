package app.template.patches.ninegag.ad

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.ninegag.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import app.template.patches.ninegag.shared.COMPATIBILITY_NINEGAG

/**
 * Prevents the app-owned bottom-adhesion banner initializer from registering its
 * lifecycle collector. The old collector constructs an AdView even after the
 * ads-enabled flow emits false. All three callers pass a dedicated banner frame:
 * HomeActivity.bannerAd, SwipeablePostCommentsActivity.bannerAdContainer, and
 * StandaloneHomeContainerActivity's adview_adhesion_banner_container.
 *
 * This does not modify a shared Android widget or an advertising SDK method.
 */
val hideBottomBannerPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_NINEGAG)

    execute {
        val candidates = mutableListOf<Pair<ClassDef, Method>>()
        val expectedFlags = AccessFlags.PUBLIC.value or
            AccessFlags.STATIC.value or AccessFlags.FINAL.value

        classDefForEach { classDef ->
            if (classDef.type != "Lo02;") return@classDefForEach
            classDef.methods.forEach { method ->
                if (method.name != "i" || method.returnType != "V" ||
                    method.accessFlags != expectedFlags ||
                    method.parameterTypes.map { it.toString() } !=
                    listOf("Landroid/widget/FrameLayout;", "Lmc;")
                ) return@forEach

                val references = method.implementation?.instructions
                    ?.mapNotNull { (it as? ReferenceInstruction)?.reference }
                    ?: return@forEach
                val strings = references.filterIsInstance<StringReference>()
                    .map { it.string }
                val calls = references.filterIsInstance<MethodReference>()
                if ("View must have a parent lifecycle" !in strings ||
                    !calls.any {
                        it.definingClass == "Landroid/view/View;" &&
                            it.name == "isAttachedToWindow"
                    } ||
                    !calls.any {
                        it.definingClass == "Landroid/view/View;" &&
                            it.name == "addOnAttachStateChangeListener"
                    } ||
                    !calls.any {
                        it.definingClass == "Lkotlinx/coroutines/BuildersKt;" &&
                            it.name == "launch\$default"
                    }
                ) return@forEach
                candidates += classDef to method
            }
        }

        check(candidates.size == 1) {
            "Expected one dedicated 9GAG 8.23.0 bottom banner initializer; " +
                "found ${candidates.size}"
        }
        val (classDef, originalMethod) = candidates.single()
        val method = mutableClassDefBy(classDef).findMutableMethodOf(originalMethod)
        // Two single-register static parameters; reserve v0/v1 only when they
        // are genuine locals. The inspected APK has 11 registers (9 locals).
        check((method.implementation?.registerCount ?: 0) >= 4) {
            "Bottom banner initializer lacks the expected local registers"
        }
        method.addInstructions(
            0,
            """
                move-object/from16 v1, p0
                const/16 v0, 0x8
                invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V
                invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V
                return-void
            """
        )
    }
}
