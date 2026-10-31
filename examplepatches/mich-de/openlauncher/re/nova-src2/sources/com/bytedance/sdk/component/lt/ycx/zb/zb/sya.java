package com.bytedance.sdk.component.lt.ycx.zb.zb;

import android.os.Handler;
import android.os.HandlerThread;
import android.os.Message;
import androidx.compose.ui.node.LayoutNode;
import com.bytedance.sdk.component.lt.ycx.lud;
import com.bytedance.sdk.component.lt.ycx.ul;
import com.bytedance.sdk.component.lt.ycx.ycx.dj;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class sya extends HandlerThread implements Handler.Callback {

    /* renamed from: uh, reason: collision with root package name */
    private static int f23946uh = 200;
    private static int wie = 10;

    /* renamed from: dj, reason: collision with root package name */
    private com.bytedance.sdk.component.lt.ycx.zb.sya f23947dj;

    /* renamed from: dy, reason: collision with root package name */
    private final AtomicInteger f23948dy;

    /* renamed from: ea, reason: collision with root package name */
    private final long f23949ea;
    private volatile long fby;
    private final int htf;

    /* renamed from: jc, reason: collision with root package name */
    private final long f23950jc;

    /* renamed from: jw, reason: collision with root package name */
    private final AtomicInteger f23951jw;

    /* renamed from: lt, reason: collision with root package name */
    private volatile int f23952lt;
    private final PriorityBlockingQueue<com.bytedance.sdk.component.lt.ycx.dj.ycx> lud;

    /* renamed from: ok, reason: collision with root package name */
    private final AtomicInteger f23953ok;
    private long pmi;

    /* renamed from: ry, reason: collision with root package name */
    private volatile Handler f23954ry;
    private final Object sya;
    private final AtomicInteger syc;
    private final int thx;

    /* renamed from: ul, reason: collision with root package name */
    private volatile long f23955ul;
    private final int wwx;
    private final List<com.bytedance.sdk.component.lt.ycx.dj.ycx> xkz;
    protected dj ycx;

    /* renamed from: zb, reason: collision with root package name */
    private volatile boolean f23956zb;

    public sya(PriorityBlockingQueue<com.bytedance.sdk.component.lt.ycx.dj.ycx> priorityBlockingQueue) {
        super("csj_log");
        this.f23956zb = true;
        this.sya = new Object();
        this.f23955ul = 0L;
        this.fby = 0L;
        this.f23951jw = new AtomicInteger(0);
        this.f23950jc = 5000L;
        this.f23949ea = 5000000000L;
        this.f23953ok = new AtomicInteger(0);
        this.xkz = new ArrayList();
        this.syc = new AtomicInteger(0);
        this.f23948dy = new AtomicInteger(0);
        this.pmi = 60000L;
        this.htf = 1;
        this.thx = 2;
        this.wwx = 3;
        this.lud = priorityBlockingQueue;
        this.ycx = new com.bytedance.sdk.component.lt.ycx.ycx.zb();
        if (com.bytedance.sdk.component.lt.ycx.zb.zb()) {
            return;
        }
        long jOk = ul.lt().syc().ok();
        if (jOk > 0) {
            this.pmi = jOk;
        }
    }

    private void dj() {
        if (!isAlive()) {
            com.bytedance.sdk.component.lt.ycx.zb.dj.ycx.dj();
        } else {
            if (ycx()) {
                return;
            }
            sya(6);
        }
    }

    private boolean fby() {
        if (com.bytedance.sdk.component.lt.ycx.zb.dj.ycx.f23915zb) {
            return this.f23952lt == 4 || this.f23952lt == 7 || this.f23952lt == 6 || this.f23952lt == 5 || this.f23952lt == 2;
        }
        return false;
    }

    private void jc() {
        long jNanoTime;
        com.bytedance.sdk.component.lt.ycx.zb.dj djVar;
        if (this.f23954ry.hasMessages(11)) {
            jw();
        } else {
            lud(1);
        }
        com.bytedance.sdk.component.lt.ycx.zb.ycx.ycx ycxVar = com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj;
        com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(ycxVar.zb(), 1);
        if (this.f23952lt == 2) {
            com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(ycxVar.ul(), 1);
            synchronized (this.sya) {
                try {
                    try {
                        long jNanoTime2 = System.nanoTime();
                        this.sya.wait(5000L);
                        jNanoTime = System.nanoTime() - jNanoTime2;
                        djVar = com.bytedance.sdk.component.lt.ycx.zb.dj.ycx;
                        if (!djVar.f23915zb) {
                            boolean z11 = djVar.sya;
                        }
                    } catch (InterruptedException e3) {
                        e3.getMessage();
                    }
                    if (jNanoTime < 5000000000L && 5000000000L - jNanoTime >= 50000000) {
                        if (!djVar.f23915zb && !djVar.sya) {
                            com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(ycxVar.yzp(), 1);
                            sya(2);
                            return;
                        }
                        com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(ycxVar.ea(), 1);
                        return;
                    }
                    com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(ycxVar.jc(), 1);
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
    }

    private void jw() {
        try {
            if (this.lud.size() == 0 && this.f23954ry.hasMessages(11) && ycx()) {
                ycx(false);
            }
        } catch (Exception e3) {
            e3.getMessage();
        }
    }

    private void lt() {
        com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.wwx(), 1);
        ycx(false);
        com.bytedance.sdk.component.lt.ycx.zb.dj.ycx.sya();
    }

    private void lud() {
        while (ycx()) {
            try {
                com.bytedance.sdk.component.lt.ycx.zb.ycx.ycx ycxVar = com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj;
                com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(ycxVar.fby(), 1);
                com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVarPoll = this.lud.poll(this.pmi, TimeUnit.MILLISECONDS);
                int size = this.lud.size();
                if (ycxVarPoll instanceof com.bytedance.sdk.component.lt.ycx.dj.zb) {
                    ycx(ycxVarPoll, size);
                } else if (ycxVarPoll == null) {
                    int iIncrementAndGet = this.f23951jw.incrementAndGet();
                    com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(ycxVar.sz(), 1);
                    if (dj(iIncrementAndGet)) {
                        lt();
                        return;
                    } else if (iIncrementAndGet < 4) {
                        this.f23952lt = 1;
                        zb((com.bytedance.sdk.component.lt.ycx.dj.ycx) null);
                    }
                } else {
                    ycx(ycxVarPoll);
                    zb(ycxVarPoll);
                }
            } catch (Throwable th2) {
                th2.getMessage();
                com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.dwi(), 1);
            }
        }
    }

    private void sya() {
        dj();
        com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.ifb(), 1);
        sya(1);
    }

    private void ul() throws JSONException {
        if (this.lud.size() >= 100) {
            for (int i5 = 0; i5 < 100; i5++) {
                com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVarPoll = this.lud.poll();
                if (!(ycxVarPoll instanceof com.bytedance.sdk.component.lt.ycx.dj.zb) && ycxVarPoll != null) {
                    ycx(ycxVarPoll);
                }
            }
        }
    }

    @Override // android.os.Handler.Callback
    public boolean handleMessage(Message message) {
        int i5 = message.what;
        try {
        } catch (Throwable th2) {
            th2.getMessage();
        }
        if (i5 == 1) {
            com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.jw(), 1);
            zb();
            ycx(true);
            lud();
        } else {
            if (i5 != 2 && i5 != 3) {
                if (i5 == 11) {
                    ArrayList arrayList = new ArrayList(this.xkz);
                    this.xkz.clear();
                    ycx((List<com.bytedance.sdk.component.lt.ycx.dj.ycx>) arrayList, false, "timeout_dispatch");
                    jc();
                }
                return true;
            }
            sya();
        }
        return true;
    }

    @Override // android.os.HandlerThread
    public void onLooperPrepared() {
        super.onLooperPrepared();
        this.f23954ry = new Handler(getLooper(), this);
        com.bytedance.sdk.component.lt.ycx.zb.dj.ycx.ycx(this.f23954ry);
        this.f23954ry.sendEmptyMessage(1);
    }

    public static void zb(int i5) {
        f23946uh = i5;
    }

    private void zb() {
        long jDy = ul.lt().dy();
        if (jDy <= 0) {
            return;
        }
        this.ycx.ycx(LayoutNode.NotPlacedPlaceOrder, jDy);
    }

    public static void ycx(int i5) {
        wie = i5;
    }

    public void sya(int i5) {
        try {
            boolean zYcx = ycx(i5, com.bytedance.sdk.component.lt.ycx.zb.dj.ycx.f23915zb);
            if (i5 != 6 && !zYcx) {
                return;
            }
            com.bytedance.sdk.component.lt.ycx.dj.zb zbVar = new com.bytedance.sdk.component.lt.ycx.dj.zb();
            zbVar.ycx(i5);
            this.lud.add(zbVar);
            lud(3);
        } catch (Throwable th2) {
            th2.getMessage();
        }
    }

    private boolean dj(int i5) {
        if (i5 < 4 || this.f23953ok.get() != 0) {
            return false;
        }
        com.bytedance.sdk.component.lt.ycx.zb.dj djVar = com.bytedance.sdk.component.lt.ycx.zb.dj.ycx;
        return (djVar.f23915zb || djVar.sya) ? false : true;
    }

    private void zb(com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar) {
        List<com.bytedance.sdk.component.lt.ycx.dj.ycx> listYcx;
        if (com.bytedance.sdk.component.lt.ycx.sya.ycx.zb() && ul.lt().ycx()) {
            return;
        }
        int i5 = 0;
        if (fby()) {
            com.bytedance.sdk.component.lt.ycx.sya.ycx.ycx(this.f23952lt);
            com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.ok(), 1);
            if (this.lud.size() != 0) {
                return;
            }
            if (!this.f23954ry.hasMessages(2)) {
                com.bytedance.sdk.component.lt.ycx.zb.dj.ycx.f23915zb = false;
                this.fby = 0L;
                this.f23955ul = 0L;
                this.syc.set(0);
                this.f23948dy.set(0);
            } else {
                ycx(false);
                return;
            }
        }
        do {
            boolean zYcx = ycx(this.f23952lt, com.bytedance.sdk.component.lt.ycx.zb.dj.ycx.f23915zb);
            com.bytedance.sdk.component.lt.ycx.sya.ycx.ycx(zYcx, this.f23952lt, ycxVar);
            com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.ry(), 1);
            if (zYcx && (listYcx = this.ycx.ycx(this.f23952lt, -1, null)) != null) {
                listYcx.size();
                ycx(listYcx);
            } else {
                jw();
            }
            i5++;
            if (!zYcx) {
                return;
            }
        } while (i5 <= 6);
    }

    public void ycx(boolean z11) {
        this.f23956zb = z11;
    }

    public boolean ycx() {
        return this.f23956zb;
    }

    public boolean ycx(int i5, boolean z11) {
        lud ludVarSyc = ul.lt().syc();
        if (ludVarSyc == null || !ludVarSyc.ycx(ul.lt().lud())) {
            return false;
        }
        return this.ycx.ycx(i5, z11);
    }

    public void ycx(com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar, boolean z11) {
        if (ycxVar == null) {
            return;
        }
        ycxVar.dj();
        if (z11) {
            if (this.f23954ry != null) {
                ArrayList arrayList = new ArrayList(1);
                arrayList.add(ycxVar);
                ycx((List<com.bytedance.sdk.component.lt.ycx.dj.ycx>) arrayList, true, "ignore_result_dispatch");
                return;
            }
            return;
        }
        this.lud.add(ycxVar);
        lud(2);
    }

    private void lud(int i5) {
        if (!ycx()) {
            if (this.f23954ry == null) {
                return;
            }
            com.bytedance.sdk.component.lt.ycx.zb.ycx.ycx ycxVar = com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj;
            com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(ycxVar.sya(), 1);
            if (this.f23954ry.hasMessages(1)) {
                return;
            }
            if (i5 == 1) {
                com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(ycxVar.lt(), 1);
            } else if (i5 == 2) {
                com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(ycxVar.dj(), 1);
            } else if (i5 == 3) {
                com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(ycxVar.lud(), 1);
            }
            this.f23954ry.sendEmptyMessage(1);
            return;
        }
        com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.ycx(), 1);
    }

    private void ycx(com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar, int i5) throws JSONException {
        this.f23951jw.set(0);
        if (i5 == 0) {
            this.f23952lt = ((com.bytedance.sdk.component.lt.ycx.dj.zb) ycxVar).jc();
            if (this.f23952lt != 6) {
                com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.dc(), 1);
                zb(ycxVar);
                return;
            }
            return;
        }
        com.bytedance.sdk.component.lt.ycx.dj.zb zbVar = (com.bytedance.sdk.component.lt.ycx.dj.zb) ycxVar;
        if (zbVar.jc() == 1) {
            this.f23952lt = 1;
            zb(ycxVar);
        } else if (zbVar.jc() == 2) {
            ul();
            this.f23952lt = 2;
            zb(ycxVar);
        }
    }

    private void zb(List<com.bytedance.sdk.component.lt.ycx.dj.ycx> list) {
        this.xkz.addAll(list);
        this.xkz.size();
        lud ludVarSyc = ul.lt().syc();
        if (ludVarSyc != null && ludVarSyc.ea() != null) {
            wie = ludVarSyc.ea().zb();
        }
        if (this.xkz.size() >= wie) {
            if (this.f23954ry.hasMessages(11)) {
                this.f23954ry.removeMessages(11);
            }
            ArrayList arrayList = new ArrayList(this.xkz);
            this.xkz.clear();
            ycx((List<com.bytedance.sdk.component.lt.ycx.dj.ycx>) arrayList, false, "max_size_dispatch");
            jc();
            return;
        }
        if (this.lud.size() == 0) {
            ycx(false);
            if (this.f23954ry.hasMessages(11)) {
                this.f23954ry.removeMessages(11);
            }
            if (this.f23954ry.hasMessages(1)) {
                this.f23954ry.removeMessages(1);
            }
            long jYcx = f23946uh;
            if (ludVarSyc != null && ludVarSyc.ea() != null) {
                jYcx = ludVarSyc.ea().ycx();
            }
            this.f23954ry.sendEmptyMessageDelayed(11, jYcx);
            return;
        }
        this.xkz.size();
    }

    private void ycx(com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar) throws JSONException {
        this.f23951jw.set(0);
        com.bytedance.sdk.component.lt.ycx.zb.dj djVar = com.bytedance.sdk.component.lt.ycx.zb.dj.ycx;
        if (djVar.f23915zb) {
            this.f23952lt = 5;
        } else if (djVar.sya) {
            this.f23952lt = 7;
        } else {
            this.f23952lt = 4;
        }
        com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.mp(), 1);
        this.ycx.ycx(ycxVar, this.f23952lt);
        com.bytedance.sdk.component.lt.ycx.sya.ycx.ul(ycxVar);
    }

    private void ycx(List<com.bytedance.sdk.component.lt.ycx.dj.ycx> list, String str) {
        ycx(str);
        ycx(list, false, str);
        jc();
    }

    private void ycx(List<com.bytedance.sdk.component.lt.ycx.dj.ycx> list) {
        if (list.size() != 0) {
            com.bytedance.sdk.component.lt.ycx.sya.ycx.ycx(list, this.lud.size());
            if (list.size() <= 1 && !com.bytedance.sdk.component.lt.ycx.sya.ycx.sya()) {
                com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar = list.get(0);
                if (ycxVar != null) {
                    if (ycxVar.lud() == 1) {
                        ycx(list, "highPriority");
                        return;
                    }
                    if (ycxVar.dj() == 0 && ycxVar.lud() == 2) {
                        if (ycxVar.zb() == 3) {
                            ycx(list, "version_v3");
                            return;
                        } else {
                            zb(list);
                            return;
                        }
                    }
                    if (ycxVar.dj() == 1) {
                        ycx(list, "stats");
                        return;
                    } else if (ycxVar.dj() == 3) {
                        ycx(list, "adType_v3");
                        return;
                    } else {
                        if (ycxVar.dj() == 2) {
                            ycx(list, InneractiveMediationNameConsts.OTHER);
                            return;
                        }
                        return;
                    }
                }
                return;
            }
            ycx(list, "batchRead");
            return;
        }
        jw();
    }

    private void zb(List<com.bytedance.sdk.component.lt.ycx.dj.ycx> list, final boolean z11, final long j11) {
        this.f23953ok.incrementAndGet();
        com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.ur(), 1);
        try {
            HashMap map = new HashMap();
            Iterator<com.bytedance.sdk.component.lt.ycx.dj.ycx> it = list.iterator();
            while (it.hasNext()) {
                com.bytedance.sdk.component.lt.ycx.dj.ycx next = it.next();
                int iJw = next == null ? 0 : next.jw();
                if (map.get(Integer.valueOf(iJw)) == null) {
                    map.put(Integer.valueOf(iJw), new ArrayList());
                }
                ((List) map.get(Integer.valueOf(iJw))).add(next);
            }
            for (Integer num : map.keySet()) {
                if (num.intValue() != 0 && ul.lt().zb() != null && ul.lt().zb().get(num) != null) {
                    ul.lt().zb().get(num).ycx(list, new com.bytedance.sdk.component.lt.ycx.zb.zb() { // from class: com.bytedance.sdk.component.lt.ycx.zb.zb.sya.3
                        @Override // com.bytedance.sdk.component.lt.ycx.zb.zb
                        public void ycx(List<ycx> list2) {
                            try {
                                sya.this.f23953ok.decrementAndGet();
                                if (list2 == null || list2.size() == 0) {
                                    return;
                                }
                                int size = list2.size();
                                for (int i5 = 0; i5 < size; i5++) {
                                    ycx ycxVar = list2.get(i5);
                                    if (ycxVar != null) {
                                        sya.this.ycx(z11, ycxVar.ycx(), ycxVar.zb(), j11);
                                    }
                                }
                            } catch (Exception unused) {
                            }
                        }
                    });
                } else {
                    this.f23947dj.ycx(list, new com.bytedance.sdk.component.lt.ycx.zb.zb() { // from class: com.bytedance.sdk.component.lt.ycx.zb.zb.sya.2
                        @Override // com.bytedance.sdk.component.lt.ycx.zb.zb
                        public void ycx(List<ycx> list2) {
                            try {
                                sya.this.f23953ok.decrementAndGet();
                                if (list2 == null || list2.size() == 0) {
                                    return;
                                }
                                int size = list2.size();
                                for (int i5 = 0; i5 < size; i5++) {
                                    ycx ycxVar = list2.get(i5);
                                    if (ycxVar != null) {
                                        sya.this.ycx(z11, ycxVar.ycx(), ycxVar.zb(), j11);
                                    }
                                }
                            } catch (Exception unused) {
                            }
                        }
                    });
                }
            }
        } catch (Exception e3) {
            e3.getMessage();
            com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.dwi(), 1);
            this.f23953ok.decrementAndGet();
        }
    }

    private void ycx(String str) {
        if (this.f23954ry.hasMessages(11)) {
            this.f23954ry.removeMessages(11);
        }
        if (this.xkz.size() != 0) {
            ArrayList arrayList = new ArrayList(this.xkz);
            this.xkz.clear();
            ycx((List<com.bytedance.sdk.component.lt.ycx.dj.ycx>) arrayList, false, "before_".concat(String.valueOf(str)));
            jc();
            arrayList.size();
        }
    }

    private void ycx(List<com.bytedance.sdk.component.lt.ycx.dj.ycx> list, boolean z11, String str) {
        long jCurrentTimeMillis = System.currentTimeMillis();
        com.bytedance.sdk.component.lt.ycx.sya.ycx.ycx(list, this.f23952lt, str);
        com.bytedance.sdk.component.lt.ycx.zb.sya syaVarUl = ul.lt().ul();
        this.f23947dj = syaVarUl;
        if (syaVarUl != null) {
            zb(list, z11, jCurrentTimeMillis);
        } else {
            ycx(list, z11, jCurrentTimeMillis);
        }
    }

    private void ycx(final List<com.bytedance.sdk.component.lt.ycx.dj.ycx> list, final boolean z11, final long j11) {
        lud ludVarSyc = ul.lt().syc();
        if (ludVarSyc != null) {
            Executor executorLud = ludVarSyc.lud();
            if (list.get(0).lud() == 1) {
                executorLud = ludVarSyc.dj();
            }
            if (executorLud == null) {
                return;
            }
            this.f23953ok.incrementAndGet();
            executorLud.execute(new com.bytedance.sdk.component.lt.ycx.lud.lud("csj_log_upload") { // from class: com.bytedance.sdk.component.lt.ycx.zb.zb.sya.1
                @Override // java.lang.Runnable
                public void run() {
                    sya syaVar = sya.this;
                    syaVar.ycx((List<com.bytedance.sdk.component.lt.ycx.dj.ycx>) list, z11, j11, syaVar.f23952lt);
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(List<com.bytedance.sdk.component.lt.ycx.dj.ycx> list, boolean z11, long j11, int i5) {
        sya syaVar;
        Throwable th2;
        com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar;
        zb zbVarYcx;
        try {
            ycxVar = list.get(0);
            com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.ur(), 1);
        } catch (Throwable th3) {
            th = th3;
            syaVar = this;
        }
        try {
            if (ycxVar.dj() == 0) {
                zbVarYcx = ul.dj().ycx(list);
                ycx(zbVarYcx, list);
                if (zbVarYcx != null) {
                    com.bytedance.sdk.component.lt.ycx.sya.ycx.ycx(list, zbVarYcx.f23962dj);
                }
            } else {
                JSONObject jSONObject = new JSONObject();
                try {
                    JSONArray jSONArray = new JSONArray();
                    Iterator<com.bytedance.sdk.component.lt.ycx.dj.ycx> it = list.iterator();
                    while (it.hasNext()) {
                        jSONArray.put(it.next().lt());
                    }
                    jSONObject.put("stats_list", jSONArray);
                } catch (Exception e3) {
                    e3.getMessage();
                }
                zbVarYcx = ul.dj().ycx(jSONObject);
            }
            zb zbVar = zbVarYcx;
            this.f23953ok.decrementAndGet();
            syaVar = this;
            try {
                syaVar.ycx(z11, zbVar, list, j11);
            } catch (Throwable th4) {
                th = th4;
                th2 = th;
                th2.getMessage();
                com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.dwi(), 1);
                syaVar.f23953ok.decrementAndGet();
            }
        } catch (Throwable th5) {
            th2 = th5;
            syaVar = this;
            th2.getMessage();
            com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.dwi(), 1);
            syaVar.f23953ok.decrementAndGet();
        }
    }

    private void ycx(zb zbVar, List<com.bytedance.sdk.component.lt.ycx.dj.ycx> list) {
        if (zbVar == null || !zbVar.ycx) {
            return;
        }
        List<Object> listYcx = com.bytedance.sdk.component.lt.ycx.zb.ycx();
        if (list == null || listYcx == null || listYcx.size() == 0) {
            return;
        }
        for (com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar : list) {
            if (ycxVar.lud() == 1) {
                com.bytedance.sdk.component.lt.ycx.sya.ycx.ycx(ycxVar);
                com.bytedance.sdk.component.lt.ycx.sya.ycx.lud(ycxVar);
                Iterator<Object> it = listYcx.iterator();
                while (it.hasNext()) {
                    it.next();
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(boolean z11, zb zbVar, List<com.bytedance.sdk.component.lt.ycx.dj.ycx> list, long j11) {
        if (z11 || zbVar == null) {
            return;
        }
        int i5 = zbVar.f23963zb;
        int i11 = -2;
        if (zbVar.lud) {
            i5 = -1;
        } else if (i5 < 0) {
            i5 = -2;
        }
        if (i5 == 510 || i5 == 511) {
            i5 = -2;
        }
        if (zbVar.ycx || ((i5 < 500 || i5 >= 509) && i5 <= 513 && i5 != 404)) {
            i11 = i5;
        }
        if (list != null) {
            list.size();
            this.f23953ok.get();
        }
        ycx(i11, list, j11);
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x006a A[Catch: all -> 0x0040, TryCatch #0 {all -> 0x0040, blocks: (B:5:0x0005, B:8:0x000b, B:55:0x00e4, B:57:0x00e8, B:58:0x00ed, B:18:0x0030, B:20:0x003e, B:24:0x0043, B:26:0x0050, B:28:0x0052, B:30:0x0060, B:31:0x0065, B:32:0x006a, B:34:0x0070, B:36:0x0074, B:38:0x0080, B:39:0x0085, B:41:0x008d, B:42:0x0092, B:43:0x00af, B:45:0x00bd, B:47:0x00bf, B:49:0x00cc, B:51:0x00ce, B:53:0x00dc, B:54:0x00e1, B:61:0x00f4), top: B:65:0x0005 }] */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00af A[Catch: all -> 0x0040, TryCatch #0 {all -> 0x0040, blocks: (B:5:0x0005, B:8:0x000b, B:55:0x00e4, B:57:0x00e8, B:58:0x00ed, B:18:0x0030, B:20:0x003e, B:24:0x0043, B:26:0x0050, B:28:0x0052, B:30:0x0060, B:31:0x0065, B:32:0x006a, B:34:0x0070, B:36:0x0074, B:38:0x0080, B:39:0x0085, B:41:0x008d, B:42:0x0092, B:43:0x00af, B:45:0x00bd, B:47:0x00bf, B:49:0x00cc, B:51:0x00ce, B:53:0x00dc, B:54:0x00e1, B:61:0x00f4), top: B:65:0x0005 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void ycx(int i5, List<com.bytedance.sdk.component.lt.ycx.dj.ycx> list, long j11) {
        synchronized (this.sya) {
            if (list != null) {
                try {
                    if (this.f23954ry != null) {
                        com.bytedance.sdk.component.lt.ycx.sya.ycx.ycx(i5, list, j11);
                        this.ycx.ycx(i5, list);
                        ul.lt().syc();
                        if (i5 == -2) {
                            com.bytedance.sdk.component.lt.ycx.zb.dj djVar = com.bytedance.sdk.component.lt.ycx.zb.dj.ycx;
                            djVar.f23915zb = false;
                            djVar.sya = true;
                            if (this.f23954ry.hasMessages(3)) {
                                return;
                            }
                            if (System.currentTimeMillis() - this.fby < 15000) {
                                return;
                            }
                            this.fby = System.currentTimeMillis();
                            if (this.f23954ry.hasMessages(2)) {
                                this.f23954ry.removeMessages(2);
                            }
                            ycx(3, 15000L);
                        } else if (i5 == -1) {
                            com.bytedance.sdk.component.lt.ycx.zb.dj djVar2 = com.bytedance.sdk.component.lt.ycx.zb.dj.ycx;
                            if (djVar2.f23915zb || djVar2.sya) {
                                djVar2.f23915zb = false;
                                djVar2.sya = false;
                                if (this.f23954ry.hasMessages(2)) {
                                    this.f23954ry.removeMessages(2);
                                }
                                if (this.f23954ry.hasMessages(3)) {
                                    this.f23954ry.removeMessages(3);
                                }
                                this.fby = 0L;
                                this.f23955ul = 0L;
                                this.syc.set(0);
                                this.f23948dy.set(0);
                                com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.oby(), 1);
                                sya(2);
                            }
                        } else if (i5 != 0) {
                            if (i5 != 200) {
                                if (i5 == 509) {
                                    com.bytedance.sdk.component.lt.ycx.zb.dj djVar3 = com.bytedance.sdk.component.lt.ycx.zb.dj.ycx;
                                    djVar3.f23915zb = true;
                                    djVar3.sya = false;
                                    if (this.f23954ry.hasMessages(2)) {
                                        return;
                                    }
                                    if (System.currentTimeMillis() - this.f23955ul < 30000) {
                                        return;
                                    }
                                    this.f23955ul = System.currentTimeMillis();
                                    if (this.f23954ry.hasMessages(3)) {
                                        this.f23954ry.removeMessages(3);
                                    }
                                    ycx(2, 30000L);
                                }
                            }
                        }
                        if (this.f23952lt == 2) {
                            this.sya.notify();
                        }
                        this.lud.size();
                    }
                } finally {
                }
            }
        }
    }

    public void ycx(int i5, long j11) {
        if (this.f23954ry == null) {
            return;
        }
        Message messageObtain = Message.obtain();
        messageObtain.what = i5;
        if (i5 == 2) {
            this.f23954ry.sendMessageDelayed(messageObtain, (((this.syc.incrementAndGet() - 1) % 4) + 1) * j11);
        } else if (i5 == 3) {
            this.f23954ry.sendMessageDelayed(messageObtain, (((this.f23948dy.incrementAndGet() - 1) % 4) + 1) * j11);
        }
    }
}
