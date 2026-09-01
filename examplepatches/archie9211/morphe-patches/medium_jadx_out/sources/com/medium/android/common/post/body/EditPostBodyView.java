package com.medium.android.common.post.body;

import android.content.Context;
import android.os.Build;
import android.text.Editable;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.LinearLayout;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.google.android.material.internal.It.KLTXZbnQvj;
import com.medium.android.common.post.iframe.ParagraphEditIframeLayout;
import com.medium.android.common.post.image.ParagraphEditImageLayout;
import com.medium.android.common.post.mixtape.ParagraphEditMixtapeLayout;
import com.medium.android.common.post.pre.ParagraphEditPreLayout;
import com.medium.android.common.post.text.ParagraphEditText;
import com.medium.android.common.post.text.ParagraphEditTextLayout;
import com.medium.android.common.post.unsupported.ParagraphEditUnsupportedLayout;
import com.medium.android.graphql.fragment.ParagraphData;
import com.medium.proto.model.IframeMetadata;
import com.medium.proto.model.MixtapeMetadata;
import com.medium.proto.model.ParagraphPb;
import com.medium.proto.model.PlaybackModel;
import com.medium.proto.model.SectionModel;
import com.medium.proto.model.SelectionPb;
import com.medium.proto.model.SelectionPoint;
import com.medium.proto.obv.post.Alignment;
import com.medium.proto.obv.post.BlockLayout;
import com.medium.proto.obv.post.ParagraphPurpose;
import com.medium.proto.obv.post.ParagraphType;
import com.medium.proto.obv.post.SelectionPointType;
import com.medium.proto.obv.post.TranslationStatus;
import com.medium.reader.R;
import defpackage.ak3;
import defpackage.ay0;
import defpackage.bu1;
import defpackage.c19;
import defpackage.c1e;
import defpackage.cu1;
import defpackage.d19;
import defpackage.d39;
import defpackage.d46;
import defpackage.d73;
import defpackage.e19;
import defpackage.e87;
import defpackage.ei7;
import defpackage.ey3;
import defpackage.fi9;
import defpackage.fo7;
import defpackage.fy3;
import defpackage.g01;
import defpackage.g63;
import defpackage.g76;
import defpackage.h1c;
import defpackage.h63;
import defpackage.hpe;
import defpackage.hu7;
import defpackage.hy2;
import defpackage.i19;
import defpackage.iq7;
import defpackage.j19;
import defpackage.jzb;
import defpackage.k63;
import defpackage.kde;
import defpackage.km4;
import defpackage.l09;
import defpackage.l19;
import defpackage.l28;
import defpackage.l63;
import defpackage.mp3;
import defpackage.n19;
import defpackage.nld;
import defpackage.no3;
import defpackage.np3;
import defpackage.nvb;
import defpackage.nvg;
import defpackage.o54;
import defpackage.o98;
import defpackage.olb;
import defpackage.op3;
import defpackage.pde;
import defpackage.pkf;
import defpackage.q09;
import defpackage.r06;
import defpackage.rxb;
import defpackage.s0;
import defpackage.s63;
import defpackage.tg1;
import defpackage.wl9;
import defpackage.wld;
import defpackage.x2b;
import defpackage.y09;
import defpackage.y5d;
import defpackage.ygf;
import defpackage.z63;
import defpackage.z72;
import defpackage.zi5;
import defpackage.zm3;
import defpackage.zm7;
import gen.model.ImageMetadata;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class EditPostBodyView extends LinearLayout implements fi9 {
    public static final /* synthetic */ int q = 0;
    public final l19 a;
    public final i19 b;
    public final c19 c;
    public final d19 d;
    public final q09 e;
    public final e19 f;
    public np3 g;
    public d39 h;
    public boolean i;
    public tg1 j;
    public kde k;
    public hu7 l;
    public nld m;
    public nvg n;
    public o98 o;
    public y5d p;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public EditPostBodyView(Context context) {
        super(context);
        context.getClass();
        this.a = new l19(this, new s0(27, this));
        this.b = !isInEditMode() ? new olb(11, this) : zi5.f;
        this.c = !isInEditMode() ? new op3(this) : h1c.h;
        this.d = !isInEditMode() ? new zm7(13, this) : hpe.g;
        this.e = !isInEditMode() ? new pkf(this) : jzb.e;
        this.f = !isInEditMode() ? new op3(this) : no3.f;
        this.g = mp3.a;
        this.n = new nvg(new PlaybackModel(null, null, null, null, null, null, null, null, null, null, 1023, null));
        this.o = new o98();
    }

    private final j19 getFocusedGraf() {
        KeyEvent.Callback focusedChild = getFocusedChild();
        if (focusedChild instanceof j19) {
            return (j19) focusedChild;
        }
        return null;
    }

    public static final c1e t(EditPostBodyView editPostBodyView, SectionModel sectionModel) {
        sectionModel.getClass();
        int i = sectionModel.start_index;
        Integer numF = editPostBodyView.f(i);
        if (numF != null) {
            if (numF.intValue() <= 0) {
                numF = null;
            }
            if (numF != null) {
                editPostBodyView.n.a(new l63(numF.intValue()), d73.COMMAND);
            }
        }
        ParagraphPb paragraphPbR = editPostBodyView.r(i);
        c1e c1eVar = c1e.a;
        if (paragraphPbR == null) {
            return c1eVar;
        }
        x2b x2bVar = l28.a;
        if (l28.b(paragraphPbR.type)) {
            SelectionPb selectionPb = rxb.a;
            editPostBodyView.setSelection(rxb.b(i));
            return c1eVar;
        }
        SelectionPb selectionPb2 = rxb.a;
        editPostBodyView.setSelection(rxb.a(i, 0));
        return c1eVar;
    }

    public final l09 a(ParagraphPb paragraphPb) {
        List<ParagraphPb> list = this.n.c().paragraphs;
        int iIndexOf = list.indexOf(paragraphPb);
        if (iIndexOf == -1) {
            ygf.f("Check failed.");
            return null;
        }
        SectionModel sectionModel = new SectionModel(null, 0, null, null, null, null, null, null, null, null, PhotoshopDirectory.TAG_EPS_OPTIONS, null);
        wl9 wl9Var = wl9.EDIT_POST;
        wl9Var.getClass();
        ArrayList arrayList = new ArrayList(cu1.k0(list, 10));
        Iterator<T> it2 = list.iterator();
        while (it2.hasNext()) {
            arrayList.add(n19.e((ParagraphPb) it2.next()));
        }
        ey3 ey3Var = ey3.a;
        return new l09(arrayList, ey3Var, sectionModel, iIndexOf, wl9Var, null, ey3Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0025  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void c(defpackage.yw1 r3) {
        /*
            r2 = this;
            java.lang.String r0 = r3.getParagraphName()
            if (r0 == 0) goto L2a
            r06 r0 = r2.q(r0)
            if (r0 == 0) goto L25
            int r0 = r0.a
            java.lang.Integer r1 = java.lang.Integer.valueOf(r0)
            if (r0 < 0) goto L15
            goto L16
        L15:
            r1 = 0
        L16:
            if (r1 == 0) goto L25
            l19 r0 = r2.a
            int r1 = r1.intValue()
            j19 r0 = r0.b(r1)
            if (r0 == 0) goto L25
            goto L2e
        L25:
            j19 r0 = r2.getFocusedGraf()
            goto L2e
        L2a:
            j19 r0 = r2.getFocusedGraf()
        L2e:
            if (r0 == 0) goto L33
            r0.g(r3)
        L33:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.medium.android.common.post.body.EditPostBodyView.c(yw1):void");
    }

    public final int d(View view) {
        Object next;
        view.getClass();
        List listD = this.a.d();
        Iterator it2 = listD.iterator();
        while (true) {
            if (!it2.hasNext()) {
                next = null;
                break;
            }
            next = it2.next();
            if (g76.L((j19) next, view)) {
                break;
            }
        }
        j19 j19Var = (j19) next;
        if (j19Var != null) {
            return listD.indexOf(j19Var);
        }
        return -1;
    }

    public final SectionModel e(int i) {
        int i2 = nvb.a;
        List<SectionModel> list = this.n.c().sections;
        list.getClass();
        Integer numA = nvb.a(i, list);
        if (numA != null) {
            return (SectionModel) bu1.A0(numA.intValue(), list);
        }
        return null;
    }

    public final Integer f(int i) {
        int i2 = nvb.a;
        return nvb.a(i, this.n.c().sections);
    }

    public final void g(int i, ParagraphPb paragraphPb) {
        paragraphPb.getClass();
        this.n.a(new g63(i, this.o.b(paragraphPb), null), d73.COMMAND);
    }

    public final tg1 getCatalogUiModelMapper() {
        return this.j;
    }

    public final String getCurrentFocusSelectedText() {
        j19 focusedGraf = getFocusedGraf();
        if (focusedGraf == null) {
            return null;
        }
        SelectionPb selection = focusedGraf.getSelection();
        String str = focusedGraf.f().text;
        if (str != null) {
            return str.substring(selection.start.offset, selection.end.offset);
        }
        return null;
    }

    public final ParagraphType getCurrentFocusType() {
        j19 focusedGraf = getFocusedGraf();
        if (focusedGraf != null) {
            return focusedGraf.getType();
        }
        return null;
    }

    @Override // defpackage.fi9
    public int getGrafCount() {
        return this.a.c();
    }

    public final ParagraphPb getLastParagraphPb() {
        int grafCount = getGrafCount() - 1;
        if (grafCount < 0) {
            grafCount = 0;
        }
        KeyEvent.Callback childAt = getChildAt(grafCount);
        if (childAt instanceof j19) {
            return ((j19) childAt).f();
        }
        return null;
    }

    public final np3 getListener() {
        return this.g;
    }

    public final hu7 getMediumUris() {
        return this.l;
    }

    @Override // defpackage.fi9
    public o98 getNameGenerator() {
        return this.o;
    }

    public int getSectionCount() {
        return this.n.c().sections.size();
    }

    @Override // defpackage.fi9
    public SelectionPb getSelection() {
        j19 focusedGraf = getFocusedGraf();
        if (focusedGraf != null) {
            return focusedGraf.getSelection();
        }
        return null;
    }

    public final kde getUserMentionAdapter() {
        return this.k;
    }

    public final l19 getViewListController() {
        return this.a;
    }

    public final void h(int i, ParagraphPb paragraphPb, y09 y09Var) {
        g(i, paragraphPb);
        r(i);
        j19 j19VarB = this.a.b(i);
        ParagraphEditImageLayout paragraphEditImageLayout = j19VarB instanceof ParagraphEditImageLayout ? (ParagraphEditImageLayout) j19VarB : null;
        if (paragraphEditImageLayout != null) {
            paragraphEditImageLayout.i(y09Var);
        }
    }

    public final void i(int i, d73 d73Var) {
        l19 l19Var = this.a;
        List listD = l19Var.d();
        int i2 = 0;
        while (i2 < listD.size()) {
            if (i2 != i) {
                j19 j19Var = (j19) listD.get(i2);
                Set set = l09.i;
                ParagraphData paragraphDataE = n19.e(j19Var.f());
                if (!fo7.M(paragraphDataE) && !bu1.p0(l09.j, paragraphDataE.getType())) {
                    break;
                }
            }
            i2++;
        }
        if (i <= i2) {
            for (int i3 = 0; i3 <= i2 && i3 < l19Var.c(); i3++) {
                k(i3, d73Var);
            }
        }
    }

    public final void j(int i) {
        l19 l19Var = this.a;
        int iC = l19Var.c();
        while (i >= 0 && i < iC) {
            j19 j19VarB = l19Var.b(i);
            if ((j19VarB != null ? j19VarB.getType() : null) != ParagraphType.OLI) {
                return;
            }
            ParagraphPb paragraphPbR = r(i);
            if (paragraphPbR != null) {
                j19VarB.e(a(paragraphPbR));
                i++;
            }
        }
    }

    public final void k(int i, d73 d73Var) {
        if (i >= 0) {
            l19 l19Var = this.a;
            if (i >= l19Var.c()) {
                return;
            }
            j19 j19VarB = l19Var.b(i);
            d73Var.getClass();
            m(i, d73Var);
            ParagraphPb paragraphPb = (ParagraphPb) bu1.A0(i, this.n.c().paragraphs);
            if (j19VarB == null || paragraphPb == null || !j19VarB.isAttachedToWindow()) {
                return;
            }
            j19VarB.e(a(paragraphPb));
        }
    }

    public final boolean l() {
        j19 focusedGraf = getFocusedGraf();
        if (focusedGraf != null) {
            return focusedGraf.d();
        }
        return false;
    }

    public final void m(int i, d73 d73Var) {
        ParagraphPb paragraphPbF;
        if (this.i) {
            return;
        }
        this.i = true;
        try {
            ParagraphPb paragraphPb = (ParagraphPb) bu1.A0(i, this.n.c().paragraphs);
            if (paragraphPb == null) {
                return;
            }
            j19 j19VarB = this.a.b(i);
            if (j19VarB != null && (paragraphPbF = j19VarB.f()) != null) {
                if (!paragraphPb.equals(paragraphPbF)) {
                    s(i, paragraphPbF, d73Var);
                }
            }
        } finally {
            this.i = false;
        }
    }

    public final void n(j19 j19Var) {
        Object next;
        if (this.i) {
            return;
        }
        this.i = true;
        try {
            Iterator it2 = bu1.s1(this.n.c().paragraphs).iterator();
            while (true) {
                if (!((zm3) it2).b.hasNext()) {
                    next = null;
                    break;
                } else {
                    next = ((zm3) it2).next();
                    if (g76.L(((ParagraphPb) ((r06) next).b).name, j19Var.getParagraphName())) {
                        break;
                    }
                }
            }
            r06 r06Var = (r06) next;
            if (r06Var == null) {
                this.i = false;
                return;
            }
            ParagraphPb paragraphPb = (ParagraphPb) r06Var.b;
            ParagraphPb paragraphPbF = j19Var.f();
            if (!g76.L(paragraphPb, paragraphPbF)) {
                s(r06Var.a, paragraphPbF, d73.VIEW_SYNC);
            }
            this.i = false;
        } catch (Throwable th) {
            this.i = false;
            throw th;
        }
    }

    public final void o(int i) {
        this.n.a(new k63(i), d73.COMMAND);
    }

    public final void p(int i) {
        ParagraphPb paragraphPbR = r(0);
        if (paragraphPbR == null) {
            return;
        }
        o(i);
        String str = null;
        List list = null;
        BlockLayout blockLayout = null;
        String str2 = null;
        ImageMetadata imageMetadata = null;
        IframeMetadata iframeMetadata = null;
        Boolean bool = null;
        Alignment alignment = null;
        String str3 = null;
        MixtapeMetadata mixtapeMetadata = null;
        TranslationStatus translationStatus = null;
        ImageMetadata imageMetadata2 = null;
        ParagraphPurpose paragraphPurpose = null;
        g(i, new ParagraphPb(paragraphPbR.name, ParagraphType.P, str, list, blockLayout, str2, imageMetadata, iframeMetadata, bool, alignment, str3, mixtapeMetadata, translationStatus, imageMetadata2, paragraphPurpose, paragraphPbR.id, null, null, null, 491516, null));
        SelectionPb selectionPb = rxb.a;
        setSelection(rxb.a(i, 0));
    }

    public final r06 q(String str) {
        Object obj;
        Object next;
        ParagraphPb paragraphPbF;
        str.getClass();
        Iterator it2 = bu1.s1(this.n.c().paragraphs).iterator();
        while (true) {
            zm3 zm3Var = (zm3) it2;
            obj = null;
            if (!zm3Var.b.hasNext()) {
                next = null;
                break;
            }
            next = zm3Var.next();
            if (g76.L(((ParagraphPb) ((r06) next).b).name, str)) {
                break;
            }
        }
        r06 r06Var = (r06) next;
        if (r06Var == null) {
            return null;
        }
        int i = r06Var.a;
        ParagraphPb paragraphPb = (ParagraphPb) r06Var.b;
        l19 l19Var = this.a;
        l19Var.getClass();
        Iterator it3 = l19Var.d().iterator();
        while (true) {
            if (!it3.hasNext()) {
                break;
            }
            Object next2 = it3.next();
            j19 j19Var = (j19) next2;
            j19Var.getClass();
            if (g76.L(j19Var.getParagraphName(), str)) {
                obj = next2;
                break;
            }
        }
        j19 j19Var2 = (j19) obj;
        if (j19Var2 == null || (paragraphPbF = j19Var2.f()) == null || g76.L(paragraphPb, paragraphPbF)) {
            return r06Var;
        }
        s(i, paragraphPbF, d73.VIEW_SYNC);
        return new r06(i, paragraphPbF);
    }

    public final ParagraphPb r(int i) {
        m(i, d73.VIEW_SYNC);
        return (ParagraphPb) bu1.A0(i, this.n.c().paragraphs);
    }

    public final void s(int i, ParagraphPb paragraphPb, d73 d73Var) {
        String str = this.n.c().paragraphs.get(i).name;
        String str2 = paragraphPb.name;
        this.n.a(new s63(i, this.o.b(paragraphPb), Boolean.valueOf((str == null || str2 == null || !str.equals(str2)) ? false : true)), d73Var);
    }

    public final void setCatalogUiModelMapper(tg1 tg1Var) {
        this.j = tg1Var;
    }

    public final void setChangeMonitor(nld nldVar) {
        this.m = nldVar;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void setDraft(ak3 ak3Var) {
        Object[] objArr;
        l19 l19Var;
        ak3Var.getClass();
        List list = ak3Var.h;
        List list2 = ak3Var.g;
        if (this.h == null) {
            ygf.f("you must set a ParagraphStylerFactory before setting paragraphs");
            return;
        }
        this.n = new nvg(ak3Var.f);
        boolean zIsEmpty = list2.isEmpty();
        fy3 fy3Var = fy3.a;
        int i = 0;
        if (!zIsEmpty) {
            String str = "Setting draft with normalizing deltas: " + list2;
            km4.I(wld.a, null, str, new Object[0], str);
            hy2 hy2Var = g01.y;
            if (hy2Var != null) {
                LinkedHashMap linkedHashMapS = ei7.S(fy3Var, hy2Var.c());
                e87 e87Var = (e87) hy2Var.d.getValue();
                e87Var.getClass();
                e87.b(e87Var, 3, str, null, linkedHashMapS);
            }
        }
        if (!list.isEmpty()) {
            String str2 = "Setting draft with pending deltas: " + list;
            km4.I(wld.a, null, str2, new Object[0], str2);
            hy2 hy2Var2 = g01.y;
            if (hy2Var2 != null) {
                LinkedHashMap linkedHashMapS2 = ei7.S(fy3Var, hy2Var2.c());
                e87 e87Var2 = (e87) hy2Var2.d.getValue();
                e87Var2.getClass();
                e87.b(e87Var2, 3, str2, null, linkedHashMapS2);
            }
        }
        Iterator it2 = list2.iterator();
        while (it2.hasNext()) {
            this.n.a((z63) it2.next(), d73.INIT);
        }
        Iterator it3 = list.iterator();
        while (it3.hasNext()) {
            this.n.a((z63) it3.next(), d73.INIT);
        }
        nvg nvgVar = this.n;
        if (((EditPostBodyView) nvgVar.d) != null) {
            ygf.f("Only one delta callback allowed");
            return;
        }
        nvgVar.d = this;
        removeAllViews();
        List<SectionModel> list3 = this.n.c().sections;
        if (list3 == null || !list3.isEmpty()) {
            Iterator<T> it4 = list3.iterator();
            while (it4.hasNext()) {
                if (((SectionModel) it4.next()).start_index == 0) {
                    objArr = true;
                    break;
                }
            }
            objArr = false;
        } else {
            objArr = false;
        }
        if (list3.isEmpty() || objArr == false) {
            this.n.a(new h63(0, this.o.c(new SectionModel(null, 0, null, null, null, null, null, null, null, null, PhotoshopDirectory.TAG_EPS_OPTIONS, null))), d73.COMMAND);
        }
        List<ParagraphPb> list4 = this.n.c().paragraphs;
        if (list4.isEmpty()) {
            String str3 = null;
            for (Object obj : d46.R(new ParagraphPb(this.o.a(), ParagraphType.H3, null, null, null, null, null, null, null, null, null, null, null, null, null, null, str3, null, null, 524284, null), new ParagraphPb(this.o.a(), ParagraphType.P, 0 == true ? 1 : 0, 0 == true ? 1 : 0, 0 == true ? 1 : 0, 0 == true ? 1 : 0, 0 == true ? 1 : 0, 0 == true ? 1 : 0, 0 == true ? 1 : 0, 0 == true ? 1 : 0, 0 == true ? 1 : 0, 0 == true ? 1 : 0, 0 == true ? 1 : 0, 0 == true ? 1 : 0, 0 == true ? 1 : 0, str3, 0 == true ? 1 : 0, 0 == true ? 1 : 0, null, 524284, null))) {
                int i2 = i + 1;
                if (i < 0) {
                    d46.i0();
                    throw null;
                }
                g(i, (ParagraphPb) obj);
                i = i2;
            }
            return;
        }
        SectionModel sectionModel = new SectionModel(null, 0, null, null, null, null, null, null, null, null, PhotoshopDirectory.TAG_EPS_OPTIONS, null);
        wl9 wl9Var = wl9.EDIT_POST;
        wl9Var.getClass();
        List<ParagraphPb> list5 = this.n.c().paragraphs;
        list5.getClass();
        ArrayList arrayList = new ArrayList(cu1.k0(list5, 10));
        Iterator<T> it5 = list5.iterator();
        while (it5.hasNext()) {
            arrayList.add(n19.e((ParagraphPb) it5.next()));
        }
        int size = list4.size();
        int i3 = 0;
        while (true) {
            l19Var = this.a;
            if (i3 >= size) {
                break;
            }
            this.o.b(list4.get(i3));
            SectionModel sectionModel2 = sectionModel;
            ey3 ey3Var = ey3.a;
            sectionModel = sectionModel2;
            j19 j19VarB = b(new l09(arrayList, ey3Var, sectionModel2, i3, wl9Var, null, ey3Var));
            l19Var.getClass();
            l19Var.a.addView(j19VarB.a());
            i3++;
        }
        for (Object obj2 : this.n.c().sections) {
            int i4 = i + 1;
            if (i < 0) {
                d46.i0();
                throw null;
            }
            l19Var.a(i, (SectionModel) obj2);
            i = i4;
        }
    }

    public final void setListener(np3 np3Var) {
        np3Var.getClass();
        this.g = np3Var;
    }

    public final void setMediumUris(hu7 hu7Var) {
        this.l = hu7Var;
    }

    public final void setNameGenerator(o98 o98Var) {
        o98Var.getClass();
        this.o = o98Var;
    }

    public final void setParagraphStylerFactory(d39 d39Var) {
        this.h = d39Var;
    }

    @Override // defpackage.fi9
    public void setSelection(SelectionPb selectionPb) {
        selectionPb.getClass();
        SelectionPoint selectionPoint = selectionPb.start;
        int i = selectionPoint.paragraph_index;
        SelectionPoint selectionPoint2 = selectionPb.end;
        if (i != selectionPoint2.paragraph_index) {
            requestFocus();
            return;
        }
        SelectionPointType selectionPointType = selectionPoint.type;
        if (selectionPointType != selectionPoint2.type) {
            requestFocus();
            return;
        }
        int i2 = selectionPoint.offset;
        int i3 = selectionPoint2.offset;
        if (i >= 0) {
            l19 l19Var = this.a;
            if (i < l19Var.c()) {
                j19 j19VarB = l19Var.b(i);
                if (j19VarB == null) {
                    requestFocus();
                    return;
                }
                boolean z = j19VarB instanceof ParagraphEditImageLayout;
                if (z && selectionPointType == SelectionPointType.MEDIA) {
                    ((ParagraphEditImageLayout) j19VarB).g.requestFocus();
                    return;
                }
                if (z && selectionPointType == SelectionPointType.TEXT) {
                    ParagraphEditImageLayout paragraphEditImageLayout = (ParagraphEditImageLayout) j19VarB;
                    ParagraphEditText paragraphEditText = paragraphEditImageLayout.j;
                    paragraphEditText.requestFocus();
                    Context context = paragraphEditImageLayout.getContext();
                    context.getClass();
                    InputMethodManager inputMethodManager = (InputMethodManager) context.getSystemService(InputMethodManager.class);
                    if (inputMethodManager != null) {
                        inputMethodManager.showSoftInput(paragraphEditText, 1);
                    }
                    int length = paragraphEditText.getText().length();
                    paragraphEditText.setSelection(iq7.v(i2, 0, length), iq7.v(i3, 0, length));
                    return;
                }
                if (j19VarB instanceof ParagraphEditPreLayout) {
                    ((ParagraphEditPreLayout) j19VarB).requestFocus();
                    return;
                }
                if (j19VarB instanceof ParagraphEditMixtapeLayout) {
                    ((ParagraphEditMixtapeLayout) j19VarB).requestFocus();
                    return;
                }
                boolean z2 = j19VarB instanceof ParagraphEditIframeLayout;
                if (z2 && selectionPointType == SelectionPointType.MEDIA) {
                    ((ParagraphEditIframeLayout) j19VarB).e.requestFocus();
                    return;
                }
                if (z2 && selectionPointType == SelectionPointType.TEXT) {
                    ParagraphEditIframeLayout paragraphEditIframeLayout = (ParagraphEditIframeLayout) j19VarB;
                    ParagraphEditText paragraphEditText2 = paragraphEditIframeLayout.h;
                    paragraphEditText2.requestFocus();
                    Context context2 = paragraphEditIframeLayout.getContext();
                    context2.getClass();
                    InputMethodManager inputMethodManager2 = (InputMethodManager) context2.getSystemService(InputMethodManager.class);
                    if (inputMethodManager2 != null) {
                        inputMethodManager2.showSoftInput(paragraphEditText2, 1);
                    }
                    int length2 = paragraphEditText2.getText().length();
                    paragraphEditText2.setSelection(iq7.v(i2, 0, length2), iq7.v(i3, 0, length2));
                    return;
                }
                if (j19VarB instanceof ParagraphEditTextLayout) {
                    ParagraphEditTextLayout paragraphEditTextLayout = (ParagraphEditTextLayout) j19VarB;
                    ParagraphEditText paragraphEditText3 = paragraphEditTextLayout.c;
                    paragraphEditTextLayout.requestFocus();
                    Context context3 = paragraphEditTextLayout.getContext();
                    context3.getClass();
                    InputMethodManager inputMethodManager3 = (InputMethodManager) context3.getSystemService(InputMethodManager.class);
                    if (inputMethodManager3 != null) {
                        inputMethodManager3.showSoftInput(paragraphEditText3, 1);
                    }
                    Editable text = paragraphEditText3.getText();
                    int length3 = text != null ? text.length() : 0;
                    paragraphEditText3.setSelection(iq7.v(i2, 0, length3), iq7.v(i3, 0, length3));
                    return;
                }
                return;
            }
        }
        requestFocus();
    }

    public final void setUserMentionAdapter(kde kdeVar) {
        this.k = kdeVar;
    }

    public final j19 b(l09 l09Var) {
        ParagraphPb paragraphPbA = o54.a(l09Var.b());
        ParagraphType paragraphType = paragraphPbA.type;
        if (paragraphType == ParagraphType.PRE && paragraphPbA.code_block_metadata != null && Build.VERSION.SDK_INT >= 27) {
            View viewInflate = LayoutInflater.from(getContext()).inflate(R.layout.common_edit_post_paragraph_pre, (ViewGroup) this, false);
            if (viewInflate != null) {
                ParagraphEditPreLayout paragraphEditPreLayout = (ParagraphEditPreLayout) viewInflate;
                d39 d39Var = this.h;
                if (d39Var != null) {
                    paragraphEditPreLayout.setParagraphStylerFactory(d39Var);
                    paragraphEditPreLayout.setListener(this.f);
                    paragraphEditPreLayout.setPostMorpher(this);
                    paragraphEditPreLayout.setSelectedLanguage(this.p);
                    paragraphEditPreLayout.b(l09Var);
                    return paragraphEditPreLayout;
                }
                ay0.e("paragraphStylerFactory cannot be null");
                return null;
            }
            z72.c(KLTXZbnQvj.YkGLflv);
            return null;
        }
        boolean zC = l28.c(paragraphType);
        pde pdeVar = pde.a;
        if (zC) {
            View viewInflate2 = LayoutInflater.from(getContext()).inflate(R.layout.common_edit_post_paragraph_p, (ViewGroup) this, false);
            if (viewInflate2 != null) {
                ParagraphEditTextLayout paragraphEditTextLayout = (ParagraphEditTextLayout) viewInflate2;
                kde kdeVar = this.k;
                if (kdeVar != null) {
                    ParagraphEditText paragraphEditText = paragraphEditTextLayout.c;
                    paragraphEditText.setAdapter(kdeVar);
                    paragraphEditText.setTokenizer(pdeVar);
                }
                d39 d39Var2 = this.h;
                if (d39Var2 != null) {
                    paragraphEditTextLayout.setParagraphStylerFactory(d39Var2);
                    paragraphEditTextLayout.setListener(this.b);
                    paragraphEditTextLayout.setPostMorpher(this);
                    paragraphEditTextLayout.b(l09Var);
                    return paragraphEditTextLayout;
                }
                ay0.e("paragraphStylerFactory cannot be null");
                return null;
            }
            z72.c("null cannot be cast to non-null type com.medium.android.common.post.text.ParagraphEditTextLayout");
            return null;
        }
        if (paragraphType == ParagraphType.IMG) {
            View viewInflate3 = LayoutInflater.from(getContext()).inflate(R.layout.common_edit_post_paragraph_image, (ViewGroup) this, false);
            if (viewInflate3 != null) {
                ParagraphEditImageLayout paragraphEditImageLayout = (ParagraphEditImageLayout) viewInflate3;
                kde kdeVar2 = this.k;
                if (kdeVar2 != null) {
                    ParagraphEditText paragraphEditText2 = paragraphEditImageLayout.j;
                    paragraphEditText2.setAdapter(kdeVar2);
                    paragraphEditText2.setTokenizer(pdeVar);
                }
                d39 d39Var3 = this.h;
                if (d39Var3 != null) {
                    paragraphEditImageLayout.setParagraphStylerFactory(d39Var3);
                    paragraphEditImageLayout.setListener(this.c);
                    paragraphEditImageLayout.setPostMorpher(this);
                    paragraphEditImageLayout.b(l09Var);
                    return paragraphEditImageLayout;
                }
                ay0.e("paragraphStylerFactory cannot be null");
                return null;
            }
            z72.c("null cannot be cast to non-null type com.medium.android.common.post.image.ParagraphEditImageLayout");
            return null;
        }
        if (paragraphType == ParagraphType.MIXTAPE_EMBED) {
            View viewInflate4 = LayoutInflater.from(getContext()).inflate(R.layout.common_edit_post_paragraph_mixtape, (ViewGroup) this, false);
            if (viewInflate4 != null) {
                ParagraphEditMixtapeLayout paragraphEditMixtapeLayout = (ParagraphEditMixtapeLayout) viewInflate4;
                tg1 tg1Var = this.j;
                if (tg1Var != null) {
                    paragraphEditMixtapeLayout.setCatalogUiModelMapper(tg1Var);
                    d39 d39Var4 = this.h;
                    if (d39Var4 != null) {
                        paragraphEditMixtapeLayout.setParagraphStylerFactory(d39Var4);
                        paragraphEditMixtapeLayout.setListener(this.d);
                        paragraphEditMixtapeLayout.setPostMorpher(this);
                        paragraphEditMixtapeLayout.b(l09Var);
                        return paragraphEditMixtapeLayout;
                    }
                    ay0.e("paragraphStylerFactory cannot be null");
                    return null;
                }
                ay0.e("catalogUiModelMapper cannot be null");
                return null;
            }
            z72.c("null cannot be cast to non-null type com.medium.android.common.post.mixtape.ParagraphEditMixtapeLayout");
            return null;
        }
        if (paragraphType == ParagraphType.IFRAME) {
            View viewInflate5 = LayoutInflater.from(getContext()).inflate(R.layout.common_edit_post_paragraph_iframe, (ViewGroup) this, false);
            if (viewInflate5 != null) {
                ParagraphEditIframeLayout paragraphEditIframeLayout = (ParagraphEditIframeLayout) viewInflate5;
                kde kdeVar3 = this.k;
                if (kdeVar3 != null) {
                    ParagraphEditText paragraphEditText3 = paragraphEditIframeLayout.h;
                    paragraphEditText3.setAdapter(kdeVar3);
                    paragraphEditText3.setTokenizer(pdeVar);
                }
                hu7 hu7Var = this.l;
                if (hu7Var != null) {
                    paragraphEditIframeLayout.setMediumUris(hu7Var);
                    d39 d39Var5 = this.h;
                    if (d39Var5 != null) {
                        paragraphEditIframeLayout.setParagraphStylerFactory(d39Var5);
                        paragraphEditIframeLayout.setListener(this.e);
                        paragraphEditIframeLayout.setPostMorpher(this);
                        paragraphEditIframeLayout.b(l09Var);
                        return paragraphEditIframeLayout;
                    }
                    ay0.e("paragraphStylerFactory cannot be null");
                    return null;
                }
                ay0.e("mediumUris cannot be null");
                return null;
            }
            z72.c("null cannot be cast to non-null type com.medium.android.common.post.iframe.ParagraphEditIframeLayout");
            return null;
        }
        View viewInflate6 = LayoutInflater.from(getContext()).inflate(R.layout.common_edit_post_paragraph_unsupported, (ViewGroup) this, false);
        if (viewInflate6 != null) {
            ParagraphEditUnsupportedLayout paragraphEditUnsupportedLayout = (ParagraphEditUnsupportedLayout) viewInflate6;
            paragraphEditUnsupportedLayout.a = o54.a(l09Var.b());
            return paragraphEditUnsupportedLayout;
        }
        z72.c("null cannot be cast to non-null type com.medium.android.common.post.unsupported.ParagraphEditUnsupportedLayout");
        return null;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public EditPostBodyView(Context context, AttributeSet attributeSet) {
        i19 olbVar;
        c19 op3Var;
        d19 zm7Var;
        q09 pkfVar;
        e19 op3Var2;
        super(context, attributeSet);
        context.getClass();
        this.a = new l19(this, new s0(27, this));
        if (!isInEditMode()) {
            olbVar = new olb(11, this);
        } else {
            olbVar = zi5.f;
        }
        this.b = olbVar;
        if (!isInEditMode()) {
            op3Var = new op3(this);
        } else {
            op3Var = h1c.h;
        }
        this.c = op3Var;
        if (!isInEditMode()) {
            zm7Var = new zm7(13, this);
        } else {
            zm7Var = hpe.g;
        }
        this.d = zm7Var;
        if (!isInEditMode()) {
            pkfVar = new pkf(this);
        } else {
            pkfVar = jzb.e;
        }
        this.e = pkfVar;
        if (!isInEditMode()) {
            op3Var2 = new op3(this);
        } else {
            op3Var2 = no3.f;
        }
        this.f = op3Var2;
        this.g = mp3.a;
        this.n = new nvg(new PlaybackModel(null, null, null, null, null, null, null, null, null, null, 1023, null));
        this.o = new o98();
    }
}
