package com.instabridge.ai.chat.ui;

import android.content.Context;
import android.text.Layout;
import android.text.Spanned;
import android.text.style.ClickableSpan;
import android.text.style.URLSpan;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.ViewConfiguration;
import androidx.appcompat.widget.AppCompatTextView;
import com.amplitude.android.migration.DatabaseConstants;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000P\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0007\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0001\u0018\u00002\u00020\u0001B'\b\u0007\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0007¢\u0006\u0004\b\b\u0010\tJ\u0010\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0016\u001a\u00020\u0017H\u0016J\b\u0010\u0018\u001a\u00020\u0019H\u0002J\u0015\u0010\u001a\u001a\u00020\u00142\u0006\u0010\u001b\u001a\u00020\u001cH\u0000¢\u0006\u0002\b\u001dJ\u0012\u0010\u001e\u001a\u00020\u00192\b\u0010\u001f\u001a\u0004\u0018\u00010\u000eH\u0002J\u0012\u0010 \u001a\u0004\u0018\u00010\u000e2\u0006\u0010\u0016\u001a\u00020\u0017H\u0002R\u000e\u0010\n\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\fX\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\r\u001a\u0004\u0018\u00010\u000eX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0010X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0010X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\fX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u0014X\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006!"}, d2 = {"Lcom/instabridge/ai/chat/ui/InteractiveChatTextView;", "Landroidx/appcompat/widget/AppCompatTextView;", "context", "Landroid/content/Context;", "attrs", "Landroid/util/AttributeSet;", "defStyleAttr", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Landroid/content/Context;Landroid/util/AttributeSet;I)V", "touchSlop", "longPressTimeout", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "downSpan", "Landroid/text/style/ClickableSpan;", "downX", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "downY", "downTime", "spanTouchCanceled", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "onTouchEvent", DatabaseConstants.EVENT_FIELD, "Landroid/view/MotionEvent;", "clearTouchState", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "openUrl", TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "openUrl$instabridge_ai_sdk_release", "performSpanClick", "span", "findClickableSpan", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class InteractiveChatTextView extends AppCompatTextView {
    public static final int $stable = 8;

    @Nullable
    private ClickableSpan downSpan;
    private long downTime;
    private float downX;
    private float downY;
    private final long longPressTimeout;
    private boolean spanTouchCanceled;
    private final int touchSlop;

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public InteractiveChatTextView(@NotNull Context context) {
        this(context, null, 0, 6, null);
        Intrinsics.g(context, "context");
    }

    private final void clearTouchState() {
        this.downSpan = null;
        this.downX = 0.0f;
        this.downY = 0.0f;
        this.downTime = 0L;
        this.spanTouchCanceled = false;
    }

    private final ClickableSpan findClickableSpan(MotionEvent event) {
        Layout layout;
        CharSequence text = getText();
        Spanned spanned = text instanceof Spanned ? (Spanned) text : null;
        if (spanned == null || (layout = getLayout()) == null) {
            return null;
        }
        float x11 = (event.getX() - getTotalPaddingLeft()) + getScrollX();
        float y11 = (event.getY() - getTotalPaddingTop()) + getScrollY();
        if (x11 >= 0.0f && y11 >= 0.0f && x11 <= layout.getWidth() && y11 <= layout.getHeight()) {
            int lineForVertical = layout.getLineForVertical((int) y11);
            float lineLeft = layout.getLineLeft(lineForVertical);
            float lineRight = layout.getLineRight(lineForVertical);
            if (x11 >= lineLeft && x11 <= lineRight) {
                int offsetForHorizontal = layout.getOffsetForHorizontal(lineForVertical, x11);
                Object[] spans = spanned.getSpans(offsetForHorizontal, offsetForHorizontal, ClickableSpan.class);
                Intrinsics.f(spans, "getSpans(...)");
                return (ClickableSpan) kotlin.collections.c.z0(spans);
            }
        }
        return null;
    }

    private final void performSpanClick(ClickableSpan span) {
        if (span != null) {
            if (!(span instanceof URLSpan)) {
                span.onClick(this);
                return;
            }
            URLSpan uRLSpan = (URLSpan) span;
            String url = uRLSpan.getURL();
            Intrinsics.f(url, "getURL(...)");
            if (openUrl$instabridge_ai_sdk_release(url)) {
                return;
            }
            uRLSpan.onClick(this);
        }
    }

    @Override // android.widget.TextView, android.view.View
    public boolean onTouchEvent(@NotNull MotionEvent event) {
        ClickableSpan clickableSpan;
        Intrinsics.g(event, "event");
        int actionMasked = event.getActionMasked();
        if (actionMasked == 0) {
            this.downSpan = findClickableSpan(event);
            this.downX = event.getX();
            this.downY = event.getY();
            this.downTime = event.getEventTime();
            this.spanTouchCanceled = false;
        } else if (actionMasked == 1) {
            ClickableSpan clickableSpanFindClickableSpan = findClickableSpan(event);
            if (!this.spanTouchCanceled && (clickableSpan = this.downSpan) != null && Intrinsics.b(clickableSpan, clickableSpanFindClickableSpan) && event.getEventTime() - this.downTime <= this.longPressTimeout && getSelectionStart() == getSelectionEnd()) {
                performSpanClick(this.downSpan);
                clearTouchState();
                return true;
            }
            clearTouchState();
        } else if (actionMasked != 2) {
            if (actionMasked == 3) {
                clearTouchState();
            }
        } else if (!this.spanTouchCanceled && (Math.abs(event.getX() - this.downX) > this.touchSlop || Math.abs(event.getY() - this.downY) > this.touchSlop)) {
            this.spanTouchCanceled = true;
        }
        return super.onTouchEvent(event);
    }

    public final boolean openUrl$instabridge_ai_sdk_release(@NotNull String url) {
        Intrinsics.g(url, "url");
        ChatUrlOpeners chatUrlOpeners = ChatUrlOpeners.INSTANCE;
        Context context = getContext();
        Intrinsics.f(context, "getContext(...)");
        return chatUrlOpeners.open(context, url);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public InteractiveChatTextView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        this(context, attributeSet, 0, 4, null);
        Intrinsics.g(context, "context");
    }

    public /* synthetic */ InteractiveChatTextView(Context context, AttributeSet attributeSet, int i5, int i11, DefaultConstructorMarker defaultConstructorMarker) {
        this(context, (i11 & 2) != 0 ? null : attributeSet, (i11 & 4) != 0 ? 16842884 : i5);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public InteractiveChatTextView(@NotNull Context context, @Nullable AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        Intrinsics.g(context, "context");
        this.touchSlop = ViewConfiguration.get(context).getScaledTouchSlop();
        this.longPressTimeout = ViewConfiguration.getLongPressTimeout();
    }
}
