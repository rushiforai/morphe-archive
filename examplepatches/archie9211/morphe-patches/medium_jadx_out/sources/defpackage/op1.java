package defpackage;

import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.android.common.post.body.EditPostBodyView;
import com.medium.proto.model.CodeBlockMetadata;
import com.medium.proto.model.ParagraphPb;
import com.medium.proto.model.SectionModel;
import com.medium.proto.model.SelectionPb;
import com.medium.proto.obv.post.MarkupType;
import com.medium.proto.obv.post.ParagraphType;
import com.medium.proto.obv.post.SyntaxHighlightMode;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class op1 implements ou3 {
    public final /* synthetic */ int a;
    public final fi9 b;

    public /* synthetic */ op1(fi9 fi9Var, int i) {
        this.a = i;
        this.b = fi9Var;
    }

    @Override // defpackage.ou3
    public final boolean a(SelectionPb selectionPb) {
        int i = this.a;
        selectionPb.getClass();
        switch (i) {
            case 0:
                ParagraphPb paragraphPbR = ((EditPostBodyView) this.b).r(selectionPb.start.paragraph_index);
                if (paragraphPbR == null) {
                    return false;
                }
                l29 l29Var = new l29();
                l29Var.a = paragraphPbR;
                l29Var.f();
                return l29Var.d(MarkupType.CODE, selectionPb.start.offset, selectionPb.end.offset);
            case 1:
            default:
                return false;
        }
    }

    @Override // defpackage.ou3
    public final boolean b(yw1 yw1Var) {
        switch (this.a) {
            case 0:
                return yw1Var.equals(iw1.a);
            case 1:
                return yw1Var.equals(kw1.a) || yw1Var.equals(mw1.a) || yw1Var.equals(lw1.a);
            default:
                return yw1Var.equals(ww1.a);
        }
    }

    @Override // defpackage.ou3
    public final void d(yw1 yw1Var, SelectionPb selectionPb) {
        String str;
        int i;
        int i2 = this.a;
        fi9 fi9Var = this.b;
        selectionPb.getClass();
        switch (i2) {
            case 0:
                if (!yw1Var.equals(iw1.a)) {
                    ygf.f("Check failed.");
                } else {
                    int i3 = selectionPb.start.paragraph_index;
                    Integer numValueOf = Integer.valueOf(i3);
                    if (i3 < 0) {
                        numValueOf = null;
                    }
                    int iIntValue = numValueOf != null ? numValueOf.intValue() : fi9Var.getGrafCount();
                    EditPostBodyView editPostBodyView = (EditPostBodyView) fi9Var;
                    SectionModel sectionModelE = editPostBodyView.e(iIntValue);
                    ParagraphPb paragraphPbR = editPostBodyView.r(iIntValue);
                    n29 n29Var = new n29();
                    ParagraphType paragraphType = ParagraphType.PRE;
                    n29Var.b = paragraphType;
                    n29Var.r = new CodeBlockMetadata(SyntaxHighlightMode.AUTO, null, null, 6, null);
                    ParagraphType paragraphType2 = paragraphPbR != null ? paragraphPbR.type : null;
                    if (paragraphType2 != null) {
                        if (paragraphType2 == paragraphType) {
                            String str2 = paragraphPbR.text;
                            str = str2 != null ? str2 : "";
                            n29 n29Var2 = new n29();
                            n29Var2.b = ParagraphType.P;
                            n29Var2.c = str;
                            ParagraphPb paragraphPbBuild = n29Var2.build();
                            editPostBodyView.o(iIntValue);
                            editPostBodyView.g(iIntValue, paragraphPbBuild);
                            SelectionPb selectionPb2 = rxb.a;
                            fi9Var.setSelection(rxb.a(iIntValue, str.length()));
                        } else if (!l28.c(paragraphType2)) {
                            editPostBodyView.g(iIntValue + 1, n29Var.build());
                            SelectionPb selectionPb3 = rxb.a;
                            fi9Var.setSelection(rxb.a(iIntValue, 0));
                        } else {
                            String str3 = paragraphPbR.text;
                            str = str3 != null ? str3 : "";
                            n29Var.c = str;
                            ParagraphPb paragraphPbBuild2 = n29Var.build();
                            if (sectionModelE != null && sectionModelE.start_index == iIntValue) {
                                editPostBodyView.g(iIntValue + 1, new ParagraphPb(null, ParagraphType.P, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 524285, null));
                                int i4 = iIntValue + 2;
                                editPostBodyView.g(i4, paragraphPbBuild2);
                                SelectionPb selectionPb4 = rxb.a;
                                fi9Var.setSelection(rxb.a(i4, str.length()));
                                editPostBodyView.o(iIntValue);
                                editPostBodyView.o(iIntValue);
                            } else {
                                editPostBodyView.o(iIntValue);
                                editPostBodyView.g(iIntValue, paragraphPbBuild2);
                                SelectionPb selectionPb5 = rxb.a;
                                fi9Var.setSelection(rxb.a(iIntValue, str.length()));
                            }
                        }
                    } else {
                        editPostBodyView.g(iIntValue, n29Var.build());
                        SelectionPb selectionPb6 = rxb.a;
                        fi9Var.setSelection(rxb.a(iIntValue, 0));
                    }
                }
                break;
            case 1:
                int i5 = selectionPb.start.paragraph_index;
                EditPostBodyView editPostBodyView2 = (EditPostBodyView) fi9Var;
                ParagraphPb paragraphPbR2 = editPostBodyView2.r(i5);
                if (paragraphPbR2 != null) {
                    l29 l29Var = new l29();
                    l29Var.a = paragraphPbR2;
                    l29Var.f();
                    ParagraphType paragraphType3 = l29Var.a.type;
                    if (yw1Var.equals(kw1.a)) {
                        i = paragraphType3 != null ? q05.a[paragraphType3.ordinal()] : -1;
                        if (i == 1) {
                            l29Var.l(ParagraphType.H4);
                        } else if (i != 2) {
                            l29Var.l(ParagraphType.H3);
                        } else {
                            l29Var.l(ParagraphType.P);
                        }
                    } else if (yw1Var.equals(mw1.a)) {
                        i = paragraphType3 != null ? q05.a[paragraphType3.ordinal()] : -1;
                        if (i == 3) {
                            l29Var.l(ParagraphType.PQ);
                        } else if (i != 4) {
                            l29Var.l(ParagraphType.BQ);
                        } else {
                            l29Var.l(ParagraphType.P);
                        }
                    } else if (!yw1Var.equals(lw1.a)) {
                        ik4.h("Unknown command: ", yw1Var);
                        break;
                    } else {
                        i = paragraphType3 != null ? q05.a[paragraphType3.ordinal()] : -1;
                        if (i == 5) {
                            l29Var.l(ParagraphType.OLI);
                        } else if (i != 6) {
                            l29Var.l(ParagraphType.ULI);
                        } else {
                            l29Var.l(ParagraphType.P);
                        }
                    }
                    editPostBodyView2.s(i5, l29Var.a, d73.COMMAND);
                    fi9Var.setSelection(selectionPb);
                    break;
                }
                break;
            default:
                int i6 = selectionPb.start.paragraph_index;
                EditPostBodyView editPostBodyView3 = (EditPostBodyView) fi9Var;
                ParagraphPb paragraphPbR3 = editPostBodyView3.r(i6);
                if ((paragraphPbR3 != null && n19.c(paragraphPbR3)) || i6 == 0) {
                    i6++;
                }
                int i7 = i6;
                if (i7 >= fi9Var.getGrafCount()) {
                    editPostBodyView3.g(i7, new ParagraphPb(null, ParagraphType.P, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 524285, null));
                }
                SectionModel sectionModelE2 = editPostBodyView3.e(i7);
                if (sectionModelE2 != null && sectionModelE2.start_index == i7) {
                    editPostBodyView3.g(i7, new ParagraphPb(null, ParagraphType.P, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 524285, null));
                }
                Integer numF = editPostBodyView3.f(i7);
                editPostBodyView3.n.a(new h63((numF != null ? numF.intValue() : 0) + 1, editPostBodyView3.o.c(new SectionModel(null, i7, null, null, null, null, null, null, null, null, PhotoshopDirectory.TAG_EPS_OPTIONS, null))), d73.COMMAND);
                ParagraphPb paragraphPbR4 = editPostBodyView3.r(i7);
                x2b x2bVar = l28.a;
                if (!l28.b(paragraphPbR4 != null ? paragraphPbR4.type : null)) {
                    SelectionPb selectionPb7 = rxb.a;
                    fi9Var.setSelection(rxb.a(i7, 0));
                } else {
                    SelectionPb selectionPb8 = rxb.a;
                    fi9Var.setSelection(rxb.b(i7));
                }
                break;
        }
    }
}
