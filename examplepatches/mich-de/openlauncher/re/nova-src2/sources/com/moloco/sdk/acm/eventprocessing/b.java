package com.moloco.sdk.acm.eventprocessing;

import com.google.protobuf.n0;
import com.moloco.sdk.MetricsRequest;
import java.util.ArrayList;
import java.util.List;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@SourceDebugExtension
/* loaded from: classes3.dex */
public final class b implements com.moloco.sdk.acm.eventprocessing.a {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final f f36069a;

    public /* synthetic */ class a {

        /* renamed from: a, reason: collision with root package name */
        public static final /* synthetic */ int[] f36070a;

        static {
            int[] iArr = new int[com.moloco.sdk.acm.db.c.values().length];
            try {
                iArr[com.moloco.sdk.acm.db.c.f36033b.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                iArr[com.moloco.sdk.acm.db.c.f36032a.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            f36070a = iArr;
        }
    }

    public b(@NotNull f dataAgeChecker) {
        Intrinsics.g(dataAgeChecker, "dataAgeChecker");
        this.f36069a = dataAgeChecker;
    }

    @Override // com.moloco.sdk.acm.eventprocessing.a
    @NotNull
    public com.moloco.sdk.acm.http.d a(@NotNull List<com.moloco.sdk.acm.db.b> events) {
        Intrinsics.g(events, "events");
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        for (com.moloco.sdk.acm.db.b bVar : events) {
            if (!this.f36069a.a(bVar)) {
                int i5 = a.f36070a[bVar.h().ordinal()];
                if (i5 == 1) {
                    MetricsRequest.PostMetricsRequest.CountEvent.Builder builderAddAllTags = MetricsRequest.PostMetricsRequest.CountEvent.newBuilder().setName(bVar.j()).addAllTags(bVar.k());
                    Long lG = bVar.g();
                    if (lG != null) {
                        builderAddAllTags.setCount((int) lG.longValue());
                    }
                    n0 n0VarBuild = builderAddAllTags.build();
                    Intrinsics.f(n0VarBuild, "build(...)");
                    arrayList2.add(n0VarBuild);
                } else {
                    if (i5 != 2) {
                        throw new NoWhenBranchMatchedException();
                    }
                    MetricsRequest.PostMetricsRequest.TimerEvent.Builder builderAddAllTags2 = MetricsRequest.PostMetricsRequest.TimerEvent.newBuilder().setName(bVar.j()).addAllTags(bVar.k());
                    Long lG2 = bVar.g();
                    if (lG2 != null) {
                        builderAddAllTags2.setElapsedTimeMillis(lG2.longValue());
                    }
                    n0 n0VarBuild2 = builderAddAllTags2.build();
                    Intrinsics.f(n0VarBuild2, "build(...)");
                    arrayList.add(n0VarBuild2);
                }
            }
        }
        return new com.moloco.sdk.acm.http.d(arrayList2, arrayList);
    }
}
