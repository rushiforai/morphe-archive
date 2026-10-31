package com.bytedance.sdk.openadsdk.activity.single;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.Toast;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.x;
import com.bytedance.sdk.component.utils.wwx;
import com.bytedance.sdk.openadsdk.common.TTAdDislikeToast;
import com.bytedance.sdk.openadsdk.component.reward.ycx.uh;
import com.bytedance.sdk.openadsdk.core.av;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.syc;
import com.bytedance.sdk.openadsdk.core.widget.zb;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.bytedance.sdk.openadsdk.utils.wie;
import com.bytedance.sdk.openadsdk.utils.yzp;
import com.bytedance.sdk.openadsdk.xkz.ycx.ycx.sya;
import com.bytedance.sdk.openadsdk.xkz.ycx.zb;
import com.bytedance.sdk.openadsdk.xkz.ycx.zb.ycx;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public class TTHistoryActivity extends TTBaseActivity {

    /* renamed from: dj, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.core.lt.dj f24349dj;

    /* renamed from: ea, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.core.lt.lud f24351ea;
    private String fby;

    /* renamed from: jc, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.xkz.ycx.zb.zb f24352jc;

    /* renamed from: lt, reason: collision with root package name */
    private String f24354lt;
    private String lud;

    /* renamed from: ok, reason: collision with root package name */
    private FrameLayout f24355ok;

    /* renamed from: ry, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.xkz.ycx.zb f24356ry;
    private com.bytedance.sdk.openadsdk.core.lt.dj sya;
    private boolean syc;

    /* renamed from: ul, reason: collision with root package name */
    private String f24357ul;
    private tn xkz;

    /* renamed from: zb, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.core.lt.sya f24358zb;

    /* renamed from: jw, reason: collision with root package name */
    private ArrayList<com.bytedance.sdk.openadsdk.xkz.ycx.ycx> f24353jw = new ArrayList<>();

    /* renamed from: dy, reason: collision with root package name */
    private final String f24350dy = "is_new_style";
    int ycx = -1;

    /* renamed from: com.bytedance.sdk.openadsdk.activity.single.TTHistoryActivity$7, reason: invalid class name */
    public class AnonymousClass7 implements zb.InterfaceC0090zb {
        final /* synthetic */ com.bytedance.sdk.openadsdk.core.widget.zb ycx;

        public AnonymousClass7(com.bytedance.sdk.openadsdk.core.widget.zb zbVar) {
            this.ycx = zbVar;
        }

        @Override // com.bytedance.sdk.openadsdk.core.widget.zb.InterfaceC0090zb
        public void ycx() {
            try {
                com.bytedance.sdk.openadsdk.xkz.ycx.ycx.sya.ycx().ycx(new sya.ycx() { // from class: com.bytedance.sdk.openadsdk.activity.single.TTHistoryActivity.7.1
                    @Override // com.bytedance.sdk.openadsdk.xkz.ycx.ycx.sya.ycx
                    public void ycx() {
                        TTHistoryActivity.this.runOnUiThread(new Runnable() { // from class: com.bytedance.sdk.openadsdk.activity.single.TTHistoryActivity.7.1.1
                            @Override // java.lang.Runnable
                            public void run() {
                                TTHistoryActivity.this.f24353jw.clear();
                                if (com.bytedance.sdk.openadsdk.dv.lud.ycx("lp_iab_cookie", true)) {
                                    TTAdDislikeToast tTAdDislikeToast = new TTAdDislikeToast(TTHistoryActivity.this);
                                    ((FrameLayout) TTHistoryActivity.this.findViewById(16908290)).addView(tTAdDislikeToast);
                                    TTHistoryActivity tTHistoryActivity = TTHistoryActivity.this;
                                    tTAdDislikeToast.show(tTHistoryActivity.getString(wwx.zb(tTHistoryActivity, "tt_history_delete_successful")));
                                } else {
                                    TTHistoryActivity tTHistoryActivity2 = TTHistoryActivity.this;
                                    Toast.makeText(tTHistoryActivity2, tTHistoryActivity2.getString(wwx.zb(tTHistoryActivity2, "tt_history_delete_successful")), 0).show();
                                }
                                TTHistoryActivity.this.lud();
                            }
                        });
                        TTHistoryActivity.this.xkz = com.bytedance.sdk.openadsdk.xkz.ycx.ycx.sya.ycx().sya();
                        if (TTHistoryActivity.this.xkz != null) {
                            com.bytedance.sdk.openadsdk.dj.sya.ycx(System.currentTimeMillis(), TTHistoryActivity.this.xkz, "landingpage", "iab_clear_history_all");
                        }
                    }

                    @Override // com.bytedance.sdk.openadsdk.xkz.ycx.ycx.sya.ycx
                    public void ycx(Exception exc) {
                        exc.getMessage();
                    }
                });
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40StCFN5zmMTa9gyYdG0g==", "b9oFnBCoZtWZa9RJhQepPEKqeg==", "VOAdmhC1fc6WT/RRhRKr", 360);
                e3.getMessage();
            }
            this.ycx.dismiss();
        }

        @Override // com.bytedance.sdk.openadsdk.core.widget.zb.InterfaceC0090zb
        public void zb() {
            this.ycx.dismiss();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void lt() {
        com.bytedance.sdk.openadsdk.core.widget.zb zbVar = new com.bytedance.sdk.openadsdk.core.widget.zb(this);
        try {
            this.lud = getString(wwx.zb(this, "tt_history_confirm_maintitle"));
            this.f24354lt = getString(wwx.zb(this, "tt_history_confirm_subtitle"));
            this.f24357ul = getString(wwx.zb(this, "tt_history_cancel"));
            this.fby = getString(wwx.zb(this, "tt_history_delete"));
            zbVar.zb(this.lud).ycx(this.f24354lt).sya(this.fby).dj(this.f24357ul);
            zbVar.ycx(new AnonymousClass7(zbVar)).show();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40StCFN5zmMTa9gyYdG0g==", "b9oFnBCoZtWZa9RJhQepPEI=", "SOYigie5ZcKUT/NUjR2vLw==", 374);
            th2.getMessage();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.activity.single.TTBaseActivity
    public boolean a_() {
        return true;
    }

    @Override // com.bytedance.sdk.openadsdk.activity.single.TTBaseActivity, android.app.Activity
    @SuppressLint({"ClickableViewAccessibility"})
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (!syc.lud()) {
            finish();
            return;
        }
        try {
            pmi.zb(this);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40StCFN5zmMTa9gyYdG0g==", "b9oFnBCoZtWZa9RJhQepPEI=", "VOAOhwa9fcI=", 95);
        }
        try {
            setContentView(zb());
            Intent intent = getIntent();
            this.syc = intent.getBooleanExtra("is_new_style", false);
            this.xkz = av.ycx().ycx(av.ycx(intent));
            if (bundle != null) {
                try {
                    int i5 = bundle.getInt("meta_index", -1);
                    this.ycx = i5;
                    if (i5 >= 0) {
                        this.xkz = av.ycx().ycx(this.ycx);
                    }
                } catch (Throwable th3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40StCFN5zmMTa9gyYdG0g==", "b9oFnBCoZtWZa9RJhQepPEI=", "VOAOhwa9fcI=", 113);
                }
            }
            uh.zb(this, 3);
            this.sya = (com.bytedance.sdk.openadsdk.core.lt.dj) this.f24358zb.findViewById(wie.f27228sg);
            this.f24349dj = (com.bytedance.sdk.openadsdk.core.lt.dj) this.f24358zb.findViewById(520093720);
            this.f24352jc.findViewById(wie.f27183aq);
            this.sya.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.activity.single.TTHistoryActivity.1
                @Override // android.view.View.OnClickListener
                public void onClick(View view) {
                    TTHistoryActivity.this.ycx(view);
                }
            });
            this.f24349dj.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.activity.single.TTHistoryActivity.2
                @Override // android.view.View.OnClickListener
                public void onClick(View view) {
                    TTHistoryActivity.this.finish();
                }
            });
            com.bytedance.sdk.openadsdk.xkz.ycx.zb zbVar = this.f24356ry;
            if (zbVar != null) {
                zbVar.ycx(new zb.InterfaceC0118zb() { // from class: com.bytedance.sdk.openadsdk.activity.single.TTHistoryActivity.3
                    @Override // com.bytedance.sdk.openadsdk.xkz.ycx.zb.InterfaceC0118zb
                    public void ycx(com.bytedance.sdk.openadsdk.xkz.ycx.ycx ycxVar) {
                        if (TTHistoryActivity.this.syc) {
                            TTHistoryActivity.this.ycx(ycxVar.ul(), ycxVar.lud(), ycxVar.zb());
                        } else {
                            TTHistoryLandingPageActivity.ycx(TTHistoryActivity.this, ycxVar.ul(), ycxVar.lud(), ycxVar.zb());
                        }
                        TTHistoryActivity.this.finish();
                    }
                });
            }
            sya();
            lud();
        } catch (Throwable th4) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th4, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40StCFN5zmMTa9gyYdG0g==", "b9oFnBCoZtWZa9RJhQepPEI=", "VOAOhwa9fcI=", 99);
            finish();
        }
    }

    @Override // android.app.Activity
    public void onSaveInstanceState(Bundle bundle) {
        if (bundle == null) {
            bundle = new Bundle();
        }
        try {
            int iYcx = this.xkz != null ? av.ycx().ycx(this.xkz) : -1;
            this.ycx = iYcx;
            bundle.putInt("meta_index", iYcx);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40StCFN5zmMTa9gyYdG0g==", "b9oFnBCoZtWZa9RJhQepPEI=", "VOAelBW5QMmTXtZTjxSTPFr6KA==", 388);
        }
        super.onSaveInstanceState(bundle);
    }

    @Override // android.app.Activity
    public void onStart() {
        super.onStart();
        if (this.ycx >= 0) {
            av.ycx().sya(this.ycx);
            this.ycx = -1;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void lud() {
        if (this.f24353jw.isEmpty()) {
            com.bytedance.sdk.openadsdk.xkz.ycx.zb.zb zbVar = this.f24352jc;
            if (zbVar != null) {
                zbVar.ycx();
                this.f24352jc.setVisibility(0);
            }
            this.sya.setVisibility(8);
        } else {
            this.sya.setVisibility(0);
            this.f24355ok.setVisibility(0);
            com.bytedance.sdk.openadsdk.xkz.ycx.zb.zb zbVar2 = this.f24352jc;
            if (zbVar2 != null) {
                zbVar2.setVisibility(8);
            }
        }
        com.bytedance.sdk.openadsdk.xkz.ycx.zb zbVar3 = this.f24356ry;
        if (zbVar3 != null) {
            zbVar3.ycx(this.f24353jw);
        }
    }

    private void sya() {
        com.bytedance.sdk.openadsdk.xkz.ycx.ycx.sya.ycx().ycx(new sya.zb() { // from class: com.bytedance.sdk.openadsdk.activity.single.TTHistoryActivity.5
            @Override // com.bytedance.sdk.openadsdk.xkz.ycx.ycx.sya.zb
            public void ycx(List<com.bytedance.sdk.openadsdk.xkz.ycx.ycx> list) {
                if (list != null) {
                    TTHistoryActivity.this.f24353jw.addAll(list);
                    TTHistoryActivity.this.runOnUiThread(new Runnable() { // from class: com.bytedance.sdk.openadsdk.activity.single.TTHistoryActivity.5.1
                        @Override // java.lang.Runnable
                        public void run() {
                            TTHistoryActivity.this.lud();
                        }
                    });
                }
            }
        });
    }

    private View zb() {
        com.bytedance.sdk.openadsdk.core.lt.sya syaVar = new com.bytedance.sdk.openadsdk.core.lt.sya(this);
        if (Build.VERSION.SDK_INT >= 35) {
            syaVar.setFitsSystemWindows(true);
        }
        com.bytedance.sdk.openadsdk.core.lt.lud ludVar = new com.bytedance.sdk.openadsdk.core.lt.lud(this);
        this.f24351ea = ludVar;
        ludVar.setOrientation(1);
        syaVar.addView(this.f24351ea, new FrameLayout.LayoutParams(-1, -1));
        this.f24351ea.setId(wie.f27237ur);
        this.f24351ea.setPadding(0, dc.zb(this, 12.0f), 0, 0);
        this.f24358zb = new com.bytedance.sdk.openadsdk.common.uh(this);
        this.f24351ea.addView(this.f24358zb, new LinearLayout.LayoutParams(-1, dc.zb(this, 44.0f)));
        FrameLayout frameLayout = new FrameLayout(this);
        this.f24355ok = frameLayout;
        frameLayout.setLayoutParams(new LinearLayout.LayoutParams(-1, -1));
        RecyclerView recyclerView = new RecyclerView(this);
        recyclerView.setId(wie.f27241wr);
        recyclerView.setLayoutManager(new LinearLayoutManager());
        com.bytedance.sdk.openadsdk.xkz.ycx.zb zbVar = new com.bytedance.sdk.openadsdk.xkz.ycx.zb(this);
        this.f24356ry = zbVar;
        recyclerView.setAdapter(zbVar);
        recyclerView.addItemDecoration(new x(this));
        this.f24355ok.addView(recyclerView, new FrameLayout.LayoutParams(-1, -1));
        com.bytedance.sdk.openadsdk.xkz.ycx.zb.zb zbVar2 = new com.bytedance.sdk.openadsdk.xkz.ycx.zb.zb(this);
        this.f24352jc = zbVar2;
        zbVar2.setId(wie.f27183aq);
        this.f24355ok.addView(this.f24352jc, new FrameLayout.LayoutParams(-1, -1));
        this.f24351ea.addView(this.f24355ok);
        return syaVar;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(String str, final String str2, final int i5) {
        if (!TextUtils.isEmpty(str) && i5 >= 0) {
            com.bytedance.sdk.openadsdk.xkz.ycx.ycx.sya.ycx().ycx(str, new sya.InterfaceC0116sya() { // from class: com.bytedance.sdk.openadsdk.activity.single.TTHistoryActivity.4
                @Override // com.bytedance.sdk.openadsdk.xkz.ycx.ycx.sya.InterfaceC0116sya
                public void ycx(final String str3) {
                    yzp.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.activity.single.TTHistoryActivity.4.1
                        @Override // java.lang.Runnable
                        public void run() {
                            int i11;
                            List<tn> listZb = com.bytedance.sdk.openadsdk.xkz.ycx.ycx.sya.zb(str3);
                            tn tnVar = (listZb == null || (i11 = i5) < 0 || i11 >= listZb.size()) ? null : listZb.get(i5);
                            if (tnVar == null) {
                                TTHistoryActivity.this.finish();
                            } else {
                                AnonymousClass4 anonymousClass4 = AnonymousClass4.this;
                                IABLandingPageActivity.zb(TTHistoryActivity.this, tnVar, str2);
                            }
                        }
                    });
                }

                @Override // com.bytedance.sdk.openadsdk.xkz.ycx.ycx.sya.InterfaceC0116sya
                public void zb(String str3) {
                    yzp.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.activity.single.TTHistoryActivity.4.2
                        @Override // java.lang.Runnable
                        public void run() {
                            TTHistoryActivity.this.finish();
                        }
                    });
                }
            });
        } else {
            finish();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(View view) {
        final com.bytedance.sdk.openadsdk.xkz.ycx.zb.ycx ycxVar = new com.bytedance.sdk.openadsdk.xkz.ycx.zb.ycx(this);
        ycxVar.setOnMenuItemClickListener(new ycx.InterfaceC0117ycx() { // from class: com.bytedance.sdk.openadsdk.activity.single.TTHistoryActivity.6
            @Override // com.bytedance.sdk.openadsdk.xkz.ycx.zb.ycx.InterfaceC0117ycx
            public void ycx() {
                TTHistoryActivity.this.lt();
                ycxVar.ycx();
            }

            @Override // com.bytedance.sdk.openadsdk.xkz.ycx.zb.ycx.InterfaceC0117ycx
            public void zb() {
                ycxVar.ycx();
            }
        });
        ycxVar.ycx(view);
    }
}
