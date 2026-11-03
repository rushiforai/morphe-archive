package dev.utaa.linimal.patches.features.home

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
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
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.utaa.linimal.patches.features.lineai.lineAiEntryPatch
import dev.utaa.linimal.patches.shared.Constants
import dev.utaa.linimal.patches.status.PatchId
import dev.utaa.linimal.patches.status.recordFeatureStatus
import dev.utaa.linimal.patches.status.recordUnsafeFeatureStatus
import dev.utaa.linimal.patches.util.exceptionHandlerAddresses
import dev.utaa.linimal.patches.util.isDivertedInjectionIndex
import dev.utaa.linimal.patches.util.registerSurvivesBetween

private const val CONTENT_MODEL = "Lkd2/c;"
private const val RECOMMENDATION_HOOK =
    "Ldev/utaa/linimal/extension/features/HomeRecommendationHooks;->shouldSuppress()Z"

/** 注入する `iput-object` の receiver。命令 0 の `move-object/from16` が `this` をここへ置きます。 */
private const val THIS_REGISTER = 0

/** recommendation placement ViewHolder の layout resource と superclass を組み合わせた class anchor。 */
private val recommendationViewHolderClassFingerprint = Fingerprint(
    name = "<init>",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    parameters = listOf(
        "Landroid/widget/LinearLayout;",
        "Lcom/bumptech/glide/o;",
        "Landroidx/lifecycle/u0;",
        "Lti8/f;",
    ),
    filters = listOf(
        literal(0x7f0b11ad), // home_tab_contents_recommendation_placement
        methodCall(
            definingClass = "Landroid/view/View;",
            name = "findViewById",
            parameters = listOf("I"),
            returnType = "Landroid/view/View;",
            opcode = Opcode.INVOKE_VIRTUAL,
        ),
        fieldAccess(definingClass = "this", type = "Landroid/widget/LinearLayout;", opcode = Opcode.IPUT_OBJECT),
    ),
    custom = { _, classDef -> classDef.superclass == "Lsg2/x;" },
)

/**
 * equality short-circuit → tracker cleanup → removeAllViews → model list iteration の binder。
 * field 名は使わず、cache field reference は matched instruction から動的に取得します。
 */
private val recommendationBindFingerprint = Fingerprint(
    classFingerprint = recommendationViewHolderClassFingerprint,
    returnType = "V",
    parameters = listOf("Lsg2/l;"),
    filters = listOf(
        fieldAccess(definingClass = "this", type = CONTENT_MODEL, opcode = Opcode.IGET_OBJECT),
        methodCall(
            definingClass = "Lkotlin/jvm/internal/n;",
            name = "b",
            parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;"),
            returnType = "Z",
            opcode = Opcode.INVOKE_STATIC,
        ),
        methodCall(
            definingClass = "Lsg2/u;",
            parameters = emptyList(),
            returnType = "V",
            opcode = Opcode.INVOKE_VIRTUAL,
        ),
        methodCall(
            definingClass = "Landroid/view/ViewGroup;",
            name = "removeAllViews",
            parameters = emptyList(),
            returnType = "V",
            opcode = Opcode.INVOKE_VIRTUAL,
        ),
        fieldAccess(type = "Ljava/util/List;", opcode = Opcode.IGET_OBJECT),
    ),
)

