package io.ktor.client.call;

import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KClass;
import l50.b;
import o50.m;
import o50.p;
import r70.f;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00060\u0001j\u0002`\u0002¨\u0006\u0003"}, d2 = {"Lio/ktor/client/call/NoTransformationFoundException;", "Ljava/lang/UnsupportedOperationException;", "Lkotlin/UnsupportedOperationException;", "ktor-client-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class NoTransformationFoundException extends UnsupportedOperationException {

    /* renamed from: a, reason: collision with root package name */
    public final String f66540a;

    public NoTransformationFoundException(b bVar, KClass from, KClass to2) {
        Intrinsics.g(from, "from");
        Intrinsics.g(to2, "to");
        StringBuilder sb2 = new StringBuilder("\n        Expected response body of the type '");
        sb2.append(to2);
        sb2.append("' but was '");
        sb2.append(from);
        sb2.append("'\n        In response from `");
        sb2.append(bVar.b().c().getUrl());
        sb2.append("`\n        Response status `");
        sb2.append(bVar.f());
        sb2.append("`\n        Response header `ContentType: ");
        m mVarA = bVar.a();
        List list = p.f79582a;
        sb2.append(mVarA.d("Content-Type"));
        sb2.append("` \n        Request header `Accept: ");
        sb2.append(bVar.b().c().a().d("Accept"));
        sb2.append("`\n        \n        You can read how to resolve NoTransformationFoundException at FAQ: \n        https://ktor.io/docs/faq.html#no-transformation-found-exception\n    ");
        this.f66540a = f.o0(sb2.toString());
    }

    @Override // java.lang.Throwable
    public final String getMessage() {
        return this.f66540a;
    }
}
