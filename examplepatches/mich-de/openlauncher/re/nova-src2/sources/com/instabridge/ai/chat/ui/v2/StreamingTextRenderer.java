package com.instabridge.ai.chat.ui.v2;

import android.text.SpannableStringBuilder;
import android.view.Choreographer;
import android.widget.TextView;
import com.instabridge.ai.chat.util.StreamingMarkdownBuffer;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000Z\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0004\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\n\b\u0001\u0018\u0000 82\u00020\u0001:\u00018B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u000f\u0010\u0007\u001a\u00020\u0006H\u0002¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0006H\u0002¢\u0006\u0004\b\t\u0010\bJ\u000f\u0010\n\u001a\u00020\u0006H\u0002¢\u0006\u0004\b\n\u0010\bJ\u0017\u0010\r\u001a\u00020\u00062\u0006\u0010\f\u001a\u00020\u000bH\u0002¢\u0006\u0004\b\r\u0010\u000eJ\u0017\u0010\u0011\u001a\u00020\u00062\u0006\u0010\u0010\u001a\u00020\u000fH\u0002¢\u0006\u0004\b\u0011\u0010\u0012J\u0017\u0010\u0015\u001a\u00020\u00062\u0006\u0010\u0014\u001a\u00020\u0013H\u0002¢\u0006\u0004\b\u0015\u0010\u0016J\u0017\u0010\u0017\u001a\u00020\u00062\u0006\u0010\u0014\u001a\u00020\u0013H\u0002¢\u0006\u0004\b\u0017\u0010\u0016J\u0017\u0010\u001b\u001a\u00020\u001a2\u0006\u0010\u0019\u001a\u00020\u0018H\u0002¢\u0006\u0004\b\u001b\u0010\u001cJ\r\u0010\u001d\u001a\u00020\u0018¢\u0006\u0004\b\u001d\u0010\u001eJ\r\u0010\u001f\u001a\u00020\u0006¢\u0006\u0004\b\u001f\u0010\bJ\u001d\u0010!\u001a\u00020\u00062\u0006\u0010\u0014\u001a\u00020\u00132\u0006\u0010 \u001a\u00020\u0018¢\u0006\u0004\b!\u0010\"J\u0015\u0010#\u001a\u00020\u00062\u0006\u0010\u0014\u001a\u00020\u0013¢\u0006\u0004\b#\u0010\u0016R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010$R\u0018\u0010'\u001a\u00060%j\u0002`&8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b'\u0010(R\u0016\u0010)\u001a\u00020\u000f8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b)\u0010*R\u0014\u0010,\u001a\u00020+8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b,\u0010-R\u0016\u0010.\u001a\u00020\u000f8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b.\u0010*R\u0018\u00100\u001a\u0004\u0018\u00010/8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b0\u00101R\u0016\u00102\u001a\u00020\u000b8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b2\u00103R\u0016\u00104\u001a\u00020\u001a8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b4\u00105R\u0018\u00106\u001a\u0004\u0018\u00010\u00138\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b6\u00107¨\u00069"}, d2 = {"Lcom/instabridge/ai/chat/ui/v2/StreamingTextRenderer;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lh60/b;", "markwon", "<init>", "(Lh60/b;)V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "startTickerIfIdle", "()V", "scheduleNextFrame", "cancelTicker", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "frameTimeNanos", "tick", "(J)V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "upToExclusive", "commitParagraphsUpTo", "(I)V", "Landroid/widget/TextView;", "textView", "renderInto", "(Landroid/widget/TextView;)V", "finalizeRender", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "text", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "isInsideOpenFence", "(Ljava/lang/String;)Z", "rawText", "()Ljava/lang/String;", "reset", "delta", "onDelta", "(Landroid/widget/TextView;Ljava/lang/String;)V", "onComplete", "Lh60/b;", "Ljava/lang/StringBuilder;", "Lkotlin/text/StringBuilder;", "accumulated", "Ljava/lang/StringBuilder;", "displayedLength", "I", "Landroid/text/SpannableStringBuilder;", "committedSpanned", "Landroid/text/SpannableStringBuilder;", "activeParagraphStart", "Landroid/view/Choreographer$FrameCallback;", "frameCallback", "Landroid/view/Choreographer$FrameCallback;", "lastFrameNs", "J", "completionRequested", "Z", "attachedView", "Landroid/widget/TextView;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class StreamingTextRenderer {
    private static final int DRAIN_FRAMES = 28;
    private static final int MAX_CHARS_PER_FRAME = 4;
    private static final int MIN_CHARS_PER_FRAME = 1;

    @NotNull
    private final StringBuilder accumulated;
    private int activeParagraphStart;

    @Nullable
    private TextView attachedView;

    @NotNull
    private final SpannableStringBuilder committedSpanned;
    private boolean completionRequested;
    private int displayedLength;

    @Nullable
    private Choreographer.FrameCallback frameCallback;
    private long lastFrameNs;

    @NotNull
    private final h60.b markwon;

    @NotNull
    private static final Companion Companion = new Companion(null);
    public static final int $stable = 8;

    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0003\b\u0082\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000¨\u0006\b"}, d2 = {"Lcom/instabridge/ai/chat/ui/v2/StreamingTextRenderer$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "DRAIN_FRAMES", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "MIN_CHARS_PER_FRAME", "MAX_CHARS_PER_FRAME", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }
    }

    public StreamingTextRenderer(@NotNull h60.b markwon) {
        Intrinsics.g(markwon, "markwon");
        this.markwon = markwon;
        this.accumulated = new StringBuilder();
        this.committedSpanned = new SpannableStringBuilder();
    }

    private final void cancelTicker() {
        Choreographer.FrameCallback frameCallback = this.frameCallback;
        if (frameCallback != null) {
            Choreographer.getInstance().removeFrameCallback(frameCallback);
        }
        this.frameCallback = null;
    }

    private final void commitParagraphsUpTo(int upToExclusive) {
        int iIndexOf = this.accumulated.indexOf("\n\n", this.activeParagraphStart);
        while (iIndexOf >= 0 && iIndexOf < upToExclusive) {
            int i5 = iIndexOf + 2;
            String strSubstring = this.accumulated.substring(0, i5);
            Intrinsics.d(strSubstring);
            if (isInsideOpenFence(strSubstring)) {
                iIndexOf = this.accumulated.indexOf("\n\n", i5);
            } else {
                this.committedSpanned.append((CharSequence) this.markwon.d(this.accumulated.substring(this.activeParagraphStart, iIndexOf)));
                this.committedSpanned.append((CharSequence) "\n\n");
                this.activeParagraphStart = i5;
                iIndexOf = this.accumulated.indexOf("\n\n", i5);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void finalizeRender(TextView textView) {
        cancelTicker();
        h60.d dVar = (h60.d) this.markwon;
        dVar.c(textView, dVar.d(this.accumulated.toString()));
        this.committedSpanned.clear();
        this.committedSpanned.append(textView.getText());
        this.activeParagraphStart = this.accumulated.length();
        this.displayedLength = this.accumulated.length();
        this.completionRequested = false;
    }

    private final boolean isInsideOpenFence(String text) {
        int i5 = 0;
        int i11 = 0;
        while (i5 < text.length()) {
            if (r70.j.H0(i5, text, "```", false) && (i5 == 0 || text.charAt(i5 - 1) == '\n')) {
                i11++;
                i5 += 3;
                while (i5 < text.length() && text.charAt(i5) != '\n') {
                    i5++;
                }
            } else {
                i5++;
            }
        }
        return i11 % 2 == 1;
    }

    private final void renderInto(TextView textView) {
        int iMin = Math.min(this.displayedLength, this.accumulated.length());
        int i5 = this.activeParagraphStart;
        String strSubstring = i5 < iMin ? this.accumulated.substring(i5, iMin) : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        StreamingMarkdownBuffer streamingMarkdownBuffer = StreamingMarkdownBuffer.INSTANCE;
        Intrinsics.d(strSubstring);
        String stableMarkdown = streamingMarkdownBuffer.getStableMarkdown(strSubstring);
        if (this.committedSpanned.length() == 0 && stableMarkdown.length() == 0) {
            textView.setText(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        } else {
            textView.setText(new SpannableStringBuilder(this.committedSpanned).append((CharSequence) stableMarkdown));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void scheduleNextFrame() {
        if (this.frameCallback != null) {
            return;
        }
        Choreographer.FrameCallback frameCallback = new Choreographer.FrameCallback() { // from class: com.instabridge.ai.chat.ui.v2.StreamingTextRenderer$scheduleNextFrame$callback$1
            @Override // android.view.Choreographer.FrameCallback
            public void doFrame(long frameTimeNanos) {
                this.this$0.frameCallback = null;
                this.this$0.tick(frameTimeNanos);
                TextView textView = this.this$0.attachedView;
                if (textView == null) {
                    return;
                }
                if (this.this$0.displayedLength < this.this$0.accumulated.length()) {
                    this.this$0.scheduleNextFrame();
                } else if (this.this$0.completionRequested) {
                    this.this$0.finalizeRender(textView);
                }
            }
        };
        this.frameCallback = frameCallback;
        Choreographer.getInstance().postFrameCallback(frameCallback);
    }

    private final void startTickerIfIdle() {
        if (this.frameCallback != null) {
            return;
        }
        this.lastFrameNs = 0L;
        Choreographer.FrameCallback frameCallback = new Choreographer.FrameCallback() { // from class: com.instabridge.ai.chat.ui.v2.StreamingTextRenderer$startTickerIfIdle$callback$1
            @Override // android.view.Choreographer.FrameCallback
            public void doFrame(long frameTimeNanos) {
                this.this$0.frameCallback = null;
                this.this$0.tick(frameTimeNanos);
                TextView textView = this.this$0.attachedView;
                if (textView == null) {
                    return;
                }
                if (this.this$0.displayedLength < this.this$0.accumulated.length()) {
                    this.this$0.scheduleNextFrame();
                } else if (this.this$0.completionRequested) {
                    this.this$0.finalizeRender(textView);
                }
            }
        };
        this.frameCallback = frameCallback;
        Choreographer.getInstance().postFrameCallback(frameCallback);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void tick(long frameTimeNanos) {
        TextView textView = this.attachedView;
        if (textView == null) {
            return;
        }
        if (this.lastFrameNs == 0) {
            this.lastFrameNs = frameTimeNanos;
        }
        this.lastFrameNs = frameTimeNanos;
        int length = this.accumulated.length() - this.displayedLength;
        if (length <= 0) {
            return;
        }
        int iMin = Math.min(this.accumulated.length(), this.displayedLength + Math.min(4, Math.max(1, (length + 27) / 28)));
        commitParagraphsUpTo(iMin);
        this.displayedLength = iMin;
        renderInto(textView);
    }

    public final void onComplete(@NotNull TextView textView) {
        Intrinsics.g(textView, "textView");
        this.attachedView = textView;
        this.completionRequested = true;
        if (this.displayedLength >= this.accumulated.length()) {
            finalizeRender(textView);
        } else {
            startTickerIfIdle();
        }
    }

    public final void onDelta(@NotNull TextView textView, @NotNull String delta) {
        Intrinsics.g(textView, "textView");
        Intrinsics.g(delta, "delta");
        if (delta.length() == 0) {
            return;
        }
        this.accumulated.append(delta);
        this.attachedView = textView;
        startTickerIfIdle();
    }

    @NotNull
    public final String rawText() {
        String string = this.accumulated.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }

    public final void reset() {
        cancelTicker();
        this.accumulated.setLength(0);
        this.committedSpanned.clear();
        this.activeParagraphStart = 0;
        this.displayedLength = 0;
        this.completionRequested = false;
        this.attachedView = null;
    }
}
