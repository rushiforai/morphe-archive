package com.amplitude.core.utilities;

import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.core.events.BaseEvent;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function3;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONArray;

@Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010 \n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\bf\u0018\u00002\u00020\u0001JN\u0010\u0002\u001a@\u0012\u0004\u0012\u00020\u0004\u0012\u0013\u0012\u00110\u0005¢\u0006\f\b\u0006\u0012\b\b\u0007\u0012\u0004\b\b(\b\u0012\u0013\u0012\u00110\t¢\u0006\f\b\u0006\u0012\b\b\u0007\u0012\u0004\b\b(\n\u0012\u0004\u0012\u00020\u000b\u0018\u00010\u0003j\u0004\u0018\u0001`\f2\u0006\u0010\r\u001a\u00020\tH&J\u0016\u0010\u000e\u001a\u00020\t2\u0006\u0010\u000f\u001a\u00020\u0001H¦@¢\u0006\u0002\u0010\u0010J\u000e\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00010\u0012H&J\u0010\u0010\u0013\u001a\u00020\u000b2\u0006\u0010\u000f\u001a\u00020\tH&J\u0010\u0010\u0014\u001a\u00020\u000b2\u0006\u0010\r\u001a\u00020\tH&J\u0010\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u000f\u001a\u00020\tH&J\u000e\u0010\u0017\u001a\u00020\u000bH¦@¢\u0006\u0002\u0010\u0018J\u0018\u0010\u0019\u001a\u00020\u000b2\u0006\u0010\u000f\u001a\u00020\t2\u0006\u0010\u001a\u001a\u00020\u001bH&ø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006\u001cÀ\u0006\u0001"}, d2 = {"Lcom/amplitude/core/utilities/EventsFileStorage;", b.f42142b, "getEventCallback", "Lkotlin/Function3;", "Lcom/amplitude/core/events/BaseEvent;", b.f42142b, "Lkotlin/ParameterName;", PendingUpgradeStore.KEY_NAME, "status", b.f42142b, PglCryptUtils.KEY_MESSAGE, b.f42142b, "Lcom/amplitude/core/EventCallBack;", "insertId", "getEventsString", "filePath", "(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "readEventsContent", b.f42142b, "releaseFile", "removeEventCallback", "removeFile", b.f42142b, "rollover", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "splitEventFile", DatabaseConstants.EVENT_TABLE_NAME, "Lorg/json/JSONArray;", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public interface EventsFileStorage {
    @Nullable
    Function3<BaseEvent, Integer, String, Unit> getEventCallback(@NotNull String insertId);

    @Nullable
    Object getEventsString(@NotNull Object obj, @NotNull Continuation<? super String> continuation);

    @NotNull
    List<Object> readEventsContent();

    void releaseFile(@NotNull String filePath);

    void removeEventCallback(@NotNull String insertId);

    boolean removeFile(@NotNull String filePath);

    @Nullable
    Object rollover(@NotNull Continuation<? super Unit> continuation);

    void splitEventFile(@NotNull String filePath, @NotNull JSONArray events);
}
