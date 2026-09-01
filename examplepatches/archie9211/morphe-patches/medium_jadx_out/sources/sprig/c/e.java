package sprig.c;

import defpackage.bu1;
import defpackage.ey3;
import defpackage.x45;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010$\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0010 \n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0000\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0001\u0012\u0012\u0010\u0006\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00050\u0003¢\u0006\u0004\b\u0007\u0010\bJ)\u0010\u000e\u001a\u00020\r2\u0006\u0010\n\u001a\u00020\t2\u0012\u0010\f\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\t0\u000b¢\u0006\u0004\b\u000e\u0010\u000fJ\u0011\u0010\u0010\u001a\u0004\u0018\u00010\u0001H\u0007¢\u0006\u0004\b\u0010\u0010\u0011J#\u0010\u0013\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0002\b\u0003\u0018\u00010\u000b2\u0006\u0010\u0012\u001a\u00020\u0001H\u0007¢\u0006\u0004\b\u0013\u0010\u0014J5\u0010\u0016\u001a\u0004\u0018\u00010\u00012\u0006\u0010\u0015\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\t2\u0012\u0010\f\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\t0\u000bH\u0007¢\u0006\u0004\b\u0016\u0010\u0017J\u001f\u0010\u001a\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u00192\u0006\u0010\u0018\u001a\u00020\u0001H\u0007¢\u0006\u0004\b\u001a\u0010\u001bJ\u0019\u0010\u001d\u001a\u0004\u0018\u00010\u00012\u0006\u0010\u001c\u001a\u00020\u0001H\u0002¢\u0006\u0004\b\u001d\u0010\u001eJ\u0019\u0010\u001f\u001a\u0004\u0018\u00010\u00012\u0006\u0010\u001c\u001a\u00020\u0001H\u0002¢\u0006\u0004\b\u001f\u0010\u001eJ\u0019\u0010!\u001a\u0004\u0018\u00010 2\u0006\u0010\u001c\u001a\u00020\u0001H\u0002¢\u0006\u0004\b!\u0010\"R\u0014\u0010\u0002\u001a\u00020\u00018\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b!\u0010#R \u0010\u0006\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00050\u00038\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u001d\u0010$¨\u0006%"}, d2 = {"Lsprig/c/e;", "", "sdk", "Lkotlin/Function1;", "", "Lc1e;", "errorReporter", "<init>", "(Ljava/lang/Object;Lx45;)V", "", "userId", "", "attributes", "Lsprig/c/a;", "getExperiments", "(Ljava/lang/String;Ljava/util/Map;)Lsprig/c/a;", "getConfig", "()Ljava/lang/Object;", "config", "getExperimentsMap", "(Ljava/lang/Object;)Ljava/util/Map;", "experimentName", "getVariation", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/lang/Object;", "variation", "", "getVariables", "(Ljava/lang/Object;)Ljava/util/List;", "variable", "b", "(Ljava/lang/Object;)Ljava/lang/Object;", "c", "Lsprig/c/d;", "a", "(Ljava/lang/Object;)Lsprig/c/d;", "Ljava/lang/Object;", "Lx45;", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class e {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public final Object sdk;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    public final x45 errorReporter;

    public e(Object obj, x45 x45Var) {
        obj.getClass();
        x45Var.getClass();
        this.sdk = obj;
        this.errorReporter = x45Var;
    }

    public final d a(Object variable) {
        String string;
        Object objC;
        String string2;
        Object objB = b(variable);
        if (objB == null || (string = objB.toString()) == null || (objC = c(variable)) == null || (string2 = objC.toString()) == null || string.length() <= 0 || string2.length() <= 0) {
            return null;
        }
        return new d(string, string2);
    }

    public final Object b(Object variable) {
        return f.invoke(new c("getId", this.errorReporter), variable);
    }

    public final Object c(Object variable) {
        return f.invoke(new c("getValue", this.errorReporter), variable);
    }

    public final Object getConfig() {
        return f.invoke(new c("getOptimizelyConfig", this.errorReporter), this.sdk);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r5v1, types: [ey3] */
    /* JADX WARN: Type inference failed for: r5v2, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r5v4, types: [java.util.ArrayList] */
    public final a getExperiments(String userId, Map<String, String> attributes) {
        ?? arrayList;
        Map<String, ?> experimentsMap;
        Set<String> setKeySet;
        userId.getClass();
        attributes.getClass();
        Object config = getConfig();
        if (config == null || (experimentsMap = getExperimentsMap(config)) == null || (setKeySet = experimentsMap.keySet()) == null) {
            arrayList = ey3.a;
        } else {
            ArrayList arrayList2 = new ArrayList();
            Iterator it2 = setKeySet.iterator();
            while (it2.hasNext()) {
                Object variation = getVariation((String) it2.next(), userId, attributes);
                if (variation != null) {
                    arrayList2.add(variation);
                }
            }
            ArrayList arrayList3 = new ArrayList();
            Iterator it3 = arrayList2.iterator();
            while (it3.hasNext()) {
                bu1.n0(getVariables(it3.next()), arrayList3);
            }
            ArrayList arrayListV0 = bu1.v0(arrayList3);
            arrayList = new ArrayList();
            Iterator it4 = arrayListV0.iterator();
            while (it4.hasNext()) {
                d dVarA = a(it4.next());
                if (dVarA != null) {
                    arrayList.add(dVarA);
                }
            }
        }
        return new a(arrayList);
    }

    public final Map<String, ?> getExperimentsMap(Object config) {
        config.getClass();
        Object objInvoke = f.invoke(new b("experimentsMap", this.errorReporter), config);
        if (objInvoke instanceof Map) {
            return (Map) objInvoke;
        }
        return null;
    }

    public final List<Object> getVariables(Object variation) {
        variation.getClass();
        Object objInvoke = f.invoke(new c("getFeatureVariableUsageInstances", this.errorReporter), variation);
        List<Object> list = objInvoke instanceof List ? (List) objInvoke : null;
        return list == null ? ey3.a : list;
    }

    public final Object getVariation(String experimentName, String userId, Map<String, String> attributes) {
        experimentName.getClass();
        userId.getClass();
        attributes.getClass();
        return f.invoke(new c("getVariation", this.errorReporter), this.sdk, new Class[]{String.class, String.class, Map.class}, new Object[]{experimentName, userId, attributes});
    }
}
