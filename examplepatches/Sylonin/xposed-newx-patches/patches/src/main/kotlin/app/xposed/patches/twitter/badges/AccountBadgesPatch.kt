package app.xposed.patches.twitter.badges

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.Match
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.xposed.patches.twitter.Constants.BRIDGE_CLASS
import app.xposed.patches.twitter.Constants.COMPATIBILITY_NEW_X
import app.xposed.patches.twitter.Constants.EXTENSION_PATH
import app.xposed.patches.twitter.Constants.HOOKS_CLASS
import app.xposed.patches.twitter.util.clearBitsSmali
import app.xposed.patches.twitter.util.composableParameter
import app.xposed.patches.twitter.util.descriptor
import app.xposed.patches.twitter.util.field
import app.xposed.patches.twitter.util.instructionList
import app.xposed.patches.twitter.util.methodRef
import app.xposed.patches.twitter.util.parameterRegister
import app.xposed.patches.twitter.util.replaceStub
import app.xposed.patches.twitter.util.replaceStubWithString
import app.xposed.patches.twitter.util.requireLocals
import app.xposed.patches.twitter.util.single
import app.xposed.patches.twitter.util.toJavaClassName
import app.xposed.patches.twitter.util.toStringFields
import app.xposed.patches.twitter.util.typeRef
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private val Method.types get() = parameterTypes.map { it.toString() }
private val Method.isStatic get() = AccessFlags.STATIC.isSet(accessFlags)
private val Field.isStatic get() = AccessFlags.STATIC.isSet(accessFlags)

/** The User interface of X's models. */
private class UserModel(val type: String, val screenName: MethodReference, val getId: MethodReference, val idValue: FieldReference)

/** Renamed Jetpack Compose members the bridge calls. */
private class ComposeModel(
    val emptyModifier: FieldReference,
    val size: MethodReference,
    val clickable: MethodReference,
    val drawWithContent: MethodReference,
    val drawScope: String,
    val drawContent: MethodReference,
    val canvasDrawScopeField: FieldReference,
    val drawParamsField: FieldReference,
    val canvasField: FieldReference,
    val sizeField: FieldReference,
    val androidCanvasField: FieldReference,
    val intState: String,
)

/** X's name row and the Affiliate badge composable inside it. */
private class BadgeModel(
    val itemType: String,
    val itemConstructor: MethodReference,
    val description: FieldReference,
    val url: FieldReference,
    val composable: Match,
    val imageBitmap: String,
    val bitmapPainter: MethodReference,
    val image: MethodReference,
    val listType: String,
    val toImmutableList: MethodReference,
    /** Name rows, each with the index of its handle parameter. */
    val nameRows: List<Pair<Method, Int>>,
)

