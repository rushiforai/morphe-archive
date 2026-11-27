// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.syncforreddit.layout.gfycat

import app.edbfi.patches.syncforreddit.SyncPatchStrings
import app.edbfi.patches.syncforreddit.syncForReddit
import app.reseam.patch.CodeScope
import app.reseam.patch.FieldTarget
import app.reseam.patch.Type
import app.reseam.patch.ValueRef
import app.reseam.patch.after
import app.reseam.patch.before
import app.reseam.patch.dex.AccessFlags
import app.reseam.patch.dex.Opcode
import app.reseam.patch.dex.fieldRef
import app.reseam.patch.dex.invokeRegisters
import app.reseam.patch.dex.methodRef
import app.reseam.patch.dex.opcode
import app.reseam.patch.dex.regA
import app.reseam.patch.dex.regB
import app.reseam.patch.dex.ref
import app.reseam.patch.dex.stringValue
import app.reseam.patch.fieldTarget
import app.reseam.patch.method
import app.reseam.patch.methodTarget
import app.reseam.patch.patch
import app.reseam.patch.points
import app.reseam.patch.types.Instruction
import app.reseam.patch.types.MethodRef

// Sync 23033's RedditLinkPreview constructor (wa.e) assigns 3 to its inherited media type.
private const val PLAIN_LINK = 3
// Sync 23033's post media parser (c8.b.a) stores type 4 when it builds the thumbs.gfycat.com poster.
private const val VIDEO_LINK = 4
// The stock PostPreviewHelper changes that type to 9 when it reads a Reddit preview.
private const val LINK_WITH_PREVIEW = 9
private const val STRING_BUILDER = "Ljava/lang/StringBuilder;"
private const val JSON_OBJECT = "Lorg/json/JSONObject;"
private const val CURSOR = "Landroid/database/Cursor;"

private val linkHost = method("Link host parser") {
    params(Type.String)
    returns(Type.String)
    flags(AccessFlags.STATIC)
    strings("www.")
    calls(MethodRef("Ljava/net/URI;", "create", "(Ljava/lang/String;)Ljava/net/URI;"))
    calls(MethodRef("Ljava/net/URI;", "getHost", "()Ljava/lang/String;"))
}

private val isGfycatLink = method("Gfycat link classifier") {
    params(Type.String)
    returns(Type.Boolean)
    strings("gfycat.com", "http://gfycat.com/", "https://gfycat.com/")
    calls(linkHost)
}

private fun CodeScope.whenGfycatHost(url: ValueRef, block: CodeScope.() -> Unit) {
    whenNotNull(url) {
        // The stock parser returns a lowercase URI host, or null for invalid URLs.
        val host = call(linkHost, url)
        whenNotNull(host) {
            whenTrue(host.callVirtual(
                Type.String, "matches", "(Ljava/lang/String;)Z", string("""(?:.+\.)?gfycat\.com\.?"""),
            ), block)
        }
    }
}

private fun CodeScope.whenGfycatMedia(url: ValueRef, block: CodeScope.() -> Unit) {
    whenGfycatHost(url) {
        // Keep the four homepage forms the stock classifier treats as ordinary links.
        whenFalse(url.callVirtual(
            Type.String, "matches", "(Ljava/lang/String;)Z", string("""https?://gfycat\.com/?"""),
        ), block)
    }
}

private val redditPreview = method("Reddit post preview selection") {
    flags(AccessFlags.PRIVATE or AccessFlags.STATIC)
    strings("There was only one preview so lets use the source!", "url", "width", "height")
}

private val postMedia = method("Post media parser") {
    params(JSON_OBJECT, Type.Int, Type.Int, Type.Int)
    strings("https://thumbs.gfycat.com/", "-poster.jpg", "USING YOUTUBE")
    calls(isGfycatLink)
    calls(redditPreview)
}

private val postListType = method("Vertical post adapter item type") {
    params(Type.Int)
    returns(Type.Int)
    custom { !isStatic }
    strings("sync_type", "Unsupported type: ")
    calls(MethodRef(CURSOR, "moveToPosition", "(I)Z"))
    calls(MethodRef(CURSOR, "getInt", "(I)I"))
}

