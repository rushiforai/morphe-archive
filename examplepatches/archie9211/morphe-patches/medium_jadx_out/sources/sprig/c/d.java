package sprig.c;

import defpackage.ev6;
import defpackage.g76;
import kotlin.Metadata;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\n\b\u0080\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0007\u001a\u00020\u0004\u0012\u0006\u0010\b\u001a\u00020\u0004¢\u0006\u0004\b\u0016\u0010\u0017J\u0006\u0010\u0003\u001a\u00020\u0002J\t\u0010\u0005\u001a\u00020\u0004HÆ\u0003J\t\u0010\u0006\u001a\u00020\u0004HÆ\u0003J\u001d\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0007\u001a\u00020\u00042\b\b\u0002\u0010\b\u001a\u00020\u0004HÆ\u0001J\t\u0010\n\u001a\u00020\u0004HÖ\u0001J\t\u0010\f\u001a\u00020\u000bHÖ\u0001J\u0013\u0010\u000f\u001a\u00020\u000e2\b\u0010\r\u001a\u0004\u0018\u00010\u0001HÖ\u0003R\u0017\u0010\u0007\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0010\u0010\u0011\u001a\u0004\b\u0012\u0010\u0013R\u0017\u0010\b\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0014\u0010\u0011\u001a\u0004\b\u0015\u0010\u0013¨\u0006\u0018"}, d2 = {"Lsprig/c/d;", "", "Lorg/json/JSONObject;", "toJson", "", "component1", "component2", "id", "variation", "copy", "toString", "", "hashCode", "other", "", "equals", "a", "Ljava/lang/String;", "getId", "()Ljava/lang/String;", "b", "getVariation", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final /* data */ class d {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public final String id;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    public final String variation;

    public d(String str, String str2) {
        str.getClass();
        str2.getClass();
        this.id = str;
        this.variation = str2;
    }

    public static /* synthetic */ d copy$default(d dVar, String str, String str2, int i, Object obj) {
        if ((i & 1) != 0) {
            str = dVar.id;
        }
        if ((i & 2) != 0) {
            str2 = dVar.variation;
        }
        return dVar.copy(str, str2);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final String getId() {
        return this.id;
    }

    /* JADX INFO: renamed from: component2, reason: from getter */
    public final String getVariation() {
        return this.variation;
    }

    public final d copy(String id, String variation) {
        id.getClass();
        variation.getClass();
        return new d(id, variation);
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof d)) {
            return false;
        }
        d dVar = (d) other;
        return g76.L(this.id, dVar.id) && g76.L(this.variation, dVar.variation);
    }

    public final String getId() {
        return this.id;
    }

    public final String getVariation() {
        return this.variation;
    }

    public int hashCode() {
        return this.variation.hashCode() + (this.id.hashCode() * 31);
    }

    public final JSONObject toJson() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("id", this.id);
        jSONObject.put("variation", this.variation);
        return jSONObject;
    }

    public String toString() {
        return ev6.y("OptimizelyData(id=", this.id, ", variation=", this.variation, ")");
    }
}
