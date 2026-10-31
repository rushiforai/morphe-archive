package f8;

import b.c0;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.Charset;
import java.nio.charset.CharsetEncoder;
import java.nio.charset.CoderResult;
import java.nio.charset.IllegalCharsetNameException;
import java.nio.charset.UnsupportedCharsetException;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.xmlpull.v1.XmlSerializer;

/* loaded from: classes2.dex */
public final class a implements XmlSerializer {

    /* renamed from: h, reason: collision with root package name */
    public static final String[] f54344h = {null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, "&quot;", null, null, null, "&amp;", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, "&lt;", null, "&gt;", null};

    /* renamed from: b, reason: collision with root package name */
    public int f54346b;

    /* renamed from: c, reason: collision with root package name */
    public Writer f54347c;

    /* renamed from: d, reason: collision with root package name */
    public OutputStream f54348d;

    /* renamed from: e, reason: collision with root package name */
    public CharsetEncoder f54349e;

    /* renamed from: g, reason: collision with root package name */
    public boolean f54351g;

    /* renamed from: a, reason: collision with root package name */
    public final char[] f54345a = new char[UserMetadata.MAX_INTERNAL_KEY_SIZE];

    /* renamed from: f, reason: collision with root package name */
    public final ByteBuffer f54350f = ByteBuffer.allocate(UserMetadata.MAX_INTERNAL_KEY_SIZE);

    public final void a(char c11) throws IOException {
        int i5 = this.f54346b;
        if (i5 >= 8191) {
            flush();
            i5 = this.f54346b;
        }
        this.f54345a[i5] = c11;
        this.f54346b = i5 + 1;
    }

    @Override // org.xmlpull.v1.XmlSerializer
    public final XmlSerializer attribute(String str, String str2, String str3) throws IOException {
        a(' ');
        if (str != null) {
            b(0, str.length(), str);
            a(AbstractJsonLexerKt.COLON);
        }
        b(0, str2.length(), str2);
        b(0, 2, "=\"");
        d(str3);
        a(AbstractJsonLexerKt.STRING);
        return this;
    }

    public final void b(int i5, int i11, String str) throws IOException {
        if (i11 > 8192) {
            int i12 = i11 + i5;
            while (i5 < i12) {
                int i13 = i5 + UserMetadata.MAX_INTERNAL_KEY_SIZE;
                b(i5, i13 < i12 ? 8192 : i12 - i5, str);
                i5 = i13;
            }
            return;
        }
        int i14 = this.f54346b;
        if (i14 + i11 > 8192) {
            flush();
            i14 = this.f54346b;
        }
        str.getChars(i5, i5 + i11, this.f54345a, i14);
        this.f54346b = i14 + i11;
    }

    public final void c(char[] cArr, int i5, int i11) throws IOException {
        if (i11 > 8192) {
            int i12 = i11 + i5;
            while (i5 < i12) {
                int i13 = i5 + UserMetadata.MAX_INTERNAL_KEY_SIZE;
                c(cArr, i5, i13 < i12 ? 8192 : i12 - i5);
                i5 = i13;
            }
            return;
        }
        int i14 = this.f54346b;
        if (i14 + i11 > 8192) {
            flush();
            i14 = this.f54346b;
        }
        System.arraycopy(cArr, i5, this.f54345a, i14, i11);
        this.f54346b = i14 + i11;
    }

    @Override // org.xmlpull.v1.XmlSerializer
    public final void cdsect(String str) {
        throw new UnsupportedOperationException();
    }

    @Override // org.xmlpull.v1.XmlSerializer
    public final void comment(String str) {
        throw new UnsupportedOperationException();
    }

    public final void d(String str) throws IOException {
        String str2;
        int length = str.length();
        char c11 = (char) 64;
        int i5 = 0;
        int i11 = 0;
        while (i5 < length) {
            char cCharAt = str.charAt(i5);
            if (cCharAt < c11 && (str2 = f54344h[cCharAt]) != null) {
                if (i11 < i5) {
                    b(i11, i5 - i11, str);
                }
                i11 = i5 + 1;
                b(0, str2.length(), str2);
            }
            i5++;
        }
        if (i11 < i5) {
            b(i11, i5 - i11, str);
        }
    }

    @Override // org.xmlpull.v1.XmlSerializer
    public final void docdecl(String str) {
        throw new UnsupportedOperationException();
    }

    @Override // org.xmlpull.v1.XmlSerializer
    public final void endDocument() throws IOException {
        flush();
    }

    @Override // org.xmlpull.v1.XmlSerializer
    public final XmlSerializer endTag(String str, String str2) throws IOException {
        if (this.f54351g) {
            b(0, 4, " />\n");
        } else {
            b(0, 2, "</");
            if (str != null) {
                b(0, str.length(), str);
                a(AbstractJsonLexerKt.COLON);
            }
            b(0, str2.length(), str2);
            b(0, 2, ">\n");
        }
        this.f54351g = false;
        return this;
    }

    @Override // org.xmlpull.v1.XmlSerializer
    public final void entityRef(String str) {
        throw new UnsupportedOperationException();
    }

