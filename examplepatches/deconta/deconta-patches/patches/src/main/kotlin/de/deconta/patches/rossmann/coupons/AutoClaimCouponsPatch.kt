package de.deconta.patches.rossmann.coupons

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import de.deconta.patches.shared.Constants.COMPATIBILITY_ROSSMANN
import de.deconta.patches.shared.ROSSMANN_EXTENSION
import de.deconta.patches.shared.mutableMethod
import de.deconta.patches.shared.parameterTypeNames

private const val EXTENSION = "Lde/deconta/extension/rossmann/AutoClaimCoupons;"
private const val COUPONS_FRAGMENT = "Lde/rossmann/app/android/ui/coupon/CouponsFragment;"

@Suppress("unused")
val autoClaimCouponsPatch = bytecodePatch(
    name = "Auto claim coupons",
    description = "Aktiviert automatisch alle verfuegbaren Coupons beim Laden der Coupon-Liste.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ROSSMANN)

    extendWith(ROSSMANN_EXTENSION)

    execute {
        val fragmentClass = classDefByOrNull(COUPONS_FRAGMENT)
            ?: throw PatchException("$COUPONS_FRAGMENT not found")

        val uiMethod = fragmentClass.methods.singleOrNull { method ->
            method.name == "L" && method.parameterTypeNames() == listOf("Ljava/lang/Object;")
        } ?: throw PatchException("$COUPONS_FRAGMENT: L(Object) method not found")

        val method = mutableMethod(fragmentClass, uiMethod)

        method.addInstructions(
            0,
            """
                invoke-static {p0, p1}, $EXTENSION->onCouponsLoaded(Ljava/lang/Object;Ljava/lang/Object;)V
            """,
        )
    }
}
