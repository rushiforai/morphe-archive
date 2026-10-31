package app.morphe.extension.sabp.ui;

import android.app.Activity;
import android.view.ViewGroup;

import app.morphe.extension.sabp.EppyPlayer;
import app.morphe.extension.sabp.EppyTheme;

/** What the screens need from the activity hosting them. */
public interface Host {
    Activity activity();

    EppyTheme theme();

    EppyPlayer player();

    /** Root view that bottom sheets attach to. */
    ViewGroup overlayRoot();

    void openPlayer();

    void closePlayer();

    void openSabp(String activityClass);

    void showMoreSheet();

    void selectTab(int tab);

    void rebuild();

    void playBook(EppyPlayer.Book book, boolean openPlayer);

    /** 0 = toggle a bookmark at this moment, 1 = toggle one at the start of this chapter. */
    void bookmarkAction(int kind);

    /** Shows a short message with an Undo action. */
    void showUndo(String message, Runnable undo);

    /** Opens the system picker for an EPUB/PDF to pair with the playing book. */
    void pickDocument();

    /** Explains and requests the permission Android's speech service needs, then runs action. */
    void ensureSpeechPermission(Runnable action);

    /** Pushes a native screen (see {@link Pages}) onto the back stack over the current tab. */
    void pushPage(String key, String arg);

    /** Removes the top screen; Back does the same. */
    void popPage();

    /**
     * Opens the system file picker to create (create=true) or open a document and hands the
     * chosen Uri to result (not called when cancelled).
     */
    void requestDocument(boolean create, String mime, String suggestedName, java.util.function.Consumer<android.net.Uri> result);
}
