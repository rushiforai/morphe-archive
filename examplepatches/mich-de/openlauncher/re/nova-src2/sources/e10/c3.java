package e10;

import e00.z6;
import kotlin.Metadata;
import kotlin.coroutines.Continuation;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bf\u0018\u00002\u00020\u0001J\u001a\u0010\u0005\u001a\u00020\u00042\b\b\u0001\u0010\u0003\u001a\u00020\u0002H§@¢\u0006\u0004\b\u0005\u0010\u0006J.\u0010\f\u001a\u00020\u000b2\b\b\u0001\u0010\u0007\u001a\u00020\u00022\b\b\u0003\u0010\t\u001a\u00020\b2\b\b\u0003\u0010\n\u001a\u00020\bH§@¢\u0006\u0004\b\f\u0010\r¨\u0006\u000e"}, d2 = {"Le10/c3;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "versionCode", "Le10/f3;", "a", "(ILkotlin/coroutines/Continuation;)Ljava/lang/Object;", "fromVersionCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "betaType", "packageName", "Le00/z6;", "b", "(ILjava/lang/String;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public interface c3 {
    @gb0.f("/remoteconfig/{versionCode}")
    @Nullable
    Object a(@gb0.s("versionCode") int i5, @NotNull Continuation<? super f3> continuation);

    @gb0.f("/latestVersion")
    @Nullable
    Object b(@gb0.t("changelog_from_versionCode") int i5, @gb0.t("betaType") @NotNull String str, @gb0.t("packageName") @NotNull String str2, @NotNull Continuation<? super z6> continuation);
}