@Suppress("unused")
val accountBadgesPatch = bytecodePatch(
    name = "Account location badges",
    description = "Shows X-Posed style country badges next to names and highlights or hides posts " +
        "from chosen countries, without reporting passive engagement with them. " +
        "Data comes from the X-Posed community cache, falling back to X's \"About this account\". " +
        "Tap a badge for account details and settings.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NEW_X)

    extendWith(EXTENSION_PATH)

    execute {
        val user = resolveUser()
        val compose = resolveCompose()
        val badges = resolveBadges()

        writeBridge(compose, badges)
        writeAboutApiSpec()
        writeClientEventSpec()

        ApplicationOnCreateFingerprint.matchSingle().method.addInstructions(
            0,
            "invoke-static/range { p0 .. p0 }, $HOOKS_CLASS->onApplicationCreate(Landroid/app/Application;)V",
        )

        // Every GraphQL client X creates is handed over; the latest is used.
        GraphqlApiFingerprint.matchSingle().classDef.methods.filter { it.name == "<init>" }.forEach { constructor ->
            constructor.instructions
                .mapIndexedNotNull { i, instruction -> i.takeIf { instruction.opcode == Opcode.RETURN_VOID } }
                .reversed()
                .forEach {
                    constructor.addInstructions(it, "invoke-static/range { p0 .. p0 }, $HOOKS_CLASS->onGraphqlApi(Ljava/lang/Object;)V")
                }
        }

        EventReporterFingerprint.matchSingle().method.apply {
            requireLocals(1)
            addInstructionsWithLabels(
                0,
                """
                move-object/16 v0, ${parameterRegister(0)}
                invoke-static { v0 }, $HOOKS_CLASS->shouldDropEvent(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :xposed_original
                return-void
                """,
                ExternalLabel("xposed_original", getInstruction(0)),
            )
        }

        // Name rows: (name, ..., badges, ..., "@handle", ...). Our item is appended to badges.
        badges.nameRows.forEach { (nameRow, handleIndex) ->
            val badgesIndex = nameRow.types.indexOf(badges.listType)
            mutableMethodOf(nameRow).apply {
                replaceComposableArgument(
                    nameRow,
                    badgesIndex,
                    """
                    move-object/16 v0, ${parameterRegister(handleIndex)}
                    move-object/16 v1, ${parameterRegister(badgesIndex)}
                    invoke-static { v0, v1 }, $HOOKS_CLASS->onNameRow(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v0
                    if-eq v0, v1, :xposed_original
                    check-cast v0, ${badges.listType}
                    """,
                )
            }
        }

        // Affiliate badge: (item, bitmap, modifier, size, composer, changed). Ours are drawn by the extension.
        badges.composable.method.apply {
            requireLocals(4)
            addInstructionsWithLabels(
                0,
                """
                move-object/16 v0, ${parameterRegister(0)}
                iget-object v1, v0, ${badges.url.descriptor}
                iget-object v0, v0, ${badges.description.descriptor}
                move/16 v2, ${parameterRegister(3)}
                move-object/16 v3, ${parameterRegister(4)}
                invoke-static { v1, v0, v2, v3 }, $HOOKS_CLASS->drawBadge(Ljava/lang/String;Ljava/lang/String;FLjava/lang/Object;)Z
                move-result v0
                if-eqz v0, :xposed_original
                return-void
                """,
                ExternalLabel("xposed_original", getInstruction(0)),
            )
        }

        // Posts: (post, authorAppealPivot, ..., modifier, composer, changed).
        val post = AvailablePostToStringFingerprint.matchSingle()
        val postFields = toStringFields(post.originalMethod)
        val author = postFields.field("AvailablePost", "author", user.type)
        val appealPivot = postFields.field("AvailablePost", "authorAppealPivot")
        Fingerprint(
            isStatic = true,
            returnType = "V",
            custom = { method, _ ->
                val types = method.types
                types.size > 2 && types[0] == post.originalClassDef.type && types[1] == appealPivot.type &&
                    types.count { it == MODIFIER } == 1 && COMPOSER in types
            },
        ).matchSingle().let { match ->
            match.method.hookFilteredComposable(
                match.originalMethod,
                user,
                "move-object/16 v0, ${match.method.parameterRegister(0)}\niget-object v0, v0, ${author.descriptor}",
                match.method.types.indexOf(MODIFIER),
            )
        }

        // Replies and condensed posts: layouts that start with the post and draw the
        // (time, author, ...) header, which reaches a name row through the row class.
        val rowClass = badges.composable.originalClassDef.type
        val headers = Fingerprint(
            isStatic = true,
            returnType = "V",
            custom = { method, classDef ->
                val types = method.types
                classDef.type != rowClass && types.size > 2 && types[0] == "Lkotlin/time/Instant;" &&
                    types[1] == user.type && COMPOSER in types &&
                    method.instructionList.any { it.methodRef?.definingClass == rowClass }
            },
        ).matchAll().map { it.originalMethod.descriptor }.toSet()
        if (headers.isEmpty()) throw PatchException("No post header composable found")
        val headerLayouts = Fingerprint(
            isStatic = true,
            returnType = "V",
            custom = { method, _ ->
                val types = method.types
                types.isNotEmpty() && types[0] == post.originalClassDef.type &&
                    types.count { it == MODIFIER } == 1 && COMPOSER in types &&
                    method.instructionList.any { it.methodRef?.descriptor in headers }
            },
        ).matchAll()
        if (headerLayouts.isEmpty()) throw PatchException("No reply post layout found")
        headerLayouts.forEach { match ->
            match.method.hookFilteredComposable(
                match.originalMethod,
                user,
                "move-object/16 v0, ${match.method.parameterRegister(0)}\niget-object v0, v0, ${author.descriptor}",
                match.method.types.indexOf(MODIFIER),
            )
        }

        // Quote cards: one dispatcher calls the compact or the media layout, which take the same data.
        val quoteLayouts = Fingerprint(
            isStatic = true,
            returnType = "V",
            custom = { method, _ ->
                val types = method.types
                types.windowed(3).any { it == listOf(user.type, "Lkotlin/time/Instant;", STRING) } &&
                    types.count { it == MODIFIER } == 1 && COMPOSER in types
            },
        ).matchAll()
        quoteLayouts.filter { layout ->
            quoteLayouts.any { other ->
                other !== layout && layout.originalMethod.instructionList.any {
                    it.methodRef?.descriptor == other.originalMethod.descriptor
                }
            }
        }.single("quote card dispatcher").let { match ->
            val types = match.method.types
            match.method.hookFilteredComposable(
                match.originalMethod,
                user,
                "move-object/16 v0, ${match.method.parameterRegister(types.indexOf(user.type))}",
                types.indexOf(MODIFIER),
            )
        }
    }
}

