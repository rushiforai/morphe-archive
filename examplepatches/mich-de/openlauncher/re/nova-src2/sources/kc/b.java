package kc;

import android.content.SharedPreferences;
import android.text.TextUtils;
import android.util.Pair;
import b50.d;
import com.digitalturbine.ignite.cl.aidl.IIgniteServiceCallback;
import com.fyber.inneractive.sdk.ignite.l;
import java.io.IOException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Iterator;
import javax.crypto.NoSuchPaddingException;
import l1.a2;
import lc.e;
import m.w;
import nc.c;
import org.json.JSONArray;
import ps.j;

/* loaded from: classes2.dex */
public final class b extends IIgniteServiceCallback.Stub {

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f71325c;

    public b(oc.a aVar) {
        ArrayList arrayList = new ArrayList();
        this.f71325c = arrayList;
        arrayList.add(aVar);
    }

    @Override // com.digitalturbine.ignite.cl.aidl.IIgniteServiceCallback
    public final void onError(String str) {
        rc.a.a("%s : unable to retrieve property: %s", "IgnitePropertyCallback", str);
        Iterator it = this.f71325c.iterator();
        while (it.hasNext()) {
            e eVar = ((oc.a) it.next()).f80312a;
            if (eVar != null) {
                rc.a.a("%s : on one dt error", "OneDTAuthenticator");
                eVar.f74855k.set(true);
                if (eVar.f74848d != null) {
                    rc.a.b("%s : on one dt error : %s", "IgniteManager", str);
                }
            }
        }
    }

    @Override // com.digitalturbine.ignite.cl.aidl.IIgniteServiceCallback
    public final void onProgress(String str) {
    }

    @Override // com.digitalturbine.ignite.cl.aidl.IIgniteServiceCallback
    public final void onScheduled(String str) {
    }

    @Override // com.digitalturbine.ignite.cl.aidl.IIgniteServiceCallback
    public final void onStart(String str) {
    }

    @Override // com.digitalturbine.ignite.cl.aidl.IIgniteServiceCallback
    public final void onSuccess(String str) {
        rc.a.a("%s : property retrieved", "IgnitePropertyCallback");
        Iterator it = this.f71325c.iterator();
        while (it.hasNext()) {
            e eVar = ((oc.a) it.next()).f80312a;
            if (eVar != null) {
                if (TextUtils.isEmpty(str)) {
                    rc.a.a("%s : on one dt error", "OneDTAuthenticator");
                    eVar.f74855k.set(true);
                    if (eVar.f74848d != null) {
                        rc.a.b("%s : on one dt error : %s", "IgniteManager", "One DT is empty");
                    }
                    nc.b bVar = nc.b.FAILED_INIT_ENCRYPTION;
                    nc.a.b(c.RAW_ONE_DT_ERROR, "error_code", "received empty one dt from the service");
                } else {
                    w wVar = eVar.f74849e;
                    wVar.getClass();
                    c cVar = c.ENCRYPTION_EXCEPTION;
                    try {
                        Pair pairA = ((a2) wVar.f75379c).a(str);
                        JSONArray jSONArray = new JSONArray();
                        jSONArray.put(pairA.first).put(pairA.second);
                        ((SharedPreferences) wVar.f75378b).edit().putString("odt", jSONArray.toString()).apply();
                    } catch (IOException e3) {
                        e = e3;
                        nc.a.b(cVar, j.b(e, nc.b.FAILED_STORE_ENCRYPTED_DATA));
                    } catch (InvalidAlgorithmParameterException e11) {
                        e = e11;
                        nc.a.b(cVar, j.b(e, nc.b.FAILED_STORE_ENCRYPTED_DATA));
                    } catch (InvalidKeyException e12) {
                        e = e12;
                        nc.a.b(cVar, j.b(e, nc.b.FAILED_STORE_ENCRYPTED_DATA));
                    } catch (NoSuchAlgorithmException e13) {
                        e = e13;
                        nc.a.b(cVar, j.b(e, nc.b.FAILED_STORE_ENCRYPTED_DATA));
                    } catch (NoSuchPaddingException e14) {
                        e = e14;
                        nc.a.b(cVar, j.b(e, nc.b.FAILED_STORE_ENCRYPTED_DATA));
                    } catch (Exception e15) {
                        nc.a.b(cVar, j.b(e15, nc.b.FAILED_STORE_ENCRYPTED_DATA));
                    }
                    eVar.f74850f.getClass();
                    jc.b bVarF = d.f(str);
                    eVar.f74851g = bVarF;
                    l lVar = eVar.f74848d;
                    if (lVar != null) {
                        rc.a.a("%s : setting one dt entity", "IgniteManager");
                        lVar.f69430b = bVarF;
                    }
                }
            }
        }
    }
}
