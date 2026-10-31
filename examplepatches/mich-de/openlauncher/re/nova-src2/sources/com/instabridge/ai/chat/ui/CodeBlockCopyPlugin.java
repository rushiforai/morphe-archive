package com.instabridge.ai.chat.ui;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.text.Spannable;
import android.text.TextPaint;
import android.text.style.ClickableSpan;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;
import b.u4;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.ListIterator;
import java.util.Map;
import java.util.regex.Matcher;
import kotlin.Metadata;
import kotlin.collections.ReversedList$listIterator$1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010$\n\u0002\u0010\b\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0001\u0018\u00002\u00020\u0001B\u001b\u0012\u0012\u0010\u0005\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00040\u0002¢\u0006\u0004\b\u0006\u0010\u0007J\u001f\u0010\f\u001a\u00020\u000b2\u0006\u0010\t\u001a\u00020\b2\u0006\u0010\n\u001a\u00020\u0004H\u0002¢\u0006\u0004\b\f\u0010\rJ\u0017\u0010\u0010\u001a\u00020\u000b2\u0006\u0010\u000f\u001a\u00020\u000eH\u0016¢\u0006\u0004\b\u0010\u0010\u0011R \u0010\u0005\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00040\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\u0012¨\u0006\u0013"}, d2 = {"Lcom/instabridge/ai/chat/ui/CodeBlockCopyPlugin;", "Lh60/a;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "codeBlocks", "<init>", "(Ljava/util/Map;)V", "Landroid/content/Context;", "context", TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "copyToClipboard", "(Landroid/content/Context;Ljava/lang/String;)V", "Landroid/widget/TextView;", "textView", "afterSetText", "(Landroid/widget/TextView;)V", "Ljava/util/Map;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class CodeBlockCopyPlugin extends h60.a {
    public static final int $stable = 8;

    @NotNull
    private final Map<Integer, String> codeBlocks;

    @Metadata(d1 = {"\u0000!\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u000e\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000*\u0001\u0000\b\u008a\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J,\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0003HÆ\u0001¢\u0006\u0002\u0010\u0010J\u0013\u0010\u0011\u001a\u00020\u00122\b\u0010\u0013\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\tR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\t¨\u0006\u0017"}, d2 = {"com/instabridge/ai/chat/ui/CodeBlockCopyPlugin$afterSetText$Match", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "start", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "end", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, "<init>", "(III)V", "getStart", "()I", "getEnd", "getIndex", "component1", "component2", "component3", "copy", "(III)Lcom/instabridge/ai/chat/ui/CodeBlockCopyPlugin$afterSetText$Match;", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Match {
        private final int end;
        private final int index;
        private final int start;

        public Match(int i5, int i11, int i12) {
            this.start = i5;
            this.end = i11;
            this.index = i12;
        }

        public static /* synthetic */ Match copy$default(Match match, int i5, int i11, int i12, int i13, Object obj) {
            if ((i13 & 1) != 0) {
                i5 = match.start;
            }
            if ((i13 & 2) != 0) {
                i11 = match.end;
            }
            if ((i13 & 4) != 0) {
                i12 = match.index;
            }
            return match.copy(i5, i11, i12);
        }

        /* renamed from: component1, reason: from getter */
        public final int getStart() {
            return this.start;
        }

        /* renamed from: component2, reason: from getter */
        public final int getEnd() {
            return this.end;
        }

        /* renamed from: component3, reason: from getter */
        public final int getIndex() {
            return this.index;
        }

        public final Match copy(int start, int end, int index) {
            return new Match(start, end, index);
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Match)) {
                return false;
            }
            Match match = (Match) other;
            return this.start == match.start && this.end == match.end && this.index == match.index;
        }

        public final int getEnd() {
            return this.end;
        }

        public final int getIndex() {
            return this.index;
        }

        public final int getStart() {
            return this.start;
        }

        public int hashCode() {
            return Integer.hashCode(this.index) + u4.a(this.end, Integer.hashCode(this.start) * 31, 31);
        }

        public String toString() {
            StringBuilder sb2 = new StringBuilder("Match(start=");
            sb2.append(this.start);
            sb2.append(", end=");
            sb2.append(this.end);
            sb2.append(", index=");
            return a2.c.m(sb2, this.index, ')');
        }
    }

    public CodeBlockCopyPlugin(@NotNull Map<Integer, String> codeBlocks) {
        Intrinsics.g(codeBlocks, "codeBlocks");
        this.codeBlocks = codeBlocks;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void copyToClipboard(Context context, String code) {
        Object systemService = context.getSystemService("clipboard");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.content.ClipboardManager");
        ((ClipboardManager) systemService).setPrimaryClip(ClipData.newPlainText("code_block", code));
        Toast.makeText(context, 2132017320, 0).show();
    }

    @Override // h60.a, h60.f
    public void afterSetText(@NotNull TextView textView) {
        Integer numU0;
        Intrinsics.g(textView, "textView");
        if (this.codeBlocks.isEmpty()) {
            return;
        }
        CharSequence text = textView.getText();
        Spannable spannable = text instanceof Spannable ? (Spannable) text : null;
        if (spannable == null) {
            return;
        }
        Matcher matcher = CodeBlockCopyDecorator.INSTANCE.getTokenPattern().matcher(spannable);
        ArrayList arrayList = new ArrayList();
        while (matcher.find()) {
            String strGroup = matcher.group(1);
            if (strGroup != null && (numU0 = r70.i.u0(strGroup)) != null) {
                int iIntValue = numU0.intValue();
                if (this.codeBlocks.containsKey(numU0)) {
                    arrayList.add(new Match(matcher.start(), matcher.end(), iIntValue));
                }
            }
        }
        if (arrayList.isEmpty()) {
            return;
        }
        String string = textView.getContext().getString(2132017321);
        Intrinsics.f(string, "getString(...)");
        Iterator it = new b70.l(arrayList).iterator();
        while (true) {
            ListIterator listIterator = ((ReversedList$listIterator$1) it).f71740a;
            if (!listIterator.hasPrevious()) {
                return;
            }
            Match match = (Match) listIterator.previous();
            final String str = this.codeBlocks.get(Integer.valueOf(match.getIndex()));
            if (str != null) {
                Context context = textView.getContext();
                Intrinsics.f(context, "getContext(...)");
                spannable.setSpan(new CodeCopyChipSpan(context, string), match.getStart(), match.getEnd(), 33);
                spannable.setSpan(new ClickableSpan() { // from class: com.instabridge.ai.chat.ui.CodeBlockCopyPlugin.afterSetText.1
                    @Override // android.text.style.ClickableSpan
                    public void onClick(View widget) {
                        Intrinsics.g(widget, "widget");
                        CodeBlockCopyPlugin codeBlockCopyPlugin = CodeBlockCopyPlugin.this;
                        Context context2 = widget.getContext();
                        Intrinsics.f(context2, "getContext(...)");
                        codeBlockCopyPlugin.copyToClipboard(context2, str);
                    }

                    @Override // android.text.style.ClickableSpan, android.text.style.CharacterStyle
                    public void updateDrawState(TextPaint ds2) {
                        Intrinsics.g(ds2, "ds");
                    }
                }, match.getStart(), match.getEnd(), 33);
            }
        }
    }
}
