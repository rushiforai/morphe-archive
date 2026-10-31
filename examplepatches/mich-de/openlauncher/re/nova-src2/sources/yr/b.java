package yr;

import com.stripe.android.financialconnections.model.BankAccount;
import com.stripe.android.financialconnections.model.FinancialConnectionsAccount;
import com.stripe.android.financialconnections.model.PaymentAccount;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlinx.serialization.DeserializationStrategy;
import kotlinx.serialization.json.JsonContentPolymorphicSerializer;
import kotlinx.serialization.json.JsonElement;
import kotlinx.serialization.json.JsonElementKt;
import kotlinx.serialization.json.JsonPrimitive;

/* loaded from: classes4.dex */
public final class b extends JsonContentPolymorphicSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final b f97406a = new b(Reflection.f71864a.getOrCreateKotlinClass(PaymentAccount.class));

    @Override // kotlinx.serialization.json.JsonContentPolymorphicSerializer
    public final DeserializationStrategy selectDeserializer(JsonElement element) {
        JsonPrimitive jsonPrimitive;
        Intrinsics.g(element, "element");
        JsonElement jsonElement = (JsonElement) JsonElementKt.getJsonObject(element).get((Object) "object");
        String content = (jsonElement == null || (jsonPrimitive = JsonElementKt.getJsonPrimitive(jsonElement)) == null) ? null : jsonPrimitive.getContent();
        return (Intrinsics.b(content, "linked_account") || Intrinsics.b(content, "financial_connections.account")) ? FinancialConnectionsAccount.Companion.serializer() : BankAccount.Companion.serializer();
    }
}
