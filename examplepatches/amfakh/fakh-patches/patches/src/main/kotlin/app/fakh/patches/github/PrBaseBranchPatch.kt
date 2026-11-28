/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.github

import app.fakh.patches.github.shared.Constants.COMPATIBILITY_GITHUB
import app.fakh.patches.github.shared.Constants.SHOW_BASE_BRANCH
import app.fakh.patches.shared.register
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val PR_BASE = "Lapp/fakh/extension/github/PrBaseBranch;"

private const val STRING = "Ljava/lang/String;"

private const val LIST = "Ljava/util/List;"

private const val OBJECT = "Ljava/lang/Object;"

/** Start of PullRequestItemFragment in every PR list query. */
private const val PR_FRAGMENT = "fragment PullRequestItemFragment on PullRequest { __typename id "

/** GraphQL fields added to PullRequestItemFragment. */
private const val BASE_FIELDS = "fakhPrId: id fakhPrBranch: baseRef { name repository { defaultBranchRef { name } } }"

@Suppress("unused")
val showBaseBranchPatch = patch(
    name = "Show base branch in pull requests",
    description = "Shows the base branch in pull request lists when it is not the default branch.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(githubSettingsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        register(SHOW_BASE_BRANCH)

        val queries = mutableListOf<Pair<String, String>>()
        val parsers = mutableListOf<String>()
        var prItemClass: ClassDef? = null
        var metaItemType: String? = null
        val requiredFields = listOf("pullRequestState", "headRepository", "titleHTMLString", "isDraft")

        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val read = method.instructions.mapNotNull { it.string }
                if (read.any { PR_FRAGMENT in it }) queries += classDef.type to method.name
                if (method.name == "<clinit>" && read.containsAll(requiredFields) &&
                    classDef.methods.any { other -> other.instructions.any { it.selectsName } }
                ) {
                    parsers += classDef.type
                }
                if (method.name == "toString" && "ListItemPullRequest(title=" in read) prItemClass = classDef
                if (method.name == "toString" && "SimpleMetadataItem(text=" in read) metaItemType = classDef.type
            }
        }
        val prClass = prItemClass ?: throw PatchException("ListItemPullRequest model not found")
        val itemType = metaItemType ?: throw PatchException("SimpleMetadataItem not found")
        if (queries.isEmpty() || parsers.isEmpty()) {
            throw PatchException("PR list queries or parsers not found: $queries, $parsers")
        }

        // Find the app's AnyAdapter reader `(Reader)Object`.
        val reader = mutableClassDefBy(parsers.first()).methods
            .firstNotNullOf { method -> method.instructions.firstOrNull { it.selectsName }?.method?.definingClass }
        var anyReader: Method? = null
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                if (AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == OBJECT &&
                    method.types == listOf(reader)
                ) {
                    anyReader = method
                }
            }
        }
        val any = anyReader ?: throw PatchException("Any JSON reader not found")

        queries.forEach { (type, name) ->
            mutableClassDefBy(type).methods.filter { it.name == name }.forEach {
                it.addToQuery(PR_FRAGMENT, BASE_FIELDS)
            }
        }
        parsers.forEach { readAddedFields(it, PR_BASE, "id", "branch", any) }

        // Extract `id` field from ListItemPullRequest.toString (right after ", id=").
        val toString = prClass.methods.single { it.name == "toString" }.instructions
        val idLabelAt = toString.indexOfFirst { it.string == ", id=" }
        val prIdField = toString.drop(idLabelAt).firstNotNullOfOrNull {
            it.field?.takeIf { f -> it.opcode == Opcode.IGET_OBJECT && f.definingClass == prClass.type && f.type == STRING }
        } ?: throw PatchException("ListItemPullRequest.id field not found")

        val itemInit = classDefByOrNull(itemType)!!.methods.single { it.name == "<init>" && it.types.size == 8 }

        // Find the PR metadata chips builder (`lrq` case 6): reads `ListItemPullRequest` fields and creates `SimpleMetadataItem`s
        // added to a `ListBuilder` created via a 0-arg static method (`nh9.v()`).
        var target: Triple<String, String, Int>? = null
        classDefForEach { classDef ->
            if (target != null) return@classDefForEach
            classDef.methods.forEach { method ->
                val body = method.instructions
                if (body.none { it.field?.definingClass == prClass.type }) return@forEach
                if (body.none { it.method?.smali == itemInit.smali }) return@forEach
                val firstPrRead = body.indexOfFirst { it.field?.definingClass == prClass.type }
                val listInitAt = (firstPrRead until body.size - 1).firstOrNull { i ->
                    val call = body[i].method ?: return@firstOrNull false
                    body[i].opcode == Opcode.INVOKE_STATIC && call.types.isEmpty() &&
                        call.returnType.startsWith("L") &&
                        body[i + 1].opcode == Opcode.MOVE_RESULT_OBJECT &&
                        classDefByOrNull(call.returnType)?.let { cls ->
                            cls.interfaces.contains(LIST) || cls.superclass?.contains("AbstractMutableList") == true ||
                                cls.methods.any { m -> m.name == "add" && m.types == listOf(OBJECT) }
                        } == true
                } ?: return@forEach
                target = Triple(classDef.type, method.name + method.parameterTypes.joinToString(""), listInitAt)
            }
        }
        val (ownerType, sig, listInitAt) = target ?: throw PatchException("PR metadata chips builder not found")
        val owner = mutableClassDefBy(ownerType)
        val method = owner.methods.first { it.name + it.parameterTypes.joinToString("") == sig }
        val body = method.instructions

        val firstPrRead = body.indexOfFirst { it.opcode == Opcode.IGET_OBJECT && it.field?.definingClass == prClass.type }
        val prReg = (body[firstPrRead] as TwoRegisterInstruction).registerB
        val listReg = (body[listInitAt + 1] as OneRegisterInstruction).registerA

        owner.methods.add(
            ImmutableMethod(
                ownerType,
                "fakhAddBaseBranch",
                listOf(
                    ImmutableMethodParameter(LIST, null, null),
                    ImmutableMethodParameter(prClass.type, null, null),
                ),
                "V",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(12),
            ).toMutable().apply {
                addInstructionsWithLabels(
                    0,
                    """
                        iget-object v0, p1, ${prIdField.smali}
                        invoke-static { v0 }, $PR_BASE->text($STRING)$STRING
                        move-result-object v1
                        if-eqz v1, :done

                        new-instance v0, $itemType
                        invoke-static {}, $PR_BASE->icon()I
                        move-result v2
                        invoke-static { v2 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                        move-result-object v2
                        const/4 v3, 0x0
                        const/4 v4, 0x0
                        const/4 v5, 0x0
                        const/4 v6, 0x0
                        const/4 v7, 0x0
                        const/16 v8, 0xfc
                        invoke-direct/range { v0 .. v8 }, ${itemInit.smali}
                        invoke-interface { p0, v0 }, $LIST->add($OBJECT)Z

                        :done
                        return-void
                    """,
                )
            },
        )

        if (listReg <= 15 && prReg <= 15) {
            method.addInstructions(
                listInitAt + 2,
                "invoke-static { v$listReg, v$prReg }, $ownerType->fakhAddBaseBranch($LIST${prClass.type})V",
            )
        } else {
            owner.staticFields.add(
                ImmutableField(
                    ownerType,
                    "fakhPrItem",
                    prClass.type,
                    AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                    null,
                    null,
                    null,
                ).toMutable(),
            )
            owner.methods.add(
                ImmutableMethod(
                    ownerType,
                    "fakhSetPrItem",
                    listOf(ImmutableMethodParameter(prClass.type, null, null)),
                    "V",
                    AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                    null,
                    null,
                    MutableMethodImplementation(1),
                ).toMutable().apply {
                    addInstructions(
                        0,
                        """
                            sput-object p0, $ownerType->fakhPrItem:${prClass.type}
                            return-void
                        """,
                    )
                },
            )
            owner.methods.add(
                ImmutableMethod(
                    ownerType,
                    "fakhAppendBase",
                    listOf(ImmutableMethodParameter(LIST, null, null)),
                    "V",
                    AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                    null,
                    null,
                    MutableMethodImplementation(2),
                ).toMutable().apply {
                    addInstructions(
                        0,
                        """
                            sget-object v0, $ownerType->fakhPrItem:${prClass.type}
                            invoke-static { p0, v0 }, $ownerType->fakhAddBaseBranch($LIST${prClass.type})V
                            return-void
                        """,
                    )
                },
            )
            method.addInstructions(
                listInitAt + 2,
                """
                    invoke-static/range { v$prReg .. v$prReg }, $ownerType->fakhSetPrItem(${prClass.type})V
                    invoke-static/range { v$listReg .. v$listReg }, $ownerType->fakhAppendBase($LIST)V
                """,
            )
        }
    }
}
