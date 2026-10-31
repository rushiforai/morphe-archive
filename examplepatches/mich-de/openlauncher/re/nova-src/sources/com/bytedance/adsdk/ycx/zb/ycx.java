package com.bytedance.adsdk.ycx.zb;

import com.bytedance.adsdk.ycx.zb.sya.ycx.dj;
import com.bytedance.adsdk.ycx.zb.sya.ycx.fby;
import com.bytedance.adsdk.ycx.zb.sya.ycx.jc;
import com.bytedance.adsdk.ycx.zb.sya.ycx.jw;
import com.bytedance.adsdk.ycx.zb.sya.ycx.lt;
import com.bytedance.adsdk.ycx.zb.sya.ycx.lud;
import com.bytedance.adsdk.ycx.zb.sya.ycx.sya;
import com.bytedance.adsdk.ycx.zb.sya.ycx.ul;
import com.bytedance.adsdk.ycx.zb.sya.ycx.zb;
import java.util.ArrayList;
import java.util.Deque;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx {
    private static final com.bytedance.adsdk.ycx.zb.sya.ycx ycx;

    /* renamed from: dj, reason: collision with root package name */
    private Deque<com.bytedance.adsdk.ycx.zb.zb.ycx> f22822dj = new LinkedList();
    private String lud;
    private com.bytedance.adsdk.ycx.zb.zb.ycx sya;

    /* renamed from: zb, reason: collision with root package name */
    private final com.bytedance.adsdk.ycx.zb.sya.ycx f22823zb;

    static {
        int i5 = 8;
        lt[] ltVarArr = {new jc(), new dj(), new jw(), new zb(), new lud(), new com.bytedance.adsdk.ycx.zb.sya.ycx.ycx(), new ul(), new sya(), new fby()};
        final com.bytedance.adsdk.ycx.zb.sya.ycx ycxVar = new com.bytedance.adsdk.ycx.zb.sya.ycx() { // from class: com.bytedance.adsdk.ycx.zb.ycx.1
            @Override // com.bytedance.adsdk.ycx.zb.sya.ycx
            public int ycx(String str, int i11, Deque<com.bytedance.adsdk.ycx.zb.zb.ycx> deque) {
                return i11;
            }
        };
        while (i5 >= 0) {
            final lt ltVar = ltVarArr[i5];
            i5--;
            ycxVar = new com.bytedance.adsdk.ycx.zb.sya.ycx() { // from class: com.bytedance.adsdk.ycx.zb.ycx.2
                @Override // com.bytedance.adsdk.ycx.zb.sya.ycx
                public int ycx(String str, int i11, Deque<com.bytedance.adsdk.ycx.zb.zb.ycx> deque) {
                    return ltVar.ycx(str, i11, deque, ycxVar);
                }
            };
        }
        ycx = ycxVar;
    }

    private ycx(String str, com.bytedance.adsdk.ycx.zb.sya.ycx ycxVar) {
        this.f22823zb = ycxVar;
        this.lud = str;
        try {
            ycx();
        } catch (Exception e3) {
            throw new com.bytedance.adsdk.ycx.ycx.zb(str, e3);
        }
    }

    public static ycx ycx(String str) {
        return new ycx(str, ycx);
    }

    private void ycx() {
        int length = this.lud.length();
        int i5 = 0;
        while (i5 < length) {
            int iYcx = this.f22823zb.ycx(this.lud, i5, this.f22822dj);
            if (iYcx == i5) {
                throw new IllegalArgumentException("Unrecognized expression, unrecognized characters encountered during parsing:" + this.lud.substring(0, i5));
            }
            i5 = iYcx;
        }
        ArrayList arrayList = new ArrayList();
        while (true) {
            com.bytedance.adsdk.ycx.zb.zb.ycx ycxVarPollFirst = this.f22822dj.pollFirst();
            if (ycxVarPollFirst == null) {
                this.sya = com.bytedance.adsdk.ycx.zb.lud.zb.ycx(arrayList, this.lud, i5);
                this.f22822dj = null;
                return;
            }
            arrayList.add(0, ycxVarPollFirst);
        }
    }

    public <T> T ycx(JSONObject jSONObject) {
        HashMap map = new HashMap();
        map.put("default_key", jSONObject);
        return (T) ycx(map);
    }

    public <T> T ycx(Map<String, JSONObject> map) {
        return (T) this.sya.ycx(map);
    }
}
