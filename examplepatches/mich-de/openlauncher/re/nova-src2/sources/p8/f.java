package p8;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import j00.k0;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringWriter;
import java.util.ArrayList;
import kotlin.Unit;
import kotlin.io.CloseableKt;
import o9.x2;
import r70.k;
import tx.f4;

/* loaded from: classes2.dex */
public final class f implements Closeable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f82451a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f82452b;

    public /* synthetic */ f(Object obj, int i5) {
        this.f82451a = i5;
        this.f82452b = obj;
    }

    public ArrayList a(int i5) throws IOException {
        ArrayList arrayList = new ArrayList();
        Cursor cursorQuery = ((x2) this.f82452b).getReadableDatabase().query("searches", new String[]{"query", "searched_at"}, null, null, null, null, "searched_at DESC", String.valueOf(i5));
        while (cursorQuery.moveToNext()) {
            try {
                arrayList.add(new f4(cursorQuery.getString(0), cursorQuery.getLong(1)));
            } finally {
            }
        }
        Unit unit = Unit.f71706a;
        cursorQuery.close();
        return arrayList;
    }

    public String b() throws IOException {
        InputStreamReader inputStreamReader = new InputStreamReader(((InputStream[]) this.f82452b)[1], qo.f.f84295b);
        try {
            StringWriter stringWriter = new StringWriter();
            char[] cArr = new char[1024];
            while (true) {
                int i5 = inputStreamReader.read(cArr);
                if (i5 == -1) {
                    String string = stringWriter.toString();
                    inputStreamReader.close();
                    return string;
                }
                stringWriter.write(cArr, 0, i5);
            }
        } catch (Throwable th2) {
            inputStreamReader.close();
            throw th2;
        }
    }

    public void c(String str, k0 k0Var) throws IOException {
        x2 x2Var = (x2) this.f82452b;
        if (k.U0(str)) {
            return;
        }
        x2Var.getWritableDatabase().delete("searches", "searched_at < ?", new String[]{String.valueOf(System.currentTimeMillis() - 7776000000L)});
        ContentValues contentValues = new ContentValues();
        contentValues.put("query", k.u1(str).toString());
        contentValues.put("searched_at", Long.valueOf(System.currentTimeMillis()));
        x2Var.getWritableDatabase().insertWithOnConflict("searches", null, contentValues, 5);
        Cursor cursorRawQuery = x2Var.getReadableDatabase().rawQuery("SELECT COUNT(*) FROM searches WHERE query = ? AND searched_at >= ?", new String[]{str, String.valueOf(System.currentTimeMillis() - 604800000)});
        try {
            int i5 = cursorRawQuery.moveToFirst() ? cursorRawQuery.getInt(0) : 0;
            cursorRawQuery.close();
            if (i5 >= 3) {
                k0Var.invoke(str, Integer.valueOf(i5));
            }
        } catch (Throwable th2) {
            try {
                throw th2;
            } catch (Throwable th3) {
                CloseableKt.a(cursorRawQuery, th2);
                throw th3;
            }
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        switch (this.f82451a) {
            case 0:
                ((b) this.f82452b).close();
                break;
            case 1:
                for (InputStream inputStream : (InputStream[]) this.f82452b) {
                    qo.f.a(inputStream);
                }
                break;
            default:
                ((x2) this.f82452b).close();
                break;
        }
    }

    public f(Context context) {
        this.f82451a = 2;
        this.f82452b = new x2(context, "nova_search_history.db", null, 1, 2);
    }
}
