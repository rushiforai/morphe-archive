package com.amplitude.core;

import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.android.migration.RemnantDataMigration;
import com.amplitude.core.events.BaseEvent;
import com.amplitude.core.platform.EventPipeline;
import com.amplitude.core.utilities.http.ResponseHandler;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.c0;
import t70.j0;

@Metadata(d1 = {"\u0000L\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\t\n\u0002\u0010 \n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\bf\u0018\u00002\u00020\u0001:\u0001$J\u0018\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H¦@¢\u0006\u0004\b\u0005\u0010\u0006J \u0010\u000b\u001a\u00020\u00042\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\tH¦@¢\u0006\u0004\b\u000b\u0010\fJ\u0018\u0010\r\u001a\u00020\u00042\u0006\u0010\b\u001a\u00020\u0007H¦@¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010\u000f\u001a\u00020\u0004H¦@¢\u0006\u0004\b\u000f\u0010\u0010J\u0019\u0010\u0011\u001a\u0004\u0018\u00010\t2\u0006\u0010\b\u001a\u00020\u0007H&¢\u0006\u0004\b\u0011\u0010\u0012J\u0015\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00010\u0013H&¢\u0006\u0004\b\u0014\u0010\u0015J\u0018\u0010\u0017\u001a\u00020\t2\u0006\u0010\u0016\u001a\u00020\u0001H¦@¢\u0006\u0004\b\u0017\u0010\u0018J/\u0010\"\u001a\u00020!2\u0006\u0010\u001a\u001a\u00020\u00192\u0006\u0010\u001c\u001a\u00020\u001b2\u0006\u0010\u001e\u001a\u00020\u001d2\u0006\u0010 \u001a\u00020\u001fH&¢\u0006\u0004\b\"\u0010#ø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006%À\u0006\u0001"}, d2 = {"Lcom/amplitude/core/Storage;", b.f42142b, "Lcom/amplitude/core/events/BaseEvent;", DatabaseConstants.EVENT_FIELD, b.f42142b, "writeEvent", "(Lcom/amplitude/core/events/BaseEvent;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "Lcom/amplitude/core/Storage$Constants;", DatabaseConstants.KEY_FIELD, b.f42142b, "value", "write", "(Lcom/amplitude/core/Storage$Constants;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "remove", "(Lcom/amplitude/core/Storage$Constants;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "rollover", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "read", "(Lcom/amplitude/core/Storage$Constants;)Ljava/lang/String;", b.f42142b, "readEventsContent", "()Ljava/util/List;", "content", "getEventsString", "(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "Lcom/amplitude/core/platform/EventPipeline;", "eventPipeline", "Lcom/amplitude/core/Configuration;", "configuration", "Lt70/j0;", "scope", "Lt70/c0;", "storageDispatcher", "Lcom/amplitude/core/utilities/http/ResponseHandler;", "getResponseHandler", "(Lcom/amplitude/core/platform/EventPipeline;Lcom/amplitude/core/Configuration;Lt70/j0;Lt70/c0;)Lcom/amplitude/core/utilities/http/ResponseHandler;", "Constants", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public interface Storage {

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0002\b\r\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u000f\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006j\u0002\b\u0007j\u0002\b\bj\u0002\b\tj\u0002\b\nj\u0002\b\u000bj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000f¨\u0006\u0010"}, d2 = {"Lcom/amplitude/core/Storage$Constants;", b.f42142b, "rawVal", b.f42142b, "(Ljava/lang/String;ILjava/lang/String;)V", "getRawVal", "()Ljava/lang/String;", "LAST_EVENT_ID", "PREVIOUS_SESSION_ID", "LAST_EVENT_TIME", "OPT_OUT", "Events", "APP_VERSION", "APP_BUILD", "REMOTE_CONFIG", "REMOTE_CONFIG_TIMESTAMP", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final class Constants {
        private static final /* synthetic */ EnumEntries $ENTRIES;
        private static final /* synthetic */ Constants[] $VALUES;

        @NotNull
        private final String rawVal;
        public static final Constants LAST_EVENT_ID = new Constants("LAST_EVENT_ID", 0, RemnantDataMigration.LAST_EVENT_ID_KEY);
        public static final Constants PREVIOUS_SESSION_ID = new Constants("PREVIOUS_SESSION_ID", 1, RemnantDataMigration.PREVIOUS_SESSION_ID_KEY);
        public static final Constants LAST_EVENT_TIME = new Constants("LAST_EVENT_TIME", 2, RemnantDataMigration.LAST_EVENT_TIME_KEY);
        public static final Constants OPT_OUT = new Constants("OPT_OUT", 3, "opt_out");
        public static final Constants Events = new Constants("Events", 4, DatabaseConstants.EVENT_TABLE_NAME);
        public static final Constants APP_VERSION = new Constants("APP_VERSION", 5, "app_version");
        public static final Constants APP_BUILD = new Constants("APP_BUILD", 6, "app_build");
        public static final Constants REMOTE_CONFIG = new Constants("REMOTE_CONFIG", 7, "remote_config");
        public static final Constants REMOTE_CONFIG_TIMESTAMP = new Constants("REMOTE_CONFIG_TIMESTAMP", 8, "remote_config_timestamp");

        private static final /* synthetic */ Constants[] $values() {
            return new Constants[]{LAST_EVENT_ID, PREVIOUS_SESSION_ID, LAST_EVENT_TIME, OPT_OUT, Events, APP_VERSION, APP_BUILD, REMOTE_CONFIG, REMOTE_CONFIG_TIMESTAMP};
        }

        static {
            Constants[] constantsArr$values = $values();
            $VALUES = constantsArr$values;
            $ENTRIES = EnumEntriesKt.a(constantsArr$values);
        }

        private Constants(String str, int i5, String str2) {
            this.rawVal = str2;
        }

        @NotNull
        public static EnumEntries<Constants> getEntries() {
            return $ENTRIES;
        }

        public static Constants valueOf(String str) {
            return (Constants) Enum.valueOf(Constants.class, str);
        }

        public static Constants[] values() {
            return (Constants[]) $VALUES.clone();
        }

        @NotNull
        public final String getRawVal() {
            return this.rawVal;
        }
    }

    @Nullable
    Object getEventsString(@NotNull Object obj, @NotNull Continuation<? super String> continuation);

    @NotNull
    ResponseHandler getResponseHandler(@NotNull EventPipeline eventPipeline, @NotNull Configuration configuration, @NotNull j0 scope, @NotNull c0 storageDispatcher);

    @Nullable
    String read(@NotNull Constants key);

    @NotNull
    List<Object> readEventsContent();

    @Nullable
    Object remove(@NotNull Constants constants, @NotNull Continuation<? super Unit> continuation);

    @Nullable
    Object rollover(@NotNull Continuation<? super Unit> continuation);

    @Nullable
    Object write(@NotNull Constants constants, @NotNull String str, @NotNull Continuation<? super Unit> continuation);

    @Nullable
    Object writeEvent(@NotNull BaseEvent baseEvent, @NotNull Continuation<? super Unit> continuation);
}
