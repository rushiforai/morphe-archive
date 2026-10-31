package b00;

import java.util.ArrayList;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import w70.i2;
import w70.u1;

/* loaded from: classes.dex */
public final class p1 implements ey.u {

    /* renamed from: b, reason: collision with root package name */
    public final r10.o1 f16435b;

    /* renamed from: c, reason: collision with root package name */
    public final b20.e f16436c;

    /* renamed from: d, reason: collision with root package name */
    public final String f16437d;

    /* renamed from: e, reason: collision with root package name */
    public final ArrayList f16438e;

    /* renamed from: f, reason: collision with root package name */
    public final com.teslacoilsw.launcher.search.hero.c f16439f;

    /* renamed from: g, reason: collision with root package name */
    public final i2 f16440g = u1.c(Boolean.FALSE);

    /* renamed from: h, reason: collision with root package name */
    public final x1.e f16441h = new x1.e(new n1(this, 0), true, -1284240480);

    /* renamed from: i, reason: collision with root package name */
    public final x1.e f16442i = new x1.e(new n1(this, 1), true, 627777185);

    /* renamed from: j, reason: collision with root package name */
    public final a7.f f16443j = new a7.f(this, 1);

    /* renamed from: k, reason: collision with root package name */
    public final t f16444k = new t(this, 3);

    /* renamed from: l, reason: collision with root package name */
    public final String f16445l;

    public p1(r10.o1 o1Var, b20.e eVar, String str, ArrayList arrayList, com.teslacoilsw.launcher.search.hero.c cVar) {
        this.f16435b = o1Var;
        this.f16436c = eVar;
        this.f16437d = str;
        this.f16438e = arrayList;
        this.f16439f = cVar;
        this.f16445l = o1Var.f85198a;
    }

    @Override // ey.u
    public final Function0 a() {
        return this.f16443j;
    }

    @Override // ey.u
    public final Function1 b() {
        return this.f16444k;
    }

    @Override // ey.u
    public final x1.e getIcon() {
        return this.f16441h;
    }

    @Override // ey.u
    public final x1.e getText() {
        return this.f16442i;
    }

    @Override // ey.u
    public final String getTitle() {
        return this.f16445l;
    }
}
