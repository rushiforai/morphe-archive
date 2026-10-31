package ba;

import android.content.Context;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteFullException;
import android.util.Log;
import ya.i0;

/* loaded from: classes.dex */
public final class c {

    /* renamed from: d, reason: collision with root package name */
    public static final String[] f17737d = {"icon_color", "label", "icon", "novaFlags", "componentName"};

    /* renamed from: e, reason: collision with root package name */
    public static final String[] f17738e = {"icon_color", "label", "novaFlags", "componentName"};

    /* renamed from: a, reason: collision with root package name */
    public final i0 f17739a;

    /* renamed from: c, reason: collision with root package name */
    public boolean f17741c = false;

    /* renamed from: b, reason: collision with root package name */
    public boolean f17740b = false;

    public c(Context context, String str, int i5) {
        this.f17739a = new i0(this, context, str, i5 + 2097152);
    }

    public final void a(String str, String[] strArr) {
        if (this.f17741c) {
            throw new IllegalStateException("Attempt to write to read-only database");
        }
        if (this.f17740b) {
            return;
        }
        try {
            this.f17739a.getWritableDatabase().delete("icons", str, strArr);
        } catch (SQLiteFullException e3) {
            Log.e("SQLiteCacheHelper", "Disk full, all write operations will be ignored", e3);
            this.f17740b = true;
        } catch (SQLiteException unused) {
        }
    }
}
