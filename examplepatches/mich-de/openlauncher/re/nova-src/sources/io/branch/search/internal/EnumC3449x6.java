package io.branch.search.internal;

import ninja.sesame.lib.bridge.v1.ShortcutType;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.x6, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public enum EnumC3449x6 {
    App("app"),
    AppStore("app_store"),
    Contact(ShortcutType.CONTACT),
    HeroAd("hero_ad"),
    Shortcut("shortcut"),
    SearchMore("search_more"),
    HeroV2("hero_v2"),
    RelatedApps("related_apps"),
    /* JADX INFO: Fake field, exist only in values array */
    SuggestedInstall("suggested_installs_zs"),
    Unknown(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);


    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f66269a;

    /* renamed from: io.branch.search.internal.x6$a */
    public static final class a {
    }

    EnumC3449x6(String str) {
        this.f66269a = str;
    }

    @NotNull
    public final String a() {
        return this.f66269a;
    }

    @Override // java.lang.Enum
    @NotNull
    public final String toString() {
        return this.f66269a;
    }
}
