package defpackage;

import android.view.View;
import com.medium.android.common.post.body.EditPostBodyView;
import com.medium.proto.model.PlaybackModel;
import com.medium.proto.model.RichTextModel;
import com.medium.proto.model.SectionModel;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nvg {
    public int a;
    public Object b;
    public Object c;
    public Object d;

    public nvg(PlaybackModel playbackModel) {
        playbackModel.getClass();
        this.b = playbackModel.newBuilder();
        this.c = new ArrayList();
        this.a = -1;
    }

    public void a(z63 z63Var, d73 d73Var) {
        b1 b1VarC;
        ArrayList arrayList = (ArrayList) this.c;
        z63Var.getClass();
        d73Var.getClass();
        g73.Companion.getClass();
        b1 b1VarA = f73.a(z63Var);
        if (b1VarA == null) {
            return;
        }
        b1 b1Var = (b1) bu1.I0(arrayList);
        if (b1Var == null || b1Var.d) {
            b1Var = null;
        }
        if (b1Var != null && (b1VarC = b1Var.c(b1VarA)) != null) {
            arrayList.remove(arrayList.size() - 1);
            b1VarA = b1VarC;
        }
        z63 z63VarA = b1VarA.a((fb9) this.b);
        if (b1VarA.c == null) {
            b1VarA.c = z63VarA;
        }
        System.currentTimeMillis();
        arrayList.add(b1VarA);
        EditPostBodyView editPostBodyView = (EditPostBodyView) this.d;
        if (editPostBodyView != null) {
            z63 z63Var2 = b1VarA.b;
            l19 l19Var = editPostBodyView.a;
            if (d73Var == d73.VIEW_SYNC) {
                if (!(z63Var2 instanceof s63)) {
                    ygf.f("View synchronization should only happen on paragraph updates");
                    return;
                }
                editPostBodyView.i(((s63) z63Var2).a, d73Var);
                nld nldVar = editPostBodyView.m;
                if (nldVar != null) {
                    nldVar.c();
                    return;
                }
                return;
            }
            int i = 0;
            if (z63Var2 instanceof g63) {
                g63 g63Var = (g63) z63Var2;
                int i2 = g63Var.a;
                j19 j19VarB = editPostBodyView.b(editPostBodyView.a(g63Var.b));
                l19Var.getClass();
                EditPostBodyView editPostBodyView2 = l19Var.a;
                int childCount = editPostBodyView2.getChildCount();
                int i3 = i2;
                while (true) {
                    if (i < childCount) {
                        if (i3 == 0) {
                            editPostBodyView2.addView(j19VarB.a(), i);
                            break;
                        } else {
                            if (editPostBodyView2.getChildAt(i) instanceof j19) {
                                i3--;
                            }
                            i++;
                        }
                    } else {
                        if (i3 != 0) {
                            ygf.f("Index out of bounds, unable to add view.");
                            return;
                        }
                        editPostBodyView2.addView(j19VarB.a());
                    }
                }
                editPostBodyView.k(i2 - 1, d73Var);
                editPostBodyView.k(i2 + 1, d73Var);
                editPostBodyView.j(i2 + 2);
            } else if (z63Var2 instanceof k63) {
                int i4 = ((k63) z63Var2).a;
                j19 j19VarB2 = l19Var.b(i4);
                EditPostBodyView editPostBodyView3 = l19Var.a;
                int iIndexOfChild = editPostBodyView3.indexOfChild(j19VarB2 != null ? j19VarB2.a() : null);
                editPostBodyView3.removeView(j19VarB2 != null ? j19VarB2.a() : null);
                if (iIndexOfChild > 0 && iIndexOfChild < editPostBodyView3.getChildCount() - 1) {
                    View childAt = editPostBodyView3.getChildAt(iIndexOfChild);
                    View childAt2 = editPostBodyView3.getChildAt(iIndexOfChild - 1);
                    childAt.getClass();
                    if (g76.L(childAt.getTag(), "divider")) {
                        childAt2.getClass();
                        if (g76.L(childAt2.getTag(), "divider")) {
                            editPostBodyView3.removeView(childAt);
                        }
                    }
                }
                editPostBodyView.k(i4 - 1, d73Var);
                editPostBodyView.k(i4, d73Var);
                editPostBodyView.j(i4 + 1);
            } else if (z63Var2 instanceof s63) {
                s63 s63Var = (s63) z63Var2;
                int i5 = s63Var.a;
                j19 j19VarB3 = l19Var.b(i5);
                if (j19VarB3 != null) {
                    j19VarB3.b(editPostBodyView.a(s63Var.b));
                }
                editPostBodyView.k(i5 - 1, d73Var);
                editPostBodyView.k(i5 + 1, d73Var);
                editPostBodyView.i(i5, d73Var);
            } else if (z63Var2 instanceof h63) {
                h63 h63Var = (h63) z63Var2;
                l19Var.a(h63Var.a, h63Var.b);
            } else if (z63Var2 instanceof l63) {
                l19Var.e(((l63) z63Var2).a);
            } else {
                if (!(z63Var2 instanceof v63)) {
                    rd6.b();
                    return;
                }
                v63 v63Var = (v63) z63Var2;
                int i6 = v63Var.a;
                SectionModel sectionModel = v63Var.b;
                l19Var.getClass();
                sectionModel.getClass();
                if (i6 == 0) {
                    wld.a.e(null, "Cannot update divider at index 0", new Object[0]);
                    hy2 hy2Var = g01.y;
                    if (hy2Var != null) {
                        hy2Var.a("Cannot update divider at index 0", null, fy3.a);
                    }
                } else {
                    l19Var.e(i6);
                    l19Var.a(i6, sectionModel);
                }
            }
            nld nldVar2 = editPostBodyView.m;
            if (nldVar2 != null) {
                nldVar2.c();
            }
        }
    }

    public List b(int i) {
        ArrayList arrayList = (ArrayList) this.c;
        if (i < 0 || i > arrayList.size()) {
            return ey3.a;
        }
        List listS0 = bu1.s0(arrayList, i);
        ArrayList arrayList2 = new ArrayList(cu1.k0(listS0, 10));
        Iterator it2 = listS0.iterator();
        while (it2.hasNext()) {
            arrayList2.add(((b1) it2.next()).b);
        }
        return arrayList2;
    }

    public RichTextModel c() {
        RichTextModel richTextModel = ((fb9) this.b).build().body_model;
        if (richTextModel != null) {
            return richTextModel;
        }
        return new RichTextModel(null, null, null, 7, null);
    }

    public void d() {
        p3c p3cVar = new p3c();
        p3cVar.a = new cmb();
        p3cVar.b = new cmb();
        p3cVar.c = new cmb();
        p3cVar.d = new cmb();
        p3cVar.e = new x(0.0f);
        p3cVar.f = new x(0.0f);
        p3cVar.g = new x(0.0f);
        p3cVar.h = new x(0.0f);
        int i = 0;
        p3cVar.i = new no3(i);
        p3cVar.j = new no3(i);
        p3cVar.k = new no3(i);
        p3cVar.l = new no3(i);
        this.b = p3cVar;
        this.c = new int[10][];
        this.d = new p3c[10];
    }

    public byte[] e(byte[] bArr) {
        int i = this.a;
        lvg lvgVar = (lvg) this.b;
        byte[] bArr2 = (byte[]) this.d;
        int length = bArr2.length;
        byte[] bArr3 = (byte[]) this.c;
        return length > 0 ? il7.H(bArr3, lvgVar.O(i, il7.H(bArr, bArr2))) : il7.H(bArr3, lvgVar.O(i, bArr));
    }

    public nvg(int i, String str, ArrayList arrayList, ArrayList arrayList2) {
        this.a = i;
        this.d = str;
        this.b = arrayList;
        this.c = arrayList2;
    }
}
