package com.apm.insight.l;

import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.security.MessageDigest;

/* loaded from: classes2.dex */
public final class e extends PrintWriter {

    /* renamed from: a, reason: collision with root package name */
    private MessageDigest f21750a;

    /* renamed from: b, reason: collision with root package name */
    private Charset f21751b;

    /* renamed from: c, reason: collision with root package name */
    private a f21752c;

    public static class a {
        public boolean a(String str) {
            return true;
        }
    }

    public e(OutputStream outputStream, MessageDigest messageDigest, a aVar) {
        super(outputStream);
        this.f21751b = null;
        this.f21750a = messageDigest;
        this.f21752c = aVar;
        if (messageDigest != null) {
            this.f21751b = Charset.defaultCharset();
        }
    }

    @Override // java.io.PrintWriter, java.io.Writer
    public final void write(char[] cArr, int i5, int i11) {
        super.write(cArr, i5, i11);
        MessageDigest messageDigest = this.f21750a;
        if (messageDigest != null) {
            messageDigest.update(this.f21751b.encode(CharBuffer.wrap(cArr)).array());
        }
    }

    @Override // java.io.PrintWriter, java.io.Writer
    public final void write(int i5) {
        super.write(i5);
        MessageDigest messageDigest = this.f21750a;
        if (messageDigest != null) {
            messageDigest.update((byte) i5);
        }
    }

    @Override // java.io.PrintWriter, java.io.Writer
    public final void write(String str, int i5, int i11) {
        super.write(str, i5, i11);
        if (this.f21750a != null) {
            a aVar = this.f21752c;
            if (aVar == null || aVar.a(str)) {
                this.f21750a.update(this.f21751b.encode(CharBuffer.wrap(str, i5, i11 + i5)).array());
            }
        }
    }
}
