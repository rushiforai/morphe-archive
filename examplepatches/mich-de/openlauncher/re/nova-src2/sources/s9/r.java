package s9;

import android.util.FloatProperty;

/* loaded from: classes2.dex */
public final class r extends b {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ FloatProperty f86827b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f86828c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ s f86829d;

    public r(s sVar, FloatProperty floatProperty, Object obj) {
        this.f86829d = sVar;
        this.f86827b = floatProperty;
        this.f86828c = obj;
    }

    @Override // s9.b
    public final void a() {
        this.f86827b.set((FloatProperty) this.f86828c, Float.valueOf(this.f86829d.f86832c));
    }
}
