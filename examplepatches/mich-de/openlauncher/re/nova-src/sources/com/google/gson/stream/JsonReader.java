package com.google.gson.stream;

import a2.c;
import ads_mobile_sdk.pd;
import b.c0;
import b.u4;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.google.gson.s;
import com.google.gson.z;
import hn.j;
import in.q;
import java.io.Closeable;
import java.io.EOFException;
import java.io.IOException;
import java.io.Reader;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Map;
import java.util.Objects;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import lb0.b;

/* loaded from: classes.dex */
public class JsonReader implements Closeable {
    static final int BUFFER_SIZE = 1024;
    static final int DEFAULT_NESTING_LIMIT = 255;
    private static final long MIN_INCOMPLETE_INTEGER = -922337203685477580L;
    private static final int NUMBER_CHAR_DECIMAL = 3;
    private static final int NUMBER_CHAR_DIGIT = 2;
    private static final int NUMBER_CHAR_EXP_DIGIT = 7;
    private static final int NUMBER_CHAR_EXP_E = 5;
    private static final int NUMBER_CHAR_EXP_SIGN = 6;
    private static final int NUMBER_CHAR_FRACTION_DIGIT = 4;
    private static final int NUMBER_CHAR_NONE = 0;
    private static final int NUMBER_CHAR_SIGN = 1;
    private static final int PEEKED_BEGIN_ARRAY = 3;
    private static final int PEEKED_BEGIN_OBJECT = 1;
    private static final int PEEKED_BUFFERED = 11;
    private static final int PEEKED_DOUBLE_QUOTED = 9;
    private static final int PEEKED_DOUBLE_QUOTED_NAME = 13;
    private static final int PEEKED_END_ARRAY = 4;
    private static final int PEEKED_END_OBJECT = 2;
    private static final int PEEKED_EOF = 17;
    private static final int PEEKED_FALSE = 6;
    private static final int PEEKED_LONG = 15;
    private static final int PEEKED_NONE = 0;
    private static final int PEEKED_NULL = 7;
    private static final int PEEKED_NUMBER = 16;
    private static final int PEEKED_SINGLE_QUOTED = 8;
    private static final int PEEKED_SINGLE_QUOTED_NAME = 12;
    private static final int PEEKED_TRUE = 5;
    private static final int PEEKED_UNQUOTED = 10;
    private static final int PEEKED_UNQUOTED_NAME = 14;

    /* renamed from: in, reason: collision with root package name */
    private final Reader f34797in;
    private int[] pathIndices;
    private String[] pathNames;
    private long peekedLong;
    private int peekedNumberLength;
    private String peekedString;
    private int[] stack;
    private z strictness = z.f34801b;
    private int nestingLimit = DEFAULT_NESTING_LIMIT;
    private final char[] buffer = new char[1024];
    private int pos = 0;
    private int limit = 0;
    private int lineNumber = 0;
    private int lineStart = 0;
    int peeked = 0;
    private int stackSize = 1;

    static {
        j.INSTANCE = new j() { // from class: com.google.gson.stream.JsonReader.1
            @Override // hn.j
            public void promoteNameToValue(JsonReader jsonReader) throws IOException {
                if (jsonReader instanceof q) {
                    q qVar = (q) jsonReader;
                    qVar.a(JsonToken.NAME);
                    Map.Entry entry = (Map.Entry) ((Iterator) qVar.d()).next();
                    qVar.f(entry.getValue());
                    qVar.f(new s((String) entry.getKey()));
                    return;
                }
                int iDoPeek = jsonReader.peeked;
                if (iDoPeek == 0) {
                    iDoPeek = jsonReader.doPeek();
                }
                if (iDoPeek == 13) {
                    jsonReader.peeked = 9;
                } else if (iDoPeek == 12) {
                    jsonReader.peeked = 8;
                } else {
                    if (iDoPeek != 14) {
                        throw jsonReader.unexpectedTokenError("a name");
                    }
                    jsonReader.peeked = 10;
                }
            }
        };
    }

    public JsonReader(Reader reader) {
        int[] iArr = new int[32];
        this.stack = iArr;
        iArr[0] = 6;
        this.pathNames = new String[32];
        this.pathIndices = new int[32];
        Objects.requireNonNull(reader, "in == null");
        this.f34797in = reader;
    }

    private void checkLenient() throws MalformedJsonException {
        if (this.strictness != z.f34800a) {
            throw syntaxError("Use JsonReader.setStrictness(Strictness.LENIENT) to accept malformed JSON");
        }
    }

    private void consumeNonExecutePrefix() throws IOException {
        nextNonWhitespace(true);
        int i5 = this.pos;
        this.pos = i5 - 1;
        if (i5 + 4 <= this.limit || fillBuffer(5)) {
            int i11 = this.pos;
            char[] cArr = this.buffer;
            if (cArr[i11] == ')' && cArr[i11 + 1] == ']' && cArr[i11 + 2] == '}' && cArr[i11 + 3] == '\'' && cArr[i11 + 4] == '\n') {
                this.pos = i11 + 5;
            }
        }
    }

