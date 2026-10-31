package kotlinx.serialization.internal;

import kotlin.jvm.functions.Function0;
import kotlinx.serialization.DeserializationStrategy;

/* loaded from: classes5.dex */
public final /* synthetic */ class d implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f72072a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ TaggedDecoder f72073b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ DeserializationStrategy f72074c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f72075d;

    public /* synthetic */ d(TaggedDecoder taggedDecoder, DeserializationStrategy deserializationStrategy, Object obj, int i5) {
        this.f72072a = i5;
        this.f72073b = taggedDecoder;
        this.f72074c = deserializationStrategy;
        this.f72075d = obj;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f72072a) {
            case 0:
                return this.f72073b.decodeSerializableValue(this.f72074c, this.f72075d);
            default:
                return TaggedDecoder.decodeNullableSerializableElement$lambda$3(this.f72073b, this.f72074c, this.f72075d);
        }
    }
}
