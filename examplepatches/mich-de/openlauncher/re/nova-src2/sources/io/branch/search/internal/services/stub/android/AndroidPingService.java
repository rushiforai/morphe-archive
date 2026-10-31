package io.branch.search.internal.services.stub.android;

import android.app.job.JobParameters;
import io.branch.search.internal.InterfaceC3490zd;
import io.branch.search.internal.JobServiceC3392u0;
import io.branch.search.internal.Wa;
import io.branch.search.internal.Y1;
import io.branch.search.internal.Za;
import io.branch.search.internal.util.CorosKt;
import kotlin.Metadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0016\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\u0007¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0005"}, d2 = {"Lio/branch/search/internal/services/stub/android/AndroidPingService;", "Lio/branch/search/internal/u0;", "Lio/branch/search/internal/Wa;", "<init>", "()V", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public class AndroidPingService extends JobServiceC3392u0<Wa> {
    public AndroidPingService() {
        super(CorosKt.b(), new Function1<JobParameters, Wa>() { // from class: io.branch.search.internal.services.stub.android.AndroidPingService.1
            @Override // kotlin.jvm.functions.Function1
            @NotNull
            public final Wa invoke(@NotNull JobParameters it) {
                Intrinsics.g(it, "it");
                Wa.Companion.getClass();
                return Wa.a.a(it);
            }
        }, new Function1<Function0<? extends Y1>, InterfaceC3490zd<Wa>>() { // from class: io.branch.search.internal.services.stub.android.AndroidPingService.2
            @Override // kotlin.jvm.functions.Function1
            @NotNull
            public final InterfaceC3490zd<Wa> invoke(@NotNull Function0<? extends Y1> bsiAssert) {
                Intrinsics.g(bsiAssert, "bsiAssert");
                Za za2 = new Za();
                ((Y1) bsiAssert.invoke()).a(za2);
                return za2.a();
            }
        }, null, 8, null);
    }
}
