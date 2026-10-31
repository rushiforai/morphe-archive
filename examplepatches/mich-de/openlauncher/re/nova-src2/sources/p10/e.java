package p10;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final class e {

    /* renamed from: f, reason: collision with root package name */
    public static final y5.f f81743f = v70.o.h("checkin_last_claim_ms");

    /* renamed from: a, reason: collision with root package name */
    public final s f81744a;

    /* renamed from: b, reason: collision with root package name */
    public final t5.g f81745b;

    /* renamed from: c, reason: collision with root package name */
    public final Function0 f81746c;

    /* renamed from: d, reason: collision with root package name */
    public final Function1 f81747d;

    /* renamed from: e, reason: collision with root package name */
    public final iv.c f81748e;

    public e(s sVar, t5.g gVar, iv.c cVar) {
        a aVar = a.f81691d;
        b bVar = b.f81706d;
        this.f81744a = sVar;
        this.f81745b = gVar;
        this.f81746c = aVar;
        this.f81747d = bVar;
        this.f81748e = cVar;
    }

    public static final boolean a(e eVar, long j11, Long l9) {
        Function1 function1 = eVar.f81747d;
        if (l9 != null) {
            return j11 >= l9.longValue() && ((Number) function1.invoke(Long.valueOf(j11))).longValue() > ((Number) function1.invoke(l9)).longValue();
        }
        return true;
    }
}
