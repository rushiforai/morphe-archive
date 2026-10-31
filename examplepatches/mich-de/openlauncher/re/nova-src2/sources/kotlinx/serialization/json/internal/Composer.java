package kotlinx.serialization.json.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0006\n\u0002\u0010\u0002\n\u0002\b\u0006\n\u0002\u0010\f\n\u0002\u0010\u000e\n\u0002\u0010\u0007\n\u0002\u0010\u0006\n\u0002\u0010\u0005\n\u0002\u0010\n\n\u0002\u0010\b\n\u0002\u0010\t\n\u0002\b\u0002\b\u0010\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\b\u0010\r\u001a\u00020\u000eH\u0016J\b\u0010\u000f\u001a\u00020\u000eH\u0016J\b\u0010\u0010\u001a\u00020\u000eH\u0016J\b\u0010\u0011\u001a\u00020\u000eH\u0016J\b\u0010\u0012\u001a\u00020\u000eH\u0016J\u000e\u0010\u0013\u001a\u00020\u000e2\u0006\u0010\u0014\u001a\u00020\u0015J\u000e\u0010\u0013\u001a\u00020\u000e2\u0006\u0010\u0014\u001a\u00020\u0016J\u0010\u0010\u0013\u001a\u00020\u000e2\u0006\u0010\u0014\u001a\u00020\u0017H\u0016J\u0010\u0010\u0013\u001a\u00020\u000e2\u0006\u0010\u0014\u001a\u00020\u0018H\u0016J\u0010\u0010\u0013\u001a\u00020\u000e2\u0006\u0010\u0014\u001a\u00020\u0019H\u0016J\u0010\u0010\u0013\u001a\u00020\u000e2\u0006\u0010\u0014\u001a\u00020\u001aH\u0016J\u0010\u0010\u0013\u001a\u00020\u000e2\u0006\u0010\u0014\u001a\u00020\u001bH\u0016J\u0010\u0010\u0013\u001a\u00020\u000e2\u0006\u0010\u0014\u001a\u00020\u001cH\u0016J\u0010\u0010\u0013\u001a\u00020\u000e2\u0006\u0010\u0014\u001a\u00020\u0007H\u0016J\u0010\u0010\u001d\u001a\u00020\u000e2\u0006\u0010\u0006\u001a\u00020\u0016H\u0016R\u0010\u0010\u0002\u001a\u00020\u00038\u0000X\u0081\u0004¢\u0006\u0002\n\u0000R$\u0010\b\u001a\u00020\u00072\u0006\u0010\u0006\u001a\u00020\u0007@DX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\t\u0010\n\"\u0004\b\u000b\u0010\f¨\u0006\u001e"}, d2 = {"Lkotlinx/serialization/json/internal/Composer;", b.f42142b, "writer", "Lkotlinx/serialization/json/internal/InternalJsonWriter;", "<init>", "(Lkotlinx/serialization/json/internal/InternalJsonWriter;)V", "value", b.f42142b, "writingFirst", "getWritingFirst", "()Z", "setWritingFirst", "(Z)V", "indent", b.f42142b, "unIndent", "nextItem", "nextItemIfNotFirst", "space", "print", "v", b.f42142b, b.f42142b, b.f42142b, b.f42142b, b.f42142b, b.f42142b, b.f42142b, b.f42142b, "printQuoted", "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public class Composer {

    @JvmField
    @NotNull
    public final InternalJsonWriter writer;
    private boolean writingFirst;

    public Composer(@NotNull InternalJsonWriter writer) {
        Intrinsics.g(writer, "writer");
        this.writer = writer;
        this.writingFirst = true;
    }

    public final boolean getWritingFirst() {
        return this.writingFirst;
    }

    public void indent() {
        this.writingFirst = true;
    }

    public void nextItem() {
        this.writingFirst = false;
    }

    public void nextItemIfNotFirst() {
        this.writingFirst = false;
    }

    public final void print(char v11) {
        this.writer.writeChar(v11);
    }

    public void printQuoted(@NotNull String value) {
        Intrinsics.g(value, "value");
        this.writer.writeQuoted(value);
    }

    public final void setWritingFirst(boolean z11) {
        this.writingFirst = z11;
    }

    public void space() {
    }

    public void unIndent() {
    }

    public final void print(@NotNull String v11) {
        Intrinsics.g(v11, "v");
        this.writer.write(v11);
    }

    public void print(float v11) {
        this.writer.write(String.valueOf(v11));
    }

    public void print(double v11) {
        this.writer.write(String.valueOf(v11));
    }

    public void print(byte v11) {
        this.writer.writeLong(v11);
    }

    public void print(short v11) {
        this.writer.writeLong(v11);
    }

    public void print(int v11) {
        this.writer.writeLong(v11);
    }

    public void print(long v11) {
        this.writer.writeLong(v11);
    }

    public void print(boolean v11) {
        this.writer.write(String.valueOf(v11));
    }
}
