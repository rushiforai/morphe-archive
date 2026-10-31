package es;

import android.content.Context;
import com.stripe.android.link.LinkActivityContract;
import fs.r0;
import java.util.Set;

/* loaded from: classes4.dex */
public final class p implements s40.d {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f52997a;

    /* renamed from: b, reason: collision with root package name */
    public final s40.h f52998b;

    /* renamed from: c, reason: collision with root package name */
    public final s40.h f52999c;

    /* renamed from: d, reason: collision with root package name */
    public final s40.h f53000d;

    /* renamed from: e, reason: collision with root package name */
    public final s40.h f53001e;

    public /* synthetic */ p(int i5, s40.d dVar, s40.h hVar, s40.h hVar2, s40.h hVar3) {
        this.f52997a = i5;
        this.f52998b = hVar;
        this.f52999c = hVar2;
        this.f53000d = dVar;
        this.f53001e = hVar3;
    }

    @Override // w60.a
    public final Object get() {
        switch (this.f52997a) {
            case 0:
                return new com.stripe.android.link.b0((bu.c) this.f52998b.get(), (String) this.f52999c.get(), (LinkActivityContract) this.f53000d.get(), (r0) this.f53001e.get());
            default:
                return new hq.m((Context) this.f52998b.get(), (Set) this.f52999c.get(), (jt.b) this.f53000d.get(), (fr.l) this.f53001e.get());
        }
    }
}
