package app.mightymorphing.patches.joey

import app.mightymorphing.patches.shared.Constants.JOEY
import app.mightymorphing.patches.shared.indexOfReference
import app.mightymorphing.patches.shared.indexOfString
import app.mightymorphing.patches.shared.insertAt
import app.mightymorphing.patches.shared.writeBody
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import org.w3c.dom.Element

private const val TEMPORARY_AUTH = """
    new-instance p1, Lokhttp3/Request${'$'}Builder;
    invoke-direct {p1}, Lokhttp3/Request${'$'}Builder;-><init>()V
    const-string v1, "https://api.redgifs.com/v2/auth/temporary"
    invoke-virtual {p1, v1}, Lokhttp3/Request${'$'}Builder;->url(Ljava/lang/String;)Lokhttp3/Request${'$'}Builder;
    move-result-object p1
    const-string v1, "GET"
    const/4 v3, 0x0
    invoke-virtual {p1, v1, v3}, Lokhttp3/Request${'$'}Builder;->method(Ljava/lang/String;Lokhttp3/RequestBody;)Lokhttp3/Request${'$'}Builder;
    move-result-object p1
    const-string v1, "user-agent"
    const-string v3, "Joey"
    invoke-virtual {p1, v1, v3}, Lokhttp3/Request${'$'}Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request${'$'}Builder;
    move-result-object p1
"""

private const val TOKEN_FIELD = """
    const-string v0, "token"
    filled-new-array {v0}, [Ljava/lang/String;
    move-result-object v0
    invoke-static {p1, v0}, Lzd/e;->l(Lcom/fasterxml/jackson/databind/JsonNode;[Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JsonNode;
    move-result-object p1
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/JsonNode;->asText()Ljava/lang/String;
    move-result-object p1
    return-object p1
"""

private const val EXPIRY = """
    const-string v0, "expires_in"
    filled-new-array {v0}, [Ljava/lang/String;
    move-result-object v0
    invoke-static {p1, v0}, Lzd/e;->l(Lcom/fasterxml/jackson/databind/JsonNode;[Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JsonNode;
    move-result-object p1
    if-nez p1, :has_expiry
    const-wide/32 v0, 0x15180
    return-wide v0
    :has_expiry
    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/JsonNode;->asLong()J
    move-result-wide v0
    return-wide v0
"""

private const val MEDIA_URL = """
    const/4 v0, 0x0
    if-nez p1, :cond_0
    return-object v0
    :cond_0
    const-string v1, "hd"
    const-string v2, "urls"
    filled-new-array {v2, v1}, [Ljava/lang/String;
    move-result-object v1
    invoke-static {p1, v1}, Lzd/e;->l(Lcom/fasterxml/jackson/databind/JsonNode;[Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JsonNode;
    move-result-object v1
    if-nez v1, :cond_1
    const-string v1, "sd"
    filled-new-array {v2, v1}, [Ljava/lang/String;
    move-result-object v1
    invoke-static {p1, v1}, Lzd/e;->l(Lcom/fasterxml/jackson/databind/JsonNode;[Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JsonNode;
    move-result-object v1
    :cond_1
    if-eqz v1, :cond_2
    invoke-static {}, Lzd/j;->c()Lzd/j;
    move-result-object p1
    invoke-virtual {v1}, Lcom/fasterxml/jackson/databind/JsonNode;->asText()Ljava/lang/String;
    move-result-object v0
    const-string v2, "-silent"
    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I
    move-result v2
    if-ltz v2, :keep_url
    const/4 v3, 0x0
    invoke-virtual {v0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v0
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v0, ".mp4"
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0
    :keep_url
    invoke-virtual {p1, v0}, Lzd/j;->e(Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1
    invoke-static {p1}, Lod/a;->i(Ljava/lang/String;)V
    return-object p1
    :cond_2
    return-object v0
"""

private const val RESOLVE_AGAIN = """
    invoke-virtual {p0, p1, p2}, Lod/b;->c(Ljava/lang/String;Z)Lcom/fasterxml/jackson/databind/JsonNode;
    move-result-object v0
    invoke-direct {p0, v0}, Lod/b;->m(Lcom/fasterxml/jackson/databind/JsonNode;)Ljava/lang/String;
    move-result-object v0
    if-nez v0, :rgif_ok
    const/4 v1, 0x1
    invoke-direct {p0, v1}, Lod/b;->u(Z)Z
    invoke-direct {p0, p1}, Lod/b;->e(Ljava/lang/String;)Lcom/fasterxml/jackson/databind/JsonNode;
    move-result-object v0
    invoke-direct {p0, v0}, Lod/b;->m(Lcom/fasterxml/jackson/databind/JsonNode;)Ljava/lang/String;
    move-result-object v0
    :rgif_ok
    return-object v0
"""

