package q10;

import android.content.Context;
import gy.u1;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.enums.EnumEntriesKt;
import p1.o;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public abstract class l implements u1 {

    /* renamed from: c, reason: collision with root package name */
    public static final f f83451c;

    /* renamed from: d, reason: collision with root package name */
    public static final c f83452d;

    /* renamed from: e, reason: collision with root package name */
    public static final g f83453e;

    /* renamed from: f, reason: collision with root package name */
    public static final i f83454f;

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ l[] f83455g;

    /* renamed from: a, reason: collision with root package name */
    public final int f83456a;

    /* renamed from: b, reason: collision with root package name */
    public final int f83457b;

    static {
        c cVar = new c("ACCESSIBILITY", 0, 2132017198, 2132019446);
        f83452d = cVar;
        g gVar = new g("DEVICE_ADMIN", 1, 2132019447, 2132019448);
        f83453e = gVar;
        k kVar = new k("TIMEOUT", 2, 2132019451, 2132019453);
        i iVar = new i();
        f83454f = iVar;
        l[] lVarArr = {cVar, gVar, kVar, iVar};
        f83455g = lVarArr;
        EnumEntriesKt.a(lVarArr);
        f83451c = new f();
    }

    public l(String str, int i5, int i11, int i12) {
        this.f83456a = i11;
        this.f83457b = i12;
    }

    public static l valueOf(String str) {
        return (l) Enum.valueOf(l.class, str);
    }

    public static l[] values() {
        return (l[]) f83455g.clone();
    }

    @Override // gy.n0
    public final void a(o oVar, int i5) {
        ic.b.p(this, oVar);
    }

    @Override // gy.w
    public final int b() {
        return this.f83456a;
    }

    @Override // gy.u1
    public final int c() {
        return this.f83457b;
    }

    public Object d(Context context, SuspendLambda suspendLambda) {
        return Boolean.valueOf(g(context));
    }

    public abstract boolean g(Context context);

    public boolean h() {
        return true;
    }

    public abstract Object i(Context context, Continuation continuation);

    public abstract void j(Context context);
}
