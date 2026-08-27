package app.morphe.patches.music.layout.pinplaylist

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.seobject.patches.music.Compatibility.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.util.cloneMutable
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.MethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/music/patches/pinplaylist/PinPlaylistPatch;"
private const val SETTINGS_CLASS =
    "Lapp/morphe/extension/music/patches/pinplaylist/PinPlaylistSettings;"

private fun methodDescriptor(method: MethodReference): String =
    "${method.definingClass}->${method.name}(" +
        method.parameterTypes.joinToString(separator = "") +
        ")${method.returnType}"

private fun dexTypeDescriptorEnd(
    descriptor: String,
    start: Int,
    allowVoid: Boolean,
): Int? {
    if (start !in descriptor.indices) return null
    var index = start
    var arrayDepth = 0
    while (index < descriptor.length && descriptor[index] == '[') {
        arrayDepth++
        index++
    }
    if (index >= descriptor.length) return null

    return when (descriptor[index]) {
        'Z', 'B', 'S', 'C', 'I', 'J', 'F', 'D' -> index + 1
        'V' -> if (allowVoid && arrayDepth == 0) index + 1 else null
        'L' -> {
            val end = descriptor.indexOf(';', index + 1)
            if (end <= index + 1) return null
            val body = descriptor.substring(index + 1, end)
            if (
                body.startsWith('/') ||
                body.endsWith('/') ||
                "//" in body ||
                body.any { character ->
                    character.isWhitespace() ||
                        character == '.' || character == '[' ||
                        character == ';' || character == '(' ||
                        character == ')' || character == '<' ||
                        character == '>' || character == ':'
                }
            ) return null
            end + 1
        }
        else -> null
    }
}

private fun isValidDexClassDescriptor(descriptor: String): Boolean =
    descriptor.startsWith('L') &&
        dexTypeDescriptorEnd(descriptor, 0, allowVoid = false) ==
        descriptor.length

private fun isValidDexMethodDescriptor(descriptor: String): Boolean {
    val arrow = descriptor.indexOf("->")
    if (arrow <= 0 || descriptor.indexOf("->", arrow + 2) >= 0) return false

    val owner = descriptor.substring(0, arrow)
    if (!isValidDexClassDescriptor(owner)) return false

    val open = descriptor.indexOf('(', arrow + 2)
    val close = descriptor.indexOf(')', open + 1)
    if (open <= arrow + 2 || close < open || ')' in descriptor.substring(close + 1)) {
        return false
    }

    val name = descriptor.substring(arrow + 2, open)
    if (
        name.isEmpty() ||
        (name != "<init>" && name != "<clinit>" &&
            name.any { character ->
                character.isWhitespace() ||
                    character == '<' || character == '>' ||
                    character == '/' || character == '.' ||
                    character == ';' || character == '[' ||
                    character == ':' || character == '(' ||
                    character == ')'
            })
    ) return false

    var index = open + 1
    while (index < close) {
        index = dexTypeDescriptorEnd(
            descriptor,
            index,
            allowVoid = false,
        ) ?: return false
        if (index > close) return false
    }
    if (index != close) return false

    val returnEnd = dexTypeDescriptorEnd(
        descriptor,
        close + 1,
        allowVoid = true,
    ) ?: return false
    if (returnEnd != descriptor.length) return false

    val returnType = descriptor.substring(close + 1)
    if (name == "<init>" && returnType != "V") return false
    if (
        name == "<clinit>" &&
        (open + 1 != close || returnType != "V")
    ) return false
    return true
}

/**
 * Matches MenuItemPresenter.onClick(View).
 *
 * The method resolves a menu item's command through Larbe and dispatches it through
 * Larzp. We intercept at the beginning, identify the current menu item by its icon
 * enum, and consume only Pin/Unpin Speed Dial clicks.
 */
internal object PlaylistMenuItemPresenterClassFingerprint : Fingerprint(
    strings = listOf(
        "com/google/android/apps/youtube/music/ui/presenter/MenuItemPresenter"
    ),
    custom = { _, classDef ->
        classDef.methods.any { method ->
            method.name == "onClick" &&
                method.returnType == "V" &&
                method.parameters.map { parameter -> parameter.type } ==
                listOf("Landroid/view/View;")
        }
    },
)

/**
 * Matches the Library RecyclerView/Litho adapter's row-bind method by shape.
 */
internal object PlaylistLithoAdapterBindFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Ljava/util/List;",
            name = "get",
            parameters = listOf("I"),
            returnType = "Ljava/lang/Object;",
        ),
        methodCall(
            parameters = emptyList(),
            returnType = "Lcom/facebook/litho/ComponentTree;",
        ),
    ),
    custom = { method, _ ->
        method.parameters.size == 2 &&
            method.parameters[1].type == "I"
    },
)

/**
 * Matches the factory that converts one adapter source position into an
 * adapter-proxy render-info object.
 */
internal object PlaylistAdapterProxyRenderInfoFingerprint : Fingerprint(
    parameters = listOf("I"),
    filters = listOf(
        methodCall(
            name = "getItem",
            parameters = listOf("I"),
            returnType = "Ljava/lang/Object;",
        ),
    ),
    custom = { method, _ ->
        method.returnType.startsWith("L") ||
            method.returnType.startsWith("[")
    },
)

/**
 * Matches the flyout creation method structurally through its stable bottom-sheet tag.
 * No obfuscated defining-class or method name is required.
 */
internal object PlaylistFlyoutSourceFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("MUSIC_MENU_BOTTOM_SHEET_FRAGMENT_TAG"),
    custom = { method, _ ->
        method.parameters.size == 4 &&
            method.parameters[1].type == "Ljava/lang/Object;" &&
            method.parameters.none { parameter ->
                parameter.type == "Landroid/view/View;"
            }
    },
)

/**
 * Matches YouTube Music's native ordinary command-row factory.
 *
 * The protobuf row, title-message, and command classes are renamed between
 * releases. Match the stable construction shape instead of any obfuscated
 * return type:
 *   - static Context + content-id factory,
 *   - Context.getString(int),
 *   - one String -> protobuf title-message factory,
 *   - one String, String, int, boolean -> protobuf command factory.
 *
 * The concrete row and title types are derived from the matched method when
 * the hook is installed, so this fingerprint spans the buzr, bwpd, bwuu, and
 * bwyn menu-model families without version-number checks.
 */
internal object PlaylistNativeMenuRowFactoryFingerprint : Fingerprint(
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
    ),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/content/Context;",
            name = "getString",
            parameters = listOf("I"),
            returnType = "Ljava/lang/String;",
        ),
        methodCall(
            parameters = listOf("Ljava/lang/String;"),
        ),
        methodCall(
            parameters = listOf(
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "I",
                "Z",
            ),
        ),
    ),
    custom = { method, _ ->
        method.implementation?.let { implementation ->
            val staticReferenceCalls =
                implementation.instructions.mapNotNull { instruction ->
                    if (instruction.opcode != Opcode.INVOKE_STATIC &&
                        instruction.opcode != Opcode.INVOKE_STATIC_RANGE
                    ) {
                        return@mapNotNull null
                    }

                    val reference =
                        (instruction as? ReferenceInstruction)
                            ?.reference as? MethodReference
                                ?: return@mapNotNull null

                    if (!reference.returnType.startsWith("L")) {
                        return@mapNotNull null
                    }

                    reference
                }

            val titleFactoryCount =
                staticReferenceCalls.count { reference ->
                    reference.parameterTypes.map { it.toString() } ==
                        listOf("Ljava/lang/String;")
                }

            val commandFactoryCount =
                staticReferenceCalls.count { reference ->
                    reference.parameterTypes.map { it.toString() } ==
                        listOf(
                            "Ljava/lang/String;",
                            "Ljava/lang/String;",
                            "I",
                            "Z",
                        )
                }

            (method.accessFlags and 0x8) != 0 &&
                method.returnType.startsWith("L") &&
                titleFactoryCount == 1 &&
                commandFactoryCount == 1
        } ?: false
    },
)

/*
 * Exact descriptors are an additive compatibility catalog, not hook logic.
 * The updater appends each newly discovered factory descriptor while keeping
 * every previously verified descriptor. They provide a deterministic first
 * choice when a release contains more than one method with the structural
 * render-info shape. The structural fingerprint remains the fallback,
 * preserving the existing resolution behavior.
 */
// <pin-playlist-updater:bytecode-compatibility-targets>
private object BytecodeCompatibilityTargets {
    val menuItemPresenterClasses = setOf<String>(
    "Lqsz;",
    "Lopb;",
    "Lpto;",
    "Lqce;",
    "Lqbp;",
    "Lpam;",
    "Lqup;",
    "Lqti;",
    "Lqsh;",
    "Lqks;",
    "Lqvq;",
    "Lpwz;",
    )
    val libraryAdapterBindMethods = setOf<String>(
    "Lhyo;->o(Lvv;I)V",
    "Lgzi;->o(Lvv;I)V",
    "Lhre;->o(Luz;I)V",
    "Lhte;->n(Lus;I)V",
    "Lhsi;->n(Luo;I)V",
    "Lhgo;->o(Lut;I)V",
    "Lhyz;->o(Lvt;I)V",
    "Lhxs;->o(Lus;I)V",
    "Lhxs;->o(Lur;I)V",
    "Lhvx;->o(Lus;I)V",
    "Lhzl;->o(Lvt;I)V",
    "Lhsm;->o(Luo;I)V",
    )
    /**
     * Canonical adapter-proxy compatibility records. A null host set explicitly
     * means that the exact factory uses relationship-derived generic host
     * discovery. A non-null host set is one complete strict historical family.
     * Flat factory/host lookups and the strict-family map are derived below so
     * these three views cannot drift independently.
     */
    private val adapterProxyCompatibilityFamilyRecords = listOf<Pair<String, Set<String>?>>(
        "Lbfwu;->h(I)Lhzf;" to setOf(
            "Lbfwu;->a()V",
            "Lbfwu;->b(II)V",
            "Lbfwu;->d(II)V",
        ),
        "Laqom;->g(Ljava/lang/Object;)Lgzy;" to setOf(
            "Laqom;->a()V",
            "Laqom;->b(II)V",
            "Laqom;->d(II)V",
        ),
        "Lazzi;->g(I)Lhrv;" to null,
        "Lbdey;->h(I)Lhtv;" to null,
        "Lbdai;->h(I)Lhsz;" to null,
        "Lawit;->g(I)Lhhe;" to null,
        "Lbegn;->h(I)Lhwo;" to setOf(
            "Lbegn;->a()V", "Lbegn;->b(II)V", "Lbegn;->d(II)V",
        ),
        "Lbfle;->h(I)Lhyj;" to setOf(
            "Lbfle;->a()V", "Lbfle;->b(II)V", "Lbfle;->d(II)V",
        ),
        "Lbfoj;->h(I)Lhyj;" to setOf(
            "Lbfoj;->a()V", "Lbfoj;->b(II)V", "Lbfoj;->d(II)V",
        ),
        "Lbfrh;->h(I)Lhzq;" to setOf(
            "Lbfrh;->a()V", "Lbfrh;->b(II)V", "Lbfrh;->d(II)V",
        ),
        "Lbfwp;->h(I)Liac;" to setOf(
            "Lbfwp;->a()V", "Lbfwp;->b(II)V", "Lbfwp;->d(II)V",
        ),
        "Lbbmw;->g(I)Lhtd;" to setOf(
            "Lbbmw;->a()V", "Lbbmw;->b(II)V", "Lbbmw;->d(II)V",
        ),
    )
    val adapterProxyRenderInfoFactoryMethods =
        adapterProxyCompatibilityFamilyRecords
            .mapTo(linkedSetOf()) { (factory, _) -> factory }
    val adapterProxyMutationHostFamilies =
        adapterProxyCompatibilityFamilyRecords
            .mapNotNull { (factory, hosts) ->
                hosts?.let { factory to it }
            }
            .toMap(linkedMapOf())
    val adapterProxyMutationHostMethods =
        adapterProxyMutationHostFamilies.values
            .flatten()
            .toCollection(linkedSetOf())
    val playlistFlyoutSourceMethods = setOf<String>(
    "Lqnb;->j(Lbxhr;Ljava/lang/Object;Lqno;Lasee;)V",
    "Lojm;->j(Lbdip;Ljava/lang/Object;Lojy;Lafya;)V",
    "Lpny;->j(Lboxp;Ljava/lang/Object;Lpol;Lanws;)V",
    "Lpwn;->j(Lbtmb;Ljava/lang/Object;Lpxa;Laqgj;)V",
    "Lpvz;->j(Lbtgg;Ljava/lang/Object;Lpwm;Laqeb;)V",
    "Loux;->j(Lbksx;Ljava/lang/Object;Lovk;Lalaz;)V",
    "Lqot;->j(Lbwyr;Ljava/lang/Object;Lqpg;Laryl;)V",
    "Lqnm;->j(Lbwuy;Ljava/lang/Object;Lqnz;Larxi;)V",
    "Lqml;->j(Lbwph;Ljava/lang/Object;Lqmy;Larva;)V",
    "Lqew;->j(Lbuzv;Ljava/lang/Object;Lqfj;Larcv;)V",
    "Lqpt;->j(Lbxgb;Ljava/lang/Object;Lqqg;Lasdg;)V",
    "Lprj;->j(Lbqwm;Ljava/lang/Object;Lprw;Laoyy;)V",
    )
    val nativeMenuRowFactoryMethods = setOf<String>(
    "Lpbc;->e(Landroid/content/Context;Ljava/lang/String;)Lbxhl;",
    "Lnhb;->e(Landroid/content/Context;Ljava/lang/String;)Lbdil;",
    "Loio;->f(Landroid/content/Context;Ljava/lang/String;)Lboxl;",
    "Losc;->e(Landroid/content/Context;Ljava/lang/String;)Lbtlx;",
    "Loqt;->e(Landroid/content/Context;Ljava/lang/String;)Lbtgc;",
    "Lnrv;->f(Landroid/content/Context;Ljava/lang/String;)Lbkst;",
    "Lpcz;->e(Landroid/content/Context;Ljava/lang/String;)Lbwyn;",
    "Lpbr;->e(Landroid/content/Context;Ljava/lang/String;)Lbwuu;",
    "Lpbk;->e(Landroid/content/Context;Ljava/lang/String;)Lbwpd;",
    "Lozz;->e(Landroid/content/Context;Ljava/lang/String;)Lbuzr;",
    "Lpdt;->e(Landroid/content/Context;Ljava/lang/String;)Lbxfx;",
    "Lomc;->e(Landroid/content/Context;Ljava/lang/String;)Lbqwi;",
    )

    init {
        menuItemPresenterClasses.forEach { descriptor ->
            check(isValidDexClassDescriptor(descriptor)) {
                "Invalid exact class catalog descriptor: " + descriptor
            }
        }
        listOf(
            libraryAdapterBindMethods,
            adapterProxyRenderInfoFactoryMethods,
            adapterProxyMutationHostMethods,
            playlistFlyoutSourceMethods,
            nativeMenuRowFactoryMethods,
        ).forEach { descriptors ->
            descriptors.forEach { descriptor ->
                check(isValidDexMethodDescriptor(descriptor)) {
                    "Invalid exact method catalog descriptor: " + descriptor
                }
            }
        }
        adapterProxyMutationHostFamilies.forEach { (factory, hosts) ->
            check(factory in adapterProxyRenderInfoFactoryMethods) {
                "Historical mutation-host family has no exact factory: " +
                    factory
            }
            check(hosts.isNotEmpty() && hosts.all { descriptor ->
                descriptor in adapterProxyMutationHostMethods
            }) {
                "Historical mutation-host family is incomplete: " + factory
            }
        }
        check(
            adapterProxyCompatibilityFamilyRecords.size ==
                adapterProxyRenderInfoFactoryMethods.size
        ) { "Duplicate exact adapter-proxy factory descriptor" }
        val familyHosts = adapterProxyMutationHostFamilies.values.flatten()
        check(familyHosts.size == familyHosts.toSet().size) {
            "Mutation-host descriptor belongs to more than one family"
        }
        check(familyHosts.toSet() == adapterProxyMutationHostMethods) {
            "Orphaned exact mutation-host descriptor"
        }
    }
}
// </pin-playlist-updater:bytecode-compatibility-targets>

private object PlaylistMenuItemPresenterExactFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type in BytecodeCompatibilityTargets.menuItemPresenterClasses &&
            method.name == "onClick" &&
            method.returnType == "V" &&
            method.parameters.map { parameter -> parameter.type } ==
                listOf("Landroid/view/View;")
    },
)

private object PlaylistLithoAdapterBindExactFingerprint : Fingerprint(
    custom = { method, _ ->
        methodDescriptor(method) in
            BytecodeCompatibilityTargets.libraryAdapterBindMethods
    },
)

private object PlaylistAdapterProxyRenderInfoExactFingerprint : Fingerprint(
    custom = { method, _ ->
        methodDescriptor(method) in
            BytecodeCompatibilityTargets.adapterProxyRenderInfoFactoryMethods
    },
)

private object PlaylistFlyoutSourceExactFingerprint : Fingerprint(
    custom = { method, _ ->
        methodDescriptor(method) in
            BytecodeCompatibilityTargets.playlistFlyoutSourceMethods
    },
)

private object PlaylistNativeMenuRowFactoryExactFingerprint : Fingerprint(
    custom = { method, _ ->
        methodDescriptor(method) in
            BytecodeCompatibilityTargets.nativeMenuRowFactoryMethods
    },
)

private const val MUTATION_FLOW_UNKNOWN = 0
private const val MUTATION_FLOW_OBJECT = 1
private const val MUTATION_FLOW_FACTORY_RESULT = 2
private const val MUTATION_FLOW_LIST = 3
private const val MUTATION_FLOW_TAINTED_SOURCE_ID = Int.MIN_VALUE

private data class MutationFlowValue(
    val kind: Int,
    val objectToken: String? = null,
    val sourceId: Int = -1,
    val listToken: Int = -1,
)

private data class MutationFactorySource(
    val id: Int,
    val invokeIndex: Int,
    val receiverRegister: Int,
    val receiverToken: String,
)

private data class ItemConverterSourceSite(
    val getItemIndex: Int,
    val factoryIndex: Int,
    val sourceAdapterRegister: Int,
    val sourceIndexRegister: Int,
    val sourceObjectRegister: Int,
    val factoryReceiverRegister: Int,
    val sourceCountMethodDescriptor: String = "",
    val sourceCountInvokeOpcode: String = "",
)

private data class ItemConverterCountProof(
    val sourceAdapterIdentity: String,
    val methodDescriptor: String,
    val invokeOpcode: String,
    val producerHostDescriptor: String,
    val producerIndex: Int,
    val boundIndex: Int,
)

internal fun expectedRemapHookCount(
    isPositionRenderInfoFactory: Boolean,
    itemConverterSourceSiteCount: Int,
): Int {
    require(itemConverterSourceSiteCount >= 0)

    return if (isPositionRenderInfoFactory) {
        check(itemConverterSourceSiteCount == 0)
        1
    } else {
        itemConverterSourceSiteCount
    }
}

internal fun renderItemConverterPreGetItemInjection(
    ownerScratchRegister: Int,
    sourceIndexScratchRegister: Int,
    sourceAdapterScratchRegister: Int,
    sourceCountScratchRegister: Int,
    factoryReceiverRegister: Int,
    sourceIndexRegister: Int,
    sourceAdapterRegister: Int,
    countInvokeOpcode: String,
    countMethodDescriptor: String,
): String = """
    move-object/16 v$ownerScratchRegister, v$factoryReceiverRegister
    move/16 v$sourceIndexScratchRegister, v$sourceIndexRegister
    move-object/16 v$sourceAdapterScratchRegister, v$sourceAdapterRegister
    invoke-static/range {v$ownerScratchRegister .. v$sourceIndexScratchRegister}, $EXTENSION_CLASS->beginAdapterProxyRenderInfo(Ljava/lang/Object;I)V
    $countInvokeOpcode {v$sourceAdapterScratchRegister .. v$sourceAdapterScratchRegister}, $countMethodDescriptor
    move-result v$sourceCountScratchRegister
    invoke-static/range {v$sourceAdapterScratchRegister .. v$sourceCountScratchRegister}, $EXTENSION_CLASS->captureAdapterProxySourceAdapter(Ljava/lang/Object;I)V
    invoke-static/range {v$sourceIndexScratchRegister .. v$sourceIndexScratchRegister}, $EXTENSION_CLASS->remapActiveAdapterProxySourcePosition(I)I
    move-result v$sourceIndexScratchRegister
    move/16 v$sourceIndexRegister, v$sourceIndexScratchRegister
"""

internal fun renderItemConverterPostGetItemInjection(
    sourceObjectScratchRegister: Int,
    sourceObjectRegister: Int,
): String = """
    move-object/16 v$sourceObjectScratchRegister, v$sourceObjectRegister
    invoke-static/range {v$sourceObjectScratchRegister .. v$sourceObjectScratchRegister}, $EXTENSION_CLASS->captureAdapterProxySourceObject(Ljava/lang/Object;)V
"""

private data class MutationHostPlan(
    val factoryCaptureSites: List<Pair<Int, Int>>,
    val controllerHookSites: List<Pair<Int, Int>>,
    val unsupportedControllerCalls: Int,
    val proofKind: String = "SAME_METHOD",
    val helperDescriptor: String? = null,
    val helperInvocationIndex: Int = -1,
    val helperArgumentPosition: Int = -1,
    val helperFormalParameterRegister: Int = -1,
    val helperControllerSubmissionIndex: Int = -1,
    val factoryReceiverRegister: Int = -1,
    val methodBoundaryDepth: Int = 0,
)

private data class OneHopSubmission(
    val invokeIndex: Int,
    val listRegister: Int,
    val listParameterIndex: Int,
)

private data class OneHopHelperProof(
    val helper: Method,
    val argumentPosition: Int,
    val formalParameterRegister: Int,
    val controllerSubmissionIndex: Int,
)

private fun unknownMutationValue() = MutationFlowValue(MUTATION_FLOW_UNKNOWN)
private fun objectMutationValue(token: String) =
    MutationFlowValue(MUTATION_FLOW_OBJECT, objectToken = token)
private fun factoryMutationValue(sourceId: Int) =
    MutationFlowValue(MUTATION_FLOW_FACTORY_RESULT, sourceId = sourceId)
private fun listMutationValue(listToken: Int) =
    MutationFlowValue(MUTATION_FLOW_LIST, listToken = listToken)

private fun mutationOpcodeName(
    instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction,
): String = instruction.opcode.name
    .uppercase()
    .replace('-', '_')
    .replace('/', '_')

private fun reflectedInstructionInt(
    instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction,
    methodName: String,
): Int? = runCatching {
    (instruction.javaClass.methods.firstOrNull { method ->
        method.name == methodName && method.parameterCount == 0
    }?.invoke(instruction) as? Number)?.toInt()
}.getOrNull()

private fun mutationRegisterA(
    instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction,
): Int? =
    (instruction as? OneRegisterInstruction)?.registerA
        ?: reflectedInstructionInt(instruction, "getRegisterA")

private fun mutationRegisterB(
    instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction,
): Int? =
    (instruction as? TwoRegisterInstruction)?.registerB
        ?: reflectedInstructionInt(instruction, "getRegisterB")

private fun mutationInstructionCodeUnits(
    instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction,
): Int? = reflectedInstructionInt(instruction, "getCodeUnits")
    ?.coerceAtLeast(1)

private fun mutationInstructionCodeOffset(
    instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction,
): Int? = reflectedInstructionInt(instruction, "getCodeOffset")

private fun mutationInvokeRegisters(
    instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction,
): List<Int>? = when (instruction) {
    is FiveRegisterInstruction ->
        listOf(
            instruction.registerC,
            instruction.registerD,
            instruction.registerE,
            instruction.registerF,
            instruction.registerG,
        ).take(instruction.registerCount)

    is RegisterRangeInstruction ->
        (instruction.startRegister until
            instruction.startRegister + instruction.registerCount).toList()

    else -> null
}

private fun mutationIsStaticInvoke(
    instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction,
): Boolean = instruction.opcode == Opcode.INVOKE_STATIC ||
    instruction.opcode == Opcode.INVOKE_STATIC_RANGE

private fun mutationIsDirectInvoke(
    instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction,
): Boolean {
    val opcode = mutationOpcodeName(instruction)
    return opcode == "INVOKE_DIRECT" || opcode == "INVOKE_DIRECT_RANGE"
}

private fun mutationIsControllerDispatchInvoke(
    instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction,
): Boolean {
    // Detached-copy substitution is safe only when virtual dispatch is sealed
    // by a final declaring class or final target method. Interface dispatch is
    // rejected because an unproved implementation may observe List identity.
    val opcode = mutationOpcodeName(instruction)
    return opcode == "INVOKE_VIRTUAL" ||
        opcode == "INVOKE_VIRTUAL_RANGE"
}


private fun mutationControllerDispatchTargetIsSealed(
    ownerAccessFlags: Int,
    methodAccessFlags: Int,
): Boolean =
    (ownerAccessFlags and 0x10) != 0 ||
        (methodAccessFlags and 0x10) != 0

private fun mutationInvokeParameterRegister(
    instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction,
    reference: MethodReference,
    parameterIndex: Int,
): Int? {
    val parameters = reference.parameterTypes.map { it.toString() }
    if (parameterIndex !in parameters.indices) return null
    var word = if (mutationIsStaticInvoke(instruction)) 0 else 1
    for (index in 0 until parameterIndex) {
        word += if (parameters[index] == "J" || parameters[index] == "D") 2 else 1
    }
    return mutationInvokeRegisters(instruction)?.getOrNull(word)
}

private fun mutationInvokeMatchesReference(
    instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction,
    reference: MethodReference,
): Boolean {
    val expectedWords =
        (if (mutationIsStaticInvoke(instruction)) 0 else 1) +
            reference.parameterTypes.fold(0) { total, parameter ->
                val type = parameter.toString()
                total + if (type == "J" || type == "D") 2 else 1
            }
    return mutationInvokeRegisters(instruction)?.size == expectedWords
}

private fun mutationMethodParameterWordCount(
    method: com.android.tools.smali.dexlib2.iface.Method,
): Int =
    (if ((method.accessFlags and 0x8) == 0) 1 else 0) +
        method.parameters.fold(0) { total, parameter ->
            total + if (
                parameter.type == "J" || parameter.type == "D"
            ) 2 else 1
        }

private fun mutationHasTryBlocks(implementation: Any): Boolean {
    val getter = implementation.javaClass.methods.firstOrNull { method ->
        method.name == "getTryBlocks" && method.parameterCount == 0
    } ?: return true
    val value = runCatching { getter.invoke(implementation) }.getOrNull()
        ?: return true
    return when (value) {
        is Iterable<*> -> value.iterator().hasNext()
        is Array<*> -> value.isNotEmpty()
        else -> true
    }
}

