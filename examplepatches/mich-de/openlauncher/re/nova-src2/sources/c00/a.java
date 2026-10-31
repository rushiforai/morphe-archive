package c00;

import android.content.Context;
import android.database.Cursor;
import android.database.CursorWrapper;

/* loaded from: classes.dex */
public final class a extends CursorWrapper {

    /* renamed from: a, reason: collision with root package name */
    public final Context f19032a;

    /* renamed from: b, reason: collision with root package name */
    public final int f19033b;

    /* renamed from: c, reason: collision with root package name */
    public final int f19034c;

    /* renamed from: d, reason: collision with root package name */
    public final int f19035d;

    /* renamed from: e, reason: collision with root package name */
    public final int f19036e;

    /* renamed from: f, reason: collision with root package name */
    public final int f19037f;

    public a(Context context, Cursor cursor) {
        super(cursor);
        this.f19032a = context;
        this.f19033b = cursor.getColumnIndexOrThrow("componentName");
        this.f19034c = cursor.getColumnIndexOrThrow("profileId");
        this.f19035d = cursor.getColumnIndexOrThrow("title");
        this.f19036e = cursor.getColumnIndexOrThrow("customIconSource");
        this.f19037f = cursor.getColumnIndexOrThrow("flags");
    }
}
