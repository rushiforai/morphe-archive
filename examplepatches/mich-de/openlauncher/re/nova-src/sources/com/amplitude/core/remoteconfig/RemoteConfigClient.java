package com.amplitude.core.remoteconfig;

import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.core.events.Plan;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Map;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\bf\u0018\u00002\u00020\u0001:\u0003\t\n\u000bJ\u0018\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H&J\b\u0010\b\u001a\u00020\u0003H&ø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006\fÀ\u0006\u0001"}, d2 = {"Lcom/amplitude/core/remoteconfig/RemoteConfigClient;", b.f42142b, "subscribe", b.f42142b, DatabaseConstants.KEY_FIELD, "Lcom/amplitude/core/remoteconfig/RemoteConfigClient$Key;", "callback", "Lcom/amplitude/core/remoteconfig/RemoteConfigClient$RemoteConfigCallback;", "updateConfigs", "Key", "RemoteConfigCallback", "Source", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public interface RemoteConfigClient {

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0002\b\b\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u000f\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006j\u0002\b\u0007j\u0002\b\bj\u0002\b\tj\u0002\b\n¨\u0006\u000b"}, d2 = {"Lcom/amplitude/core/remoteconfig/RemoteConfigClient$Key;", b.f42142b, "value", b.f42142b, "(Ljava/lang/String;ILjava/lang/String;)V", "getValue", "()Ljava/lang/String;", "ANALYTICS_SDK", "DIAGNOSTICS", "SESSION_REPLAY_PRIVACY_CONFIG", "SESSION_REPLAY_SAMPLING_CONFIG", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final class Key {
        private static final /* synthetic */ EnumEntries $ENTRIES;
        private static final /* synthetic */ Key[] $VALUES;
        public static final Key ANALYTICS_SDK = new Key("ANALYTICS_SDK", 0, "analyticsSDK.androidSDK");
        public static final Key DIAGNOSTICS = new Key("DIAGNOSTICS", 1, "diagnostics.androidSDK");
        public static final Key SESSION_REPLAY_PRIVACY_CONFIG = new Key("SESSION_REPLAY_PRIVACY_CONFIG", 2, "sessionReplay.sr_android_privacy_config");
        public static final Key SESSION_REPLAY_SAMPLING_CONFIG = new Key("SESSION_REPLAY_SAMPLING_CONFIG", 3, "sessionReplay.sr_android_sampling_config");

        @NotNull
        private final String value;

        private static final /* synthetic */ Key[] $values() {
            return new Key[]{ANALYTICS_SDK, DIAGNOSTICS, SESSION_REPLAY_PRIVACY_CONFIG, SESSION_REPLAY_SAMPLING_CONFIG};
        }

        static {
            Key[] keyArr$values = $values();
            $VALUES = keyArr$values;
            $ENTRIES = EnumEntriesKt.a(keyArr$values);
        }

        private Key(String str, int i5, String str2) {
            this.value = str2;
        }

        @NotNull
        public static EnumEntries<Key> getEntries() {
            return $ENTRIES;
        }

        public static Key valueOf(String str) {
            return (Key) Enum.valueOf(Key.class, str);
        }

        public static Key[] values() {
            return (Key[]) $VALUES.clone();
        }

        @NotNull
        public final String getValue() {
            return this.value;
        }
    }

    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\bæ\u0080\u0001\u0018\u00002\u00020\u0001J0\u0010\u0002\u001a\u00020\u00032\u0016\u0010\u0004\u001a\u0012\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00010\u0005j\u0002`\u00072\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bH&ø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006\fÀ\u0006\u0001"}, d2 = {"Lcom/amplitude/core/remoteconfig/RemoteConfigClient$RemoteConfigCallback;", b.f42142b, "onUpdate", b.f42142b, "config", b.f42142b, b.f42142b, "Lcom/amplitude/core/remoteconfig/ConfigMap;", Plan.AMP_PLAN_SOURCE, "Lcom/amplitude/core/remoteconfig/RemoteConfigClient$Source;", "timestamp", b.f42142b, "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public interface RemoteConfigCallback {
        void onUpdate(@NotNull Map<String, ? extends Object> config, @NotNull Source source, long timestamp);
    }

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0004\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002j\u0002\b\u0003j\u0002\b\u0004¨\u0006\u0005"}, d2 = {"Lcom/amplitude/core/remoteconfig/RemoteConfigClient$Source;", b.f42142b, "(Ljava/lang/String;I)V", "CACHE", "REMOTE", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final class Source {
        private static final /* synthetic */ EnumEntries $ENTRIES;
        private static final /* synthetic */ Source[] $VALUES;
        public static final Source CACHE = new Source("CACHE", 0);
        public static final Source REMOTE = new Source("REMOTE", 1);

        private static final /* synthetic */ Source[] $values() {
            return new Source[]{CACHE, REMOTE};
        }

        static {
            Source[] sourceArr$values = $values();
            $VALUES = sourceArr$values;
            $ENTRIES = EnumEntriesKt.a(sourceArr$values);
        }

        private Source(String str, int i5) {
        }

        @NotNull
        public static EnumEntries<Source> getEntries() {
            return $ENTRIES;
        }

        public static Source valueOf(String str) {
            return (Source) Enum.valueOf(Source.class, str);
        }

        public static Source[] values() {
            return (Source[]) $VALUES.clone();
        }
    }

    void subscribe(@NotNull Key key, @NotNull RemoteConfigCallback callback);

    void updateConfigs();
}
