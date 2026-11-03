package app.kyt.patches.rym

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

/**
 * Method of the track context menu that builds the list of menu items, such as
 * "Play next", "Credits" and "Go to artist".
 *
 * The class and method names are obfuscated, so the method is matched by its shape:
 * a non-static method without parameters that returns a List and adds the track mix
 * item (`track.getMixes().get(MixRadioType.Track.TRACK_MIX)`).
 */
internal object TrackContextMenuItemsFingerprint : Fingerprint(
    isStatic = false,
    returnType = "Ljava/util/List;",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/aspiro/wamp/model/Track;",
            name = "getMixes"
        ),
        fieldAccess(
            definingClass = "Lcom/aspiro/wamp/enums/MixRadioType\$Track;",
            name = "TRACK_MIX"
        )
    )
)

/**
 * Method of the album context menu that builds the list of menu items, such as
 * "Add to favorites", "Save for later" and "Go to artist".
 *
 * Matched by its shape: a non-static method without parameters that returns a List and adds
 * the "Save for later" item for the album (`String.valueOf(album.getId())` and `SaveForLaterItemType.ALBUM`).
 */
internal object AlbumContextMenuItemsFingerprint : Fingerprint(
    isStatic = false,
    returnType = "Ljava/util/List;",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/aspiro/wamp/model/Album;",
            name = "getId"
        ),
        fieldAccess(
            definingClass = "Lcom/tidal/android/feature/saveforlater/domain/model/SaveForLaterItemType;",
            name = "ALBUM"
        )
    )
)

/**
 * Constructor of the artist context menu.
 *
 * Unlike the track and album menus, the artist menu creates the list of all its possible items
 * once in its constructor and saves it in a field. Its methods then filter the list,
 * such as to show either "Follow" or "Unfollow".
 *
 * Matched by the instruction that saves the list in the ArrayList field of the class.
 * All context menus take a ContextualMetadata as the second parameter, which excludes
 * other classes that take an Artist and save an ArrayList, such as the artist info screen.
 */
internal object ArtistContextMenuConstructorFingerprint : Fingerprint(
    name = "<init>",
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IPUT_OBJECT,
            definingClass = "this",
            type = "Ljava/util/ArrayList;"
        )
    ),
    custom = { method, _ ->
        val parameters = method.parameterTypes.map { it.toString() }
        parameters.getOrNull(0) == "Lcom/aspiro/wamp/model/Artist;" &&
            parameters.getOrNull(1) == "Lcom/aspiro/wamp/eventtracking/model/ContextualMetadata;"
    }
)

/**
 * Constructor of the "Go to artist" menu item of the track context menu.
 *
 * Only used to find its superclass, the obfuscated class all context menu items extend.
 * The constructor reads the "show_artist" string resource id from the R class,
 * whose fields keep their names. The video and album menus have their own "Go to artist"
 * items, so the first parameter must be a Track.
 */
internal object ShowArtistMenuItemConstructorFingerprint : Fingerprint(
    name = "<init>",
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/aspiro/wamp/R\$string;",
            name = "show_artist"
        )
    ),
    custom = { method, _ ->
        method.parameterTypes.firstOrNull()?.toString() == "Lcom/aspiro/wamp/model/Track;"
    }
)
