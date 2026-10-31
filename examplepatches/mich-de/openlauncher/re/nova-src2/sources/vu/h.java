package vu;

import android.content.Context;
import com.stripe.android.paymentsheet.addresselement.AddressElementActivityContract;
import pu.l0;
import vt.p0;

/* loaded from: classes4.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public final AddressElementActivityContract.Args f93176a;

    /* renamed from: b, reason: collision with root package name */
    public final h f93177b = this;

    /* renamed from: c, reason: collision with root package name */
    public final s40.h f93178c = s40.c.b(l0.f83058a);

    /* renamed from: d, reason: collision with root package name */
    public final f f93179d = new f(this);

    /* renamed from: e, reason: collision with root package name */
    public final g f93180e = new g(this);

    /* renamed from: f, reason: collision with root package name */
    public final s40.h f93181f;

    /* renamed from: g, reason: collision with root package name */
    public final s40.h f93182g;

    /* renamed from: h, reason: collision with root package name */
    public final bs.e f93183h;

    /* renamed from: i, reason: collision with root package name */
    public final s40.e f93184i;

    /* renamed from: j, reason: collision with root package name */
    public final av.a f93185j;

    /* renamed from: k, reason: collision with root package name */
    public final s40.h f93186k;

    /* renamed from: l, reason: collision with root package name */
    public final s40.h f93187l;

    public h(br.c cVar, br.a aVar, a aVar2, Context context, AddressElementActivityContract.Args args) {
        this.f93176a = args;
        this.f93181f = s40.c.b(new br.b(aVar, s40.c.b(e.f93169d), 0));
        s40.h hVarB = s40.c.b(new av.a(cVar, 1));
        this.f93182g = hVarB;
        int i5 = 4;
        this.f93183h = new bs.e(this.f93181f, hVarB, i5);
        s40.e eVarA = s40.e.a(context);
        this.f93184i = eVarA;
        this.f93185j = new av.a(new p0(eVarA, 4), 13);
        this.f93186k = s40.c.b(new br.b(aVar2, s40.c.b(new au.d(this.f93183h, new bs.b(this.f93184i, this.f93185j, s40.c.b(new av.a(aVar2, 10)), i5), this.f93182g, 5)), 6));
        this.f93187l = s40.c.b(new b(aVar2, this.f93184i, s40.e.a(args)));
    }
}
