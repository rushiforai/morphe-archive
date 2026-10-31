package dw;

import android.content.Context;
import com.google.android.libraries.places.R;
import com.google.android.libraries.places.api.Places;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d {
    public static e a(Context context, String googlePlacesApiKey, iu.f fVar) {
        Intrinsics.g(googlePlacesApiKey, "googlePlacesApiKey");
        try {
            int i5 = Places.f33999a;
            Places.initialize(context, googlePlacesApiKey);
            Unit unit = Unit.f71706a;
            return new c(Places.createClient(context), fVar);
        } catch (Exception unused) {
            return new f(fVar);
        }
    }

    public static Integer b(boolean z11) {
        try {
            int i5 = Places.f33999a;
            return Integer.valueOf(z11 ? R.drawable.places_powered_by_google_dark : R.drawable.places_powered_by_google_light);
        } catch (Exception unused) {
            return null;
        }
    }
}
