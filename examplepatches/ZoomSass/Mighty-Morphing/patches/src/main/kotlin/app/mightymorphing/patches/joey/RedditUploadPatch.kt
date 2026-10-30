package app.mightymorphing.patches.joey

import app.mightymorphing.patches.shared.Constants.JOEY
import app.mightymorphing.patches.shared.insertAt
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.w3c.dom.Element

private val editorHostStringPatch = resourcePatch {
    compatibleWith(JOEY)

    execute {
        document("res/values/strings.xml").use { strings ->
            val nodes = strings.getElementsByTagName("string")
            var button = false
            var notice = false
            for (index in 0 until nodes.length) {
                val node = nodes.item(index) as Element
                when (node.getAttribute("name")) {
                    "select_gif" -> {
                        node.textContent = "SELECT VIDEO"
                        button = true
                    }
                    "external_media_host_tutorial" -> {
                        node.textContent = "Images and GIFs from the image button, and GIFs from the keyboard, are uploaded to Reddit. " +
                            "Video upload is not available yet."
                        notice = true
                    }
                }
            }
            if (!button || !notice) error("Joey editor upload strings were not found")
        }
        document("res/layout/editor_actions.xml").use { layout ->
            val nodes = layout.getElementsByTagName("*")
            var icon = false
            for (index in 0 until nodes.length) {
                val node = nodes.item(index) as Element
                if (!node.getAttribute("android:id").endsWith("editor_actions_gif")) continue
                val attrs = node.attributes
                for (attrIndex in 0 until attrs.length) {
                    val attr = attrs.item(attrIndex)
                    if (attr.nodeValue?.contains("animation_outline") == true) {
                        attr.nodeValue = attr.nodeValue.replace("animation_outline", "video_outline")
                        icon = true
                    }
                }
            }
            if (!icon) error("Editor video button icon was not found")
        }
    }
}

@Suppress("unused")
val redditUploadPatch = bytecodePatch(
    name = "Editor image and GIF upload",
    description = "Uploads images and GIFs to Reddit directly when adding comments. Both can be uploaded via the image button. Also adds keyboard gif auto upload to reddit (click markdown in editor (far left icon) to enable keyboard gif support).",
) {
    compatibleWith(JOEY)
    dependsOn(editorHostStringPatch)
    extendWith("extensions/extension.mpe")

    execute {
        val upload = EditorUploadFingerprint.method
        upload.insertAt(
            0,
            """
            invoke-static {p0, p1, p2}, Lapp/mightymorphing/extension/joey/EditorUpload;->still(Landroid/app/Activity;Ljava/util/List;Z)Z
            move-result v0
            if-nez v0, :morphe_editor_image
            invoke-static {p0, p1, p2}, Lapp/mightymorphing/extension/joey/EditorUpload;->clip(Landroid/app/Activity;Ljava/util/List;Z)Z
            move-result v0
            if-nez v0, :morphe_editor_image
            """,
            ExternalLabel("morphe_editor_image", upload.instructions.last()),
        )
        for (submit in listOf(CommentSubmitFingerprint.method, EditSubmitFingerprint.method)) {
            val form = submit.instructions.indexOfFirst {
                it is ReferenceInstruction && it.reference.toString().contains("f\$b;->y(Ljava/util/Map;)")
            }
            if (form < 0) error("${submit.definingClass} did not build its comment form")
            submit.insertAt(
                form,
                """
                invoke-static {p1}, Lapp/mightymorphing/extension/joey/EditorUpload;->attach(Ljava/util/Map;)V
                """,
            )
        }
        val comment = CommentSubmitFingerprint.method
        val jsonGet = comment.instructions.indexOfFirst {
            it is ReferenceInstruction && it.reference.toString().contains("JsonNode;->get(Ljava/lang/String;)")
        }
        val continueAt = comment.instructions[jsonGet + 2]
        comment.insertAt(
            jsonGet + 2,
            """
            invoke-static {p1}, Lapp/mightymorphing/extension/joey/EditorUpload;->submittedId(Ljava/lang/Object;)Ljava/lang/String;
            move-result-object v5
            if-eqz v5, :morphe_comment_id
            return-object v5
            """,
            ExternalLabel("morphe_comment_id", continueAt),
        )
        val result = ReplyResultFingerprint.method
        val handler = result.instructions.indexOfLast { it.opcode == Opcode.MOVE_EXCEPTION }
        result.insertAt(
            handler + 1,
            """
            const/4 p1, 0x0
            invoke-static {p1}, Lapp/mightymorphing/extension/joey/EditorUpload;->submittedId(Ljava/lang/Object;)Ljava/lang/String;
            move-result-object p1
            if-eqz p1, :morphe_reply_error
            return-object p1
            """,
            ExternalLabel("morphe_reply_error", result.instructions[handler + 1]),
        )
        val gifHost = upload.instructions.indexOfFirst {
            it is ReferenceInstruction && it.reference.toString().contains("EditorActivity\$k;-><init>")
        }
        upload.replaceInstruction(gifHost - 1, "new-instance v2, Lo/o/joey/Activities/EditorActivity\$m;")
        upload.replaceInstruction(
            gifHost,
            "invoke-direct {v2, p0, p1, p2}, Lo/o/joey/Activities/EditorActivity\$m;-><init>(Lo/o/joey/Activities/EditorActivity;Ljava/util/List;Z)V",
        )
        upload.replaceInstruction(
            gifHost + 1,
            "iput-object v2, p0, Lo/o/joey/Activities/EditorActivity;->W0:Lo/o/joey/Activities/EditorActivity\$m;",
        )
        upload.replaceInstruction(gifHost + 2, "invoke-static {v2}, Lzd/c;->q(Landroid/os/AsyncTask;)V")

        val picker = GifPickerFingerprint.method
        picker.insertAt(
            0,
            """
            iget-object v0, p0, Lo/o/joey/Activities/EditorActivity${'$'}e;->b:Lo/o/joey/Activities/EditorActivity;
            const-string v1, "Add GIFs via image upload, video support to be added"
            const/4 v2, 0x1
            invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
            move-result-object v0
            invoke-virtual {v0}, Landroid/widget/Toast;->show()V
            return-void
            """,
        )

        val input = EditorInputFingerprint.method
        input.insertAt(
            0,
            """
            invoke-static {p1}, Lapp/mightymorphing/extension/joey/KeyboardGif;->remember(Landroid/view/inputmethod/EditorInfo;)V
            """,
        )
        input.insertAt(
            input.instructions.lastIndex,
            """
            invoke-static {p0, p1}, Lapp/mightymorphing/extension/joey/KeyboardGif;->wrap(Landroid/view/View;Landroid/view/inputmethod/InputConnection;)Landroid/view/inputmethod/InputConnection;
            move-result-object p1
            """,
        )
    }
}
