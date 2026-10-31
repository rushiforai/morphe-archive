package com.amplitude.core.platform;

import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.core.Amplitude;
import com.amplitude.core.events.BaseEvent;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.util.TTConst;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0003\bf\u0018\u00002\u00020\u0001:\u0001\u0012J\u0012\u0010\f\u001a\u0004\u0018\u00010\r2\u0006\u0010\u000e\u001a\u00020\rH\u0016J\u0010\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0002\u001a\u00020\u0003H\u0016J\b\u0010\u0011\u001a\u00020\u0010H\u0016R\u0018\u0010\u0002\u001a\u00020\u0003X¦\u000e¢\u0006\f\u001a\u0004\b\u0004\u0010\u0005\"\u0004\b\u0006\u0010\u0007R\u0012\u0010\b\u001a\u00020\tX¦\u0004¢\u0006\u0006\u001a\u0004\b\n\u0010\u000bø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006\u0013À\u0006\u0001"}, d2 = {"Lcom/amplitude/core/platform/Plugin;", b.f42142b, "amplitude", "Lcom/amplitude/core/Amplitude;", "getAmplitude", "()Lcom/amplitude/core/Amplitude;", "setAmplitude", "(Lcom/amplitude/core/Amplitude;)V", TTConst.TRACK_TYPE, "Lcom/amplitude/core/platform/Plugin$Type;", "getType", "()Lcom/amplitude/core/platform/Plugin$Type;", "execute", "Lcom/amplitude/core/events/BaseEvent;", DatabaseConstants.EVENT_FIELD, "setup", b.f42142b, "teardown", "Type", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public interface Plugin {

    /* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
    /* JADX WARN: Unknown enum class pattern. Please report as an issue! */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0007\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002j\u0002\b\u0003j\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006j\u0002\b\u0007¨\u0006\b"}, d2 = {"Lcom/amplitude/core/platform/Plugin$Type;", b.f42142b, "(Ljava/lang/String;I)V", "Before", "Enrichment", "Destination", "Utility", "Observe", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final class Type {
        private static final /* synthetic */ EnumEntries $ENTRIES;
        private static final /* synthetic */ Type[] $VALUES;
        public static final Type Before = new Type("Before", 0);
        public static final Type Enrichment = new Type("Enrichment", 1);
        public static final Type Destination = new Type("Destination", 2);
        public static final Type Utility = new Type("Utility", 3);
        public static final Type Observe = new Type("Observe", 4);

        private static final /* synthetic */ Type[] $values() {
            return new Type[]{Before, Enrichment, Destination, Utility, Observe};
        }

        static {
            Type[] typeArr$values = $values();
            $VALUES = typeArr$values;
            $ENTRIES = EnumEntriesKt.a(typeArr$values);
        }

        private Type(String str, int i5) {
        }

        @NotNull
        public static EnumEntries<Type> getEntries() {
            return $ENTRIES;
        }

        public static Type valueOf(String str) {
            return (Type) Enum.valueOf(Type.class, str);
        }

        public static Type[] values() {
            return (Type[]) $VALUES.clone();
        }
    }

    @Nullable
    default BaseEvent execute(@NotNull BaseEvent event) {
        Intrinsics.g(event, "event");
        return event;
    }

    @NotNull
    Amplitude getAmplitude();

    @NotNull
    Type getType();

    void setAmplitude(@NotNull Amplitude amplitude);

    default void setup(@NotNull Amplitude amplitude) {
        Intrinsics.g(amplitude, "amplitude");
        setAmplitude(amplitude);
    }

    default void teardown() {
    }
}
