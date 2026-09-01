package kotlinx.serialization;

import defpackage.km4;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lkotlinx/serialization/MissingFieldException;", "Lkotlinx/serialization/SerializationException;", "kotlinx-serialization-core"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final class MissingFieldException extends SerializationException {
    public final ArrayList a;

    /* JADX WARN: Illegal instructions before constructor call */
    public MissingFieldException(String str, ArrayList arrayList) {
        String strC;
        str.getClass();
        if (arrayList.size() == 1) {
            strC = km4.C(new StringBuilder("Field '"), (String) arrayList.get(0), "' is required for type with serial name '", str, "', but it was missing");
        } else {
            strC = "Fields " + arrayList + " are required for type with serial name '" + str + "', but they were missing";
        }
        super(strC, null);
        this.a = arrayList;
    }

    public MissingFieldException(ArrayList arrayList, String str, MissingFieldException missingFieldException) {
        super(str, missingFieldException);
        this.a = arrayList;
    }
}
