package defpackage;

import android.content.SharedPreferences;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class s40 implements bf5 {
    public final /* synthetic */ int a;

    public /* synthetic */ s40(int i) {
        this.a = i;
    }

    @Override // defpackage.bf5
    public final void a(if5 if5Var) {
        switch (this.a) {
            case 0:
                int i = t40.p;
                b94 b94Var = if5Var.c;
                boolean zBooleanValue = false;
                Object obj = null;
                linkedHashMap = null;
                linkedHashMap = null;
                linkedHashMap = null;
                linkedHashMap = null;
                linkedHashMap = null;
                linkedHashMap = null;
                linkedHashMap = null;
                linkedHashMap = null;
                LinkedHashMap linkedHashMap = null;
                if (b94Var != null) {
                    z46 z46Var = f87.b;
                    z46.s(i87.APP_EVENTS, "t40", " \n\nGraph Response Error: \n================\nResponse Error: %s\nResponse Error Exception: %s\n\n ", b94Var.toString(), String.valueOf(b94Var.i));
                    if (!ec2.a.contains(t40.class)) {
                        try {
                            SharedPreferences sharedPreferences = f94.a().getSharedPreferences("com.facebook.sdk.CloudBridgeSavedCredentials", 0);
                            if (sharedPreferences != null) {
                                x1c x1cVar = x1c.DATASETID;
                                String string = sharedPreferences.getString(x1cVar.getRawValue(), null);
                                x1c x1cVar2 = x1c.URL;
                                String string2 = sharedPreferences.getString(x1cVar2.getRawValue(), null);
                                x1c x1cVar3 = x1c.ACCESSKEY;
                                String string3 = sharedPreferences.getString(x1cVar3.getRawValue(), null);
                                if (string != null && !muc.b0(string) && string2 != null && !muc.b0(string2) && string3 != null && !muc.b0(string3)) {
                                    LinkedHashMap linkedHashMap2 = new LinkedHashMap();
                                    linkedHashMap2.put(x1cVar2.getRawValue(), string2);
                                    linkedHashMap2.put(x1cVar.getRawValue(), string);
                                    linkedHashMap2.put(x1cVar3.getRawValue(), string3);
                                    linkedHashMap = linkedHashMap2;
                                }
                            }
                        } catch (Throwable th) {
                            ec2.a(t40.class, th);
                        }
                    }
                    if (linkedHashMap != null) {
                        URL url = new URL(String.valueOf(linkedHashMap.get(x1c.URL.getRawValue())));
                        e50.c = new c50(String.valueOf(linkedHashMap.get(x1c.DATASETID.getRawValue())), url.getProtocol() + "://" + url.getHost(), String.valueOf(linkedHashMap.get(x1c.ACCESSKEY.getRawValue())));
                        e50.d = new ArrayList();
                        t40.a = true;
                    }
                } else {
                    z46 z46Var2 = f87.b;
                    i87 i87Var = i87.APP_EVENTS;
                    z46.s(i87Var, "t40", " \n\nGraph Response Received: \n================\n%s\n\n ", if5Var);
                    JSONObject jSONObject = if5Var.b;
                    if (jSONObject != null) {
                        try {
                            obj = jSONObject.get("data");
                        } catch (NullPointerException e) {
                            z46 z46Var3 = f87.b;
                            z46.s(i87.APP_EVENTS, "t40", "CloudBridge Settings API response is not a valid json: \n%s ", kyd.h0(e));
                            return;
                        } catch (JSONException e2) {
                            z46 z46Var4 = f87.b;
                            z46.s(i87.APP_EVENTS, "t40", "CloudBridge Settings API response is not a valid json: \n%s ", kyd.h0(e2));
                            return;
                        }
                    }
                    obj.getClass();
                    HashMap mapL = epe.l(new JSONObject((String) bu1.z0(epe.k((JSONArray) obj))));
                    String str = (String) mapL.get(x1c.URL.getRawValue());
                    String str2 = (String) mapL.get(x1c.DATASETID.getRawValue());
                    String str3 = (String) mapL.get(x1c.ACCESSKEY.getRawValue());
                    if (str == null || str2 == null || str3 == null) {
                        z46.q(i87Var, "t40", "CloudBridge Settings API response doesn't have valid data");
                    } else {
                        try {
                            e50.c = new c50(str2, str, str3);
                            e50.d = new ArrayList();
                            t40.O(mapL);
                            x1c x1cVar4 = x1c.ENABLED;
                            if (mapL.get(x1cVar4.getRawValue()) != null) {
                                Object obj2 = mapL.get(x1cVar4.getRawValue());
                                obj2.getClass();
                                zBooleanValue = ((Boolean) obj2).booleanValue();
                            }
                            t40.a = zBooleanValue;
                        } catch (MalformedURLException e3) {
                            z46 z46Var5 = f87.b;
                            z46.s(i87.APP_EVENTS, "t40", "CloudBridge Settings API response doesn't have valid url\n %s ", kyd.h0(e3));
                            return;
                        }
                    }
                }
                break;
            default:
                z46 z46Var6 = f87.b;
                z46.q(i87.APP_EVENTS, jue.a(), "App index sent to FB!");
                break;
        }
    }
}