    private boolean fillBuffer(int i5) throws IOException {
        int i11;
        int i12;
        char[] cArr = this.buffer;
        int i13 = this.lineStart;
        int i14 = this.pos;
        this.lineStart = i13 - i14;
        int i15 = this.limit;
        if (i15 != i14) {
            int i16 = i15 - i14;
            this.limit = i16;
            System.arraycopy(cArr, i14, cArr, 0, i16);
        } else {
            this.limit = 0;
        }
        this.pos = 0;
        do {
            Reader reader = this.f34797in;
            int i17 = this.limit;
            int i18 = reader.read(cArr, i17, cArr.length - i17);
            if (i18 == -1) {
                return false;
            }
            i11 = this.limit + i18;
            this.limit = i11;
            if (this.lineNumber == 0 && (i12 = this.lineStart) == 0 && i11 > 0 && cArr[0] == 65279) {
                this.pos++;
                this.lineStart = i12 + 1;
                i5++;
            }
        } while (i11 < i5);
        return true;
    }

    private String getPath(boolean z11) {
        StringBuilder sb2 = new StringBuilder("$");
        int i5 = 0;
        while (true) {
            int i11 = this.stackSize;
            if (i5 >= i11) {
                return sb2.toString();
            }
            int i12 = this.stack[i5];
            switch (i12) {
                case 1:
                case 2:
                    int i13 = this.pathIndices[i5];
                    if (z11 && i13 > 0 && i5 == i11 - 1) {
                        i13--;
                    }
                    sb2.append(AbstractJsonLexerKt.BEGIN_LIST);
                    sb2.append(i13);
                    sb2.append(AbstractJsonLexerKt.END_LIST);
                    break;
                case 3:
                case 4:
                case 5:
                    sb2.append('.');
                    String str = this.pathNames[i5];
                    if (str == null) {
                        break;
                    } else {
                        sb2.append(str);
                        break;
                    }
                case 6:
                case 7:
                case 8:
                    break;
                default:
                    throw new AssertionError(c0.h(i12, "Unknown scope value: "));
            }
            i5++;
        }
    }

    private boolean isLiteral(char c11) throws IOException {
        if (c11 == '\t' || c11 == '\n' || c11 == '\f' || c11 == '\r' || c11 == ' ') {
            return false;
        }
        if (c11 != '#') {
            if (c11 == ',') {
                return false;
            }
            if (c11 != '/' && c11 != '=') {
                if (c11 == '{' || c11 == '}' || c11 == ':') {
                    return false;
                }
                if (c11 != ';') {
                    switch (c11) {
                        case '[':
                        case pd.O0 /* 93 */:
                            return false;
                        case pd.N0 /* 92 */:
                            break;
                        default:
                            return true;
                    }
                }
            }
        }
        checkLenient();
        return false;
    }

