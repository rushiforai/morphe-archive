package nl.johninnl.deezer.queue;

import android.database.Cursor;
import android.database.CursorWrapper;
import android.os.Bundle;

/** Delegate every row operation; carry only the query's generation through resolver wrappers. */
public final class QueueCursor extends CursorWrapper {
    private volatile long epoch;
    QueueCursor(Cursor cursor, long epoch) { super(cursor); this.epoch = epoch; }
    @Override public Bundle getExtras() {
        Bundle extras = super.getExtras();
        Bundle copy = extras == null ? new Bundle() : new Bundle(extras);
        copy.putLong(QueueMutation.KEY, epoch);
        return copy;
    }
    @Override public boolean requery() {
        epoch = -1;
        return super.requery();
    }
}
