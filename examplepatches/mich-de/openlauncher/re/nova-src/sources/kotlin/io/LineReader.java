package kotlin.io;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\bÀ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/io/LineReader;", b.f42142b, "<init>", "()V", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class LineReader {
    static {
        new LineReader();
        Intrinsics.f(ByteBuffer.wrap(new byte[32]), "wrap(...)");
        Intrinsics.f(CharBuffer.wrap(new char[32]), "wrap(...)");
    }

    private LineReader() {
    }
}
