package defpackage;

import android.net.Uri;
import android.view.KeyEvent;
import com.medium.android.common.post.body.EditPostBodyView;
import com.medium.proto.model.MarkupModel;
import com.medium.proto.model.ParagraphPb;
import com.medium.proto.model.SelectionPb;
import com.medium.proto.obv.post.MarkupType;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class of2 implements hv3, ou3 {
    public final /* synthetic */ int a;
    public final fi9 b;

    public /* synthetic */ of2(fi9 fi9Var, int i) {
        this.a = i;
        this.b = fi9Var;
    }

    public static MarkupType f(yw1 yw1Var) {
        if (yw1Var.equals(hw1.a)) {
            return MarkupType.STRONG;
        }
        if (yw1Var.equals(ow1.a)) {
            return MarkupType.EM;
        }
        ik4.o("Unsupported command ", yw1Var);
        return null;
    }

    @Override // defpackage.ou3
    public final boolean a(SelectionPb selectionPb) {
        int i = this.a;
        fi9 fi9Var = this.b;
        selectionPb.getClass();
        switch (i) {
            case 0:
                return false;
            case 1:
                MarkupType markupTypeF = f(vw1.a);
                Map map = si7.a;
                Integer numValueOf = Integer.valueOf(selectionPb.start.offset);
                Integer numValueOf2 = Integer.valueOf(selectionPb.end.offset);
                li7 li7Var = new li7();
                li7Var.a = markupTypeF;
                li7Var.b = numValueOf;
                li7Var.c = numValueOf2;
                MarkupModel markupModelBuild = li7Var.build();
                ParagraphPb paragraphPbR = ((EditPostBodyView) fi9Var).r(selectionPb.start.paragraph_index);
                if (paragraphPbR == null) {
                    return false;
                }
                l29 l29Var = new l29();
                l29Var.a = paragraphPbR;
                l29Var.f();
                return !l29Var.a(markupModelBuild);
            default:
                ParagraphPb paragraphPbR2 = ((EditPostBodyView) fi9Var).r(selectionPb.start.paragraph_index);
                if (paragraphPbR2 == null) {
                    return false;
                }
                l29 l29Var2 = new l29();
                l29Var2.a = paragraphPbR2;
                l29Var2.f();
                return l29Var2.d(MarkupType.A, selectionPb.start.offset, selectionPb.end.offset);
        }
    }

    @Override // defpackage.ou3
    public final boolean b(yw1 yw1Var) {
        switch (this.a) {
            case 0:
                return yw1Var instanceof jw1;
            case 1:
                return yw1Var.equals(hw1.a) || yw1Var.equals(ow1.a);
            default:
                return yw1Var instanceof vw1;
        }
    }

    @Override // defpackage.hv3
    public final boolean c(int i, int i2, int i3, KeyEvent keyEvent) {
        ParagraphPb paragraphPbR;
        String str;
        switch (this.a) {
            case 0:
                if (i2 != i3 && keyEvent.getAction() == 0 && keyEvent.hasModifiers(4096) && keyEvent.getKeyCode() == 39 && (paragraphPbR = ((EditPostBodyView) this.b).r(i)) != null && (str = paragraphPbR.text) != null) {
                    SelectionPb selectionPb = rxb.a;
                    SelectionPb selectionPbD = rxb.d(i, i2, i3);
                    String strSubstring = str.substring(i2, i3);
                    d(new jw1(strSubstring, strSubstring), selectionPbD);
                }
                break;
            case 1:
                boolean z = keyEvent.getAction() == 0 && keyEvent.hasModifiers(4096);
                yw1 yw1Var = (z && keyEvent.getKeyCode() == 30) ? hw1.a : (z && keyEvent.getKeyCode() == 37) ? ow1.a : null;
                if (yw1Var != null) {
                    SelectionPb selectionPb2 = rxb.a;
                    d(yw1Var, rxb.d(i, i2, i3));
                }
                break;
            default:
                if (i2 != i3 && keyEvent.getAction() == 0 && keyEvent.hasModifiers(4096) && keyEvent.getKeyCode() == 39) {
                    SelectionPb selectionPb3 = rxb.a;
                    d(vw1.a, rxb.d(i, i2, i3));
                }
                break;
        }
        return false;
    }

    @Override // defpackage.ou3
    public final void d(yw1 yw1Var, SelectionPb selectionPb) {
        int i = this.a;
        fi9 fi9Var = this.b;
        selectionPb.getClass();
        switch (i) {
            case 0:
                if (yw1Var instanceof jw1) {
                    jw1 jw1Var = (jw1) yw1Var;
                    String str = jw1Var.a;
                    String string = jw1Var.b;
                    if (muc.b0(string)) {
                        ygf.f("Link cannot be blank");
                        break;
                    } else {
                        int i2 = selectionPb.start.paragraph_index;
                        EditPostBodyView editPostBodyView = (EditPostBodyView) fi9Var;
                        ParagraphPb paragraphPbR = editPostBodyView.r(i2);
                        if (paragraphPbR != null) {
                            l29 l29Var = new l29();
                            l29Var.a = paragraphPbR;
                            l29Var.f();
                            int i3 = selectionPb.start.offset;
                            int length = selectionPb.end.offset;
                            if (i3 == length) {
                                l29Var.e(i3, string);
                                length += string.length();
                            } else if (str != null) {
                                l29Var.i(i3, length);
                                l29Var.e(i3, str);
                                length = str.length() + i3;
                            }
                            Map map = si7.a;
                            Uri uri = Uri.parse(string);
                            if (uri.getScheme() == null) {
                                string = uri.buildUpon().scheme("scheme").toString();
                                string.getClass();
                            }
                            l29Var.a(si7.b(i3, length, string));
                            editPostBodyView.s(i2, l29Var.a, d73.COMMAND);
                            SelectionPb selectionPb2 = rxb.a;
                            fi9Var.setSelection(rxb.a(i2, length));
                            break;
                        }
                    }
                } else {
                    ygf.f("Command must be CreateLink");
                    break;
                }
                break;
            case 1:
                MarkupType markupTypeF = f(yw1Var);
                Map map2 = si7.a;
                Integer numValueOf = Integer.valueOf(selectionPb.start.offset);
                Integer numValueOf2 = Integer.valueOf(selectionPb.end.offset);
                li7 li7Var = new li7();
                li7Var.a = markupTypeF;
                li7Var.b = numValueOf;
                li7Var.c = numValueOf2;
                MarkupModel markupModelBuild = li7Var.build();
                int i4 = selectionPb.start.paragraph_index;
                EditPostBodyView editPostBodyView2 = (EditPostBodyView) fi9Var;
                ParagraphPb paragraphPbR2 = editPostBodyView2.r(i4);
                if (paragraphPbR2 != null) {
                    l29 l29Var2 = new l29();
                    l29Var2.a = paragraphPbR2;
                    l29Var2.f();
                    if (!l29Var2.a(markupModelBuild)) {
                        l29Var2.h(markupModelBuild);
                    }
                    editPostBodyView2.s(i4, l29Var2.a, d73.COMMAND);
                    fi9Var.setSelection(selectionPb);
                    break;
                }
                break;
            default:
                if (!(yw1Var instanceof vw1)) {
                    ygf.f("Command must be RemoveLink");
                    break;
                } else {
                    int i5 = selectionPb.start.paragraph_index;
                    EditPostBodyView editPostBodyView3 = (EditPostBodyView) fi9Var;
                    ParagraphPb paragraphPbR3 = editPostBodyView3.r(i5);
                    if (paragraphPbR3 != null) {
                        l29 l29Var3 = new l29();
                        l29Var3.a = paragraphPbR3;
                        l29Var3.f();
                        ArrayList arrayList = new ArrayList();
                        int i6 = selectionPb.start.offset;
                        int i7 = selectionPb.end.offset;
                        for (MarkupModel markupModel : l29Var3.a.markups) {
                            if (markupModel.type == MarkupType.A && wgf.t(markupModel) > i6 && wgf.u(markupModel) < i7) {
                                arrayList.add(markupModel);
                            }
                        }
                        Iterator it2 = arrayList.iterator();
                        while (it2.hasNext()) {
                            l29Var3.h((MarkupModel) it2.next());
                        }
                        editPostBodyView3.s(i5, l29Var3.a, d73.COMMAND);
                        fi9Var.setSelection(selectionPb);
                        break;
                    }
                }
                break;
        }
    }
}
