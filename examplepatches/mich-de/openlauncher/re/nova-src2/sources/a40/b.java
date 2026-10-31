package a40;

import com.amplitude.android.TrackingOptions;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import java.util.List;
import kotlin.Metadata;
import kotlin.coroutines.Continuation;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\bf\u0018\u00002\u00020\u0001:\u0001\u0018J$\u0010\u0006\u001a\u00020\u00052\b\b\u0001\u0010\u0003\u001a\u00020\u00022\b\b\u0001\u0010\u0004\u001a\u00020\u0002H§@¢\u0006\u0004\b\u0006\u0010\u0007J4\u0010\r\u001a\b\u0012\u0004\u0012\u00020\f0\u000b2\b\b\u0001\u0010\b\u001a\u00020\u00022\b\b\u0001\u0010\u0004\u001a\u00020\u00022\b\b\u0003\u0010\n\u001a\u00020\tH§@¢\u0006\u0004\b\r\u0010\u000eJ$\u0010\u0010\u001a\u00020\u000f2\b\b\u0001\u0010\u0003\u001a\u00020\u00022\b\b\u0001\u0010\u0004\u001a\u00020\u0002H§@¢\u0006\u0004\b\u0010\u0010\u0007J*\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00110\u000b2\b\b\u0001\u0010\b\u001a\u00020\u00022\b\b\u0001\u0010\u0004\u001a\u00020\u0002H§@¢\u0006\u0004\b\u0012\u0010\u0007J*\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u00140\u000b2\b\b\u0001\u0010\u0013\u001a\u00020\u00022\b\b\u0001\u0010\u0004\u001a\u00020\u0002H§@¢\u0006\u0004\b\u0015\u0010\u0007J*\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00140\u000b2\b\b\u0001\u0010\u0013\u001a\u00020\u00022\b\b\u0001\u0010\u0004\u001a\u00020\u0002H§@¢\u0006\u0004\b\u0016\u0010\u0007J$\u0010\u0017\u001a\u00020\u00052\b\b\u0001\u0010\b\u001a\u00020\u00022\b\b\u0001\u0010\u0004\u001a\u00020\u0002H§@¢\u0006\u0004\b\u0017\u0010\u0007¨\u0006\u0019"}, d2 = {"La40/b;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "latLong", "localeCode", "La40/t;", "e", "(Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "locationKey", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "details", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "La40/k;", "b", "(Ljava/lang/String;Ljava/lang/String;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "La40/w;", "a", "La40/e;", "c", "q", "La40/q;", "d", InneractiveMediationDefs.GENDER_FEMALE, "g", "a40/a", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface b {

    /* renamed from: a, reason: collision with root package name */
    public static final a f189a = a.f186a;

    @gb0.f("forecasts/v1/minute")
    @Nullable
    Object a(@gb0.t("q") @NotNull String str, @gb0.t(TrackingOptions.AMP_TRACKING_OPTION_LANGUAGE) @NotNull String str2, @NotNull Continuation<? super w> continuation);

    @gb0.f("currentconditions/v1/{locationKey}")
    @Nullable
    Object b(@gb0.s("locationKey") @NotNull String str, @gb0.t(TrackingOptions.AMP_TRACKING_OPTION_LANGUAGE) @NotNull String str2, @gb0.t("details") boolean z11, @NotNull Continuation<? super List<k>> continuation);

    @gb0.f("alerts/v1/{locationKey}")
    @Nullable
    Object c(@gb0.s("locationKey") @NotNull String str, @gb0.t(TrackingOptions.AMP_TRACKING_OPTION_LANGUAGE) @NotNull String str2, @NotNull Continuation<? super List<e>> continuation);

    @gb0.f("locations/v1/cities/autocomplete")
    @Nullable
    Object d(@gb0.t("q") @NotNull String str, @gb0.t(TrackingOptions.AMP_TRACKING_OPTION_LANGUAGE) @NotNull String str2, @NotNull Continuation<? super List<q>> continuation);

    @gb0.f("locations/v1/cities/geoposition/search")
    @Nullable
    Object e(@gb0.t("q") @NotNull String str, @gb0.t(TrackingOptions.AMP_TRACKING_OPTION_LANGUAGE) @NotNull String str2, @NotNull Continuation<? super t> continuation);

    @gb0.f("locations/v1/translate")
    @Nullable
    Object f(@gb0.t("q") @NotNull String str, @gb0.t(TrackingOptions.AMP_TRACKING_OPTION_LANGUAGE) @NotNull String str2, @NotNull Continuation<? super List<q>> continuation);

    @gb0.f("locations/v1/{locationKey}")
    @Nullable
    Object g(@gb0.s("locationKey") @NotNull String str, @gb0.t(TrackingOptions.AMP_TRACKING_OPTION_LANGUAGE) @NotNull String str2, @NotNull Continuation<? super t> continuation);
}