/**
 * Asks the extension about a post or quote whose author [loadAuthor] puts in v0. It returns
 * Hooks.HIDE to show nothing, or the modifier to use, which carries the highlight if it isn't
 * the original one.
 */
private fun MutableMethod.hookFilteredComposable(original: Method, user: UserModel, loadAuthor: String, modifierIndex: Int) {
    replaceComposableArgument(
        original,
        modifierIndex,
        """
        $loadAuthor
        if-eqz v0, :xposed_original
        invoke-interface { v0 }, ${user.screenName.descriptor}
        move-result-object v1
        invoke-interface { v0 }, ${user.getId.descriptor}
        move-result-object v5
        const-wide/16 v2, 0x0
        if-eqz v5, :xposed_call
        iget-wide v2, v5, ${user.idValue.descriptor}
        :xposed_call
        move-object/16 v4, ${parameterRegister(modifierIndex)}
        invoke-static/range { v1 .. v4 }, $HOOKS_CLASS->onPost(Ljava/lang/String;JLjava/lang/Object;)Ljava/lang/Object;
        move-result-object v0
        sget-object v1, $HOOKS_CLASS->HIDE:Ljava/lang/Object;
        if-ne v0, v1, :xposed_show
        return-void
        :xposed_show
        if-eq v0, v4, :xposed_original
        check-cast v0, $MODIFIER
        """,
        locals = 6,
    )
}

/**
 * Adds [compute] at the start of a composable. It leaves the new value of parameter [index] in
 * v0, or jumps to :xposed_original to keep the argument. The new value is stored, and the
 * parameter's `$changed` and `$default` bits are cleared so the composable compares it with
 * the last value instead of skipping or using its default. [original] is the unpatched method.
 */
private fun MutableMethod.replaceComposableArgument(original: Method, index: Int, compute: String, locals: Int = 3) {
    requireLocals(maxOf(locals, 3))
    val parameter = original.composableParameter(index)
    addInstructionsWithLabels(
        0,
        """
        $compute
        move-object/16 ${parameterRegister(index)}, v0
        ${clearBitsSmali(parameter.changed, "v1", "v2")}
        ${clearBitsSmali(parameter.default, "v1", "v2")}
        """,
        ExternalLabel("xposed_original", getInstruction(0)),
    )
}

private fun BytecodePatchContext.mutableMethodOf(method: Method): MutableMethod =
    mutableClassDefBy(method.definingClass).methods.first { it.name == method.name && it.types == method.types && it.returnType == method.returnType }

private fun BytecodePatchContext.instanceField(classType: String, what: String, predicate: (Field) -> Boolean): Field =
    classDefBy(classType).fields.filter { !it.isStatic && predicate(it) }.single(what)

