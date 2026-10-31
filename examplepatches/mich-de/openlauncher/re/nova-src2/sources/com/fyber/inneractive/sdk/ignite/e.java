package com.fyber.inneractive.sdk.ignite;

import java.util.Iterator;

/* loaded from: classes.dex */
public final class e implements r {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ h f28474a;

    public e(h hVar) {
        this.f28474a = hVar;
    }

    @Override // com.fyber.inneractive.sdk.ignite.r
    public final void a(String str, String str2) {
        Iterator it = this.f28474a.f28485g.iterator();
        while (it.hasNext()) {
            r rVar = (r) it.next();
            if (rVar != null) {
                rVar.a(str, str2);
            }
        }
    }

    @Override // com.fyber.inneractive.sdk.ignite.r
    public final void b(String str) {
        Iterator it = this.f28474a.f28485g.iterator();
        while (it.hasNext()) {
            r rVar = (r) it.next();
            if (rVar != null) {
                rVar.b(str);
            }
        }
    }

    @Override // com.fyber.inneractive.sdk.ignite.r
    public final void c(String str) {
        Iterator it = this.f28474a.f28485g.iterator();
        while (it.hasNext()) {
            r rVar = (r) it.next();
            if (rVar != null) {
                rVar.c(str);
            }
        }
    }

    @Override // com.fyber.inneractive.sdk.ignite.r
    public final void a(String str, int i5, double d5) {
        Iterator it = this.f28474a.f28485g.iterator();
        while (it.hasNext()) {
            r rVar = (r) it.next();
            if (rVar != null) {
                rVar.a(str, i5, d5);
            }
        }
    }

    @Override // com.fyber.inneractive.sdk.ignite.r
    public final void a(String str) {
        Iterator it = this.f28474a.f28485g.iterator();
        while (it.hasNext()) {
            r rVar = (r) it.next();
            if (rVar != null) {
                rVar.a(str);
            }
        }
    }

    @Override // com.fyber.inneractive.sdk.ignite.r
    public final void a(String str, String str2, String str3) {
        Iterator it = this.f28474a.f28485g.iterator();
        while (it.hasNext()) {
            r rVar = (r) it.next();
            if (rVar != null) {
                rVar.a(str, str2, str3);
            }
        }
    }
}
