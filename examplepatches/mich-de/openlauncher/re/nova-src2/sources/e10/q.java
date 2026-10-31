package e10;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class q implements gy.w {

    /* renamed from: b, reason: collision with root package name */
    public static final q f51749b;

    /* renamed from: c, reason: collision with root package name */
    public static final q f51750c;

    /* renamed from: d, reason: collision with root package name */
    public static final q f51751d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ q[] f51752e;

    /* renamed from: a, reason: collision with root package name */
    public final int f51753a;

    static {
        q qVar = new q("AUTO", 0, 2132017526);
        f51749b = qVar;
        q qVar2 = new q("ON", 1, 2132020338);
        f51750c = qVar2;
        q qVar3 = new q("OFF", 2, 2132020337);
        f51751d = qVar3;
        q[] qVarArr = {qVar, qVar2, qVar3};
        f51752e = qVarArr;
        EnumEntriesKt.a(qVarArr);
    }

    public q(String str, int i5, int i11) {
        this.f51753a = i11;
    }

    public static q valueOf(String str) {
        return (q) Enum.valueOf(q.class, str);
    }

    public static q[] values() {
        return (q[]) f51752e.clone();
    }

    @Override // gy.n0
    public final void a(p1.o oVar, int i5) {
        lb0.b.h(this, oVar);
    }

    @Override // gy.w
    public final int b() {
        return this.f51753a;
    }
}
