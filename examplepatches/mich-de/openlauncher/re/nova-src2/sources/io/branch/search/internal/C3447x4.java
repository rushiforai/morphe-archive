package io.branch.search.internal;

import android.net.Uri;
import io.branch.search.internal.C4;
import io.branch.search.internal.InterfaceC3481z4;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* renamed from: io.branch.search.internal.x4, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3447x4 extends Lambda implements Function0<Unit> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ C3413v4 f66256a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ C3095c7 f66257b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3447x4(C3413v4 c3413v4, C3095c7 c3095c7) {
        super(0);
        this.f66256a = c3413v4;
        this.f66257b = c3095c7;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() throws Throwable {
        C3413v4 c3413v4 = this.f66256a;
        Uri uriA = InterfaceC3481z4.a.a(C4.m.f62287b, c3413v4.f66132d, new Pair[0]);
        E4<C3095c7> e42 = C4.m.f62288c;
        C3095c7 c3095c7 = this.f66257b;
        e42.getClass();
        c3413v4.a(uriA, E4.a(c3095c7));
        return Unit.f71706a;
    }
}
