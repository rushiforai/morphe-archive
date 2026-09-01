package defpackage;

import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qvf extends SQLiteOpenHelper {
    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onCreate(SQLiteDatabase sQLiteDatabase) throws IOException {
        vqf[] vqfVarArrValues = vqf.values();
        vqfVarArrValues.getClass();
        ArrayList arrayList = new ArrayList(new k70(vqfVarArrValues, false));
        if (!arrayList.isEmpty()) {
            arrayList.remove(0);
        }
        bu1.V0(arrayList);
        Collections.shuffle(arrayList);
        String strF0 = bu1.F0(arrayList, ", ", null, null, cy9.b, 30);
        StringBuilder sb = new StringBuilder(strF0.length() + 38);
        sb.append("CREATE TABLE IF NOT EXISTS tbl64158 (");
        sb.append(strF0);
        sb.append(")");
        sQLiteDatabase.execSQL(sb.toString());
        String strF = kp7.F(vqf.MEC_ACTION);
        StringBuilder sb2 = new StringBuilder(strF.length() + 52);
        sb2.append("CREATE INDEX IF NOT EXISTS idx_action ON tbl64158(");
        sb2.append(strF);
        sb2.append(");");
        sQLiteDatabase.execSQL(sb2.toString());
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
    }
}
