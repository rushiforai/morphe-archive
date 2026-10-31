package com.amplitude.android;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Set;
import kotlin.Metadata;
import kotlin.collections.c;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\t\b\u0086\u0081\u0002\u0018\u0000 \t2\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\tB\u0007\b\u0002¢\u0006\u0002\u0010\u0002j\u0002\b\u0003j\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006j\u0002\b\u0007j\u0002\b\b¨\u0006\n"}, d2 = {"Lcom/amplitude/android/AutocaptureOption;", b.f42142b, "(Ljava/lang/String;I)V", "SESSIONS", "APP_LIFECYCLES", "DEEP_LINKS", "SCREEN_VIEWS", "ELEMENT_INTERACTIONS", "FRUSTRATION_INTERACTIONS", k.O, "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class AutocaptureOption {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ AutocaptureOption[] $VALUES;

    @NotNull
    private static final Set<AutocaptureOption> ALL;
    public static final AutocaptureOption APP_LIFECYCLES;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE;
    public static final AutocaptureOption DEEP_LINKS;
    public static final AutocaptureOption ELEMENT_INTERACTIONS;
    public static final AutocaptureOption FRUSTRATION_INTERACTIONS;
    public static final AutocaptureOption SCREEN_VIEWS;
    public static final AutocaptureOption SESSIONS;

    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u0017\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Lcom/amplitude/android/AutocaptureOption$Companion;", b.f42142b, "()V", "ALL", b.f42142b, "Lcom/amplitude/android/AutocaptureOption;", "getALL", "()Ljava/util/Set;", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final Set<AutocaptureOption> getALL() {
            return AutocaptureOption.ALL;
        }

        private Companion() {
        }
    }

    private static final /* synthetic */ AutocaptureOption[] $values() {
        return new AutocaptureOption[]{SESSIONS, APP_LIFECYCLES, DEEP_LINKS, SCREEN_VIEWS, ELEMENT_INTERACTIONS, FRUSTRATION_INTERACTIONS};
    }

    static {
        AutocaptureOption autocaptureOption = new AutocaptureOption("SESSIONS", 0);
        SESSIONS = autocaptureOption;
        AutocaptureOption autocaptureOption2 = new AutocaptureOption("APP_LIFECYCLES", 1);
        APP_LIFECYCLES = autocaptureOption2;
        AutocaptureOption autocaptureOption3 = new AutocaptureOption("DEEP_LINKS", 2);
        DEEP_LINKS = autocaptureOption3;
        AutocaptureOption autocaptureOption4 = new AutocaptureOption("SCREEN_VIEWS", 3);
        SCREEN_VIEWS = autocaptureOption4;
        AutocaptureOption autocaptureOption5 = new AutocaptureOption("ELEMENT_INTERACTIONS", 4);
        ELEMENT_INTERACTIONS = autocaptureOption5;
        AutocaptureOption autocaptureOption6 = new AutocaptureOption("FRUSTRATION_INTERACTIONS", 5);
        FRUSTRATION_INTERACTIONS = autocaptureOption6;
        AutocaptureOption[] autocaptureOptionArr$values = $values();
        $VALUES = autocaptureOptionArr$values;
        $ENTRIES = EnumEntriesKt.a(autocaptureOptionArr$values);
        INSTANCE = new Companion(null);
        ALL = c.f1(new AutocaptureOption[]{autocaptureOption, autocaptureOption2, autocaptureOption3, autocaptureOption4, autocaptureOption5, autocaptureOption6});
    }

    private AutocaptureOption(String str, int i5) {
    }

    @NotNull
    public static EnumEntries<AutocaptureOption> getEntries() {
        return $ENTRIES;
    }

    public static AutocaptureOption valueOf(String str) {
        return (AutocaptureOption) Enum.valueOf(AutocaptureOption.class, str);
    }

    public static AutocaptureOption[] values() {
        return (AutocaptureOption[]) $VALUES.clone();
    }
}
