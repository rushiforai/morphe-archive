package kotlinx.serialization.json.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.ArrayDeque;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0010\u0012\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0002\b\u0010\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\t\u001a\u00020\u00062\u0006\u0010\n\u001a\u00020\bH\u0004J\u0010\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u0006H\u0004R\u0014\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\bX\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006\u000e"}, d2 = {"Lkotlinx/serialization/json/internal/ByteArrayPoolBase;", b.f42142b, "<init>", "()V", "arrays", "Lkotlin/collections/ArrayDeque;", b.f42142b, "bytesTotal", b.f42142b, "take", "size", "releaseImpl", b.f42142b, "array", "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes5.dex */
public class ByteArrayPoolBase {

    @NotNull
    private final ArrayDeque<byte[]> arrays = new ArrayDeque<>();
    private int bytesTotal;

    public final void releaseImpl(@NotNull byte[] array) {
        Intrinsics.g(array, "array");
        synchronized (this) {
            try {
                if (this.bytesTotal + array.length < ArrayPoolsKt.MAX_CHARS_IN_POOL) {
                    this.bytesTotal += array.length / 2;
                    this.arrays.addLast(array);
                }
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @NotNull
    public final byte[] take(int size) {
        byte[] bArr;
        synchronized (this) {
            ArrayDeque<byte[]> arrayDeque = this.arrays;
            bArr = null;
            byte[] bArr2 = (byte[]) (arrayDeque.isEmpty() ? null : arrayDeque.removeLast());
            if (bArr2 != null) {
                this.bytesTotal -= bArr2.length / 2;
                bArr = bArr2;
            }
        }
        return bArr == null ? new byte[size] : bArr;
    }
}
