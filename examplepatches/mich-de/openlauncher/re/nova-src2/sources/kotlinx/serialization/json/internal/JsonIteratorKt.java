package kotlinx.serialization.json.internal;

import b.c0;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Iterator;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.DeserializationStrategy;
import kotlinx.serialization.json.DecodeSequenceMode;
import kotlinx.serialization.json.Json;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u00000\n\u0000\n\u0002\u0010(\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\u001a:\u0010\u0000\u001a\b\u0012\u0004\u0012\u0002H\u00020\u0001\"\u0004\b\u0000\u0010\u00022\u0006\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\b2\f\u0010\t\u001a\b\u0012\u0004\u0012\u0002H\u00020\nH\u0000\u001a\u0014\u0010\u000b\u001a\u00020\u0004*\u00020\f2\u0006\u0010\r\u001a\u00020\u0004H\u0002\u001a\f\u0010\u000e\u001a\u00020\u000f*\u00020\fH\u0002¨\u0006\u0010"}, d2 = {"JsonIterator", b.f42142b, "T", "mode", "Lkotlinx/serialization/json/DecodeSequenceMode;", "json", "Lkotlinx/serialization/json/Json;", "lexer", "Lkotlinx/serialization/json/internal/ReaderJsonLexer;", "deserializer", "Lkotlinx/serialization/DeserializationStrategy;", "determineFormat", "Lkotlinx/serialization/json/internal/AbstractJsonLexer;", "suggested", "tryConsumeStartArray", b.f42142b, "kotlinx-serialization-json"}, k = 2, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes5.dex */
public final class JsonIteratorKt {

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[DecodeSequenceMode.values().length];
            try {
                iArr[DecodeSequenceMode.WHITESPACE_SEPARATED.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                iArr[DecodeSequenceMode.ARRAY_WRAPPED.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                iArr[DecodeSequenceMode.AUTO_DETECT.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            $EnumSwitchMapping$0 = iArr;
        }
    }

    @NotNull
    public static final <T> Iterator<T> JsonIterator(@NotNull DecodeSequenceMode mode, @NotNull Json json, @NotNull ReaderJsonLexer lexer, @NotNull DeserializationStrategy<? extends T> deserializer) {
        Intrinsics.g(mode, "mode");
        Intrinsics.g(json, "json");
        Intrinsics.g(lexer, "lexer");
        Intrinsics.g(deserializer, "deserializer");
        int i5 = WhenMappings.$EnumSwitchMapping$0[determineFormat(lexer, mode).ordinal()];
        if (i5 == 1) {
            return new JsonIteratorWsSeparated(json, lexer, deserializer);
        }
        if (i5 == 2) {
            return new JsonIteratorArrayWrapped(json, lexer, deserializer);
        }
        if (i5 != 3) {
            throw new NoWhenBranchMatchedException();
        }
        throw new IllegalStateException("AbstractJsonLexer.determineFormat must be called beforehand.");
    }

    private static final DecodeSequenceMode determineFormat(AbstractJsonLexer abstractJsonLexer, DecodeSequenceMode decodeSequenceMode) {
        int i5 = WhenMappings.$EnumSwitchMapping$0[decodeSequenceMode.ordinal()];
        if (i5 == 1) {
            return DecodeSequenceMode.WHITESPACE_SEPARATED;
        }
        if (i5 != 2) {
            if (i5 == 3) {
                return tryConsumeStartArray(abstractJsonLexer) ? DecodeSequenceMode.ARRAY_WRAPPED : DecodeSequenceMode.WHITESPACE_SEPARATED;
            }
            throw new NoWhenBranchMatchedException();
        }
        if (tryConsumeStartArray(abstractJsonLexer)) {
            return DecodeSequenceMode.ARRAY_WRAPPED;
        }
        String str = AbstractJsonLexerKt.tokenDescription((byte) 8);
        int i11 = abstractJsonLexer.currentPosition;
        int i12 = i11 - 1;
        AbstractJsonLexer.fail$default(abstractJsonLexer, c0.n("Expected ", str, ", but had '", (i11 == abstractJsonLexer.getSource().length() || i12 < 0) ? "EOF" : String.valueOf(abstractJsonLexer.getSource().charAt(i12)), "' instead"), i12, null, 4, null);
        throw new KotlinNothingValueException();
    }

    private static final boolean tryConsumeStartArray(AbstractJsonLexer abstractJsonLexer) {
        if (abstractJsonLexer.peekNextToken() != 8) {
            return false;
        }
        abstractJsonLexer.consumeNextToken((byte) 8);
        return true;
    }
}
