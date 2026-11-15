package app.template.patches.adguard

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.template.patches.shared.Constants
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val HELPER_NAME = "getPaidLicense"

/**
 * AdGuard - premium unlock.
 *
 * PlusManager is the only source of truth for license state, so every path that
 * can produce a non-premium state is closed here:
 *
 *   1. inject a static getPaidLicense() helper into PlusManager
 *   2. getCachedPlusState()      -> the helper
 *   3. setPlusState(incoming)    -> overwrite the argument, so a Free/Trial
 *                                   response can never reach cache or storage
 *   4. fetchAndUpdatePlusState() -> the helper  (license screen)
 *   5. fetchPlusStateForPromo()  -> the helper  (promo / check-license dialog)
 *   6. activateLicenseKey(key)   -> return early (skip backend re-verification)
 *
 * Layer 6 is applied through methodOrNull: if the build lacks the method the
 * patch still applies, and layers 2-5 keep premium state intact.
 */
@Suppress("unused")
val adGuardPremiumPatch = bytecodePatch(
    name = "Unlock AdGuard Premium",
    description = "Opens the paid features and removes the license prompts. " +
        "The app then reports a lifetime family license, so no purchase screen appears.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_ADGUARD)

    execute {
        // Guard: if the helper already exists this APK has been patched before.
        // Re-applying would stack a second copy of every injected block (the
        // dexlib2 API appends; it does not replace). Observed: setPlusState
        // grew 22 -> 26 -> 30 units on a double patch. Functionally harmless
        // but it makes the output depend on how many times it was run, so make
        // the patch a no-op instead.
        val alreadyPatched = GetPlusState.classDef.methods.any { it.name == HELPER_NAME }
        if (alreadyPatched) return@execute

        val paidLicenseType = PaidLicenseCtor.classDef.type
        val paidLicenseCtor = PaidLicenseCtor.method

        // Second constructor parameter is the LicenseType enum type.
        val licenseTypeClass = paidLicenseCtor.parameters[1].type

        // LicenseDuration.Lifetime is the singleton held by the only static field.
        val lifetimeField = LifetimeDuration.classDef.staticFields.first()

        val plusManagerType = GetPlusState.classDef.type
        val plusStateType = GetPlusState.method.returnType

        // -- 1. inject: PaidLicense("", Family, Lifetime, 1, 9, "") --------------
        val helper = ImmutableMethod(
            plusManagerType,
            HELPER_NAME,
            null,
            plusStateType,
            AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(7),
        ).toMutable().apply {
            addInstructions(
                0,
                """
                new-instance v0, $paidLicenseType
                const-string v1, ""
                sget-object v2, $licenseTypeClass->Family:$licenseTypeClass
                sget-object v3, $lifetimeField
                const/4 v4, 0x1
                const/16 v5, 0x9
                const-string v6, ""
                invoke-direct/range {v0 .. v6}, $paidLicenseCtor
                return-object v0
                """.trimIndent(),
            )
        }
        GetPlusState.classDef.methods.add(helper)

        val returnHelper = """
            invoke-static {}, $helper
            move-result-object v0
            return-object v0
        """.trimIndent()

        // -- 2. getCachedPlusState ----------------------------------------------
        GetPlusState.method.addInstructions(0, returnHelper)

        // -- 3. setPlusState: replace the incoming state -------------------------
        SetPlusState.method.addInstructions(
            0,
            """
            invoke-static {}, $helper
            move-result-object p1
            """.trimIndent(),
        )

        // -- 4. fetchAndUpdatePlusState -----------------------------------------
        FetchAndUpdatePlusState.method.addInstructions(0, returnHelper)

        // -- 5. fetchPlusStateForPromo ------------------------------------------
        FetchPlusStateForPromo.method.addInstructions(0, returnHelper)

        // -- 6. activateLicenseKey (optional) -----------------------------------
        ActivateLicenseKey.methodOrNull?.addInstructions(0, "return-void")
    }
}
