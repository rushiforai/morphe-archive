package kotlinx.serialization.json.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.Metadata;
import kotlin.jvm.JvmField;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u0019\n\u0000\n\u0002\u0010\u0012\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0010\f\n\u0002\b\u0002\n\u0002\u0010\u0005\n\u0000\bÀ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\b\u0010\b\u001a\u00020\tH\u0002J\b\u0010\n\u001a\u00020\tH\u0002J\u0018\u0010\u000b\u001a\u00020\t2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000fH\u0002J\u0018\u0010\u000b\u001a\u00020\t2\u0006\u0010\f\u001a\u00020\u000f2\u0006\u0010\u000e\u001a\u00020\u000fH\u0002J\u0018\u0010\u0010\u001a\u00020\t2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u0011\u001a\u00020\u0012H\u0002J\u0018\u0010\u0010\u001a\u00020\t2\u0006\u0010\f\u001a\u00020\u000f2\u0006\u0010\u0011\u001a\u00020\u0012H\u0002R\u0010\u0010\u0004\u001a\u00020\u00058\u0006X\u0087\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u0006\u001a\u00020\u00078\u0006X\u0087\u0004¢\u0006\u0002\n\u0000¨\u0006\u0013"}, d2 = {"Lkotlinx/serialization/json/internal/CharMappings;", b.f42142b, "<init>", "()V", "ESCAPE_2_CHAR", b.f42142b, "CHAR_TO_TOKEN", b.f42142b, "initEscape", b.f42142b, "initCharToToken", "initC2ESC", "c", b.f42142b, "esc", b.f42142b, "initC2TC", "cl", b.f42142b, "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class CharMappings {

    @JvmField
    @NotNull
    public static final byte[] CHAR_TO_TOKEN;

    @JvmField
    @NotNull
    public static final char[] ESCAPE_2_CHAR;

    @NotNull
    public static final CharMappings INSTANCE;

    static {
        CharMappings charMappings = new CharMappings();
        INSTANCE = charMappings;
        ESCAPE_2_CHAR = new char[Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE];
        CHAR_TO_TOKEN = new byte[Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE];
        charMappings.initEscape();
        charMappings.initCharToToken();
    }

    private CharMappings() {
    }

    private final void initC2ESC(int c11, char esc) {
        if (esc != 'u') {
            ESCAPE_2_CHAR[esc] = (char) c11;
        }
    }

    private final void initC2TC(int c11, byte cl2) {
        CHAR_TO_TOKEN[c11] = cl2;
    }

    private final void initCharToToken() {
        for (int i5 = 0; i5 < 33; i5++) {
            initC2TC(i5, AbstractJsonLexerKt.TC_INVALID);
        }
        initC2TC(9, (byte) 3);
        initC2TC(10, (byte) 3);
        initC2TC(13, (byte) 3);
        initC2TC(32, (byte) 3);
        initC2TC(AbstractJsonLexerKt.COMMA, (byte) 4);
        initC2TC(AbstractJsonLexerKt.COLON, (byte) 5);
        initC2TC(AbstractJsonLexerKt.BEGIN_OBJ, (byte) 6);
        initC2TC(AbstractJsonLexerKt.END_OBJ, (byte) 7);
        initC2TC(AbstractJsonLexerKt.BEGIN_LIST, (byte) 8);
        initC2TC(AbstractJsonLexerKt.END_LIST, (byte) 9);
        initC2TC(AbstractJsonLexerKt.STRING, (byte) 1);
        initC2TC(AbstractJsonLexerKt.STRING_ESC, (byte) 2);
    }

    private final void initEscape() {
        for (int i5 = 0; i5 < 32; i5++) {
            initC2ESC(i5, AbstractJsonLexerKt.UNICODE_ESC);
        }
        initC2ESC(8, 'b');
        initC2ESC(9, 't');
        initC2ESC(10, 'n');
        initC2ESC(12, 'f');
        initC2ESC(13, 'r');
        initC2ESC('/', '/');
        initC2ESC(AbstractJsonLexerKt.STRING, AbstractJsonLexerKt.STRING);
        initC2ESC(AbstractJsonLexerKt.STRING_ESC, AbstractJsonLexerKt.STRING_ESC);
    }

    private final void initC2ESC(char c11, char esc) {
        initC2ESC((int) c11, esc);
    }

    private final void initC2TC(char c11, byte cl2) {
        initC2TC((int) c11, cl2);
    }
}
