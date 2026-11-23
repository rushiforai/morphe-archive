package patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val USER = "LIIIllllIllIIIllI;"
private const val USER_STATE = "LIIIIIIIlIlllIlll;"
private const val USER_ID_PREFERENCE = "bc391985"

/**
 * Deezer saves the whole in-memory user to APP_PREFS through `lIlIIllIIlI(context, loggedOut)`
 * whenever one field changes (refreshed ARL, credentials, email, profile). With `loggedOut = false`
 * it writes the signed-in flag `807b5f36 = true` together with the user id `bc391985`.
 *
 * When Deezer cold-starts in the background, for example because an Android Auto host such as
 * DriveDeck rebinds the media browser service after the app was stopped, a refresh can reach this
 * method before the user was restored from preferences. It then stores an empty user id next to
 * the signed-in flag. Deezer flags that state itself (`IllegalStateException("Where are you now")`)
 * but writes it anyway, and the next start treats "signed in without a user id" as a broken
 * session and runs the full logout.
 *
 * Skip only that invalid write: a signed-in save with an empty user id. The stored session stays
 * intact and is restored normally; logout (`loggedOut = true`) and every save that carries a user
 * id are unchanged.
 */
internal val deezerKeepSessionOnColdStart = bytecodePatch {
    dependsOn(deezerBase)

    execute {
        val save = exact(USER, "lIlIIllIIlI", "V", "Landroid/content/Context;", "Z").method
        guardColdStartPersistence2703(save)
        val user = mutableClassDefBy(USER)
        check(user.methods.none { it.name == "morpheTraceSessionSave" })
        for (name in listOf("morpheSessionSaveSummary", "morpheSessionLogoutTrace")) {
            user.fields.add(MutableField(ImmutableField(USER, name, "Ljava/lang/String;",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, emptySet(), emptySet())))
        }
        user.methods.add(sessionSaveTrace2703())
        save.addInstructions(0, "invoke-static/range {p1 .. p1}, $USER->morpheTraceSessionSave(Z)V")
        skipListeningLog2703(exact("LIIIIIlIllIllIII;", "IIIIIllIlIIllll", "LlIlIlIIIlIlIIl;",
            "LllIlIIlllllII;").method, "log.listen")
        skipListeningLog2703(exact("LIIIIIlIllIllIII;", "llIIIIIIlIIIIll", "LlIlIlIIIlIlIIl;",
            "Ljava/util/List;").method, "log.batch_listen")
    }
}

internal fun guardColdStartPersistence2703(method: MutableMethod) {
    check(method.definingClass == USER && method.name == "lIlIIllIIlI" && method.returnType == "V" &&
        method.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;", "Z") &&
        AccessFlags.STATIC.isSet(method.accessFlags) && checkNotNull(method.implementation).registerCount >= 3) {
        "Deezer user persistence prototype changed"
    }
    val strings = method.instructions.mapNotNull {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
    }
    check(strings.containsAll(listOf(USER_ID_PREFERENCE, "807b5f36", "Where are you now"))) {
        "Deezer signed-in/user-id persistence contract changed"
    }
    check(method.instructions.any {
        (it as? ReferenceInstruction)?.reference?.toString() == "$USER->lIlIIllIIlI:$USER_STATE"
    } && method.instructions.any {
        (it as? ReferenceInstruction)?.reference?.toString() == "$USER_STATE->IllIlIlIIlIllIll:Ljava/lang/String;"
    }) { "Deezer in-memory user id contract changed" }
    method.addInstructionsWithLabels(0, """
        if-nez p1, :morphe_persist_user
        sget-object v0, $USER->lIlIIllIIlI:$USER_STATE
        iget-object v0, v0, $USER_STATE->IllIlIlIIlIllIll:Ljava/lang/String;
        invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
        move-result v0
        if-eqz v0, :morphe_persist_user
        return-void
    """.trimIndent(), ExternalLabel("morphe_persist_user", method.getInstruction(0)))
}

/** Port the existing Deezer listening-log session fix; sign-in/refresh/logout remain native. */
internal fun skipListeningLog2703(method: MutableMethod, apiMethod: String) {
    check(method.definingClass == "LIIIIIlIllIllIII;" && method.returnType == "LlIlIlIIIlIlIIl;" &&
        apiMethod in setOf("log.listen", "log.batch_listen") && method.instructions.count {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == apiMethod
        } == 1) { "Deezer listening-log request contract changed" }
    method.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
}

/** Goal-scoped diagnostic: only booleans and logout caller frames, never account values. */
internal fun sessionSaveTrace2703(): MutableMethod = ImmutableMethod(USER, "morpheTraceSessionSave",
    listOf(ImmutableMethodParameter("Z", emptySet(), null)), "V",
    AccessFlags.PRIVATE.value or AccessFlags.STATIC.value or AccessFlags.SYNTHETIC.value,
    emptySet(), emptySet(), MutableMethodImplementation(4)).toMutable().apply {
    addInstructions(0, """
        if-nez p0, :logged_out
        sget-object v0, $USER->lIlIIllIIlI:$USER_STATE
        if-eqz v0, :incomplete
        iget-object v0, v0, $USER_STATE->IllIlIlIIlIllIll:Ljava/lang/String;
        invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z
        move-result v0
        if-nez v0, :incomplete
        const-string v1, "Signed-in save requested"
        sput-object v1, $USER->morpheSessionSaveSummary:Ljava/lang/String;
        return-void
        :incomplete
        const/4 v0, 0x0
        const-string v1, "Incomplete signed-in save observed"
        goto :report
        :logged_out
        new-instance v0, Ljava/lang/Throwable;
        invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V
        const-string v1, "Logged-out save requested"
        invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;
        move-result-object v2
        sput-object v2, $USER->morpheSessionLogoutTrace:Ljava/lang/String;
        :report
        sput-object v1, $USER->morpheSessionSaveSummary:Ljava/lang/String;
        const-string p0, "DeezerSession"
        invoke-static {p0, v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
        return-void
    """)
}
