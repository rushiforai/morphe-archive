package com.instabridge.ai.chat.ui;

import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.BlendMode;
import android.graphics.BlendModeColorFilter;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.text.Editable;
import android.text.InputFilter;
import android.text.Layout;
import android.text.TextWatcher;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.TextView;
import kotlin.Deprecated;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0010\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u0007\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u001e\n\u0002\u0018\u0002\n\u0002\b\n\b\u0007\u0018\u0000 ]2\u00020\u0001:\u0001]B'\b\u0007\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0007¢\u0006\u0004\b\b\u0010\tJ\u0012\u0010E\u001a\u00020\r2\n\b\u0002\u0010F\u001a\u0004\u0018\u00010\fJ\u0006\u0010G\u001a\u00020\rJ\u0006\u0010H\u001a\u000203J\u000e\u0010I\u001a\u00020\r2\u0006\u0010J\u001a\u000203J\u000e\u0010K\u001a\u00020\r2\u0006\u0010L\u001a\u000203J\u0010\u0010M\u001a\u00020\r2\b\u0010F\u001a\u0004\u0018\u00010\fJ\b\u0010N\u001a\u00020\rH\u0002J\u0018\u0010O\u001a\u00020\r2\u0006\u0010P\u001a\u00020\f2\u0006\u0010Q\u001a\u000203H\u0007J\u000e\u0010R\u001a\u00020\r2\u0006\u0010S\u001a\u00020TJ\u0010\u0010U\u001a\u00020\r2\u0006\u0010J\u001a\u000203H\u0016J\b\u0010V\u001a\u00020\rH\u0014J\u0010\u0010W\u001a\u00020\r2\u0006\u0010X\u001a\u000203H\u0002J\u0010\u0010Y\u001a\u00020\r2\u0006\u0010J\u001a\u000203H\u0002J\b\u0010Z\u001a\u00020\rH\u0002J\u0010\u0010[\u001a\u00020\u00072\u0006\u0010\\\u001a\u00020\u0007H\u0002R(\u0010\n\u001a\u0010\u0012\u0004\u0012\u00020\f\u0012\u0004\u0012\u00020\r\u0018\u00010\u000bX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u000e\u0010\u000f\"\u0004\b\u0010\u0010\u0011R,\u0010\u0012\u001a\n\u0012\u0004\u0012\u00020\r\u0018\u00010\u00138\u0006@\u0006X\u0087\u000e¢\u0006\u0014\n\u0000\u0012\u0004\b\u0014\u0010\u0015\u001a\u0004\b\u0016\u0010\u0017\"\u0004\b\u0018\u0010\u0019R\"\u0010\u001a\u001a\n\u0012\u0004\u0012\u00020\r\u0018\u00010\u0013X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u001b\u0010\u0017\"\u0004\b\u001c\u0010\u0019R\u000e\u0010\u001d\u001a\u00020\u001eX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u001f\u001a\u00020 X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010!\u001a\u00020\"X\u0082\u0004¢\u0006\u0002\n\u0000R\u001b\u0010#\u001a\u00020\u00078BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b&\u0010'\u001a\u0004\b$\u0010%R\u001b\u0010(\u001a\u00020\u00078BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b*\u0010'\u001a\u0004\b)\u0010%R\u001b\u0010+\u001a\u00020,8BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b/\u0010'\u001a\u0004\b-\u0010.R\u0010\u00100\u001a\u0004\u0018\u000101X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u00102\u001a\u000203X\u0082\u000e¢\u0006\u0002\n\u0000R\u001d\u00104\u001a\u0004\u0018\u0001058BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b8\u0010'\u001a\u0004\b6\u00107R\u001d\u00109\u001a\u0004\u0018\u0001058BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b;\u0010'\u001a\u0004\b:\u00107R\u000e\u0010<\u001a\u000203X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010=\u001a\u000203X\u0082\u000e¢\u0006\u0002\n\u0000R\u001d\u0010>\u001a\u0004\u0018\u0001058BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b@\u0010'\u001a\u0004\b?\u00107R\u001d\u0010A\u001a\u0004\u0018\u0001058BX\u0082\u0084\u0002¢\u0006\f\n\u0004\bC\u0010'\u001a\u0004\bB\u00107R\u000e\u0010D\u001a\u00020\u0007X\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006^"}, d2 = {"Lcom/instabridge/ai/chat/ui/ChatInputBar;", "Landroid/widget/FrameLayout;", "context", "Landroid/content/Context;", "attrs", "Landroid/util/AttributeSet;", "defStyleAttr", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Landroid/content/Context;Landroid/util/AttributeSet;I)V", "onSendMessage", "Lkotlin/Function1;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getOnSendMessage", "()Lkotlin/jvm/functions/Function1;", "setOnSendMessage", "(Lkotlin/jvm/functions/Function1;)V", "onModelChipClick", "Lkotlin/Function0;", "getOnModelChipClick$annotations", "()V", "getOnModelChipClick", "()Lkotlin/jvm/functions/Function0;", "setOnModelChipClick", "(Lkotlin/jvm/functions/Function0;)V", "onStopRequest", "getOnStopRequest", "setOnStopRequest", "editText", "Landroid/widget/EditText;", "sendButton", "Landroid/widget/ImageButton;", "inputContainer", "Landroid/widget/LinearLayout;", "minInputHeightPx", "getMinInputHeightPx", "()I", "minInputHeightPx$delegate", "Lkotlin/Lazy;", "maxInputHeightPx", "getMaxInputHeightPx", "maxInputHeightPx$delegate", "disabledSendAlpha", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getDisabledSendAlpha", "()F", "disabledSendAlpha$delegate", "inputHeightAnimator", "Landroid/animation/ValueAnimator;", "isClarificationMode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "normalBg", "Landroid/graphics/drawable/Drawable;", "getNormalBg", "()Landroid/graphics/drawable/Drawable;", "normalBg$delegate", "clarificationBg", "getClarificationBg", "clarificationBg$delegate", "isStreamingActive", "isV2Style", "v2InputBg", "getV2InputBg", "v2InputBg$delegate", "v2InputBgFocus", "getV2InputBgFocus", "v2InputBgFocus$delegate", "sendIconRes", "enterClarificationMode", "hint", "exitClarificationMode", "isInClarificationMode", "setV2Style", "enabled", "setStreamingActive", "active", "setHint", "send", "updateModelChip", "displayName", "isProModel", "applyTheme", "theme", "Lcom/instabridge/ai/chat/ui/ChatTheme;", "setEnabled", "onDetachedFromWindow", "updateInputHeight", "animate", "updateSendButtonAppearance", "applyCursorStyling", "dpToPx", "dp", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class ChatInputBar extends FrameLayout {
    private static final int MAX_MESSAGE_LENGTH = 20000;

    /* renamed from: clarificationBg$delegate, reason: from kotlin metadata */
    @NotNull
    private final Lazy clarificationBg;

    /* renamed from: disabledSendAlpha$delegate, reason: from kotlin metadata */
    @NotNull
    private final Lazy disabledSendAlpha;

    @NotNull
    private final EditText editText;

    @NotNull
    private final LinearLayout inputContainer;

    @Nullable
    private ValueAnimator inputHeightAnimator;
    private boolean isClarificationMode;
    private boolean isStreamingActive;
    private boolean isV2Style;

    /* renamed from: maxInputHeightPx$delegate, reason: from kotlin metadata */
    @NotNull
    private final Lazy maxInputHeightPx;

    /* renamed from: minInputHeightPx$delegate, reason: from kotlin metadata */
    @NotNull
    private final Lazy minInputHeightPx;

    /* renamed from: normalBg$delegate, reason: from kotlin metadata */
    @NotNull
    private final Lazy normalBg;

    @Nullable
    private Function0<Unit> onModelChipClick;

    @Nullable
    private Function1<? super String, Unit> onSendMessage;

    @Nullable
    private Function0<Unit> onStopRequest;

    @NotNull
    private final ImageButton sendButton;
    private int sendIconRes;

    /* renamed from: v2InputBg$delegate, reason: from kotlin metadata */
    @NotNull
    private final Lazy v2InputBg;

    /* renamed from: v2InputBgFocus$delegate, reason: from kotlin metadata */
    @NotNull
    private final Lazy v2InputBgFocus;
    public static final int $stable = 8;

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public ChatInputBar(@NotNull Context context) {
        this(context, null, 0, 6, null);
        Intrinsics.g(context, "context");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void _init_$lambda$11(ChatInputBar chatInputBar, Context context, View view, boolean z11) {
        GradientDrawable gradientDrawable;
        if (chatInputBar.isClarificationMode) {
            return;
        }
        if (chatInputBar.isV2Style) {
            chatInputBar.inputContainer.setBackground(z11 ? chatInputBar.getV2InputBgFocus() : chatInputBar.getV2InputBg());
            return;
        }
        Drawable background = chatInputBar.inputContainer.getBackground();
        if (background instanceof GradientDrawable) {
            Drawable drawableMutate = ((GradientDrawable) background).mutate();
            Intrinsics.e(drawableMutate, "null cannot be cast to non-null type android.graphics.drawable.GradientDrawable");
            gradientDrawable = (GradientDrawable) drawableMutate;
        } else {
            gradientDrawable = null;
        }
        int color = z11 ? context.getColor(2131099717) : context.getColor(2131099716);
        if (gradientDrawable != null) {
            gradientDrawable.setStroke(chatInputBar.dpToPx(1), color);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void _init_$lambda$8(ChatInputBar chatInputBar, View view) {
        if (!chatInputBar.isStreamingActive) {
            chatInputBar.send();
            return;
        }
        Function0<Unit> function0 = chatInputBar.onStopRequest;
        if (function0 != null) {
            function0.invoke();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean _init_$lambda$9(ChatInputBar chatInputBar, TextView textView, int i5, KeyEvent keyEvent) {
        Editable text;
        if (i5 != 4 || (text = chatInputBar.editText.getText()) == null || r70.k.U0(text)) {
            return false;
        }
        if (!chatInputBar.isStreamingActive) {
            chatInputBar.send();
            return true;
        }
        Function0<Unit> function0 = chatInputBar.onStopRequest;
        if (function0 == null) {
            return true;
        }
        function0.invoke();
        return true;
    }

    private final void applyCursorStyling() {
        Drawable drawableMutate;
        Drawable drawableMutate2;
        Drawable drawableMutate3;
        Drawable drawableMutate4;
        if (Build.VERSION.SDK_INT < 29) {
            return;
        }
        int color = getContext().getColor(2131099700);
        BlendModeColorFilter blendModeColorFilter = new BlendModeColorFilter(color, BlendMode.SRC);
        BlendModeColorFilter blendModeColorFilter2 = new BlendModeColorFilter(color, BlendMode.SRC_IN);
        EditText editText = this.editText;
        Drawable textCursorDrawable = editText.getTextCursorDrawable();
        if (textCursorDrawable == null || (drawableMutate = textCursorDrawable.mutate()) == null) {
            drawableMutate = null;
        } else {
            drawableMutate.setColorFilter(blendModeColorFilter);
        }
        editText.setTextCursorDrawable(drawableMutate);
        Drawable textSelectHandle = this.editText.getTextSelectHandle();
        if (textSelectHandle != null && (drawableMutate4 = textSelectHandle.mutate()) != null) {
            drawableMutate4.setColorFilter(blendModeColorFilter2);
        }
        Drawable textSelectHandleLeft = this.editText.getTextSelectHandleLeft();
        if (textSelectHandleLeft != null && (drawableMutate3 = textSelectHandleLeft.mutate()) != null) {
            drawableMutate3.setColorFilter(blendModeColorFilter2);
        }
        Drawable textSelectHandleRight = this.editText.getTextSelectHandleRight();
        if (textSelectHandleRight == null || (drawableMutate2 = textSelectHandleRight.mutate()) == null) {
            return;
        }
        drawableMutate2.setColorFilter(blendModeColorFilter2);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Drawable clarificationBg_delegate$lambda$4(Context context) {
        return context.getDrawable(2131231052);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final float disabledSendAlpha_delegate$lambda$2(ChatInputBar chatInputBar) throws Resources.NotFoundException {
        Resources resources = chatInputBar.getResources();
        if (Build.VERSION.SDK_INT >= 29) {
            ThreadLocal threadLocal = q4.k.f83638a;
            return q4.h.a(resources);
        }
        ThreadLocal threadLocal2 = q4.k.f83638a;
        TypedValue typedValue = (TypedValue) threadLocal2.get();
        if (typedValue == null) {
            typedValue = new TypedValue();
            threadLocal2.set(typedValue);
        }
        resources.getValue(2131165266, typedValue, true);
        if (typedValue.type == 4) {
            return typedValue.getFloat();
        }
        throw new Resources.NotFoundException("Resource ID #0x" + Integer.toHexString(2131165266) + " type #0x" + Integer.toHexString(typedValue.type) + " is not valid");
    }

    private final int dpToPx(int dp2) {
        return (int) (dp2 * getContext().getResources().getDisplayMetrics().density);
    }

    public static /* synthetic */ void enterClarificationMode$default(ChatInputBar chatInputBar, String str, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = null;
        }
        chatInputBar.enterClarificationMode(str);
    }

    private final Drawable getClarificationBg() {
        return (Drawable) this.clarificationBg.getValue();
    }

    private final float getDisabledSendAlpha() {
        return ((Number) this.disabledSendAlpha.getValue()).floatValue();
    }

    private final int getMaxInputHeightPx() {
        return ((Number) this.maxInputHeightPx.getValue()).intValue();
    }

    private final int getMinInputHeightPx() {
        return ((Number) this.minInputHeightPx.getValue()).intValue();
    }

    private final Drawable getNormalBg() {
        return (Drawable) this.normalBg.getValue();
    }

    @Deprecated
    public static /* synthetic */ void getOnModelChipClick$annotations() {
    }

    private final Drawable getV2InputBg() {
        return (Drawable) this.v2InputBg.getValue();
    }

    private final Drawable getV2InputBgFocus() {
        return (Drawable) this.v2InputBgFocus.getValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final int maxInputHeightPx_delegate$lambda$1(ChatInputBar chatInputBar) {
        return chatInputBar.dpToPx(200);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final int minInputHeightPx_delegate$lambda$0(ChatInputBar chatInputBar) {
        return chatInputBar.getResources().getDimensionPixelSize(2131165265);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Drawable normalBg_delegate$lambda$3(Context context) {
        return context.getDrawable(2131231051);
    }

    private final void send() {
        String string;
        String string2;
        Editable text = this.editText.getText();
        if (text == null || (string = text.toString()) == null || (string2 = r70.k.u1(string).toString()) == null || string2.length() == 0) {
            return;
        }
        Editable text2 = this.editText.getText();
        if (text2 != null) {
            text2.clear();
        }
        updateInputHeight(true);
        Function1<? super String, Unit> function1 = this.onSendMessage;
        if (function1 != null) {
            function1.invoke(string2);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void updateInputHeight(boolean animate) {
        int height;
        Layout layout = this.editText.getLayout();
        if (layout != null) {
            height = layout.getHeight();
        } else {
            int lineHeight = this.editText.getLineHeight();
            int lineCount = this.editText.getLineCount();
            if (lineCount < 1) {
                lineCount = 1;
            }
            height = lineHeight * lineCount;
        }
        int iE0 = kotlin.ranges.a.e0(this.editText.getCompoundPaddingBottom() + this.editText.getCompoundPaddingTop() + height, getMinInputHeightPx(), getMaxInputHeightPx());
        ViewGroup.LayoutParams layoutParams = this.editText.getLayoutParams();
        if (layoutParams == null) {
            return;
        }
        int height2 = layoutParams.height;
        if (height2 <= 0) {
            height2 = this.editText.getHeight() > 0 ? this.editText.getHeight() : getMinInputHeightPx();
        }
        if (height2 == iE0) {
            return;
        }
        ValueAnimator valueAnimator = this.inputHeightAnimator;
        if (valueAnimator != null) {
            valueAnimator.cancel();
        }
        if (!animate || !isLaidOut()) {
            layoutParams.height = iE0;
            this.editText.setLayoutParams(layoutParams);
            return;
        }
        ValueAnimator valueAnimatorOfInt = ValueAnimator.ofInt(height2, iE0);
        valueAnimatorOfInt.setDuration(140L);
        valueAnimatorOfInt.addUpdateListener(new b0(this, 2, layoutParams));
        valueAnimatorOfInt.start();
        this.inputHeightAnimator = valueAnimatorOfInt;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void updateInputHeight$lambda$16$lambda$15(ViewGroup.LayoutParams layoutParams, ChatInputBar chatInputBar, ValueAnimator animator) {
        Intrinsics.g(animator, "animator");
        Object animatedValue = animator.getAnimatedValue();
        Intrinsics.e(animatedValue, "null cannot be cast to non-null type kotlin.Int");
        layoutParams.height = ((Integer) animatedValue).intValue();
        chatInputBar.editText.setLayoutParams(layoutParams);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void updateSendButtonAppearance(boolean enabled) {
        this.sendButton.setAlpha(enabled ? 1.0f : getDisabledSendAlpha());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Drawable v2InputBgFocus_delegate$lambda$6(Context context) {
        return context.getDrawable(2131231124);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Drawable v2InputBg_delegate$lambda$5(Context context) {
        return context.getDrawable(2131231123);
    }

    public final void applyTheme(@NotNull ChatTheme theme) {
        Intrinsics.g(theme, "theme");
        Integer inputTextColor = theme.getInputTextColor();
        if (inputTextColor != null) {
            this.editText.setTextColor(inputTextColor.intValue());
        }
        Integer inputHintColor = theme.getInputHintColor();
        if (inputHintColor != null) {
            this.editText.setHintTextColor(inputHintColor.intValue());
        }
        Integer sendButtonColor = theme.getSendButtonColor();
        if (sendButtonColor != null) {
            this.sendButton.setColorFilter(sendButtonColor.intValue());
        }
        applyCursorStyling();
    }

    public final void enterClarificationMode(@Nullable String hint) {
        this.isClarificationMode = true;
        this.inputContainer.setBackground(getClarificationBg());
        EditText editText = this.editText;
        if (hint == null) {
            hint = getContext().getString(2132017415);
            Intrinsics.f(hint, "getString(...)");
        }
        editText.setHint(hint);
        setEnabled(true);
    }

    public final void exitClarificationMode() {
        this.isClarificationMode = false;
        this.inputContainer.setBackground(getNormalBg());
        this.editText.setHint(getContext().getString(2132017291));
    }

    @Nullable
    public final Function0<Unit> getOnModelChipClick() {
        return this.onModelChipClick;
    }

    @Nullable
    public final Function1<String, Unit> getOnSendMessage() {
        return this.onSendMessage;
    }

    @Nullable
    public final Function0<Unit> getOnStopRequest() {
        return this.onStopRequest;
    }

    /* renamed from: isInClarificationMode, reason: from getter */
    public final boolean getIsClarificationMode() {
        return this.isClarificationMode;
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        ValueAnimator valueAnimator = this.inputHeightAnimator;
        if (valueAnimator != null) {
            valueAnimator.cancel();
        }
        this.inputHeightAnimator = null;
    }

    @Override // android.view.View
    public void setEnabled(boolean enabled) {
        Editable text;
        super.setEnabled(enabled);
        this.editText.setEnabled(enabled);
        boolean z11 = (!enabled || (text = this.editText.getText()) == null || r70.k.U0(text)) ? false : true;
        this.sendButton.setEnabled(z11);
        updateSendButtonAppearance(z11);
    }

    public final void setHint(@Nullable String hint) {
        EditText editText = this.editText;
        if (hint == null) {
            hint = getContext().getString(2132017291);
            Intrinsics.f(hint, "getString(...)");
        }
        editText.setHint(hint);
    }

    public final void setOnModelChipClick(@Nullable Function0<Unit> function0) {
        this.onModelChipClick = function0;
    }

    public final void setOnSendMessage(@Nullable Function1<? super String, Unit> function1) {
        this.onSendMessage = function1;
    }

    public final void setOnStopRequest(@Nullable Function0<Unit> function0) {
        this.onStopRequest = function0;
    }

    public final void setStreamingActive(boolean active) {
        Editable text;
        if (this.isStreamingActive == active) {
            return;
        }
        this.isStreamingActive = active;
        if (active) {
            this.sendButton.setImageResource(2131231128);
            this.sendButton.setEnabled(true);
            this.sendButton.setAlpha(1.0f);
            this.editText.setEnabled(true);
            return;
        }
        this.sendButton.setImageResource(this.sendIconRes);
        boolean z11 = (!isEnabled() || (text = this.editText.getText()) == null || r70.k.U0(text)) ? false : true;
        this.sendButton.setEnabled(z11);
        updateSendButtonAppearance(z11);
    }

    public final void setV2Style(boolean enabled) {
        if (this.isV2Style == enabled) {
            return;
        }
        this.isV2Style = enabled;
        if (enabled) {
            this.inputContainer.setBackground(getV2InputBg());
            this.editText.setTextColor(getContext().getColor(2131099773));
            this.editText.setHintTextColor(getContext().getColor(2131099772));
            this.sendIconRes = 2131231127;
            this.sendButton.setBackground(getContext().getDrawable(2131231130));
            this.sendButton.setImageResource(this.sendIconRes);
            this.sendButton.setColorFilter(getContext().getColor(2131099773));
            this.editText.setMinHeight(dpToPx(56));
            LinearLayout linearLayout = this.inputContainer;
            linearLayout.setPadding(linearLayout.getPaddingLeft(), this.inputContainer.getPaddingTop(), dpToPx(6), this.inputContainer.getPaddingBottom());
        }
    }

    @Deprecated
    public final void updateModelChip(@NotNull String displayName, boolean isProModel) {
        Intrinsics.g(displayName, "displayName");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public ChatInputBar(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        this(context, attributeSet, 0, 4, null);
        Intrinsics.g(context, "context");
    }

    public /* synthetic */ ChatInputBar(Context context, AttributeSet attributeSet, int i5, int i11, DefaultConstructorMarker defaultConstructorMarker) {
        this(context, (i11 & 2) != 0 ? null : attributeSet, (i11 & 4) != 0 ? 0 : i5);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public ChatInputBar(@NotNull final Context context, @Nullable AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        Intrinsics.g(context, "context");
        final int i11 = 0;
        this.minInputHeightPx = LazyKt.a(new Function0(this) { // from class: com.instabridge.ai.chat.ui.l0

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ ChatInputBar f35381b;

            {
                this.f35381b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i11) {
                    case 0:
                        return Integer.valueOf(ChatInputBar.minInputHeightPx_delegate$lambda$0(this.f35381b));
                    case 1:
                        return Integer.valueOf(ChatInputBar.maxInputHeightPx_delegate$lambda$1(this.f35381b));
                    default:
                        return Float.valueOf(ChatInputBar.disabledSendAlpha_delegate$lambda$2(this.f35381b));
                }
            }
        });
        final int i12 = 1;
        this.maxInputHeightPx = LazyKt.a(new Function0(this) { // from class: com.instabridge.ai.chat.ui.l0

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ ChatInputBar f35381b;

            {
                this.f35381b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i12) {
                    case 0:
                        return Integer.valueOf(ChatInputBar.minInputHeightPx_delegate$lambda$0(this.f35381b));
                    case 1:
                        return Integer.valueOf(ChatInputBar.maxInputHeightPx_delegate$lambda$1(this.f35381b));
                    default:
                        return Float.valueOf(ChatInputBar.disabledSendAlpha_delegate$lambda$2(this.f35381b));
                }
            }
        });
        final int i13 = 2;
        this.disabledSendAlpha = LazyKt.a(new Function0(this) { // from class: com.instabridge.ai.chat.ui.l0

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ ChatInputBar f35381b;

            {
                this.f35381b = this;
            }

            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i13) {
                    case 0:
                        return Integer.valueOf(ChatInputBar.minInputHeightPx_delegate$lambda$0(this.f35381b));
                    case 1:
                        return Integer.valueOf(ChatInputBar.maxInputHeightPx_delegate$lambda$1(this.f35381b));
                    default:
                        return Float.valueOf(ChatInputBar.disabledSendAlpha_delegate$lambda$2(this.f35381b));
                }
            }
        });
        final int i14 = 0;
        this.normalBg = LazyKt.a(new Function0() { // from class: com.instabridge.ai.chat.ui.n0
            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i14) {
                    case 0:
                        return ChatInputBar.normalBg_delegate$lambda$3(context);
                    case 1:
                        return ChatInputBar.clarificationBg_delegate$lambda$4(context);
                    case 2:
                        return ChatInputBar.v2InputBg_delegate$lambda$5(context);
                    default:
                        return ChatInputBar.v2InputBgFocus_delegate$lambda$6(context);
                }
            }
        });
        final int i15 = 1;
        this.clarificationBg = LazyKt.a(new Function0() { // from class: com.instabridge.ai.chat.ui.n0
            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i15) {
                    case 0:
                        return ChatInputBar.normalBg_delegate$lambda$3(context);
                    case 1:
                        return ChatInputBar.clarificationBg_delegate$lambda$4(context);
                    case 2:
                        return ChatInputBar.v2InputBg_delegate$lambda$5(context);
                    default:
                        return ChatInputBar.v2InputBgFocus_delegate$lambda$6(context);
                }
            }
        });
        final int i16 = 2;
        this.v2InputBg = LazyKt.a(new Function0() { // from class: com.instabridge.ai.chat.ui.n0
            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i16) {
                    case 0:
                        return ChatInputBar.normalBg_delegate$lambda$3(context);
                    case 1:
                        return ChatInputBar.clarificationBg_delegate$lambda$4(context);
                    case 2:
                        return ChatInputBar.v2InputBg_delegate$lambda$5(context);
                    default:
                        return ChatInputBar.v2InputBgFocus_delegate$lambda$6(context);
                }
            }
        });
        final int i17 = 3;
        this.v2InputBgFocus = LazyKt.a(new Function0() { // from class: com.instabridge.ai.chat.ui.n0
            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i17) {
                    case 0:
                        return ChatInputBar.normalBg_delegate$lambda$3(context);
                    case 1:
                        return ChatInputBar.clarificationBg_delegate$lambda$4(context);
                    case 2:
                        return ChatInputBar.v2InputBg_delegate$lambda$5(context);
                    default:
                        return ChatInputBar.v2InputBgFocus_delegate$lambda$6(context);
                }
            }
        });
        this.sendIconRes = 2131231089;
        LayoutInflater.from(context).inflate(2131623982, (ViewGroup) this, true);
        View viewFindViewById = findViewById(2131427658);
        Intrinsics.f(viewFindViewById, "findViewById(...)");
        EditText editText = (EditText) viewFindViewById;
        this.editText = editText;
        View viewFindViewById2 = findViewById(2131427660);
        Intrinsics.f(viewFindViewById2, "findViewById(...)");
        ImageButton imageButton = (ImageButton) viewFindViewById2;
        this.sendButton = imageButton;
        View viewFindViewById3 = findViewById(2131428233);
        Intrinsics.f(viewFindViewById3, "findViewById(...)");
        this.inputContainer = (LinearLayout) viewFindViewById3;
        editText.setFilters(new InputFilter.LengthFilter[]{new InputFilter.LengthFilter(20000)});
        applyCursorStyling();
        editText.addTextChangedListener(new TextWatcher() { // from class: com.instabridge.ai.chat.ui.ChatInputBar$special$$inlined$doAfterTextChanged$1
            @Override // android.text.TextWatcher
            public void afterTextChanged(@Nullable Editable s11) {
                boolean z11 = !(s11 == null || r70.k.U0(s11));
                this.this$0.sendButton.setEnabled(z11);
                this.this$0.updateSendButtonAppearance(z11);
                EditText editText2 = this.this$0.editText;
                final ChatInputBar chatInputBar = this.this$0;
                editText2.post(new Runnable() { // from class: com.instabridge.ai.chat.ui.ChatInputBar$1$1
                    @Override // java.lang.Runnable
                    public final void run() {
                        chatInputBar.updateInputHeight(true);
                    }
                });
            }

            @Override // android.text.TextWatcher
            public void beforeTextChanged(@Nullable CharSequence text, int start, int count, int after) {
            }

            @Override // android.text.TextWatcher
            public void onTextChanged(@Nullable CharSequence text, int start, int before, int count) {
            }
        });
        imageButton.setOnClickListener(new b(this, 4));
        editText.setOnEditorActionListener(new k0(this, 1));
        editText.post(new m(this, 9));
        editText.setOnFocusChangeListener(new View.OnFocusChangeListener() { // from class: com.instabridge.ai.chat.ui.m0
            @Override // android.view.View.OnFocusChangeListener
            public final void onFocusChange(View view, boolean z11) {
                ChatInputBar._init_$lambda$11(this.f35384a, context, view, z11);
            }
        });
    }
}
