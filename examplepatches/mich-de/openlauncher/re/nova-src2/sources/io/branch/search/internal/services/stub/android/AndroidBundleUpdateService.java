package io.branch.search.internal.services.stub.android;

import android.app.job.JobParameters;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import io.branch.search.internal.C3412v3;
import io.branch.search.internal.C3429w3;
import io.branch.search.internal.InterfaceC3490zd;
import io.branch.search.internal.JobServiceC3392u0;
import io.branch.search.internal.Y1;
import io.branch.search.internal.util.CorosKt;
import kotlin.Metadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\u0018\u0000 \u00052\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0001\u0005B\u0007¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\u0006"}, d2 = {"Lio/branch/search/internal/services/stub/android/AndroidBundleUpdateService;", "Lio/branch/search/internal/u0;", "Lio/branch/search/internal/w3;", "<init>", "()V", k.O, "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public final class AndroidBundleUpdateService extends JobServiceC3392u0<C3429w3> {

    @NotNull
    public static final String TAG = "BundleUpdateService";

    public AndroidBundleUpdateService() {
        super(CorosKt.b(), new Function1<JobParameters, C3429w3>() { // from class: io.branch.search.internal.services.stub.android.AndroidBundleUpdateService.1
            @Override // kotlin.jvm.functions.Function1
            @NotNull
            public final C3429w3 invoke(@NotNull JobParameters it) {
                Intrinsics.g(it, "it");
                C3429w3.Companion.getClass();
                return C3429w3.a.a(it);
            }
        }, new Function1<Function0<? extends Y1>, InterfaceC3490zd<C3429w3>>() { // from class: io.branch.search.internal.services.stub.android.AndroidBundleUpdateService.2
            @Override // kotlin.jvm.functions.Function1
            @NotNull
            public final InterfaceC3490zd<C3429w3> invoke(@NotNull Function0<? extends Y1> bsiAssert) {
                Intrinsics.g(bsiAssert, "bsiAssert");
                C3412v3 c3412v3 = new C3412v3();
                ((Y1) bsiAssert.invoke()).a(c3412v3);
                return c3412v3.a();
            }
        }, null, 8, null);
    }
}
