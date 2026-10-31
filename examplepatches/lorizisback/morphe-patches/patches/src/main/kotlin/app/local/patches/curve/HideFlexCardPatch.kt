package app.local.patches.curve

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.matchSingle
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val WALLET_ITEMS = "Lcom/curve/wallet/main/usecase/GetWalletItemsUseCase;"

@Suppress("unused")
val hideFlexCardPatch = bytecodePatch(
    name = "Hide Flex",
    description = "Hides Flex cards, promotions, transaction actions, settings and navigation. Does not cancel Flex or change the payment source.",
    default = false
) {
    compatibleWith(Compatibility(
        name = "Curve Pay",
        packageName = "com.imaginecurve.curve.prd",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x1C1C1C,
        targets = listOf(AppTarget(version = "5.63.0"))
    ))

    extendWith("extensions/extension.mpe")

    execute {
        for (name in listOf("getWalletItems", "getWalletItemsFlow")) {
            val match = Fingerprint(
                definingClass = WALLET_ITEMS, name = name, returnType = "Ljava/lang/Object;",
                parameters = listOf("Lkotlin/coroutines/Continuation;"), isStatic = false,
                filters = listOf(fieldAccess(
                    opcode = Opcode.IGET_OBJECT, definingClass = WALLET_ITEMS,
                    name = "defaultWalletItemsIncludeSet", type = "Ljava/util/Set;"
                ))
            ).matchSingle()
            val read = match.instructionMatches.single()
            val register = read.getInstruction<OneRegisterInstruction>().registerA
            // Preserve the full inclusion set so switching Flex back on restores both fetch paths.
            match.method.addInstructions(read.index + 1, """
                invoke-static/range {v$register .. v$register}, Lapp/local/extension/curve/HideFlex;->filterIncludes(Ljava/util/Set;)Ljava/util/Set;
                move-result-object v$register
            """)
        }
        hideFlexUi()
    }
}