/** Code we add runs in other classes, so everything it touches must be public. */
private fun BytecodePatchContext.requirePublic(vararg members: Any) {
    fun requireClass(type: String) {
        if (!type.startsWith("L")) return
        val classDef = classDefByOrNull(type) ?: return
        if (!AccessFlags.PUBLIC.isSet(classDef.accessFlags)) throw PatchException("$type is not public")
    }
    members.forEach { member ->
        when (member) {
            is String -> requireClass(member)
            is FieldReference -> {
                requireClass(member.definingClass)
                val field = classDefBy(member.definingClass).fields.first { it.name == member.name && it.type == member.type }
                if (!AccessFlags.PUBLIC.isSet(field.accessFlags)) throw PatchException("${member.descriptor} is not public")
            }

            is MethodReference -> {
                requireClass(member.definingClass)
                val method = classDefBy(member.definingClass).methods.firstOrNull {
                    it.name == member.name && it.types == member.parameterTypes.map(CharSequence::toString) && it.returnType == member.returnType
                } ?: throw PatchException("${member.descriptor} not found")
                if (!AccessFlags.PUBLIC.isSet(method.accessFlags)) throw PatchException("${member.descriptor} is not public")
            }
        }
    }
}

private fun BytecodePatchContext.resolveUser(): UserModel {
    val handle = UserHandleFingerprint.matchSingle()
    val userClass = handle.originalClassDef
    val screenName = handle.originalMethod.instructionList.first().methodRef!!
    val getId = userClass.methods.first { it.name == "getId" && it.parameterTypes.isEmpty() }
    val idValue = instanceField(getId.returnType, "long id field of ${getId.returnType}") { it.type == "J" }
    requirePublic(screenName, getId, idValue)
    return UserModel(userClass.type, screenName, getId, idValue)
}

