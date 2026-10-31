package com.amplitude.core.platform.intercept;

import com.amplitude.common.Logger;
import com.amplitude.core.Amplitude;
import com.amplitude.core.Storage;
import com.amplitude.core.events.BaseEvent;
import com.amplitude.core.utilities.EventsFileStorage;
import com.amplitude.core.utilities.InMemoryStorage;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\bf\u0018\u0000 \u00072\u00020\u0001:\u0001\u0007J\u000e\u0010\u0002\u001a\u00020\u0003H¦@¢\u0006\u0002\u0010\u0004J\u0010\u0010\u0005\u001a\u0004\u0018\u00010\u0006H¦@¢\u0006\u0002\u0010\u0004ø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006\bÀ\u0006\u0001"}, d2 = {"Lcom/amplitude/core/platform/intercept/IdentifyInterceptStorageHandler;", b.f42142b, "clearIdentifyIntercepts", b.f42142b, "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getTransferIdentifyEvent", "Lcom/amplitude/core/events/BaseEvent;", k.O, "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public interface IdentifyInterceptStorageHandler {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = Companion.$$INSTANCE;

    @Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J \u0010\u0003\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\n¨\u0006\u000b"}, d2 = {"Lcom/amplitude/core/platform/intercept/IdentifyInterceptStorageHandler$Companion;", b.f42142b, "()V", "getIdentifyInterceptStorageHandler", "Lcom/amplitude/core/platform/intercept/IdentifyInterceptStorageHandler;", PlaceTypes.STORAGE, "Lcom/amplitude/core/Storage;", "logger", "Lcom/amplitude/common/Logger;", "amplitude", "Lcom/amplitude/core/Amplitude;", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final class Companion {
        static final /* synthetic */ Companion $$INSTANCE = new Companion();

        private Companion() {
        }

        @Nullable
        public final IdentifyInterceptStorageHandler getIdentifyInterceptStorageHandler(@NotNull Storage storage, @NotNull Logger logger, @NotNull Amplitude amplitude) {
            Intrinsics.g(storage, "storage");
            Intrinsics.g(logger, "logger");
            Intrinsics.g(amplitude, "amplitude");
            if (storage instanceof EventsFileStorage) {
                return new IdentifyInterceptFileStorageHandler((EventsFileStorage) storage, logger, amplitude);
            }
            if (storage instanceof InMemoryStorage) {
                return new IdentifyInterceptInMemoryStorageHandler((InMemoryStorage) storage);
            }
            logger.warn("Custom storage, identify intercept not started");
            return null;
        }
    }

    @Nullable
    Object clearIdentifyIntercepts(@NotNull Continuation<? super Unit> continuation);

    @Nullable
    Object getTransferIdentifyEvent(@NotNull Continuation<? super BaseEvent> continuation);
}
