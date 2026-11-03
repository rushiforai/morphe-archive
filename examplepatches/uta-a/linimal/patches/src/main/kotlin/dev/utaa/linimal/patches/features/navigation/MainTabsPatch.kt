package dev.utaa.linimal.patches.features.navigation

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import dev.utaa.linimal.patches.features.premium.premiumUnsendPromotionPatch
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.recordFeatureStatus
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus
import dev.utaa.linimal.patches.util.instructionWritesAnyRegister

private const val LIST = "Ljava/util/List;"
private const val ENUM = "Ljava/lang/Enum;"
private const val MAIN_TAB_HOOK =
    "Ldev/utaa/linimal/extension/features/MainTabHooks;->filterTabs(Ljava/util/List;)Ljava/util/List;"

private val mainTabPatchIds = listOf(
    PatchId.MAIN_TAB_VOOM,
    PatchId.MAIN_TAB_NEWS,
    PatchId.MAIN_TAB_WALLET,
    PatchId.MAIN_TAB_SHOPPING,
    PatchId.MAIN_TAB_MINI,
)

/**
 * 下部タブ descriptor enum を、resource ID と enum/resource の対応から特定します。
 * `xy7/g` のような難読化名は fingerprint の条件にしていません。
 */
private val mainTabDescriptorFingerprint = Fingerprint(
    name = "<clinit>",
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    strings = listOf("TIMELINE", "NEWS", "NEWS_ROW", "WALLET", "MINI", "COMMERCE", "COMMERCE_TW"),
    filters = listOf(
        fieldAccess(name = "VOOM", opcode = Opcode.SGET_OBJECT),
        literal(0x7f0b03cf), // id/bnb_timeline
        fieldAccess(name = "NEWS", opcode = Opcode.SGET_OBJECT),
        literal(0x7f0b03c9), // id/bnb_news
        fieldAccess(name = "NEWS_ROW", opcode = Opcode.SGET_OBJECT),
        literal(0x7f0b03ca), // id/bnb_news_row
        fieldAccess(name = "WALLET", opcode = Opcode.SGET_OBJECT),
        literal(0x7f0b03d1), // id/bnb_wallet
        fieldAccess(name = "MINI", opcode = Opcode.SGET_OBJECT),
        literal(0x7f0b03c7), // id/bnb_mini
        fieldAccess(name = "COMMERCE", opcode = Opcode.SGET_OBJECT),
        literal(0x7f0b03bd), // id/bnb_commerce
        fieldAccess(name = "COMMERCE_TW", opcode = Opcode.SGET_OBJECT),
        literal(0x7f0b03bf), // id/bnb_commerce_tw
    ),
    custom = { _, classDef -> classDef.superclass == ENUM },
)

/**
 * VOOM / NEWS / Wallet / Shopping / Mini の input list を保存する constructor。enum descriptor class は上の anchor から
 * 動的に導くため、constructor 自身の難読化 class/method 名には依存しません。
 */
