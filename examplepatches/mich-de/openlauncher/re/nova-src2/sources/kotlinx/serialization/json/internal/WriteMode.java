package kotlinx.serialization.json.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.JvmField;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\f\n\u0002\b\b\b\u0080\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0019\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u0010\u0010\u0002\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u0004\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\u0002\n\u0000j\u0002\b\u0007j\u0002\b\bj\u0002\b\tj\u0002\b\n¨\u0006\u000b"}, d2 = {"Lkotlinx/serialization/json/internal/WriteMode;", b.f42142b, "begin", b.f42142b, "end", "<init>", "(Ljava/lang/String;ICC)V", "OBJ", "LIST", "MAP", "POLY_OBJ", "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class WriteMode {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ WriteMode[] $VALUES;

    @JvmField
    public final char begin;

    @JvmField
    public final char end;
    public static final WriteMode OBJ = new WriteMode("OBJ", 0, AbstractJsonLexerKt.BEGIN_OBJ, AbstractJsonLexerKt.END_OBJ);
    public static final WriteMode LIST = new WriteMode("LIST", 1, AbstractJsonLexerKt.BEGIN_LIST, AbstractJsonLexerKt.END_LIST);
    public static final WriteMode MAP = new WriteMode("MAP", 2, AbstractJsonLexerKt.BEGIN_OBJ, AbstractJsonLexerKt.END_OBJ);
    public static final WriteMode POLY_OBJ = new WriteMode("POLY_OBJ", 3, AbstractJsonLexerKt.BEGIN_LIST, AbstractJsonLexerKt.END_LIST);

    private static final /* synthetic */ WriteMode[] $values() {
        return new WriteMode[]{OBJ, LIST, MAP, POLY_OBJ};
    }

    static {
        WriteMode[] writeModeArr$values = $values();
        $VALUES = writeModeArr$values;
        $ENTRIES = EnumEntriesKt.a(writeModeArr$values);
    }

    private WriteMode(String str, int i5, char c11, char c12) {
        this.begin = c11;
        this.end = c12;
    }

    @NotNull
    public static EnumEntries<WriteMode> getEntries() {
        return $ENTRIES;
    }

    public static WriteMode valueOf(String str) {
        return (WriteMode) Enum.valueOf(WriteMode.class, str);
    }

    public static WriteMode[] values() {
        return (WriteMode[]) $VALUES.clone();
    }
}
