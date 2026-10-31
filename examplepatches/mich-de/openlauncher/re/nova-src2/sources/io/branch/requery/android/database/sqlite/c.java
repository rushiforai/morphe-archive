package io.branch.requery.android.database.sqlite;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: i, reason: collision with root package name */
    public static final SimpleDateFormat f61803i = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");

    /* renamed from: a, reason: collision with root package name */
    public long f61804a;

    /* renamed from: b, reason: collision with root package name */
    public long f61805b;

    /* renamed from: c, reason: collision with root package name */
    public String f61806c;

    /* renamed from: d, reason: collision with root package name */
    public String f61807d;

    /* renamed from: e, reason: collision with root package name */
    public ArrayList f61808e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f61809f;

    /* renamed from: g, reason: collision with root package name */
    public RuntimeException f61810g;

    /* renamed from: h, reason: collision with root package name */
    public int f61811h;

    public final void a(StringBuilder sb2, boolean z11) {
        ArrayList arrayList;
        sb2.append(this.f61806c);
        if (this.f61809f) {
            sb2.append(" took ");
            sb2.append(this.f61805b - this.f61804a);
            sb2.append("ms");
        } else {
            sb2.append(" started ");
            sb2.append(System.currentTimeMillis() - this.f61804a);
            sb2.append("ms ago");
        }
        sb2.append(" - ");
        sb2.append(!this.f61809f ? "running" : this.f61810g != null ? "failed" : "succeeded");
        if (this.f61807d != null) {
            sb2.append(", sql=\"");
            sb2.append(SQLiteConnection.o.matcher(this.f61807d).replaceAll(" "));
            sb2.append("\"");
        }
        if (z11 && (arrayList = this.f61808e) != null && arrayList.size() != 0) {
            sb2.append(", bindArgs=[");
            int size = this.f61808e.size();
            for (int i5 = 0; i5 < size; i5++) {
                Object obj = this.f61808e.get(i5);
                if (i5 != 0) {
                    sb2.append(", ");
                }
                if (obj == null) {
                    sb2.append(AbstractJsonLexerKt.NULL);
                } else if (obj instanceof byte[]) {
                    sb2.append("<byte[]>");
                } else if (obj instanceof String) {
                    sb2.append("\"");
                    sb2.append((String) obj);
                    sb2.append("\"");
                } else {
                    sb2.append(obj);
                }
            }
            sb2.append("]");
        }
        if (this.f61810g != null) {
            sb2.append(", exception=\"");
            sb2.append(this.f61810g.getMessage());
            sb2.append("\"");
        }
    }
}
