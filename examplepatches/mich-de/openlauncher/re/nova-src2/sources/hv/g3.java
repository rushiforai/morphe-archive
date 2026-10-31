package hv;

import com.amplitude.android.TrackingOptions;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.teslacoilsw.launcher.NovaLauncher;
import java.lang.annotation.Annotation;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlinx.serialization.internal.EnumsKt;

/* loaded from: classes4.dex */
public final /* synthetic */ class g3 implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f60276a;

    public /* synthetic */ g3(int i5) {
        this.f60276a = i5;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        j.c cVar;
        j.c cVar2;
        switch (this.f60276a) {
            case 0:
                return new i3(null, y3.p.f96617c);
            case 1:
                return androidx.compose.runtime.d.k(Boolean.FALSE);
            case 2:
                return hw.p.f60766b;
            case 3:
                return hw.p.f60767c;
            case 4:
                return hw.p.f60768d;
            case 5:
                return hw.p.f60771g;
            case 6:
                return hw.p.f60774j;
            case 7:
                p1.z2 z2Var = hw.r.f60794c;
                return Boolean.FALSE;
            case 8:
                return hw.p.f60773i;
            case 9:
                return hw.p.f60772h;
            case 10:
                return Unit.f71706a;
            case 11:
                return EnumsKt.createAnnotatedEnumSerializer("com.stripe.android.uicore.address.FieldType", iw.m.values(), new String[]{"addressLine1", "addressLine2", PlaceTypes.LOCALITY, "dependentLocality", "postalCode", "sortingCode", "administrativeArea", PendingUpgradeStore.KEY_NAME}, new Annotation[][]{null, null, null, null, null, null, null, null}, null);
            case 12:
                return EnumsKt.createAnnotatedEnumSerializer("com.stripe.android.uicore.address.NameType", iw.o.values(), new String[]{"area", "cedex", TrackingOptions.AMP_TRACKING_OPTION_CITY, "country", "county", "department", "district", "do_si", "eircode", "emirate", "island", PlaceTypes.NEIGHBORHOOD, "oblast", "parish", "pin", "post_town", "postal", "prefecture", "province", "state", "suburb", "suburb_or_city", "townland", "village_township", "zip"}, new Annotation[][]{null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null}, null);
            case 13:
                return Unit.f71706a;
            case 14:
                return Unit.f71706a;
            case 15:
                return Unit.f71706a;
            case 16:
                return Unit.f71706a;
            case 17:
                return Unit.f71706a;
            case 18:
                return androidx.compose.runtime.d.k(Boolean.FALSE);
            case 19:
                return "Couldn't find an instance of InitializationDataSource. Are you instantiating CustomerSheet unconditionally in your app?";
            case 20:
                return EnumsKt.createAnnotatedEnumSerializer("com.stripe.android.uicore.elements.AddressFieldConfiguration", kw.c.values(), new String[]{"hidden", "optional", "required"}, new Annotation[][]{null, null, null}, null);
            case 21:
                return androidx.compose.runtime.d.k(Boolean.FALSE);
            case 22:
                return androidx.compose.runtime.d.k(Boolean.FALSE);
            case 23:
                return androidx.compose.runtime.d.k(Boolean.FALSE);
            case 24:
                return androidx.compose.runtime.d.k(Boolean.FALSE);
            case 25:
                NovaLauncher novaLauncher = NovaLauncher.f45649u1;
                if (novaLauncher != null && (cVar = novaLauncher.Z0) != null) {
                    cVar.a(Unit.f71706a, null);
                }
                return Unit.f71706a;
            case 26:
                NovaLauncher novaLauncher2 = NovaLauncher.f45649u1;
                if (novaLauncher2 != null && (cVar2 = novaLauncher2.f45653a1) != null) {
                    cVar2.a(Unit.f71706a, null);
                }
                return Unit.f71706a;
            case 27:
                p1.m0 m0Var = l6.a.f74746a;
                return null;
            case 28:
                return androidx.compose.runtime.d.k(null);
            default:
                return androidx.compose.runtime.d.k(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        }
    }
}
