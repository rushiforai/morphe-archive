package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.proto.model.CodeBlockMetadata;
import com.medium.proto.model.MarkupModel;
import com.medium.proto.model.ParagraphPb;
import com.medium.proto.obv.post.Alignment;
import com.medium.proto.obv.post.AnchorType;
import com.medium.proto.obv.post.MarkupType;
import com.medium.proto.obv.post.ParagraphType;
import com.medium.proto.obv.post.SyntaxHighlightMode;
import com.squareup.wire.internal.Internal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l29 {
    public ParagraphPb a;

    /* JADX WARN: Multi-variable type inference failed */
    public final boolean a(MarkupModel markupModel) {
        Integer numValueOf;
        markupModel.getClass();
        if (!g76.L(markupModel.end, markupModel.start)) {
            ArrayList arrayListN1 = bu1.n1(this.a.markups);
            int i = 0;
            while (i < arrayListN1.size()) {
                MarkupModel markupModel2 = (MarkupModel) arrayListN1.get(i);
                Map map = si7.a;
                markupModel2.getClass();
                MarkupModel markupModelBuild = null;
                markupModelBuild = null;
                numValueOf = null;
                Integer numValueOf2 = null;
                markupModelBuild = null;
                markupModelBuild = null;
                markupModelBuild = null;
                if (markupModel2.type == markupModel.type) {
                    if (markupModel2.equals(markupModel)) {
                        markupModelBuild = markupModel2;
                    } else {
                        MarkupType markupType = markupModel2.type;
                        if (markupType != MarkupType.QUOTE) {
                            MarkupType markupType2 = MarkupType.A;
                            if (markupType == markupType2) {
                                boolean z = g76.L(markupModel2.href, markupModel.href) && g76.L(markupModel2.title, markupModel.title) && g76.L(markupModel2.rel, markupModel.rel) && markupModel2.anchor_type == markupModel.anchor_type;
                                boolean zA = si7.a(markupModel2, markupModel.start, true, z);
                                Integer num = markupModel.end;
                                if (num != null) {
                                    int iIntValue = num.intValue();
                                    if (!z) {
                                        iIntValue--;
                                    }
                                    numValueOf = Integer.valueOf(iIntValue);
                                } else {
                                    numValueOf = null;
                                }
                                Object[] objArr = zA || si7.a(markupModel2, numValueOf, true, z) || si7.a(markupModel, markupModel2.start, true, z);
                                if (objArr == true && z) {
                                    li7 li7Var = new li7();
                                    li7Var.a = markupType2;
                                    Integer num2 = markupModel2.start;
                                    int iIntValue2 = num2 != null ? num2.intValue() : Integer.MIN_VALUE;
                                    Integer num3 = markupModel.start;
                                    int iMin = Math.min(iIntValue2, num3 != null ? num3.intValue() : Integer.MIN_VALUE);
                                    Integer numValueOf3 = Integer.valueOf(iMin);
                                    if (iMin == Integer.MIN_VALUE) {
                                        numValueOf3 = null;
                                    }
                                    li7Var.b = numValueOf3;
                                    Integer num4 = markupModel2.end;
                                    int iIntValue3 = num4 != null ? num4.intValue() : Integer.MIN_VALUE;
                                    Integer num5 = markupModel.end;
                                    int iMax = Math.max(iIntValue3, num5 != null ? num5.intValue() : Integer.MIN_VALUE);
                                    li7Var.c = iMax != Integer.MIN_VALUE ? Integer.valueOf(iMax) : null;
                                    li7Var.d = markupModel2.href;
                                    li7Var.e = markupModel2.title;
                                    li7Var.f = markupModel2.rel;
                                    li7Var.g = markupModel2.anchor_type;
                                    markupModelBuild = li7Var.build();
                                } else if (objArr != false) {
                                    markupModelBuild = markupModel;
                                }
                            } else {
                                MarkupType markupType3 = MarkupType.HIGHLIGHT;
                                if (markupType == markupType3) {
                                    Integer num6 = markupModel2.start;
                                    Integer num7 = markupModel.start;
                                    Integer num8 = markupModel2.end;
                                    Integer num9 = markupModel.end;
                                    if (g76.L(markupModel2.name, markupModel.name)) {
                                        Integer numValueOf4 = (num6 == null || num7 == null) ? null : Integer.valueOf(Math.min(num6.intValue(), num7.intValue()));
                                        if (num8 != null && num9 != null) {
                                            numValueOf2 = Integer.valueOf(Math.min(num8.intValue(), num9.intValue()));
                                        }
                                        String str = markupModel2.name;
                                        li7 li7Var2 = new li7();
                                        li7Var2.a = markupType3;
                                        li7Var2.b = numValueOf4;
                                        li7Var2.c = numValueOf2;
                                        li7Var2.h = str;
                                        markupModelBuild = li7Var2.build();
                                    }
                                } else {
                                    boolean zA2 = si7.a(markupModel2, markupModel.start, true, true);
                                    boolean zA3 = si7.a(markupModel2, markupModel.end, true, true);
                                    boolean zA4 = si7.a(markupModel, markupModel2.start, true, true);
                                    if (zA2 || zA3 || zA4) {
                                        li7 li7Var3 = new li7();
                                        li7Var3.a = markupModel2.type;
                                        Integer num10 = markupModel2.start;
                                        int iIntValue4 = num10 != null ? num10.intValue() : Integer.MIN_VALUE;
                                        Integer num11 = markupModel.start;
                                        int iMin2 = Math.min(iIntValue4, num11 != null ? num11.intValue() : Integer.MIN_VALUE);
                                        Integer numValueOf5 = Integer.valueOf(iMin2);
                                        if (iMin2 == Integer.MIN_VALUE) {
                                            numValueOf5 = null;
                                        }
                                        li7Var3.b = numValueOf5;
                                        Integer num12 = markupModel2.end;
                                        int iIntValue5 = num12 != null ? num12.intValue() : Integer.MIN_VALUE;
                                        Integer num13 = markupModel.end;
                                        int iMax2 = Math.max(iIntValue5, num13 != null ? num13.intValue() : Integer.MIN_VALUE);
                                        li7Var3.c = iMax2 != Integer.MIN_VALUE ? Integer.valueOf(iMax2) : null;
                                        markupModelBuild = li7Var3.build();
                                    }
                                }
                            }
                        }
                    }
                }
                if (markupModelBuild != null) {
                    if (markupModelBuild != markupModel2 && !markupModelBuild.equals(markupModel2)) {
                        arrayListN1.remove(i);
                        i = -1;
                        markupModel = markupModelBuild;
                    }
                }
                i++;
            }
            if (g76.L(this.a.has_drop_cap, Boolean.TRUE)) {
                x2b x2bVar = l28.a;
                if (wgf.u(markupModel) <= l28.a(this.a.text).length()) {
                    li7 li7VarNewBuilder = markupModel.newBuilder();
                    li7VarNewBuilder.b = 0;
                    markupModel = li7VarNewBuilder.build();
                }
            }
            arrayListN1.add((-Collections.binarySearch(arrayListN1, markupModel, si7.b)) - 1, markupModel);
            n29 n29VarNewBuilder = this.a.newBuilder();
            Internal.checkElementsNotNull(arrayListN1);
            n29VarNewBuilder.d = arrayListN1;
            this.a = n29VarNewBuilder.build();
            return true;
        }
        return false;
    }

    public final void b(l29 l29Var) {
        l29Var.getClass();
        String str = this.a.text;
        if (str == null) {
            str = "";
        }
        int length = str.length();
        n29 n29VarNewBuilder = this.a.newBuilder();
        String str2 = this.a.text;
        String str3 = l29Var.a.text;
        n29VarNewBuilder.c = km4.y(str2, str3 != null ? str3 : "");
        this.a = n29VarNewBuilder.build();
        for (MarkupModel markupModel : l29Var.a.markups) {
            li7 li7VarNewBuilder = markupModel.newBuilder();
            li7VarNewBuilder.b = Integer.valueOf(wgf.u(markupModel) + length);
            li7VarNewBuilder.c = Integer.valueOf(wgf.t(markupModel) + length);
            a(li7VarNewBuilder.build());
        }
        f();
    }

    public final MarkupModel c(int i, boolean z) {
        MarkupModel next;
        MarkupType markupType = MarkupType.A;
        Iterator<MarkupModel> it2 = this.a.markups.iterator();
        while (true) {
            if (!it2.hasNext()) {
                next = null;
                break;
            }
            next = it2.next();
            if (next.type == markupType) {
                Map map = si7.a;
                if (si7.a(next, Integer.valueOf(i), z, z)) {
                    break;
                }
            }
        }
        if (next == null || next.anchor_type != AnchorType.USER) {
            return null;
        }
        return next;
    }

    public final boolean d(MarkupType markupType, int i, int i2) {
        markupType.getClass();
        for (MarkupModel markupModel : this.a.markups) {
            if (markupModel.type == markupType && wgf.u(markupModel) < i2 && wgf.t(markupModel) > i) {
                return true;
            }
        }
        return false;
    }

    public final void e(int i, String str) {
        str.getClass();
        String str2 = this.a.text;
        if (str2 == null) {
            str2 = "";
        }
        int iMin = Math.min(i, str2.length());
        n29 n29VarNewBuilder = this.a.newBuilder();
        n29VarNewBuilder.c = ev6.x(str2.substring(0, iMin), str, str2.substring(iMin));
        ArrayList arrayList = new ArrayList();
        for (MarkupModel markupModelBuild : this.a.markups) {
            if (markupModelBuild.type == MarkupType.A ? wgf.t(markupModelBuild) > iMin : wgf.t(markupModelBuild) >= iMin) {
                li7 li7VarNewBuilder = markupModelBuild.newBuilder();
                li7VarNewBuilder.c = Integer.valueOf(str.length() + wgf.t(markupModelBuild));
                markupModelBuild = li7VarNewBuilder.build();
            }
            Integer num = markupModelBuild.start;
            if ((num == null || num.intValue() != 0) && wgf.u(markupModelBuild) >= iMin) {
                li7 li7VarNewBuilder2 = markupModelBuild.newBuilder();
                li7VarNewBuilder2.b = Integer.valueOf(str.length() + wgf.u(markupModelBuild));
                markupModelBuild = li7VarNewBuilder2.build();
            }
            arrayList.add(markupModelBuild);
        }
        Internal.checkElementsNotNull(arrayList);
        n29VarNewBuilder.d = arrayList;
        this.a = n29VarNewBuilder.build();
        f();
    }

    public final boolean equals(Object obj) {
        if (obj instanceof l29) {
            return ((l29) obj).a.equals(this.a);
        }
        return false;
    }

    public final void f() {
        if (g76.L(this.a.has_drop_cap, Boolean.TRUE)) {
            x2b x2bVar = l28.a;
            String strA = l28.a(this.a.text);
            if (strA.length() == 0) {
                return;
            }
            int length = strA.length();
            ArrayList arrayList = new ArrayList();
            for (MarkupModel markupModelBuild : this.a.markups) {
                if (wgf.t(markupModelBuild) > length) {
                    if (wgf.u(markupModelBuild) <= length) {
                        li7 li7VarNewBuilder = markupModelBuild.newBuilder();
                        li7VarNewBuilder.b = 0;
                        markupModelBuild = li7VarNewBuilder.build();
                    }
                    arrayList.add(markupModelBuild);
                }
            }
            n29 n29VarNewBuilder = this.a.newBuilder();
            Internal.checkElementsNotNull(arrayList);
            n29VarNewBuilder.d = arrayList;
            this.a = n29VarNewBuilder.build();
        }
    }

    public final void g() {
        ArrayList arrayList = new ArrayList();
        for (MarkupModel markupModel : this.a.markups) {
            if (wgf.t(markupModel) > wgf.u(markupModel)) {
                arrayList.add(markupModel);
            }
        }
        n29 n29VarNewBuilder = this.a.newBuilder();
        Internal.checkElementsNotNull(arrayList);
        n29VarNewBuilder.d = arrayList;
        this.a = n29VarNewBuilder.build();
    }

    public final void h(MarkupModel markupModel) {
        markupModel.getClass();
        ArrayList arrayListN1 = bu1.n1(this.a.markups);
        int size = arrayListN1.size();
        for (int i = 0; i < size; i++) {
            MarkupModel markupModelBuild = (MarkupModel) arrayListN1.get(i);
            if (markupModelBuild.type == markupModel.type) {
                Map map = si7.a;
                if (si7.a(markupModel, Integer.valueOf(wgf.u(markupModelBuild)), true, false)) {
                    li7 li7VarNewBuilder = markupModelBuild.newBuilder();
                    li7VarNewBuilder.b = markupModel.end;
                    markupModelBuild = li7VarNewBuilder.build();
                    arrayListN1.set(i, markupModelBuild);
                }
                if (si7.a(markupModel, Integer.valueOf(wgf.t(markupModelBuild)), true, true)) {
                    li7 li7VarNewBuilder2 = markupModelBuild.newBuilder();
                    li7VarNewBuilder2.c = markupModel.start;
                    markupModelBuild = li7VarNewBuilder2.build();
                    arrayListN1.set(i, markupModelBuild);
                }
                if (si7.a(markupModelBuild, Integer.valueOf(wgf.u(markupModel)), true, false) && si7.a(markupModelBuild, Integer.valueOf(wgf.t(markupModel)), true, true)) {
                    li7 li7VarNewBuilder3 = markupModelBuild.newBuilder();
                    li7VarNewBuilder3.b = markupModel.end;
                    li7 li7VarNewBuilder4 = markupModelBuild.newBuilder();
                    li7VarNewBuilder4.c = markupModel.start;
                    arrayListN1.set(i, li7VarNewBuilder4.build());
                    n29 n29VarNewBuilder = this.a.newBuilder();
                    Internal.checkElementsNotNull(arrayListN1);
                    n29VarNewBuilder.d = arrayListN1;
                    this.a = n29VarNewBuilder.build();
                    a(li7VarNewBuilder3.build());
                    g();
                    return;
                }
            }
        }
        n29 n29VarNewBuilder2 = this.a.newBuilder();
        Internal.checkElementsNotNull(arrayListN1);
        n29VarNewBuilder2.d = arrayListN1;
        this.a = n29VarNewBuilder2.build();
        g();
    }

    public final int hashCode() {
        return l29.class.hashCode() + (this.a.hashCode() * 31);
    }

    public final void i(int i, int i2) {
        String str = this.a.text;
        if (str == null) {
            str = "";
        }
        int length = str.length();
        if (i > length) {
            i = length;
        }
        int length2 = str.length();
        if (i2 > length2) {
            i2 = length2;
        }
        n29 n29VarNewBuilder = this.a.newBuilder();
        int i3 = i2 - i;
        n29VarNewBuilder.c = str.substring(0, i).concat(str.substring(i2));
        ArrayList arrayList = new ArrayList();
        for (MarkupModel markupModelBuild : this.a.markups) {
            if (wgf.u(markupModelBuild) >= i) {
                li7 li7VarNewBuilder = markupModelBuild.newBuilder();
                int iU = wgf.u(markupModelBuild) - i3;
                if (iU < i) {
                    iU = i;
                }
                li7VarNewBuilder.b = Integer.valueOf(iU);
                markupModelBuild = li7VarNewBuilder.build();
            }
            if (wgf.t(markupModelBuild) >= i) {
                li7 li7VarNewBuilder2 = markupModelBuild.newBuilder();
                int iT = wgf.t(markupModelBuild) - i3;
                if (iT < i) {
                    iT = i;
                }
                li7VarNewBuilder2.c = Integer.valueOf(iT);
                markupModelBuild = li7VarNewBuilder2.build();
            }
            arrayList.add(markupModelBuild);
        }
        Internal.checkElementsNotNull(arrayList);
        n29VarNewBuilder.d = arrayList;
        this.a = n29VarNewBuilder.build();
        g();
        f();
    }

    public final void j(y5d y5dVar) {
        y5dVar.getClass();
        int i = k29.a[y5dVar.ordinal()];
        SyntaxHighlightMode syntaxHighlightMode = i != 1 ? i != 2 ? SyntaxHighlightMode.EXPLICIT : SyntaxHighlightMode.AUTO : SyntaxHighlightMode.DISABLED;
        ParagraphPb paragraphPb = this.a;
        CodeBlockMetadata codeBlockMetadata = paragraphPb.code_block_metadata;
        this.a = paragraphPb.copy((524211 & 1) != 0 ? paragraphPb.name : null, (524211 & 2) != 0 ? paragraphPb.type : null, (524211 & 4) != 0 ? paragraphPb.text : null, (524211 & 8) != 0 ? paragraphPb.markups : null, (524211 & 16) != 0 ? paragraphPb.layout : null, (524211 & 32) != 0 ? paragraphPb.data_id : null, (524211 & 64) != 0 ? paragraphPb.metadata : null, (524211 & 128) != 0 ? paragraphPb.iframe : null, (524211 & 256) != 0 ? paragraphPb.has_drop_cap : null, (524211 & 512) != 0 ? paragraphPb.alignment : null, (524211 & 1024) != 0 ? paragraphPb.href : null, (524211 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? paragraphPb.mixtape_metadata : null, (524211 & 4096) != 0 ? paragraphPb.translation_status : null, (524211 & 8192) != 0 ? paragraphPb.drop_cap_image : null, (524211 & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? paragraphPb.purpose : null, (524211 & 32768) != 0 ? paragraphPb.id : null, (524211 & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? paragraphPb.code_lang : null, (524211 & 131072) != 0 ? paragraphPb.code_block_metadata : codeBlockMetadata != null ? CodeBlockMetadata.copy$default(codeBlockMetadata, syntaxHighlightMode, y5dVar.getLanguageName(), null, 4, null) : null, (524211 & 262144) != 0 ? paragraphPb.unknownFields() : null);
    }

    public final void k(String str) {
        n29 n29VarNewBuilder = this.a.newBuilder();
        n29VarNewBuilder.c = str;
        ey3 ey3Var = ey3.a;
        Internal.checkElementsNotNull(ey3Var);
        n29VarNewBuilder.d = ey3Var;
        ParagraphPb paragraphPb = this.a;
        if (paragraphPb.type == ParagraphType.P && paragraphPb.alignment == Alignment.LEFT) {
            n29VarNewBuilder.i = Boolean.FALSE;
        }
        this.a = n29VarNewBuilder.build();
    }

    public final void l(ParagraphType paragraphType) {
        n29 n29VarNewBuilder = this.a.newBuilder();
        n29VarNewBuilder.b = paragraphType;
        this.a = n29VarNewBuilder.build();
    }

    public final l29 m(int i) {
        String str = this.a.text;
        if (str == null) {
            str = "";
        }
        if (i < 0 || i > str.length()) {
            return this;
        }
        ParagraphPb paragraphPb = new ParagraphPb(null, this.a.type, str.substring(i), null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 524281, null);
        l29 l29Var = new l29();
        l29Var.a = paragraphPb;
        l29Var.f();
        for (MarkupModel markupModel : this.a.markups) {
            if (wgf.t(markupModel) > i) {
                int iU = wgf.u(markupModel) - i;
                if (iU <= 0) {
                    iU = 0;
                }
                l29Var.a(MarkupModel.copy$default(markupModel, null, Integer.valueOf(iU), Integer.valueOf(wgf.t(markupModel) - i), null, null, null, null, null, null, null, null, null, 4089, null));
            }
        }
        i(i, str.length());
        return l29Var;
    }

    public final String toString() {
        return "ParagraphModel{" + this.a + "}";
    }
}
