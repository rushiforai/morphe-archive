package androidx.graphics.path;

import android.graphics.Path;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import dalvik.annotation.optimization.FastNative;
import kotlin.Metadata;

@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\u0014\n\u0002\b\t\b\u0000\u0018\u0000J(\u0010\b\u001a\u00020\u00072\u0006\u0010\u0002\u001a\u00020\u00012\u0006\u0010\u0004\u001a\u00020\u00032\u0006\u0010\u0006\u001a\u00020\u0005H\u0082 ¢\u0006\u0004\b\b\u0010\tJ\u0018\u0010\f\u001a\u00020\u000b2\u0006\u0010\n\u001a\u00020\u0007H\u0082 ¢\u0006\u0004\b\f\u0010\rJ\u0018\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\n\u001a\u00020\u0007H\u0083 ¢\u0006\u0004\b\u000f\u0010\u0010J(\u0010\u0014\u001a\u00020\u00032\u0006\u0010\n\u001a\u00020\u00072\u0006\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0013\u001a\u00020\u0003H\u0083 ¢\u0006\u0004\b\u0014\u0010\u0015J\u0018\u0010\u0016\u001a\u00020\u00032\u0006\u0010\n\u001a\u00020\u0007H\u0083 ¢\u0006\u0004\b\u0016\u0010\u0017J\u0018\u0010\u0018\u001a\u00020\u00032\u0006\u0010\n\u001a\u00020\u0007H\u0083 ¢\u0006\u0004\b\u0018\u0010\u0017J\u0018\u0010\u0019\u001a\u00020\u00032\u0006\u0010\n\u001a\u00020\u0007H\u0083 ¢\u0006\u0004\b\u0019\u0010\u0017¨\u0006\u001a"}, d2 = {"Landroidx/graphics/path/PathIteratorPreApi34Impl;", "Landroid/graphics/Path;", "path", b.f42142b, "conicEvaluation", b.f42142b, "tolerance", b.f42142b, "createInternalPathIterator", "(Landroid/graphics/Path;IF)J", "internalPathIterator", b.f42142b, "destroyInternalPathIterator", "(J)V", b.f42142b, "internalPathIteratorHasNext", "(J)Z", b.f42142b, "points", "offset", "internalPathIteratorNext", "(J[FI)I", "internalPathIteratorPeek", "(J)I", "internalPathIteratorRawSize", "internalPathIteratorSize", "graphics-path_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class PathIteratorPreApi34Impl {
    static {
        System.loadLibrary("androidx.graphics.path");
    }

    private final native long createInternalPathIterator(Path path, int conicEvaluation, float tolerance);

    private final native void destroyInternalPathIterator(long internalPathIterator);

    @FastNative
    private final native boolean internalPathIteratorHasNext(long internalPathIterator);

    @FastNative
    private final native int internalPathIteratorNext(long internalPathIterator, float[] points, int offset);

    @FastNative
    private final native int internalPathIteratorPeek(long internalPathIterator);

    @FastNative
    private final native int internalPathIteratorRawSize(long internalPathIterator);

    @FastNative
    private final native int internalPathIteratorSize(long internalPathIterator);

    public final void finalize() {
        destroyInternalPathIterator(0L);
    }
}
