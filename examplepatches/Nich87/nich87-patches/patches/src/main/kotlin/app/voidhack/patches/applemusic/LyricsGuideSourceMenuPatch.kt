package app.voidhack.patches.applemusic

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val FRAGMENT = "Lcom/apple/android/music/player/fragment/PlayerLyricsViewFragment;"
private const val LOCALE_UTIL = "Lcom/apple/android/music/playback/util/LocaleUtil;"
private const val SONG_PTR = "Lcom/apple/android/music/ttml/javanative/model/SongInfo\$SongInfoPtr;"
private const val SONG = "Lcom/apple/android/music/ttml/javanative/model/SongInfo\$SongInfoNative;"
private const val CONTEXT = "Landroid/content/Context;"
private const val STRING = "Ljava/lang/String;"
private const val VECTOR = "Lcom/apple/android/mediaservices/javanative/common/StringVector\$StringVectorNative;"
private const val HOOK = "Lapp/voidhack/extension/applemusic/lyrics/LyricsGuideSourceMenu;"

private object LyricsGuideMenu : Fingerprint(
    name = "onClick",
    parameters = listOf("Landroid/view/View;"),
    returnType = "V",
    filters = listOf(
        methodCall(definingClass = SONG, name = "getPronunciationLanguages", returnType = VECTOR),
        methodCall(
            definingClass = LOCALE_UTIL,
            name = "matchToSystemLyricsScript",
            parameters = listOf(VECTOR),
            returnType = STRING,
        ),
        methodCall(definingClass = SONG, name = "hasTranslation", returnType = "Z"),
        methodCall(definingClass = "Landroid/widget/PopupWindow;", name = "showAsDropDown"),
    ),
    custom = { _, clazz -> clazz.type.startsWith("Lcom/apple/android/music/player/fragment/") },
)

internal val lyricsGuideSourceMenuPatch = bytecodePatch {
    dependsOn(karaokePronunciationPatch)

    execute {
        val menu = LyricsGuideMenu.method
        val titleSites = menu.instructions.withIndex().filter { (_, instruction) ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ref?.name == "setTitle" && ref.parameterTypes == listOf(STRING) && ref.returnType == "V"
        }
        check(titleSites.size == 2) { "Expected pronunciation and translation titles in the lyrics menu" }
        val (titleIndex, instruction) = titleSites.first()
        val titleCall = instruction as FiveRegisterInstruction
        val setTitle = (instruction as ReferenceInstruction).reference as MethodReference

        val contextSite = menu.instructions.indexOfFirst { insn ->
            val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
            ref?.name == "getContext" && ref.returnType == CONTEXT
        }
        check(contextSite >= 0) { "Lyrics menu context was not found" }
        val contextResult = menu.instructions[contextSite + 1]
        check(contextResult.opcode == Opcode.MOVE_RESULT_OBJECT)
        val contextRegister = (contextResult as OneRegisterInstruction).registerA

        val songRead = menu.instructions.take(titleIndex).first { insn ->
            val ref = (insn as? ReferenceInstruction)?.reference as? FieldReference
            insn.opcode == Opcode.IGET_OBJECT && ref?.definingClass == FRAGMENT && ref.type == SONG_PTR
        }
        val songField = (songRead as ReferenceInstruction).reference as FieldReference
        val fragmentRegister = (songRead as TwoRegisterInstruction).registerB
        val karaoke = InlinePronunciation.classDef
        val activeAdapter = mutableClassDefBy(FRAGMENT).fields.single { it.type == karaoke.superclass }

        val params = listOf(setTitle.definingClass, STRING, CONTEXT, FRAGMENT)
        val wrapper = ImmutableMethod(
            menu.definingClass,
            "voidhackSetPronunciationTitle",
            params.map { ImmutableMethodParameter(it, null, null) },
            "V",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(6),
        ).toMutable()
        wrapper.addInstructions(
            0,
            """
                iget-object v0, p3, $songField
                if-eqz v0, :set_title
                invoke-virtual {v0}, $SONG_PTR->get()$SONG
                move-result-object v0
                if-eqz v0, :set_title
                invoke-virtual {v0}, $SONG->getPronunciationLanguages()$VECTOR
                move-result-object v1
                invoke-static {v1}, $LOCALE_UTIL->matchToSystemLyricsScript($VECTOR)$STRING
                move-result-object v1
                if-eqz v1, :set_title
                invoke-virtual {v0}, $SONG->isPronunciationAutomaticallyCreated()Z
                move-result v0
                iget-object p3, p3, $activeAdapter
                instance-of p3, p3, ${karaoke.type}
                invoke-static {p2, p1, v1, v0, p3}, $HOOK->label($CONTEXT$STRING${STRING}ZZ)$STRING
                move-result-object p1
                :set_title
                invoke-virtual {p0, p1}, $setTitle
                return-void
            """,
        )
        LyricsGuideMenu.classDef.methods.add(wrapper)

        // Replace the shared destination of both native title branches so Show and Hide get the same source.
        menu.replaceInstruction(
            titleIndex,
            "invoke-static {v${titleCall.registerC}, v${titleCall.registerD}, v$contextRegister, v$fragmentRegister}, $wrapper",
        )
    }
}
