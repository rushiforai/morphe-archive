package dw;

import android.text.SpannableString;
import android.text.style.StyleSpan;
import b.c0;
import com.google.android.gms.tasks.Task;
import com.google.android.libraries.places.api.model.AddressComponent;
import com.google.android.libraries.places.api.model.AddressComponents;
import com.google.android.libraries.places.api.model.AutocompletePrediction;
import com.google.android.libraries.places.api.model.AutocompleteSessionToken;
import com.google.android.libraries.places.api.model.Place;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.google.android.libraries.places.api.net.FetchPlaceRequest;
import com.google.android.libraries.places.api.net.FetchPlaceResponse;
import com.google.android.libraries.places.api.net.FindAutocompletePredictionsRequest;
import com.google.android.libraries.places.api.net.FindAutocompletePredictionsResponse;
import com.google.android.libraries.places.api.net.PlacesClient;
import com.stripe.android.core.exception.StripeException;
import ew.g;
import ew.k;
import java.util.ArrayList;
import java.util.List;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import p6.u;

/* loaded from: classes4.dex */
public final class c implements e {

    /* renamed from: a, reason: collision with root package name */
    public final PlacesClient f49677a;

    /* renamed from: b, reason: collision with root package name */
    public final iu.f f49678b;

    /* renamed from: c, reason: collision with root package name */
    public final AutocompleteSessionToken f49679c;

