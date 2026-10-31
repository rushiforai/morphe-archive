package kotlinx.serialization.json.internal;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Ref;
import kotlinx.serialization.json.JsonElement;

/* loaded from: classes5.dex */
public final /* synthetic */ class a implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f72076a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f72077b;

    public /* synthetic */ a(Object obj, int i5) {
        this.f72076a = i5;
        this.f72077b = obj;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f72076a) {
            case 0:
                return AbstractJsonTreeEncoder.beginStructure$lambda$2((AbstractJsonTreeEncoder) this.f72077b, (JsonElement) obj);
            default:
                return TreeJsonEncoderKt.writeJson$lambda$0((Ref.ObjectRef) this.f72077b, (JsonElement) obj);
        }
    }
}