private fun mutationReachableStraightLineBlocks(
    instructions: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>,
): List<IntRange>? {
    if (instructions.isEmpty()) return emptyList()

    val hasBranch = instructions.any { instruction ->
        val opcode = mutationOpcodeName(instruction)
        opcode.startsWith("IF_") || opcode.startsWith("GOTO")
    }
    val offsets = mutableListOf<Int>()
    val offsetToIndex = mutableMapOf<Int, Int>()
    var offset = 0
    instructions.forEachIndexed { index, instruction ->
        offsets += offset
        offsetToIndex[offset] = index
        val opcode = mutationOpcodeName(instruction)
        if (
            "SWITCH" in opcode ||
            opcode.endsWith("PAYLOAD") ||
            opcode == "FILL_ARRAY_DATA"
        ) return null
        val codeUnits = mutationInstructionCodeUnits(instruction)
        if (codeUnits == null && hasBranch) return null
        offset += codeUnits ?: 1
    }

    val starts = sortedSetOf(0)
    instructions.forEachIndexed { index, instruction ->
        val opcode = mutationOpcodeName(instruction)
        val conditional = opcode.startsWith("IF_")
        val unconditional = opcode.startsWith("GOTO")
        if (conditional || unconditional) {
            val relativeOffset = mutationInstructionCodeOffset(instruction)
                ?: return null
            val target = offsetToIndex[offsets[index] + relativeOffset]
                ?: return null
            starts += target
            if (index + 1 < instructions.size) starts += index + 1
        } else if (opcode.startsWith("RETURN") || opcode == "THROW") {
            if (index + 1 < instructions.size) starts += index + 1
        }
    }

    val sortedStarts = starts.toList()
    val blocksByStart = linkedMapOf<Int, IntRange>()
    sortedStarts.forEachIndexed { index, start ->
        val endExclusive = sortedStarts.getOrNull(index + 1) ?: instructions.size
        if (start < endExclusive) blocksByStart[start] = start until endExclusive
    }

    val reachable = linkedSetOf(0)
    val queue = mutableListOf(0)
    var cursor = 0
    while (cursor < queue.size) {
        val start = queue[cursor++]
        val block = blocksByStart[start] ?: return null
        val lastIndex = block.last
        val opcode = mutationOpcodeName(instructions[lastIndex])
        val successors = mutableListOf<Int>()
        if (opcode.startsWith("IF_") || opcode.startsWith("GOTO")) {
            val relativeOffset = mutationInstructionCodeOffset(instructions[lastIndex])
                ?: return null
            val target = offsetToIndex[offsets[lastIndex] + relativeOffset]
                ?: return null
            if (target !in blocksByStart) return null
            successors += target
            if (opcode.startsWith("IF_") && block.last + 1 < instructions.size) {
                successors += block.last + 1
            }
        } else if (!opcode.startsWith("RETURN") && opcode != "THROW") {
            if (block.last + 1 < instructions.size) successors += block.last + 1
        }
        successors.forEach { successor ->
            if (successor !in blocksByStart) return null
            if (reachable.add(successor)) queue += successor
        }
    }

    return sortedStarts.filter { it in reachable }.map { blocksByStart.getValue(it) }
}

private fun mutationDefinitelyOverwritesRegister(
    instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction,
    register: Int,
): Boolean {
    if (mutationRegisterA(instruction) != register) return false
    val opcode = mutationOpcodeName(instruction)
    if (
        opcode.startsWith("MOVE_RESULT") || opcode.startsWith("CONST") ||
        opcode.startsWith("NEW_") || opcode.startsWith("SGET")
    ) return true
    if (
        opcode.startsWith("MOVE") && opcode != "MOVE_EXCEPTION" ||
        opcode.startsWith("IGET") || opcode.startsWith("AGET")
    ) {
        listOf(
            "getRegisterB", "getRegisterC", "getRegisterD",
            "getRegisterE", "getRegisterF", "getRegisterG",
        ).forEach { getter ->
            if (reflectedInstructionInt(instruction, getter) == register) {
                return false
            }
        }
        return mutationRegisterB(instruction) != null
    }
    return false
}

private fun mutationOverwritesRegisterWithoutReading(
    instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction,
    register: Int,
): Boolean {
    val opcode = mutationOpcodeName(instruction)
    if (
        !mutationWritesRegisterA(opcode) ||
        mutationRegisterA(instruction) != register
    ) return false
    if (
        opcode.startsWith("MOVE_RESULT") || opcode.startsWith("CONST") ||
        opcode.startsWith("NEW_") || opcode.startsWith("SGET")
    ) return true
    listOf(
        "getRegisterB", "getRegisterC", "getRegisterD",
        "getRegisterE", "getRegisterF", "getRegisterG",
    ).forEach { getter ->
        if (reflectedInstructionInt(instruction, getter) == register) {
            return false
        }
    }
    return mutationRegisterB(instruction) != null
}

private fun mutationConsumedRegisterIsNotReadAgain(
    instructions: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>,
    successors: Map<Int, List<Int>>,
    scope: Set<Int>,
    consumeIndex: Int,
    register: Int,
): Boolean {
    val queue = mutableListOf<Pair<Int, Boolean>>()
    successors[consumeIndex].orEmpty()
        .filter { it in scope }
        .forEach { queue += it to true }
    val visited = mutableSetOf<Pair<Int, Boolean>>()
    var cursor = 0
    while (cursor < queue.size) {
        val (index, initiallyLive) = queue[cursor++]
        if (!visited.add(index to initiallyLive)) continue
        var live = initiallyLive
        val instruction = instructions[index]
        if (
            live && register in mutationAllInstructionRegisters(instruction)
        ) {
            if (mutationOverwritesRegisterWithoutReading(
                    instruction, register,
                )
            ) live = false else return false
        }
        successors[index].orEmpty()
            .filter { it in scope }
            .forEach { queue += it to live }
    }
    return true
}

private fun mutationWritesRegisterA(opcode: String): Boolean {
    if (
        opcode.isEmpty() || opcode == "NOP" ||
        opcode.startsWith("RETURN") || opcode == "THROW" ||
        opcode.startsWith("MONITOR_") || opcode.startsWith("IF_") ||
        opcode.startsWith("GOTO") || "SWITCH" in opcode ||
        opcode.startsWith("INVOKE_") || opcode.startsWith("IPUT") ||
        opcode.startsWith("SPUT") || opcode.startsWith("APUT") ||
        opcode == "FILL_ARRAY_DATA" || opcode == "CHECK_CAST"
    ) return false

    return opcode.startsWith("MOVE") || opcode.startsWith("CONST") ||
        opcode.startsWith("NEW_") || opcode == "ARRAY_LENGTH" ||
        opcode == "INSTANCE_OF" || opcode.startsWith("IGET") ||
        opcode.startsWith("SGET") || opcode.startsWith("AGET") ||
        opcode.startsWith("CMP") || opcode.startsWith("NEG") ||
        opcode.startsWith("NOT") || "_TO_" in opcode ||
        opcode.startsWith("ADD") || opcode.startsWith("SUB") ||
        opcode.startsWith("RSUB") || opcode.startsWith("MUL") ||
        opcode.startsWith("DIV") || opcode.startsWith("REM") ||
        opcode.startsWith("AND") || opcode.startsWith("OR") ||
        opcode.startsWith("XOR") || opcode.startsWith("SHL") ||
        opcode.startsWith("SHR") || opcode.startsWith("USHR")
}

private fun mutationIsCollectionType(type: String): Boolean = type in setOf(
    "Ljava/util/List;",
    "Ljava/util/Collection;",
    "Ljava/util/ArrayList;",
    "Ljava/util/LinkedList;",
    "Ljava/util/AbstractList;",
    "Ljava/util/AbstractCollection;",
    "Ljava/util/Vector;",
    "Ljava/util/Stack;",
    "Ljava/util/concurrent/CopyOnWriteArrayList;",
)

private fun mutationIsProvenEmptyMutableListConstructor(
    reference: MethodReference,
): Boolean {
    if (
        reference.name != "<init>" ||
        reference.returnType != "V" ||
        reference.definingClass != "Ljava/util/ArrayList;"
    ) return false
    val parameters = reference.parameterTypes.map { it.toString() }
    return parameters.isEmpty() || parameters == listOf("I")
}

private fun mutationIsMutableListCopyConstructor(
    reference: MethodReference,
): Boolean =
    reference.name == "<init>" &&
        reference.returnType == "V" &&
        reference.definingClass == "Ljava/util/ArrayList;" &&
        reference.parameterTypes.map { it.toString() } ==
            listOf("Ljava/util/Collection;")

private fun mutationObjectIdentityBefore(
    method: Method,
    instructions: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>,
    flow: MutationNormalFlow,
    useIndex: Int,
    register: Int,
    depth: Int = 0,
): String? {
    if (depth > 12 || useIndex !in instructions.indices) return null
    val implementation = method.implementation ?: return null
    val thisRegister = implementation.registerCount -
        mutationMethodParameterWordCount(method)

    val definitions = (0 until useIndex).filter { index ->
        val instruction = instructions[index]
        mutationWritesRegisterA(mutationOpcodeName(instruction)) &&
            mutationRegisterA(instruction) == register
    }
    val definitionIndex = definitions.lastOrNull() ?: return when {
        (method.accessFlags and 0x8) == 0 && register == thisRegister ->
            "this:" + method.definingClass
        register >= thisRegister -> "parameter:" +
            method.definingClass + ":" + (register - thisRegister)
        else -> null
    }
    if (definitionIndex !in flow.dominators[useIndex].orEmpty()) return null

    val instruction = instructions[definitionIndex]
    val opcode = mutationOpcodeName(instruction)
    return when {
        opcode.startsWith("MOVE_OBJECT") -> {
            val source = mutationRegisterB(instruction) ?: return null
            mutationObjectIdentityBefore(
                method, instructions, flow, definitionIndex, source, depth + 1,
            )
        }
        opcode.startsWith("IGET_OBJECT") -> {
            val reference = (instruction as? ReferenceInstruction)
                ?.reference as? FieldReference ?: return null
            val ownerRegister = mutationRegisterB(instruction) ?: return null
            val ownerIdentity = mutationObjectIdentityBefore(
                method,
                instructions,
                flow,
                definitionIndex,
                ownerRegister,
                depth + 1,
            ) ?: return null
            "field:" + reference.definingClass + "->" + reference.name +
                ":" + reference.type + "@" + ownerIdentity
        }
        else -> null
    }
}

private fun mutationItemConverterCountProof(
    hosts: Map<String, Method>,
    sitesByHost: Map<String, List<ItemConverterSourceSite>>,
): ItemConverterCountProof? {
    if (hosts.isEmpty() || sitesByHost.keys != hosts.keys) return null

    var familyIdentity: String? = null
    val candidates = mutableListOf<ItemConverterCountProof>()
    hosts.forEach { (hostDescriptor, host) ->
        val implementation = host.implementation ?: return null
        val instructions = implementation.instructions.toList()
        val flow = mutationNormalFlow(instructions) ?: return null
        val sites = sitesByHost[hostDescriptor].orEmpty()
        if (sites.isEmpty()) return null

        val identities = sites.map { site ->
            mutationObjectIdentityBefore(
                host,
                instructions,
                flow,
                site.getItemIndex,
                site.sourceAdapterRegister,
            ) ?: return null
        }.distinct()
        if (identities.size != 1) return null
        val identity = identities.single()
        if (familyIdentity == null) familyIdentity = identity
        if (familyIdentity != identity) return null

        instructions.forEachIndexed { invokeIndex, instruction ->
            val reference = (instruction as? ReferenceInstruction)
                ?.reference as? MethodReference ?: return@forEachIndexed
            if (
                mutationIsStaticInvoke(instruction) ||
                reference.returnType != "I" ||
                reference.parameterTypes.isNotEmpty() ||
                !mutationInvokeMatchesReference(instruction, reference) ||
                invokeIndex + 1 !in instructions.indices ||
                mutationOpcodeName(instruction).let { opcode ->
                    opcode != "INVOKE_INTERFACE" &&
                        opcode != "INVOKE_INTERFACE_RANGE" &&
                        opcode != "INVOKE_VIRTUAL" &&
                        opcode != "INVOKE_VIRTUAL_RANGE"
                }
            ) return@forEachIndexed
            val receiver = mutationInvokeRegisters(instruction)
                ?.firstOrNull() ?: return@forEachIndexed
            if (
                mutationObjectIdentityBefore(
                    host, instructions, flow, invokeIndex, receiver,
                ) != identity
            ) return@forEachIndexed
            val moveResult = instructions[invokeIndex + 1]
            if (mutationOpcodeName(moveResult) != "MOVE_RESULT") {
                return@forEachIndexed
            }
            val countRegister = mutationRegisterA(moveResult)
                ?: return@forEachIndexed

            val dominatedSites = sites.filter { site ->
                invokeIndex in flow.dominators[site.getItemIndex].orEmpty() &&
                    invokeIndex + 1 in
                    flow.dominators[site.getItemIndex].orEmpty()
            }
            if (dominatedSites.isEmpty()) return@forEachIndexed
            val boundIndexes = instructions.indices.filter { branchIndex ->
                val opcode = mutationOpcodeName(instructions[branchIndex])
                opcode.startsWith("IF_") &&
                    countRegister in
                    mutationAllInstructionRegisters(instructions[branchIndex]) &&
                    dominatedSites.all { site ->
                        site.sourceIndexRegister in mutationAllInstructionRegisters(
                            instructions[branchIndex],
                        ) &&
                            branchIndex in
                            flow.dominators[site.getItemIndex].orEmpty()
                    }
            }
            if (boundIndexes.size != 1) return@forEachIndexed
            candidates += ItemConverterCountProof(
                identity,
                methodDescriptor(reference),
                if (mutationOpcodeName(instruction).endsWith("_RANGE")) {
                    mutationOpcodeName(instruction)
                        .lowercase().replace('_', '-')
                } else {
                    mutationOpcodeName(instruction)
                        .lowercase().replace('_', '-') + "/range"
                },
                hostDescriptor,
                invokeIndex,
                boundIndexes.single(),
            )
        }
    }

    val unique = candidates.distinctBy { candidate ->
        candidate.methodDescriptor to candidate.invokeOpcode
    }
    return unique.singleOrNull()
}

private fun mutationItemConverterSourceSites(
    caller: Method,
    producer: Method,
): List<ItemConverterSourceSite>? {
    val implementation = caller.implementation ?: return null
    if (
        producer.implementation == null ||
        (producer.accessFlags and 0x8) != 0 ||
        producer.parameters.size != 1 ||
        !producer.parameters.single().type.let(::mutationIsReferenceDexType) ||
        !mutationIsReferenceDexType(producer.returnType) ||
        producer.definingClass != caller.definingClass ||
        (caller.accessFlags and 0x8) != 0
    ) return null

    val thisRegister = implementation.registerCount -
        mutationMethodParameterWordCount(caller)
    val code = implementation.instructions.toList()
    val producerDescriptor = methodDescriptor(producer)
    val sites = mutableListOf<ItemConverterSourceSite>()
    var invocationCount = 0
    code.forEachIndexed { factoryIndex, factoryInvoke ->
        val factoryReference = (factoryInvoke as? ReferenceInstruction)
            ?.reference as? MethodReference ?: return@forEachIndexed
        if (methodDescriptor(factoryReference) != producerDescriptor) {
            return@forEachIndexed
        }
        invocationCount++
        if (
            factoryIndex < 2 || factoryIndex + 2 >= code.size ||
            !mutationIsDirectInvoke(factoryInvoke) ||
            !mutationInvokeMatchesReference(factoryInvoke, factoryReference)
        ) return null

        val getItemInvoke = code[factoryIndex - 2]
        val getItemReference = (getItemInvoke as? ReferenceInstruction)
            ?.reference as? MethodReference ?: return null
        val sourceMove = code[factoryIndex - 1]
        val resultMove = code[factoryIndex + 1]
        val addInvoke = code[factoryIndex + 2]
        val addReference = (addInvoke as? ReferenceInstruction)
            ?.reference as? MethodReference ?: return null
        if (
            getItemReference.name != "getItem" ||
            getItemReference.returnType != "Ljava/lang/Object;" ||
            getItemReference.parameterTypes.map { it.toString() } !=
                listOf("I") ||
            mutationIsStaticInvoke(getItemInvoke) ||
            !mutationInvokeMatchesReference(
                getItemInvoke, getItemReference,
            ) ||
            mutationOpcodeName(sourceMove) != "MOVE_RESULT_OBJECT" ||
            mutationOpcodeName(resultMove) != "MOVE_RESULT_OBJECT" ||
            mutationIsStaticInvoke(addInvoke) ||
            !mutationInvokeMatchesReference(addInvoke, addReference) ||
            !mutationIsCollectionType(addReference.definingClass) ||
            addReference.name != "add" || addReference.returnType != "Z" ||
            addReference.parameterTypes.map { it.toString() } !=
                listOf("Ljava/lang/Object;")
        ) return null

        val sourceAdapter = mutationInvokeRegisters(getItemInvoke)
            ?.firstOrNull() ?: return null
        val sourceIndex = mutationInvokeParameterRegister(
            getItemInvoke, getItemReference, 0,
        ) ?: return null
        val sourceObject = mutationRegisterA(sourceMove) ?: return null
        val factoryReceiver = mutationInvokeRegisters(factoryInvoke)
            ?.firstOrNull() ?: return null
        val factoryArgument = mutationInvokeParameterRegister(
            factoryInvoke, factoryReference, 0,
        ) ?: return null
        val factoryResult = mutationRegisterA(resultMove) ?: return null
        val addedResult = mutationInvokeParameterRegister(
            addInvoke, addReference, 0,
        ) ?: return null
        if (
            factoryReceiver != thisRegister ||
            factoryArgument != sourceObject ||
            addedResult != factoryResult ||
            sourceAdapter == factoryReceiver
        ) return null
        sites += ItemConverterSourceSite(
            factoryIndex - 2,
            factoryIndex,
            sourceAdapter,
            sourceIndex,
            sourceObject,
            factoryReceiver,
        )
    }
    return sites.takeIf {
        invocationCount >= 1 && sites.size == invocationCount
    }
}

private fun mutationMethodParameterRegister(
    method: com.android.tools.smali.dexlib2.iface.Method,
    parameterIndex: Int,
): Int? {
    val implementation = method.implementation ?: return null
    val parameters = method.parameters.map { it.type }
    if (parameterIndex !in parameters.indices) return null
    var register = implementation.registerCount -
        mutationMethodParameterWordCount(method) +
        if ((method.accessFlags and 0x8) == 0) 1 else 0
    for (index in 0 until parameterIndex) {
        register += if (
            parameters[index] == "J" || parameters[index] == "D"
        ) 2 else 1
    }
    return register
}

private fun mutationSafeExtensionalListRead(
    instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction,
    liveAliases: Set<Int>,
): Boolean {
    val reference = (instruction as? ReferenceInstruction)
        ?.reference as? MethodReference ?: return false
    if (
        mutationInvokeRegisters(instruction) == null ||
        mutationIsStaticInvoke(instruction) ||
        !mutationInvokeMatchesReference(instruction, reference) ||
        reference.definingClass != "Ljava/util/List;"
    ) return false
    val parameters = reference.parameterTypes.map { it.toString() }
    val allowed =
        (reference.name == "size" && reference.returnType == "I" &&
            parameters.isEmpty()) ||
            (reference.name == "get" &&
                reference.returnType == "Ljava/lang/Object;" &&
                parameters == listOf("I"))
    if (!allowed) return false
    val registers = mutationInvokeRegisters(instruction) ?: return false
    val receiver = registers.firstOrNull() ?: return false
    if (receiver !in liveAliases) return false
    return registers.drop(1).none { it in liveAliases }
}

private fun mutationControllerListParameterIsContentOnly(
    method: com.android.tools.smali.dexlib2.iface.Method,
    listParameterIndex: Int,
): Boolean {
    val implementation = method.implementation ?: return false
    if (
        method.name == "<init>" || method.name == "<clinit>" ||
        method.returnType != "V"
    ) return false
    val instructions = implementation.instructions.toList()
    if (instructions.isEmpty()) return false
    val parameterRegister = mutationMethodParameterRegister(
        method,
        listParameterIndex,
    ) ?: return false
    val normal = mutationNormalFlow(instructions) ?: return false
    val tryRegions = mutationTryRegions(
        implementation,
        instructions,
    ) ?: return false

    // Normal and exceptional edges require separate transfer states. A
    // throwing instruction may complete a destination write only on its normal
    // edge; an exception handler must conservatively retain the aliases that
    // were live before the instruction executed.
    val exceptionalSuccessors = mutableMapOf<Int, MutableList<Int>>()
    tryRegions.forEach { region ->
        for (index in region.startIndex until region.endIndexExclusive) {
            val handlers = exceptionalSuccessors.getOrPut(index) {
                mutableListOf()
            }
            region.handlers.forEach { handler ->
                if (handler.handlerIndex !in handlers) {
                    handlers += handler.handlerIndex
                }
            }
        }
    }

    val aliasesAt = mutableMapOf(
        0 to mutableSetOf(parameterRegister),
    )
    val queue = mutableListOf(0)
    var cursor = 0
    while (cursor < queue.size) {
        val index = queue[cursor++]
        val live = aliasesAt[index]?.toSet() ?: continue
        val instruction = instructions[index]
        val registers = mutationAllInstructionRegisters(instruction)
        val safeRead = mutationSafeExtensionalListRead(
            instruction,
            live,
        )
        val normalLive = live.toMutableSet()
        live.forEach { alias ->
            if (alias !in registers) return@forEach
            if (safeRead) {
                val receiver = mutationInvokeRegisters(instruction)
                    ?.firstOrNull()
                if (receiver == alias) return@forEach
            }
            if (mutationDefinitelyOverwritesRegister(instruction, alias)) {
                normalLive.remove(alias)
            } else {
                return false
            }
        }

        val normalNext = normal.successors[index] ?: return false
        normalNext.forEach { successor ->
            val state = aliasesAt.getOrPut(successor) { mutableSetOf() }
            if (state.addAll(normalLive)) queue += successor
        }

        // The exceptional transfer starts from the pre-instruction state.
        // This prevents an IGET/AGET/invoke result or other throwing overwrite
        // from erasing the original List identity along a handler edge.
        exceptionalSuccessors[index].orEmpty().forEach { handler ->
            val state = aliasesAt.getOrPut(handler) { mutableSetOf() }
            if (state.addAll(live)) queue += handler
        }
    }
    return true
}

private fun mutationNewInstanceType(
    instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction,
): String? = if (mutationOpcodeName(instruction) == "NEW_INSTANCE") {
    ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type
} else null

private fun mutationProvesCapturedListConstructor(
    constructor: Method,
    capturedListField: FieldReference,
): Boolean {
    val implementation = constructor.implementation ?: return false
    val instructions = implementation.instructions.toList()
    if (
        instructions.size != 3 ||
        constructor.parameters.map { it.type } != listOf("Ljava/util/List;")
    ) return false
    val listRegister = mutationMethodParameterRegister(constructor, 0)
        ?: return false
    val thisRegister = implementation.registerCount -
        mutationMethodParameterWordCount(constructor)
    val stored = (instructions[0] as? ReferenceInstruction)
        ?.reference as? FieldReference
    val objectConstructor = (instructions[1] as? ReferenceInstruction)
        ?.reference as? MethodReference
    return mutationOpcodeName(instructions[0]).startsWith("IPUT_OBJECT") &&
        mutationSameFieldReference(stored, capturedListField) &&
        mutationRegisterA(instructions[0]) == listRegister &&
        mutationRegisterB(instructions[0]) == thisRegister &&
        objectConstructor != null &&
        mutationIsDirectInvoke(instructions[1]) &&
        objectConstructor.definingClass == "Ljava/lang/Object;" &&
        objectConstructor.name == "<init>" &&
        objectConstructor.parameterTypes.isEmpty() &&
        mutationInvokeRegisters(instructions[1])?.firstOrNull() == thisRegister &&
        mutationOpcodeName(instructions[2]) == "RETURN_VOID"
}

private fun mutationProvesCapturedListRunnable(
    run: Method,
    capturedListField: FieldReference,
    directContentMethods: Set<String>,
): Boolean {
    val implementation = run.implementation ?: return false
    val instructions = implementation.instructions.toList()
    if (instructions.size != 3 || (run.accessFlags and 0x8) != 0) return false
    val loaded = (instructions[0] as? ReferenceInstruction)
        ?.reference as? FieldReference
    val listRegister = mutationRegisterA(instructions[0]) ?: return false
    val consumer = (instructions[1] as? ReferenceInstruction)
        ?.reference as? MethodReference ?: return false
    return mutationOpcodeName(instructions[0]).startsWith("IGET_OBJECT") &&
        mutationSameFieldReference(loaded, capturedListField) &&
        mutationIsStaticInvoke(instructions[1]) &&
        methodDescriptor(consumer) in directContentMethods &&
        consumer.parameterTypes.map { it.toString() } ==
            listOf("Ljava/util/List;") &&
        mutationInvokeParameterRegister(instructions[1], consumer, 0) ==
            listRegister &&
        mutationOpcodeName(instructions[2]) == "RETURN_VOID"
}

private fun mutationControllerListParameterHasProvenRunnableConsumer(
    method: Method,
    listParameterIndex: Int,
    directContentMethods: Set<String>,
    classDefinitions: Map<String, List<ClassDef>>,
    methodDefinitions: Map<String, List<Method>>,
): Boolean {
    val implementation = method.implementation ?: return false
    if (
        (method.accessFlags and 0x8) != 0 ||
        implementation.tryBlocks.iterator().hasNext()
    ) return false
    val instructions = implementation.instructions.toList()
    if (instructions.size != 5) return false
    val listRegister = mutationMethodParameterRegister(method, listParameterIndex)
        ?: return false
    val wrapperType = mutationNewInstanceType(instructions[0]) ?: return false
    val wrapperRegister = mutationRegisterA(instructions[0]) ?: return false
    val constructor = (instructions[1] as? ReferenceInstruction)
        ?.reference as? MethodReference ?: return false
    val callbackTargetField = (instructions[2] as? ReferenceInstruction)
        ?.reference as? FieldReference ?: return false
    val post = (instructions[3] as? ReferenceInstruction)
        ?.reference as? MethodReference ?: return false
    if (
        !mutationIsDirectInvoke(instructions[1]) ||
        constructor.definingClass != wrapperType ||
        constructor.name != "<init>" ||
        constructor.parameterTypes.map { it.toString() } !=
            listOf("Ljava/util/List;") ||
        mutationInvokeRegisters(instructions[1])?.firstOrNull() !=
            wrapperRegister ||
        mutationInvokeParameterRegister(instructions[1], constructor, 0) !=
            listRegister ||
        !mutationOpcodeName(instructions[2]).startsWith("IGET_OBJECT") ||
        callbackTargetField.type != "Landroid/os/Handler;" ||
        post.definingClass != "Landroid/os/Handler;" ||
        post.name != "post" ||
        post.parameterTypes.map { it.toString() } !=
            listOf("Ljava/lang/Runnable;") ||
        post.returnType != "Z" ||
        mutationInvokeParameterRegister(instructions[3], post, 0) !=
            wrapperRegister ||
        mutationOpcodeName(instructions[4]) != "RETURN_VOID"
    ) return false

    val wrappers = classDefinitions[wrapperType].orEmpty()
    if (wrappers.size != 1) return false
    val wrapper = wrappers.single()
    if (
        (wrapper.accessFlags and 0x10) == 0 ||
        "Ljava/lang/Runnable;" !in wrapper.interfaces
    ) return false
    val fields = wrapper.fields.toList()
    if (fields.size != 1) return false
    val capturedListField = fields.single()
    if (
        (capturedListField.accessFlags and 0x8) != 0 ||
        (capturedListField.accessFlags and 0x10) == 0 ||
        capturedListField.type != "Ljava/util/List;"
    ) return false
    val constructors = methodDefinitions[methodDescriptor(constructor)].orEmpty()
    if (
        constructors.size != 1 ||
        !mutationProvesCapturedListConstructor(
            constructors.single(), capturedListField,
        )
    ) return false
    val runMethods = wrapper.methods.filter { candidate ->
        candidate.name == "run" && candidate.returnType == "V" &&
            candidate.parameters.isEmpty()
    }
    return runMethods.size == 1 && mutationProvesCapturedListRunnable(
        runMethods.single(), capturedListField, directContentMethods,
    )
}

