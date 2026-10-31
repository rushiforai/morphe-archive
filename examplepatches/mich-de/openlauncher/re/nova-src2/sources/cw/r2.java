package cw;

import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.stripe.android.ui.core.elements.AddressSpec;
import com.stripe.android.ui.core.elements.AffirmTextSpec;
import com.stripe.android.ui.core.elements.AfterpayClearpayTextSpec;
import com.stripe.android.ui.core.elements.AuBankAccountNumberSpec;
import com.stripe.android.ui.core.elements.AuBecsDebitMandateTextSpec;
import com.stripe.android.ui.core.elements.BsbSpec;
import com.stripe.android.ui.core.elements.CountrySpec;
import com.stripe.android.ui.core.elements.DropdownSpec;
import com.stripe.android.ui.core.elements.EmailSpec;
import com.stripe.android.ui.core.elements.EmptyFormSpec;
import com.stripe.android.ui.core.elements.FormItemSpec;
import com.stripe.android.ui.core.elements.IbanSpec;
import com.stripe.android.ui.core.elements.KlarnaHeaderStaticTextSpec;
import com.stripe.android.ui.core.elements.MandateTextSpec;
import com.stripe.android.ui.core.elements.NameSpec;
import com.stripe.android.ui.core.elements.PlaceholderSpec;
import com.stripe.android.ui.core.elements.SepaMandateTextSpec;
import com.stripe.android.ui.core.elements.SimpleTextSpec;
import com.stripe.android.ui.core.elements.StaticTextSpec;
import com.tiktok.util.TTConst;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlinx.serialization.DeserializationStrategy;
import kotlinx.serialization.json.JsonContentPolymorphicSerializer;
import kotlinx.serialization.json.JsonElement;
import kotlinx.serialization.json.JsonElementKt;
import kotlinx.serialization.json.JsonPrimitive;
import ninja.sesame.lib.bridge.v1.ActionCategory;

/* loaded from: classes4.dex */
public final class r2 extends JsonContentPolymorphicSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final r2 f48288a = new r2(Reflection.f71864a.getOrCreateKotlinClass(FormItemSpec.class));

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue
    java.lang.NullPointerException: Cannot invoke "java.util.List.iterator()" because the return value of "jadx.core.dex.visitors.regions.SwitchOverStringVisitor$SwitchData.getNewCases()" is null
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.restoreSwitchOverString(SwitchOverStringVisitor.java:109)
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.visitRegion(SwitchOverStringVisitor.java:66)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:77)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:82)
     */
    @Override // kotlinx.serialization.json.JsonContentPolymorphicSerializer
    public final DeserializationStrategy selectDeserializer(JsonElement element) {
        JsonPrimitive jsonPrimitive;
        Intrinsics.g(element, "element");
        JsonElement jsonElement = (JsonElement) JsonElementKt.getJsonObject(element).get((Object) TTConst.TRACK_TYPE);
        String content = (jsonElement == null || (jsonPrimitive = JsonElementKt.getJsonPrimitive(jsonElement)) == null) ? null : jsonPrimitive.getContent();
        if (content != null) {
            switch (content.hashCode()) {
                case -1922029177:
                    if (content.equals("klarna_header")) {
                        return KlarnaHeaderStaticTextSpec.Companion.serializer();
                    }
                    break;
                case -1884659095:
                    if (content.equals("affirm_header")) {
                        return AffirmTextSpec.Companion.serializer();
                    }
                    break;
                case -910686504:
                    if (content.equals("au_becs_bsb_number")) {
                        return BsbSpec.Companion.serializer();
                    }
                    break;
                case -516244944:
                    if (content.equals("billing_address")) {
                        return AddressSpec.Companion.serializer();
                    }
                    break;
                case -185531168:
                    if (content.equals("afterpay_header")) {
                        return AfterpayClearpayTextSpec.Companion.serializer();
                    }
                    break;
                case -9348212:
                    if (content.equals("sepa_mandate")) {
                        return SepaMandateTextSpec.Companion.serializer();
                    }
                    break;
                case 3225350:
                    if (content.equals("iban")) {
                        return IbanSpec.Companion.serializer();
                    }
                    break;
                case 3373707:
                    if (content.equals(PendingUpgradeStore.KEY_NAME)) {
                        return NameSpec.Companion.serializer();
                    }
                    break;
                case 3556653:
                    if (content.equals("text")) {
                        return SimpleTextSpec.Companion.serializer();
                    }
                    break;
                case 40435420:
                    if (content.equals("au_becs_account_number")) {
                        return AuBankAccountNumberSpec.Companion.serializer();
                    }
                    break;
                case 96619420:
                    if (content.equals(ActionCategory.EMAIL)) {
                        return EmailSpec.Companion.serializer();
                    }
                    break;
                case 598246771:
                    if (content.equals("placeholder")) {
                        return PlaceholderSpec.Companion.serializer();
                    }
                    break;
                case 709160924:
                    if (content.equals("klarna_country")) {
                        return CountrySpec.Companion.serializer();
                    }
                    break;
                case 835344392:
                    if (content.equals("mandate")) {
                        return MandateTextSpec.Companion.serializer();
                    }
                    break;
                case 885589086:
                    if (content.equals("static_text")) {
                        return StaticTextSpec.Companion.serializer();
                    }
                    break;
                case 957831062:
                    if (content.equals("country")) {
                        return CountrySpec.Companion.serializer();
                    }
                    break;
                case 1191572447:
                    if (content.equals("selector")) {
                        return DropdownSpec.Companion.serializer();
                    }
                    break;
                case 1255817703:
                    if (content.equals("au_becs_mandate")) {
                        return AuBecsDebitMandateTextSpec.Companion.serializer();
                    }
                    break;
            }
        }
        return EmptyFormSpec.INSTANCE.serializer();
    }
}
