package app.template.patches.zalo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.literal
import app.morphe.patcher.string
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Config key of the quick-message count limit (hrn.QUICK_MESSAGE_MAX_COUNT). Compile-time constant, so it is
// inlined as a const-string at every reader; this string is the stable anchor across obfuscation changes.
private const val QUICK_MESSAGE_MAX_COUNT_KEY = "QUICK_MESSAGE_MAX_COUNT"

private const val QUICK_MESSAGE_FEATURE_ENABLE_KEY = "QUICK_MESSAGE_FEATURE_ENABLE"

private const val UNLIMITED = "0x7fffffff"

// Local-only quick messages: the app's own create / update / delete / sync requests are located by their
// RequestPacket command ids (2086 create, 2087 update, 2088 delete, 2085 sync) and replaced by local work.
private object QuickMessageCreateFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "L"),
    filters = listOf(string("attachment"), string("sessionId"), literal(2086)),
)

private object QuickMessageUpdateFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("J", "L", "L"),
    filters = listOf(literal(2087)),
)

private object QuickMessageDeleteFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("J", "Ljava/lang/String;"),
    filters = listOf(literal(2088)),
)

private object QuickMessageSyncFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("J"),
    filters = listOf(literal(2085)),
)

private enum class SiteKind {
    /** No-arg method returning I whose body is the limit getter (both account branches): return unlimited. */
    LIMIT_GETTER,

    /** No-arg method returning Z that is the "list is full" check: never full. */
    FULL_CHECK,

    /** No-arg static method returning Z that is the feature-enabled gate (both branches): always true. */
    FEATURE_GATE,

    /** Larger method (display only): override the move-result of the non-business branch. */
    MOVE_RESULT,
}

private data class QuickMessageSite(
    val method: MutableMethod,
    val kind: SiteKind,
    val moveResultIndex: Int = -1,
    val register: Int = -1,
)

