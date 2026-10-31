package com.bytedance.sdk.openadsdk.activity.single;

import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.Window;
import android.view.WindowManager;
import com.bytedance.sdk.openadsdk.core.av;
import com.bytedance.sdk.openadsdk.core.dj.ul;
import com.bytedance.sdk.openadsdk.core.jc;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.rmf;
import com.bytedance.sdk.openadsdk.core.syc;
import com.tiktok.util.TTConst;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes2.dex */
public class TTDelegateActivity extends TTBaseActivity {

    /* renamed from: dj, reason: collision with root package name */
    private static final Map<String, ul.ycx> f24343dj = Collections.synchronizedMap(new HashMap());
    private rmf sya;
    tn ycx = null;

    /* renamed from: zb, reason: collision with root package name */
    private Intent f24344zb;

    private void lud() {
        int intExtra = this.f24344zb.getIntExtra(TTConst.TRACK_TYPE, 0);
        if (intExtra != 1) {
            if (intExtra != 6) {
                finish();
                return;
            }
            if (this.ycx == null) {
                this.ycx = av.ycx().ycx(av.ycx(this.f24344zb));
            }
            tn tnVar = this.ycx;
            if (tnVar == null) {
                finish();
            } else {
                ycx(tnVar.pks(), com.bytedance.sdk.openadsdk.tool.ycx.ycx(this.ycx.hti()), this.f24344zb.getStringExtra("closed_listener_key"), this.ycx);
            }
        }
    }

    private void sya() {
        Window window = getWindow();
        WindowManager.LayoutParams attributes = window.getAttributes();
        attributes.alpha = 0.0f;
        window.setAttributes(attributes);
    }

    @Override // com.bytedance.sdk.openadsdk.activity.single.TTBaseActivity, android.app.Activity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (!syc.lud()) {
            finish();
            return;
        }
        sya();
        this.f24344zb = getIntent();
        if (pmi.ycx() == null) {
            pmi.zb(this);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.activity.single.TTBaseActivity, android.app.Activity
    public void onDestroy() {
        super.onDestroy();
        rmf rmfVar = this.sya;
        if (rmfVar != null) {
            rmfVar.zb();
        }
    }

    @Override // android.app.Activity
    public void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        if (pmi.ycx() == null) {
            pmi.zb(this);
        }
        setIntent(intent);
        this.f24344zb = intent;
    }

    @Override // com.bytedance.sdk.openadsdk.activity.single.TTBaseActivity, android.app.Activity
    public void onResume() throws IllegalAccessException, NoSuchFieldException, SecurityException, IllegalArgumentException {
        super.onResume();
        rmf rmfVar = this.sya;
        if ((rmfVar == null || ((com.bytedance.sdk.openadsdk.sya.sya) rmfVar).ycx == null || !((com.bytedance.sdk.openadsdk.sya.sya) rmfVar).ycx.isShowing()) && this.f24344zb != null) {
            lud();
        }
    }

    public static void ycx(tn tnVar, String str, ul.ycx ycxVar) {
        if (tnVar == null) {
            return;
        }
        Intent intent = new Intent(pmi.ycx(), (Class<?>) TTDelegateActivity.class);
        intent.addFlags(268435456);
        intent.putExtra(TTConst.TRACK_TYPE, 6);
        intent.putExtra("closed_listener_key", str);
        intent.putExtra("meta_index", av.ycx().ycx(tnVar));
        if (ycxVar != null) {
            f24343dj.put(str, ycxVar);
        }
        com.bytedance.sdk.component.utils.zb.ycx(pmi.ycx(), intent, null);
    }

    public static void ycx(tn tnVar, String str) {
        ycx(tnVar, str, null);
    }

    private void ycx(String str, String str2, final String str3, tn tnVar) {
        if (str2 != null && str != null && this.sya == null) {
            com.bytedance.sdk.openadsdk.sya.sya syaVar = new com.bytedance.sdk.openadsdk.sya.sya(this, str, com.bytedance.sdk.openadsdk.tool.ycx.ycx(str2), tnVar);
            this.sya = syaVar;
            syaVar.ycx(new rmf.ycx() { // from class: com.bytedance.sdk.openadsdk.activity.single.TTDelegateActivity.1
                @Override // com.bytedance.sdk.openadsdk.core.rmf.ycx
                public void ycx(int i5, String str4) {
                    ul.ycx ycxVarLud;
                    if (TTDelegateActivity.f24343dj != null && TTDelegateActivity.f24343dj.size() > 0 && !TextUtils.isEmpty(str3)) {
                        ul.ycx ycxVar = (ul.ycx) TTDelegateActivity.f24343dj.get(str3);
                        if (ycxVar != null) {
                            ycxVar.ycx();
                        }
                    } else if (!TextUtils.isEmpty(str3) && (ycxVarLud = jc.zb().lud(str3)) != null) {
                        ycxVarLud.ycx();
                        jc.zb().lt(str3);
                    }
                    TTDelegateActivity.this.ycx(str3);
                    TTDelegateActivity.this.finish();
                }

                @Override // com.bytedance.sdk.openadsdk.core.rmf.ycx
                public void ycx() {
                    if (!((com.bytedance.sdk.openadsdk.sya.sya) TTDelegateActivity.this.sya).sya()) {
                        TTDelegateActivity.this.ycx(str3);
                        TTDelegateActivity.this.finish();
                    }
                    ((com.bytedance.sdk.openadsdk.sya.sya) TTDelegateActivity.this.sya).ycx(false);
                }
            });
        }
        rmf rmfVar = this.sya;
        if (rmfVar != null) {
            rmfVar.ycx();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(String str) {
        Map<String, ul.ycx> map = f24343dj;
        if (map == null || TextUtils.isEmpty(str)) {
            return;
        }
        map.remove(str);
        if (com.bytedance.sdk.component.utils.syc.sya()) {
            map.size();
        }
    }
}
