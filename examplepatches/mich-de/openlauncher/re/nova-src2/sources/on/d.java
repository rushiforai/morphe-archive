package on;

import java.nio.charset.Charset;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.charset.UnsupportedCharsetException;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class d {

    /* renamed from: c, reason: collision with root package name */
    public static final ArrayList f80543c = new ArrayList();

    /* renamed from: a, reason: collision with root package name */
    public final CharsetEncoder[] f80544a;

    /* renamed from: b, reason: collision with root package name */
    public final int f80545b;

    static {
        String[] strArr = {"IBM437", "ISO-8859-2", "ISO-8859-3", "ISO-8859-4", "ISO-8859-5", "ISO-8859-6", "ISO-8859-7", "ISO-8859-8", "ISO-8859-9", "ISO-8859-10", "ISO-8859-11", "ISO-8859-13", "ISO-8859-14", "ISO-8859-15", "ISO-8859-16", "windows-1250", "windows-1251", "windows-1252", "windows-1256", "Shift_JIS"};
        for (int i5 = 0; i5 < 20; i5++) {
            String str = strArr[i5];
            if (((c) c.f80539d.get(str)) != null) {
                try {
                    f80543c.add(Charset.forName(str).newEncoder());
                } catch (UnsupportedCharsetException unused) {
                }
            }
        }
    }

    public d(String str, Charset charset) {
        int i5;
        boolean z11;
        ArrayList arrayList = new ArrayList();
        arrayList.add(StandardCharsets.ISO_8859_1.newEncoder());
        int i11 = 0;
        boolean z12 = charset != null && charset.name().startsWith("UTF");
        int i12 = 0;
        while (true) {
            i5 = -1;
            if (i12 >= str.length()) {
                break;
            }
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                CharsetEncoder charsetEncoder = (CharsetEncoder) it.next();
                char cCharAt = str.charAt(i12);
                if (cCharAt == 65535 || charsetEncoder.canEncode(cCharAt)) {
                    z11 = true;
                    break;
                }
            }
            z11 = false;
            if (!z11) {
                Iterator it2 = f80543c.iterator();
                while (true) {
                    if (!it2.hasNext()) {
                        break;
                    }
                    CharsetEncoder charsetEncoder2 = (CharsetEncoder) it2.next();
                    if (charsetEncoder2.canEncode(str.charAt(i12))) {
                        arrayList.add(charsetEncoder2);
                        z11 = true;
                        break;
                    }
                }
            }
            if (!z11) {
                z12 = true;
            }
            i12++;
        }
        if (arrayList.size() != 1 || z12) {
            this.f80544a = new CharsetEncoder[arrayList.size() + 2];
            Iterator it3 = arrayList.iterator();
            int i13 = 0;
            while (it3.hasNext()) {
                this.f80544a[i13] = (CharsetEncoder) it3.next();
                i13++;
            }
            this.f80544a[i13] = StandardCharsets.UTF_8.newEncoder();
            this.f80544a[i13 + 1] = StandardCharsets.UTF_16BE.newEncoder();
        } else {
            this.f80544a = new CharsetEncoder[]{(CharsetEncoder) arrayList.get(0)};
        }
        if (charset != null) {
            while (true) {
                CharsetEncoder[] charsetEncoderArr = this.f80544a;
                if (i11 < charsetEncoderArr.length) {
                    if (charsetEncoderArr[i11] != null && charset.name().equals(this.f80544a[i11].charset().name())) {
                        i5 = i11;
                        break;
                    }
                    i11++;
                } else {
                    break;
                }
            }
        }
        this.f80545b = i5;
    }
}