    public c(PlacesClient client, iu.f fVar) {
        Intrinsics.g(client, "client");
        this.f49677a = client;
        this.f49678b = fVar;
        this.f49679c = AutocompleteSessionToken.newInstance();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // dw.e
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, Continuation continuation) {
        a aVar;
        c cVar;
        ArrayList arrayList;
        List<AddressComponent> listAsList;
        if (continuation instanceof a) {
            aVar = (a) continuation;
            int i5 = aVar.f49671w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f49671w = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(this, (ContinuationImpl) continuation);
            }
        }
        Object objI = aVar.f49669u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar.f49671w;
        if (i11 == 0) {
            ResultKt.b(objI);
            try {
                Task<FetchPlaceResponse> taskFetchPlace = this.f49677a.fetchPlace(FetchPlaceRequest.newInstance(str, ul.b.P(Place.Field.ADDRESS_COMPONENTS)));
                Intrinsics.f(taskFetchPlace, "fetchPlace(...)");
                aVar.f49668t = this;
                aVar.f49671w = 1;
                objI = ul.b.i(taskFetchPlace, aVar);
                if (objI == coroutineSingletons) {
                    return coroutineSingletons;
                }
                cVar = this;
            } catch (Exception e3) {
                e = e3;
                cVar = this;
                iu.f fVar = cVar.f49678b;
                iu.c cVar2 = iu.c.f68058i;
                int i12 = StripeException.f42562e;
                t2.c.L(fVar, cVar2, u.i(e), null, 4);
                int i13 = Result.f71687b;
                return ResultKt.a(new Exception(c0.k("Could not fetch place: ", e.getMessage())));
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            cVar = aVar.f49668t;
            try {
                ResultKt.b(objI);
            } catch (Exception e11) {
                e = e11;
                iu.f fVar2 = cVar.f49678b;
                iu.c cVar22 = iu.c.f68058i;
                int i122 = StripeException.f42562e;
                t2.c.L(fVar2, cVar22, u.i(e), null, 4);
                int i132 = Result.f71687b;
                return ResultKt.a(new Exception(c0.k("Could not fetch place: ", e.getMessage())));
            }
        }
        t2.c.L(cVar.f49678b, iu.d.f68077d, null, null, 6);
        int i14 = Result.f71687b;
        AddressComponents addressComponents = ((FetchPlaceResponse) objI).getPlace().getAddressComponents();
        if (addressComponents == null || (listAsList = addressComponents.asList()) == null) {
            arrayList = null;
        } else {
            List<AddressComponent> list = listAsList;
            arrayList = new ArrayList(b70.c.u0(list, 10));
            for (AddressComponent addressComponent : list) {
                String shortName = addressComponent.getShortName();
                String name = addressComponent.getName();
                Intrinsics.f(name, "getName(...)");
                List<String> types = addressComponent.getTypes();
                Intrinsics.f(types, "getTypes(...)");
                arrayList.add(new ew.d(shortName, name, types));
            }
        }
        return new ew.f(new k(arrayList));
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // dw.e
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(int i5, String str, String str2, Continuation continuation) throws Exception {
        b bVar;
        c cVar;
        if (continuation instanceof b) {
            bVar = (b) continuation;
            int i11 = bVar.f49676x;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                bVar.f49676x = i11 - Integer.MIN_VALUE;
            } else {
                bVar = new b(this, (ContinuationImpl) continuation);
            }
        }
        Object objI = bVar.f49674v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = bVar.f49676x;
        if (i12 == 0) {
            ResultKt.b(objI);
            try {
                Task<FindAutocompletePredictionsResponse> taskFindAutocompletePredictions = this.f49677a.findAutocompletePredictions(FindAutocompletePredictionsRequest.builder().setSessionToken(this.f49679c).setQuery(str).setCountries(ul.b.P(str2)).setTypesFilter(ul.b.P(PlaceTypes.ADDRESS)).build());
                Intrinsics.f(taskFindAutocompletePredictions, "findAutocompletePredictions(...)");
                bVar.f49672t = this;
                bVar.f49673u = i5;
                bVar.f49676x = 1;
                objI = ul.b.i(taskFindAutocompletePredictions, bVar);
                if (objI == coroutineSingletons) {
                    return coroutineSingletons;
                }
                cVar = this;
            } catch (Exception e3) {
                e = e3;
                cVar = this;
                iu.f fVar = cVar.f49678b;
                iu.c cVar2 = iu.c.f68057h;
                int i13 = StripeException.f42562e;
                t2.c.L(fVar, cVar2, u.i(e), null, 4);
                int i14 = Result.f71687b;
                return ResultKt.a(new Exception(c0.k("Could not find autocomplete predictions: ", e.getMessage())));
            }
        } else {
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            i5 = bVar.f49673u;
            cVar = bVar.f49672t;
            try {
                ResultKt.b(objI);
            } catch (Exception e11) {
                e = e11;
                iu.f fVar2 = cVar.f49678b;
                iu.c cVar22 = iu.c.f68057h;
                int i132 = StripeException.f42562e;
                t2.c.L(fVar2, cVar22, u.i(e), null, 4);
                int i142 = Result.f71687b;
                return ResultKt.a(new Exception(c0.k("Could not find autocomplete predictions: ", e.getMessage())));
            }
        }
        t2.c.L(cVar.f49678b, iu.d.f68076c, null, null, 6);
        int i15 = Result.f71687b;
        List<AutocompletePrediction> autocompletePredictions = ((FindAutocompletePredictionsResponse) objI).getAutocompletePredictions();
        Intrinsics.f(autocompletePredictions, "getAutocompletePredictions(...)");
        List<AutocompletePrediction> list = autocompletePredictions;
        ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
        for (AutocompletePrediction autocompletePrediction : list) {
            SpannableString primaryText = autocompletePrediction.getPrimaryText(new StyleSpan(1));
            Intrinsics.f(primaryText, "getPrimaryText(...)");
            SpannableString secondaryText = autocompletePrediction.getSecondaryText(new StyleSpan(1));
            Intrinsics.f(secondaryText, "getSecondaryText(...)");
            String placeId = autocompletePrediction.getPlaceId();
            Intrinsics.f(placeId, "getPlaceId(...)");
            arrayList.add(new ew.e(primaryText, secondaryText, placeId));
        }
        return new g(b70.g.E1(arrayList, i5));
    }
}
