package kotlinx.serialization.json.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.UByte;
import kotlin.UInt;
import kotlin.ULong;
import kotlin.UShort;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\b\n\u0002\u0010\t\n\u0002\u0010\u0005\n\u0002\u0010\n\n\u0000\b\u0001\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\u0010\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bH\u0016J\u0010\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\fH\u0016J\u0010\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\rH\u0016J\u0010\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000eH\u0016R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u000f"}, d2 = {"Lkotlinx/serialization/json/internal/ComposerForUnsignedNumbers;", "Lkotlinx/serialization/json/internal/Composer;", "writer", "Lkotlinx/serialization/json/internal/InternalJsonWriter;", "forceQuoting", b.f42142b, "<init>", "(Lkotlinx/serialization/json/internal/InternalJsonWriter;Z)V", "print", b.f42142b, "v", b.f42142b, b.f42142b, b.f42142b, b.f42142b, "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SuppressAnimalSniffer
/* loaded from: classes5.dex */
public final class ComposerForUnsignedNumbers extends Composer {
    private final boolean forceQuoting;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ComposerForUnsignedNumbers(@NotNull InternalJsonWriter writer, boolean z11) {
        super(writer);
        Intrinsics.g(writer, "writer");
        this.forceQuoting = z11;
    }

    @Override // kotlinx.serialization.json.internal.Composer
    public void print(int v11) {
        if (this.forceQuoting) {
            UInt.Companion companion = UInt.f71696b;
            printQuoted(Integer.toUnsignedString(v11));
        } else {
            UInt.Companion companion2 = UInt.f71696b;
            print(Integer.toUnsignedString(v11));
        }
    }

    @Override // kotlinx.serialization.json.internal.Composer
    public void print(long v11) {
        if (this.forceQuoting) {
            ULong.Companion companion = ULong.f71699b;
            printQuoted(Long.toUnsignedString(v11));
        } else {
            ULong.Companion companion2 = ULong.f71699b;
            print(Long.toUnsignedString(v11));
        }
    }

    @Override // kotlinx.serialization.json.internal.Composer
    public void print(byte v11) {
        if (this.forceQuoting) {
            UByte.Companion companion = UByte.f71693b;
            printQuoted(String.valueOf(v11 & 255));
        } else {
            UByte.Companion companion2 = UByte.f71693b;
            print(String.valueOf(v11 & 255));
        }
    }

    @Override // kotlinx.serialization.json.internal.Composer
    public void print(short v11) {
        if (this.forceQuoting) {
            UShort.Companion companion = UShort.f71703b;
            printQuoted(String.valueOf(v11 & 65535));
        } else {
            UShort.Companion companion2 = UShort.f71703b;
            print(String.valueOf(v11 & 65535));
        }
    }
}
