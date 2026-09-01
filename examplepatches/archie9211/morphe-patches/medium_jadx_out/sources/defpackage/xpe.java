package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xpe extends k2 {
    public static final Parcelable.Creator<xpe> CREATOR = new lvf(16);
    public final List a;

    public xpe(ArrayList arrayList) {
        this.a = arrayList;
    }

    public final JSONArray d() {
        try {
            JSONArray jSONArray = new JSONArray();
            List list = this.a;
            if (list != null) {
                for (int i = 0; i < list.size(); i++) {
                    ype ypeVar = (ype) list.get(i);
                    JSONArray jSONArray2 = new JSONArray();
                    jSONArray2.put((int) ypeVar.c);
                    jSONArray2.put((int) ypeVar.b);
                    jSONArray2.put((int) ypeVar.c);
                    jSONArray.put(i, jSONArray2);
                }
            }
            return jSONArray;
        } catch (JSONException e) {
            lg8.p("Error encoding UvmEntries to JSON object", e);
            return null;
        }
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof xpe)) {
            return false;
        }
        List list = ((xpe) obj).a;
        List list2 = this.a;
        if (list2 == null && list == null) {
            return true;
        }
        return list2 != null && list != null && list2.containsAll(list) && list.containsAll(list2);
    }

    public final int hashCode() {
        List list = this.a;
        return Arrays.hashCode(new Object[]{list == null ? null : new HashSet(list)});
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        int iC0 = fo7.c0(20293, parcel);
        fo7.Y(parcel, 1, this.a);
        fo7.d0(iC0, parcel);
    }
}
