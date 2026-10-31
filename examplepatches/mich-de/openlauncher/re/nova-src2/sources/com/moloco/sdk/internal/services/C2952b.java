package com.moloco.sdk.internal.services;

import android.content.Context;
import android.provider.Settings;
import android.view.accessibility.AccessibilityManager;
import android.view.accessibility.CaptioningManager;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: com.moloco.sdk.internal.services.b, reason: case insensitive filesystem */
/* loaded from: classes.dex */
public final class C2952b implements InterfaceC2951a {

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public static final a f37657b = new a(null);

    /* renamed from: c, reason: collision with root package name */
    public static final int f37658c = 8;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public static final String f37659d = "AccessibilityInfoService";

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f37660a;

    /* renamed from: com.moloco.sdk.internal.services.b$a */
    public static final class a {
        public /* synthetic */ a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public a() {
        }
    }

    public C2952b(@NotNull Context context) {
        Intrinsics.g(context, "context");
        this.f37660a = context;
    }

    @Override // com.moloco.sdk.internal.services.InterfaceC2951a
    public boolean a() {
        try {
            return Settings.Secure.getInt(this.f37660a.getContentResolver(), "reduce_bright_colors_activated") == 1;
        } catch (Settings.SettingNotFoundException | SecurityException unused) {
            return false;
        }
    }

    @Override // com.moloco.sdk.internal.services.InterfaceC2951a
    public boolean b() {
        Object systemService = this.f37660a.getSystemService("accessibility");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.view.accessibility.AccessibilityManager");
        return ((AccessibilityManager) systemService).isEnabled() && Settings.Secure.getInt(this.f37660a.getContentResolver(), "accessibility_large_pointer_icon", 0) == 1;
    }

    @Override // com.moloco.sdk.internal.services.InterfaceC2951a
    public boolean c() {
        try {
            Object systemService = this.f37660a.getSystemService("captioning");
            Intrinsics.e(systemService, "null cannot be cast to non-null type android.view.accessibility.CaptioningManager");
            return ((CaptioningManager) systemService).isEnabled();
        } catch (Exception unused) {
            return false;
        }
    }

    @Override // com.moloco.sdk.internal.services.InterfaceC2951a
    public float getFontScale() {
        Object systemService = this.f37660a.getSystemService("accessibility");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.view.accessibility.AccessibilityManager");
        if (((AccessibilityManager) systemService).isEnabled()) {
            return this.f37660a.getResources().getConfiguration().fontScale;
        }
        return 1.0f;
    }
}
