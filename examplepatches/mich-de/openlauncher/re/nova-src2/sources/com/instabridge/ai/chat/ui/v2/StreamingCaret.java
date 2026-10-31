package com.instabridge.ai.chat.ui.v2;

import android.content.Context;
import android.text.SpannableStringBuilder;
import android.widget.TextView;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0007\n\u0000\bÁ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0016\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bJ\u0016\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u0011R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000¨\u0006\u0012"}, d2 = {"Lcom/instabridge/ai/chat/ui/v2/StreamingCaret;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "PLACEHOLDER", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "appendTo", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "textView", "Landroid/widget/TextView;", "span", "Lcom/instabridge/ai/chat/ui/v2/StreamingCaretSpan;", "dpToPx", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "context", "Landroid/content/Context;", "dp", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class StreamingCaret {
    public static final int $stable = 0;

    @NotNull
    public static final StreamingCaret INSTANCE = new StreamingCaret();

    @NotNull
    private static final String PLACEHOLDER = "\u200b";

    private StreamingCaret() {
    }

    public final void appendTo(@NotNull TextView textView, @NotNull StreamingCaretSpan span) {
        Intrinsics.g(textView, "textView");
        Intrinsics.g(span, "span");
        CharSequence text = textView.getText();
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder();
        if (text != null) {
            spannableStringBuilder.append(text);
        }
        int length = spannableStringBuilder.length();
        spannableStringBuilder.append((CharSequence) PLACEHOLDER);
        spannableStringBuilder.setSpan(span, length, length + 1, 33);
        textView.setText(spannableStringBuilder);
    }

    public final int dpToPx(@NotNull Context context, float dp2) {
        Intrinsics.g(context, "context");
        return MathKt.b(dp2 * context.getResources().getDisplayMetrics().density);
    }
}
