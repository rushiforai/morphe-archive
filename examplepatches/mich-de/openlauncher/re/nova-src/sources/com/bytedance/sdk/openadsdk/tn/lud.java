package com.bytedance.sdk.openadsdk.tn;

import java.nio.charset.Charset;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes2.dex */
public final class lud {
    static final /* synthetic */ boolean ycx = true;

    /* renamed from: zb, reason: collision with root package name */
    private static final List<CharsetEncoder> f27054zb = new ArrayList();

    /* renamed from: dj, reason: collision with root package name */
    private final int f27055dj;
    private final CharsetEncoder[] sya;

    public lud(String str, Charset charset, int i5) {
        int i11;
        boolean z11;
        ArrayList arrayList = new ArrayList();
        arrayList.add(StandardCharsets.ISO_8859_1.newEncoder());
        boolean z12 = charset != null && charset.name().startsWith("UTF");
        for (int i12 = 0; i12 < str.length(); i12++) {
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                CharsetEncoder charsetEncoder = (CharsetEncoder) it.next();
                char cCharAt = str.charAt(i12);
                if (cCharAt == i5 || charsetEncoder.canEncode(cCharAt)) {
                    z11 = true;
                    break;
                }
            }
            z11 = false;
            if (!z11) {
                Iterator<CharsetEncoder> it2 = f27054zb.iterator();
                while (true) {
                    if (!it2.hasNext()) {
                        break;
                    }
                    CharsetEncoder next = it2.next();
                    if (next.canEncode(str.charAt(i12))) {
                        arrayList.add(next);
                        z11 = true;
                        break;
                    }
                }
            }
            if (!z11) {
                z12 = true;
            }
        }
        if (arrayList.size() != 1 || z12) {
            this.sya = new CharsetEncoder[arrayList.size() + 2];
            Iterator it3 = arrayList.iterator();
            int i13 = 0;
            while (it3.hasNext()) {
                this.sya[i13] = (CharsetEncoder) it3.next();
                i13++;
            }
            this.sya[i13] = StandardCharsets.UTF_8.newEncoder();
            this.sya[i13 + 1] = StandardCharsets.UTF_16BE.newEncoder();
        } else {
            this.sya = new CharsetEncoder[]{(CharsetEncoder) arrayList.get(0)};
        }
        if (charset != null) {
            i11 = 0;
            while (true) {
                CharsetEncoder[] charsetEncoderArr = this.sya;
                if (i11 >= charsetEncoderArr.length) {
                    break;
                }
                if (charsetEncoderArr[i11] != null && charset.name().equals(this.sya[i11].charset().name())) {
                    break;
                } else {
                    i11++;
                }
            }
        } else {
            i11 = -1;
        }
        this.f27055dj = i11;
        if (!ycx && !this.sya[0].charset().equals(StandardCharsets.ISO_8859_1)) {
            throw new AssertionError();
        }
    }

    public int ycx() {
        return this.sya.length;
    }

    public int zb(int i5) {
        return dj.ycx(this.sya[i5].charset()).ycx();
    }

    public Charset ycx(int i5) {
        if (ycx || i5 < ycx()) {
            return this.sya[i5].charset();
        }
        throw new AssertionError();
    }

    public int zb() {
        return this.f27055dj;
    }

    public boolean ycx(char c11, int i5) {
        if (ycx || i5 < ycx()) {
            return this.sya[i5].canEncode(String.valueOf(c11));
        }
        throw new AssertionError();
    }

    public byte[] ycx(String str, int i5) {
        if (ycx || i5 < ycx()) {
            return str.getBytes(this.sya[i5].charset());
        }
        throw new AssertionError();
    }
}
