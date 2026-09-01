package defpackage;

import java.nio.charset.StandardCharsets;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vy3 {
    public final String a;
    public s5d b;
    public final StringBuilder c;
    public int d;
    public int e;
    public r5d f;
    public int g;

    public vy3(String str) {
        byte[] bytes = str.getBytes(StandardCharsets.ISO_8859_1);
        StringBuilder sb = new StringBuilder(bytes.length);
        int length = bytes.length;
        for (int i = 0; i < length; i++) {
            char c = (char) (bytes[i] & 255);
            if (c == '?' && str.charAt(i) != '?') {
                ay0.e("Message contains characters outside ISO-8859-1 encoding.");
                throw null;
            }
            sb.append(c);
        }
        this.a = sb.toString();
        this.b = s5d.FORCE_NONE;
        this.c = new StringBuilder(str.length());
        this.e = -1;
    }

    public final char a() {
        return this.a.charAt(this.d);
    }

    public final boolean b() {
        return this.d < this.a.length() - this.g;
    }

    public final void c(int i) {
        r5d r5dVar = this.f;
        if (r5dVar == null || i > r5dVar.b) {
            this.f = r5d.e(i, this.b);
        }
    }

    public final void d(char c) {
        this.c.append(c);
    }
}
