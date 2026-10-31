package app.badfella.extension.ticktick.locallists;

/** Raised for an invalid, unsupported, or wrong-account backup archive. */
public final class BackupException extends LocalListsException {
    public BackupException(String message) {
        super(message);
    }

    public BackupException(String message, Throwable cause) {
        super(message, cause);
    }
}
