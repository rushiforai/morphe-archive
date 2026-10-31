package io.branch.search.internal;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.Locale;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.tc, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3387tc implements W5 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Function0<u40.c> f65905a;

    public C3387tc(@NotNull K2 perfStatsProvider) {
        Intrinsics.g(perfStatsProvider, "perfStatsProvider");
        this.f65905a = perfStatsProvider;
    }

    @Override // io.branch.search.internal.W5
    public final void a(@NotNull String sessionId, @NotNull U5 collector) {
        String lastUpdateTime;
        String builtOnTime;
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(collector, "collector");
        u40.c cVar = (u40.c) this.f65905a.invoke();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS", Locale.US);
        try {
            lastUpdateTime = simpleDateFormat.format(new Date(cVar.f90570f));
        } catch (Throwable unused) {
            long j11 = cVar.f90570f;
            kotlin.text.a.a(10);
            lastUpdateTime = Long.toString(j11, 10);
            Intrinsics.f(lastUpdateTime, "toString(this, checkRadix(radix))");
        }
        try {
            cVar.getClass();
            builtOnTime = simpleDateFormat.format(new Date(1770812678925L));
        } catch (Throwable unused2) {
            cVar.getClass();
            kotlin.text.a.a(10);
            String string = Long.toString(1770812678925L, 10);
            Intrinsics.f(string, "toString(this, checkRadix(radix))");
            builtOnTime = string;
        }
        ArrayList arrayList = cVar.f90571g;
        ArrayList arrayList2 = new ArrayList();
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            Object next = it.next();
            if (((Number) next).doubleValue() > 0.0d) {
                arrayList2.add(next);
            }
        }
        Intrinsics.f(builtOnTime, "builtOnTime");
        long j12 = cVar.f90569e;
        long j13 = cVar.f90565a;
        long j14 = cVar.f90567c;
        Intrinsics.f(lastUpdateTime, "lastUpdateTime");
        collector.f63432i = new C3404uc("6.6.4", builtOnTime, j12, j13, j14, lastUpdateTime, arrayList2);
    }

    @Override // io.branch.search.internal.W5
    @NotNull
    public final String a() {
        return "ssml_diagnostic";
    }
}
