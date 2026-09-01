package com.medium.android.donkey.read.carousel;

import android.database.DataSetObserver;
import android.widget.TextView;
import com.medium.android.donkey.read.carousel.ImageCarouselActivity;
import defpackage.b55;
import defpackage.br7;
import defpackage.c1e;
import defpackage.g76;
import defpackage.mw5;
import defpackage.n92;
import defpackage.ow5;
import defpackage.p4d;
import defpackage.pw5;
import defpackage.qw5;
import defpackage.sw5;
import defpackage.uz5;
import defpackage.ygf;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d extends p4d implements b55 {
    public /* synthetic */ Object b;
    public final /* synthetic */ ImageCarouselActivity c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(ImageCarouselActivity imageCarouselActivity, n92 n92Var) {
        super(2, n92Var);
        this.c = imageCarouselActivity;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        d dVar = new d(this.c, n92Var);
        dVar.b = obj;
        return dVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        d dVar = (d) create((qw5) obj, (n92) obj2);
        c1e c1eVar = c1e.a;
        dVar.invokeSuspend(c1eVar);
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        qw5 qw5Var = (qw5) this.b;
        br7.v(obj);
        if (qw5Var instanceof pw5) {
            uz5 uz5Var = this.c.q;
            if (uz5Var == null) {
                g76.g0("binding");
                throw null;
            }
            ((ImageCarouselViewPager) uz5Var.d).setVisibility(0);
            uz5 uz5Var2 = this.c.q;
            if (uz5Var2 == null) {
                g76.g0("binding");
                throw null;
            }
            ((TextView) uz5Var2.c).setVisibility(8);
            mw5 mw5Var = this.c.r;
            if (mw5Var == null) {
                g76.g0("adapter");
                throw null;
            }
            pw5 pw5Var = (pw5) qw5Var;
            List list = pw5Var.a;
            if (!mw5Var.e.equals(list)) {
                mw5Var.e.clear();
                mw5Var.e.addAll(list);
                synchronized (mw5Var) {
                    try {
                        DataSetObserver dataSetObserver = mw5Var.b;
                        if (dataSetObserver != null) {
                            dataSetObserver.onChanged();
                        }
                    } catch (Throwable th) {
                        throw th;
                    }
                }
                mw5Var.a.notifyChanged();
            }
            if (!pw5Var.a.isEmpty()) {
                List list2 = pw5Var.a;
                ImageCarouselActivity imageCarouselActivity = this.c;
                Iterator it2 = list2.iterator();
                int i = 0;
                while (true) {
                    if (!it2.hasNext()) {
                        i = -1;
                        break;
                    }
                    String id = ((sw5) it2.next()).getId();
                    ImageCarouselActivity.SelectedImageContext selectedImageContext = imageCarouselActivity.t;
                    if (g76.L(id, selectedImageContext != null ? selectedImageContext.getId() : null)) {
                        break;
                    }
                    i++;
                }
                Integer num = new Integer(i);
                if (num.intValue() < 0) {
                    num = null;
                }
                int iIntValue = num != null ? num.intValue() : 0;
                uz5 uz5Var3 = this.c.q;
                if (uz5Var3 == null) {
                    g76.g0("binding");
                    throw null;
                }
                ImageCarouselViewPager imageCarouselViewPager = (ImageCarouselViewPager) uz5Var3.d;
                imageCarouselViewPager.u = false;
                imageCarouselViewPager.t(iIntValue, 0, false, false);
            }
        } else {
            if (!(qw5Var instanceof ow5)) {
                ygf.a();
                return null;
            }
            uz5 uz5Var4 = this.c.q;
            if (uz5Var4 == null) {
                g76.g0("binding");
                throw null;
            }
            ((ImageCarouselViewPager) uz5Var4.d).setVisibility(8);
            uz5 uz5Var5 = this.c.q;
            if (uz5Var5 == null) {
                g76.g0("binding");
                throw null;
            }
            ((TextView) uz5Var5.c).setVisibility(0);
        }
        return c1e.a;
    }
}
