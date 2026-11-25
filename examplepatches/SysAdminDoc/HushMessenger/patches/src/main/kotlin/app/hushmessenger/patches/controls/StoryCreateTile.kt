package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method

/**
 * #225: the Create story tile at the start of the row of stories and notes above the chats.
 *
 * The inbox's stories unit builds that row in one method, which takes the account's own tile (its story and its note)
 * as its second argument and only adds the tile when that argument is there. The extension sees the argument first, and
 * with Hide Create story on it hands back null, so the row starts with the first friend's story. Every later read in the
 * method goes through the tiles it built, each one checked for null, so nothing else changes.
 *
 * The builder is the one method that logs "invalid_facebook_user_presence" and takes eight arguments, the last five of
 * them ImmutableLists. Its second argument's class is the own tile, whose constructor takes the session, the unit's
 * config, a story preview and a note. The argument's own register carries the call, so the builder needs no local.
 */
internal const val STORY_CREATE_TILE = "story_create_tile"
internal const val STORY_CREATE_TILE_CALL = "Lapp/hushmessenger/extension/StoryTray;->ownTile(Ljava/lang/Object;)Ljava/lang/Object;"
internal const val STORY_TRAY_ANCHOR = "invalid_facebook_user_presence"
internal val OWN_TILE_CONSTRUCTOR = listOf(FB_USER_SESSION, "Lcom/facebook/messaging/inbox/units/StaticUnitConfig;",
    "Lcom/facebook/messaging/montage/model/MontageBucketPreview;", "Lcom/facebook/presence/api/model/NoteWithUserInfo;")

/** The builder's own-tile register, or null when [this] isn't shaped like the builder. */
internal fun Method.storyCreateTileRegister(): Int? {
    if (AccessFlags.STATIC.isSet(accessFlags) || returnType != IMMUTABLE_LIST) return null
    val types = parameterTypes.map { it.toString() }
    if (types.size != 8 || types.drop(3).any { it != IMMUTABLE_LIST } || !types[1].startsWith("L")) return null
    if (implementation == null || 0 in jumpTargets()) return null
    return argumentRegister(1)
}

internal val storyTrayBuilders = MethodCheck {
    val anchor = StringMatch(STORY_TRAY_ANCHOR)
    val test: MethodTest = { _, method ->
        method.returnType == IMMUTABLE_LIST && method.parameterTypes.size == 8 && anchor.inCode(method)
    }
    test
}

/** The builder, taken only while exactly one method has its shape and its second argument is the own tile. */
internal fun findStoryCreateTile(classes: Iterable<ClassDef>): List<Method> {
    val builder = storyTrayBuilders.methods(classes).singleOrNull { it.storyCreateTileRegister() != null } ?: return emptyList()
    val tile = builder.parameterTypes[1].toString()
    val cls = classes.firstOrNull { it.type == tile } ?: return emptyList()
    if (cls.methods.none { it.name == "<init>" && it.parameterTypes.map { type -> type.toString() } == OWN_TILE_CONSTRUCTOR }) return emptyList()
    return listOf(builder)
}

private fun tileChanged(method: Method): Nothing =
    throw PatchException("Messenger controls: the stories row builder ${method.hookId()} no longer matches the tested build")

internal fun Method.validateStoryCreateTile() {
    val register = storyCreateTileRegister() ?: run {
        if (startsWithCall(STORY_CREATE_TILE_CALL)) return
        tileChanged(this)
    }
    // move-result-object and check-cast take an eight-bit register.
    if (register > 255) tileChanged(this)
}

internal fun MutableMethod.injectStoryCreateTile() {
    val register = storyCreateTileRegister() ?: run {
        validateStoryCreateTile()
        return
    }
    if (startsWithCall(STORY_CREATE_TILE_CALL)) return
    validateStoryCreateTile()
    val tile = parameterTypes[1].toString()
    addInstructions(0, """
        invoke-static/range {v$register .. v$register}, $STORY_CREATE_TILE_CALL
        move-result-object v$register
        check-cast v$register, $tile
    """.trimIndent())
}
