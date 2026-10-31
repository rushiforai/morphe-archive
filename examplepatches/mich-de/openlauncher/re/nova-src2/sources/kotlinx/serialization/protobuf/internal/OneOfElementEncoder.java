package kotlinx.serialization.protobuf.internal;

import b70.g;
import java.lang.annotation.Annotation;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.protobuf.ProtoBuf;
import kotlinx.serialization.protobuf.ProtoNumber;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0002\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0004\b\b\u0010\t¨\u0006\n"}, d2 = {"Lkotlinx/serialization/protobuf/internal/OneOfElementEncoder;", "Lkotlinx/serialization/protobuf/internal/ProtobufEncoder;", "proto", "Lkotlinx/serialization/protobuf/ProtoBuf;", "parentWriter", "Lkotlinx/serialization/protobuf/internal/ProtobufWriter;", "descriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "<init>", "(Lkotlinx/serialization/protobuf/ProtoBuf;Lkotlinx/serialization/protobuf/internal/ProtobufWriter;Lkotlinx/serialization/descriptors/SerialDescriptor;)V", "kotlinx-serialization-protobuf"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes5.dex */
final class OneOfElementEncoder extends ProtobufEncoder {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public OneOfElementEncoder(@NotNull ProtoBuf proto, @NotNull ProtobufWriter parentWriter, @NotNull SerialDescriptor descriptor) {
        super(proto, parentWriter, descriptor);
        Intrinsics.g(proto, "proto");
        Intrinsics.g(parentWriter, "parentWriter");
        Intrinsics.g(descriptor, "descriptor");
        if (descriptor.getElementsCount() != 1) {
            throw new IllegalArgumentException(("Implementation of oneOf type " + descriptor.getSerialName() + " should contain only 1 element, but get " + descriptor.getElementsCount()).toString());
        }
        List<Annotation> elementAnnotations = descriptor.getElementAnnotations(0);
        ArrayList arrayList = new ArrayList();
        for (Object obj : elementAnnotations) {
            if (obj instanceof ProtoNumber) {
                arrayList.add(obj);
            }
        }
        if (((ProtoNumber) g.A1(arrayList)) != null) {
            return;
        }
        throw new IllegalArgumentException(("Implementation of oneOf type " + descriptor.getSerialName() + " should have @ProtoNumber annotation").toString());
    }
}
