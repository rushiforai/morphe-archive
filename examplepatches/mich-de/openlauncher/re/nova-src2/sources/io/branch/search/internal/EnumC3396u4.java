package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.u4, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public enum EnumC3396u4 {
    SuggestedLinks("suggested_links"),
    SuggestedApps("suggested_apps"),
    SuggestedInstalls("suggested_installs_zs"),
    AppSearch("app_search"),
    AppStoreSearch("app_store_search"),
    SearchMore("search_more"),
    RelatedApps("related_apps"),
    HeroAd("hero_ad"),
    /* JADX INFO: Fake field, exist only in values array */
    LocalSearch("local_search"),
    ShortcutSearch("shortcut_search"),
    HeroV2("hero_v2"),
    Unknown(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);


    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f66001a;

    /* renamed from: io.branch.search.internal.u4$a */
    public static final class a {
        @NotNull
        public static EnumC3396u4 a(@Nullable String str) {
            EnumC3396u4 enumC3396u4;
            EnumC3396u4[] enumC3396u4ArrValues = EnumC3396u4.values();
            int length = enumC3396u4ArrValues.length;
            int i5 = 0;
            while (true) {
                if (i5 >= length) {
                    enumC3396u4 = null;
                    break;
                }
                enumC3396u4 = enumC3396u4ArrValues[i5];
                if (Intrinsics.b(enumC3396u4.f66001a, str)) {
                    break;
                }
                i5++;
            }
            return enumC3396u4 == null ? EnumC3396u4.Unknown : enumC3396u4;
        }
    }

    EnumC3396u4(String str) {
        this.f66001a = str;
    }

    @NotNull
    public final String a() {
        return this.f66001a;
    }

    @Override // java.lang.Enum
    @NotNull
    public final String toString() {
        return this.f66001a;
    }
}
