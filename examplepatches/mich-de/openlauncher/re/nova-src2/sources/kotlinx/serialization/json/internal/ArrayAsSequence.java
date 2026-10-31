package kotlinx.serialization.json.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import r70.j;

@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\r\n\u0000\n\u0002\u0010\u0019\n\u0002\b\u0005\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0010\f\n\u0002\b\u0005\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0003\b\u0000\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u0011\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\tH\u0096\u0002J\u0018\u0010\u0011\u001a\u00020\u00012\u0006\u0010\u0012\u001a\u00020\t2\u0006\u0010\u0013\u001a\u00020\tH\u0016J\u0016\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0012\u001a\u00020\t2\u0006\u0010\u0013\u001a\u00020\tJ\u000e\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0018\u001a\u00020\tJ\b\u0010\u0019\u001a\u00020\u0015H\u0016R\u0014\u0010\u0002\u001a\u00020\u0003X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007R\u001a\u0010\b\u001a\u00020\tX\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\n\u0010\u000b\"\u0004\b\f\u0010\r¨\u0006\u001a"}, d2 = {"Lkotlinx/serialization/json/internal/ArrayAsSequence;", b.f42142b, "buffer", b.f42142b, "<init>", "([C)V", "getBuffer$kotlinx_serialization_json", "()[C", "length", b.f42142b, "getLength", "()I", "setLength", "(I)V", "get", b.f42142b, TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, "subSequence", "startIndex", "endIndex", "substring", b.f42142b, "trim", b.f42142b, "newSize", "toString", "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class ArrayAsSequence implements CharSequence {

    @NotNull
    private final char[] buffer;
    private int length;

    public ArrayAsSequence(@NotNull char[] buffer) {
        Intrinsics.g(buffer, "buffer");
        this.buffer = buffer;
        this.length = buffer.length;
    }

    @Override // java.lang.CharSequence
    public final /* bridge */ char charAt(int i5) {
        return get(i5);
    }

    public char get(int index) {
        return this.buffer[index];
    }

    @NotNull
    /* renamed from: getBuffer$kotlinx_serialization_json, reason: from getter */
    public final char[] getBuffer() {
        return this.buffer;
    }

    public int getLength() {
        return this.length;
    }

    @Override // java.lang.CharSequence
    public final /* bridge */ int length() {
        return getLength();
    }

    public void setLength(int i5) {
        this.length = i5;
    }

    @Override // java.lang.CharSequence
    @NotNull
    public CharSequence subSequence(int startIndex, int endIndex) {
        return j.w0(this.buffer, startIndex, Math.min(endIndex, length()));
    }

    @NotNull
    public final String substring(int startIndex, int endIndex) {
        return j.w0(this.buffer, startIndex, Math.min(endIndex, length()));
    }

    @Override // java.lang.CharSequence
    @NotNull
    public String toString() {
        return substring(0, length());
    }

    public final void trim(int newSize) {
        setLength(Math.min(this.buffer.length, newSize));
    }
}
