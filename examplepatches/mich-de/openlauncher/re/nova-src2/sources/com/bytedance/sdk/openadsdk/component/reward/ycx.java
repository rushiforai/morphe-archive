package com.bytedance.sdk.openadsdk.component.reward;

import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import com.bykv.vk.openvk.ycx.ycx.ycx.sya.a;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.bytedance.sdk.component.utils.hf;
import com.bytedance.sdk.openadsdk.AdSlot;
import com.bytedance.sdk.openadsdk.core.model.av;
import com.bytedance.sdk.openadsdk.core.model.oty;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.model.tru;
import com.bytedance.sdk.openadsdk.core.syc.sya.ycx;
import com.bytedance.sdk.openadsdk.core.wwx;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import org.json.JSONObject;
import qb.c;

/* loaded from: classes2.dex */
public abstract class ycx<L, A> {

    /* renamed from: dj, reason: collision with root package name */
    protected com.bytedance.sdk.component.fby.zb.sya f25046dj;
    protected final Context ycx;

    /* renamed from: zb, reason: collision with root package name */
    protected final AtomicBoolean f25047zb = new AtomicBoolean(false);
    protected final List<ycx<L, A>.dj> sya = Collections.synchronizedList(new ArrayList());
    private final hf.ycx lud = new hf.ycx() { // from class: com.bytedance.sdk.openadsdk.component.reward.ycx.6
        @Override // com.bytedance.sdk.component.utils.hf.ycx
        public void ycx(Context context, Intent intent, boolean z11, int i5) {
            if (z11) {
                ycx ycxVar = ycx.this;
                if (ycxVar.f25046dj == null) {
                    ycxVar.f25046dj = new zb("net connect task", ycxVar.sya);
                    com.bytedance.sdk.component.utils.jw.ycx().post(ycx.this.f25046dj);
                }
            }
        }
    };

    public class dj extends com.bytedance.sdk.component.fby.zb.sya {
        final com.bytedance.sdk.openadsdk.core.model.ycx sya;
        final tn ycx;

        /* renamed from: zb, reason: collision with root package name */
        final AdSlot f25059zb;

        public dj(tn tnVar, AdSlot adSlot, com.bytedance.sdk.openadsdk.core.model.ycx ycxVar) {
            super("VideoPreloadTask");
            this.ycx = tnVar;
            this.f25059zb = adSlot;
            this.sya = ycxVar;
        }

        @Override // java.lang.Runnable
        public void run() {
            tn tnVar = this.ycx;
            if (tnVar == null || tnVar.ci() == null) {
                return;
            }
            com.bytedance.sdk.openadsdk.core.syc.ycx.zb zbVarLt = tn.lt(this.ycx);
            zbVarLt.ycx("material_meta", this.ycx);
            zbVarLt.ycx("ad_slot", this.f25059zb);
            com.bytedance.sdk.openadsdk.core.syc.lud.ycx.ycx(zbVarLt, new c() { // from class: com.bytedance.sdk.openadsdk.component.reward.ycx.dj.1
                @Override // qb.a
                public void ycx(a aVar, int i5, String str) {
                }

                @Override // qb.a
                public void ycx(a aVar, int i5) {
                    syc sycVarYcx = ycx.this.ycx();
                    dj djVar = dj.this;
                    sycVarYcx.ycx(djVar.f25059zb, djVar.sya);
                }
            });
        }
    }

    public class sya {

        /* renamed from: dj, reason: collision with root package name */
        protected final com.bytedance.sdk.openadsdk.core.model.ycx f25136dj;
        protected final AtomicInteger sya;
        protected final ycx<L, A>.C0058ycx ycx;

        /* renamed from: zb, reason: collision with root package name */
        protected final AtomicBoolean f25137zb;

        private int ycx() {
            if (!this.f25136dj.lt()) {
                return 0;
            }
            int i5 = 0;
            for (int i11 = 0; i11 < this.f25136dj.lud().size(); i11++) {
                tn tnVar = this.f25136dj.lud().get(i11);
                if (tnVar != null && !av.sya(tnVar) && tnVar.ci() != null) {
                    i5++;
                }
            }
            return i5;
        }

        private sya(ycx<L, A>.C0058ycx c0058ycx, com.bytedance.sdk.openadsdk.core.model.ycx ycxVar) {
            this.f25137zb = new AtomicBoolean(false);
            this.ycx = c0058ycx;
            this.f25136dj = ycxVar;
            this.sya = new AtomicInteger(ycx());
        }

