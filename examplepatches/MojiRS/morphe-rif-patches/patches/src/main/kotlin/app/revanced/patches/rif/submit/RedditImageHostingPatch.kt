package app.revanced.patches.rif.submit

import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.revanced.patches.rif.settings.revancedSettingsPatch
import app.revanced.patches.rif.shared.RIF_COMPATIBILITY
import app.revanced.patches.rif.shared.requireScratchRegister
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element
import app.revanced.patches.rif.shared.classes
import app.revanced.patches.rif.shared.proxy

private const val EXTENSION = "Lapp/revanced/extension/rif/ImageHosting;"
private const val SUBMIT_FRAGMENT = "Lcom/andrewshu/android/reddit/submit/m;"
private const val SUBMIT_TASK = "Lcom/andrewshu/android/reddit/submit/SubmitTask;"
private const val PAIR_ARRAY = "[Landroidx/core/util/c;"
private const val URI = "Landroid/net/Uri;"

/** rif's imgur size limit (10 MiB), and ours: the most a still image is sent as is. */
private const val TEN_MB = 10485760L
private const val TWENTY_MB_HEX = "0x1400000"

// The Image ("media") tab's texts, without imgur, with the new limit and covering videos. Quoted
// values keep their quotes (aapt2 reads them as quoting).
private val STRINGS = mapOf(
    "image" to "media",
    "pick_image" to "pick media",
    "submit_image_label" to "media (hosted by Reddit)",
    "submit_image_confirmation_label" to "media hosting by Reddit",
    "submit_image_confirmation_requires_resize" to
        "\"The image size (%s bytes) is over Reddit's 20 MiB limit. RIF will upload a reduced-quality copy.\"",
    "submit_image_upload_status_success" to "uploaded.",
    "imgur_upload_error" to "Error uploading file. Please try again later.",
    "error_resizing_image" to
        "Error resizing image. Please compress your image to 20 MiB or smaller before uploading.",
    "form_validation_submit_image_toast" to "Please select an image or video to upload.",
)

private const val POST_AS_GIF_STRING = "rif_post_as_gif"
private const val POST_AS_GIF_TEXT = "post as GIF (no sound)"

private val redditImageHostingStringsPatch = resourcePatch(
    description = "Renames the Image tab to media, removes imgur from its texts and adds the post-as-GIF switch.",
) {
    compatibleWith(*RIF_COMPATIBILITY)

    execute {
        document("res/values/strings.xml").use { doc ->
            val nodes = doc.getElementsByTagName("string")
            var changed = 0
            for (i in 0 until nodes.length) {
                val node = nodes.item(i)
                val text = STRINGS[node.attributes?.getNamedItem("name")?.nodeValue] ?: continue
                node.textContent = text
                changed++
            }
            if (changed != STRINGS.size) {
                throw PatchException("expected ${STRINGS.size} Image tab strings, found $changed")
            }
            val added = doc.createElement("string")
            added.setAttribute("name", POST_AS_GIF_STRING)
            added.textContent = POST_AS_GIF_TEXT
            doc.documentElement.appendChild(added)
        }

        // The "post as GIF (no sound)" row goes under the form preview, hidden until a video is
        // chosen. It copies the look of rif's own "direct link" switch beside it.
        for (layout in listOf("res/layout/submit_fragment.xml", "res/layout-v22/submit_fragment.xml")) {
            document(layout).use { doc ->
                val previews = (0 until doc.getElementsByTagName("ImageView").length)
                    .map { doc.getElementsByTagName("ImageView").item(it) as Element }
                    .filter { it.getAttribute("android:id") == "@id/submit_image_preview" }
                if (previews.size != 1) {
                    throw PatchException("$layout: expected 1 submit_image_preview, found ${previews.size}")
                }
                val preview = previews.single()

                val row = doc.createElement("app.revanced.extension.rif.PostAsGifView")
                row.setAttribute("android:orientation", "vertical")
                row.setAttribute("android:id", "@+id/rif_post_as_gif_row")
                row.setAttribute("android:visibility", "gone")
                row.setAttribute("android:layout_width", "fill_parent")
                row.setAttribute("android:layout_height", "wrap_content")
                val switch = doc.createElement("androidx.appcompat.widget.SwitchCompat")
                switch.setAttribute("android:textSize", "12.0sp")
                switch.setAttribute("android:textColor", "?android:textColorSecondary")
                switch.setAttribute("android:layout_gravity", "end")
                switch.setAttribute("android:id", "@+id/rif_post_as_gif_switch")
                switch.setAttribute("android:layout_width", "wrap_content")
                switch.setAttribute("android:layout_height", "wrap_content")
                switch.setAttribute("android:checked", "false")
                switch.setAttribute("android:text", "@string/$POST_AS_GIF_STRING")
                switch.setAttribute("android:textAllCaps", "true")
                row.appendChild(switch)
                preview.parentNode.insertBefore(row, preview.nextSibling)
            }
        }
    }
}

private fun Method.hasString(vararg wanted: String): Boolean {
    val found = implementation?.instructions
        ?.filter { it.opcode == Opcode.CONST_STRING }
        ?.map { (it as ReferenceInstruction).reference.toString() }
        .orEmpty()
    return wanted.all { it in found }
}

private const val OAUTH2_ACTIVITY = "Lcom/andrewshu/android/reddit/login/oauth2/OAuth2Activity;"
private const val SET_UA = "Landroid/webkit/WebSettings;->setUserAgentString(Ljava/lang/String;)V"

