package kotlin.reflect.jvm.internal.impl.protobuf;

import java.util.List;

/* loaded from: classes5.dex */
public interface LazyStringList extends ProtocolStringList {
    void add(ByteString byteString);

    ByteString getByteString(int i5);

    List<?> getUnderlyingElements();

    LazyStringList getUnmodifiableView();
}