private fun mutationControllerListParameterHasProvenReceiverRunnableConsumer(
    method: Method,
    listParameterIndex: Int,
    directContentMethods: Set<String>,
    classDefinitions: Map<String, List<ClassDef>>,
    methodDefinitions: Map<String, List<Method>>,
): Boolean {
    val implementation = method.implementation ?: return false
    if (
        (method.accessFlags and 0x8) != 0 ||
        implementation.tryBlocks.iterator().hasNext()
    ) return false
    val instructions = implementation.instructions.toList()
    if (instructions.size != 5) return false
    val listRegister = mutationMethodParameterRegister(method, listParameterIndex)
        ?: return false
    val thisRegister = implementation.registerCount -
        mutationMethodParameterWordCount(method)
    val wrapperType = mutationNewInstanceType(instructions[0]) ?: return false
    val wrapperRegister = mutationRegisterA(instructions[0]) ?: return false
    val constructor = (instructions[1] as? ReferenceInstruction)
        ?.reference as? MethodReference ?: return false
    val handlerField = (instructions[2] as? ReferenceInstruction)
        ?.reference as? FieldReference ?: return false
    val post = (instructions[3] as? ReferenceInstruction)
        ?.reference as? MethodReference ?: return false
    if (
        !mutationIsDirectInvoke(instructions[1]) ||
        constructor.definingClass != wrapperType ||
        constructor.name != "<init>" ||
        constructor.parameterTypes.map { it.toString() } != listOf(
            method.definingClass, "Ljava/util/List;",
        ) ||
        mutationInvokeRegisters(instructions[1])?.firstOrNull() !=
            wrapperRegister ||
        mutationInvokeParameterRegister(instructions[1], constructor, 0) !=
            thisRegister ||
        mutationInvokeParameterRegister(instructions[1], constructor, 1) !=
            listRegister ||
        !mutationOpcodeName(instructions[2]).startsWith("IGET_OBJECT") ||
        handlerField.type != "Landroid/os/Handler;" ||
        post.definingClass != "Landroid/os/Handler;" ||
        post.name != "post" ||
        post.parameterTypes.map { it.toString() } !=
            listOf("Ljava/lang/Runnable;") ||
        post.returnType != "Z" ||
        mutationInvokeParameterRegister(instructions[3], post, 0) !=
            wrapperRegister ||
        mutationOpcodeName(instructions[4]) != "RETURN_VOID"
    ) return false
    val wrappers = classDefinitions[wrapperType].orEmpty()
    if (wrappers.size != 1) return false
    val wrapper = wrappers.single()
    if (
        (wrapper.accessFlags and 0x10) == 0 ||
        "Ljava/lang/Runnable;" !in wrapper.interfaces
    ) return false
    val fields = wrapper.fields.toList()
    if (fields.size != 2) return false
    val listFields = fields.filter { field ->
        (field.accessFlags and 0x8) == 0 &&
            (field.accessFlags and 0x10) != 0 &&
            field.type == "Ljava/util/List;"
    }
    val receiverFields = fields.filter { field ->
        (field.accessFlags and 0x8) == 0 &&
            (field.accessFlags and 0x10) != 0 &&
            field.type == method.definingClass
    }
    if (listFields.size != 1 || receiverFields.size != 1) return false
    val listField = listFields.single()
    val receiverField = receiverFields.single()
    val constructors = methodDefinitions[methodDescriptor(constructor)].orEmpty()
    if (constructors.size != 1) return false
    val constructorMethod = constructors.single()
    val constructorImplementation = constructorMethod.implementation
        ?: return false
    val constructorCode = constructorImplementation.instructions.toList()
    if (
        constructorCode.size != 4 ||
        constructorMethod.parameters.map { it.type } != listOf(
            receiverField.type, "Ljava/util/List;",
        )
    ) return false
    val receiverParameter = mutationMethodParameterRegister(
        constructorMethod, 0,
    ) ?: return false
    val listParameter = mutationMethodParameterRegister(
        constructorMethod, 1,
    ) ?: return false
    val constructorThis = constructorImplementation.registerCount -
        mutationMethodParameterWordCount(constructorMethod)
    var storedList = false
    var storedReceiver = false
    for (index in 0..1) {
        val instruction = constructorCode[index]
        val field = (instruction as? ReferenceInstruction)
            ?.reference as? FieldReference ?: return false
        if (
            !mutationOpcodeName(instruction).startsWith("IPUT_OBJECT") ||
            mutationRegisterB(instruction) != constructorThis
        ) return false
        when {
            mutationSameFieldReference(field, listField) &&
                mutationRegisterA(instruction) == listParameter &&
                !storedList -> storedList = true
            mutationSameFieldReference(field, receiverField) &&
                mutationRegisterA(instruction) == receiverParameter &&
                !storedReceiver -> storedReceiver = true
            else -> return false
        }
    }
    val objectConstructor = (constructorCode[2] as? ReferenceInstruction)
        ?.reference as? MethodReference ?: return false
    if (
        !storedList || !storedReceiver ||
        !mutationIsDirectInvoke(constructorCode[2]) ||
        objectConstructor.definingClass != "Ljava/lang/Object;" ||
        objectConstructor.name != "<init>" ||
        objectConstructor.parameterTypes.isNotEmpty() ||
        mutationInvokeRegisters(constructorCode[2])?.firstOrNull() !=
            constructorThis ||
        mutationOpcodeName(constructorCode[3]) != "RETURN_VOID"
    ) return false
    val runMethods = wrapper.methods.filter { candidate ->
        candidate.name == "run" && candidate.returnType == "V" &&
            candidate.parameters.isEmpty()
    }
    if (runMethods.size != 1) return false
    val run = runMethods.single()
    val runImplementation = run.implementation ?: return false
    val runCode = runImplementation.instructions.toList()
    if (runCode.size != 5 || (run.accessFlags and 0x8) != 0) return false
    val loadedList = (runCode[0] as? ReferenceInstruction)
        ?.reference as? FieldReference ?: return false
    val loadedReceiver = (runCode[1] as? ReferenceInstruction)
        ?.reference as? FieldReference ?: return false
    val loadedAuxiliary = (runCode[2] as? ReferenceInstruction)
        ?.reference as? FieldReference ?: return false
    val listValue = mutationRegisterA(runCode[0]) ?: return false
    val receiverValue = mutationRegisterA(runCode[1]) ?: return false
    val auxiliaryValue = mutationRegisterA(runCode[2]) ?: return false
    val consumer = (runCode[3] as? ReferenceInstruction)
        ?.reference as? MethodReference ?: return false
    return mutationOpcodeName(runCode[0]).startsWith("IGET_OBJECT") &&
        mutationSameFieldReference(loadedList, listField) &&
        mutationOpcodeName(runCode[1]).startsWith("IGET_OBJECT") &&
        mutationSameFieldReference(loadedReceiver, receiverField) &&
        mutationOpcodeName(runCode[2]).startsWith("IGET_OBJECT") &&
        loadedAuxiliary.definingClass == receiverField.type &&
        mutationRegisterB(runCode[2]) == receiverValue &&
        mutationIsStaticInvoke(runCode[3]) &&
        methodDescriptor(consumer) in directContentMethods &&
        consumer.parameterTypes.map { it.toString() } == listOf(
            "Ljava/util/List;", loadedAuxiliary.type,
        ) &&
        mutationInvokeParameterRegister(runCode[3], consumer, 0) == listValue &&
        mutationInvokeParameterRegister(runCode[3], consumer, 1) ==
            auxiliaryValue &&
        mutationOpcodeName(runCode[4]) == "RETURN_VOID"
}

/**
 * The controller submission must remain in one provenance block,
 * optionally reached through reverse-CFG-proven ancestors containing only
 * NOPs and forward unconditional GOTO trampolines. Bytecode position is never
 * used as a substitute for predecessor reachability. Any stateful instruction,
 * conditional
 * branch, or join before submission is delegated to the dedicated loop or
 * snapshot proof so block-local state is never mistaken for cross-block
 * provenance. Forward terminal control flow after submission is allowed only
 * through the separate terminal-submission proof. In addition to
 * proving ordered pre-submission provenance, controller
 * submission must be terminal. After the hook, every normally reachable
 * instruction must be control-flow plumbing or RETURN_VOID; no call, field or
 * array access, monitor, return value, allocation, mutation, or other
 * externally observable work is allowed.
 */
private fun analyzeMutationHostMethod(
    method: com.android.tools.smali.dexlib2.iface.Method,
    factoryDescriptor: String,
    controllerType: String,
    provenControllerMethods: Set<String>,
    oneHopSubmission: OneHopSubmission? = null,
): MutationHostPlan {
    val implementation = method.implementation
        ?: return MutationHostPlan(emptyList(), emptyList(), 0)
    val instructions = implementation.instructions.toList()

    fun controllerListRegister(
        instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction,
    ): Int? {
        val reference = (instruction as? ReferenceInstruction)
            ?.reference as? MethodReference ?: return null
        if (
            reference.definingClass != controllerType ||
            reference.returnType != "V" ||
            !mutationIsControllerDispatchInvoke(instruction) ||
            mutationIsStaticInvoke(instruction) ||
            !mutationInvokeMatchesReference(instruction, reference) ||
            methodDescriptor(reference) !in provenControllerMethods
        ) return null
        val parameters = reference.parameterTypes.map { it.toString() }
        val listParameters = parameters.withIndex()
            .filter { indexed -> indexed.value == "Ljava/util/List;" }
            .map { indexed -> indexed.index }
        if (listParameters.size != 1) return null
        return mutationInvokeParameterRegister(
            instruction,
            reference,
            listParameters.single(),
        )
    }

    val totalControllerCalls = if (oneHopSubmission != null) 1 else {
        instructions.count { instruction ->
            val reference = (instruction as? ReferenceInstruction)
                ?.reference as? MethodReference
            reference?.definingClass == controllerType &&
                reference.parameterTypes.any {
                    it.toString() == "Ljava/util/List;"
                }
        }
    }

    if (
        mutationHasTryBlocks(implementation) ||
        (method.accessFlags and 0x20) != 0 ||
        implementation.registerCount > 0xff
    ) return MutationHostPlan(emptyList(), emptyList(), totalControllerCalls)

    val blocks = mutationReachableStraightLineBlocks(instructions)
        ?: return MutationHostPlan(emptyList(), emptyList(), totalControllerCalls)
    val normalFlow = mutationNormalFlow(instructions)
        ?: return MutationHostPlan(emptyList(), emptyList(), totalControllerCalls)
    val reachableControllerCalls = normalFlow.reachable.filter { index ->
        val reference = (instructions[index] as? ReferenceInstruction)
            ?.reference as? MethodReference
        oneHopSubmission?.invokeIndex == index ||
            reference?.definingClass == controllerType &&
                reference.parameterTypes.any {
                    it.toString() == "Ljava/util/List;"
                }
    }
    if (reachableControllerCalls.size != 1) {
        return MutationHostPlan(emptyList(), emptyList(), totalControllerCalls)
    }
    val straightLineControllerIndex = reachableControllerCalls.single()
    val controllerBlock = blocks.firstOrNull { block ->
        straightLineControllerIndex in block
    }
    val controllerAncestors = mutableSetOf<Int>()
    if (controllerBlock != null) {
        val queue = mutableListOf(controllerBlock.first)
        controllerAncestors += controllerBlock.first
        var cursor = 0
        while (cursor < queue.size) {
            val current = queue[cursor++]
            normalFlow.predecessors[current].orEmpty().forEach { predecessor ->
                if (controllerAncestors.add(predecessor)) {
                    queue += predecessor
                }
            }
        }
    }
    val neutralPrefix = controllerBlock != null &&
        controllerAncestors.all { index ->
            if (index in controllerBlock) {
                true
            } else {
                val opcode = mutationOpcodeName(instructions[index])
                val successors = normalFlow.successors[index]
                if (opcode == "NOP") {
                    successors?.size == 1 &&
                        successors.single() in controllerAncestors
                } else {
                    opcode.startsWith("GOTO") &&
                        successors?.size == 1 &&
                        successors.single() > index &&
                        successors.single() in controllerAncestors
                }
            }
        }
    if (!neutralPrefix) {
        return MutationHostPlan(emptyList(), emptyList(), totalControllerCalls)
    }
    val parameterStart =
        (implementation.registerCount - mutationMethodParameterWordCount(method))
            .coerceAtLeast(0)
    val captures = linkedMapOf<Int, Int>()
    val hooks = linkedMapOf<Int, Int>()
    val acceptedReceiverTokens = linkedSetOf<String>()
    val acceptedSourceIds = mutableSetOf<Int>()
    var unsupported = 0
    var nextSourceId = 0

    blocks.forEach { block ->
        val registers = mutableMapOf<Int, MutationFlowValue>()
        val objectListTokens = mutableMapOf<String, Int>()
        val untrustedObjectTokens = mutableSetOf<String>()
        val trustedMutableListTokens = mutableSetOf<Int>()
        val listSources = mutableMapOf<Int, MutableList<Int>>()
        val sources = mutableMapOf<Int, MutationFactorySource>()
        val pendingFactorySourcesByReceiver =
            mutableMapOf<String, MutableList<Int>>()
        var pendingResult = unknownMutationValue()

        fun registerValue(register: Int): MutationFlowValue =
            registers[register] ?: if (register >= parameterStart) {
                objectMutationValue("parameter:$register").also {
                    registers[register] = it
                }
            } else {
                unknownMutationValue()
            }

        fun nextListToken(): Int {
            var token = 0
            while (token in listSources) token++
            return token
        }

        fun asListValue(value: MutationFlowValue): MutationFlowValue {
            if (value.kind == MUTATION_FLOW_LIST) return value
            if (value.kind == MUTATION_FLOW_OBJECT && value.objectToken != null) {
                val token = objectListTokens[value.objectToken]
                if (token != null) return listMutationValue(token)
            }
            return unknownMutationValue()
        }

        fun taintListToken(token: Int) {
            listSources.getOrPut(token) {
                mutableListOf(MUTATION_FLOW_TAINTED_SOURCE_ID)
            }.apply {
                clear()
                add(MUTATION_FLOW_TAINTED_SOURCE_ID)
            }
        }

        fun listSourcesOrTaint(token: Int): MutableList<Int> =
            listSources.getOrPut(token) {
                mutableListOf(MUTATION_FLOW_TAINTED_SOURCE_ID)
            }

        fun ensureListValue(register: Int): MutationFlowValue {
            val value = registerValue(register)
            val existing = asListValue(value)
            if (existing.kind == MUTATION_FLOW_LIST) {
                listSourcesOrTaint(existing.listToken)
                registers[register] = existing
                return existing
            }
            var token = nextListToken()
            if (value.kind == MUTATION_FLOW_OBJECT && value.objectToken != null) {
                token = objectListTokens.getOrPut(value.objectToken) { token }
            }
            val list = listMutationValue(token)
            registers[register] = list
            listSourcesOrTaint(token)
            return list
        }

        fun initializeConstructedList(
            register: Int,
            initialSources: List<Int>?,
        ): MutationFlowValue? {
            val value = registerValue(register)
            val objectToken = value.objectToken
            if (
                value.kind != MUTATION_FLOW_OBJECT ||
                objectToken == null ||
                !objectToken.startsWith("new:")
            ) return null

            val existingToken = objectListTokens[objectToken]
            if (existingToken != null) {
                val existing = listMutationValue(existingToken)
                registers[register] = existing
                taintListToken(existingToken)
                return existing
            }

            val token = nextListToken()
            objectListTokens[objectToken] = token
            trustedMutableListTokens += token
            val list = listMutationValue(token)
            registers[register] = list
            listSources[token] = if (
                objectToken in untrustedObjectTokens || initialSources == null
            ) {
                mutableListOf(MUTATION_FLOW_TAINTED_SOURCE_ID)
            } else {
                initialSources.toMutableList()
            }
            return list
        }

        fun invalidateUnknownListCall(
            instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction,
        ) {
            mutationInvokeRegisters(instruction).orEmpty().forEach { register ->
                val value = registerValue(register)
                val listValue = asListValue(value)
                if (listValue.kind == MUTATION_FLOW_LIST) {
                    taintListToken(listValue.listToken)
                } else if (
                    value.kind == MUTATION_FLOW_OBJECT &&
                    value.objectToken != null
                ) {
                    untrustedObjectTokens += value.objectToken
                }
            }
        }

        block.forEach instructionLoop@ { index ->
            val instruction = instructions[index]
            val opcode = mutationOpcodeName(instruction)

            if (opcode == "MOVE_RESULT_OBJECT") {
                mutationRegisterA(instruction)?.let { destination ->
                    registers[destination] = pendingResult
                }
                pendingResult = unknownMutationValue()
                return@instructionLoop
            }

            pendingResult = unknownMutationValue()
            val reference = (instruction as? ReferenceInstruction)
                ?.reference as? MethodReference

            if (
                reference != null &&
                methodDescriptor(reference) == factoryDescriptor &&
                !mutationIsStaticInvoke(instruction) &&
                mutationInvokeMatchesReference(instruction, reference)
            ) {
                val invokeRegisters = mutationInvokeRegisters(instruction)
                val receiverRegister = invokeRegisters?.firstOrNull()
                val receiverValue = receiverRegister?.let(::registerValue)
                    ?: unknownMutationValue()
                if (
                    receiverRegister != null &&
                    receiverValue.kind == MUTATION_FLOW_OBJECT &&
                    receiverValue.objectToken != null
                ) {
                    val sourceId = nextSourceId++
                    sources[sourceId] = MutationFactorySource(
                        sourceId,
                        index,
                        receiverRegister,
                        receiverValue.objectToken,
                    )
                    pendingFactorySourcesByReceiver.getOrPut(
                        receiverValue.objectToken,
                    ) { mutableListOf() }.add(sourceId)
                    pendingResult = factoryMutationValue(sourceId)
                }
                return@instructionLoop
            }

            val isSyntheticSubmission =
                oneHopSubmission?.invokeIndex == index
            val submittedListRegister = if (isSyntheticSubmission) {
                oneHopSubmission?.listRegister
            } else {
                controllerListRegister(instruction)
            }
            val isControllerListCall = isSyntheticSubmission ||
                reference?.definingClass == controllerType &&
                reference.parameterTypes.any {
                    it.toString() == "Ljava/util/List;"
                }
            if (isControllerListCall && submittedListRegister == null) {
                unsupported++
                invalidateUnknownListCall(instruction)
                return@instructionLoop
            }
            if (submittedListRegister != null) {
                val submissionReference = reference ?: run {
                    unsupported++
                    invalidateUnknownListCall(instruction)
                    return@instructionLoop
                }
                val listValue = asListValue(registerValue(submittedListRegister))
                val contributingSources =
                    if (listValue.kind == MUTATION_FLOW_LIST) {
                        listSources[listValue.listToken]
                    } else null
                val submittedParameter = if (isSyntheticSubmission) {
                    checkNotNull(oneHopSubmission).listParameterIndex
                } else {
                    submissionReference.parameterTypes
                        .map { it.toString() }
                        .indexOf("Ljava/util/List;")
                }
                val controllerReceiverRegister = if (
                    isSyntheticSubmission && mutationIsStaticInvoke(instruction)
                ) null else mutationInvokeRegisters(instruction)?.firstOrNull()
                val receiverIsTrackedList =
                    controllerReceiverRegister != null &&
                        asListValue(
                            registerValue(controllerReceiverRegister)
                        ).kind == MUTATION_FLOW_LIST
                val extraTrackedListArgument =
                    receiverIsTrackedList ||
                    submissionReference.parameterTypes.indices
                        .filter { parameterIndex ->
                            parameterIndex != submittedParameter
                        }
                        .mapNotNull { parameterIndex ->
                            mutationInvokeParameterRegister(
                                instruction,
                                submissionReference,
                                parameterIndex,
                            )
                        }
                        .any { register ->
                            asListValue(registerValue(register)).kind ==
                                MUTATION_FLOW_LIST
                        }
                if (extraTrackedListArgument) {
                    invalidateUnknownListCall(instruction)
                }
                val acceptedSources = contributingSources?.toList().orEmpty()
                val sourceIdsAreUnique =
                    acceptedSources.toSet().size == acceptedSources.size
                val overlapsAcceptedSubmission =
                    acceptedSources.any { sourceId ->
                        sourceId in acceptedSourceIds
                    }
                var accepted =
                    !extraTrackedListArgument &&
                        listValue.listToken in trustedMutableListTokens &&
                        acceptedSources.isNotEmpty() &&
                        MUTATION_FLOW_TAINTED_SOURCE_ID !in acceptedSources &&
                        sourceIdsAreUnique &&
                        !overlapsAcceptedSubmission
                var receiverToken: String? = null
                var previousFactoryIndex = -1
                if (accepted) {
                    acceptedSources.forEach { sourceId ->
                        val source = sources[sourceId]
                        if (
                            source == null ||
                            source.invokeIndex <= previousFactoryIndex
                        ) {
                            accepted = false
                        } else {
                            previousFactoryIndex = source.invokeIndex
                            if (receiverToken == null) {
                                receiverToken = source.receiverToken
                            } else if (receiverToken != source.receiverToken) {
                                accepted = false
                            }
                        }
                    }
                }
                if (accepted) {
                    val pendingForReceiver =
                        pendingFactorySourcesByReceiver[receiverToken]
                    accepted = pendingForReceiver != null &&
                        pendingForReceiver.size >= acceptedSources.size &&
                        pendingForReceiver.takeLast(acceptedSources.size) ==
                            acceptedSources
                }
                if (accepted) {
                    accepted = mutationControllerSubmissionIsTerminal(
                        instructions,
                        normalFlow.successors,
                        index,
                        emptyList(),
                    )
                }
                if (accepted) {
                    val acceptedReceiverToken = checkNotNull(receiverToken)
                    hooks[index] = submittedListRegister
                    acceptedReceiverTokens += acceptedReceiverToken
                    acceptedSourceIds += acceptedSources
                    acceptedSources.forEach { sourceId ->
                        val source = sources.getValue(sourceId)
                        captures[source.invokeIndex] = source.receiverRegister
                    }
                    pendingFactorySourcesByReceiver
                        .getValue(acceptedReceiverToken)
                        .clear()
                    taintListToken(listValue.listToken)
                } else {
                    unsupported++
                    if (listValue.kind == MUTATION_FLOW_LIST) {
                        taintListToken(listValue.listToken)
                    }
                }
                return@instructionLoop
            }

            if (reference != null && mutationInvokeRegisters(instruction) != null) {
                if (!mutationInvokeMatchesReference(instruction, reference)) {
                    invalidateUnknownListCall(instruction)
                    return@instructionLoop
                }
                val parameters = reference.parameterTypes.map { it.toString() }
                val name = reference.name

                val immutableListFactory =
                    mutationIsStaticInvoke(instruction) &&
                        reference.returnType == "Ljava/util/List;" &&
                        (
                            (
                                reference.definingClass ==
                                    "Ljava/util/Collections;" &&
                                    name == "singletonList" &&
                                    parameters ==
                                        listOf("Ljava/lang/Object;")
                            ) ||
                                (
                                    reference.definingClass ==
                                        "Ljava/util/List;" &&
                                    name == "of" &&
                                    parameters.isNotEmpty() &&
                                    parameters.all {
                                        it == "Ljava/lang/Object;"
                                    }
                                ) ||
                                (
                                    reference.definingClass ==
                                        "Ljava/util/Collections;" &&
                                    name == "unmodifiableList" &&
                                    parameters ==
                                        listOf("Ljava/util/List;")
                                ) ||
                                (
                                    reference.definingClass ==
                                        "Ljava/util/List;" &&
                                    name == "copyOf" &&
                                    parameters ==
                                        listOf("Ljava/util/Collection;")
                                )
                        )
                if (immutableListFactory) {
                    invalidateUnknownListCall(instruction)
                    return@instructionLoop
                }

                if (
                    mutationIsDirectInvoke(instruction) &&
                    mutationIsProvenEmptyMutableListConstructor(reference)
                ) {
                    val receiverRegister =
                        mutationInvokeRegisters(instruction)?.firstOrNull()
                    if (
                        receiverRegister == null ||
                        initializeConstructedList(
                            receiverRegister,
                            emptyList(),
                        ) == null
                    ) {
                        invalidateUnknownListCall(instruction)
                    }
                    return@instructionLoop
                }

                if (
                    mutationIsDirectInvoke(instruction) &&
                    mutationIsMutableListCopyConstructor(reference)
                ) {
                    val receiverRegister =
                        mutationInvokeRegisters(instruction)?.firstOrNull()
                    val sourceRegister = mutationInvokeParameterRegister(
                        instruction,
                        reference,
                        0,
                    )
                    val sourceValue = sourceRegister?.let(::registerValue)
                    val sourceList = sourceValue?.let(::asListValue)
                    val sourceState = if (
                        sourceList?.kind == MUTATION_FLOW_LIST
                    ) {
                        listSources[sourceList.listToken]?.toList()
                    } else {
                        if (
                            sourceValue?.kind == MUTATION_FLOW_OBJECT &&
                            sourceValue.objectToken != null
                        ) {
                            untrustedObjectTokens += sourceValue.objectToken
                        }
                        null
                    }
                    if (
                        receiverRegister == null ||
                        initializeConstructedList(
                            receiverRegister,
                            sourceState,
                        ) == null
                    ) {
                        invalidateUnknownListCall(instruction)
                    }
                    return@instructionLoop
                }

                if (
                    !mutationIsStaticInvoke(instruction) &&
                    name == "add" &&
                    mutationIsCollectionType(reference.definingClass)
                ) {
                    if (
                        reference.returnType != "Z" ||
                        parameters != listOf("Ljava/lang/Object;")
                    ) {
                        // Indexed insertion changes List order unless the index
                        // is proven to equal the current size. No integer-value
                        // proof exists here, so reject it fail-closed.
                        invalidateUnknownListCall(instruction)
                        return@instructionLoop
                    }
                    val receiverRegister =
                        mutationInvokeRegisters(instruction)?.firstOrNull()
                    val objectRegister = mutationInvokeParameterRegister(
                        instruction,
                        reference,
                        0,
                    )
                    if (receiverRegister == null || objectRegister == null) {
                        invalidateUnknownListCall(instruction)
                    } else {
                        val listValue = ensureListValue(receiverRegister)
                        if (listValue.listToken !in trustedMutableListTokens) {
                            invalidateUnknownListCall(instruction)
                            return@instructionLoop
                        }
                        val destinationState =
                            listSourcesOrTaint(listValue.listToken)
                        val objectValue = registerValue(objectRegister)
                        if (
                            objectValue.kind == MUTATION_FLOW_FACTORY_RESULT &&
                            MUTATION_FLOW_TAINTED_SOURCE_ID !in destinationState &&
                            objectValue.sourceId !in destinationState
                        ) {
                            destinationState.add(objectValue.sourceId)
                        } else {
                            val insertedList = asListValue(objectValue)
                            if (insertedList.kind == MUTATION_FLOW_LIST) {
                                taintListToken(insertedList.listToken)
                            } else if (
                                objectValue.kind == MUTATION_FLOW_OBJECT &&
                                objectValue.objectToken != null
                            ) {
                                untrustedObjectTokens += objectValue.objectToken
                            }
                            taintListToken(listValue.listToken)
                        }
                    }
                    return@instructionLoop
                }

                if (
                    !mutationIsStaticInvoke(instruction) &&
                    name == "addAll" &&
                    mutationIsCollectionType(reference.definingClass)
                ) {
                    if (
                        reference.returnType != "Z" ||
                        parameters != listOf("Ljava/util/Collection;")
                    ) {
                        // Indexed addAll has the same unproved ordering problem
                        // as indexed add and is therefore rejected.
                        invalidateUnknownListCall(instruction)
                        return@instructionLoop
                    }
                    val receiverRegister =
                        mutationInvokeRegisters(instruction)?.firstOrNull()
                    val sourceRegister = mutationInvokeParameterRegister(
                        instruction,
                        reference,
                        0,
                    )
                    if (receiverRegister == null || sourceRegister == null) {
                        invalidateUnknownListCall(instruction)
                    } else {
                        val destinationList = ensureListValue(receiverRegister)
                        if (
                            destinationList.listToken !in
                                trustedMutableListTokens
                        ) {
                            invalidateUnknownListCall(instruction)
                            return@instructionLoop
                        }
                        val sourceValue = registerValue(sourceRegister)
                        val sourceList = asListValue(sourceValue)
                        val sourceState = if (
                            sourceList.kind == MUTATION_FLOW_LIST
                        ) {
                            listSources[sourceList.listToken]?.toList()
                        } else {
                            if (
                                sourceValue.kind == MUTATION_FLOW_OBJECT &&
                                sourceValue.objectToken != null
                            ) {
                                untrustedObjectTokens += sourceValue.objectToken
                            }
                            null
                        }
                        val destinationState =
                            listSourcesOrTaint(destinationList.listToken)
                        val unsafeCopy =
                            sourceState == null ||
                                sourceList.listToken == destinationList.listToken ||
                                MUTATION_FLOW_TAINTED_SOURCE_ID in sourceState ||
                                MUTATION_FLOW_TAINTED_SOURCE_ID in destinationState ||
                                sourceState.any { sourceId ->
                                    sourceId in destinationState
                                }
                        if (unsafeCopy) {
                            taintListToken(destinationList.listToken)
                        } else {
                            destinationState.addAll(checkNotNull(sourceState))
                        }
                    }
                    return@instructionLoop
                }

                invalidateUnknownListCall(instruction)
                return@instructionLoop
            }

            if (
                opcode.startsWith("INVOKE_") ||
                opcode.startsWith("FILLED_NEW_ARRAY")
            ) {
                invalidateUnknownListCall(instruction)
                return@instructionLoop
            }

            if (opcode.startsWith("MOVE_OBJECT")) {
                val destination = mutationRegisterA(instruction)
                val source = mutationRegisterB(instruction)
                if (destination != null && source != null) {
                    registers[destination] = registerValue(source)
                }
                return@instructionLoop
            }

            if (opcode == "CHECK_CAST") {
                // CHECK_CAST preserves the object identity in its register.
                return@instructionLoop
            }

            if (
                opcode.startsWith("IPUT") ||
                opcode.startsWith("SPUT") ||
                opcode.startsWith("APUT")
            ) {
                mutationRegisterA(instruction)?.let { escapedRegister ->
                    val escapedValue = registerValue(escapedRegister)
                    val escapedList = asListValue(escapedValue)
                    if (escapedList.kind == MUTATION_FLOW_LIST) {
                        taintListToken(escapedList.listToken)
                    } else if (
                        escapedValue.kind == MUTATION_FLOW_OBJECT &&
                        escapedValue.objectToken != null
                    ) {
                        untrustedObjectTokens += escapedValue.objectToken
                    }
                }
                return@instructionLoop
            }

            val destination = mutationRegisterA(instruction)
            if (destination != null && mutationWritesRegisterA(opcode)) {
                registers[destination] = when {
                    opcode == "NEW_INSTANCE" -> objectMutationValue(
                        "new:${block.first}:$index:$destination"
                    )
                    opcode.startsWith("SGET_OBJECT") ||
                        opcode.startsWith("IGET_OBJECT") -> {
                        // Field identities can be replaced or aliased outside
                        // this straight-line proof. Exact mutation hosts do not
                        // carry receiver or List provenance through fields.
                        unknownMutationValue()
                    }
                    else -> unknownMutationValue()
                }
            }
        }
    }

    if (unsupported > 0 || acceptedReceiverTokens.size > 1) {
        return MutationHostPlan(emptyList(), emptyList(), totalControllerCalls)
    }

    return MutationHostPlan(
        captures.entries.map { it.key to it.value },
        hooks.entries.map { it.key to it.value },
        unsupported,
    )
}

