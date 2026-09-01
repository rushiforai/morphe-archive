package defpackage;

import androidx.credentials.exceptions.CreateCredentialException;
import androidx.credentials.exceptions.GetCredentialUnknownException;
import androidx.credentials.exceptions.GetCredentialUnsupportedException;
import androidx.credentials.playservices.controllers.identityauth.beginsignin.CredentialProviderBeginSignInController;
import androidx.credentials.playservices.controllers.identityauth.createpassword.CredentialProviderCreatePasswordController;
import androidx.credentials.playservices.controllers.identityauth.createpublickeycredential.CredentialProviderCreatePublicKeyCredentialController;
import androidx.credentials.playservices.controllers.identityauth.getsigninintent.CredentialProviderGetSignInIntentController;
import androidx.credentials.playservices.controllers.identitycredentials.createdigitalcredential.CreateDigitalCredentialController;
import androidx.credentials.playservices.controllers.identitycredentials.createpasswordcredential.CreatePasswordCredentialController;
import androidx.credentials.playservices.controllers.identitycredentials.createpublickeycredential.CreatePublicKeyCredentialController;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import org.json.JSONException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class gf2 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public /* synthetic */ gf2(Object obj, int i, Object obj2) {
        this.a = i;
        this.c = obj;
        this.b = obj2;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        sv0 sv0Var;
        Set setA;
        int i = this.a;
        boolean z = false;
        c1e c1eVar = c1e.a;
        Object obj = this.b;
        Object obj2 = this.c;
        switch (i) {
            case 0:
                return CreateDigitalCredentialController.handleResponse$lambda$4((CreateDigitalCredentialController) obj2, (bf2) obj);
            case 1:
                return CreatePasswordCredentialController.handleResponse$lambda$3((CreatePasswordCredentialController) obj2, (bf2) obj);
            case 2:
                return CreatePasswordCredentialController.handleResponse$lambda$4((CreatePasswordCredentialController) obj2, (CreateCredentialException) obj);
            case 3:
                return CreatePublicKeyCredentialController.handleResponse$lambda$3((CreatePublicKeyCredentialController) obj2, (bf2) obj);
            case 4:
                return CreatePublicKeyCredentialController.handleResponse$lambda$4((CreatePublicKeyCredentialController) obj2, (CreateCredentialException) obj);
            case 5:
                return CredentialProviderBeginSignInController.handleResponse$lambda$2((CredentialProviderBeginSignInController) obj2, (k95) obj);
            case 6:
                return CredentialProviderBeginSignInController.handleResponse$lambda$3((CredentialProviderBeginSignInController) obj2, (rya) obj);
            case 7:
                return CredentialProviderBeginSignInController.handleResponse$lambda$5((CredentialProviderBeginSignInController) obj2, (GetCredentialUnknownException) obj);
            case 8:
                return CredentialProviderCreatePasswordController.handleResponse$lambda$2((CredentialProviderCreatePasswordController) obj2, (bf2) obj);
            case 9:
                return CredentialProviderCreatePasswordController.invokePlayServices$lambda$2$0((CredentialProviderCreatePasswordController) obj2, (CreateCredentialException) obj);
            case 10:
                return CredentialProviderCreatePublicKeyCredentialController.handleResponse$lambda$5((CredentialProviderCreatePublicKeyCredentialController) obj2, (JSONException) obj);
            case 11:
                return CredentialProviderCreatePublicKeyCredentialController.handleResponse$lambda$6((CredentialProviderCreatePublicKeyCredentialController) obj2, (Throwable) obj);
            case 12:
                return CredentialProviderCreatePublicKeyCredentialController.handleResponse$lambda$4((CredentialProviderCreatePublicKeyCredentialController) obj2, (bf2) obj);
            case 13:
                return CredentialProviderGetSignInIntentController.handleResponse$lambda$2((CredentialProviderGetSignInIntentController) obj2, (k95) obj);
            case 14:
                return CredentialProviderGetSignInIntentController.handleResponse$lambda$3((CredentialProviderGetSignInIntentController) obj2, (rya) obj);
            case 15:
                return CredentialProviderGetSignInIntentController.handleResponse$lambda$5((CredentialProviderGetSignInIntentController) obj2, (GetCredentialUnknownException) obj);
            case 16:
                return CredentialProviderGetSignInIntentController.invokePlayServices$lambda$0((CredentialProviderGetSignInIntentController) obj2, (GetCredentialUnsupportedException) obj);
            case 17:
                ((jl2) obj2).a(((ol2) ((pl2) obj)).d);
                return c1eVar;
            case 18:
                ((x45) obj2).invoke((ml2) obj);
                return c1eVar;
            case 19:
                return ((s0) obj2).invoke(((zw2) obj).a());
            case 20:
                UUID uuid = (UUID) obj;
                vv8 vv8VarA = ((zw2) obj2).a();
                vv8VarA.getClass();
                uuid.getClass();
                LinkedHashSet linkedHashSet = new LinkedHashSet();
                Iterator it2 = vv8VarA.b.entrySet().iterator();
                while (it2.hasNext()) {
                    uv8 uv8Var = (uv8) ((Map.Entry) it2.next()).getValue();
                    uv8Var.getClass();
                    ArrayList arrayList = uv8Var.b;
                    Iterator it3 = arrayList.iterator();
                    int i2 = 0;
                    while (true) {
                        if (!it3.hasNext()) {
                            i2 = -1;
                        } else if (!uuid.equals(((twa) it3.next()).c)) {
                            i2++;
                        }
                    }
                    int i3 = 5;
                    if (i2 == -1) {
                        sv0Var = new sv0(ny3.a, z, i3);
                    } else {
                        int size = arrayList.size();
                        twa twaVar = uv8Var.a;
                        boolean z2 = true;
                        if (size == 1) {
                            sv0Var = new sv0(twaVar.a(), z2, i3);
                        } else {
                            String str = ((twa) arrayList.remove(i2)).a;
                            int size2 = arrayList.size();
                            twa twaVar2 = null;
                            for (int iMax = Math.max(0, i2 - 1); iMax < size2; iMax++) {
                                twa twaVar3 = (twa) arrayList.get(iMax);
                                twaVar2 = twaVar2 == null ? twaVar3 : (twa) twaVar2.b(twaVar3).a;
                            }
                            twaVar2.getClass();
                            uv8Var.a = twaVar2;
                            twaVar.getClass();
                            Map map = twaVar.b;
                            Map map2 = twaVar2.b;
                            String str2 = twaVar.a;
                            String str3 = twaVar2.a;
                            if (!g76.L(str2, str3)) {
                                throw new IllegalStateException(("Cannot compute changed keys on record with different keys: '" + str2 + "' - '" + str3 + '\'').toString());
                            }
                            Set setKeySet = map.keySet();
                            Set setKeySet2 = map2.keySet();
                            Set setC0 = bu1.C0(setKeySet, setKeySet2);
                            LinkedHashSet linkedHashSetV = qo7.v(qo7.t(setKeySet, setC0), qo7.t(setKeySet2, setC0));
                            ArrayList arrayList2 = new ArrayList();
                            for (Object obj3 : setC0) {
                                String str4 = (String) obj3;
                                if (!g76.L(map.get(str4), map2.get(str4))) {
                                    arrayList2.add(obj3);
                                }
                            }
                            LinkedHashSet linkedHashSetV2 = qo7.v(linkedHashSetV, arrayList2);
                            ArrayList arrayList3 = new ArrayList(cu1.k0(linkedHashSetV2, 10));
                            Iterator it4 = linkedHashSetV2.iterator();
                            while (it4.hasNext()) {
                                arrayList3.add(str2 + '.' + ((String) it4.next()));
                            }
                            sv0Var = new sv0(bu1.q1(arrayList3), z, i3);
                        }
                    }
                    linkedHashSet.addAll((Set) sv0Var.c);
                    if (sv0Var.b) {
                        it2.remove();
                    }
                }
                return linkedHashSet;
            case 21:
                vv8 vv8VarA2 = ((zw2) obj2).a();
                vv8VarA2.getClass();
                ArrayList arrayList4 = new ArrayList();
                for (twa twaVar4 : (ArrayList) obj) {
                    twaVar4.getClass();
                    LinkedHashMap linkedHashMap = vv8VarA2.b;
                    String str5 = twaVar4.a;
                    uv8 uv8Var2 = (uv8) linkedHashMap.get(str5);
                    if (uv8Var2 == null) {
                        linkedHashMap.put(str5, new uv8(twaVar4));
                        setA = twaVar4.a();
                    } else {
                        f09 f09VarB = uv8Var2.a.b(twaVar4);
                        twa twaVar5 = (twa) f09VarB.a;
                        Set set = (Set) f09VarB.b;
                        uv8Var2.a = twaVar5;
                        uv8Var2.b.add(twaVar4);
                        setA = set;
                    }
                    bu1.n0(setA, arrayList4);
                }
                return bu1.q1(arrayList4);
            case 22:
                return Boolean.valueOf(((zw2) obj2).a().e((i31) obj));
            case 23:
                return new k46(d46.c0(((ygd) obj2).h((hp6) ((m45) obj).invoke())));
            case 24:
                ((fhd) obj2).d.invoke((khd) obj);
                return c1eVar;
            case 25:
                ((x45) obj2).invoke((q53) obj);
                return c1eVar;
            case 26:
                ((u53) obj2).b(((v53) obj).a);
                return c1eVar;
            case 27:
                ((t53) obj2).b((String) obj);
                return c1eVar;
            case 28:
                ((ob3) obj2).i((ba8) obj, false);
                return c1eVar;
            default:
                ((x45) obj2).invoke(((qc3) obj).a);
                return c1eVar;
        }
    }
}
