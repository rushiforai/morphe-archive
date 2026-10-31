package io.sentry.vendor.gson.stream;

import java.io.Closeable;
import java.io.Flushable;
import java.io.IOException;
import java.io.Writer;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes4.dex */
public final class c implements Closeable, Flushable {

    /* renamed from: i, reason: collision with root package name */
    public static final String[] f67883i = new String[128];

    /* renamed from: a, reason: collision with root package name */
    public final Writer f67884a;

    /* renamed from: b, reason: collision with root package name */
    public int[] f67885b;

    /* renamed from: c, reason: collision with root package name */
    public int f67886c;

    /* renamed from: d, reason: collision with root package name */
    public String f67887d;

    /* renamed from: e, reason: collision with root package name */
    public String f67888e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f67889f;

    /* renamed from: g, reason: collision with root package name */
    public String f67890g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f67891h;

    static {
        for (int i5 = 0; i5 <= 31; i5++) {
            f67883i[i5] = String.format("\\u%04x", Integer.valueOf(i5));
        }
        String[] strArr = f67883i;
        strArr[34] = "\\\"";
        strArr[92] = "\\\\";
        strArr[9] = "\\t";
        strArr[8] = "\\b";
        strArr[10] = "\\n";
        strArr[13] = "\\r";
        strArr[12] = "\\f";
        String[] strArr2 = (String[]) strArr.clone();
        strArr2[60] = "\\u003c";
        strArr2[62] = "\\u003e";
        strArr2[38] = "\\u0026";
        strArr2[61] = "\\u003d";
        strArr2[39] = "\\u0027";
    }

    public c(Writer writer) {
        int[] iArr = new int[32];
        this.f67885b = iArr;
        this.f67886c = 0;
        if (iArr.length == 0) {
            this.f67885b = Arrays.copyOf(iArr, 0);
        }
        int[] iArr2 = this.f67885b;
        int i5 = this.f67886c;
        this.f67886c = i5 + 1;
        iArr2[i5] = 6;
        this.f67888e = ":";
        this.f67891h = true;
        this.f67884a = writer;
    }

    public final void a() throws IOException {
        int iE = e();
        if (iE == 1) {
            this.f67885b[this.f67886c - 1] = 2;
            c();
            return;
        }
        Writer writer = this.f67884a;
        if (iE == 2) {
            writer.append(AbstractJsonLexerKt.COMMA);
            c();
        } else {
            if (iE == 4) {
                writer.append((CharSequence) this.f67888e);
                this.f67885b[this.f67886c - 1] = 5;
                return;
            }
            if (iE != 6) {
                if (iE != 7) {
                    throw new IllegalStateException("Nesting problem.");
                }
                if (!this.f67889f) {
                    throw new IllegalStateException("JSON must have only one top-level value.");
                }
            }
            this.f67885b[this.f67886c - 1] = 7;
        }
    }

    public final void b(int i5, int i11, char c11) throws IOException {
        int iE = e();
        if (iE != i11 && iE != i5) {
            throw new IllegalStateException("Nesting problem.");
        }
        if (this.f67890g != null) {
            throw new IllegalStateException("Dangling name: " + this.f67890g);
        }
        this.f67886c--;
        if (iE == i11) {
            c();
        }
        this.f67884a.write(c11);
    }

    public final void c() throws IOException {
        if (this.f67887d == null) {
            return;
        }
        Writer writer = this.f67884a;
        writer.write(10);
        int i5 = this.f67886c;
        for (int i11 = 1; i11 < i5; i11++) {
            writer.write(this.f67887d);
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        this.f67884a.close();
        int i5 = this.f67886c;
        if (i5 > 1 || (i5 == 1 && this.f67885b[i5 - 1] != 7)) {
            throw new IOException("Incomplete document");
        }
        this.f67886c = 0;
    }

    public final void d() throws IOException {
        if (this.f67890g != null) {
            if (!this.f67891h) {
                this.f67890g = null;
                return;
            }
            h();
        }
        a();
        this.f67884a.write(AbstractJsonLexerKt.NULL);
    }

    public final int e() {
        int i5 = this.f67886c;
        if (i5 != 0) {
            return this.f67885b[i5 - 1];
        }
        throw new IllegalStateException("JsonWriter is closed.");
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x002d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void f(String str) throws IOException {
        String str2;
        Writer writer = this.f67884a;
        writer.write(34);
        int length = str.length();
        int i5 = 0;
        for (int i11 = 0; i11 < length; i11++) {
            char cCharAt = str.charAt(i11);
            if (cCharAt < 128) {
                str2 = f67883i[cCharAt];
                if (str2 != null) {
                    if (i5 < i11) {
                        writer.write(str, i5, i11 - i5);
                    }
                    writer.write(str2);
                    i5 = i11 + 1;
                }
            } else {
                if (cCharAt == 8232) {
                    str2 = "\\u2028";
                } else if (cCharAt == 8233) {
                    str2 = "\\u2029";
                }
                if (i5 < i11) {
                }
                writer.write(str2);
                i5 = i11 + 1;
            }
        }
        if (i5 < length) {
            writer.write(str, i5, length - i5);
        }
        writer.write(34);
    }

    @Override // java.io.Flushable
    public final void flush() throws IOException {
        if (this.f67886c == 0) {
            throw new IllegalStateException("JsonWriter is closed.");
        }
        this.f67884a.flush();
    }

    public final void h() throws IOException {
        if (this.f67890g != null) {
            int iE = e();
            if (iE == 5) {
                this.f67884a.write(44);
            } else if (iE != 3) {
                throw new IllegalStateException("Nesting problem.");
            }
            c();
            this.f67885b[this.f67886c - 1] = 4;
            f(this.f67890g);
            this.f67890g = null;
        }
    }
}
