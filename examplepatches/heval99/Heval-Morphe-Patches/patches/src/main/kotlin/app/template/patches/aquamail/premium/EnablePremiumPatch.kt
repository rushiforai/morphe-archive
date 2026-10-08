package app.template.patches.aquamail.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.aquamail.premium.GetLicenseDataFingerprint
import app.template.patches.shared.Constants.COMPATIBILITY_AQUAMAIL
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val LICENSE_DATA = "Lorg/kman/AquaMail/licensing/LicenseData;"

private fun MutableMethod.instructionsOf() =
    implementation?.instructions?.toList().orEmpty()

// The (J)Z checks on LicenseData that the licensed combinator (b()) calls on p0.
private fun MutableMethod.longBooleanCallees(licenseDataType: String): List<MethodReference> =
    instructionsOf().mapNotNull { insn ->
        val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
        ref?.takeIf {
            it.definingClass == licenseDataType && it.returnType == "Z" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("J")
        }
    }

private fun MutableClass.methodByName(name: String): MutableMethod? =
    methods.firstOrNull { it.name == name && it.returnType == "Z" && it.implementation != null }

// The single long (J) instance field a (J)Z check compares the time parameter against.
private fun MutableMethod.longFieldRead(): String? =
    instructionsOf().mapNotNull { insn ->
        if (insn.opcode == Opcode.IGET_WIDE) {
            ((insn as? ReferenceInstruction)?.reference as? FieldReference)?.name
        } else {
            null
        }
    }.singleOrNull()

// Issue #16: getLicenseData() must return a licensed snapshot. The snapshot's fields
// are R8-renamed (a/b/c/d/e), so every field is discovered structurally from the
// checks themselves, never by name:
//   - b() is the only no-arg boolean that calls two (J)Z methods on p0
//     (e(J) "state==1 && now<=expiry" then f(J) "confirmation needed");
//   - its first callee's IGET-WIDE field is the expiry, its only IGET (int) field
//     is the state;
//   - its second callee's IGET-WIDE field is the confirm deadline (the account list
//     shows a "license confirmation needed" panel when now > deadline AND
//     isLegacyLicensing(), which defaults to legacy/true, so the deadline must be
//     far future).
private fun BytecodePatchContext.patchLicenseSnapshot() {
    val licenseData = mutableClassDefByOrNull(LICENSE_DATA)
        ?: error("$LICENSE_DATA not found")

    // b(): the no-arg boolean combinator calling two (J)Z checks on p0.
    val combinator = licenseData.methods.singleOrNull { method ->
        method.returnType == "Z" && method.parameterTypes.isEmpty() &&
            method.implementation != null &&
            method.longBooleanCallees(LICENSE_DATA).distinctBy { it.name }.size >= 2
    } ?: error("licensed check not found in $LICENSE_DATA (expected the no-arg " +
        "boolean combining two (J)Z checks)")

    val callees = combinator.longBooleanCallees(LICENSE_DATA).distinctBy { it.name }
    val expiryCheckName = callees.firstOrNull()?.name
        ?: error("licensed check calls no (J)Z checks")
    val confirmCheckName = callees.getOrNull(1)?.name
        ?: error("licensed check calls only one (J)Z check (expected expiry + confirm)")

    val expiryCheck = licenseData.methodByName(expiryCheckName)
        ?: error("expiry check $expiryCheckName(J)Z not found in $LICENSE_DATA")
    val confirmCheck = licenseData.methodByName(confirmCheckName)
        ?: error("confirm check $confirmCheckName(J)Z not found in $LICENSE_DATA")

    val expiryField = expiryCheck.longFieldRead()
        ?: error("expiry check reads no unique long field")
    val confirmField = confirmCheck.longFieldRead()
        ?: error("confirm check reads no unique long field")
    val stateField = expiryCheck.instructionsOf()
        .mapNotNull { insn ->
            if (insn.opcode == Opcode.IGET) {
                ((insn as? ReferenceInstruction)?.reference as? FieldReference)?.name
            } else {
                null
            }
        }.singleOrNull()
        ?: error("expiry check reads no unique int (state) field")
    if (expiryField == confirmField) {
        error("expiry and confirm fields resolved to the same field '$expiryField'")
    }

    val getLicenseData = GetLicenseDataFingerprint.method
    check(getLicenseData.implementation!!.registerCount >= 3) {
        "LicenseManager.getLicenseData() has too few registers " +
            "(${getLicenseData.implementation!!.registerCount})"
    }
    getLicenseData.addInstructions(
        0,
        """
            new-instance v0, $LICENSE_DATA
            invoke-direct {v0}, $LICENSE_DATA-><init>()V
            const/4 v1, 0x1
            iput v1, v0, $LICENSE_DATA->$stateField:I
            const-wide v1, 0x7fffffffffffffffL
            iput-wide v1, v0, $LICENSE_DATA->$confirmField:J
            iput-wide v1, v0, $LICENSE_DATA->$expiryField:J
            return-object v0
        """.trimIndent(),
    )
}

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks the Pro/Premium features and lifts the free-version feature locks."
) {
    compatibleWith(COMPATIBILITY_AQUAMAIL)

    execute {
        // The UI reads getLicenseLevel() directly (AccountListActivity compares it to 40,
        // the Compose state carries level + type into every screen), so forcing the derived
        // booleans alone is not enough - force the level itself.
        LicenseLevelFingerprint.method.returnEarly(40)

        // getLicenseType() drives the plan label ("Free"); report the in-app license type.
        LicenseTypeFingerprint.method.addInstructions(
            0,
            """
                invoke-virtual {p0}, Lorg/kman/AquaMail/data/LicenseManager;->getLicenseTypeInApp()Lorg/kman/AquaMail/data/LicenseType;
                move-result-object v0
                return-object v0
            """.trimIndent()
        )

        // Issue #16: on a free install getLicenseData() returns null, and the account
        // list, prefs license line and account-limit logic gate on a non-null snapshot
        // before consulting any getter above - so the app still displayed the free
        // version. Return a licensed snapshot (state licensed, confirm deadline and
        // expiry far future) so those gates pass too.
        patchLicenseSnapshot()

        // Licence level checks.
        IsProFingerprint.method.returnEarly(true)
        IsPremiumFingerprint.method.returnEarly(true)
        IsLicensedVersionFingerprint.method.returnEarly(true)
        IsFreeFingerprint.method.returnEarly(false)

        // Per-feature locks.
        FeatureLockedForLicenseFingerprint.method.returnEarly(false)
        LockFeaturesIsFeatureLockedFingerprint.method.returnEarly(false)
    }
}
