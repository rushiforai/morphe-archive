package h50;

import java.io.InputStream;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class m extends r50.c {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f59230a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final Long f59231b;

    /* renamed from: c, reason: collision with root package name */
    public final o50.e f59232c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f59233d;

    public m(k50.c cVar, o50.e eVar, Object obj) {
        this.f59233d = obj;
        o50.n nVar = cVar.f71119c;
        List list = o50.p.f79582a;
        String strH = nVar.h("Content-Length");
        this.f59231b = strH != null ? Long.valueOf(Long.parseLong(strH)) : null;
        if (eVar == null) {
            o50.e eVar2 = o50.b.f79540a;
            eVar = o50.b.f79541b;
        }
        this.f59232c = eVar;
    }

    @Override // r50.c
    public final Long a() {
        switch (this.f59230a) {
        }
        return this.f59231b;
    }

    @Override // r50.c
    public final o50.e b() {
        switch (this.f59230a) {
        }
        return this.f59232c;
    }

    public final io.ktor.utils.io.t d() {
        int i5 = this.f59230a;
        Object obj = this.f59233d;
        switch (i5) {
            case 0:
                return (io.ktor.utils.io.t) obj;
            default:
                InputStream inputStream = (InputStream) obj;
                a80.e eVar = t70.y0.f88884a;
                a80.d context = a80.d.f488c;
                b60.a pool = b60.b.f17579a;
                Intrinsics.g(inputStream, "<this>");
                Intrinsics.g(context, "context");
                Intrinsics.g(pool, "pool");
                return new a60.e(new e80.c(inputStream), context);
        }
    }

    public m(w50.e eVar, o50.e eVar2, Object obj) {
        this.f59233d = obj;
        o50.n nVar = ((k50.c) eVar.f93783a).f71119c;
        List list = o50.p.f79582a;
        String strH = nVar.h("Content-Length");
        this.f59231b = strH != null ? Long.valueOf(Long.parseLong(strH)) : null;
        if (eVar2 == null) {
            o50.e eVar3 = o50.b.f79540a;
            eVar2 = o50.b.f79541b;
        }
        this.f59232c = eVar2;
    }
}
