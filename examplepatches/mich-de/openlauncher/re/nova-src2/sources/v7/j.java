package v7;

import android.content.Context;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public final e f92137a;

    /* renamed from: b, reason: collision with root package name */
    public final a f92138b;

    /* renamed from: c, reason: collision with root package name */
    public final e f92139c;

    /* renamed from: d, reason: collision with root package name */
    public final e f92140d;

    public j(Context context, a8.c cVar) {
        Context applicationContext = context.getApplicationContext();
        Intrinsics.f(applicationContext, "context.applicationContext");
        a aVar = new a(applicationContext, cVar, 0);
        Context applicationContext2 = context.getApplicationContext();
        Intrinsics.f(applicationContext2, "context.applicationContext");
        a aVar2 = new a(applicationContext2, cVar, 1);
        Context applicationContext3 = context.getApplicationContext();
        Intrinsics.f(applicationContext3, "context.applicationContext");
        String str = h.f92135a;
        g gVar = new g(applicationContext3, cVar);
        Context applicationContext4 = context.getApplicationContext();
        Intrinsics.f(applicationContext4, "context.applicationContext");
        a aVar3 = new a(applicationContext4, cVar, 2);
        this.f92137a = aVar;
        this.f92138b = aVar2;
        this.f92139c = gVar;
        this.f92140d = aVar3;
    }
}
