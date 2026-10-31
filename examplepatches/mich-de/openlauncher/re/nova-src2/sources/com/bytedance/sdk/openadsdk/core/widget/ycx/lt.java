package com.bytedance.sdk.openadsdk.core.widget.ycx;

import android.content.Context;
import android.net.Uri;
import android.os.Handler;
import android.os.Message;
import android.os.SystemClock;
import android.text.TextUtils;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.ViewTreeObserver;
import android.webkit.WebBackForwardList;
import android.webkit.WebView;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.component.utils.tru;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.syc;
import com.bytedance.sdk.openadsdk.dy.ycx.ycx;
import com.bytedance.sdk.openadsdk.utils.dc;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

/* loaded from: classes2.dex */
public class lt implements tru.ycx {
    private boolean aeu;

    /* renamed from: dj, reason: collision with root package name */
    WebView f26354dj;

    /* renamed from: dy, reason: collision with root package name */
    long f26356dy;

    /* renamed from: ea, reason: collision with root package name */
    float f26357ea;
    boolean fby;

    /* renamed from: jc, reason: collision with root package name */
    int f26359jc;

    /* renamed from: jw, reason: collision with root package name */
    String f26360jw;

    /* renamed from: ok, reason: collision with root package name */
    float f26362ok;
    boolean pmi;
    private long rmf;

    /* renamed from: ry, reason: collision with root package name */
    float f26363ry;
    float syc;
    private final boolean tru;

    /* renamed from: uh, reason: collision with root package name */
    long f26365uh;

    /* renamed from: ul, reason: collision with root package name */
    boolean f26366ul;
    boolean wie;
    float xkz;
    Context ycx;

    /* renamed from: zb, reason: collision with root package name */
    tn f26367zb;

    /* renamed from: hf, reason: collision with root package name */
    private final Handler f26358hf = new tru(syc.zb().getLooper(), this);
    String sya = "landingpage";

    /* renamed from: lt, reason: collision with root package name */
    int f26361lt = 0;
    private final String bhi = ".*\\/serp\\?sc=.*&clkt=\\d+$";

    /* renamed from: av, reason: collision with root package name */
    private final String f26353av = ".*\\/\\?caf_results=.*&clkt=\\d+$";

    /* renamed from: dv, reason: collision with root package name */
    ycx f26355dv = new ycx() { // from class: com.bytedance.sdk.openadsdk.core.widget.ycx.lt.1
        @Override // com.bytedance.sdk.openadsdk.core.widget.ycx.lt.ycx
        public void ycx() {
            lt ltVar = lt.this;
            ltVar.fby = true;
            ltVar.lt();
            lt ltVar2 = lt.this;
            ltVar2.ycx(2, ltVar2.f26360jw, ltVar2.f26359jc);
        }
    };
    GestureDetector oty = new GestureDetector(pmi.ycx(), new GestureDetector.SimpleOnGestureListener() { // from class: com.bytedance.sdk.openadsdk.core.widget.ycx.lt.2
        @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
        public boolean onFling(MotionEvent motionEvent, MotionEvent motionEvent2, float f11, float f12) {
            lt.this.wie = true;
            return false;
        }
    });
    int lud = pmi.dj().htf();
    Map<Integer, Long> htf = new HashMap();
    Map<Integer, Float> thx = new HashMap();
    Map<Integer, Long> wwx = new HashMap();

    /* renamed from: tn, reason: collision with root package name */
    List<Integer> f26364tn = new ArrayList();

    public interface ycx {
        void ycx();
    }

    public lt(WebView webView, tn tnVar, Context context, boolean z11) {
        this.f26367zb = tnVar;
        this.f26354dj = webView;
        this.ycx = context;
        this.tru = z11;
    }