/**
 * Proves the canonical loop mutation-host shape without pretending that a
 * block-local source id represents every dynamic loop iteration.
 *
 * Accepted shape:
 *   1. one local mutable List is constructed once;
 *   2. one instance render-factory invoke is immediately followed by
 *      move-result-object and List.add(Object) on that List;
 *   3. a real backward edge repeats that factory/add pair without crossing the
 *      constructor;
 *   4. the same List register is submitted exactly once to the controller;
 *   5. no other instruction reads, aliases, writes, escapes, or passes the List
 *      or factory-result register.
 *
 * Try regions are rejected for both exact and generic candidates. Exact
 * catalog membership selects a method but never weakens the proof.
 */
private fun analyzeCanonicalMutationHostLoop(
    method: com.android.tools.smali.dexlib2.iface.Method,
    factoryDescriptor: String,
    controllerType: String,
    provenControllerMethods: Set<String>,
    allowDetachedHistoricalTail: Boolean,
    allowConsumedResultRegisterReuse: Boolean = false,
): MutationHostPlan {
    val implementation = method.implementation
    val instructions = implementation?.instructions?.toList().orEmpty()
    val totalControllerCalls = instructions.count { instruction ->
        val reference = (instruction as? ReferenceInstruction)
            ?.reference as? MethodReference
        reference?.definingClass == controllerType &&
            reference.parameterTypes.any {
                it.toString() == "Ljava/util/List;"
            }
    }
    fun reject() = MutationHostPlan(
        emptyList(),
        emptyList(),
        totalControllerCalls,
    )
    if (
        implementation == null || method.name == "<init>" ||
        method.name == "<clinit>" || (method.accessFlags and 0x8) != 0 ||
        (method.accessFlags and 0x20) != 0 ||
        implementation.registerCount > 0xff ||
        mutationHasTryBlocks(implementation)
    ) return reject()

    val factoryCalls = instructions.withIndex().mapNotNull { indexed ->
        val reference = (indexed.value as? ReferenceInstruction)
            ?.reference as? MethodReference ?: return@mapNotNull null
        if (
            methodDescriptor(reference) != factoryDescriptor ||
            mutationIsStaticInvoke(indexed.value) ||
            !mutationInvokeMatchesReference(indexed.value, reference)
        ) return@mapNotNull null
        mutationInvokeRegisters(indexed.value)?.firstOrNull()?.let { receiver ->
            indexed.index to receiver
        }
    }
    if (factoryCalls.size != 1) return reject()
    val (factoryIndex, factoryReceiver) = factoryCalls.single()
    val parameterStart = (
        implementation.registerCount - mutationMethodParameterWordCount(method)
    ).coerceAtLeast(0)
    if (
        !mutationFactoryReceiverIsProvenAt(
            method,
            instructions,
            factoryIndex,
            factoryReceiver,
        ) || factoryIndex + 2 >= instructions.size
    ) {
        return reject()
    }

    val moveResult = instructions[factoryIndex + 1]
    if (mutationOpcodeName(moveResult) != "MOVE_RESULT_OBJECT") return reject()
    val resultRegister = mutationRegisterA(moveResult) ?: return reject()

    val addInstruction = instructions[factoryIndex + 2]
    val addReference = (addInstruction as? ReferenceInstruction)
        ?.reference as? MethodReference ?: return reject()
    if (
        mutationIsStaticInvoke(addInstruction) ||
        !mutationInvokeMatchesReference(addInstruction, addReference) ||
        addReference.name != "add" ||
        addReference.returnType != "Z" ||
        !mutationIsCollectionType(addReference.definingClass) ||
        addReference.parameterTypes.map { it.toString() } !=
            listOf("Ljava/lang/Object;")
    ) return reject()
    val listRegister = mutationInvokeRegisters(addInstruction)?.firstOrNull()
        ?: return reject()
    val addedRegister = mutationInvokeParameterRegister(
        addInstruction,
        addReference,
        0,
    ) ?: return reject()
    if (
        addedRegister != resultRegister || listRegister == resultRegister ||
        listRegister == factoryReceiver
    ) return reject()
    val addIndex = factoryIndex + 2

    fun controllerListRegister(
        instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction,
        reference: MethodReference,
    ): Int? {
        if (
            reference.definingClass != controllerType ||
            reference.returnType != "V" ||
            !mutationIsControllerDispatchInvoke(instruction) ||
            mutationIsStaticInvoke(instruction) ||
            methodDescriptor(reference) !in provenControllerMethods
        ) return null
        val parameters = reference.parameterTypes.map { it.toString() }
        if (
            parameters.count { it == "Ljava/util/List;" } != 1 ||
            parameters.any { type ->
                type != "Ljava/util/List;" &&
                    !(type.length == 1 && type[0] in "ZBSCIJFD")
            } ||
            !mutationInvokeMatchesReference(instruction, reference)
        ) return null
        val listIndex = parameters.indexOf("Ljava/util/List;")
        return mutationInvokeParameterRegister(
            instruction,
            reference,
            listIndex,
        )
    }

    val controllerCalls = instructions.withIndex().filter { indexed ->
        val reference = (indexed.value as? ReferenceInstruction)
            ?.reference as? MethodReference
        reference?.definingClass == controllerType &&
            reference.parameterTypes.any {
                it.toString() == "Ljava/util/List;"
            }
    }
    if (controllerCalls.size != 1) return reject()
    val controllerIndexed = controllerCalls.single()
    val controllerReference = (controllerIndexed.value as ReferenceInstruction)
        .reference as MethodReference
    val submittedRegister = controllerListRegister(
        controllerIndexed.value,
        controllerReference,
    ) ?: return reject()
    val controllerIndex = controllerIndexed.index
    if (submittedRegister != listRegister || controllerIndex <= addIndex) {
        return reject()
    }

    val constructors = instructions.withIndex().filter { indexed ->
        if (indexed.index >= factoryIndex) return@filter false
        val reference = (indexed.value as? ReferenceInstruction)
            ?.reference as? MethodReference ?: return@filter false
        mutationIsDirectInvoke(indexed.value) &&
            mutationInvokeMatchesReference(indexed.value, reference) &&
            mutationIsProvenEmptyMutableListConstructor(reference) &&
            mutationInvokeRegisters(indexed.value)?.firstOrNull() == listRegister
    }
    if (constructors.size != 1 || listRegister >= parameterStart) return reject()
    val constructorIndex = constructors.single().index

    fun allInstructionRegisters(
        instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction,
    ): Set<Int> {
        mutationInvokeRegisters(instruction)?.let { return it.toSet() }
        val registers = linkedSetOf<Int>()
        listOf(
            "getRegisterA", "getRegisterB", "getRegisterC", "getRegisterD",
            "getRegisterE", "getRegisterF", "getRegisterG",
        ).forEach { getter ->
            reflectedInstructionInt(instruction, getter)?.let(registers::add)
        }
        return registers
    }

    val offsets = mutableListOf<Int>()
    val offsetToIndex = mutableMapOf<Int, Int>()
    var offset = 0
    instructions.forEachIndexed { index, instruction ->
        offsets += offset
        offsetToIndex[offset] = index
        val opcode = mutationOpcodeName(instruction)
        if (
            "SWITCH" in opcode || opcode.endsWith("PAYLOAD") ||
            opcode == "FILL_ARRAY_DATA"
        ) return reject()
        val codeUnits = mutationInstructionCodeUnits(instruction)
            ?: return reject()
        offset += codeUnits
    }

    val successors = instructions.indices.associateWith { index ->
        val instruction = instructions[index]
        val opcode = mutationOpcodeName(instruction)
        when {
            opcode.startsWith("GOTO") -> {
                val relative = mutationInstructionCodeOffset(instruction)
                    ?: return reject()
                listOfNotNull(offsetToIndex[offsets[index] + relative])
            }
            opcode.startsWith("IF_") -> {
                val relative = mutationInstructionCodeOffset(instruction)
                    ?: return reject()
                val target = offsetToIndex[offsets[index] + relative]
                    ?: return reject()
                buildList {
                    add(target)
                    if (index + 1 < instructions.size) add(index + 1)
                }
            }
            opcode.startsWith("RETURN") || opcode == "THROW" -> emptyList()
            index + 1 < instructions.size -> listOf(index + 1)
            else -> emptyList()
        }
    }
    if (successors.values.flatten().any { it !in instructions.indices }) {
        return reject()
    }

    val reachable = linkedSetOf(0)
    val queue = mutableListOf(0)
    var cursor = 0
    while (cursor < queue.size) {
        successors.getValue(queue[cursor++]).forEach { successor ->
            if (reachable.add(successor)) queue += successor
        }
    }
    if (
        constructorIndex !in reachable || factoryIndex !in reachable ||
        factoryIndex + 1 !in reachable || addIndex !in reachable ||
        controllerIndex !in reachable
    ) return reject()

    val predecessors = reachable.associateWith { linkedSetOf<Int>() }
    reachable.forEach { source ->
        successors.getValue(source)
            .filter { it in reachable }
            .forEach { target -> predecessors.getValue(target).add(source) }
    }
    val dominators = reachable.associateWith { node ->
        if (node == 0) mutableSetOf(0) else reachable.toMutableSet()
    }.toMutableMap()
    var changed: Boolean
    do {
        changed = false
        reachable.filter { it != 0 }.forEach { node ->
            val incoming = predecessors.getValue(node)
            val intersection = if (incoming.isEmpty()) {
                mutableSetOf<Int>()
            } else {
                dominators.getValue(incoming.first()).toMutableSet().apply {
                    incoming.drop(1).forEach { predecessor ->
                        retainAll(dominators.getValue(predecessor))
                    }
                }
            }
            intersection.add(node)
            if (intersection != dominators.getValue(node)) {
                dominators[node] = intersection
                changed = true
            }
        }
    } while (changed)

    val canReachController = linkedSetOf(controllerIndex)
    queue.clear()
    queue += controllerIndex
    cursor = 0
    while (cursor < queue.size) {
        predecessors.getValue(queue[cursor++]).forEach { predecessor ->
            if (canReachController.add(predecessor)) queue += predecessor
        }
    }
    val relevant = reachable.filterTo(linkedSetOf()) {
        it in canReachController
    }
    if (
        constructorIndex !in relevant || factoryIndex !in relevant ||
        factoryIndex + 1 !in relevant || addIndex !in relevant ||
        controllerIndex !in relevant
    ) return reject()

    val allocations = relevant.filter { index ->
        index < constructorIndex &&
            mutationOpcodeName(instructions[index]) == "NEW_INSTANCE" &&
            mutationRegisterA(instructions[index]) == listRegister &&
            index in dominators.getValue(constructorIndex)
    }
    if (allocations.size != 1) return reject()
    val allocationIndex = allocations.single()

    if (
        allocationIndex !in dominators.getValue(constructorIndex) ||
        constructorIndex !in dominators.getValue(factoryIndex) ||
        constructorIndex !in dominators.getValue(controllerIndex) ||
        factoryIndex !in dominators.getValue(addIndex) ||
        predecessors.getValue(factoryIndex + 1) != setOf(factoryIndex) ||
        predecessors.getValue(addIndex) != setOf(factoryIndex + 1)
    ) return reject()

    val reachableFromAllocation = linkedSetOf(allocationIndex)
    queue.clear()
    queue += allocationIndex
    cursor = 0
    while (cursor < queue.size) {
        successors.getValue(queue[cursor++]).forEach { successor ->
            if (
                successor in relevant &&
                reachableFromAllocation.add(successor)
            ) queue += successor
        }
    }

    val reachableFromFactory = linkedSetOf<Int>()
    if (!allowConsumedResultRegisterReuse) {
        reachableFromFactory += factoryIndex
        queue.clear()
        queue += factoryIndex
        cursor = 0
        while (cursor < queue.size) {
            successors.getValue(queue[cursor++]).forEach { successor ->
                if (
                    successor in relevant &&
                    reachableFromFactory.add(successor)
                ) queue += successor
            }
        }
    } else if (!mutationConsumedRegisterIsNotReadAgain(
            instructions,
            successors,
            relevant,
            addIndex,
            resultRegister,
        )
    ) return reject()

    relevant.forEach { index ->
        val instruction = instructions[index]
        if (
            index != factoryIndex &&
            mutationWritesRegisterA(mutationOpcodeName(instruction)) &&
            mutationRegisterA(instruction) == factoryReceiver
        ) return reject()
    }

    val allowedIndexes = setOf(
        allocationIndex,
        constructorIndex,
        factoryIndex,
        factoryIndex + 1,
        addIndex,
        controllerIndex,
    )
    relevant.forEach { index ->
        if (index in allowedIndexes) return@forEach
        val registers = allInstructionRegisters(instructions[index])
        if (
            index in reachableFromAllocation && listRegister in registers
        ) return reject()
        if (
            !allowConsumedResultRegisterReuse &&
            index in reachableFromFactory && resultRegister in registers
        ) return reject()
    }

    var repeatsFactoryAdd = false
    for (source in relevant) {
        for (target in successors.getValue(source)) {
            if (target !in relevant || target > source) continue
            if (
                source >= controllerIndex || target <= constructorIndex ||
                target > factoryIndex || addIndex !in dominators.getValue(source)
            ) return reject()
            repeatsFactoryAdd = true
        }
    }
    if (!repeatsFactoryAdd) return reject()
    val terminalSubmission = mutationControllerSubmissionIsTerminal(
        instructions, successors, controllerIndex, emptyList(),
    )
    val detachedHistoricalTail = allowDetachedHistoricalTail &&
        mutationSubmittedListDeadAfterHook(
            instructions,
            successors,
            controllerIndex,
            setOf(listRegister),
            emptyList(),
        )
    if (!terminalSubmission && !detachedHistoricalTail) return reject()

    return MutationHostPlan(
        listOf(factoryIndex to factoryReceiver),
        listOf(controllerIndex to listRegister),
        0,
    )
}

private data class MutationTryHandlerInfo(
    val exceptionType: String?,
    val handlerIndex: Int,
)

private data class MutationTryRegionInfo(
    val startIndex: Int,
    val endIndexExclusive: Int,
    val handlers: List<MutationTryHandlerInfo>,
) {
    fun contains(index: Int): Boolean =
        index >= startIndex && index < endIndexExclusive
}

private data class MutationNormalFlow(
    val successors: Map<Int, List<Int>>,
    val predecessors: Map<Int, Set<Int>>,
    val reachable: Set<Int>,
    val dominators: Map<Int, Set<Int>>,
)

private fun mutationReflectedNoArg(target: Any?, name: String): Any? =
    if (target == null) null else runCatching {
        target.javaClass.getMethod(name).apply {
            isAccessible = true
        }.invoke(target)
    }.getOrNull()

private fun mutationReflectedInt(target: Any?, name: String): Int? =
    (mutationReflectedNoArg(target, name) as? Number)?.toInt()

private fun mutationTryRegions(
    implementation: Any,
    instructions: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>,
): List<MutationTryRegionInfo>? {
    val offsetToIndex = mutableMapOf<Int, Int>()
    var address = 0
    instructions.forEachIndexed { index, instruction ->
        offsetToIndex[address] = index
        address += mutationInstructionCodeUnits(instruction) ?: return null
    }
    offsetToIndex[address] = instructions.size

    val tryBlocks = mutationReflectedNoArg(implementation, "getTryBlocks")
        as? Iterable<*> ?: return null
    val result = mutableListOf<MutationTryRegionInfo>()
    tryBlocks.forEach { tryBlock ->
        val startAddress = mutationReflectedInt(
            tryBlock,
            "getStartCodeAddress",
        ) ?: return null
        val codeUnitCount = mutationReflectedInt(
            tryBlock,
            "getCodeUnitCount",
        ) ?: return null
        val handlersValue = mutationReflectedNoArg(
            tryBlock,
            "getExceptionHandlers",
        ) as? Iterable<*> ?: return null
        if (codeUnitCount <= 0) return null
        val startIndex = offsetToIndex[startAddress] ?: return null
        val endIndex = offsetToIndex[startAddress + codeUnitCount]
            ?: return null
        if (
            startIndex !in instructions.indices ||
            endIndex <= startIndex || endIndex > instructions.size
        ) return null
        val handlers = handlersValue.map { handler ->
            val exceptionValue = mutationReflectedNoArg(
                handler,
                "getExceptionType",
            )
            if (exceptionValue != null && exceptionValue !is CharSequence) {
                return null
            }
            val handlerAddress = mutationReflectedInt(
                handler,
                "getHandlerCodeAddress",
            ) ?: return null
            val handlerIndex = offsetToIndex[handlerAddress] ?: return null
            if (handlerIndex !in instructions.indices) return null
            MutationTryHandlerInfo(
                exceptionValue?.toString(),
                handlerIndex,
            )
        }
        if (handlers.isEmpty()) return null
        result += MutationTryRegionInfo(
            startIndex,
            endIndex,
            handlers,
        )
    }
    return result
}

private fun mutationNormalFlow(
    instructions: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>,
): MutationNormalFlow? {
    val offsets = mutableListOf<Int>()
    val offsetToIndex = mutableMapOf<Int, Int>()
    var address = 0
    instructions.forEachIndexed { index, instruction ->
        val opcode = mutationOpcodeName(instruction)
        if (
            "SWITCH" in opcode || opcode.endsWith("PAYLOAD") ||
            opcode == "FILL_ARRAY_DATA"
        ) return null
        offsets += address
        offsetToIndex[address] = index
        address += mutationInstructionCodeUnits(instruction) ?: return null
    }
    val successors = instructions.indices.associateWith { index ->
        val opcode = mutationOpcodeName(instructions[index])
        when {
            opcode.startsWith("GOTO") -> {
                val relative = mutationInstructionCodeOffset(
                    instructions[index],
                ) ?: return null
                listOf(offsetToIndex[offsets[index] + relative] ?: return null)
            }
            opcode.startsWith("IF_") -> {
                val relative = mutationInstructionCodeOffset(
                    instructions[index],
                ) ?: return null
                val target = offsetToIndex[offsets[index] + relative]
                    ?: return null
                buildList {
                    add(target)
                    if (index + 1 < instructions.size) add(index + 1)
                }
            }
            opcode.startsWith("RETURN") || opcode == "THROW" -> emptyList()
            index + 1 < instructions.size -> listOf(index + 1)
            else -> emptyList()
        }
    }
    if (successors.values.flatten().any { it !in instructions.indices }) {
        return null
    }
    val reachable = linkedSetOf<Int>()
    val queue = mutableListOf<Int>()
    if (instructions.isNotEmpty()) {
        reachable += 0
        queue += 0
    }
    var cursor = 0
    while (cursor < queue.size) {
        successors.getValue(queue[cursor++]).forEach { successor ->
            if (reachable.add(successor)) queue += successor
        }
    }
    val predecessors = reachable.associateWith { linkedSetOf<Int>() }
    reachable.forEach { source ->
        successors.getValue(source).filter { it in reachable }.forEach { target ->
            predecessors.getValue(target).add(source)
        }
    }
    val dominators = reachable.associateWith { node ->
        if (node == 0) mutableSetOf(0) else reachable.toMutableSet()
    }.toMutableMap()
    var changed: Boolean
    do {
        changed = false
        reachable.filter { it != 0 }.forEach { node ->
            val incoming = predecessors.getValue(node)
            val intersection = if (incoming.isEmpty()) {
                mutableSetOf<Int>()
            } else {
                dominators.getValue(incoming.first()).toMutableSet().apply {
                    incoming.drop(1).forEach { predecessor ->
                        retainAll(dominators.getValue(predecessor))
                    }
                }
            }
            intersection += node
            if (intersection != dominators.getValue(node)) {
                dominators[node] = intersection
                changed = true
            }
        }
    } while (changed)
    return MutationNormalFlow(
        successors,
        predecessors,
        reachable,
        dominators,
    )
}

private fun mutationIsPrimitiveDexType(type: String): Boolean =
    type.length == 1 && type[0] in "VZBSCIJFD"

private fun mutationFactoryReceiverIsProvenAt(
    method: com.android.tools.smali.dexlib2.iface.Method,
    instructions: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>,
    factoryIndex: Int,
    receiverRegister: Int,
): Boolean {
    val implementation = method.implementation ?: return false
    val proven = mutableSetOf<Int>()
    var parameterRegister = (
        implementation.registerCount - mutationMethodParameterWordCount(method)
    ).coerceAtLeast(0)
    if ((method.accessFlags and 0x8) == 0) {
        proven.add(parameterRegister)
        parameterRegister++
    }
    method.parameters.forEach { parameter ->
        val type = parameter.type
        if (type.startsWith("L") || type.startsWith("[")) {
            proven.add(parameterRegister)
        }
        parameterRegister += if (type == "J" || type == "D") 2 else 1
    }

    instructions.take(factoryIndex).forEach { instruction ->
        val opcode = mutationOpcodeName(instruction)
        val destination = mutationRegisterA(instruction)
        if (destination != null && mutationWritesRegisterA(opcode)) {
            val source = mutationRegisterB(instruction)
            if (opcode.startsWith("MOVE_OBJECT") && source in proven) {
                proven.add(destination)
            } else {
                proven.remove(destination)
            }
        }
    }
    return receiverRegister in proven
}

private fun mutationIsReferenceDexType(type: String): Boolean =
    type.startsWith("L") || type.startsWith("[")

private fun mutationAllInstructionRegisters(
    instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction,
): Set<Int> {
    mutationInvokeRegisters(instruction)?.let { return it.toSet() }
    val result = linkedSetOf<Int>()
    listOf(
        "getRegisterA", "getRegisterB", "getRegisterC", "getRegisterD",
        "getRegisterE", "getRegisterF", "getRegisterG",
    ).forEach { getter ->
        reflectedInstructionInt(instruction, getter)?.let(result::add)
    }
    return result
}

private fun mutationSubmittedListDeadAfterHook(
    instructions: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>,
    successors: Map<Int, List<Int>>,
    hookIndex: Int,
    initialAliases: Set<Int>,
    tryRegions: List<MutationTryRegionInfo>,
): Boolean {
    if (
        hookIndex !in instructions.indices || initialAliases.isEmpty() ||
        successors[hookIndex] == null
    ) return false
    val liveAliasesAt = mutableMapOf<Int, MutableSet<Int>>()
    val queue = mutableListOf<Int>()
    successors.getValue(hookIndex).forEach { successor ->
        val state = liveAliasesAt.getOrPut(successor, ::linkedSetOf)
        if (state.addAll(initialAliases)) queue += successor
    }
    var cursor = 0
    while (cursor < queue.size) {
        val index = queue[cursor++]
        val live = liveAliasesAt[index] ?: continue
        if (live.isEmpty()) continue
        if (tryRegions.any { region -> region.contains(index) }) return false
        val instruction = instructions[index]
        val registers = mutationAllInstructionRegisters(instruction)
        val nextLive = linkedSetOf<Int>().apply { addAll(live) }
        live.forEach { register ->
            if (register !in registers) return@forEach
            if (mutationDefinitelyOverwritesRegister(instruction, register)) {
                nextLive.remove(register)
            } else return false
        }
        if (nextLive.isEmpty()) continue
        val nextIndexes = successors[index] ?: return false
        nextIndexes.forEach { successor ->
            val state = liveAliasesAt.getOrPut(successor, ::linkedSetOf)
            if (state.addAll(nextLive)) queue += successor
        }
    }
    return true
}

