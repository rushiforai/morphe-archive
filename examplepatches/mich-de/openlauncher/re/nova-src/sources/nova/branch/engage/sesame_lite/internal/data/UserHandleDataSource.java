package nova.branch.engage.sesame_lite.internal.data;

import android.os.UserHandle;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.List;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0000\bf\u0018\u00002\u00020\u0001J\b\u0010\u0002\u001a\u00020\u0003H&J\b\u0010\u0004\u001a\u00020\u0005H&J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u00072\u0006\u0010\b\u001a\u00020\u0005H&J\u0017\u0010\t\u001a\u0004\u0018\u00010\u00052\u0006\u0010\n\u001a\u00020\u0007H&¢\u0006\u0002\u0010\u000bJ\u0012\u0010\f\u001a\u0004\u0018\u00010\r2\u0006\u0010\n\u001a\u00020\u0007H&J\u000e\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00070\u000fH&¨\u0006\u0010"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/data/UserHandleDataSource;", b.f42142b, "onUsersChanged", b.f42142b, "getCurrentUserId", b.f42142b, "getUserHandle", "Landroid/os/UserHandle;", "userId", "getUserHandleId", "userHandle", "(Landroid/os/UserHandle;)Ljava/lang/Long;", "getCacheEntity", "Lnova/branch/engage/sesame_lite/internal/data/UserCacheEntity;", "getUserHandles", b.f42142b, "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public interface UserHandleDataSource {
    @Nullable
    UserCacheEntity getCacheEntity(@NotNull UserHandle userHandle);

    long getCurrentUserId();

    @Nullable
    UserHandle getUserHandle(long userId);

    @Nullable
    Long getUserHandleId(@NotNull UserHandle userHandle);

    @NotNull
    List<UserHandle> getUserHandles();

    void onUsersChanged();
}
