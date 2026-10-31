package ww;

import android.content.Context;
import android.util.TypedValue;

/* loaded from: classes4.dex */
public final class s0 {

    /* renamed from: a, reason: collision with root package name */
    public final Context f94837a;

    /* renamed from: b, reason: collision with root package name */
    public final int f94838b = a(16843829).data;

    /* renamed from: c, reason: collision with root package name */
    public final int f94839c = a(16843817).data;

    /* renamed from: d, reason: collision with root package name */
    public final int f94840d = a(16842806).data;

    /* renamed from: e, reason: collision with root package name */
    public final int f94841e = a(16842808).data;

    /* renamed from: f, reason: collision with root package name */
    public final int f94842f = a(16843827).data;

    public s0(Context context) {
        this.f94837a = context;
    }

    public final TypedValue a(int i5) {
        TypedValue typedValue = new TypedValue();
        this.f94837a.getTheme().resolveAttribute(i5, typedValue, true);
        return typedValue;
    }
}
