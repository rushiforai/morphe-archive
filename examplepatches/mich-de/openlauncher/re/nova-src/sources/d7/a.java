package d7;

import android.database.Cursor;
import android.os.CancellationSignal;
import java.io.Closeable;

/* loaded from: classes.dex */
public interface a extends Closeable {
    void beginTransaction();

    void beginTransactionNonExclusive();

    g compileStatement(String str);

    void endTransaction();

    void execSQL(String str);

    boolean inTransaction();

    boolean isOpen();

    boolean isWriteAheadLoggingEnabled();

    Cursor query(f fVar);

    Cursor query(f fVar, CancellationSignal cancellationSignal);

    Cursor query(String str);

    void setTransactionSuccessful();
}
