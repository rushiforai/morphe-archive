package app.morphe.patches.chmate

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.resource.PublicXmlManager
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.patch.filePathOption
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.findFreeRegister
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import org.w3c.dom.Element
import org.w3c.dom.Document
import java.net.URI
import java.io.File
import java.security.MessageDigest
import java.util.Locale

private const val EXTENSION = "Lapp/morphe/extension/chmate/Haiagaru;"

private object EmojiFontResourceMarker

private fun BytecodePatchContext.patchToolbarIcons(version: String) {
    val type = when (version) {
        "0.8.10.191 dev" -> "Lo/r8lambda98incQ33GAiiY2082BMi9yDa3l0;"
        "0.8.10.226 dev" -> "Lo/PAGBannerAdLoadCallback;"
        "0.8.10.242 dev" -> "Lo/zzcI;"
        else -> return
    }
    val owner = mutableClassDefBy(type)
    // Visibility belongs entirely to ChMate's per-toolbar checkboxes.
    // Only customize drawables; never rewrite selected flags or gate the renderer.
    val method = owner.methods.single {
        it.parameterTypes == listOf("Landroid/content/Context;", "I") &&
            it.returnType == "Landroid/graphics/drawable/Drawable;"
    }
    check(method.implementation!!.registerCount <= 16) { "Toolbar drawable registers changed: $version" }
    method.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
        .toList().asReversed().forEach { (index, instruction) ->
            val result = (instruction as OneRegisterInstruction).registerA
            check(result != method.implementation!!.registerCount - 3) { "Toolbar result overwrites receiver: $version" }
            method.addInstructions(index, """
                invoke-static {p0, v$result}, Lapp/morphe/extension/chmate/ToolbarIcons;->replaceNative(Ljava/lang/Object;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
                move-result-object v$result
            """.trimIndent())
        }
    println("Toolbar icon customization: $version -> $type")
}

private fun BytecodePatchContext.patchHiddenNgMenu(version: String) {
    // String and menu IDs are different. Validate both against each native preparation method.
    val profile = when (version) {
        "0.8.10.191 dev" -> Triple("Lo/pa;", 0x7f120470, 2131362442)
        "0.8.10.226 dev" -> Triple("Ljp/syoboi/a2chMate/ui/reslist/ResListFragment;", 0x7f10046e, 2131296944)
        "0.8.10.242 dev" -> Triple("Ljp/syoboi/a2chMate/ui/reslist/ResListFragment;", 0x7f100498, 2131296922)
        else -> return
    }
    val owner = mutableClassDefBy(profile.first)
    val method = owner.methods.single { method ->
        method.parameterTypes == listOf("Landroid/view/Menu;") && method.returnType == "V"
            && method.implementation?.instructions?.any {
                (it as? WideLiteralInstruction)?.wideLiteral == profile.second.toLong()
            } == true
    }
    val instructions = method.implementation!!.instructions.toList()
    check(instructions.any { (it as? WideLiteralInstruction)?.wideLiteral == profile.third.toLong() }) {
        "$version hidden-NG menu item ID changed"
    }
    check(instructions.any {
        val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Landroid/view/MenuItem;" && ref.name == "setVisible"
    }) { "$version hidden-NG visibility preparation changed" }
    val bridge = mutableClassDefBy("Lapp/morphe/extension/chmate/HiddenNgMenu;")
        .methods.single { it.name == "itemId" }
    bridge.replaceInstruction(0, "const v0, ${profile.third}")
    instructions.indices.filter { instructions[it].opcode == Opcode.RETURN_VOID }.reversed().forEach {
        method.addInstruction(it,
            "invoke-static/range {p1 .. p1}, Lapp/morphe/extension/chmate/HiddenNgMenu;->apply(Landroid/view/Menu;)V")
    }
    println("Hidden NG overflow option: $version -> ${owner.type}->${method.name}")
}

private fun BytecodePatchContext.patchNgEditGesture(version: String) {
    if (version !in setOf("0.8.10.191 dev", "0.8.10.226 dev", "0.8.10.241", "0.8.10.242 dev")) return
    val candidates = mutableListOf<ClassDef>()
    classDefForEach { cls ->
        if (cls.superclass == "Landroid/widget/LinearLayout;" && cls.methods.any {
            it.name == "setOnGestureListener"
        }) candidates.add(cls)
    }
    check(candidates.size == 1) { "$version gesture layout changed (${candidates.size})" }
    val gestureFields = candidates.single().fields.map { it.type }.toSet()
    val recognizers = mutableListOf<ClassDef>()
    classDefForEach { cls ->
        if (cls.type in gestureFields && cls.methods.any {
            it.parameterTypes == listOf("Landroid/view/MotionEvent;") && it.returnType == "Z"
        } && cls.methods.any {
            val parameters = it.parameterTypes
            it.name == "<init>" && parameters.size == 2 && parameters[0] == "Landroid/content/Context;"
        }) recognizers.add(cls)
    }
    check(recognizers.size == 1) { "$version settings gesture recognizer changed (${recognizers.size})" }
    val recognizerName = recognizers.single().type.removePrefix("L").removeSuffix(";").replace('/', '.')
    mutableClassDefBy("Lapp/morphe/extension/chmate/HaiagaruSettingsGestures;")
        .methods.single { it.name == "recognizerClassName" }
        .replaceInstruction(0, "const-string v0, \"$recognizerName\"")
    val owner = mutableClassDefBy(candidates.single())
    val complete = owner.methods.single {
        it.parameterTypes == listOf("I", "Landroid/graphics/PointF;", "Landroid/graphics/PointF;")
            && it.returnType == "V"
    }
    val body = complete.implementation!!.instructions.toList()
    val lookups = body.indices.filter { index ->
        val ref = (body[index] as? ReferenceInstruction)?.reference as? MethodReference
        ref?.parameterTypes == listOf("I") && ref.returnType == "Ljava/lang/Object;"
            && body.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
    }
    check(lookups.size == 1) { "$version gesture registry lookup changed (${lookups.size})" }
    val index = lookups.single()
    val lookup = body[index] as FiveRegisterInstruction
    // Reuse only the lookup receiver, then restore it before the original call.
    // 242 keeps every local live here, so searching for a spare register fails.
    val scratch = lookup.registerC
    val registry = owner.fields.single { field ->
        val ref = (body[index] as ReferenceInstruction).reference as MethodReference
        field.type == ref.definingClass
    }
    val thisRegister = complete.implementation!!.registerCount - 4
    check(scratch != lookup.registerD && scratch != thisRegister) { "$version gesture receiver changed" }
    check(complete.implementation!!.registerCount - 2 <= 15) { "$version gesture coordinate register changed" }
    complete.addInstructionsWithLabels(index, """
        move-object/from16 v$scratch, p0
        invoke-static {v$scratch, v${lookup.registerD}}, Lapp/morphe/extension/chmate/NgEditGesture;->onGesture(Landroid/view/View;I)Z
        move-result v$scratch
        if-eqz v$scratch, :restore_gesture_registry
        invoke-virtual/range {p0 .. p0}, Landroid/view/View;->invalidate()V
        return-void
        :restore_gesture_registry
        move-object/from16 v$scratch, p0
        iget-object v$scratch, v$scratch, ${owner.type}->${registry.name}:${registry.type}
    """.trimIndent())
    // Native completion overwrites parameter registers before the registry lookup.
    complete.addInstruction(0, "invoke-static {p0, p2}, Lapp/morphe/extension/chmate/NgEditGesture;->rememberStart(Landroid/view/View;Landroid/graphics/PointF;)V")

    // Completion and preview have separate native lookups. Do not register a synthetic
    // action globally: it would also reach native listeners that do not know its ID.
    val draw = owner.methods.single { it.name == "dispatchDraw" }
    val drawBody = draw.implementation!!.instructions.toList()
    val lookupReference = (body[index] as ReferenceInstruction).reference as MethodReference
    val previewLookups = drawBody.indices.filter { position ->
        ((drawBody[position] as? ReferenceInstruction)?.reference as? MethodReference)?.let {
            it.definingClass == lookupReference.definingClass && it.name == lookupReference.name &&
                it.parameterTypes == lookupReference.parameterTypes && it.returnType == lookupReference.returnType
        } == true
    }
    check(previewLookups.size == 1) { "$version gesture preview lookup changed" }
    val previewIndex = previewLookups.single()
    val previewLookup = drawBody[previewIndex] as FiveRegisterInstruction
    val previewResult = drawBody[previewIndex + 1] as OneRegisterInstruction
    check(drawBody[previewIndex + 1].opcode == Opcode.MOVE_RESULT_OBJECT)
    check(previewResult.registerA != previewLookup.registerD) { "$version preview sequence aliases result" }
    check(draw.implementation!!.registerCount - 2 <= 15) { "$version preview view register too high" }
    draw.addInstructions(previewIndex + 2, """
        invoke-static {p0, v${previewLookup.registerD}, v${previewResult.registerA}}, Lapp/morphe/extension/chmate/NgEditGesture;->preview(Landroid/view/View;ILjava/lang/Object;)Ljava/lang/Object;
        move-result-object v${previewResult.registerA}
    """.trimIndent())

    val listBase = mutableClassDefBy(if (version == "0.8.10.191 dev")
        "Lo/r8lambdahIGIGCNpKpFqE0lgDli724UCuDM;" else "Ljp/syoboi/a2chMate/fragment/RoidonListFragment;")
    val longClick = listBase.methods.single { it.name == "onLongClick" && it.parameterTypes == listOf("Landroid/view/View;") }
    // A fresh local is dead at entry; 191's packed switches confuse generic CFG scratch discovery.
    check(longClick.implementation!!.registerCount - 2 >= 1) { "$version long-click local missing" }
    val free = 0
    val original = longClick.implementation!!.instructions.first()
    longClick.addInstructionsWithLabels(0, """
        invoke-static {p0, p1}, Lapp/morphe/extension/chmate/DeleteReadThreads;->longClick(Ljava/lang/Object;Landroid/view/View;)Z
        move-result v$free
        if-eqz v$free, :native_long_click
        return v$free
    """.trimIndent(), ExternalLabel("native_long_click", original))
    // All supported native toolbars reuse one dummy child for action dispatch.
    // Never bind a listener to findViewById(5) in onViewCreated/global layout:
    // that makes the dummy consume subsequent taps. The native long-click
    // callback above is sufficient on 191, 226 and 242 alike.
    println("Read-thread deletion gesture and refresh long press: $version")
    if (version != "0.8.10.241") {
        val table = when (version) {
            "0.8.10.191 dev" -> "Lo/r8lambdaEBvvDaQDWIaS7WUoordU_4sxR3Y;"
            "0.8.10.226 dev" -> "Lo/TrustRootIndex;"
            else -> "Lo/initView;"
        }
        val board = if (version == "0.8.10.191 dev") "Ljp/syoboi/a2chMate/client/BBSUrlInfo\$BoardID;"
            else "Ljp/syoboi/a2chMate/client/BoardID;"
        val name = when (version) { "0.8.10.191 dev" -> "e"; "0.8.10.226 dev" -> "b"; else -> "a" }
        check(mutableClassDefBy(table).methods.count {
            it.name == name && it.parameterTypes == listOf(board, "J") && it.returnType == "V"
        } == 1) { "Native delete-with-cache API changed: $version" }
    }
}

private fun BytecodePatchContext.patchBrowsingAndSearchHistory(version: String) {
    val profile = when (version) {
        "0.8.10.191 dev" -> listOf("Lo/lrb\$write;", "Lo/r8lambdaEBvvDaQDWIaS7WUoordU_4sxR3Y;", "b")
        "0.8.10.226 dev" -> listOf("Lo/hasNextProxy\$ComponentActivity;", "Lo/TrustRootIndex;", "b")
        "0.8.10.241" -> listOf("Lo/canScrollHorizontally\$read;", "Lo/tul11;", "d")
        "0.8.10.242 dev" -> listOf("Lo/afterTextChanged\$RemoteActionCompatParcelizer;", "Lo/initView;", "a")
        else -> return
    }
    val runtime = "Lapp/morphe/extension/chmate/HistoryLimits;"
    val writer = mutableClassDefBy(profile[0]).methods.single { method ->
        method.parameterTypes == listOf("Ljava/lang/String;") && method.returnType == "V"
            && method.implementation?.instructions?.any {
                (it as? NarrowLiteralInstruction)?.narrowLiteral == 50
            } == true
    }
    val first = writer.implementation!!.instructions.first()
    val argument = if (writer.accessFlags and 8 != 0) "p0" else "p1"
    val register = writer.findFreeRegister(0)
    writer.addInstructionsWithLabels(0, """
        invoke-static {$argument}, $runtime->recordSearchHistory(Ljava/lang/String;)Z
        move-result v$register
        if-eqz v$register, :original_search_history
        return-void
    """.trimIndent(), ExternalLabel("original_search_history", first))
    val prune = mutableClassDefBy(profile[1]).methods.single {
        it.name == profile[2] && it.parameterTypes.isEmpty() && it.returnType == "V"
    }
    check(prune.implementation!!.instructions.any {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string?.contains("ORDER BY access") == true
    }) { "$version automatic history cleanup changed" }
    val original = prune.implementation!!.instructions.first()
    val guard = prune.findFreeRegister(0)
    prune.addInstructionsWithLabels(0, """
        invoke-static {}, $runtime->unlimitedThreadHistory()Z
        move-result v$guard
        if-eqz v$guard, :original_history_cleanup
        return-void
    """.trimIndent(), ExternalLabel("original_history_cleanup", original))
    if (version == "0.8.10.242 dev") {
        val ctor = mutableClassDefBy("Lo/initRenderFinish\$_init_lambda3;").methods.single { it.name == "<init>" }
        val body = ctor.implementation!!.instructions.toList()
        val index = body.indices.single { (body[it] as? WideLiteralInstruction)?.wideLiteral == 50L
            && body.getOrNull(it + 1)?.opcode == Opcode.IPUT_WIDE }
        val destination = (body[index] as OneRegisterInstruction).registerA
        ctor.replaceInstruction(index, "invoke-static {}, $runtime->getRecentThreadDisplayCountLong()J")
        ctor.addInstruction(index + 1, "move-result-wide v$destination")
    } else {
        var matches = 0
        classDefForEach { cls ->
            if (!cls.type.startsWith("Lo/")) return@classDefForEach
            cls.methods.forEach { method ->
                val body = method.implementation?.instructions?.toList() ?: return@forEach
                if (body.none { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "access" }) return@forEach
                val index = body.indexOfFirst {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "access"
                }
                val queries = body.indices.filter { position -> position > index
                    && ((body[position] as? ReferenceInstruction)?.reference as? MethodReference)
                        ?.let { it.definingClass == profile[1] && it.returnType == "Ljava/util/ArrayList;"
                            && it.parameterTypes.size == 3 } == true }
                if (queries.isEmpty()) return@forEach
                check(queries.size == 1) { "$version recent-history query ambiguous" }
                val query = queries.single()
                check(body[query + 1].opcode == Opcode.MOVE_RESULT_OBJECT)
                val result = (body[query + 1] as OneRegisterInstruction).registerA
                val mutable = mutableClassDefBy(cls).findMutableMethodOf(method)
                mutable.addInstruction(query + 2, "invoke-static {v$result}, $runtime->limitRecentThreadRows(Ljava/util/ArrayList;)Ljava/util/ArrayList;")
                mutable.addInstruction(query + 3, "move-result-object v$result")
                matches++
            }
        }
        check(matches == 1) { "$version recent-history query changed ($matches)" }
    }
}

/** Modern PostDataList no longer reads the legacy preference; bind its pruning limit. */
private fun BytecodePatchContext.patchPostHistoryRetentionCount(version: String) {
    val owner = when (version) {
        "0.8.10.241" -> "Lo/KP;"
        "0.8.10.242 dev" -> "Lo/PackageSignatureVerifier;"
        else -> return // 191/226 already read and observe postDataListCount natively.
    }
    val field = if (version == "0.8.10.241") "h" else "f"
    var patched = 0
    mutableClassDefBy(owner).methods.forEach { method ->
        val instructions = method.implementation?.instructions?.toList() ?: return@forEach
        instructions.indices.reversed().forEach { index ->
            val instruction = instructions[index]
            val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            if (instruction.opcode == Opcode.IGET && reference?.definingClass == owner
                && reference.name == field && reference.type == "I") {
                check(instructions.getOrNull(index + 1)?.opcode == Opcode.IF_LE) {
                    "$version post-history retention comparison changed"
                }
                val register = (instruction as OneRegisterInstruction).registerA
                method.replaceInstruction(index, "invoke-static {}, $EXTENSION->getPostHistoryRetentionCount()I")
                method.addInstruction(index + 1, "move-result v$register")
                patched++
            }
        }
    }
    check(patched == 1) { "$version post-history retention limit changed ($patched)" }
}

/** Change only the recently-posted query LIMIT, not the stored post-history retention. */
private fun BytecodePatchContext.patchPostedThreadDisplayCount(version: String) {
    val owner = when (version) {
        "0.8.10.191 dev" -> "Lo/r8lambdaTb_p0z6z2AqSZIga1YhmAVmiTPk;"
        "0.8.10.226 dev" -> "Ljp/syoboi/a2chMate/fragment/HomeFragment\$RemoteActionCompatParcelizer;"
        "0.8.10.241" -> "Lo/rS;"
        "0.8.10.242 dev" -> "Lo/queryPackageSignatureVerified;"
        "0.8.10.243 dev" -> "Lo/zzaA;"
        else -> return
    }
    val methods = mutableClassDefBy(owner).methods.filter { method ->
        if (version == "0.8.10.191 dev" || version == "0.8.10.226 dev") {
            method.name == (if (version == "0.8.10.191 dev") "a" else "e")
                && method.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;")
                && method.returnType == (if (version == "0.8.10.191 dev")
                    "Lo/onAdDisplayed\$setBackgroundResource;" else "Lo/Yy2\$CheckResult;")
        } else if (version == "0.8.10.243 dev") {
            method.name == "e" && method.parameters.isEmpty()
                && method.returnType == "Ljava/util/List;"
        } else {
            method.returnType == "Ljava/util/List;" && method.parameters.size == 2
                && method.parameters.first().toString() == "Landroid/content/Context;"
        }
    }
    check(methods.size == 1) { "$version posted-thread query method changed" }
    val method = methods.single()
    val instructions = method.implementation!!.instructions.toList()
    val wide = version == "0.8.10.242 dev" || version == "0.8.10.243 dev"
    val anchors = instructions.mapIndexedNotNull { index, instruction ->
        val isLimit = if (wide) {
            instruction.opcode == Opcode.CONST_WIDE_16
                && (instruction as? WideLiteralInstruction)?.wideLiteral == 10L
                && ((instructions.getOrNull(index + 1) as? ReferenceInstruction)?.reference as? MethodReference)
                    ?.let { it.name == "<init>" && it.parameterTypes.contains("J") } == true
        } else {
            instruction.opcode == Opcode.CONST_16
                && (instruction as? NarrowLiteralInstruction)?.narrowLiteral == 10
                && instructions.getOrNull(index + 1)?.opcode == Opcode.IPUT
                && instructions.take(index).any {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "posted"
                }
        }
        if (isLimit) index to (instruction as OneRegisterInstruction).registerA else null
    }
    check(anchors.size == 1) { "$version posted-thread query limit changed (${anchors.size})" }
    val (index, register) = anchors.single()
    if (wide) {
        // These generated constructors ignore their J argument and store a literal 10.
        // Patch the value actually bound to SQL LIMIT, not the unused caller argument.
        val constructor = (instructions[index + 1] as ReferenceInstruction).reference as MethodReference
        val target = mutableClassDefBy(constructor.definingClass).methods.single {
            it.name == "<init>" && it.parameterTypes == constructor.parameterTypes
        }
        val body = target.implementation!!.instructions.toList()
        val stores = body.mapIndexedNotNull { position, instruction ->
            if (instruction.opcode == Opcode.CONST_WIDE_16
                && (instruction as? WideLiteralInstruction)?.wideLiteral == 10L
                && body.getOrNull(position + 1)?.opcode == Opcode.IPUT_WIDE)
                position to (instruction as OneRegisterInstruction).registerA else null
        }
        check(stores.size == 1) { "$version posted-thread constructor limit changed" }
        val (position, destination) = stores.single()
        target.replaceInstruction(position, "invoke-static {}, $EXTENSION->getPostedThreadDisplayCountLong()J")
        target.addInstruction(position + 1, "move-result-wide v$destination")
        return
    }
    method.replaceInstruction(index, if (wide)
        "invoke-static {}, $EXTENSION->getPostedThreadDisplayCountLong()J" else
        "invoke-static {}, $EXTENSION->getPostedThreadDisplayCount()I")
    method.addInstruction(index + 1, "${if (wide) "move-result-wide" else "move-result"} v$register")
    if (!wide) {
        // The compatibility query drops the builder LIMIT entirely. Bound only
        // the posted-thread result, before draft/sent sections are appended.
        val query = instructions.indices.first { position -> position > index
            && ((instructions[position] as? ReferenceInstruction)?.reference as? MethodReference)
                ?.let { it.returnType == "Ljava/util/ArrayList;" && it.parameterTypes.size == 3 } == true
        }
        check(instructions[query + 1].opcode == Opcode.MOVE_RESULT_OBJECT)
        val result = (instructions[query + 1] as OneRegisterInstruction).registerA
        method.addInstruction(query + 3, "invoke-static {v$result}, $EXTENSION->limitPostedThreadRows(Ljava/util/List;)Ljava/util/List;")
        method.addInstruction(query + 4, "move-result-object v$result")
    }
}

/**
 * ChMate stores ordinary NG entries and shared NG-ID entries with separate
 * counters.  All supported builds used the same hard-coded 300-entry cap in
 * the NGWord save routine.  Replace those two literals with the Haiagaru
 * setting while keeping the surrounding retention and timestamp logic intact.
 */
private fun BytecodePatchContext.patchNgRegistrationLimit() {
    val ngWord = mutableClassDefBy("Ljp/syoboi/a2chMate/ng/NGWord;")
    val candidates = ngWord.methods.filter { method ->
        method.returnType == "V"
            && method.parameters.map(CharSequence::toString).singleOrNull() ==
                "Ljava/util/ArrayList;"
            && method.implementation?.instructions?.count { instruction ->
                instruction.opcode == Opcode.CONST_16
                    && (instruction as? NarrowLiteralInstruction)?.narrowLiteral == 300
            } == 1
    }
    check(candidates.size == 1) {
        "Unable to identify ChMate NGWord save routine (found ${candidates.size})"
    }
    val saveMethod = candidates.single()
    saveMethod.addBeforeEveryReturn(
        "invoke-static {}, Lapp/morphe/extension/chmate/PersonalNgSubmissions;->changed()V"
    )
    val limitConstants = saveMethod.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
        if (instruction.opcode == Opcode.CONST_16
            && (instruction as? NarrowLiteralInstruction)?.narrowLiteral == 300) {
            index to (instruction as OneRegisterInstruction).registerA
        } else {
            null
        }
    }
    check(limitConstants.size == 1) { "ChMate NGWord save limit anchor changed" }
    limitConstants.asReversed().forEach { (index, register) ->
        saveMethod.replaceInstruction(
            index,
            "invoke-static {}, $EXTENSION->getNgRegistrationLimit()I"
        )
        saveMethod.addInstructionsWithLabels(index + 1, "move-result v$register")
    }
}

/** Extend only the two native board filters, leaving NG text/flags/cache keys intact. */
private fun BytecodePatchContext.patchNgBoardScopes() {
    val itemType = "Ljp/syoboi/a2chMate/ng/NGWord\$Item;"
    val item = mutableClassDefBy(itemType)
    val constructor = item.methods.single {
        it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) ==
            listOf("Ljava/lang/String;", "S", "J", "Ljava/lang/String;")
    }
    val lastParameter = constructor.implementation!!.registerCount - 1
    val boardField = constructor.implementation!!.instructions.single {
        it.opcode == Opcode.IPUT_OBJECT && (it as TwoRegisterInstruction).registerA == lastParameter
    }.let { (it as ReferenceInstruction).reference as FieldReference }
    val store = mutableClassDefBy("Ljp/syoboi/a2chMate/ng/NGWord;")
    val filters = store.methods.filter {
        val p = it.parameterTypes.map(CharSequence::toString)
        it.returnType == itemType && p.size == 2 && p[0] == "Ljava/lang/String;"
            && p[1] in listOf("Ljp/syoboi/a2chMate/client/BBSUrlInfo\$BoardID;", "Ljp/syoboi/a2chMate/client/BoardID;")
            || it.returnType == "V" && p.size == 3 && p[1] == "Ljava/lang/String;" && p[2] == "J"
    }
    check(filters.size == 2) { "Native NG board filters changed: ${filters.size}" }
    filters.forEach { method ->
        val instructions = method.implementation!!.instructions.toList()
        val anchors = instructions.indices.filter { index ->
            val call = instructions[index] as? FiveRegisterInstruction ?: return@filter false
            val ref = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            ref?.returnType == "Z" && (ref.name == "equals" && ref.parameterTypes.size == 1
                || instructions[index].opcode == Opcode.INVOKE_STATIC
                    && ref.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Object;", "Ljava/lang/Object;"))
                && (maxOf(0, index - 3) until index).any { previous ->
                    val field = instructions[previous]
                    field.opcode == Opcode.IGET_OBJECT && (field as TwoRegisterInstruction).registerA == call.registerC
                        && (field as ReferenceInstruction).reference == boardField
                }
        }
        check(anchors.size == 1) { "Native NG board equality changed: ${method.name}/${anchors.size}" }
        val index = anchors.single()
        val call = instructions[index] as FiveRegisterInstruction
        method.replaceInstruction(index, "invoke-static {v${call.registerC}, v${call.registerD}}, " +
            "Lapp/morphe/extension/chmate/NgBoardScope;->matches(Ljava/lang/String;Ljava/lang/String;)Z")
    }
}

internal val chMateCompatibility = Compatibility(
    name = "ChMate",
    packageName = "jp.co.airfront.android.a2chMate",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x607D8B,
    signatures = setOf(
        "7dd84d97df4666fbc8188b8d6167ce59314636997f0edae82d685fffda4059d2"
    ),
    targets = listOf(
        AppTarget(
            version = "0.8.10.191 dev",
            minSdk = 21
        ),
        AppTarget(
            version = "0.8.10.226 dev",
            minSdk = 23
        ),
        AppTarget(
            version = "0.8.10.242 dev",
            minSdk = 23
        )
    )
)

private object SettingsOnResumeFingerprint : Fingerprint(
    definingClass = "Ljp/syoboi/a2chMate/activity/SettingActivity;",
    name = "onResume",
    returnType = "V",
    parameters = emptyList()
)

private object SettingsOnCreateFingerprint : Fingerprint(
    definingClass = "Ljp/syoboi/a2chMate/activity/SettingActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

private object HiltSettingsOnCreateFingerprint : Fingerprint(
    definingClass = "Ljp/syoboi/a2chMate/activity/Hilt_SettingActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

/** Board-list URL producer used by the Edge live board. */
private object EdgeSubjectUrlFingerprint : Fingerprint(
    definingClass = "Ljp/syoboi/a2chMate/client/BBSUrlInfo;",
    name = "z",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("/subject.txt")
)

private object EdgeSubjectUrl191Fingerprint : Fingerprint(
    definingClass = "Ljp/syoboi/a2chMate/client/BBSUrlInfo;",
    name = "l",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("/subject.txt")
)

private object EdgeSubjectUrl226Fingerprint : Fingerprint(
    definingClass = "Ljp/syoboi/a2chMate/client/BBSUrlInfo;",
    name = "B",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("/subject.txt")
)

private object EdgeThreadMenu226Fingerprint : Fingerprint(
    definingClass = "Lo/TTInterstitialActivity;",
    name = "<init>",
    strings = listOf("threadTitle", "bookmarkId", "threadUrl")
)

private object EdgeThreadMenu191Fingerprint : Fingerprint(
    definingClass = "Lo/q8;",
    name = "<init>",
    strings = listOf("threadTitle", "bookmarkId", "threadUrl")
)

private object EdgeSubjectUrl241Fingerprint : Fingerprint(
    definingClass = "Ljp/syoboi/a2chMate/client/BBSUrlInfo;",
    name = "B",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("/subject.txt")
)

private object EdgeSubjectUrl242Fingerprint : Fingerprint(
    definingClass = "Ljp/syoboi/a2chMate/client/BBSUrlInfo;",
    name = "C",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("/subject.txt")
)

private data class ChMateProfile(
    val providerClass: String,
    val providerStartupTrapClass: String?,
    val providerStartupDelegateField: String,
    val providerStartupDelegateType: String,
    val providerStartupDelegateMethod: String,
    val settingsViewModelClass: String?,
    val applicationClass: String,
    val homeFragmentClass: String,
    val cookieClearMethod: String,
    val signatureClass: String,
    val signatureMethod: String,
    val signatureDelegateField: String,
    val signatureDelegateType: String,
    val signatureDelegateMethod: String,
    val signatureSuperType: String,
    val patchSignatureWrapper: Boolean,
    val signatureDirectWrapperBypass: Boolean,
    val viewModelFactoryClass: String?,
    val viewModelDispatchField: String,
    val viewModelTrapKind: ViewModelTrapKind,
    val settingsWindowFeatureDivideTrap: Boolean,
    val hasHiltSettings: Boolean,
    val hasLevelPlayBanner: Boolean,
    val homeAdClass: String,
    val homeAdLoadMethod: String?,
    val legacyPlusDisplayStateClass: String? = null,
    val legacyPlusDisplayStateMethod: String? = null,
    val bypassLegacySingleIdEntitlement: Boolean = false,
    val legacyPlusFilterClass: String? = null,
)

/**
 * The 241/242 home list moved from ListView to a RecyclerView and its
 * multi-selection state lives in HomeViewModel. Intercept only the board-row
 * click callback and let the extension toggle that board's thread IDs.
 */
private fun BytecodePatchContext.patchHomeBoardMultiSelect(versionName: String, homeFragmentClass: String) {
    if (versionName == "0.8.10.226 dev") {
        val fragment = mutableClassDefBy(homeFragmentClass)
        val click = fragment.methods.single { method ->
            method.returnType == "V" && method.implementation != null &&
                method.parameterTypes.map(CharSequence::toString) ==
                listOf("Landroid/widget/ListView;", "Landroid/view/View;", "I", "J")
        }
        val callback = fragment.findMutableMethodOf(click)
        val original = callback.implementation!!.instructions.first()
        callback.addInstructionsWithLabels(
            0,
            """
                move-object/from16 v0, p1
                move/from16 v1, p3
                invoke-static {v0, v1}, Lapp/morphe/extension/chmate/HomeBoardMultiSelect;->selectLegacyRange(Landroid/widget/ListView;I)Z
                move-result v2
                if-eqz v2, :haiagaru_legacy_heading_continue
                invoke-direct/range {p0 .. p0}, $homeFragmentClass->y()V
                return-void
            """.trimIndent(),
            ExternalLabel("haiagaru_legacy_heading_continue", original),
        )
        return
    }
    if (versionName != "0.8.10.241" && versionName != "0.8.10.242 dev") return

    val homeFragment = mutableClassDefBy(homeFragmentClass)
    val itemType = if (versionName == "0.8.10.241") "Lo/MediationBannerAdapter;" else "Lo/getAvailabilityStatus;"
    val toggleType = if (versionName == "0.8.10.241") "Lo/setAdChoicesContent;" else "Lo/newSingleThreadScheduledExecutor;"
    val candidates = homeFragment.methods.filter { method ->
        method.returnType == "V" && method.implementation != null &&
        method.parameterTypes.map(CharSequence::toString) == listOf(itemType) &&
            method.implementation!!.instructions.any { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                reference?.definingClass == toggleType && reference.returnType == "V" &&
                    reference.parameterTypes.map(CharSequence::toString) == listOf("J")
            }
    }
    check(candidates.size == 1) {
        "$versionName board-header click callback changed (found ${candidates.size})"
    }

    val callback = homeFragment.findMutableMethodOf(candidates.single())
    val resultRegister = callback.findFreeRegister(0)
    val firstInstruction = callback.implementation!!.instructions.firstOrNull()
        ?: error("$versionName board-header callback has no instructions")
    callback.addInstructionsWithLabels(
        0,
        """
            invoke-static {p0, p1}, Lapp/morphe/extension/chmate/HomeBoardMultiSelect;->selectBoard(Ljava/lang/Object;Ljava/lang/Object;)Z
            move-result v$resultRegister
            if-eqz v$resultRegister, :haiagaru_board_multi_select_continue
            return-void
        """.trimIndent(),
        ExternalLabel("haiagaru_board_multi_select_continue", firstInstruction),
    )
}

private enum class ViewModelTrapKind {
    NONE,
    DIVIDE_BY_ZERO,
    FAILURE_BRANCH,
}

private fun profileFor(versionName: String) = when (versionName) {
    "0.8.10.191 dev" -> ChMateProfile(
        providerClass = "Lo/ndExternalSyntheticLambda7;",
        providerStartupTrapClass = "Lo/mc${'$'}5;",
        providerStartupDelegateField = "e",
        providerStartupDelegateType = "Lo/mc${'$'}read;",
        providerStartupDelegateMethod = "a",
        settingsViewModelClass = "Lo/onAppOpenAdLoadFailed;",
        applicationClass = "Lo/lo;",
        homeFragmentClass = "Lo/r8lambdaTb_p0z6z2AqSZIga1YhmAVmiTPk;",
        cookieClearMethod = "b",
        signatureClass = "",
        signatureMethod = "",
        signatureDelegateField = "",
        signatureDelegateType = "",
        signatureDelegateMethod = "",
        signatureSuperType = "",
        patchSignatureWrapper = false,
        // The legacy settings Activity has the same normal fall-through/failure-branch
        // shape even though it predates the provider wrapper used by newer versions.
        signatureDirectWrapperBypass = true,
        viewModelFactoryClass = null,
        viewModelDispatchField = "",
        viewModelTrapKind = ViewModelTrapKind.NONE,
        settingsWindowFeatureDivideTrap = false,
        hasHiltSettings = false,
        hasLevelPlayBanner = false,
        homeAdClass = "Lo/qheCC;",
        homeAdLoadMethod = null,
        legacyPlusDisplayStateClass = "Lo/lrb${'$'}RemoteActionCompatParcelizer;",
        legacyPlusDisplayStateMethod = "d",
        bypassLegacySingleIdEntitlement = true,
        legacyPlusFilterClass = "Lo/m9ExternalSyntheticLambda1;",
    )
    "0.8.10.226 dev" -> ChMateProfile(
        providerClass = "Lo/setDither;",
        providerStartupTrapClass = "Lo/setSourceokhttp\$1;",
        providerStartupDelegateField = "e",
        providerStartupDelegateType = "Lo/setSourceokhttp\$ComponentActivity;",
        providerStartupDelegateMethod = "c",
        settingsViewModelClass = null,
        applicationClass = "Ljp/syoboi/a2chMate/RoidonApp;",
        homeFragmentClass = "Ljp/syoboi/a2chMate/fragment/HomeFragment;",
        cookieClearMethod = "a",
        signatureClass = "",
        signatureMethod = "",
        signatureDelegateField = "",
        signatureDelegateType = "",
        signatureDelegateMethod = "",
        signatureSuperType = "",
        patchSignatureWrapper = false,
        signatureDirectWrapperBypass = true,
        viewModelFactoryClass = "Lo/isEligibleokhttp\$CheckResult\$write;",
        viewModelDispatchField = "c",
        viewModelTrapKind = ViewModelTrapKind.FAILURE_BRANCH,
        settingsWindowFeatureDivideTrap = false,
        hasHiltSettings = true,
        hasLevelPlayBanner = true,
        homeAdClass = "Lo/readByteArray\$RemoteActionCompatParcelizer;",
        homeAdLoadMethod = null,
    )
    "0.8.10.241" -> ChMateProfile(
        providerClass = "Lo/Kjv22;",
        providerStartupTrapClass = null,
        providerStartupDelegateField = "",
        providerStartupDelegateType = "",
        providerStartupDelegateMethod = "",
        settingsViewModelClass = null,
        applicationClass = "Ljp/syoboi/a2chMate/RoidonApp;",
        homeFragmentClass = "Ljp/syoboi/a2chMate/ui/home/HomeFragment;",
        cookieClearMethod = "e",
        signatureClass = "Lo/getWebView${'$'}3;",
        signatureMethod = "a",
        signatureDelegateField = "a",
        signatureDelegateType = "Lo/getWebView${'$'}write;",
        signatureDelegateMethod = "a",
        signatureSuperType = "Lo/getWebView${'$'}IconCompatParcelizer;",
        patchSignatureWrapper = true,
        signatureDirectWrapperBypass = true,
        viewModelFactoryClass =
            "Lo/getBorderWidth${'$'}r8lambdavCwjfXDiSGcirCy4I008VOiJ_lw${'$'}RemoteActionCompatParcelizer;",
        viewModelDispatchField = "c",
        viewModelTrapKind = ViewModelTrapKind.FAILURE_BRANCH,
        settingsWindowFeatureDivideTrap = true,
        hasHiltSettings = true,
        hasLevelPlayBanner = true,
        homeAdClass = "Lo/setUseHandlerThreadForCallbacks;",
        homeAdLoadMethod = "e",
    )
    "0.8.10.242 dev" -> ChMateProfile(
        providerClass = "Lo/isConnected;",
        providerStartupTrapClass = null,
        providerStartupDelegateField = "",
        providerStartupDelegateType = "",
        providerStartupDelegateMethod = "",
        settingsViewModelClass = null,
        applicationClass = "Ljp/syoboi/a2chMate/RoidonApp;",
        homeFragmentClass = "Ljp/syoboi/a2chMate/ui/home/HomeFragment;",
        cookieClearMethod = "e",
        signatureClass = "Lo/TTRewardExpressVideoActivity${'$'}5;",
        signatureMethod = "c",
        signatureDelegateField = "a",
        signatureDelegateType = "Lo/TTRewardExpressVideoActivity${'$'}read;",
        signatureDelegateMethod = "c",
        signatureSuperType = "Lo/TTRewardExpressVideoActivity${'$'}RemoteActionCompatParcelizer;",
        patchSignatureWrapper = true,
        signatureDirectWrapperBypass = true,
        viewModelFactoryClass = "Lo/onInterstitialDismissed${'$'}_init_lambda2${'$'}ComponentActivity;",
        viewModelDispatchField = "e",
        viewModelTrapKind = ViewModelTrapKind.FAILURE_BRANCH,
        settingsWindowFeatureDivideTrap = false,
        hasHiltSettings = true,
        hasLevelPlayBanner = true,
        homeAdClass = "Lo/zzbgb;",
        homeAdLoadMethod = "d",
    )
    "0.8.10.243 dev" -> ChMateProfile(
        providerClass = "Lo/zzbvh;",
        providerStartupTrapClass = null,
        providerStartupDelegateField = "",
        providerStartupDelegateType = "",
        providerStartupDelegateMethod = "",
        settingsViewModelClass = null,
        applicationClass = "Ljp/syoboi/a2chMate/RoidonApp;",
        homeFragmentClass = "Ljp/syoboi/a2chMate/ui/home/HomeFragment;",
        cookieClearMethod = "a",
        signatureClass = "Lo/SafeParcelableReserved${'$'}4;",
        signatureMethod = "a",
        signatureDelegateField = "b",
        signatureDelegateType = "Lo/SafeParcelableReserved${'$'}RemoteActionCompatParcelizer;",
        signatureDelegateMethod = "a",
        signatureSuperType = "Lo/SafeParcelableReserved${'$'}IconCompatParcelizer;",
        patchSignatureWrapper = true,
        signatureDirectWrapperBypass = false,
        viewModelFactoryClass = "Lo/hasData${'$'}_init_lambda2${'$'}write;",
        viewModelDispatchField = "d",
        viewModelTrapKind = ViewModelTrapKind.DIVIDE_BY_ZERO,
        settingsWindowFeatureDivideTrap = false,
        hasHiltSettings = true,
        hasLevelPlayBanner = true,
        homeAdClass = "Lo/zzexb;",
        homeAdLoadMethod = "c",
    )
    else -> error("Unsupported ChMate version: $versionName")
}

private fun BytecodePatchContext.patchEdgeArchiveToolbar(
    profile: ChMateProfile,
    versionName: String,
) {
    val legacyToolbar = versionName == "0.8.10.191 dev"
    val toolbarModelType = if (versionName == "0.8.10.191 dev") {
        "Lo/r8lambdaElkXfNt4VbdvffL9Z700R6oMDo;"
    } else {
        "Ljp/syoboi/a2chMate/feature/toolbar/ToolbarDefault;"
    }

    fun MutableMethod.wrapModelReturns(includeMarkAllRead: Boolean = false, favorites: Boolean = false) {
        val indexes = implementation?.instructions
            ?.withIndex()
            ?.filter { it.value.opcode == Opcode.RETURN_OBJECT }
            ?.map { it.index }
            .orEmpty()
        for (index in indexes.asReversed()) {
            val register = (implementation!!.instructions[index] as OneRegisterInstruction).registerA
            val markAllRead = if (includeMarkAllRead) """
                invoke-static/range { v$register .. v$register }, $EXTENSION->addMarkAllReadToolbarChoice(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v$register
            """.trimIndent() else ""
            addInstructionsWithLabels(
                index,
                """
                    invoke-static/range { v$register .. v$register }, $EXTENSION->addEdgeArchiveToolbarChoice(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v$register
                    $markAllRead
                    ${if (favorites) "invoke-static/range { v$register .. v$register }, $EXTENSION->addFavoriteThreadsTab(Ljava/lang/Object;)Ljava/lang/Object;\nmove-result-object v$register" else ""}
                check-cast v$register, $toolbarModelType
                """.trimIndent(),
            )
        }
    }

    val homeToolbarMethods = mutableClassDefBy(profile.homeFragmentClass).methods.filter { method ->
        method.returnType == toolbarModelType && method.implementation != null
    }
    if (homeToolbarMethods.isEmpty()) {
        throw PatchException("ホームツールバーの生成メソッドを特定できません: $versionName")
    }
    homeToolbarMethods.forEach { method ->
        mutableClassDefBy(profile.homeFragmentClass).findMutableMethodOf(method).wrapModelReturns(includeMarkAllRead = true, favorites = true)
    }

    // A board's thread list owns a separate toolbar model.  Patching the
    // home model alone makes the choice disappear as soon as a board opens.
    val threadListClass = when (versionName) {
        "0.8.10.191 dev" -> "Lo/r8lambdaGCnF6WpW_bFarRe7yCX2B6KzQ;"
        "0.8.10.226 dev" -> "Lo/Yhp5;"
        else -> "Ljp/syoboi/a2chMate/ui/threadlist/ThreadListFragment;"
    }
    val threadToolbarMethods = mutableClassDefBy(threadListClass).methods.filter { method ->
        method.returnType == toolbarModelType && method.implementation != null &&
            (if (legacyToolbar || versionName == "0.8.10.226 dev") method.parameters.isEmpty() else
                method.parameters.map { it.type } == listOf(threadListClass))
    }
    if (threadToolbarMethods.isEmpty()) {
        throw PatchException("板のスレ一覧ツールバーを特定できません: $versionName")
    }
    threadToolbarMethods.forEach { method ->
        mutableClassDefBy(threadListClass).findMutableMethodOf(method).wrapModelReturns(includeMarkAllRead = true)
    }

    // BoardList2Activity displays board categories through its own fragment.
    // Its toolbar catalog is distinct from both the home and thread-list catalogs.
    val boardCategoryClass = when (versionName) {
        "0.8.10.191 dev" -> "Lo/AdControlButtona;"
        "0.8.10.226 dev" -> "Lo/setDeployments;"
        "0.8.10.241" -> "Lo/bea4;"
        "0.8.10.242 dev" -> "Lo/clearDefaultAccountAndReconnect;"
        else -> "Lo/zzbya;"
    }
    val boardCategoryMethods = mutableClassDefBy(boardCategoryClass).methods.filter { method ->
        method.returnType == toolbarModelType && method.implementation != null &&
            (if (legacyToolbar || versionName == "0.8.10.226 dev") method.parameters.isEmpty() else
                method.parameters.map { it.type } == listOf(boardCategoryClass))
    }
    if (boardCategoryMethods.isEmpty()) {
        throw PatchException("板カテゴリ一覧のツールバーを特定できません: $versionName")
    }
    boardCategoryMethods.forEach { method ->
        mutableClassDefBy(boardCategoryClass).findMutableMethodOf(method).wrapModelReturns()
    }

    val dispatcherClass = if (versionName == "0.8.10.191 dev") {
        "Lo/r8lambdahIGIGCNpKpFqE0lgDli724UCuDM;"
    } else {
        profile.homeFragmentClass
    }
    val clickMethods = mutableClassDefBy(dispatcherClass).methods.filter { method ->
        method.returnType == "Z" && method.implementation != null &&
            method.implementation!!.instructions.isNotEmpty() &&
            method.parameters.map { it.type } == listOf("I", "Ljava/lang/Object;")
    }
    if (clickMethods.isEmpty()) {
        val candidates = mutableClassDefBy(dispatcherClass).methods
            .filter { it.returnType == "Z" && it.parameters.map { parameter -> parameter.type } ==
                listOf("I", "Ljava/lang/Object;") }
        throw PatchException(
            "ホームツールバーのクリック処理を特定できません: $versionName; candidates=$candidates",
        )
    }
    clickMethods.forEach { method ->
        val mutableMethod = mutableClassDefBy(dispatcherClass).findMutableMethodOf(method)
        val resultRegister = mutableMethod.findFreeRegister(0)
        val originalFirstInstruction = mutableMethod.implementation!!.instructions.first()
        mutableMethod.addInstructionsWithLabels(
            0,
            """
                invoke-static { p0, p1 }, $EXTENSION->handleEdgeArchiveToolbarClick(Ljava/lang/Object;I)Z
                move-result v$resultRegister
                if-eqz v$resultRegister, :haiagaru_edge_toolbar_continue
                const/4 v$resultRegister, 0x1
                return v$resultRegister
            """.trimIndent(),
            ExternalLabel("haiagaru_edge_toolbar_continue", originalFirstInstruction),
        )
    }

    val threadClickMethods = mutableClassDefBy(threadListClass).methods.filter { method ->
        method.returnType == "Z" && method.implementation?.instructions?.isNotEmpty() == true &&
            method.parameters.map { it.type } == listOf("I", "Ljava/lang/Object;")
    }
    if (threadClickMethods.isEmpty()) {
        throw PatchException("板のスレ一覧ツールバー操作を特定できません: $versionName")
    }
    threadClickMethods.forEach { method ->
        val mutableMethod = mutableClassDefBy(threadListClass).findMutableMethodOf(method)
        val resultRegister = mutableMethod.findFreeRegister(0)
        val originalFirstInstruction = mutableMethod.implementation!!.instructions.first()
        mutableMethod.addInstructionsWithLabels(
            0,
            """
                invoke-static { p0, p1 }, $EXTENSION->handleEdgeArchiveToolbarClick(Ljava/lang/Object;I)Z
                move-result v$resultRegister
                if-eqz v$resultRegister, :haiagaru_edge_thread_toolbar_continue
                const/4 v$resultRegister, 0x1
                return v$resultRegister
            """.trimIndent(),
            ExternalLabel("haiagaru_edge_thread_toolbar_continue", originalFirstInstruction),
        )
    }

    val boardCategoryClickMethods = mutableClassDefBy(boardCategoryClass).methods.filter { method ->
        method.returnType == "Z" && method.implementation?.instructions?.isNotEmpty() == true &&
            method.parameters.map { it.type } == listOf("I", "Ljava/lang/Object;")
    }
    if (boardCategoryClickMethods.isEmpty()) {
        throw PatchException("板カテゴリ一覧のツールバー操作を特定できません: $versionName")
    }
    boardCategoryClickMethods.forEach { method ->
        val mutableMethod = mutableClassDefBy(boardCategoryClass).findMutableMethodOf(method)
        val resultRegister = mutableMethod.findFreeRegister(0)
        val originalFirstInstruction = mutableMethod.implementation!!.instructions.first()
        mutableMethod.addInstructionsWithLabels(
            0,
            """
                invoke-static { p0, p1 }, $EXTENSION->handleEdgeArchiveToolbarClick(Ljava/lang/Object;I)Z
                move-result v$resultRegister
                if-eqz v$resultRegister, :haiagaru_edge_board_category_toolbar_continue
                const/4 v$resultRegister, 0x1
                return v$resultRegister
            """.trimIndent(),
            ExternalLabel("haiagaru_edge_board_category_toolbar_continue", originalFirstInstruction),
        )
    }
}

/** 191's popup forwards even a consumed fragment menu item to the activity.
 * In tablet mode both panes then open their own toolbar settings dialog.
 * Stop at the fragment that handled the item; retain the native fallback for
 * unhandled items rather than deduplicating dialogs after they were created.
 */
private fun BytecodePatchContext.patchConsumedPopupMenu191() {
    val callback = mutableClassDefBy("Lo/m6b\$4;").methods.single {
        it.name == "Xf_" && it.returnType == "Z"
            && it.parameters.map(CharSequence::toString) == listOf("Landroid/view/MenuItem;")
    }
    val instructions = callback.implementation!!.instructions.toList()
    val dispatchIndex = instructions.indexOfFirst {
        val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
        it.opcode == Opcode.INVOKE_INTERFACE && ref?.definingClass == "Lo/getSharedPreferences;"
            && ref.name == "VQ_" && ref.returnType == "Z"
    }
    check(dispatchIndex >= 0) { "191 popup fragment menu dispatch not found" }
    val result = instructions[dispatchIndex + 1]
    val branch = instructions[dispatchIndex + 2]
    check(result.opcode == Opcode.MOVE_RESULT && branch.opcode == Opcode.IF_NEZ) {
        "191 popup consumed-result branch changed"
    }
    val resultRegister = (result as OneRegisterInstruction).registerA
    check((branch as OneRegisterInstruction).registerA == resultRegister)
    callback.addInstructionsWithLabels(
        dispatchIndex + 2,
        """
            if-eqz v$resultRegister, :haiagaru_popup_unhandled
            return v$resultRegister
        """.trimIndent(),
        ExternalLabel("haiagaru_popup_unhandled", branch),
    )
}

private fun BytecodePatchContext.patchQuickFilterToolbar(version: String) {
    patchExtraQuickFilters(version)
    patchCachedWacchoiSearch(version)
    patchGlobalTitleSearch(version)
    patchQuickFilterPosition(version)
    if (version == "0.8.10.191 dev") {
        val toolbarModelType = "Lo/r8lambdaElkXfNt4VbdvffL9Z700R6oMDo;"
        val builder = mutableClassDefBy("Lo/pa;").methods.single {
            it.name == "j" && it.returnType == toolbarModelType && it.parameters.isEmpty()
        }
        val returnSites = builder.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_OBJECT }
        check(returnSites.isNotEmpty()) { "191 response toolbar return sites missing" }
        returnSites.asReversed().forEach { (index, instruction) ->
            val register = (instruction as OneRegisterInstruction).registerA
            builder.addInstructionsWithLabels(index, """
                invoke-static/range {v$register .. v$register}, $EXTENSION->addEdgeArchiveToolbarChoice(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v$register
                check-cast v$register, $toolbarModelType
                invoke-static/range {v$register .. v$register}, $EXTENSION->addMarkAllReadToolbarChoice(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v$register
                check-cast v$register, $toolbarModelType
                invoke-static/range {v$register .. v$register}, $EXTENSION->addQuickFilterToolbarChoice(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v$register
                check-cast v$register, $toolbarModelType
            """.trimIndent())
        }
        val dispatcherClass = "Lo/r8lambdahIGIGCNpKpFqE0lgDli724UCuDM;"
        val dispatchers = mutableClassDefBy(dispatcherClass).methods.filter {
            it.returnType == "Z" && it.parameters.map(CharSequence::toString) ==
                listOf("I", "Ljava/lang/Object;") && it.implementation?.instructions?.isNotEmpty() == true
        }
        check(dispatchers.isNotEmpty()) { "191 response toolbar dispatcher missing" }
        dispatchers.forEach { method ->
            val mutable = mutableClassDefBy(dispatcherClass).findMutableMethodOf(method)
            val first = mutable.implementation!!.instructions.first()
            val result = mutable.findFreeRegister(0)
            mutable.addInstructionsWithLabels(0, """
                invoke-static/range {p0 .. p1}, $EXTENSION->handleEdgeArchiveToolbarClick(Ljava/lang/Object;I)Z
                move-result v$result
                if-eqz v$result, :legacy_filter_dispatch_continue
                const/4 v$result, 0x1
                return v$result
                :legacy_filter_dispatch_continue
                invoke-static/range {p0 .. p1}, Lapp/morphe/extension/chmate/QuickFilterToolbar;->clickLegacy(Ljava/lang/Object;I)Z
                move-result v$result
                if-eqz v$result, :legacy_filter_dispatch
                const/4 v$result, 0x1
                return v$result
            """.trimIndent(), ExternalLabel("legacy_filter_dispatch", first))
        }
        val filterBinding = mutableClassDefBy("Lo/j4;").methods.single {
            it.name == "<init>" && it.parameters.map(CharSequence::toString) ==
                listOf("Lo/executeOnMainThread;", "Landroid/view/View;")
        }
        val constructorReturn = filterBinding.implementation!!.instructions.indexOfLast {
            it.opcode == Opcode.RETURN_VOID
        }
        check(constructorReturn >= 0) { "191 filter binding constructor return missing" }
        filterBinding.addInstructionsWithLabels(constructorReturn, """
            invoke-static/range {p0 .. p0}, Lapp/morphe/extension/chmate/QuickFilterToolbar;->hideLegacyFilterRow(Ljava/lang/Object;)V
        """.trimIndent())
        val rows = mutableClassDefBy("Lo/m9ExternalSyntheticLambda1;").methods.single {
            it.name == "getView" && it.returnType == "Landroid/view/View;"
        }
        rows.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_OBJECT }.asReversed().forEach { (index, instruction) ->
                val register = (instruction as OneRegisterInstruction).registerA
                rows.addInstructionsWithLabels(index, """
                    invoke-static/range {v$register .. v$register}, Lapp/morphe/extension/chmate/QuickFilterToolbar;->prepareLegacyFilterRow(Landroid/view/View;)V
                """.trimIndent())
            }
        return
    }
    if (version !in setOf("0.8.10.226 dev", "0.8.10.241", "0.8.10.242 dev", "0.8.10.243 dev")) return
    val fragment = "Ljp/syoboi/a2chMate/ui/reslist/ResListFragment;"
    val model = "Ljp/syoboi/a2chMate/feature/toolbar/ToolbarDefault;"
    val catalog = when (version) {
        "0.8.10.226 dev" -> "Lo/AdSlot;"
        "0.8.10.241" -> "Lo/PackageSignatureVerifier;"
        "0.8.10.242 dev" -> "Lo/zzaB;"
        else -> "Lo/zzdow;"
    }
    // These small catalogs provide both the default and tablet response toolbars.
    val builders = mutableClassDefBy(catalog).methods.filter {
        it.returnType == model && it.implementation != null
    }
    check(builders.isNotEmpty()) { "242 response toolbar catalog missing" }
    builders.forEach { builder ->
    val returns = builder.implementation!!.instructions.withIndex()
        .filter { it.value.opcode == Opcode.RETURN_OBJECT }.toList().asReversed()
    returns.forEach { (index, instruction) ->
        val register = (instruction as OneRegisterInstruction).registerA
        builder.addInstructionsWithLabels(index, """
            invoke-static/range {v$register .. v$register}, $EXTENSION->addEdgeArchiveToolbarChoice(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v$register
            check-cast v$register, $model
            invoke-static/range {v$register .. v$register}, $EXTENSION->addMarkAllReadToolbarChoice(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v$register
            check-cast v$register, $model
            invoke-static/range {v$register .. v$register}, $EXTENSION->addQuickFilterToolbarChoice(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v$register
            check-cast v$register, $model
        """.trimIndent())
    }
    }
    val dispatchers = mutableClassDefBy(fragment).methods.filter {
        it.returnType == "Z" && it.parameters.map(CharSequence::toString) ==
            listOf("I", "Ljava/lang/Object;") && it.implementation?.instructions?.isNotEmpty() == true
    }
    check(dispatchers.size == 1) { "$version response-toolbar dispatcher count=${dispatchers.size}" }
    val dispatcher = dispatchers.single()
    val first = dispatcher.implementation!!.instructions.first()
    val toolbarResult = dispatcher.findFreeRegister(0)
    dispatcher.addInstructionsWithLabels(0, """
        invoke-static/range {p0 .. p1}, $EXTENSION->handleEdgeArchiveToolbarClick(Ljava/lang/Object;I)Z
        move-result v$toolbarResult
        if-eqz v$toolbarResult, :edge_toolbar_dispatch_continue
        const/4 v$toolbarResult, 0x1
        return v$toolbarResult
        :edge_toolbar_dispatch_continue
        invoke-static/range {p0 .. p1}, Lapp/morphe/extension/chmate/QuickFilterToolbar;->click(Ljava/lang/Object;I)Z
        move-result v$toolbarResult
        if-eqz v$toolbarResult, :original_filter_dispatch
        return v$toolbarResult
    """.trimIndent(), ExternalLabel("original_filter_dispatch", first))
    val filterContainer = when (version) {
        "0.8.10.226 dev" -> "Lo/listener\$setContentView;" to "Lo/m2a;"
        "0.8.10.241" -> "Lo/getRemoteResource;" to "Lo/getBCode;"
        "0.8.10.242 dev" -> "Lo/zzacr;" to "Lo/r7ExternalSyntheticLambda0;"
        else -> null
    }
    if (filterContainer != null) {
        val (adapterType, viewType) = filterContainer
        var hooks = 0
        mutableClassDefBy(adapterType).methods.forEach { method ->
            val sites = method.implementation?.instructions?.withIndex()?.filter {
                val ref = (it.value as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == viewType && ref.name == "setContent" && ref.returnType == "V"
            }.orEmpty()
            sites.asReversed().forEach { (index, instruction) ->
                val receiver = when (instruction) {
                    is FiveRegisterInstruction -> instruction.registerC
                    is RegisterRangeInstruction -> instruction.startRegister
                    else -> error("Unsupported filter setContent invocation: $version")
                }
                method.addInstructionsWithLabels(index + 1, """
                    invoke-static/range {v$receiver .. v$receiver}, Lapp/morphe/extension/chmate/QuickFilterToolbar;->prepareFilterRow(Landroid/view/View;)V
                """.trimIndent())
                hooks++
            }
        }
        check(hooks == 1) { "$version filter container anchor count=$hooks" }
        if (version == "0.8.10.226 dev") {
            // ListView measures a zero-height row with UNSPECIFIED height, unlike
            // RecyclerView. Let Compose initialize/measure, then collapse only the
            // explicitly registered filter row. Do not suppress state subscriptions.
            val composeBase = mutableClassDefBy(mutableClassDefBy(viewType).superclass!!)
            val measure = composeBase.methods.single {
                it.name == "onMeasure" && it.parameterTypes == listOf("I", "I") && it.returnType == "V"
            }
            val exits = measure.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }.toList()
            check(exits.size == 1) { "226 Compose measurement exit changed" }
            val originalReturn = exits.single().value
            measure.addInstructionsWithLabels(exits.single().index, """
                invoke-static/range {p0 .. p0}, Lapp/morphe/extension/chmate/QuickFilterToolbar;->shouldCollapseMeasuredFilterRow(Landroid/view/View;)Z
                move-result p1
                if-eqz p1, :haiagaru_filter_measure_done
                invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I
                move-result p1
                const/4 p2, 0x0
                invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V
            """.trimIndent(), ExternalLabel("haiagaru_filter_measure_done", originalReturn))
        }
        // Keep Compose initialization and state subscriptions active. Only the
        // dedicated row's measured height changes, with its original height restored on OFF.
        return
    }
    val quickFilterComposeRow = when (version) {
        "0.8.10.226 dev" -> "Lo/writeWindowUpdateLaterokhttp;" to "Lo/Ff11;"
        "0.8.10.241" -> "Lo/getRewardItem;" to "Lo/zzagp;"
        "0.8.10.242 dev" -> "Lo/isAtLeastS;" to "Lo/zzbwq;"
        "0.8.10.243 dev" -> "Lo/zzdhn;" to "Lo/zzftg;"
        else -> null
    }
    if (quickFilterComposeRow != null) {
        val (rowType, unitType) = quickFilterComposeRow
        val unitField = mutableClassDefBy(unitType).fields.single { field ->
            field.type == unitType && field.accessFlags and 8 != 0
        }
        val header = mutableClassDefBy(rowType).methods.single {
            it.name == "invoke" && it.parameters.size == 2 && it.returnType == "Ljava/lang/Object;"
        }
        val original = header.implementation!!.instructions.first()
        header.addInstructionsWithLabels(0, """
            invoke-static {}, $EXTENSION->compactQuickFilters()Z
            move-result v0
            if-eqz v0, :original_quick_filter_header
            sget-object v0, $unitType->${unitField.name}:$unitType
            return-object v0
        """.trimIndent(), ExternalLabel("original_quick_filter_header", original))
    }
    // Keep the original filter state and handlers; only omit each version's
    // Compose row while the compact toolbar option is enabled.
}

/** Capture only quick-filter operations, including the stock upper filter controls. */
private fun BytecodePatchContext.patchQuickFilterPosition(version: String) {
    val extension = "Lapp/morphe/extension/chmate/FilterPosition;"
    if (version == "0.8.10.191 dev") {
        val owner = "Lo/pa\$21;"
        val callback = mutableClassDefBy(owner).methods.single {
            it.name == "e" && it.parameterTypes.isEmpty() && it.returnType == "V"
        }
        val rebuild = callback.implementation!!.instructions.withIndex().single { (_, instruction) ->
            (instruction as? ReferenceInstruction)?.reference?.toString() ==
                "Lo/m9ExternalSyntheticLambda1;->c(Z)V"
        }.index
        // p0 is the callback; its owner field is the fragment, not a global active tab.
        val free = callback.findFreeRegister(0)
        callback.addInstructionsWithLabels(0, """
            iget-object v$free, p0, $owner->d:Lo/pa;
            invoke-static/range {v$free .. v$free}, $extension->beforeFragment(Ljava/lang/Object;)V
        """.trimIndent())
        check(rebuild > 0) { "191 quick-filter rebuild missing" }
        return
    }
    if (version !in setOf("0.8.10.226 dev", "0.8.10.241", "0.8.10.242 dev")) return
    val fragment = mutableClassDefBy("Ljp/syoboi/a2chMate/ui/reslist/ResListFragment;")
    val bind = fragment.methods.single { it.name == "onViewCreated" && it.returnType == "V" }
    bind.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
        .asReversed().forEach { (index, _) ->
            bind.addInstructionsWithLabels(index, """
                invoke-static/range {p0 .. p0}, $extension->register(Ljava/lang/Object;)V
            """.trimIndent())
        }
    if (version == "0.8.10.226 dev") {
        val toggle = mutableClassDefBy("Lo/listener\$setContentView\$ComponentActivity;").methods.single {
            it.name == "invoke" && it.returnType == "Ljava/lang/Object;"
        }
        val site = toggle.implementation!!.instructions.withIndex().single { (_, instruction) ->
            (instruction as? ReferenceInstruction)?.reference?.toString() == "Lo/getImgAcceptedHeight;->k:Lo/zzbc;"
                    && instruction.opcode == Opcode.IGET_OBJECT
                    && (instruction as TwoRegisterInstruction).registerA == 0
        }
        val receiver = (site.value as TwoRegisterInstruction).registerB
        toggle.addInstructionsWithLabels(site.index, """
            invoke-static/range {v$receiver .. v$receiver}, $extension->beforeModel(Ljava/lang/Object;)V
        """.trimIndent())
    } else {
        val model = mutableClassDefBy("Ljp/syoboi/a2chMate/ui/reslist/ResListFragmentViewModel;")
        val kind = if (version == "0.8.10.241") "Lo/setBufferSize;" else "Lo/isAtLeastLollipop;"
        val action = if (version == "0.8.10.241") "d" else "b"
        val toggle = model.methods.single {
            it.name == action && it.returnType == "V" && it.parameterTypes == listOf(kind)
        }
        toggle.addInstructionsWithLabels(0, """
            invoke-static/range {p0 .. p0}, $extension->beforeModel(Ljava/lang/Object;)V
        """.trimIndent())
    }
}

/** Board display settings and the post-bookmark thread list are separate flows. */
private fun BytecodePatchContext.patchReadThreadsFirst(version: String) {
    if (version == "0.8.10.191 dev" || version == "0.8.10.226 dev") {
        val adapterType = if (version == "0.8.10.191 dev") "Lo/m8a;" else "Lo/getWriteBytesTotal;"
        val adapterMethod = if (version == "0.8.10.191 dev") "e" else "b"
        val adapter = mutableClassDefBy(adapterType).methods.single { method ->
            method.name == adapterMethod && method.returnType == "V" &&
                method.parameters.size == 7 && method.parameters[0].toString() == "Ljava/util/ArrayList;"
        }
        val notifyIndex = adapter.implementation!!.instructions.indexOfLast { instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ref?.name == "notifyDataSetChanged" && ref.parameterTypes.isEmpty()
        }
        check(notifyIndex >= 0) { "$version legacy board adapter has no final notify" }
        adapter.addInstructionsWithLabels(notifyIndex,
            "invoke-static/range {p0 .. p0}, " +
                "Lapp/morphe/extension/chmate/ReadThreadsFirst;->reorderLegacyAdapter(Ljava/lang/Object;)V")
        val rebuild = mutableClassDefBy(adapterType).methods.single { method ->
            method.name == "d" && method.returnType == "V" && method.parameters.isEmpty()
        }
        val rebuildNotifyIndex = rebuild.implementation!!.instructions.indexOfLast { instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ref?.name == "notifyDataSetChanged" && ref.parameterTypes.isEmpty()
        }
        check(rebuildNotifyIndex >= 0) { "$version legacy board rebuild has no final notify" }
        rebuild.addInstructionsWithLabels(rebuildNotifyIndex,
            "invoke-static/range {p0 .. p0}, " +
                "Lapp/morphe/extension/chmate/ReadThreadsFirst;->reorderLegacyAdapter(Ljava/lang/Object;)V")
        if (version == "0.8.10.191 dev") {
            val dialog = mutableClassDefBy("Lo/onRewardedAdDisplayFailed;")
                .methods.single { it.name == "onViewCreated" && it.parameters.size == 2 }
            val returnIndex = dialog.implementation!!.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            check(returnIndex >= 0) { "191 display dialog has no return" }
            dialog.addInstructionsWithLabels(returnIndex,
                "invoke-static/range {p0 .. p0}, Lapp/morphe/extension/chmate/ReadThreadsFirst;->attachLegacyDialog(Ljava/lang/Object;)V")
        } else {
            val settingsContent = mutableClassDefBy("Lo/enB54;").methods.single { method ->
                method.implementation?.instructions?.any { instruction ->
                    val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.definingClass == "Lo/setUserAgentString;" && ref.name == "b" &&
                        ref.parameterTypes.size == 9
                } == true
            }
            // Each board-type branch closes its inner Compose scope after its
            // last checkbox. Insert before that close so the row appears last
            // in both branches (and is not bypassed by a branch target).
            val instructions = settingsContent.implementation!!.instructions
            val checkboxes = instructions.withIndex().filter { (_, instruction) ->
                val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == "Lo/setUserAgentString;" && ref.name == "b" &&
                    ref.parameterTypes.size == 9
            }
            check(checkboxes.size == 8) { "226 display-setting checkbox layout changed: ${checkboxes.size}" }
            for (lastCheckbox in listOf(checkboxes[5], checkboxes[7]).asReversed()) {
                val call = lastCheckbox.value as? RegisterRangeInstruction
                    ?: error("226 display checkbox invocation is not a range")
                val composerRegister = call.startRegister + 6
                val close = (lastCheckbox.index + 1 until instructions.size).firstOrNull { index ->
                    val ref = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.definingClass == "Lo/getValue;" && ref.name == "i" &&
                        ref.returnType == "V" && ref.parameterTypes.isEmpty()
                } ?: error("226 board-type Compose scope close missing")
                settingsContent.addInstructionsWithLabels(close,
                    "invoke-static/range {v$composerRegister .. v$composerRegister}, " +
                        "Lapp/morphe/extension/chmate/ReadThreadsFirst;->render226(Ljava/lang/Object;)V")
            }
        }
        return
    }
    if (version == "0.8.10.241") {
    val checkboxOwner = mutableClassDefBy("Lo/zaaj;")
    val compose = checkboxOwner.methods.single { method ->
        method.name == "invoke" && method.parameters.size == 3 && method.implementation != null
    }
    val instructions = compose.implementation!!.instructions
    val starLabel = instructions.indexOfFirst { instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Lo/SignInConnectionListener;" && ref.name == "l" && ref.parameterTypes.isEmpty()
    }
    check(starLabel >= 0) { "241 board display-settings star label missing" }
    val checkboxIndex = (starLabel + 1 until instructions.size).lastOrNull { index ->
        val ref = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Lo/zaak;" && ref.name == "e" && ref.parameterTypes.size == 5
    } ?: error("241 board display-settings checkbox missing")
    val checkboxCall = instructions[checkboxIndex] as? FiveRegisterInstruction
        ?: error("241 board display-settings checkbox register format changed")
    val composerRegister = checkboxCall.registerF
    compose.addInstructionsWithLabels(
        checkboxIndex + 1,
        "invoke-static/range {v$composerRegister .. v$composerRegister}, " +
            "Lapp/morphe/extension/chmate/ReadThreadsFirst;->render(Ljava/lang/Object;)V",
    )
    } else if (version == "0.8.10.242 dev" || version == "0.8.10.243 dev") {
        if (version == "0.8.10.242 dev") {
            val checkItem = mutableClassDefBy("Lo/zzaxj;").methods.single { method ->
                method.name == "b" && method.returnType == "V" &&
                    method.parameters.size == 3 && method.implementation != null
            }
            val composeScope = checkItem.implementation!!.instructions.indexOfFirst { instruction ->
                val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == "Lo/Y;" && ref.name == "a" &&
                    ref.returnType == "Lo/Y;"
            }
            check(composeScope >= 0) { "242 setting Compose scope missing" }
            checkItem.addInstructionsWithLabels(composeScope + 2,
                "invoke-static {p0}, " +
                    "Lapp/morphe/extension/chmate/ReadThreadsFirst;->syncCompose242CheckItem(Ljava/lang/Object;)V")
            val checkbox = mutableClassDefBy("Lo/zzaxz;").methods.single { method ->
                method.name == "a" && method.returnType == "V" &&
                    method.parameters.map(CharSequence::toString) == listOf(
                        "Lo/zzajk;", "Z", "I", "Lo/zzcbx;", "Lo/Y;", "I")
            }
            val checkboxScope = checkbox.implementation!!.instructions.indexOfFirst { instruction ->
                val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == "Lo/Y;" && ref.name == "a" &&
                    ref.returnType == "Lo/Y;"
            }
            check(checkboxScope >= 0) { "242 checkbox Compose scope missing" }
            checkbox.addInstructionsWithLabels(checkboxScope + 2,
                "invoke-static {p2, p1}, " +
                    "Lapp/morphe/extension/chmate/ReadThreadsFirst;->compose242CheckedForLabel(IZ)Z\n" +
                    "move-result p1")
        }
        val builderType = if (version == "0.8.10.242 dev") "Lo/zzaxz;" else "Lo/zzenf;"
        val builderName = if (version == "0.8.10.242 dev") "a" else "b"
        val builder = mutableClassDefBy(builderType).methods.single { method ->
            method.name == builderName && method.returnType == "Ljava/util/List;" &&
                method.parameters.size == 4 &&
                method.parameters[2].toString() ==
                    "Ljp/syoboi/a2chMate/fragment/dialog/ThreadListSettingDialogViewModel;"
        }
        val returns = builder.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_OBJECT }.asReversed()
        check(returns.isNotEmpty()) { "$version display-setting builder has no return" }
        for ((index, instruction) in returns) {
            val register = (instruction as OneRegisterInstruction).registerA
            builder.addInstructionsWithLabels(index,
                "invoke-static/range {v$register .. v$register}, " +
                    "Lapp/morphe/extension/chmate/ReadThreadsFirst;->appendComposeSetting(Ljava/util/List;)V")
        }
    }

    val viewModel = mutableClassDefBy("Ljp/syoboi/a2chMate/ui/threadlist/ThreadListViewModel;")
    val mappingNames = when (version) {
        "0.8.10.241" -> listOf("a", "c")
        "0.8.10.242 dev" -> listOf("b", "d")
        "0.8.10.243 dev" -> listOf("c", "e")
        else -> error("Unsupported thread-list mapping: $version")
    }
    for (name in mappingNames) {
        val applyBookmarks = viewModel.methods.single { method ->
            method.name == name && method.returnType == "Ljava/util/List;" &&
                method.parameters.map(CharSequence::toString) == listOf(
                    "Ljp/syoboi/a2chMate/ui/threadlist/ThreadListViewModel;",
                    "Ljava/util/List;", "Ljava/util/Map;",
                )
        }
        val returns = applyBookmarks.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_OBJECT }.asReversed()
        check(returns.isNotEmpty()) { "$version bookmark mapping $name has no return" }
        for ((index, instruction) in returns) {
            val register = (instruction as OneRegisterInstruction).registerA
            applyBookmarks.addInstructionsWithLabels(
                index,
                "invoke-static/range {v$register .. v$register}, " +
                "Lapp/morphe/extension/chmate/ReadThreadsFirst;->reorderMapped(Ljava/util/List;)V",
            )
        }
    }
}

/** Suppress only the NG display bucket, never the underlying NG rules or source list. */
private fun BytecodePatchContext.patchNgThreadGroupVisibility(version: String) {
    val owner = when (version) {
        "0.8.10.191 dev" -> "Lo/m8a;"
        "0.8.10.226 dev" -> "Lo/getWriteBytesTotal\$RemoteActionCompatParcelizer;"
        "0.8.10.241" -> "Ljp/syoboi/a2chMate/ui/threadlist/ThreadListViewModel\$RemoteActionCompatParcelizer;"
        "0.8.10.242 dev" -> "Ljp/syoboi/a2chMate/ui/threadlist/ThreadListViewModel\$ComponentActivity;"
        else -> error("Unsupported NG thread display version: $version")
    }
    val legacy191 = version == "0.8.10.191 dev"
    val list = if (legacy191) "Ljava/util/ArrayList;" else "Ljava/util/List;"
    val parameters = when (version) {
        "0.8.10.191 dev" -> listOf(list, list, "Z", "Lo/onRewardedVideoCompleted;", "Z")
        "0.8.10.226 dev" -> listOf(list, list, "Z", list, "Z")
        else -> listOf(list, list, list, "Z")
    }
    val method = mutableClassDefBy(owner).methods.single {
        it.accessFlags and 8 != 0 && it.parameterTypes.map(CharSequence::toString) == parameters
    }
    method.addInstructionsWithLabels(0, """
        invoke-static/range {p1 .. p1}, $EXTENSION->ngThreadsForDisplay(Ljava/util/List;)Ljava/util/List;
        move-result-object p1
        ${if (legacy191) "check-cast p1, Ljava/util/ArrayList;" else ""}
    """.trimIndent())
    println("NG thread group visibility: $version -> $owner")
}

/** Keep every Unit event alive through ChMate's stateIn in the unread total. */
private fun BytecodePatchContext.patchUnreadToolbarCount(version: String) {
    val legacy = version == "0.8.10.241"
    if (!legacy && version != "0.8.10.242 dev") return
    val owner = "Ljp/syoboi/a2chMate/ui/threadlist/ThreadListViewModel"
    val flow = if (legacy) "Lo/zzayl;" else "Lo/zzcol;"
    val stateInOwner = if (legacy) "Lo/zzazCC;" else "Lo/zzcoo;"
    val stateType = if (legacy) "Lo/zzazi;" else "Lo/zzcpr;"
    val sourceSuffix = if (legacy) "addOnConfigurationChangedListener" else "addContentView"
    val combineSuffix = if (legacy) "addOnPictureInPictureModeChangedListener" else "addOnUserLeaveHintListener"
    val source = mutableClassDefBy("$owner\$$sourceSuffix;").methods.single { it.name == "invokeSuspend" }
    val instructions = source.implementation!!.instructions
    val stateIn = instructions.withIndex().filter { (_, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == stateInOwner && ref.parameterTypes.size == 4 &&
            ref.parameterTypes.first().toString() == flow && ref.returnType == stateType
    }.single()
    val call = stateIn.value as? FiveRegisterInstruction
        ?: error("$version unread-count stateIn register layout changed")
    // The fourth argument is the initial Unit; reuse it as scratch, then restore
    // it before stateIn. No new register or coroutine state is necessary.
    val unit = if (legacy) "Lo/zzagp;" else "Lo/zzbwq;"
    source.addInstructionsWithLabels(stateIn.index, """
        const-string v${call.registerF}, "${flow.substring(1, flow.length - 1).replace('/', '.')}"
        invoke-static {v${call.registerC}, v${call.registerF}}, Lapp/morphe/extension/chmate/ReadCountEvents;->distinct(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
        move-result-object v${call.registerC}
        check-cast v${call.registerC}, $flow
        sget-object v${call.registerF}, $unit->INSTANCE:$unit
    """.trimIndent())
    // The combine ignores its event argument. Its bridge must accept the unique
    // tokens as well as the initial Unit instead of casting every token to Unit.
    val combine = mutableClassDefBy("$owner\$$combineSuffix;").methods.single {
        it.parameters.size == 4 && it.returnType == "Ljava/lang/Object;"
    }
    val cast = combine.implementation!!.instructions.withIndex().filter { (_, instruction) ->
        instruction.opcode == Opcode.CHECK_CAST &&
            ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type == unit
    }.single()
    combine.replaceInstruction(cast.index, "nop")
}

private val haiagaruBytecodePatch = bytecodePatch {
    compatibleWith(chMateCompatibility)
    extendWithAll { ChMateExtensionIsolation.openAll() }

    execute {
        val profile = profileFor(packageMetadata.versionName)
        patchNativeToolTabs(packageMetadata.versionName)
        patchReadingPosition(packageMetadata.versionName)
        patchUnreadToolbarCount(packageMetadata.versionName)
        patchHiddenNgUnread(packageMetadata.versionName)
        patchHomeBoardMultiSelect(packageMetadata.versionName, profile.homeFragmentClass)
        if (packageMetadata.versionName == "0.8.10.242 dev") {
            mutableClassDefBy(profile.homeFragmentClass).methods.single {
                it.name == "onViewCreated" && it.parameterTypes == listOf("Landroid/view/View;", "Landroid/os/Bundle;")
            }.addInstruction(0,"invoke-static {p0, p1}, Lapp/morphe/extension/chmate/HomeSelectionBar;->bind(Ljava/lang/Object;Landroid/view/View;)V")
        }

        val readManager = when (packageMetadata.versionName) {
            "0.8.10.241" -> "Lo/hLn11;"
            "0.8.10.242 dev" -> "Lo/VN21;"
            else -> null
        }
        readManager?.let { type ->
            mutableClassDefBy(type).methods.single {
                it.name == "<init>" && it.parameters.isEmpty()
            }.addBeforeEveryReturn(
                "invoke-static/range { p0 .. p0 }, $EXTENSION->captureReadCountManager(Ljava/lang/Object;)V"
            )
        }

        patchRestoredDatRows()
        patchEdgeArchiveToolbar(profile, packageMetadata.versionName)
        patchQuickFilterToolbar(packageMetadata.versionName)
        patchPopularReplies(packageMetadata.versionName)
        if (packageMetadata.versionName == "0.8.10.191 dev") {
            patchNativeRestore191()
            patchConsumedPopupMenu191()
            patchSearchThreadForwardToTablet191()
        }
        if (packageMetadata.versionName == "0.8.10.226 dev") {
            patchExternalBrowserLongPress226()
            patchSearchThreadForwardToTablet226()
            patchTabletTabSelection226()
        }
        if (packageMetadata.versionName in listOf("0.8.10.191 dev", "0.8.10.226 dev", "0.8.10.241", "0.8.10.242 dev")) {
            patchReadThreadsFirst(packageMetadata.versionName)
            patchNgThreadGroupVisibility(packageMetadata.versionName)
            patchThreadTitleSpacing(packageMetadata.versionName)
            patchPostEditorTextSize(packageMetadata.versionName)
            patchNgBoardScopes()
        }

        patchNgRegistrationLimit()
        patchPostedThreadDisplayCount(packageMetadata.versionName)
        patchPostHistoryRetentionCount(packageMetadata.versionName)
        patchBrowsingAndSearchHistory(packageMetadata.versionName)
        patchGroupedBrowsingHistory(packageMetadata.versionName)
        patchNativeDrawDates(packageMetadata.versionName)
        patchNativeUiTheme(packageMetadata.versionName)
        patchFavoriteThreads(packageMetadata.versionName)
        patchHomeRefreshKeywords(packageMetadata.versionName)
        patchClipboardHistory(packageMetadata.versionName)
        patchNgEditGesture(packageMetadata.versionName)
        patchViewingUserAgent(packageMetadata.versionName)
        patchToolbarIcons(packageMetadata.versionName)
        patchHiddenNgMenu(packageMetadata.versionName)
        patchNativeUploadHistory(packageMetadata.versionName)
        patchPostingOverflowMenu(packageMetadata.versionName, "MediaUploadHosts", "upload_hosts")
        patchResponseArchive(packageMetadata.versionName)
        patchArchiveOrigins(packageMetadata.versionName)
        patchThreadArchiveOrder(packageMetadata.versionName)
        patchRelatedThreads(packageMetadata.versionName)
        patchThreadKeywordOrder(packageMetadata.versionName)

        // ChMate 226/241 remove the device-info footer with a greedy regular
        // expression before deciding whether the user wrote any other text.
        // Text appended after the footer is swallowed as well, so a non-empty
        // post can be rejected as "device information only".  Let the posting
        // endpoint perform the authoritative body validation instead.
        patchPostPreflightValidation(packageMetadata.versionName)
        if (packageMetadata.versionName == "0.8.10.191 dev") {
            patchLegacyExternalEmojiPostBody()
        } else {
            patchExternalEmojiPostCopy(packageMetadata.versionName)
        }

        mutableClassDefBy(profile.providerClass).methods.single { method ->
            method.name == "onCreate"
                && method.returnType == "Z"
                && method.parameters.isEmpty()
        }.addInstructionsWithLabels(
            0,
            """
                invoke-static/range { p0 .. p0 }, $EXTENSION->onProviderCreate(Landroid/content/ContentProvider;)V
                invoke-static { }, $EXTENSION->installSignatureSpoof()V
            """
        )
        profile.providerStartupTrapClass?.let { startupTrapClass ->
            mutableClassDefBy(startupTrapClass).methods.single { method ->
                method.returnType == "Ljava/lang/Object;"
                    && method.parameters.isEmpty()
            }.returnProviderStartupDelegate(profile)
        }

        val applicationOnCreate = mutableClassDefBy(profile.applicationClass).methods.single { method ->
            method.name == "onCreate"
                && method.returnType == "V"
                && method.parameters.isEmpty()
        }
        applicationOnCreate.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, " +
                "$EXTENSION->onApplicationPreCreate(Landroid/app/Application;)V"
        )
        applicationOnCreate.addBeforeEveryReturn(
            "invoke-static/range { p0 .. p0 }, $EXTENSION->onApplicationCreate(Landroid/app/Application;)V"
        )
        // A private media worker must not initialize native ChMate/Firebase singletons.
        // FirebaseInitProvider runs only in the main process; native onCreate would crash here.
        check(applicationOnCreate.implementation!!.registerCount > 1)
        val mainApplicationEntry = applicationOnCreate.implementation!!.instructions.first()
        applicationOnCreate.addInstructionsWithLabels(0, """
            invoke-static/range {p0 .. p0}, Lapp/morphe/extension/chmate/VideoFrameDecodeService;->decoderProcess(Landroid/content/Context;)Z
            move-result v0
            if-eqz v0, :haiagaru_main_application
            invoke-super/range {p0 .. p0}, ${mutableClassDefBy(profile.applicationClass).superclass}->onCreate()V
            return-void
        """.trimIndent(), ExternalLabel("haiagaru_main_application", mainApplicationEntry))
        // The URL/DAT recovery entry exists in all supported generations, but
        // 0.8.10.241 and 0.8.10.243 route lifecycle creation through the Hilt
        // activity base class while 0.8.10.191 keeps it on the concrete activity.
        patchLegacyThreadUrlEntry(profile)
        patchFinishedLegacyThreadLaunchGuard()
        if (packageMetadata.versionName in setOf(
                "0.8.10.191 dev",
                "0.8.10.226 dev",
                "0.8.10.242 dev",
                "0.8.10.243 dev",
            )
        ) {
            patchLegacyTabletThreadUrlEntry(packageMetadata.versionName)
        }
        patchLegacyPlusFeatureActivation(profile)
        if (packageMetadata.versionName == "0.8.10.243 dev") {
            patchImageSelectionResult()
            patchImageSelectionReflectionTrap()
            patchImageUploadIntegrityComparison()
        }
        SettingsOnResumeFingerprint.method.addBeforeEveryReturn(
            "invoke-static/range { p0 .. p0 }, $EXTENSION->onSettingsResume(Landroid/app/Activity;)V"
        )
        if (packageMetadata.versionName == "0.8.10.191 dev") {
            patchLegacyFragmentBannerDiscovery()
            patchLegacyThreadListAd("Lo/m9ExternalSyntheticLambda1;")
            patchLegacyImageUploadTempName()
            patchLegacyImageUploadCall()
        } else {
            // Inject while p1 is still guaranteed to contain the Fragment root; the
            // extension posts its scans to the view queue, so child views are inspected
            // after construction.
            mutableClassDefBy(profile.homeFragmentClass).methods.single { method ->
                method.name == "onViewCreated"
                    && method.returnType == "V"
                    && method.parameters.map(CharSequence::toString) ==
                    listOf("Landroid/view/View;", "Landroid/os/Bundle;")
            }.addInstruction(
                0,
                "invoke-static/range { p1 .. p1 }, $EXTENSION->hideHomeBanner(Landroid/view/View;)V"
            )
        }
        mutableClassDefBy(
            "Lcom/franmontiel/persistentcookiejar/persistence/SharedPrefsCookiePersistor;"
        ).methods.single { method ->
            method.name == profile.cookieClearMethod
                && method.returnType == "V"
                && method.parameters.isEmpty()
        }.addBeforeEveryReturn(
            "invoke-static { }, $EXTENSION->removeMonaKey()V"
        )

        // ChMate performs initialization and a signature check from this provider before
        // Application.onCreate. Preserve the provider and all initialization, and convert only
        // the check's numeric RuntimeException rejection into the same delegate return used by
        // its successful path.
        if (profile.patchSignatureWrapper) {
            val signatureMethod = mutableClassDefBy(profile.signatureClass).methods.single { method ->
                method.name == profile.signatureMethod
                    && method.returnType == "Ljava/lang/Object;"
                    && method.parameters.isEmpty()
            }
            if (packageMetadata.versionName == "0.8.10.243 dev") {
                signatureMethod.returnSignatureDelegate(profile)
            } else {
                signatureMethod.ignoreSignatureRejection(profile)
            }
            if (profile.signatureDirectWrapperBypass) {
                mutableClassDefBy(profile.signatureSuperType).methods.single { method ->
                    method.name == profile.signatureDelegateMethod
                        && method.returnType == "Ljava/lang/Object;"
                        && method.parameters.isEmpty()
                }.bypassSignatureFailureBranches()
            }
        }

        profile.viewModelFactoryClass?.let { viewModelFactoryClass ->
            mutableClassDefBy(viewModelFactoryClass).methods.single { method ->
                method.name == "get"
                    && method.returnType == "Ljava/lang/Object;"
                    && method.parameters.isEmpty()
            }.bypassTamperTrap(profile)
        }
        profile.settingsViewModelClass?.let { viewModelClass ->
            mutableClassDefBy(viewModelClass).methods.single { method ->
                method.name == "<init>"
                    && method.returnType == "V"
                    && method.parameters.map(CharSequence::toString) ==
                    listOf("Landroid/app/Application;")
            }.bypassLegacyViewModelTamperTrap()
        }
        if (profile.viewModelTrapKind != ViewModelTrapKind.NONE
            || profile.settingsViewModelClass != null
        ) {
            SettingsOnCreateFingerprint.method.bypassSettingsTamperTrap(profile)
            if (profile.hasHiltSettings) {
                HiltSettingsOnCreateFingerprint.method.bypassHiltSettingsTamperTrap(profile)
            }
        }
        patchDistributedIntegrityComparisons(
            includeAllObfuscatedClasses = packageMetadata.versionName == "0.8.10.191 dev"
        )
        patchCommonAdSdkInitialization()

        buildList {
            add("Lcom/amazon/device/ads/DTBAdRequest;")
            if (profile.hasLevelPlayBanner) {
                add("Lcom/unity3d/mediation/banner/LevelPlayBannerAdView;")
            }
        }.forEach { classType ->
            mutableClassDefBy(classType).methods
                .filter { it.name == "loadAd" && it.returnType == "V" }
                .forEach { it.addHideAdsGuard() }
        }

        if (profile.hasLevelPlayBanner) {
            patchLevelPlayTrackerInitialization()

            mutableClassDefBy("Lcom/unity3d/mediation/banner/LevelPlayBannerAdView;")
                .methods
                .filter { it.name == "<init>" }
                .forEach {
                    it.addBeforeEveryReturn(
                        "invoke-static/range { p0 .. p0 }, $EXTENSION->hideAdView(Landroid/view/View;)V"
                    )
                }
        }

        // The exact class is version-specific, but each target was matched by the same
        // FrameLayout/ad-placement/load-method structure instead of by its obfuscated name.
        mutableClassDefBy(profile.homeAdClass).methods.forEach { method ->
            when {
                method.name == "<init>" -> method.addBeforeEveryReturn(
                    "invoke-static/range { p0 .. p0 }, $EXTENSION->hideAdView(Landroid/view/View;)V"
                )
                profile.homeAdLoadMethod != null
                    && method.name == profile.homeAdLoadMethod
                    && method.returnType == "V"
                    && method.parameters.isEmpty() ->
                    method.addHideAdsViewGuard()
            }
        }

        when (packageMetadata.versionName) {
            "0.8.10.191 dev" -> {
                patchLegacySettingsPaneDivider("Lo/pq;")
                patchLegacyExternalWebSearch191()
                patchLegacyBeResponseBody(
                    "Lo/processAdDisplayErrorPostbackForUserError;", "c")
                patchProgrammableNg191()
                patchPreIoHissiMenu(
                    "Lo/setExtraParameter;", "d",
                    "Lo/processAdDisplayErrorPostbackForUserError;",
                    "Lo/setExtraParameter\$RemoteActionCompatParcelizer;",
                )
                patchBbsMenuUrl("a", "Lo/a7a\$read;")
                patchLegacy5chIoCompatibility()
                patchLegacyBeSpanBoundary("Lo/o8;")
                patchLegacyTalkWriteUrlParsing()
                patchLegacyTalkDatLoading()
                patchLegacyTalkAuthIntegrity()
                patchLegacyCellularNetworkSelection()
                patchLegacyCellularSocketRefresh()
            }
            "0.8.10.226 dev" -> {
                patchLegacySettingsPaneDivider("Lo/onDenied;")
                patchUpliftIntegrityComparison("Lo/OpenJSSEPlatformCompanion;", "d", "Lo/OpenJSSEPlatformCompanion\$IconCompatParcelizer;")
                patchUpliftIntegrityComparison("Lo/OpenJSSEPlatformCompanion;", "j", "[Ljava/lang/Object;", returnType = "Ljava/lang/Object;")
                patchLiteralDiagnosticSubstring242(
                    "Lo/OpenJSSEPlatformCompanion;",
                    "1,30,null cannot be cast to non-null type " +
                        "jp.syoboi.a2chMate.bbs.a5ch.UpliftClient.LoginResult.Success",
                    5,
                )
                patchUpliftTokenExpiryArithmetic(
                    "Lo/OpenJSSEPlatformCompanion;", "d",
                    "Lo/OpenJSSEPlatformCompanion\$IconCompatParcelizer;", 653820,
                )
                patchAboutLogoThemeColor226()
                patchPreIoS2mSettingActivityIntegrityTrap()
                patchLegacyBeResponseBody("Lo/BouncyCastleSocketAdapterCompanion;", "d")
                patchProgrammableNg226()
                patchPreIoHissiMenu()
                patchBbsMenuUrl("a", "Lo/isInlineAdaptiveAdView\$read;")
                patchPreIoCellularNetworkSelection()
                patchPreIoCellularSocketRefresh()
                patchThreadBannerAdWrapper("Lo/TTVideoLandingPageLink2Activity1;")
                patchLegacyThreadListAd("Lo/listener;")
                patchPreIoTalkDatLoading()
                patchPreIoTalkPostIntegrity()
                patchPreIoImageUploadIntegrityTrap("Lo/fWG1;")
                patchPreIoImageSettingsIntegrityTrap("Lo/setMaintainOriginalImageBounds;")
                patchPreIoSettingsConstructorIntegrityTrap("Lo/setImageAssetsFolder;")
                patchBeAttachmentCompatibility("Lo/BouncyCastleSocketAdapterCompanion;")
                patchPreIoBeRendering(
                    parserClass = "Lo/getMaxLine;",
                    drawableClass = "Lo/getFlexDirection;",
                )
                patchLegacyBeSpanBoundary("Lo/getFlexLinesInternal;")
                patchPreIoUrlSpanAlignment("Lo/getMaxLine;")
                patchPreIoDomainCompatibility(
                    parseMethodName = "c",
                )
            }
            "0.8.10.243 dev" -> {
                patchUpliftIntegrityComparison("Lo/zzaai;", "e", "Lo/zzaai\$ComponentActivity;")
                patchUpliftIntegrityComparison("Lo/zzaah;", "d", "Lo/zzaai\$ComponentActivity;", "Lo/zzbus;", "J")
                patchLiteralDiagnosticSubstring242(
                    "Lo/zzaah;",
                    "30/22/1/null cannot be cast to non-null type " +
                        "jp.syoboi.a2chMate.bbs.a5ch.UpliftClient.LoginResult.Success",
                    8,
                )
                patchLegacyBeResponseBody("Lo/zzabv;", "j")
                patchProgrammableNgModern("Lo/zzdic;", "a", "c")
                patchPreIoHissiMenu("Lo/zzacz;", "c", "Lo/zzabv;", "Lo/zzacz\$write;")
                patchSetTextCalls()
                patchBbsMenuUrl("b", "Lo/StandardAndroidSocketAdapterCompanion\$RemoteActionCompatParcelizer;")
                patchModernThreadListAd()
                patchModernTalkDatLoading()
                patchModernTalkPostIntegrity()
                patchModernTalkIntegrityPrimitives()
            }
            "0.8.10.241" -> {
                patchLegacyBeResponseBody("Lo/setDislikeWidth;", "g")
                patchPreIoHissiMenu("Lo/lhA1;", "d", "Lo/setDislikeWidth;", "Lo/lhA1\$write;")
                patchSetTextCalls()
                patchBbsMenuUrl("c", "Lo/TaskRunnerCompanion\$ComponentActivity;")
                patchIoTalkDatLoading()
                patchIoTalkPostIntegrity()
                patchUpliftIntegrityComparison("Lo/VLj;", "c", "Lo/VLj\$ComponentActivity;")
                patchUpliftIntegrityComparison("Lo/VLj;", "c", "Lo/VLj\$ComponentActivity;", "Lo/getPaint;", "J")
                patchIoUpliftLoginCastMessage()
                patchIoUpliftTokenExpiryArithmetic()
                patchIoThreadRefreshCache()
            }
            "0.8.10.242 dev" -> {
                patchLegacyBeResponseBody("Lo/KeJ11;", "h")
                patchProgrammableNgModern("Lo/emptyToNull;", "c", "c")
                patchPreIoHissiMenu("Lo/kUGNk2;", "c", "Lo/KeJ11;", "Lo/kUGNk2\$ComponentActivity;")
                patchSetTextCalls()
                patchBbsMenuUrl("c", "Lo/getPlayProviderFactory\$ComponentActivity;")
                patchModernTalkDatLoading242()
                patchTalk242AuthenticationAndTokenCalls()
                patchModernTalkIntegrityPrimitives("Lo/GoogleApiSettingsBuilder;", "normalizeIntegrityState242")
                patchTalkPostDiagnostics242()
                patchUpliftPostingIntegrity242()
                patchUpliftLoginIntegrity242()
                patchImageUploadIntegrity242()
                patchLiteralDiagnosticSubstring242(
                    "Lo/getAdLogo;",
                    "3|18|null cannot be cast to non-null type " +
                        "jp.syoboi.a2chMate.bbs.a5ch.UpliftClient.LoginResult.Success",
                    5,
                )
                patchLiteralDiagnosticSubstring242(
                    "Ljp/syoboi/a2chMate/fragment/dialog/ThreadListSettingDialogViewModel;",
                    "20|21|31|22|6|threadQuickFilterManager",
                    14,
                )
            }
            else -> patchSetTextCalls()
        }
        if (packageMetadata.versionName == "0.8.10.241") {
            patchProgrammableNgModern("Lo/RewardedInterstitialAdLoadCallback;", "a", "a")
        }
        patchXPostPreviewBindings()
        patchDirectBodySelection(packageMetadata.versionName)
        patchTabletThreadHeaderAdSpace(packageMetadata.versionName)
        patchStringReplacement()
        patchShortThreadTopAlignment(packageMetadata.versionName)
        when (packageMetadata.versionName) {
            "0.8.10.191 dev" -> {
                EdgeSubjectUrl191Fingerprint.method.rewriteEdgeSubjectUrl()
                EdgeThreadMenu191Fingerprint.method.preserveEdgeReporterTitle("Lo/isReady;", "k")
                patchLegacyNextThreadTitleMatch191()
            }
            "0.8.10.226 dev" -> {
                EdgeSubjectUrl226Fingerprint.method.rewriteEdgeSubjectUrl()
                EdgeThreadMenu226Fingerprint.method.preserveEdgeReporterTitle("Lo/MessageInflater;", "m")
            }
            "0.8.10.241" -> EdgeSubjectUrl241Fingerprint.method.rewriteEdgeSubjectUrl()
            "0.8.10.242 dev" -> EdgeSubjectUrl242Fingerprint.method.rewriteEdgeSubjectUrl()
            "0.8.10.243 dev" -> EdgeSubjectUrlFingerprint.method.rewriteEdgeSubjectUrl()
        }
        patchEdgeReporterHistory(packageMetadata.versionName)
        patchImgurWebSessionUpload(packageMetadata.versionName)
        patchEdgeReporterDisplay(packageMetadata.versionName)
        patchEdgeReporterTitleCopy(packageMetadata.versionName)
        patchWacchoiLongPressMenu(packageMetadata.versionName)
        patchImageListResolvedMedia(packageMetadata.versionName)
        patchThumbnailClickAttachments(packageMetadata.versionName)
        patchNativeImageCloseLifecycle(packageMetadata.versionName)
        patchThumbnailRebind242(packageMetadata.versionName)
        if (packageMetadata.versionName in setOf("0.8.10.191 dev", "0.8.10.226 dev", "0.8.10.241", "0.8.10.242 dev")) {
            patchPostVersionInfo(profile.applicationClass)
        }
        patchImageViewerRotationButton(packageMetadata.versionName)
        patchThreadSearchText(packageMetadata.versionName)
        patchLargeImageAlignment(packageMetadata.versionName)
        patchLegacyAutoReload(packageMetadata.versionName)
        patchAutoScrollControlColors(packageMetadata.versionName)
        patchXVideoAttachmentProjection()
        patchHissiExternalIntentBoundaries()
        patchHttpsTransport()
        patchNativeUpdatePolicy(packageMetadata.versionName)
        patchThreadRefreshValidators(packageMetadata.versionName)
        patchPatrolImages(packageMetadata.versionName)
        patchPatrolInterval(packageMetadata.versionName)
        patchExternalBoardAuth(packageMetadata.versionName)
        patchBoardCookies(packageMetadata.versionName)
        patchBeAutoLogout(packageMetadata.versionName)
        patchExternalBoardEditor(packageMetadata.versionName)
        patchPosterHighlight(packageMetadata.versionName)
    }
}

/**
 * The 226 response-screen toolbar's long-press builds a URL and selects the
 * first ACTION_VIEW target outside its own package. A second ChMate install
 * with a renamed package is therefore mistaken for an external browser.
 * Remove other ChMate thread activities from that candidate list before the
 * stock selection logic runs; leave all real external targets untouched.
 */
private fun BytecodePatchContext.patchExternalBrowserLongPress226() {
    val fragment = mutableClassDefBy("Ljp/syoboi/a2chMate/ui/reslist/ResListFragment;")
    val method = fragment.methods.single { candidate ->
        candidate.name == "onLongClick"
            && candidate.returnType == "Z"
            && candidate.parameters.map(CharSequence::toString) ==
                listOf("Landroid/view/View;")
    }
    val instructions = method.implementation?.instructions?.toList()
        ?: error("ChMate 226 response-screen long-press has no implementation")
    val queries = instructions.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@mapIndexedNotNull null
        if (reference.definingClass == "Landroid/content/pm/PackageManager;"
            && reference.name == "queryIntentActivities"
            && reference.returnType == "Ljava/util/List;"
            && reference.parameterTypes.map(CharSequence::toString) ==
                listOf("Landroid/content/Intent;", "I")
        ) index else null
    }
    check(queries.size == 1) {
        "ChMate 226 external-thread long-press resolver changed (found ${queries.size})"
    }
    val resultInstruction = instructions.getOrNull(queries.single() + 1)
    val resultRegister = (resultInstruction as? OneRegisterInstruction)?.registerA
        ?.takeIf { resultInstruction.opcode == Opcode.MOVE_RESULT_OBJECT }
        ?: error("ChMate 226 external-thread resolver result register changed")
    check(resultInstruction.opcode == Opcode.MOVE_RESULT_OBJECT) {
        "ChMate 226 external-thread resolver result register changed"
    }
    fragment.findMutableMethodOf(method).addInstructionsWithLabels(
        queries.single() + 2,
        "invoke-static/range {v$resultRegister .. v$resultRegister}, " +
            "$EXTENSION->excludeChMateThreadActivities(Ljava/util/List;)Ljava/util/List;\n" +
            "move-result-object v$resultRegister",
    )
    println("ChMate 226 long-press browser candidates exclude other ChMate thread activities")
}

/**
 * SearchActivity explicitly marks a selected thread with
 * forwardTabletHome=false. In tablet-home mode this prevents the normal
 * ResListActivity forwarding path, leaving the search result surface open
 * while the thread pane stays blank. Use ChMate's own tablet-mode predicate
 * for this flag: phones retain the original non-forwarding behavior.
 */
private fun BytecodePatchContext.patchSearchThreadForwardToTablet226() {
    val owner = mutableClassDefBy("Ljp/syoboi/a2chMate/RoidonApp\$RemoteActionCompatParcelizer;")
    val method = owner.methods.single { candidate ->
        candidate.name == "d"
            && candidate.returnType == "V"
            && candidate.parameters.map(CharSequence::toString) == listOf(
                "Landroid/app/Activity;",
                "Landroidx/fragment/app/Fragment;",
                "I",
                "J",
                "Ljava/lang/String;",
                "Z",
                "B",
                "Landroid/os/Bundle;",
            )
    }
    val instructions = method.implementation?.instructions?.toList()
        ?: error("ChMate 226 search-to-thread launcher has no implementation")
    val candidates = instructions.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@mapIndexedNotNull null
        if (reference.definingClass != "Landroid/content/Intent;"
            || reference.name != "putExtra"
            || reference.returnType != "Landroid/content/Intent;"
            || reference.parameterTypes.map(CharSequence::toString) !=
                listOf("Ljava/lang/String;", "Z")
            || instructions.subList(maxOf(0, index - 6), index).none { previous ->
                (previous as? ReferenceInstruction)?.reference.let { it as? StringReference }
                    ?.string == "forwardTabletHome"
            }
        ) return@mapIndexedNotNull null
        index to instruction
    }
    check(candidates.size == 1) {
        "ChMate 226 search-to-thread forwarding flag changed (found ${candidates.size})"
    }
    val (invokeIndex, invokeInstruction) = candidates.single()
    val flagRegister = when (invokeInstruction) {
        is FiveRegisterInstruction -> invokeInstruction.registerE
        is RegisterRangeInstruction -> {
            check(invokeInstruction.registerCount == 3) {
                "ChMate 226 forwardTabletHome putExtra register range changed"
            }
            invokeInstruction.startRegister + 2
        }
        else -> error("ChMate 226 forwardTabletHome putExtra invoke format changed")
    }
    owner.findMutableMethodOf(method).addInstructionsWithLabels(
        invokeIndex,
        "invoke-static/range {p0 .. p0}, Ljp/syoboi/a2chMate/Prefs;->a(Landroid/content/Context;)Z\n" +
            "move-result v$flagRegister",
    )
    println("ChMate 226 search results forward selected threads to TabletHome when enabled")
}

/** ChMate 191 uses an obfuscated launcher and the older Prefs.e tablet check. */
private fun BytecodePatchContext.patchSearchThreadForwardToTablet191() {
    val owner = mutableClassDefBy("Lo/lo;")
    val candidates = owner.methods.filter { candidate ->
        if (candidate.returnType != "V" || candidate.parameterTypes.map(CharSequence::toString) !=
            listOf("Landroid/app/Activity;", "Lo/r8lambdahIGIGCNpKpFqE0lgDli724UCuDM;", "I", "J", "Ljava/lang/String;", "Z", "B", "Landroid/os/Bundle;")) {
            return@filter false
        }
        val instructions = candidate.implementation?.instructions ?: return@filter false
        instructions.any { instruction ->
            (instruction as? ReferenceInstruction)?.reference.let { it as? StringReference }
                ?.string == "forwardTabletHome"
        } && instructions.any { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass == "Landroid/content/Intent;"
                && reference.name == "putExtra"
                && reference.returnType == "Landroid/content/Intent;"
                && reference.parameterTypes.map(CharSequence::toString) ==
                    listOf("Ljava/lang/String;", "Z")
        }
    }
    check(candidates.size == 1) {
        "ChMate 191 search-to-thread forwarding launcher changed (found ${candidates.size})"
    }
    val method = candidates.single()
    val instructions = method.implementation!!.instructions.toList()
    val call = instructions.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@mapIndexedNotNull null
        if (reference.definingClass == "Landroid/content/Intent;"
            && reference.name == "putExtra"
            && reference.returnType == "Landroid/content/Intent;"
            && reference.parameterTypes.map(CharSequence::toString) ==
                listOf("Ljava/lang/String;", "Z")
            && instructions.subList(maxOf(0, index - 6), index).any { previous ->
                (previous as? ReferenceInstruction)?.reference.let { it as? StringReference }
                    ?.string == "forwardTabletHome"
            }
        ) index to instruction else null
    }
    check(call.size == 1) { "ChMate 191 forwardTabletHome flag call changed" }
    val (invokeIndex, invokeInstruction) = call.single()
    val flagRegister = when (invokeInstruction) {
        is FiveRegisterInstruction -> invokeInstruction.registerE
        is RegisterRangeInstruction -> {
            check(invokeInstruction.registerCount == 3) {
                "ChMate 191 forwardTabletHome putExtra register range changed"
            }
            invokeInstruction.startRegister + 2
        }
        else -> error("ChMate 191 forwardTabletHome putExtra invoke format changed")
    }
    owner.findMutableMethodOf(method).addInstructionsWithLabels(
        invokeIndex,
        "invoke-static/range {p0 .. p0}, Ljp/syoboi/a2chMate/Prefs;->e(Landroid/content/Context;)Z\n" +
            "move-result v$flagRegister",
    )
    println("ChMate 191 search results forward selected threads to TabletHome when enabled")
}

/**
 * The 226 About screen renders its large ChMate wordmark with an explicit
 * zero color. Its copyright label already asks the active Compose theme for
 * foreground text color; use the same source for the wordmark so 夜 stays legible.
 */
private fun BytecodePatchContext.patchAboutLogoThemeColor226() {
    val about = mutableClassDefBy("Lo/getAdShowTime;")
    val method = about.methods.single { candidate ->
        candidate.name == "d"
            && candidate.returnType == "Lo/Ff11;"
            && candidate.implementation?.instructions?.any { instruction ->
                (instruction as? NarrowLiteralInstruction)?.narrowLiteral == 0x7f100048
            } == true
    }
    val calls = method.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        if (reference?.definingClass == "Lo/DtbSharedPreferences;"
            && reference.name == "d"
            && reference.returnType == "V"
        ) index else null
    }
    check(calls.size == 1) { "ChMate 226 About wordmark text call changed" }
    method.addInstructionsWithLabels(calls.single(), """
        invoke-static/range { p1 .. p1 }, Lo/setUrl;->c(Lo/getValue;)Lo/getLocation;
        move-result-object v2
        invoke-virtual { v2 }, Lo/getLocation;->P()J
        move-result-wide v2
    """.trimIndent())
}

/** A search has no result to return and must not share ChMate's activity task. */
private fun BytecodePatchContext.patchLegacyExternalWebSearch191() {
    val method = mutableClassDefBy("Lo/lo;").methods.single {
        it.name == "c" && it.returnType == "V" &&
            it.parameterTypes == listOf("Landroid/content/Context;", "Ljava/lang/String;")
    }
    check(method.implementation!!.instructions.any {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string ==
            "android.intent.action.WEB_SEARCH"
    }) { "191 web search launcher changed" }
    method.addInstructions(0, """
        invoke-static/range {p0 .. p1}, Lapp/morphe/extension/chmate/ExternalWebSearch;->open(Landroid/content/Context;Ljava/lang/String;)V
        return-void
    """.trimIndent())
}

/** Keep legacy settings dividers only at an on-screen pane boundary. */
private fun BytecodePatchContext.patchLegacySettingsPaneDivider(type: String) {
    val method = mutableClassDefBy(type).methods.single { it.name == "onViewCreated" }
    val calls = method.implementation!!.instructions.withIndex().filter { (_, instruction) ->
        (instruction as? ReferenceInstruction)?.reference.let { it as? MethodReference }?.let {
            it.definingClass == "Landroidx/slidingpanelayout/widget/SlidingPaneLayout;" &&
                it.name == "setShadowDrawableLeft"
        } == true
    }
    check(calls.size == 1) { "Legacy settings pane divider call not found: $type" }
    val (index, instruction) = calls.single()
    val call = instruction as FiveRegisterInstruction
    method.addInstructions(index, """
        invoke-static {v${call.registerC}, v${call.registerD}}, Lapp/morphe/extension/chmate/SettingsPaneDivider;->wrap(Landroid/view/View;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
        move-result-object v${call.registerD}
    """.trimIndent())
}

/**
 * 226's paid-option sync screen contains a certificate-dependent arithmetic
 * decoy in S2MSettingActivity's generated dispatch method. After re-signing,
 * its divisor becomes zero before the first sync listener is created.
 * Match the stable divide/allocation boundary, not generated callback names.
 */
private fun BytecodePatchContext.patchPreIoS2mSettingActivityIntegrityTrap() {
    val activity = mutableClassDefBy(
        "Ljp/syoboi/chmate2/ui/s2msetting/S2MSettingActivity;",
    )
    val method = activity.methods.single { candidate ->
        candidate.name == "e"
            && candidate.returnType == "Ljava/lang/Object;"
            && candidate.parameters.map(CharSequence::toString) ==
            listOf("[Ljava/lang/Object;")
    }
    val instructions = method.implementation?.instructions?.toList()
        ?: error("ChMate 226 S2MSettingActivity dispatch method has no implementation")
    // The integrity block ends with the calculated divisor immediately before
    // the first callback object is allocated.  Matching that stable instruction
    // boundary is more reliable than matching Yhp19/setTextClassifier, whose
    // generated names and constructor references are rewritten between APK
    // builds.  Keep a small window for dex writers that insert a move or nop.
    val divideIndex = instructions.indices.lastOrNull { index ->
        val opcode = instructions[index].opcode.name
        if (!opcode.startsWith("div-int")) {
            return@lastOrNull false
        }
        instructions.subList(index + 1, minOf(index + 4, instructions.size))
            .any { it.opcode.name == "new-instance" }
    } ?: error("ChMate 226 S2MSettingActivity sync divide trap was not found")

    val resultRegister = (instructions[divideIndex] as? ThreeRegisterInstruction)?.registerA
        ?: error("ChMate 226 S2MSettingActivity divide registers were not found")
    method.replaceInstruction(divideIndex, "const/4 v$resultRegister, 0x0")
}

/** Rewrites only the temporary PostData copy passed to the posting engine. */
private fun BytecodePatchContext.patchExternalEmojiPostCopy(version: String) {
    val postType = if (version == "0.8.10.226 dev")
        "Lo/setBorderWidth;" else "Ljp/syoboi/a2chMate/postdata/PostData;"
    val copyName = when (version) {
        "0.8.10.226 dev" -> "a"
        "0.8.10.242 dev" -> "d"
        else -> "e"
    }
    val editor = mutableClassDefBy("Ljp/syoboi/a2chMate/feature/resedit/ResEditFragment;")
    var patched = 0
    editor.methods.forEach { method ->
        val instructions = method.implementation?.instructions?.toList() ?: return@forEach
        val matches = instructions.indices.filter { index ->
            val reference = (instructions[index] as? ReferenceInstruction)?.reference
                as? MethodReference ?: return@filter false
            reference.definingClass == postType && reference.name == copyName
                && reference.returnType == postType
                && reference.parameterTypes.firstOrNull() == postType
                && instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
        }
        matches.asReversed().forEach { index ->
            val register = (instructions[index + 1] as OneRegisterInstruction).registerA
            method.addInstructionsWithLabels(index + 2, """
                invoke-static/range { v$register .. v$register }, $EXTENSION->prepareExternalEmojiPost(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v$register
                check-cast v$register, $postType
            """.trimIndent())
            patched++
        }
    }
    check(patched == 1) { "Expected one external post-copy boundary for $version, found $patched" }
}

/** 191 passes the URL and body as the first and fifth n7a constructor values. */
private fun BytecodePatchContext.patchLegacyExternalEmojiPostBody() {
    val editor = mutableClassDefBy("Lo/p9ExternalSyntheticLambda6;")
    var patched = 0
    editor.methods.forEach { method ->
        val instructions = method.implementation?.instructions?.toList() ?: return@forEach
        val matches = instructions.indices.filter { index ->
            val reference = (instructions[index] as? ReferenceInstruction)?.reference
                as? MethodReference ?: return@filter false
            reference.definingClass == "Lo/n7a;" && reference.name == "<init>"
                && reference.parameterTypes == List(9) { "Ljava/lang/String;" }
        }
        matches.asReversed().forEach { index ->
            val invocation = instructions[index] as? RegisterRangeInstruction
                ?: error("191 external post constructor did not use a register range")
            val bodyRegister = invocation.startRegister + 5
            // The source registers can exceed v15, so pass the existing adjacent
            // constructor arguments with invoke-static/range instead of the
            // four-bit non-range form.
            method.addInstructionsWithLabels(index, """
                invoke-static/range { v${invocation.startRegister + 1} .. v${invocation.startRegister + 9} }, $EXTENSION->prepareExternalEmojiBodyFromPostFields(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
                move-result-object v$bodyRegister
            """.trimIndent())
            patched++
        }
    }
    check(patched == 1) { "Expected one 191 external post constructor, found $patched" }
}

/**
 * ChMate 226 normally reuses the first cellular [android.net.Network] returned by
 * ConnectivityManager.getAllNetworks().  Android can leave a just-lost network in
 * that snapshot briefly; the SocketFactory created from it then fails with
 * "Binding socket to network N failed: EPERM".  A thread refresh happens to avoid
 * the race by rebuilding the client, which is why posting succeeds afterwards.
 *
 * Make the existing code take its requestNetwork() branch for every cellular post.
 * That branch waits for onAvailable and retains the NetworkCallback until the HTTP
 * operation finishes, so the selected network remains current and requested for
 * the lifetime of the post.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchPreIoCellularNetworkSelection() {
    val selector = mutableClassDefBy("Lo/accessisAvailablecp;").methods.single { method ->
        method.name == "d"
            && method.returnType == "Lo/zzdE;"
            && method.parameterTypes.map(CharSequence::toString) == listOf("Lo/zzdE;")
    }
    val instructions = selector.implementation?.instructions
        ?: error("ChMate 226 cellular network selector has no implementation")
    val snapshotCalls = instructions.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@mapIndexedNotNull null
        if (reference.definingClass == "Landroid/net/ConnectivityManager;"
            && reference.name == "getAllNetworks"
            && reference.returnType == "[Landroid/net/Network;"
            && reference.parameterTypes.isEmpty()
            && instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
        ) index else null
    }
    check(snapshotCalls.size == 1) {
        "Expected one ChMate 226 cellular network snapshot, found ${snapshotCalls.size}"
    }
    val resultRegister = (instructions[snapshotCalls.single() + 1] as OneRegisterInstruction).registerA
    val sizeRegister = selector.findFreeRegister(snapshotCalls.single() + 2)
    selector.addInstructionsWithLabels(
        snapshotCalls.single() + 2,
        """
            invoke-static {}, $EXTENSION->isCellularNetworkRefreshEnabled()Z
            move-result v$sizeRegister
            if-eqz v$sizeRegister, :haiagaru_keep_226_networks
            const/4 v$sizeRegister, 0x0
            new-array v$resultRegister, v$sizeRegister, [Landroid/net/Network;
            :haiagaru_keep_226_networks
            nop
        """.trimIndent(),
    )
}

/**
 * 191 has the same stale getAllNetworks() preference, but in the older
 * createDefault network builder. Keep the workaround runtime-toggleable so
 * disabling it restores the stock path without requiring a new patch.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacyCellularNetworkSelection() {
    val selector = mutableClassDefBy("Lo/createDefault;").methods.single { method ->
        method.name == "b"
            && method.returnType == "Lo/r8lambdaz0gPFulMuhJ_LGn4qb5HDvuDsis;"
            && method.parameterTypes.map(CharSequence::toString) == listOf(
                "Lo/r8lambdaz0gPFulMuhJ_LGn4qb5HDvuDsis;"
            )
    }
    val instructions = selector.implementation?.instructions
        ?: error("ChMate 191 cellular network selector has no implementation")
    val snapshotCalls = instructions.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@mapIndexedNotNull null
        if (reference.definingClass == "Landroid/net/ConnectivityManager;"
            && reference.name == "getAllNetworks"
            && reference.returnType == "[Landroid/net/Network;"
            && reference.parameterTypes.isEmpty()
            && instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
        ) index else null
    }
    check(snapshotCalls.size == 1) {
        "Expected one ChMate 191 cellular network snapshot, found ${snapshotCalls.size}"
    }
    val snapshotIndex = snapshotCalls.single()
    val resultRegister = (instructions[snapshotIndex + 1] as OneRegisterInstruction).registerA
    val scratchRegister = selector.findFreeRegister(snapshotIndex + 2)
    selector.addInstructionsWithLabels(
        snapshotIndex + 2,
        """
            invoke-static {}, $EXTENSION->isCellularNetworkRefreshEnabled()Z
            move-result v$scratchRegister
            if-eqz v$scratchRegister, :haiagaru_keep_191_networks
            const/4 v$scratchRegister, 0x0
            new-array v$resultRegister, v$scratchRegister, [Landroid/net/Network;
            :haiagaru_keep_191_networks
            nop
        """.trimIndent(),
    )
}

/**
 * The selector fix above still leaves the returned Network.SocketFactory fixed
 * for the complete request. Refresh that factory at each socket creation too;
 * Android 16 may invalidate the selected cellular Network between those points.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchPreIoCellularSocketRefresh() {
    val factory = mutableClassDefBy(
        "Lo/accessisAvailablecp\$RemoteActionCompatParcelizer;"
    )
    val methods = factory.methods.filter { method ->
        method.name == "createSocket" && method.returnType == "Ljava/net/Socket;"
    }
    check(methods.size == 5) {
        "Expected five ChMate 226 cellular socket methods, found ${methods.size}"
    }
    methods.single { method ->
        method.parameterTypes.map(CharSequence::toString) ==
            listOf("Ljava/lang/String;", "I")
    }.addInstructionsWithLabels(0, """
        iget-object v0, p0, Lo/accessisAvailablecp${'$'}RemoteActionCompatParcelizer;->d:Ljavax/net/SocketFactory;
        invoke-static {v0, p1, p2}, $EXTENSION->createCellularSocket(
            Ljavax/net/SocketFactory;Ljava/lang/String;I)Ljava/net/Socket;
        move-result-object p1
        return-object p1
    """.trimIndent())
    methods.single { method ->
        method.parameterTypes.map(CharSequence::toString) ==
            listOf("Ljava/lang/String;", "I", "Ljava/net/InetAddress;", "I")
    }.addInstructionsWithLabels(0, """
        iget-object v0, p0, Lo/accessisAvailablecp${'$'}RemoteActionCompatParcelizer;->d:Ljavax/net/SocketFactory;
        invoke-static {v0, p1, p2, p3, p4}, $EXTENSION->createCellularSocket(
            Ljavax/net/SocketFactory;Ljava/lang/String;ILjava/net/InetAddress;I)Ljava/net/Socket;
        move-result-object p1
        return-object p1
    """.trimIndent())
    methods.single { method ->
        method.parameterTypes.map(CharSequence::toString) ==
            listOf("Ljava/net/InetAddress;", "I")
    }.addInstructionsWithLabels(0, """
        iget-object v0, p0, Lo/accessisAvailablecp${'$'}RemoteActionCompatParcelizer;->d:Ljavax/net/SocketFactory;
        invoke-static {v0, p1, p2}, $EXTENSION->createCellularSocket(
            Ljavax/net/SocketFactory;Ljava/net/InetAddress;I)Ljava/net/Socket;
        move-result-object p1
        return-object p1
    """.trimIndent())
    methods.single { method ->
        method.parameterTypes.map(CharSequence::toString) ==
            listOf("Ljava/net/InetAddress;", "I", "Ljava/net/InetAddress;", "I")
    }.addInstructionsWithLabels(0, """
        iget-object v0, p0, Lo/accessisAvailablecp${'$'}RemoteActionCompatParcelizer;->d:Ljavax/net/SocketFactory;
        invoke-static {v0, p1, p2, p3, p4}, $EXTENSION->createCellularSocket(
            Ljavax/net/SocketFactory;Ljava/net/InetAddress;ILjava/net/InetAddress;I)Ljava/net/Socket;
        move-result-object p1
        return-object p1
    """.trimIndent())
    methods.single { method ->
        method.parameterTypes.map(CharSequence::toString) ==
            listOf("Ljava/net/Socket;", "Ljava/lang/String;", "I", "Z")
    }.addInstructionsWithLabels(0, """
        iget-object p1, p0, Lo/accessisAvailablecp${'$'}RemoteActionCompatParcelizer;->c:Ljavax/net/ssl/SSLSocketFactory;
        iget-object v0, p0, Lo/accessisAvailablecp${'$'}RemoteActionCompatParcelizer;->d:Ljavax/net/SocketFactory;
        invoke-static {v0, p2, p3}, $EXTENSION->createCellularSocket(
            Ljavax/net/SocketFactory;Ljava/lang/String;I)Ljava/net/Socket;
        move-result-object v0
        invoke-virtual {p1, v0, p2, p3, p4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(
            Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;
        move-result-object p1
        return-object p1
    """.trimIndent())
}

/** Refresh the five cellular socket overloads in 191's older wrapper. */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacyCellularSocketRefresh() {
    val factory = mutableClassDefBy("Lo/createDefault\$setContentView;")
    val methods = factory.methods.filter { method ->
        method.name == "createSocket" && method.returnType == "Ljava/net/Socket;"
    }
    check(methods.size == 5) {
        "Expected five ChMate 191 cellular socket methods, found ${methods.size}"
    }
    methods.single { it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "I") }
        .addInstructionsWithLabels(0, """
            iget-object v0, p0, Lo/createDefault${'$'}setContentView;->e:Ljavax/net/SocketFactory;
            invoke-static {v0, p1, p2}, $EXTENSION->createCellularSocket(
                Ljavax/net/SocketFactory;Ljava/lang/String;I)Ljava/net/Socket;
            move-result-object p1
            return-object p1
        """.trimIndent())
    methods.single { it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "I", "Ljava/net/InetAddress;", "I") }
        .addInstructionsWithLabels(0, """
            iget-object v0, p0, Lo/createDefault${'$'}setContentView;->e:Ljavax/net/SocketFactory;
            invoke-static {v0, p1, p2, p3, p4}, $EXTENSION->createCellularSocket(
                Ljavax/net/SocketFactory;Ljava/lang/String;ILjava/net/InetAddress;I)Ljava/net/Socket;
            move-result-object p1
            return-object p1
        """.trimIndent())
    methods.single { it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/net/InetAddress;", "I") }
        .addInstructionsWithLabels(0, """
            iget-object v0, p0, Lo/createDefault${'$'}setContentView;->e:Ljavax/net/SocketFactory;
            invoke-static {v0, p1, p2}, $EXTENSION->createCellularSocket(
                Ljavax/net/SocketFactory;Ljava/net/InetAddress;I)Ljava/net/Socket;
            move-result-object p1
            return-object p1
        """.trimIndent())
    methods.single { it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/net/InetAddress;", "I", "Ljava/net/InetAddress;", "I") }
        .addInstructionsWithLabels(0, """
            iget-object v0, p0, Lo/createDefault${'$'}setContentView;->e:Ljavax/net/SocketFactory;
            invoke-static {v0, p1, p2, p3, p4}, $EXTENSION->createCellularSocket(
                Ljavax/net/SocketFactory;Ljava/net/InetAddress;ILjava/net/InetAddress;I)Ljava/net/Socket;
            move-result-object p1
            return-object p1
        """.trimIndent())
    methods.single { it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/net/Socket;", "Ljava/lang/String;", "I", "Z") }
        .addInstructionsWithLabels(0, """
            iget-object p1, p0, Lo/createDefault${'$'}setContentView;->a:Ljavax/net/ssl/SSLSocketFactory;
            iget-object v0, p0, Lo/createDefault${'$'}setContentView;->e:Ljavax/net/SocketFactory;
            invoke-static {v0, p2, p3}, $EXTENSION->createCellularSocket(
                Ljavax/net/SocketFactory;Ljava/lang/String;I)Ljava/net/Socket;
            move-result-object v0
            invoke-virtual {p1, v0, p2, p3, p4}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(
                Ljava/net/Socket;Ljava/lang/String;IZ)Ljava/net/Socket;
            move-result-object p1
            return-object p1
        """.trimIndent())
}

/** Rewrite at expansion time so existing user menu settings are repaired as well. */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchPreIoHissiMenu(
    owner: String = "Lo/PublicSuffixDatabaseCompanion;",
    methodName: String = "a",
    responseType: String = "Lo/BouncyCastleSocketAdapterCompanion;",
    expansionStateType: String = "Lo/PublicSuffixDatabaseCompanion\$IconCompatParcelizer;",
) {
    mutableClassDefBy(owner).methods.single { method ->
        method.name == methodName
            && method.returnType == "Ljava/lang/String;"
            && method.parameters.map(CharSequence::toString) == listOf(
                "Ljava/lang/String;",
                responseType,
                "Ljp/syoboi/a2chMate/client/BBSUrlInfo;",
                "Ljava/lang/String;",
                expansionStateType,
            )
    }.addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p0 .. p0 }, Lapp/morphe/extension/chmate/HissiMenuCompatibility;->rewriteTemplate(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p0
        """,
    )
}

/** Add the bundle version to the explicit version/device information insertion. */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchPostVersionInfo(applicationClass: String) {
    val owner = mutableClassDefBy(applicationClass)
    val method = owner.methods.single { method ->
        method.returnType in setOf("Ljava/lang/String;", "Ljava/lang/Object;") && method.implementation?.instructions?.any {
            val text = ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
            text?.startsWith("2chMate ") == true
        } == true
    }
    val instructions = method.implementation!!.instructions.toList()
    val prefixIndex = instructions.indexOfFirst {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string?.startsWith("2chMate ") == true
    }
    // 242 builds this text inside a shared Object-returning dispatcher. Hook
    // only this StringBuilder result, never all returns of that dispatcher.
    fun receiver(instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction): Int? = when (instruction) {
        is FiveRegisterInstruction -> instruction.registerC
        is RegisterRangeInstruction -> instruction.startRegister
        else -> null
    }
    val builderInitIndex = instructions.indices.first { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
        index > prefixIndex && reference?.definingClass == "Ljava/lang/StringBuilder;"
            && reference.name == "<init>"
            && reference.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;")
    }
    val builderRegister = receiver(instructions[builderInitIndex])
        ?: error("ChMate version/device StringBuilder constructor changed")
    val toStringIndex = instructions.indices.first { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
        index > builderInitIndex && reference != null
            && reference.definingClass in setOf("Ljava/lang/StringBuilder;", "Ljava/lang/Object;")
            && reference.name == "toString" && reference.returnType == "Ljava/lang/String;"
            && receiver(instructions[index]) == builderRegister
    }
    val result = instructions[toStringIndex + 1]
    check(result.opcode == Opcode.MOVE_RESULT_OBJECT) { "ChMate version/device StringBuilder result changed" }
    val register = (result as OneRegisterInstruction).registerA
    owner.findMutableMethodOf(method).addInstructionsWithLabels(toStringIndex + 2, """
        invoke-static/range {v$register .. v$register}, Lapp/morphe/extension/chmate/PostVersionInfo;->append(Ljava/lang/String;)Ljava/lang/String;
        move-result-object v$register
    """.trimIndent())
    println("ChMate version/device information: $applicationClass->${method.name}")
}

/** Install the Wacchoi item alongside ChMate's custom response-menu actions. */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchWacchoiLongPressMenu(
    versionName: String,
) {
    if (versionName in setOf("0.8.10.191 dev", "0.8.10.226 dev", "0.8.10.241", "0.8.10.242 dev")) {
        patchWacchoiNgPopupDispatch(versionName)
        patchWacchoiSuffixLongPress(versionName)
        if (versionName != "0.8.10.191 dev") {
            val builder = when (versionName) {
                "0.8.10.226 dev" -> "Lo/setDomStorageEnabled;"
                "0.8.10.241" -> "Lo/OnUserEarnedRewardListener;"
                else -> "Lo/isDataValid;"
            }
            val appenders = mutableClassDefBy(builder).methods.filter { method ->
                method.name != "<init>" && method.accessFlags and 8 == 0 && method.returnType == "V" &&
                    method.implementation?.instructions?.any {
                        val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
                        ref?.definingClass == "Ljava/util/List;" && ref.name == "add"
                    } == true
            }
            check(appenders.size == 2) { "$versionName name sheet appenders changed (${appenders.size})" }
            appenders.forEach { method ->
                method.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
                    .asReversed().forEach { (index, _) ->
                        method.addInstructionsWithLabels(index,
                            "invoke-static/range {p0 .. p0}, Lapp/morphe/extension/chmate/WacchoiLongPressMenu;->reorderNameSheet(Ljava/lang/Object;)V")
                    }
            }
        }
    }
    if (versionName == "0.8.10.226 dev") {
        val owner = "Lo/getImgAcceptedHeight;"
        val method = mutableClassDefBy(owner).methods.single { method ->
            method.returnType == "V" && method.parameters.map(CharSequence::toString) == listOf(
                owner, "Lo/setDomStorageEnabled;", "Ljp/syoboi/a2chMate/client/BoardID;", "Ljava/lang/String;",
            ) && method.implementation?.instructions?.any {
                ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "NGName"
            } == true
        }
        mutableClassDefBy(owner).findMutableMethodOf(method).addInstructionsWithLabels(0, """
            invoke-static/range {p0 .. p3}, Lapp/morphe/extension/chmate/WacchoiLongPressMenu;->appendNameSheet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V
        """.trimIndent())
        println("Wacchoi 226 name-sheet hook: ${method.name}")
        // Keep the response-body menu hook below as well.
    }
    if (versionName == "0.8.10.241" || versionName == "0.8.10.242 dev") {
        val owner = "Ljp/syoboi/a2chMate/ui/reslist/ResListFragmentViewModel;"
        val sheetBuilder = if (versionName == "0.8.10.241") "Lo/OnUserEarnedRewardListener;" else "Lo/isDataValid;"
        val method = mutableClassDefBy(owner).methods.single { method ->
            method.returnType == "V" && method.parameters.map(CharSequence::toString) == listOf(
                owner, sheetBuilder, "Ljp/syoboi/a2chMate/client/BoardID;", "Ljava/lang/String;",
            ) && method.implementation?.instructions?.any {
                ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "NGName"
            } == true
        }
        mutableClassDefBy(owner).findMutableMethodOf(method).addInstructionsWithLabels(0, """
            invoke-static/range {p0 .. p3}, Lapp/morphe/extension/chmate/WacchoiLongPressMenu;->appendNameSheet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V
        """.trimIndent())
        println("Wacchoi $versionName name-sheet hook: ${method.name}")
        if (versionName == "0.8.10.242 dev") return
        // 241 also retains the response-body menu hook below.
    }
    if (versionName == "0.8.10.191 dev") {
        patchLegacyWacchoiLongPressMenu()
        return
    }

    val owner = "Ljp/syoboi/a2chMate/fragment/ResMenuDialogFragment;"
    val candidates = mutableClassDefBy(owner).methods.filter { method ->
        method.parameters.isEmpty()
            && method.returnType != "V"
            && method.implementation?.instructions?.any { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                reference?.name == "findItem"
                    && reference.parameterTypes.map(CharSequence::toString) == listOf("I")
            } == true
            && method.implementation?.instructions?.any { instruction ->
                (instruction as? NarrowLiteralInstruction)?.narrowLiteral == 70
            } == true
            && method.implementation?.instructions?.any { instruction ->
                val literal = (instruction as? NarrowLiteralInstruction)?.narrowLiteral
                literal == 74 || literal == 75
            } == true
            && method.implementation?.instructions?.any { it.opcode == Opcode.RETURN_OBJECT } == true
    }
    check(candidates.size == 1) {
        "Expected one ${versionName} response context-menu builder, found ${candidates.size}"
    }
    val builder = candidates.single()
    if (versionName == "0.8.10.226 dev") {
        val catalogOwner = mutableClassDefBy("Lo/LyD;")
        val catalog = catalogOwner.methods.single { it.name == "invoke" && it.parameterTypes == listOf("Ljava/lang/Object;") }
        val nativeCatalog = MutableMethod(com.android.tools.smali.dexlib2.immutable.ImmutableMethod(catalogOwner.type,
            "haiagaruNativeCatalog", catalog.parameters, catalog.returnType, catalog.accessFlags,
            catalog.annotations, catalog.hiddenApiRestrictions, catalog.implementation))
        val entry = MutableMethod(com.android.tools.smali.dexlib2.immutable.ImmutableMethod(catalogOwner.type,
            catalog.name, catalog.parameters, catalog.returnType, catalog.accessFlags,
            catalog.annotations, catalog.hiddenApiRestrictions,
            com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation(3, emptyList(), emptyList(), emptyList())))
        entry.addInstructions(0, """
            invoke-virtual {p0, p1}, $nativeCatalog
            move-result-object v0
            invoke-static {p1}, Lapp/morphe/extension/chmate/ResponseMenuSettings;->catalog226(Ljava/lang/Object;)V
            return-object v0
        """.trimIndent())
        catalogOwner.methods.remove(catalog); catalogOwner.methods.add(nativeCatalog); catalogOwner.methods.add(entry)
    }
    val builderInstructions = builder.implementation!!.instructions.toList()
    val returns = builderInstructions.mapIndexedNotNull { index, instruction ->
        if (instruction.opcode == Opcode.RETURN_OBJECT) {
            index to (instruction as OneRegisterInstruction).registerA
        } else null
    }.asReversed()
    val mutableBuilder = mutableClassDefBy(owner).findMutableMethodOf(builder)
    val wrapResponseMenu=versionName=="0.8.10.226 dev"||versionName=="0.8.10.242 dev"
    returns.filter { !wrapResponseMenu }.forEach { (index, register) ->
        mutableBuilder.addInstructionsWithLabels(index, """
            invoke-static/range {v$register .. v$register}, Lapp/morphe/extension/chmate/WacchoiLongPressMenu;->appendForCurrentDialog(Ljava/lang/Object;)V
        """.trimIndent())
    }
    if (!wrapResponseMenu) mutableBuilder.addInstructionsWithLabels(0, """
        invoke-static/range {p0 .. p0}, Lapp/morphe/extension/chmate/WacchoiLongPressMenu;->captureDialog(Ljava/lang/Object;)V
    """.trimIndent())
    // A native branch jumps directly to the shared return when action 35 is
    // hidden. Return-site insertion alone leaves that path unhooked. A wrapper
    // has one unconditional post-processing boundary for every native exit.
    if (wrapResponseMenu) {
        val klass = mutableClassDefBy(owner)
        val delegate = MutableMethod(com.android.tools.smali.dexlib2.immutable.ImmutableMethod(owner,
            "haiagaruNativeResponseMenu", builder.parameters, builder.returnType, builder.accessFlags,
            builder.annotations, builder.hiddenApiRestrictions, builder.implementation))
        val entry = MutableMethod(com.android.tools.smali.dexlib2.immutable.ImmutableMethod(owner,
            builder.name, builder.parameters, builder.returnType, builder.accessFlags,
            builder.annotations, builder.hiddenApiRestrictions,
            com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation(2, emptyList(), emptyList(), emptyList())))
        val call = if (builder.accessFlags and 2 != 0) "invoke-direct" else "invoke-virtual"
        entry.addInstructions(0, """
            $call {p0}, $delegate
            move-result-object v0
            invoke-static {p0}, Lapp/morphe/extension/chmate/WacchoiLongPressMenu;->captureDialog(Ljava/lang/Object;)V
            invoke-static {v0}, Lapp/morphe/extension/chmate/WacchoiLongPressMenu;->appendForCurrentDialog(Ljava/lang/Object;)V
            invoke-static {v0}, Lapp/morphe/extension/chmate/ResponseMenuSettings;->finishResponseMenu(Ljava/lang/Object;)V
            return-object v0
        """.trimIndent())
        klass.methods.remove(mutableBuilder)
        klass.methods.add(delegate)
        klass.methods.add(entry)
    }

    var dispatcherCount = 0
    classDefForEach { classDef ->
        classDef.methods.forEach methodLoop@ { method ->
            if (method.returnType != "Z") return@methodLoop
            val instructions = method.implementation?.instructions?.toList()
                ?: return@methodLoop
            if (instructions.none { instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    reference?.definingClass == "Landroid/view/MenuItem;"
                        && reference.name == "getItemId"
                        && reference.returnType == "I"
                        && reference.parameterTypes.isEmpty()
                }) return@methodLoop

            val upperBounds = instructions.mapIndexedNotNull { index, instruction ->
                val literal = (instruction as? NarrowLiteralInstruction)?.narrowLiteral
                if (literal != 74 && literal != 75) return@mapIndexedNotNull null
                val prior = instructions.subList(maxOf(0, index - 12), index)
                if (prior.any { (it as? NarrowLiteralInstruction)?.narrowLiteral == 70 }) {
                    index to literal
                } else null
            }
            if (upperBounds.isEmpty()) return@methodLoop
            val mutableMethod = mutableClassDefBy(classDef).findMutableMethodOf(method)
            upperBounds.forEach { (index, literal) ->
                val register = (instructions[index] as OneRegisterInstruction).registerA
                val expandedBoundary = if (literal == 74) 75 else 76
                mutableMethod.replaceInstruction(index,
                    "const/16 v$register, 0x${expandedBoundary.toString(16)}")
                dispatcherCount++
            }
        }
    }
    check(dispatcherCount == 1) {
        "Expected one ${versionName} custom response-menu dispatcher, patched $dispatcherCount"
    }
    println("Wacchoi response-menu hook: builder=${builder.name}, dispatcher=$dispatcherCount")
}

/** Bridge the NG item's listener in the custom popup used by supported versions. */
private fun BytecodePatchContext.patchThumbnailClickAttachments(version: String) {
    if (version != "0.8.10.242 dev") return
    val row = mutableClassDefBy("Lo/zzbhe;")
    val click = row.methods.single { it.name == "onClick" && it.parameterTypes == listOf("Landroid/view/View;") }
    val instructions = click.implementation!!.instructions.toList()
    val projection = instructions.withIndex().single { (_, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Lo/KeJ11;" && ref.returnType == "[Ljava/lang/CharSequence;"
    }
    check(instructions[projection.index + 1].opcode == Opcode.MOVE_RESULT_OBJECT)
    val result = (instructions[projection.index + 1] as OneRegisterInstruction).registerA
    val receiver = click.implementation!!.registerCount - 2
    check(receiver + 1 < 16 && result < 16 && result < receiver)
    click.addInstructionsWithLabels(projection.index + 2, """
        invoke-static {p0, p1, v$result}, Lapp/morphe/extension/chmate/ThumbnailClickAttachments;->links(Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/CharSequence;)[Ljava/lang/CharSequence;
        move-result-object v$result
    """.trimIndent())
    val native=MutableMethod(ImmutableMethod(row.type,"haiagaruNativeThumbnailClick",click.parameters,click.returnType,
        click.accessFlags,click.annotations,click.hiddenApiRestrictions,click.implementation))
    val wrapper=MutableMethod(ImmutableMethod(row.type,click.name,click.parameters,click.returnType,
        click.accessFlags,click.annotations,click.hiddenApiRestrictions,ImmutableMethodImplementation(3,emptyList(),emptyList(),emptyList())))
    wrapper.addInstructionsWithLabels(0,"""
        invoke-static {p1}, Lapp/morphe/extension/chmate/ThumbnailClickAttachments;->openThread(Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :native
        return-void
        :native
        invoke-virtual {p0, p1}, $native
        return-void
    """.trimIndent())
    row.methods.remove(click);row.methods.add(native);row.methods.add(wrapper)
}

private fun BytecodePatchContext.patchImageListResolvedMedia(version: String) {
    val modelAndBody = when (version) {
        "0.8.10.191 dev" -> "Lo/processAdDisplayErrorPostbackForUserError;" to "c"
        "0.8.10.226 dev" -> "Lo/BouncyCastleSocketAdapterCompanion;" to "d"
        "0.8.10.241" -> "Lo/setDislikeWidth;" to "g"
        "0.8.10.242 dev" -> "Lo/KeJ11;" to "h"
        else -> return
    }
    if (version == "0.8.10.241" || version == "0.8.10.242 dev") {
        // Modern galleries share their DAT loader with thread properties. Hook
        // the loop entry, including the branch that reuses the 242 URL cache.
        val loaderType = if (version == "0.8.10.241") "Lo/getMediaContent;" else "Lo/getWrappedCursor;"
        val viewModel = mutableClassDefBy("Ljp/syoboi/a2chMate/ui/imagelist/ImageListViewModel;")
        check(viewModel.methods.any { method -> method.implementation?.instructions?.any {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.definingClass == loaderType
        } == true }) { "Modern image-list loader changed: $version" }
        val loader = mutableClassDefBy(loaderType)
        val sites = loader.methods.flatMap { method ->
            val instructions = method.implementation?.instructions?.toList().orEmpty()
            instructions.mapIndexedNotNull { index, instruction ->
                if (instruction.opcode != Opcode.ARRAY_LENGTH) return@mapIndexedNotNull null
                val length = instruction as TwoRegisterInstruction
                val bodyIndex = (maxOf(0, index - 12) until index).lastOrNull { prior ->
                    val field = (instructions[prior] as? ReferenceInstruction)?.reference as? FieldReference
                    instructions[prior].opcode == Opcode.IGET_OBJECT && field?.definingClass == modelAndBody.first
                        && field.name == modelAndBody.second && field.type == "Ljava/lang/String;"
                } ?: return@mapIndexedNotNull null
                val model = (instructions[bodyIndex] as TwoRegisterInstruction).registerB
                check(model != length.registerB && model < 16 && length.registerB < 16)
                Triple(method, index, Triple(model, length.registerB, length.registerA))
            }
        }
        check(sites.size == 1) { "Expected one modern gallery loop: $version, found ${sites.size}" }
        val (method, index, registers) = sites.single()
        val (model, urls, count) = registers
        // Keep existing branch labels attached to the hook, not past it.
        method.replaceInstruction(index, "invoke-static {v$model, v$urls}, Lapp/morphe/extension/chmate/ImgurAlbumAttachments;->complete(Ljava/lang/Object;[Ljava/lang/String;)[Ljava/lang/String;")
        method.addInstructionsWithLabels(index + 1, """
            move-result-object v$urls
            array-length v$count, v$urls
        """.trimIndent())
        println("Image-list resolved media: $version -> $loaderType")
        return
    }
    val activity = mutableClassDefBy("Ljp/syoboi/a2chMate/activity/ImageListActivity;")
    val onCreate = activity.methods.single { it.name == "onCreate" }
    val fragments = onCreate.implementation!!.instructions.mapNotNull { instruction ->
        if (instruction.opcode != Opcode.NEW_INSTANCE) return@mapNotNull null
        val type = ((instruction as ReferenceInstruction).reference as TypeReference).type
        type.takeIf { candidate ->
            candidate.startsWith("Lo/") && mutableClassDefBy(candidate).methods.any { method ->
                method.name == "onCreate" && method.implementation?.instructions?.any { body ->
                    ((body as? ReferenceInstruction)?.reference as? StringReference)?.string == "urlinfo"
                } == true
            }
        }
    }.distinct()
    check(fragments.size == 1) { "Expected one $version image-list fragment, found $fragments" }
    val fragment = mutableClassDefBy(fragments.single())
    val create = fragment.methods.single { it.name == "onCreate" }
    val instructions = create.implementation!!.instructions.toList()
    val sites = instructions.mapIndexedNotNull { index, instruction ->
        val extraction = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@mapIndexedNotNull null
        if (extraction.returnType != "[Ljava/lang/String;"
            || "Ljava/lang/String;" !in extraction.parameterTypes.map(CharSequence::toString)
            || "Z" !in extraction.parameterTypes.map(CharSequence::toString)) return@mapIndexedNotNull null
        val bodyRead = (maxOf(0, index - 12) until index).lastOrNull { prior ->
            val field = (instructions[prior] as? ReferenceInstruction)?.reference as? FieldReference
            instructions[prior].opcode == Opcode.IGET_OBJECT && field?.definingClass == modelAndBody.first
                && field.name == modelAndBody.second && field.type == "Ljava/lang/String;"
        } ?: return@mapIndexedNotNull null
        check(instructions[index + 1].opcode == Opcode.MOVE_RESULT_OBJECT) { "Image-list URL extraction result moved" }
        val model = (instructions[bodyRead] as TwoRegisterInstruction).registerB
        val result = (instructions[index + 1] as OneRegisterInstruction).registerA
        check(model != result && model < 16 && result < 16) { "Image-list model/result register overlap" }
        Triple(index + 2, model, result)
    }
    check(sites.size == 1) { "Expected one $version image-list media extraction, found ${sites.size}" }
    sites.asReversed().forEach { (index, model, result) ->
        create.addInstructionsWithLabels(index, """
            invoke-static {v$model, v$result}, Lapp/morphe/extension/chmate/ImgurAlbumAttachments;->complete(Ljava/lang/Object;[Ljava/lang/String;)[Ljava/lang/String;
            move-result-object v$result
        """.trimIndent())
    }
    println("Image-list resolved media: $version -> ${fragment.type}")
}

private fun BytecodePatchContext.patchWacchoiSuffixLongPress(version: String) {
    var rowHooks = 0
    val compose = mutableListOf<Pair<String, Method>>()
    classDefForEach { cls ->
        cls.methods.toList().forEach { method ->
            if (method.name == "getView" && method.returnType == "Landroid/view/View;"
                && method.parameterTypes.map(CharSequence::toString) == listOf("I", "Landroid/view/View;", "Landroid/view/ViewGroup;")
                && method.implementation?.instructions?.any {
                    val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
                    ref?.definingClass == "Landroid/view/MenuItem;" && ref.name == "getTitle"
                } == true) {
                val owner = mutableClassDefBy(cls)
                val mutable = owner.findMutableMethodOf(method)
                // getView may reuse every parameter register (191 even reuses
                // p1 for the returned View). Keep the original frame untouched.
                val wrapper = MutableMethod(com.android.tools.smali.dexlib2.immutable.ImmutableMethod(
                    cls.type, "getView", method.parameters, method.returnType, method.accessFlags,
                    method.annotations, method.hiddenApiRestrictions,
                    com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation(5, emptyList(), emptyList(), emptyList())
                ))
                mutable.setName("haiagaruSuffixGetView")
                wrapper.addInstructionsWithLabels(0, """
                    invoke-virtual/range {p0 .. p3}, ${cls.type}->haiagaruSuffixGetView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
                    move-result-object v0
                    move-object p2, v0
                    invoke-static/range {p0 .. p2}, Lapp/morphe/extension/chmate/WacchoiLongPressMenu;->bindSuffixRow(Ljava/lang/Object;ILandroid/view/View;)V
                    return-object v0
                """.trimIndent())
                owner.methods.add(wrapper)
                rowHooks++
            }
            val p = method.parameterTypes.map(CharSequence::toString)
            val callbackIndex = if (p.size == 5) 3 else 4
            val clickSignature = p.size in 5..6 && p[1] == "Z" && p[2] == "Ljava/lang/String;"
                && p.last() == "I" && method.returnType == p[0]
            if (com.android.tools.smali.dexlib2.AccessFlags.STATIC.isSet(method.accessFlags) && clickSignature
                && cls.methods.any { other ->
                    val q = other.parameterTypes.map(CharSequence::toString)
                    (q.size in 9..10 && other.returnType == p[0] && q[0] == p[0] && q[1] == "Z"
                        && q[2] == "Ljava/lang/String;" && q[4] == "Ljava/lang/String;" && q[5] == p[callbackIndex]
                        && q[6] == p[callbackIndex] && q.last() == p[callbackIndex])
                    || (q.size == 7 && other.returnType == p[0] && q[0] == p[0] && q[1] == "Z"
                        && q[2] == p[callbackIndex] && q[3] == "Z" && q[5] == p[callbackIndex] && q[6] == "I")
                }) compose += cls.type to method
        }
    }
    check(rowHooks > 0) { "No $version native menu rows for suffix long press" }
    if (version != "0.8.10.191 dev") {
        // Older Compose builds do not expose this exact combined-click bridge.
        // Do not make their ordinary menu features unpatchable just because
        // the optional suffix-row long-press enhancement is unavailable.
        if (compose.isEmpty() && version in setOf("0.8.10.226 dev", "0.8.10.241")) {
            println("Wacchoi suffix long press: $version native row adapters=$rowHooks; compatible Compose bridge unavailable")
            return
        }
        check(compose.size == 1) { "Expected one $version Compose clickable bridge, found ${compose.map { it.first }}" }
        val (owner, method) = compose.single()
        val mutable = mutableClassDefBy(owner).findMutableMethodOf(method)
        val parameterCount = method.parameterTypes.size
        check(mutable.implementation!!.registerCount > parameterCount) { "Compose clickable needs a local register" }
        val helper = if (parameterCount == 5)
            "suffixCombinedClickable5(Ljava/lang/Object;ZLjava/lang/String;Ljava/lang/Object;I)Ljava/lang/Object;"
        else "suffixCombinedClickable(Ljava/lang/Object;ZLjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;I)Ljava/lang/Object;"
        mutable.addInstructionsWithLabels(0, """
            const-string v0, "${owner.removePrefix("L").removeSuffix(";").replace('/', '.')}"
            invoke-static {v0}, Lapp/morphe/extension/chmate/WacchoiLongPressMenu;->configureCombinedClickable(Ljava/lang/String;)V
            invoke-static/range {p0 .. p${parameterCount - 1}}, Lapp/morphe/extension/chmate/WacchoiLongPressMenu;->$helper
            move-result-object v0
            if-eqz v0, :nativeSuffixClick
            check-cast v0, ${method.returnType}
            return-object v0
            :nativeSuffixClick
            nop
        """.trimIndent())
    }
    println("Wacchoi suffix long press: $version, native row adapters=$rowHooks, Compose=${compose.size}")
}

private fun BytecodePatchContext.patchWacchoiNgPopupDispatch(version: String) {
    // These custom popups bypass MenuItem's listener. Match the shared structure
    // rather than a version-specific obfuscated name, and touch only our action.
    val candidates = mutableListOf<Pair<ClassDef, Method>>()
    classDefForEach { classDef ->
        classDef.methods.filter { method ->
            method.name == "onItemClick" && method.returnType == "V"
                && method.parameters.map(CharSequence::toString) == listOf(
                    "Landroid/widget/AdapterView;", "Landroid/view/View;", "I", "J",
                )
        }.forEach { method ->
            val references = method.implementation?.instructions?.mapNotNull {
                (it as? ReferenceInstruction)?.reference as? MethodReference
            }.orEmpty()
            if (references.any { it.definingClass == "Landroid/view/MenuItem;" && it.name == "getSubMenu" }
                && references.any { it.name == "dismiss" && it.parameterTypes.isEmpty() }
                && (version == "0.8.10.191 dev" && classDef.type == "Lo/qm;"
                    || references.any { it.definingClass == "Landroid/widget/AdapterView;" && it.name == "getItemAtPosition" })
                && references.any { it.name == "onMenuItemClick" && it.returnType == "Z"
                    && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/view/MenuItem;") }) {
                candidates += classDef to method
            }
        }
    }
    check(candidates.size == if (version == "0.8.10.191 dev") 2 else 1) {
        "Unexpected $version custom NG popup dispatchers: ${candidates.map { it.first.type }}"
    }
    candidates.forEach { (popupOwner, popupMethod) ->
        val popupClick = mutableClassDefBy(popupOwner).findMutableMethodOf(popupMethod)
        val nativeClick = popupClick.implementation!!.instructions.withIndex().single {
            val reference = (it.value as? ReferenceInstruction)?.reference as? MethodReference
            reference?.name == (if (popupOwner.type == "Lo/qm;") "Xf_" else "onMenuItemClick") && reference.returnType == "Z"
                && reference.parameterTypes.map(CharSequence::toString) == listOf("Landroid/view/MenuItem;")
        }
        val selectedItemRegister = (nativeClick.value as FiveRegisterInstruction).registerD
        popupClick.addInstructionsWithLabels(nativeClick.index, """
            invoke-static/range {v$selectedItemRegister .. v$selectedItemRegister}, Lapp/morphe/extension/chmate/WacchoiLongPressMenu;->dispatchSuffixNgItem(Ljava/lang/Object;)Z
            move-result p3
            if-eqz p3, :nativePopupClick
            return-void
            :nativePopupClick
            nop
        """.trimIndent())
        println("Wacchoi NG popup dispatch: $version -> ${popupOwner.type}")
    }
}

/** 191 builds its name and response menus separately, both from the selected response. */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacyWacchoiLongPressMenu() {
    val owner = "Lo/pa;"
    // Name/SLIP long presses use c(Response, boolean, boolean), independently
    // of the response-body popup in Wx_. Preserve the exact selected response.
    val nameMenu = mutableClassDefBy(owner).methods.single {
        it.name == "c" && it.returnType == "V" &&
            it.parameters.map(CharSequence::toString) == listOf(
                "Lo/processAdDisplayErrorPostbackForUserError;", "Z", "Z",
            )
    }
    val nameAnchors = nameMenu.implementation!!.instructions.withIndex().filter {
        val reference = (it.value as? ReferenceInstruction)?.reference as? MethodReference
        reference?.definingClass == "Lo/setExtraParameter;" && reference.name == "Td_"
    }
    check(nameAnchors.size == 1) { "191 name/SLIP menu anchor changed" }
    val nameAnchor = nameAnchors.single()
    val nameMenuRegister = (nameAnchor.value as FiveRegisterInstruction).registerC
    nameMenu.addInstructionsWithLabels(nameAnchor.index + 1,
        "invoke-static/range {v$nameMenuRegister .. v$nameMenuRegister}, " +
            "Lapp/morphe/extension/chmate/WacchoiLongPressMenu;->reorderLegacyNameMenu(Ljava/lang/Object;)V")
    nameMenu.addInstructionsWithLabels(nameAnchor.index, """
        invoke-static {p0, v$nameMenuRegister, p1}, Lapp/morphe/extension/chmate/WacchoiLongPressMenu;->appendLegacyForName(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    """.trimIndent())
    val callback = mutableClassDefBy(owner).methods.single { method ->
        method.name == "Wx_"
            && method.returnType == "V"
            && method.parameters.map(CharSequence::toString) == listOf(
                "Landroid/widget/ListView;", "Landroid/view/View;", "I", "J",
            )
    }
    val instructions = callback.implementation?.instructions?.toList()
        ?: error("ChMate 191 response long-press method has no implementation")
    val menuSizes = instructions.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        if (reference?.definingClass == "Lo/m6fExternalSyntheticLambda0;"
            && reference.name == "size" && reference.returnType == "I"
        ) index to (instruction as? FiveRegisterInstruction)?.registerC else null
    }
    check(menuSizes.size == 1 && menuSizes.single().second != null) {
        "ChMate 191 selected-response menu anchor changed"
    }
    val (menuIndex, menuRegister) = menuSizes.single()
    val responseCalls = instructions.take(menuIndex).mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        if (reference?.definingClass == owner && reference.name == "c"
            && reference.parameterTypes.map(CharSequence::toString) ==
                listOf("Lo/processAdDisplayErrorPostbackForUserError;")
            && reference.returnType == "Ljava/lang/String;"
        ) index to (instruction as? FiveRegisterInstruction)?.registerD else null
    }
    check(responseCalls.size == 1 && responseCalls.single().second != null) {
        "ChMate 191 selected response register changed"
    }
    val responseRegister = responseCalls.single().second!!
    check(menuRegister!! < 16 && responseRegister < 16) {
        "ChMate 191 response menu registers cannot use invoke-static"
    }
    mutableClassDefBy(owner).findMutableMethodOf(callback).addInstructionsWithLabels(
        menuIndex,
        """
            invoke-static {p0, v$menuRegister, v$responseRegister}, Lapp/morphe/extension/chmate/WacchoiLongPressMenu;->appendLegacyForResponse(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
            invoke-static {p0, v$menuRegister, v$responseRegister}, Lapp/morphe/extension/chmate/ResponseArchive;->appendLegacy(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
        """.trimIndent(),
    )
    println("Wacchoi response-menu hook: selected ChMate 191 response")
}

/** Hook the ordinary response menu as well as the older link/name popups. */
private fun BytecodePatchContext.patchResponseArchive(version: String) {
    if (version == "0.8.10.191 dev" || version == "0.8.10.242 dev") {
        val owners = if(version == "0.8.10.191 dev") listOf(mutableClassDefBy("Lo/r8lambdafLXKIgI8H4VR9SponZBKnK7_9gE;"))
            else {
                val found=mutableListOf<String>()
                classDefForEach { if(it.type.startsWith("Ljp/syoboi/a2chMate/fragment/ResMenuDialogFragment\$"))found.add(it.type) }
                found.map { mutableClassDefBy(it) }
            }
        val resultType=if(version == "0.8.10.191 dev") "Lo/r8lambdaElkXfNt4VbdvffL9Z700R6oMDo;" else "Ljp/syoboi/a2chMate/feature/toolbar/ToolbarDefault;"
        var hooks=0
        owners.forEach { owner -> owner.methods.filter { it.accessFlags and 8 != 0 && it.parameterTypes.isEmpty() && it.returnType==resultType }.toList().forEach { method ->
            val delegate=MutableMethod(com.android.tools.smali.dexlib2.immutable.ImmutableMethod(owner.type,"haiagaruCatalog_"+method.name,method.parameters,method.returnType,method.accessFlags,method.annotations,method.hiddenApiRestrictions,method.implementation))
            val wrapper=MutableMethod(com.android.tools.smali.dexlib2.immutable.ImmutableMethod(owner.type,method.name,method.parameters,method.returnType,method.accessFlags,method.annotations,method.hiddenApiRestrictions,com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation(1,emptyList(),emptyList(),emptyList())))
            wrapper.addInstructions(0,"""
                invoke-static {}, $delegate
                move-result-object v0
                invoke-static {v0}, Lapp/morphe/extension/chmate/ResponseMenuSettings;->catalog(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v0
                check-cast v0, $resultType
                return-object v0
            """.trimIndent())
            owner.methods.remove(method);owner.methods.add(delegate);owner.methods.add(wrapper);hooks++
        } }
        check(hooks>0) { "$version response customization catalog missing" }
    }
    if (version == "0.8.10.191 dev") {
        val dialog = mutableClassDefBy("Lo/r8lambdafLXKIgI8H4VR9SponZBKnK7_9gE;")
        val menu = dialog.methods.single {
            it.name == "c" && it.parameterTypes.isEmpty() && it.returnType == "Lo/m6fExternalSyntheticLambda0;"
        }
        // Native branches jump directly to RETURN_OBJECT. Inserting before that
        // instruction can leave their labels pointing past our extension call.
        // Wrap the entire builder so every successful return is amended once.
        val delegate = MutableMethod(com.android.tools.smali.dexlib2.immutable.ImmutableMethod(
            dialog.type, "haiagaruBuildResponseMenu", menu.parameters, menu.returnType,
            menu.accessFlags, menu.annotations, menu.hiddenApiRestrictions, menu.implementation))
        val wrapper = MutableMethod(com.android.tools.smali.dexlib2.immutable.ImmutableMethod(
            dialog.type, menu.name, menu.parameters, menu.returnType,
            menu.accessFlags, menu.annotations, menu.hiddenApiRestrictions,
            com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation(3, emptyList(), emptyList(), emptyList())))
        val invoke = if (menu.accessFlags and 2 != 0) "invoke-direct" else "invoke-virtual"
        wrapper.addInstructions(0, """
            $invoke {p0}, $delegate
            move-result-object v0
            move-object v1, p0
            invoke-static {v1, v0}, Lapp/morphe/extension/chmate/ResponseArchive;->appendDialog(Ljava/lang/Object;Ljava/lang/Object;)V
            invoke-static {v0}, Lapp/morphe/extension/chmate/ResponseMenuSettings;->finishResponseMenu(Ljava/lang/Object;)V
            return-object v0
        """.trimIndent())
        dialog.methods.remove(menu)
        dialog.methods.add(delegate)
        dialog.methods.add(wrapper)
        println("Response archive: 191 ordinary response menu -> ${dialog.type}")
        return
    }
    if (version != "0.8.10.242 dev") return // 226 uses the existing exact-target dialog hook.
    // Compose's icon grid calls the parent's native dispatcher, not the
    // MenuItem listener used by the legacy grid. Consume our actions first.
    val ordinaryDialog = mutableClassDefBy("Ljp/syoboi/a2chMate/fragment/ResMenuDialogFragment;")
    val ordinaryClick = ordinaryDialog.methods.single {
        it.name == "c" && it.accessFlags and 8 != 0 && it.parameterTypes == listOf(
            ordinaryDialog.type, "Lo/TTPlayableLandingPageActivity15;"
        )
    }
    ordinaryClick.addInstructionsWithLabels(0, """
        invoke-static {p1}, Lapp/morphe/extension/chmate/ResponseArchive;->handle(Ljava/lang/Object;)Z
        move-result v0
        if-eqz v0, :nativeResponseClick
        invoke-virtual {p0}, Lo/setOptionsView;->dismiss()V
        sget-object v0, Lo/zzbwq;->INSTANCE:Lo/zzbwq;
        return-object v0
        :nativeResponseClick
        nop
    """.trimIndent())
    val owner = "Ljp/syoboi/a2chMate/ui/reslist/ResListFragmentViewModel;"
    val method = mutableClassDefBy(owner).methods.single {
        it.accessFlags and 8 != 0 && it.returnType == "V" && it.parameterTypes == listOf(
            owner, "Lo/isDataValid;", "Lo/KeJ11;"
        )
    }
    method.addInstruction(0,
        "invoke-static/range {p0 .. p2}, Lapp/morphe/extension/chmate/ResponseArchive;->appendSheet(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V")
    println("Response archive: 242 exact response sheet -> ${method.name}")
}

/** Thread rows use TextView on all four supported versions, including RecyclerView rows. */
private fun BytecodePatchContext.patchThreadTitleSpacing(version: String) {
    val adapterType = when (version) {
        "0.8.10.191 dev" -> "Lo/m8a;"
        "0.8.10.226 dev" -> "Lo/getWriteBytesTotal;"
        "0.8.10.241" -> "Lo/RegisterListenerMethod;"
        "0.8.10.242 dev" -> "Lo/zzavb;"
        else -> return
    }
    val bind = mutableClassDefBy(adapterType).methods.single { method ->
        method.name == if (version == "0.8.10.191 dev" || version == "0.8.10.226 dev") "getView" else "onBindViewHolder"
    }
    val instructions = bind.implementation!!.instructions.toList()
    val sizeIndex = instructions.indexOfFirst { instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Landroid/widget/TextView;" && ref.name == "setTextSize"
            && ref.parameterTypes.map(CharSequence::toString) == listOf("F")
    }
    check(sizeIndex > 0) { "$version thread title size binding missing" }
    val titleField = (instructions[sizeIndex - 1] as ReferenceInstruction).reference as FieldReference
    val sites = instructions.mapIndexedNotNull { index, instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        val field = (instructions.getOrNull(index - 1) as? ReferenceInstruction)?.reference as? FieldReference
        if (ref?.name == "setText" && field?.toString() == titleField.toString()) index else null
    }
    check(sites.isNotEmpty()) { "$version thread title text binding missing" }
    sites.asReversed().forEach { index ->
        val receiver = (instructions[index] as FiveRegisterInstruction).registerC
        bind.addInstructionsWithLabels(index + 1,
            "invoke-static/range {v$receiver .. v$receiver}, Lapp/morphe/extension/chmate/ThreadTitleSpacing;->apply(Landroid/widget/TextView;)V")
    }
    println("Thread title spacing: ${sites.size} bindings ($version)")
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchXVideoAttachmentProjection() {
    var count = 0
    classDefForEach { classDef ->
        if (!classDef.type.startsWith("Lo/") || !classDef.interfaces.contains("Ljava/lang/CharSequence;")) return@classDefForEach
        val factory = classDef.methods.singleOrNull { method ->
            (method.accessFlags and 0x8) != 0 && method.returnType == classDef.type
                && method.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;")
                && method.implementation?.instructions?.any { instruction ->
                    ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == "/i.imgur.com/"
                } == true
        } ?: return@classDefForEach
        val method = mutableClassDefBy(classDef).methods.single { it.name == factory.name && it.returnType == factory.returnType }
        val scratch = method.findFreeRegister(0)
        check(scratch < 16 && method.implementation!!.registerCount - 1 < 16)
        val name = classDef.type.removePrefix("L").removeSuffix(";").replace('/', '.')
        method.addInstructionsWithLabels(0, """
            const-string v$scratch, "$name"
            invoke-static {p0, v$scratch}, Lapp/morphe/extension/chmate/XMediaAttachments;->nativeVideo(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
            move-result-object v$scratch
            if-eqz v$scratch, :native_video_fallback
            check-cast v$scratch, ${classDef.type}
            return-object v$scratch
            :native_video_fallback
            nop
        """)
        count++
    }
    println("X video attachment factories: $count")
}

/** The draft's pixel scale must not determine the original content's screen centre. */
/** Keep stock board validation and reload events, but replace the modern tailing
 * start with bottom-only automatic scrolling. Never emit a tailing state, so
 * neither the forced sort nor the forced jump-to-bottom collector runs. */
private fun BytecodePatchContext.patchPostEditorTextSize(version: String) {
    val fragment = mutableClassDefBy(if (version == "0.8.10.191 dev")
        "Lo/p9ExternalSyntheticLambda6;" else "Ljp/syoboi/a2chMate/feature/resedit/ResEditFragment;")
    val created = fragment.methods.single { it.name == "onViewCreated" && it.parameterTypes == listOf("Landroid/view/View;", "Landroid/os/Bundle;") }
    // Native code reuses p1 for a FragmentManager in 191. Capture the original
    // view at entry; extension defers binding access until initialization ends.
    created.addInstructionsWithLabels(0,
        "invoke-static/range {p0 .. p1}, Lapp/morphe/extension/chmate/ThreadCommands;->attach(Ljava/lang/Object;Landroid/view/View;)V")
    val activity = mutableClassDefBy("Ljp/syoboi/a2chMate/activity/ResEditActivity;")
    val resume = activity.methods.single { it.name == "onResume" && it.parameterTypes.isEmpty() && it.returnType == "V" }
    val returns = resume.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
        if (instruction.opcode == Opcode.RETURN_VOID) index else null
    }
    check(returns.isNotEmpty()) { "Posting activity resume exit missing" }
    returns.asReversed().forEach { index ->
        resume.addInstructionsWithLabels(index,
            "invoke-static/range {p0 .. p0}, Lapp/morphe/extension/chmate/PostEditorTextSize;->apply(Landroid/app/Activity;)V")
    }
    println("Posting editor configurable text size: ${returns.size} resume exits")
}

/** Only tint the two native auto-scroll icons; preserve click/hold callbacks and timing. */
private fun BytecodePatchContext.patchAutoScrollControlColors(version: String) {
    val profile = when (version) {
        "0.8.10.226 dev" -> listOf("Lo/getChannel;", "Lo/addConnectException;", "b", "bv")
        "0.8.10.241" -> listOf("Lo/QWA11;", "Lo/getPageMargin;", "a", "bs")
        "0.8.10.242 dev" -> listOf("Lo/AdChoicesView;", "Lo/onTextChanged;", "a", "bq")
        else -> return // 191 already follows the theme; deprecated 243 is unchanged.
    }
    val (icons, theme, getter, colorField) = profile
    val themeClass = mutableClassDefBy(theme)
    check(themeClass.methods.count { it.name == getter && it.accessFlags and 8 != 0
        && it.parameterTypes == listOf("Landroid/content/Context;") && it.returnType == theme } == 1)
    check(themeClass.fields.any { it.name == colorField && it.type == "I" })
    // Verify the field's semantic meaning, not just the version-specific obfuscated name.
    check(themeClass.methods.any { method ->
        val body = method.implementation?.instructions?.toList() ?: return@any false
        body.indices.any { index ->
            ((body[index] as? ReferenceInstruction)?.reference as? StringReference)?.string == "textPrimaryColor"
                && ((body.getOrNull(index + 1) as? ReferenceInstruction)?.reference as? FieldReference)
                    ?.let { it.definingClass == theme && it.name == colorField } == true
        }
    }) { "$version primary theme color anchor changed" }
    val iconMethods = mutableClassDefBy(icons).methods.filter { method ->
        method.implementation?.instructions?.any {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string in setOf("Up", "Down")
        } == true
    }
    check(iconMethods.size == 2) { "$version auto-scroll icon pair changed" }
    iconMethods.forEach { method ->
        val body = method.implementation!!.instructions.toList()
        val index = body.indices.single { position ->
            val reference = (body[position] as? ReferenceInstruction)?.reference as? MethodReference
            reference?.parameterTypes?.let { it.size == 7 && it[1] == "Ljava/lang/String;"
                && it[3] == "J" && it.takeLast(2) == listOf("I", "I") } == true
                && reference.returnType == "V"
        }
        val call = body[index] as? RegisterRangeInstruction
            ?: error("$version auto-scroll icon invocation is not a range")
        check(call.registerCount == 8)
        val tint = call.startRegister + 3
        val defaults = call.startRegister + 7
        check(tint + 1 < 16 && defaults < 16)
        val mask = body.take(index).last { it is OneRegisterInstruction && it.registerA == defaults }
        check((mask as? NarrowLiteralInstruction)?.narrowLiteral == 12) {
            "$version auto-scroll icon default mask changed"
        }
        method.addInstructionsWithLabels(index, """
            invoke-static {}, $EXTENSION->applicationContextForExtension()Landroid/content/Context;
            move-result-object v$tint
            invoke-static {v$tint}, $theme->$getter(Landroid/content/Context;)$theme
            move-result-object v$tint
            iget v$tint, v$tint, $theme->$colorField:I
            int-to-long v$tint, v$tint
            const/16 v$defaults, 0x20
            shl-long/2addr v$tint, v$defaults
            const/4 v$defaults, 0x4
        """.trimIndent()) // sRGB Compose Color = ARGB << 32; keep only modifier defaulted.
    }
    println("$version auto-scroll controls: native primary theme color (2 icons)")
}

private fun BytecodePatchContext.patchLegacyAutoReload(version: String) {
    val v241 = when (version) {
        "0.8.10.241" -> true
        "0.8.10.242 dev" -> false
        else -> return
    }
    val extension = "Lapp/morphe/extension/chmate/LegacyAutoReload;"
    val titleBar = mutableClassDefBy(if (v241) "Lo/ShowFirstParty;" else "Lo/zzaK;")
    titleBar.methods.single { it.name == "setTitle" && it.returnType == "V"
        && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;")
    }.addInstructionsWithLabels(0, """
        invoke-static {p0, p1}, $extension->displayTitle(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
        move-result-object p1
    """.trimIndent())
    val fragmentType = "Ljp/syoboi/a2chMate/ui/reslist/ResListFragment;"
    val controllerType = if (v241) "Lo/getAvailableFeatures;" else "Lo/zzaeg;"
    val minimumField = if (v241) "g" else "j"
    val fragment = mutableClassDefBy(fragmentType)
    val base = mutableClassDefBy("Ljp/syoboi/a2chMate/fragment/RoidonListFragment;")
    listOf(if (v241) "q" else "r", "p").forEach { name ->
        check(base.methods.count { it.name == name && it.parameterTypes.isEmpty() && it.returnType == "V" } == 1)
    }
    check(fragment.fields.any { it.name == (if (v241) "m" else "n") && it.type == "Landroidx/recyclerview/widget/RecyclerView;" })
    check(fragment.fields.any { it.name == (if (v241) "s" else "t") })
    val model = mutableClassDefBy("Ljp/syoboi/a2chMate/ui/reslist/ResListFragmentViewModel;")
    check(model.methods.count { it.name == "b" && it.parameterTypes.map(CharSequence::toString) == listOf("Z") && it.returnType == "Z" } == 1)
    check(model.fields.any { it.name == (if (v241) "al" else "ai") })
    val longClick = fragment.methods.single {
        it.name == "onLongClick" && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/view/View;")
    }
    val original = longClick.implementation!!.instructions.toList()
    check(longClick.implementation!!.registerCount == if (v241) 16 else 15)
    check(mutableClassDefBy(controllerType).fields.any { it.name == minimumField && it.type == "J" })
    val starts = original.mapIndexedNotNull { index, instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        if (ref?.definingClass == controllerType && ref.name == "d" && ref.returnType == "V"
            && ref.parameterTypes.size == 1) index else null
    }
    val defaults = original.mapIndexedNotNull { index, instruction ->
        val literal = (instruction as? NarrowLiteralInstruction)?.narrowLiteral
        if (literal in setOf(7, 15) && (instruction as? OneRegisterInstruction)?.registerA == 1
            && instruction.opcode in setOf(Opcode.CONST_4, Opcode.CONST_16)) index else null
    }
    val boardClamp = original.mapIndexedNotNull { index, instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        if (ref?.definingClass == (if (v241) "Lo/zzapi;" else "Lo/zzcfo;")
            && ref.name == "b" && ref.parameterTypes.map(CharSequence::toString) == listOf("I", "I", "I")
            && ref.returnType == "I") index else null
    }
    check(starts.size == 2 && defaults.size == 2 && boardClamp.size == 1) {
        "$version auto-reload anchors changed: ${starts.size}/${defaults.size}/${boardClamp.size}"
    }
    // Descending edits preserve all original branch labels and other toolbar actions.
    (starts + defaults + boardClamp).sortedDescending().forEach { index ->
        when (index) {
            in starts -> {
                val call = original[index] as FiveRegisterInstruction
                check(call.registerC == if (v241) 15 else 14)
                longClick.replaceInstruction(index, "iget-wide v0, p1, $controllerType->$minimumField:J")
                longClick.addInstructionsWithLabels(index + 1,
                    "invoke-static {p0, v0, v1}, $extension->start(Ljava/lang/Object;J)V")
            }
            in defaults -> {
                longClick.replaceInstruction(index, "invoke-static {}, $extension->intervalSeconds()I")
                longClick.addInstruction(index + 1, "move-result v1")
            }
            else -> {
                val call = original[index] as FiveRegisterInstruction
                longClick.replaceInstruction(index,
                    "invoke-static {v${call.registerC}, v${call.registerD}, v${call.registerE}}, " +
                        "$extension->intervalForBoard(III)I")
            }
        }
    }
    longClick.addInstructionsWithLabels(0, """
        invoke-static {p0, p1}, $extension->stopLongPress(Ljava/lang/Object;Landroid/view/View;)Z
        move-result v0
        if-eqz v0, :stock_long_press
        const/4 v0, 0x1
        return v0
        :stock_long_press
        nop
    """.trimIndent())
    // Hooks must be at entry: p1 is reused as scratch storage by stock code.
    val active = fragment.methods.single { it.name == (if (v241) "a" else "e")
        && it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf("Z") }
    active.addInstructionsWithLabels(0,
        "invoke-static {p0, p1}, $extension->activeTab(Ljava/lang/Object;Z)V")
    val scrolling = fragment.methods.single { it.name == (if (v241) "e" else "b")
        && it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf("Z") }
    scrolling.addInstructionsWithLabels(0,
        "invoke-static {p0, p1}, $extension->scrollState(Ljava/lang/Object;Z)V")
    listOf("onPause", "onDestroyView").forEach { name ->
        fragment.methods.single { it.name == name && it.parameterTypes.isEmpty() }
            .addInstructionsWithLabels(0,
                "invoke-static/range {p0 .. p0}, $extension->stop(Ljava/lang/Object;)V")
    }
    val eventType = if (v241) "Lo/honorsDebugCertificates;" else "Lo/zzacz;"
    val eventKinds = if (v241) listOf("write", "IconCompatParcelizer", "ComponentActivity", "_init_lambda2", "RemoteActionCompatParcelizer", "read")
        else listOf("RemoteActionCompatParcelizer", "read", "write", "r8lambdawJ5MHcSJed_CjC7r4OWD0UxyJsQ", "IconCompatParcelizer", "ComponentActivity")
    eventKinds.forEach { mutableClassDefBy(eventType.removeSuffix(";") + "\$" + it + ";") }
    val eventMethod = fragment.methods.single {
        it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf(fragmentType, eventType)
    }
    eventMethod.addInstructionsWithLabels(0,
        "invoke-static {p0, p1}, $extension->event(Ljava/lang/Object;Ljava/lang/Object;)V")
    println("$version 226-style auto reload: current position, preserved sort, configurable bottom wait")
}

private fun BytecodePatchContext.patchLargeImageAlignment(version: String) {
    val (type, methodName) = when (version) {
        "0.8.10.241" -> "Lo/getCallingPackage;" to "d"
        "0.8.10.242 dev" -> "Lo/zzbfo;" to "c"
        else -> return
    }
    val method = mutableClassDefBy(type).methods.single {
        it.name == methodName && it.returnType == "V" &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/graphics/Matrix;", "I", "I", "F")
    }
    val instructions = method.implementation!!.instructions.toList()
    // Both verified layouts have five locals. p2/p3 are dead after postScale.
    check(method.implementation!!.registerCount == 10)
    val fields = instructions.mapNotNull { (it as? ReferenceInstruction)?.reference as? FieldReference }
    check(fields.any { it.name == "mImageWidth" && it.type == "I" } &&
        fields.any { it.name == "mImageHeight" && it.type == "I" })
    val scaleField = mutableClassDefBy(type).fields.single { it.name == "mScale" && it.type == "F" }
    val returns = instructions.mapIndexedNotNull { index, instruction ->
        if (instruction.opcode == Opcode.RETURN_VOID) index else null
    }
    check(returns.size == 1)
    method.addInstructionsWithLabels(returns.single(), """
        iget v2, p0, $type->mImageWidth:I
        iget v4, p0, $type->mImageHeight:I
        iget p2, p0, $scaleField
        invoke-static {p1, v2, v4, p4, p2}, Lapp/morphe/extension/chmate/LargeImageAlignment;->correct(Landroid/graphics/Matrix;IIFF)V
    """.trimIndent())
    println("$version large-image draft centre correction ($type->$methodName)")
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchThreadSearchText(version: String) {
    val (owner,name,response,body)=when(version){
        "0.8.10.191 dev"->listOf("Lo/m9ExternalSyntheticLambda1\$4;","performFiltering","Lo/processAdDisplayErrorPostbackForUserError;","c")
        "0.8.10.226 dev"->listOf("Lo/listener;","b","Lo/BouncyCastleSocketAdapterCompanion;","d")
        "0.8.10.242 dev"->listOf("Ljp/syoboi/a2chMate/ui/reslist/ResListFragmentViewModel\$menuHostHelperlambda0;","invokeSuspend","Lo/KeJ11;","h")
        else->return
    }
    val method=mutableClassDefBy(owner).methods.single { it.name==name&&(version!="0.8.10.226 dev"||it.parameterTypes==listOf("Lo/listener;","Ljava/lang/CharSequence;"))&&it.implementation!!.instructions.any { instruction ->
        val field=(instruction as? ReferenceInstruction)?.reference as? FieldReference
        field?.definingClass==response&&field.name==body
    } }
    val code=method.implementation!!.instructions.toList()
    val site=code.withIndex().single { (_,instruction)->val field=(instruction as? ReferenceInstruction)?.reference as? FieldReference
        instruction.opcode==Opcode.IGET_OBJECT&&field?.definingClass==response&&field.name==body }
    val field=site.value as TwoRegisterInstruction
    val reset=(site.index+1..site.index+3).single { i->val ref=(code[i] as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass=="Ljava/util/regex/Matcher;"&&ref.name=="reset" }
    val call=code[reset] as FiveRegisterInstruction
    method.replaceInstruction(site.index,"move-object v${field.registerA}, v${field.registerB}")
    if(reset>site.index+1)method.replaceInstruction(site.index+1,"nop")
    method.replaceInstruction(reset,"invoke-static {v${call.registerC}, v${call.registerD}}, Lapp/morphe/extension/chmate/ThreadSearchText;->reset(Ljava/util/regex/Matcher;Ljava/lang/Object;)Ljava/util/regex/Matcher;")
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchImageViewerRotationButton(
    versionName: String,
) {
    val targetImageView = when (versionName) {
        "0.8.10.191 dev" -> "o.qhbExternalSyntheticLambda0"
        "0.8.10.226 dev" -> "o.TTVideoLandingPageActivity4"
        else -> return
    }
    val activityType = "Ljp/syoboi/a2chMate/activity/ImagesViewer2Activity;"
    val onCreate = mutableClassDefBy(activityType).methods.single { method ->
        method.name == "onCreate" && method.returnType == "V"
            && method.parameters.map(CharSequence::toString) == listOf("Landroid/os/Bundle;")
    }
    val returnSites = onCreate.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
        if (instruction.opcode == Opcode.RETURN_VOID) index else null
    }
    returnSites.asReversed().forEach { index ->
        onCreate.addInstructionsWithLabels(index, """
            const-string v0, "$targetImageView"
            move-object/from16 v1, p0
            invoke-static {v1, v0}, Lapp/morphe/extension/chmate/ImageViewerRotationButton;->install(Landroid/app/Activity;Ljava/lang/String;)V
        """.trimIndent())
    }
    val prepareMenu = mutableClassDefBy(activityType).methods.single {
        it.name == "onPrepareOptionsMenu" && it.parameterTypes == listOf("Landroid/view/Menu;") && it.returnType == "Z"
    }
    // A void entry call preserves every native local, return and menu command.
    prepareMenu.addInstructionsWithLabels(0,
        "invoke-static/range {p0 .. p1}, Lapp/morphe/extension/chmate/ImageViewerRotationButton;->prepareMenu(Landroid/app/Activity;Landroid/view/Menu;)V")
    val select = mutableClassDefBy(activityType).methods.single {
        it.name == "onOptionsItemSelected" && it.parameterTypes == listOf("Landroid/view/MenuItem;") && it.returnType == "Z"
    }
    val first = select.implementation!!.instructions.first()
    select.addInstructionsWithLabels(0, """
        invoke-static/range {p0 .. p1}, Lapp/morphe/extension/chmate/ImageViewerRotationButton;->handleMenu(Landroid/app/Activity;Landroid/view/MenuItem;)Z
        move-result v0
        if-eqz v0, :native_rotation_menu
        const/4 v0, 0x1
        return v0
    """.trimIndent(), ExternalLabel("native_rotation_menu", first))
    println("Image viewer rotation button: $versionName -> $targetImageView")
}

/**
 * The response long-press route may skip the menu-template expander. Intercept
 * the external activity launch itself and make only Hissi checker intents
 * explicit to this patched app. This also avoids an Android resolver chooser
 * when several ChMate test builds are installed.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchHissiExternalIntentBoundaries() {
    var patched = 0
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/morphe/extension/")
            || (!classDef.type.startsWith("Ljp/syoboi/")
                && !classDef.type.startsWith("Lo/"))) return@classDefForEach
        val mutableClass = mutableClassDefBy(classDef)
        classDef.methods.forEach methodLoop@ { method ->
            val instructions = method.implementation?.instructions?.toList()
                ?: return@methodLoop
            instructions.mapIndexedNotNull { index, instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference
                    as? MethodReference ?: return@mapIndexedNotNull null
                val parameters = reference.parameterTypes.map(CharSequence::toString)
                val launch = reference.name == "startActivity" && parameters == listOf("Landroid/content/Intent;")
                val launchForResult = reference.name == "startActivityForResult"
                    && parameters == listOf("Landroid/content/Intent;", "I")
                if ((!launch && !launchForResult)
                    || reference.returnType != "V"
                    || reference.definingClass !in setOf(
                        "Landroid/content/Context;", "Landroid/app/Activity;",
                        "Landroidx/fragment/app/Fragment;",
                    )
                ) return@mapIndexedNotNull null
                val register = when (instruction) {
                    is FiveRegisterInstruction -> instruction.registerD
                    is RegisterRangeInstruction -> {
                        if (instruction.registerCount != (if (launchForResult) 3 else 2)) return@mapIndexedNotNull null
                        instruction.startRegister + 1
                    }
                    else -> return@mapIndexedNotNull null
                }
                index to register
            }.asReversed().forEach { (index, register) ->
                val launchName = ((instructions[index] as ReferenceInstruction).reference as MethodReference).name
                val checkerHook = if (launchName == "startActivity")
                    "invoke-static/range {v$register .. v$register}, " +
                        "Lapp/morphe/extension/chmate/HissiMenuCompatibility;->prepareExternalIntent(Landroid/content/Intent;)V\n"
                    else ""
                val mutable = mutableClass.findMutableMethodOf(method)
                val instruction = instructions[index]
                val reference = (instruction as ReferenceInstruction).reference as MethodReference
                val originalLaunch = when (instruction) {
                    is FiveRegisterInstruction -> {
                        val registers = listOf(instruction.registerC, instruction.registerD, instruction.registerE,
                            instruction.registerF, instruction.registerG).take(instruction.registerCount)
                        "${instruction.opcode.name} {${registers.joinToString(", ") { "v$it" }}}, $reference"
                    }
                    is RegisterRangeInstruction -> "${instruction.opcode.name} {v${instruction.startRegister} .. " +
                        "v${instruction.startRegister + instruction.registerCount - 1}}, $reference"
                    else -> error("Unexpected launch instruction")
                }
                // Replace the instruction itself so incoming branches/try-entry labels
                // cannot jump past the hook (191's video helper does exactly that).
                mutable.replaceInstruction(index,
                    "invoke-static/range {v$register .. v$register}, " +
                        "Lapp/morphe/extension/chmate/VideoViewerActivity;->prepareExternalIntent(Landroid/content/Intent;)V")
                mutable.addInstruction(index + 1, originalLaunch)
                if (checkerHook.isNotEmpty()) mutable.addInstruction(index, checkerHook.trim())
                patched++
            }
        }
    }
    check(patched > 0) { "ChMate external activity launch boundary was not found" }
    println("Checker/video external intent boundaries: $patched")
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchModernTalkDatLoading() {
    // Keep Talk's URL, board identity and posting transport. Its DAT reader is
    // already the normal MS932 reader. Supply the live response inside the
    // existing per-thread download lock, before the dynamic Talk auth builder.
    val loader = mutableClassDefBy("Lo/zzaam;").methods.single { method ->
        method.name == "a" && method.returnType == "Lo/zzaai\$write;"
            && method.parameters.map(CharSequence::toString) == listOf(
                "Ljp/syoboi/a2chMate/client/BBSUrlInfo;", "Z", "Lo/zzbly;"
            )
    }
    val instructions = loader.implementation!!.instructions.toList()
    val cacheCall = instructions.indexOfFirst {
        val reference = (it as? ReferenceInstruction)?.reference as? MethodReference
        reference?.definingClass == "Lo/zzadb;" && reference.returnType == "Ljava/io/File;"
            && reference.parameterTypes.map(CharSequence::toString) == listOf(
                "Ljp/syoboi/a2chMate/client/BBSUrlInfo;"
            )
    }.takeIf { it >= 0 } ?: error("ChMate 243 thread cache builder was not found")
    check((instructions[cacheCall + 1] as OneRegisterInstruction).registerA == 5)
    // v0 holds BBSUrlInfo and v5 the cache File. v1 is overwritten immediately
    // afterward by the original preference read, and is free at this boundary.
    loader.addInstructionsWithLabels(cacheCall + 2, """
        invoke-virtual {v0}, Ljp/syoboi/a2chMate/client/BBSUrlInfo;->H()Ljava/lang/String;
        move-result-object v1
        invoke-static {v1, v5}, $EXTENSION->loadLiveTalkDat(Ljava/lang/String;Ljava/io/File;)Z
        move-result v1
        if-eqz v1, :haiagaru_normal_download
        new-instance v1, Lo/zzaai${'$'}write;
        invoke-direct {v1, v5, v0}, Lo/zzaai${'$'}write;-><init>(Ljava/io/File;Ljp/syoboi/a2chMate/client/BBSUrlInfo;)V
        return-object v1
        :haiagaru_normal_download
        nop
    """.trimIndent())
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchModernTalkDatLoading242() {
    val loader = mutableClassDefBy("Lo/getHostAppName;").methods.single { method ->
        method.name == "e" && method.returnType == "Lo/getBackImage\$read;"
            && method.parameters.map(CharSequence::toString) == listOf(
                "Ljp/syoboi/a2chMate/client/BBSUrlInfo;", "Z", "Lo/onTooManyRedirects;"
            )
    }
    val instructions = loader.implementation!!.instructions.toList()
    val cacheCall = instructions.indexOfFirst {
        val reference = (it as? ReferenceInstruction)?.reference as? MethodReference
        reference?.returnType == "Ljava/io/File;"
            && reference.parameterTypes.map(CharSequence::toString) ==
            listOf("Ljp/syoboi/a2chMate/client/BBSUrlInfo;")
    }.takeIf { it >= 0 } ?: error("ChMate 242 thread cache builder was not found")
    val urlRegister = (instructions[cacheCall] as FiveRegisterInstruction).registerD
    val cacheRegister = (instructions[cacheCall + 1] as OneRegisterInstruction).registerA
    val scratch = loader.findFreeRegister(cacheCall + 2)
    loader.addInstructionsWithLabels(cacheCall + 2, """
        invoke-virtual {v$urlRegister}, Ljp/syoboi/a2chMate/client/BBSUrlInfo;->A()Ljava/lang/String;
        move-result-object v$scratch
        invoke-static {v$scratch, v$cacheRegister}, $EXTENSION->loadLiveTalkDat(Ljava/lang/String;Ljava/io/File;)Z
        move-result v$scratch
        if-eqz v$scratch, :haiagaru_242_normal_download
        new-instance v$scratch, Lo/getBackImage${'$'}read;
        invoke-direct {v$scratch, v$cacheRegister, v$urlRegister}, Lo/getBackImage${'$'}read;-><init>(Ljava/io/File;Ljp/syoboi/a2chMate/client/BBSUrlInfo;)V
        return-object v$scratch
        :haiagaru_242_normal_download
        nop
    """.trimIndent())
}

/**
 * 226 has the same native Talk type-4 URL model as 243, but its downloader uses
 * the pre-io class layout. Publish the current Talk JSON as a normal DAT as soon
 * as ChMate resolves the destination file, before its obsolete transport runs.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchPreIoTalkDatLoading() {
    val loader = mutableClassDefBy("Lo/OpenJSSEPlatformCompanion;").methods.single { method ->
        method.name == "c"
            && method.returnType == "Lo/OpenJSSEPlatformCompanion${'$'}write;"
            && method.parameters.map(CharSequence::toString) == listOf(
                "Ljp/syoboi/a2chMate/client/BBSUrlInfo;",
                "Z",
                "Lo/KjvkU;",
            )
    }
    val instructions = loader.implementation?.instructions?.toList()
        ?: error("ChMate 226 thread loader has no implementation")
    val cacheCall = instructions.indices.single { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@single false
        reference.returnType == "Ljava/io/File;"
            && reference.parameterTypes.map(CharSequence::toString) == listOf(
                "Ljp/syoboi/a2chMate/client/BBSUrlInfo;",
            )
            && instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
    }
    val invocation = instructions[cacheCall] as FiveRegisterInstruction
    val urlInfoRegister = invocation.registerD
    val cacheFileRegister =
        (instructions[cacheCall + 1] as OneRegisterInstruction).registerA
    val scratchRegister = loader.findFreeRegister(cacheCall + 2)

    loader.addInstructionsWithLabels(
        cacheCall + 2,
        """
            invoke-static {v$urlInfoRegister}, $EXTENSION->normalizeLegacyTalkTransport(Ljava/lang/Object;)V
            invoke-virtual {v$urlInfoRegister}, Ljp/syoboi/a2chMate/client/BBSUrlInfo;->G()Ljava/lang/String;
            move-result-object v$scratchRegister
            invoke-static {v$scratchRegister, v$cacheFileRegister}, $EXTENSION->loadLiveTalkDat(Ljava/lang/String;Ljava/io/File;)Z
            move-result v$scratchRegister
            if-eqz v$scratchRegister, :haiagaru_226_normal_download
            new-instance v$scratchRegister, Lo/OpenJSSEPlatformCompanion${'$'}write;
            invoke-direct {v$scratchRegister, v$cacheFileRegister, v$urlInfoRegister}, Lo/OpenJSSEPlatformCompanion${'$'}write;-><init>(Ljava/io/File;Ljp/syoboi/a2chMate/client/BBSUrlInfo;)V
            return-object v$scratchRegister
            :haiagaru_226_normal_download
            nop
        """.trimIndent(),
    )
}

/** Cover 242 Talk authentication and token construction, preserving reflected results. */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchTalk242AuthenticationAndTokenCalls() {
    val methods = mutableClassDefBy("Lo/PAGSdk71;").methods.filter { it.name == "d" } +
        mutableClassDefBy("Lo/getTopCountDown;").methods.filter {
            it.name == "b" && it.parameterTypes.map(CharSequence::toString) == listOf(
                "Lo/zzcvr;", "Lo/PAGRewardedAdInteractionCallback;", "Lo/getBackImage\$ComponentActivity;",
            )
        }
    var count = 0
    methods.forEach { method ->
        val instructions = method.implementation?.instructions ?: return@forEach
        val sites = instructions.indices.filter { index ->
            ((instructions[index] as? ReferenceInstruction)?.reference as? MethodReference)
                ?.toString() == "Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;"
        }
        sites.asReversed().forEach { index ->
            val call = instructions[index]
            val registers = when (call) {
                is FiveRegisterInstruction -> "invoke-static {v${call.registerC}, v${call.registerD}, v${call.registerE}}"
                is RegisterRangeInstruction -> "invoke-static/range {v${call.startRegister} .. v${call.startRegister + 2}}"
                else -> error("242 Talk reflection registers not found")
            }
            method.replaceInstruction(index, "$registers, Lapp/morphe/extension/chmate/TalkPostCompatibility;->invoke(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;")
            count++
        }
    }
    check(count > 0) { "242 Talk authentication/token reflection calls not found" }
    println("242 Talk authentication/token compatibility: $count calls")
}

/** Record caught 242 Talk NPE stacks without logging credentials or changing retries. */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchTalkPostDiagnostics242() {
    val method = mutableClassDefBy("Lo/getTopCountDown;").methods.single {
        it.name == "b" && it.parameterTypes.map(CharSequence::toString) == listOf(
            "Lo/zzcvr;", "Lo/PAGRewardedAdInteractionCallback;", "Lo/getBackImage\$ComponentActivity;",
        )
    }
    val handlers = method.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
        if (instruction.opcode == Opcode.MOVE_EXCEPTION) index else null
    }
    check(handlers.isNotEmpty()) { "242 Talk posting exception handlers not found" }
    handlers.asReversed().forEach { index ->
        val register = (method.implementation!!.instructions[index] as OneRegisterInstruction).registerA
        method.addInstruction(
            index + 1,
            "invoke-static/range {v$register .. v$register}, " +
                "Lapp/morphe/extension/chmate/TalkPostDiagnostics;->record(Ljava/lang/Throwable;)V",
        )
    }
}

/** 243's generated token builder keeps its integrity cache in o.setExtras. */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchModernTalkPostIntegrity(
    networkOwner: String = "Lo/zzaat;",
) {
    val networkClass = mutableClassDefBy(networkOwner)
    val candidates = networkClass.methods.flatMap { method ->
        val instructions = method.implementation?.instructions ?: return@flatMap emptyList()
        instructions.mapIndexedNotNull { index, instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
                as? MethodReference ?: return@mapIndexedNotNull null
            if (reference.definingClass != "Ljava/lang/reflect/Method;"
                || reference.name != "invoke"
                || reference.returnType != "Ljava/lang/Object;"
                || instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
                || reference.parameterTypes.map(CharSequence::toString) != listOf(
                    "Ljava/lang/Object;",
                    "[Ljava/lang/Object;",
                )
            ) {
                return@mapIndexedNotNull null
            }
            val isTalkPost = instructions.subList(maxOf(0, index - 180), index)
                .any { previous ->
                    ((previous as? ReferenceInstruction)?.reference as? StringReference)?.string ==
                        "https://api.talk-platform.com/v1/bbs.cgi"
                }
            if (isTalkPost) method to index else null
        }
    }
    check(candidates.size == 1) {
        "Expected one ChMate 243 Talk posting invocation, found ${candidates.size}"
    }
    val (method, index) = candidates.single()
    when (val invocation = method.implementation!!.instructions[index]) {
        is FiveRegisterInstruction -> method.replaceInstruction(
            index,
            "invoke-static {v${invocation.registerC}, v${invocation.registerD}, " +
                "v${invocation.registerE}}, Lapp/morphe/extension/chmate/TalkPostCompatibility;->invoke(" +
                "Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)" +
                "Ljava/lang/Object;",
        )
        is RegisterRangeInstruction -> method.replaceInstruction(
            index,
            "invoke-static/range {v${invocation.startRegister} .. " +
                "v${invocation.startRegister + 2}}, " +
                "Lapp/morphe/extension/chmate/TalkPostCompatibility;->invoke(Ljava/lang/reflect/Method;" +
                "Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;",
        )
        else -> error("ChMate 243 Talk posting invocation registers were not found")
    }
}

/**
 * Tablet mode adds a 50dp Compose Spacer above the response-filter buttons to reserve
 * a banner slot. The banner View itself is already hidden elsewhere, so suppress the
 * captured boolean that emits only this spacer while retaining the filter controls.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchTabletThreadHeaderAdSpace(
    version: String,
) {
    val owner = when (version) {
        // 191 uses top padding on its legacy row; hideLegacyThreadListAd removes it.
        "0.8.10.191 dev" -> return
        "0.8.10.226 dev" -> "Lo/writeWindowUpdateLaterokhttp;"
        "0.8.10.241" -> "Lo/getRewardItem;"
        "0.8.10.242 dev" -> "Lo/isAtLeastS;"
        "0.8.10.243 dev" -> "Lo/zzdhn;"
        else -> return
    }
    val mutableClass = mutableClassDefBy(owner)
    mutableClass.fields.single { field ->
        field.type == "Z" && field.accessFlags and 8 == 0
    }
    val method = mutableClass.methods.single { candidate ->
        candidate.name == "invoke"
            && candidate.returnType == "Ljava/lang/Object;"
            && candidate.parameters.map(CharSequence::toString) == listOf(
                "Ljava/lang/Object;",
                "Ljava/lang/Object;",
            )
    }
    method.addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p0 .. p0 }, $EXTENSION->suppressTabletThreadHeaderAdSpace(Ljava/lang/Object;)V
        """.trimIndent(),
    )
}

/** Preserve ChMate's default layout unless the user enables top-aligned short threads. */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchShortThreadTopAlignment(
    version: String,
) {
    val layout = when (version) {
        "0.8.10.241" -> "b"
        "0.8.10.242 dev", "0.8.10.243 dev" -> "c"
        else -> return
    }
    val method = mutableClassDefBy("Landroidx/recyclerview/widget/LinearLayoutManager;")
        .methods.single { candidate ->
            candidate.name == layout && candidate.returnType == "V"
                && candidate.parameters.size == 2
                && candidate.parameters.all { it.type.startsWith("Landroidx/recyclerview/widget/RecyclerView${'$'}") }
        }
    method.implementation!!.instructions.withIndex()
        .filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }.asReversed()
        .forEach { index ->
            method.addInstructionsWithLabels(index, """
                invoke-static/range {p0 .. p0}, $EXTENSION->alignShortThreadAfterLayout(Ljava/lang/Object;)V
            """.trimIndent())
        }
}

/**
 * Normalizes the result of 243's certificate-derived helper before the generated Talk
 * token builder consumes it. The generated wrapper itself is loaded from an in-memory
 * DEX, while this helper and SafeParcelableReserved$4 are regular APK classes.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchModernTalkIntegrityPrimitives(
    owner: String = "Lo/zzeyn${'$'}read;",
    normalizer: String = "normalizeIntegrityState",
) {
    val integrityMethod = mutableClassDefBy(owner).methods.single { method ->
        method.name == "d"
            && method.returnType == "[Ljava/lang/Object;"
            && method.parameters.map(CharSequence::toString) == listOf(
                "Landroid/content/Context;",
                "[Ljava/lang/String;",
                "I",
                "I",
                "I",
            )
    }
    val returnSites = integrityMethod.implementation!!.instructions
        .mapIndexedNotNull { index, instruction ->
            if (instruction.opcode == Opcode.RETURN_OBJECT) {
                index to (instruction as OneRegisterInstruction).registerA
            } else {
                null
            }
        }
    check(returnSites.isNotEmpty()) { "ChMate 243 integrity helper return was not found" }
    returnSites.asReversed().forEach { (index, register) ->
        integrityMethod.addInstructionsWithLabels(
            index,
            """
                invoke-static {v$register}, Lapp/morphe/extension/chmate/TalkPostCompatibility;->$normalizer([Ljava/lang/Object;)[Ljava/lang/Object;
                move-result-object v$register
            """.trimIndent(),
        )
    }
}


private fun app.morphe.patcher.patch.BytecodePatchContext.patchPreIoTalkPostIntegrity() {
    val networkClass = mutableClassDefBy("Lo/OpenJSSEPlatformCompanion;")
    val candidates = networkClass.methods.flatMap { method ->
        val instructions = method.implementation?.instructions ?: return@flatMap emptyList()
        instructions.mapIndexedNotNull { index, instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
                as? MethodReference ?: return@mapIndexedNotNull null
            if (reference.definingClass != "Ljava/lang/reflect/Method;"
                || reference.name != "invoke"
                || reference.returnType != "Ljava/lang/Object;"
                || instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
                || reference.parameterTypes.map(CharSequence::toString) != listOf(
                    "Ljava/lang/Object;",
                    "[Ljava/lang/Object;",
                )
            ) {
                return@mapIndexedNotNull null
            }
            val isTalkPost = instructions.subList(maxOf(0, index - 180), index)
                .any { previous ->
                    ((previous as? ReferenceInstruction)?.reference as? StringReference)?.string ==
                        "https://api.talk-platform.com/v1/bbs.cgi"
                }
            if (isTalkPost) method to index else null
        }
    }
    check(candidates.size == 1) {
        "Expected one ChMate 226 Talk posting invocation, found ${candidates.size}"
    }
    val (method, index) = candidates.single()
    when (val invocation = method.implementation!!.instructions[index]) {
        is FiveRegisterInstruction -> method.replaceInstruction(
            index,
            "invoke-static {v${invocation.registerC}, v${invocation.registerD}, " +
                "v${invocation.registerE}}, $EXTENSION->invokePreIoTalkPoster(" +
                "Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)" +
                "Ljava/lang/Object;",
        )
        is RegisterRangeInstruction -> method.replaceInstruction(
            index,
            "invoke-static/range {v${invocation.startRegister} .. " +
                "v${invocation.startRegister + 2}}, " +
                "$EXTENSION->invokePreIoTalkPoster(Ljava/lang/reflect/Method;" +
                "Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;",
        )
        else -> error("ChMate 226 Talk posting invocation registers were not found")
    }

    val sessionMethod = mutableClassDefBy("Lo/getSelectedProtocol;").methods.single { candidate ->
        candidate.name == "d"
            && candidate.returnType == "Ljava/lang/String;"
            && candidate.parameterTypes.map(CharSequence::toString) ==
                listOf("Lo/OpenJSSEPlatformCompanion;")
    }
    val sessionInstructions = sessionMethod.implementation?.instructions
        ?: error("ChMate 226 Talk session method has no implementation")
    val sessionInvocations = sessionInstructions.indices.filter { sessionIndex ->
        val reference = (sessionInstructions[sessionIndex] as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@filter false
        if (reference.definingClass != "Ljava/lang/reflect/Method;"
            || reference.name != "invoke"
            || reference.returnType != "Ljava/lang/Object;"
            || reference.parameterTypes.map(CharSequence::toString) != listOf(
                "Ljava/lang/Object;", "[Ljava/lang/Object;"
            )
            || sessionInstructions.getOrNull(sessionIndex + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT
        ) return@filter false
        val cast = sessionInstructions.getOrNull(sessionIndex + 2) as? ReferenceInstruction
            ?: return@filter false
        cast.opcode == Opcode.CHECK_CAST && cast.reference.toString() == "Ljava/lang/String;"
    }
    check(sessionInvocations.size == 1) {
        "Expected one ChMate 226 Talk session invocation, found ${sessionInvocations.size}"
    }
    val sessionIndex = sessionInvocations.single()
    when (val invocation = sessionInstructions[sessionIndex]) {
        is FiveRegisterInstruction -> sessionMethod.replaceInstruction(
            sessionIndex,
            "invoke-static {v${invocation.registerC}, v${invocation.registerD}, " +
                "v${invocation.registerE}}, $EXTENSION->invokePreIoTalkAuthenticator(" +
                "Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)" +
                "Ljava/lang/Object;",
        )
        is RegisterRangeInstruction -> sessionMethod.replaceInstruction(
            sessionIndex,
            "invoke-static/range {v${invocation.startRegister} .. " +
                "v${invocation.startRegister + 2}}, " +
                "$EXTENSION->invokePreIoTalkAuthenticator(Ljava/lang/reflect/Method;" +
                "Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;",
        )
        else -> error("ChMate 226 Talk session invocation registers were not found")
    }

    // Unlike 191, 226 resolves its generated write key before the reflected
    // poster is invoked. Removing talk_write_key at method entry makes that
    // resolver throw NullPointerException before the integrity wrapper can run.
    // Keep 226's persisted session intact and repair only o.head at the exact
    // reflected invocation boundary, which is the proven 1.3.0 behavior.
}

/** Normalize 191's legacy Talk read.cgi URL before BBSUrlInfo parses a post target. */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacyTalkWriteUrlParsing() {
    val urlInfoClass = mutableClassDefBy("Ljp/syoboi/a2chMate/client/BBSUrlInfo;")
    val parser = urlInfoClass.methods.single { method ->
        method.name == "c"
            && method.returnType == "Ljp/syoboi/a2chMate/client/BBSUrlInfo;"
            && method.parameters.map(CharSequence::toString) == listOf("Ljava/lang/String;")
    }
    check(parser.implementation != null) {
        "ChMate 191 BBSUrlInfo URL parser has no implementation"
    }
    // p0 is the URL argument. The helper is a no-op for all non-Talk URLs and
    // for Talk URLs already using /boards/<board>/<thread>.
    parser.addInstructionsWithLabels(
        0,
        """
            invoke-static/range {p0 .. p0}, $EXTENSION->normalizeLegacyTalkWriteUrl(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p0
        """.trimIndent(),
    )
}

/**
 * ChMate 0.8.10.191 builds every Talk request through a dynamically restored
 * authentication class. Re-signing makes that class enter its decoy arithmetic
 * branch before the already-imported DAT can be read. Haiagaru imports the current
 * Talk API response into ChMate's cache first, so route only this Talk request
 * branch through the ordinary DAT builder and leave every other network path intact.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacyTalkDatLoading() {
    val method = mutableClassDefBy("Lo/getLabel;").methods.single { method ->
        method.name == "b"
            && method.parameters.size == 4
            && method.parameters[0].toString() ==
                "Ljp/syoboi/a2chMate/client/BBSUrlInfo;"
            && method.parameters[1].toString() == "Z"
            && method.parameters[2].toString() == "Z"
    }
    // The URL classifier is not the only constructor used by 191.  Normalize
    // the transport immediately before the downloader reads BBSUrlInfo so a
    // Talk request cannot fall through to the re-signed type-4 authenticator.
    // p1 lives above v15 in this large method. The non-range invoke cannot
    // encode it, so keep the existing parameter register via invoke-range.
    method.addInstruction(
        0,
        "invoke-static/range {p1 .. p1}, $EXTENSION->normalizeLegacyTalkTransport(Ljava/lang/Object;)V",
    )
    val instructions = method.implementation?.instructions?.toList()
        ?: error("ChMate legacy thread loader has no implementation")
    val cachePathIndex = instructions.indexOfFirst { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@indexOfFirst false
        reference.returnType == "Ljava/io/File;"
            && reference.parameterTypes.map(CharSequence::toString) == listOf(
                "Ljp/syoboi/a2chMate/client/BBSUrlInfo;"
            )
    }.takeIf { it >= 0 }
        ?: error("ChMate legacy Talk cache path builder was not found")
    // v0 is the requested BBSUrlInfo and v11 is ChMate's exact DAT cache file.
    // Import the current Talk JSON response there and return it immediately.
    // Continuing into 191's normal downloader would request the obsolete
    // talk.jp/<board>/dat/<thread>.dat endpoint and replace a valid import with
    // a false DAT落ち result.
    method.addInstructionsWithLabels(
        cachePathIndex + 2,
        """
            invoke-virtual {v0}, Ljp/syoboi/a2chMate/client/BBSUrlInfo;->o()Ljava/lang/String;
            move-result-object v14
            invoke-static {v14, v11}, $EXTENSION->loadLiveTalkDat(Ljava/lang/String;Ljava/io/File;)Z
            move-result v14
            if-eqz v14, :haiagaru_normal_download
            new-instance v14, Lo/getLabel${'$'}IconCompatParcelizer;
            const/4 v1, 0x0
            invoke-direct {v14, v11, v1, v0, v1}, Lo/getLabel${'$'}IconCompatParcelizer;-><init>(Ljava/io/File;ILjp/syoboi/a2chMate/client/BBSUrlInfo;I)V
            return-object v14
            :haiagaru_normal_download
            nop
        """.trimIndent(),
    )

    // Normalizing the URL model's transport to type 1 avoids ChMate 191's
    // re-signed type-4 loader trap, but the same model is also used by the
    // response list to decide whether posting is supported. Restore its
    // original Talk type on every normal return path after DAT loading.
    val returnIndices = method.implementation?.instructions
        ?.mapIndexedNotNull { index, instruction ->
            index.takeIf { instruction.opcode == Opcode.RETURN_OBJECT }
        } ?: error("ChMate legacy Talk thread loader has no return instructions")
    check(returnIndices.isNotEmpty()) { "ChMate legacy Talk thread loader has no object returns" }
    returnIndices.asReversed().forEach { index ->
        method.addInstruction(
            index,
            "invoke-static/range {p1 .. p1}, " +
                "$EXTENSION->restoreLegacyTalkTransport(Ljava/lang/Object;)V",
        )
    }
}

/**
 * The 191 Talk client is restored into an InMemoryDexClassLoader. Its generated
 * request signer compares two certificate-derived integers and enters a deliberate
 * divide-by-zero branch after Morphe re-signs the APK. Normalize that generated
 * state immediately after the Talk client instance is constructed, before its
 * authentication method is invoked.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacyTalkAuthIntegrity(includeSessionRecovery: Boolean = true) {
    val method = mutableClassDefBy("Lo/setAdLoadFailureInfo;").methods.single { method ->
        method.name == "c"
            && method.returnType == "Ljava/lang/String;"
            && method.parameters.map(CharSequence::toString) == listOf("Lo/getLabel;")
    }
    val instructions = method.implementation?.instructions?.toList()
        ?: error("ChMate legacy Talk authentication method has no implementation")
    val newInstanceIndex = instructions.indices.single { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@single false
        reference.definingClass == "Ljava/lang/reflect/Constructor;"
            && reference.name == "newInstance"
            && reference.returnType == "Ljava/lang/Object;"
            && instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
    }
    val authClientRegister =
        (instructions[newInstanceIndex + 1] as OneRegisterInstruction).registerA
    method.addInstruction(
        newInstanceIndex + 2,
        "invoke-static {v$authClientRegister}, " +
            "$EXTENSION->normalizeLegacyTalkAuthIntegrity(Ljava/lang/Object;)V",
    )
    // The generated client may refresh its static integrity cache after construction.
    // Route the reflected authenticator through a one-shot recovery wrapper so that
    // the cache is normalized at the actual invocation boundary as well.
    val invokes = method.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@mapIndexedNotNull null
        if (reference.definingClass == "Ljava/lang/reflect/Method;"
            && reference.name == "invoke"
            && reference.returnType == "Ljava/lang/Object;"
            && reference.parameterTypes.map(CharSequence::toString) == listOf(
                "Ljava/lang/Object;", "[Ljava/lang/Object;"
            )
        ) index else null
    }
    check(invokes.isNotEmpty()) { "ChMate legacy Talk authenticator invocation was not found" }
    invokes.asReversed().forEach { index ->
        when (val invocation = method.implementation!!.instructions[index]) {
            is FiveRegisterInstruction -> method.replaceInstruction(
                index,
                "invoke-static {v${invocation.registerC}, v${invocation.registerD}, " +
                    "v${invocation.registerE}}, $EXTENSION->invokeLegacyTalkAuthenticator(" +
                    "Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)" +
                    "Ljava/lang/Object;",
            )
            is RegisterRangeInstruction -> method.replaceInstruction(
                index,
                "invoke-static/range {v${invocation.startRegister} .. " +
                    "v${invocation.startRegister + 2}}, $EXTENSION->invokeLegacyTalkAuthenticator(" +
                    "Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)" +
                    "Ljava/lang/Object;",
            )
            else -> error("ChMate legacy Talk authenticator registers were not found")
        }
    }

    if (!includeSessionRecovery) return

    val postMethod = mutableClassDefBy("Lo/getLabel;").methods.single { candidate ->
        candidate.name == "b"
            && candidate.returnType == "Lo/getMediatedNetwork;"
            && candidate.parameterTypes.map(CharSequence::toString) == listOf(
                "Lo/r8lambdaz0gPFulMuhJ_LGn4qb5HDvuDsis;",
                "Lo/getCredentials\$write;",
                "Lo/getLabel\$read;",
            )
    }
    postMethod.addInstruction(
        0,
        "invoke-static {}, $EXTENSION->prepareLegacyTalkPostSession()V",
    )

    // The 401 confirmation flow persists x-write-key before asking the user.
    // Cancelling drops the matching one-shot extend token, so discard only the
    // renewable Talk write session before the original error path continues.
    val postInstructions = postMethod.implementation?.instructions?.toList()
        ?: error("ChMate legacy Talk post method has no implementation")
    val confirmationCallbacks = postInstructions.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@mapIndexedNotNull null
        if (reference.definingClass == "Lo/getLabel\$read;"
            && reference.name == "e"
            && reference.returnType == "Z"
            && reference.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;")
            && postInstructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT
        ) index else null
    }
    check(confirmationCallbacks.size == 1) {
        "Expected one ChMate legacy Talk confirmation callback, found ${confirmationCallbacks.size}"
    }
    val callbackIndex = confirmationCallbacks.single()
    val acceptedRegister = (postInstructions[callbackIndex + 1] as OneRegisterInstruction).registerA
    postMethod.addInstructionsWithLabels(
        callbackIndex + 2,
        """
            if-nez v$acceptedRegister, :haiagaru_talk_confirmation_accepted
            invoke-static {}, $EXTENSION->resetLegacyTalkPostSession()V
            :haiagaru_talk_confirmation_accepted
            nop
        """.trimIndent(),
    )
}

/** Bypass 241's generated signature gate by publishing the Talk JSON as DAT. */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchIoTalkDatLoading() {
    val networkClass = mutableClassDefBy("Lo/VLj;")
    val method = networkClass.methods.singleOrNull { candidate ->
        candidate.name == "e"
            && candidate.returnType == "Lo/VLj\$RemoteActionCompatParcelizer;"
            && candidate.parameterTypes.map(CharSequence::toString) == listOf(
                "Ljp/syoboi/a2chMate/client/BBSUrlInfo;",
                "Z",
                "Lo/GNk17;",
            )
    } ?: error("ChMate 241 Talk DAT request method was not found")
    val instructions = method.implementation?.instructions
        ?: error("ChMate 241 Talk DAT request method has no implementation")
    val candidates = instructions.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@mapIndexedNotNull null
        if (reference.returnType != "Ljava/io/File;"
            || reference.parameterTypes.map(CharSequence::toString) != listOf(
                "Ljp/syoboi/a2chMate/client/BBSUrlInfo;",
            )
            || instructions.getOrNull(index + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT
        ) return@mapIndexedNotNull null
        index
    }
    check(candidates.size == 1) {
        "Expected one ChMate 241 Talk cache invocation, found ${candidates.size}"
    }
    val cacheCall = candidates.single()
    val invocation = instructions[cacheCall] as FiveRegisterInstruction
    val urlInfoRegister = invocation.registerD
    val cacheFileRegister = (instructions[cacheCall + 1] as OneRegisterInstruction).registerA
    val scratchRegister = method.findFreeRegister(cacheCall + 2)
    method.addInstructionsWithLabels(
        cacheCall + 2,
        """
            invoke-virtual {v$urlInfoRegister}, Ljp/syoboi/a2chMate/client/BBSUrlInfo;->D()Ljava/lang/String;
            move-result-object v$scratchRegister
            invoke-static {v$scratchRegister, v$cacheFileRegister}, $EXTENSION->loadLiveTalkDat(Ljava/lang/String;Ljava/io/File;)Z
            move-result v$scratchRegister
            if-eqz v$scratchRegister, :haiagaru_241_normal_download
            new-instance v$scratchRegister, Lo/VLj${'$'}RemoteActionCompatParcelizer;
            invoke-direct {v$scratchRegister, v$cacheFileRegister, v$urlInfoRegister}, Lo/VLj${'$'}RemoteActionCompatParcelizer;-><init>(Ljava/io/File;Ljp/syoboi/a2chMate/client/BBSUrlInfo;)V
            return-object v$scratchRegister
            :haiagaru_241_normal_download
            nop
        """.trimIndent(),
    )
}

/**
 * 241 computes the start of an UPLIFT success-cast diagnostic through an
 * obfuscated, signature-dependent division. On repackaged APKs it can become
 * -1 (or divide by zero) before the successful login result is stored.
 * Keep the login result handling intact and restore the diagnostic's literal
 * prefix length. The string starts with "2," and should be sliced after it.
 */
private fun BytecodePatchContext.patchIoUpliftLoginCastMessage() {
    val message = "2,null cannot be cast to non-null type " +
        "jp.syoboi.a2chMate.bbs.a5ch.UpliftClient.LoginResult.Success"
    val owner = mutableClassDefBy("Lo/VLj;")
    val candidates = owner.methods.mapNotNull { method ->
        val instructions = method.implementation?.instructions?.toList() ?: return@mapNotNull null
        val messageIndex = instructions.indexOfFirst { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == message
        }
        if (messageIndex < 0) return@mapNotNull null
        val substringIndex = (messageIndex + 1 until minOf(messageIndex + 5, instructions.size))
            .firstOrNull { index ->
                val reference = (instructions[index] as? ReferenceInstruction)?.reference
                    as? MethodReference
                reference?.definingClass == "Ljava/lang/String;"
                    && reference.name == "substring"
                    && reference.parameterTypes.map(CharSequence::toString) == listOf("I")
            } ?: return@mapNotNull null
        method to substringIndex
    }
    check(candidates.size == 1) { "Expected one ChMate 241 UPLIFT cast message, found ${candidates.size}" }
    val (method, substringIndex) = candidates.single()
    val indexRegister = when (val call = method.implementation!!.instructions[substringIndex]) {
        is FiveRegisterInstruction -> call.registerD
        is RegisterRangeInstruction -> call.startRegister + 1
        else -> error("ChMate 241 UPLIFT substring index register changed")
    }
    // Fix the calculation itself: overriding substring's argument afterwards
    // still lets the signature-derived division throw before reaching it.
    val instructions = method.implementation!!.instructions.toList()
    val divisionIndex = substringIndex - 2
    val division = instructions[divisionIndex]
    check(division.opcode == Opcode.DIV_INT_2ADDR
        && (division as TwoRegisterInstruction).registerA == indexRegister) {
        "ChMate 241 UPLIFT diagnostic division changed"
    }
    val numerator = instructions[divisionIndex - 1] as? NarrowLiteralInstruction
    check(numerator?.narrowLiteral == 7120) {
        "ChMate 241 UPLIFT diagnostic numerator changed"
    }
    method.replaceInstruction(divisionIndex, "const/4 v$indexRegister, 0x2")
}

/** 241's cached UPLIFT token expiry adds a signature-derived quotient to a
 * roughly one-day TTL. The divisor can be zero after repackaging; the quotient
 * is not needed to decide whether the cached token is still valid. */
private fun BytecodePatchContext.patchIoUpliftTokenExpiryArithmetic() =
    patchUpliftTokenExpiryArithmetic("Lo/VLj;", "c", "Lo/VLj\$ComponentActivity;", 1284195)

private fun BytecodePatchContext.patchUpliftTokenExpiryArithmetic(
    ownerType: String, methodName: String, parameterType: String, numerator: Int,
) {
    val method = mutableClassDefBy(ownerType).methods.single { candidate ->
        candidate.name == methodName && candidate.returnType == "Ljava/lang/String;" &&
            candidate.parameters.map(CharSequence::toString) == listOf(parameterType)
    }
    val instructions = method.implementation?.instructions?.toList()
        ?: error("UPLIFT token expiry method missing: $ownerType.$methodName")
    val expiryConstant = instructions.indices.singleOrNull { index ->
        (instructions[index] as? NarrowLiteralInstruction)?.narrowLiteral == numerator
    } ?: error("UPLIFT token expiry constant missing: $ownerType.$methodName")
    val divides = (expiryConstant + 1 until minOf(expiryConstant + 12, instructions.size))
        .filter { index -> instructions[index].opcode == Opcode.DIV_INT ||
            instructions[index].opcode == Opcode.DIV_INT_2ADDR }
    check(divides.size == 1) {
        "UPLIFT token expiry divide changed in $ownerType.$methodName: ${divides.size} " +
            instructions.subList(expiryConstant, minOf(expiryConstant + 12, instructions.size))
                .map { it.opcode }
    }
    val index = divides.single()
    val result = when (val divide = instructions[index]) {
        is ThreeRegisterInstruction -> divide.registerA
        is TwoRegisterInstruction -> divide.registerA
        else -> error("UPLIFT token expiry destination changed in $ownerType.$methodName")
    }
    method.replaceInstruction(index, "const/4 v$result, 0x0")
}

/** 241 uses the same generated Talk authenticator behind a differently obfuscated caller. */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchIoTalkPostIntegrity() {
    patchIoTalkAuthentication()
    val networkClass = mutableClassDefBy("Lo/VLj;")
    val candidates = networkClass.methods.flatMap { method ->
        val instructions = method.implementation?.instructions ?: return@flatMap emptyList()
        instructions.mapIndexedNotNull { index, instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
                as? MethodReference ?: return@mapIndexedNotNull null
            if (reference.definingClass != "Ljava/lang/reflect/Method;"
                || reference.name != "invoke"
                || reference.returnType != "Ljava/lang/Object;"
                // The first reflection call reads a String used as a request field.
                // The generated Talk poster is the subsequent void-style invocation.
                || instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
                || reference.parameterTypes.map(CharSequence::toString) != listOf(
                    "Ljava/lang/Object;",
                    "[Ljava/lang/Object;",
                )
            ) return@mapIndexedNotNull null
            val isTalkPost = instructions.subList(maxOf(0, index - 260), index).any { previous ->
                ((previous as? ReferenceInstruction)?.reference as? StringReference)?.string ==
                    "https://api.talk-platform.com/v1/bbs.cgi"
            }
            if (isTalkPost) method to index else null
        }
    }
    check(candidates.size == 1) {
        "Expected one ChMate 241 Talk posting invocation, found ${candidates.size}"
    }
    val (method, index) = candidates.single()
    when (val invocation = method.implementation!!.instructions[index]) {
        is FiveRegisterInstruction -> method.replaceInstruction(
            index,
            "invoke-static {v${invocation.registerC}, v${invocation.registerD}, " +
                "v${invocation.registerE}}, $EXTENSION->invokeIoTalkPoster(" +
                "Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)" +
                "Ljava/lang/Object;",
        )
        is RegisterRangeInstruction -> method.replaceInstruction(
            index,
            "invoke-static/range {v${invocation.startRegister} .. " +
                "v${invocation.startRegister + 2}}, $EXTENSION->invokeIoTalkPoster(" +
                "Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)" +
                "Ljava/lang/Object;",
        )
        else -> error("ChMate 241 Talk posting invocation registers were not found")
    }

    // 241 resolves the renewable Talk key through another generated method
    // immediately before the poster. The reflected call returns a small holder
    // whose `c` field contains the key, rather than returning String directly.
    // Protect that invocation as well; otherwise stale/signature-derived state
    // can fail before the already-wrapped header builder is reached.
    val currentInstructions = method.implementation!!.instructions
    val keyInvocations = currentInstructions.indices.filter { keyIndex ->
        if (keyIndex >= index) return@filter false
        val reference = (currentInstructions[keyIndex] as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@filter false
        if (reference.definingClass != "Ljava/lang/reflect/Method;"
            || reference.name != "invoke"
            || reference.returnType != "Ljava/lang/Object;"
            || reference.parameterTypes.map(CharSequence::toString) != listOf(
                "Ljava/lang/Object;", "[Ljava/lang/Object;"
            )
            || currentInstructions.getOrNull(keyIndex + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT
        ) return@filter false
        val cast = currentInstructions.getOrNull(keyIndex + 2) as? ReferenceInstruction
            ?: return@filter false
        cast.opcode == Opcode.CHECK_CAST
            && cast.reference.toString() == "Lo/setTimeUpdate\$RemoteActionCompatParcelizer;"
    }
    check(keyInvocations.size == 1) {
        "Expected one ChMate 241 Talk key invocation, found ${keyInvocations.size}"
    }
    val keyIndex = keyInvocations.single()
    when (val invocation = currentInstructions[keyIndex]) {
        is FiveRegisterInstruction -> method.replaceInstruction(
            keyIndex,
            "invoke-static {v${invocation.registerC}, v${invocation.registerD}, " +
                "v${invocation.registerE}}, $EXTENSION->invokeIoTalkPoster(" +
                "Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)" +
                "Ljava/lang/Object;",
        )
        is RegisterRangeInstruction -> method.replaceInstruction(
            keyIndex,
            "invoke-static/range {v${invocation.startRegister} .. " +
                "v${invocation.startRegister + 2}}, $EXTENSION->invokeIoTalkPoster(" +
                "Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)" +
                "Ljava/lang/Object;",
        )
        else -> error("ChMate 241 Talk key invocation registers were not found")
    }
}

/** Replaces 241's generated Talk login digest invocation with the stable extension path. */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchIoTalkAuthentication() {
    val authClass = mutableClassDefBy("Lo/updateRenderInfoForVideo;")
    val authMethod = authClass.methods.singleOrNull { method ->
        method.name == "d"
            && method.parameterTypes.map(CharSequence::toString) == listOf("Lo/VLj;")
            && method.returnType == "Ljava/lang/String;"
    } ?: error("ChMate 241 Talk authentication method was not found")
    val instructions = authMethod.implementation?.instructions
        ?: error("ChMate 241 Talk authentication implementation was not found")
    val candidates = instructions.indices.filter { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@filter false
        if (reference.definingClass != "Ljava/lang/reflect/Method;"
            || reference.name != "invoke"
            || reference.returnType != "Ljava/lang/Object;"
            || reference.parameterTypes.map(CharSequence::toString) != listOf(
                "Ljava/lang/Object;", "[Ljava/lang/Object;"
            )
        ) return@filter false
        instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
            && (instructions.getOrNull(index + 2) as? ReferenceInstruction)
                ?.reference?.toString() == "Ljava/lang/String;"
    }
    check(candidates.size == 1) {
        "Expected one ChMate 241 Talk authentication invocation, found ${candidates.size}"
    }
    val index = candidates.single()
    when (val invocation = instructions[index]) {
        is FiveRegisterInstruction -> authMethod.replaceInstruction(
            index,
            "invoke-static {v${invocation.registerC}, v${invocation.registerD}, " +
                "v${invocation.registerE}}, $EXTENSION->invokeIoTalkAuth(" +
                "Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)" +
                "Ljava/lang/Object;",
        )
        is RegisterRangeInstruction -> authMethod.replaceInstruction(
            index,
            "invoke-static/range {v${invocation.startRegister} .. " +
                "v${invocation.startRegister + 2}}, $EXTENSION->invokeIoTalkAuth(" +
                "Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)" +
                "Ljava/lang/Object;",
        )
        else -> error("ChMate 241 Talk authentication invocation registers were not found")
    }
}

/**
 * 241 sends the cached DAT ETag on every normal thread refresh.  Immediately
 * after a successful post the server can still expose the preceding ETag, so
 * the refresh returns 304 and ChMate reports "no update" while the local post
 * is not rendered.  Skip only this conditional header in 241's downloader;
 * the normal response and local index handling remain unchanged.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchIoThreadRefreshCache() {
    val networkClass = mutableClassDefBy("Lo/VLj;")
    val downloader = networkClass.methods.singleOrNull { method ->
        method.name == "e"
            && method.returnType == "Lo/VLj\$RemoteActionCompatParcelizer;"
            && method.parameterTypes.map(CharSequence::toString) == listOf(
                "Ljp/syoboi/a2chMate/client/BBSUrlInfo;",
                "Z",
                "Lo/GNk17;",
            )
    } ?: error("ChMate 241 thread downloader was not found")
    val instructions = downloader.implementation?.instructions
        ?: error("ChMate 241 thread downloader has no implementation")
    val etagNames = instructions.indices.filter { index ->
        ((instructions[index] as? ReferenceInstruction)?.reference as? StringReference)
            ?.string == "If-None-Match"
    }
    check(etagNames.size == 1) {
        "Expected one ChMate 241 If-None-Match header, found ${etagNames.size}"
    }
    val nameIndex = etagNames.single()
    val headerCall = instructions.indices.firstOrNull { index ->
        index > nameIndex
            && ((instructions[index] as? ReferenceInstruction)?.reference as? MethodReference)
                ?.let { reference ->
                    reference.definingClass == "Lokhttp3/Headers\$ComponentActivity;"
                        && reference.name == "c"
                        && reference.parameterTypes.map(CharSequence::toString) ==
                            listOf("Ljava/lang/String;", "Ljava/lang/String;")
                } == true
    } ?: error("ChMate 241 If-None-Match header call was not found")
    val resume = instructions.getOrNull(headerCall + 1)
        ?: error("ChMate 241 If-None-Match header has no continuation")
    val register = downloader.findFreeRegister(headerCall)
    downloader.addInstructionsWithLabels(
        headerCall,
        """
            invoke-static {}, Lapp/morphe/extension/chmate/ThreadRefreshOptions;->skipConditionalHeaders()Z
            move-result v$register
            if-nez v$register, :haiagaru_241_skip_etag
        """.trimIndent(),
        ExternalLabel("haiagaru_241_skip_etag", resume),
    )
}

private const val ANDROID_XML_NAMESPACE = "http://schemas.android.com/apk/res/android"
private const val OPEN_URL_ACTIVITY = "app.morphe.extension.chmate.OpenUrlActivity"
private const val HISSI_MENU_ACTIVITY = "app.morphe.extension.chmate.HissiMenuActivity"

private data class OpenUrlPattern(
    val scheme: String,
    val host: String,
    val port: Int?,
    val path: String?,
    val prefix: Boolean,
)

private fun parseAdditionalOpenUrls(value: String): List<OpenUrlPattern> {
    val entries = value.split(Regex("[,\\r\\n]+"))
        .map(String::trim)
        .filter(String::isNotEmpty)
    if (entries.size > 32) {
        throw PatchException("追加できるURLは32件までです。")
    }
    return entries.map { entry ->
        val prefix = entry.endsWith("/*")
        val url = if (prefix) entry.dropLast(1) else entry
        val uri = try {
            URI(url)
        } catch (_: Exception) {
            throw PatchException("URLの形式が正しくありません: $entry")
        }
        val scheme = uri.scheme?.lowercase(Locale.ROOT)
        val host = uri.host?.lowercase(Locale.ROOT)
        if (scheme !in setOf("http", "https") || host.isNullOrBlank()
            || uri.userInfo != null || uri.query != null || uri.fragment != null
            || uri.port == 0 || uri.port > 65535 || uri.path?.contains('*') == true
        ) {
            throw PatchException("http(s)のURLを指定してください（クエリ・#・途中の*は不可）: $entry")
        }
        OpenUrlPattern(
            scheme = requireNotNull(scheme),
            host = host,
            port = uri.port.takeIf { it >= 0 },
            path = uri.path?.takeIf(String::isNotEmpty),
            prefix = prefix,
        )
    }.distinct()
}

private fun Document.addOpenUrlFilter(
    activity: Element,
    schemes: List<String>,
    host: String,
    port: Int? = null,
    path: String? = null,
    pathAttribute: String = "android:path",
) {
    val filter = createElement("intent-filter")
    filter.appendChild(createElement("action").apply {
        setAttributeNS(ANDROID_XML_NAMESPACE, "android:name", "android.intent.action.VIEW")
    })
    listOf("android.intent.category.DEFAULT", "android.intent.category.BROWSABLE")
        .forEach { categoryName ->
            filter.appendChild(createElement("category").apply {
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:name", categoryName)
            })
        }
    schemes.forEach { scheme ->
        filter.appendChild(createElement("data").apply {
            setAttributeNS(ANDROID_XML_NAMESPACE, "android:scheme", scheme)
        })
    }
    filter.appendChild(createElement("data").apply {
        setAttributeNS(ANDROID_XML_NAMESPACE, "android:host", host)
        port?.let { setAttributeNS(ANDROID_XML_NAMESPACE, "android:port", it.toString()) }
        path?.let { setAttributeNS(ANDROID_XML_NAMESPACE, pathAttribute, it) }
    })
    activity.appendChild(filter)
}

@Suppress("unused")
val haiagaruPatch = resourcePatch(
    name = "Haiagaru",
    description = "Haiagaruの機能と設定を追加します。対応:191／226／242 dev。基本機能は追加ダウンロード不要です。絵文字フォント・191画像判定修正・VPNは必要なものだけGitHubから保存し、各オプションのファイル選択で指定してください。未選択なら端末標準の絵文字と本体の画像判定を維持します。初めての方向け手順・配布元: $OPTIONAL_ASSET_GUIDE",
) {
    compatibleWith(chMateCompatibility)
    dependsOn(haiagaruBytecodePatch)

    val additionalOpenUrls = stringOption(
        key = "additionalOpenUrls",
        default = "",
        title = "アプリで開くURLを追加",
        description = "http(s)://から始まるURLをカンマ区切りで指定。末尾/*は配下も対象です。ChMateが解析できる板・スレURLに使用してください。",
    )

    val emojiMode = stringOption(
        key = "emojiMode",
        default = "missing",
        title = "絵文字フォントの適用範囲",
        description = "missing=端末にない絵文字だけ（推奨）、all=全絵文字、off=無効。",
    )

    val emojiFontPath = filePathOption(
        key = "emojiFontPath",
        default = "",
        title = "絵文字フォントを選択（任意）",
        description = "GitHubからNotoColorEmoji.ttfを保存して選択: $OPTIONAL_ASSET_EMOJI_URL 空欄は端末標準の絵文字を使用。手順・ライセンス: $OPTIONAL_ASSET_GUIDE",
        allowedExtensions = listOf("ttf", "otf"),
    )

    val dedicatedCheckerViewer = stringOption(
        key = "dedicatedCheckerViewer",
        default = "true",
        title = "必死チェッカー専用ビュワー",
        description = "true=ChMate内の専用ビュワーを有効化、false=ChMate本来の外部ブラウザ動作。",
    )

    val edgeArchiveToolbarIconPath = filePathOption(
        key = "edgeArchiveToolbarIconPath",
        default = "",
        title = "エッジ過去ログのツールバー画像（任意）",
        description = "PNG/WebP画像ファイルの絶対パス（file path）。フォルダではなくファイルを選択してください。空欄なら内蔵アイコンを使用します。",
        allowedExtensions = listOf("png", "webp"),
    )

    val imageNgTfliteFix = stringOption(
        key = "imageNgTfliteFix",
        default = "true",
        title = "191の自動NG画像判定クラッシュを修正",
        description = "191 devのみ。trueと下の修正ファイル選択の両方で適用します。ファイル未選択またはfalseなら本体のライブラリを維持します。自動NG画像判定でクラッシュする方は導入手順を確認してください。$OPTIONAL_ASSET_GUIDE",
    )
    val imageNgLibraryFile = filePathOption(
        key = "imageNgLibraryFile", default = "", title = "191画像判定の修正ファイルを選択（任意）",
        description = "Image NG専用: GitHubからhaiagaru-image-ng.zipを保存して選択: $OPTIONAL_ASSET_IMAGE_NG_URL ZIPは展開不要。VPN用ファイルとは別です。226／242には不要です。手順・ソース: $OPTIONAL_ASSET_GUIDE",
        allowedExtensions = listOf("zip", "apk"),
    )

    execute {
        val replaceImageNgTflite = when (imageNgTfliteFix.value.orEmpty().trim().lowercase(Locale.ROOT)) {
            "true", "1", "yes", "on" -> true
            "false", "0", "no", "off" -> false
            else -> throw PatchException("imageNgTfliteFixは true / false を指定してください")
        }
        val uiResources = get("assets/haiagaru-ui-res.apk")
        uiResources.parentFile.mkdirs()
        checkNotNull(EmojiFontResourceMarker::class.java.getResourceAsStream("/chmate/compose/haiagaru-ui-res.apk")) {
            "Compose UI resources are missing from the patch bundle"
        }.use { input -> uiResources.outputStream().use(input::copyTo) }
        for (name in listOf("LICENSE", "NOTICE")) {
            checkNotNull(EmojiFontResourceMarker::class.java.getResourceAsStream("/chmate/compose/$name")).use { input ->
                get("assets/haiagaru-ui-$name.txt").outputStream().use(input::copyTo)
            }
        }
        val boardXmls = get("res/xml").listFiles().orEmpty().filter {
            it.extension == "xml" && it.readText().contains("updateBbsMenu")
        }
        check(boardXmls.size == 1) { "Board/BBSMENU preferences XML changed (${boardXmls.size})" }
        val boardEditorPackage = document("AndroidManifest.xml").use { it.documentElement.getAttribute("package") }
        document("res/xml/${boardXmls.single().name}").use { settings ->
            val entry = settings.createElement("Preference")
            entry.setAttributeNS(ANDROID_XML_NAMESPACE,"android:key","haiagaruExternalBoardEditor")
            entry.setAttributeNS(ANDROID_XML_NAMESPACE,"android:title","登録した外部板の名前・URLを編集")
            entry.setAttributeNS(ANDROID_XML_NAMESPACE,"android:summary","外部板の移転・名前変更。保存後はChMateを再起動してください")
            val intent = settings.createElement("intent")
            // Package-name patch also rewrites targetPackage attributes in resource XML.
            intent.setAttributeNS(ANDROID_XML_NAMESPACE,"android:targetPackage",boardEditorPackage)
            intent.setAttributeNS(ANDROID_XML_NAMESPACE,"android:targetClass","app.morphe.extension.chmate.ExternalBoardEditorActivity")
            entry.appendChild(intent)
            settings.documentElement.appendChild(entry)
        }
        val cacheArrayNames = document("res/values/arrays.xml").use {
            ImageCacheSizeOptions.expand(it)
        }
        val patrolArrayNames = document("res/values/arrays.xml").use {
            PatrolIntervalOptions.expand(it)
        }
        get("res").listFiles().orEmpty().filter {
            it.isDirectory && it.name.startsWith("values-")
        }.forEach { directory ->
            directory.listFiles().orEmpty().filter { file ->
                file.extension == "xml" && (cacheArrayNames + patrolArrayNames).any { name ->
                    file.readText().contains("name=\"$name\"")
                }
            }.forEach { file ->
                document("res/${directory.name}/${file.name}").use {
                    ImageCacheSizeOptions.expandOverrides(it, cacheArrayNames)
                    PatrolIntervalOptions.expandOverrides(it, patrolArrayNames)
                }
            }
        }
        if (packageMetadata.versionName in setOf("0.8.10.191 dev", "0.8.10.226 dev", "0.8.10.241", "0.8.10.242 dev")) {
            val gestureXmls = get("res/xml").listFiles().orEmpty().filter {
                it.extension == "xml" && it.readText().contains("gestureSetting")
            }
            check(gestureXmls.size == 1) { "Gesture preferences XML changed (${gestureXmls.size})" }
            document("res/xml/${gestureXmls.single().name}").use { settings ->
                val nodes = settings.getElementsByTagName("jp.syoboi.a2chMate.ui.setting.preference.gesture.GesturePreference")
                val anchor = (0 until nodes.length).map { nodes.item(it) as Element }.single {
                    it.getAttribute("android:key") == "gestureSetting"
                        || it.getAttributeNS("http://schemas.android.com/apk/res/android", "key") == "gestureSetting"
                }
                val entry = settings.createElement("jp.syoboi.a2chMate.ui.setting.preference.gesture.GesturePreference")
                entry.setAttributeNS("http://schemas.android.com/apk/res/android", "android:title", "NG編集")
                entry.setAttributeNS("http://schemas.android.com/apk/res/android", "android:key", "haiagaruGestureNgEdit")
                entry.setAttributeNS("http://schemas.android.com/apk/res/android", "android:defaultValue", "0")
                entry.setAttributeNS("http://schemas.android.com/apk/res/android", "android:summary", "未使用のジェスチャーを割り当ててください")
                anchor.parentNode.insertBefore(entry, anchor.nextSibling)
                val deleteRead = settings.createElement("jp.syoboi.a2chMate.ui.setting.preference.gesture.GesturePreference")
                deleteRead.setAttributeNS("http://schemas.android.com/apk/res/android", "android:title", "既読スレをすべて削除")
                deleteRead.setAttributeNS("http://schemas.android.com/apk/res/android", "android:key", "haiagaruGestureDeleteReadThreads")
                deleteRead.setAttributeNS("http://schemas.android.com/apk/res/android", "android:defaultValue", "0")
                deleteRead.setAttributeNS("http://schemas.android.com/apk/res/android", "android:summary", "板のスレ一覧で使用。確認画面で対象をチェックして履歴・ログを削除します")
                anchor.parentNode.insertBefore(deleteRead, entry.nextSibling)
            }
        }
        if (replaceImageNgTflite && imageNgLibraryFile.value.orEmpty().isNotBlank() && packageMetadata.versionName == "0.8.10.191 dev") {
            // 191's bundled TFLite JNI crashes in NativeInterpreterWrapper_run
            // during automatic image NG classification. Keep the model and Java
            // classifier intact; replace only the affected native runtime with
            // the ABI-matched runtime verified from ChMate 226 dev.
            val tfliteLibraries = mapOf(
                "arm64-v8a" to "430a5cc57c285e9f7a8dede904eb998ad50c634e592baf7f06f8a896b2dea557",
                "armeabi-v7a" to "ba8c1f290d797820695231f86a8de16c74d1fa10595ea33d9397791f0f93d52b",
                "x86" to "1a8bad7f404050f259b9224e572106beb1326bc1c66c9856b4ecc58f5358df74",
                "x86_64" to "a7597671e6685259cd27959040959786c2c5e8f5dfd8303746554b3644315f5b",
            )
            val libraries = optionalLibraries(imageNgLibraryFile.value.orEmpty(), tfliteLibraries, "libtensorflowlite_jni.so")
            libraries.forEach { (abi, bytes) ->
                get("lib").resolve("$abi/libtensorflowlite_jni.so").apply {
                    parentFile.mkdirs()
                    writeBytes(bytes)
                }
            }
        }
        document("res/values/strings.xml").use { strings ->
            val entry = strings.createElement("string")
            entry.setAttribute("name", "haiagaru_edge_archive")
            entry.textContent = "エッジ過去ログ"
            strings.documentElement.appendChild(entry)
            val markRead = strings.createElement("string")
            markRead.setAttribute("name", "haiagaru_mark_all_read")
            markRead.textContent = "未読をすべて0にする"
            strings.documentElement.appendChild(markRead)
            val readFirst = strings.createElement("string")
            readFirst.setAttribute("name", "haiagaru_read_threads_first")
            readFirst.textContent = "既読スレを上に"
            strings.documentElement.appendChild(readFirst)
            strings.documentElement.appendChild(strings.createElement("string").apply {
                setAttribute("name","haiagaru_hide_dropped_threads")
                textContent="DAT落ちスレを非表示（未読・履歴・スレ）"
            })
            val favorites = strings.createElement("string")
            favorites.setAttribute("name", "haiagaru_favorite_threads")
            favorites.textContent = "★スレ"
            strings.documentElement.appendChild(favorites)
            strings.documentElement.appendChild(strings.createElement("string").apply {
                setAttribute("name", "haiagaru_favorite_threads_description")
                textContent = "★スレのみ巡回"
            })
        }
        document("res/values-en/strings.xml").use { strings ->
            val entry = strings.createElement("string")
            entry.setAttribute("name", "haiagaru_edge_archive")
            entry.textContent = "Edge archive"
            strings.documentElement.appendChild(entry)
            val markRead = strings.createElement("string")
            markRead.setAttribute("name", "haiagaru_mark_all_read")
            markRead.textContent = "Mark all threads read"
            strings.documentElement.appendChild(markRead)
            val readFirst = strings.createElement("string")
            readFirst.setAttribute("name", "haiagaru_read_threads_first")
            readFirst.textContent = "Show read threads first"
            strings.documentElement.appendChild(readFirst)
            strings.documentElement.appendChild(strings.createElement("string").apply {
                setAttribute("name","haiagaru_hide_dropped_threads")
                textContent="Hide dropped threads (Unread / History / Threads)"
            })
            val favorites = strings.createElement("string")
            favorites.setAttribute("name", "haiagaru_favorite_threads")
            favorites.textContent = "★ Threads"
            strings.documentElement.appendChild(favorites)
            strings.documentElement.appendChild(strings.createElement("string").apply {
                setAttribute("name", "haiagaru_favorite_threads_description")
                textContent = "Shows starred threads across boards"
            })
        }
        PublicXmlManager(get("res/values/public.xml")).use { publicResources ->
            publicResources.createPublicId("string", "haiagaru_edge_archive")
            publicResources.createPublicId("drawable", "haiagaru_edge_archive")
            publicResources.createPublicId("string", "haiagaru_mark_all_read")
            publicResources.createPublicId("string", "haiagaru_read_threads_first")
            publicResources.createPublicId("string", "haiagaru_hide_dropped_threads")
            publicResources.createPublicId("drawable", "haiagaru_mark_all_read")
            publicResources.createPublicId("string", "haiagaru_favorite_threads")
            publicResources.createPublicId("string", "haiagaru_favorite_threads_description")
            publicResources.createPublicId("drawable", "haiagaru_favorite_threads")
        }
        get("res").resolve("drawable/haiagaru_favorite_threads.xml").writeText("""
            <vector xmlns:android="http://schemas.android.com/apk/res/android" android:width="24dp" android:height="24dp" android:viewportWidth="24" android:viewportHeight="24">
                <path android:fillColor="#FFFFFFFF" android:pathData="M12,17.27L18.18,21l-1.64,-7.03L22,9.24l-7.19,-0.61L12,2 9.19,8.63 2,9.24l5.46,4.73L5.82,21z"/>
            </vector>
        """.trimIndent())
        get("res").resolve("drawable/haiagaru_mark_all_read.xml").writeText("""
            <vector xmlns:android="http://schemas.android.com/apk/res/android" android:width="24dp" android:height="24dp" android:viewportWidth="24" android:viewportHeight="24">
                <path android:fillColor="#FFFFFFFF" android:pathData="M18,7l-1.41,-1.41 -6.34,6.34 1.41,1.41L18,7zM22.24,5.59L11.66,16.17 7.48,12l-1.41,1.41L11.66,19l12,-12 -1.42,-1.41zM0.41,13.41L6,19l1.41,-1.41L1.83,12 0.41,13.41z"/>
            </vector>
        """.trimIndent())
        document("res/values/strings.xml").use { strings ->
            val entry = strings.createElement("string")
            entry.setAttribute("name", "haiagaru_quick_filter")
            entry.textContent = "フィルタ"
            strings.documentElement.appendChild(entry)
        }
        val responseLabels = listOf("投稿者を強調", "レスを保存", "保存済みレスを見る", "ﾜｯﾁｮｲで検索", "ﾜｯﾁｮｲ下4桁をNG登録", "ﾜｯﾁｮｲ下4桁で検索", "ﾜｯﾁｮｲ上4桁で検索", "ﾜｯﾁｮｲ上4桁をNG登録", "自動NGの除外IDに追加")
        val archiveIcons = mapOf(
            "haiagaru_response_history" to "M13,3c-4.97,0 -9,4.03 -9,9H1l3.89,3.89 .07,.14L9,12H6c0,-3.87 3.13,-7 7,-7s7,3.13 7,7 -3.13,7 -7,7c-1.93,0 -3.68,-.79 -4.94,-2.06l-1.42,1.42C8.27,19.99 10.51,21 13,21c4.97,0 9,-4.03 9,-9s-4.03,-9 -9,-9zM12,8v5l4.28,2.54 .72,-1.21 -3.5,-2.08V8H12z",
            "haiagaru_response_save" to "M17,3H5c-1.11,0 -2,.9 -2,2v14c0,1.1 .89,2 2,2h14c1.1,0 2,-.9 2,-2V7l-4,-4zM12,19c-1.66,0 -3,-1.34 -3,-3s1.34,-3 3,-3 3,1.34 3,3 -1.34,3 -3,3zM15,9H5V5h10v4z",
        )
        PublicXmlManager(get("res/values/public.xml")).use { manager ->
            archiveIcons.forEach { (name, path) ->
                manager.createPublicId("drawable", name)
                get("res").resolve("drawable/$name.xml").writeText("""
                    <vector xmlns:android="http://schemas.android.com/apk/res/android" android:width="24dp" android:height="24dp" android:viewportWidth="24" android:viewportHeight="24">
                        <path android:fillColor="#FFFFFFFF" android:pathData="$path"/>
                    </vector>
                """.trimIndent())
            }
        }
        val responseStrings = responseLabels.mapIndexed { index, label -> "haiagaru_response_action_$index" to label } +
            (0..4).map { "haiagaru_response_share_$it" to "共有(記憶) ${it + 1}" }
        document("res/values/strings.xml").use { strings ->
            responseStrings.forEach { (name, label) ->
                val entry = strings.createElement("string")
                entry.setAttribute("name", name); entry.textContent = label
                strings.documentElement.appendChild(entry)
            }
        }
        PublicXmlManager(get("res/values/public.xml")).use { manager ->
            responseStrings.forEach { (name, _) -> manager.createPublicId("string", name) }
        }
        PublicXmlManager(get("res/values/public.xml")).use {
            it.createPublicId("string", "haiagaru_quick_filter")
            it.createPublicId("drawable", "haiagaru_quick_filter")
        }
        get("res").resolve("drawable/haiagaru_quick_filter.xml").writeText("""
            <vector xmlns:android="http://schemas.android.com/apk/res/android" android:width="24dp" android:height="24dp" android:viewportWidth="24" android:viewportHeight="24">
                <path android:fillColor="#FFFFFFFF" android:pathData="M10,18h4v-2h-4v2zM3,6v2h18V6H3zM6,13h12v-2H6v2z"/>
            </vector>
        """.trimIndent())
        document("res/values/strings.xml").use { strings ->
            val entry = strings.createElement("string")
            entry.setAttribute("name", "haiagaru_direct_copy")
            entry.textContent = "長押しコピー"
            strings.documentElement.appendChild(entry)
        }
        document("res/values-en/strings.xml").use { strings ->
            val entry = strings.createElement("string")
            entry.setAttribute("name", "haiagaru_direct_copy")
            entry.textContent = "Long-press copy"
            strings.documentElement.appendChild(entry)
        }
        PublicXmlManager(get("res/values/public.xml")).use {
            it.createPublicId("string", "haiagaru_direct_copy")
            it.createPublicId("drawable", "haiagaru_direct_copy")
        }
        get("res").resolve("drawable/haiagaru_direct_copy.xml").writeText("""
            <vector xmlns:android="http://schemas.android.com/apk/res/android" android:width="24dp" android:height="24dp" android:viewportWidth="24" android:viewportHeight="24">
                <path android:fillColor="#FFFFFFFF" android:pathData="M16,1H4c-1.1,0 -2,0.9 -2,2v14h2V3h12V1zM19,5H8c-1.1,0 -2,0.9 -2,2v14c0,1.1 0.9,2 2,2h11c1.1,0 2,-0.9 2,-2V7c0,-1.1 -0.9,-2 -2,-2zM19,21H8V7h11v14z"/>
            </vector>
        """.trimIndent())
        val iconSourcePath = edgeArchiveToolbarIconPath.value.orEmpty().trim()
        for ((name, label) in listOf(
            "haiagaru_wacchoi_search" to "ﾜｯﾁｮｲで検索",
            "haiagaru_wacchoi_lower" to "ﾜｯﾁｮｲ下4桁で検索",
            "haiagaru_wacchoi_upper" to "ﾜｯﾁｮｲ上4桁で検索",
            "haiagaru_hissi_droid_plus" to "必死チェッカーDroid＋で開く",
            "haiagaru_auto_ng_exclusions" to "自動NG除外ID",
        )) {
            for (values in listOf("values", "values-en")) {
                document("res/$values/strings.xml").use { strings ->
                    strings.documentElement.appendChild(strings.createElement("string").apply {
                        setAttribute("name", name)
                        textContent = label
                    })
                }
            }
            PublicXmlManager(get("res/values/public.xml")).use {
                it.createPublicId("string", name)
                it.createPublicId("drawable", name)
            }
            val iconPath = when (name) {
                "haiagaru_auto_ng_exclusions" ->
                    "M12,2L3,6v6c0,5 9,10 9,10s9,-5 9,-10V6zM12,5l6,2.7V12c0,3 -4,6.2 -6,7.6C10,18.2 6,15 6,12V7.7zM8,11h8v2H8z"
                "haiagaru_hissi_droid_plus" ->
                    "M3,3h12v2H5v14h14v-10h2v12H3zM13,3h8v8h-2V6.41l-8.29,8.3 -1.42,-1.42L17.59,5H13z"
                "haiagaru_wacchoi_search" ->
                    "M15.5,14h-0.79l-0.28,-0.27C15.41,12.59 16,11.11 16,9.5C16,5.91 13.09,3 9.5,3S3,5.91 3,9.5S5.91,16 9.5,16c1.61,0 3.09,-0.59 4.23,-1.57l0.27,0.28v0.79l5,4.99L20.49,19l-4.99,-5zM9.5,14C7.01,14 5,11.99 5,9.5S7.01,5 9.5,5S14,7.01 14,9.5S11.99,14 9.5,14z"
                "haiagaru_wacchoi_upper" ->
                    "M16,11l-4,-4 -4,4 1.41,1.41L11,11.83V19h2v-7.17l1.59,1.58L16,11zM5,5v2h14V5H5z"
                else ->
                    "M16,13l-4,4 -4,-4 1.41,-1.41L11,13.17V5h2v8.17l1.59,-1.58L16,13zM5,19v-2h14v2H5z"
            }
            get("res").resolve("drawable/$name.xml").writeText("""
                <vector xmlns:android="http://schemas.android.com/apk/res/android" android:width="24dp" android:height="24dp" android:viewportWidth="24" android:viewportHeight="24">
                    <path android:fillColor="#FFFFFFFF" android:pathData="$iconPath"/>
                </vector>
            """.trimIndent())
        }
        for (name in listOf("LICENSE", "NOTICE.md")) {
            val notice = get("assets").resolve("haiagaru/licenses/material-icons/$name")
            notice.parentFile.mkdirs()
            checkNotNull(EmojiFontResourceMarker::class.java.getResourceAsStream("/chmate/material-icons/$name"))
                .use { source -> notice.outputStream().use(source::copyTo) }
        }
        if (iconSourcePath.isEmpty()) {
            val iconTarget = get("res").resolve("drawable/haiagaru_edge_archive.xml")
            iconTarget.parentFile.mkdirs()
            checkNotNull(EmojiFontResourceMarker::class.java.getResourceAsStream(
                "/chmate/drawable/haiagaru_edge_archive.xml",
            )) { "Bundled Edge archive toolbar icon is missing" }.use { source ->
                iconTarget.outputStream().use(source::copyTo)
            }
        } else {
            val iconSource = File(iconSourcePath)
            if (!iconSource.isFile || !iconSource.canRead() ||
                iconSource.extension.lowercase(Locale.ROOT) !in setOf("png", "webp")) {
                throw PatchException("edgeArchiveToolbarIconPathは読み込み可能なPNG/WebP画像を指定してください")
            }
            val iconTarget = get("res").resolve(
                "drawable-nodpi/haiagaru_edge_archive.${iconSource.extension.lowercase(Locale.ROOT)}",
            )
            iconTarget.parentFile.mkdirs()
            iconSource.copyTo(iconTarget, overwrite = true)
        }
        // Mega constructs Ktor's default client before we can replace it.
        // Preserve the ServiceLoader entry in the host APK so initialization
        // can select the bundled OkHttp engine on Android.
        val ktorEngineService = get("META-INF").resolve(
            "services/io.ktor.client.HttpClientEngineContainer",
        )
        ktorEngineService.parentFile.mkdirs()
        ktorEngineService.writeText(
            "io.ktor.client.engine.okhttp.OkHttpEngineContainer\n",
            Charsets.UTF_8,
        )
        val cryptoProviderService = get("META-INF").resolve(
            "services/dev.whyoleg.cryptography.CryptographyProviderContainer",
        )
        cryptoProviderService.parentFile.mkdirs()
        cryptoProviderService.writeText(
            "dev.whyoleg.cryptography.providers.jdk.JdkCryptographyProviderContainer\n",
            Charsets.UTF_8,
        )
        val bundledEmojiFont = get("assets").resolve("haiagaru/NotoColorEmoji.ttf")
        bundledEmojiFont.parentFile.mkdirs()
        val requestedEmojiMode = emojiMode.value.orEmpty().trim().lowercase(Locale.ROOT)
        if (requestedEmojiMode !in setOf("missing", "all", "off")) {
            throw PatchException("emojiModeは missing / all / off のいずれかを指定してください: $requestedEmojiMode")
        }
        val requestedFontPath = emojiFontPath.value.orEmpty().trim()
        val dedicatedViewerEnabled = when (dedicatedCheckerViewer.value.orEmpty().trim().lowercase(Locale.ROOT)) {
            "true", "1", "yes", "on" -> true
            "false", "0", "no", "off" -> false
            else -> throw PatchException(
                "dedicatedCheckerViewerは true / false のいずれかを指定してください: "
                    + dedicatedCheckerViewer.value
            )
        }
        if (requestedFontPath.isNotBlank() && requestedEmojiMode != "off") {
            val customFont = File(requestedFontPath)
            if (!customFont.isFile || !customFont.canRead()) {
                throw PatchException("emojiFontPathのフォントファイルを読み込めません: $requestedFontPath")
            }
            customFont.inputStream().use { source ->
                bundledEmojiFont.outputStream().use(source::copyTo)
            }
        }
        bundledEmojiFont.parentFile.resolve("emoji.properties").writeText(
            "mode=${if (requestedFontPath.isBlank()) "off" else requestedEmojiMode}\n",
            Charsets.UTF_8,
        )
        if (dedicatedViewerEnabled) {
            val monaFont = get("assets").resolve("haiagaru/MonaLite.ttf")
            checkNotNull(EmojiFontResourceMarker::class.java.getResourceAsStream(
                "/chmate/fonts/MonaLite.ttf",
            )) {
                "MonaLite font is missing from the Haiagaru Android patch bundle"
            }.use { source ->
                monaFont.outputStream().use(source::copyTo)
            }
        }

        val customUrls = parseAdditionalOpenUrls(additionalOpenUrls.value.orEmpty())
        document("AndroidManifest.xml").use { document ->
            val additions = buildList {
                val dataElements = document.getElementsByTagName("data")
                for (index in 0 until dataElements.length) {
                    val data = dataElements.item(index) as? Element ?: continue
                    val ioHost = when (data.getAttribute("android:host")) {
                        "*.5ch.net" -> "*.5ch.io"
                        "itest.5ch.net" -> "itest.5ch.io"
                        else -> continue
                    }
                    val intentFilter = data.parentNode
                    val alreadyPresent = (0 until intentFilter.childNodes.length).any { childIndex ->
                        val sibling = intentFilter.childNodes.item(childIndex) as? Element
                        sibling?.tagName == "data" &&
                            sibling.getAttribute("android:host") == ioHost
                    }
                    if (!alreadyPresent) add(data to ioHost)
                }
            }

            additions.forEach { (source, ioHost) ->
                val clone = source.cloneNode(true) as Element
                clone.setAttribute("android:host", ioHost)
                source.parentNode.insertBefore(clone, source.nextSibling)
            }

            // ChMate's legacy itest filter uses `/*./...`, which only accepts a
            // single character before `/test/read.cgi`. Correct the simple-glob
            // pattern so server-prefixed URLs such as `/egg/test/read.cgi/...`
            // resolve to ResListActivity on every supported ChMate generation.
            val refreshedDataElements = document.getElementsByTagName("data")
            for (index in 0 until refreshedDataElements.length) {
                val data = refreshedDataElements.item(index) as? Element ?: continue
                val host = data.getAttribute("android:host")
                if (host !in setOf("itest.2ch.net", "itest.5ch.net", "itest.5ch.io")) continue
                if (data.getAttribute("android:pathPattern") == "/*./test/read.cgi/.*/.*") {
                    data.setAttribute("android:pathPattern", "/.*/test/read.cgi/.*/.*")
                }
            }

            // Newer manifests dropped the dedicated itest host and only keep
            // the ordinary `*.5ch.io` + `/test/read.cgi` filter. Add the itest
            // server-prefix form to that same thread filter so Android can
            // dispatch it before the extension normalizes the URL.
            val intentFilters = document.getElementsByTagName("intent-filter")
            for (index in 0 until intentFilters.length) {
                val intentFilter = intentFilters.item(index) as? Element ?: continue
                val dataChildren = (0 until intentFilter.childNodes.length)
                    .mapNotNull { childIndex ->
                        (intentFilter.childNodes.item(childIndex) as? Element)
                            ?.takeIf { it.tagName == "data" }
                    }
                val hasFiveChIoHost = dataChildren.any { data ->
                    data.getAttribute("android:host") in setOf("*.5ch.io", "itest.5ch.io")
                }
                val handlesThreads = dataChildren.any { data ->
                    data.getAttribute("android:pathPrefix").startsWith("/test/read.cgi") ||
                        data.getAttribute("android:pathPattern").contains("test/read.cgi")
                }
                if (!hasFiveChIoHost || !handlesThreads) continue

                if (dataChildren.none { it.getAttribute("android:host") == "itest.5ch.io" }) {
                    val hostData = document.createElement("data")
                    hostData.setAttribute("android:host", "itest.5ch.io")
                    intentFilter.appendChild(hostData)
                }
                if (dataChildren.none {
                        it.getAttribute("android:pathPattern") == "/.*/test/read.cgi/.*/.*"
                    }) {
                    val pathData = document.createElement("data")
                    pathData.setAttribute(
                        "android:pathPattern",
                        "/.*/test/read.cgi/.*/.*",
                    )
                    intentFilter.appendChild(pathData)
                }
            }

            val application = document.getElementsByTagName("application").item(0) as Element
            val openUrlActivity = document.createElement("activity").apply {
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:name", OPEN_URL_ACTIVITY)
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:exported", "true")
                setAttributeNS(
                    ANDROID_XML_NAMESPACE,
                    "android:theme",
                    "@android:style/Theme.Translucent.NoTitleBar",
                )
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:excludeFromRecents", "true")
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:noHistory", "true")
            }

            // One routing Activity avoids competing board/thread Activity matches.
            // Separate filters keep custom hosts and paths from being combined.
            // External checker apps discover renamed installations by URL handlers.
            // Never encode a distribution package name into this contract.
            if (!dedicatedViewerEnabled) {
                document.addOpenUrlFilter(
                    openUrlActivity, listOf("http", "https"), "hissi.org",
                    path = "/read.php/", pathAttribute = "android:pathPrefix",
                )
            }
            for (host in listOf("bbs.eddibb.cc", "v1ch.cc")) {
                document.addOpenUrlFilter(
                    openUrlActivity, listOf("http", "https"), host,
                    path = "/test/read.cgi/", pathAttribute = "android:pathPrefix",
                )
                document.addOpenUrlFilter(
                    openUrlActivity, listOf("http", "https"), host,
                    path = "/liveedge/", pathAttribute = "android:pathPrefix",
                )
            }
            document.addOpenUrlFilter(
                openUrlActivity, listOf("http", "https"), "talk.jp",
                path = "/boards/", pathAttribute = "android:pathPrefix",
            )
            document.addOpenUrlFilter(
                openUrlActivity, listOf("http", "https"), "talk.jp",
                path = "/test/read.cgi/", pathAttribute = "android:pathPrefix",
            )
            document.addOpenUrlFilter(
                openUrlActivity, listOf("http", "https"), "talk.jp",
                path = "/.*/", pathAttribute = "android:pathPattern",
            )
            customUrls.forEach { url ->
                document.addOpenUrlFilter(
                    activity = openUrlActivity,
                    schemes = listOf(url.scheme),
                    host = url.host,
                    port = url.port,
                    path = url.path,
                    pathAttribute = if (url.prefix) "android:pathPrefix" else "android:path",
                )
            }
            application.appendChild(openUrlActivity)

            application.appendChild(document.createElement("activity").apply {
                setAttributeNS(
                    ANDROID_XML_NAMESPACE,
                    "android:name",
                    "app.morphe.extension.chmate.HaiagaruLocalBackupActivity",
                )
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:exported", "false")
                setAttributeNS(
                    ANDROID_XML_NAMESPACE,
                    "android:theme",
                    "@android:style/Theme.Material.Light.NoActionBar",
                )
            })
            application.appendChild(document.createElement("activity").apply {
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:name", "app.morphe.extension.chmate.BackupSettingsActivity")
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:exported", "false")
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:theme", "@android:style/Theme.Material.Light.NoActionBar")
            })
            application.appendChild(document.createElement("activity").apply {
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:name",
                    "app.morphe.extension.chmate.ThemeImportActivity")
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:exported", "false")
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:configChanges", "orientation|screenSize|keyboardHidden")
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:theme",
                    "@android:style/Theme.Material.Light.NoActionBar")
            })
            application.appendChild(document.createElement("activity").apply {
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:name",
                    "app.morphe.extension.chmate.ExternalBoardAuthActivity")
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:exported", "false")
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:theme",
                    "@android:style/Theme.Translucent.NoTitleBar")
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:windowSoftInputMode", "adjustResize")
            })
            application.appendChild(document.createElement("activity").apply {
                setAttributeNS(ANDROID_XML_NAMESPACE,"android:name","app.morphe.extension.chmate.MediaUploadWebActivity")
                setAttributeNS(ANDROID_XML_NAMESPACE,"android:exported","false")
                setAttributeNS(ANDROID_XML_NAMESPACE,"android:theme","@android:style/Theme.Material.Light.NoActionBar")
                setAttributeNS(ANDROID_XML_NAMESPACE,"android:windowSoftInputMode","adjustResize")
            })
            application.appendChild(document.createElement("activity").apply {
                setAttributeNS(ANDROID_XML_NAMESPACE,"android:name","app.morphe.extension.chmate.ExternalBoardEditorActivity")
                setAttributeNS(ANDROID_XML_NAMESPACE,"android:exported","false")
                setAttributeNS(ANDROID_XML_NAMESPACE,"android:theme","@android:style/Theme.Material.Light.NoActionBar")
            })
            application.appendChild(document.createElement("activity").apply {
                setAttributeNS(ANDROID_XML_NAMESPACE,"android:name","app.morphe.extension.chmate.ToolbarIconsActivity")
                setAttributeNS(ANDROID_XML_NAMESPACE,"android:exported","false")
                setAttributeNS(ANDROID_XML_NAMESPACE,"android:theme","@android:style/Theme.Material.Light.NoActionBar")
            })
            if (packageMetadata.versionName != "0.8.10.243 dev") {
                application.appendChild(document.createElement("activity").apply {
                    setAttributeNS(ANDROID_XML_NAMESPACE, "android:name",
                        "app.morphe.extension.chmate.ReplacementSettingsActivity")
                    setAttributeNS(ANDROID_XML_NAMESPACE, "android:exported", "false")
                    setAttributeNS(ANDROID_XML_NAMESPACE, "android:theme",
                        "@android:style/Theme.Material.Light.NoActionBar")
                })
            }

            // Keep the archive page in the same lightweight WebView activity as
            // the checker.  It is declared even when the optional Hissi viewer
            // is disabled, because Edge archives are an independent feature.
            val hissiActivity = document.createElement("activity").apply {
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:name", HISSI_MENU_ACTIVITY)
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:exported", "true")
                setAttributeNS(
                    ANDROID_XML_NAMESPACE,
                    "android:theme",
                    "@android:style/Theme.Material.Light.NoActionBar",
                )
            }
            application.appendChild(document.createElement("activity").apply {
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:name",
                    "app.morphe.extension.chmate.HissiWacchoiSearchActivity")
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:exported", "false")
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:theme",
                    "@android:style/Theme.Material.Light.NoActionBar")
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:windowSoftInputMode", "adjustResize")
            })
            application.appendChild(document.createElement("activity").apply {
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:name", "app.morphe.extension.chmate.HaiagaruSettingsActivity")
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:exported", "false")
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:theme", "@android:style/Theme.Material.Light.NoActionBar")
                setAttributeNS(ANDROID_XML_NAMESPACE, "android:windowSoftInputMode", "adjustResize")
            })
            application.appendChild(document.createElement("provider").apply {
                setAndroidAttribute("name", "app.morphe.extension.chmate.SettingsShareProvider")
                setAndroidAttribute("authorities", document.documentElement.getAttribute("package") + ".haiagaru.settings")
                setAndroidAttribute("exported", "false")
                setAndroidAttribute("grantUriPermissions", "true")
            })
            application.appendChild(document.createElement("activity").apply {
                setAndroidAttribute("name", "app.morphe.extension.chmate.SettingsImportActivity")
                setAndroidAttribute("exported", "true")
                setAndroidAttribute("theme", "@android:style/Theme.Material.Light.NoActionBar")
                appendChild(document.createElement("intent-filter").apply {
                    appendChild(document.createElement("action").apply { setAndroidAttribute("name", "android.intent.action.VIEW") })
                    for(category in listOf("android.intent.category.DEFAULT", "android.intent.category.BROWSABLE"))
                        appendChild(document.createElement("category").apply { setAndroidAttribute("name", category) })
                    appendChild(document.createElement("data").apply { setAndroidAttribute("mimeType", "application/vnd.haiagaru.settings") })
                })
                appendChild(document.createElement("intent-filter").apply {
                    appendChild(document.createElement("action").apply { setAndroidAttribute("name", "android.intent.action.VIEW") })
                    appendChild(document.createElement("category").apply { setAndroidAttribute("name", "android.intent.category.DEFAULT") })
                    for(scheme in listOf("content", "file"))
                        appendChild(document.createElement("data").apply { setAndroidAttribute("scheme", scheme) })
                    appendChild(document.createElement("data").apply {
                        setAndroidAttribute("host", "*")
                        setAndroidAttribute("mimeType", "*/*")
                        setAndroidAttribute("pathPattern", ".*\\.haiagaru")
                    })
                })
            })
            for(permission in listOf("android.permission.FOREGROUND_SERVICE", "android.permission.FOREGROUND_SERVICE_DATA_SYNC", "android.permission.POST_NOTIFICATIONS")){
                val exists=(0 until document.getElementsByTagName("uses-permission").length).any {
                    (document.getElementsByTagName("uses-permission").item(it) as Element).getAttributeNS(ANDROID_XML_NAMESPACE,"name")==permission
                }
                if(!exists)document.documentElement.appendChild(document.createElement("uses-permission").apply {
                    setAttributeNS(ANDROID_XML_NAMESPACE,"android:name",permission)
                })
            }
            application.appendChild(document.createElement("service").apply {
                setAttributeNS(ANDROID_XML_NAMESPACE,"android:name","app.morphe.extension.chmate.VideoFrameDecodeService")
                setAttributeNS(ANDROID_XML_NAMESPACE,"android:exported","false")
                setAttributeNS(ANDROID_XML_NAMESPACE,"android:process",":haiagaru_video_decoder")
            })
            application.appendChild(document.createElement("service").apply {
                setAttributeNS(ANDROID_XML_NAMESPACE,"android:name","app.morphe.extension.chmate.WacchoiSearchService")
                setAttributeNS(ANDROID_XML_NAMESPACE,"android:exported","false")
                setAttributeNS(ANDROID_XML_NAMESPACE,"android:foregroundServiceType","dataSync")
            })
            document.addOpenUrlFilter(
                hissiActivity,
                listOf("haiagaru-eddi", "http", "https"),
                "eddiarchive3rd.boy.jp",
                path = "/",
                pathAttribute = "android:pathPrefix",
            )
            if (dedicatedViewerEnabled) {
                document.addOpenUrlFilter(
                    hissiActivity,
                    listOf("haiagaru-hissi", "haiagaru-hissis"),
                    "hissi.org",
                    path = "/read.php/",
                    pathAttribute = "android:pathPrefix",
                )
                // The long-press action in older ChMate builds bypasses the
                // configurable menu template and emits a normal http(s)
                // Hissi URL. Route that form to the same dedicated viewer so
                // both entry points behave identically.
                document.addOpenUrlFilter(
                    hissiActivity,
                    listOf("http", "https"),
                    "hissi.org",
                    path = "/read.php/",
                    pathAttribute = "android:pathPrefix",
                )
                application.appendChild(hissiActivity)
                application.setAndroidAttribute("usesCleartextTraffic", "true")
            } else {
                application.appendChild(hissiActivity)
            }
        }
    }
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchThreadBannerAdWrapper(
    wrapperClass: String,
) {
    mutableClassDefBy(wrapperClass).methods.forEach { method ->
        when {
            method.name == "<init>" -> method.addBeforeEveryReturn(
                "invoke-static/range { p0 .. p0 }, $EXTENSION->hideAdView(Landroid/view/View;)V",
            )
            method.name != "<clinit>"
                && method.returnType == "V"
                && method.parameters.isEmpty() ->
                method.addHideAdsViewGuard()
        }
    }
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchPreIoImageUploadIntegrityTrap(
    uploadTaskClass: String,
) {
    val uploadClass = mutableClassDefBy(uploadTaskClass)
    val method = uploadClass.methods.single { candidate ->
        candidate.name == "c"
            && candidate.returnType == "Ljava/lang/Object;"
            && candidate.parameters.isEmpty()
    }
    val instructions = method.implementation?.instructions
        ?: error("ChMate pre-io image upload task has no implementation")
    val divideIndex = instructions.indices.single { index ->
        val divide = instructions[index]
        if (divide.opcode != Opcode.DIV_INT_2ADDR) return@single false
        instructions.subList(index + 1, minOf(index + 5, instructions.size)).any { next ->
            val reference = (next as? ReferenceInstruction)?.reference
                as? MethodReference ?: return@any false
            reference.definingClass == "Landroid/widget/Toast;"
                && reference.name == "makeText"
        }
    }
    val resultIndex = (divideIndex + 1 until instructions.size).first { index ->
        instructions[index].opcode == Opcode.NEW_ARRAY
    }

    // The divisor is `(n - 1) * n % 2`, which is always zero. The quotient is
    // used only by a decoy Toast and never by the image result. Skip that whole
    // block and resume at the original result-array construction.
    method.addInstructionsWithLabels(
        divideIndex,
        "goto/32 :haiagaru_image_upload_result",
        ExternalLabel("haiagaru_image_upload_result", instructions[resultIndex]),
    )

    val uploaderMethod = uploadClass.methods.single { candidate ->
        candidate.name == "g"
            && candidate.returnType == "Lo/Ad;"
            && candidate.parameters.isEmpty()
    }
    val uploaderInstructions = uploaderMethod.implementation?.instructions
        ?: error("ChMate pre-io image uploader has no implementation")
    val dynamicInvokeIndex = uploaderInstructions.indices.singleOrNull { index ->
        val reference = (uploaderInstructions[index] as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@singleOrNull false
        reference.definingClass == "Ljava/lang/reflect/Method;"
            && reference.name == "invoke"
            && reference.returnType == "Ljava/lang/Object;"
            && uploaderInstructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
            && ((uploaderInstructions.getOrNull(index + 2) as? ReferenceInstruction)?.reference
                as? TypeReference)?.type == "Lo/Ad;"
    } ?: error("ChMate pre-io dynamic image uploader invocation was not found")

    // The uploader is loaded from an InMemoryDexClassLoader. Its cached integrity
    // state compares int arrays at indexes 1 and 3, and a mismatch enters a
    // deliberate `throw null` block before the HTTP request is built. Synchronize
    // only those cached values and invoke the original uploader unchanged.
    when (val invocation = uploaderInstructions[dynamicInvokeIndex]) {
        is FiveRegisterInstruction -> uploaderMethod.replaceInstruction(
            dynamicInvokeIndex,
            "invoke-static { v${invocation.registerC}, v${invocation.registerD}, " +
                "v${invocation.registerE} }, $EXTENSION->invokePreIoImageUploader(" +
                "Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)" +
                "Ljava/lang/Object;",
        )

        is RegisterRangeInstruction -> uploaderMethod.replaceInstruction(
            dynamicInvokeIndex,
            "invoke-static/range { v${invocation.startRegister} .. " +
                "v${invocation.startRegister + 2} }, " +
                "$EXTENSION->invokePreIoImageUploader(Ljava/lang/reflect/Method;" +
                "Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;",
        )

        else -> error("ChMate pre-io dynamic uploader registers were not found")
    }
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchPreIoImageSettingsIntegrityTrap(
    viewModelClass: String,
) {
    val constructor = mutableClassDefBy(viewModelClass).methods.single { candidate ->
        candidate.name == "<init>"
            && candidate.returnType == "V"
            && candidate.parameters.map(CharSequence::toString) ==
            listOf("Landroid/app/Application;")
    }
    val instructions = constructor.implementation?.instructions
        ?: error("ChMate pre-io image settings constructor has no implementation")
    val rejectionBranch = instructions.indices.single { index ->
        if (instructions[index].opcode != Opcode.IF_NE) return@single false
        val window = instructions.subList(maxOf(0, index - 14), index)
        window.count { it.opcode == Opcode.AGET_OBJECT } >= 2
            && window.count { it.opcode == Opcode.CHECK_CAST } >= 2
            && window.count { it.opcode == Opcode.AGET } >= 2
    }
    val deleteRateKeyIndex = instructions.indices.single { index ->
        ((instructions[index] as? ReferenceInstruction)?.reference
            as? StringReference)?.string == "deleteRate0"
    }
    val defaultDivideIndex = (0 until deleteRateKeyIndex).last { index ->
        instructions[index].opcode == Opcode.DIV_INT_2ADDR
    }
    val defaultRegister = (instructions[defaultDivideIndex] as TwoRegisterInstruction).registerA

    // Re-signing changes the two certificate-derived comparison values. Their
    // inequality branch ends in `throw null`; equality continues through the
    // complete preference/LiveData initialization and the normal return.
    constructor.replaceInstruction(rejectionBranch, "nop")
    // The certificate-derived arithmetic used to produce the Boolean default can
    // yield a zero divisor after re-signing. Keep getBoolean() and any stored value,
    // while supplying its ordinary false default directly.
    constructor.replaceInstruction(defaultDivideIndex, "const/4 v$defaultRegister, 0x0")
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchPreIoSettingsConstructorIntegrityTrap(
    viewModelClass: String,
) {
    val constructor = mutableClassDefBy(viewModelClass).methods.single { candidate ->
        candidate.name == "<init>"
            && candidate.returnType == "V"
            && candidate.parameters.isEmpty()
    }
    val instructions = constructor.implementation?.instructions
        ?: error("ChMate pre-io settings constructor has no implementation")
    val rejectionBranch = instructions.indices.single { index ->
        if (instructions[index].opcode != Opcode.IF_NE) return@single false
        val window = instructions.subList(maxOf(0, index - 24), index)
        window.count { it.opcode == Opcode.AGET_OBJECT } >= 2
            && window.count { it.opcode == Opcode.CHECK_CAST } >= 2
            && window.count { it.opcode == Opcode.AGET } >= 2
            && instructions.subList(index + 1, minOf(index + 14, instructions.size))
                .any { it.opcode == Opcode.NEW_ARRAY }
    }

    // The mismatch path is certificate-sensitive dead code. Re-signing can send
    // the settings ViewModel constructor through a zero-divisor Toast decoy while
    // the normal path continues with the same state-array shape.
    constructor.replaceInstruction(rejectionBranch, "nop")

    val coroutineStartIndex = instructions.indices.single { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@single false
        reference.definingClass == "Lo/RequestConfigurationTagForChildDirectedTreatment;"
            && reference.name == "c"
            && reference.returnType == "Lo/getImageOrientation;"
    }
    val defaultMaskDivideIndex = instructions.subList(0, coroutineStartIndex)
        .indexOfLast { it.opcode == Opcode.DIV_INT }
        .takeIf { it >= 0 }
        ?.plus(0)
        ?: error("ChMate pre-io settings constructor coroutine mask divide was not found")
    val defaultMaskRegister = (instructions[defaultMaskDivideIndex] as ThreeRegisterInstruction).registerA

    // The value is the synthetic default-argument mask for the coroutine launch;
    // it is not app state. Keep the ordinary two-null-default mask directly.
    constructor.replaceInstruction(defaultMaskDivideIndex, "const/4 v$defaultMaskRegister, 0x3")
}

@Suppress("unused")
val saveChMateCrashLogsPatch = bytecodePatch(
    name = "Save ChMate crash logs",
    description = "Save uncaught ChMate crash logs to Download/Haiagaru.",
    default = true,
) {
    compatibleWith(chMateCompatibility)
    dependsOn(haiagaruBytecodePatch)

    execute {
        val profile = profileFor(packageMetadata.versionName)
        mutableClassDefBy(profile.providerClass).methods.single { method ->
            method.name == "onCreate"
                && method.returnType == "Z"
                && method.parameters.isEmpty()
        }.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, " +
                "$EXTENSION->installCrashLogger(Landroid/content/ContentProvider;)V",
        )
    }
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacyPlusFeatureActivation(
    profile: ChMateProfile,
) {
    if (!profile.bypassLegacySingleIdEntitlement) return

    val classType = profile.legacyPlusDisplayStateClass
        ?: error("ChMate legacy plus display state class is not configured")
    val methodName = profile.legacyPlusDisplayStateMethod
        ?: error("ChMate legacy plus display state method is not configured")
    mutableClassDefBy(classType).methods.single { candidate ->
        candidate.name == methodName
            && candidate.returnType == "V"
            && candidate.parameters.isEmpty()
    }.bypassLegacySingleIdEntitlement(classType)

    profile.legacyPlusFilterClass?.let { filterClass ->
        val method = mutableClassDefBy(filterClass).methods.single {
            it.name == "c" && it.returnType == "V"
                && it.parameters.map(CharSequence::toString) == listOf("Z")
        }
        val instructions = method.implementation!!.instructions
        // Both filters have an entitlement branch immediately before their
        // preference read. Preserve the preference branches and stock detectors.
        val gates = listOf("b", "A").map { fieldName ->
            val preferenceIndex = instructions.indices.single { index ->
                val ref = (instructions[index] as? ReferenceInstruction)?.reference
                    as? FieldReference
                instructions[index].opcode == Opcode.SGET_OBJECT
                    && ref?.definingClass == "Ljp/syoboi/a2chMate/Prefs;"
                    && ref.name == fieldName && ref.type == "Lo/m1b\$read;"
            }
            // Other hooks may insert bookkeeping between the entitlement gate
            // and this preference read. The stock 191 method still has the
            // gate immediately before this small block, so locate it within a
            // tight window and retain the shared-register check below.
            val gate = (preferenceIndex - 1 downTo maxOf(0, preferenceIndex - 8))
                .firstOrNull { instructions[it].opcode == Opcode.IF_EQZ }
            check(gate != null) {
                "ChMate legacy $fieldName filter entitlement branch was not found: " +
                    instructions.subList(maxOf(0, preferenceIndex - 16), preferenceIndex)
                        .joinToString { it.opcode.name }
            }
            gate
        }
        check(gates.map { (instructions[it] as OneRegisterInstruction).registerA }
            .distinct().size == 1) { "ChMate legacy filter entitlement registers differ" }
        gates.forEach { method.replaceInstruction(it, "nop") }
    }
}

private fun MutableMethod.bypassLegacySingleIdEntitlement(ownerType: String) {
    val instructions = implementation?.instructions
        ?: error("ChMate legacy plus display state method has no implementation")
    val getBooleanIndex = instructions.indices.firstOrNull { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@firstOrNull false
        reference.definingClass == "Landroid/content/SharedPreferences;"
            && reference.name == "getBoolean"
            && reference.returnType == "Z"
            && reference.parameterTypes.map(CharSequence::toString) ==
            listOf("Ljava/lang/String;", "Z")
            && instructions.subList(maxOf(0, index - 6), index).any { previous ->
                ((previous as? ReferenceInstruction)?.reference as? StringReference)?.string ==
                    "abbrevSingleId"
            }
    } ?: error("ChMate legacy abbrevSingleId preference read was not found")
    val falseBranchIndex = (getBooleanIndex + 1 until minOf(getBooleanIndex + 8, instructions.size))
        .firstOrNull { index ->
            val opcode = instructions[index].opcode
            opcode == Opcode.IF_EQZ || opcode == Opcode.IF_EQ
        } ?: error("ChMate legacy abbrevSingleId false branch was not found")
    val enabledStoreIndex = (falseBranchIndex + 1 until instructions.size).firstOrNull { index ->
        val instruction = instructions[index]
        val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            ?: return@firstOrNull false
        instruction.opcode == Opcode.IPUT_BOOLEAN
            && reference.definingClass == ownerType
            && reference.type == "Z"
    } ?: error("ChMate legacy abbrevSingleId enabled store was not found")

    addInstructionsWithLabels(
        falseBranchIndex + 1,
        "goto/32 :haiagaru_legacy_single_id_enabled",
        ExternalLabel("haiagaru_legacy_single_id_enabled", instructions[enabledStoreIndex]),
    )
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchImageSelectionResult() {
    val method = mutableClassDefBy(
        "Ljp/syoboi/a2chMate/feature/resedit/ResEditFragment;"
    ).methods.single { candidate ->
        candidate.name == "d"
            && candidate.returnType == "V"
            && candidate.parameters.map(CharSequence::toString) ==
            listOf(
                "Ljp/syoboi/a2chMate/feature/resedit/ResEditFragment;",
                "Ljava/util/List;",
            )
    }
    val firstInstruction = method.implementation?.instructions?.firstOrNull()
        ?: error("ChMate image selection callback has no implementation")

    // The stock callback probes the selected URI synchronously to detect the
    // special 500x250 drawing format. On recent Android photo pickers that
    // probe can reach a provider with a null result bundle and fail while the
    // ActivityResult is being delivered. Normal attachments do not need this
    // probe, so route them directly through the existing upload-setting path.
    method.addInstructionsWithLabels(
        0,
        "if-eqz p1, :haiagaru_image_result_original\n"
            + "const/4 v0, 0x0\n"
            + "invoke-virtual {p0, p1, v0}, "
            + "Ljp/syoboi/a2chMate/feature/resedit/ResEditFragment;->b(Ljava/util/List;Z)V\n"
            + "return-void",
        ExternalLabel("haiagaru_image_result_original", firstInstruction),
    )
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchImageSelectionReflectionTrap() {
    val method = mutableClassDefBy(
        "Ljp/syoboi/a2chMate/feature/resedit/ResEditFragment;"
    ).methods.single { candidate ->
        candidate.name == "b"
            && candidate.returnType == "V"
            && candidate.parameters.map(CharSequence::toString) ==
            listOf("Ljava/util/List;", "Z")
    }
    val instructions = method.implementation?.instructions
        ?: error("ChMate image selection method has no implementation")

    val uploadPathIndex = instructions.indexOfLast { instruction ->
        if (instruction.opcode != Opcode.CHECK_CAST) return@indexOfLast false
        val reference = (instruction as? ReferenceInstruction)?.reference as? TypeReference
            ?: return@indexOfLast false
        reference.type == "Ljava/util/Collection;"
    }.takeIf { it >= 0 }
        ?: error("ChMate image upload array conversion was not found")

    val uploadArrayInstruction = instructions.getOrNull(uploadPathIndex + 1)
        ?.takeIf { instruction -> instruction.opcode == Opcode.NEW_ARRAY }
        as? TwoRegisterInstruction
        ?: error("ChMate image upload Uri array creation was not found")
    val uploadArraySizeRegister = uploadArrayInstruction.registerB
    val zeroArraySizeIndex = (0 until uploadPathIndex).lastOrNull { index ->
        val instruction = instructions[index]
        (instruction as? OneRegisterInstruction)?.registerA == uploadArraySizeRegister
            && (instruction as? NarrowLiteralInstruction)?.narrowLiteral == 0
    } ?: error("ChMate image upload zero-length array initializer was not found")

    // URI MIME/size probing and the reflected image check both run while the
    // ActivityResult callback is being delivered. The Android photo picker can
    // return a provider result whose extras bundle is null, which makes that
    // synchronous validation fail with a NullPointerException. Keep the original
    // Fragment/context guards and the zero-length Uri[] initializer, then skip only
    // the validation loop. This also preserves the verifier types expected by the
    // existing List -> Collection -> Uri[] conversion below.
    method.addInstructionsWithLabels(
        zeroArraySizeIndex + 1,
        "goto/32 :haiagaru_image_upload_path",
        ExternalLabel("haiagaru_image_upload_path", instructions[uploadPathIndex])
    )
}

/** Prefer the real UPLIFT branch over the re-signing-sensitive decoy. */
private fun BytecodePatchContext.patchUpliftIntegrityComparison(
    ownerType: String,
    methodName: String,
    vararg parameters: String,
    returnType: String = "Ljava/lang/String;",
) {
    val method = mutableClassDefBy(ownerType).methods.single { candidate ->
        candidate.name == methodName && candidate.returnType == returnType
            && candidate.parameterTypes.map(CharSequence::toString) == parameters.toList()
    }
    val instructions = method.implementation?.instructions?.toList()
        ?: error("UPLIFT integrity method missing: $ownerType.$methodName")
    val guards = instructions.indices.filter { index ->
        instructions[index].opcode == Opcode.IF_NE
            && instructions.subList(maxOf(0, index - 8), index).count { it.opcode == Opcode.AGET } >= 2
    }
    check(guards.size == 1) {
        "Expected one UPLIFT integrity comparison in $ownerType.$methodName, found ${guards.size}"
    }
    method.replaceInstruction(guards.single(), "nop")
}

/** Skip the certificate-dependent decoy that throws a numeric error before UPLIFT posting. */
private fun BytecodePatchContext.patchUpliftPostingIntegrity242() {
    val method = mutableClassDefBy("Lo/getBackImage;").methods.single { candidate ->
        candidate.name == "c"
            && candidate.returnType == "Ljava/lang/String;"
            && candidate.parameterTypes.map(CharSequence::toString) ==
                listOf("Lo/getBackImage\$ComponentActivity;")
    }
    val instructions = method.implementation?.instructions?.toList()
        ?: error("ChMate 242 UPLIFT posting method missing")
    val runtimeError = instructions.indexOfLast { instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Ljava/lang/RuntimeException;"
            && ref.name == "<init>"
            && ref.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;")
    }
    check(runtimeError >= 0 && instructions.getOrNull(runtimeError + 1)?.opcode == Opcode.THROW) {
        "ChMate 242 numeric UPLIFT integrity error changed"
    }
    val normalPath = instructions.indexOfFirst { instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Lo/zzbvt;" && ref.name == "getValue"
    }
    check(normalPath > 0 && normalPath < runtimeError) { "ChMate 242 UPLIFT client path missing" }
    val methodStart = instructions.indexOfFirst { instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Ljava/lang/reflect/Field;" && ref.name == "getLong"
    }
    check(methodStart > 0 && methodStart < runtimeError) {
        "ChMate 242 UPLIFT integrity entry changed"
    }
    // Preserve the method prologue/register setup. The target path initializes
    // its own client and token variables and returns either the cached token or
    // the result of the normal UPLIFT login call.
    method.addInstructionsWithLabels(
        methodStart,
        "const-string v12, \"\"\ngoto/32 :haiagaru_uplift_client_242",
        ExternalLabel("haiagaru_uplift_client_242", instructions[normalPath - 1]),
    )
}

/** Keep 242's real UPLIFT login branch reachable after re-signing the APK. */
private fun BytecodePatchContext.patchUpliftLoginIntegrity242() {
    val method = mutableClassDefBy("Lo/getAdLogo;").methods.single { candidate ->
        candidate.name == "e" && candidate.returnType == "Ljava/lang/String;"
            && candidate.parameterTypes.map(CharSequence::toString) == listOf(
                "Lo/getBackImage\$ComponentActivity;", "Lo/ApiAnyClient;", "J",
            )
    }
    val instructions = method.implementation?.instructions?.toList()
        ?: error("ChMate 242 UPLIFT login implementation missing")
    val successResult = instructions.indexOfFirst { instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Lo/TTVideoLandingPageActivity2;" && ref.name == "c"
            && ref.returnType == "Lo/TTVideoLandingPageActivity2\$ComponentActivity;"
    }
    // The final certificate comparison jumps to a deliberate null throw.
    // Keep the normal result handling immediately after that guard.
    val integrityGuards = instructions.indices.filter { index ->
        index < successResult && instructions[index].opcode == Opcode.IF_NE
            && instructions.subList(maxOf(0, index - 8), index).count { it.opcode == Opcode.AGET } >= 2
    }
    check(integrityGuards.size == 1) {
        "Expected one ChMate 242 UPLIFT integrity comparison, found ${integrityGuards.size}"
    }
    method.replaceInstruction(integrityGuards.single(), "nop")
}

/** Restore the literal prefix length used only to form a Kotlin diagnostic. */
private fun BytecodePatchContext.patchLiteralDiagnosticSubstring242(
    ownerType: String,
    diagnostic: String,
    prefixLength: Int,
) {
    val candidates = mutableClassDefBy(ownerType).methods.mapNotNull { method ->
        val instructions = method.implementation?.instructions?.toList() ?: return@mapNotNull null
        val textIndex = instructions.indexOfFirst { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == diagnostic
        }
        if (textIndex < 0) return@mapNotNull null
        val substringIndex = (textIndex + 1 until minOf(textIndex + 5, instructions.size))
            .firstOrNull { index ->
                val reference = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
                reference?.definingClass == "Ljava/lang/String;"
                    && reference.name == "substring"
                    && reference.parameterTypes.map(CharSequence::toString) == listOf("I")
            } ?: return@mapNotNull null
        method to substringIndex
    }
    check(candidates.size == 1) { "Expected one $ownerType diagnostic substring, found ${candidates.size}" }
    val (method, substringIndex) = candidates.single()
    val indexRegister = when (val call = method.implementation!!.instructions[substringIndex]) {
        is FiveRegisterInstruction -> call.registerD
        is RegisterRangeInstruction -> call.startRegister + 1
        else -> error("$ownerType diagnostic substring register changed")
    }
    val opcode = if (prefixLength < 8) "const/4" else "const/16"
    method.addInstructionsWithLabels(substringIndex, "$opcode v$indexRegister, 0x${prefixLength.toString(16)}")
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchImageUploadIntegrity242() {
    val method = mutableClassDefBy("Lo/ApiMetadataBuilder;").methods.single {
        it.name == "c" && it.parameters.isEmpty() && it.returnType == "Lo/zzbtj;"
    }
    val instructions = method.implementation?.instructions
        ?: error("ChMate 242 image upload implementation missing")
    val comparison = instructions.indices.single { index ->
        if (instructions[index].opcode != Opcode.IF_NE || index < 6) return@single false
        val window = instructions.subList(index - 6, index)
        window.map { it.opcode } == listOf(
            Opcode.AGET_OBJECT, Opcode.CHECK_CAST, Opcode.AGET,
            Opcode.AGET_OBJECT, Opcode.CHECK_CAST, Opcode.AGET,
        )
    }
    val first = instructions[comparison - 6] as ThreeRegisterInstruction
    val second = instructions[comparison - 3] as ThreeRegisterInstruction
    check(first.registerB == second.registerB) { "ChMate 242 integrity arrays differ" }
    // Normalize at the comparison, after either cached or freshly generated state
    // has been selected. Unlike the diagnostic hook this requires no clock/cache
    // manipulation and also works on the first upload after a process restart.
    val register = first.registerB
    method.addInstruction(
        comparison - 6,
        "invoke-static/range { v$register .. v$register }, " +
            "$EXTENSION->normalizeImageUploadIntegrity242([Ljava/lang/Object;)V",
    )

    // The successful path still computes "uploading" from "8/22/uploading"
    // through an obfuscated integer expression. On 242 this expression can
    // divide by zero before the image bytes are copied. The intended index is
    // the constant prefix length (5), so replace only its final division.
    val filenameStart = instructions.indices.single { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference
        reference is StringReference && reference.string == "8/22/uploading"
    }
    val substring = (filenameStart + 1 until instructions.size).first { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference
        reference is MethodReference && reference.definingClass == "Ljava/lang/String;"
            && reference.name == "substring" && reference.parameterTypes.size == 1
    }
    val filenameDivision = (filenameStart + 1 until substring).last { index ->
        instructions[index].opcode == Opcode.DIV_INT_2ADDR
    }
    val division = instructions[filenameDivision] as TwoRegisterInstruction
    check(division.registerA == 13 && division.registerB == 0) {
        "ChMate 242 image upload filename calculation changed"
    }
    method.replaceInstruction(filenameDivision, "const/4 v13, 0x5")
}

/** Strip only Edge's reporter suffix before 191 compares successor titles. */
private fun BytecodePatchContext.patchLegacyNextThreadTitleMatch191() {
    val method = mutableClassDefBy("Lo/o2;").methods.single { candidate ->
        candidate.name == "b" && candidate.returnType == "Lo/o2\$setContentView;"
            && candidate.parameterTypes.map(CharSequence::toString) == listOf(
                "Landroid/content/Context;", "Lo/getLabel;",
                "Ljp/syoboi/a2chMate/client/BBSUrlInfo;", "Z",
                "Lo/r8lambdamHWy7omJVz7G9M7u2KSo5IaRp90;",
            )
    }
    val instructions = method.implementation?.instructions
        ?: error("ChMate 191 next-thread worker missing")
    val normalizationCalls = instructions.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        if (reference?.definingClass == "Lo/ocd;" && reference.name == "b"
            && reference.parameterTypes.map(CharSequence::toString) ==
            listOf("Lo/getAmount;", "Ljava/lang/String;")) index else null
    }
    check(normalizationCalls.size == 3) {
        "ChMate 191 next-thread title normalization changed"
    }
    // The third call normalizes the current favorite's title. The first two
    // normalize candidate/new titles. All three must ignore only the Edge ID.
    normalizationCalls.asReversed().forEach { index ->
        val call = instructions[index] as FiveRegisterInstruction
        val titleRegister = call.registerD
        method.addInstructionsWithLabels(index, """
            invoke-static { v$titleRegister }, Lapp/morphe/extension/chmate/EdgeReporterId;->titleForNextThreadMatch(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v$titleRegister
        """.trimIndent())
    }
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchImageUploadIntegrityComparison() {
    val method = mutableClassDefBy("Lo/zzbwa;").methods.single { candidate ->
        candidate.name == "d"
            && candidate.returnType == "Lo/zzfqa;"
            && candidate.parameters.isEmpty()
    }
    val instructions = method.implementation?.instructions
        ?: error("ChMate image upload task has no implementation")

    val rejectionBranches = instructions.indices.filter { index ->
        if (instructions[index].opcode != Opcode.IF_NE) return@filter false
        val window = instructions.subList(maxOf(0, index - 8), index)
        window.count { it.opcode == Opcode.AGET_OBJECT } >= 2
            && window.count { it.opcode == Opcode.CHECK_CAST } >= 2
            && window.count { it.opcode == Opcode.AGET } >= 2
    }
    check(rejectionBranches.size == 1) {
        "Expected one ChMate image upload integrity rejection branch, found " +
            rejectionBranches.size
    }

    // The mismatch branch enters a decoy block that eventually executes `throw null`.
    // Re-signing changes the compared certificate-derived state, so retain the real
    // upload path by forcing the equality fall-through without changing image math.
    method.replaceInstruction(rejectionBranches.single(), "nop")

    val tempNameSubstringIndex = instructions.indices.singleOrNull { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@singleOrNull false
        if (reference.definingClass != "Ljava/lang/String;"
            || reference.name != "substring"
            || reference.returnType != "Ljava/lang/String;"
            || reference.parameterTypes.map(CharSequence::toString) != listOf("I")
            || instructions.getOrNull(index - 1)?.opcode != Opcode.DIV_INT_2ADDR
        ) {
            return@singleOrNull false
        }
        instructions.subList(index + 1, minOf(index + 7, instructions.size)).any { next ->
            val nextReference = (next as? ReferenceInstruction)?.reference
                as? MethodReference ?: return@any false
            nextReference.definingClass == "Ljava/io/File;"
                && nextReference.name == "<init>"
                && nextReference.parameterTypes.map(CharSequence::toString) ==
                listOf("Ljava/io/File;", "Ljava/lang/String;")
        }
    } ?: error("ChMate image upload temporary filename decoder was not found")
    val tempNameResultRegister = (instructions.getOrNull(tempNameSubstringIndex + 1)
        as? OneRegisterInstruction)?.registerA
        ?: error("ChMate image upload temporary filename result was not found")

    // The temporary name is encoded as a control-character prefix followed by
    // "uploading". Its substring index is derived through certificate-sensitive
    // arithmetic and becomes a zero divisor after re-signing. Keep the actual file
    // name directly and leave all later image decoding and payload arithmetic intact.
    method.replaceInstruction(tempNameSubstringIndex - 1, "nop")
    method.replaceInstruction(
        tempNameSubstringIndex,
        "const-string v$tempNameResultRegister, \"uploading\"",
    )
    method.replaceInstruction(tempNameSubstringIndex + 1, "nop")

    val dynamicUploaderInvokeIndex = instructions.indices.singleOrNull { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@singleOrNull false
        reference.definingClass == "Ljava/lang/reflect/Method;"
            && reference.name == "invoke"
            && reference.returnType == "Ljava/lang/Object;"
            && instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
            && ((instructions.getOrNull(index + 2) as? ReferenceInstruction)?.reference
                as? TypeReference)?.type == "Lo/zzfqa;"
    } ?: error("ChMate dynamic image uploader invocation was not found")

    // The actual uploader is decrypted into an InMemoryDexClassLoader, so it cannot
    // be edited by the normal APK bytecode patch. Route only this reflected call
    // through the extension, which repairs the uploader's two cached comparison
    // values and then invokes the original method unchanged.
    when (val invocation = instructions[dynamicUploaderInvokeIndex]) {
        is FiveRegisterInstruction -> method.replaceInstruction(
            dynamicUploaderInvokeIndex,
            "invoke-static { v${invocation.registerC}, v${invocation.registerD}, " +
                "v${invocation.registerE} }, $EXTENSION->invokeCurrentImageUploader(" +
                "Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)" +
                "Ljava/lang/Object;",
        )

        is RegisterRangeInstruction -> method.replaceInstruction(
            dynamicUploaderInvokeIndex,
            "invoke-static/range { v${invocation.startRegister} .. " +
                "v${invocation.startRegister + 2} }, " +
                "$EXTENSION->invokeCurrentImageUploader(Ljava/lang/reflect/Method;" +
                "Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;",
        )

        else -> error("ChMate dynamic image uploader registers were not found")
    }
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacyThreadUrlEntry(
    profile: ChMateProfile,
) {
    val activityClass = if (profile.hasHiltSettings) {
        "Ljp/syoboi/a2chMate/activity/Hilt_ResListActivity;"
    } else {
        "Ljp/syoboi/a2chMate/activity/ResListActivity;"
    }
    val method = mutableClassDefBy(activityClass).methods.single { method ->
        method.name == "onCreate"
            && method.returnType == "V"
            && method.parameters.map(CharSequence::toString) == listOf("Landroid/os/Bundle;")
    }
    method.addInstruction(
        0,
        "invoke-static/range { p0 .. p0 }, " +
            "$EXTENSION->rewriteLegacyThreadIntent(Landroid/app/Activity;)V",
    )
    method.addBeforeEveryReturn(
        "invoke-static/range { p0 .. p0 }, " +
            "$EXTENSION->hideTalkThreadBlankRows(Landroid/app/Activity;)V",
    )
}

private fun app.morphe.patcher.patch.BytecodePatchContext
    .patchFinishedLegacyThreadLaunchGuard() {
    val method = mutableClassDefBy("Ljp/syoboi/a2chMate/activity/ResListActivity;")
        .methods
        .single { candidate ->
            candidate.name == "onCreate"
                && candidate.returnType == "V"
                && candidate.parameters.map(CharSequence::toString) ==
                listOf("Landroid/os/Bundle;")
        }
    val instructions = method.implementation?.instructions
        ?: error("ChMate ResListActivity onCreate has no implementation")
    val superOnCreateIndex = instructions.indices.firstOrNull { index ->
        if (instructions[index].opcode != Opcode.INVOKE_SUPER) return@firstOrNull false
        val reference = (instructions[index] as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@firstOrNull false
        reference.name == "onCreate"
            && reference.returnType == "V"
            && reference.parameterTypes.map(CharSequence::toString) ==
            listOf("Landroid/os/Bundle;")
    } ?: error("ChMate ResListActivity super.onCreate call was not found")
    val freeRegister = method.findFreeRegister(superOnCreateIndex + 1)

    // Automatic DAT import finishes the first Activity and opens a retry Activity
    // after publishing its local cache. Some Android versions still continue the
    // concrete onCreate method after finish(), where ChMate assumes its content
    // views exist and calls View.getTag() on null. Stop only that finished instance.
    method.addInstructionsWithLabels(
        superOnCreateIndex + 1,
        """
            invoke-virtual { p0 }, Landroid/app/Activity;->isFinishing()Z
            move-result v$freeRegister
            if-eqz v$freeRegister, :haiagaru_continue_reslist_create
            return-void
            :haiagaru_continue_reslist_create
            nop
        """,
    )
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacyTabletThreadUrlEntry(
    versionName: String,
) {
    val (methodName, fragmentType) = when (versionName) {
        "0.8.10.191 dev" -> "Sq_" to "Lo/r8lambdahIGIGCNpKpFqE0lgDli724UCuDM;"
        "0.8.10.226 dev" -> "d" to "Landroidx/fragment/app/Fragment;"
        "0.8.10.242 dev", "0.8.10.243 dev" -> "c" to "Landroidx/fragment/app/Fragment;"
        else -> error("Unsupported tablet thread entry version: $versionName")
    }
    val method = mutableClassDefBy("Ljp/syoboi/a2chMate/activity/TabletHomeActivity;")
        .methods
        .single { candidate ->
            candidate.name == methodName
                && candidate.returnType == "V"
                && candidate.parameters.map(CharSequence::toString) == listOf(
                fragmentType,
                "I",
                "Landroid/os/Bundle;",
            )
        }
    val freeRegister = method.findFreeRegister(0)
    method.addInstructionsWithLabels(
        0,
        """
            invoke-static { p0, p3 }, $EXTENSION->rewriteLegacyTabletThreadBundle(Landroid/app/Activity;Landroid/os/Bundle;)Z
            move-result v$freeRegister
            if-eqz v$freeRegister, :haiagaru_continue_tablet_thread
            return-void
            :haiagaru_continue_tablet_thread
            nop
        """,
    )
}

/**
 * ChMate initializes both LevelPlay and IronSource Ad Quality while constructing its
 * banner wrapper, before LevelPlayBannerAdView.loadAd() is reached. Guarding loadAd()
 * alone therefore still lets the SDK contact i-sdk.mediation.unity3d.com and
 * i-adq.mediation.unity3d.com. Stop both public initialization paths while ad hiding
 * is enabled, without tying this patch to the SDK's non-ASCII implementation name.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchLevelPlayTrackerInitialization() {
    val levelPlayInitMethods = mutableClassDefBy("Lcom/unity3d/mediation/LevelPlay;")
        .methods
        .filter { method ->
            method.name == "init"
                && method.returnType == "V"
                && method.parameters.firstOrNull()?.toString() == "Landroid/content/Context;"
        }
    check(levelPlayInitMethods.isNotEmpty()) {
        "LevelPlay initialization entry point was not found"
    }
    levelPlayInitMethods.forEach { it.addHideAdsGuard() }

    var adQualityInitMethodCount = 0
    classDefForEach { classDef ->
        if (classDef.superclass != "Lcom/ironsource/adqualitysdk/sdk/IronSourceAdQuality;") {
            return@classDefForEach
        }

        val mutableClass = mutableClassDefBy(classDef)
        classDef.methods
            .filter { method ->
                method.name == "initialize"
                    && method.returnType == "V"
                    && method.parameters.take(2).map(CharSequence::toString) == listOf(
                        "Landroid/content/Context;",
                        "Ljava/lang/String;",
                    )
            }
            .forEach { method ->
                mutableClass.findMutableMethodOf(method).addHideAdsGuard()
                adQualityInitMethodCount++
            }
    }
    check(adQualityInitMethodCount > 0) {
        "IronSource Ad Quality initialization implementation was not found"
    }

    // Unity Ads generations before 4.16 do not contain AdsSdkInitializer.
    // Guard the entry point when present while retaining the LevelPlay and Ad
    // Quality guards above for older ChMate targets such as 0.8.10.226 dev.
    classDefForEach { classDef ->
        if (classDef.type != "Lcom/unity3d/services/core/configuration/AdsSdkInitializer;") {
            return@classDefForEach
        }
        val mutableClass = mutableClassDefBy(classDef)
        classDef.methods.filter { method ->
            method.name == "create"
                && method.returnType == "V"
                && method.parameters.map(CharSequence::toString) ==
                listOf("Landroid/content/Context;")
        }.forEach { method ->
            mutableClass.findMutableMethodOf(method).addHideAdsContextGuard("p1")
        }
    }

    listOf(
        "Lcom/ironsource/lifecycle/IronsourceLifecycleProvider;",
        "Lcom/ironsource/lifecycle/LevelPlayActivityLifecycleProvider;",
    ).forEach { providerType ->
        mutableClassDefBy(providerType).methods
            .single { method ->
                method.name == "onCreate"
                    && method.returnType == "Z"
                    && method.parameters.isEmpty()
            }
            .addHideAdsContentProviderGuard()
    }
}

/**
 * AppLovin and Google Mobile Ads register manifest ContentProviders in every supported
 * ChMate build, so they can initialize before any banner load method is called. Keep
 * the providers inert when ad hiding is enabled while preserving their original path
 * when the setting is disabled.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchCommonAdSdkInitialization() {
    mutableClassDefBy("Lcom/applovin/sdk/AppLovinInitProvider;").methods
        .single { method ->
            method.name == "onCreate"
                && method.returnType == "Z"
                && method.parameters.isEmpty()
        }
        .addHideAdsContentProviderGuard()

    mutableClassDefBy("Lcom/google/android/gms/ads/MobileAdsInitProvider;").methods
        .single { method ->
            method.name == "attachInfo"
                && method.returnType == "V"
                && method.parameters.map(CharSequence::toString) == listOf(
                    "Landroid/content/Context;",
                    "Landroid/content/pm/ProviderInfo;",
                )
        }
        .addHideAdsContextGuard("p1")
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacyFragmentBannerDiscovery() {
    classDefForEach { classDef ->
        if (!classDef.type.startsWith("Ljp/syoboi/") && !classDef.type.startsWith("Lo/")) {
            return@classDefForEach
        }

        val candidates = classDef.methods.filter { method ->
            method.name == "onViewCreated"
                && method.returnType == "V"
                && method.parameters.map(CharSequence::toString) ==
                listOf("Landroid/view/View;", "Landroid/os/Bundle;")
                && method.implementation != null
        }
        if (candidates.isEmpty()) return@classDefForEach

        val mutableClass = mutableClassDefBy(classDef)
        candidates.forEach { method ->
            mutableClass.findMutableMethodOf(method).addInstruction(
                0,
                "invoke-static/range { p1 .. p1 }, $EXTENSION->hideLegacyBanner(Landroid/view/View;)V"
            )
        }
    }
}

/**
 * ChMate 191 represents the banner between responses as adapter view type 5.
 * Collapse that returned row while preserving every normal response row.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacyThreadListAd(
    adapterClass: String,
) {
    val method = mutableClassDefBy(adapterClass).methods.single { method ->
        method.name == "getView"
            && method.returnType == "Landroid/view/View;"
            && method.parameters.map(CharSequence::toString) == listOf(
                "I",
                "Landroid/view/View;",
                "Landroid/view/ViewGroup;",
            )
    }
    // ExtraQuickFilters also returns a View near the return. Only the native
    // renderer still has the integer position in p1; its result reuses p1.
    val instructions = method.implementation?.instructions?.toList()
        ?: error("ChMate response adapter has no implementation")
    val renderer = when (adapterClass) {
        "Lo/m9ExternalSyntheticLambda1;" -> "Lo/m9a;" to "SL_"
        "Lo/listener;" -> "Lo/pushResetLaterokhttp;" to "e"
        else -> error("Unsupported legacy response adapter: $adapterClass")
    }
    val bindIndex = instructions.indices.single { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@single false
        reference.definingClass == renderer.first && reference.name == renderer.second
            && reference.parameterTypes == listOf("Landroid/view/View;", "Landroid/view/ViewGroup;", "I", "Ljava/lang/Object;")
            && reference.returnType == "Landroid/view/View;"
            && instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
    }

    val resultRegister = (instructions[bindIndex + 1] as OneRegisterInstruction).registerA
    // Intercept the View while p1 still holds the adapter position, then restore
    // the original destination. Preserve both the 191 filter hook and 226
    // assertion, including their argument registers.
    method.replaceInstruction(bindIndex + 1, "move-result-object p2")
    method.addInstructionsWithLabels(
        bindIndex + 2,
        """
            invoke-static {p2, p0, p1}, $EXTENSION->hideLegacyThreadListAd(Landroid/view/View;Landroid/widget/BaseAdapter;I)V
            move-object/from16 v$resultRegister, p2
        """.trimIndent(),
    )
}

private fun MutableMethod.returnProviderStartupDelegate(profile: ChMateProfile) {
    addInstructionsWithLabels(
        0,
        """
            move-object/from16 v0, p0
            iget-object v0, v0, ${profile.providerStartupTrapClass}->${profile.providerStartupDelegateField}:${profile.providerStartupDelegateType}
            invoke-virtual { v0 }, ${profile.providerStartupDelegateType}->${profile.providerStartupDelegateMethod}()Ljava/lang/Object;
            move-result-object v0
            return-object v0
        """
    )
}

private fun MutableMethod.bypassLegacyViewModelTamperTrap() {
    val instructions = implementation?.instructions
        ?: error("ChMate legacy settings ViewModel constructor has no implementation")
    val trapIndex = instructions.indices.firstOrNull { index ->
        index + 2 < instructions.size
            && instructions[index].opcode == Opcode.NEW_ARRAY
            && instructions[index + 1].opcode == Opcode.ADD_INT_LIT8
            && instructions[index + 2].opcode == Opcode.APUT
    } ?: error("ChMate legacy settings ViewModel array trap was not found")
    val failureBranchIndex = instructions.subList(0, trapIndex)
        .indexOfLast { it.opcode == Opcode.IF_NE }
        .takeIf { it >= 0 }
        ?: error("ChMate legacy settings ViewModel failure branch was not found")

    replaceInstruction(failureBranchIndex, "nop")

    // The constructor later derives the SharedPreferences mode from the same
    // certificate state. On a re-signed APK the decoy calculation makes its
    // divisor zero; the real value is Context.MODE_PRIVATE (0).
    val preferencesNameIndex = instructions.indices.firstOrNull { index ->
        ((instructions[index] as? ReferenceInstruction)?.reference as? StringReference)
            ?.string == "dispose_dialog"
    } ?: error("ChMate legacy settings preferences initialization was not found")
    val modeDivisionIndex = instructions.subList(maxOf(0, preferencesNameIndex - 80), preferencesNameIndex)
        .indexOfLast { it.opcode == Opcode.DIV_INT }
        .takeIf { it >= 0 }
        ?.plus(maxOf(0, preferencesNameIndex - 80))
        ?: error("ChMate legacy settings preferences mode trap was not found")
    val modeRegister = (instructions[modeDivisionIndex] as ThreeRegisterInstruction).registerA
    replaceInstruction(modeDivisionIndex, "const/4 v$modeRegister, 0x0")
}

private fun MutableMethod.bypassHiltSettingsTamperTrap(profile: ChMateProfile) {
    val instructions = implementation?.instructions
        ?: error("ChMate Hilt settings onCreate has no implementation")
    if (profile.signatureDirectWrapperBypass) {
        val failureBranchIndex = instructions.indexOfLast { it.opcode == Opcode.IF_NE }
            .takeIf { it >= 0 }
            ?: error("ChMate Hilt settings signature branch was not found")
        replaceInstruction(failureBranchIndex, "nop")
        return
    }

    val rejectionConstructorIndex = instructions.indexOfFirst { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@indexOfFirst false
        reference.definingClass == "Ljava/lang/RuntimeException;"
            && reference.name == "<init>"
            && reference.parameterTypes.map(CharSequence::toString) ==
            listOf("Ljava/lang/String;")
    }.takeIf { it >= 0 }
        ?: error("ChMate Hilt settings signature rejection was not found")
    val failureBranchIndex = instructions.subList(0, rejectionConstructorIndex)
        .indexOfLast { it.opcode == Opcode.IF_NE }
        .takeIf { it >= 0 }
        ?: error("ChMate Hilt settings signature branch was not found")

    replaceInstruction(failureBranchIndex, "nop")
}

private fun MutableMethod.bypassSettingsTamperTrap(profile: ChMateProfile) {
    val instructions = implementation?.instructions
        ?: error("ChMate settings onCreate has no implementation")
    if (profile.settingsWindowFeatureDivideTrap) {
        // 0.8.10.241 also has a certificate-dependent settings decoy before
        // the real Activity setup.  Its `(n - 1) * n % 2` expression is
        // unconditionally zero, and the resulting remainder is only used to
        // select a Toast resource.  The previous patch covered the later
        // DIV_INT traps but not this REM_INT trap, so Android 17 reached this
        // block while opening Settings and crashed at the reported line 312.
        val toastRemainderIndex = instructions.indices.singleOrNull { index ->
            if (instructions[index].opcode != Opcode.REM_INT_2ADDR) return@singleOrNull false
            instructions.subList(index + 1, minOf(index + 6, instructions.size)).any { next ->
                val reference = (next as? ReferenceInstruction)?.reference
                    as? MethodReference ?: return@any false
                reference.definingClass == "Landroid/widget/Toast;"
                    && reference.name == "makeText"
            }
        } ?: error("ChMate settings Toast remainder trap was not found")
        val realSetupIndex = (toastRemainderIndex + 1 until instructions.size).firstOrNull { index ->
            instructions[index].opcode == Opcode.NEW_ARRAY
        } ?: error("ChMate settings setup after Toast remainder trap was not found")
        addInstructionsWithLabels(
            toastRemainderIndex,
            "goto/32 :haiagaru_settings_after_toast_trap",
            ExternalLabel("haiagaru_settings_after_toast_trap", instructions[realSetupIndex]),
        )

        // 0.8.10.241 derives FEATURE_NO_TITLE through an integrity-dependent divisor.
        // Re-signing can make that divisor zero, so retain the normal value directly.
        val requestWindowFeatureIndex = instructions.indexOfFirst { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ?: return@indexOfFirst false
            reference.definingClass == "Landroid/app/Activity;"
                && reference.name == "requestWindowFeature"
                && reference.parameterTypes.map(CharSequence::toString) == listOf("I")
        }.takeIf { it >= 0 }
            ?: error("ChMate settings requestWindowFeature call was not found")
        val divideIndex = instructions.subList(0, requestWindowFeatureIndex)
            .indexOfLast { it.opcode == Opcode.DIV_INT_2ADDR }
            .takeIf { it >= 0 }
            ?: error("ChMate settings window feature divide trap was not found")
        val featureRegister = (instructions[divideIndex] as TwoRegisterInstruction).registerA
        replaceInstruction(
            divideIndex,
            "const/4 v$featureRegister, 0x1"
        )
    }

    val failureBranchIndex = if (profile.signatureDirectWrapperBypass) {
        instructions.indexOfLast { it.opcode == Opcode.IF_NE }
            .takeIf { it >= 0 }
            ?: error("ChMate settings tamper branch was not found")
    } else {
        val trapIndex = instructions.indices.firstOrNull { index ->
            index + 7 < instructions.size
                && instructions[index].opcode == Opcode.NEW_ARRAY
                && instructions[index + 1].opcode == Opcode.ADD_INT_LIT8
                && instructions[index + 2].opcode == Opcode.APUT
                && instructions[index + 3].opcode == Opcode.MUL_INT_2ADDR
                && instructions[index + 4].opcode == Opcode.CONST_4
                && instructions[index + 5].opcode == Opcode.REM_INT_2ADDR
                && instructions[index + 6].opcode == Opcode.SUB_INT_2ADDR
                && instructions[index + 7].opcode == Opcode.AGET
        } ?: error("ChMate settings tamper trap was not found")
        instructions.subList(0, trapIndex)
            .indexOfLast { it.opcode == Opcode.IF_NE }
            .takeIf { it >= 0 }
            ?: error("ChMate settings tamper branch was not found")
    }

    // Falling through this branch executes ChMate's complete normal initialization path,
    // including the Object[] state later consumed by the real settings setup.
    replaceInstruction(failureBranchIndex, "nop")

    // The final obfuscated calculation supplies only the fallback for the preferenceXml
    // intent extra. Re-signing turns its denominator into zero; an actual supplied extra
    // remains authoritative, while zero means no preselected settings page.
    val preferenceDefaultDivideIndex = instructions.indexOfLast {
        it.opcode == Opcode.DIV_INT_2ADDR
    }.takeIf { it >= 0 }
        ?: error("ChMate settings preferenceXml fallback was not found")
    val preferenceDefaultRegister =
        (instructions[preferenceDefaultDivideIndex] as TwoRegisterInstruction).registerA
    replaceInstruction(
        preferenceDefaultDivideIndex,
        "const/4 v$preferenceDefaultRegister, 0x0"
    )
}

private fun MutableMethod.bypassTamperTrap(profile: ChMateProfile) {
    val instructions = implementation?.instructions
        ?: error("ChMate ViewModel factory has no implementation")
    val dispatchIndex = instructions.indexOfFirst { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            ?: return@indexOfFirst false
        instruction.opcode == Opcode.IGET
            && reference.definingClass == profile.viewModelFactoryClass
            && reference.name == profile.viewModelDispatchField
            && reference.type == "I"
    }.takeIf { it > 0 }
        ?: error("ChMate ViewModel factory dispatch was not found")

    when (profile.viewModelTrapKind) {
        ViewModelTrapKind.NONE -> Unit
        ViewModelTrapKind.DIVIDE_BY_ZERO -> {
            val divideIndex = instructions.subList(0, dispatchIndex)
                .indexOfLast { it.opcode == Opcode.DIV_INT_2ADDR }
                .takeIf { it >= 0 }
                ?: error("ChMate ViewModel factory divide trap was not found")
            addInstructionsWithLabels(
                divideIndex,
                "goto/32 :haiagaru_dispatch",
                ExternalLabel("haiagaru_dispatch", instructions[dispatchIndex])
            )
        }
        ViewModelTrapKind.FAILURE_BRANCH -> {
            val failureBranchIndex = instructions.subList(0, dispatchIndex)
                // The integrity state sends inequality to the RuntimeException(String)
                // block. The normal fall-through immediately loads the factory
                // discriminator and switches.
                .indexOfLast { it.opcode == Opcode.IF_NE }
                .takeIf { it >= 0 }
                ?: error("ChMate ViewModel factory failure branch was not found")
            replaceInstruction(failureBranchIndex, "nop")
        }
    }
}

private fun MutableMethod.ignoreSignatureRejection(profile: ChMateProfile) {
    if (profile.signatureDirectWrapperBypass) {
        // Rejection is encoded as IF_NE -> null throw in both wrapper layers. Keep
        // their complete initialization and delegate calls, but force the normal path.
        bypassSignatureFailureBranches()
        return
    }

    val instructions = implementation?.instructions
        ?: error("ChMate signature check has no implementation")
    val rejectionConstructorIndex = instructions.indexOfFirst { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@indexOfFirst false
        reference.definingClass == "Ljava/lang/RuntimeException;"
            && reference.name == "<init>"
            && reference.parameterTypes.map(CharSequence::toString) ==
            listOf("Ljava/lang/String;")
    }.takeIf { it >= 0 }
        ?: error("ChMate signature rejection constructor was not found")
    val throwOffset = instructions.drop(rejectionConstructorIndex)
        .indexOfFirst { it.opcode == Opcode.THROW }
        .takeIf { it >= 0 }
        ?: error("ChMate signature rejection throw was not found")
    val rejectionThrowIndex = rejectionConstructorIndex + throwOffset

    addInstructionsWithLabels(
        rejectionThrowIndex,
        """
            move-object/from16 v0, p0
            iget-object v0, v0, ${profile.signatureClass}->${profile.signatureDelegateField}:${profile.signatureDelegateType}
            invoke-virtual { v0 }, ${profile.signatureDelegateType}->${profile.signatureDelegateMethod}()Ljava/lang/Object;
            move-result-object v0
            return-object v0
        """
    )
}

/**
 * ChMate 243 moved the in-thread banner from the legacy ListView adapter to
 * ResListRecyclerAdapter. Its INLINE_AD item (view type 5) always creates this
 * dedicated ViewHolder, so collapse its root view without affecting response rows.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchModernThreadListAd() {
    mutableClassDefBy("Lo/zzdpc\$IconCompatParcelizer;").methods
        .single { method ->
            method.name == "<init>"
                && method.returnType == "V"
                && method.parameters.map(CharSequence::toString) ==
                listOf("Landroid/view/View;")
        }
        .addBeforeEveryReturn(
            "invoke-static/range { p1 .. p1 }, " +
                "$EXTENSION->hideModernThreadListAd(Landroid/view/View;)V",
        )
}

/** Execute the wrapped callable directly, without the certificate-derived decoy path. */
private fun MutableMethod.returnSignatureDelegate(profile: ChMateProfile) {
    addInstructionsWithLabels(
        0,
        """
            move-object/from16 v0, p0
            iget-object v0, v0, ${profile.signatureClass}->${profile.signatureDelegateField}:${profile.signatureDelegateType}
            invoke-virtual {v0}, ${profile.signatureDelegateType}->${profile.signatureDelegateMethod}()Ljava/lang/Object;
            move-result-object v0
            return-object v0
        """.trimIndent(),
    )
}

private fun MutableMethod.bypassSignatureFailureBranches() {
    val branchIndexes = implementation?.instructions
        ?.mapIndexedNotNull { index, instruction ->
            if (instruction.opcode == Opcode.IF_NE) index else null
        }
        .orEmpty()
    if (branchIndexes.isEmpty()) {
        error("ChMate signature failure branches were not found")
    }
    branchIndexes.asReversed().forEach { replaceInstruction(it, "nop") }
}

private fun MutableMethod.addHideAdsViewGuard() {
    val freeRegister = findFreeRegister(0)
    addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p0 .. p0 }, $EXTENSION->hideAdView(Landroid/view/View;)V
            invoke-static { }, $EXTENSION->shouldHideAds()Z
            move-result v$freeRegister
            if-eqz v$freeRegister, :show_ads
            return-void
            :show_ads
            nop
        """
    )
}

private fun MutableMethod.addHideAdsGuard() {
    val freeRegister = findFreeRegister(0)
    addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $EXTENSION->shouldHideAds()Z
            move-result v$freeRegister
            if-eqz v$freeRegister, :show_ads
            return-void
            :show_ads
            nop
        """
    )
}

private fun MutableMethod.addHideAdsContextGuard(contextRegister: String) {
    val freeRegister = findFreeRegister(0)
    addInstructionsWithLabels(
        0,
        """
            invoke-static { $contextRegister }, $EXTENSION->shouldHideAds(Landroid/content/Context;)Z
            move-result v$freeRegister
            if-eqz v$freeRegister, :show_ads
            return-void
            :show_ads
            nop
        """
    )
}

private fun MutableMethod.addHideAdsContentProviderGuard() {
    val freeRegister = findFreeRegister(0)
    addInstructionsWithLabels(
        0,
        """
            invoke-virtual { p0 }, Landroid/content/ContentProvider;->getContext()Landroid/content/Context;
            move-result-object v$freeRegister
            invoke-static { v$freeRegister }, $EXTENSION->shouldHideAds(Landroid/content/Context;)Z
            move-result v$freeRegister
            if-eqz v$freeRegister, :show_ads
            const/4 v$freeRegister, 0x1
            return v$freeRegister
            :show_ads
            nop
        """
    )
}

private fun MutableMethod.addBeforeEveryReturn(instruction: String) {
    implementation?.instructions
        ?.mapIndexedNotNull { index, value ->
            if (value.opcode == Opcode.RETURN_VOID) index else null
        }
        ?.asReversed()
        ?.forEach { addInstruction(it, instruction) }
}

/** Keeps selected reporter metadata while retaining the normal history fallback. */
private fun MutableMethod.preserveEdgeReporterTitle(historyClass: String, titleField: String) {
    val instructions = implementation!!.instructions.toList()
    // The history title is read once for isEmpty, then to overwrite the selected
    // title. Replace only that final move, preserving all original branches.
    val index = instructions.indices.single { i ->
        val field = (instructions[i] as? ReferenceInstruction)?.reference as? FieldReference
        instructions[i].opcode == Opcode.IGET_OBJECT &&
            field?.definingClass == historyClass && field.name == titleField &&
            field.type == "Ljava/lang/String;" &&
            instructions.getOrNull(i + 1)?.opcode == Opcode.MOVE_OBJECT
    }
    val read = instructions[index] as TwoRegisterInstruction
    val move = instructions[index + 1] as TwoRegisterInstruction
    check(move.registerB == read.registerA && move.registerA != move.registerB)
    check(move.registerA < 16 && move.registerB < 16)
    replaceInstruction(index + 1,
        "invoke-static {v${move.registerA}, v${move.registerB}}, " +
            "Lapp/morphe/extension/chmate/EdgeReporterTitle;->preserve(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;")
    addInstruction(index + 2, "move-result-object v${move.registerA}")
}

/** Rewrites Edge's live-board subject feed before ChMate starts the request. */
private fun MutableMethod.rewriteEdgeSubjectUrl() {
    val returns = implementation?.instructions
        ?.mapIndexedNotNull { index, instruction ->
            if (instruction.opcode == Opcode.RETURN_OBJECT)
                index to (instruction as OneRegisterInstruction).registerA else null
        }
        .orEmpty()
    check(returns.isNotEmpty()) { "Edge subject URL return was not found" }
    returns.asReversed().forEach { (index, register) ->
        addInstructionsWithLabels(index, """
            invoke-static/range { v$register .. v$register }, $EXTENSION->rewriteSubjectUrl(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v$register
        """)
    }
}

/**
 * ChMate repeats its certificate-derived comparison inside many screen ViewModel
 * constructors. The names and surrounding arithmetic change between builds, but the
 * comparison is structurally stable: two int values are read from the obfuscator's
 * Object[] state and IF_NE jumps to a decoy exception block. Keep the real constructor
 * body by forcing the equality fall-through.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchDistributedIntegrityComparisons(
    includeAllObfuscatedClasses: Boolean = false,
) {
    classDefForEach { classDef ->
        if (!classDef.type.startsWith("Ljp/syoboi/")
            && classDef.type != "Lo/getLabel;"
            && !(includeAllObfuscatedClasses && classDef.type.startsWith("Lo/"))
        ) {
            return@classDefForEach
        }

        val mutableClass by lazy { mutableClassDefBy(classDef) }
        classDef.methods.forEach { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            val preserveLegacyImageArithmetic = classDef.type == "Lo/nq;"
                && method.name == "e"
                && method.returnType == "Lo/r0ExternalSyntheticLambda13;"
                && method.parameters.isEmpty()
            val matches = instructions.indices.filter { index ->
                if (instructions[index].opcode != Opcode.IF_NE) return@filter false
                val window = instructions.subList(maxOf(0, index - 12), index)
                window.count { it.opcode == Opcode.AGET_OBJECT } >= 2
                    && window.count { it.opcode == Opcode.CHECK_CAST } >= 2
                    && window.count { it.opcode == Opcode.AGET } >= 2
            }
            val literalZeroDivides = if (includeAllObfuscatedClasses
                && !preserveLegacyImageArithmetic
            ) {
                instructions.indices.filter { index ->
                    val instruction = instructions[index]
                    (instruction.opcode == Opcode.DIV_INT_LIT8
                        || instruction.opcode == Opcode.DIV_INT_LIT16)
                        && (instruction as? NarrowLiteralInstruction)?.narrowLiteral == 0
                }
            } else {
                emptyList()
            }

            val provableZeroDivides = if (includeAllObfuscatedClasses
                && !preserveLegacyImageArithmetic
            ) {
                instructions.indices.filter { index ->
                    val instruction = instructions[index]
                    if (instruction.opcode != Opcode.DIV_INT
                        && instruction.opcode != Opcode.DIV_INT_2ADDR
                    ) {
                        return@filter false
                    }
                    fun wasSetToZero(register: Int): Boolean {
                        return instructions.subList(maxOf(0, index - 5), index)
                            .indexOfLast { previous ->
                                (previous as? OneRegisterInstruction)?.registerA == register
                                    && (previous as? NarrowLiteralInstruction)?.narrowLiteral == 0
                            } >= 0
                    }
                    when (instruction) {
                        is ThreeRegisterInstruction ->
                            wasSetToZero(instruction.registerB)
                                || wasSetToZero(instruction.registerC)
                        is TwoRegisterInstruction ->
                            wasSetToZero(instruction.registerA)
                                || wasSetToZero(instruction.registerB)
                        else -> false
                    }
                }
            } else {
                emptyList()
            }

            // nq.e is the legacy image upload pipeline. Its divisions are decoder and
            // payload arithmetic, not rejection traps; rewriting them can inflate an
            // ordinary image into a near-gigabyte allocation.
            val derivedValueDivides = if (matches.isNotEmpty()
                && !preserveLegacyImageArithmetic
            ) {
                instructions.indices.filter { index ->
                    val instruction = instructions[index]
                    if (instruction.opcode != Opcode.DIV_INT
                        && instruction.opcode != Opcode.DIV_INT_2ADDR
                    ) {
                        return@filter false
                    }
                    val nextInstructions = instructions.subList(
                        index + 1,
                        minOf(index + 16, instructions.size)
                    )
                    val discardedBeforeFlagDecode = instruction.opcode == Opcode.DIV_INT
                        && nextInstructions.firstOrNull()?.opcode == Opcode.AND_INT_LIT8
                    val suppliesFrameworkIndex = nextInstructions.any { next ->
                        val reference = (next as? ReferenceInstruction)?.reference
                            as? MethodReference ?: return@any false
                        (reference.definingClass == "Ljava/lang/String;"
                            && reference.name == "substring"
                            && reference.parameterTypes.map(CharSequence::toString) == listOf("I"))
                            || (reference.definingClass == "Landroid/content/Context;"
                                && reference.name == "getSharedPreferences"
                                && reference.parameterTypes.map(CharSequence::toString) ==
                                listOf("Ljava/lang/String;", "I"))
                    }
                    discardedBeforeFlagDecode || suppliesFrameworkIndex
                }
            } else {
                emptyList()
            }

            if (matches.isEmpty() && literalZeroDivides.isEmpty()
                && provableZeroDivides.isEmpty()
                && derivedValueDivides.isEmpty()
            ) return@forEach

            val mutableMethod = mutableClass.findMutableMethodOf(method)
            matches.asReversed().forEach { mutableMethod.replaceInstruction(it, "nop") }
            (literalZeroDivides + provableZeroDivides + derivedValueDivides)
                .distinct()
                .sortedDescending()
                .forEach { index ->
                    val register = when (val instruction = instructions[index]) {
                        is ThreeRegisterInstruction -> instruction.registerA
                        is TwoRegisterInstruction -> instruction.registerA
                        else -> error("ChMate integrity divide destination was not found")
                    }
                    mutableMethod.replaceInstruction(index, "const/16 v$register, 0x0")
                }
        }
    }
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacyImageUploadTempName() {
    val method = mutableClassDefBy("Lo/nq;").methods.single { method ->
        method.name == "e"
            && method.returnType == "Lo/r0ExternalSyntheticLambda13;"
            && method.parameters.isEmpty()
    }
    val instructions = method.implementation?.instructions?.toList()
        ?: error("ChMate legacy image upload method has no implementation")
    val encodedNameIndex = instructions.indexOfFirst { instruction ->
        ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string ==
            "22|3|22|9|18|uploading"
    }.takeIf { it >= 0 }
        ?: error("ChMate legacy image upload filename was not found")
    val substringIndex = (encodedNameIndex until instructions.size).firstOrNull { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@firstOrNull false
        reference.definingClass == "Ljava/lang/String;"
            && reference.name == "substring"
            && reference.returnType == "Ljava/lang/String;"
            && reference.parameterTypes.map(CharSequence::toString) == listOf("I")
    } ?: error("ChMate legacy image upload filename decoder was not found")
    val substringInstruction = instructions[substringIndex]
    val indexRegister = when (substringInstruction) {
        is FiveRegisterInstruction -> substringInstruction.registerD
        is RegisterRangeInstruction -> substringInstruction.startRegister + 1
        else -> error("ChMate legacy image upload filename register was not found")
    }
    val divideIndex = (encodedNameIndex until substringIndex).lastOrNull { index ->
        val instruction = instructions[index]
        instruction.opcode == Opcode.DIV_INT_2ADDR
            && (instruction as? TwoRegisterInstruction)?.registerA == indexRegister
    } ?: error("ChMate legacy image upload filename division was not found")

    // The decoded suffix begins at character 13. Avoid the signature-derived divisor
    // while leaving file copying, image decoding, resizing, and uploading untouched.
    method.replaceInstruction(divideIndex, "const/16 v$indexRegister, 0xd")
}

/** Posting overflow only: preserve the native editor layout and all native menu actions. */
internal fun BytecodePatchContext.patchImgurPostingMenu(version: String) {
    patchPostingOverflowMenu(version,"ImgurWebUpload","imgur")
}

internal fun BytecodePatchContext.patchPostingOverflowMenu(version: String, extension: String, label: String) {
    val legacy = version == "0.8.10.191 dev"
    val owner = if (legacy) "Lo/p9ExternalSyntheticLambda6;"
        else "Ljp/syoboi/a2chMate/feature/resedit/ResEditFragment;"
    val prepareName = if (legacy) "Wy_" else "d"
    val dispatchName = when (version) {
        "0.8.10.191 dev" -> "VQ_"
        "0.8.10.226 dev" -> "e"
        "0.8.10.241", "0.8.10.242 dev" -> "a_"
        else -> error("Unsupported Imgur posting menu version: $version")
    }
    val cls = mutableClassDefBy(owner)
    val prepare = cls.methods.single {
        it.name == prepareName && it.returnType == "V"
            && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/view/Menu;")
    }
    check(prepare.implementation!!.instructions.any {
        val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Landroid/view/Menu;" && ref.name == "findItem"
    }) { "$version posting menu preparation contract changed" }
    // Add before native visibility updates. Branches targeting an existing return
    // can skip instructions inserted immediately before that return.
    prepare.addInstructionsWithLabels(0,
        "invoke-static/range {p0 .. p1}, Lapp/morphe/extension/chmate/$extension;->addPostingMenu(Ljava/lang/Object;Landroid/view/Menu;)V")
    val dispatch = cls.methods.single {
        it.name == dispatchName && it.returnType == "Z"
            && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/view/MenuItem;")
    }
    check(dispatch.implementation!!.registerCount > 2) { "$version posting dispatcher needs a local register" }
    check(dispatch.implementation!!.instructions.any {
        val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Landroid/view/MenuItem;" && ref.name == "getItemId"
    }) { "$version posting menu dispatch contract changed" }
    dispatch.addInstructionsWithLabels(0, """
        invoke-static/range {p0 .. p1}, Lapp/morphe/extension/chmate/$extension;->handlePostingMenu(Ljava/lang/Object;Landroid/view/MenuItem;)Z
        move-result v0
        if-eqz v0, :haiagaru_${label}_native_menu
        return v0
    """.trimIndent(), ExternalLabel("haiagaru_${label}_native_menu", dispatch.implementation!!.instructions.first()))
    if (legacy) {
        // The dialog posting toolbar can open the activity-owned overflow, not
        // the fragment-owned popup. Bind before its adapter snapshots the menu.
        val activityPopup = mutableClassDefBy("Lo/m6b;").methods.single {
            it.name == "a" && it.returnType == "V"
                && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/view/View;", "Landroidx/fragment/app/Fragment;")
        }
        val constructor = activityPopup.implementation!!.instructions.withIndex().single {
            val ref = (it.value as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Lo/m9;" && ref.name == "<init>"
                && ref.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;", "Landroid/view/Menu;")
        }
        val registers = constructor.value as FiveRegisterInstruction
        activityPopup.addInstructionsWithLabels(constructor.index,
            "invoke-static {v${registers.registerD}, v${registers.registerE}}, Lapp/morphe/extension/chmate/$extension;->addPostingMenu(Ljava/lang/Object;Landroid/view/Menu;)V")
        val activityClick = mutableClassDefBy("Lo/m6b\$4;").methods.single {
            it.name == "Xf_" && it.returnType == "Z"
                && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/view/MenuItem;")
        }
        check(activityClick.implementation!!.registerCount > 2)
        activityClick.addInstructionsWithLabels(0, """
            invoke-static/range {p1 .. p1}, Lapp/morphe/extension/chmate/$extension;->handlePostingActivityMenu(Landroid/view/MenuItem;)Z
            move-result v0
            if-eqz v0, :haiagaru_${label}_native_activity_menu
            return v0
        """.trimIndent(), ExternalLabel("haiagaru_${label}_native_activity_menu", activityClick.implementation!!.instructions.first()))
    }
}

/** Hook only the verified image HTTP invocation, not selection, preprocessing or other reflection. */
internal fun BytecodePatchContext.patchImgurWebSessionUpload(version: String) {
    val (owner, response, hook) = when (version) {
        "0.8.10.241" -> Triple("Lo/GNk35;", "Lo/defaultzzb;", "invoke241")
        "0.8.10.242 dev" -> Triple("Lo/ApiMetadataBuilder;", "Lo/zzbtj;", "invoke242")
        else -> return // 191 and 226 already have dedicated uploader wrappers.
    }
    var matches = 0
    mutableClassDefBy(owner).methods.forEach { method ->
        val instructions = method.implementation?.instructions?.toList() ?: return@forEach
        val indexes = instructions.indices.filter { index ->
            val ref = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Ljava/lang/reflect/Method;" && ref.name == "invoke"
                && instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
                && ((instructions.getOrNull(index + 2) as? ReferenceInstruction)?.reference as? TypeReference)?.type == response
        }
        indexes.reversed().forEach { index ->
            val target = "Lapp/morphe/extension/chmate/ImgurWebUpload;->$hook(" +
                "Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;"
            when (val call = instructions[index]) {
                is FiveRegisterInstruction -> method.replaceInstruction(index,
                    "invoke-static {v${call.registerC}, v${call.registerD}, v${call.registerE}}, $target")
                is RegisterRangeInstruction -> method.replaceInstruction(index,
                    "invoke-static/range {v${call.startRegister} .. v${call.startRegister + 2}}, $target")
                else -> error("$version Imgur uploader invocation registers changed")
            }
            matches++
        }
    }
    check(matches == 1) { "$version Imgur web upload hook expected 1 invocation, found $matches" }
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacyImageUploadCall() {
    val method = mutableClassDefBy("Lo/nq;").methods.single { method ->
        method.name == "e"
            && method.returnType == "Lo/r0ExternalSyntheticLambda13;"
            && method.parameters.isEmpty()
    }
    val instructions = method.implementation?.instructions?.toList()
        ?: error("ChMate legacy image upload method has no implementation")
    val invokeIndex = instructions.indices.single { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@single false
        reference.definingClass == "Ljava/lang/reflect/Method;"
            && reference.name == "invoke"
            && reference.returnType == "Ljava/lang/Object;"
            && instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
            && ((instructions.getOrNull(index + 2) as? ReferenceInstruction)?.reference
                as? TypeReference)?.type == "Lo/r0ExternalSyntheticLambda13;"
    }
    val argumentArrayRegister = when (val invocation = instructions[invokeIndex]) {
        is FiveRegisterInstruction -> invocation.registerE
        is RegisterRangeInstruction -> invocation.startRegister + 2
        else -> error("ChMate legacy image upload invocation arguments were not found")
    }
    method.replaceInstruction(
        invokeIndex,
        "invoke-static/range { v$argumentArrayRegister .. v$argumentArrayRegister }, " +
            "$EXTENSION->uploadLegacyImage([Ljava/lang/Object;)Ljava/lang/Object;"
    )
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchSetTextCalls() {
    classDefForEach { classDef ->
        // setText is only patched in ChMate's own obfuscated/application
        // classes. Walking every bundled AndroidX/ad-SDK class made 226/241/
        // 243 patching needlessly expensive and touched unrelated widgets.
        if (classDef.type.startsWith("Lapp/morphe/extension/chmate/")
            || (!classDef.type.startsWith("Ljp/syoboi/")
                && !classDef.type.startsWith("Lo/"))) {
            return@classDefForEach
        }

        val mutableClass by lazy { mutableClassDefBy(classDef) }
        classDef.methods.forEach { method ->
            val matches = method.implementation?.instructions
                ?.mapIndexedNotNull { index, instruction ->
                    val reference = (instruction as? ReferenceInstruction)
                        ?.reference as? MethodReference
                        ?: return@mapIndexedNotNull null
                    if (reference.name != "setText"
                        || reference.parameterTypes.firstOrNull() != "Ljava/lang/CharSequence;"
                    ) {
                        return@mapIndexedNotNull null
                    }

                    val argumentRegister = when (instruction) {
                        is FiveRegisterInstruction -> instruction.registerD
                        is RegisterRangeInstruction -> instruction.startRegister + 1
                        else -> return@mapIndexedNotNull null
                    }
                    index to argumentRegister
                }
                ?.toList()
                .orEmpty()

            if (matches.isEmpty()) return@forEach
            val mutableMethod = mutableClass.findMutableMethodOf(method)
            matches.asReversed().forEach { (index, register) ->
                mutableMethod.addInstructionsWithLabels(
                    index,
                    """
                        invoke-static/range { v$register .. v$register }, $EXTENSION->replace5chDomain(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
                        move-result-object v$register
                        invoke-static/range { v$register .. v$register }, $EXTENSION->processEmojiText(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
                        move-result-object v$register
                    """
                )
            }
        }
    }
}

/**
 * Older DAT rows contain sssp://img.5ch.net/premium/... while current rows
 * contain the same BE token on img.5ch.io. Normalize the stored response body
 * as it is constructed, before both the inline renderer and the copy-paste/NG
 * and attachment projections read it. The exact token keeps ordinary URLs intact.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacyBeResponseBody(
    responseModelClass: String,
    bodyField: String,
) {
    val responseClass = mutableClassDefBy(responseModelClass)
    var assignments = 0
    responseClass.methods.filter { it.name == "<init>" }.forEach { constructor ->
        val sites = constructor.implementation?.instructions
            ?.mapIndexedNotNull { index, instruction ->
                val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                    ?: return@mapIndexedNotNull null
                if (instruction.opcode != Opcode.IPUT_OBJECT
                    || field.definingClass != responseModelClass
                    || field.name != bodyField
                    || field.type != "Ljava/lang/String;"
                ) return@mapIndexedNotNull null
                index to (instruction as TwoRegisterInstruction).registerA
            }.orEmpty()
        sites.asReversed().forEach { (index, register) ->
            constructor.addInstructionsWithLabels(
                index,
                """
                    invoke-static/range { v$register .. v$register }, $EXTENSION->normalizeLegacyBeBody(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$register
                """,
            )
            assignments++
        }
    }
    check(assignments > 0) { "BE response body assignment missing: $responseModelClass" }
    if (responseModelClass == "Lo/KeJ11;") {
        // 242 inlines its URL getter in the thumbnail getter rather than exposing String[].
        val projection = responseClass.methods.single {
            it.returnType == "[Ljava/lang/CharSequence;" && it.parameters.isEmpty()
                && (it.accessFlags and 0x8) == 0
        }
        val call = projection.implementation!!.instructions.indexOfFirst { instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ref?.returnType == "[Ljava/lang/CharSequence;"
                && ref.parameterTypes.map(CharSequence::toString) == listOf("[Ljava/lang/String;")
        }
        check(call >= 0) { "242 Imgur thumbnail projection missing" }
        val urls = (projection.implementation!!.instructions[call] as FiveRegisterInstruction).registerC
        projection.addInstructionsWithLabels(call, """
            invoke-static {p0, v$urls}, Lapp/morphe/extension/chmate/ImgurAlbumAttachments;->complete(Ljava/lang/Object;[Ljava/lang/String;)[Ljava/lang/String;
            move-result-object v$urls
        """)
        // The 242 row renderer also inlines extraction, bypassing the model getter.
        classDefForEach { owner ->
            // The gallery has its own common-loop hook, including cache reuse.
            // Do not also expand its uncached extraction branch here.
            if (owner.type == "Lo/getWrappedCursor;") return@classDefForEach
            val candidates = owner.methods.filter { method ->
                method.implementation?.instructions?.any { instruction ->
                    val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                    instruction.opcode == Opcode.IPUT_OBJECT && field?.definingClass == responseModelClass
                        && field.name == "c" && field.type == "[Ljava/lang/String;"
                } == true
            }
            if (candidates.isEmpty() || owner.type == responseModelClass) return@classDefForEach
            val mutable = mutableClassDefBy(owner)
            candidates.forEach { original ->
                val method = mutable.methods.single { it.name == original.name && it.parameterTypes == original.parameterTypes && it.returnType == original.returnType }
                val sites = method.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
                    val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                    if (instruction.opcode == Opcode.IPUT_OBJECT && field?.definingClass == responseModelClass
                        && field.name == "c" && field.type == "[Ljava/lang/String;") index else null
                }
                sites.asReversed().forEach { index ->
                    val write = method.implementation!!.instructions[index] as TwoRegisterInstruction
                    method.addInstructionsWithLabels(index + 1, """
                        invoke-static {v${write.registerB}, v${write.registerA}}, Lapp/morphe/extension/chmate/ImgurAlbumAttachments;->complete(Ljava/lang/Object;[Ljava/lang/String;)[Ljava/lang/String;
                        move-result-object v${write.registerA}
                    """)
                }
            }
        }
        return
    }
    if (responseModelClass != "Lo/zzabv;") {
        val getter = responseClass.methods.single {
            it.returnType == "[Ljava/lang/String;" && it.parameters.isEmpty()
                && (it.accessFlags and 0x8) == 0
        }
        val returns = getter.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
            if (instruction.opcode == Opcode.RETURN_OBJECT) index else null
        }
        returns.asReversed().forEach { index ->
            val result = (getter.implementation!!.instructions[index] as OneRegisterInstruction).registerA
            val receiver = getter.implementation!!.registerCount - 1
            check(result < 16 && receiver < 16 && result != receiver) { "Imgur attachment hook requires low receiver and result registers" }
            getter.addInstructionsWithLabels(index, """
                invoke-static {p0, v$result}, Lapp/morphe/extension/chmate/ImgurAlbumAttachments;->complete(Ljava/lang/Object;[Ljava/lang/String;)[Ljava/lang/String;
                move-result-object v$result
            """)
        }
    }
}

/**
 * Filters BE icon tokens from the response model's attachment projections while
 * retaining the target generation's native inline icon renderer. The class is
 * selected by the same field and method shapes used by the 191 response model.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchBeAttachmentCompatibility(
    responseModelClass: String,
) {
    val responseClass = mutableClassDefBy(responseModelClass)

    responseClass.methods.single { method ->
        method.returnType == "Ljava/lang/String;"
            && method.parameters.map(CharSequence::toString) ==
            listOf("Ljava/lang/String;", "Z", "Z")
    }.addInstructionsWithLabels(
        0,
        """
            invoke-static { p0, p1, p2 }, $EXTENSION->filterBeIconText(Ljava/lang/String;ZZ)Ljava/lang/String;
            move-result-object p0
        """,
    )

    val instanceExtractor = responseClass.methods.single { method ->
        method.returnType == "[Ljava/lang/String;"
            && method.parameters.isEmpty()
    }
    instanceExtractor.filterBeAttachmentArrayReturns()

    val staticExtractor = responseClass.methods.single { method ->
        method.returnType == "[Ljava/lang/String;"
            && method.parameters.map(CharSequence::toString) ==
            listOf("Ljava/lang/String;", "Z")
    }
    staticExtractor.addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p0 .. p0 }, $EXTENSION->stripLegacyBeAttachmentTokens(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p0
        """,
    )
    staticExtractor.filterBeAttachmentArrayReturns()

    responseClass.methods.single { method ->
        method.returnType == "[Ljava/lang/CharSequence;"
            && method.parameters.map(CharSequence::toString) == listOf("[Ljava/lang/String;")
    }.addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p0 .. p0 }, $EXTENSION->filterLegacyBeAttachments([Ljava/lang/String;)[Ljava/lang/String;
            move-result-object p0
        """,
    )
}

private fun MutableMethod.filterBeAttachmentArrayReturns() {
    val returnIndexes = implementation?.instructions
        ?.mapIndexedNotNull { index, instruction ->
            if (instruction.opcode == Opcode.RETURN_OBJECT) index else null
        }
        .orEmpty()
    returnIndexes.asReversed().forEach { index ->
        val returnRegister = (implementation!!.instructions[index] as OneRegisterInstruction).registerA
        addInstructionsWithLabels(
            index,
            """
                invoke-static/range { v$returnRegister .. v$returnRegister }, $EXTENSION->filterLegacyBeAttachments([Ljava/lang/String;)[Ljava/lang/String;
                move-result-object v$returnRegister
            """,
        )
    }
}

/** Keep a legacy BE image span on the DAT-token line, not across the next newline. */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacyBeSpanBoundary(
    bufferClass: String,
) {
    val spanBuilder = mutableClassDefBy(bufferClass).methods.single { method ->
        method.returnType == "Landroid/text/SpannableString;"
            && method.parameters.isEmpty()
    }
    val spanSite = spanBuilder.implementation?.instructions
        ?.mapIndexedNotNull { index, instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
                as? MethodReference ?: return@mapIndexedNotNull null
            if (reference.definingClass == "Landroid/text/SpannableString;"
                && reference.name == "setSpan"
                && reference.parameterTypes.map(CharSequence::toString) ==
                listOf("Ljava/lang/Object;", "I", "I", "I")
            ) index to (instruction as FiveRegisterInstruction) else null
        }?.singleOrNull() ?: error("BE span builder was not found: $bufferClass")
    val (index, invocation) = spanSite
    spanBuilder.addInstructionsWithLabels(
        index,
        """
            invoke-static { v${invocation.registerC}, v${invocation.registerD}, v${invocation.registerE}, v${invocation.registerF} }, $EXTENSION->correctLegacyBeSpanEnd(Ljava/lang/CharSequence;Ljava/lang/Object;II)I
            move-result v${invocation.registerF}
        """,
    )
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchPreIoBeRendering(
    parserClass: String,
    drawableClass: String,
) {
    val parserMethod = mutableClassDefBy(parserClass).methods.single { method ->
        method.returnType == "V"
            && method.parameters.size == 5
            && method.parameters[2].toString() == "Ljava/lang/String;"
            && method.parameters[4].toString() == "Z"
    }
    parserMethod.addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p1 .. p2 }, $EXTENSION->prepareLegacyBeParsing(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
            move-result-object p2
        """,
    )

    val linkParserType = parserMethod.parameters[0].toString()
    val linkInfoField = mutableClassDefBy(linkParserType).fields.single { field ->
        field.type == "[I"
    }.name
    val parserInstructions = parserMethod.implementation?.instructions
        ?: error("ChMate pre-io text parser has no implementation")
    val scanIndex = parserInstructions.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@mapIndexedNotNull null
        if (reference.definingClass == linkParserType
            && reference.returnType == "Z"
            && reference.parameterTypes.isEmpty()
        ) index else null
    }.single()
    (parserInstructions.getOrNull(scanIndex + 1)
        ?.takeIf { it.opcode == Opcode.MOVE_RESULT }
        as? OneRegisterInstruction)?.registerA
        ?: error("ChMate pre-io text parser result was not found")
    val linkInfoIndex = parserInstructions.mapIndexedNotNull { index, instruction ->
        if (index <= scanIndex) return@mapIndexedNotNull null
        val reference = (instruction as? ReferenceInstruction)?.reference
            as? FieldReference ?: return@mapIndexedNotNull null
        if (reference.definingClass == linkParserType
            && reference.name == linkInfoField
            && reference.type == "[I"
        ) index else null
    }.first()
    val linkInfoRegister = (parserInstructions[linkInfoIndex] as TwoRegisterInstruction).registerA
    val textRegister = linkInfoRegister + 1
    val resultRegister = linkInfoRegister + 2
    parserMethod.addInstructionsWithLabels(
        linkInfoIndex + 1,
        """
            move-object/from16 v$textRegister, p2
            const/4 v$resultRegister, 0x1
            invoke-static { v$textRegister, v$linkInfoRegister, v$resultRegister }, $EXTENSION->classifyLegacyBeIcon(Ljava/lang/String;[IZ)Z
            move-result v$resultRegister
        """,
    )

    mutableClassDefBy(drawableClass).methods.single { method ->
        method.name == "<init>"
            && method.returnType == "V"
            && method.parameters.map(CharSequence::toString) ==
            listOf("Landroid/content/Context;", "Ljava/lang/String;")
    }.addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p2 .. p2 }, $EXTENSION->normalizeBeIconUrl(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p2
        """,
    )
}

/**
 * Ports the 191 URL-range repair to the corresponding pre-io text renderer.
 * Both renderers can remove display characters before link spans are attached,
 * so the native parser's original offsets may leave the first character plain
 * or discard a URL at the end of a response.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchPreIoUrlSpanAlignment(
    parserClass: String,
) {
    val parserMethod = mutableClassDefBy(parserClass).methods.single { method ->
        method.returnType == "V"
            && method.parameters.size == 5
            && method.parameters[2].toString() == "Ljava/lang/String;"
            && method.parameters[4].toString() == "Z"
    }
    val builderType = parserMethod.parameters[1].toString()
    val builderTextField = mutableClassDefBy(builderType).fields.single { field ->
        field.type == "Ljava/lang/StringBuilder;"
    }.name
    val linkSpanType = parserClass.removeSuffix(";") + "\$read;"
    val linkUrlGetter = mutableClassDefBy(linkSpanType).methods.single { method ->
        method.returnType == "Ljava/lang/String;" && method.parameters.isEmpty()
    }.name

    data class LinkSpanInsertion(
        val index: Int,
        val builderRegister: Int,
        val spanRegister: Int,
        val startRegister: Int,
        val endRegister: Int,
    )

    val instructions = parserMethod.implementation?.instructions
        ?: error("ChMate pre-io text parser has no implementation")
    val insertions = instructions.mapIndexedNotNull { index, instruction ->
        val invocation = instruction as? FiveRegisterInstruction
            ?: return@mapIndexedNotNull null
        val reference = (instruction as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@mapIndexedNotNull null
        if (reference.definingClass != builderType
            || reference.returnType != builderType
            || reference.parameterTypes.map(CharSequence::toString) !=
            listOf("Ljava/lang/Object;", "I", "I")
        ) return@mapIndexedNotNull null

        val spanRegister = invocation.registerD
        val constructsLinkSpan = instructions
            .subList(maxOf(0, index - 40), index)
            .any { preceding ->
                val precedingInvocation = preceding as? FiveRegisterInstruction
                    ?: return@any false
                val precedingReference = (preceding as? ReferenceInstruction)?.reference
                    as? MethodReference ?: return@any false
                preceding.opcode == Opcode.INVOKE_DIRECT
                    && precedingInvocation.registerC == spanRegister
                    && precedingReference.definingClass == linkSpanType
                    && precedingReference.name == "<init>"
            }
        if (!constructsLinkSpan) return@mapIndexedNotNull null

        LinkSpanInsertion(
            index = index,
            builderRegister = invocation.registerC,
            spanRegister = spanRegister,
            startRegister = invocation.registerE,
            endRegister = invocation.registerF,
        )
    }
    check(insertions.isNotEmpty()) {
        "ChMate pre-io URL span insertion sites were not found"
    }

    insertions.asReversed().forEach { insertion ->
        parserMethod.addInstructionsWithLabels(
            insertion.index,
            """
                iget-object v12, v${insertion.builderRegister}, $builderType->$builderTextField:Ljava/lang/StringBuilder;
                invoke-virtual { v${insertion.spanRegister} }, $linkSpanType->$linkUrlGetter()Ljava/lang/String;
                move-result-object v13
                invoke-static { v12, v${insertion.spanRegister}, v13, v${insertion.startRegister}, v${insertion.endRegister} }, $EXTENSION->alignLegacyLinkRange(Ljava/lang/CharSequence;Ljava/lang/Object;Ljava/lang/String;II)J
                move-result-wide v14
                long-to-int v${insertion.startRegister}, v14
                const/16 v13, 0x20
                ushr-long v14, v14, v13
                long-to-int v${insertion.endRegister}, v14
            """,
        )
    }
}

/**
 * Rewrite the board-menu endpoint at the point where ChMate starts its menu
 * download.  The URL is persisted in ChMate preferences, so replacing only
 * string constants does not repair installations that still store
 * menu.5ch.net.  The method signatures differ across the supported builds;
 * callers provide the stable return type for the corresponding worker.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchBbsMenuUrl(
    methodName: String,
    returnType: String,
) {
    val worker = mutableClassDefBy("Ljp/syoboi/a2chMate/bbs/BBSMenuUpdateWork;")
    val fetch = worker.methods.singleOrNull { method ->
        method.name == methodName
            && method.returnType == returnType
            && method.parameters.map(CharSequence::toString) == listOf("Ljava/lang/String;")
    } ?: error("ChMate BBS menu download method was not found: $methodName $returnType")
    fetch.addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p1 .. p1 }, $EXTENSION->rewriteBbsMenuUrl(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p1
        """,
    )

    // ChMate leaves URL 1 empty on a fresh install. The worker above can only
    // migrate a URL that already exists, so give its first menu preference a
    // default without changing any explicitly saved user value.
    val menuDefaults = mutableListOf<Pair<MutableMethod, Int>>()
    classDefForEach { classDef ->
        if (!classDef.type.startsWith("Ljp/syoboi/") && !classDef.type.startsWith("Lo/")) {
            return@classDefForEach
        }
        classDef.methods.filter { it.name == "<clinit>" }.forEach { method ->
            val index = method.implementation?.instructions?.indexOfFirst { instruction ->
                ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string ==
                    "bbsMenuUrl"
            } ?: -1
            if (index >= 0) {
                menuDefaults += mutableClassDefBy(classDef).findMutableMethodOf(method) to index
            }
        }
    }
    check(menuDefaults.size <= 1) { "ChMate has multiple first BBS menu preferences" }
    if (menuDefaults.isEmpty()) return
    val (initializer, menuKeyIndex) = menuDefaults.single()
    val instructions = initializer.implementation!!.instructions
    val constructorIndex = (menuKeyIndex + 1 until minOf(menuKeyIndex + 5, instructions.size))
        .firstOrNull { index ->
            val instruction = instructions[index]
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            instruction.opcode == Opcode.INVOKE_DIRECT
                && instruction is FiveRegisterInstruction
                && instruction.registerCount == 3
                && reference?.name == "<init>"
                && reference.parameterTypes.map(CharSequence::toString) ==
                    listOf("Ljava/lang/String;", "Ljava/lang/String;")
        } ?: error("ChMate's first BBS menu default constructor was not found")
    val defaultRegister = (instructions[constructorIndex] as FiveRegisterInstruction).registerE
    initializer.addInstructionsWithLabels(
        constructorIndex + 1,
        "const-string v$defaultRegister, \"\"",
    )
    initializer.addInstructionsWithLabels(
        constructorIndex,
        "const-string v$defaultRegister, \"https://menu.5ch.io/bbsmenu.html\"",
    )
}

/**
 * Ports the URL-model and fixed endpoint handling used by the legacy 191 route
 * to later pre-5ch.io builds whose parser implementation has different names.
 * BE rendering and image upload stay on the target's own newer implementations.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchPreIoDomainCompatibility(
    parseMethodName: String,
) {
    val urlInfoClass = mutableClassDefBy("Ljp/syoboi/a2chMate/client/BBSUrlInfo;")

    urlInfoClass.methods.single { method ->
        method.name == parseMethodName
            && method.returnType == "Ljp/syoboi/a2chMate/client/BBSUrlInfo;"
            && method.parameters.map(CharSequence::toString) == listOf("Ljava/lang/String;")
    }.addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p0 .. p0 }, $EXTENSION->rewrite5chUrl(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p0
        """
    )

    urlInfoClass.methods.filter { it.returnType == "Ljava/lang/String;" }.forEach { method ->
        val returnIndexes = method.implementation?.instructions
            ?.mapIndexedNotNull { index, instruction ->
                if (instruction.opcode == Opcode.RETURN_OBJECT) index else null
            }
            .orEmpty()
        returnIndexes.asReversed().forEach { index ->
            val register = (method.implementation!!.instructions[index] as OneRegisterInstruction)
                .registerA
            method.addInstructionsWithLabels(
                index,
                """
                    invoke-static/range { v$register .. v$register }, $EXTENSION->rewrite5chUrl(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$register
                """,
            )
        }
    }

    // Update constants used outside BBSUrlInfo as well: board menus, search,
    // posting, cookies, UPLIFT/BE, and auxiliary 5ch endpoints.
    classDefForEach { classDef ->
        if (!classDef.type.startsWith("Ljp/syoboi/") && !classDef.type.startsWith("Lo/")) {
            return@classDefForEach
        }
        val mutableClass by lazy { mutableClassDefBy(classDef) }
        classDef.methods.forEach { method ->
            val replacements = method.implementation?.instructions
                ?.mapIndexedNotNull { index, instruction ->
                    val string = ((instruction as? ReferenceInstruction)?.reference
                        as? StringReference)?.string ?: return@mapIndexedNotNull null
                    if (string.any { it.code !in 0x20..0x7e }) {
                        return@mapIndexedNotNull null
                    }
                    val rewritten = string
                        .replace("[25]ch\\.net", "(?:2ch\\.net|5ch\\.io)")
                        .replace("5ch\\.net", "5ch\\.io")
                        .replace("5ch.net", "5ch.io")
                    if (rewritten == string) null else Triple(index, instruction, rewritten)
                }
                ?.toList()
                .orEmpty()
            if (replacements.isEmpty()) return@forEach

            val mutableMethod = mutableClass.findMutableMethodOf(method)
            replacements.asReversed().forEach { (index, instruction, rewritten) ->
                val register = (instruction as OneRegisterInstruction).registerA
                val escaped = rewritten
                    .replace("\\", "\\\\")
                    .replace("\"", "\\\"")
                mutableMethod.replaceInstruction(index, "const-string v$register, \"$escaped\"")
            }
        }
    }
}

/**
 * Restores the current 5ch.io transport contract in the last pre-io ChMate build.
 * The legacy URL model and posting engine are retained; only their domain, clock,
 * and confirmation semantics are adapted.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacy5chIoCompatibility() {
    // The 191 Talk menu adapter converts classic.talk-platform.com entries to
    // talk.jp/boards/<board>. Keep that form: the legacy BBSUrlInfo parser
    // recognizes /boards/<board> as Talk type 4, while talk.jp/<board> returns
    // null and causes BBSMenuUpdateWork to reject an otherwise valid menu as
    // containing zero boards. Validate the structural site so a future target
    // change fails during patching instead of silently disabling Talk menus.
    val talkMenuAdapter = mutableClassDefBy("Lo/setRequestLatencyMillis;")
    val talkBoardPrefixSites = talkMenuAdapter.methods.flatMap { method ->
        method.implementation?.instructions.orEmpty().mapIndexedNotNull { index, instruction ->
            val value = ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
            val register = (instruction as? OneRegisterInstruction)?.registerA
            if (value == "https://talk.jp/boards/" && register != null) {
                Triple(method, index, register)
            } else {
                null
            }
        }
    }
    check(talkBoardPrefixSites.size == 1) {
        "ChMate 191 Talk board URL prefix site was not uniquely identified"
    }
    talkBoardPrefixSites.single()

    val urlInfoClass = mutableClassDefBy("Ljp/syoboi/a2chMate/client/BBSUrlInfo;")
    val legacyLinkParserType =
        "Ljp/syoboi/utils/NativeUtils\$RemoteActionCompatParcelizer;"

    // The first boolean is ChMate's derived hideBeIcon flag (!showBeIcon).
    // Filter only the transient display copy when that flag is true. This
    // covers .io URLs that bypass the native parser's BE span classification.
    mutableClassDefBy("Lo/processAdDisplayErrorPostbackForUserError;").methods.single { method ->
        method.name == "c"
            && method.returnType == "Ljava/lang/String;"
            && method.parameters.map(CharSequence::toString) ==
            listOf("Ljava/lang/String;", "Z", "Z")
    }.addInstructionsWithLabels(
        0,
        """
            invoke-static { p0, p1, p2 }, $EXTENSION->filterBeIconText(Ljava/lang/String;ZZ)Ljava/lang/String;
            move-result-object p0
        """
    )

    // The 191 native text parser predates img.5ch.io. Feed only sssp BE tokens
    // through its known host form so it selects the emoticon-span branch. The
    // drawable constructor below changes the extracted fetch URL back to .io.
    val legacyTextParserMethod = mutableClassDefBy("Lo/ocd;").methods.single { method ->
        method.name == "e"
            && method.returnType == "V"
            && method.parameters.map(CharSequence::toString) == listOf(
                legacyLinkParserType,
                "Lo/o8;",
                "Ljava/lang/String;",
                "Lo/r8lambda0m18vyepBPbBImKp0mAya80YXc8;",
                "Z"
            )
    }
    legacyTextParserMethod.addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p1 .. p2 }, $EXTENSION->prepareLegacyBeParsing(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
            move-result-object p2
        """
    )

    // Some current responses expose the BE image as a regular or protocol-relative
    // URL. Correct the native parser's result buffer directly so the existing 191
    // emoticon branch is selected regardless of the input URL spelling.
    val legacyTextParserInstructions = legacyTextParserMethod.implementation?.instructions
        ?: error("ChMate legacy text parser has no implementation")
    val linkScanIndex = legacyTextParserInstructions.mapIndexedNotNull { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference
            as? MethodReference ?: return@mapIndexedNotNull null
        if (reference.definingClass == legacyLinkParserType
            && reference.name == "a"
            && reference.returnType == "Z"
            && reference.parameterTypes.isEmpty()
        ) index else null
    }.single()
    val linkFoundRegister = (legacyTextParserInstructions.getOrNull(linkScanIndex + 1)
        ?.takeIf { it.opcode == Opcode.MOVE_RESULT }
        as? OneRegisterInstruction)?.registerA
        ?: error("ChMate legacy link parser result was not found")
    legacyTextParserMethod.addInstructionsWithLabels(
        linkScanIndex + 2,
        """
            move-object/from16 v6, p2
            move-object/from16 v7, p0
            iget-object v7, v7, $legacyLinkParserType->e:[I
            invoke-static { v6, v7, v$linkFoundRegister }, $EXTENSION->classifyLegacyBeIcon(Ljava/lang/String;[IZ)Z
            move-result v$linkFoundRegister
        """
    )

    // When the optional 5ch thread-date display is enabled, ChMate replaces
    // the matched URL with "board/date" before creating the link span. A BE
    // icon earlier in the response can shift the native parser's coordinates
    // by one character. Fix the deletion position while the original URL is
    // still present; correcting only the later span leaves its first "h" in
    // the displayed text ("hニュー速(嫌儲)/2026-...").
    val legacyDateReplacementIndex = legacyTextParserMethod.implementation!!.instructions
        .mapIndexedNotNull { index, instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
                as? MethodReference ?: return@mapIndexedNotNull null
            if (reference.definingClass == "Ljava/lang/StringBuilder;"
                && reference.name == "delete"
                && reference.parameterTypes.map(CharSequence::toString) == listOf("I", "I")
                && reference.returnType == "Ljava/lang/StringBuilder;"
            ) index else null
        }.singleOrNull() ?: error("ChMate 191 thread-date URL replacement was not found")
    legacyTextParserMethod.addInstructionsWithLabels(
        legacyDateReplacementIndex,
        """
            move v13, v8
            invoke-static { v12, v5, v8, v11 }, $EXTENSION->alignLegacyLinkRange(Ljava/lang/CharSequence;Ljava/lang/String;II)J
            move-result-wide v14
            long-to-int v8, v14
            sub-int v13, v8, v13
            add-int/2addr v11, v13
            add-int/2addr v4, v13
        """
    )

    // The 191 renderer may remove one display character before this parser runs.
    // Realign custom URL spans against the actual StringBuilder content. Without
    // this, the leading "h" stays plain and a URL at end-of-text is discarded by
    // o8.Vq_() because its end offset exceeds the SpannableString length.
    val legacyLinkSpanType = "Lo/ocd\$setContentView;"
    data class LinkSpanInsertion(
        val index: Int,
        val builderRegister: Int,
        val spanRegister: Int,
        val startRegister: Int,
        val endRegister: Int
    )
    val linkSpanInsertions = legacyTextParserMethod.implementation!!.instructions
        .mapIndexedNotNull { index, instruction ->
            val invocation = instruction as? FiveRegisterInstruction
                ?: return@mapIndexedNotNull null
            val reference = (instruction as? ReferenceInstruction)?.reference
                as? MethodReference ?: return@mapIndexedNotNull null
            if (reference.definingClass != "Lo/o8;"
                || reference.name != "c"
                || reference.returnType != "Lo/o8;"
                || reference.parameterTypes.map(CharSequence::toString) !=
                listOf("Ljava/lang/Object;", "I", "I")
            ) return@mapIndexedNotNull null

            val spanRegister = invocation.registerD
            val constructsLinkSpan = legacyTextParserMethod.implementation!!.instructions
                .subList(maxOf(0, index - 40), index)
                .any { preceding ->
                    val precedingInvocation = preceding as? FiveRegisterInstruction
                        ?: return@any false
                    val precedingReference = (preceding as? ReferenceInstruction)?.reference
                        as? MethodReference ?: return@any false
                    preceding.opcode == Opcode.INVOKE_DIRECT
                        && precedingInvocation.registerC == spanRegister
                        && precedingReference.definingClass == legacyLinkSpanType
                        && precedingReference.name == "<init>"
                }
            if (!constructsLinkSpan) return@mapIndexedNotNull null

            LinkSpanInsertion(
                index = index,
                builderRegister = invocation.registerC,
                spanRegister = spanRegister,
                startRegister = invocation.registerE,
                endRegister = invocation.registerF
            )
        }

    check(linkSpanInsertions.isNotEmpty()) {
        "ChMate 191 URL span insertion sites were not found"
    }
    linkSpanInsertions.asReversed().forEach { insertion ->
        legacyTextParserMethod.addInstructionsWithLabels(
            insertion.index,
            """
                iget-object v12, v${insertion.builderRegister}, Lo/o8;->e:Ljava/lang/StringBuilder;
                invoke-virtual { v${insertion.spanRegister} }, $legacyLinkSpanType->c()Ljava/lang/String;
                move-result-object v13
                invoke-static { v12, v${insertion.spanRegister}, v13, v${insertion.startRegister}, v${insertion.endRegister} }, $EXTENSION->alignLegacyLinkRange(Ljava/lang/CharSequence;Ljava/lang/Object;Ljava/lang/String;II)J
                move-result-wide v14
                long-to-int v${insertion.startRegister}, v14
                const/16 v13, 0x20
                ushr-long v14, v14, v13
                long-to-int v${insertion.endRegister}, v14
            """
        )
    }

    // The response model scans the raw body again when it builds the attachment
    // list. Remove BE tokens only from this private copy. The original response
    // remains untouched for the inline emoticon renderer above.
    val legacyAttachmentMethod =
        mutableClassDefBy("Lo/processAdDisplayErrorPostbackForUserError;").methods.single { method ->
            method.name == "d"
                && method.returnType == "[Ljava/lang/String;"
                && method.parameters.isEmpty()
        }
    val legacyAttachmentInstructions = legacyAttachmentMethod.implementation?.instructions
        ?: error("ChMate legacy attachment extractor has no implementation")
    val parserTextAssignmentIndex = legacyAttachmentInstructions.indices.single { index ->
        val instruction = legacyAttachmentInstructions[index]
        val reference = (instruction as? ReferenceInstruction)?.reference
            as? FieldReference ?: return@single false
        instruction.opcode == Opcode.IPUT_OBJECT
            && reference.definingClass == legacyLinkParserType
            && reference.name == "d"
            && reference.type == "Ljava/lang/String;"
    }
    val attachmentTextRegister =
        (legacyAttachmentInstructions[parserTextAssignmentIndex] as TwoRegisterInstruction).registerA
    legacyAttachmentMethod.addInstructionsWithLabels(
        parserTextAssignmentIndex,
        """
            invoke-static/range { v$attachmentTextRegister .. v$attachmentTextRegister }, $EXTENSION->stripLegacyBeAttachmentTokens(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v$attachmentTextRegister
        """
    )

    // The old native parser can still report current plain/protocol-relative
    // img.5ch.io icon URLs as ordinary images. Filter the extractor's final
    // result as the authoritative guard so those URLs never reach thumbnails.
    val attachmentReturnIndexes = legacyAttachmentMethod.implementation?.instructions
        ?.mapIndexedNotNull { index, instruction ->
            if (instruction.opcode == Opcode.RETURN_OBJECT) index else null
        }
        .orEmpty()
    attachmentReturnIndexes.asReversed().forEach { index ->
        val returnRegister =
            (legacyAttachmentMethod.implementation!!.instructions[index] as OneRegisterInstruction)
                .registerA
        legacyAttachmentMethod.addInstructionsWithLabels(
            index,
            """
                invoke-static/range { v$returnRegister .. v$returnRegister }, $EXTENSION->filterLegacyBeAttachments([Ljava/lang/String;)[Ljava/lang/String;
                move-result-object v$returnRegister
            """
        )
    }

    // ChMate 191 also has a static extractor used by the thread-wide image
    // collector. It bypasses the per-response d() method above, so filter its
    // final URL array as well.
    val legacyStaticAttachmentMethod =
        mutableClassDefBy("Lo/processAdDisplayErrorPostbackForUserError;").methods.single { method ->
            method.name == "e"
                && method.returnType == "[Ljava/lang/String;"
                && method.parameters.map(CharSequence::toString) ==
                listOf("Ljava/lang/String;", "Z")
        }
    legacyStaticAttachmentMethod.addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p0 .. p0 }, $EXTENSION->stripLegacyBeAttachmentTokens(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p0
        """
    )
    val staticAttachmentReturnIndexes = legacyStaticAttachmentMethod.implementation?.instructions
        ?.mapIndexedNotNull { index, instruction ->
            if (instruction.opcode == Opcode.RETURN_OBJECT) index else null
        }
        .orEmpty()
    staticAttachmentReturnIndexes.asReversed().forEach { index ->
        val returnRegister =
            (legacyStaticAttachmentMethod.implementation!!.instructions[index] as OneRegisterInstruction)
                .registerA
        legacyStaticAttachmentMethod.addInstructionsWithLabels(
            index,
            """
                invoke-static/range { v$returnRegister .. v$returnRegister }, $EXTENSION->filterLegacyBeAttachments([Ljava/lang/String;)[Ljava/lang/String;
                move-result-object v$returnRegister
            """
        )
    }

    // Finally guard the String[] -> display-item conversion. This covers cached
    // arrays and any other caller that populated the attachment list before the
    // two extractors above were reached.
    val legacyAttachmentDisplayMethod =
        mutableClassDefBy("Lo/processAdDisplayErrorPostbackForUserError;").methods.single { method ->
            method.name == "c"
                && method.returnType == "[Ljava/lang/CharSequence;"
                && method.parameters.map(CharSequence::toString) ==
                listOf("[Ljava/lang/String;")
        }
    legacyAttachmentDisplayMethod.addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p0 .. p0 }, $EXTENSION->filterLegacyBeAttachments([Ljava/lang/String;)[Ljava/lang/String;
            move-result-object p0
        """
    )

    // Current ChMate normalizes legacy BE icon hosts before its dedicated
    // DynamicDrawableSpan fetches them. Port that narrow behavior to 191.
    mutableClassDefBy("Lo/oa;").methods.single { method ->
        method.name == "<init>"
            && method.returnType == "V"
            && method.parameters.map(CharSequence::toString) ==
            listOf("Landroid/content/Context;", "Ljava/lang/String;")
    }.addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p2 .. p2 }, $EXTENSION->normalizeBeIconUrl(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p2
        """
    )

    urlInfoClass.methods.single { method ->
        method.name == "b"
            && method.returnType == "Ljp/syoboi/a2chMate/client/BBSUrlInfo;"
            && method.parameters.map(CharSequence::toString) == listOf("Ljava/lang/String;")
    }.addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p0 .. p0 }, $EXTENSION->rewrite5chUrl(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p0
        """
    )

    urlInfoClass.methods.single { method ->
        method.name == "e"
            && method.returnType == "I"
            && method.parameters.map(CharSequence::toString) == listOf("Ljava/lang/String;")
    }.let { classifyHostMethod ->
        val firstInstruction = classifyHostMethod.implementation?.instructions?.firstOrNull()
            ?: error("ChMate legacy host classifier has no implementation")
        classifyHostMethod.addInstructionsWithLabels(
            0,
            """
                invoke-static/range { p0 .. p0 }, $EXTENSION->is5chHost(Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :haiagaru_original_host_classifier
                const/4 v0, 0x1
                return v0
            """,
            ExternalLabel("haiagaru_original_host_classifier", firstInstruction)
        )
    }

    // Rewrite every URL-like String emitted by the URL model. Non-5ch values are
    // returned unchanged, so board types and other BBS implementations stay intact.
    urlInfoClass.methods.filter { it.returnType == "Ljava/lang/String;" }.forEach { method ->
        val returnIndexes = method.implementation?.instructions
            ?.mapIndexedNotNull { index, instruction ->
                if (instruction.opcode == Opcode.RETURN_OBJECT) index else null
            }
            .orEmpty()
        returnIndexes.asReversed().forEach { index ->
            val register = (method.implementation!!.instructions[index] as OneRegisterInstruction)
                .registerA
            method.addInstructionsWithLabels(
                index,
                """
                    invoke-static/range { v$register .. v$register }, $EXTENSION->rewrite5chUrl(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$register
                """
            )
        }
    }

    // Enable multiline form values when the shared parser is initialized, not
    // only after Talk has been used. Otherwise a 5ch cookie confirmation loses
    // MESSAGE and is shown as a posting error before cookies can be established.
    val parserInit = mutableClassDefBy("Lo/getCredentials;").methods.single { it.name == "<clinit>" }
    val parserCompiles = parserInit.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        if (ref?.definingClass == "Ljava/util/regex/Pattern;" && ref.name == "compile" &&
            ref.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;")) index else null
    }
    check(parserCompiles.size == 2) { "191 shared confirmation parser patterns changed" }
    parserCompiles.asReversed().forEach { index ->
        val register = (parserInit.implementation!!.instructions[index] as FiveRegisterInstruction).registerC
        parserInit.replaceInstruction(index,
            "invoke-static/range {v$register .. v$register}, Lapp/morphe/extension/chmate/LegacyPostFormPatterns;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;")
    }

    val confirmationDetector = mutableClassDefBy("Lo/getJsonData;").methods.single { method ->
        method.name == "a"
            && method.returnType == "Z"
            && method.parameters.map(CharSequence::toString) == listOf("Ljava/lang/String;")
    }
    val detectorStart = confirmationDetector.implementation?.instructions?.firstOrNull()
        ?: error("ChMate legacy confirmation detector has no implementation")
    confirmationDetector.addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p0 .. p0 }, $EXTENSION->isCurrentPostConfirmation(Ljava/lang/String;)Z
            move-result v0
            if-eqz v0, :haiagaru_original_confirmation_detector
            const/4 v0, 0x1
            return v0
        """,
        ExternalLabel("haiagaru_original_confirmation_detector", detectorStart)
    )

    // Update fixed service hosts and domain filters used by menus, search-result
    // acceptance, cookies, and auxiliary 5ch endpoints.
    classDefForEach { classDef ->
        if (!classDef.type.startsWith("Ljp/syoboi/") && !classDef.type.startsWith("Lo/")) {
            return@classDefForEach
        }
        val mutableClass by lazy { mutableClassDefBy(classDef) }
        classDef.methods.forEach { method ->
            val replacements = method.implementation?.instructions
                ?.mapIndexedNotNull { index, instruction ->
                    val string = ((instruction as? ReferenceInstruction)?.reference
                        as? StringReference)?.string ?: return@mapIndexedNotNull null
                    if (string.any { it.code !in 0x20..0x7e }) {
                        return@mapIndexedNotNull null
                    }
                    val rewritten = string
                        .replace("[25]ch\\.net", "(?:2ch\\.net|5ch\\.io)")
                        .replace("5ch\\.net", "5ch\\.io")
                        .replace("5ch.net", "5ch.io")
                    if (rewritten == string) null else Triple(index, instruction, rewritten)
                }
                ?.toList()
                .orEmpty()
            if (replacements.isEmpty()) return@forEach

            val mutableMethod = mutableClass.findMutableMethodOf(method)
            replacements.asReversed().forEach { (index, instruction, rewritten) ->
                val register = (instruction as OneRegisterInstruction).registerA
                val escaped = rewritten
                    .replace("\\", "\\\\")
                    .replace("\"", "\\\"")
                mutableMethod.replaceInstruction(index, "const-string v$register, \"$escaped\"")
            }
        }
    }

    val networkClass = mutableClassDefBy("Lo/getLabel;")
    networkClass.methods.forEach { method ->
        val instructions = method.implementation?.instructions ?: return@forEach

        val oldClockIndexes = instructions.mapIndexedNotNull { index, instruction ->
            if ((instruction as? WideLiteralInstruction)?.wideLiteral == 900L) index else null
        }
        oldClockIndexes.asReversed().forEach { index ->
            val register = (instructions[index] as OneRegisterInstruction).registerA
            method.replaceInstruction(index, "const-wide/16 v$register, 0x3c")
        }

        val confirmationHeaderIndexes = instructions.mapIndexedNotNull { index, instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ?: return@mapIndexedNotNull null
            if (reference.definingClass != "Lokhttp3/Headers;"
                || reference.name != "get"
                || reference.returnType != "Ljava/lang/String;"
            ) {
                return@mapIndexedNotNull null
            }
            val hasConfirmationHeader = instructions.subList(maxOf(0, index - 8), index)
                .any { previous ->
                    ((previous as? ReferenceInstruction)?.reference as? StringReference)?.string ==
                        "X-Chx-Error"
                }
            if (hasConfirmationHeader) index else null
        }

        if (confirmationHeaderIndexes.isNotEmpty()) {
            // The legacy 5ch path calls a dynamically restored request signer before
            // every POST. That signer is the source of RuntimeException("39") on the
            // current endpoint, and the headers it adds are no longer part of the
            // posting contract. Match the call by its three stable argument types and
            // leave the already-built request/form untouched.
            val legacySignerIndexes = instructions.mapIndexedNotNull { index, instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference
                    as? MethodReference ?: return@mapIndexedNotNull null
                if (reference.definingClass != "Ljava/lang/reflect/Method;"
                    || reference.name != "invoke"
                    || reference.returnType != "Ljava/lang/Object;"
                    || instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
                ) {
                    return@mapIndexedNotNull null
                }
                val argumentTypes = instructions.subList(maxOf(0, index - 80), index)
                    .mapNotNull { previous ->
                        ((previous as? ReferenceInstruction)?.reference as? TypeReference)?.type
                    }
                    .toSet()
                val isLegacySigner = argumentTypes.containsAll(
                    setOf(
                        "Lo/r8lambda17vlhACr7B0IDgCdn1Q67LKhir8\$setContentView;",
                        "Lo/getCredentials\$write;",
                        "Ljava/lang/String;"
                    )
                )
                if (isLegacySigner) index else null
            }
            if (legacySignerIndexes.size != 1) {
                error("Expected one ChMate legacy request signer, found ${legacySignerIndexes.size}")
            }
            method.replaceInstruction(legacySignerIndexes.single(), "nop")

            val confirmationMergeIndexes = instructions.mapIndexedNotNull { index, instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference
                    as? MethodReference ?: return@mapIndexedNotNull null
                if (reference.definingClass != "Landroid/text/TextUtils;"
                    || reference.name != "equals"
                    || reference.returnType != "Z"
                    || reference.parameterTypes.map(CharSequence::toString) !=
                    listOf("Ljava/lang/CharSequence;", "Ljava/lang/CharSequence;")
                ) {
                    return@mapIndexedNotNull null
                }
                val comparesExclusionArray = instructions.subList(maxOf(0, index - 4), index)
                    .any { it.opcode == Opcode.AGET_OBJECT }
                if (comparesExclusionArray) index else null
            }
            if (confirmationMergeIndexes.isEmpty()) {
                error("ChMate legacy confirmation merge was not found")
            }
            confirmationMergeIndexes.asReversed().forEach { index ->
                val invocation = instructions[index]
                val firstRegister: Int
                val secondRegister: Int
                when (invocation) {
                    is FiveRegisterInstruction -> {
                        firstRegister = invocation.registerC
                        secondRegister = invocation.registerD
                    }
                    is RegisterRangeInstruction -> {
                        firstRegister = invocation.startRegister
                        secondRegister = invocation.startRegister + 1
                    }
                    else -> error("ChMate legacy confirmation merge arguments were not found")
                }
                method.replaceInstruction(
                    index,
                    "invoke-static { v$firstRegister, v$secondRegister }, " +
                        "$EXTENSION->preserveServerPostForm(" +
                        "Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z"
                )
            }

            // The old implementation parses and merges the confirmation form but
            // then restores its form parameter before retrying. Keep the original
            // form in p4 throughout the merge: replacing it with the parsed form
            // before the iterator runs loses MESSAGE and can modify the collection
            // being iterated. Only assign the merged form after that loop finishes.
            val confirmationParserIndexes = instructions.mapIndexedNotNull { index, instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference
                    as? MethodReference ?: return@mapIndexedNotNull null
                if (reference.definingClass == "Lo/getCredentials;"
                    && reference.name == "c"
                    && reference.returnType == "Lo/getCredentials\$write;"
                    && reference.parameterTypes.map(CharSequence::toString) ==
                    listOf("Ljava/lang/String;")
                ) index else null
            }
            if (confirmationParserIndexes.size != 1) {
                error("Expected one ChMate legacy confirmation parser, found ${confirmationParserIndexes.size}")
            }
            val parserIndex = confirmationParserIndexes.single()
            val parsedFormRegister = (instructions.getOrNull(parserIndex + 1)
                ?.takeIf { it.opcode == Opcode.MOVE_RESULT_OBJECT }
                as? OneRegisterInstruction)?.registerA
                ?: error("ChMate legacy parsed confirmation form was not found")
            val confirmationMergeEndIndex = instructions.mapIndexedNotNull { index, instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference
                    as? MethodReference ?: return@mapIndexedNotNull null
                if (index > parserIndex
                    && reference.definingClass == "Lo/getJsonData;"
                    && reference.name == "e"
                    && reference.returnType == "Z"
                    && reference.parameterTypes.map(CharSequence::toString) ==
                    listOf("Ljava/lang/String;")
                ) index else null
            }.singleOrNull() ?: error("ChMate legacy confirmation merge end was not found")
            method.addInstruction(
                confirmationMergeEndIndex,
                "move-object/from16 p4, v$parsedFormRegister"
            )
        }

        confirmationHeaderIndexes.asReversed().forEach { index ->
            val resultInstruction = instructions.getOrNull(index + 1)
                ?.takeIf { it.opcode == Opcode.MOVE_RESULT_OBJECT }
                as? OneRegisterInstruction
                ?: error("ChMate legacy X-Chx-Error result was not found")
            val register = resultInstruction.registerA
            method.addInstructionsWithLabels(
                index + 2,
                """
                    invoke-static/range { v$register .. v$register }, $EXTENSION->normalizePostError(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$register
                """
            )
        }

    }
}

/**
 * Disable only the stock editor's local body gate.
 *
 * The affected implementations are found by their device-information removal
 * expression instead of their obfuscated method name.  191 and 243 do not ship
 * this gate, while 226 and 241 each contain exactly one copy.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchPostPreflightValidation(
    version: String,
) {
    var patched = 0
    if (version == "0.8.10.191 dev") {
        patchLegacy191PostPreflightValidation()
        patched++
    }
    classDefForEach { classDef ->
        if (!classDef.type.contains("/feature/resedit/ResEditFragment;")) {
            return@classDefForEach
        }
        classDef.methods.forEach { method ->
            if (method.returnType != "Z" || method.parameterTypes.isNotEmpty()) {
                return@forEach
            }
            val instructions = method.implementation?.instructions ?: return@forEach
            val hasDeviceInfoGate = instructions.any { instruction ->
                val text = ((instruction as? ReferenceInstruction)?.reference as? StringReference)
                    ?.string ?: return@any false
                text.startsWith("[ \t\n]|2chMate ") && text.contains("(/[^/]+)+")
            }
            if (!hasDeviceInfoGate) {
                return@forEach
            }

            val mutableMethod = mutableClassDefBy(classDef).findMutableMethodOf(method)
            val resultRegister = mutableMethod.findFreeRegister(0)
            val originalStart = mutableMethod.implementation?.instructions?.firstOrNull()
                ?: error("ChMate post preflight gate has no implementation")
            mutableMethod.addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $EXTENSION->bypassPostPreflightValidation()Z
                    move-result v$resultRegister
                    if-eqz v$resultRegister, :haiagaru_stock_post_preflight
                    const/4 v$resultRegister, 0x1
                    return v$resultRegister
                """,
                ExternalLabel("haiagaru_stock_post_preflight", originalStart)
            )
            patched++
        }
    }

    val expected = when (version) {
        "0.8.10.191 dev", "0.8.10.226 dev", "0.8.10.241", "0.8.10.242 dev" -> 1
        "0.8.10.243 dev" -> 0
        else -> error("Unsupported ChMate version: $version")
    }
    check(patched == expected) {
        "Unexpected ChMate post preflight gates for $version: $patched (expected $expected)"
    }
}

/**
 * ChMate 191 keeps the editor gate in its obfuscated Fragment rather than in
 * the newer feature/resedit package.  It also removes the device-information
 * footer with a version-specific regular expression, so the generic matcher
 * above cannot identify it.  Bypass this method at the same point as the
 * newer versions, while retaining the stock behavior when the setting is OFF.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchLegacy191PostPreflightValidation() {
    val method = mutableClassDefBy("Lo/p9ExternalSyntheticLambda6;").methods.single { candidate ->
        candidate.name == "d"
            && candidate.returnType == "Z"
            && candidate.parameterTypes.isEmpty()
    }
    val firstInstruction = method.implementation?.instructions?.firstOrNull()
        ?: error("ChMate 191 post preflight gate has no implementation")
    val resultRegister = method.findFreeRegister(0)
    method.addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $EXTENSION->bypassPostPreflightValidation()Z
            move-result v$resultRegister
            if-eqz v$resultRegister, :haiagaru_stock_191_post_preflight
            const/4 v$resultRegister, 0x1
            return v$resultRegister
        """.trimIndent(),
        ExternalLabel("haiagaru_stock_191_post_preflight", firstInstruction),
    )
}

/** Hooks use stable parameter types; obfuscated owners are validated for each supported APK. */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchEdgeReporterHistory(version: String) {
    val runtime = "Lapp/morphe/extension/chmate/EdgeReporterHistory;"
    val board = if (version == "0.8.10.191 dev")
        "Ljp/syoboi/a2chMate/client/BBSUrlInfo\$BoardID;" else "Ljp/syoboi/a2chMate/client/BoardID;"
    val owners = when (version) {
        "0.8.10.191 dev" -> listOf("Lo/r8lambdaEBvvDaQDWIaS7WUoordU_4sxR3Y;", "Lo/isReady;", "Lo/getLabel;")
        "0.8.10.226 dev" -> listOf("Lo/TrustRootIndex;", "Lo/MessageInflater;", "Lo/OpenJSSEPlatformCompanion;")
        "0.8.10.241" -> listOf("Lo/tul11;", "Lo/changeVideoState;", "Lo/VLj;")
        "0.8.10.242 dev" -> listOf("Lo/initView;", "Lo/TopLayoutDislike22;", "Lo/getImageView;")
        else -> listOf("Lo/zzaA;", "Lo/zzaC;", "Lo/zzaaq;")
    }
    val writes = mutableClassDefBy(owners[0]).methods.filter {
        it.accessFlags and 8 == 0 && it.parameterTypes.take(3) == listOf(board, "J", "Ljava/lang/String;")
    }
    check(writes.size == 2) { "Reporter history writers changed: $version (${writes.size})" }
    writes.forEach { it.addInstructionsWithLabels(0, """
        invoke-static/range {p1 .. p4}, $runtime->title(Ljava/lang/Object;JLjava/lang/String;)Ljava/lang/String;
        move-result-object p4
    """) }
    val history = mutableClassDefBy(owners[1]).methods.single { it.name == "<init>" }
    // History constructor: bookmark id, thread key, board id, title, ...
    // p3/p4 hold the thread key, p5 board, p6 title. Use a reordered bridge to retain wide registers.
    history.addInstructionsWithLabels(0, """
        invoke-static/range {p3 .. p6}, $runtime->historyTitle(JLjava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
        move-result-object p6
    """)
    var captures = 0
    mutableClassDefBy(owners[2]).methods.toList().forEach { method ->
        val urlIndex = method.parameterTypes.indexOf("Ljp/syoboi/a2chMate/client/BBSUrlInfo;")
            .takeIf { it >= 0 } ?: method.parameterTypes.indexOf("[Ljava/lang/Object;")
        if (urlIndex < 0) return@forEach
        var offset = if (method.accessFlags and 8 == 0) 1 else 0
        method.parameterTypes.take(urlIndex).forEach { offset += if (it == "J" || it == "D") 2 else 1 }
        val instructions = method.implementation?.instructions?.toList() ?: return@forEach
        val sites = instructions.indices.filter { index ->
            val ref = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            ref != null && (ref.definingClass == "Ljp/syoboi/a2chMate/data/BBSThreadList;"
                    || ref.definingClass == "Lo/zzadh;"
                    || ref.definingClass == "Lo/setSkipEnable;") && ref.parameterTypes.firstOrNull() == "Ljava/io/InputStream;"
                    && instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
        }
        sites.asReversed().forEach { index ->
            val list = (instructions[index + 1] as OneRegisterInstruction).registerA
            val urlRegister = method.implementation!!.registerCount -
                (if (method.accessFlags and 8 == 0) 1 else 0) -
                method.parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 } + offset
            method.addInstructionsWithLabels(index + 2, """
                invoke-static/range {v$list .. v$list}, $runtime->pending(Ljava/lang/Object;)V
                invoke-static/range {v$urlRegister .. v$urlRegister}, $runtime->capturePending(Ljava/lang/Object;)V
                ${if (version == "0.8.10.191 dev") "" else """
                invoke-static/range {v$list .. v$list}, Lapp/morphe/extension/chmate/ProgrammableNgController;->pendingSubjectList(Ljava/lang/Object;)V
                invoke-static/range {v$urlRegister .. v$urlRegister}, Lapp/morphe/extension/chmate/ProgrammableNgController;->filterPendingSubjectList(Ljava/lang/Object;)V
                """}
            """)
            captures++
        }
    }
    check(captures > 0) { "Subject metadata capture missing: $version" }
    if (version == "0.8.10.191 dev") {
        // 1.3.4 moved the legacy editor bridge to a fragment-only API so it can
        // resolve the current view after recreation, but accidentally removed
        // the bytecode call site at the same time.  Without this hook, captured
        // reporter IDs still reach history while the NG editor never exposes
        // the reporter-ID choices.  Invoke it after onViewCreated has completed;
        // EdgeReporterHistory resolves getView() and preserves the stock editor.
        mutableClassDefBy("Lo/MaxFullscreenAdImplExternalSyntheticLambda4;").methods.single {
            it.name == "onViewCreated"
                && it.returnType == "V"
                && it.parameters.map(CharSequence::toString) ==
                listOf("Landroid/view/View;", "Landroid/os/Bundle;")
        }.addBeforeEveryReturn(
            "invoke-static/range {p0 .. p0}, $runtime->addLegacyButton(Ljava/lang/Object;)V"
        )
    } else {
        val owner = when (version) {
            "0.8.10.226 dev" -> "Lo/getSegmentsokio;"
            "0.8.10.241" -> "Lo/TTRewardVideoActivity2;"
            "0.8.10.242 dev" -> "Lo/getLandscapeInlineAdaptiveBannerAdSize;"
            else -> "Lo/zzawg;"
        }
        val entry = mutableClassDefBy(owner).methods.single {
            it.name == "e" && it.parameterTypes.firstOrNull() == "Landroidx/fragment/app/FragmentActivity;"
        }
        val free = entry.findFreeRegister(0)
        entry.addInstructionsWithLabels(0, """
            invoke-static/range {p0 .. p3}, $runtime->choose(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)Z
            move-result v$free
            if-eqz v$free, :reporter_stock_editor
            return-void
            :reporter_stock_editor
            nop
        """)
    }
}

/** Remove the cached Edge reporter suffix only when a title reaches the clipboard. */
private fun app.morphe.patcher.patch.BytecodePatchContext.patchEdgeReporterTitleCopy(version: String) {
    val owner = when (version) {
        "0.8.10.191 dev" -> "Lo/o8ExternalSyntheticLambda0;"
        "0.8.10.226 dev" -> "Lo/getFlexItemCount;"
        "0.8.10.241" -> "Lo/RDh41;"
        "0.8.10.242 dev" -> "Lo/setDataOwnerProductId;"
        "0.8.10.243 dev" -> "Lo/zzbwr;"
        else -> error("Unsupported clipboard title path: $version")
    }
    val method = mutableClassDefBy(owner).methods.single { candidate ->
        candidate.returnType == "V"
            && candidate.parameterTypes.map(CharSequence::toString) ==
            listOf("Landroid/content/Context;", "Ljava/lang/String;", "Z")
            && candidate.implementation?.instructions?.any { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                reference?.definingClass == "Landroid/content/ClipData;"
                    && reference.name == "newPlainText"
            } == true
    }
    method.addInstructionsWithLabels(0, """
        invoke-static/range { p1 .. p1 }, Lapp/morphe/extension/chmate/EdgeReporterHistory;->copyTitle(Ljava/lang/String;)Ljava/lang/String;
        move-result-object p1
    """)
}
