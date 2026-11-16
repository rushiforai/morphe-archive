package app.morphe.patches.moovit

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patches.shared.Constants.COMPATIBILITY_MOOVIT
import app.morphe.patches.shared.replaceWithReturnBoolean
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private val subscriptionStateFingerprint = Fingerprint(
    classFingerprint = Fingerprint(
        strings = listOf(string("subscribed_skus", StringComparisonType.EQUALS)),
    ),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = emptyList(),
)

private val subscriptionPackageInitFingerprint = Fingerprint(
    definingClass = "Lcom/moovit/app/subscription/premium/packages/a;",
    name = "<init>",
    parameters = listOf(
        "Lcom/moovit/MoovitApplication;",
        "Lcom/moovit/app/subscription/premium/packages/SubscriptionPackageType;",
    ),
)

private val safeRideCalculateStateFingerprint = Fingerprint(
    definingClass = "Lcom/moovit/app/subscription/premium/packages/safety/b;",
    name = "a",
    returnType = "Ljava/lang/Enum;",
    parameters = listOf("Lkotlin/coroutines/jvm/internal/ContinuationImpl;"),
)

private val favoriteLocationAddressSearchFingerprint = Fingerprint(
    definingClass = "Lcom/moovit/app/home/dashboard/FavoriteLocationEditorActivity;",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("favorites_editor"),
    ),
)

@Suppress("unused")
val moovitUnlockPlusPatch = bytecodePatch(
    name = "Unlock Moovit+",
    description = "Unlocks Moovit+ premium subscription features locally, including Safe Ride and address search in favorites.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MOOVIT)

    execute {
        var patched = 0

        // 1. Subscription state gate -> always subscribed
        subscriptionStateFingerprint.method.replaceWithReturnBoolean(true)
        patched++

        // 2. Package state -> always ACTIVE on initialization
        run {
            val instructions = subscriptionPackageInitFingerprint.method.implementation!!.instructions
            val inactiveIndex = instructions.indexOfFirst { instruction ->
                instruction.opcode == Opcode.SGET_OBJECT &&
                    (instruction as? ReferenceInstruction)?.reference.toString().contains("SubscriptionPackageState;->INACTIVE")
            }
            check(inactiveIndex >= 0) { "SubscriptionPackageState.INACTIVE reference not found in SubscriptionPackage.<init>." }
            val reg = (instructions[inactiveIndex] as OneRegisterInstruction).registerA
            subscriptionPackageInitFingerprint.method.replaceInstruction(
                inactiveIndex,
                "sget-object v$reg, Lcom/moovit/app/subscription/premium/packages/SubscriptionPackageState;->ACTIVE:Lcom/moovit/app/subscription/premium/packages/SubscriptionPackageState;",
            )
            patched++
        }

        // 3. SafeRide calculate state -> always ACTIVE
        safeRideCalculateStateFingerprint.method.addInstructions(
            0,
            """
                sget-object p0, Lcom/moovit/app/subscription/premium/packages/SubscriptionPackageState;->ACTIVE:Lcom/moovit/app/subscription/premium/packages/SubscriptionPackageState;
                return-object p0
            """.trimIndent(),
        )
        patched++

        // 4. Favorite location address search -> flip address provider flag (c = true)
        val instructions = favoriteLocationAddressSearchFingerprint.method.implementation!!.instructions
        val callbackInitIndex = instructions.indexOfFirst {
            (it as? ReferenceInstruction)?.reference.toString().contains("Lcom/moovit/app/search/AppSearchLocationCallback;-><init>")
        }
        if (callbackInitIndex < 0) {
            throw PatchException("AppSearchLocationCallback constructor invocation not found.")
        }

        val callbackInitInstruction = instructions.elementAt(callbackInitIndex)
        val callbackRef = (callbackInitInstruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: throw PatchException("AppSearchLocationCallback constructor reference not found.")
        val booleanParamIndices = callbackRef.parameterTypes.mapIndexedNotNull { index, type ->
            if (type == "Z") index else null
        }
        val targetParamIndex = if (booleanParamIndices.size >= 3) booleanParamIndices[2] else 4
        val argOffset = targetParamIndex + 1

        val flagReg = when (callbackInitInstruction) {
            is FiveRegisterInstruction -> when (argOffset) {
                1 -> callbackInitInstruction.registerD
                2 -> callbackInitInstruction.registerE
                3 -> callbackInitInstruction.registerF
                4 -> callbackInitInstruction.registerG
                else -> throw PatchException("Unsupported constructor argument index for FiveRegisterInstruction: $argOffset")
            }
            is RegisterRangeInstruction -> callbackInitInstruction.startRegister + argOffset
            else -> throw PatchException("Unsupported instruction type for callback constructor: ${callbackInitInstruction::class.java.name}")
        }

        val constZeroIndex = instructions.subList(0, callbackInitIndex).indexOfLast {
            it.opcode == Opcode.CONST_4 &&
                (it as? OneRegisterInstruction)?.registerA == flagReg &&
                (it as? NarrowLiteralInstruction)?.narrowLiteral == 0
        }
        if (constZeroIndex < 0) {
            throw PatchException("const/4 v$flagReg, 0x0 instruction not found before callback constructor.")
        }

        favoriteLocationAddressSearchFingerprint.method.replaceInstruction(
            constZeroIndex,
            "const/4 v$flagReg, 0x1",
        )
        patched++

        println("[Unlock Moovit+] Applied $patched hooks -> Moovit+ premium features unlocked.")
    }
}
