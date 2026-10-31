package mo;

import b0.p;
import b2.r;
import i2.s;
import kotlin.Unit;
import kotlin.jvm.functions.Function4;
import kotlin.jvm.internal.Intrinsics;
import l1.g9;
import q3.v;

/* loaded from: classes3.dex */
public final class m implements Function4 {

    /* renamed from: a, reason: collision with root package name */
    public static final m f76592a = new m();

    @Override // kotlin.jvm.functions.Function4
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
        p AnimatedContent = (p) obj;
        String message = (String) obj2;
        int iIntValue = ((Number) obj4).intValue();
        Intrinsics.g(AnimatedContent, "$this$AnimatedContent");
        Intrinsics.g(message, "message");
        g9.b(message, androidx.compose.foundation.layout.d.k(androidx.compose.foundation.layout.e.e(r.f17024a, 1.0f), 14, 4), s.b(0.62f, s.f61140f), w20.h.j(13), new v(1), null, null, 0L, null, null, w20.h.j(17), 0, false, 0, 0, null, null, (p1.o) obj3, ((iIntValue >> 3) & 14) | 3504, 6, 130016);
        return Unit.f71706a;
    }
}
