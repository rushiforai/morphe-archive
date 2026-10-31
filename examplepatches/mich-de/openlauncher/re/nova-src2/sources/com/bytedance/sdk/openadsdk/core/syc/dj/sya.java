package com.bytedance.sdk.openadsdk.core.syc.dj;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import nb.b;
import nb.c;
import wb.d;

/* loaded from: classes2.dex */
public class sya extends d {

    /* renamed from: dj, reason: collision with root package name */
    private final ycx f26178dj;
    private final List<zb> ycx = Collections.synchronizedList(new ArrayList());

    /* renamed from: zb, reason: collision with root package name */
    private int f26179zb = 1;
    private int sya = 1;

    public interface zb extends b {
        @Override // nb.b
        /* synthetic */ void dj(c cVar);

        @Override // nb.b
        /* synthetic */ void lud(c cVar);

        @Override // nb.b
        /* synthetic */ void sya(c cVar);

        void ycx(int i5, int i11);

        @Override // nb.b
        /* synthetic */ void ycx(c cVar);

        @Override // nb.b
        /* synthetic */ void ycx(c cVar, int i5);

        @Override // nb.b
        /* synthetic */ void ycx(c cVar, int i5, int i11);

        @Override // nb.b
        /* synthetic */ void ycx(c cVar, int i5, int i11, int i12);

        @Override // nb.b
        /* synthetic */ void ycx(c cVar, long j11);

        @Override // nb.b
        /* synthetic */ void ycx(c cVar, long j11, long j12);

        @Override // nb.b
        /* synthetic */ void ycx(c cVar, com.bykv.vk.openvk.ycx.ycx.ycx.sya.b bVar);

        @Override // nb.b
        /* synthetic */ void ycx(c cVar, boolean z11);

        @Override // nb.b
        /* synthetic */ void zb(c cVar);

        @Override // nb.b
        /* synthetic */ void zb(c cVar, int i5);
    }

    public sya() {
        ycx ycxVar = new ycx();
        this.f26178dj = ycxVar;
        super.ycx(ycxVar);
        ycx(500);
    }

    public static /* synthetic */ int ycx(sya syaVar) {
        int i5 = syaVar.sya;
        syaVar.sya = i5 + 1;
        return i5;
    }

    @Override // wb.d
    public long pmi() {
        long jPmi = super.pmi();
        return this.f26179zb == 1 ? jPmi : ((this.sya - 1) * super.wie()) + jPmi;
    }

    public int thx() {
        return this.sya;
    }

    @Override // wb.d
    public long wie() {
        return super.wie() * this.f26179zb;
    }

    public class ycx implements b {
        private ycx() {
        }

        @Override // nb.b
        public void dj(c cVar) {
            Iterator it = sya.this.ycx.iterator();
            while (it.hasNext()) {
                ((zb) it.next()).dj(cVar);
            }
        }

        @Override // nb.b
        public void lud(c cVar) {
            Iterator it = sya.this.ycx.iterator();
            while (it.hasNext()) {
                ((zb) it.next()).lud(cVar);
            }
        }

        @Override // nb.b
        public void sya(c cVar) {
            Iterator it = sya.this.ycx.iterator();
            while (it.hasNext()) {
                ((zb) it.next()).sya(cVar);
            }
        }

        @Override // nb.b
        public void ycx(c cVar) {
            sya.ycx(sya.this);
            if (sya.this.sya > sya.this.f26179zb) {
                Iterator it = sya.this.ycx.iterator();
                while (it.hasNext()) {
                    ((zb) it.next()).ycx(cVar);
                }
            } else {
                Iterator it2 = sya.this.ycx.iterator();
                while (it2.hasNext()) {
                    ((zb) it2.next()).ycx(sya.this.sya, sya.this.f26179zb);
                }
                sya.this.jw();
            }
        }

        @Override // nb.b
        public void zb(c cVar) {
            Iterator it = sya.this.ycx.iterator();
            while (it.hasNext()) {
                ((zb) it.next()).zb(cVar);
            }
        }

        @Override // nb.b
        public void zb(c cVar, int i5) {
            Iterator it = sya.this.ycx.iterator();
            while (it.hasNext()) {
                ((zb) it.next()).zb(cVar, i5);
            }
        }

        @Override // nb.b
        public void ycx(c cVar, long j11) {
            Iterator it = sya.this.ycx.iterator();
            while (it.hasNext()) {
                ((zb) it.next()).ycx(cVar, j11);
            }
        }

        @Override // nb.b
        public void ycx(c cVar, com.bykv.vk.openvk.ycx.ycx.ycx.sya.b bVar) {
            Iterator it = sya.this.ycx.iterator();
            while (it.hasNext()) {
                ((zb) it.next()).ycx(cVar, bVar);
            }
        }

        @Override // nb.b
        public void ycx(c cVar, boolean z11) {
            Iterator it = sya.this.ycx.iterator();
            while (it.hasNext()) {
                ((zb) it.next()).ycx(cVar, z11);
            }
        }

        @Override // nb.b
        public void ycx(c cVar, int i5, int i11) {
            Iterator it = sya.this.ycx.iterator();
            while (it.hasNext()) {
                ((zb) it.next()).ycx(cVar, i5, i11);
            }
        }

        @Override // nb.b
        public void ycx(c cVar, int i5, int i11, int i12) {
            Iterator it = sya.this.ycx.iterator();
            while (it.hasNext()) {
                ((zb) it.next()).ycx(cVar, i5, i11, i12);
            }
        }

        @Override // nb.b
        public void ycx(c cVar, int i5) {
            Iterator it = sya.this.ycx.iterator();
            while (it.hasNext()) {
                ((zb) it.next()).ycx(cVar, i5);
            }
        }

        @Override // nb.b
        public void ycx(c cVar, long j11, long j12) {
            Iterator it = sya.this.ycx.iterator();
            while (it.hasNext()) {
                ((zb) it.next()).ycx(cVar, j11, j12);
            }
        }
    }

    public void sya(int i5) {
        this.f26179zb = Math.max(1, i5);
    }

    @Override // wb.d
    public void ycx(b bVar) {
        if (!(bVar instanceof zb)) {
            super.ycx(bVar);
        } else {
            if (this.ycx.contains(bVar)) {
                return;
            }
            this.ycx.add((zb) bVar);
        }
    }
}
