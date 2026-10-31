package r70;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.MatchResult;

/* loaded from: classes5.dex */
public final /* synthetic */ class d extends FunctionReferenceImpl implements Function1 {

    /* renamed from: d, reason: collision with root package name */
    public static final d f85611d = new d(1, MatchResult.class, "next", "next()Lkotlin/text/MatchResult;", 0);

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        MatchResult p02 = (MatchResult) obj;
        Intrinsics.g(p02, "p0");
        return p02.next();
    }
}