@Suppress("unused")
val unlimitedQuickMessagesPatch = bytecodePatch(
    name = "Unlimited quick messages",
    description = "Remove the client-side limit on the number of quick messages, ignoring the server-provided cap.",
    default = true,
) {
    compatibleWith(Compatibility(
        name = "Zalo",
        packageName = "com.zing.zalo",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0068FF,
        targets = listOf(AppTarget(version = "26.11.01")),
    ))

    dependsOn(nativeSignaturePatch)
    extendWith("extensions/extension.mpe")

    execute {
        registerApplied(PatchId.UNLIMITED_QUICK_MESSAGES)
        val sites = mutableListOf<QuickMessageSite>()

        fun mutableOf(classDef: com.android.tools.smali.dexlib2.iface.ClassDef, original: com.android.tools.smali.dexlib2.iface.Method) =
            mutableClassDefBy(classDef).methods.single {
                it.name == original.name &&
                    it.parameterTypes == original.parameterTypes &&
                    it.returnType == original.returnType
            }

        classDefForEach { classDef ->
            classDef.methods.forEach { original ->
                val instructions = original.implementation?.instructions?.toList() ?: return@forEach
                val noArgs = original.parameterTypes.isEmpty()

                instructions.forEachIndexed { index, instruction ->
                    if (instruction.opcode != Opcode.CONST_STRING) return@forEachIndexed
                    val key = (instruction as? ReferenceInstruction)?.reference.toString()

                    if (key == QUICK_MESSAGE_FEATURE_ENABLE_KEY) {
                        // ks10.d(): static ()Z, non-business: cfj.s(...), business: map.get(uid) >= 1.
                        if (noArgs && original.returnType == "Z" &&
                            AccessFlags.STATIC.isSet(original.accessFlags)
                        ) {
                            sites.add(QuickMessageSite(mutableOf(classDef, original), SiteKind.FEATURE_GATE))
                        }
                        return@forEachIndexed
                    }
                    if (key != QUICK_MESSAGE_MAX_COUNT_KEY) return@forEachIndexed

                    // Limit getter / full check: whole method is replaced so the business branch is covered too.
                    if (noArgs && original.returnType == "I") {
                        sites.add(QuickMessageSite(mutableOf(classDef, original), SiteKind.LIMIT_GETTER))
                        return@forEachIndexed
                    }
                    if (noArgs && original.returnType == "Z") {
                        sites.add(QuickMessageSite(mutableOf(classDef, original), SiteKind.FULL_CHECK))
                        return@forEachIndexed
                    }

                    // Reader: const-string KEY; ... invoke-static Lcfj;->t(ILjava/lang/String;Z)I; move-result vX
                    // (the writer calls cfj.s1(...)V and is deliberately skipped by the return-type check).
                    val window = (index + 1..minOf(index + 8, instructions.lastIndex))
                    val invokeIndex = window.firstOrNull { i ->
                        val ref = (instructions[i] as? ReferenceInstruction)?.reference as? MethodReference
                        instructions[i].opcode == Opcode.INVOKE_STATIC && ref != null &&
                            ref.returnType == "I" &&
                            ref.parameterTypes == listOf("I", "Ljava/lang/String;", "Z")
                    } ?: return@forEachIndexed
                    val moveResult = instructions.getOrNull(invokeIndex + 1) ?: return@forEachIndexed
                    if (moveResult.opcode != Opcode.MOVE_RESULT) return@forEachIndexed

                    sites.add(
                        QuickMessageSite(
                            mutableOf(classDef, original), SiteKind.MOVE_RESULT,
                            invokeIndex + 1, (moveResult as OneRegisterInstruction).registerA,
                        ),
                    )
                }
            }
        }

        // 26.11.01: ks10.c() limit getter, zfk.c() full check, ks10.d() feature gate, td2 display (2 sites in one
        // method, jadx duplicates) -> 3 whole-method sites + td2 move-result sites (counted per const-string hit).
        fun count(kind: SiteKind) = sites.count { it.kind == kind }
        check(count(SiteKind.LIMIT_GETTER) == 1) { "Expected 1 limit getter, found ${count(SiteKind.LIMIT_GETTER)}" }
        check(count(SiteKind.FULL_CHECK) == 1) { "Expected 1 full check, found ${count(SiteKind.FULL_CHECK)}" }
        check(count(SiteKind.FEATURE_GATE) == 1) { "Expected 1 feature gate, found ${count(SiteKind.FEATURE_GATE)}" }
        check(count(SiteKind.MOVE_RESULT) >= 1) { "Expected >=1 move-result limit reader, found 0" }

        sites.filter { it.kind != SiteKind.MOVE_RESULT }.forEach { site ->
            val impl = site.method.implementation!!
            // v0 must be a non-parameter register: registerCount minus parameter registers (incl. this) >= 1.
            val paramRegs = site.method.parameterTypes.size +
                if (AccessFlags.STATIC.isSet(site.method.accessFlags)) 0 else 1
            check(impl.registerCount - paramRegs >= 1) { "No free register in ${site.method}" }
            val code = when (site.kind) {
                SiteKind.LIMIT_GETTER -> "const v0, $UNLIMITED\nreturn v0"
                SiteKind.FULL_CHECK -> "const/4 v0, 0x0\nreturn v0"
                else -> "const/4 v0, 0x1\nreturn v0"
            }
            site.method.addInstructions(0, code)
        }

        // Process the later index first so earlier insertions in the same method do not shift it.
        sites.filter { it.kind == SiteKind.MOVE_RESULT }.sortedByDescending { it.moveResultIndex }.forEach { site ->
            site.method.addInstructions(
                site.moveResultIndex + 1,
                "const v${site.register}, $UNLIMITED",
            )
        }

        // ---- Local-only quick messages (bypass the server for create / edit / delete / sync) ----
        // Obfuscated 26.11.01 types: kfk = creating ViewModel, jfk = its el2 result callback, pru = request builder,
        // ufk = static facade, zfk = in-memory store (a = list version), pfk = item, wkr = photo attachment,
        // ofk/vw0 = media wrappers, jnh = message text. Server pushes (ufk.c/e/g) are the app's own list+DB mutators.
        fun requireMethod(className: String, name: String, params: List<String>, ret: String) =
            mutableClassDefBy(className).methods.singleOrNull {
                it.name == name && it.parameterTypes.map { t -> t.toString() } == params && it.returnType == ret
            } ?: error("Missing $className->$name$params$ret")

        val ver = "Lzfk;"
        val create = run {
            check(QuickMessageCreateFingerprint.matchAll(1..1).size == 1)
            QuickMessageCreateFingerprint.method
        }
        val update = run {
            check(QuickMessageUpdateFingerprint.matchAll(1..1).size == 1)
            QuickMessageUpdateFingerprint.method
        }
        val delete = run {
            check(QuickMessageDeleteFingerprint.matchAll(1..1).size == 1)
            QuickMessageDeleteFingerprint.method
        }
        val sync = run {
            check(QuickMessageSyncFingerprint.matchAll(1..1).size == 1)
            QuickMessageSyncFingerprint.method
        }
        check(create.definingClass == "Lkfk;" && update.definingClass == "Lkfk;") { "Unexpected kfk owner" }
        check(delete.definingClass == "Lpru;" && sync.definingClass == "Lpru;") { "Unexpected pru owner" }
        check(create.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;", "Ljava/lang/String;", "Lhb20;"))
        check(update.parameterTypes.map { it.toString() } == listOf("J", "Lpfk;", "Lhb20;"))
        check(create.implementation!!.registerCount == 12 && update.implementation!!.registerCount == 13)
        check(delete.implementation!!.registerCount == 9)

        val push = requireMethod("Lufk;", "e", listOf("J", "J", "Ljava/lang/String;", "Lorg/json/JSONObject;"), "V")
        val pushUpdate = requireMethod("Lufk;", "g", listOf("J", "Lorg/json/JSONObject;", "J", "J", "Ljava/lang/String;"), "V")
        val pushDelete = requireMethod("Lufk;", "c", listOf("J", "J", "Ljava/lang/String;", "Ljava/util/ArrayList;"), "V")
        // Verify the app types the smali below relies on.
        requireMethod("Lufk;", "d", emptyList(), ver)
        requireMethod("Lkfk;", "n", emptyList(), "Z")
        requireMethod("Lpfk;", "<init>", listOf("J", "I", "Ljava/lang/String;", "Ljnh;", "Lvw0;", "J", "J"), "V")
        requireMethod("Lvw0;", "Q", emptyList(), "Lorg/json/JSONObject;")
        requireMethod("Lvw0;", "<init>", listOf("I", "Ljava/lang/String;", "Ljava/util/ArrayList;"), "V")
        requireMethod("Lofk;", "<init>", listOf("Lwkr;"), "V")
        requireMethod("Ljnh;", "o0", emptyList(), "Lorg/json/JSONObject;")
        requireMethod("Ljfk;", "<init>", listOf("Lkfk;", "I"), "V")
        requireMethod("Ljfk;", "r", listOf("Ljava/lang/Object;"), "V")

        // 1) Sync: the server fetch (cmd 2085) is never sent; the list comes from table_quick_message only.
        sync.addInstructions(0, "return-void")

        // 2) Server pushes (add / update / delete) are dropped unless a local operation is applying them.
        listOf(push, pushUpdate, pushDelete).forEach { method ->
            val first = method.implementation!!.instructions.first()
            val paramRegs = method.parameterTypes.sumOf { if (it.toString() == "J") 2 else 1 }
            check(method.implementation!!.registerCount - paramRegs >= 1) { "No free register in $method" }
            method.addInstructionsWithLabels(0, """
                invoke-static {}, $LOCAL_QUICK_MESSAGES->isLocalCall()Z
                move-result v0
                if-nez v0, :nezumi_local
                return-void
            """.trimIndent(), ExternalLabel("nezumi_local", first))
        }

        // 3) Create: kfk.j(keyword, text, attachment). Build the server's "item" payload locally and feed ufk.e.
        create.addInstructionsWithLabels(0, """
            iget-boolean v0, p0, Lkfk;->x:Z
            if-nez v0, :nezumi_original
            const/4 v1, 0x0
            const/4 v6, 0x0
            instance-of v0, p3, Lwkr;
            if-eqz v0, :nezumi_no_media
            check-cast p3, Lwkr;
            new-instance v2, Ljava/util/ArrayList;
            invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V
            new-instance v3, Lofk;
            invoke-direct {v3, p3}, Lofk;-><init>(Lwkr;)V
            invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            new-instance v3, Lvw0;
            const/4 v4, 0x1
            const-string v5, ""
            invoke-direct {v3, v4, v5, v2}, Lvw0;-><init>(ILjava/lang/String;Ljava/util/ArrayList;)V
            invoke-virtual {v3}, Lvw0;->Q()Lorg/json/JSONObject;
            move-result-object v1
            const/4 v6, 0x1
            :nezumi_no_media
            invoke-static {p1, p2, v1, v6}, $LOCAL_QUICK_MESSAGES->newItem(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;I)Lorg/json/JSONObject;
            move-result-object v5
            invoke-static {}, $LOCAL_QUICK_MESSAGES->enter()V
            invoke-static {}, Lufk;->d()$ver
            move-result-object v7
            iget-wide v0, v7, $ver->a:J
            move-wide v2, v0
            sget-object v4, Lcom/zing/zalocore/CoreUtility;->i:Ljava/lang/String;
            invoke-static/range {v0 .. v5}, Lufk;->e(JJLjava/lang/String;Lorg/json/JSONObject;)V
            invoke-static {}, $LOCAL_QUICK_MESSAGES->exit()V
            new-instance v0, Ljfk;
            const/4 v1, 0x0
            invoke-direct {v0, p0, v1}, Ljfk;-><init>(Lkfk;I)V
            const/4 v1, 0x0
            invoke-virtual {v0, v1}, Ljfk;->r(Ljava/lang/Object;)V
            return-void
        """.trimIndent(), ExternalLabel("nezumi_original", create.implementation!!.instructions.first()))

        // 4) Edit: kfk.p(id, item, attachment) -> ufk.g with the same id.
        update.addInstructionsWithLabels(0, """
            iget-boolean v0, p0, Lkfk;->y:Z
            if-nez v0, :nezumi_original
            iget-object v5, p3, Lpfk;->e:Lvw0;
            iget v2, p3, Lpfk;->b:I
            invoke-virtual {p0}, Lkfk;->n()Z
            move-result v0
            if-eqz v0, :nezumi_keep
            instance-of v0, p4, Lwkr;
            if-eqz v0, :nezumi_no_media
            check-cast p4, Lwkr;
            new-instance v1, Ljava/util/ArrayList;
            invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V
            new-instance v3, Lofk;
            invoke-direct {v3, p4}, Lofk;-><init>(Lwkr;)V
            invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            new-instance v5, Lvw0;
            const/4 v2, 0x1
            const-string v3, ""
            invoke-direct {v5, v2, v3, v1}, Lvw0;-><init>(ILjava/lang/String;Ljava/util/ArrayList;)V
            goto :nezumi_keep
            :nezumi_no_media
            const/4 v2, 0x0
            const/4 v5, 0x0
            :nezumi_keep
            const/4 v4, 0x0
            iget-object v0, p3, Lpfk;->d:Ljnh;
            if-eqz v0, :nezumi_no_message
            invoke-virtual {v0}, Ljnh;->o0()Lorg/json/JSONObject;
            move-result-object v4
            :nezumi_no_message
            const/4 v1, 0x0
            if-eqz v5, :nezumi_media_done
            invoke-virtual {v5}, Lvw0;->Q()Lorg/json/JSONObject;
            move-result-object v1
            :nezumi_media_done
            move-object v5, v1
            iget-object v3, p3, Lpfk;->c:Ljava/lang/String;
            iget-wide v6, p3, Lpfk;->f:J
            move-wide v0, p1
            invoke-static/range {v0 .. v7}, $LOCAL_QUICK_MESSAGES->updatedItem(JILjava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;J)Lorg/json/JSONObject;
            move-result-object v2
            invoke-static {}, $LOCAL_QUICK_MESSAGES->enter()V
            invoke-static {}, Lufk;->d()$ver
            move-result-object v7
            iget-wide v3, v7, $ver->a:J
            move-wide v5, v3
            sget-object v7, Lcom/zing/zalocore/CoreUtility;->i:Ljava/lang/String;
            invoke-static/range {v0 .. v7}, Lufk;->g(JLorg/json/JSONObject;JJLjava/lang/String;)V
            invoke-static {}, $LOCAL_QUICK_MESSAGES->exit()V
            new-instance v0, Ljfk;
            const/4 v1, 0x2
            invoke-direct {v0, p0, v1}, Ljfk;-><init>(Lkfk;I)V
            const/4 v1, 0x0
            invoke-virtual {v0, v1}, Ljfk;->r(Ljava/lang/Object;)V
            return-void
        """.trimIndent(), ExternalLabel("nezumi_original", update.implementation!!.instructions.first()))

        // 5) Delete: pru.L(id, json) -> ufk.c, then report success to the request's el2 callback (pru.b).
        // WithLabels binds :nezumi_done to this method; plain addInstructions keeps it pointing at the
        // compiler's scratch method, which breaks once anything is inserted above (the bug-log breadcrumb).
        delete.addInstructionsWithLabels(0, """
            iget-object p3, p0, Lpru;->b:Lel2;
            invoke-static {p1, p2}, $LOCAL_QUICK_MESSAGES->ids(J)Ljava/util/ArrayList;
            move-result-object v5
            invoke-static {}, $LOCAL_QUICK_MESSAGES->enter()V
            invoke-static {}, Lufk;->d()$ver
            move-result-object v4
            iget-wide v0, v4, $ver->a:J
            move-wide v2, v0
            sget-object v4, Lcom/zing/zalocore/CoreUtility;->i:Ljava/lang/String;
            invoke-static/range {v0 .. v5}, Lufk;->c(JJLjava/lang/String;Ljava/util/ArrayList;)V
            invoke-static {}, $LOCAL_QUICK_MESSAGES->exit()V
            if-eqz p3, :nezumi_done
            const/4 v0, 0x0
            invoke-interface {p3, v0}, Lel2;->r(Ljava/lang/Object;)V
            :nezumi_done
            return-void
        """.trimIndent())

        registerHooks(PatchId.UNLIMITED_QUICK_MESSAGES, *sites.map { it.method }.distinct().toTypedArray(),
            sync, push, pushUpdate, pushDelete, create, update, delete)
    }
}