val homeContentsRecommendationPatch = bytecodePatch(
    name = "ホームのおすすめ枠",
    description = "ホームのおすすめ枠を、実行時設定で非表示にできるようにします。",
) {
    compatibleWith(Constants.LINE_COMPATIBILITY)
    availability { _, architecture ->
        if (architecture == ApkArchitecture.ARM64_V8A) {
            PatchAvailability.REQUIRED
        } else {
            PatchAvailability.UNAVAILABLE
        }
    }
    dependsOn(lineAiEntryPatch)

    execute {
        val matches = runCatching { recommendationBindFingerprint.matchAllOrNull() }.getOrNull().orEmpty()
        if (matches.size != 1) {
            recordFeatureStatus(
                listOf(PatchId.HOME_CONTENTS_RECOMMENDATION),
                expectedTargetCount = 1,
                actualTargetCount = matches.size,
                reason = "HomeRecommendationBindNotUnique",
            )
            return@execute
        }

        val match = matches.single()
        val method = match.method
        val cacheIndex = match.instructionMatches[0].index
        val cleanupIndex = match.instructionMatches[3].index
        val listIndex = match.instructionMatches[4].index
        val instructions = method.implementation?.instructions?.toList().orEmpty()
        val cacheRead = instructions.getOrNull(cacheIndex) as? TwoRegisterInstruction
        val cacheField = (instructions.getOrNull(cacheIndex) as? ReferenceInstruction)
            ?.reference as? FieldReference
        val listRead = instructions.getOrNull(listIndex) as? OneRegisterInstruction
        val cleanupReference = (instructions.getOrNull(cleanupIndex) as? ReferenceInstruction)
            ?.reference as? MethodReference

        // cleanup の直後にだけ分岐します。ON では cache を null にして次回 bind を許可し、
        // OFF / hook failure では original list read と iterator を一切変更しません。
        if (
            cleanupIndex + 1 != listIndex ||
            instructions.firstOrNull()?.opcode != Opcode.MOVE_OBJECT_FROM16 ||
            instructions.getOrNull(cleanupIndex)?.opcode != Opcode.INVOKE_VIRTUAL ||
            cleanupReference?.definingClass != "Landroid/view/ViewGroup;" ||
            cleanupReference.name != "removeAllViews" ||
            cleanupReference.parameterTypes.isNotEmpty() ||
            cleanupReference.returnType != "V" ||
            cacheField?.definingClass != match.originalClassDef.type ||
            cacheField.type != CONTENT_MODEL ||
            cacheRead?.registerB != 0 ||
            listRead == null ||
            listRead.registerA !in 0..15 ||
            method.implementation == null
        ) {
            recordUnsafeFeatureStatus(
                listOf(PatchId.HOME_CONTENTS_RECOMMENDATION),
                expectedTargetCount = 1,
                actualTargetCount = matches.size,
                reason = "HomeRecommendationBindInstructionShapeMismatch",
            )
            return@execute
        }

        // 注入位置そのものの安全性は、mutable 側の label 配置ではなく transform 前の
        // instruction / exception table で判定します。
        val originalImplementation = match.originalMethod.implementation
        val insertionIndex = originalImplementation?.let {
            val originalInstructions = it.instructions.toList()
            homeRecommendationInjectionIndex(
                instructions = originalInstructions,
                cleanupIndex = cleanupIndex,
                // fingerprint が引数を `Lsg2/l;` 1 つに固定しているため、wide を考えず
                // 「registers - 引数 - this」で p0 の register 番号が求まります。
                thisParameterRegister = it.registerCount - method.parameterTypes.size - 1,
                hasTryBlocks = it.tryBlocks.isNotEmpty(),
                handlerAddresses = exceptionHandlerAddresses(it),
            )
        }
        if (insertionIndex == null) {
            recordUnsafeFeatureStatus(
                listOf(PatchId.HOME_CONTENTS_RECOMMENDATION),
                expectedTargetCount = 1,
                actualTargetCount = matches.size,
                reason = "HomeRecommendationBindInjectionUnsafe",
            )
            return@execute
        }

        val cacheFieldSmali = "${cacheField.definingClass}->${cacheField.name}:${cacheField.type}"
        method.addInstructionsWithLabels(
            insertionIndex,
            """
                invoke-static { }, $RECOMMENDATION_HOOK
                move-result v${listRead.registerA}
                if-eqz v${listRead.registerA}, :original
                const/4 v${listRead.registerA}, 0x0
                iput-object v${listRead.registerA}, v$THIS_REGISTER, $cacheFieldSmali
                return-void
                :original
                nop
            """.trimIndent(),
        )
        recordFeatureStatus(
            listOf(PatchId.HOME_CONTENTS_RECOMMENDATION),
            expectedTargetCount = 1,
            actualTargetCount = 1,
            reason = "HomeRecommendationClearedAfterCleanup",
        )
    }
}

/**
 * cleanup 直後の注入位置。安全でない並びなら null を返し、patch は何も注入しません。
 *
 * <p>次の 3 点を確認します。</p>
 * <ol>
 *   <li>try block を持たないこと。抑制経路は `return-void` で bind を打ち切るため、例外経路を持つ
 *   binder は同パッケージの他パッチと同じく一切扱いません。</li>
 *   <li>注入する `iput-object` の receiver が、注入位置で実際に `this` を保持していること。
 *   命令 0 の `move-object/from16 v0, p0` で `this` が v0 へ入り、そこから注入位置まで
 *   v0 が潰されないことを、wide の上位半分まで含めて確認します。</li>
 *   <li>注入位置が既存の分岐先や例外 handler の先頭でないこと。dexlib2 は既存 location を Label ごと
 *   後ろへずらすため、一致するとその経路だけが抑制を飛び越します。</li>
 * </ol>
 */
internal fun homeRecommendationInjectionIndex(
    instructions: List<Instruction>,
    cleanupIndex: Int,
    thisParameterRegister: Int,
    hasTryBlocks: Boolean,
    handlerAddresses: Set<Int>,
): Int? {
    if (hasTryBlocks) {
        return null
    }

    val thisMove = instructions.firstOrNull() as? TwoRegisterInstruction
    if (
        thisMove == null ||
        instructions[0].opcode != Opcode.MOVE_OBJECT_FROM16 ||
        thisMove.registerA != THIS_REGISTER ||
        thisMove.registerB != thisParameterRegister
    ) {
        return null
    }

    val insertionIndex = cleanupIndex + 1
    if (insertionIndex !in instructions.indices) {
        return null
    }
    if (!registerSurvivesBetween(instructions, THIS_REGISTER, 0, insertionIndex)) {
        return null
    }
    return insertionIndex.takeUnless { isDivertedInjectionIndex(instructions, it, handlerAddresses) }
}