/**
 * rif's user-agent method (free h3.d.g, Platinum's twin), found without its name or body: the Spoof
 * client patch rewrites it. OAuth2Activity (kept name) passes its result to setUserAgentString, so
 * it is the static no-arg String method invoked right before that call.
 */
private fun BytecodePatchContext.rifUserAgentMethod(): String {
    val activity = classes.firstOrNull { it.type == OAUTH2_ACTIVITY }
        ?: throw PatchException("$OAUTH2_ACTIVITY not found")
    val found = mutableSetOf<String>()
    var calls = 0
    for (m in activity.methods) {
        val code = m.implementation?.instructions?.toList() ?: continue
        for ((i, insn) in code.withIndex()) {
            if (insn.opcode != Opcode.INVOKE_VIRTUAL || (insn as ReferenceInstruction).reference.toString() != SET_UA) continue
            calls++
            // Walk back to the move-result-object that fills the argument register.
            val arg = (insn as com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction).registerD
            for (j in i - 1 downTo maxOf(0, i - 4)) {
                val mr = code[j]
                if (mr.opcode == Opcode.MOVE_RESULT_OBJECT && (mr as OneRegisterInstruction).registerA == arg && j > 0) {
                    val call = code[j - 1]
                    if (call.opcode == Opcode.INVOKE_STATIC) {
                        val ref = (call as ReferenceInstruction).reference as MethodReference
                        if (ref.parameterTypes.isEmpty() && ref.returnType == "Ljava/lang/String;") found += ref.toString()
                    }
                    break
                }
            }
        }
    }
    if (calls != 1 || found.size != 1) {
        throw PatchException("rif user-agent method: expected 1 setUserAgentString call fed by a static String method, found $calls calls, ${found.size} methods")
    }
    return found.single()
}

private fun Method.params() = parameterTypes.map { it.toString() }

// rif's imgur uploader task body (free k3.b.H / Platinum l3.b.H): protected
// H(Void[]) -> String, the only method holding both of imgur's strings.
internal val imageUploadFingerprint = fingerprint {
    custom { method, _ ->
        method.returnType == "Ljava/lang/String;" &&
            method.params() == listOf("[Ljava/lang/Void;") &&
            method.hasString("Client-ID 4d7e2f74f1a519c", "Non-OK response code: %d")
    }
}

private const val INTENT = "Landroid/content/Intent;"
private const val BITMAP = "Landroid/graphics/Bitmap;"
private const val PREVIEW_MARKER = "imageUri=%s"

// The picker's contract (androidx ActivityResultContracts.GetContent, renamed d.c in both builds):
// createIntent(Context, String) -> Intent holds the GET_CONTENT action, and nothing else does.
internal val pickerIntentFingerprint = fingerprint {
    custom { method, _ ->
        method.returnType == INTENT &&
            method.params() == listOf("Landroid/content/Context;", "Ljava/lang/String;") &&
            method.hasString("android.intent.action.GET_CONTENT")
    }
}

// rif's preview decoder (free o5.h.d, Platinum p5.h.d): static (Uri, int, int) -> Bitmap, logs "imageUri=%s".
internal val previewDecodeFingerprint = fingerprint {
    custom { method, _ ->
        method.returnType == BITMAP && method.params() == listOf(URI, "I", "I") &&
            method.hasString(PREVIEW_MARKER)
    }
}

// The same class's rotation fix-up (free o5.h.a): static (Bitmap, Uri) -> Bitmap.
internal val previewRotateFingerprint = fingerprint {
    custom { method, classDef ->
        method.returnType == BITMAP && method.params() == listOf(BITMAP, URI) &&
            AccessFlags.STATIC.isSet(method.accessFlags) &&
            classDef.methods.any { it.hasString(PREVIEW_MARKER) }
    }
}

// SubmitTask (kept class and member names in both builds): d0() builds the form parameters,
// k0(InputStream) parses the reply.
internal val submitParamsFingerprint = fingerprint {
    custom { method, classDef ->
        classDef.type == SUBMIT_TASK && method.name == "d0" && method.parameterTypes.isEmpty() &&
            method.returnType == PAIR_ARRAY
    }
}

internal val submitResponseFingerprint = fingerprint {
    custom { method, classDef ->
        classDef.type == SUBMIT_TASK && method.name == "k0" &&
            method.params() == listOf("Ljava/io/InputStream;")
    }
}

// The Submit page's "sending" overlay (free submit.m.R5 shows / c5 hides, Platinum G5 / R4): private ()V
// methods that fetch the SubmitActivity (a private getter), its overlay View, and call
// View.setVisibility with 0 (show) or 8 (hide) as the first thing they do. They are the only methods
// of the class with that opening.
private const val SUBMIT_ACTIVITY = "Lcom/andrewshu/android/reddit/submit/SubmitActivity;"
private const val SUBMIT_GUARD = "Lapp/revanced/extension/rif/SubmitGuard;"

