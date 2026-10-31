package com.instabridge.ai.profile;

import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import com.instabridge.ai.consent.ConsentSettingsView;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;

@Metadata(d1 = {"\u0000R\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001B'\b\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u0012\b\b\u0002\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\b\u0010\tJ9\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u000b\u001a\u00020\n2\u0010\b\u0002\u0010\u000e\u001a\n\u0012\u0004\u0012\u00020\r\u0018\u00010\f2\u0010\b\u0002\u0010\u0010\u001a\n\u0012\u0004\u0012\u00020\u000f\u0018\u00010\f¢\u0006\u0004\b\u0012\u0010\u0013J\r\u0010\u0014\u001a\u00020\u0011¢\u0006\u0004\b\u0014\u0010\u0015J\u0015\u0010\u0018\u001a\u00020\u00112\u0006\u0010\u0017\u001a\u00020\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\r\u0010\u001a\u001a\u00020\u0011¢\u0006\u0004\b\u001a\u0010\u0015R\u0014\u0010\u001c\u001a\u00020\u001b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u001c\u0010\u001dR\u0014\u0010\u001f\u001a\u00020\u001e8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u001f\u0010 ¨\u0006!"}, d2 = {"Lcom/instabridge/ai/profile/ProfileConsentSection;", "Landroid/widget/LinearLayout;", "Landroid/content/Context;", "context", "Landroid/util/AttributeSet;", "attrs", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "defStyleAttr", "<init>", "(Landroid/content/Context;Landroid/util/AttributeSet;I)V", "Lt70/j0;", "scope", "Lj/c;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "permissionLauncher", "Landroid/content/Intent;", "settingsLauncher", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "initialize", "(Lt70/j0;Lj/c;Lj/c;)V", "loadState", "()V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "granted", "handlePermissionResult", "(Z)V", "handleSettingsResult", "Lcom/instabridge/ai/consent/ConsentSettingsView;", "consentSettingsView", "Lcom/instabridge/ai/consent/ConsentSettingsView;", "Landroid/widget/FrameLayout;", "container", "Landroid/widget/FrameLayout;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class ProfileConsentSection extends LinearLayout {
    public static final int $stable = 8;

    @NotNull
    private final ConsentSettingsView consentSettingsView;

    @NotNull
    private final FrameLayout container;

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public ProfileConsentSection(@NotNull Context context) {
        this(context, null, 0, 6, null);
        Intrinsics.g(context, "context");
    }

    public static /* synthetic */ void initialize$default(ProfileConsentSection profileConsentSection, j0 j0Var, j.c cVar, j.c cVar2, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            cVar = null;
        }
        if ((i5 & 4) != 0) {
            cVar2 = null;
        }
        profileConsentSection.initialize(j0Var, cVar, cVar2);
    }

    public final void handlePermissionResult(boolean granted) {
        this.consentSettingsView.a(granted);
    }

    public final void handleSettingsResult() {
        this.consentSettingsView.b();
    }

    public final void initialize(@NotNull j0 scope, @Nullable j.c permissionLauncher, @Nullable j.c settingsLauncher) {
        Intrinsics.g(scope, "scope");
        this.consentSettingsView.d(scope, permissionLauncher, settingsLauncher);
    }

    public final void loadState() {
        this.consentSettingsView.f();
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public ProfileConsentSection(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        this(context, attributeSet, 0, 4, null);
        Intrinsics.g(context, "context");
    }

    public /* synthetic */ ProfileConsentSection(Context context, AttributeSet attributeSet, int i5, int i11, DefaultConstructorMarker defaultConstructorMarker) {
        this(context, (i11 & 2) != 0 ? null : attributeSet, (i11 & 4) != 0 ? 0 : i5);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public ProfileConsentSection(@NotNull Context context, @Nullable AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        Intrinsics.g(context, "context");
        LayoutInflater.from(context).inflate(2131624008, (ViewGroup) this, true);
        View viewFindViewById = findViewById(2131427739);
        Intrinsics.f(viewFindViewById, "findViewById(...)");
        FrameLayout frameLayout = (FrameLayout) viewFindViewById;
        this.container = frameLayout;
        ConsentSettingsView consentSettingsView = new ConsentSettingsView(context, null, 6);
        this.consentSettingsView = consentSettingsView;
        frameLayout.addView(consentSettingsView);
    }
}