private fun CodeScope.isEmpty(value: ValueRef): ValueRef =
    callStatic("android.text.TextUtils", "isEmpty", "(Ljava/lang/CharSequence;)Z", value)

private val redditThumbnail = method("Reddit post thumbnail parser") {
    params(JSON_OBJECT)
    returns(Type.String)
    flags(AccessFlags.STATIC)
    strings("url", "thumbnail", "thumbs.redditmedia.com")
}

private val commentLink = method("Comment link renderer") {
    strings("tenor.com", ".jpeg", "Is user link: ")
    calls(isGfycatLink)
}

private val postDescription = method("Post model field labels") {
    name("toString")
    params()
    returns(Type.String)
    custom { !isStatic }
    strings("Post{id=", ", sync_type=", ", raw_url=", ", thumbnail=", ", preview_url=")
}

private fun Instruction.isAppend(type: String) =
    (opcode == Opcode.INVOKE_VIRTUAL || opcode == Opcode.INVOKE_VIRTUAL_RANGE) &&
        methodRef == MethodRef(STRING_BUILDER, "append", "($type)$STRING_BUILDER")

private fun postField(label: String, read: Opcode, type: String) = fieldTarget("Post $label field") {
    val model = postDescription.method
    val instructions = model.instructions
    val labels = instructions.indices.filter { instructions[it].stringValue == ", $label=" }
    check(labels.size == 1) { "Post $label field: expected one label, found ${labels.size}" }
    val index = labels.single()
    val expected = "Post $label field: expected contiguous label append, $read from this, and value append"
    check(index + 3 < instructions.size) { expected }
    val (labelLoad, labelAppend, fieldRead, valueAppend) = instructions.subList(index, index + 4)
    val labelRegister = labelLoad.regA
    val builderRegister = labelAppend.invokeRegisters?.firstOrNull()
    val field = fieldRead.fieldRef
    val valueRegister = fieldRead.regA
    val thisRegister = model.registersSize - model.insSize
    check(
        labelRegister != null && builderRegister != null && valueRegister != null &&
            (labelLoad.opcode == Opcode.CONST_STRING || labelLoad.opcode == Opcode.CONST_STRING_JUMBO) &&
            builderRegister != labelRegister && builderRegister != valueRegister && builderRegister != thisRegister &&
            labelAppend.isAppend(Type.String) && labelAppend.invokeRegisters == listOf(builderRegister, labelRegister) &&
            fieldRead.opcode == read && fieldRead.regB == thisRegister &&
            field != null && field.definingClass == model.owner && field.fieldType == type &&
            model.classDef.instanceFields.any { it.ref == field } &&
            valueAppend.isAppend(type) && valueAppend.invokeRegisters == listOf(builderRegister, valueRegister),
    ) { expected }
    field
}

private val rawUrl = postField("raw_url", Opcode.IGET_OBJECT, Type.String)
private val syncType = postField("sync_type", Opcode.IGET, Type.Int)
private val thumbnail = postField("thumbnail", Opcode.IGET_OBJECT, Type.String)
private val previewUrl = postField("preview_url", Opcode.IGET_OBJECT, Type.String)

private fun postGetter(label: String, read: Opcode, returnOpcode: Opcode, field: FieldTarget) =
    methodTarget("Post $label getter") {
        val ref = field.ref
        val matches = postDescription.method.classDef.methods.filter { method ->
            !method.isStatic && method.parameterTypes.isEmpty() && method.returnType == ref.fieldType &&
                method.instructions.let { instructions ->
                    instructions.size == 2 && instructions[0].opcode == read && instructions[0].fieldRef == ref &&
                        instructions[0].regB == method.registersSize - method.insSize &&
                        instructions[1].opcode == returnOpcode && instructions[1].regA == instructions[0].regA
                }
        }
        check(matches.size == 1) { "Post $label getter: expected one method, found ${matches.size}" }
        matches.single()
    }

private val postType = postGetter("sync_type", Opcode.IGET, Opcode.RETURN, syncType)
private val postThumbnail = postGetter("thumbnail", Opcode.IGET_OBJECT, Opcode.RETURN_OBJECT, thumbnail)
private val postPreview = postGetter("preview_url", Opcode.IGET_OBJECT, Opcode.RETURN_OBJECT, previewUrl)

