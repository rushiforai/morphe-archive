package com.fyber.inneractive.sdk.config.global;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.util.IAlog;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public abstract class g {
    public static JSONArray a(Map map, boolean z11) throws JSONException {
        d dVar;
        JSONArray jSONArray = new JSONArray();
        try {
            for (com.fyber.inneractive.sdk.config.global.features.i iVar : map.values()) {
                iVar.getClass();
                ArrayList arrayList = new ArrayList(iVar.f27819c.values());
                HashMap map2 = iVar.f27820d;
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    b bVar = (b) it.next();
                    JSONObject jSONObject = new JSONObject();
                    String str = bVar != null ? bVar.f27805a : null;
                    if (!TextUtils.isEmpty(str)) {
                        k kVar = (k) map2.get(str);
                        jSONObject.put("id", str);
                        if (kVar != null) {
                            jSONObject.put("v", kVar.f27829b);
                        } else {
                            jSONObject.put("v", "control");
                        }
                        if (z11) {
                            Iterator it2 = bVar.f27808d.iterator();
                            while (true) {
                                if (!it2.hasNext()) {
                                    dVar = null;
                                    break;
                                }
                                dVar = (d) it2.next();
                                if (c.class.equals(dVar.getClass())) {
                                    break;
                                }
                            }
                            if (dVar != null && ((c) dVar).f27810b) {
                                HashSet hashSet = ((c) dVar).f27809a;
                                JSONArray jSONArray2 = new JSONArray();
                                Iterator it3 = hashSet.iterator();
                                while (it3.hasNext()) {
                                    jSONArray2.put((Long) it3.next());
                                }
                                if (jSONArray2.length() > 0) {
                                    jSONObject.put("d", jSONArray2);
                                }
                            }
                        }
                        jSONArray.put(jSONObject);
                    }
                }
            }
            return jSONArray;
        } catch (JSONException e3) {
            IAlog.a("ExperimentParamBuilder: Json exception during experiments Json build!", new Object[0]);
            if (IAlog.f31163a <= 3) {
                e3.printStackTrace();
            }
            return null;
        }
    }
}