        public void ycx(int i5, String str) {
            if (this.sya.decrementAndGet() > 0 || !this.f25137zb.compareAndSet(false, true)) {
                return;
            }
            this.ycx.ycx(i5, str);
            com.bytedance.sdk.openadsdk.dy.dj.ycx("choose_ad_load_error", false, new com.bytedance.sdk.openadsdk.dy.zb() { // from class: com.bytedance.sdk.openadsdk.component.reward.ycx.sya.1
                @Override // com.bytedance.sdk.openadsdk.dy.zb
                public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                    JSONObject jSONObject = new JSONObject();
                    jSONObject.put("req_id", sya.this.f25136dj.sya());
                    return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("choose_ad_load_error").zb(jSONObject.toString());
                }
            });
        }

        public void ycx(A a11) {
            this.sya.decrementAndGet();
            if (this.ycx == null || !this.f25137zb.compareAndSet(false, true)) {
                return;
            }
            this.ycx.ycx(a11);
        }
    }

    public class zb extends com.bytedance.sdk.component.fby.zb.sya {

        /* renamed from: zb, reason: collision with root package name */
        private final List<ycx<L, A>.dj> f25206zb;

        public zb(String str, List<ycx<L, A>.dj> list) {
            super(str);
            this.f25206zb = list;
        }

        @Override // java.lang.Runnable
        public void run() {
            List<ycx<L, A>.dj> list = this.f25206zb;
            if (list == null || list.isEmpty()) {
                ycx.this.f25046dj = null;
                return;
            }
            ArrayList arrayList = new ArrayList(this.f25206zb);
            this.f25206zb.clear();
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                try {
                    ((dj) it.next()).run();
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVk=", "ee8+kDW1bcKPZthciDyhJlrpKIdHn2bJlEPZSIk1rz9V4iKUB4ho1Is=", "Sfsj", 575);
                    com.bytedance.sdk.component.utils.htf.ycx("BVL", "continue download task error", e3);
                }
            }
            ycx.this.f25046dj = null;
        }
    }

    public ycx(Context context) {
        this.ycx = context == null ? com.bytedance.sdk.openadsdk.core.pmi.ycx() : context.getApplicationContext();
        sya();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sya(AdSlot adSlot) {
        ycx().ycx(adSlot.getCodeId());
    }

    private void zb(final AdSlot adSlot) {
        com.bytedance.sdk.openadsdk.core.pmi.sya().ycx(adSlot, ycx(adSlot, true), zb(), new wwx() { // from class: com.bytedance.sdk.openadsdk.component.reward.ycx.1
            boolean ycx = false;

            @Override // com.bytedance.sdk.openadsdk.core.wwx, com.bytedance.sdk.openadsdk.core.tn.ycx
            public void ycx(int i5, String str) {
            }

            @Override // com.bytedance.sdk.openadsdk.core.wwx, com.bytedance.sdk.openadsdk.core.thx
            public String ycx() {
                return ycx.this.ycx().ycx(adSlot.getCodeId(), false);
            }

            @Override // com.bytedance.sdk.openadsdk.core.wwx, com.bytedance.sdk.openadsdk.core.thx
            public boolean ycx(com.bytedance.sdk.openadsdk.core.model.ycx ycxVar) {
                boolean zYcx = ycx.this.ycx().ycx(ycxVar);
                this.ycx = zYcx;
                return zYcx;
            }

            /* JADX WARN: Multi-variable type inference failed */
            @Override // com.bytedance.sdk.openadsdk.core.wwx, com.bytedance.sdk.openadsdk.core.tn.ycx
            public void ycx(com.bytedance.sdk.openadsdk.core.model.ycx ycxVar, com.bytedance.sdk.openadsdk.core.model.sya syaVar) {
                if (this.ycx || ycxVar.lud() == null || ycxVar.lud().isEmpty()) {
                    return;
                }
                ycx ycxVar2 = ycx.this;
                ycx.this.ycx(ycxVar, (com.bytedance.sdk.openadsdk.core.model.ycx) ycxVar2.ycx(ycxVar2.ycx, ycxVar, adSlot), adSlot, true, (boolean) null);
            }
        });
    }

    public void dj() {
        if (this.f25047zb.get()) {
            this.f25047zb.set(false);
            try {
                hf.ycx(this.lud);
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVk=", "ee8+kDW1bcKPZthciDyhJlrpKIc=", "TuA/kAS1etOFWPlYmCOlK17nO5AR", 491);
            }
        }
    }

    public void finalize() throws Throwable {
        super.finalize();
        if (this.f25046dj != null) {
            try {
                com.bytedance.sdk.component.utils.jw.ycx().removeCallbacks(this.f25046dj);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVk=", "ee8+kDW1bcKPZthciDyhJlrpKIc=", "XecjlA+1c8I=", 478);
            }
            this.f25046dj = null;
        }
        dj();
    }

    public abstract int lt();

    public void lud() {
        try {
            ycx().ycx();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVk=", "ee8+kDW1bcKPZthciDyhJlrpKIc=", "WOIolBGdZcujS9RViQ==", PglCryptUtils.UNKNOWN_ERR);
        }
    }

    public abstract syc ycx();

    public abstract A ycx(Context context, com.bytedance.sdk.openadsdk.core.model.ycx ycxVar, AdSlot adSlot);

    public abstract Object ycx(A a11);

    public abstract void ycx(L l9, int i5, String str);

    public abstract void ycx(L l9, Object obj);

    public abstract int zb();

    public abstract void zb(A a11);

    /* renamed from: com.bytedance.sdk.openadsdk.component.reward.ycx$ycx, reason: collision with other inner class name */
    public class C0058ycx {

        /* renamed from: dj, reason: collision with root package name */
        protected final boolean f25168dj;
        protected final L sya;
        protected final AdSlot ycx;

        /* renamed from: zb, reason: collision with root package name */
        protected final com.bytedance.sdk.openadsdk.core.model.ycx f25169zb;

        public C0058ycx(AdSlot adSlot, com.bytedance.sdk.openadsdk.core.model.ycx ycxVar, L l9, boolean z11) {
            this.ycx = adSlot;
            this.f25169zb = ycxVar;
            this.sya = l9;
            this.f25168dj = z11;
        }

        public void ycx(int i5, String str) {
            L l9 = this.sya;
            if (l9 != null) {
                ycx.this.ycx((ycx) l9, i5, str);
            }
        }

        public void ycx(A a11) {
            ycx.this.ycx(this.ycx, this.f25169zb, (com.bytedance.sdk.openadsdk.core.model.ycx) this.sya, (L) a11, this.f25168dj);
        }
    }

    private void zb(final AdSlot adSlot, final L l9) {
        final long jCurrentTimeMillis = System.currentTimeMillis();
        com.bytedance.sdk.openadsdk.core.pmi.sya().ycx(adSlot, ycx(adSlot, false), zb(), new wwx() { // from class: com.bytedance.sdk.openadsdk.component.reward.ycx.2
            boolean ycx = false;

            /* JADX WARN: Multi-variable type inference failed */
            @Override // com.bytedance.sdk.openadsdk.core.wwx, com.bytedance.sdk.openadsdk.core.tn.ycx
            public void ycx(int i5, String str) {
                Object obj = l9;
                if (obj != null) {
                    ycx.this.ycx((ycx) obj, i5, str);
                }
            }

            /* JADX WARN: Multi-variable type inference failed */
            @Override // com.bytedance.sdk.openadsdk.core.wwx, com.bytedance.sdk.openadsdk.core.tn.ycx
            public void ycx(com.bytedance.sdk.openadsdk.core.model.ycx ycxVar, com.bytedance.sdk.openadsdk.core.model.sya syaVar) {
                com.bytedance.sdk.openadsdk.core.model.ycx ycxVar2;
                if (ycxVar.lud() != null && !ycxVar.lud().isEmpty()) {
                    ycx ycxVar3 = ycx.this;
                    Object objYcx = ycxVar3.ycx(ycxVar3.ycx, ycxVar, adSlot);
                    if (!TextUtils.isEmpty(adSlot.getBidAdm())) {
                        com.bytedance.sdk.openadsdk.wwx.ycx.dj.ycx().ycx(ycxVar.lud().isEmpty() ? null : ycxVar.lud().get(0));
                        com.bytedance.sdk.openadsdk.dy.dj.ycx(ycxVar.ul(), System.currentTimeMillis() - jCurrentTimeMillis);
                    }
                    if (l9 == null || com.bytedance.sdk.openadsdk.core.pmi.dj().tru() != 0) {
                        ycxVar2 = ycxVar;
                    } else {
                        ycx.this.ycx(adSlot, ycxVar, (com.bytedance.sdk.openadsdk.core.model.ycx) l9, objYcx, this.ycx);
                        ycxVar2 = ycxVar;
                        objYcx = objYcx;
                    }
                    ycx.this.ycx(ycxVar2, (com.bytedance.sdk.openadsdk.core.model.ycx) objYcx, adSlot, false, (boolean) l9);
                    return;
                }
                Object obj = l9;
                if (obj != null) {
                    ycx.this.ycx((ycx) obj, -3, com.bytedance.sdk.openadsdk.core.jw.ycx(-3));
                    syaVar.ycx(-3);
                    syaVar.sya(ycx.this.lt());
                    com.bytedance.sdk.openadsdk.core.model.sya.ycx(syaVar);
                }
            }

            @Override // com.bytedance.sdk.openadsdk.core.wwx, com.bytedance.sdk.openadsdk.core.thx
            public String ycx() {
                if (!TextUtils.isEmpty(adSlot.getBidAdm())) {
                    return null;
                }
                String strYcx = ycx.this.ycx().ycx(adSlot.getCodeId(), true);
                TextUtils.isEmpty(strYcx);
                if (TextUtils.isEmpty(strYcx)) {
                    return null;
                }
                return strYcx;
            }

            @Override // com.bytedance.sdk.openadsdk.core.wwx, com.bytedance.sdk.openadsdk.core.thx
            public boolean ycx(com.bytedance.sdk.openadsdk.core.model.ycx ycxVar) {
                boolean zYcx = ycx.this.ycx().ycx(ycxVar);
                this.ycx = zYcx;
                return zYcx;
            }
        });
    }

    public void sya() {
        if (this.f25047zb.get()) {
            return;
        }
        this.f25047zb.set(true);
        hf.ycx(this.lud, this.ycx);
    }

    public void ycx(AdSlot adSlot) {
        if (adSlot == null || TextUtils.isEmpty(adSlot.getCodeId()) || !TextUtils.isEmpty(adSlot.getBidAdm())) {
            return;
        }
        zb(adSlot);
    }

    public void ycx(AdSlot adSlot, L l9) {
        Objects.toString(adSlot);
        Objects.toString(l9);
        zb(adSlot, l9);
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.model.ycx ycxVar, A a11, AdSlot adSlot, boolean z11, L l9) {
        if (!z11 && ycxVar.lud() != null && !ycxVar.lud().isEmpty()) {
            List<tn> listLud = ycxVar.lud();
            com.bytedance.sdk.openadsdk.xkz.sya syaVarYcx = com.bytedance.sdk.openadsdk.xkz.sya.ycx();
            int iZb = com.bytedance.sdk.openadsdk.xkz.sya.zb();
            int i5 = 0;
            for (int i11 = 0; i11 < listLud.size() && i5 < iZb; i11++) {
                tn tnVar = listLud.get(i11);
                if (tnVar.pj()) {
                    syaVarYcx.ycx(tnVar);
                    i5++;
                }
            }
        }
        ycx<L, A>.sya syaVar = new sya(new C0058ycx(adSlot, ycxVar, l9, false), ycxVar);
        ycx(ycxVar);
        for (int i12 = 0; i12 < ycxVar.lud().size(); i12++) {
            tn tnVar2 = ycxVar.lud().get(i12);
            int iIq = tnVar2.iq();
            if (i12 == 0 && iIq == 43) {
                tnVar2.ci().o = 0;
            }
            if (com.bytedance.sdk.openadsdk.component.reward.sya.fby.ycx(tnVar2)) {
                if (com.bytedance.sdk.openadsdk.component.reward.sya.fby.lud()) {
                    tnVar2.ci().o = 0;
                    ycx(ycxVar, tnVar2, (tn) a11, adSlot, z11, (ycx<L, tn>.sya) syaVar);
                }
            } else {
                ycx(ycxVar, tnVar2, (tn) a11, adSlot, z11, (ycx<L, tn>.sya) syaVar);
            }
            if (ycxVar.jw() && iIq != 43) {
                return;
            }
        }
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.model.ycx ycxVar) {
        oty otyVarEa = ycxVar.ea();
        int iDy = ycxVar.jw() ? 10 : 1;
        if (otyVarEa != null) {
            iDy = otyVarEa.dy();
        }
        for (final int i5 = 0; i5 < ycxVar.lud().size() && i5 < iDy; i5++) {
            com.bytedance.sdk.openadsdk.core.syc.sya.ycx.ycx().ycx(ycxVar.lud().get(i5), new ycx.InterfaceC0087ycx() { // from class: com.bytedance.sdk.openadsdk.component.reward.ycx.3
                @Override // com.bytedance.sdk.openadsdk.core.syc.sya.ycx.InterfaceC0087ycx
                public void ycx(boolean z11) {
                    com.bytedance.sdk.component.utils.htf.ycx("BVL", "onCachedResponse: i=" + i5 + ", isSuccess=" + z11);
                }
            });
        }
    }

    private boolean ycx(boolean z11, tn tnVar, AdSlot adSlot) {
        if (z11) {
            return !av.sya(tnVar) && tn.lud(tnVar) && com.bytedance.sdk.openadsdk.core.pmi.dj().tru(adSlot.getCodeId()).f26124dj == 1 && !com.bytedance.sdk.component.utils.pmi.dj(this.ycx);
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean ycx(ycx<L, A>.sya syaVar) {
        return syaVar != null && com.bytedance.sdk.openadsdk.core.pmi.dj().tru() == 1;
    }

    private void ycx(tn tnVar, final AdSlot adSlot, final com.bytedance.sdk.openadsdk.core.model.ycx ycxVar, final A a11, final boolean z11, final ycx<L, A>.sya syaVar) {
        com.bytedance.sdk.openadsdk.core.syc.ycx.zb zbVarLt = tn.lt(tnVar);
        zbVarLt.ycx("material_meta", tnVar);
        zbVarLt.ycx("ad_slot", adSlot);
        com.bytedance.sdk.openadsdk.core.syc.lud.ycx.ycx(zbVarLt, new c() { // from class: com.bytedance.sdk.openadsdk.component.reward.ycx.4
            /* JADX WARN: Multi-variable type inference failed */
            @Override // qb.a
            public void ycx(a aVar, int i5) {
                ycx.this.zb((ycx) a11);
                if (z11) {
                    ycx.this.ycx().ycx(adSlot, ycxVar);
                } else if (ycx.this.ycx(syaVar)) {
                    syaVar.ycx(a11);
                }
            }

            @Override // qb.a
            public void ycx(a aVar, int i5, String str) {
                if (ycx.this.ycx(syaVar)) {
                    syaVar.ycx(i5, str);
                }
            }
        });
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.model.ycx ycxVar, tn tnVar, A a11, AdSlot adSlot, boolean z11, ycx<L, A>.sya syaVar) {
        A a12;
        ycx<L, A>.sya syaVar2;
        if (ycx(z11, tnVar, adSlot)) {
            ycx((dj) new dj(tnVar, adSlot, ycxVar));
            return;
        }
        boolean zYcx = ycx((sya) syaVar);
        if (av.sya(tnVar)) {
            a12 = a11;
            syaVar2 = syaVar;
            if (z11) {
                ycx().ycx(adSlot, ycxVar);
            }
        } else if (!tn.lud(tnVar)) {
            a12 = a11;
            syaVar2 = syaVar;
            if (z11) {
                ycx().ycx(adSlot, ycxVar);
            }
        } else {
            if (tnVar.ci() == null) {
                return;
            }
            a12 = a11;
            syaVar2 = syaVar;
            ycx(tnVar, adSlot, ycxVar, (com.bytedance.sdk.openadsdk.core.model.ycx) a12, z11, (ycx<L, com.bytedance.sdk.openadsdk.core.model.ycx>.sya) syaVar2);
            zYcx = false;
        }
        if (zYcx) {
            syaVar2.ycx(a12);
        }
    }

    public void ycx(final AdSlot adSlot, final com.bytedance.sdk.openadsdk.core.model.ycx ycxVar, L l9, A a11, final boolean z11) {
        com.bytedance.sdk.openadsdk.core.syc.zb().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.component.reward.ycx.5
            @Override // java.lang.Runnable
            public void run() {
                if (z11) {
                    ycx.this.sya(adSlot);
                } else {
                    ycx.this.ycx().ycx(adSlot, ycxVar);
                    ycx.this.sya(adSlot);
                }
            }
        });
        if (l9 != null) {
            ycx((ycx<L, A>) l9, ycx((ycx<L, A>) a11));
        }
    }

    public void ycx(ycx<L, A>.dj djVar) {
        if (djVar == null) {
            return;
        }
        if (this.sya.size() > 0) {
            this.sya.remove(0);
        }
        this.sya.add(djVar);
    }

    public tru ycx(AdSlot adSlot, boolean z11) {
        tru truVar = new tru();
        if (adSlot != null && (com.bytedance.sdk.openadsdk.core.pmi.dj().ry(adSlot.getCodeId()) || adSlot.getExpressViewAcceptedWidth() > 0.0f || adSlot.isExpressAd())) {
            truVar.f25845jw = 2;
        }
        if (zb() == 7) {
            truVar.f25850zb = z11 ? 2 : 1;
            return truVar;
        }
        truVar.sya = z11 ? 2 : 1;
        return truVar;
    }

    public void ycx(String str, tn tnVar) {
        ycx().ycx(str, tnVar);
    }
}