    @Override // org.xmlpull.v1.XmlSerializer
    public final void flush() throws IOException {
        int i5 = this.f54346b;
        if (i5 > 0) {
            OutputStream outputStream = this.f54348d;
            char[] cArr = this.f54345a;
            if (outputStream != null) {
                CharBuffer charBufferWrap = CharBuffer.wrap(cArr, 0, i5);
                CharsetEncoder charsetEncoder = this.f54349e;
                ByteBuffer byteBuffer = this.f54350f;
                CoderResult coderResultEncode = charsetEncoder.encode(charBufferWrap, byteBuffer, true);
                while (!coderResultEncode.isError()) {
                    if (coderResultEncode.isOverflow()) {
                        int iPosition = byteBuffer.position();
                        if (iPosition > 0) {
                            byteBuffer.flip();
                            this.f54348d.write(byteBuffer.array(), 0, iPosition);
                            byteBuffer.clear();
                        }
                        coderResultEncode = this.f54349e.encode(charBufferWrap, byteBuffer, true);
                    } else {
                        int iPosition2 = byteBuffer.position();
                        if (iPosition2 > 0) {
                            byteBuffer.flip();
                            this.f54348d.write(byteBuffer.array(), 0, iPosition2);
                            byteBuffer.clear();
                        }
                        this.f54348d.flush();
                    }
                }
                throw new IOException(coderResultEncode.toString());
            }
            this.f54347c.write(cArr, 0, i5);
            this.f54347c.flush();
            this.f54346b = 0;
        }
    }

    @Override // org.xmlpull.v1.XmlSerializer
    public final int getDepth() {
        throw new UnsupportedOperationException();
    }

    @Override // org.xmlpull.v1.XmlSerializer
    public final boolean getFeature(String str) {
        throw new UnsupportedOperationException();
    }

    @Override // org.xmlpull.v1.XmlSerializer
    public final String getName() {
        throw new UnsupportedOperationException();
    }

    @Override // org.xmlpull.v1.XmlSerializer
    public final String getNamespace() {
        throw new UnsupportedOperationException();
    }

    @Override // org.xmlpull.v1.XmlSerializer
    public final String getPrefix(String str, boolean z11) {
        throw new UnsupportedOperationException();
    }

    @Override // org.xmlpull.v1.XmlSerializer
    public final Object getProperty(String str) {
        throw new UnsupportedOperationException();
    }

    @Override // org.xmlpull.v1.XmlSerializer
    public final void ignorableWhitespace(String str) {
        throw new UnsupportedOperationException();
    }

    @Override // org.xmlpull.v1.XmlSerializer
    public final void processingInstruction(String str) {
        throw new UnsupportedOperationException();
    }

    @Override // org.xmlpull.v1.XmlSerializer
    public final void setFeature(String str, boolean z11) {
        if (!str.equals("http://xmlpull.org/v1/doc/features.html#indent-output")) {
            throw new UnsupportedOperationException();
        }
    }

    @Override // org.xmlpull.v1.XmlSerializer
    public final void setOutput(OutputStream outputStream, String str) throws UnsupportedEncodingException {
        if (outputStream == null) {
            throw new IllegalArgumentException();
        }
        try {
            this.f54349e = Charset.forName(str).newEncoder();
            this.f54348d = outputStream;
        } catch (IllegalCharsetNameException e3) {
            throw ((UnsupportedEncodingException) new UnsupportedEncodingException(str).initCause(e3));
        } catch (UnsupportedCharsetException e11) {
            throw ((UnsupportedEncodingException) new UnsupportedEncodingException(str).initCause(e11));
        }
    }

    @Override // org.xmlpull.v1.XmlSerializer
    public final void setPrefix(String str, String str2) {
        throw new UnsupportedOperationException();
    }

    @Override // org.xmlpull.v1.XmlSerializer
    public final void setProperty(String str, Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // org.xmlpull.v1.XmlSerializer
    public final void startDocument(String str, Boolean bool) throws IOException {
        String strQ = c0.q(new StringBuilder("<?xml version='1.0' encoding='utf-8' standalone='"), bool.booleanValue() ? "yes" : "no", "' ?>\n");
        b(0, strQ.length(), strQ);
    }

    @Override // org.xmlpull.v1.XmlSerializer
    public final XmlSerializer startTag(String str, String str2) throws IOException {
        if (this.f54351g) {
            b(0, 2, ">\n");
        }
        a('<');
        if (str != null) {
            b(0, str.length(), str);
            a(AbstractJsonLexerKt.COLON);
        }
        b(0, str2.length(), str2);
        this.f54351g = true;
        return this;
    }

    @Override // org.xmlpull.v1.XmlSerializer
    public final XmlSerializer text(char[] cArr, int i5, int i11) throws IOException {
        String str;
        if (this.f54351g) {
            b(0, 1, ">");
            this.f54351g = false;
        }
        char c11 = (char) 64;
        int i12 = i11 + i5;
        int i13 = i5;
        while (i5 < i12) {
            char c12 = cArr[i5];
            if (c12 < c11 && (str = f54344h[c12]) != null) {
                if (i13 < i5) {
                    c(cArr, i13, i5 - i13);
                }
                i13 = i5 + 1;
                b(0, str.length(), str);
            }
            i5++;
        }
        if (i13 < i5) {
            c(cArr, i13, i5 - i13);
        }
        return this;
    }

    @Override // org.xmlpull.v1.XmlSerializer
    public final void setOutput(Writer writer) {
        this.f54347c = writer;
    }

    @Override // org.xmlpull.v1.XmlSerializer
    public final XmlSerializer text(String str) throws IOException {
        if (this.f54351g) {
            b(0, 1, ">");
            this.f54351g = false;
        }
        d(str);
        return this;
    }
}
