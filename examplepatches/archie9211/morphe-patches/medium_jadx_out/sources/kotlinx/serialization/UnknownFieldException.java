package kotlinx.serialization;

import defpackage.b09;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lkotlinx/serialization/UnknownFieldException;", "Lkotlinx/serialization/SerializationException;", "kotlinx-serialization-core"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final class UnknownFieldException extends SerializationException {
    public UnknownFieldException(int i) {
        super(b09.w(i, "An unknown field for index "));
    }
}