private fun mutationControllerSubmissionIsTerminal(
    instructions: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>,
    successors: Map<Int, List<Int>>,
    hookIndex: Int,
    tryRegions: List<MutationTryRegionInfo>,
): Boolean {
    if (
        hookIndex !in instructions.indices || successors[hookIndex] == null ||
        successors.getValue(hookIndex).isEmpty()
    ) return false

    val visited = linkedSetOf<Int>()
    val queue = mutableListOf<Int>()
    successors.getValue(hookIndex).forEach { successor ->
        if (successor <= hookIndex || !visited.add(successor)) return false
        queue += successor
    }

    var cursor = 0
    while (cursor < queue.size) {
        val index = queue[cursor++]
        if (index !in instructions.indices) return false
        if (tryRegions.any { region -> region.contains(index) }) {
            // Do not permit hidden exceptional work after the controller has
            // retained the submitted List.
            return false
        }

        val opcode = mutationOpcodeName(instructions[index])
        val returnsVoid = opcode == "RETURN_VOID"
        val controlOnly = opcode == "NOP" ||
            opcode.startsWith("IF_") || opcode.startsWith("GOTO")
        if (!returnsVoid && !controlOnly) {
            // The controller may retain and later expose the submitted List.
            // Local-register liveness is therefore insufficient; reject every
            // later call, field/array access, monitor, allocation, value
            // return, mutation, or other externally observable operation.
            return false
        }

        val nextIndexes = successors[index] ?: return false
        if (returnsVoid) {
            if (nextIndexes.isNotEmpty()) return false
            continue
        }
        if (nextIndexes.isEmpty()) return false
        nextIndexes.forEach { successor ->
            if (successor <= index) return false
            if (visited.add(successor)) queue += successor
        }
    }
    return true
}

private fun mutationSameFieldReference(
    first: FieldReference?,
    second: FieldReference?,
): Boolean = first != null && second != null &&
    first.definingClass == second.definingClass &&
    first.name == second.name && first.type == second.type

private fun mutationFieldIsWrittenBetween(
    instructions: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>,
    field: FieldReference,
    startInclusive: Int,
    endExclusive: Int,
): Boolean = (startInclusive.coerceAtLeast(0) until
    endExclusive.coerceAtMost(instructions.size)).any { index ->
    val instruction = instructions[index]
    val opcode = mutationOpcodeName(instruction)
    (opcode.startsWith("IPUT") || opcode.startsWith("SPUT")) &&
        mutationSameFieldReference(
            (instruction as? ReferenceInstruction)
                ?.reference as? FieldReference,
            field,
        )
}

private fun mutationFieldAliasUsesAreLimited(
    instructions: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>,
    successors: Map<Int, List<Int>>,
    reachable: Set<Int>,
    startInclusive: Int,
    endInclusive: Int,
    fieldLoads: List<Pair<Int, Int>>,
    allowedUses: Set<Int>,
): Boolean {
    val loadRegisters = fieldLoads.toMap()
    val aliasesAt = mutableMapOf(startInclusive to mutableSetOf<Int>())
    val queue = mutableListOf(startInclusive)
    var cursor = 0
    while (cursor < queue.size) {
        val index = queue[cursor++]
        if (
            index !in startInclusive..endInclusive || index !in reachable
        ) continue
        val live = aliasesAt[index].orEmpty().toMutableSet()
        val instruction = instructions[index]
        live.toList().forEach { alias ->
            if (alias !in mutationAllInstructionRegisters(instruction)) {
                return@forEach
            }
            if (mutationOverwritesRegisterWithoutReading(
                    instruction, alias,
                )
            ) live.remove(alias) else if (index !in allowedUses) return false
        }
        loadRegisters[index]?.let(live::add)
        successors[index].orEmpty()
            .filter { it in startInclusive..endInclusive && it in reachable }
            .forEach { successor ->
                val firstVisit = successor !in aliasesAt
                val state = aliasesAt.getOrPut(successor) { mutableSetOf() }
                val changed = state.addAll(live)
                if (firstVisit || changed) queue += successor
            }
    }
    return true
}

/**
 * Proves the historical full replace-all transaction. Unlike the direct
 * range-update loop, the submitted List is a mutable snapshot of the
 * controller's previous backing List; factory results are transformed into
 * the new backing contents while that controller is monitored. Generic
 * discovery requires terminal submission. A cataloged historical host may keep
 * its callback/refresh tail only after every stock snapshot alias is definitely
 * dead; runtime injection submits a prepared detached copy and restores the
 * untouched stock snapshot immediately after the controller invoke.
 */
private fun analyzeSnapshotReplaceAllMutationHost(
    method: com.android.tools.smali.dexlib2.iface.Method,
    factoryDescriptor: String,
    controllerType: String,
    provenControllerMethods: Set<String>,
    allowDetachedHistoricalTail: Boolean,
    allowProvenFieldReloadAliases: Boolean = false,
): MutationHostPlan {
    val implementation = method.implementation
    val instructions = implementation?.instructions?.toList().orEmpty()
    val totalControllerCalls = instructions.count { instruction ->
        val reference = (instruction as? ReferenceInstruction)
            ?.reference as? MethodReference
        reference?.definingClass == controllerType &&
            reference.parameterTypes.any {
                it.toString() == "Ljava/util/List;"
            }
    }
    fun reject() = MutationHostPlan(
        emptyList(),
        emptyList(),
        totalControllerCalls,
    )
    if (
        implementation == null || instructions.isEmpty() ||
        method.name == "<init>" || method.name == "<clinit>" ||
        (method.accessFlags and 0x8) != 0 ||
        (method.accessFlags and 0x20) != 0 ||
        implementation.registerCount > 0xff
    ) return reject()
    val tryRegions = mutationTryRegions(
        implementation,
        instructions,
    ) ?: return reject()
    if (tryRegions.isEmpty()) return reject()
    val flow = mutationNormalFlow(instructions) ?: return reject()

    val controllerCalls = instructions.withIndex().mapNotNull { indexed ->
        val reference = (indexed.value as? ReferenceInstruction)
            ?.reference as? MethodReference ?: return@mapNotNull null
        if (
            reference.definingClass != controllerType ||
            methodDescriptor(reference) !in provenControllerMethods ||
            reference.parameterTypes.none {
                it.toString() == "Ljava/util/List;"
            }
        ) return@mapNotNull null
        val parameters = reference.parameterTypes.map { it.toString() }
        if (
            parameters.count { it == "Ljava/util/List;" } != 1 ||
            parameters.any { type ->
                type != "Ljava/util/List;" &&
                    !mutationIsPrimitiveDexType(type)
            } ||
            reference.returnType != "V" ||
            !mutationIsControllerDispatchInvoke(indexed.value) ||
            mutationIsStaticInvoke(indexed.value) ||
            !mutationInvokeMatchesReference(indexed.value, reference)
        ) return reject()
        val registers = mutationInvokeRegisters(indexed.value)
            ?: return reject()
        val listIndex = parameters.indexOf("Ljava/util/List;")
        val submitted = mutationInvokeParameterRegister(
            indexed.value,
            reference,
            listIndex,
        ) ?: return reject()
        val receiver = registers.firstOrNull() ?: return reject()
        Triple(indexed.index, receiver, submitted)
    }
    if (controllerCalls.size != 1) return reject()
    val (controllerIndex, controllerRegister, snapshotRegister) =
        controllerCalls.single()
    if (controllerIndex !in flow.reachable) return reject()
    if (tryRegions.any { it.contains(controllerIndex) }) return reject()

    val factoryCalls = instructions.withIndex().mapNotNull { indexed ->
        val reference = (indexed.value as? ReferenceInstruction)
            ?.reference as? MethodReference ?: return@mapNotNull null
        if (
            methodDescriptor(reference) != factoryDescriptor ||
            mutationIsStaticInvoke(indexed.value) ||
            !mutationInvokeMatchesReference(indexed.value, reference)
        ) return@mapNotNull null
        mutationInvokeRegisters(indexed.value)?.firstOrNull()?.let { receiver ->
            indexed.index to receiver
        }
    }
    if (factoryCalls.size != 1) return reject()
    val (factoryIndex, factoryReceiver) = factoryCalls.single()
    val parameterStart = (
        implementation.registerCount - mutationMethodParameterWordCount(method)
    ).coerceAtLeast(0)
    if (
        !mutationFactoryReceiverIsProvenAt(
            method,
            instructions,
            factoryIndex,
            factoryReceiver,
        ) || factoryIndex + 2 >= instructions.size ||
        mutationOpcodeName(instructions[factoryIndex + 1]) !=
            "MOVE_RESULT_OBJECT"
    ) return reject()
    val factoryResultRegister = mutationRegisterA(
        instructions[factoryIndex + 1],
    ) ?: return reject()
    val sourceAddInstruction = instructions[factoryIndex + 2]
    val sourceAddReference = (sourceAddInstruction as? ReferenceInstruction)
        ?.reference as? MethodReference ?: return reject()
    if (
        mutationIsStaticInvoke(sourceAddInstruction) ||
        !mutationInvokeMatchesReference(
            sourceAddInstruction,
            sourceAddReference,
        ) ||
        sourceAddReference.name != "add" ||
        sourceAddReference.returnType != "Z" ||
        !mutationIsCollectionType(sourceAddReference.definingClass) ||
        sourceAddReference.parameterTypes.map { it.toString() } !=
            listOf("Ljava/lang/Object;")
    ) return reject()
    val sourceListRegister = mutationInvokeRegisters(sourceAddInstruction)
        ?.firstOrNull() ?: return reject()
    val sourceAddedRegister = mutationInvokeParameterRegister(
        sourceAddInstruction,
        sourceAddReference,
        0,
    ) ?: return reject()
    if (
        sourceAddedRegister != factoryResultRegister ||
        sourceListRegister == factoryResultRegister ||
        sourceListRegister == factoryReceiver ||
        sourceListRegister >= parameterStart
    ) return reject()
    val sourceAddIndex = factoryIndex + 2

    val sourceConstructors = instructions.withIndex().filter { indexed ->
        if (indexed.index >= factoryIndex) return@filter false
        val reference = (indexed.value as? ReferenceInstruction)
            ?.reference as? MethodReference ?: return@filter false
        mutationIsDirectInvoke(indexed.value) &&
            mutationInvokeMatchesReference(indexed.value, reference) &&
            mutationIsProvenEmptyMutableListConstructor(reference) &&
            mutationInvokeRegisters(indexed.value)?.firstOrNull() ==
                sourceListRegister
    }
    if (sourceConstructors.size != 1) return reject()
    val sourceConstructorIndex = sourceConstructors.single().index
    val sourceAllocations = instructions.indices.filter { index ->
        index < sourceConstructorIndex &&
            mutationOpcodeName(instructions[index]) == "NEW_INSTANCE" &&
            mutationRegisterA(instructions[index]) == sourceListRegister
    }
    if (sourceAllocations.size != 1) return reject()
    val sourceAllocationIndex = sourceAllocations.single()
    if (
        sourceAllocationIndex !in flow.reachable ||
        sourceConstructorIndex !in flow.reachable ||
        factoryIndex !in flow.reachable || sourceAddIndex !in flow.reachable ||
        sourceConstructorIndex !in flow.dominators.getValue(factoryIndex) ||
        sourceAllocationIndex !in
            flow.dominators.getValue(sourceConstructorIndex) ||
        factoryIndex !in flow.dominators.getValue(sourceAddIndex) ||
        flow.predecessors.getValue(factoryIndex + 1) != setOf(factoryIndex) ||
        flow.predecessors.getValue(sourceAddIndex) !=
            setOf(factoryIndex + 1)
    ) return reject()
    var sourceLoop = false
    flow.reachable.forEach { source ->
        flow.successors.getValue(source).forEach targetLoop@{ target ->
            if (target > source || source >= controllerIndex) return@targetLoop
            if (
                target > sourceConstructorIndex && target <= factoryIndex &&
                sourceAddIndex in flow.dominators.getValue(source)
            ) {
                sourceLoop = true
            } else if (
                target <= sourceConstructorIndex || source >= controllerIndex
            ) return reject()
        }
    }
    if (!sourceLoop) return reject()

    val factoryResultOverwrites = flow.reachable
        .filter { index -> index > sourceAddIndex && index < controllerIndex }
        .filter { index ->
            mutationDefinitelyOverwritesRegister(
                instructions[index],
                factoryResultRegister,
            )
        }
    flow.reachable.forEach { index ->
        if (index <= sourceAddIndex || index >= controllerIndex) return@forEach
        val instruction = instructions[index]
        if (
            factoryResultRegister !in
                mutationAllInstructionRegisters(instruction) ||
            index in factoryResultOverwrites
        ) return@forEach
        if (factoryResultOverwrites.none { overwrite ->
            overwrite in flow.dominators.getValue(index)
        }) return reject()
    }

    var iteratorInvokeIndex = -1
    var iteratorRegister = -1
    val sourceSizeIndexes = mutableListOf<Int>()
    val sourceSemanticAllowed = linkedSetOf(
        sourceAllocationIndex,
        sourceConstructorIndex,
        factoryIndex,
        factoryIndex + 1,
        sourceAddIndex,
    )
    flow.reachable.forEach { index ->
        if (index >= controllerIndex) return@forEach
        val instruction = instructions[index]
        val reference = (instruction as? ReferenceInstruction)
            ?.reference as? MethodReference ?: return@forEach
        val receiver = mutationInvokeRegisters(instruction)?.firstOrNull()
        val parameters = reference.parameterTypes.map { it.toString() }
        if (
            receiver != sourceListRegister ||
            !mutationInvokeMatchesReference(instruction, reference) ||
            parameters.isNotEmpty()
        ) return@forEach
        if (
            mutationIsCollectionType(reference.definingClass) &&
            reference.name == "iterator" &&
            reference.returnType == "Ljava/util/Iterator;" &&
            index + 1 < instructions.size &&
            mutationOpcodeName(instructions[index + 1]) ==
                "MOVE_RESULT_OBJECT"
        ) {
            if (iteratorInvokeIndex >= 0) return reject()
            iteratorInvokeIndex = index
            iteratorRegister = mutationRegisterA(instructions[index + 1])
                ?: return reject()
            sourceSemanticAllowed += index
            sourceSemanticAllowed += index + 1
        } else if (
            mutationIsCollectionType(reference.definingClass) &&
            reference.name == "size" && reference.returnType == "I"
        ) {
            sourceSizeIndexes += index
            sourceSemanticAllowed += index
        }
    }
    if (
        iteratorInvokeIndex < 0 || iteratorRegister < 0 ||
        iteratorInvokeIndex <= sourceAddIndex ||
        iteratorInvokeIndex >= controllerIndex ||
        sourceSizeIndexes.size > 1 ||
        flow.predecessors.getValue(iteratorInvokeIndex + 1) !=
            setOf(iteratorInvokeIndex)
    ) return reject()

    val monitorEnters = flow.reachable.filter { index ->
        index < controllerIndex &&
            mutationOpcodeName(instructions[index]) == "MONITOR_ENTER" &&
            mutationRegisterA(instructions[index]) == controllerRegister
    }
    if (monitorEnters.size != 1) return reject()
    val monitorEnterIndex = monitorEnters.single()
    val controllerLoads = flow.reachable.filter { index ->
        if (index >= monitorEnterIndex) return@filter false
        val reference = (instructions[index] as? ReferenceInstruction)
            ?.reference as? FieldReference ?: return@filter false
        mutationOpcodeName(instructions[index]).startsWith("IGET") &&
            reference.type == controllerType &&
            mutationRegisterA(instructions[index]) == controllerRegister &&
            index in flow.dominators.getValue(monitorEnterIndex)
    }
    if (
        controllerLoads.isEmpty() ||
        (!allowProvenFieldReloadAliases && controllerLoads.size != 1)
    ) return reject()
    val controllerLoadIndex = controllerLoads.last()
    val controllerField = (instructions[controllerLoadIndex]
        as? ReferenceInstruction)?.reference as? FieldReference
        ?: return reject()
    val controllerOwnerRegister = mutationRegisterB(
        instructions[controllerLoadIndex],
    ) ?: return reject()
    if (
        controllerLoads.any { index ->
            !mutationSameFieldReference(
                (instructions[index] as? ReferenceInstruction)
                    ?.reference as? FieldReference,
                controllerField,
            ) || mutationRegisterB(instructions[index]) !=
                controllerOwnerRegister
        } || mutationFieldIsWrittenBetween(
            instructions,
            controllerField,
            controllerLoadIndex + 1,
            monitorEnterIndex,
        )
    ) return reject()

    val backingLoads = instructions.withIndex().mapNotNull { indexed ->
        if (
            indexed.index <= monitorEnterIndex ||
            indexed.index >= controllerIndex
        ) return@mapNotNull null
        val reference = (indexed.value as? ReferenceInstruction)
            ?.reference as? FieldReference ?: return@mapNotNull null
        if (
            !mutationOpcodeName(indexed.value).startsWith("IGET") ||
            reference.type != "Ljava/util/List;" ||
            reference.definingClass != controllerType ||
            mutationRegisterB(indexed.value) != controllerRegister
        ) return@mapNotNull null
        mutationRegisterA(indexed.value)?.let { destination ->
            indexed.index to destination
        }
    }
    if (
        backingLoads.isEmpty() ||
        (!allowProvenFieldReloadAliases && backingLoads.size != 1)
    ) return reject()
    val backingField = (instructions[backingLoads.first().first]
        as? ReferenceInstruction)?.reference as? FieldReference
        ?: return reject()
    if (backingLoads.any { (index, _) ->
            !mutationSameFieldReference(
                (instructions[index] as? ReferenceInstruction)
                    ?.reference as? FieldReference,
                backingField,
            )
        }
    ) return reject()
    val backingListRegisters = backingLoads.mapTo(linkedSetOf()) { it.second }

    val snapshotConstructors = instructions.withIndex().mapNotNull { indexed ->
        if (indexed.index <= monitorEnterIndex || indexed.index >= controllerIndex) {
            return@mapNotNull null
        }
        val reference = (indexed.value as? ReferenceInstruction)
            ?.reference as? MethodReference ?: return@mapNotNull null
        val backingArgument = mutationInvokeParameterRegister(
            indexed.value, reference, 0,
        ) ?: return@mapNotNull null
        if (!(
            mutationIsDirectInvoke(indexed.value) &&
            mutationInvokeMatchesReference(indexed.value, reference) &&
            mutationIsMutableListCopyConstructor(reference) &&
            mutationInvokeRegisters(indexed.value)?.firstOrNull() ==
                snapshotRegister &&
            backingArgument in backingListRegisters
        )) return@mapNotNull null
        val matchingLoad = backingLoads
            .filter { (index, register) ->
                index < indexed.index && register == backingArgument &&
                    index in flow.dominators.getValue(indexed.index)
            }
            .lastOrNull()?.first ?: return@mapNotNull null
        Triple(indexed.index, matchingLoad, backingArgument)
    }
    if (snapshotConstructors.size != 1) return reject()
    val (snapshotConstructorIndex, backingLoadIndex, backingListRegister) =
        snapshotConstructors.single()
    val snapshotAllocations = instructions.indices.filter { index ->
        index > monitorEnterIndex && index < snapshotConstructorIndex &&
            mutationOpcodeName(instructions[index]) == "NEW_INSTANCE" &&
            mutationRegisterA(instructions[index]) == snapshotRegister
    }
    if (snapshotAllocations.size != 1) return reject()
    val snapshotAllocationIndex = snapshotAllocations.single()

    var clearIndex = -1
    var backingAddIndex = -1
    var transformIndex = -1
    var transformedRegister = -1
    var nextIndex = -1
    var itemRegister = -1
    var hasNextIndex = -1
    var hasNextResultRegister = -1
    var hasNextBranchIndex = -1
    for (index in snapshotConstructorIndex + 1 until controllerIndex) {
        val instruction = instructions[index]
        val reference = (instruction as? ReferenceInstruction)
            ?.reference as? MethodReference ?: continue
        if (
            mutationIsStaticInvoke(instruction) ||
            mutationInvokeRegisters(instruction) == null ||
            !mutationInvokeMatchesReference(instruction, reference)
        ) continue
        val receiver = mutationInvokeRegisters(instruction)?.firstOrNull()
        val parameters = reference.parameterTypes.map { it.toString() }
        when {
            receiver in backingListRegisters &&
                mutationIsCollectionType(reference.definingClass) &&
                reference.name == "clear" &&
                parameters.isEmpty() && reference.returnType == "V" -> {
                if (clearIndex >= 0) return reject()
                clearIndex = index
            }
            receiver == iteratorRegister &&
                reference.definingClass == "Ljava/util/Iterator;" &&
                reference.name == "hasNext" &&
                parameters.isEmpty() && reference.returnType == "Z" &&
                index + 2 < instructions.size &&
                mutationOpcodeName(instructions[index + 1]) == "MOVE_RESULT" &&
                mutationOpcodeName(instructions[index + 2]).startsWith("IF_") -> {
                if (hasNextIndex >= 0) return reject()
                val result = mutationRegisterA(instructions[index + 1])
                    ?: return reject()
                if (mutationRegisterA(instructions[index + 2]) != result) {
                    return reject()
                }
                hasNextIndex = index
                hasNextResultRegister = result
                hasNextBranchIndex = index + 2
            }
            receiver == iteratorRegister &&
                reference.definingClass == "Ljava/util/Iterator;" &&
                reference.name == "next" &&
                parameters.isEmpty() &&
                reference.returnType == "Ljava/lang/Object;" &&
                index + 1 < instructions.size &&
                mutationOpcodeName(instructions[index + 1]) ==
                    "MOVE_RESULT_OBJECT" -> {
                if (nextIndex >= 0) return reject()
                nextIndex = index
                itemRegister = mutationRegisterA(instructions[index + 1])
                    ?: return reject()
            }
            receiver == controllerRegister &&
                reference.definingClass == controllerType &&
                "Ljava/util/List;" !in parameters &&
                parameters.size == 1 &&
                mutationIsReferenceDexType(parameters.single()) &&
                mutationIsReferenceDexType(reference.returnType) &&
                itemRegister >= 0 &&
                mutationInvokeParameterRegister(instruction, reference, 0) ==
                    itemRegister &&
                index + 1 < instructions.size &&
                mutationOpcodeName(instructions[index + 1]) ==
                    "MOVE_RESULT_OBJECT" -> {
                if (transformIndex >= 0) return reject()
                transformIndex = index
                transformedRegister = mutationRegisterA(
                    instructions[index + 1],
                ) ?: return reject()
            }
            receiver in backingListRegisters &&
                mutationIsCollectionType(reference.definingClass) &&
                reference.name == "add" &&
                reference.returnType == "Z" &&
                parameters == listOf("Ljava/lang/Object;") &&
                transformedRegister >= 0 &&
                mutationInvokeParameterRegister(instruction, reference, 0) ==
                    transformedRegister -> {
                if (backingAddIndex >= 0) return reject()
                backingAddIndex = index
            }
        }
    }
    if (
        clearIndex < 0 || hasNextIndex < 0 || hasNextResultRegister < 0 ||
        hasNextBranchIndex < 0 || nextIndex < 0 ||
        transformIndex < 0 || backingAddIndex < 0 ||
        !(clearIndex < iteratorInvokeIndex &&
            iteratorInvokeIndex < hasNextIndex && hasNextIndex < nextIndex &&
            nextIndex < transformIndex && transformIndex < backingAddIndex) ||
        listOf(
            clearIndex,
            iteratorInvokeIndex,
            iteratorInvokeIndex + 1,
            hasNextIndex,
            hasNextIndex + 1,
            hasNextBranchIndex,
            nextIndex,
            nextIndex + 1,
            transformIndex,
            transformIndex + 1,
            backingAddIndex,
        ).any { it !in flow.reachable } ||
        flow.predecessors.getValue(hasNextIndex + 1) != setOf(hasNextIndex) ||
        flow.predecessors.getValue(hasNextBranchIndex) !=
            setOf(hasNextIndex + 1) ||
        flow.predecessors.getValue(nextIndex + 1) != setOf(nextIndex) ||
        flow.predecessors.getValue(transformIndex + 1) != setOf(transformIndex)
    ) return reject()

    val normalMonitorExits = (backingAddIndex + 1 until controllerIndex)
        .filter { index ->
            mutationOpcodeName(instructions[index]) == "MONITOR_EXIT" &&
                mutationRegisterA(instructions[index]) == controllerRegister
        }
    if (normalMonitorExits.size != 1) return reject()
    val normalMonitorExitIndex = normalMonitorExits.single()
    if (mutationFieldIsWrittenBetween(
            instructions,
            backingField,
            monitorEnterIndex + 1,
            normalMonitorExitIndex,
        )
    ) return reject()
    val hasNextSuccessors = flow.successors.getValue(hasNextBranchIndex)
    if (
        mutationOpcodeName(instructions[hasNextBranchIndex]) != "IF_EQZ" ||
        hasNextSuccessors.size != 2 || hasNextSuccessors[1] != nextIndex ||
        hasNextSuccessors[0] <= backingAddIndex ||
        hasNextSuccessors[0] > normalMonitorExitIndex
    ) return reject()
    if (
        snapshotAllocationIndex !in
            flow.dominators.getValue(snapshotConstructorIndex) ||
        backingLoadIndex !in
            flow.dominators.getValue(snapshotConstructorIndex) ||
        snapshotConstructorIndex !in flow.dominators.getValue(clearIndex) ||
        clearIndex !in flow.dominators.getValue(iteratorInvokeIndex) ||
        iteratorInvokeIndex !in flow.dominators.getValue(hasNextIndex) ||
        hasNextBranchIndex !in flow.dominators.getValue(nextIndex) ||
        nextIndex !in flow.dominators.getValue(transformIndex) ||
        transformIndex !in flow.dominators.getValue(backingAddIndex) ||
        controllerLoadIndex !in flow.dominators.getValue(monitorEnterIndex) ||
        monitorEnterIndex !in flow.dominators.getValue(controllerIndex) ||
        clearIndex !in flow.dominators.getValue(controllerIndex) ||
        normalMonitorExitIndex !in flow.dominators.getValue(controllerIndex)
    ) return reject()

    var iteratorBackEdges = 0
    flow.reachable.forEach { source ->
        flow.successors.getValue(source).forEach { target ->
            if (
                source > backingAddIndex && source < normalMonitorExitIndex &&
                target <= source && target > clearIndex
            ) {
                if (
                    target != hasNextIndex ||
                    backingAddIndex !in flow.dominators.getValue(source)
                ) return reject()
                iteratorBackEdges++
            }
        }
    }
    if (iteratorBackEdges != 1) return reject()

    if (
        sourceListRegister == snapshotRegister ||
        sourceListRegister in backingListRegisters ||
        sourceListRegister == iteratorRegister ||
        sourceListRegister == controllerRegister ||
        snapshotRegister in backingListRegisters ||
        snapshotRegister == iteratorRegister ||
        snapshotRegister == controllerRegister ||
        controllerRegister in backingListRegisters ||
        iteratorRegister == controllerRegister ||
        itemRegister in setOf(
            sourceListRegister, snapshotRegister,
            iteratorRegister, controllerRegister,
        ) ||
        transformedRegister in setOf(
            sourceListRegister, snapshotRegister,
            iteratorRegister, controllerRegister, itemRegister,
        )
    ) return reject()

    val snapshotAllowed = setOf(
        snapshotAllocationIndex,
        snapshotConstructorIndex,
        controllerIndex,
    )
    val backingAllowed = linkedSetOf(
        snapshotConstructorIndex,
        clearIndex,
        backingAddIndex,
    ).apply { addAll(backingLoads.map { it.first }) }
    val iteratorAllowed = setOf(
        iteratorInvokeIndex + 1,
        hasNextIndex,
        nextIndex,
    )
    val itemAllowed = linkedSetOf(nextIndex + 1, transformIndex)
    for (index in nextIndex + 2 until transformIndex) {
        if (
            mutationOpcodeName(instructions[index]) == "CHECK_CAST" &&
            mutationRegisterA(instructions[index]) == itemRegister
        ) itemAllowed += index
    }
    val transformedOverwrites = flow.reachable
        .filter { index -> index > backingAddIndex }
        .filter { index ->
            mutationDefinitelyOverwritesRegister(
                instructions[index],
                transformedRegister,
            )
        }
    val sourceOverwrites = flow.reachable
        .filter { index -> index > normalMonitorExitIndex }
        .filter { index ->
            mutationDefinitelyOverwritesRegister(
                instructions[index],
                sourceListRegister,
            )
        }
    val sourceAllowed = linkedSetOf<Int>().apply {
        addAll(sourceSemanticAllowed)
        addAll(sourceSizeIndexes)
    }
    flow.reachable.forEach { index ->
        val instruction = instructions[index]
        val registers = mutationAllInstructionRegisters(instruction)
        if (
            index >= snapshotAllocationIndex && index <= controllerIndex &&
            snapshotRegister in registers && index !in snapshotAllowed
        ) return reject()
        if (
            index >= iteratorInvokeIndex + 1 &&
            index <= normalMonitorExitIndex &&
            iteratorRegister in registers && index !in iteratorAllowed
        ) return reject()
        if (
            index >= nextIndex + 1 && index <= backingAddIndex &&
            itemRegister in registers && index !in itemAllowed
        ) return reject()
        if (
            index >= transformIndex + 1 && transformedRegister in registers &&
            index != transformIndex + 1 && index != backingAddIndex
        ) {
            if (
                index !in transformedOverwrites &&
                transformedOverwrites.none { overwrite ->
                    overwrite in flow.dominators.getValue(index)
                }
            ) return reject()
        }
        if (
            index >= sourceAllocationIndex &&
            sourceListRegister in registers && index !in sourceAllowed
        ) {
            if (
                index !in sourceOverwrites &&
                sourceOverwrites.none { overwrite ->
                    overwrite in flow.dominators.getValue(index)
                }
            ) return reject()
        }
    }

    if (!mutationFieldAliasUsesAreLimited(
            instructions,
            flow.successors,
            flow.reachable,
            monitorEnterIndex + 1,
            normalMonitorExitIndex,
            backingLoads,
            backingAllowed,
        )
    ) return reject()

    val controllerAllowed = linkedSetOf(
        controllerLoadIndex,
        monitorEnterIndex,
        transformIndex,
        normalMonitorExitIndex,
        controllerIndex,
    ).apply { addAll(backingLoads.map { it.first }) }
    flow.reachable.forEach { index ->
        if (index < controllerLoadIndex || index > controllerIndex) {
            return@forEach
        }
        val instruction = instructions[index]
        if (
            controllerRegister !in mutationAllInstructionRegisters(instruction) ||
            index in controllerAllowed
        ) return@forEach
        val reference = (instruction as? ReferenceInstruction)
            ?.reference as? FieldReference ?: return reject()
        if (
            !mutationOpcodeName(instruction).startsWith("IGET") ||
            reference.definingClass != controllerType ||
            mutationRegisterB(instruction) != controllerRegister ||
            mutationRegisterA(instruction) == controllerRegister
        ) return reject()
    }

    if (tryRegions.size != 2) return reject()
    var handlerIndex = -1
    var primaryRegion: MutationTryRegionInfo? = null
    tryRegions.forEach { region ->
        if (region.handlers.size != 1) return reject()
        val handler = region.handlers.single()
        if (handler.exceptionType != null) return reject()
        if (handlerIndex < 0) {
            handlerIndex = handler.handlerIndex
        } else if (handlerIndex != handler.handlerIndex) return reject()
        if (
            region.startIndex == monitorEnterIndex + 1 &&
            region.endIndexExclusive == normalMonitorExitIndex + 1 &&
            region.contains(snapshotConstructorIndex) &&
            region.contains(clearIndex) && region.contains(iteratorInvokeIndex) &&
            region.contains(backingAddIndex)
        ) {
            if (primaryRegion != null) return reject()
            primaryRegion = region
        }
        if (region.contains(controllerIndex)) return reject()
    }
    if (
        primaryRegion == null || handlerIndex < 0 ||
        handlerIndex + 2 >= instructions.size ||
        handlerIndex in flow.reachable ||
        mutationOpcodeName(instructions[handlerIndex]) != "MOVE_EXCEPTION" ||
        mutationOpcodeName(instructions[handlerIndex + 1]) != "MONITOR_EXIT" ||
        mutationOpcodeName(instructions[handlerIndex + 2]) != "THROW"
    ) return reject()
    val cleanupRegion = tryRegions.single { it !== primaryRegion }
    if (
        cleanupRegion.startIndex <= controllerIndex ||
        cleanupRegion.endIndexExclusive != handlerIndex + 2 ||
        !cleanupRegion.contains(handlerIndex) ||
        !cleanupRegion.contains(handlerIndex + 1)
    ) return reject()
    val reachableCleanupThrows = flow.reachable.count { index ->
        index >= cleanupRegion.startIndex && index < handlerIndex &&
            mutationOpcodeName(instructions[index]) == "THROW"
    }
    if (reachableCleanupThrows != 1) return reject()
    val exceptionRegister = mutationRegisterA(instructions[handlerIndex])
        ?: return reject()
    if (
        mutationRegisterA(instructions[handlerIndex + 1]) !=
            controllerRegister ||
        mutationRegisterA(instructions[handlerIndex + 2]) != exceptionRegister
    ) return reject()

    val terminalSubmission = mutationControllerSubmissionIsTerminal(
        instructions, flow.successors, controllerIndex, tryRegions,
    )
    val detachedHistoricalTail = allowDetachedHistoricalTail &&
        mutationSubmittedListDeadAfterHook(
            instructions,
            flow.successors,
            controllerIndex,
            setOf(snapshotRegister),
            tryRegions,
        )
    if (!terminalSubmission && !detachedHistoricalTail) return reject()

    return MutationHostPlan(
        listOf(factoryIndex to factoryReceiver),
        listOf(controllerIndex to snapshotRegister),
        0,
    )
}

