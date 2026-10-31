package ew;

import com.google.android.libraries.places.api.model.PlaceTypes;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class j {

    /* renamed from: b, reason: collision with root package name */
    public static final j f53049b;

    /* renamed from: c, reason: collision with root package name */
    public static final j f53050c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ j[] f53051d;

    /* renamed from: a, reason: collision with root package name */
    public final String f53052a;

    static {
        j jVar = new j("ADMINISTRATIVE_AREA_LEVEL_1", 0, PlaceTypes.ADMINISTRATIVE_AREA_LEVEL_1);
        f53049b = jVar;
        j jVar2 = new j("ADMINISTRATIVE_AREA_LEVEL_2", 1, PlaceTypes.ADMINISTRATIVE_AREA_LEVEL_2);
        f53050c = jVar2;
        j[] jVarArr = {jVar, jVar2, new j("ADMINISTRATIVE_AREA_LEVEL_3", 2, PlaceTypes.ADMINISTRATIVE_AREA_LEVEL_3), new j("ADMINISTRATIVE_AREA_LEVEL_4", 3, PlaceTypes.ADMINISTRATIVE_AREA_LEVEL_4), new j("COUNTRY", 4, "country"), new j("LOCALITY", 5, PlaceTypes.LOCALITY), new j("NEIGHBORHOOD", 6, PlaceTypes.NEIGHBORHOOD), new j("POSTAL_TOWN", 7, PlaceTypes.POSTAL_TOWN), new j("POSTAL_CODE", 8, PlaceTypes.POSTAL_CODE), new j("PREMISE", 9, PlaceTypes.PREMISE), new j("ROUTE", 10, PlaceTypes.ROUTE), new j("STREET_NUMBER", 11, PlaceTypes.STREET_NUMBER), new j("SUBLOCALITY", 12, PlaceTypes.SUBLOCALITY), new j("SUBLOCALITY_LEVEL_1", 13, PlaceTypes.SUBLOCALITY_LEVEL_1), new j("SUBLOCALITY_LEVEL_2", 14, PlaceTypes.SUBLOCALITY_LEVEL_2), new j("SUBLOCALITY_LEVEL_3", 15, PlaceTypes.SUBLOCALITY_LEVEL_3), new j("SUBLOCALITY_LEVEL_4", 16, PlaceTypes.SUBLOCALITY_LEVEL_4)};
        f53051d = jVarArr;
        EnumEntriesKt.a(jVarArr);
    }

    public j(String str, int i5, String str2) {
        this.f53052a = str2;
    }

    public static j valueOf(String str) {
        return (j) Enum.valueOf(j.class, str);
    }

    public static j[] values() {
        return (j[]) f53051d.clone();
    }
}
