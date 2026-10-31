package jb;

import com.android.volley.VolleyError;

/* loaded from: classes2.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public final Object f69414a;

    /* renamed from: b, reason: collision with root package name */
    public final a f69415b;

    /* renamed from: c, reason: collision with root package name */
    public final VolleyError f69416c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f69417d;

    public m(Object obj, a aVar) {
        this.f69417d = false;
        this.f69414a = obj;
        this.f69415b = aVar;
        this.f69416c = null;
    }

    public m(VolleyError volleyError) {
        this.f69417d = false;
        this.f69414a = null;
        this.f69415b = null;
        this.f69416c = volleyError;
    }
}