private fun mutationSupportedHelperInvoke(
    instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction,
): Boolean = mutationOpcodeName(instruction) in setOf(
    "INVOKE_STATIC", "INVOKE_STATIC_RANGE",
    "INVOKE_DIRECT", "INVOKE_DIRECT_RANGE",
    "INVOKE_VIRTUAL", "INVOKE_VIRTUAL_RANGE",
    "INVOKE_INTERFACE", "INVOKE_INTERFACE_RANGE",
)

private fun mutationControllerListRegister(
    instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction,
    controllerType: String,
    provenControllerMethods: Set<String>,
): Int? {
    val reference = (instruction as? ReferenceInstruction)
        ?.reference as? MethodReference ?: return null
    if (
        reference.definingClass != controllerType ||
        reference.returnType != "V" ||
        !mutationIsControllerDispatchInvoke(instruction) ||
        mutationIsStaticInvoke(instruction) ||
        !mutationInvokeMatchesReference(instruction, reference) ||
        methodDescriptor(reference) !in provenControllerMethods
    ) return null
    val listParameters = reference.parameterTypes.map { it.toString() }
        .withIndex()
        .filter { it.value == "Ljava/util/List;" }
        .map { it.index }
    if (listParameters.size != 1) return null
    return mutationInvokeParameterRegister(
        instruction,
        reference,
        listParameters.single(),
    )
}

private fun mutationOneHopCandidateArgumentIdentities(
    caller: Method,
    candidates: List<Triple<Int, Int, Int>>,
): Map<Int, String> {
    val implementation = caller.implementation ?: return emptyMap()
    val byIndex = candidates.associateBy { it.first }
    val registers = mutableMapOf<Int, String>()
    val result = mutableMapOf<Int, String>()
    val code = implementation.instructions.toList()
    val parameterStart = (
        implementation.registerCount - mutationMethodParameterWordCount(caller)
    ).coerceAtLeast(0)
    for (register in parameterStart until implementation.registerCount) {
        registers[register] = "parameter:$register"
    }
    code.forEachIndexed { index, instruction ->
        byIndex[index]?.let { candidate ->
            result[index] = registers[candidate.third]
                ?: "unresolved:${candidate.third}"
        }
        val opcode = mutationOpcodeName(instruction)
        val destination = mutationRegisterA(instruction)
        if (opcode.startsWith("MOVE_OBJECT")) {
            val source = mutationRegisterB(instruction)
            if (destination != null && source != null) {
                registers[destination] = registers[source]
                    ?: "unresolved:$source"
            }
        } else if (opcode != "CHECK_CAST" &&
            destination != null && mutationWritesRegisterA(opcode)
        ) {
            registers[destination] = "write:$index:$destination"
        }
    }
    return result
}

private fun mutationCompleteHelperHierarchy(
    type: String,
    classDefinitions: Map<String, List<ClassDef>>,
    visited: MutableSet<String>,
): Boolean {
    if (type == "Ljava/lang/Object;") return true
    if (!visited.add(type)) return false
    val definitions = classDefinitions[type].orEmpty()
    if (definitions.size != 1) return false
    val definition = definitions.single()
    if (definition.interfaces.any { interfaceType ->
            !mutationCompleteHelperHierarchy(
                interfaceType.toString(), classDefinitions, visited,
            )
        }
    ) return false
    val superclass = definition.superclass ?: return false
    return mutationCompleteHelperHierarchy(
        superclass, classDefinitions, visited,
    )
}

private fun mutationSealedVirtualHelperTarget(
    helper: Method,
    classDefinitions: Map<String, List<ClassDef>>,
): Boolean {
    val owners = classDefinitions[helper.definingClass].orEmpty()
    if (owners.size != 1) return false
    val owner = owners.single()
    if ((owner.accessFlags and 0x200) != 0) return false
    if (
        (helper.accessFlags and 0x10) == 0 &&
        (owner.accessFlags and 0x10) == 0
    ) return false
    return mutationCompleteHelperHierarchy(
        owner.type, classDefinitions, linkedSetOf(),
    )
}

private fun mutationHelperArgumentAliasesList(
    instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction,
    reference: MethodReference?,
    aliases: Set<Int>,
    submittedRegister: Int,
): Boolean {
    reference ?: return true
    val registers = mutationInvokeRegisters(instruction) ?: return true
    if (!mutationIsStaticInvoke(instruction) &&
        registers.firstOrNull() in aliases
    ) return true
    reference.parameterTypes.indices.forEach { parameterIndex ->
        val argument = mutationInvokeParameterRegister(
            instruction, reference, parameterIndex,
        )
        if (argument != null && argument in aliases &&
            argument != submittedRegister
        ) return true
    }
    return false
}

private fun mutationProveTransparentHelperBody(
    helper: Method,
    formalRegister: Int,
    controllerType: String,
    provenControllerMethods: Set<String>,
): Int {
    val implementation = helper.implementation ?: return -1
    if (
        formalRegister < 0 || mutationHasTryBlocks(implementation) ||
        implementation.registerCount > 0xff
    ) return -1
    val code = implementation.instructions.toList()
    val flow = mutationNormalFlow(code) ?: return -1
    if (code.isEmpty() || flow.reachable.size != code.size) return -1
    flow.reachable.forEach { source ->
        val successors = flow.successors[source].orEmpty()
        if (successors.size > 1 || successors.any { it <= source }) return -1
        val opcode = mutationOpcodeName(code[source])
        if (opcode.startsWith("IF_") || "SWITCH" in opcode ||
            opcode.startsWith("MONITOR_")
        ) return -1
    }

    val aliases = linkedSetOf(formalRegister)
    var controllerIndex = -1
    var index = 0
    val visited = linkedSetOf<Int>()
    while (index in code.indices && visited.add(index)) {
        val instruction = code[index]
        val opcode = mutationOpcodeName(instruction)
        val reference = (instruction as? ReferenceInstruction)
            ?.reference as? MethodReference
        val submitted = mutationControllerListRegister(
            instruction, controllerType, provenControllerMethods,
        )
        when {
            submitted != null -> {
                if (
                    controllerIndex >= 0 || submitted !in aliases ||
                    mutationHelperArgumentAliasesList(
                        instruction, reference, aliases, submitted,
                    )
                ) return -1
                controllerIndex = index
            }
            reference != null || opcode.startsWith("INVOKE_") -> return -1
            opcode.startsWith("MOVE_OBJECT") -> {
                val destination = mutationRegisterA(instruction) ?: return -1
                val source = mutationRegisterB(instruction) ?: return -1
                if (source in aliases) aliases += destination
                else if (destination in aliases) return -1
            }
            opcode == "CHECK_CAST" -> {
                mutationRegisterA(instruction) ?: return -1
            }
            opcode == "NOP" || opcode.startsWith("GOTO") ||
                opcode == "RETURN_VOID" -> Unit
            (opcode.startsWith("SGET_OBJECT") ||
                opcode.startsWith("IGET_OBJECT")) &&
                mutationAllInstructionRegisters(instruction)
                    .none { it in aliases } -> Unit
            else -> return -1
        }
        val successors = flow.successors[index].orEmpty()
        index = successors.firstOrNull() ?: -1
    }
    if (
        controllerIndex < 0 ||
        !mutationControllerSubmissionIsTerminal(
            code, flow.successors, controllerIndex, emptyList(),
        )
    ) return -1
    return controllerIndex
}

private fun mutationProveOneHopHelper(
    invocation: com.android.tools.smali.dexlib2.iface.instruction.Instruction,
    reference: MethodReference,
    listParameterIndex: Int,
    controllerType: String,
    provenControllerMethods: Set<String>,
    classDefinitions: Map<String, List<ClassDef>>,
    methodDefinitions: Map<String, List<Method>>,
): OneHopHelperProof? {
    val definitions = methodDefinitions[methodDescriptor(reference)].orEmpty()
    if (definitions.size != 1) return null
    val helper = definitions.single()
    if (
        helper.implementation == null || helper.name == "<init>" ||
        helper.name == "<clinit>" || helper.returnType != "V" ||
        (helper.accessFlags and (0x400 or 0x100 or 0x20)) != 0 ||
        methodDescriptor(helper) != methodDescriptor(reference)
    ) return null

    val opcode = mutationOpcodeName(invocation)
    when {
        mutationIsStaticInvoke(invocation) ->
            if ((helper.accessFlags and 0x8) == 0) return null
        mutationIsDirectInvoke(invocation) ->
            if ((helper.accessFlags and 0x8) != 0) return null
        opcode == "INVOKE_VIRTUAL" || opcode == "INVOKE_VIRTUAL_RANGE" ->
            if ((helper.accessFlags and 0x8) != 0 ||
                !mutationSealedVirtualHelperTarget(helper, classDefinitions)
            ) return null
        else -> return null
    }

    val parameters = helper.parameters.map { it.type }
    if (parameters.any {
            !mutationIsReferenceDexType(it) &&
                !mutationIsPrimitiveDexType(it)
        }
    ) return null
    if (
        parameters.count(::mutationIsReferenceDexType) != 1 ||
        listParameterIndex !in parameters.indices ||
        parameters[listParameterIndex] != "Ljava/util/List;"
    ) return null
    val formalRegister = mutationMethodParameterRegister(
        helper, listParameterIndex,
    ) ?: return null
    val controllerIndex = mutationProveTransparentHelperBody(
        helper, formalRegister, controllerType, provenControllerMethods,
    )
    if (controllerIndex < 0) return null
    return OneHopHelperProof(
        helper, listParameterIndex, formalRegister, controllerIndex,
    )
}

private fun mutationCompleteOneHopPlan(
    caller: Method,
    code: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>,
    candidate: Triple<Int, Int, Int>,
    factoryDescriptor: String,
    controllerType: String,
    provenControllerMethods: Set<String>,
    classDefinitions: Map<String, List<ClassDef>>,
    methodDefinitions: Map<String, List<Method>>,
): MutationHostPlan? {
    val helperIndex = candidate.first
    val callerProof = analyzeMutationHostMethod(
        caller, factoryDescriptor, controllerType, provenControllerMethods,
        OneHopSubmission(helperIndex, candidate.third, candidate.second),
    )
    if (
        callerProof.unsupportedControllerCalls != 0 ||
        callerProof.factoryCaptureSites.isEmpty() ||
        callerProof.controllerHookSites.map { it.first } != listOf(helperIndex)
    ) return null
    val helperInvoke = code[helperIndex]
    val helperReference = (helperInvoke as? ReferenceInstruction)
        ?.reference as? MethodReference ?: return null
    val helperProof = mutationProveOneHopHelper(
        helperInvoke, helperReference, candidate.second, controllerType,
        provenControllerMethods, classDefinitions, methodDefinitions,
    ) ?: return null
    val receiverRegisters = callerProof.factoryCaptureSites.map { it.second }
        .distinct()
    if (receiverRegisters.size != 1) return null
    val factoryReceiver = receiverRegisters.single()
    val firstCapture = callerProof.factoryCaptureSites.minOf { it.first }
    if (callerProof.factoryCaptureSites.any {
            it.first < 0 || it.first >= helperIndex
        }
    ) return null
    for (index in firstCapture + 1 until helperIndex) {
        if (mutationRegisterA(code[index]) == factoryReceiver &&
            mutationWritesRegisterA(mutationOpcodeName(code[index]))
        ) return null
    }
    return MutationHostPlan(
        callerProof.factoryCaptureSites,
        listOf(helperIndex to candidate.third),
        0,
        "ONE_HOP_TRANSPARENT_CONSUMER",
        methodDescriptor(helperProof.helper),
        helperIndex,
        helperProof.argumentPosition,
        helperProof.formalParameterRegister,
        helperProof.controllerSubmissionIndex,
        factoryReceiver,
        1,
    )
}

private fun analyzeOneHopMutationHost(
    caller: Method,
    factoryDescriptor: String,
    controllerType: String,
    provenControllerMethods: Set<String>,
    classDefinitions: Map<String, List<ClassDef>>,
    methodDefinitions: Map<String, List<Method>>,
): MutationHostPlan {
    val rejected = MutationHostPlan(emptyList(), emptyList(), 0)
    val implementation = caller.implementation ?: return rejected
    if (mutationHasTryBlocks(implementation) ||
        (caller.accessFlags and 0x20) != 0
    ) return rejected
    val code = implementation.instructions.toList()
    val candidates = mutableListOf<Triple<Int, Int, Int>>()
    code.forEachIndexed { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)
            ?.reference as? MethodReference ?: return@forEachIndexed
        if (
            !mutationSupportedHelperInvoke(instruction) ||
            !mutationInvokeMatchesReference(instruction, reference) ||
            reference.returnType != "V" ||
            methodDescriptor(reference) == factoryDescriptor ||
            reference.definingClass == controllerType
        ) return@forEachIndexed
        val parameters = reference.parameterTypes.map { it.toString() }
        var listParameter = -1
        var referenceParameters = 0
        var invalidReferenceParameter = false
        parameters.forEachIndexed { parameterIndex, type ->
            if (!mutationIsReferenceDexType(type)) {
                if (!mutationIsPrimitiveDexType(type)) {
                    invalidReferenceParameter = true
                }
            } else {
                referenceParameters++
                if (type == "Ljava/util/List;") listParameter = parameterIndex
                else invalidReferenceParameter = true
            }
        }
        if (invalidReferenceParameter || referenceParameters != 1 ||
            listParameter < 0
        ) return@forEachIndexed
        val listRegister = mutationInvokeParameterRegister(
            instruction, reference, listParameter,
        ) ?: return@forEachIndexed
        candidates += Triple(index, listParameter, listRegister)
    }
    if (candidates.isEmpty()) return rejected
    val identities = mutationOneHopCandidateArgumentIdentities(
        caller, candidates,
    )
    val completePlans = candidates.mapNotNull { candidate ->
        mutationCompleteOneHopPlan(
            caller, code, candidate, factoryDescriptor, controllerType,
            provenControllerMethods, classDefinitions, methodDefinitions,
        )
    }
    if (completePlans.size != 1) return rejected
    val selected = completePlans.single()
    val selectedIdentity = identities[selected.helperInvocationIndex]
        ?: return rejected
    if (identities.any { (index, identity) ->
            index != selected.helperInvocationIndex &&
                identity == selectedIdentity
        }
    ) return rejected
    return selected
}

private fun analyzeMutationHostCandidate(
    method: com.android.tools.smali.dexlib2.iface.Method,
    factoryDescriptor: String,
    controllerType: String,
    provenControllerMethods: Set<String>,
): MutationHostPlan = analyzeMutationHostCandidate(
    method,
    factoryDescriptor,
    controllerType,
    provenControllerMethods,
    false,
    emptyMap(),
    emptyMap(),
)

private fun analyzeMutationHostCandidate(
    method: com.android.tools.smali.dexlib2.iface.Method,
    factoryDescriptor: String,
    controllerType: String,
    provenControllerMethods: Set<String>,
    allowDetachedHistoricalTail: Boolean,
): MutationHostPlan = analyzeMutationHostCandidate(
    method,
    factoryDescriptor,
    controllerType,
    provenControllerMethods,
    allowDetachedHistoricalTail,
    emptyMap(),
    emptyMap(),
)

private fun analyzeMutationHostCandidate(
    method: com.android.tools.smali.dexlib2.iface.Method,
    factoryDescriptor: String,
    controllerType: String,
    provenControllerMethods: Set<String>,
    allowDetachedHistoricalTail: Boolean,
    classDefinitions: Map<String, List<ClassDef>> = emptyMap(),
    methodDefinitions: Map<String, List<Method>> = emptyMap(),
): MutationHostPlan {
    val producer = methodDefinitions[factoryDescriptor]
        .orEmpty()
        .singleOrNull()
    val converterSites = producer?.let {
        mutationItemConverterSourceSites(method, it)
    }
    val hasItemConverterSourceProof =
        producer != null && converterSites != null &&
            producer.parameters.size == 1 &&
            producer.parameters.single().type.let { type ->
                type.startsWith("L") || type.startsWith("[")
            }
    fun retainSourceProof(plan: MutationHostPlan): MutationHostPlan =
        if (hasItemConverterSourceProof) {
            plan.copy(proofKind = "ITEM_CONVERTER_SOURCE")
        } else {
            plan
        }

    val straightLine = analyzeMutationHostMethod(
        method,
        factoryDescriptor,
        controllerType,
        provenControllerMethods,
    )
    if (
        straightLine.unsupportedControllerCalls == 0 &&
        straightLine.factoryCaptureSites.isNotEmpty() &&
        straightLine.controllerHookSites.isNotEmpty()
    ) return retainSourceProof(straightLine)

    val loop = analyzeCanonicalMutationHostLoop(
        method,
        factoryDescriptor,
        controllerType,
        provenControllerMethods,
        allowDetachedHistoricalTail = true,
        allowConsumedResultRegisterReuse = true,
    )
    if (
        loop.unsupportedControllerCalls == 0 &&
        loop.factoryCaptureSites.isNotEmpty() &&
        loop.controllerHookSites.isNotEmpty()
    ) return retainSourceProof(loop)

    // Backing-list reloads are safe here because the snapshot proof separately
    // proves identical field/owner identity, dominance, bounded alias uses, and
    // no intervening field writes. That proof is independent of whether the
    // selected factory consumes an index or an object.
    val snapshot = analyzeSnapshotReplaceAllMutationHost(
        method,
        factoryDescriptor,
        controllerType,
        provenControllerMethods,
        allowDetachedHistoricalTail = true,
        allowProvenFieldReloadAliases = true,
    )
    if (
        snapshot.unsupportedControllerCalls == 0 &&
        snapshot.factoryCaptureSites.isNotEmpty() &&
        snapshot.controllerHookSites.isNotEmpty()
    ) return retainSourceProof(snapshot)
    val oneHop = analyzeOneHopMutationHost(
        method,
        factoryDescriptor,
        controllerType,
        provenControllerMethods,
        classDefinitions,
        methodDefinitions,
    )
    if (
        oneHop.unsupportedControllerCalls == 0 &&
        oneHop.factoryCaptureSites.isNotEmpty() &&
        oneHop.controllerHookSites.isNotEmpty()
    ) return oneHop
    if (
        hasItemConverterSourceProof
    ) {
        val converterLoop = analyzeCanonicalMutationHostLoop(
            method,
            factoryDescriptor,
            controllerType,
            provenControllerMethods,
            allowDetachedHistoricalTail = true,
            allowConsumedResultRegisterReuse = true,
        )
        if (
            converterLoop.unsupportedControllerCalls == 0 &&
            converterLoop.factoryCaptureSites.isNotEmpty() &&
            converterLoop.controllerHookSites.isNotEmpty()
        ) return converterLoop.copy(proofKind = "ITEM_CONVERTER_SOURCE")

        val converterSnapshot = analyzeSnapshotReplaceAllMutationHost(
            method,
            factoryDescriptor,
            controllerType,
            provenControllerMethods,
            allowDetachedHistoricalTail = true,
            allowProvenFieldReloadAliases = true,
        )
        if (
            converterSnapshot.unsupportedControllerCalls == 0 &&
            converterSnapshot.factoryCaptureSites.isNotEmpty() &&
            converterSnapshot.controllerHookSites.isNotEmpty()
        ) return converterSnapshot.copy(proofKind = "ITEM_CONVERTER_SOURCE")
    }
    return MutationHostPlan(
        emptyList(),
        emptyList(),
        maxOf(
            straightLine.unsupportedControllerCalls,
            loop.unsupportedControllerCalls,
            snapshot.unsupportedControllerCalls,
            oneHop.unsupportedControllerCalls,
        ),
    )
}