private const val ID_CLEANUP = """
    const/16 v3, 0x3f
    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(I)I
    move-result v3
    if-ltz v3, :rgif_no_query
    const/4 v4, 0x0
    invoke-virtual {p1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object p1
    :rgif_no_query
    const/16 v3, 0x23
    invoke-virtual {p1, v3}, Ljava/lang/String;->indexOf(I)I
    move-result v3
    if-ltz v3, :rgif_no_hash
    const/4 v4, 0x0
    invoke-virtual {p1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object p1
    :rgif_no_hash
    const-string v3, "-silent.mp4"
    invoke-virtual {p1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :rgif_try_mp4
    invoke-virtual {p1}, Ljava/lang/String;->length()I
    move-result v4
    const/16 v3, 0xb
    sub-int/2addr v4, v3
    const/4 v3, 0x0
    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object p1
    goto :rgif_id_ready
    :rgif_try_mp4
    const-string v3, ".mp4"
    invoke-virtual {p1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
    move-result v4
    if-eqz v4, :rgif_id_ready
    invoke-virtual {p1}, Ljava/lang/String;->length()I
    move-result v4
    const/4 v3, 0x4
    sub-int/2addr v4, v3
    const/4 v3, 0x0
    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object p1
    :rgif_id_ready
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    move-result-object p1
"""

private const val REJECT_SILENT = """
    if-eqz p1, :rgif_play
    const-string v3, "-silent"
    invoke-virtual {p1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v3
    if-eqz v3, :rgif_play
    const/4 p1, 0x0
    aput-object p1, v0, v2
    """

private const val SKIP_SILENT_DIRECT = """
    if-eqz v0, :not_direct
    const-string v1, "-silent"
    invoke-virtual {p0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v1
    if-nez v1, :not_direct
"""

private val redgifsStringPatch = resourcePatch {
    compatibleWith(JOEY)

    execute {
        // Decoded from the original string: /silent.mp4. The replacement decodes to -silent.
        document("res/values/strings.xml").use { strings ->
            val nodes = strings.getElementsByTagName("string")
            var found = false
            for (index in 0 until nodes.length) {
                val node = nodes.item(index) as Element
                if (node.getAttribute("name") == "srg") {
                    node.textContent = "LXNpbGVudA=="
                    found = true
                }
            }
            if (!found) {
                error("Joey string srg was not in res/values/strings.xml")
            }
        }
    }
}

@Suppress("unused")
val redgifsWithSoundPatch = bytecodePatch(
    name = "RedGifs with sound",
    description = "RedGifs clips play with their sound, in HD when it's available.",
) {
    compatibleWith(JOEY)
    dependsOn(redgifsStringPatch)

    execute {
        val auth = RedgifsAuthFingerprint.method
        val form = auth.indexOfString("application/x-www-form-urlencoded")
        val post = auth.indexOfReference("->post(")
        auth.removeInstructions(form, post + 2 - form)
        auth.insertAt(form, TEMPORARY_AUTH)

        // .locals 1 plus this and the json parameter.
        writeBody(RedgifsTokenFieldFingerprint.method, 3, TOKEN_FIELD)
        // .locals 2 plus this and the json parameter.
        writeBody(RedgifsExpiryFingerprint.method, 4, EXPIRY)
        // .locals 4 plus this and the json parameter.
        writeBody(RedgifsUrlFingerprint.method, 6, MEDIA_URL)
        // .locals 2 plus this, the id, and the boolean.
        writeBody(RedgifsResolveFingerprint.method, 5, RESOLVE_AGAIN)

        val identifier = RedgifsIdFingerprint.method
        val prefs = identifier.indexOfReference("->f1(")
        var settings = prefs
        while (settings > 0 && !identifier.instructions[settings].let { instruction ->
                instruction is com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction &&
                    instruction.reference.toString().contains("->D0(")
            }
        ) {
            settings -= 1
        }
        identifier.insertAt(settings, ID_CLEANUP)

        val play = identifier.indexOfReference("Lye/l;->C(")
        identifier.insertAt(
            play,
            REJECT_SILENT,
            ExternalLabel("rgif_play", identifier.instructions[play]),
        )

        val direct = RedgifsDirectFingerprint.method
        val videoCheck = direct.indexOfReference("Lye/l;->s(")
        var branch = videoCheck
        while (direct.instructions[branch].opcode != com.android.tools.smali.dexlib2.Opcode.IF_EQZ) {
            branch += 1
        }
        val otherHosts = direct.indexOfString("gfycat.com")
        direct.insertAt(
            branch,
            SKIP_SILENT_DIRECT,
            ExternalLabel("not_direct", direct.instructions[otherHosts]),
        )

        val preview = RedditPreviewFingerprint.method
        val submission = preview.indexOfReference("Lu7/d;->n(")
        preview.insertAt(
            submission,
            """
            invoke-static {p0}, Ls9/a;->b(Lnet/dean/jraw/models/Submission;)Ls9/a${'$'}a;
            move-result-object v1
            sget-object v2, Ls9/a${'$'}a;->r:Ls9/a${'$'}a;
            if-ne v1, v2, :rgif_keep
            return-object v0
            """,
            ExternalLabel("rgif_keep", preview.instructions[submission]),
        )
    }
}