    private void dj(String str) {
        if (ul()) {
            return;
        }
        com.bytedance.sdk.openadsdk.dj.sya.ycx(this.f26367zb, new ycx.C0102ycx().ycx(this.f26360jw).zb(Uri.decode(str)).ycx(), this.sya);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void fby() {
        WebBackForwardList webBackForwardListCopyBackForwardList = this.f26354dj.copyBackForwardList();
        if (webBackForwardListCopyBackForwardList != null) {
            int currentIndex = webBackForwardListCopyBackForwardList.getCurrentIndex();
            this.f26359jc = currentIndex + 1;
            if (this.tru) {
                this.f26359jc = currentIndex + 2;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void lt() {
        if (this.thx.get(Integer.valueOf(this.f26359jc)) != null) {
            return;
        }
        float height = this.f26354dj.getHeight() / dc.zb(this.ycx, this.f26354dj.getContentHeight());
        if (height < 0.0f || height > 1.0f) {
            height = 0.0f;
        }
        this.thx.put(Integer.valueOf(this.f26359jc), Float.valueOf(height));
    }

    private boolean lud() {
        try {
            int i5 = this.f26359jc;
            if (i5 != 2 && i5 != 3) {
                return false;
            }
            if (Pattern.matches(".*\\/serp\\?sc=.*&clkt=\\d+$", this.f26360jw)) {
                return true;
            }
            return Pattern.matches(".*\\/\\?caf_results=.*&clkt=\\d+$", this.f26360jw);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+SSRBLl9iZdP1UuFFLc=", "bOsvtBG+YNOSS9BYrhSoKU3nIoc=", "TvwhuAKoas+yT9BYlA==", 354);
            htf.sya("WebArbitrageBehavior", th2.toString());
            return false;
        }
    }

    private boolean ul() {
        int i5 = this.f26361lt + 1;
        this.f26361lt = i5;
        if (i5 > this.lud) {
            return true;
        }
        return ("landingpage".equals(this.sya) || "landingpage_endcard".equals(this.sya) || "landingpage_split_screen".equals(this.sya) || "landingpage_direct".equals(this.sya) || "landingpage_split_ceiling".equals(this.sya)) ? false : true;
    }

    public void sya(String str) {
        if (this.f26366ul) {
            this.pmi = true;
        }
        if (this.f26359jc == 1 && !TextUtils.isEmpty(str) && str.contains("query=")) {
            int iIndexOf = str.indexOf("query=") + 6;
            int iIndexOf2 = str.indexOf("&", iIndexOf);
            if (iIndexOf < 0 || iIndexOf2 >= str.length() || iIndexOf2 <= iIndexOf) {
                return;
            }
            dj(str.substring(iIndexOf, iIndexOf2));
        }
    }

    public void zb(String str) {
        this.f26360jw = str;
        fby();
        this.htf.put(Integer.valueOf(this.f26359jc), Long.valueOf(SystemClock.elapsedRealtime()));
        this.wwx.put(Integer.valueOf(this.f26359jc), Long.valueOf(SystemClock.elapsedRealtime()));
        this.aeu = lud();
    }

    public void ycx(String str) {
        this.sya = str;
    }

    public void ycx() {
        zb(this.f26359jc);
    }

    public void ycx(int i5) {
        float height = (this.f26354dj.getHeight() + i5) / dc.zb(this.ycx, this.f26354dj.getContentHeight());
        Float f11 = this.thx.get(Integer.valueOf(this.f26359jc));
        if (height > (f11 == null ? 0.0f : f11.floatValue())) {
            this.thx.put(Integer.valueOf(this.f26359jc), Float.valueOf(height));
        }
    }

    public void zb() {
        this.f26354dj.getViewTreeObserver().addOnWindowFocusChangeListener(new ViewTreeObserver.OnWindowFocusChangeListener() { // from class: com.bytedance.sdk.openadsdk.core.widget.ycx.lt.3
            @Override // android.view.ViewTreeObserver.OnWindowFocusChangeListener
            public void onWindowFocusChanged(boolean z11) {
                if (!z11) {
                    lt ltVar = lt.this;
                    if (!ltVar.fby) {
                        ltVar.lt();
                        long jElapsedRealtime = SystemClock.elapsedRealtime();
                        if (jElapsedRealtime - lt.this.rmf >= 50) {
                            lt ltVar2 = lt.this;
                            ltVar2.ycx(3, ltVar2.f26360jw, ltVar2.f26359jc);
                            lt.this.rmf = jElapsedRealtime;
                            return;
                        }
                        return;
                    }
                    ltVar.fby = false;
                }
                if (z11) {
                    lt.this.fby();
                    lt ltVar3 = lt.this;
                    ltVar3.htf.put(Integer.valueOf(ltVar3.f26359jc), Long.valueOf(SystemClock.elapsedRealtime()));
                }
            }
        });
    }

    private void dj() {
        if (ul()) {
            return;
        }
        com.bytedance.sdk.openadsdk.dy.ycx.ycx ycxVarYcx = new ycx.C0102ycx().ycx(this.f26360jw).ycx(this.f26359jc).dj(this.f26357ea).lud(this.f26362ok).lt(this.syc).ul(this.f26365uh).ycx();
        Message messageObtain = Message.obtain();
        messageObtain.what = 100;
        messageObtain.obj = ycxVarYcx;
        this.f26358hf.sendMessageDelayed(messageObtain, 20L);
    }

    private void zb(int i5) {
        if (ul() || this.f26364tn.contains(Integer.valueOf(i5))) {
            return;
        }
        this.f26364tn.add(Integer.valueOf(i5));
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        com.bytedance.sdk.openadsdk.dj.sya.zb(this.f26367zb, new ycx.C0102ycx().ycx(this.f26360jw).ycx(this.f26359jc).jc(jElapsedRealtime - (this.wwx.get(Integer.valueOf(i5)) != null ? r6.longValue() : jElapsedRealtime)).ycx(), this.sya);
    }

    public ycx sya() {
        return this.f26355dv;
    }

    private void sya(int i5) {
        if (ul()) {
            return;
        }
        lt();
        this.f26366ul = true;
        com.bytedance.sdk.openadsdk.dy.ycx.ycx ycxVarYcx = new ycx.C0102ycx().ycx(this.f26360jw).ycx(this.f26359jc).ycx(this.f26357ea).zb(this.f26362ok).sya(this.f26365uh).sya(i5).ycx();
        try {
            if (this.aeu) {
                WebView.HitTestResult hitTestResult = this.f26354dj.getHitTestResult();
                ycxVarYcx.ycx(hitTestResult.getExtra());
                ycxVarYcx.ycx(hitTestResult.getType());
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+SSRBLl9iZdP1UuFFLc=", "bOsvtBG+YNOSS9BYrhSoKU3nIoc=", "S/wilgaveuSMQ9RWqQelJk8=", 340);
        }
        Message messageObtain = Message.obtain();
        messageObtain.what = 200;
        messageObtain.obj = ycxVarYcx;
        this.f26358hf.sendMessageDelayed(messageObtain, 100L);
    }

    public void ycx(MotionEvent motionEvent) {
        this.oty.onTouchEvent(motionEvent);
        int action = motionEvent.getAction();
        if (action == 0) {
            this.f26357ea = motionEvent.getX();
            this.f26362ok = motionEvent.getY();
            this.f26356dy = SystemClock.elapsedRealtime();
        } else if (action != 1) {
            if (action != 3) {
                return;
            }
            sya(2);
        } else {
            this.f26365uh = SystemClock.elapsedRealtime() - this.f26356dy;
            if (zb(motionEvent)) {
                dj();
            } else {
                sya(1);
            }
        }
    }

    private boolean zb(MotionEvent motionEvent) {
        this.f26363ry = motionEvent.getX();
        float y11 = motionEvent.getY();
        this.xkz = y11;
        float f11 = this.f26362ok;
        if (y11 - f11 == 0.0f) {
            return false;
        }
        this.syc = y11 - f11;
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(int i5, String str, int i11) {
        if (ul()) {
            return;
        }
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        Long l9 = this.htf.get(Integer.valueOf(i11));
        long jLongValue = l9 != null ? l9.longValue() : jElapsedRealtime;
        Float f11 = this.thx.get(Integer.valueOf(i11));
        com.bytedance.sdk.openadsdk.dj.sya.sya(this.f26367zb, new ycx.C0102ycx().ycx(str).ycx(i11).fby(jElapsedRealtime - jLongValue).jw(f11 == null ? 0.0f : f11.floatValue()).zb(i5).ycx(), this.sya);
    }

    @Override // com.bytedance.sdk.component.utils.tru.ycx
    public void ycx(Message message) {
        int i5 = message.what;
        com.bytedance.sdk.openadsdk.dy.ycx.ycx ycxVar = (com.bytedance.sdk.openadsdk.dy.ycx.ycx) message.obj;
        if (i5 == 100) {
            ycxVar.dj(this.wie ? 2 : 1);
            com.bytedance.sdk.openadsdk.dj.sya.dj(this.f26367zb, ycxVar, this.sya);
            this.wie = false;
        } else if (i5 == 200) {
            if (this.pmi) {
                ycx(1, ycxVar.sya(), ycxVar.dj());
            }
            ycxVar.sya(this.pmi ? 1 : 0);
            com.bytedance.sdk.openadsdk.dj.sya.lud(this.f26367zb, ycxVar, this.sya);
            this.f26366ul = false;
            this.pmi = false;
        }
    }
}
