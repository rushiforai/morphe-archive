package kotlinx.serialization;

import kotlin.jvm.functions.Function1;
import kotlinx.serialization.descriptors.ClassSerialDescriptorBuilder;

/* loaded from: classes.dex */
public final /* synthetic */ class a implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f72064a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ SealedClassSerializer f72065b;

    public /* synthetic */ a(SealedClassSerializer sealedClassSerializer, int i5) {
        this.f72064a = i5;
        this.f72065b = sealedClassSerializer;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f72064a) {
            case 0:
                return SealedClassSerializer.descriptor_delegate$lambda$3$lambda$2(this.f72065b, (ClassSerialDescriptorBuilder) obj);
            default:
                return SealedClassSerializer.descriptor_delegate$lambda$3$lambda$2$lambda$1(this.f72065b, (ClassSerialDescriptorBuilder) obj);
        }
    }
}