val pinPlaylistPatch = bytecodePatch(
    name = "Pin playlists",
    description = "Pins playlists to the top of the YouTube Music Library.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)
    extendWith("extensions/pinplaylist.mpe")

    execute {
        val menuItemPresenterFingerprint: Fingerprint =
            runCatching<Fingerprint> {
                PlaylistMenuItemPresenterExactFingerprint.method
                PlaylistMenuItemPresenterExactFingerprint
            }.getOrElse {
                PlaylistMenuItemPresenterClassFingerprint
            }

        val libraryAdapterBindFingerprint: Fingerprint =
            runCatching<Fingerprint> {
                PlaylistLithoAdapterBindExactFingerprint.method
                PlaylistLithoAdapterBindExactFingerprint
            }.getOrElse {
                PlaylistLithoAdapterBindFingerprint
            }

        val adapterProxyRenderInfoFingerprint: Fingerprint =
            runCatching<Fingerprint> {
                PlaylistAdapterProxyRenderInfoExactFingerprint.method
                PlaylistAdapterProxyRenderInfoExactFingerprint
            }.getOrElse {
                PlaylistAdapterProxyRenderInfoFingerprint
            }
        val playlistFlyoutSourceFingerprint: Fingerprint =
            runCatching<Fingerprint> {
                PlaylistFlyoutSourceExactFingerprint.method
                PlaylistFlyoutSourceExactFingerprint
            }.getOrElse {
                PlaylistFlyoutSourceFingerprint
            }

        val nativeMenuRowFactoryFingerprint: Fingerprint =
            runCatching<Fingerprint> {
                PlaylistNativeMenuRowFactoryExactFingerprint.method
                PlaylistNativeMenuRowFactoryExactFingerprint
            }.getOrElse {
                PlaylistNativeMenuRowFactoryFingerprint
            }





        /*
         * Part 1: consume only the fresh local Library Pin/Unpin menu action.
         */
        val menuItemPresenterClass =
            menuItemPresenterFingerprint.classDef

        /*
         * Apply the extension-owned icon immediately after YouTube Music calls
         * its native visual binder. The binder receiver register is guaranteed
         * to be the MenuItemPresenter instance because it is taken directly
         * from the matched instance invocation.
         *
         * Do not inject inside the visual binder and assume p0 survives. The
         * app is free to reuse the physical parameter register after entry, as
         * 9.24.51 does. Hooking the caller avoids that register-liveness trap
         * without allocating scratch registers or naming any obfuscated class,
         * method, field, row type, or native icon enum.
         */
        val nativeIconGetter =
            menuItemPresenterClass.methods.single { method ->
                method.parameters.isEmpty() &&
                    method.returnType == "Landroid/widget/ImageView;" &&
                    (method.accessFlags and 0x8) == 0
            }

        val nativeIconGetterReference =
            "${menuItemPresenterClass.type}->" +
                "${nativeIconGetter.name}()" +
                nativeIconGetter.returnType

        val menuItemVisualBindMethod =
            menuItemPresenterClass.methods.single { method ->
                val implementation = method.implementation
                    ?: return@single false

                val invokesNativeIconGetter =
                    implementation.instructions.any { instruction ->
                        val reference =
                            (instruction as? ReferenceInstruction)
                                ?.reference as? MethodReference

                        reference != null &&
                            "${reference.definingClass}->" +
                                "${reference.name}(" +
                                reference.parameterTypes.joinToString("") +
                                ")${reference.returnType}" ==
                                nativeIconGetterReference
                    }

                val writesNativeImageView =
                    implementation.instructions.any { instruction ->
                        val reference =
                            (instruction as? ReferenceInstruction)
                                ?.reference as? MethodReference

                        reference != null &&
                            reference.definingClass ==
                                "Landroid/widget/ImageView;" &&
                            reference.name in setOf(
                                "setImageResource",
                                "setImageDrawable",
                            )
                    }

                method.returnType == "V" &&
                    method.parameters.isEmpty() &&
                    (method.accessFlags and 0x8) == 0 &&
                    invokesNativeIconGetter &&
                    writesNativeImageView
            }

        val menuItemVisualBindReference =
            "${menuItemVisualBindMethod.definingClass}->" +
                "${menuItemVisualBindMethod.name}(" +
                menuItemVisualBindMethod.parameters.joinToString("") {
                    parameter -> parameter.type
                } +
                ")${menuItemVisualBindMethod.returnType}"

        val visualBindCallSites =
            menuItemPresenterClass.methods.flatMap { caller ->
                val implementation = caller.implementation
                    ?: return@flatMap emptyList()

                implementation.instructions
                    .withIndex()
                    .mapNotNull { indexed ->
                        val reference =
                            (indexed.value as? ReferenceInstruction)
                                ?.reference as? MethodReference
                                ?: return@mapNotNull null

                        val descriptor =
                            "${reference.definingClass}->" +
                                "${reference.name}(" +
                                reference.parameterTypes.joinToString("") +
                                ")${reference.returnType}"

                        if (descriptor != menuItemVisualBindReference) {
                            return@mapNotNull null
                        }

                        val receiverRegister =
                            when (val instruction = indexed.value) {
                                is FiveRegisterInstruction ->
                                    instruction.registerC
                                is RegisterRangeInstruction ->
                                    instruction.startRegister
                                else -> error(
                                    "Unsupported MenuItemPresenter visual-bind invoke"
                                )
                            }

                        Triple(
                            caller,
                            indexed.index,
                            receiverRegister,
                        )
                    }
            }

        check(visualBindCallSites.isNotEmpty()) {
            "Expected at least one MenuItemPresenter visual-bind call site"
        }

        visualBindCallSites
            .groupBy { callSite -> callSite.first }
            .forEach { (caller, callSites) ->
                callSites
                    .sortedByDescending { callSite ->
                        callSite.second
                    }
                    .forEach { callSite ->
                        val presenterRegister =
                            callSite.third

                        caller.addInstructionsWithLabels(
                            callSite.second + 1,
                            """
                                invoke-static/range {v$presenterRegister .. v$presenterRegister}, $EXTENSION_CLASS->styleInjectedLibraryPinPresenter(Ljava/lang/Object;)V
                            """
                        )
                    }
            }

        val originalMethod = menuItemPresenterClass.methods.single { method ->
            method.name == "onClick" &&
                method.returnType == "V" &&
                method.parameters.map { parameter -> parameter.type } ==
                listOf("Landroid/view/View;")
        }
        val originalRegisterCount = originalMethod.implementation!!.registerCount

        // onClick(View) has two parameter registers: p0 and p1.
        val parameterRegisterCount = 2
        val firstNewLocalRegister = originalRegisterCount - parameterRegisterCount

        val patchedMethod = originalMethod.cloneMutable(additionalRegisters = 3)

        menuItemPresenterClass.methods.apply {
            remove(originalMethod)
            add(patchedMethod)
        }

        val viewRegister = firstNewLocalRegister
        val presenterRegister = firstNewLocalRegister + 1
        val handledRegister = firstNewLocalRegister + 2

        /*
         * onClick's parameters are p0 (presenter) then p1 (View), while the
         * extension signature is (View, presenter). Copy them into contiguous
         * locals in descriptor order so the range invoke remains verifier-safe.
         */
        patchedMethod.addInstructionsWithLabels(
            0,
            """
                move-object/from16 v$viewRegister, p1
                move-object/from16 v$presenterRegister, p0
                invoke-static/range {v$viewRegister .. v$presenterRegister}, $EXTENSION_CLASS->handleClick(Landroid/view/View;Ljava/lang/Object;)Z
                move-result v$handledRegister
                if-eqz v$handledRegister, :pin_playlist_native_click
                return-void
            """,
            ExternalLabel(
                "pin_playlist_native_click",
                patchedMethod.implementation!!.instructions.first()
            )
        )

        /*
         * True pre-submit hook.
         *
         * Capture every render-info object returned by the source-position
         * factory, then prepare a detached mutable copy immediately before the
         * Library controller call. Only the invoke sees the prepared copy; the
         * untouched stock List register is restored before native callbacks or
         * cleanup execute. The adapter therefore receives pinned order on its
         * first render without mutating caller-owned List state.
         */
        val renderInfoFactory =
            adapterProxyRenderInfoFingerprint.method

        check((renderInfoFactory.accessFlags and 0x8) == 0) {
            "Expected adapter-proxy render-info factory to be an instance method"
        }
        val renderInfoFactoryParameters =
            renderInfoFactory.parameters.map { it.type }
        val isPositionRenderInfoFactory =
            renderInfoFactoryParameters == listOf("I")
        val isItemConverterRenderInfoFactory =
            renderInfoFactoryParameters.size == 1 &&
                renderInfoFactoryParameters.single().let { type ->
                    type.startsWith("L") || type.startsWith("[")
                }
        check(isPositionRenderInfoFactory || isItemConverterRenderInfoFactory) {
            "Expected an instance position factory or item converter, found " +
                methodDescriptor(renderInfoFactory)
        }

        /*
         * Use range invokes so this remains valid even when the obfuscated
         * method has enough locals to place p0/p1 or the return register above
         * the normal invoke instruction's four-bit register limit.
         */
        if (isPositionRenderInfoFactory) {
            renderInfoFactory.addInstructionsWithLabels(
                0,
                """
                    invoke-static/range {p0 .. p1}, $EXTENSION_CLASS->beginAdapterProxyRenderInfo(Ljava/lang/Object;I)V
                """
            )

            val getItemCall =
                renderInfoFactory.implementation!!.instructions
                    .withIndex()
                    .first { indexed ->
                        val referenceInstruction =
                            indexed.value as? ReferenceInstruction
                                ?: return@first false
                        val reference =
                            referenceInstruction.reference
                                as? MethodReference
                                ?: return@first false

                        reference.name == "getItem" &&
                            reference.returnType ==
                            "Ljava/lang/Object;" &&
                            reference.parameterTypes
                                .map { it.toString() } ==
                            listOf("I")
                    }
            val getItemCallIndex = getItemCall.index
            val (sourceAdapterRegister, sourcePositionRegister) =
                when (val instruction = getItemCall.value) {
                    is FiveRegisterInstruction ->
                        instruction.registerC to instruction.registerD
                    is RegisterRangeInstruction ->
                        instruction.startRegister to instruction.startRegister + 1
                    else -> error("Unsupported getItem invoke")
                }

            val getItemResult =
                renderInfoFactory.implementation!!.instructions[
                    getItemCallIndex + 1
                ] as OneRegisterInstruction

            check(
                renderInfoFactory.implementation!!.instructions[
                    getItemCallIndex + 1
                ].opcode == Opcode.MOVE_RESULT_OBJECT
            ) {
                "Expected move-result-object after adapter getItem"
            }

            renderInfoFactory.addInstructionsWithLabels(
                getItemCallIndex + 2,
                """
                    invoke-static/range {v${getItemResult.registerA} .. v${getItemResult.registerA}}, $EXTENSION_CLASS->captureAdapterProxySourceObject(Ljava/lang/Object;)V
                """
            )

            renderInfoFactory.addInstructionsWithLabels(
                getItemCallIndex,
                """
                    invoke-static/range {v$sourceAdapterRegister .. v$sourceAdapterRegister}, $EXTENSION_CLASS->captureAdapterProxySourceAdapter(Ljava/lang/Object;)V
                    invoke-static/range {v$sourcePositionRegister .. v$sourcePositionRegister}, $EXTENSION_CLASS->remapActiveAdapterProxySourcePosition(I)I
                    move-result v$sourcePositionRegister
                """
            )
        }

        val renderInfoReturnSites =
            renderInfoFactory.implementation!!.instructions
                .withIndex()
                .filter { indexed ->
                    indexed.value.opcode == Opcode.RETURN_OBJECT
                }
                .map { indexed ->
                    indexed.index to
                        (indexed.value as OneRegisterInstruction).registerA
                }
                .toList()

        check(renderInfoReturnSites.isNotEmpty()) {
            "Expected at least one render-info return-object site"
        }

        renderInfoReturnSites
            .asReversed()
            .forEach { (returnIndex, returnRegister) ->
                renderInfoFactory.addInstructionsWithLabels(
                    returnIndex,
                    """
                        invoke-static/range {v$returnRegister .. v$returnRegister}, $EXTENSION_CLASS->captureAdapterProxyRenderInfo(Ljava/lang/Object;)V
                    """
                )
            }

        /*
         * Resolve mutation hosts independently from the render factory owner.
         * Every candidate must pass one of two fail-closed proofs:
         *   - exact ordered provenance in one reachable straight-line block; or
         *   - the canonical one-constructor/one-factory/one-add/one-loop/
         *     one-controller shape.
         *
         * Exact descriptors remain additive compatibility data, but do not
         * bypass or weaken either proof. Try regions are rejected identically
         * for exact and generic candidates. When no exact host resolves, the
         * same-owner generic scan uses those same proofs.
         */
        val libraryControllerCandidates =
            libraryAdapterBindFingerprint.originalMethod
                .implementation!!.instructions
                .mapNotNull { instruction ->
                    (instruction as? ReferenceInstruction)
                        ?.reference as? MethodReference
                }
                .filter { reference ->
                    reference.returnType == "I" &&
                        reference.parameterTypes.size == 1 &&
                        reference.parameterTypes[0].toString()
                            .startsWith("L")
                }
                .groupBy { reference ->
                    Pair(
                        reference.definingClass,
                        reference.parameterTypes[0].toString(),
                    )
                }
                .entries.filter { entry ->
                    entry.value.map { reference -> reference.name }
                        .distinct().size >= 2
                }

        check(libraryControllerCandidates.size == 1) {
            "Expected one Library controller call group, found " +
                libraryControllerCandidates.map { entry ->
                    entry.key to entry.value.map { reference ->
                        reference.name
                    }
                }
        }

        val libraryControllerType =
            libraryControllerCandidates.single().key.first
        val renderInfoFactoryDescriptor =
            methodDescriptor(renderInfoFactory)

        fun hasControllerListCall(
            method: com.android.tools.smali.dexlib2.iface.Method,
        ): Boolean =
            method.implementation!!.instructions.any { instruction ->
                val reference = (instruction as? ReferenceInstruction)
                    ?.reference as? MethodReference ?: return@any false
                reference.definingClass == libraryControllerType &&
                    reference.parameterTypes.any { type ->
                        type.toString() == "Ljava/util/List;"
                    }
            }

        fun renderFactoryInvocations(
            method: com.android.tools.smali.dexlib2.iface.Method,
        ): List<Pair<Int, Int>> =
            method.implementation!!.instructions
                .withIndex()
                .mapNotNull { indexed ->
                    val reference =
                        (indexed.value as? ReferenceInstruction)
                            ?.reference as? MethodReference
                            ?: return@mapNotNull null
                    if (
                        methodDescriptor(reference) !=
                            renderInfoFactoryDescriptor ||
                        indexed.value.opcode == Opcode.INVOKE_STATIC ||
                        indexed.value.opcode == Opcode.INVOKE_STATIC_RANGE
                    ) {
                        return@mapNotNull null
                    }

                    val receiverRegister =
                        when (val instruction = indexed.value) {
                            is FiveRegisterInstruction -> {
                                if (instruction.registerCount < 1) {
                                    return@mapNotNull null
                                }
                                instruction.registerC
                            }

                            is RegisterRangeInstruction -> {
                                if (instruction.registerCount < 1) {
                                    return@mapNotNull null
                                }
                                instruction.startRegister
                            }

                            else -> return@mapNotNull null
                        }
                    indexed.index to receiverRegister
                }
                .toList()

        val exactMutationHostMethods =
            BytecodeCompatibilityTargets.adapterProxyMutationHostFamilies
                .get(renderInfoFactoryDescriptor)
                .orEmpty()
                .map { descriptor ->
                    check(isValidDexMethodDescriptor(descriptor)) {
                        "Invalid exact mutation-host descriptor: " + descriptor
                    }
                    val definingClass = descriptor.substringBefore("->")

                    val owner = mutableClassDefBy(definingClass)
                    val matches = owner.methods.filter { method ->
                        methodDescriptor(method) == descriptor
                    }
                    check(matches.size == 1) {
                        "Exact mutation-host catalog entry must resolve " +
                            "exactly once when its class is present: " +
                            descriptor + " matches=" + matches.size
                    }
                    matches.single()
                }
                .distinctBy(::methodDescriptor)

        val oneHopClassDefinitions = linkedMapOf<String, MutableList<ClassDef>>()
        val oneHopMethodDefinitions = linkedMapOf<String, MutableList<Method>>()
        classDefForEach { classDef ->
            oneHopClassDefinitions.getOrPut(classDef.type) {
                mutableListOf()
            }.add(classDef)
            classDef.methods.forEach { method ->
                oneHopMethodDefinitions.getOrPut(methodDescriptor(method)) {
                    mutableListOf()
                }.add(method)
            }
        }

        val provenControllerMethods = run {
            val owner = mutableClassDefBy(libraryControllerType)
            val proven = owner.methods.mapNotNull { controllerMethod ->
                val parameters = controllerMethod.parameters.map { it.type }
                val listIndexes = parameters.withIndex()
                    .filter { indexed ->
                        indexed.value == "Ljava/util/List;"
                    }
                    .map { indexed -> indexed.index }
                if (
                    listIndexes.size == 1 &&
                    controllerMethod.returnType == "V" &&
                    mutationControllerDispatchTargetIsSealed(
                        owner.accessFlags,
                        controllerMethod.accessFlags,
                    ) &&
                    mutationControllerListParameterIsContentOnly(
                        controllerMethod,
                        listIndexes.single(),
                    )
                ) methodDescriptor(controllerMethod) else null
            }.toMutableSet()
            owner.methods.forEach { controllerMethod ->
                val parameters = controllerMethod.parameters.map { it.type }
                val listIndexes = parameters.withIndex()
                    .filter { indexed ->
                        indexed.value == "Ljava/util/List;"
                    }
                    .map { indexed -> indexed.index }
                if (
                    listIndexes.size == 1 &&
                    controllerMethod.returnType == "V" &&
                    mutationControllerDispatchTargetIsSealed(
                        owner.accessFlags,
                        controllerMethod.accessFlags,
                    ) &&
                    (
                        mutationControllerListParameterHasProvenRunnableConsumer(
                            controllerMethod,
                            listIndexes.single(),
                            proven,
                            oneHopClassDefinitions,
                            oneHopMethodDefinitions,
                        ) ||
                            mutationControllerListParameterHasProvenReceiverRunnableConsumer(
                                controllerMethod,
                                listIndexes.single(),
                                proven,
                                oneHopClassDefinitions,
                                oneHopMethodDefinitions,
                            )
                    )
                ) proven += methodDescriptor(controllerMethod)
            }
            proven.toSet()
        }
        check(provenControllerMethods.isNotEmpty()) {
            "No resolved Library controller method proved content-only " +
                "List consumption"
        }

        val globalMutationHostMethods = linkedMapOf<
            String,
            com.android.tools.smali.dexlib2.iface.Method,
        >()
        classDefForEach { classDef ->
            classDef.methods
                .filter { method ->
                    method.implementation != null &&
                        method.name != "<init>" &&
                        method.name != "<clinit>" &&
                        (method.accessFlags and 0x8) == 0 &&
                        renderFactoryInvocations(method).isNotEmpty()
                }
                .forEach { method ->
                    val descriptor = methodDescriptor(method)
                    val previous = globalMutationHostMethods.putIfAbsent(
                        descriptor,
                        method,
                    )
                    check(previous == null || previous === method) {
                        "Duplicate mutation-host method descriptor across DEX " +
                            "classes: " + descriptor
                    }
                }
        }
        val mutationHostAnalyses = globalMutationHostMethods.values.map { method ->
                    method to analyzeMutationHostCandidate(
                        method,
                        renderInfoFactoryDescriptor,
                        libraryControllerType,
                        provenControllerMethods,
                        allowDetachedHistoricalTail = false,
                        classDefinitions = oneHopClassDefinitions,
                        methodDefinitions = oneHopMethodDefinitions,
                    )
        }
        val rawConverterSourceSitesByHost = if (isItemConverterRenderInfoFactory) {
            globalMutationHostMethods.mapValues { (descriptor, method) ->
                mutationItemConverterSourceSites(method, renderInfoFactory)
                    ?: error(
                        "Item-converter invocation is not a complete exact " +
                            "getItem-to-add source chain: " + descriptor
                    )
            }
        } else emptyMap()
        val itemConverterCountProof = if (isItemConverterRenderInfoFactory) {
            mutationItemConverterCountProof(
                globalMutationHostMethods,
                rawConverterSourceSitesByHost,
            ) ?: error(
                "Item-converter family lacks one unambiguous dominating " +
                    "integer count producer on the exact getItem receiver"
            )
        } else null
        val converterSourceSitesByHost = if (itemConverterCountProof != null) {
            rawConverterSourceSitesByHost.mapValues { (_, sites) ->
                sites.map { site ->
                    site.copy(
                        sourceCountMethodDescriptor =
                            itemConverterCountProof.methodDescriptor,
                        sourceCountInvokeOpcode =
                            itemConverterCountProof.invokeOpcode,
                    )
                }
            }
        } else emptyMap()
        if (itemConverterCountProof != null) {
        }

        val candidateMutationHostPlans:
            List<Pair<com.android.tools.smali.dexlib2.iface.Method, MutationHostPlan>> =
            if (exactMutationHostMethods.isNotEmpty()) {
                val exactDescriptors = exactMutationHostMethods
                    .mapTo(mutableSetOf(), ::methodDescriptor)
                val unlistedControllerHosts = mutationHostAnalyses
                    .filter { (method, _) ->
                        methodDescriptor(method) !in exactDescriptors &&
                            hasControllerListCall(method)
                    }
                check(unlistedControllerHosts.isEmpty()) {
                    "Factory-calling controller List methods are missing from " +
                        "the exact mutation-host catalog: " +
                        unlistedControllerHosts.joinToString { (method, _) ->
                            methodDescriptor(method)
                        }
                }

                exactMutationHostMethods.map { method ->
                    val plan = analyzeMutationHostCandidate(
                        method,
                        renderInfoFactoryDescriptor,
                        libraryControllerType,
                        provenControllerMethods,
                        allowDetachedHistoricalTail = true,
                        classDefinitions = oneHopClassDefinitions,
                        methodDefinitions = oneHopMethodDefinitions,
                    )
                    check(
                        plan.unsupportedControllerCalls == 0 &&
                            plan.factoryCaptureSites.isNotEmpty() &&
                            plan.controllerHookSites.isNotEmpty()
                    ) {
                        "Exact mutation-host catalog entry failed every " +
                            "fail-closed proof: " + methodDescriptor(method)
                    }
                    method to plan
                }
            } else {
                val ambiguousHistoricalCandidates = mutationHostAnalyses
                    .filter { (method, plan) ->
                        hasControllerListCall(method) &&
                            (
                                plan.unsupportedControllerCalls > 0 ||
                                    plan.factoryCaptureSites.isEmpty() ||
                                    plan.controllerHookSites.isEmpty()
                            )
                    }
                check(ambiguousHistoricalCandidates.isEmpty()) {
                    "Historical mutation-host candidates did not pass a " +
                        "complete fail-closed proof: " +
                        ambiguousHistoricalCandidates.joinToString { (method, _) ->
                            methodDescriptor(method)
                        }
                }

                mutationHostAnalyses.filter { (_, plan) ->
                    plan.unsupportedControllerCalls == 0 &&
                        plan.factoryCaptureSites.isNotEmpty() &&
                        plan.controllerHookSites.isNotEmpty()
                }
            }

        if (isItemConverterRenderInfoFactory) {
            val selectedDescriptors = candidateMutationHostPlans
                .mapTo(mutableSetOf()) { (method, _) ->
                    methodDescriptor(method)
                }
            check(selectedDescriptors == converterSourceSitesByHost.keys) {
                "Item-converter consumer coverage is incomplete: selected=" +
                    selectedDescriptors.sorted() + " consumers=" +
                    converterSourceSitesByHost.keys.sorted()
            }
            check(candidateMutationHostPlans.all { (_, plan) ->
                plan.proofKind == "ITEM_CONVERTER_SOURCE"
            }) {
                "Item-converter consumers did not retain source-flow proof identity"
            }
        }

        check(candidateMutationHostPlans.isNotEmpty()) {
            "No mutation-host method passed the ordered, direct-loop, monitored-snapshot, " +
                "or one-hop transparent-consumer factory-to-List proofs"
        }

        val patchedMutationHostDescriptors = mutableSetOf<String>()
        var mutationHookCount = 0

        candidateMutationHostPlans.forEach { (mutationHostMethod, mutationHostPlan) ->
                val implementation = mutationHostMethod.implementation
                    ?: error(
                        "Mutation-host method has no implementation: " +
                            methodDescriptor(mutationHostMethod)
                    )
                check(
                    mutationHostMethod.name != "<init>" &&
                        mutationHostMethod.name != "<clinit>"
                ) {
                    "Mutation-host method cannot be a constructor: " +
                        methodDescriptor(mutationHostMethod)
                }

                val factoryCalls = mutationHostPlan.factoryCaptureSites
                val mutationCalls = if (
                    mutationHostPlan.proofKind ==
                    "ONE_HOP_TRANSPARENT_CONSUMER"
                ) {
                    check(mutationHostPlan.methodBoundaryDepth == 1) {
                        "One-hop mutation plan has invalid boundary depth"
                    }
                    check(
                        factoryCalls.map { it.second }.distinct() ==
                            listOf(mutationHostPlan.factoryReceiverRegister)
                    ) {
                        "One-hop mutation plan lost factory receiver identity"
                    }
                    val helperInstruction = implementation.instructions
                        .toList()
                        .getOrNull(mutationHostPlan.helperInvocationIndex)
                        ?: error("One-hop helper hook index is out of range")
                    val helperReference =
                        (helperInstruction as? ReferenceInstruction)
                            ?.reference as? MethodReference
                            ?: error("One-hop hook is not a method invocation")
                    check(
                        methodDescriptor(helperReference) ==
                            mutationHostPlan.helperDescriptor
                    ) {
                        "One-hop helper descriptor changed before injection"
                    }
                    val exactArgument = mutationInvokeParameterRegister(
                        helperInstruction,
                        helperReference,
                        mutationHostPlan.helperArgumentPosition,
                    ) ?: error("One-hop helper argument cannot be rebound")
                    listOf(
                        mutationHostPlan.helperInvocationIndex to exactArgument
                    )
                } else {
                    check(
                        mutationHostPlan.proofKind in setOf(
                            "SAME_METHOD", "ITEM_CONVERTER_SOURCE",
                        ) &&
                            mutationHostPlan.methodBoundaryDepth == 0 &&
                            mutationHostPlan.helperDescriptor == null
                    ) {
                        "Legacy mutation plan contains one-hop metadata"
                    }
                    mutationHostPlan.controllerHookSites
                }
                check(factoryCalls.isNotEmpty()) {
                    "Mutation-host method has no factory capture site from " +
                        "a complete accepted proof: " +
                        methodDescriptor(mutationHostMethod)
                }
                check(mutationCalls.isNotEmpty()) {
                    "Mutation-host method has no controller List submission " +
                        "from a complete accepted proof: " +
                        methodDescriptor(mutationHostMethod)
                }

                val controllerReceiverByCall = mutationCalls.associate {
                        (index, _) ->
                    val instruction = implementation.instructions
                        .toList().getOrNull(index)
                        ?: error("Controller hook index is out of range")
                    val reference =
                        (instruction as? ReferenceInstruction)
                            ?.reference as? MethodReference
                    val receiver = if (
                        reference?.definingClass == libraryControllerType &&
                        instruction.opcode != Opcode.INVOKE_STATIC &&
                        instruction.opcode != Opcode.INVOKE_STATIC_RANGE
                    ) {
                        mutationInvokeRegisters(instruction)?.firstOrNull()
                    } else null
                    index to receiver
                }
                check(controllerReceiverByCall.values.all { it != null }) {
                    "Mutation-host submission does not expose the proven " +
                        "Library controller receiver at every hook site: " +
                        methodDescriptor(mutationHostMethod)
                }

                val mutationHostParameterRegisterCount =
                    (if ((mutationHostMethod.accessFlags and 0x8) == 0) 1 else 0) +
                        mutationHostMethod.parameters.fold(0) { total, parameter ->
                            total + if (
                                parameter.type == "J" ||
                                parameter.type == "D"
                            ) 2 else 1
                        }
                val mutationHostOriginalRegisterCount = implementation.registerCount
                val converterSourceSites = if (
                    mutationHostPlan.proofKind == "ITEM_CONVERTER_SOURCE"
                ) {
                    converterSourceSitesByHost[
                        methodDescriptor(mutationHostMethod)
                    ] ?: error("Missing proven item-converter source sites")
                } else emptyList()
                val ownerScratchRegister = mutationHostOriginalRegisterCount
                val sourceIndexScratchRegister =
                    mutationHostOriginalRegisterCount + 1
                val sourceAdapterScratchRegister =
                    mutationHostOriginalRegisterCount + 2
                val sourceCountScratchRegister =
                    mutationHostOriginalRegisterCount + 3
                val sourceObjectScratchRegister =
                    mutationHostOriginalRegisterCount + 4
                val controllerScratchRegister =
                    mutationHostOriginalRegisterCount + 1
                val copyScratchRegister = mutationHostOriginalRegisterCount +
                    if (converterSourceSites.isNotEmpty()) 5 else 2
                val originalListScratchRegister = copyScratchRegister + 1
                val trueScratchRegisterCount =
                    if (converterSourceSites.isNotEmpty()) 7 else 4
                check(copyScratchRegister <= 0xff) {
                    "Mutation-host detached-copy register exceeds v255: " +
                        methodDescriptor(mutationHostMethod) +
                        " register=v" + copyScratchRegister
                }

                /*
                 * cloneMutable first creates local mirrors for the shifted
                 * parameter registers. Allocate true locals for the owner,
                 * prepared copy, and untouched stock List. Item converters
                 * additionally preserve the proven source index, adapter, and
                 * source adapter and index before getItem, then capture the
                 * concrete source object only after move-result-object.
                 */
                val patchedMutationHostMethod = mutationHostMethod.cloneMutable(
                    additionalRegisters = mutationHostParameterRegisterCount +
                        trueScratchRegisterCount
                )
                val mutationHostClass =
                    mutableClassDefBy(mutationHostMethod.definingClass)
                mutationHostClass.methods.apply {
                    remove(mutationHostMethod)
                    add(patchedMutationHostMethod)
                }

                val parameterPreservationInstructionCount =
                    mutationHostMethod.parameters.size +
                        if ((mutationHostMethod.accessFlags and 0x8) == 0) 1 else 0
                val converterSitesByFactoryIndex = converterSourceSites
                    .associateBy { site -> site.factoryIndex }
                if (converterSourceSites.isNotEmpty()) {
                    check(
                        converterSitesByFactoryIndex.keys ==
                            factoryCalls.mapTo(mutableSetOf()) { it.first }
                    ) {
                        "Item-converter source sites changed after proof"
                    }
                }
                val insertionSites = factoryCalls.map { (index, receiverRegister) ->
                    Triple(
                        index + parameterPreservationInstructionCount,
                        true,
                        converterSitesByFactoryIndex[index]
                            ?: receiverRegister,
                    )
                } + mutationCalls.map { (index, listRegister) ->
                    Triple(
                        index + parameterPreservationInstructionCount,
                        false,
                        listRegister to controllerReceiverByCall[index],
                    )
                }

                insertionSites
                    .sortedByDescending { site -> site.first }
                    .forEach { (index, capturesFactoryReceiver, value) ->
                        if (capturesFactoryReceiver) {
                            if (value is ItemConverterSourceSite) {
                                check(
                                    value.sourceCountMethodDescriptor.isNotEmpty() &&
                                        value.sourceCountInvokeOpcode.isNotEmpty()
                                ) {
                                    "Item-converter count proof was not carried to injection"
                                }
                                patchedMutationHostMethod.addInstructionsWithLabels(
                                    index,
                                    renderItemConverterPostGetItemInjection(
                                        sourceObjectScratchRegister,
                                        value.sourceObjectRegister,
                                    )
                                )
                                patchedMutationHostMethod.addInstructionsWithLabels(
                                    value.getItemIndex +
                                        parameterPreservationInstructionCount,
                                    renderItemConverterPreGetItemInjection(
                                        ownerScratchRegister,
                                        sourceIndexScratchRegister,
                                        sourceAdapterScratchRegister,
                                        sourceCountScratchRegister,
                                        value.factoryReceiverRegister,
                                        value.sourceIndexRegister,
                                        value.sourceAdapterRegister,
                                        value.sourceCountInvokeOpcode,
                                        value.sourceCountMethodDescriptor,
                                    )
                                )
                            } else {
                                val register = value as Int
                                patchedMutationHostMethod.addInstructionsWithLabels(
                                    index,
                                    """
                                        move-object/16 v$ownerScratchRegister, v$register
                                    """
                                )
                            }
                        } else {
                            val (register, controllerReceiverRegister) =
                                value as Pair<Int, Int?>
                            /*
                             * The accepted proof establishes that v$register is
                             * a locally constructed mutable List with no unsafe
                             * pre-submit alias or escape. Clone it, prepare only
                             * the clone, substitute the clone for the single
                             * controller invoke, and restore the untouched stock
                             * List immediately afterward. This preserves every
                             * legitimate historical callback/cleanup tail while
                             * preventing hook mutations from leaking through the
                             * caller's original List identity.
                             */
                            patchedMutationHostMethod.addInstructionsWithLabels(
                                index + 1,
                                """
                                    move-object/16 v$register, v$originalListScratchRegister
                                """
                            )
                            patchedMutationHostMethod.addInstructionsWithLabels(
                                index,
                                if (controllerReceiverRegister != null) """
                                    move-object/16 v$originalListScratchRegister, v$register
                                    new-instance v$copyScratchRegister, Ljava/util/ArrayList;
                                    invoke-direct/range {v$copyScratchRegister .. v$originalListScratchRegister}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
                                    move-object/16 v$controllerScratchRegister, v$controllerReceiverRegister
                                    invoke-static/range {v$ownerScratchRegister .. v$controllerScratchRegister}, $EXTENSION_CLASS->beginAdapterProxyReplaceAll(Ljava/lang/Object;Ljava/lang/Object;)V
                                    invoke-static/range {v$copyScratchRegister .. v$copyScratchRegister}, $EXTENSION_CLASS->prepareAdapterProxyRenderInfos(Ljava/lang/Object;)V
                                    move-object/16 v$register, v$copyScratchRegister
                                """ else """
                                    move-object/16 v$originalListScratchRegister, v$register
                                    new-instance v$copyScratchRegister, Ljava/util/ArrayList;
                                    invoke-direct/range {v$copyScratchRegister .. v$originalListScratchRegister}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
                                    invoke-static/range {v$ownerScratchRegister .. v$ownerScratchRegister}, $EXTENSION_CLASS->beginAdapterProxyReplaceAll(Ljava/lang/Object;)V
                                    invoke-static/range {v$copyScratchRegister .. v$copyScratchRegister}, $EXTENSION_CLASS->prepareAdapterProxyRenderInfos(Ljava/lang/Object;)V
                                    move-object/16 v$register, v$copyScratchRegister
                                """
                            )
                            mutationHookCount++
                        }
                    }
                patchedMutationHostMethod.addInstructionsWithLabels(
                    0,
                    """
                        const/16 v$ownerScratchRegister, 0x0
                    """
                )
                patchedMutationHostDescriptors.add(
                    methodDescriptor(mutationHostMethod)
                )
            }

        check(mutationHookCount >= 1) {
            "No mutation-host method both invoked the selected render " +
                "factory and submitted a hookable List to the resolved " +
                "Library controller"
        }

        val resolvedMutationHostDescriptors =
            patchedMutationHostDescriptors.sorted()

        /*
         * AdapterProxy rows all share one render-info object. Reorder them
         * virtually by translating hyz's visual adapter position before its
         * view-type, stable-ID and bind paths read the native row.
         */
        val libraryAdapterClass =
            libraryAdapterBindFingerprint.classDef

        val nativeLibraryControllerFields =
            libraryAdapterClass.fields.filter { field ->
                (field.accessFlags and 0x8) == 0 &&
                    field.type.startsWith("L")
            }

        check(nativeLibraryControllerFields.size == 1) {
            "Expected one Library adapter controller field, found " +
                nativeLibraryControllerFields.map { field ->
                    field.name to field.type
                }
        }

        val nativeLibraryControllerType =
            nativeLibraryControllerFields.single().type
        fun isLibraryReplaceAll(method: com.android.tools.smali.dexlib2.iface.Method): Boolean {
            val references = method.implementation?.instructions
                ?.mapNotNull { instruction ->
                    (instruction as? ReferenceInstruction)?.reference
                }
                .orEmpty()

            return references.any { reference ->
                reference is FieldReference &&
                    reference.definingClass == nativeLibraryControllerType &&
                    reference.type == "Ljava/util/List;"
            } && references.any { reference ->
                reference is MethodReference &&
                    reference.definingClass == "Ljava/util/List;" &&
                    reference.name == "clear"
            } && references.any { reference ->
                reference is MethodReference &&
                    reference.definingClass == "Ljava/util/List;" &&
                    reference.name == "iterator"
            }
        }

        val libraryReplaceAllClass = mutableClassDefBy { classDef ->
            classDef.methods.any(::isLibraryReplaceAll)
        }
        val libraryReplaceAllMethod =
            libraryReplaceAllClass.methods.single(::isLibraryReplaceAll)
        val sourceIteratorCall =
            libraryReplaceAllMethod.implementation!!.instructions
                .withIndex()
                .single { indexed ->
                    val reference =
                        (indexed.value as? ReferenceInstruction)
                            ?.reference as? MethodReference

                    reference?.definingClass == "Ljava/util/List;" &&
                        reference.name == "iterator" &&
                        reference.parameterTypes.isEmpty()
                }
        val sourceRowsRegister =
            when (val instruction = sourceIteratorCall.value) {
                is FiveRegisterInstruction -> instruction.registerC
                is RegisterRangeInstruction -> instruction.startRegister
                else -> error("Unsupported List.iterator invoke")
            }

        check(
            libraryReplaceAllMethod.implementation!!.instructions[
                sourceIteratorCall.index + 1
            ].opcode == Opcode.MOVE_RESULT_OBJECT
        ) {
            "Expected move-result-object after List.iterator"
        }

        libraryReplaceAllMethod.addInstructionsWithLabels(
            sourceIteratorCall.index + 2,
            """
                invoke-static {p0, v$sourceRowsRegister}, $EXTENSION_CLASS->inspectNativeLibraryRows(Ljava/lang/Object;Ljava/lang/Object;)V
            """,
        )

        val nativeLibraryControllerClass =
            mutableClassDefBy(nativeLibraryControllerType)
        val originalNativeBatchMutationMethod =
            nativeLibraryControllerClass.methods.single { method ->
                val references = method.implementation?.instructions
                    ?.mapNotNull { instruction ->
                        (instruction as? ReferenceInstruction)?.reference
                    }
                    .orEmpty()

                method.returnType == "V" &&
                    method.parameters.map { parameter -> parameter.type } ==
                    listOf("I") &&
                    references.any { reference ->
                        reference is MethodReference &&
                            reference.definingClass == "Ljava/util/Deque;" &&
                            reference.name == "pollFirst"
                    } && references.any { reference ->
                        reference is MethodReference &&
                            reference.definingClass == "Ljava/util/List;" &&
                            reference.name == "add" &&
                            reference.parameterTypes.map { it.toString() } ==
                            listOf("I", "Ljava/lang/Object;")
                    }
            }

        check((originalNativeBatchMutationMethod.accessFlags and 0x8) == 0) {
            "Expected native Library batch mutation to be an instance method"
        }

        originalNativeBatchMutationMethod.addInstructionsWithLabels(
            0,
            """
                invoke-static/range {p0 .. p0}, $EXTENSION_CLASS->beginNativeLibraryMutation(Ljava/lang/Object;)V
            """,
        )

        originalNativeBatchMutationMethod.implementation!!.instructions
            .withIndex()
            .filter { indexed ->
                indexed.value.opcode == Opcode.RETURN_VOID
            }
            .map { indexed -> indexed.index }
            .asReversed()
            .forEach { returnIndex ->
                originalNativeBatchMutationMethod.addInstructionsWithLabels(
                    returnIndex,
                    """
                        invoke-static {}, $EXTENSION_CLASS->finishNativeLibraryMutation()V
                    """,
                )
            }

        fun isInlineLibraryTransaction(
            method: com.android.tools.smali.dexlib2.iface.Method,
        ): Boolean {
            val references = method.implementation?.instructions
                ?.mapNotNull { instruction ->
                    (instruction as? ReferenceInstruction)?.reference
                }
                .orEmpty()

            return references.any { reference ->
                reference is FieldReference &&
                    reference.definingClass == nativeLibraryControllerType &&
                    reference.type == "Ljava/util/List;"
            } && references.any { reference ->
                reference is MethodReference &&
                    reference.definingClass == "Landroid/util/SparseArray;" &&
                    reference.name == "clear"
            } && references.any { reference ->
                reference is MethodReference &&
                    reference.definingClass == "Ljava/util/List;" &&
                    reference.name == "add" &&
                    reference.parameterTypes.map { it.toString() } ==
                    listOf("I", "Ljava/lang/Object;")
            }
        }

        val inlineTransactionClass = mutableClassDefBy { classDef ->
            classDef.methods.any(::isInlineLibraryTransaction)
        }
        val inlineTransactionMethod =
            inlineTransactionClass.methods.single(::isInlineLibraryTransaction)

        check((inlineTransactionMethod.accessFlags and 0x8) == 0) {
            "Expected inline Library transaction to be an instance method"
        }

        inlineTransactionMethod.addInstructionsWithLabels(
            0,
            """
                invoke-static/range {p0 .. p0}, $EXTENSION_CLASS->beginNativeLibraryMutation(Ljava/lang/Object;)V
            """,
        )

        inlineTransactionMethod.implementation!!.instructions
            .withIndex()
            .filter { indexed ->
                indexed.value.opcode == Opcode.RETURN_VOID
            }
            .map { indexed -> indexed.index }
            .asReversed()
            .forEach { returnIndex ->
                inlineTransactionMethod.addInstructionsWithLabels(
                    returnIndex,
                    """
                        invoke-static {}, $EXTENSION_CLASS->finishNativeLibraryMutation()V
                    """,
                )
            }

        val libraryItemCountMethod =
            libraryAdapterClass.methods.single {
                it.returnType == "I" && it.parameters.isEmpty()
            }

        libraryItemCountMethod.addInstructionsWithLabels(
            0,
            """
                invoke-static/range {p0 .. p0}, $EXTENSION_CLASS->prepareStableLibraryAdapter(Ljava/lang/Object;)V
            """
        )

        val libraryViewTypeMethod =
            libraryAdapterClass.methods.single {
                it.returnType == "I" &&
                    it.parameters.map { parameter ->
                        parameter.type
                    } == listOf("I")
            }

        libraryViewTypeMethod.addInstructionsWithLabels(
            0,
            """
                invoke-static/range {p0 .. p0}, $EXTENSION_CLASS->preparePersistedLibraryAdapter(Ljava/lang/Object;)V
                invoke-static/range {p0 .. p0}, $EXTENSION_CLASS->beginAdapterViewTypePositionRemap(Ljava/lang/Object;)V
                invoke-static/range {p1 .. p1}, $EXTENSION_CLASS->remapAdapterPosition(I)I
                move-result p1
            """
        )

        val libraryStableIdMethod =
            libraryAdapterClass.methods.single {
                it.returnType == "J" &&
                    it.parameters.map { parameter ->
                        parameter.type
                    } == listOf("I")
            }

        libraryStableIdMethod.addInstructionsWithLabels(
            0,
            """
                invoke-static/range {p0 .. p0}, $EXTENSION_CLASS->preparePersistedLibraryAdapter(Ljava/lang/Object;)V
                invoke-static/range {p0 .. p0}, $EXTENSION_CLASS->beginAdapterStableIdPositionRemap(Ljava/lang/Object;)V
                invoke-static/range {p1 .. p1}, $EXTENSION_CLASS->remapAdapterPosition(I)I
                move-result p1
            """
        )

        /*
         * Fast Library adapter hook. Preserve adapter/holder/position at entry,
         * then inspect the fully populated row at every normal return from hyz.o.
         * p1 is either the original holder or its item View at these returns;
         * the extension indexes the pending bind by both identities.
         */
        val libraryBindMethod = libraryAdapterBindFingerprint.method

        libraryBindMethod.addInstructionsWithLabels(
            0,
            """
                invoke-static/range {p0 .. p0}, $EXTENSION_CLASS->preparePersistedLibraryAdapter(Ljava/lang/Object;)V
                invoke-static/range {p0 .. p2}, $EXTENSION_CLASS->beginBoundLibraryRow(Ljava/lang/Object;Ljava/lang/Object;I)V
                invoke-static/range {p0 .. p0}, $EXTENSION_CLASS->beginAdapterBindPositionRemap(Ljava/lang/Object;)V
                invoke-static/range {p2 .. p2}, $EXTENSION_CLASS->remapAdapterPosition(I)I
                move-result p2
            """
        )

        val libraryBindReturnIndices =
            libraryBindMethod.implementation!!.instructions
                .withIndex()
                .filter { indexed ->
                    indexed.value.opcode == Opcode.RETURN_VOID
                }
                .map { indexed -> indexed.index }
                .asReversed()

        libraryBindReturnIndices.forEach { returnIndex ->
            libraryBindMethod.addInstructionsWithLabels(
                returnIndex,
                """
                    invoke-static/range {p1 .. p1}, $EXTENSION_CLASS->finishBoundLibraryRow(Ljava/lang/Object;)V
                """
            )
        }

        /*
         * Native post-normalization flyout insertion (verifier-safe).
         *
         * The native normalization call returns a mutable ArrayList containing only the
         * native rows that survived YouTube Music's own normalization. Build a
         * new row through the app's ordinary native row factory and append it
         * only after that normalization call returns. The native page-menu
         * pipeline then copies and binds the same object through MenuItemPresenter.
         */
        val originalFlyoutSourceMethod =
            playlistFlyoutSourceFingerprint.method
        val flyoutSourceClass =
            playlistFlyoutSourceFingerprint.classDef
        val nativeRowFactory =
            nativeMenuRowFactoryFingerprint.method

        check((nativeRowFactory.accessFlags and 0x8) != 0) {
            "Expected the native menu-row factory to be static"
        }

        val nativeRowType = nativeRowFactory.returnType
        val flyoutAcceptsNativeRowType =
            flyoutSourceClass.methods.any { candidate ->
                val appendsToList =
                    candidate.implementation?.instructions?.any { instruction ->
                        val reference =
                            (instruction as? ReferenceInstruction)
                                ?.reference as? MethodReference

                        reference?.definingClass == "Ljava/util/List;" &&
                            reference.name == "add" &&
                            reference.parameterTypes.map { it.toString() } ==
                                listOf("Ljava/lang/Object;") &&
                            reference.returnType == "Z"
                    } == true

                (candidate.accessFlags and 0x8) != 0 &&
                    candidate.returnType == "V" &&
                    candidate.parameters.map { parameter -> parameter.type } ==
                        listOf(
                            "Ljava/util/List;",
                            nativeRowType,
                        ) &&
                    appendsToList
            }

        check(nativeRowType.startsWith("L") && flyoutAcceptsNativeRowType) {
            "Native row factory result does not match the flyout row model"
        }
        val nativeTitleFactoryCall =
            nativeRowFactory.implementation!!.instructions
                .asSequence()
                .mapNotNull { instruction ->
                    val reference =
                        (instruction as? ReferenceInstruction)
                            ?.reference as? MethodReference
                                ?: return@mapNotNull null

                    instruction to reference
                }
                .single { (instruction, reference) ->
                    (instruction.opcode == Opcode.INVOKE_STATIC ||
                        instruction.opcode == Opcode.INVOKE_STATIC_RANGE) &&
                        reference.parameterTypes
                            .map { it.toString() } ==
                            listOf("Ljava/lang/String;") &&
                        reference.returnType.startsWith("L")
                }

        val nativeTitleFactoryReference =
            nativeTitleFactoryCall.second

        val nativeTitleFactoryDescriptor =
            "${nativeTitleFactoryReference.definingClass}->" +
                "${nativeTitleFactoryReference.name}(" +
                nativeTitleFactoryReference.parameterTypes
                    .joinToString(separator = "") +
                ")${nativeTitleFactoryReference.returnType}"

        val nativeRowFactoryDescriptor =
            "${nativeRowFactory.definingClass}->" +
                "${nativeRowFactory.name}(" +
                nativeRowFactory.parameters
                    .joinToString(separator = "") { parameter ->
                        parameter.type
                    } +
                ")${nativeRowFactory.returnType}"

        val flyoutMenuType =
            originalFlyoutSourceMethod.parameters.first().type

        val flyoutContextField =
            originalFlyoutSourceMethod.implementation!!.instructions
                .asSequence()
                .filter { instruction ->
                    instruction.opcode == Opcode.IGET_OBJECT
                }
                .mapNotNull { instruction ->
                    (instruction as? ReferenceInstruction)
                        ?.reference as? FieldReference
                }
                .first { field ->
                    field.type == "Landroid/content/Context;"
                }

        val flyoutContextFieldDescriptor =
            "${flyoutContextField.definingClass}->" +
                "${flyoutContextField.name}:" +
                flyoutContextField.type

        val flyoutParameterRegisterCount =
            1 + originalFlyoutSourceMethod.parameters.sumOf { parameter ->
                if (parameter.type == "J" || parameter.type == "D") 2 else 1
            }
        val originalFlyoutRegisterCount =
            originalFlyoutSourceMethod.implementation!!.registerCount

        /*
         * cloneMutable keeps the original register file intact and shifts the
         * real parameter registers upward. The original parameter slots become
         * local mirrors used by the unchanged method body. Therefore, merely
         * adding one register per parameter creates no free scratch registers.
         *
         * Allocate the parameter-mirror span plus three truly free registers.
         * The free range begins at the old register count and is never referenced
         * by the original implementation.
         */
        val flyoutScratchRegisterCount = 3
        val flyoutAdditionalRegisterCount =
            flyoutParameterRegisterCount + flyoutScratchRegisterCount

        val patchedFlyoutSourceMethod =
            originalFlyoutSourceMethod.cloneMutable(
                additionalRegisters = flyoutAdditionalRegisterCount
            )

        flyoutSourceClass.methods.apply {
            remove(originalFlyoutSourceMethod)
            add(patchedFlyoutSourceMethod)
        }

        val contextOrListRegister = originalFlyoutRegisterCount
        val playlistIdOrItemRegister = originalFlyoutRegisterCount + 1
        val titleRegister = originalFlyoutRegisterCount + 2
        val shiftedThisRegister =
            originalFlyoutRegisterCount - flyoutParameterRegisterCount +
                flyoutAdditionalRegisterCount

        check(
            (originalFlyoutSourceMethod.accessFlags and 0x8) == 0 &&
                originalFlyoutSourceMethod.parameters.take(3).all { parameter ->
                    parameter.type.startsWith("L") ||
                        parameter.type.startsWith("[")
                } &&
                flyoutMenuType.startsWith("L") &&
                flyoutMenuType.endsWith(";") &&
                nativeRowFactory.returnType.startsWith("L") &&
                nativeRowFactory.returnType.endsWith(";") &&
                contextOrListRegister >= originalFlyoutRegisterCount &&
                titleRegister < shiftedThisRegister &&
                titleRegister <= 15 &&
                shiftedThisRegister <= 15
        ) {
            "Flyout hook requires three verifier-safe scratch registers below v16"
        }

        val normalizationMoveResultIndex =
            patchedFlyoutSourceMethod.implementation!!.instructions
                .withIndex()
                .first { indexed ->
                    val reference =
                        (indexed.value as? ReferenceInstruction)
                            ?.reference as? MethodReference

                    reference != null &&
                        reference.returnType == "Ljava/util/List;" &&
                        reference.parameterTypes
                            .map { it.toString() } ==
                            listOf(
                                flyoutMenuType,
                                "Ljava/lang/Object;",
                            )
                }
                .index + 1

        check(
            patchedFlyoutSourceMethod.implementation!!
                .instructions[normalizationMoveResultIndex]
                .opcode == Opcode.MOVE_RESULT_OBJECT
        ) {
            "Expected move-result-object after native flyout normalization"
        }

        val normalizationResultRegister =
            (patchedFlyoutSourceMethod.implementation!!
                .instructions[normalizationMoveResultIndex]
                as OneRegisterInstruction).registerA

        val nativeNormalizationContinuation =
            patchedFlyoutSourceMethod.implementation!!
                .instructions[normalizationMoveResultIndex + 1]

        /*
         * Resolve flyout identity only after YouTube Music has returned its
         * normalized row list. Nothing is carried across the native method's
         * control-flow graph, and the three scratch registers are outside the
         * original register file.
         *
         * Their lifetimes are deliberately linear:
         *   scratch 0: Context -> normalized List
         *   scratch 1: playlist ID -> native item
         *   scratch 2: title String -> native title message
         *
         * Every call uses range encoding, and the original continuation never
         * reads these scratch registers.
         */
        patchedFlyoutSourceMethod.addInstructionsWithLabels(
            normalizationMoveResultIndex + 1,
            """
                invoke-static/range {p1 .. p3}, $EXTENSION_CLASS->captureFlyoutSource(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

                invoke-static {}, $EXTENSION_CLASS->getActiveFlyoutPlaylistIdForNativeRow()Ljava/lang/String;
                move-result-object v$playlistIdOrItemRegister
                if-eqz v$playlistIdOrItemRegister, :pin_playlist_no_native_row

                iget-object v$contextOrListRegister, p0, $flyoutContextFieldDescriptor
                invoke-static/range {v$contextOrListRegister .. v$contextOrListRegister}, $EXTENSION_CLASS->getActiveFlyoutMenuTitle(Landroid/content/Context;)Ljava/lang/String;
                move-result-object v$titleRegister
                if-eqz v$titleRegister, :pin_playlist_no_native_row

                invoke-static/range {v$titleRegister .. v$titleRegister}, $nativeTitleFactoryDescriptor
                move-result-object v$titleRegister
                if-eqz v$titleRegister, :pin_playlist_no_native_row

                invoke-static/range {v$contextOrListRegister .. v$playlistIdOrItemRegister}, $nativeRowFactoryDescriptor
                move-result-object v$playlistIdOrItemRegister
                if-eqz v$playlistIdOrItemRegister, :pin_playlist_no_native_row

                move-object/from16 v$contextOrListRegister, v$normalizationResultRegister
                invoke-static/range {v$contextOrListRegister .. v$titleRegister}, $EXTENSION_CLASS->insertNativePinMenuItem(Ljava/util/List;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/List;
                move-result-object v$normalizationResultRegister
            """,
            ExternalLabel(
                "pin_playlist_no_native_row",
                nativeNormalizationContinuation
            )
        )

    }

    finalize {
        /*
         * Every extension is merged during patch execution before any patch
         * finalizer runs. Locate Morphe's preference fragment structurally by
         * the resource name it inflates, then attach the Pin playlists switch
         * to Morphe's existing Player screen after addPreferencesFromResource().
         *
         * If no Morphe settings host is present, the Pin playlists feature
         * remains functional with its default settings and this optional UI
         * bridge is simply not installed.
         */
        val settingsClass =
            classDefByStrings("morphe_prefs_icons_bold")
                .singleOrNull { classDef ->
                    classDef.methods.any { method ->
                        method.parameters.isEmpty() &&
                            method.returnType == "V" &&
                            method.implementation?.instructions?.any { instruction ->
                                val reference =
                                    (instruction as? ReferenceInstruction)
                                        ?.reference as? MethodReference

                                reference?.name == "addPreferencesFromResource" &&
                                    reference.parameterTypes
                                        .map { it.toString() } == listOf("I") &&
                                    reference.returnType == "V"
                            } == true
                    }
                } ?: return@finalize

        val initializeMethod = settingsClass.methods.singleOrNull { method ->
            method.parameters.isEmpty() &&
                method.returnType == "V" &&
                method.implementation?.instructions?.any { instruction ->
                    val reference =
                        (instruction as? ReferenceInstruction)
                            ?.reference as? MethodReference

                    reference?.name == "addPreferencesFromResource" &&
                        reference.parameterTypes
                            .map { it.toString() } == listOf("I") &&
                        reference.returnType == "V"
                } == true
        } ?: return@finalize

        val mutableInitializeMethod =
            mutableClassDefBy(settingsClass).methods.single { method ->
                method.name == initializeMethod.name &&
                    method.parameters.map { it.type } ==
                        initializeMethod.parameters.map { it.type } &&
                    method.returnType == initializeMethod.returnType
            }

        val alreadyInstalled =
            mutableInitializeMethod.implementation!!.instructions.any { instruction ->
                val reference =
                    (instruction as? ReferenceInstruction)
                        ?.reference as? MethodReference

                reference?.definingClass == SETTINGS_CLASS &&
                    reference.name == "installPreferencePath" &&
                    reference.parameterTypes
                        .map { it.toString() } ==
                        listOf("Ljava/lang/Object;") &&
                    reference.returnType == "V"
            }

        if (alreadyInstalled) return@finalize

        val addPreferencesIndex =
            mutableInitializeMethod.implementation!!.instructions
                .withIndex()
                .single { indexed ->
                    val reference =
                        (indexed.value as? ReferenceInstruction)
                            ?.reference as? MethodReference

                    reference?.name == "addPreferencesFromResource" &&
                        reference.parameterTypes
                            .map { it.toString() } == listOf("I") &&
                        reference.returnType == "V"
                }
                .index

        mutableInitializeMethod.addInstructions(
            addPreferencesIndex + 1,
            "invoke-static { p0 }, " +
                "$SETTINGS_CLASS->installPreferencePath(Ljava/lang/Object;)V"
        )
    }
}