private fun Method.isSubmitOverlayToggle(visibility: Long): Boolean {
    if (returnType != "V" || parameterTypes.isNotEmpty() || !AccessFlags.PRIVATE.isSet(accessFlags)) return false
    val code = implementation?.instructions?.take(6)?.toList() ?: return false
    if (code.size < 6) return false
    val getter = (code[0] as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    val overlay = (code[2] as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    val setVisibility = (code[5] as? ReferenceInstruction)?.reference?.toString() ?: return false
    val level = code[4] as? WideLiteralInstruction ?: return false
    return code[0].opcode == Opcode.INVOKE_DIRECT && getter.returnType == SUBMIT_ACTIVITY &&
        code[1].opcode == Opcode.MOVE_RESULT_OBJECT && (code[1] as OneRegisterInstruction).registerA == 0 &&
        code[2].opcode == Opcode.INVOKE_VIRTUAL && overlay.definingClass == SUBMIT_ACTIVITY &&
        overlay.returnType == "Landroid/view/View;" && overlay.parameterTypes.isEmpty() &&
        code[3].opcode == Opcode.MOVE_RESULT_OBJECT && (code[3] as OneRegisterInstruction).registerA == 0 &&
        (code[4].opcode == Opcode.CONST_4 || code[4].opcode == Opcode.CONST_16) &&
        (code[4] as OneRegisterInstruction).registerA == 1 && level.wideLiteral == visibility &&
        code[5].opcode == Opcode.INVOKE_VIRTUAL && setVisibility == "Landroid/view/View;->setVisibility(I)V"
}

internal val submitOverlayShowFingerprint = fingerprint {
    custom { method, classDef -> classDef.type == SUBMIT_FRAGMENT && method.isSubmitOverlayToggle(0) }
}

internal val submitOverlayHideFingerprint = fingerprint {
    custom { method, classDef -> classDef.type == SUBMIT_FRAGMENT && method.isSubmitOverlayToggle(8) }
}

// Comment media. The reply dialog (kept class name in both builds) builds its view in a method that
// hands the formatting bar its editor; the same class's onCreate reads the dialog's arguments.
private const val REPLY_DIALOG = "Lcom/andrewshu/android/reddit/comments/reply/t;"
private const val COMMENT_REPLY_TASK = "Lcom/andrewshu/android/reddit/comments/reply/CommentReplyTask;"
private const val COMMENT_MEDIA = "Lapp/revanced/extension/rif/CommentMedia;"
private const val SET_TARGET_EDIT_TEXT =
    "Lcom/andrewshu/android/reddit/comments/reply/MarkdownButtonBarView;->setTargetEditText(Landroid/widget/EditText;)V"
private const val BUNDLE = "Landroid/os/Bundle;"

// Free t.O2 / Platinum t.D2: onCreateView(LayoutInflater, ViewGroup, Bundle) -> View.
internal val replyDialogViewFingerprint = fingerprint {
    custom { method, classDef ->
        classDef.type == REPLY_DIALOG && method.returnType == "Landroid/view/View;" &&
            method.params() == listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", BUNDLE) &&
            method.implementation?.instructions?.any {
                it is ReferenceInstruction && it.reference.toString() == SET_TARGET_EDIT_TEXT
            } == true
    }
}

// Free t.K2 / Platinum t.z2: onCreate(Bundle), which reads the arguments with requireArguments().
internal val replyDialogCreateFingerprint = fingerprint {
    custom { method, classDef ->
        classDef.type == REPLY_DIALOG && method.returnType == "V" && method.params() == listOf(BUNDLE) &&
            method.hasString("parentKind", "editThingName", "editBody")
    }
}

// CommentReplyTask (kept names in both builds): d0() builds the form parameters, j0(InputStream) parses the reply.
internal val commentParamsFingerprint = fingerprint {
    custom { method, classDef ->
        classDef.type == COMMENT_REPLY_TASK && method.name == "d0" && method.parameterTypes.isEmpty() &&
            method.returnType == PAIR_ARRAY
    }
}

internal val commentResponseFingerprint = fingerprint {
    custom { method, classDef ->
        classDef.type == COMMENT_REPLY_TASK && method.name == "j0" &&
            method.params() == listOf("Ljava/io/InputStream;")
    }
}

// EditTask (kept names in both builds, shared by comment and post edits): d0() builds the form
// parameters, m0(InputStream) parses the reply.
private const val EDIT_TASK = "Lcom/andrewshu/android/reddit/comments/reply/EditTask;"
private const val COMMENT_THING = "Lcom/andrewshu/android/reddit/things/objects/CommentThing;"

internal val editParamsFingerprint = fingerprint {
    custom { method, classDef ->
        classDef.type == EDIT_TASK && method.name == "d0" && method.parameterTypes.isEmpty() &&
            method.returnType == PAIR_ARRAY
    }
}

internal val editResponseFingerprint = fingerprint {
    custom { method, classDef ->
        classDef.type == EDIT_TASK && method.name == "m0" && method.params() == listOf("Ljava/io/InputStream;")
    }
}

// Images in new text posts. The Submit screen (kept class name) builds its view in a method that hands
// the formatting bar its editor (free submit/m.O2, Platinum D2); same call as the reply dialog's.
private const val SELF_POST_MEDIA = "Lapp/revanced/extension/rif/SelfPostMedia;"

internal val selfPostViewFingerprint = fingerprint {
    custom { method, classDef ->
        classDef.type == SUBMIT_FRAGMENT && method.returnType == "Landroid/view/View;" &&
            method.params() == listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", BUNDLE) &&
            method.implementation?.instructions?.any {
                it is ReferenceInstruction && it.reference.toString() == SET_TARGET_EDIT_TEXT
            } == true
    }
}

// Post edits. The post-selftext edit dialog (free i5.f, Platinum j5.f; kept in neither name but found
// by its factory): a static (ThreadThing) -> its own class that puts "thingName", "author", "body" and
// "subreddit" in the arguments (the reply dialog's factories use "parentThingName" and so on).
private const val THREAD_THING = "Lcom/andrewshu/android/reddit/things/objects/ThreadThing;"

internal val postEditFactoryFingerprint = fingerprint {
    custom { method, classDef ->
        classDef.type != REPLY_DIALOG && AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.returnType == classDef.type && method.params() == listOf(THREAD_THING) &&
            method.hasString("thingName", "author", "body", "subreddit")
    }
}

private fun Instruction.isIsSelfString() =
    opcode == Opcode.CONST_STRING && (this as ReferenceInstruction).reference.toString() == "is_self"

private fun Instruction.isThreadBooleanGetter() = opcode == Opcode.INVOKE_VIRTUAL &&
    ((this as ReferenceInstruction).reference as MethodReference).let {
        it.definingClass == THREAD_THING && it.parameterTypes.isEmpty() && it.returnType == "Z"
    }

// ThreadThing's JSON writer (free d5.b, Platinum e5.b): `"is_self"` then the post's is-self getter
// (free l1(), Platinum m1()), whose name differs per build.
internal val threadIsSelfWriterFingerprint = fingerprint {
    strings("is_self")
    custom { method, _ ->
        val code = method.implementation?.instructions?.toList() ?: return@custom false
        code.indices.any { i -> code[i].isIsSelfString() && code.getOrNull(i + 1)?.isThreadBooleanGetter() == true }
    }
}

private fun Instruction.isLinkIdGetter() = opcode == Opcode.INVOKE_VIRTUAL &&
    ((this as ReferenceInstruction).reference as MethodReference).let {
        it.definingClass == COMMENT_THING && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;"
    }

private fun Instruction.isLinkIdString() =
    opcode == Opcode.CONST_STRING && (this as ReferenceInstruction).reference.toString() == "link_id"

// CommentThing's JSON writer (free d5.b, Platinum e5.b): `"link_id"` then the comment's link getter
// (free S(), Platinum W()), whose name differs per build.
internal val commentLinkWriterFingerprint = fingerprint {
    strings("link_id")
    custom { method, _ ->
        val code = method.implementation?.instructions?.toList() ?: return@custom false
        code.indices.any { i -> code[i].isLinkIdString() && code.getOrNull(i + 1)?.isLinkIdGetter() == true }
    }
}

private fun Instruction.isTenMb() =
    opcode == Opcode.CONST_WIDE_32 && (this as WideLiteralInstruction).wideLiteral == TEN_MB

private fun Method.hasTenMb() = implementation?.instructions?.any { it.isTenMb() } == true

private fun Method.callsNumberFormat() = implementation?.instructions?.any {
    it.opcode == Opcode.INVOKE_STATIC &&
        (it as ReferenceInstruction).reference.toString() ==
        "Ljava/text/NumberFormat;->getIntegerInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;"
} == true

/** The one method holding the 10 MiB constant that [matches]; throws on none or several. */
private fun BytecodePatchContext.tenMbMethod(
    what: String,
    matches: (Method, ClassDef) -> Boolean,
): Pair<ClassDef, MutableMethod> {
    val found = classes.flatMap { c ->
        c.methods.filter { it.hasTenMb() && matches(it, c) }.map { c to it }
    }
    if (found.size != 1) throw PatchException("$what: expected 1 match, found ${found.size}")
    val (classDef, method) = found.single()
    val mutable = proxy(classDef).mutableClass.methods.first {
        it.name == method.name && it.params() == method.params() && it.returnType == method.returnType
    }
    return classDef to mutable
}

/**
 * Index of the 10 MiB `const-wide/32` and of the `cmp-long` a few instructions later that compares
 * against it.
 */
private fun MutableMethod.tenMbCompare(): Pair<Int, Int> {
    val code = instructions.toList()
    val at = code.indexOfFirst { it.isTenMb() }
    if (at < 0) throw PatchException("$definingClass->$name: limit not found")
    val limit = (code[at] as OneRegisterInstruction).registerA
    val cmpAt = (at + 1..minOf(at + 6, code.size - 1)).firstOrNull {
        code[it].opcode == Opcode.CMP_LONG && (code[it] as ThreeRegisterInstruction).registerC == limit
    } ?: throw PatchException("$definingClass->$name: no cmp-long against the limit")
    return at to cmpAt
}

/**
 * Replaces `size > 10 MiB` with `ImageHosting.needsResize(uri, size)` ([uriInstruction] puts the Uri
 * in the limit's register first): the limit's `const-wide/32` becomes the Uri load, the `cmp-long`
 * the call, and its result takes the cmp's place for the `if-` that follows.
 */
private fun MutableMethod.useNeedsResize(uriInstruction: (limitRegister: Int) -> String) {
    val (at, cmpAt) = tenMbCompare()
    val code = instructions.toList()
    val limit = (code[at] as OneRegisterInstruction).registerA
    val cmp = code[cmpAt] as ThreeRegisterInstruction
    val size = cmp.registerB
    replaceInstruction(at, uriInstruction(limit))
    replaceInstruction(cmpAt, "invoke-static { v$limit, v$size, v${size + 1} }, $EXTENSION->needsResize(${URI}J)Z")
    addInstruction(cmpAt + 1, "move-result v${cmp.registerA}")
}

/** Raises a 10 MiB limit to 20 MiB, keeping the instruction's register. */
private fun MutableMethod.raiseLimit() {
    val at = instructions.toList().indexOfFirst { it.isTenMb() }
    val register = (instructions.toList()[at] as OneRegisterInstruction).registerA
    replaceInstruction(at, "const-wide/32 v$register, $TWENTY_MB_HEX")
}

@Suppress("unused")
val redditImageHostingPatch = bytecodePatch(
    name = "Reddit image hosting",
    description = "Allows uploading media in posts and comments directly to Reddit for hosting. " +
        "Replaces rif's broken imgur hosting.",
) {
    compatibleWith(*RIF_COMPATIBILITY)
    dependsOn(redditImageHostingStringsPatch, revancedSettingsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        // Hook 1: rif's uploader task. Its body is replaced by a call into the extension
        // (the file's Uri and Context come from the task's own fields), which returns the asset
        // URL for the URL field, or null and an error text for rif's "Upload error" dialog.
        val upload = imageUploadFingerprint.method
        val task = upload.definingClass
        val fields = imageUploadFingerprint.classDef.fields.associate { it.name to it.type }
        val wanted = mapOf("j" to "Ljava/lang/ref/WeakReference;", "k" to "J", "l" to URI, "o" to "Ljava/lang/String;")
        for ((name, type) in wanted) {
            if (fields[name] != type) throw PatchException("$task: expected field $name:$type")
        }
        requireScratchRegister(upload)
        if (upload.implementation!!.registerCount < 6) throw PatchException("too few registers in $task->${upload.name}")
        val uaMethod = rifUserAgentMethod()
        upload.addInstructions(
            0,
            """
                invoke-static { }, $uaMethod
                move-result-object v0
                invoke-static { v0 }, $EXTENSION->setUserAgent(Ljava/lang/String;)V
                iget-object v0, p0, $task->l:$URI
                iget-object v1, p0, $task->j:Ljava/lang/ref/WeakReference;
                invoke-virtual { v1 }, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;
                move-result-object v1
                check-cast v1, Landroid/content/Context;
                invoke-static { v0, v1 }, $EXTENSION->size(${URI}Landroid/content/Context;)J
                move-result-wide v2
                iput-wide v2, p0, $task->k:J
                invoke-static { p0, v0, v1 }, $EXTENSION->upload(Ljava/lang/Object;${URI}Landroid/content/Context;)Ljava/lang/String;
                move-result-object v2
                invoke-static { }, $EXTENSION->takeError()Ljava/lang/String;
                move-result-object v3
                iput-object v3, p0, $task->o:Ljava/lang/String;
                return-object v2
            """,
        )

        // Hook 1b: the Submit screen's picker offers videos as well as images.
        val picker = pickerIntentFingerprint.method
        val pickerReturns = picker.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
        if (pickerReturns.size != 1) throw PatchException("picker: expected 1 return, found ${pickerReturns.size}")
        val (pickerAt, pickerReturn) = pickerReturns.single()
        val pickerRegister = (pickerReturn as OneRegisterInstruction).registerA
        picker.addInstructions(
            pickerAt,
            """
                invoke-static { v$pickerRegister }, $EXTENSION->pickerIntent($INTENT)$INTENT
                move-result-object v$pickerRegister
            """,
        )

        // Hook 1c: rif's preview decoder only knows images. A video gets a frame (the extension
        // returns null for anything else, and rif decodes as before); rotation is skipped for
        // videos, whose frames come out upright.
        val decode = previewDecodeFingerprint.method
        requireScratchRegister(decode)
        decode.addInstructionsWithLabels(
            0,
            """
                invoke-static { p0, p1, p2 }, $EXTENSION->videoPreview(${URI}II)$BITMAP
                move-result-object v0
                if-eqz v0, :rif_original
                return-object v0
            """,
            ExternalLabel("rif_original", decode.getInstruction(0)),
        )
        val rotate = previewRotateFingerprint.method
        requireScratchRegister(rotate)
        rotate.addInstructionsWithLabels(
            0,
            """
                invoke-static { p1 }, $EXTENSION->isVideo($URI)Z
                move-result v0
                if-eqz v0, :rif_original
                return-object p0
            """,
            ExternalLabel("rif_original", rotate.getInstruction(0)),
        )

        // Hook 2: the 10 MiB checks. GIFs and videos never resize; stills resize only above 20 MiB.
        // The confirm-and-upload branch (submit fragment): size > limit means "resize".
        tenMbMethod("upload/resize branch") { m, c ->
            c.type == SUBMIT_FRAGMENT && m.params() == listOf(URI, "J") && m.returnType == "V"
        }.second.apply {
            useNeedsResize { limit -> "move-object v$limit, p1" }
            // The same branch is where the form's preview appears: show or hide the post-as-GIF row.
            addInstruction(0, "invoke-static { p1 }, $EXTENSION->mediaChosen($URI)V")
        }

        // The confirm dialog's "requires resize" warning (the dialog holds the Uri in its only Uri field).
        val (dialogClass, dialogText) = tenMbMethod("resize warning") { m, _ ->
            m.returnType == "V" && m.parameterTypes.isEmpty() && m.callsNumberFormat()
        }
        val uriFields = dialogClass.fields.filter { it.type == URI && !AccessFlags.STATIC.isSet(it.accessFlags) }
        if (uriFields.size != 1) throw PatchException("${dialogClass.type}: expected one Uri field, found ${uriFields.size}")
        dialogText.useNeedsResize { limit -> "iget-object v$limit, p0, ${dialogClass.type}->${uriFields.single().name}:$URI" }

        // The size query's state (both states open the same dialog) and the resize target.
        tenMbMethod("size state") { m, _ -> m.returnType == "V" && m.params() == listOf("Ljava/lang/Long;") }
            .second.raiseLimit()
        tenMbMethod("resize target") { m, _ ->
            m.name == "<init>" && m.parameterTypes.size == 2 && m.parameterTypes[0].toString() == URI
        }.second.raiseLimit()

        // Hook 3: kind=image for our asset URLs. Hook 12 (same returns, right after): a post with
        // picked images is uploaded and sent with the images attached through its markdown text.
        val params = submitParamsFingerprint.method
        // The post lookup after the submit needs rif's user agent too; after process death (a restored
        // Submit screen) no upload has run to hand it over, so hand it over here as well.
        requireScratchRegister(params)
        params.addInstructions(
            0,
            """
                invoke-static { }, $uaMethod
                move-result-object v0
                invoke-static { v0 }, $EXTENSION->setUserAgent(Ljava/lang/String;)V
            """,
        )
        val returns = params.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
        if (returns.isEmpty()) throw PatchException("no return in SubmitTask.d0")
        for ((index, insn) in returns.reversed()) {
            val register = (insn as OneRegisterInstruction).registerA
            params.addInstructions(
                index,
                """
                    invoke-static { v$register, p0 }, $EXTENSION->fixParams(${PAIR_ARRAY}Ljava/lang/Object;)$PAIR_ARRAY
                    move-result-object v$register
                    invoke-static { v$register, p0 }, $SELF_POST_MEDIA->submitParams(${PAIR_ARRAY}Ljava/lang/Object;)$PAIR_ARRAY
                    move-result-object v$register
                """,
            )
        }

        // Hook 16: the orientation is locked while the Submit page's "sending" overlay shows (rotating
        // then recreates the screen, and rif's cancelled send still goes out: a second tap posts twice).
        // v0 is the SubmitActivity after the getter's result (index 1); nothing writes it before.
        submitOverlayShowFingerprint.method.addInstruction(
            2,
            "invoke-static { v0 }, $SUBMIT_GUARD->lock(Landroid/app/Activity;)V",
        )
        submitOverlayHideFingerprint.method.addInstruction(
            2,
            "invoke-static { v0 }, $SUBMIT_GUARD->unlock(Landroid/app/Activity;)V",
        )

        // Hook 13: a post sent with images (hook 12 above) is edited into its flat form, with the
        // images as plain i.redd.it links, before rif reads the reply. Added before hook 4, so that
        // it runs after it: an image post's reply has no post in it until hook 4 has found the post.
        submitResponseFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p0, p1 }, $SELF_POST_MEDIA->wrapSubmitResponse(Ljava/lang/Object;Ljava/io/InputStream;)Ljava/io/InputStream;
                move-result-object p1
            """,
        )

        // Hook 4: the reply of an image post has no post in it; the extension finds the post. Runs
        // first (it is added last, at index 0).
        submitResponseFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p1 }, $EXTENSION->wrapResponse(Ljava/io/InputStream;)Ljava/io/InputStream;
                move-result-object p1
            """,
        )

        // Hook 11: images in text posts. The Submit screen's view method, right after the formatting
        // bar got its editor: the extension adds the button after the bar's link button.
        val submitView = selfPostViewFingerprint.method
        val submitCode = submitView.instructions.toList()
        val submitTargetAt = submitCode.indexOfFirst {
            it is ReferenceInstruction && it.reference.toString() == SET_TARGET_EDIT_TEXT
        }
        if (submitTargetAt < 0) throw PatchException("submit screen: setTargetEditText call not found")
        val submitTarget = submitCode[submitTargetAt] as FiveRegisterInstruction
        submitView.addInstructions(
            submitTargetAt + 1,
            """
                invoke-static { p0, v${submitTarget.registerC}, v${submitTarget.registerD} }, $COMMENT_MEDIA->onSubmitScreen(Ljava/lang/Object;Landroid/view/View;Landroid/widget/EditText;)V
            """,
        )

        // Hook 5: images in comment replies. The reply dialog's view method, right after the
        // formatting bar got its editor: the extension adds the button and gets the dialog's
        // arguments (requireArguments, whose obfuscated name is read from the same class's onCreate).
        val dialogView = replyDialogViewFingerprint.method
        requireScratchRegister(dialogView)
        val dialogCode = dialogView.instructions.toList()
        val setTargetAt = dialogCode.indexOfFirst {
            it is ReferenceInstruction && it.reference.toString() == SET_TARGET_EDIT_TEXT
        }
        if (setTargetAt < 0) throw PatchException("reply dialog: setTargetEditText call not found")
        val setTarget = dialogCode[setTargetAt] as FiveRegisterInstruction
        val barRegister = setTarget.registerC
        val editorRegister = setTarget.registerD
        if (barRegister == 0 || editorRegister == 0) throw PatchException("reply dialog: v0 holds the bar or the editor")
        val requireArguments = replyDialogCreateFingerprint.method.instructions.toList()
            .filter { it.opcode == Opcode.INVOKE_VIRTUAL }
            .map { (it as ReferenceInstruction).reference as MethodReference }
            .first { it.parameterTypes.isEmpty() && it.returnType == BUNDLE }
        dialogView.addInstructions(
            setTargetAt + 1,
            """
                invoke-static { }, $uaMethod
                move-result-object v0
                invoke-static { v0 }, $EXTENSION->setUserAgent(Ljava/lang/String;)V
                invoke-virtual { p0 }, $requireArguments
                move-result-object v0
                invoke-static { p0, v$barRegister, v$editorRegister, v0 }, $COMMENT_MEDIA->onReplyDialog(Ljava/lang/Object;Landroid/view/View;Landroid/widget/EditText;$BUNDLE)V
            """,
        )

        // Hook 6: CommentReplyTask.d0, before each return: a comment with a picked image is uploaded
        // and sent as rich text; any other comment's parameters are returned as they are.
        val commentParams = commentParamsFingerprint.method
        requireScratchRegister(commentParams)
        val commentReturns = commentParams.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
        if (commentReturns.isEmpty()) throw PatchException("no return in CommentReplyTask.d0")
        for ((index, insn) in commentReturns.reversed()) {
            val register = (insn as OneRegisterInstruction).registerA
            commentParams.addInstructions(
                index,
                """
                    invoke-static { v$register, p0 }, $COMMENT_MEDIA->commentParams(${PAIR_ARRAY}Ljava/lang/Object;)$PAIR_ARRAY
                    move-result-object v$register
                """,
            )
        }
        commentParams.addInstructions(
            0,
            """
                invoke-static { }, $uaMethod
                move-result-object v0
                invoke-static { v0 }, $EXTENSION->setUserAgent(Ljava/lang/String;)V
            """,
        )

        // Hook 7: CommentReplyTask.j0 at entry: Reddit's reply to a rich-text comment is wrapped as rif expects.
        commentResponseFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p0, p1 }, $COMMENT_MEDIA->wrapCommentResponse(Ljava/lang/Object;Ljava/io/InputStream;)Ljava/io/InputStream;
                move-result-object p1
            """,
        )

        // Hook 8: comment edits. The edit factories of the reply dialog (free w5/x5, Platinum l5/m5)
        // put the edited comment's name in the arguments; right after that, its post's name goes in
        // too, so the send can look the comment up. The key register of that putString is free
        // there: the next statement loads its own key (both builds).
        val linkCode = commentLinkWriterFingerprint.method.instructions.toList()
        val linkGetter = linkCode.indices
            .first { linkCode[it].isLinkIdString() && linkCode.getOrNull(it + 1)?.isLinkIdGetter() == true }
            .let { (linkCode[it + 1] as ReferenceInstruction).reference as MethodReference }
        val editFactories = replyDialogCreateFingerprint.classDef.methods.filter { m ->
            AccessFlags.STATIC.isSet(m.accessFlags) && m.parameterTypes.any { it.toString() == COMMENT_THING } &&
                m.hasString("editThingName")
        }
        if (editFactories.size != 2) throw PatchException("reply dialog: ${editFactories.size} edit factories, expected 2")
        for (factory in editFactories) {
            val code = factory.instructions.toList()
            val keyAt = code.indexOfFirst {
                it.opcode == Opcode.CONST_STRING && (it as ReferenceInstruction).reference.toString() == "editThingName"
            }
            val getName = code.getOrNull(keyAt + 1)
            val put = code.getOrNull(keyAt + 3)
            val ok = getName is ReferenceInstruction && getName.opcode == Opcode.INVOKE_VIRTUAL &&
                (getName.reference as MethodReference).name == "getName" &&
                put is ReferenceInstruction && (put.reference as MethodReference).name == "putString"
            if (!ok) throw PatchException("reply dialog ${factory.name}: editThingName put not as expected")
            val comment = (getName as FiveRegisterInstruction).registerC
            val putRegs = put as FiveRegisterInstruction
            val bundle = putRegs.registerC
            val free = putRegs.registerD
            if (free == bundle || free == comment) throw PatchException("reply dialog ${factory.name}: no free register")
            factory.addInstructions(
                keyAt + 4,
                """
                    invoke-virtual { v$comment }, $linkGetter
                    move-result-object v$free
                    invoke-static { v$bundle, v$free }, $COMMENT_MEDIA->putEditLink(${BUNDLE}Ljava/lang/String;)V
                """,
            )
        }

        // Hook 9: EditTask.d0, before each return: comment edits keep, add or replace their image
        // (post edits, t3_, and edits without media go out as they are).
        val editParams = editParamsFingerprint.method
        requireScratchRegister(editParams)
        val editReturns = editParams.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
        if (editReturns.isEmpty()) throw PatchException("no return in EditTask.d0")
        for ((index, insn) in editReturns.reversed()) {
            val register = (insn as OneRegisterInstruction).registerA
            editParams.addInstructions(
                index,
                """
                    invoke-static { v$register, p0 }, $COMMENT_MEDIA->editParams(${PAIR_ARRAY}Ljava/lang/Object;)$PAIR_ARRAY
                    move-result-object v$register
                """,
            )
        }
        editParams.addInstructions(
            0,
            """
                invoke-static { }, $uaMethod
                move-result-object v0
                invoke-static { v0 }, $EXTENSION->setUserAgent(Ljava/lang/String;)V
            """,
        )

        // Hook 14: the post-selftext edit dialog's onCreateView, right after the formatting bar got
        // its editor: the extension adds the image button (for every kind of post) and gets the
        // arguments (getArguments, whose obfuscated name is read from the same class's onCreate).
        val postDialog = postEditFactoryFingerprint.classDef
        val postView = postDialog.methods.filter { m ->
            m.returnType == "Landroid/view/View;" &&
                m.params() == listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", BUNDLE) &&
                m.implementation?.instructions?.any {
                    it is ReferenceInstruction && it.reference.toString() == SET_TARGET_EDIT_TEXT
                } == true
        }.also { if (it.size != 1) throw PatchException("post edit dialog: ${it.size} view methods, expected 1") }.single()
        requireScratchRegister(postView)
        val postViewCode = postView.instructions.toList()
        val postTargetAt = postViewCode.indexOfFirst {
            it is ReferenceInstruction && it.reference.toString() == SET_TARGET_EDIT_TEXT
        }
        val postTarget = postViewCode[postTargetAt] as FiveRegisterInstruction
        if (postTarget.registerC == 0 || postTarget.registerD == 0) throw PatchException("post edit dialog: v0 holds the bar or the editor")
        val postArguments = postDialog.methods.single { m ->
            m.returnType == "V" && m.params() == listOf(BUNDLE) && m.hasString("thingName", "author", "body", "subreddit")
        }.instructions.toList()
            .filter { it.opcode == Opcode.INVOKE_VIRTUAL }
            .map { (it as ReferenceInstruction).reference as MethodReference }
            .first { it.parameterTypes.isEmpty() && it.returnType == BUNDLE }
        postView.addInstructions(
            postTargetAt + 1,
            """
                invoke-virtual { p0 }, $postArguments
                move-result-object v0
                invoke-static { p0, v${postTarget.registerC}, v${postTarget.registerD}, v0 }, $COMMENT_MEDIA->onPostEditDialog(Ljava/lang/Object;Landroid/view/View;Landroid/widget/EditText;$BUNDLE)V
            """,
        )

        // Hook 10: EditTask.m0 at entry: Reddit's reply to a post edit with images, and to a rich-text
        // comment edit, is handled (and wrapped as rif expects).
        editResponseFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p0, p1 }, $COMMENT_MEDIA->wrapCommentResponse(Ljava/lang/Object;Ljava/io/InputStream;)Ljava/io/InputStream;
                move-result-object p1
            """,
        )

        // Outdated warnings (link and image posts take body text, and edits of it save).
        // Hint on the Submit page: "text on link/image posts cannot be edited after submission".
        // Its method shows the hint when the body is not empty; with every isEmpty() answered
        // "empty" it only runs the branch that hides the hint.
        val hintMethods = classes.filter { it.type == SUBMIT_FRAGMENT }.flatMap { c ->
            c.methods.filter { it.isSubmitHintMethod() }
        }
        if (hintMethods.size != 1) throw PatchException("submit hint method: expected 1 match, found ${hintMethods.size}")
        val hint = proxy(classes.first { it.type == SUBMIT_FRAGMENT }).mutableClass.methods.first {
            it.name == hintMethods.single().name && it.params() == hintMethods.single().params()
        }
        val hintCode = hint.instructions.toList()
        val emptyChecks = hintCode.indices.filter { hintCode[it].isTextUtilsIsEmpty() }
        if (emptyChecks.size != 2) throw PatchException("submit hint method: expected 2 isEmpty calls, found ${emptyChecks.size}")
        for (at in emptyChecks.reversed()) {
            val result = hintCode.getOrNull(at + 1)
            if (result == null || result.opcode != Opcode.MOVE_RESULT) throw PatchException("submit hint method: isEmpty result not moved")
            hint.addInstruction(at + 2, "const/16 v${(result as OneRegisterInstruction).registerA}, 0x1")
        }

        // Popup on Edit for link, image and video posts ("Edit anyway?"): the edit menu item opens the
        // edit dialog directly when the post is a self post; the is-self answer there is made "true".
        val isSelfCode = threadIsSelfWriterFingerprint.method.instructions.toList()
        val isSelfGetter = isSelfCode.indices
            .first { isSelfCode[it].isIsSelfString() && isSelfCode.getOrNull(it + 1)?.isThreadBooleanGetter() == true }
            .let { (isSelfCode[it + 1] as ReferenceInstruction).reference.toString() }
        // (free n2.j.J2, Platinum o2.j.y2: the comments screen's onContextItemSelected; the only
        // (MenuItem) -> boolean method that calls the is-self getter.)
        val menuHandlers = classes.flatMap { c ->
            c.methods.filter { m ->
                m.returnType == "Z" && m.params() == listOf("Landroid/view/MenuItem;") &&
                    m.implementation?.instructions?.any { it.isCall(isSelfGetter) } == true
            }.map { c to it }
        }
        if (menuHandlers.size != 1) throw PatchException("edit menu handler: expected 1 match, found ${menuHandlers.size}")
        val (menuClass, menuMethod) = menuHandlers.single()
        val menu = proxy(menuClass).mutableClass.methods.first {
            it.name == menuMethod.name && it.params() == menuMethod.params()
        }
        val menuCode = menu.instructions.toList()
        val selfCalls = menuCode.indices.filter { menuCode[it].isCall(isSelfGetter) }
        if (selfCalls.size != 1) throw PatchException("edit menu handler: expected 1 is-self call, found ${selfCalls.size}")
        val selfResult = menuCode.getOrNull(selfCalls.single() + 1)
        if (selfResult == null || selfResult.opcode != Opcode.MOVE_RESULT) throw PatchException("edit menu handler: is-self result not moved")
        menu.addInstruction(selfCalls.single() + 2, "const/16 v${(selfResult as OneRegisterInstruction).registerA}, 0x1")
    }
}

private fun Instruction.isTextUtilsIsEmpty() = opcode == Opcode.INVOKE_STATIC &&
    (this as ReferenceInstruction).reference.toString() == "Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z"

private fun Instruction.isCall(method: String) =
    (opcode == Opcode.INVOKE_VIRTUAL || opcode == Opcode.INVOKE_VIRTUAL_RANGE) &&
        (this as ReferenceInstruction).reference.toString() == method

// The Submit page's hint method (free submit/m.Z5, Platinum's twin): no parameters, shows or hides the
// "cannot be edited after submission" TextView from the tab ("link" / "image") and the body field.
private fun Method.isSubmitHintMethod(): Boolean {
    if (returnType != "V" || parameterTypes.isNotEmpty() || !hasString("link", "image")) return false
    val code = implementation?.instructions?.toList() ?: return false
    return code.count { it.isTextUtilsIsEmpty() } == 2 &&
        code.any { it.opcode == Opcode.INVOKE_VIRTUAL && (it as ReferenceInstruction).reference.toString() == "Landroid/widget/TextView;->setText(I)V" }
}
