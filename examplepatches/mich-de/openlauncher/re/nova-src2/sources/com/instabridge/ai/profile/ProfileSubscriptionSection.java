package com.instabridge.ai.profile;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.instabridge.ai.chat.model.UsageInfo;
import com.instabridge.ai.profile.model.SubscriptionInfo;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.k;

@Metadata(d1 = {"\u0000V\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0011\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\b\n\u0002\u0010\u000e\n\u0002\b\u0007\b\u0007\u0018\u00002\u00020\u0001B'\b\u0007\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0007¢\u0006\u0004\b\b\u0010\tJ\u001e\u0010*\u001a\u00020\f2\u0006\u0010+\u001a\u00020,2\u0006\u0010-\u001a\u00020.2\u0006\u0010/\u001a\u000200J\u0010\u00101\u001a\u00020\f2\u0006\u00102\u001a\u00020,H\u0003J\u0010\u00103\u001a\u00020\f2\u0006\u00102\u001a\u00020,H\u0003J\u0010\u00104\u001a\u00020\f2\u0006\u00102\u001a\u00020,H\u0002J\u0010\u00105\u001a\u00020\f2\u0006\u0010-\u001a\u00020.H\u0002J\u0018\u00106\u001a\u00020\f2\u0006\u00102\u001a\u00020,2\u0006\u0010/\u001a\u000200H\u0002J\u001e\u00107\u001a\u00020\f2\u0006\u00108\u001a\u0002092\f\u0010:\u001a\b\u0012\u0004\u0012\u00020\f0\u000bH\u0003J\b\u0010;\u001a\u00020\fH\u0002J\u0010\u0010<\u001a\u0002092\u0006\u0010=\u001a\u000209H\u0002J\u0010\u0010>\u001a\u00020\u00072\u0006\u0010?\u001a\u00020\u0007H\u0002R\"\u0010\n\u001a\n\u0012\u0004\u0012\u00020\f\u0018\u00010\u000bX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\r\u0010\u000e\"\u0004\b\u000f\u0010\u0010R\"\u0010\u0011\u001a\n\u0012\u0004\u0012\u00020\f\u0018\u00010\u000bX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0012\u0010\u000e\"\u0004\b\u0013\u0010\u0010R\"\u0010\u0014\u001a\n\u0012\u0004\u0012\u00020\f\u0018\u00010\u000bX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0015\u0010\u000e\"\u0004\b\u0016\u0010\u0010R\"\u0010\u0017\u001a\n\u0012\u0004\u0012\u00020\f\u0018\u00010\u000bX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0018\u0010\u000e\"\u0004\b\u0019\u0010\u0010R\"\u0010\u001a\u001a\n\u0012\u0004\u0012\u00020\f\u0018\u00010\u000bX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u001b\u0010\u000e\"\u0004\b\u001c\u0010\u0010R\u000e\u0010\u001d\u001a\u00020\u001eX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u001f\u001a\u00020\u001eX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010 \u001a\u00020\u001eX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010!\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\"\u001a\u00020\u001eX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010#\u001a\u00020\u001eX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010$\u001a\u00020\u001eX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010%\u001a\u00020\u001eX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010&\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010'\u001a\u00020(X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010)\u001a\u00020(X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006@"}, d2 = {"Lcom/instabridge/ai/profile/ProfileSubscriptionSection;", "Landroid/widget/LinearLayout;", "context", "Landroid/content/Context;", "attrs", "Landroid/util/AttributeSet;", "defStyleAttr", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Landroid/content/Context;Landroid/util/AttributeSet;I)V", "onSignInRequested", "Lkotlin/Function0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getOnSignInRequested", "()Lkotlin/jvm/functions/Function0;", "setOnSignInRequested", "(Lkotlin/jvm/functions/Function0;)V", "onViewPlans", "getOnViewPlans", "setOnViewPlans", "onChangePlan", "getOnChangePlan", "setOnChangePlan", "onManageStripe", "getOnManageStripe", "setOnManageStripe", "onResubscribe", "getOnResubscribe", "setOnResubscribe", "planName", "Landroid/widget/TextView;", "statusBadge", "statusNotice", "detailsRow", "detailsLabel", "detailsValue", "usageCount", "usageResets", "actionButtonsContainer", "dateParser", "Ljava/text/SimpleDateFormat;", "dateFormatter", "bind", "subscription", "Lcom/instabridge/ai/profile/model/SubscriptionInfo;", "usage", "Lcom/instabridge/ai/chat/model/UsageInfo;", "isLoggedIn", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "bindPlanAndStatus", "sub", "bindStatusNotice", "bindDetails", "bindUsage", "bindActionButtons", "addOutlineButton", "text", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "onClick", "openGooglePlaySubscriptions", "formatDate", "isoDate", "dpToPx", "dp", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class ProfileSubscriptionSection extends LinearLayout {
    public static final int $stable = 8;

    @NotNull
    private final LinearLayout actionButtonsContainer;

    @NotNull
    private final SimpleDateFormat dateFormatter;

    @NotNull
    private final SimpleDateFormat dateParser;

    @NotNull
    private final TextView detailsLabel;

    @NotNull
    private final LinearLayout detailsRow;

    @NotNull
    private final TextView detailsValue;

    @Nullable
    private Function0<Unit> onChangePlan;

    @Nullable
    private Function0<Unit> onManageStripe;

    @Nullable
    private Function0<Unit> onResubscribe;

    @Nullable
    private Function0<Unit> onSignInRequested;

    @Nullable
    private Function0<Unit> onViewPlans;

    @NotNull
    private final TextView planName;

    @NotNull
    private final TextView statusBadge;

    @NotNull
    private final TextView statusNotice;

    @NotNull
    private final TextView usageCount;

    @NotNull
    private final TextView usageResets;

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public ProfileSubscriptionSection(@NotNull Context context) {
        this(context, null, 0, 6, null);
        Intrinsics.g(context, "context");
    }

    @SuppressLint({"NewApi"})
    private final void addOutlineButton(String text, Function0<Unit> onClick) {
        Button button = new Button(getContext());
        button.setText(text);
        button.setTextSize(14.0f);
        button.setAllCaps(false);
        button.setTextColor(button.getContext().getColor(2131099741));
        button.setBackgroundResource(2131231104);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, dpToPx(48));
        layoutParams.topMargin = dpToPx(8);
        button.setLayoutParams(layoutParams);
        button.setOnClickListener(new f(onClick, 0));
        this.actionButtonsContainer.addView(button);
    }

    private final void bindActionButtons(SubscriptionInfo sub, boolean isLoggedIn) {
        this.actionButtonsContainer.removeAllViews();
        if (sub.isFree() && !isLoggedIn) {
            String string = getContext().getString(2132017370);
            Intrinsics.f(string, "getString(...)");
            final int i5 = 0;
            addOutlineButton(string, new Function0(this) { // from class: com.instabridge.ai.profile.g

                /* renamed from: b, reason: collision with root package name */
                public final /* synthetic */ ProfileSubscriptionSection f35553b;

                {
                    this.f35553b = this;
                }

                @Override // kotlin.jvm.functions.Function0
                public final Object invoke() {
                    switch (i5) {
                        case 0:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$1(this.f35553b);
                        case 1:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$2(this.f35553b);
                        case 2:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$3(this.f35553b);
                        case 3:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$4(this.f35553b);
                        case 4:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$5(this.f35553b);
                        case 5:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$6(this.f35553b);
                        default:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$7(this.f35553b);
                    }
                }
            });
            return;
        }
        if (sub.isFree() && isLoggedIn) {
            String string2 = getContext().getString(2132017380);
            Intrinsics.f(string2, "getString(...)");
            final int i11 = 1;
            addOutlineButton(string2, new Function0(this) { // from class: com.instabridge.ai.profile.g

                /* renamed from: b, reason: collision with root package name */
                public final /* synthetic */ ProfileSubscriptionSection f35553b;

                {
                    this.f35553b = this;
                }

                @Override // kotlin.jvm.functions.Function0
                public final Object invoke() {
                    switch (i11) {
                        case 0:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$1(this.f35553b);
                        case 1:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$2(this.f35553b);
                        case 2:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$3(this.f35553b);
                        case 3:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$4(this.f35553b);
                        case 4:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$5(this.f35553b);
                        case 5:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$6(this.f35553b);
                        default:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$7(this.f35553b);
                    }
                }
            });
            return;
        }
        if (sub.isActive() && sub.isGooglePlay()) {
            String string3 = getContext().getString(2132017352);
            Intrinsics.f(string3, "getString(...)");
            final int i12 = 2;
            addOutlineButton(string3, new Function0(this) { // from class: com.instabridge.ai.profile.g

                /* renamed from: b, reason: collision with root package name */
                public final /* synthetic */ ProfileSubscriptionSection f35553b;

                {
                    this.f35553b = this;
                }

                @Override // kotlin.jvm.functions.Function0
                public final Object invoke() {
                    switch (i12) {
                        case 0:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$1(this.f35553b);
                        case 1:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$2(this.f35553b);
                        case 2:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$3(this.f35553b);
                        case 3:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$4(this.f35553b);
                        case 4:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$5(this.f35553b);
                        case 5:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$6(this.f35553b);
                        default:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$7(this.f35553b);
                    }
                }
            });
            String string4 = getContext().getString(2132017359);
            Intrinsics.f(string4, "getString(...)");
            final int i13 = 3;
            addOutlineButton(string4, new Function0(this) { // from class: com.instabridge.ai.profile.g

                /* renamed from: b, reason: collision with root package name */
                public final /* synthetic */ ProfileSubscriptionSection f35553b;

                {
                    this.f35553b = this;
                }

                @Override // kotlin.jvm.functions.Function0
                public final Object invoke() {
                    switch (i13) {
                        case 0:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$1(this.f35553b);
                        case 1:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$2(this.f35553b);
                        case 2:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$3(this.f35553b);
                        case 3:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$4(this.f35553b);
                        case 4:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$5(this.f35553b);
                        case 5:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$6(this.f35553b);
                        default:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$7(this.f35553b);
                    }
                }
            });
            return;
        }
        if (sub.isActive() && sub.isStripe()) {
            String string5 = getContext().getString(2132017360);
            Intrinsics.f(string5, "getString(...)");
            final int i14 = 4;
            addOutlineButton(string5, new Function0(this) { // from class: com.instabridge.ai.profile.g

                /* renamed from: b, reason: collision with root package name */
                public final /* synthetic */ ProfileSubscriptionSection f35553b;

                {
                    this.f35553b = this;
                }

                @Override // kotlin.jvm.functions.Function0
                public final Object invoke() {
                    switch (i14) {
                        case 0:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$1(this.f35553b);
                        case 1:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$2(this.f35553b);
                        case 2:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$3(this.f35553b);
                        case 3:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$4(this.f35553b);
                        case 4:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$5(this.f35553b);
                        case 5:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$6(this.f35553b);
                        default:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$7(this.f35553b);
                    }
                }
            });
            return;
        }
        if (sub.isCanceled() && sub.isGooglePlay()) {
            String string6 = getContext().getString(2132017367);
            Intrinsics.f(string6, "getString(...)");
            final int i15 = 5;
            addOutlineButton(string6, new Function0(this) { // from class: com.instabridge.ai.profile.g

                /* renamed from: b, reason: collision with root package name */
                public final /* synthetic */ ProfileSubscriptionSection f35553b;

                {
                    this.f35553b = this;
                }

                @Override // kotlin.jvm.functions.Function0
                public final Object invoke() {
                    switch (i15) {
                        case 0:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$1(this.f35553b);
                        case 1:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$2(this.f35553b);
                        case 2:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$3(this.f35553b);
                        case 3:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$4(this.f35553b);
                        case 4:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$5(this.f35553b);
                        case 5:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$6(this.f35553b);
                        default:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$7(this.f35553b);
                    }
                }
            });
            return;
        }
        if (sub.isCanceled() && sub.isStripe()) {
            String string7 = getContext().getString(2132017367);
            Intrinsics.f(string7, "getString(...)");
            final int i16 = 6;
            addOutlineButton(string7, new Function0(this) { // from class: com.instabridge.ai.profile.g

                /* renamed from: b, reason: collision with root package name */
                public final /* synthetic */ ProfileSubscriptionSection f35553b;

                {
                    this.f35553b = this;
                }

                @Override // kotlin.jvm.functions.Function0
                public final Object invoke() {
                    switch (i16) {
                        case 0:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$1(this.f35553b);
                        case 1:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$2(this.f35553b);
                        case 2:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$3(this.f35553b);
                        case 3:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$4(this.f35553b);
                        case 4:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$5(this.f35553b);
                        case 5:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$6(this.f35553b);
                        default:
                            return ProfileSubscriptionSection.bindActionButtons$lambda$7(this.f35553b);
                    }
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Unit bindActionButtons$lambda$1(ProfileSubscriptionSection profileSubscriptionSection) {
        Function0<Unit> function0 = profileSubscriptionSection.onSignInRequested;
        if (function0 != null) {
            function0.invoke();
        }
        return Unit.f71706a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Unit bindActionButtons$lambda$2(ProfileSubscriptionSection profileSubscriptionSection) {
        Function0<Unit> function0 = profileSubscriptionSection.onViewPlans;
        if (function0 != null) {
            function0.invoke();
        }
        return Unit.f71706a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Unit bindActionButtons$lambda$3(ProfileSubscriptionSection profileSubscriptionSection) {
        Function0<Unit> function0 = profileSubscriptionSection.onChangePlan;
        if (function0 != null) {
            function0.invoke();
        }
        return Unit.f71706a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Unit bindActionButtons$lambda$4(ProfileSubscriptionSection profileSubscriptionSection) {
        profileSubscriptionSection.openGooglePlaySubscriptions();
        return Unit.f71706a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Unit bindActionButtons$lambda$5(ProfileSubscriptionSection profileSubscriptionSection) {
        Function0<Unit> function0 = profileSubscriptionSection.onManageStripe;
        if (function0 != null) {
            function0.invoke();
        }
        return Unit.f71706a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Unit bindActionButtons$lambda$6(ProfileSubscriptionSection profileSubscriptionSection) {
        Function0<Unit> function0 = profileSubscriptionSection.onResubscribe;
        if (function0 != null) {
            function0.invoke();
        }
        return Unit.f71706a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Unit bindActionButtons$lambda$7(ProfileSubscriptionSection profileSubscriptionSection) {
        Function0<Unit> function0 = profileSubscriptionSection.onManageStripe;
        if (function0 != null) {
            function0.invoke();
        }
        return Unit.f71706a;
    }

    private final void bindDetails(SubscriptionInfo sub) {
        if (sub.isActive() && !sub.isCanceling() && sub.getCurrentPeriodEnd() != null) {
            this.detailsLabel.setText(getContext().getString(2132017362));
            this.detailsValue.setText(formatDate(sub.getCurrentPeriodEnd()));
            this.detailsRow.setVisibility(0);
        } else {
            if (!sub.isCanceled() || sub.getCurrentPeriodEnd() == null) {
                this.detailsRow.setVisibility(8);
                return;
            }
            this.detailsLabel.setText(getContext().getString(2132017344));
            this.detailsValue.setText(formatDate(sub.getCurrentPeriodEnd()));
            this.detailsRow.setVisibility(0);
        }
    }

    @SuppressLint({"NewApi"})
    private final void bindPlanAndStatus(SubscriptionInfo sub) {
        this.planName.setText(sub.getDisplayPlanName());
        if (sub.isCanceling()) {
            this.statusBadge.setText(getContext().getString(2132017373));
            this.statusBadge.setBackgroundResource(2131231107);
            this.statusBadge.setTextColor(getContext().getColor(2131099729));
            this.statusBadge.setVisibility(0);
            return;
        }
        if (sub.isCanceled()) {
            this.statusBadge.setText(getContext().getString(2132017372));
            this.statusBadge.setBackgroundResource(2131231106);
            this.statusBadge.setTextColor(getContext().getColor(2131099728));
            this.statusBadge.setVisibility(0);
            return;
        }
        if (!sub.isPaid()) {
            this.statusBadge.setVisibility(8);
            return;
        }
        this.statusBadge.setText(getContext().getString(2132017371));
        this.statusBadge.setBackgroundResource(2131231105);
        this.statusBadge.setTextColor(getContext().getColor(2131099727));
        this.statusBadge.setVisibility(0);
    }

    @SuppressLint({"NewApi"})
    private final void bindStatusNotice(SubscriptionInfo sub) throws ParseException {
        if (sub.isCanceling() && sub.getCancelAt() != null) {
            this.statusNotice.setText(getContext().getString(2132017349, formatDate(sub.getCancelAt())));
            this.statusNotice.setBackgroundResource(2131231101);
            this.statusNotice.setTextColor(getContext().getColor(2131099722));
            this.statusNotice.setVisibility(0);
            return;
        }
        if (!sub.isCanceled()) {
            this.statusNotice.setVisibility(8);
            return;
        }
        if (sub.getCurrentPeriodEnd() != null) {
            this.statusNotice.setText(getContext().getString(2132017350, formatDate(sub.getCurrentPeriodEnd())));
        } else {
            this.statusNotice.setText(getContext().getString(2132017351));
        }
        this.statusNotice.setBackgroundResource(2131231100);
        this.statusNotice.setTextColor(getContext().getColor(2131099721));
        this.statusNotice.setVisibility(0);
    }

    private final void bindUsage(UsageInfo usage) {
        String string = usage.getMessagesLimit() >= 999999 ? getContext().getString(2132017379) : String.valueOf(usage.getMessagesLimit());
        Intrinsics.d(string);
        this.usageCount.setText(getContext().getString(2132017377, Integer.valueOf(usage.getMessagesUsed()), string));
        if (k.U0(usage.getResetsIn())) {
            this.usageResets.setVisibility(8);
        } else {
            this.usageResets.setText(getContext().getString(2132017366, usage.getResetsIn()));
            this.usageResets.setVisibility(0);
        }
    }

    private final int dpToPx(int dp2) {
        return (int) (dp2 * getContext().getResources().getDisplayMetrics().density);
    }

    private final String formatDate(String isoDate) throws ParseException {
        try {
            Date date = this.dateParser.parse(isoDate);
            String str = date != null ? this.dateFormatter.format(date) : isoDate;
            Intrinsics.d(str);
            return str;
        } catch (Exception unused) {
            return isoDate;
        }
    }

    private final void openGooglePlaySubscriptions() {
        getContext().startActivity(new Intent("android.intent.action.VIEW", Uri.parse("https://play.google.com/store/account/subscriptions")));
    }

    public final void bind(@NotNull SubscriptionInfo subscription, @NotNull UsageInfo usage, boolean isLoggedIn) throws ParseException {
        Intrinsics.g(subscription, "subscription");
        Intrinsics.g(usage, "usage");
        bindPlanAndStatus(subscription);
        bindStatusNotice(subscription);
        bindDetails(subscription);
        bindUsage(usage);
        bindActionButtons(subscription, isLoggedIn);
    }

    @Nullable
    public final Function0<Unit> getOnChangePlan() {
        return this.onChangePlan;
    }

    @Nullable
    public final Function0<Unit> getOnManageStripe() {
        return this.onManageStripe;
    }

    @Nullable
    public final Function0<Unit> getOnResubscribe() {
        return this.onResubscribe;
    }

    @Nullable
    public final Function0<Unit> getOnSignInRequested() {
        return this.onSignInRequested;
    }

    @Nullable
    public final Function0<Unit> getOnViewPlans() {
        return this.onViewPlans;
    }

    public final void setOnChangePlan(@Nullable Function0<Unit> function0) {
        this.onChangePlan = function0;
    }

    public final void setOnManageStripe(@Nullable Function0<Unit> function0) {
        this.onManageStripe = function0;
    }

    public final void setOnResubscribe(@Nullable Function0<Unit> function0) {
        this.onResubscribe = function0;
    }

    public final void setOnSignInRequested(@Nullable Function0<Unit> function0) {
        this.onSignInRequested = function0;
    }

    public final void setOnViewPlans(@Nullable Function0<Unit> function0) {
        this.onViewPlans = function0;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public ProfileSubscriptionSection(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        this(context, attributeSet, 0, 4, null);
        Intrinsics.g(context, "context");
    }

    public /* synthetic */ ProfileSubscriptionSection(Context context, AttributeSet attributeSet, int i5, int i11, DefaultConstructorMarker defaultConstructorMarker) {
        this(context, (i11 & 2) != 0 ? null : attributeSet, (i11 & 4) != 0 ? 0 : i5);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public ProfileSubscriptionSection(@NotNull Context context, @Nullable AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        Intrinsics.g(context, "context");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss", Locale.US);
        simpleDateFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
        this.dateParser = simpleDateFormat;
        this.dateFormatter = new SimpleDateFormat("MMM d, yyyy", Locale.getDefault());
        LayoutInflater.from(context).inflate(2131624009, (ViewGroup) this, true);
        View viewFindViewById = findViewById(2131428577);
        Intrinsics.f(viewFindViewById, "findViewById(...)");
        this.planName = (TextView) viewFindViewById;
        View viewFindViewById2 = findViewById(2131428916);
        Intrinsics.f(viewFindViewById2, "findViewById(...)");
        this.statusBadge = (TextView) viewFindViewById2;
        View viewFindViewById3 = findViewById(2131428917);
        Intrinsics.f(viewFindViewById3, "findViewById(...)");
        this.statusNotice = (TextView) viewFindViewById3;
        View viewFindViewById4 = findViewById(2131427864);
        Intrinsics.f(viewFindViewById4, "findViewById(...)");
        this.detailsRow = (LinearLayout) viewFindViewById4;
        View viewFindViewById5 = findViewById(2131427863);
        Intrinsics.f(viewFindViewById5, "findViewById(...)");
        this.detailsLabel = (TextView) viewFindViewById5;
        View viewFindViewById6 = findViewById(2131427865);
        Intrinsics.f(viewFindViewById6, "findViewById(...)");
        this.detailsValue = (TextView) viewFindViewById6;
        View viewFindViewById7 = findViewById(2131429103);
        Intrinsics.f(viewFindViewById7, "findViewById(...)");
        this.usageCount = (TextView) viewFindViewById7;
        View viewFindViewById8 = findViewById(2131429104);
        Intrinsics.f(viewFindViewById8, "findViewById(...)");
        this.usageResets = (TextView) viewFindViewById8;
        View viewFindViewById9 = findViewById(2131427388);
        Intrinsics.f(viewFindViewById9, "findViewById(...)");
        this.actionButtonsContainer = (LinearLayout) viewFindViewById9;
    }
}
