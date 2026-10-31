package com.instabridge.ai.chat.ui;

import android.content.Context;
import android.text.Spannable;
import android.text.TextPaint;
import android.text.style.ClickableSpan;
import android.view.View;
import android.widget.TextView;
import b.u4;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.ai.chat.model.ChatMessage;
import com.instabridge.ai.chat.util.CitationMarkdownTransform;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import kotlin.Metadata;
import kotlin.collections.ReversedList$listIterator$1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0001\u0018\u00002\u00020\u0001B\u0015\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00030\u0002¢\u0006\u0004\b\u0005\u0010\u0006J\u0017\u0010\n\u001a\u00020\t2\u0006\u0010\b\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\n\u0010\u000bR\u001a\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00030\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\fR\u0014\u0010\u000e\u001a\u00020\r8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010\u000f¨\u0006\u0010"}, d2 = {"Lcom/instabridge/ai/chat/ui/CitationBadgePlugin;", "Lh60/a;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/instabridge/ai/chat/model/ChatMessage$Source;", "sources", "<init>", "(Ljava/util/List;)V", "Landroid/widget/TextView;", "textView", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "afterSetText", "(Landroid/widget/TextView;)V", "Ljava/util/List;", "Ljava/util/regex/Pattern;", "pattern", "Ljava/util/regex/Pattern;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class CitationBadgePlugin extends h60.a {
    public static final int $stable = 8;

    @NotNull
    private final Pattern pattern;

    @NotNull
    private final List<ChatMessage.Source> sources;

    @Metadata(d1 = {"\u0000!\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u000e\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000*\u0001\u0000\b\u008a\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J,\u0010\u000f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0003HÆ\u0001¢\u0006\u0002\u0010\u0010J\u0013\u0010\u0011\u001a\u00020\u00122\b\u0010\u0013\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0016HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\tR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\t¨\u0006\u0017"}, d2 = {"com/instabridge/ai/chat/ui/CitationBadgePlugin$afterSetText$Match", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "start", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "end", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, "<init>", "(III)V", "getStart", "()I", "getEnd", "getIndex", "component1", "component2", "component3", "copy", "(III)Lcom/instabridge/ai/chat/ui/CitationBadgePlugin$afterSetText$Match;", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
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

    public CitationBadgePlugin(@NotNull List<ChatMessage.Source> sources) {
        Intrinsics.g(sources, "sources");
        this.sources = sources;
        this.pattern = CitationMarkdownTransform.INSTANCE.getTokenPattern();
    }

    @Override // h60.a, h60.f
    public void afterSetText(@NotNull TextView textView) {
        Integer numU0;
        int iIntValue;
        Intrinsics.g(textView, "textView");
        CharSequence text = textView.getText();
        Spannable spannable = text instanceof Spannable ? (Spannable) text : null;
        if (spannable == null) {
            return;
        }
        Matcher matcher = this.pattern.matcher(spannable);
        ArrayList arrayList = new ArrayList();
        while (matcher.find()) {
            String strGroup = matcher.group(1);
            if (strGroup != null && (numU0 = r70.i.u0(strGroup)) != null && (iIntValue = numU0.intValue()) >= 1 && iIntValue <= this.sources.size()) {
                arrayList.add(new Match(matcher.start(), matcher.end(), iIntValue));
            }
        }
        Iterator it = new b70.l(arrayList).iterator();
        while (true) {
            ListIterator listIterator = ((ReversedList$listIterator$1) it).f71740a;
            if (!listIterator.hasPrevious()) {
                return;
            }
            Match match = (Match) listIterator.previous();
            final ChatMessage.Source source = this.sources.get(match.getIndex() - 1);
            Context context = textView.getContext();
            Intrinsics.f(context, "getContext(...)");
            spannable.setSpan(new CitationBadgeSpan(context, match.getIndex(), source.getUrl()), match.getStart(), match.getEnd(), 33);
            spannable.setSpan(new ClickableSpan() { // from class: com.instabridge.ai.chat.ui.CitationBadgePlugin$afterSetText$clickSpan$1
                @Override // android.text.style.ClickableSpan
                public void onClick(View widget) {
                    Intrinsics.g(widget, "widget");
                    ChatUrlOpeners chatUrlOpeners = ChatUrlOpeners.INSTANCE;
                    Context context2 = widget.getContext();
                    Intrinsics.f(context2, "getContext(...)");
                    chatUrlOpeners.open(context2, source.getUrl());
                }

                @Override // android.text.style.ClickableSpan, android.text.style.CharacterStyle
                public void updateDrawState(TextPaint ds2) {
                    Intrinsics.g(ds2, "ds");
                }
            }, match.getStart(), match.getEnd(), 33);
        }
    }
}
