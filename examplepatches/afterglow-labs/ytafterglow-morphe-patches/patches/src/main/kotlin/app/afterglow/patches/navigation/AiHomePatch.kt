package app.afterglow.patches.navigation

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.addMethod
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.shared.smali
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val ROUTER = "$EXTENSION_PACKAGE/destinations/AiHomeRouter;"
private const val HOST = "$EXTENSION_PACKAGE/destinations/AiHomeRouter\$NativeHost;"
private const val CHIP = "$EXTENSION_PACKAGE/destinations/AiHomeRouter\$NativeChip;"
private const val REGISTRY = "Lcom/google/protobuf/ExtensionRegistryLite;"

/** Uses the current native custom-feed command; ordinary search is never substituted. */
internal val aiHomeHookPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch)
    execute {
        val bind = Fingerprint(definingClass = "Lpuj;", name = "o", returnType = "Z",
            parameters = listOf("Lalce;"), accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            filters = listOf(fieldAccess(smali = "Lpuj;->d:Ljava/lang/String;"),
                methodCall(smali = "Lkvk;->P(Lalce;Ljava/lang/String;)Lbflx;"),
                methodCall(smali = "Lpuj;->v(Lbbjo;)Z"))).match()
        Fingerprint(definingClass = "Lpuj;", name = "w", returnType = "V",
            parameters = listOf("Lbfms;", "Lbdmu;", "I"), strings = listOf("sectionListController"),
            filters = listOf(fieldAccess(smali = "Lpuj;->c:Laksq;"),
                fieldAccess(smali = "Lbdmu;->g:Lbdso;"),
                fieldAccess(smali = "Lpuj;->s:Lautm;"),
                methodCall(smali = "Layzk;->k(Ljava/lang/Object;Ljava/lang/Object;)Layzk;"),
                methodCall(smali = "Laksq;->c(Lbdso;Ljava/util/Map;)V"))).method
        val style = Fingerprint(definingClass = "Lbdmv;", name = "<clinit>",
            strings = listOf("STYLE_AI_CUSTOMIZED_FEED_CHIP", "STYLE_AI_MODE_CHIP")).method
        val styleCode = style.implementation!!.instructions.toList()
        listOf("STYLE_AI_CUSTOMIZED_FEED_CHIP" to 26, "STYLE_AI_MODE_CHIP" to 28).forEach { (label, number) ->
            val at = styleCode.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == label }
            require(at >= 0 && (styleCode[at + 2] as? NarrowLiteralInstruction)?.narrowLiteral == number
                    && ((styleCode[at + 3] as? ReferenceInstruction)?.reference as? MethodReference)?.smali == "Lbdmv;-><init>(Ljava/lang/String;II)V") {
                "Native AI chip style numbering changed"
            }
        }
        val browseExtension = Fingerprint(definingClass = "Lbdbj;", name = "<clinit>",
            filters = listOf(fieldAccess(smali = "Lbdbe;->a:Lbdbe;"),
                fieldAccess(smali = "Lbdbj;->a:Lbbju;", opcode = Opcode.SPUT_OBJECT))).method
        require(browseExtension.implementation!!.instructions.any { (it as? NarrowLiteralInstruction)?.narrowLiteral == 48687626 })
        val schema = Fingerprint(definingClass = "Lbdbe;", name = "dynamicMethod",
            returnType = "Ljava/lang/Object;", parameters = listOf("Lbbjv;", "Ljava/lang/Object;", "Ljava/lang/Object;")).method
        val schemaStrings = schema.implementation!!.instructions.mapNotNull {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
        }
        // Generated protobuf schema: fields 2, 3 and 5 are c, d and e (String).
        require(schemaStrings.take(4) == listOf("b", "c", "d", "e") && schemaStrings.any {
            it.startsWith("\u0001\u0010\u0000\u0001\u0002\u001a\u0010\u0000\u0000\u0002\u0002\u1008\u0000\u0003\u1008\u0002\u0005\u1008\u0003")
        }) { "Native BrowseEndpoint query schema changed" }
        Fingerprint(definingClass = "Laeio;", name = "O", returnType = "Landroid/view/View;",
            parameters = listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;"),
            filters = listOf(fieldAccess(smali = "Lbdbe;->e:Ljava/lang/String;"),
                methodCall(smali = "Lalle;->W(Ljava/lang/String;)V"))).method
        Fingerprint(definingClass = "Lalle;", name = "W", returnType = "V", parameters = listOf("Ljava/lang/String;"),
            filters = listOf(fieldAccess(smali = "Lalle;->V:Ljava/lang/String;", opcode = Opcode.IPUT_OBJECT))).method
        Fingerprint(definingClass = "Lalle;", name = "lm", strings = listOf("query"),
            filters = listOf(fieldAccess(smali = "Lalle;->V:Ljava/lang/String;"))).method
        val parse = Fingerprint(definingClass = "Lbbjw;", name = "parseFrom", returnType = "Lbbjw;",
            parameters = listOf("Lbbjw;", "[B", REGISTRY), accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC)).method
        val registry = Fingerprint(definingClass = REGISTRY, name = "getGeneratedRegistry", returnType = REGISTRY,
            parameters = emptyList(), accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC)).method
        Fingerprint(definingClass = "Lcom/google/protobuf/MessageLite;", name = "toByteArray",
            returnType = "[B", parameters = emptyList()).method
        val owner = bind.classDef
        listOf("d" to "Ljava/lang/String;", "e" to "Landroid/widget/LinearLayout;", "b" to "Lauij;",
            "s" to "Lautm;", "c" to "Laksq;").forEach { (name, type) ->
            require(owner.fields.any { it.name == name && it.type == type }) { "Native Home controller field changed: $name" }
        }
        require(classDefBy("Lauij;").superclass == "Laewl;" && classDefBy("Laewl;").superclass == "Ljava/util/AbstractList;")
        val chip = mutableClassDefBy("Lbdmu;")
        require(chip.superclass == "Lbbjw;" && chip.fields.any { it.name == "e" && it.type == "Lbdmw;" }
                && chip.fields.any { it.name == "g" && it.type == "Lbdso;" }
                && classDefBy("Lbdmw;").fields.any { it.name == "c" && it.type == "I" })
        require(owner.methods.none { it.name.startsWith("afterglow_ai") } && chip.methods.none { it.name.startsWith("afterglow_ai") })

        chip.interfaces.add(CHIP)
        chip.addMethod("afterglow_aiStyle", "I", 2, """
            iget-object v0, p0, Lbdmu;->e:Lbdmw;
            if-eqz v0, :missing
            iget v0, v0, Lbdmw;->c:I
            return v0
            :missing
            const/4 v0, -0x1
            return v0
        """)
        chip.addMethod("afterglow_aiCommand", "[B", 2, """
            iget-object v0, p0, Lbdmu;->g:Lbdso;
            if-eqz v0, :missing
            invoke-interface { v0 }, Lcom/google/protobuf/MessageLite;->toByteArray()[B
            move-result-object v0
            return-object v0
            :missing
            const/4 v0, 0x0
            return-object v0
        """)
        owner.interfaces.add(HOST)
        owner.addMethod("afterglow_aiRoot", "Landroid/view/View;", 2, """
            iget-object v0, p0, Lpuj;->e:Landroid/widget/LinearLayout;
            return-object v0
        """)
        owner.addMethod("afterglow_aiBrowseId", "Ljava/lang/String;", 2, """
            iget-object v0, p0, Lpuj;->d:Ljava/lang/String;
            return-object v0
        """)
        owner.addMethod("afterglow_aiChips", "Ljava/util/List;", 2, """
            iget-object v0, p0, Lpuj;->b:Lauij;
            return-object v0
        """)
        owner.methods.add(ImmutableMethod(owner.type, "afterglow_aiDispatch",
            listOf(ImmutableMethodParameter("[B", null, null)), "Z", AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            null, null, MutableMethodImplementation(7)).toMutable().apply {
            addInstructions(0, """
                iget-object v3, p0, Lpuj;->s:Lautm;
                if-eqz v3, :unavailable
                iget-object v4, p0, Lpuj;->c:Laksq;
                if-eqz v4, :unavailable
                sget-object v0, Lbdso;->a:Lbdso;
                invoke-static {}, ${registry.smali}
                move-result-object v1
                invoke-static { v0, p1, v1 }, ${parse.smali}
                move-result-object v0
                check-cast v0, Lbdso;
                const-string v1, "sectionListController"
                invoke-static { v1, v3 }, Layzk;->k(Ljava/lang/Object;Ljava/lang/Object;)Layzk;
                move-result-object v1
                invoke-interface { v4, v0, v1 }, Laksq;->c(Lbdso;Ljava/util/Map;)V
                const/4 v0, 0x1
                return v0
                :unavailable
                const/4 v0, 0x0
                return v0
            """)
        })
        bind.method.addInstruction(0, "invoke-static/range { p0 .. p0 }, $ROUTER->captureCustomFeed($HOST)V")
        println("Afterglow AI Home: current Home chip style26; native BrowseEndpoint query and dispatcher preserved")
    }
}
