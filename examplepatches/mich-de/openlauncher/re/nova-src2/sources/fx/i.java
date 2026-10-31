package fx;

import java.util.concurrent.ConcurrentHashMap;
import kotlin.collections.EmptySet;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import w70.i2;
import w70.o1;
import w70.u1;

/* loaded from: classes4.dex */
public final class i {

    /* renamed from: g, reason: collision with root package name */
    public static final g f56167g = new g();

    /* renamed from: b, reason: collision with root package name */
    public final gx.f f56169b;

    /* renamed from: d, reason: collision with root package name */
    public final i2 f56171d;

    /* renamed from: e, reason: collision with root package name */
    public final o1 f56172e;

    /* renamed from: f, reason: collision with root package name */
    public final h f56173f;

    /* renamed from: a, reason: collision with root package name */
    public final Function3 f56168a = new f(3, f56167g, g.class, "realStart", "realStart(Ljava/lang/String;ILcom/teslacoilsw/ads/internal/rewarded/RewardedPreloadBridge$Report;)V", 0, 0);

    /* renamed from: c, reason: collision with root package name */
    public final ConcurrentHashMap.KeySetView f56170c = ConcurrentHashMap.newKeySet();

    public i(gx.f fVar) {
        this.f56169b = fVar;
        i2 i2VarC = u1.c(EmptySet.f71734a);
        this.f56171d = i2VarC;
        this.f56172e = new o1(i2VarC);
        this.f56173f = new h(this);
    }

    public final void a(String adUnitId) {
        Intrinsics.g(adUnitId, "adUnitId");
        gx.f fVar = this.f56169b;
        if (((Number) fVar.invoke()).intValue() > 0 && this.f56170c.add(adUnitId)) {
            this.f56168a.invoke(adUnitId, fVar.invoke(), this.f56173f);
        }
    }
}
