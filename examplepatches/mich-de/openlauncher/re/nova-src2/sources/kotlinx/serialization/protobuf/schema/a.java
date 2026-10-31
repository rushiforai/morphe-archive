package kotlinx.serialization.protobuf.schema;

import kotlin.jvm.functions.Function0;
import kotlinx.serialization.descriptors.SerialDescriptor;

/* loaded from: classes5.dex */
public final /* synthetic */ class a implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f72078a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f72079b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ SerialDescriptor f72080c;

    public /* synthetic */ a(String str, SerialDescriptor serialDescriptor, int i5) {
        this.f72078a = i5;
        this.f72079b = str;
        this.f72080c = serialDescriptor;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f72078a) {
            case 0:
                return ProtoBufSchemaGenerator.generateMessage$lambda$8(this.f72079b, this.f72080c);
            case 1:
                return ProtoBufSchemaGenerator.generateEnum$lambda$25(this.f72079b, this.f72080c);
            default:
                return ProtoBufSchemaGenerator.generateEnum$lambda$27$lambda$26(this.f72079b, this.f72080c);
        }
    }
}
