package ya;

import android.content.Context;
import android.content.ContextWrapper;
import android.database.DatabaseErrorHandler;
import android.database.sqlite.SQLiteDatabase;

/* loaded from: classes2.dex */
public final class c0 extends ContextWrapper {
    public c0(Context context) {
        super(context);
    }

    @Override // android.content.ContextWrapper, android.content.Context
    public final SQLiteDatabase openOrCreateDatabase(String str, int i5, SQLiteDatabase.CursorFactory cursorFactory, DatabaseErrorHandler databaseErrorHandler) {
        return super.openOrCreateDatabase(str, i5 | 16, cursorFactory, databaseErrorHandler);
    }
}
