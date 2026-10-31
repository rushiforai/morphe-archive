package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public final class u2 implements o3 {

    /* renamed from: b, reason: collision with root package name */
    public static final u2 f33551b = new u2(0);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f33552a;

    public /* synthetic */ u2(int i5) {
        this.f33552a = i5;
    }

    public static final m3 a(Object obj, Object obj2) {
        m3 m3VarA = (m3) obj;
        m3 m3Var = (m3) obj2;
        if (!m3Var.isEmpty()) {
            if (!m3VarA.f33456a) {
                m3VarA = m3VarA.a();
            }
            m3VarA.d();
            if (!m3Var.isEmpty()) {
                m3VarA.putAll(m3Var);
            }
        }
        return m3VarA;
    }

    @Override // com.google.android.gms.internal.play_billing.o3
    public w3 zzb(Class cls) {
        switch (this.f33552a) {
            case 0:
                if (!x2.class.isAssignableFrom(cls)) {
                    throw new IllegalArgumentException("Unsupported message type: ".concat(cls.getName()));
                }
                try {
                    return (w3) x2.m(cls.asSubclass(x2.class)).j(3);
                } catch (Exception e3) {
                    throw new RuntimeException("Unable to get message info for ".concat(cls.getName()), e3);
                }
            default:
                throw new IllegalStateException("This should never be called.");
        }
    }

    @Override // com.google.android.gms.internal.play_billing.o3
    public boolean zzc(Class cls) {
        switch (this.f33552a) {
            case 0:
                return x2.class.isAssignableFrom(cls);
            default:
                return false;
        }
    }
}
