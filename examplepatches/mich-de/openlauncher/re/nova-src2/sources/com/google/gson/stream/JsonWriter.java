package com.google.gson.stream;

import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.google.gson.j;
import com.google.gson.z;
import java.io.Closeable;
import java.io.Flushable;
import java.io.IOException;
import java.io.Writer;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Arrays;
import java.util.Objects;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.regex.Pattern;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public class JsonWriter implements Closeable, Flushable {
    private static final String[] HTML_SAFE_REPLACEMENT_CHARS;
    private String deferredName;
    private String formattedColon;
    private String formattedComma;
    private j formattingStyle;
    private boolean htmlSafe;
    private final Writer out;
    private boolean serializeNulls;
    private int[] stack = new int[32];
    private int stackSize = 0;
    private z strictness;
    private boolean usesEmptyNewlineAndIndent;
    private static final Pattern VALID_JSON_NUMBER_PATTERN = Pattern.compile("-?(?:0|[1-9][0-9]*)(?:\\.[0-9]+)?(?:[eE][-+]?[0-9]+)?");
    private static final String[] REPLACEMENT_CHARS = new String[128];

    static {
        for (int i5 = 0; i5 <= 31; i5++) {
            REPLACEMENT_CHARS[i5] = String.format("\\u%04x", Integer.valueOf(i5));
        }
        String[] strArr = REPLACEMENT_CHARS;
        strArr[34] = "\\\"";
        strArr[92] = "\\\\";
        strArr[9] = "\\t";
        strArr[8] = "\\b";
        strArr[10] = "\\n";
        strArr[13] = "\\r";
        strArr[12] = "\\f";
        String[] strArr2 = (String[]) strArr.clone();
        HTML_SAFE_REPLACEMENT_CHARS = strArr2;
        strArr2[60] = "\\u003c";
        strArr2[62] = "\\u003e";
        strArr2[38] = "\\u0026";
        strArr2[61] = "\\u003d";
        strArr2[39] = "\\u0027";
    }

    public JsonWriter(Writer writer) {
        push(6);
        this.strictness = z.f34801b;
        this.serializeNulls = true;
        Objects.requireNonNull(writer, "out == null");
        this.out = writer;
        setFormattingStyle(j.f34785d);
    }

    private static boolean alwaysCreatesValidJsonNumber(Class<? extends Number> cls) {
        return cls == Integer.class || cls == Long.class || cls == Byte.class || cls == Short.class || cls == BigDecimal.class || cls == BigInteger.class || cls == AtomicInteger.class || cls == AtomicLong.class;
    }

    private void beforeName() throws IOException {
        int iPeek = peek();
        if (iPeek == 5) {
            this.out.write(this.formattedComma);
        } else if (iPeek != 3) {
            throw new IllegalStateException("Nesting problem.");
        }
        newline();
        replaceTop(4);
    }

    private void beforeValue() throws IOException {
        int iPeek = peek();
        if (iPeek == 1) {
            replaceTop(2);
            newline();
            return;
        }
        if (iPeek == 2) {
            this.out.append((CharSequence) this.formattedComma);
            newline();
        } else {
            if (iPeek == 4) {
                this.out.append((CharSequence) this.formattedColon);
                replaceTop(5);
                return;
            }
            if (iPeek != 6) {
                if (iPeek != 7) {
                    throw new IllegalStateException("Nesting problem.");
                }
                if (this.strictness != z.f34800a) {
                    throw new IllegalStateException("JSON must have only one top-level value.");
                }
            }
            replaceTop(7);
        }
    }

    private JsonWriter closeScope(int i5, int i11, char c11) throws IOException {
        int iPeek = peek();
        if (iPeek != i11 && iPeek != i5) {
            throw new IllegalStateException("Nesting problem.");
        }
        if (this.deferredName != null) {
            throw new IllegalStateException("Dangling name: " + this.deferredName);
        }
        this.stackSize--;
        if (iPeek == i11) {
            newline();
        }
        this.out.write(c11);
        return this;
    }

    private void newline() throws IOException {
        if (this.usesEmptyNewlineAndIndent) {
            return;
        }
        this.out.write(this.formattingStyle.f34787a);
        int i5 = this.stackSize;
        for (int i11 = 1; i11 < i5; i11++) {
            this.out.write(this.formattingStyle.f34788b);
        }
    }

    private JsonWriter openScope(int i5, char c11) throws IOException {
        beforeValue();
        push(i5);
        this.out.write(c11);
        return this;
    }

    private int peek() {
        int i5 = this.stackSize;
        if (i5 != 0) {
            return this.stack[i5 - 1];
        }
        throw new IllegalStateException("JsonWriter is closed.");
    }

    private void push(int i5) {
        int i11 = this.stackSize;
        int[] iArr = this.stack;
        if (i11 == iArr.length) {
            this.stack = Arrays.copyOf(iArr, i11 * 2);
        }
        int[] iArr2 = this.stack;
        int i12 = this.stackSize;
        this.stackSize = i12 + 1;
        iArr2[i12] = i5;
    }

    private void replaceTop(int i5) {
        this.stack[this.stackSize - 1] = i5;
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0034  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void string(String str) throws IOException {
        String str2;
        String[] strArr = this.htmlSafe ? HTML_SAFE_REPLACEMENT_CHARS : REPLACEMENT_CHARS;
        this.out.write(34);
        int length = str.length();
        int i5 = 0;
        for (int i11 = 0; i11 < length; i11++) {
            char cCharAt = str.charAt(i11);
            if (cCharAt < 128) {
                str2 = strArr[cCharAt];
                if (str2 != null) {
                    if (i5 < i11) {
                        this.out.write(str, i5, i11 - i5);
                    }
                    this.out.write(str2);
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
                this.out.write(str2);
                i5 = i11 + 1;
            }
        }
        if (i5 < length) {
            this.out.write(str, i5, length - i5);
        }
        this.out.write(34);
    }

    private void writeDeferredName() throws IOException {
        if (this.deferredName != null) {
            beforeName();
            string(this.deferredName);
            this.deferredName = null;
        }
    }

    public JsonWriter beginArray() throws IOException {
        writeDeferredName();
        return openScope(1, AbstractJsonLexerKt.BEGIN_LIST);
    }

    public JsonWriter beginObject() throws IOException {
        writeDeferredName();
        return openScope(3, AbstractJsonLexerKt.BEGIN_OBJ);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.out.close();
        int i5 = this.stackSize;
        if (i5 > 1 || (i5 == 1 && this.stack[i5 - 1] != 7)) {
            throw new IOException("Incomplete document");
        }
        this.stackSize = 0;
    }

    public JsonWriter endArray() throws IOException {
        return closeScope(1, 2, AbstractJsonLexerKt.END_LIST);
    }

    public JsonWriter endObject() throws IOException {
        return closeScope(3, 5, AbstractJsonLexerKt.END_OBJ);
    }

    @Override // java.io.Flushable
    public void flush() throws IOException {
        if (this.stackSize == 0) {
            throw new IllegalStateException("JsonWriter is closed.");
        }
        this.out.flush();
    }

    public final j getFormattingStyle() {
        return this.formattingStyle;
    }

    public final boolean getSerializeNulls() {
        return this.serializeNulls;
    }

    public final z getStrictness() {
        return this.strictness;
    }

    public final boolean isHtmlSafe() {
        return this.htmlSafe;
    }

    public boolean isLenient() {
        return this.strictness == z.f34800a;
    }

    public JsonWriter jsonValue(String str) throws IOException {
        if (str == null) {
            return nullValue();
        }
        writeDeferredName();
        beforeValue();
        this.out.append((CharSequence) str);
        return this;
    }

    public JsonWriter name(String str) throws IOException {
        Objects.requireNonNull(str, "name == null");
        if (this.deferredName != null) {
            throw new IllegalStateException("Already wrote a name, expecting a value.");
        }
        int iPeek = peek();
        if (iPeek != 3 && iPeek != 5) {
            throw new IllegalStateException("Please begin an object before writing a name.");
        }
        this.deferredName = str;
        return this;
    }

    public JsonWriter nullValue() throws IOException {
        if (this.deferredName != null) {
            if (!this.serializeNulls) {
                this.deferredName = null;
                return this;
            }
            writeDeferredName();
        }
        beforeValue();
        this.out.write(AbstractJsonLexerKt.NULL);
        return this;
    }

    public final void setFormattingStyle(j jVar) {
        Objects.requireNonNull(jVar);
        this.formattingStyle = jVar;
        this.formattedComma = ",";
        if (jVar.f34789c) {
            this.formattedColon = ": ";
            if (jVar.f34787a.isEmpty()) {
                this.formattedComma = ", ";
            }
        } else {
            this.formattedColon = ":";
        }
        this.usesEmptyNewlineAndIndent = this.formattingStyle.f34787a.isEmpty() && this.formattingStyle.f34788b.isEmpty();
    }

    public final void setHtmlSafe(boolean z11) {
        this.htmlSafe = z11;
    }

    public final void setIndent(String str) {
        if (str.isEmpty()) {
            setFormattingStyle(j.f34785d);
        } else {
            j jVar = j.f34786e;
            setFormattingStyle(new j(jVar.f34787a, str, jVar.f34789c));
        }
    }

    @Deprecated
    public final void setLenient(boolean z11) {
        setStrictness(z11 ? z.f34800a : z.f34801b);
    }

    public final void setSerializeNulls(boolean z11) {
        this.serializeNulls = z11;
    }

    public final void setStrictness(z zVar) {
        Objects.requireNonNull(zVar);
        this.strictness = zVar;
    }

    public JsonWriter value(String str) throws IOException {
        if (str == null) {
            return nullValue();
        }
        writeDeferredName();
        beforeValue();
        string(str);
        return this;
    }

    public JsonWriter value(boolean z11) throws IOException {
        writeDeferredName();
        beforeValue();
        this.out.write(z11 ? InneractiveMediationDefs.SHOW_HOUSE_AD_YES : "false");
        return this;
    }

    public JsonWriter value(Boolean bool) throws IOException {
        if (bool == null) {
            return nullValue();
        }
        writeDeferredName();
        beforeValue();
        this.out.write(bool.booleanValue() ? InneractiveMediationDefs.SHOW_HOUSE_AD_YES : "false");
        return this;
    }

    public JsonWriter value(float f11) throws IOException {
        writeDeferredName();
        if (this.strictness != z.f34800a && (Float.isNaN(f11) || Float.isInfinite(f11))) {
            throw new IllegalArgumentException("Numeric values must be finite, but was " + f11);
        }
        beforeValue();
        this.out.append((CharSequence) Float.toString(f11));
        return this;
    }

    public JsonWriter value(double d5) throws IOException {
        writeDeferredName();
        if (this.strictness != z.f34800a && (Double.isNaN(d5) || Double.isInfinite(d5))) {
            throw new IllegalArgumentException("Numeric values must be finite, but was " + d5);
        }
        beforeValue();
        this.out.append((CharSequence) Double.toString(d5));
        return this;
    }

    public JsonWriter value(long j11) throws IOException {
        writeDeferredName();
        beforeValue();
        this.out.write(Long.toString(j11));
        return this;
    }

    public JsonWriter value(Number number) throws IOException {
        if (number == null) {
            return nullValue();
        }
        writeDeferredName();
        String string = number.toString();
        Class<?> cls = number.getClass();
        if (!alwaysCreatesValidJsonNumber(cls)) {
            if (!string.equals("-Infinity") && !string.equals("Infinity") && !string.equals("NaN")) {
                if (cls != Float.class && cls != Double.class && !VALID_JSON_NUMBER_PATTERN.matcher(string).matches()) {
                    throw new IllegalArgumentException("String created by " + cls + " is not a valid JSON number: " + string);
                }
            } else if (this.strictness != z.f34800a) {
                throw new IllegalArgumentException("Numeric values must be finite, but was ".concat(string));
            }
        }
        beforeValue();
        this.out.append((CharSequence) string);
        return this;
    }
}
