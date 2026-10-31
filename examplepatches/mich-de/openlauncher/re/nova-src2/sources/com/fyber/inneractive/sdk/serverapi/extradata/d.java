package com.fyber.inneractive.sdk.serverapi.extradata;

import android.util.Base64;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.fyber.inneractive.sdk.bidder.TokenParametersOuterClass$TokenParameters;
import com.fyber.inneractive.sdk.bidder.k;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.config.global.features.g;
import com.fyber.inneractive.sdk.config.global.r;
import com.fyber.inneractive.sdk.config.v;
import com.fyber.inneractive.sdk.config.x;
import com.fyber.inneractive.sdk.config.y;
import com.fyber.inneractive.sdk.external.InneractiveAdManager;
import com.fyber.inneractive.sdk.network.t;
import com.fyber.inneractive.sdk.network.w;
import com.fyber.inneractive.sdk.util.IAlog;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class d {

    /* renamed from: f, reason: collision with root package name */
    public r f31104f;

    /* renamed from: a, reason: collision with root package name */
    public final ConcurrentHashMap f31099a = new ConcurrentHashMap();

    /* renamed from: b, reason: collision with root package name */
    public final AtomicBoolean f31100b = new AtomicBoolean(false);

    /* renamed from: c, reason: collision with root package name */
    public final AtomicBoolean f31101c = new AtomicBoolean(false);

    /* renamed from: d, reason: collision with root package name */
    public final ConcurrentHashMap f31102d = new ConcurrentHashMap();

    /* renamed from: e, reason: collision with root package name */
    public final ConcurrentHashMap f31103e = new ConcurrentHashMap();

    /* renamed from: g, reason: collision with root package name */
    public int f31105g = -1;

    public final TokenParametersOuterClass$TokenParameters a(int i5) throws JSONException {
        if (i5 <= 0) {
            IAlog.a("%sExtra data size limit is invalid: %s", "UserExtraDataManager", Integer.valueOf(i5));
            return null;
        }
        IAlog.a("%sExtra data token size limit: %s", "UserExtraDataManager", Integer.valueOf(i5));
        k kVar = (k) a(TokenParametersOuterClass$TokenParameters.newBuilder(), new a());
        if (kVar == null) {
            IAlog.a("%sExtra data token is empty", "UserExtraDataManager");
            return null;
        }
        TokenParametersOuterClass$TokenParameters tokenParametersOuterClass$TokenParameters = (TokenParametersOuterClass$TokenParameters) kVar.a();
        String strEncodeToString = Base64.encodeToString(tokenParametersOuterClass$TokenParameters.toByteArray(), 2);
        if (strEncodeToString == null) {
            return null;
        }
        int length = strEncodeToString.length();
        IAlog.a("%sExtra data token size is: %s", "UserExtraDataManager", Integer.valueOf(length));
        if (length <= i5) {
            IAlog.a("%sReturning extra data token", "UserExtraDataManager");
            return tokenParametersOuterClass$TokenParameters;
        }
        IAlog.a("%sTrimming extra data from token", "UserExtraDataManager");
        if (this.f31101c.compareAndSet(false, true)) {
            HashMap map = new HashMap();
            map.put("reason", "Token with extra data exceeded limit");
            map.put(UserMetadata.KEYDATA_FILENAME, new JSONArray((Collection) this.f31102d.keySet()));
            a(map);
        }
        return null;
    }

    public final Object a(Object obj, c cVar) throws JSONException {
        Integer num;
        int i5;
        r rVar = this.f31104f;
        if (rVar != null) {
            Boolean boolC = ((g) rVar.a(g.class)).c("enable");
            boolean zBooleanValue = boolC != null ? boolC.booleanValue() : false;
            IAlog.a("ExtraDataFeature %s", String.valueOf(zBooleanValue));
            if (zBooleanValue) {
                if (this.f31102d.isEmpty()) {
                    return null;
                }
                for (Map.Entry entry : this.f31102d.entrySet()) {
                    String str = (String) entry.getKey();
                    String str2 = (String) entry.getValue();
                    if (!this.f31103e.containsKey(str)) {
                        if (str != null) {
                            Set hashSet = (Set) this.f31099a.get("unsupported_keys");
                            if (hashSet == null) {
                                hashSet = new HashSet();
                            }
                            hashSet.add(str);
                            this.f31099a.put("unsupported_keys", hashSet);
                        }
                        IAlog.a("%sCould not set extra data for unsupported key: %s", "UserExtraDataManager", str);
                        this.f31102d.remove(str);
                    } else {
                        if (this.f31105g == -1) {
                            v vVar = IAConfigManager.Q.f27761u;
                            if (vVar == null) {
                                IAlog.b("%sGlobalConfigResolver is null, cannot resolve ExtraDataValueMaxLength", new Object[0]);
                            } else {
                                com.fyber.inneractive.sdk.config.r rVar2 = vVar.f27936b;
                                rVar2.getClass();
                                int i11 = EventBridgeChannel.QUEUE_CAPACITY;
                                try {
                                    i5 = Integer.parseInt(rVar2.a("edvml", Integer.toString(EventBridgeChannel.QUEUE_CAPACITY)));
                                } catch (Throwable unused) {
                                    i5 = 512;
                                }
                                if (i5 >= 1) {
                                    i11 = i5;
                                }
                                this.f31105g = i11;
                                IAlog.a("%sExtraDataValueMaxLength: %s", "UserExtraDataManager", Integer.valueOf(i11));
                            }
                        }
                        if (str2.length() > this.f31105g) {
                            if (str != null) {
                                Set hashSet2 = (Set) this.f31099a.get("value_too_long_keys");
                                if (hashSet2 == null) {
                                    hashSet2 = new HashSet();
                                }
                                hashSet2.add(str);
                                this.f31099a.put("value_too_long_keys", hashSet2);
                            }
                            IAlog.a("%sCould not set extra data for key: %s, value is too long", "UserExtraDataManager", str);
                            this.f31102d.remove(str);
                        } else {
                            if (str != null && (num = (Integer) this.f31103e.get(str)) != null) {
                                if (num.intValue() == 1) {
                                    if (!InneractiveAdManager.isCurrentUserAChild()) {
                                        y yVar = x.f27950a.f27966b;
                                        if (yVar != null ? yVar.f27952b : false) {
                                        }
                                    }
                                }
                                try {
                                    cVar.a(str, str2, obj);
                                } catch (Exception e3) {
                                    IAlog.b("%sCouldn't process entry for %s. %s", "UserExtraDataManager", str, e3.getMessage());
                                }
                            }
                            IAlog.a("%sCould not set extra data for key: %s, limited tracking is on", "UserExtraDataManager", str);
                            this.f31102d.remove(str);
                        }
                    }
                }
                if (!this.f31099a.isEmpty() && this.f31100b.compareAndSet(false, true)) {
                    HashMap map = new HashMap();
                    map.put("reason", "Publisher failed to set extra data");
                    for (Map.Entry entry2 : this.f31099a.entrySet()) {
                        if (entry2.getValue() != null) {
                            map.put((String) entry2.getKey(), new JSONArray((Collection) new ArrayList((Collection) entry2.getValue())));
                        }
                    }
                    a(map);
                }
                if (cVar.a(obj)) {
                    return null;
                }
                return obj;
            }
        }
        IAlog.a("%sFeature is disabled, not providing extra data", "UserExtraDataManager");
        return null;
    }

    public static void a(HashMap map) throws JSONException {
        w wVar = new w(t.FIRST_PARTY_EXTRA_DATA_ERROR);
        JSONObject jSONObject = new JSONObject();
        for (Map.Entry entry : map.entrySet()) {
            String str = (String) entry.getKey();
            Object value = entry.getValue();
            try {
                jSONObject.put(str, value);
            } catch (Exception unused) {
                IAlog.f("Got exception adding param to json object: %s, %s", str, value);
            }
        }
        wVar.f28823f.put(jSONObject);
        wVar.a((String) null);
    }
}
