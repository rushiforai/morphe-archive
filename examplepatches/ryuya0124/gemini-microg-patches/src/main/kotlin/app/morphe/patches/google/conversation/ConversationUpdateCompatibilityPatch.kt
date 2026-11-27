package app.morphe.patches.google.conversation

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.google.common.HookId
import app.morphe.patches.google.common.VersionHookRegistry

/** Keep conversations usable when Gemini answers with the recognized "Conversation requires an update" warning. */
val conversationUpdateCompatibilityPatch = bytecodePatch(
    name = "Conversation update warning compatibility",
    description = "Ignores the \"Conversation requires an update\" warning so existing chats keep working.",
    default = true
) {
    compatibleWith(*VersionHookRegistry.compatibility("com.google.android.googlequicksearchbox"))
    extendWith(java.util.function.Supplier {
        checkNotNull(VersionHookRegistry::class.java.classLoader.getResourceAsStream("extensions/conversation-update.bin")) {
            "Missing conversation update runtime extension"
        }
    })
    execute {
        val spec = VersionHookRegistry.requireProfile(packageMetadata).hooks[HookId.CONVERSATION_UPDATE_WARNING]
        if (spec == null) {
            VersionHookRegistry.logHook(HookId.CONVERSATION_UPDATE_WARNING, "profile", "no verified warning hook for ${packageMetadata.versionName}")
            return@execute
        }
        val runtime = "Lapp/geminipatch/extension/ConversationUpdateCompatibility;"

        val history = classDefBy(requireNotNull(spec.className))
        check(history.superclass == spec.value("superclass")) { "History receiver changed: ${history.superclass}" }
        val historyRegisters = history.methods.single { spec.matches(it) }.implementation!!.registerCount
        val historyMethod = mutableClassDefBy(history).methods.single { spec.matches(it) }
        historyMethod.addInstructions(0, """
            invoke-static/range {p1 .. p1}, $runtime->filter(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object p1
        """.trimIndent())
        check(historyMethod.implementation!!.registerCount == historyRegisters)

        val streamClass = classDefBy(spec.value("streamClass"))
        fun isStream(m: com.android.tools.smali.dexlib2.iface.Method) = m.name == spec.value("streamMethod") &&
            "(${m.parameterTypes.joinToString("")})${m.returnType}" == spec.value("streamDescriptor")
        check(streamClass.methods.count(::isStream) == spec.expectedMatches) { "Reply receiver changed" }
        val streamRegisters = streamClass.methods.single(::isStream).implementation!!.registerCount
        val streamMethod = mutableClassDefBy(streamClass).methods.single(::isStream)
        streamMethod.addInstructions(0, """
            invoke-static/range {p1 .. p1}, $runtime->filterStream(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object p1
            check-cast p1, ${spec.value("streamResponse")}
        """.trimIndent())
        check(streamMethod.implementation!!.registerCount == streamRegisters)
        VersionHookRegistry.logHook(HookId.CONVERSATION_UPDATE_WARNING, "profile", "history and reply receivers hooked")
    }
}
