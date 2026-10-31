package com.instabridge.ai.profile;

import android.content.Context;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.instabridge.ai.profile.model.UserProfile;
import java.util.Locale;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.k;
import r70.l;

@Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001B'\b\u0007\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0007¢\u0006\u0004\b\b\u0010\tJ\u000e\u0010\u001c\u001a\u00020\f2\u0006\u0010\u001d\u001a\u00020\u001eR\"\u0010\n\u001a\n\u0012\u0004\u0012\u00020\f\u0018\u00010\u000bX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\r\u0010\u000e\"\u0004\b\u000f\u0010\u0010R\u000e\u0010\u0011\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0015\u001a\u00020\u0016X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0017\u001a\u00020\u0016X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0018\u001a\u00020\u0016X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0019\u001a\u00020\u0016X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u001a\u001a\u00020\u001bX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u001f"}, d2 = {"Lcom/instabridge/ai/profile/ProfileAccountSection;", "Landroid/widget/LinearLayout;", "context", "Landroid/content/Context;", "attrs", "Landroid/util/AttributeSet;", "defStyleAttr", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Landroid/content/Context;Landroid/util/AttributeSet;I)V", "onSignInRequested", "Lkotlin/Function0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getOnSignInRequested", "()Lkotlin/jvm/functions/Function0;", "setOnSignInRequested", "(Lkotlin/jvm/functions/Function0;)V", "signedInContent", "anonymousContent", "nameRow", "emailRow", "avatarInitial", "Landroid/widget/TextView;", "nameValue", "emailValue", "accountIdValue", "signInButton", "Landroid/widget/Button;", "bind", "profile", "Lcom/instabridge/ai/profile/model/UserProfile;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class ProfileAccountSection extends LinearLayout {
    public static final int $stable = 8;

    @NotNull
    private final TextView accountIdValue;

    @NotNull
    private final LinearLayout anonymousContent;

    @NotNull
    private final TextView avatarInitial;

    @NotNull
    private final LinearLayout emailRow;

    @NotNull
    private final TextView emailValue;

    @NotNull
    private final LinearLayout nameRow;

    @NotNull
    private final TextView nameValue;

    @Nullable
    private Function0<Unit> onSignInRequested;

    @NotNull
    private final Button signInButton;

    @NotNull
    private final LinearLayout signedInContent;

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public ProfileAccountSection(@NotNull Context context) {
        this(context, null, 0, 6, null);
        Intrinsics.g(context, "context");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void _init_$lambda$0(ProfileAccountSection profileAccountSection, View view) {
        Function0<Unit> function0 = profileAccountSection.onSignInRequested;
        if (function0 != null) {
            function0.invoke();
        }
    }

    public final void bind(@NotNull UserProfile profile) {
        Intrinsics.g(profile, "profile");
        if (!profile.isLoggedIn()) {
            this.signedInContent.setVisibility(8);
            this.anonymousContent.setVisibility(0);
            return;
        }
        this.signedInContent.setVisibility(0);
        this.anonymousContent.setVisibility(8);
        String name = profile.getName();
        if (name == null || k.U0(name)) {
            this.nameRow.setVisibility(8);
        } else {
            this.nameRow.setVisibility(0);
            TextView textView = this.avatarInitial;
            String strValueOf = String.valueOf(l.D1(profile.getName()));
            Intrinsics.e(strValueOf, "null cannot be cast to non-null type java.lang.String");
            String upperCase = strValueOf.toUpperCase(Locale.ROOT);
            Intrinsics.f(upperCase, "toUpperCase(...)");
            textView.setText(upperCase);
            this.nameValue.setText(profile.getName());
        }
        String email = profile.getEmail();
        if (email == null || k.U0(email)) {
            this.emailRow.setVisibility(8);
        } else {
            this.emailRow.setVisibility(0);
            this.emailValue.setText(profile.getEmail());
        }
        this.accountIdValue.setText(profile.getPersonId());
    }

    @Nullable
    public final Function0<Unit> getOnSignInRequested() {
        return this.onSignInRequested;
    }

    public final void setOnSignInRequested(@Nullable Function0<Unit> function0) {
        this.onSignInRequested = function0;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public ProfileAccountSection(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        this(context, attributeSet, 0, 4, null);
        Intrinsics.g(context, "context");
    }

    public /* synthetic */ ProfileAccountSection(Context context, AttributeSet attributeSet, int i5, int i11, DefaultConstructorMarker defaultConstructorMarker) {
        this(context, (i11 & 2) != 0 ? null : attributeSet, (i11 & 4) != 0 ? 0 : i5);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public ProfileAccountSection(@NotNull Context context, @Nullable AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        Intrinsics.g(context, "context");
        LayoutInflater.from(context).inflate(2131624006, (ViewGroup) this, true);
        View viewFindViewById = findViewById(2131427382);
        Intrinsics.f(viewFindViewById, "findViewById(...)");
        this.signedInContent = (LinearLayout) viewFindViewById;
        View viewFindViewById2 = findViewById(2131427379);
        Intrinsics.f(viewFindViewById2, "findViewById(...)");
        this.anonymousContent = (LinearLayout) viewFindViewById2;
        View viewFindViewById3 = findViewById(2131428413);
        Intrinsics.f(viewFindViewById3, "findViewById(...)");
        this.nameRow = (LinearLayout) viewFindViewById3;
        View viewFindViewById4 = findViewById(2131427947);
        Intrinsics.f(viewFindViewById4, "findViewById(...)");
        this.emailRow = (LinearLayout) viewFindViewById4;
        View viewFindViewById5 = findViewById(2131427529);
        Intrinsics.f(viewFindViewById5, "findViewById(...)");
        this.avatarInitial = (TextView) viewFindViewById5;
        View viewFindViewById6 = findViewById(2131428414);
        Intrinsics.f(viewFindViewById6, "findViewById(...)");
        this.nameValue = (TextView) viewFindViewById6;
        View viewFindViewById7 = findViewById(2131427948);
        Intrinsics.f(viewFindViewById7, "findViewById(...)");
        this.emailValue = (TextView) viewFindViewById7;
        View viewFindViewById8 = findViewById(2131427380);
        Intrinsics.f(viewFindViewById8, "findViewById(...)");
        this.accountIdValue = (TextView) viewFindViewById8;
        View viewFindViewById9 = findViewById(2131428863);
        Intrinsics.f(viewFindViewById9, "findViewById(...)");
        Button button = (Button) viewFindViewById9;
        this.signInButton = button;
        button.setOnClickListener(new ay.k(this, 5));
    }
}
