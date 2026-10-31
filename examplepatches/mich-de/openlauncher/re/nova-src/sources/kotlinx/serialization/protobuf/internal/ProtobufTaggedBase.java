package kotlinx.serialization.protobuf.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Arrays;
import kotlin.Metadata;
import kotlin.jvm.JvmField;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.SerializationException;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u0016\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\t\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0002\b \u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\f\u0010\u000f\u001a\u00060\tj\u0002`\nH\u0004J\u0014\u0010\u0010\u001a\u00020\u00112\n\u0010\u0012\u001a\u00060\tj\u0002`\nH\u0004J\b\u0010\u0013\u001a\u00020\u0011H\u0002J\f\u0010\u0014\u001a\u00060\tj\u0002`\nH\u0004J1\u0010\u0015\u001a\u0002H\u0016\"\u0004\b\u0000\u0010\u00162\n\u0010\u0012\u001a\u00060\tj\u0002`\n2\f\u0010\u0017\u001a\b\u0012\u0004\u0012\u0002H\u00160\u0018H\u0084\bø\u0001\u0000¢\u0006\u0002\u0010\u0019R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u000e¢\u0006\u0002\n\u0000R\u0012\u0010\u0006\u001a\u00020\u00078\u0004@\u0004X\u0085\u000e¢\u0006\u0002\n\u0000R\u0018\u0010\b\u001a\u00060\tj\u0002`\n8DX\u0084\u0004¢\u0006\u0006\u001a\u0004\b\u000b\u0010\fR\u0018\u0010\r\u001a\u00060\tj\u0002`\n8DX\u0084\u0004¢\u0006\u0006\u001a\u0004\b\u000e\u0010\f\u0082\u0002\u0007\n\u0005\b\u009920\u0001¨\u0006\u001a"}, d2 = {"Lkotlinx/serialization/protobuf/internal/ProtobufTaggedBase;", b.f42142b, "<init>", "()V", "tagsStack", b.f42142b, "stackSize", b.f42142b, "currentTag", b.f42142b, "Lkotlinx/serialization/protobuf/internal/ProtoDesc;", "getCurrentTag", "()J", "currentTagOrDefault", "getCurrentTagOrDefault", "popTagOrDefault", "pushTag", b.f42142b, "tag", n.f39151e, "popTag", "tagBlock", "E", "block", "Lkotlin/Function0;", "(JLkotlin/jvm/functions/Function0;)Ljava/lang/Object;", "kotlinx-serialization-protobuf"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public abstract class ProtobufTaggedBase {

    @NotNull
    private long[] tagsStack = new long[8];

    @JvmField
    protected int stackSize = -1;

    private final void expand() {
        long[] jArr = this.tagsStack;
        long[] jArrCopyOf = Arrays.copyOf(jArr, jArr.length * 2);
        Intrinsics.f(jArrCopyOf, "copyOf(...)");
        this.tagsStack = jArrCopyOf;
    }

    public final long getCurrentTag() {
        return this.tagsStack[this.stackSize];
    }

    public final long getCurrentTagOrDefault() {
        int i5 = this.stackSize;
        return i5 == -1 ? ProtobufTaggedBaseKt.MISSING_TAG : this.tagsStack[i5];
    }

    public final long popTag() {
        int i5 = this.stackSize;
        if (i5 < 0) {
            throw new SerializationException("No tag in stack for requested element");
        }
        long[] jArr = this.tagsStack;
        this.stackSize = i5 - 1;
        return jArr[i5];
    }

    public final long popTagOrDefault() {
        int i5 = this.stackSize;
        if (i5 == -1) {
            return ProtobufTaggedBaseKt.MISSING_TAG;
        }
        long[] jArr = this.tagsStack;
        this.stackSize = i5 - 1;
        return jArr[i5];
    }

    public final void pushTag(long tag) {
        if (tag == ProtobufTaggedBaseKt.MISSING_TAG) {
            return;
        }
        int i5 = this.stackSize + 1;
        this.stackSize = i5;
        if (i5 >= this.tagsStack.length) {
            expand();
        }
        this.tagsStack[i5] = tag;
    }

    public final <E> E tagBlock(long tag, @NotNull Function0<? extends E> block) {
        Intrinsics.g(block, "block");
        pushTag(tag);
        return (E) block.invoke();
    }
}
