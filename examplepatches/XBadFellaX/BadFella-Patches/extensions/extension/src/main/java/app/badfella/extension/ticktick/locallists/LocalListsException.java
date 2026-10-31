package app.badfella.extension.ticktick.locallists;

/** Base class for local-organizer errors that are safe to show to the user. */
public class LocalListsException extends Exception {
    public LocalListsException(String message) {
        super(message);
    }

    public LocalListsException(String message, Throwable cause) {
        super(message, cause);
    }
}
