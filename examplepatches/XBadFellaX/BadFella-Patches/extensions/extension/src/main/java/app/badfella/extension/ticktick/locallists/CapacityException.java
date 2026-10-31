package app.badfella.extension.ticktick.locallists;

/** Raised when creating a list would exceed the selected local capacity. */
public final class CapacityException extends LocalListsException {
    public CapacityException(int capacity, int currentCount) {
        super("Local list limit reached (" + currentCount + "/" + capacity
                + "). Delete a list or raise the capacity to 900.");
    }
}
