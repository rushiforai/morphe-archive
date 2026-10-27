package dev.twitchpatches.patches.twitch.chat

import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import dev.twitchpatches.patches.twitch.settings.settingsPatch
import dev.twitchpatches.patches.twitch.shared.*

// Adapted from arandomhooman/hoomans-morphe-patches (GPL-3.0), Show deleted messages.
internal const val DELETED_POLICY = "Ldev/twitchpatches/extension/chat/DeletedMessageSettings;"
internal const val CHAT_DISPATCHER = "Ltv/twitch/android/core/mvp/viewdelegate/EventDispatcher;"

@Suppress("unused")
val showDeletedMessagesPatch = bytecodePatch(
    name = "Show deleted messages",
    description = "Reveals deleted and moderated chat messages on tap.",
    default = true,
) {
    compatibleWith(TwitchTarget.compatibility)
    dependsOn(settingsPatch, reactNativeDeletedMessagesPatch)
    execute {
        val spans = mutableListOf<Method>()
        classDefForEach { type ->
            if (type.superclass == "Landroid/text/style/ClickableSpan;") spans.addAll(type.methods.filter {
                it.name == "<init>" && it.parameterTypes.map { p -> p.toString() } ==
                    listOf("Ljava/lang/String;", "Landroid/text/SpannedString;", "Z", CHAT_DISPATCHER)
            })
        }
        val constructor = spans.uniqueHook("deleted message span constructor")
        val span = mutableClassDefBy(constructor.definingClass)
        val access = span.fields.filter { it.type == "Z" }.uniqueHook("deleted message access flag")
        val original = span.fields.filter { it.type == "Landroid/text/SpannedString;" }.uniqueHook("deleted message text")

        val formatters = mutableListOf<Method>()
        classDefForEach { type -> formatters.addAll(type.methods.filter {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "Landroid/text/Spanned;" &&
                it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/String;",
                    "Landroid/text/SpannedString;", "Landroid/content/Context;", CHAT_DISPATCHER, "Z")
        }) }
        val formatterHook = formatters.uniqueHook("deleted message formatter")
        val formatter = mutableClassDefBy(formatterHook.definingClass).methods.single { it.reference == formatterHook.reference }
        restoreDeletedMessageFormatter(formatter, original)
        enableDeletedMessageAccess(formatter, access, 1)
        val readers = span.methods.filter { method -> method.code().any { it.opcode == Opcode.IGET_BOOLEAN } }
        require(readers.map { it.name }.toSet() == setOf("onClick", "updateDrawState")) {
            "Twitch deleted messages: span access readers changed."
        }
        readers.forEach { enableDeletedMessageAccess(it, access, 1) }

        val application = mutableClassDefBy("Ltv/twitch/android/app/consumer/TwitchApplication;").methods
            .filter { it.name == "onCreate" && it.isInstance(emptyList(), "V") }
            .uniqueHook("deleted message settings initialization")
        application.code().withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }.asReversed()
            .forEach { application.insertAtReturn(it, "invoke-static/range {p0 .. p0}, $DELETED_POLICY->initialize(Landroid/app/Application;)V") }
    }
}
