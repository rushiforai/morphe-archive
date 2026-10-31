package ww;

import android.content.Intent;
import android.os.Bundle;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final g.o f94746a;

    /* renamed from: b, reason: collision with root package name */
    public final Integer f94747b;

    /* renamed from: c, reason: collision with root package name */
    public final g.o f94748c;

    public a(g.o oVar, Integer num) {
        this.f94746a = oVar;
        this.f94747b = num;
        this.f94748c = oVar;
    }

    public final void a(Class cls, Bundle bundle, int i5) {
        g.o oVar = this.f94746a;
        Intent intentPutExtras = new Intent(oVar, (Class<?>) cls).putExtras(bundle);
        Intrinsics.f(intentPutExtras, "putExtras(...)");
        oVar.startActivityForResult(intentPutExtras, i5);
    }
}