private fun BytecodePatchContext.resolveCompose(): ComposeModel {
    val emptyModifierClass = EmptyModifierToStringFingerprint.matchSingle().originalClassDef
    val emptyModifier = emptyModifierClass.fields.filter { it.isStatic && it.type == emptyModifierClass.type }.single("Modifier.Companion")
    val size = SizeModifierFingerprint.matchSingle().originalMethod
    val clickable = ClickableModifierFingerprint.matchSingle().originalMethod

    // drawBehind, drawWithContent and drawWithCache each wrap their lambda in an element whose
    // node draws with it. Told apart by what the node does around the lambda.
    var withContent: Method? = null
    var withContentScope: String? = null
    var drawContent: MethodReference? = null
    DrawModifierFactoryFingerprint.matchAll().forEach { factory ->
        val element = factory.originalMethod.instructionList.firstOrNull { it.opcode == Opcode.NEW_INSTANCE }?.typeRef ?: return@forEach
        val elementClass = classDefBy(element)
        if (elementClass.methods.none { it.name == "<init>" && it.types == listOf(FUNCTION1) }) return@forEach
        val node = elementClass.methods.filter { it.parameterTypes.isEmpty() && it.returnType.startsWith("L") && it.name != "toString" }
            .firstNotNullOfOrNull { create -> create.instructionList.firstOrNull { it.opcode == Opcode.NEW_INSTANCE }?.typeRef } ?: return@forEach
        classDefBy(node).methods.filter { it.returnType == "V" && it.parameterTypes.size == 1 }.forEach { draw ->
            val instructions = draw.instructionList.filter { it.opcode != Opcode.NOP }
            val invokesLambda = instructions.getOrNull(1)?.methodRef?.let { it.definingClass == FUNCTION1 && it.name == "invoke" } == true
            if (instructions.firstOrNull()?.opcode != Opcode.IGET_OBJECT || !invokesLambda) return@forEach
            when (instructions.map { it.opcode }) {
                listOf(Opcode.IGET_OBJECT, Opcode.INVOKE_INTERFACE, Opcode.RETURN_VOID) -> {
                    if (withContent != null) throw PatchException("Two drawWithContent factories: ${withContent!!.descriptor}, ${factory.originalMethod.descriptor}")
                    withContent = factory.originalMethod
                    withContentScope = draw.types[0]
                }

                listOf(Opcode.IGET_OBJECT, Opcode.INVOKE_INTERFACE, Opcode.INVOKE_VIRTUAL, Opcode.RETURN_VOID) -> {
                    val call = instructions[2].methodRef!!
                    if (call.definingClass == draw.types[0] && call.parameterTypes.isEmpty() && call.returnType == "V") drawContent = call
                }
            }
        }
    }
    val drawScope = withContentScope ?: throw PatchException("Modifier.drawWithContent not found")
    val content = drawContent ?: throw PatchException("ContentDrawScope.drawContent not found")
    if (content.definingClass != drawScope) throw PatchException("drawBehind and drawWithContent use different scopes")

    // LayoutNodeDrawScope -> CanvasDrawScope -> DrawParams(density, layoutDirection, canvas, size).
    val drawParams = DrawParamsToStringFingerprint.matchSingle()
    val drawParamsType = drawParams.originalClassDef.type
    val drawParamsFields = toStringFields(drawParams.originalMethod)
    val canvasField = drawParamsFields.field("DrawParams", "canvas")
    val sizeField = drawParamsFields.field("DrawParams", "size", "J")
    val canvasDrawScopeField = instanceField(drawScope, "CanvasDrawScope field") { field ->
        classDefByOrNull(field.type)?.fields?.any { !it.isStatic && it.type == drawParamsType } == true
    }
    val drawParamsField = instanceField(canvasDrawScopeField.type, "DrawParams field") { it.type == drawParamsType }

    // AndroidCanvas: the Canvas implementation backed by an android.graphics.Canvas.
    val androidCanvases = mutableListOf<ClassDef>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Landroidx/compose/ui/graphics/") && canvasField.type in classDef.interfaces &&
            classDef.fields.any { !it.isStatic && it.type == "Landroid/graphics/Canvas;" }
        ) {
            androidCanvases += classDef
        }
    }
    val androidCanvas = androidCanvases.single("AndroidCanvas")
    val androidCanvasField = androidCanvas.fields.filter { !it.isStatic && it.type == "Landroid/graphics/Canvas;" }.single("AndroidCanvas.nativeCanvas")

    val intState = MutableIntStateToStringFingerprint.matchSingle().originalClassDef
    val intStateMethods = listOf(
        intState.methods.firstOrNull { it.name == "<init>" && it.types == listOf("I") },
        intState.methods.firstOrNull { it.name == "getValue" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/Object;" },
        intState.methods.firstOrNull { it.name == "setValue" && it.types == listOf("Ljava/lang/Object;") && it.returnType == "V" },
    )
    if (null in intStateMethods) throw PatchException("${intState.type} isn't a MutableIntState")

    requirePublic(
        emptyModifier, size, clickable, withContent!!, drawScope, content, canvasDrawScopeField, drawParamsField,
        canvasField, sizeField, androidCanvas.type, androidCanvasField, intState.type, *intStateMethods.filterNotNull().toTypedArray(),
    )
    return ComposeModel(
        emptyModifier = emptyModifier,
        size = size,
        clickable = clickable,
        drawWithContent = withContent!!,
        drawScope = drawScope,
        drawContent = content,
        canvasDrawScopeField = canvasDrawScopeField,
        drawParamsField = drawParamsField,
        canvasField = canvasField,
        sizeField = sizeField,
        androidCanvasField = androidCanvasField,
        intState = intState.type,
    )
}

