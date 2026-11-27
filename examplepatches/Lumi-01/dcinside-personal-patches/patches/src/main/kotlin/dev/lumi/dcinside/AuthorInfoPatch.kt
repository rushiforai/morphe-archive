package dev.lumi.dcinside

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

/** Author information present in the server response, at rendering call sites only. */
@Suppress("unused")
val authorInfoPatch = bytecodePatch(
    name = "작성자 아이디·IP 정보",
    description = "앱의 Morphe 설정에서 계정 아이디와 내장 IP 대역표의 추정 정보를 표시합니다.",
    default = true,
) {
    compatibleWith(legacyFeatureCompatibility)
    dependsOn(dcInsidePersonalPatch)

    execute {
        if (classDefByOrNull("Ljl9;") != null) {
            applyRepackagedAuthorInfo()
        } else {
        val appCreate = Fingerprint(
            definingClass = "Lcom/dcinside/app/Application;",
            name = "onCreate",
            returnType = "V",
        ).method
        appCreate.addInstructions(0, """
            const/4 v0, 0x4
            invoke-static {v0}, Llocal/privacy/SettingsState;->addSupportedFeatures(I)V
        """.trimIndent())
        val target = dcTarget()
        val header = target.fingerprint(
            definingClass = "Lcom/dcinside/app/view/PostReadHeaderView;",
            name = "Y",
            parameters = listOf("Lcom/dcinside/app/model/PostInfo;", "Z", "Ljava/lang/String;"),
            returnType = "V",
        ).method
        // Both factory-created and reused headers pass through Y with their post data.
        // Insert at entry: a branch targets the final return and can skip code placed there.
        header.addInstructions(0,
            "invoke-static/range {p0 .. p1}, Llocal/privacy/AuthorInfo;->applyPostHeader(Landroid/view/View;Ljava/lang/Object;)V")

        // The app's shared author renderer appends the visible IP in parentheses.
        // Decorate its completed text so the hint follows the IP, not the nickname.
        val authorSpan = target.fingerprint(
            definingClass = "Lcom/dcinside/app/span/g;",
            name = "t",
            returnType = "Landroid/text/Spannable;",
        ).method
        val authorSpanEnd = authorSpan.implementation!!.instructions.indexOfLast { it.opcode == Opcode.RETURN_OBJECT }
        check(authorSpanEnd >= 0) { "Author span return changed" }
        authorSpan.addInstructions(authorSpanEnd, """
            invoke-static {p0, p4}, Llocal/privacy/IpInfo;->decorateRendered(Landroid/text/Spannable;Ljava/lang/String;)Landroid/text/Spannable;
            move-result-object p0
        """.trimIndent())

        listOf(
            "Lcom/dcinside/app/post/X2;" to "s0",
            "Lcom/dcinside/app/post/fragments/u0;" to "i0",
        ).forEach { (owner, name) ->
            target.fingerprint(definingClass = owner, name = name, returnType = "V")
                .method.decorateGetter("Lcom/dcinside/app/response/PostItem;", classDefBy("Lcom/dcinside/app/response/PostItem;").stringGetters("name"), "listName")
        }
        target.fingerprint(
            definingClass = "Lcom/dcinside/app/read/V\$b;", name = "d",
            parameters = listOf("Landroid/content/Context;", "Lcom/dcinside/app/response/m;"),
            returnType = "Ljava/lang/CharSequence;",
        ).method.decorateGetter("Lcom/dcinside/app/response/m;", classDefBy("Lcom/dcinside/app/response/m;").stringGetters("name"), "commentName")
        }
    }
}

