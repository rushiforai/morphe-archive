package defpackage;

import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.proto.model.ParagraphPb;
import com.medium.proto.model.RichTextModel;
import com.medium.proto.model.SectionModel;
import com.medium.proto.obv.post.DeltaType;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class k4b extends b1 {
    public final /* synthetic */ int e = 0;
    public final int f;

    public k4b(DeltaType deltaType, l63 l63Var) {
        super(deltaType, l63Var);
        this.f = l63Var.a;
    }

    @Override // defpackage.b1
    public final z63 a(fb9 fb9Var) {
        RichTextModel richTextModel;
        Integer numA;
        int i = this.e;
        int i2 = this.f;
        int i3 = 0;
        switch (i) {
            case 0:
                RichTextModel richTextModel2 = fb9Var.e;
                if (richTextModel2 == null) {
                    RichTextModel richTextModel3 = new RichTextModel(null, null, null, 7, null);
                    fb9Var.e = richTextModel3;
                    richTextModel2 = richTextModel3;
                }
                ArrayList arrayListN1 = bu1.n1(richTextModel2.paragraphs);
                int size = arrayListN1.size();
                if (i2 > size) {
                    lg8.i(b09.w(i2, "Paragraph does not exist at index "));
                    return null;
                }
                RichTextModel richTextModel4 = fb9Var.e;
                if (richTextModel4 == null) {
                    RichTextModel richTextModel5 = new RichTextModel(null, null, null, 7, null);
                    fb9Var.e = richTextModel5;
                    richTextModel4 = richTextModel5;
                }
                List<SectionModel> list = richTextModel4.sections;
                ParagraphPb paragraphPb = (ParagraphPb) arrayListN1.remove(i2);
                int i4 = nvb.a;
                ArrayList arrayListN12 = bu1.n1(list);
                Integer numA2 = nvb.a(i2, arrayListN12);
                SectionModel sectionModel = numA2 != null ? (SectionModel) bu1.A0(numA2.intValue(), arrayListN12) : null;
                if (sectionModel != null) {
                    int iIndexOf = arrayListN12.indexOf(sectionModel);
                    if (arrayListN12.size() > 1 && (numA = nvb.a(i2, arrayListN12)) != null) {
                        int iIntValue = numA.intValue();
                        int i5 = ((SectionModel) arrayListN12.get(iIntValue)).start_index;
                        int i6 = iIntValue + 1;
                        if (i6 < arrayListN12.size()) {
                            size = ((SectionModel) arrayListN12.get(i6)).start_index;
                        }
                        if (size - i5 <= 1) {
                            arrayListN12.remove(iIndexOf);
                            arrayListN12.set(0, SectionModel.copy$default((SectionModel) arrayListN12.get(0), null, 0, null, null, null, null, null, null, null, null, PhotoshopDirectory.TAG_EPS_OPTIONS, null));
                        }
                    }
                    for (Object obj : arrayListN12) {
                        int i7 = i3 + 1;
                        if (i3 < 0) {
                            d46.i0();
                            throw null;
                        }
                        SectionModel sectionModel2 = (SectionModel) obj;
                        int i8 = sectionModel2.start_index;
                        if (i8 > i2) {
                            arrayListN12.set(i3, SectionModel.copy$default(sectionModel2, null, i8 - 1, null, null, null, null, null, null, null, null, PhotoshopDirectory.TAG_EPS_OPTIONS, null));
                        }
                        i3 = i7;
                    }
                }
                RichTextModel richTextModel6 = fb9Var.e;
                if (richTextModel6 != null) {
                    richTextModel = richTextModel6;
                } else {
                    RichTextModel richTextModel7 = new RichTextModel(null, null, null, 7, null);
                    fb9Var.e = richTextModel7;
                    richTextModel = richTextModel7;
                }
                fb9Var.e = RichTextModel.copy$default(richTextModel, arrayListN1, list, null, 4, null);
                return new g63(i2, paragraphPb, null);
            default:
                ArrayList arrayListN13 = bu1.n1(w2g.x(fb9Var));
                int size2 = arrayListN13.size();
                int size3 = arrayListN13.size();
                if (i2 < 0 || i2 >= size3) {
                    lg8.i(b09.w(i2, "Section does not exist at index "));
                    return null;
                }
                if (i2 == 0 && size2 == 1) {
                    ygf.f("The only section cannot be removed");
                    return null;
                }
                SectionModel sectionModel3 = (SectionModel) arrayListN13.remove(i2);
                SectionModel sectionModel4 = (SectionModel) arrayListN13.get(0);
                if (sectionModel4.start_index != 0) {
                    arrayListN13.set(0, SectionModel.copy$default(sectionModel4, null, 0, null, null, null, null, null, null, null, null, PhotoshopDirectory.TAG_EPS_OPTIONS, null));
                }
                w2g.L(fb9Var, arrayListN13);
                return new h63(i2, sectionModel3);
        }
    }

    @Override // defpackage.b1
    public final int b() {
        switch (this.e) {
        }
        return this.f;
    }

    public k4b(DeltaType deltaType, k63 k63Var) {
        super(deltaType, k63Var);
        this.f = k63Var.a;
    }
}
