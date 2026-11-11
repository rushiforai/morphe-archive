package com.dowjames.patches.paprika

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.dowjames.patches.paprika.PaprikaConstants.PACKAGE_NAME
import com.dowjames.patches.paprika.PaprikaConstants.SUBSCRIPTION_PRODUCT_ID
import com.dowjames.patches.paprika.PaprikaConstants.COMPATIBILITY_PAPRIKA

private const val SYNTHETIC_PURCHASE_JSON =
    "{\\\"orderId\\\":\\\"GPA::patch-premium-0001\\\"," +
    "\\\"packageName\\\":\\\"$PACKAGE_NAME\\\"," +
    "\\\"productId\\\":\\\"$SUBSCRIPTION_PRODUCT_ID\\\"," +
    "\\\"purchaseTime\\\":1794357167666," +
    "\\\"purchaseState\\\":0," +
    "\\\"purchaseToken\\\":\\\"patch.premium.token.v4\\\"," +
    "\\\"quantity\\\":1," +
    "\\\"acknowledged\\\":true," +
    "\\\"autoRenewing\\\":true}"

/**
 * Rebuild this method with [additionalRegisters] extra registers.
 *
 * The extra registers take the place of the pX parameters: the original code keeps
 * referencing the old parameter register numbers, which become local slots, and
 * move instructions prepended at the start of the method copy the parameter values
 * into them. Scratch registers for injected code are the slots above the parameter
 * copies (v3/v4 once the frame is widened from 3 to 8).
 *
 * Adapted from Morphe's patch library (BytecodeUtils.cloneMutable, itself adapted
 * from BiliRoamingX), GPLv3: https://github.com/MorpheApp/morphe-patches-library
 */
private fun Method.cloneMutable(additionalRegisters: Int): MutableMethod {
    val implementation = checkNotNull(implementation) {
        "Cannot clone a method without an implementation"
    }
    val clonedImplementation = ImmutableMethodImplementation(
        implementation.registerCount + additionalRegisters,
        implementation.instructions,
        implementation.tryBlocks,
        implementation.debugItems,
    )
    val clone = ImmutableMethod(
        definingClass,
        name,
        parameters,
        returnType,
        accessFlags,
        annotations,
        hiddenApiRestrictions,
        clonedImplementation,
    ).toMutable()

    val isStatic = AccessFlags.STATIC.isSet(accessFlags)
    var insertIndex = 0
    var destReg = implementation.registerCount - parameterTypes.size - if (isStatic) 0 else 1
    var pReg = 0

    if (!isStatic) {
        clone.addInstructions(insertIndex++, "move-object/from16 v$destReg, p$pReg")
        destReg += 1
        pReg += 1
    }
    parameters.forEach { parameter ->
        val opcode = when {
            parameter.type == "J" || parameter.type == "D" -> "move-wide/from16"
            parameter.type.startsWith('L') || parameter.type.startsWith('[') -> "move-object/from16"
            else -> "move/from16"
        }
        clone.addInstructions(insertIndex++, "$opcode v$destReg, p$pReg")
        val width = if (opcode.startsWith("move-wide")) 2 else 1
        destReg += width
        pReg += width
    }
    return clone
}

/**
 * Appends a synthetic owned subscription purchase to the billing callback when
 * Play reports no purchases at all. Runs before the results cross into the
 * managed (AOT) PurchaseManager.
 *
 * Register layout after cloneMutable(additionalRegisters = 5): the frame widens
 * from 3 to 8 registers. The original code keeps referencing v0/v1/v2, which now
 * hold copies of (this, BillingResult, List); v3 and v4 are free scratch. The
 * replacement list must be written to v2 (the copy slot the original code reads),
 * NOT to p2 — p2 now points at the parameter slot above the locals and the
 * original code never reads it.
 *
 * :cond_native is bound via ExternalLabel to the original native-call
 * instruction; inline labels inside addInstructions at a nonzero index resolve
 * relative to the injected block and produce a branch target mid-instruction
 * (VerifyError: "target dex pc is not at instruction start").
 */
private fun purchaseInjectionSmali() = """
    if-eqz v2, :cond_native

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_native

    new-instance v3, Lcom/android/billingclient/api/Purchase;

    const-string v4, "$SYNTHETIC_PURCHASE_JSON"

    invoke-direct {v3, v4, v4}, Lcom/android/billingclient/api/Purchase;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object v2, v4
"""

/** Number of parameter-copy move instructions cloneMutable prepends for these callbacks. */
private const val PARAMETER_MOVE_COUNT = 3

private fun BytecodePatchContext.injectInto(method: Method) {
    val original = method as MutableMethod
    val clone = original.cloneMutable(5)
    // First original instruction: the native forwarding call the label skips to.
    val nativeCall = checkNotNull(clone.implementation).instructions[PARAMETER_MOVE_COUNT]
        as com.android.tools.smali.dexlib2.builder.BuilderInstruction
    clone.addInstructionsWithLabels(
        PARAMETER_MOVE_COUNT,
        purchaseInjectionSmali(),
        ExternalLabel("cond_native", nativeCall),
    )

    val clazz = mutableClassDefBy(original.definingClass)
    @Suppress("UNCHECKED_CAST")
    val methods = clazz.methods as MutableSet<MutableMethod>
    val target = methods.firstOrNull {
        it.name == original.name && it.parameterTypes == original.parameterTypes
    }
    checkNotNull(target) { "Patched method ${original.name} not found in ${original.definingClass}" }
    methods.remove(target)
    methods.add(clone)
}

@Suppress("unused")
val unlockPaprikaPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Unlocks Paprika Premium by injecting a synthetic owned subscription into Google Play billing callbacks.",
    default = true
) {
    compatibleWith(COMPATIBILITY_PAPRIKA)

    execute {
        // Purchase updates (initial sync, new purchases, restored purchases).
        injectInto(PurchasesUpdatedListenerFingerprint.method)

        // queryPurchasesAsync() responses (subscription status checks).
        injectInto(PurchasesResponseListenerFingerprint.method)
    }
}