private fun BytecodePatchContext.resolveBadges(): BadgeModel {
    val item = AffiliateBadgeToStringFingerprint.matchSingle()
    val itemType = item.originalClassDef.type
    val itemFields = toStringFields(item.originalMethod)
    val description = itemFields.field("Affiliate", "contentDescription", STRING)
    val url = itemFields.field("Affiliate", "badgeImageUrl", STRING)
    val itemConstructor = item.originalClassDef.methods.filter {
        it.name == "<init>" && it.types.size == 3 && it.types[0] == STRING && it.types[1] == STRING && it.types[2].startsWith("L")
    }.single("Affiliate(contentDescription, badgeImageUrl, onClickOpenUrl)")

    // Affiliate badge composable: (item, bitmap from the row's map or null, modifier, size, composer, changed).
    val composable = Fingerprint(
        isStatic = true,
        returnType = "V",
        parameters = listOf(itemType, "L", MODIFIER, "F", COMPOSER, "I"),
    ).matchSingle()
    val composableMethod = composable.originalMethod
    val imageBitmap = composableMethod.types[1]
    if (classDefBy(imageBitmap).methods.none { it.name == "<init>" && it.types == listOf("Landroid/graphics/Bitmap;") }) {
        throw PatchException("$imageBitmap isn't AndroidImageBitmap")
    }
    val bitmapPainter = composableMethod.instructionList.mapNotNull { it.methodRef }
        .filter { it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf(imageBitmap) }
        .distinctBy { it.descriptor }.single("BitmapPainter constructor")
    val painter = classDefBy(bitmapPainter.definingClass).superclass!!
    val image = composableMethod.instructionList
        .filter { it.opcode == Opcode.INVOKE_STATIC || it.opcode == Opcode.INVOKE_STATIC_RANGE }
        .mapNotNull { it.methodRef }
        .filter {
            val t = it.parameterTypes.map(CharSequence::toString)
            t.size == 10 && t[0] == painter && t[1] == STRING && t[2] == MODIFIER && t[5] == "F" &&
                t[7] == COMPOSER && t[8] == "I" && t[9] == "I"
        }
        .distinctBy { it.descriptor }.single("Image(painter, contentDescription, modifier, ...) composable")

    // The badge row draws each item; the name row lays out name, badges and handle.
    val rowClass = composable.originalClassDef
    val badgeRow = rowClass.methods.filter { method ->
        method.isStatic && method.instructionList.any { it.methodRef?.descriptor == composableMethod.descriptor } &&
            method.instructionList.any { it.opcode == Opcode.INSTANCE_OF && it.typeRef == itemType }
    }.single("badge row in ${rowClass.type}")
    val listType = badgeRow.types.filter { type ->
        type.startsWith("L") && classDefByOrNull(type)?.interfaces?.contains("Ljava/util/List;") == true
    }.single("badge list parameter of ${badgeRow.name}")
    // Name rows lay out (name, ..., badges, ..., "@handle", ...): the post and user row, and
    // the reply header's row, which also shows the time.
    fun handleIndex(types: List<String>) = types.indices.firstOrNull { it > 0 && types[it] == STRING }
    val nameRows = rowClass.methods.filter { method ->
        val t = method.types
        method.isStatic && t.size > 3 && t[0] == STRING && listType in t && COMPOSER in t && handleIndex(t) != null &&
            method.instructionList.any { it.methodRef?.descriptor == badgeRow.descriptor }
    }.map { it to handleIndex(it.types)!! }
    if (nameRows.isEmpty()) throw PatchException("No name row in ${rowClass.type}")

    val toImmutableList = Fingerprint(
        isStatic = true,
        returnType = listType,
        parameters = listOf("Ljava/lang/Iterable;"),
        custom = { method, _ -> method.instructionList.any { it.opcode == Opcode.INSTANCE_OF && it.typeRef == listType } },
    ).matchSingle().originalMethod

    requirePublic(itemType, itemConstructor, description, url, imageBitmap, bitmapPainter, image, listType, toImmutableList)
    return BadgeModel(
        itemType = itemType,
        itemConstructor = itemConstructor,
        description = description,
        url = url,
        composable = composable,
        imageBitmap = imageBitmap,
        bitmapPainter = bitmapPainter,
        image = image,
        listType = listType,
        toImmutableList = toImmutableList,
        nameRows = nameRows,
    )
}

