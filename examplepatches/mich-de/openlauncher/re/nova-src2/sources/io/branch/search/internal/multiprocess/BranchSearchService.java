package io.branch.search.internal.multiprocess;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import io.branch.search.internal.InterfaceC3315p7;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0016\u0018\u0000 \u00042\u00020\u0001:\u0001\u0005B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0006"}, d2 = {"Lio/branch/search/internal/multiprocess/BranchSearchService;", "Landroid/app/Service;", "<init>", "()V", k.O, "a", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public class BranchSearchService extends Service {

    public static final class b extends InterfaceC3315p7.a {
    }

    @Override // android.app.Service
    @NotNull
    public final IBinder onBind(@Nullable Intent intent) {
        return new b();
    }
}
