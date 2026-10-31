package rf;

import android.text.SpannableStringBuilder;
import android.text.style.ForegroundColorSpan;
import android.text.style.StyleSpan;
import android.text.style.TypefaceSpan;
import android.text.style.UnderlineSpan;
import b.u4;
import com.google.android.exoplayer2.text.SubtitleDecoderException;
import h6.c1;
import java.util.List;
import jf.e;
import jf.f;
import wf.v;

/* loaded from: classes3.dex */
public final class a extends e {

    /* renamed from: m, reason: collision with root package name */
    public final com.google.android.gms.internal.consent_sdk.a f85845m = new com.google.android.gms.internal.consent_sdk.a(13, (byte) 0);
    public final boolean n;
    public final int o;

    /* renamed from: p, reason: collision with root package name */
    public final int f85846p;

    /* renamed from: q, reason: collision with root package name */
    public final String f85847q;

    /* renamed from: r, reason: collision with root package name */
    public final float f85848r;

    /* renamed from: s, reason: collision with root package name */
    public final int f85849s;

    public a(List list) {
        if (list.size() != 1 || (((byte[]) list.get(0)).length != 48 && ((byte[]) list.get(0)).length != 53)) {
            this.o = 0;
            this.f85846p = -1;
            this.f85847q = "sans-serif";
            this.n = false;
            this.f85848r = 0.85f;
            this.f85849s = -1;
            return;
        }
        byte[] bArr = (byte[]) list.get(0);
        this.o = bArr[24];
        this.f85846p = ((bArr[26] & 255) << 24) | ((bArr[27] & 255) << 16) | ((bArr[28] & 255) << 8) | (bArr[29] & 255);
        this.f85847q = "Serif".equals(new String(bArr, 43, bArr.length - 43, vk.e.f92809c)) ? "serif" : "sans-serif";
        int i5 = bArr[25] * 20;
        this.f85849s = i5;
        boolean z11 = (bArr[0] & 32) != 0;
        this.n = z11;
        if (z11) {
            this.f85848r = v.g(((bArr[11] & 255) | ((bArr[10] & 255) << 8)) / i5, 0.0f, 0.95f);
        } else {
            this.f85848r = 0.85f;
        }
    }

    public static void h(SpannableStringBuilder spannableStringBuilder, int i5, int i11, int i12, int i13, int i14) {
        if (i5 != i11) {
            spannableStringBuilder.setSpan(new ForegroundColorSpan((i5 >>> 8) | ((i5 & 255) << 24)), i12, i13, i14 | 33);
        }
    }

    public static void i(SpannableStringBuilder spannableStringBuilder, int i5, int i11, int i12, int i13, int i14) {
        if (i5 != i11) {
            int i15 = i14 | 33;
            boolean z11 = (i5 & 1) != 0;
            boolean z12 = (i5 & 2) != 0;
            if (z11) {
                if (z12) {
                    spannableStringBuilder.setSpan(new StyleSpan(3), i12, i13, i15);
                } else {
                    spannableStringBuilder.setSpan(new StyleSpan(1), i12, i13, i15);
                }
            } else if (z12) {
                spannableStringBuilder.setSpan(new StyleSpan(2), i12, i13, i15);
            }
            boolean z13 = (i5 & 4) != 0;
            if (z13) {
                spannableStringBuilder.setSpan(new UnderlineSpan(), i12, i13, i15);
            }
            if (z13 || z11 || z12) {
                return;
            }
            spannableStringBuilder.setSpan(new StyleSpan(0), i12, i13, i15);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0049  */
    @Override // jf.e
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final f f(byte[] bArr, int i5, boolean z11) throws SubtitleDecoderException {
        String strL;
        int i11;
        int i12;
        com.google.android.gms.internal.consent_sdk.a aVar = this.f85845m;
        aVar.V(i5, bArr);
        int i13 = 2;
        if (aVar.g() < 2) {
            throw new SubtitleDecoderException("Unexpected subtitle format.");
        }
        int iS = aVar.S();
        int i14 = 8;
        int i15 = 1;
        if (iS == 0) {
            strL = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        } else if (aVar.g() >= 2) {
            byte[] bArr2 = (byte[]) aVar.f31986d;
            int i16 = aVar.f31984b;
            char c11 = (char) ((bArr2[i16 + 1] & 255) | ((bArr2[i16] & 255) << 8));
            strL = (c11 == 65279 || c11 == 65534) ? aVar.L(iS, vk.e.f92810d) : aVar.L(iS, vk.e.f92809c);
        }
        if (strL.isEmpty()) {
            return b.f85850b;
        }
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder(strL);
        i(spannableStringBuilder, this.o, 0, 0, spannableStringBuilder.length(), 16711680);
        h(spannableStringBuilder, this.f85846p, -1, 0, spannableStringBuilder.length(), 16711680);
        int length = spannableStringBuilder.length();
        int i17 = 0;
        String str = this.f85847q;
        if (str != "sans-serif") {
            spannableStringBuilder.setSpan(new TypefaceSpan(str), 0, length, 16711713);
        }
        float fG = this.f85848r;
        while (aVar.g() >= i14) {
            int i18 = aVar.f31984b;
            int iA = aVar.A();
            int iA2 = aVar.A();
            if (iA2 == 1937013100) {
                if (aVar.g() < i13) {
                    throw new SubtitleDecoderException("Unexpected subtitle format.");
                }
                int iS2 = aVar.S();
                int i19 = i17;
                while (i19 < iS2) {
                    if (aVar.g() < 12) {
                        throw new SubtitleDecoderException("Unexpected subtitle format.");
                    }
                    int iS3 = aVar.S();
                    int iS4 = aVar.S();
                    aVar.Z(i13);
                    int i21 = iS2;
                    int iN = aVar.N();
                    aVar.Z(i15);
                    int iA3 = aVar.A();
                    if (iS4 > spannableStringBuilder.length()) {
                        StringBuilder sbJ = u4.j(iS4, "Truncating styl end (", ") to cueText.length() (");
                        sbJ.append(spannableStringBuilder.length());
                        sbJ.append(").");
                        wf.a.D("Tx3gDecoder", sbJ.toString());
                        iS4 = spannableStringBuilder.length();
                    }
                    if (iS3 >= iS4) {
                        wf.a.D("Tx3gDecoder", c1.n(iS3, "Ignoring styl with start (", ") >= end (", iS4, ")."));
                        i11 = i19;
                        i12 = i21;
                    } else {
                        i11 = i19;
                        i12 = i21;
                        i(spannableStringBuilder, iN, this.o, iS3, iS4, 0);
                        h(spannableStringBuilder, iA3, this.f85846p, iS3, iS4, 0);
                    }
                    i19 = i11 + 1;
                    iS2 = i12;
                    i13 = 2;
                    i15 = 1;
                }
            } else if (iA2 == 1952608120 && this.n) {
                i13 = 2;
                if (aVar.g() < 2) {
                    throw new SubtitleDecoderException("Unexpected subtitle format.");
                }
                fG = v.g(aVar.S() / this.f85849s, 0.0f, 0.95f);
            } else {
                i13 = 2;
            }
            aVar.Y(i18 + iA);
            i14 = 8;
            i15 = 1;
            i17 = 0;
        }
        return new b(new jf.b(spannableStringBuilder, null, null, null, fG, 0, 0, -3.4028235E38f, Integer.MIN_VALUE, Integer.MIN_VALUE, -3.4028235E38f, -3.4028235E38f, -3.4028235E38f, false, -16777216, Integer.MIN_VALUE, 0.0f));
    }
}
