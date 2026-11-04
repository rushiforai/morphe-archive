package app.linkedin.extension;

/**
 * Server driven UI click handling: ClickActions(onClick, onLongClick, onDoubleClick).
 * Double tap is what likes a post or photo, so dropping it stops accidental likes.
 */
@SuppressWarnings("unused")
public final class DoubleTapPatch {

    /** Injected into the ClickActions constructor for its onDoubleClick argument. */
    public static Object filterDoubleClick(Object onDoubleClick) {
        return onDoubleClick != null && Settings.disableDoubleTapLike() ? null : onDoubleClick;
    }
}
