package kotlinx.serialization.json.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@JsonFriendModuleApi
@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\f\n\u0002\b\u0003\n\u0002\u0010\u0019\n\u0002\b\u0003\b'\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\b\u0010\u0004\u001a\u00020\u0005H&J\b\u0010\u0006\u001a\u00020\u0007H&J\u001e\u0010\u000b\u001a\u00020\u00072\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u00072\u0006\u0010\u000f\u001a\u00020\u0007R\u0012\u0010\b\u001a\u0004\u0018\u00010\tX\u0082\u000e¢\u0006\u0004\n\u0002\u0010\n¨\u0006\u0010"}, d2 = {"Lkotlinx/serialization/json/internal/InternalJsonReaderCodePointImpl;", "Lkotlinx/serialization/json/internal/InternalJsonReader;", "<init>", "()V", "exhausted", b.f42142b, "nextCodePoint", b.f42142b, "bufferedChar", b.f42142b, "Ljava/lang/Character;", "read", "buffer", b.f42142b, "bufferOffset", "count", "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes5.dex */
public abstract class InternalJsonReaderCodePointImpl implements InternalJsonReader {

    @Nullable
    private Character bufferedChar;

    public abstract boolean exhausted();

    public abstract int nextCodePoint();

    @Override // kotlinx.serialization.json.internal.InternalJsonReader
    public final int read(@NotNull char[] buffer, int bufferOffset, int count) {
        int i5;
        Intrinsics.g(buffer, "buffer");
        Character ch = this.bufferedChar;
        if (ch != null) {
            Intrinsics.d(ch);
            buffer[bufferOffset] = ch.charValue();
            this.bufferedChar = null;
            i5 = 1;
        } else {
            i5 = 0;
        }
        while (i5 < count && !exhausted()) {
            int iNextCodePoint = nextCodePoint();
            if (iNextCodePoint <= 65535) {
                buffer[bufferOffset + i5] = (char) iNextCodePoint;
                i5++;
            } else {
                char c11 = (char) ((iNextCodePoint >>> 10) + 55232);
                char c12 = (char) ((iNextCodePoint & 1023) + 56320);
                buffer[bufferOffset + i5] = c11;
                int i11 = i5 + 1;
                if (i11 < count) {
                    buffer[i11 + bufferOffset] = c12;
                    i5 += 2;
                } else {
                    this.bufferedChar = Character.valueOf(c12);
                    i5 = i11;
                }
            }
        }
        if (i5 > 0) {
            return i5;
        }
        return -1;
    }
}