/** Reviewed author renderers in the 5.3.27 repackaged app profile. */
private fun app.morphe.patcher.patch.BytecodePatchContext.applyRepackagedAuthorInfo() {
    val appCreate = Fingerprint(
        definingClass = "Lcom/dcinside/app/Application;",
        name = "onCreate",
        returnType = "V",
    ).method
    appCreate.addInstructions(0, """
        const/4 v0, 0x4
        invoke-static {v0}, Llocal/privacy/SettingsState;->addSupportedFeatures(I)V
    """.trimIndent())

    val postIdGetter = classDefBy("Lcom/dcinside/app/response/PostItem;").stringGetters("user_id").sorted().first()
    val commentClass = classDefBy("Ljl9;")
    val commentIdGetter = commentClass.stringGetters("user_id").sorted().first()
    val commentIpGetter = commentClass.stringGetters("ipData").sorted().first()
    val headerClass = classDefBy("Lcom/dcinside/app/model/PostInfo;")
    val headerIdGetter = headerClass.stringGetters("user_id").sorted().first()
    val headerIpGetter = headerClass.stringGetters("ip").sorted().first()
    appCreate.addInstructions(0, """
        const-string v0, "$postIdGetter"
        const-string v1, "$commentIdGetter"
        const-string v2, "$headerIdGetter"
        const-string v3, "$headerIpGetter"
        const-string v4, "$commentIpGetter"
        invoke-static/range {v0 .. v4}, Llocal/privacy/AuthorInfo;->configure(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    """.trimIndent())

    val postHeader = Fingerprint(
        definingClass = "Lcom/dcinside/app/view/PostReadHeaderView;",
        name = "c",
        parameters = listOf("Lcom/dcinside/app/model/PostInfo;", "Z", "Ljava/lang/String;"),
        returnType = "V",
    ).method
    postHeader.addInstructions(0,
        "invoke-static/range {p0 .. p1}, Llocal/privacy/AuthorInfo;->applyPostHeader(Landroid/view/View;Ljava/lang/Object;)V")

    val commentRenderer = Fingerprint(
        definingClass = "Lt12;",
        name = "i",
        parameters = listOf("Ljl9;", "Ljava/lang/String;", "Ljava/lang/String;", "Landroid/content/Context;"),
        returnType = "Landroid/text/SpannableStringBuilder;",
    ).method
    val commentInstructions = commentRenderer.implementation?.instructions
        ?: error("Comment author renderer has no body")
    val commentReturns = commentInstructions.indices.filter { commentInstructions[it].opcode == Opcode.RETURN_OBJECT }
    check(commentReturns.isNotEmpty()) { "Comment author renderer return changed" }
    commentReturns.asReversed().forEach { index ->
        val result = (commentInstructions[index] as? OneRegisterInstruction)?.registerA
            ?: error("Unexpected comment renderer return format")
        check(result <= 15) { "Comment renderer result register changed" }
        commentRenderer.addInstructions(index, """
            invoke-static {p0, v$result}, Llocal/privacy/AuthorInfo;->decorateCommentName(Ljava/lang/Object;Landroid/text/SpannableStringBuilder;)Landroid/text/SpannableStringBuilder;
            move-result-object v$result
        """.trimIndent())
    }

    val postNames = classDefBy("Lcom/dcinside/app/response/PostItem;").stringGetters("name")
    Fingerprint(
        definingClass = "Lc38;",
        name = "onBindViewHolder",
        parameters = listOf("Landroidx/recyclerview/widget/y;", "I"),
        returnType = "V",
    ).method.decorateGetter("Lcom/dcinside/app/response/PostItem;", postNames, "listName")

    val bodyHtml = Fingerprint(
        definingClass = "Lv22;",
        name = "b",
        parameters = emptyList(),
        returnType = "Ljava/lang/String;",
    ).method
    val htmlInstructions = bodyHtml.implementation?.instructions ?: error("Post HTML getter has no body")
    val htmlReturns = htmlInstructions.indices.filter { htmlInstructions[it].opcode == Opcode.RETURN_OBJECT }
    check(htmlReturns.isNotEmpty()) { "Post HTML getter return changed" }
    htmlReturns.asReversed().forEach { index ->
        val result = (htmlInstructions[index] as? OneRegisterInstruction)?.registerA
            ?: error("Unexpected post HTML return format")
        bodyHtml.addInstructions(index, """
            invoke-static {v$result}, Llocal/privacy/AutoImageFilter;->filter(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v$result
        """.trimIndent())
    }
}

private fun MutableMethod.decorateGetter(owner: String, getters: Set<String>, formatter: String) {
    val instructions = implementation?.instructions ?: error("$name has no bytecode")
    val calls = instructions.indices.filter { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
        reference?.definingClass == owner && reference.name in getters &&
            reference.parameterTypes.isEmpty() && index + 1 < instructions.size &&
            instructions[index + 1].opcode == Opcode.MOVE_RESULT_OBJECT
    }
    check(calls.isNotEmpty()) { "$owner author-name rendering anchor changed in $name" }
    calls.asReversed().forEach { index ->
        val receiver = (instructions[index] as? FiveRegisterInstruction)?.registerC
            ?: error("Unexpected getter invoke format")
        val nameRegister = (instructions[index + 1] as OneRegisterInstruction).registerA
        check(receiver != nameRegister && receiver <= 15 && nameRegister <= 15) {
            "Author render registers changed in $name"
        }
        addInstructions(index + 2, """
            invoke-static {v$receiver, v$nameRegister}, Llocal/privacy/AuthorInfo;->$formatter(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
            move-result-object v$nameRegister
        """.trimIndent())
    }
}