private fun BytecodePatchContext.writeBridge(compose: ComposeModel, badges: BadgeModel) {
    fun stub(name: String, locals: Int, smali: String) = replaceStub(BRIDGE_CLASS, name, locals, smali)

    stub(
        "size", 1,
        """
        sget-object v0, ${compose.emptyModifier.descriptor}
        invoke-static { v0, p0, p1 }, ${compose.size.descriptor}
        move-result-object v0
        return-object v0
        """,
    )
    // enabled, no label, role or interaction source, so the theme's ripple is used.
    stub(
        "clickable", 7,
        """
        move-object v0, p0
        check-cast v0, $MODIFIER
        const/4 v1, 0x1
        const/4 v2, 0x0
        const/4 v3, 0x0
        const/4 v4, 0x0
        move-object v5, p1
        const/4 v6, 0x0
        invoke-static/range { v0 .. v6 }, ${compose.clickable.descriptor}
        move-result-object v0
        return-object v0
        """,
    )
    stub(
        "drawWithContent", 1,
        """
        if-nez p0, :modifier
        sget-object p0, ${compose.emptyModifier.descriptor}
        :modifier
        check-cast p0, $MODIFIER
        invoke-static { p0, p1 }, ${compose.drawWithContent.descriptor}
        move-result-object v0
        return-object v0
        """,
    )
    stub(
        "drawContent", 0,
        """
        check-cast p0, ${compose.drawScope}
        invoke-virtual { p0 }, ${compose.drawContent.descriptor}
        return-void
        """,
    )
    val androidCanvas = compose.androidCanvasField.definingClass
    stub(
        "nativeCanvas", 2,
        """
        check-cast p0, ${compose.drawScope}
        iget-object v0, p0, ${compose.canvasDrawScopeField.descriptor}
        iget-object v0, v0, ${compose.drawParamsField.descriptor}
        iget-object v0, v0, ${compose.canvasField.descriptor}
        instance-of v1, v0, $androidCanvas
        if-eqz v1, :none
        check-cast v0, $androidCanvas
        iget-object v0, v0, ${compose.androidCanvasField.descriptor}
        return-object v0
        :none
        const/4 v0, 0x0
        return-object v0
        """,
    )
    stub(
        "drawSize", 2,
        """
        check-cast p0, ${compose.drawScope}
        iget-object v0, p0, ${compose.canvasDrawScopeField.descriptor}
        iget-object v0, v0, ${compose.drawParamsField.descriptor}
        iget-wide v0, v0, ${compose.sizeField.descriptor}
        return-wide v0
        """,
    )
    stub(
        "bitmapPainter", 2,
        """
        new-instance v0, ${badges.imageBitmap}
        invoke-direct { v0, p0 }, ${badges.imageBitmap}-><init>(Landroid/graphics/Bitmap;)V
        new-instance v1, ${badges.bitmapPainter.definingClass}
        invoke-direct { v1, v0 }, ${badges.bitmapPainter.descriptor}
        return-object v1
        """,
    )
    // Image(painter, contentDescription, modifier, alignment, contentScale, alpha, colorFilter,
    // composer, changed, default). The default mask selects the defaults for parameters 3 to 6,
    // so the bitmap is centred and scaled to fit.
    val painter = badges.image.parameterTypes[0]
    stub(
        "image", 10,
        """
        move-object v0, p0
        check-cast v0, $painter
        move-object v1, p1
        move-object v2, p2
        check-cast v2, $MODIFIER
        const/4 v3, 0x0
        const/4 v4, 0x0
        const/4 v5, 0x0
        const/4 v6, 0x0
        move-object v7, p3
        check-cast v7, $COMPOSER
        const/4 v8, 0x0
        const/16 v9, 0x78
        invoke-static/range { v0 .. v9 }, ${badges.image.descriptor}
        return-void
        """,
    )
    stub(
        "intState", 1,
        """
        new-instance v0, ${compose.intState}
        invoke-direct { v0, p0 }, ${compose.intState}-><init>(I)V
        return-object v0
        """,
    )
    stub(
        "readIntState", 1,
        """
        check-cast p0, ${compose.intState}
        invoke-virtual { p0 }, ${compose.intState}->getValue()Ljava/lang/Object;
        move-result-object v0
        check-cast v0, Ljava/lang/Integer;
        invoke-virtual { v0 }, Ljava/lang/Integer;->intValue()I
        move-result v0
        return v0
        """,
    )
    stub(
        "writeIntState", 1,
        """
        check-cast p0, ${compose.intState}
        invoke-static { p1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
        move-result-object v0
        invoke-virtual { p0, v0 }, ${compose.intState}->setValue(Ljava/lang/Object;)V
        return-void
        """,
    )
    stub(
        "immutableList", 1,
        """
        invoke-static { p0 }, ${badges.toImmutableList.descriptor}
        move-result-object v0
        return-object v0
        """,
    )
    stub(
        "affiliateBadge", 2,
        """
        new-instance v0, ${badges.itemType}
        const/4 v1, 0x0
        invoke-direct { v0, p0, p1, v1 }, ${badges.itemConstructor.descriptor}
        return-object v0
        """,
    )
}