val hideGfycatLinkPreviews = patch(SyncPatchStrings.hideGfycatLinkPreviews) {
    description(SyncPatchStrings.hideGfycatLinkPreviewsDescription)
    compatibleWith(syncForReddit)

    execute {
        val commentPreviewBranch = commentLink.points {
            invokeVirtual { owner(Type.String); name("contains") }
            argument(1) { string("tenor.com") }
        }.single().captureArgumentAs("url", 0)
            .next {
                resultOf(Type.Boolean)
                then { opcode(Opcode.IF_EQZ) }
                then { opcode(Opcode.MOVE) }
                then { opcode(Opcode.IF_EQZ) }
            }
            .captureAs("showPreview", Type.Boolean)

        // Resolve all targets before editing.
        redditThumbnail.method
        commentPreviewBranch.index
        val selection = redditPreview.method
        check(selection.parameterTypes.getOrNull(1) == Type.String) { "Missing Reddit preview destination" }
        val previewClass = checkNotNull(bytecode.findClass(selection.returnType)) { "Missing Reddit preview model" }
        val imageFields = previewClass.instanceFields.filter { it.ref.fieldType == Type.String }
        check(imageFields.size == 1) {
            "Gfycat previews: expected one String image URL field on ${selection.returnType}, found ${imageFields.size}"
        }
        val selectedImage = imageFields.single().ref
        val parsedMedia = postMedia.method
        val linkTypeWrite = postMedia.points("Plain link preview type write") {
            calls(redditPreview)
            then { resultOf(selection.returnType) }
            then { opcode(Opcode.IPUT_OBJECT); field { owner(parsedMedia.returnType); type(selection.returnType) } }
            then { opcode(Opcode.CONST_16); literal(LINK_WITH_PREVIEW.toLong()) }
            then { opcode(Opcode.IPUT); field { owner(parsedMedia.returnType); type(Type.Int) } }
        }.single()
        val typeIndex = linkTypeWrite.index
        val previewWrite = parsedMedia.instructions[typeIndex - 2]
        val parsedPreview = checkNotNull(previewWrite.fieldRef)
        val parsedType = linkTypeWrite.field("Parsed media type")
        val mediaClass = checkNotNull(bytecode.findClass(parsedMedia.returnType)) { "Missing parsed media model" }
        check(
            mediaClass.instanceFields.any { it.ref == parsedType.ref } &&
                mediaClass.instanceFields.any { it.ref == parsedPreview } &&
                previewWrite.regA == parsedMedia.instructions[typeIndex - 3].regA &&
                previewWrite.regB == linkTypeWrite.instruction.regB &&
                parsedMedia.instructions[typeIndex - 1].regA == linkTypeWrite.instruction.regA,
        ) { "Expected the plain link branch to store the chosen preview and its type on the same media model" }

        val cursorTypeRead = postListType.points("Vertical post adapter cursor type read") {
            invokeInterface { owner(CURSOR); name("getColumnIndex"); params(Type.String); returns(Type.Int) }
            argument(1) { string("sync_type") }
            then { resultOf(Type.Int) }
            then { invokeInterface { owner(CURSOR); name("getInt"); params(Type.Int); returns(Type.Int) } }
        }.single()
        val cursorTypeResult = cursorTypeRead.next { resultOf(Type.Int) }.captureAs("rowType", Type.Int)
        val cursorReceiver = cursorTypeRead.writer(0, "Vertical post adapter cursor receiver")
        val cursorCall = cursorReceiver.previous {
            invokeVirtual { owner(postListType.method.owner); params(); returns(CURSOR) }
        }
        val cursorGetter = cursorCall.callee("Vertical post adapter cursor getter")
        val getter = cursorGetter.method
        val adapter = postListType.method
        val readIndex = cursorTypeRead.index
        check(
            cursorTypeResult.index == readIndex + 1 &&
                cursorCall.index + 1 == cursorReceiver.index &&
                cursorReceiver.instruction.opcode == Opcode.MOVE_RESULT_OBJECT &&
                cursorCall.instruction.invokeRegisters == listOf(adapter.registersSize - adapter.insSize) &&
                getter.instructions.let { body ->
                    body.size == 2 && body[0].opcode == Opcode.IGET_OBJECT &&
                        body[0].fieldRef?.definingClass == adapter.owner && body[0].fieldRef?.fieldType == CURSOR &&
                        body[1].opcode == Opcode.RETURN_OBJECT && body[0].regB == getter.registersSize - getter.insSize &&
                        body[0].regA == body[1].regA
                } &&
                cursorTypeRead.instruction.invokeRegisters?.getOrNull(1) == adapter.instructions[readIndex - 1].regA,
        ) { "Expected the vertical post adapter to read sync_type from its current cursor" }

        check(setOf(rawUrl.ref, syncType.ref, thumbnail.ref, previewUrl.ref).size == 4) {
            "Post model labels must refer to distinct fields"
        }
        postType.method
        postThumbnail.method
        postPreview.method

        val destination: CodeScope.() -> ValueRef = {
            param(0).callVirtual(JSON_OBJECT, "optString", "(Ljava/lang/String;)Ljava/lang/String;", string("url"))
        }
        postMedia.before {
            // Use Sync's regular link path so it can select an independent Reddit preview.
            whenNotNull(param(0)) { whenGfycatMedia(destination()) { param(1).assign(int(PLAIN_LINK)) } }
        }
        postMedia.after {
            whenNotNull(result) {
                whenGfycatMedia(destination()) {
                    whenEqual(result.field(parsedType), int(LINK_WITH_PREVIEW)) {
                        // Sync assigns type 9 even when preview selection returns null.
                        whenNull(result.field(parsedPreview)) { result.set(parsedType, int(PLAIN_LINK)) }
                    }
                }
            }
        }
        redditPreview.after {
            whenNotNull(result) {
                whenGfycatMedia(param(1)) {
                    val image = result.field(selectedImage)
                    whenTrue(isEmpty(image)) { result.assign(nullObject) }
                    whenGfycatHost(image) { result.assign(nullObject) }
                }
            }
        }
        redditThumbnail.after {
            whenNotNull(result) {
                whenGfycatMedia(destination()) { whenGfycatHost(result) { result.assign(nullObject) } }
            }
        }
        commentPreviewBranch.before {
            whenGfycatMedia(capture("url")) {
                capture("showPreview").assign(bool(false))
            }
        }

        // The vertical adapter reads the persisted type instead of calling the model getter.
        // Correct its choice of holder without rewriting cached posts.
        cursorTypeResult.after {
            val rowType = capture("rowType")
            val fixType: CodeScope.() -> Unit = {
                val cursor = thisObject.call(cursorGetter)
                fun column(name: String): ValueRef = cursor.callInterface(
                    CURSOR, "getColumnIndex", "(Ljava/lang/String;)I", string(name),
                )
                fun value(index: ValueRef): ValueRef = cursor.callInterface(
                    CURSOR, "getString", "(I)Ljava/lang/String;", index,
                )
                val destinationIndex = column("raw_url")
                whenNotEqual(destinationIndex, int(-1)) {
                    whenGfycatMedia(value(destinationIndex)) {
                        rowType.assign(int(PLAIN_LINK))
                        val previewIndex = column("preview_url")
                        whenNotEqual(previewIndex, int(-1)) {
                            val image = value(previewIndex)
                            whenFalse(isEmpty(image)) {
                                rowType.assign(int(LINK_WITH_PREVIEW))
                                whenGfycatHost(image) { rowType.assign(int(PLAIN_LINK)) }
                            }
                        }
                    }
                }
            }
            whenEqual(rowType, int(VIDEO_LINK), fixType) otherwise {
                whenEqual(rowType, int(LINK_WITH_PREVIEW), fixType)
            }
        }

        // Cached comment threads can supply a post model without going through the media parser.
        postType.before {
            whenGfycatMedia(thisObject.field(rawUrl)) {
                val image = thisObject.call(postPreview)
                whenFalse(isEmpty(image)) {
                    returnValue(int(LINK_WITH_PREVIEW))
                }
                returnValue(int(PLAIN_LINK))
            }
        }
        for ((getter, field) in listOf(postThumbnail to thumbnail, postPreview to previewUrl)) {
            getter.before {
                whenGfycatMedia(thisObject.field(rawUrl)) {
                    whenGfycatHost(thisObject.field(field)) { returnNull() }
                }
            }
        }
    }
}
