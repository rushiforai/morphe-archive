package com.apm.insight.e.a;

import android.content.ContentValues;
import android.database.sqlite.SQLiteDatabase;
import com.apm.insight.c;
import com.apm.insight.runtime.j;
import java.util.HashMap;

/* loaded from: classes.dex */
public abstract class a<T> {

    /* renamed from: a, reason: collision with root package name */
    protected final String f21564a;

    /* renamed from: b, reason: collision with root package name */
    private String f21565b = "_id";

    public a(String str) {
        this.f21564a = str;
    }

    public abstract ContentValues a(T t6);

    public abstract HashMap<String, String> a();

    public final void a(SQLiteDatabase sQLiteDatabase) {
        try {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("CREATE TABLE ");
            sb2.append(this.f21564a);
            sb2.append(" (_id INTEGER PRIMARY KEY AUTOINCREMENT, ");
            HashMap<String, String> mapA = a();
            for (String str : mapA.keySet()) {
                sb2.append(str);
                sb2.append(" ");
                sb2.append(mapA.get(str));
                sb2.append(",");
            }
            sb2.delete(sb2.length() - 1, sb2.length());
            sb2.append(")");
            sQLiteDatabase.execSQL(sb2.toString());
        } catch (Throwable th2) {
            c.a();
            j.a(th2, "NPTH_CATCH");
        }
    }

    public void a(SQLiteDatabase sQLiteDatabase, T t6) {
        if (sQLiteDatabase == null || t6 == null) {
            return;
        }
        try {
            sQLiteDatabase.insert(this.f21564a, null, a((a<T>) t6));
        } catch (Throwable th2) {
            com.apm.insight.a.b(th2);
        }
    }
}