    /* JADX WARN: Code restructure failed: missing block: B:33:0x0073, code lost:
    
        return r5;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private int nextNonWhitespace(boolean z11) throws IOException {
        char[] cArr = this.buffer;
        int i5 = this.pos;
        int i11 = this.limit;
        while (true) {
            if (i5 == i11) {
                this.pos = i5;
                if (!fillBuffer(1)) {
                    if (!z11) {
                        return -1;
                    }
                    throw new EOFException("End of input" + locationString());
                }
                i5 = this.pos;
                i11 = this.limit;
            }
            int i12 = i5 + 1;
            char c11 = cArr[i5];
            if (c11 == '\n') {
                this.lineNumber++;
                this.lineStart = i12;
            } else if (c11 != ' ' && c11 != '\r' && c11 != '\t') {
                if (c11 == '/') {
                    this.pos = i12;
                    if (i12 == i11) {
                        this.pos = i5;
                        boolean zFillBuffer = fillBuffer(2);
                        this.pos++;
                        if (!zFillBuffer) {
                            break;
                        }
                        break;
                        break;
                    }
                    checkLenient();
                    int i13 = this.pos;
                    char c12 = cArr[i13];
                    if (c12 == '*') {
                        this.pos = i13 + 1;
                        if (!skipTo("*/")) {
                            throw syntaxError("Unterminated comment");
                        }
                        i5 = this.pos + 2;
                        i11 = this.limit;
                    } else {
                        if (c12 != '/') {
                            break;
                        }
                        this.pos = i13 + 1;
                        skipToEndOfLine();
                        i5 = this.pos;
                        i11 = this.limit;
                    }
                } else {
                    if (c11 != '#') {
                        this.pos = i12;
                        return c11;
                    }
                    this.pos = i12;
                    checkLenient();
                    skipToEndOfLine();
                    i5 = this.pos;
                    i11 = this.limit;
                }
            }
            i5 = i12;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:31:0x006c, code lost:
    
        if (r1 != null) goto L33;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x006e, code lost:
    
        r1 = new java.lang.StringBuilder(java.lang.Math.max((r2 - r3) * 2, 16));
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x007c, code lost:
    
        r1.append(r0, r3, r2 - r3);
        r10.pos = r2;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private String nextQuotedValue(char c11) throws IOException {
        char[] cArr = this.buffer;
        StringBuilder sb2 = null;
        do {
            int i5 = this.pos;
            int i11 = this.limit;
            while (true) {
                int i12 = i11;
                int i13 = i5;
                while (i5 < i12) {
                    int i14 = i5 + 1;
                    char c12 = cArr[i5];
                    if (this.strictness == z.f34802c && c12 < ' ') {
                        throw syntaxError("Unescaped control characters (\\u0000-\\u001F) are not allowed in strict mode");
                    }
                    if (c12 == c11) {
                        this.pos = i14;
                        int i15 = (i14 - i13) - 1;
                        if (sb2 == null) {
                            return new String(cArr, i13, i15);
                        }
                        sb2.append(cArr, i13, i15);
                        return sb2.toString();
                    }
                    if (c12 == '\\') {
                        this.pos = i14;
                        int i16 = i14 - i13;
                        int i17 = i16 - 1;
                        if (sb2 == null) {
                            sb2 = new StringBuilder(Math.max(i16 * 2, 16));
                        }
                        sb2.append(cArr, i13, i17);
                        sb2.append(readEscapeCharacter());
                        i5 = this.pos;
                        i11 = this.limit;
                    } else {
                        if (c12 == '\n') {
                            this.lineNumber++;
                            this.lineStart = i14;
                        }
                        i5 = i14;
                    }
                }
                break;
            }
        } while (fillBuffer(1));
        throw syntaxError("Unterminated string");
    }

    /* JADX WARN: Code restructure failed: missing block: B:34:0x004a, code lost:
    
        checkLenient();
     */
    /* JADX WARN: Failed to find 'out' block for switch in B:32:0x0044. Please report as an issue. */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0080  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x008a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private String nextUnquotedValue() throws IOException {
        String string;
        StringBuilder sb2 = null;
        int i5 = 0;
        do {
            int i11 = 0;
            while (true) {
                int i12 = this.pos;
                if (i12 + i11 < this.limit) {
                    char c11 = this.buffer[i12 + i11];
                    if (c11 != '\t' && c11 != '\n' && c11 != '\f' && c11 != '\r' && c11 != ' ') {
                        if (c11 != '#') {
                            if (c11 != ',') {
                                if (c11 != '/' && c11 != '=') {
                                    if (c11 != '{' && c11 != '}' && c11 != ':') {
                                        if (c11 != ';') {
                                            switch (c11) {
                                                case '[':
                                                case pd.O0 /* 93 */:
                                                    break;
                                                case pd.N0 /* 92 */:
                                                    break;
                                                default:
                                                    i11++;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                } else if (i11 >= this.buffer.length) {
                    if (sb2 == null) {
                        sb2 = new StringBuilder(Math.max(i11, 16));
                    }
                    sb2.append(this.buffer, this.pos, i11);
                    this.pos += i11;
                } else if (fillBuffer(i11 + 1)) {
                }
            }
            i5 = i11;
            if (sb2 != null) {
                string = new String(this.buffer, this.pos, i5);
            } else {
                sb2.append(this.buffer, this.pos, i5);
                string = sb2.toString();
            }
            this.pos += i5;
            return string;
        } while (fillBuffer(1));
        if (sb2 != null) {
        }
        this.pos += i5;
        return string;
    }

    private int peekKeyword() throws IOException {
        String str;
        String str2;
        int i5;
        char c11 = this.buffer[this.pos];
        if (c11 == 't' || c11 == 'T') {
            str = InneractiveMediationDefs.SHOW_HOUSE_AD_YES;
            str2 = "TRUE";
            i5 = 5;
        } else if (c11 == 'f' || c11 == 'F') {
            str = "false";
            str2 = "FALSE";
            i5 = 6;
        } else {
            if (c11 != 'n' && c11 != 'N') {
                return 0;
            }
            str = AbstractJsonLexerKt.NULL;
            str2 = "NULL";
            i5 = 7;
        }
        boolean z11 = this.strictness != z.f34802c;
        int length = str.length();
        for (int i11 = 0; i11 < length; i11++) {
            if (this.pos + i11 >= this.limit && !fillBuffer(i11 + 1)) {
                return 0;
            }
            char c12 = this.buffer[this.pos + i11];
            if (c12 != str.charAt(i11) && (!z11 || c12 != str2.charAt(i11))) {
                return 0;
            }
        }
        if ((this.pos + length < this.limit || fillBuffer(length + 1)) && isLiteral(this.buffer[this.pos + length])) {
            return 0;
        }
        this.pos += length;
        this.peeked = i5;
        return i5;
    }

    /* JADX WARN: Code restructure failed: missing block: B:52:0x0093, code lost:
    
        if (isLiteral(r14) != false) goto L75;
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:0x0095, code lost:
    
        if (r9 != 2) goto L66;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x0097, code lost:
    
        if (r10 == 0) goto L66;
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x009d, code lost:
    
        if (r11 != Long.MIN_VALUE) goto L58;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x009f, code lost:
    
        if (r13 == false) goto L66;
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x00a3, code lost:
    
        if (r11 != 0) goto L61;
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:0x00a5, code lost:
    
        if (r13 != false) goto L66;
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x00a7, code lost:
    
        if (r13 == false) goto L63;
     */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x00aa, code lost:
    
        r11 = -r11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x00ab, code lost:
    
        r19.peekedLong = r11;
        r19.pos += r8;
        r19.peeked = 15;
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x00b6, code lost:
    
        return 15;
     */
    /* JADX WARN: Code restructure failed: missing block: B:66:0x00b7, code lost:
    
        if (r9 == 2) goto L73;
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:0x00ba, code lost:
    
        if (r9 == 4) goto L73;
     */
    /* JADX WARN: Code restructure failed: missing block: B:70:0x00bd, code lost:
    
        if (r9 != 7) goto L72;
     */
    /* JADX WARN: Code restructure failed: missing block: B:72:0x00c0, code lost:
    
        return r18;
     */
    /* JADX WARN: Code restructure failed: missing block: B:73:0x00c1, code lost:
    
        r19.peekedNumberLength = r8;
        r19.peeked = 16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:74:0x00c7, code lost:
    
        return 16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x00c8, code lost:
    
        return r18;
     */
    /* JADX WARN: Removed duplicated region for block: B:14:0x0036  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x00e1  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private int peekNumber() throws IOException {
        char c11;
        int i5;
        char[] cArr = this.buffer;
        int i11 = this.pos;
        int i12 = this.limit;
        int i13 = 0;
        int i14 = 0;
        char c12 = 0;
        boolean z11 = false;
        int i15 = 1;
        long j11 = 0;
        while (true) {
            char c13 = 2;
            if (i11 + i14 != i12) {
                c11 = cArr[i11 + i14];
                i5 = i13;
                if (c11 == '+') {
                    if (c11 == 'E' || c11 == 'e') {
                        if (c12 != 2 && c12 != 4) {
                            return i5;
                        }
                        c12 = 5;
                    } else if (c11 == '-') {
                        c13 = 6;
                        if (c12 == 0) {
                            c12 = 1;
                            z11 = true;
                        } else if (c12 != 5) {
                            return i5;
                        }
                    } else if (c11 != '.') {
                        if (c11 < '0' || c11 > '9') {
                            break;
                        }
                        if (c12 == 1 || c12 == 0) {
                            j11 = -(c11 - '0');
                        } else if (c12 == 2) {
                            if (j11 == 0) {
                                return i5;
                            }
                            long j12 = (10 * j11) - (c11 - '0');
                            i15 &= (j11 > MIN_INCOMPLETE_INTEGER || (j11 == MIN_INCOMPLETE_INTEGER && j12 < j11)) ? 1 : i5;
                            j11 = j12;
                        } else if (c12 == 3) {
                            c12 = 4;
                        } else if (c12 == 5 || c12 == 6) {
                            c12 = 7;
                        }
                    } else {
                        if (c12 != 2) {
                            return i5;
                        }
                        c12 = 3;
                    }
                    i14++;
                    i13 = i5;
                } else {
                    c13 = 6;
                    if (c12 != 5) {
                        return i5;
                    }
                }
                c12 = c13;
                i14++;
                i13 = i5;
            } else {
                if (i14 == cArr.length) {
                    return i13;
                }
                if (!fillBuffer(i14 + 1)) {
                    i5 = i13;
                    break;
                }
                i11 = this.pos;
                i12 = this.limit;
                c11 = cArr[i11 + i14];
                i5 = i13;
                if (c11 == '+') {
                }
                c12 = c13;
                i14++;
                i13 = i5;
            }
        }
    }

    private void push(int i5) throws MalformedJsonException {
        int i11 = this.stackSize;
        if (i11 - 1 >= this.nestingLimit) {
            throw new MalformedJsonException("Nesting limit " + this.nestingLimit + " reached" + locationString());
        }
        int[] iArr = this.stack;
        if (i11 == iArr.length) {
            int i12 = i11 * 2;
            this.stack = Arrays.copyOf(iArr, i12);
            this.pathIndices = Arrays.copyOf(this.pathIndices, i12);
            this.pathNames = (String[]) Arrays.copyOf(this.pathNames, i12);
        }
        int[] iArr2 = this.stack;
        int i13 = this.stackSize;
        this.stackSize = i13 + 1;
        iArr2[i13] = i5;
    }

    private char readEscapeCharacter() throws IOException {
        int i5;
        if (this.pos == this.limit && !fillBuffer(1)) {
            throw syntaxError("Unterminated escape sequence");
        }
        char[] cArr = this.buffer;
        int i11 = this.pos;
        int i12 = i11 + 1;
        this.pos = i12;
        char c11 = cArr[i11];
        z zVar = z.f34802c;
        if (c11 != '\n') {
            if (c11 != '\"') {
                if (c11 != '\'') {
                    if (c11 != '/' && c11 != '\\') {
                        if (c11 == 'b') {
                            return '\b';
                        }
                        if (c11 == 'f') {
                            return '\f';
                        }
                        if (c11 == 'n') {
                            return '\n';
                        }
                        if (c11 == 'r') {
                            return '\r';
                        }
                        if (c11 == 't') {
                            return '\t';
                        }
                        if (c11 != 'u') {
                            throw syntaxError("Invalid escape sequence");
                        }
                        if (i11 + 5 > this.limit && !fillBuffer(4)) {
                            throw syntaxError("Unterminated escape sequence");
                        }
                        int i13 = this.pos;
                        int i14 = i13 + 4;
                        int i15 = 0;
                        while (i13 < i14) {
                            char[] cArr2 = this.buffer;
                            char c12 = cArr2[i13];
                            int i16 = i15 << 4;
                            if (c12 >= '0' && c12 <= '9') {
                                i5 = c12 - '0';
                            } else if (c12 >= 'a' && c12 <= 'f') {
                                i5 = c12 - 'W';
                            } else {
                                if (c12 < 'A' || c12 > 'F') {
                                    throw syntaxError("Malformed Unicode escape \\u".concat(new String(cArr2, this.pos, 4)));
                                }
                                i5 = c12 - '7';
                            }
                            i15 = i5 + i16;
                            i13++;
                        }
                        this.pos += 4;
                        return (char) i15;
                    }
                }
            }
            return c11;
        }
        if (this.strictness == zVar) {
            throw syntaxError("Cannot escape a newline character in strict mode");
        }
        this.lineNumber++;
        this.lineStart = i12;
        if (this.strictness == zVar) {
            throw syntaxError("Invalid escaped character \"'\" in strict mode");
        }
        return c11;
    }

    private void skipQuotedValue(char c11) throws IOException {
        char[] cArr = this.buffer;
        do {
            int i5 = this.pos;
            int i11 = this.limit;
            while (i5 < i11) {
                int i12 = i5 + 1;
                char c12 = cArr[i5];
                if (c12 == c11) {
                    this.pos = i12;
                    return;
                }
                if (c12 == '\\') {
                    this.pos = i12;
                    readEscapeCharacter();
                    i5 = this.pos;
                    i11 = this.limit;
                } else {
                    if (c12 == '\n') {
                        this.lineNumber++;
                        this.lineStart = i12;
                    }
                    i5 = i12;
                }
            }
            this.pos = i5;
        } while (fillBuffer(1));
        throw syntaxError("Unterminated string");
    }

    private boolean skipTo(String str) throws IOException {
        int length = str.length();
        while (true) {
            if (this.pos + length > this.limit && !fillBuffer(length)) {
                return false;
            }
            char[] cArr = this.buffer;
            int i5 = this.pos;
            if (cArr[i5] != '\n') {
                for (int i11 = 0; i11 < length; i11++) {
                    if (this.buffer[this.pos + i11] != str.charAt(i11)) {
                        break;
                    }
                }
                return true;
            }
            this.lineNumber++;
            this.lineStart = i5 + 1;
            this.pos++;
        }
    }

    private void skipToEndOfLine() throws IOException {
        char c11;
        do {
            if (this.pos >= this.limit && !fillBuffer(1)) {
                return;
            }
            char[] cArr = this.buffer;
            int i5 = this.pos;
            int i11 = i5 + 1;
            this.pos = i11;
            c11 = cArr[i5];
            if (c11 == '\n') {
                this.lineNumber++;
                this.lineStart = i11;
                return;
            }
        } while (c11 != '\r');
    }

    /* JADX WARN: Code restructure failed: missing block: B:33:0x0048, code lost:
    
        checkLenient();
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void skipUnquotedValue() throws IOException {
        do {
            int i5 = 0;
            while (true) {
                int i11 = this.pos;
                if (i11 + i5 < this.limit) {
                    char c11 = this.buffer[i11 + i5];
                    if (c11 != '\t' && c11 != '\n' && c11 != '\f' && c11 != '\r' && c11 != ' ') {
                        if (c11 != '#') {
                            if (c11 != ',') {
                                if (c11 != '/' && c11 != '=') {
                                    if (c11 != '{' && c11 != '}' && c11 != ':') {
                                        if (c11 != ';') {
                                            switch (c11) {
                                                case '[':
                                                case pd.O0 /* 93 */:
                                                    break;
                                                case pd.N0 /* 92 */:
                                                    break;
                                                default:
                                                    i5++;
                                            }
                                            return;
                                        }
                                    }
                                }
                            }
                        }
                    }
                } else {
                    this.pos = i11 + i5;
                }
            }
            this.pos += i5;
            return;
        } while (fillBuffer(1));
    }

    private MalformedJsonException syntaxError(String str) throws MalformedJsonException {
        StringBuilder sbQ = c.q(str);
        sbQ.append(locationString());
        sbQ.append("\nSee ");
        sbQ.append(b.s("malformed-json"));
        throw new MalformedJsonException(sbQ.toString());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public IllegalStateException unexpectedTokenError(String str) throws IOException {
        String str2 = peek() == JsonToken.NULL ? "adapter-not-null-safe" : "unexpected-json-structure";
        StringBuilder sbK = u4.k("Expected ", str, " but was ");
        sbK.append(peek());
        sbK.append(locationString());
        sbK.append("\nSee ");
        sbK.append(b.s(str2));
        return new IllegalStateException(sbK.toString());
    }

    public void beginArray() throws IOException {
        int iDoPeek = this.peeked;
        if (iDoPeek == 0) {
            iDoPeek = doPeek();
        }
        if (iDoPeek != 3) {
            throw unexpectedTokenError("BEGIN_ARRAY");
        }
        push(1);
        this.pathIndices[this.stackSize - 1] = 0;
        this.peeked = 0;
    }

    public void beginObject() throws IOException {
        int iDoPeek = this.peeked;
        if (iDoPeek == 0) {
            iDoPeek = doPeek();
        }
        if (iDoPeek != 1) {
            throw unexpectedTokenError("BEGIN_OBJECT");
        }
        push(3);
        this.peeked = 0;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.peeked = 0;
        this.stack[0] = 8;
        this.stackSize = 1;
        this.f34797in.close();
    }

    public int doPeek() throws IOException {
        int iNextNonWhitespace;
        int[] iArr = this.stack;
        int i5 = this.stackSize;
        int i11 = iArr[i5 - 1];
        if (i11 == 1) {
            iArr[i5 - 1] = 2;
        } else if (i11 == 2) {
            int iNextNonWhitespace2 = nextNonWhitespace(true);
            if (iNextNonWhitespace2 != 44) {
                if (iNextNonWhitespace2 != 59) {
                    if (iNextNonWhitespace2 != 93) {
                        throw syntaxError("Unterminated array");
                    }
                    this.peeked = 4;
                    return 4;
                }
                checkLenient();
            }
        } else {
            if (i11 == 3 || i11 == 5) {
                iArr[i5 - 1] = 4;
                if (i11 == 5 && (iNextNonWhitespace = nextNonWhitespace(true)) != 44) {
                    if (iNextNonWhitespace != 59) {
                        if (iNextNonWhitespace != 125) {
                            throw syntaxError("Unterminated object");
                        }
                        this.peeked = 2;
                        return 2;
                    }
                    checkLenient();
                }
                int iNextNonWhitespace3 = nextNonWhitespace(true);
                if (iNextNonWhitespace3 == 34) {
                    this.peeked = 13;
                    return 13;
                }
                if (iNextNonWhitespace3 == 39) {
                    checkLenient();
                    this.peeked = 12;
                    return 12;
                }
                if (iNextNonWhitespace3 == 125) {
                    if (i11 == 5) {
                        throw syntaxError("Expected name");
                    }
                    this.peeked = 2;
                    return 2;
                }
                checkLenient();
                this.pos--;
                if (!isLiteral((char) iNextNonWhitespace3)) {
                    throw syntaxError("Expected name");
                }
                this.peeked = 14;
                return 14;
            }
            if (i11 == 4) {
                iArr[i5 - 1] = 5;
                int iNextNonWhitespace4 = nextNonWhitespace(true);
                if (iNextNonWhitespace4 != 58) {
                    if (iNextNonWhitespace4 != 61) {
                        throw syntaxError("Expected ':'");
                    }
                    checkLenient();
                    if (this.pos < this.limit || fillBuffer(1)) {
                        char[] cArr = this.buffer;
                        int i12 = this.pos;
                        if (cArr[i12] == '>') {
                            this.pos = i12 + 1;
                        }
                    }
                }
            } else if (i11 == 6) {
                if (this.strictness == z.f34800a) {
                    consumeNonExecutePrefix();
                }
                this.stack[this.stackSize - 1] = 7;
            } else if (i11 == 7) {
                if (nextNonWhitespace(false) == -1) {
                    this.peeked = 17;
                    return 17;
                }
                checkLenient();
                this.pos--;
            } else if (i11 == 8) {
                throw new IllegalStateException("JsonReader is closed");
            }
        }
        int iNextNonWhitespace5 = nextNonWhitespace(true);
        if (iNextNonWhitespace5 == 34) {
            this.peeked = 9;
            return 9;
        }
        if (iNextNonWhitespace5 == 39) {
            checkLenient();
            this.peeked = 8;
            return 8;
        }
        if (iNextNonWhitespace5 != 44 && iNextNonWhitespace5 != 59) {
            if (iNextNonWhitespace5 == 91) {
                this.peeked = 3;
                return 3;
            }
            if (iNextNonWhitespace5 != 93) {
                if (iNextNonWhitespace5 == 123) {
                    this.peeked = 1;
                    return 1;
                }
                this.pos--;
                int iPeekKeyword = peekKeyword();
                if (iPeekKeyword != 0) {
                    return iPeekKeyword;
                }
                int iPeekNumber = peekNumber();
                if (iPeekNumber != 0) {
                    return iPeekNumber;
                }
                if (!isLiteral(this.buffer[this.pos])) {
                    throw syntaxError("Expected value");
                }
                checkLenient();
                this.peeked = 10;
                return 10;
            }
            if (i11 == 1) {
                this.peeked = 4;
                return 4;
            }
        }
        if (i11 != 1 && i11 != 2) {
            throw syntaxError("Unexpected value");
        }
        checkLenient();
        this.pos--;
        this.peeked = 7;
        return 7;
    }

    public void endArray() throws IOException {
        int iDoPeek = this.peeked;
        if (iDoPeek == 0) {
            iDoPeek = doPeek();
        }
        if (iDoPeek != 4) {
            throw unexpectedTokenError("END_ARRAY");
        }
        int i5 = this.stackSize;
        this.stackSize = i5 - 1;
        int[] iArr = this.pathIndices;
        int i11 = i5 - 2;
        iArr[i11] = iArr[i11] + 1;
        this.peeked = 0;
    }

    public void endObject() throws IOException {
        int iDoPeek = this.peeked;
        if (iDoPeek == 0) {
            iDoPeek = doPeek();
        }
        if (iDoPeek != 2) {
            throw unexpectedTokenError("END_OBJECT");
        }
        int i5 = this.stackSize;
        int i11 = i5 - 1;
        this.stackSize = i11;
        this.pathNames[i11] = null;
        int[] iArr = this.pathIndices;
        int i12 = i5 - 2;
        iArr[i12] = iArr[i12] + 1;
        this.peeked = 0;
    }

    public final int getNestingLimit() {
        return this.nestingLimit;
    }

    public String getPreviousPath() {
        return getPath(true);
    }

    public final z getStrictness() {
        return this.strictness;
    }

    public boolean hasNext() throws IOException {
        int iDoPeek = this.peeked;
        if (iDoPeek == 0) {
            iDoPeek = doPeek();
        }
        return (iDoPeek == 2 || iDoPeek == 4 || iDoPeek == 17) ? false : true;
    }

    public final boolean isLenient() {
        return this.strictness == z.f34800a;
    }

    public String locationString() {
        StringBuilder sbT = c0.t(this.lineNumber + 1, " at line ", " column ", (this.pos - this.lineStart) + 1, " path ");
        sbT.append(getPath());
        return sbT.toString();
    }

    public boolean nextBoolean() throws IOException {
        int iDoPeek = this.peeked;
        if (iDoPeek == 0) {
            iDoPeek = doPeek();
        }
        if (iDoPeek == 5) {
            this.peeked = 0;
            int[] iArr = this.pathIndices;
            int i5 = this.stackSize - 1;
            iArr[i5] = iArr[i5] + 1;
            return true;
        }
        if (iDoPeek != 6) {
            throw unexpectedTokenError("a boolean");
        }
        this.peeked = 0;
        int[] iArr2 = this.pathIndices;
        int i11 = this.stackSize - 1;
        iArr2[i11] = iArr2[i11] + 1;
        return false;
    }

    public double nextDouble() throws IOException, NumberFormatException {
        int iDoPeek = this.peeked;
        if (iDoPeek == 0) {
            iDoPeek = doPeek();
        }
        if (iDoPeek == 15) {
            this.peeked = 0;
            int[] iArr = this.pathIndices;
            int i5 = this.stackSize - 1;
            iArr[i5] = iArr[i5] + 1;
            return this.peekedLong;
        }
        if (iDoPeek == 16) {
            this.peekedString = new String(this.buffer, this.pos, this.peekedNumberLength);
            this.pos += this.peekedNumberLength;
        } else if (iDoPeek == 8 || iDoPeek == 9) {
            this.peekedString = nextQuotedValue(iDoPeek == 8 ? '\'' : AbstractJsonLexerKt.STRING);
        } else if (iDoPeek == 10) {
            this.peekedString = nextUnquotedValue();
        } else if (iDoPeek != 11) {
            throw unexpectedTokenError("a double");
        }
        this.peeked = 11;
        double d5 = Double.parseDouble(this.peekedString);
        if (this.strictness != z.f34800a && (Double.isNaN(d5) || Double.isInfinite(d5))) {
            throw syntaxError("JSON forbids NaN and infinities: " + d5);
        }
        this.peekedString = null;
        this.peeked = 0;
        int[] iArr2 = this.pathIndices;
        int i11 = this.stackSize - 1;
        iArr2[i11] = iArr2[i11] + 1;
        return d5;
    }

    public int nextInt() throws IOException, NumberFormatException {
        int iDoPeek = this.peeked;
        if (iDoPeek == 0) {
            iDoPeek = doPeek();
        }
        if (iDoPeek == 15) {
            long j11 = this.peekedLong;
            int i5 = (int) j11;
            if (j11 != i5) {
                throw new NumberFormatException("Expected an int but was " + this.peekedLong + locationString());
            }
            this.peeked = 0;
            int[] iArr = this.pathIndices;
            int i11 = this.stackSize - 1;
            iArr[i11] = iArr[i11] + 1;
            return i5;
        }
        if (iDoPeek == 16) {
            this.peekedString = new String(this.buffer, this.pos, this.peekedNumberLength);
            this.pos += this.peekedNumberLength;
        } else {
            if (iDoPeek != 8 && iDoPeek != 9 && iDoPeek != 10) {
                throw unexpectedTokenError("an int");
            }
            if (iDoPeek == 10) {
                this.peekedString = nextUnquotedValue();
            } else {
                this.peekedString = nextQuotedValue(iDoPeek == 8 ? '\'' : AbstractJsonLexerKt.STRING);
            }
            try {
                int i12 = Integer.parseInt(this.peekedString);
                this.peeked = 0;
                int[] iArr2 = this.pathIndices;
                int i13 = this.stackSize - 1;
                iArr2[i13] = iArr2[i13] + 1;
                return i12;
            } catch (NumberFormatException unused) {
            }
        }
        this.peeked = 11;
        double d5 = Double.parseDouble(this.peekedString);
        int i14 = (int) d5;
        if (i14 != d5) {
            throw new NumberFormatException("Expected an int but was " + this.peekedString + locationString());
        }
        this.peekedString = null;
        this.peeked = 0;
        int[] iArr3 = this.pathIndices;
        int i15 = this.stackSize - 1;
        iArr3[i15] = iArr3[i15] + 1;
        return i14;
    }

    public long nextLong() throws IOException, NumberFormatException {
        int iDoPeek = this.peeked;
        if (iDoPeek == 0) {
            iDoPeek = doPeek();
        }
        if (iDoPeek == 15) {
            this.peeked = 0;
            int[] iArr = this.pathIndices;
            int i5 = this.stackSize - 1;
            iArr[i5] = iArr[i5] + 1;
            return this.peekedLong;
        }
        if (iDoPeek == 16) {
            this.peekedString = new String(this.buffer, this.pos, this.peekedNumberLength);
            this.pos += this.peekedNumberLength;
        } else {
            if (iDoPeek != 8 && iDoPeek != 9 && iDoPeek != 10) {
                throw unexpectedTokenError("a long");
            }
            if (iDoPeek == 10) {
                this.peekedString = nextUnquotedValue();
            } else {
                this.peekedString = nextQuotedValue(iDoPeek == 8 ? '\'' : AbstractJsonLexerKt.STRING);
            }
            try {
                long j11 = Long.parseLong(this.peekedString);
                this.peeked = 0;
                int[] iArr2 = this.pathIndices;
                int i11 = this.stackSize - 1;
                iArr2[i11] = iArr2[i11] + 1;
                return j11;
            } catch (NumberFormatException unused) {
            }
        }
        this.peeked = 11;
        double d5 = Double.parseDouble(this.peekedString);
        long j12 = (long) d5;
        if (j12 != d5) {
            throw new NumberFormatException("Expected a long but was " + this.peekedString + locationString());
        }
        this.peekedString = null;
        this.peeked = 0;
        int[] iArr3 = this.pathIndices;
        int i12 = this.stackSize - 1;
        iArr3[i12] = iArr3[i12] + 1;
        return j12;
    }

    public String nextName() throws IOException {
        String strNextQuotedValue;
        int iDoPeek = this.peeked;
        if (iDoPeek == 0) {
            iDoPeek = doPeek();
        }
        if (iDoPeek == 14) {
            strNextQuotedValue = nextUnquotedValue();
        } else if (iDoPeek == 12) {
            strNextQuotedValue = nextQuotedValue('\'');
        } else {
            if (iDoPeek != 13) {
                throw unexpectedTokenError("a name");
            }
            strNextQuotedValue = nextQuotedValue(AbstractJsonLexerKt.STRING);
        }
        this.peeked = 0;
        this.pathNames[this.stackSize - 1] = strNextQuotedValue;
        return strNextQuotedValue;
    }

    public void nextNull() throws IOException {
        int iDoPeek = this.peeked;
        if (iDoPeek == 0) {
            iDoPeek = doPeek();
        }
        if (iDoPeek != 7) {
            throw unexpectedTokenError(AbstractJsonLexerKt.NULL);
        }
        this.peeked = 0;
        int[] iArr = this.pathIndices;
        int i5 = this.stackSize - 1;
        iArr[i5] = iArr[i5] + 1;
    }

    public String nextString() throws IOException {
        String str;
        int iDoPeek = this.peeked;
        if (iDoPeek == 0) {
            iDoPeek = doPeek();
        }
        if (iDoPeek == 10) {
            str = nextUnquotedValue();
        } else if (iDoPeek == 8) {
            str = nextQuotedValue('\'');
        } else if (iDoPeek == 9) {
            str = nextQuotedValue(AbstractJsonLexerKt.STRING);
        } else if (iDoPeek == 11) {
            str = this.peekedString;
            this.peekedString = null;
        } else if (iDoPeek == 15) {
            str = Long.toString(this.peekedLong);
        } else {
            if (iDoPeek != 16) {
                throw unexpectedTokenError("a string");
            }
            str = new String(this.buffer, this.pos, this.peekedNumberLength);
            this.pos += this.peekedNumberLength;
        }
        this.peeked = 0;
        int[] iArr = this.pathIndices;
        int i5 = this.stackSize - 1;
        iArr[i5] = iArr[i5] + 1;
        return str;
    }

    public JsonToken peek() throws IOException {
        int iDoPeek = this.peeked;
        if (iDoPeek == 0) {
            iDoPeek = doPeek();
        }
        switch (iDoPeek) {
            case 1:
                return JsonToken.BEGIN_OBJECT;
            case 2:
                return JsonToken.END_OBJECT;
            case 3:
                return JsonToken.BEGIN_ARRAY;
            case 4:
                return JsonToken.END_ARRAY;
            case 5:
            case 6:
                return JsonToken.BOOLEAN;
            case 7:
                return JsonToken.NULL;
            case 8:
            case 9:
            case 10:
            case 11:
                return JsonToken.STRING;
            case 12:
            case 13:
            case 14:
                return JsonToken.NAME;
            case 15:
            case 16:
                return JsonToken.NUMBER;
            case 17:
                return JsonToken.END_DOCUMENT;
            default:
                throw new AssertionError();
        }
    }

    @Deprecated
    public final void setLenient(boolean z11) {
        setStrictness(z11 ? z.f34800a : z.f34801b);
    }

    public final void setNestingLimit(int i5) {
        if (i5 < 0) {
            throw new IllegalArgumentException(c0.h(i5, "Invalid nesting limit: "));
        }
        this.nestingLimit = i5;
    }

    public final void setStrictness(z zVar) {
        Objects.requireNonNull(zVar);
        this.strictness = zVar;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public void skipValue() throws IOException {
        int i5 = 0;
        do {
            int iDoPeek = this.peeked;
            if (iDoPeek == 0) {
                iDoPeek = doPeek();
            }
            switch (iDoPeek) {
                case 1:
                    push(3);
                    i5++;
                    this.peeked = 0;
                    break;
                case 2:
                    if (i5 == 0) {
                        this.pathNames[this.stackSize - 1] = null;
                    }
                    this.stackSize--;
                    i5--;
                    this.peeked = 0;
                    break;
                case 3:
                    push(1);
                    i5++;
                    this.peeked = 0;
                    break;
                case 4:
                    this.stackSize--;
                    i5--;
                    this.peeked = 0;
                    break;
                case 5:
                case 6:
                case 7:
                case 11:
                case 15:
                default:
                    this.peeked = 0;
                    break;
                case 8:
                    skipQuotedValue('\'');
                    this.peeked = 0;
                    break;
                case 9:
                    skipQuotedValue(AbstractJsonLexerKt.STRING);
                    this.peeked = 0;
                    break;
                case 10:
                    skipUnquotedValue();
                    this.peeked = 0;
                    break;
                case 12:
                    skipQuotedValue('\'');
                    if (i5 == 0) {
                        this.pathNames[this.stackSize - 1] = "<skipped>";
                    }
                    this.peeked = 0;
                    break;
                case 13:
                    skipQuotedValue(AbstractJsonLexerKt.STRING);
                    if (i5 == 0) {
                        this.pathNames[this.stackSize - 1] = "<skipped>";
                    }
                    this.peeked = 0;
                    break;
                case 14:
                    skipUnquotedValue();
                    if (i5 == 0) {
                        this.pathNames[this.stackSize - 1] = "<skipped>";
                    }
                    this.peeked = 0;
                    break;
                case 16:
                    this.pos += this.peekedNumberLength;
                    this.peeked = 0;
                    break;
                case 17:
                    break;
            }
            return;
        } while (i5 > 0);
        int[] iArr = this.pathIndices;
        int i11 = this.stackSize - 1;
        iArr[i11] = iArr[i11] + 1;
    }

    public String toString() {
        return getClass().getSimpleName() + locationString();
    }

    public String getPath() {
        return getPath(false);
    }
}
