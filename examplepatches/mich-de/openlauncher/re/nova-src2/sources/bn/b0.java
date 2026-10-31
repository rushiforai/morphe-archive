package bn;

import android.content.Context;
import android.os.Process;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.LazyKt;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class b0 {

    /* renamed from: a, reason: collision with root package name */
    public final Context f18128a;

    /* renamed from: b, reason: collision with root package name */
    public final a70.d f18129b;

    /* renamed from: c, reason: collision with root package name */
    public final int f18130c;

    /* renamed from: d, reason: collision with root package name */
    public final a70.d f18131d;

    /* renamed from: e, reason: collision with root package name */
    public final a70.d f18132e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f18133f;

    public b0(Context appContext, j1 uuidGenerator) {
        Intrinsics.g(appContext, "appContext");
        Intrinsics.g(uuidGenerator, "uuidGenerator");
        this.f18128a = appContext;
        final int i5 = 0;
        this.f18129b = LazyKt.a(new Function0(this) { // from class: bn.a0

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ b0 f18122b;

            {
                this.f18122b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i5) {
                    case 0:
                        return ((d0) this.f18122b.f18132e.getValue()).f18167a;
                    default:
                        return bh.g.Z(this.f18122b.f18128a);
                }
            }
        });
        this.f18130c = Process.myPid();
        this.f18131d = LazyKt.a(new as.c(uuidGenerator, 6));
        final int i11 = 1;
        this.f18132e = LazyKt.a(new Function0(this) { // from class: bn.a0

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ b0 f18122b;

            {
                this.f18122b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i11) {
                    case 0:
                        return ((d0) this.f18122b.f18132e.getValue()).f18167a;
                    default:
                        return bh.g.Z(this.f18122b.f18128a);
                }
            }
        });
    }

    public final String a() {
        return (String) this.f18129b.getValue();
    }

    public final Map b(Map map) {
        a70.d dVar = this.f18131d;
        if (map == null) {
            return b70.k.e0(new Pair(a(), new z(Process.myPid(), (String) dVar.getValue())));
        }
        LinkedHashMap linkedHashMapU0 = MapsKt.u0(map);
        linkedHashMapU0.put(a(), new z(Process.myPid(), (String) dVar.getValue()));
        return MapsKt.s0(linkedHashMapU0);
    }
}
