package app.afterglow.patches.menus

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.addMethod
import app.afterglow.patches.shared.invokeRegisters
import app.afterglow.patches.shared.smali
import app.afterglow.patches.shared.writtenRegisters
import app.afterglow.patches.video.videoStatePatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.youtube.video.information.videoInformationPatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val HEADER = "$EXTENSION_PACKAGE/menus/DescriptionHeaderHost;"
private const val ACTIONS = "$EXTENSION_PACKAGE/menus/DescriptionHeaderActions;"
private const val SOURCE = "$EXTENSION_PACKAGE/menus/DescriptionHeaderSource;"
private const val ROUTES = "Lapp/morphe/extension/youtube/patches/utils/requests/ChannelIdRoutes;"
private const val ROUTE = "Lapp/morphe/extension/shared/requests/Route\$CompiledRoute;"

internal val descriptionHeaderResourcePatch = resourcePatch {
    execute {
        document("res/values/ids.xml").use { document ->
            for (name in listOf("afterglow_description_header", "afterglow_description_content_panel", "afterglow_description_content_title"))
                document.documentElement.appendChild(document.createElement("item").apply {
                    setAttribute("type", "id"); setAttribute("name", name)
                })
        }
    }
}

/** Explicit Description-header actions, independent of text selection and Morphe Copy text. */
internal val descriptionHeaderHookPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(videoStatePatch, videoInformationPatch, descriptionHeaderResourcePatch, descriptionContentHookPatch)
    execute {
        // Header identity is supplied by the currently owning panel, never by translated text.
        Fingerprint(definingClass = "Lakhj;", name = "s", parameters = listOf("Lbfgr;", "Z"), returnType = "V",
            filters = listOf(methodCall(smali = "Lakhh;->M()Ljava/lang/String;"),
                methodCall(smali = "Lamav;->b(Langf;Lbhmm;Lbfcw;Ljava/lang/String;)Lakiz;"),
                fieldAccess(smali = "Lakhj;->g:Lakif;", opcode = Opcode.IPUT_OBJECT),
                methodCall(smali = "Lakjr;->A(Ljava/lang/String;)V"))).method
        Fingerprint(definingClass = "Lakhh;", name = "M", parameters = emptyList(), returnType = "Ljava/lang/String;",
            filters = listOf(fieldAccess(smali = "Lakhh;->p:Lbfgs;"), methodCall(smali = "Lajoz;->bJ(Lbfgs;)Ljava/lang/String;"))).method
        Fingerprint(definingClass = "Lakhj;", name = "nD", parameters = listOf("Lbdso;"), returnType = "V",
            filters = listOf(fieldAccess(smali = "Lakhj;->g:Lakif;"),
                methodCall(smali = "Lakif;->l(Lakii;)V"), methodCall(smali = "Lakif;->r(Lakhj;)V"))).method
        Fingerprint(definingClass = "Lajoz;", name = "bJ", parameters = listOf("Lbfgs;"), returnType = "Ljava/lang/String;",
            filters = listOf(fieldAccess(smali = "Lbfgs;->e:I"), fieldAccess(smali = "Lbfgs;->f:Ljava/lang/Object;"),
                fieldAccess(smali = "Lbfgm;->d:Ljava/lang/String;"))).method
        Fingerprint(definingClass = "Lakhh;", name = "l", parameters = listOf("Lbfgs;", "Lbhmm;", "Lautw;"), returnType = "V",
            filters = listOf(fieldAccess(smali = "Lakhh;->p:Lbfgs;", opcode = Opcode.IPUT_OBJECT))).method

        for ((type, ownerField, rootField, rootType) in listOf(
            listOf("Lakiz;", "d", "k", "Landroid/view/ViewGroup;"),
            listOf("Lakjr;", "m", "F", "Landroid/widget/LinearLayout;")
        )) {
            val header = mutableClassDefBy(type)
            require("Lakif;" in header.interfaces && HEADER !in header.interfaces
                    && header.fields.any { it.name == ownerField && it.type == "Lakhj;" }
                    && header.fields.any { it.name == rootField && it.type == rootType }) { "Description header structure changed: $type" }
            val bindOwner = Fingerprint(definingClass = type, name = "r", parameters = listOf("Lakhj;"), returnType = "V",
                filters = listOf(fieldAccess(smali = "$type->$ownerField:Lakhj;", opcode = Opcode.IPUT_OBJECT))).method
            require(bindOwner.implementation!!.instructions.size == 2 && bindOwner.implementation!!.registerCount == 2)
            header.interfaces.add(HEADER)
            header.addMethod("afterglow_descriptionRoot", "Landroid/view/View;", 2, """
                iget-object v0, p0, $type->$rootField:$rootType
                return-object v0
            """)
            header.addMethod("afterglow_descriptionPanel", "Ljava/lang/Object;", 3, """
                iget-object v0, p0, $type->$ownerField:Lakhj;
                if-eqz v0, :none
                iget-object v1, v0, Lakhj;->g:Lakif;
                if-ne v1, p0, :none
                iget-object v0, v0, Lakhh;->p:Lbfgs;
                return-object v0
                :none
                const/4 v0, 0x0
                return-object v0
            """)
            header.addMethod("afterglow_descriptionPanelId", "Ljava/lang/String;", 2, """
                invoke-virtual { p0 }, $type->afterglow_descriptionPanel()Ljava/lang/Object;
                move-result-object v0
                check-cast v0, Lbfgs;
                if-eqz v0, :none
                invoke-static { v0 }, Lajoz;->bJ(Lbfgs;)Ljava/lang/String;
                move-result-object v0
                return-object v0
                :none
                const/4 v0, 0x0
                return-object v0
            """)
            bindOwner.addInstructionsAtControlFlowLabel(1, "invoke-static { p0 }, $ACTIONS->bind($HEADER)V")
        }
        val modern = Fingerprint(definingClass = "Lakiz;", name = "b", parameters = emptyList(), returnType = "Landroid/view/View;",
            filters = listOf(methodCall(smali = "Lakiz;->t()V"), fieldAccess(smali = "Lakiz;->k:Landroid/view/ViewGroup;"))).match()
        require(modern.method.implementation!!.registerCount == 1 && modern.instructionMatches[0].index == 0
                && modern.instructionMatches[1].index == 1) { "Modern header return register changed" }
        Fingerprint(definingClass = "Lakiz;", name = "t", parameters = emptyList(), returnType = "V",
            filters = listOf(literal(0x7f0e023d), methodCall(smali = "Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;"),
                fieldAccess(smali = "Lakiz;->k:Landroid/view/ViewGroup;", opcode = Opcode.IPUT_OBJECT))).method
        modern.method.addInstructions(1, "invoke-static { p0 }, $ACTIONS->bind($HEADER)V")

        val legacy = Fingerprint(definingClass = "Lakjr;", name = "c", parameters = listOf("Landroid/content/Context;"), returnType = "Landroid/view/View;",
            filters = listOf(methodCall(smali = "Lakjr;->H(Landroid/content/Context;)V"), methodCall(smali = "Lakjr;->M(Lbfgy;)V"))).match()
        val legacyIndex = legacy.instructionMatches.last().index + 1
        val legacyCode = legacy.method.implementation!!.instructions.toList()
        val receiver = legacy.method.implementation!!.registerCount - 2
        require(legacyCode[legacyIndex].opcode == Opcode.IGET_OBJECT
                && (legacyCode[legacyIndex] as ReferenceInstruction).reference.toString() == "Lakjr;->F:Landroid/widget/LinearLayout;"
                && legacyCode.take(legacyIndex).none { receiver in it.writtenRegisters }) { "Legacy header receiver changed" }
        legacy.method.addInstructions(legacyIndex, "invoke-static { p0 }, $ACTIONS->bind($HEADER)V")

        // Native Android VideoDetails contains title/id, but no shortDescription field.
        // Capture a paired native title at Morphe's existing current-response observer.
        for ((method, field) in listOf("M" to "c", "L" to "d")) {
            Fingerprint(definingClass = "Lalfm;", name = method, parameters = emptyList(), returnType = "Ljava/lang/String;",
                filters = listOf(fieldAccess(smali = "Lalfm;->a:Lbhad;"), fieldAccess(smali = "Lbhad;->g:Lbhah;"),
                    fieldAccess(smali = "Lbhah;->$field:Ljava/lang/String;"))).method
        }
        val observer = Fingerprint(definingClass = "Lastx;", name = "setChannelInformation", parameters = listOf("Lalfi;"), returnType = "V",
            filters = listOf(methodCall(smali = "Lalfi;->L()Ljava/lang/String;"),
                methodCall(smali = "Lapp/morphe/extension/youtube/patches/VideoInformation;->setVideoTitle(Ljava/lang/String;)V"))).method
        val source = mutableClassDefBy(SOURCE)
        source.methods.add(ImmutableMethod(SOURCE, "afterglow_observeDescriptionTitle",
            listOf(ImmutableMethodParameter("Lalfi;", null, null)), "V", AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null, null, MutableMethodImplementation(3)).toMutable().apply { addInstructions(0, """
                invoke-interface { p0 }, Lalfi;->M()Ljava/lang/String;
                move-result-object v0
                invoke-interface { p0 }, Lalfi;->L()Ljava/lang/String;
                move-result-object v1
                invoke-static { v0, v1 }, $SOURCE->rememberTitle(Ljava/lang/String;Ljava/lang/String;)V
                return-void
            """) })
        observer.addInstructions(0, "invoke-static/range { p1 .. p1 }, $SOURCE->afterglow_observeDescriptionTitle(Lalfi;)V")

        // Reuse the exact existing request policy; do not start downloader extraction or copy display text.
        val routes = classDefBy(ROUTES)
        require(routes.fields.any { it.name == "GET_CHANNEL_ID" && it.type == ROUTE && AccessFlags.PUBLIC.isSet(it.accessFlags) }
                && routes.methods.any { it.name == "createBody" && it.parameterTypes == listOf("Ljava/lang/String;") && it.returnType == "[B" && AccessFlags.PUBLIC.isSet(it.accessFlags) }
                && routes.methods.any { it.name == "getConnection" && it.parameterTypes == listOf(ROUTE) && it.returnType == "Ljava/net/HttpURLConnection;" && AccessFlags.PUBLIC.isSet(it.accessFlags) }) {
            "Pinned Morphe player metadata transport changed"
        }
        for ((name, body) in listOf(
            "nativeRequestBody" to """
                invoke-static/range { p0 .. p0 }, $ROUTES->createBody(Ljava/lang/String;)[B
                move-result-object p0
                return-object p0
            """,
            "nativeConnection" to """
                sget-object v0, $ROUTES->GET_CHANNEL_ID:$ROUTE
                invoke-static { v0 }, $ROUTES->getConnection($ROUTE)Ljava/net/HttpURLConnection;
                move-result-object v0
                return-object v0
            """
        )) {
            source.methods.single { it.name == name }.apply {
                require(implementation!!.registerCount >= 1 && implementation!!.tryBlocks.isEmpty())
                removeInstructions(0, implementation!!.instructions.size); addInstructions(0, body)
            }
        }
        println("Afterglow Description: exact modern/legacy header ownership, native title, bounded raw player description request")
    }
}