/** Names for XAboutApi: the repository and the fields of what it returns. */
private fun BytecodePatchContext.writeAboutApiSpec() {
    val repository = AboutRepositoryFingerprint.matchSingle().originalClassDef.type

    val about = AboutMetadataToStringFingerprint.matchSingle()
    val aboutFields = toStringFields(about.originalMethod)
    val basedIn = aboutFields.field("ProfileAboutMetadata", "basedInCountry", STRING)
    val appSource = aboutFields.field("ProfileAboutMetadata", "appSource", STRING)
    val accurate = aboutFields.field("ProfileAboutMetadata", "isLocationAccurate", "Z")
    val affiliate = aboutFields.field("ProfileAboutMetadata", "affiliateData")

    val affiliateData = AffiliateDataToStringFingerprint.matchSingle()
    if (affiliateData.originalClassDef.type != affiliate.type) throw PatchException("affiliateData is ${affiliate.type}")
    val username = toStringFields(affiliateData.originalMethod).field("AffiliateData", "username", STRING)

    val minimalUser = MinimalUserToStringFingerprint.matchSingle()
    val id = toStringFields(minimalUser.originalMethod).field("MinimalUser", "id")
    val idValue = instanceField(id.type, "long id field of ${id.type}") { it.type == "J" }

    // The repository's result holds exactly these two.
    val payload = toStringFields(UserWithAboutToStringFingerprint.matchSingle().originalMethod)
    payload.field("UserWithProfileAboutMetadata", "user", minimalUser.originalClassDef.type)
    payload.field("UserWithProfileAboutMetadata", "profileAboutMetadata", about.originalClassDef.type)

    replaceStubWithString(
        HOOKS_CLASS,
        "aboutApiSpec",
        listOf(
            repository.toJavaClassName(),
            about.originalClassDef.type.toJavaClassName(),
            basedIn.name,
            appSource.name,
            accurate.name,
            affiliate.name,
            username.name,
            minimalUser.originalClassDef.type.toJavaClassName(),
            id.name,
            idValue.name,
        ).joinToString("|"),
    )
}

/** Names for Engagement. X's thrift classes keep their names; this checks they still fit. */
private fun BytecodePatchContext.writeClientEventSpec() {
    val item = "Lcom/x/thrift/clientapp/gen/Item;"
    val details = "Lcom/x/thrift/clientapp/gen/TweetDetails;"
    val itemType = "Lcom/x/thrift/clientapp/gen/ItemType;"
    fun requireField(classType: String, name: String, type: String, static: Boolean = false) {
        classDefBy(classType).fields.firstOrNull { it.name == name && it.type == type && it.isStatic == static }
            ?: throw PatchException("$classType has no field $name:$type")
    }
    requireField(LOG_EVENT, "event_name", STRING)
    requireField(LOG_EVENT, "items", "Ljava/util/List;")
    requireField(item, "tweet_details", details)
    requireField(details, "author_id", "Ljava/lang/Long;")
    requireField(item, "id", "Ljava/lang/Long;")
    requireField(item, "item_type", itemType)
    requireField(itemType, "value", "I")
    requireField(itemType, "TWEET", "I", static = true)
    replaceStubWithString(
        HOOKS_CLASS,
        "clientEventSpec",
        listOf(
            LOG_EVENT.toJavaClassName(), "event_name", "items",
            item.toJavaClassName(), "tweet_details", "author_id", "id", "item_type", "value", "TWEET",
        ).joinToString("|"),
    )
}
