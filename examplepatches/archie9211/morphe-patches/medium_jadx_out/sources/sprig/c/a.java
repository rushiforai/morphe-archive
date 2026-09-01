package sprig.c;

import com.drew.imaging.raf.yvq.AXoTRPEGKEve;
import defpackage.cu1;
import defpackage.g76;
import defpackage.ka1;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\b\b\u0080\b\u0018\u00002\u00020\u0001B\u0015\u0012\f\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004¢\u0006\u0004\b\u0014\u0010\u0015J\u0006\u0010\u0003\u001a\u00020\u0002J\u000f\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004HÆ\u0003J\u0019\u0010\b\u001a\u00020\u00002\u000e\b\u0002\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004HÆ\u0001J\t\u0010\n\u001a\u00020\tHÖ\u0001J\t\u0010\f\u001a\u00020\u000bHÖ\u0001J\u0013\u0010\u000f\u001a\u00020\u000e2\b\u0010\r\u001a\u0004\u0018\u00010\u0001HÖ\u0003R\u001d\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00050\u00048\u0006¢\u0006\f\n\u0004\b\u0010\u0010\u0011\u001a\u0004\b\u0012\u0010\u0013¨\u0006\u0016"}, d2 = {"Lsprig/c/a;", "", "Lorg/json/JSONObject;", "toJson", "", "Lsprig/c/d;", "component1", "experiments", "copy", "", "toString", "", "hashCode", "other", "", "equals", "a", "Ljava/util/List;", "getExperiments", "()Ljava/util/List;", "<init>", "(Ljava/util/List;)V", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final /* data */ class a {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public final List experiments;

    public a(List<d> list) {
        list.getClass();
        this.experiments = list;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ a copy$default(a aVar, List list, int i, Object obj) {
        if ((i & 1) != 0) {
            list = aVar.experiments;
        }
        return aVar.copy(list);
    }

    public final List<d> component1() {
        return this.experiments;
    }

    public final a copy(List<d> experiments) {
        experiments.getClass();
        return new a(experiments);
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof a) && g76.L(this.experiments, ((a) other).experiments);
    }

    public final List<d> getExperiments() {
        return this.experiments;
    }

    public int hashCode() {
        return this.experiments.hashCode();
    }

    public final JSONObject toJson() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        List list = this.experiments;
        ArrayList arrayList = new ArrayList(cu1.k0(list, 10));
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            arrayList.add(((d) it2.next()).toJson());
        }
        jSONObject.put("experiments", new JSONArray((Collection) arrayList));
        return jSONObject;
    }

    public String toString() {
        return ka1.t("Experiments(experiments=", AXoTRPEGKEve.BNNtMch, this.experiments);
    }
}
