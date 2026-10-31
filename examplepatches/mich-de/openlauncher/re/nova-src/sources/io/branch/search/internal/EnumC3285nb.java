package io.branch.search.internal;

import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.nb, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public enum EnumC3285nb {
    AppStore("app_store"),
    AdsLocalSearch("ads_local_search"),
    AdsZeroState("ads_zero_state"),
    AdsSuggestedApps("ads_zero_state_external");


    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f65390a;

    /* renamed from: io.branch.search.internal.nb$a */
    public static final class a {
        @JvmStatic
        @NotNull
        public static EnumC3285nb a(@NotNull String value) {
            Intrinsics.g(value, "value");
            EnumC3285nb enumC3285nb = EnumC3285nb.AppStore;
            if (value.equals("app_store")) {
                return enumC3285nb;
            }
            EnumC3285nb enumC3285nb2 = EnumC3285nb.AdsLocalSearch;
            if (value.equals("ads_local_search")) {
                return enumC3285nb2;
            }
            EnumC3285nb enumC3285nb3 = EnumC3285nb.AdsZeroState;
            if (value.equals("ads_zero_state")) {
                return enumC3285nb3;
            }
            EnumC3285nb enumC3285nb4 = EnumC3285nb.AdsSuggestedApps;
            if (value.equals("ads_zero_state_external")) {
                return enumC3285nb4;
            }
            throw new IllegalArgumentException("No enum constant ".concat(value));
        }
    }

    EnumC3285nb(String str) {
        this.f65390a = str;
    }

    @Override // java.lang.Enum
    @NotNull
    public final String toString() {
        return this.f65390a;
    }
}
