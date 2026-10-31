package com.facebook.ads.redexgen.X;

import android.animation.TimeInterpolator;
import android.animation.ValueAnimator;
import android.view.View;
import android.view.ViewPropertyAnimator;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.7S, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C7S extends AbstractC0976Ia {
    public static TimeInterpolator A0B;
    public static String[] A0C = {"K3xavpXOVVnTPS8V8FmisIpuez1NdmFn", "QjoCrUVtXYT15qNhmppxWCsnlOvXMRWn", "HVYav4KnfeU3lAWSFDiSVAYelCZD7hW1", "SKhwmHHGUoQzTLK2kw5WKB1efbL3jYLm", "aZpNXGptJoOcjVlsPlgA0RFw1bcc4fI1", "y8DDj9eTKGlZyxtiH83YwnquX80t2qUq", "Eqht3urb", "PkOCx2w9GPXTa0iGANdHxOJetOGxrMw0"};
    public ArrayList<AbstractC1978jE> A0A = new ArrayList<>();
    public ArrayList<AbstractC1978jE> A07 = new ArrayList<>();
    public ArrayList<C1934iU> A09 = new ArrayList<>();
    public ArrayList<C1933iT> A08 = new ArrayList<>();
    public ArrayList<ArrayList<AbstractC1978jE>> A01 = new ArrayList<>();
    public ArrayList<ArrayList<C1934iU>> A05 = new ArrayList<>();
    public ArrayList<ArrayList<C1933iT>> A03 = new ArrayList<>();
    public ArrayList<AbstractC1978jE> A00 = new ArrayList<>();
    public ArrayList<AbstractC1978jE> A04 = new ArrayList<>();
    public ArrayList<AbstractC1978jE> A06 = new ArrayList<>();
    public ArrayList<AbstractC1978jE> A02 = new ArrayList<>();

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 8 out of bounds for length 8
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // com.facebook.ads.redexgen.X.AbstractC1956is
    public final void A0H() {
        for (int size = this.A09.size() - 1; size >= 0; size--) {
            C1934iU c1934iU = this.A09.get(size);
            View view = c1934iU.A04.A0H;
            view.setTranslationY(0.0f);
            view.setTranslationX(0.0f);
            A0U(c1934iU.A04);
            this.A09.remove(size);
        }
        for (int size2 = this.A0A.size() - 1; size2 >= 0; size2--) {
            A0V(this.A0A.get(size2));
            this.A0A.remove(size2);
        }
        for (int size3 = this.A07.size() - 1; size3 >= 0; size3--) {
            AbstractC1978jE abstractC1978jE = this.A07.get(size3);
            abstractC1978jE.A0H.setAlpha(1.0f);
            A0T(abstractC1978jE);
            this.A07.remove(size3);
        }
        for (int size4 = this.A08.size() - 1; size4 >= 0; size4--) {
            A00(this.A08.get(size4));
        }
        this.A08.clear();
        if (A0M()) {
            for (int size5 = this.A05.size() - 1; size5 >= 0; size5--) {
                ArrayList<C1934iU> arrayList = this.A05.get(size5);
                for (int size6 = arrayList.size() - 1; size6 >= 0; size6--) {
                    C1934iU c1934iU2 = arrayList.get(size6);
                    View view2 = c1934iU2.A04.A0H;
                    view2.setTranslationY(0.0f);
                    view2.setTranslationX(0.0f);
                    A0U(c1934iU2.A04);
                    arrayList.remove(size6);
                    if (arrayList.isEmpty()) {
                        this.A05.remove(arrayList);
                    }
                }
            }
            for (int size7 = this.A01.size() - 1; size7 >= 0; size7--) {
                ArrayList<AbstractC1978jE> arrayList2 = this.A01.get(size7);
                for (int size8 = arrayList2.size() - 1; size8 >= 0; size8--) {
                    AbstractC1978jE abstractC1978jE2 = arrayList2.get(size8);
                    abstractC1978jE2.A0H.setAlpha(1.0f);
                    A0T(abstractC1978jE2);
                    arrayList2.remove(size8);
                    if (arrayList2.isEmpty()) {
                        this.A01.remove(arrayList2);
                    }
                }
            }
            for (int size9 = this.A03.size() - 1; size9 >= 0; size9--) {
                ArrayList<C1933iT> arrayList3 = this.A03.get(size9);
                for (int size10 = arrayList3.size() - 1; size10 >= 0; size10--) {
                    A00(arrayList3.get(size10));
                    if (arrayList3.isEmpty()) {
                        this.A03.remove(arrayList3);
                    }
                }
            }
            A03(this.A06);
            A03(this.A04);
            A03(this.A00);
            A03(this.A02);
            A0G();
        }
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 13 out of bounds for length 13
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // com.facebook.ads.redexgen.X.AbstractC1956is
    public final void A0I() {
        boolean z11 = !this.A0A.isEmpty();
        boolean z12 = !this.A09.isEmpty();
        boolean z13 = !this.A08.isEmpty();
        boolean z14 = !this.A07.isEmpty();
        if (z11 || z12 || z14 || z13) {
            Iterator<AbstractC1978jE> it = this.A0A.iterator();
            while (it.hasNext()) {
                A01(it.next());
            }
            this.A0A.clear();
            if (z12) {
                ArrayList<C1934iU> arrayList = new ArrayList<>();
                arrayList.addAll(this.A09);
                this.A05.add(arrayList);
                this.A09.clear();
                RunnableC1925iL runnableC1925iL = new RunnableC1925iL(this, arrayList);
                if (z11) {
                    AbstractC1880hb.A0E(arrayList.get(0).A04.A0H, runnableC1925iL, A0D());
                } else {
                    runnableC1925iL.run();
                }
            }
            if (z13) {
                ArrayList<C1933iT> arrayList2 = new ArrayList<>();
                arrayList2.addAll(this.A08);
                this.A03.add(arrayList2);
                this.A08.clear();
                RunnableC1926iM runnableC1926iM = new RunnableC1926iM(this, arrayList2);
                if (z11) {
                    AbstractC1880hb.A0E(arrayList2.get(0).A05.A0H, runnableC1926iM, A0D());
                } else {
                    runnableC1926iM.run();
                }
            }
            if (z14) {
                ArrayList<AbstractC1978jE> arrayList3 = new ArrayList<>();
                arrayList3.addAll(this.A07);
                this.A01.add(arrayList3);
                this.A07.clear();
                RunnableC1927iN runnableC1927iN = new RunnableC1927iN(this, arrayList3);
                if (!z11 && !z12 && !z13) {
                    runnableC1927iN.run();
                    return;
                }
                if (A0C[0].charAt(3) == 'S') {
                    throw new RuntimeException();
                }
                String[] strArr = A0C;
                strArr[4] = "oGS3g0YSOogxL8fDiPQ9wWzcLRV8E0qu";
                strArr[3] = "UwBhVdK7HoWqzQqehBBKiWd5H5AJwN9O";
                AbstractC1880hb.A0E(arrayList3.get(0).A0H, runnableC1927iN, Math.max(z12 ? A0C() : 0L, z13 ? A0B() : 0L) + (z11 ? A0D() : 0L));
            }
        }
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    @Override // com.facebook.ads.redexgen.X.AbstractC0976Ia
    public final boolean A0Z(AbstractC1978jE abstractC1978jE, int i5, int i11, int i12, int i13) {
        View view = abstractC1978jE.A0H;
        int translationX = i5 + ((int) abstractC1978jE.A0H.getTranslationX());
        int translationY = i11 + ((int) abstractC1978jE.A0H.getTranslationY());
        A02(abstractC1978jE);
        int i14 = i12 - translationX;
        int i15 = i13 - translationY;
        if (i14 == 0 && i15 == 0) {
            A0U(abstractC1978jE);
            return false;
        }
        if (i14 != 0) {
            view.setTranslationX(-i14);
        }
        if (i15 != 0) {
            view.setTranslationY(-i15);
        }
        this.A09.add(new C1934iU(abstractC1978jE, translationX, translationY, i12, i13));
        return true;
    }

    private void A00(C1933iT c1933iT) {
        if (c1933iT.A05 != null) {
            A05(c1933iT, c1933iT.A05);
        }
        if (c1933iT.A04 != null) {
            A05(c1933iT, c1933iT.A04);
        }
    }

    private void A01(AbstractC1978jE abstractC1978jE) {
        View view = abstractC1978jE.A0H;
        ViewPropertyAnimator viewPropertyAnimatorAnimate = view.animate();
        this.A06.add(abstractC1978jE);
        ViewPropertyAnimator animation = viewPropertyAnimatorAnimate.setDuration(A0D());
        animation.alpha(0.0f).setListener(new C1928iO(this, abstractC1978jE, viewPropertyAnimatorAnimate, view)).start();
    }

    private void A02(AbstractC1978jE abstractC1978jE) {
        if (A0B == null) {
            A0B = new ValueAnimator().getInterpolator();
        }
        abstractC1978jE.A0H.animate().setInterpolator(A0B);
        A0L(abstractC1978jE);
    }

    private final void A03(List<AbstractC1978jE> list) {
        for (int size = list.size() - 1; size >= 0; size--) {
            list.get(size).A0H.animate().cancel();
        }
    }

    private void A04(List<C1933iT> list, AbstractC1978jE abstractC1978jE) {
        for (int size = list.size() - 1; size >= 0; size--) {
            C1933iT changeInfo = list.get(size);
            if (A05(changeInfo, abstractC1978jE) && changeInfo.A05 == null && changeInfo.A04 == null) {
                list.remove(changeInfo);
            }
        }
    }

    private boolean A05(C1933iT c1933iT, AbstractC1978jE abstractC1978jE) {
        boolean z11 = false;
        if (c1933iT.A04 == abstractC1978jE) {
            c1933iT.A04 = null;
        } else if (c1933iT.A05 == abstractC1978jE) {
            c1933iT.A05 = null;
            z11 = true;
        } else {
            return false;
        }
        abstractC1978jE.A0H.setAlpha(1.0f);
        abstractC1978jE.A0H.setTranslationX(0.0f);
        abstractC1978jE.A0H.setTranslationY(0.0f);
        A0W(abstractC1978jE, z11);
        return true;
    }

    /* JADX WARN: Code restructure failed: missing block: B:35:0x00d6, code lost:
    
        r5 = r5 - 1;
     */
    @Override // com.facebook.ads.redexgen.X.AbstractC1956is
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A0L(AbstractC1978jE abstractC1978jE) {
        View view = abstractC1978jE.A0H;
        view.animate().cancel();
        for (int i5 = this.A09.size() - 1; i5 >= 0; i5--) {
            if (this.A09.get(i5).A04 == abstractC1978jE) {
                view.setTranslationY(0.0f);
                view.setTranslationX(0.0f);
                A0U(abstractC1978jE);
                this.A09.remove(i5);
            }
        }
        A04(this.A08, abstractC1978jE);
        if (this.A0A.remove(abstractC1978jE)) {
            view.setAlpha(1.0f);
            A0V(abstractC1978jE);
        }
        if (this.A07.remove(abstractC1978jE)) {
            view.setAlpha(1.0f);
            A0T(abstractC1978jE);
        }
        for (int i11 = this.A03.size() - 1; i11 >= 0; i11--) {
            ArrayList<C1933iT> arrayList = this.A03.get(i11);
            A04(arrayList, abstractC1978jE);
            if (arrayList.isEmpty()) {
                this.A03.remove(i11);
            }
        }
        int j11 = this.A05.size() - 1;
        while (j11 >= 0) {
            ArrayList<C1934iU> arrayList2 = this.A05.get(j11);
            int size = arrayList2.size() - 1;
            while (true) {
                if (size < 0) {
                    break;
                }
                if (arrayList2.get(size).A04 == abstractC1978jE) {
                    view.setTranslationY(0.0f);
                    view.setTranslationX(0.0f);
                    String[] strArr = A0C;
                    String str = strArr[4];
                    String str2 = strArr[3];
                    int i12 = str.charAt(9);
                    if (i12 != str2.charAt(9)) {
                        throw new RuntimeException();
                    }
                    A0C[1] = "ZnQkkSK02m4qlFQsfXGc8k1uWyp7aRL1";
                    A0U(abstractC1978jE);
                    arrayList2.remove(size);
                    if (arrayList2.isEmpty()) {
                        this.A05.remove(j11);
                    }
                } else {
                    size--;
                }
            }
        }
        int size2 = this.A01.size();
        if (A0C[0].charAt(3) == 'S') {
            throw new RuntimeException();
        }
        A0C[7] = "NHib0yCpDtVNZGbvtAXjIsv6RzrfBwwf";
        for (int i13 = size2 - 1; i13 >= 0; i13--) {
            ArrayList<AbstractC1978jE> arrayList3 = this.A01.get(i13);
            if (arrayList3.remove(abstractC1978jE)) {
                view.setAlpha(1.0f);
                A0T(abstractC1978jE);
                if (arrayList3.isEmpty()) {
                    this.A01.remove(i13);
                }
            }
        }
        this.A06.remove(abstractC1978jE);
        this.A00.remove(abstractC1978jE);
        this.A02.remove(abstractC1978jE);
        this.A04.remove(abstractC1978jE);
        A0b();
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0073  */
    @Override // com.facebook.ads.redexgen.X.AbstractC1956is
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean A0M() {
        if (this.A07.isEmpty() && this.A08.isEmpty() && this.A09.isEmpty() && this.A0A.isEmpty()) {
            boolean zIsEmpty = this.A04.isEmpty();
            String[] strArr = A0C;
            if (strArr[2].charAt(18) != strArr[5].charAt(18)) {
                String[] strArr2 = A0C;
                strArr2[4] = "HATKbuX1ioRbKjbJza4uRkbMkwnilInw";
                strArr2[3] = "55W5G9gSwoJRpeM2nuMk9rdzPBhIsXI5";
                if (zIsEmpty && this.A06.isEmpty()) {
                    boolean zIsEmpty2 = this.A00.isEmpty();
                    String[] strArr3 = A0C;
                    if (strArr3[2].charAt(18) != strArr3[5].charAt(18)) {
                        A0C[7] = "PBqWGImhwZdo7IXQpaNFK9QlBHxMp4wk";
                        if (zIsEmpty2) {
                            if (this.A02.isEmpty() && this.A05.isEmpty() && this.A01.isEmpty()) {
                                ArrayList<ArrayList<C1933iT>> arrayList = this.A03;
                                if (A0C[7].charAt(30) != 'w') {
                                    throw new RuntimeException();
                                }
                                A0C[7] = "80rjjAfjuSoUPBYOWBOUrC4mhnJBtDwK";
                                if (arrayList.isEmpty()) {
                                    return false;
                                }
                            }
                        }
                    } else if (zIsEmpty2) {
                    }
                }
            } else {
                throw new RuntimeException();
            }
        }
        return true;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1956is
    public final boolean A0S(AbstractC1978jE abstractC1978jE, List<Object> payloads) {
        return !payloads.isEmpty() || super.A0S(abstractC1978jE, payloads);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0976Ia
    public final boolean A0X(AbstractC1978jE abstractC1978jE) {
        A02(abstractC1978jE);
        abstractC1978jE.A0H.setAlpha(0.0f);
        this.A07.add(abstractC1978jE);
        return true;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0976Ia
    public final boolean A0Y(AbstractC1978jE abstractC1978jE) {
        A02(abstractC1978jE);
        this.A0A.add(abstractC1978jE);
        return true;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0976Ia
    public final boolean A0a(AbstractC1978jE abstractC1978jE, AbstractC1978jE abstractC1978jE2, int i5, int i11, int i12, int i13) {
        if (abstractC1978jE == abstractC1978jE2) {
            return A0Z(abstractC1978jE, i5, i11, i12, i13);
        }
        float translationX = abstractC1978jE.A0H.getTranslationX();
        float translationY = abstractC1978jE.A0H.getTranslationY();
        float prevTranslationY = abstractC1978jE.A0H.getAlpha();
        A02(abstractC1978jE);
        float prevTranslationX = i12 - i5;
        int deltaY = (int) (prevTranslationX - translationX);
        float prevTranslationX2 = i13 - i11;
        int deltaX = (int) (prevTranslationX2 - translationY);
        abstractC1978jE.A0H.setTranslationX(translationX);
        abstractC1978jE.A0H.setTranslationY(translationY);
        abstractC1978jE.A0H.setAlpha(prevTranslationY);
        if (abstractC1978jE2 != null) {
            A02(abstractC1978jE2);
            float prevTranslationX3 = -deltaY;
            abstractC1978jE2.A0H.setTranslationX(prevTranslationX3);
            float prevTranslationX4 = -deltaX;
            abstractC1978jE2.A0H.setTranslationY(prevTranslationX4);
            abstractC1978jE2.A0H.setAlpha(0.0f);
        }
        this.A08.add(new C1933iT(abstractC1978jE, abstractC1978jE2, i5, i11, i12, i13));
        return true;
    }

    public final void A0b() {
        if (!A0M()) {
            A0G();
        }
    }

    public final void A0c(C1933iT c1933iT) {
        View view;
        AbstractC1978jE holder = c1933iT.A05;
        if (holder == null) {
            view = null;
        } else {
            view = holder.A0H;
        }
        AbstractC1978jE holder2 = c1933iT.A04;
        View view2 = holder2 != null ? holder2.A0H : null;
        if (view != null) {
            ViewPropertyAnimator oldViewAnim = view.animate().setDuration(A0B());
            this.A02.add(c1933iT.A05);
            oldViewAnim.translationX(c1933iT.A02 - c1933iT.A00);
            oldViewAnim.translationY(c1933iT.A03 - c1933iT.A01);
            oldViewAnim.alpha(0.0f).setListener(new C1931iR(this, c1933iT, oldViewAnim, view)).start();
        }
        if (view2 != null) {
            ViewPropertyAnimator viewPropertyAnimatorAnimate = view2.animate();
            this.A02.add(c1933iT.A04);
            viewPropertyAnimatorAnimate.translationX(0.0f).translationY(0.0f).setDuration(A0B()).alpha(1.0f).setListener(new C1932iS(this, c1933iT, viewPropertyAnimatorAnimate, view2)).start();
        }
    }

    public final void A0d(AbstractC1978jE abstractC1978jE) {
        View view = abstractC1978jE.A0H;
        ViewPropertyAnimator viewPropertyAnimatorAnimate = view.animate();
        this.A00.add(abstractC1978jE);
        ViewPropertyAnimator animation = viewPropertyAnimatorAnimate.alpha(1.0f).setDuration(A0A());
        animation.setListener(new C1929iP(this, abstractC1978jE, view, viewPropertyAnimatorAnimate)).start();
    }

    public final void A0e(AbstractC1978jE abstractC1978jE, int i5, int i11, int i12, int i13) {
        View view = abstractC1978jE.A0H;
        int i14 = i12 - i5;
        int i15 = i13 - i11;
        if (i14 != 0) {
            view.animate().translationX(0.0f);
        }
        if (i15 != 0) {
            view.animate().translationY(0.0f);
        }
        ViewPropertyAnimator viewPropertyAnimatorAnimate = view.animate();
        this.A04.add(abstractC1978jE);
        viewPropertyAnimatorAnimate.setDuration(A0C()).setListener(new C1930iQ(this, abstractC1978jE, i14, view, i15, viewPropertyAnimatorAnimate)).start();
    }
}
