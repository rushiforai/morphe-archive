package kotlinx.serialization.protobuf.schema;

import kotlin.jvm.functions.Function1;
import kotlinx.serialization.descriptors.ClassSerialDescriptorBuilder;
import kotlinx.serialization.descriptors.SerialDescriptor;

/* loaded from: classes5.dex */
public final /* synthetic */ class c implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f72083a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ SerialDescriptor f72084b;

    public /* synthetic */ c(SerialDescriptor serialDescriptor, int i5) {
        this.f72083a = i5;
        this.f72084b = serialDescriptor;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f72083a) {
            case 0:
                return ProtoBufSchemaGenerator.createNestedCollectionType$lambda$32(this.f72084b, (ClassSerialDescriptorBuilder) obj);
            case 1:
                return ProtoBufSchemaGenerator.generateMessageField$lambda$22$lambda$17(this.f72084b, ((Integer) obj).intValue());
            case 2:
                return ProtoBufSchemaGenerator.generateMessageField$lambda$22$lambda$19(this.f72084b, ((Integer) obj).intValue());
            case 3:
                return Integer.valueOf(ProtoBufSchemaGenerator.generateMessageField$lambda$22$lambda$20(this.f72084b, ((Integer) obj).intValue()));
            case 4:
                return ProtoBufSchemaGenerator.generateMessageField$lambda$22$lambda$21(this.f72084b, ((Integer) obj).intValue());
            default:
                return ProtoBufSchemaGenerator.createLegacyMapType$lambda$31(this.f72084b, (ClassSerialDescriptorBuilder) obj);
        }
    }
}
