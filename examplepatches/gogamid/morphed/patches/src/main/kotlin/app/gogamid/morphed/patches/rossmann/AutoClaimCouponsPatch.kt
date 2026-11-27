package app.gogamid.morphed.patches.rossmann

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.gogamid.morphed.patches.shared.Constants.COMPATIBILITY_ROSSMANN
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS = "Lapp/gogamid/morphed/extension/rossmann/RossmannAutoClaim;"
private const val COMPONENT = "Lde/rossmann/app/android/ui/DaggerRossmannApplication_HiltComponents_SingletonC\$SingletonCImpl;"
private const val ACTIVATE = "Lde/rossmann/app/android/business/coupon/ActivateCoupon;"

@Suppress("unused")
val autoClaimCouponsPatch = patch(
    name = "Auto claim coupons",
    description = "Activates eligible coupons as they load, including in the Coupons tab, and notifies you when Rossmann confirms activation.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ROSSMANN)
    extendWith("extensions/extension.mpe")

    execute {
        val onCreate = RossmannApplicationOnCreateFingerprint.method
        val preload = onCreate.implementation!!.instructions.withIndex().single { (_, instruction) ->
            val method = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            method?.definingClass == "Lde/rossmann/app/android/ui/sideeffects/CartImagesPreloading;" &&
                method.name == "a" && method.parameterTypes.isEmpty() && method.returnType == "V"
        }
        // After startup but before the debug-only return paths. v1 is overwritten next,
        // v4 is dead, and v0 must remain intact for the app's debug exception handler.
        onCreate.addInstructions(
            preload.index + 1,
            """
                invoke-virtual {p0}, Lde/rossmann/app/android/ui/Hilt_RossmannApplication;->C0()Ljava/lang/Object;
                move-result-object v1
                check-cast v1, $COMPONENT
                invoke-virtual {v1}, $COMPONENT->n()$ACTIVATE
                move-result-object v1
                sget-object v4, Lkotlin/coroutines/EmptyCoroutineContext;->a:Lkotlin/coroutines/EmptyCoroutineContext;
                invoke-static {p0, v1, v4}, $EXTENSION_CLASS->register(Landroid/content/Context;${ACTIVATE}Lkotlin/coroutines/CoroutineContext;)V
            """.trimIndent(),
        )

        CouponDisplayModelFingerprint.method.addInstructions(
            0,
            "invoke-static {p0}, $EXTENSION_CLASS->onCoupon(Lde/rossmann/app/android/models/coupon/Coupon;)V",
        )
        CouponDisruptorCreateFingerprint.method.addInstructions(
            0,
            "invoke-static {p0}, $EXTENSION_CLASS->onCoupons(Ljava/util/List;)V",
        )
    }
}
