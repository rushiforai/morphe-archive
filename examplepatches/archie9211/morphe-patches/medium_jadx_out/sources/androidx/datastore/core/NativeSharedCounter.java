package androidx.datastore.core;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\u0007\b\u0000\u0018\u00002\u00020\u0001J\u0018\u0010\u0004\u001a\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u0002H\u0086 ¢\u0006\u0004\b\u0004\u0010\u0005J\u0018\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0003\u001a\u00020\u0002H\u0086 ¢\u0006\u0004\b\u0007\u0010\bJ\u0018\u0010\n\u001a\u00020\u00022\u0006\u0010\t\u001a\u00020\u0006H\u0086 ¢\u0006\u0004\b\n\u0010\u000bJ\u0018\u0010\f\u001a\u00020\u00022\u0006\u0010\t\u001a\u00020\u0006H\u0086 ¢\u0006\u0004\b\f\u0010\u000b¨\u0006\r"}, d2 = {"Landroidx/datastore/core/NativeSharedCounter;", "", "", "fd", "nativeTruncateFile", "(I)I", "", "nativeCreateSharedCounter", "(I)J", "address", "nativeGetCounterValue", "(J)I", "nativeIncrementAndGetCounterValue", "datastore-core_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
public final class NativeSharedCounter {
    public final native long nativeCreateSharedCounter(int fd);

    public final native int nativeGetCounterValue(long address);

    public final native int nativeIncrementAndGetCounterValue(long address);

    public final native int nativeTruncateFile(int fd);
}
