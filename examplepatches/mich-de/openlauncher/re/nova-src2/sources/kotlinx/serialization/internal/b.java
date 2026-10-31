package kotlinx.serialization.internal;

import kotlin.jvm.functions.Function1;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.descriptors.ClassSerialDescriptorBuilder;

/* loaded from: classes5.dex */
public final /* synthetic */ class b implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f72067a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ KSerializer f72068b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ KSerializer f72069c;

    public /* synthetic */ b(KSerializer kSerializer, KSerializer kSerializer2, int i5) {
        this.f72067a = i5;
        this.f72068b = kSerializer;
        this.f72069c = kSerializer2;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f72067a) {
            case 0:
                return MapEntrySerializer.descriptor$lambda$0(this.f72068b, this.f72069c, (ClassSerialDescriptorBuilder) obj);
            default:
                return PairSerializer.descriptor$lambda$0(this.f72068b, this.f72069c, (ClassSerialDescriptorBuilder) obj);
        }
    }
}
