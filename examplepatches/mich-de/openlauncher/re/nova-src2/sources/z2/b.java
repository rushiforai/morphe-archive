package z2;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.math.MathKt;

/* loaded from: classes.dex */
public final /* synthetic */ class b extends FunctionReferenceImpl implements Function2 {

    /* renamed from: d, reason: collision with root package name */
    public static final b f98023d = new b(2, MathKt.class, InneractiveMediationNameConsts.MAX, "max(II)I", 1);

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return Integer.valueOf(Math.max(((Number) obj).intValue(), ((Number) obj2).intValue()));
    }
}