val mainTabsPatch = bytecodePatch(
    name = "下部タブ",
    description = "下部タブの VOOM・ショッピング・ニュース・ウォレット・アプリを、実行時設定で個別に取り除けるようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    dependsOn(premiumUnsendPromotionPatch)

    execute {
        val descriptorMatches = mainTabDescriptorFingerprint.matchAllOrNull().orEmpty()
        if (descriptorMatches.size != 1) {
            recordFeatureStatus(
                mainTabPatchIds,
                expectedTargetCount = 1,
                actualTargetCount = descriptorMatches.size,
                reason = "MainTabDescriptorNotUnique",
            )
            return@execute
        }

        val descriptorType = descriptorMatches.single().originalClassDef.type
        val constructorFingerprint = Fingerprint(
            name = "<init>",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
            returnType = "V",
            parameters = listOf(
                "L",
                "Ljp/naver/line/android/activity/main/MainBottomNavigationStateViewModel;",
                "L",
                "Landroid/view/View;",
                "L",
                LIST,
                "L",
                "L",
            ),
            filters = listOf(
                fieldAccess(definingClass = "this", type = LIST, opcode = Opcode.IPUT_OBJECT),
                methodCall(
                    definingClass = descriptorType,
                    name = "values",
                    returnType = "[L",
                    opcode = Opcode.INVOKE_STATIC,
                ),
            ),
        )
        val matches = constructorFingerprint.matchAllOrNull().orEmpty()
        if (matches.size != 1) {
            recordFeatureStatus(
                mainTabPatchIds,
                expectedTargetCount = 1,
                actualTargetCount = matches.size,
                reason = "MainTabConstructorNotUnique",
            )
            return@execute
        }

        val match = matches.single()
        val method = match.method
        val implementation = method.implementation
        val instructions = implementation?.instructions?.toList().orEmpty()
        val parameterTypes = method.parameterTypes.map { it.toString() }
        val listParameterIndices = parameterTypes.mapIndexedNotNull { index, type ->
            index.takeIf { type == LIST }
        }
        val parameterWidth = parameterTypes.sumOf(::registerWidth)
        val thisRegister = implementation?.registerCount?.minus(parameterWidth + 1)
        val listParameterIndex = listParameterIndices.singleOrNull()
        val listRegister = if (thisRegister != null && listParameterIndex != null) {
            thisRegister + 1 + parameterTypes.take(listParameterIndex).sumOf(::registerWidth)
        } else {
            null
        }
        val ownListStores = instructions.mapIndexedNotNull { index, instruction ->
            val store = instruction as? TwoRegisterInstruction
            val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            if (
                instruction.opcode == Opcode.IPUT_OBJECT &&
                field != null &&
                store != null &&
                field.definingClass == match.originalClassDef.type &&
                field.type == LIST
            ) {
                index to store
            } else {
                null
            }
        }
        val targetStore = ownListStores.singleOrNull()
        val storeIndex = targetStore?.first
        val store = targetStore?.second
        val thisCopy = instructions.getOrNull(0) as? TwoRegisterInstruction
        val listCopy = instructions.getOrNull(1) as? TwoRegisterInstruction
        val copiedRegisters = if (thisCopy != null && listCopy != null) {
            setOf(thisCopy.registerA, listCopy.registerA)
        } else {
            emptySet()
        }
        val copiedRegisterRedefined = if (storeIndex == null || storeIndex <= 2) {
            true
        } else {
            instructions.subList(2, storeIndex).any { instruction ->
                mayRedefineRegister(instruction, copiedRegisters)
            }
        }
        val injectionRegister = store?.registerA

        // p0 と唯一の List parameter が低位 local へ直接 copy され、その provenance を保ったまま
        // own List fieldへ保存される exact straight-line shapeだけを差し替えます。
        if (
            implementation == null ||
            listParameterIndex != 5 ||
            thisRegister == null ||
            thisRegister < 0 ||
            listRegister == null ||
            thisCopy == null ||
            listCopy == null ||
            !isObjectMove(instructions[0].opcode) ||
            !isObjectMove(instructions[1].opcode) ||
            thisCopy.registerB != thisRegister ||
            listCopy.registerB != listRegister ||
            thisCopy.registerA == listCopy.registerA ||
            store == null ||
            store.registerB != thisCopy.registerA ||
            store.registerA != listCopy.registerA ||
            copiedRegisterRedefined ||
            injectionRegister == null ||
            injectionRegister !in 0..15 ||
            storeIndex == null
        ) {
            recordUnsafeFeatureStatus(
                mainTabPatchIds,
                expectedTargetCount = 1,
                actualTargetCount = matches.size,
                reason = "MainTabInputListStoreShapeMismatch",
            )
            return@execute
        }

        method.addInstructions(
            storeIndex,
            """
                invoke-static { v$injectionRegister }, $MAIN_TAB_HOOK
                move-result-object v$injectionRegister
            """.trimIndent(),
        )
        recordFeatureStatus(
            mainTabPatchIds,
            expectedTargetCount = 1,
            actualTargetCount = 1,
            reason = "MainTabsFilteredBeforeMapping",
        )
    }
}

private fun registerWidth(type: String): Int = if (type == "J" || type == "D") 2 else 1

private fun isObjectMove(opcode: Opcode): Boolean = opcode == Opcode.MOVE_OBJECT ||
    opcode == Opcode.MOVE_OBJECT_FROM16 || opcode == Opcode.MOVE_OBJECT_16

/**
 * copy 直後から store までに tracked local が再定義される可能性があれば安全側で拒否します。
 *
 * <p>判定は wide 命令の pair 上位半分まで数える共通実装へ委ねます。`registerA` だけを見ていると、
 * 間に挟まった `const-wide` が退避した値を潰していても検出できません。</p>
 */
private fun mayRedefineRegister(instruction: Instruction, trackedRegisters: Set<Int>): Boolean {
    if (trackedRegisters.isEmpty()) return true
    return instructionWritesAnyRegister(instruction, trackedRegisters)
}
