package com.instabridge.ai.chat.util;

import a2.c;
import b.c0;
import b70.g;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import r70.j;
import r70.k;

@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\bÁ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u000e\u0010\u0007\u001a\u00020\u00062\u0006\u0010\b\u001a\u00020\u0006J\u0010\u0010\t\u001a\u00020\n2\u0006\u0010\b\u001a\u00020\u0006H\u0002J\u0010\u0010\u000b\u001a\u00020\f2\u0006\u0010\b\u001a\u00020\u0006H\u0002J\u0010\u0010\r\u001a\u00020\u00062\u0006\u0010\u000e\u001a\u00020\u0006H\u0002R\u0014\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u000f"}, d2 = {"Lcom/instabridge/ai/chat/util/StreamingMarkdownBuffer;", b.f42142b, "<init>", "()V", "INLINE_MARKERS", b.f42142b, b.f42142b, "getStableMarkdown", "text", "isInsideFencedCodeBlock", b.f42142b, "findLastParagraphStart", b.f42142b, "trimUnclosedMarkers", "para", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class StreamingMarkdownBuffer {

    @NotNull
    public static final StreamingMarkdownBuffer INSTANCE = new StreamingMarkdownBuffer();

    @NotNull
    private static final List<String> INLINE_MARKERS = ul.b.Q("**", "~~", "*", "`");
    public static final int $stable = 8;

    @Metadata(d1 = {"\u0000!\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u000b\n\u0002\u0010\u000b\n\u0002\b\u0004*\u0001\u0000\b\u008a\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\"\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001¢\u0006\u0002\u0010\u000fJ\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0005HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"com/instabridge/ai/chat/util/StreamingMarkdownBuffer$trimUnclosedMarkers$OpenMarker", b.f42142b, "marker", b.f42142b, "position", b.f42142b, "<init>", "(Ljava/lang/String;I)V", "getMarker", "()Ljava/lang/String;", "getPosition", "()I", "component1", "component2", "copy", "(Ljava/lang/String;I)Lcom/instabridge/ai/chat/util/StreamingMarkdownBuffer$trimUnclosedMarkers$OpenMarker;", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class OpenMarker {
        private final String marker;
        private final int position;

        public OpenMarker(String marker, int i5) {
            Intrinsics.g(marker, "marker");
            this.marker = marker;
            this.position = i5;
        }

        public static /* synthetic */ OpenMarker copy$default(OpenMarker openMarker, String str, int i5, int i11, Object obj) {
            if ((i11 & 1) != 0) {
                str = openMarker.marker;
            }
            if ((i11 & 2) != 0) {
                i5 = openMarker.position;
            }
            return openMarker.copy(str, i5);
        }

        /* renamed from: component1, reason: from getter */
        public final String getMarker() {
            return this.marker;
        }

        /* renamed from: component2, reason: from getter */
        public final int getPosition() {
            return this.position;
        }

        public final OpenMarker copy(String marker, int position) {
            Intrinsics.g(marker, "marker");
            return new OpenMarker(marker, position);
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof OpenMarker)) {
                return false;
            }
            OpenMarker openMarker = (OpenMarker) other;
            return Intrinsics.b(this.marker, openMarker.marker) && this.position == openMarker.position;
        }

        public final String getMarker() {
            return this.marker;
        }

        public final int getPosition() {
            return this.position;
        }

        public int hashCode() {
            return Integer.hashCode(this.position) + (this.marker.hashCode() * 31);
        }

        public String toString() {
            StringBuilder sb2 = new StringBuilder("OpenMarker(marker=");
            sb2.append(this.marker);
            sb2.append(", position=");
            return c.m(sb2, this.position, ')');
        }
    }

    private StreamingMarkdownBuffer() {
    }

    private final int findLastParagraphStart(String text) {
        int iW0 = k.W0(6, text, "\n\n");
        if (iW0 >= 0) {
            return iW0 + 2;
        }
        return 0;
    }

    private final boolean isInsideFencedCodeBlock(String text) {
        int i5 = 0;
        int i11 = 0;
        while (i5 < text.length()) {
            if (j.H0(i5, text, "```", false) && (i5 == 0 || text.charAt(i5 - 1) == '\n')) {
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

    private final String trimUnclosedMarkers(String para) {
        boolean z11;
        int i5;
        if (para.length() == 0) {
            return para;
        }
        ArrayList arrayList = new ArrayList();
        int iR0 = 0;
        while (iR0 < para.length()) {
            Iterator<String> it = INLINE_MARKERS.iterator();
            while (true) {
                if (!it.hasNext()) {
                    z11 = false;
                    break;
                }
                String next = it.next();
                if (j.H0(iR0, para, next, false)) {
                    if (arrayList.isEmpty() || !Intrinsics.b(((OpenMarker) g.h1(arrayList)).getMarker(), next)) {
                        arrayList.add(new OpenMarker(next, iR0));
                    } else {
                        arrayList.remove(ul.b.K(arrayList));
                    }
                    iR0 += next.length();
                    z11 = true;
                }
            }
            if (!z11) {
                if (para.charAt(iR0) == '[' || (para.charAt(iR0) == '!' && (i5 = iR0 + 1) < para.length() && para.charAt(i5) == '[')) {
                    int i11 = para.charAt(iR0) == '!' ? iR0 + 1 : iR0;
                    arrayList.add(new OpenMarker("[", iR0));
                    iR0 = i11 + 1;
                } else {
                    if (para.charAt(iR0) == ']' && !arrayList.isEmpty() && Intrinsics.b(((OpenMarker) g.h1(arrayList)).getMarker(), "[")) {
                        int i12 = iR0 + 1;
                        if (i12 >= para.length() || para.charAt(i12) != '(') {
                            arrayList.remove(ul.b.K(arrayList));
                            iR0 = i12;
                        } else {
                            iR0 = k.R0(')', iR0 + 2, 4, para);
                            if (iR0 >= 0) {
                                arrayList.remove(ul.b.K(arrayList));
                            } else {
                                iR0 = i12;
                            }
                        }
                    }
                    iR0++;
                }
            }
        }
        if (arrayList.isEmpty()) {
            return para;
        }
        String strSubstring = para.substring(0, ((OpenMarker) g.W0(arrayList)).getPosition());
        Intrinsics.f(strSubstring, "substring(...)");
        return k.w1(strSubstring).toString();
    }

    @NotNull
    public final String getStableMarkdown(@NotNull String text) {
        Intrinsics.g(text, "text");
        if (text.length() == 0 || isInsideFencedCodeBlock(text)) {
            return text;
        }
        int iFindLastParagraphStart = findLastParagraphStart(text);
        String strSubstring = text.substring(0, iFindLastParagraphStart);
        Intrinsics.f(strSubstring, "substring(...)");
        String strSubstring2 = text.substring(iFindLastParagraphStart);
        Intrinsics.f(strSubstring2, "substring(...)");
        return c0.E(strSubstring, trimUnclosedMarkers(strSubstring2));
    }
}
