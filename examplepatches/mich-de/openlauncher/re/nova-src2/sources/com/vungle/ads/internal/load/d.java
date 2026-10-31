package com.vungle.ads.internal.load;

import com.vungle.ads.internal.util.t;
import com.vungle.ads.internal.util.u;
import java.io.File;
import kotlin.Result;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class d extends Lambda implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ i f46878a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f46879b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ com.vungle.ads.internal.downloader.e f46880c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ com.vungle.ads.internal.downloader.l f46881d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(i iVar, String str, c cVar, com.vungle.ads.internal.downloader.l lVar) {
        super(1);
        this.f46878a = iVar;
        this.f46879b = str;
        this.f46880c = cVar;
        this.f46881d = lVar;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        Object obj2 = ((Result) obj).f71688a;
        if (this.f46878a.f46898l.get()) {
            boolean z11 = u.f47714a;
            StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Template callback ignored after cancel: ");
            sbA.append(this.f46879b);
            t.a("BaseAdLoader", sbA.toString());
        } else {
            com.vungle.ads.internal.downloader.e eVar = this.f46880c;
            com.vungle.ads.internal.downloader.l lVar = this.f46881d;
            if (!(obj2 instanceof Result.Failure)) {
                eVar.a((File) obj2, lVar);
            }
            com.vungle.ads.internal.downloader.e eVar2 = this.f46880c;
            com.vungle.ads.internal.downloader.l lVar2 = this.f46881d;
            Throwable thA = Result.a(obj2);
            if (thA != null) {
                eVar2.a(new com.vungle.ads.internal.downloader.c(-1, thA, 1), lVar2);
            }
        }
        return Unit.f71706a;
    }
}
