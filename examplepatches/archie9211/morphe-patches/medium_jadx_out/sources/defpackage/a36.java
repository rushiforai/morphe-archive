package defpackage;

import androidx.compose.runtime.tooling.Dp.CspinKvYN;
import com.medium.proto.model.ParagraphPb;
import com.medium.proto.model.RichTextModel;
import com.medium.proto.model.SectionModel;
import com.medium.proto.obv.post.DeltaType;
import com.squareup.wire.internal.Internal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class a36 extends b1 {
    public final /* synthetic */ int e = 0;
    public final int f;
    public final z63 g;

    public a36(DeltaType deltaType, s63 s63Var) {
        super(deltaType, s63Var);
        this.g = s63Var;
        this.f = s63Var.a;
    }

    @Override // defpackage.b1
    public final int b() {
        switch (this.e) {
        }
        return this.f;
    }

    @Override // defpackage.b1
    public b1 c(b1 b1Var) {
        int i = this.e;
        b1 b1VarA = null;
        int i2 = this.f;
        DeltaType deltaType = this.a;
        switch (i) {
            case 2:
                z63 z63Var = b1Var.b;
                if (deltaType == b1Var.a && i2 == b1Var.b()) {
                    Boolean bool = ((s63) this.g).c;
                    s63 s63Var = z63Var instanceof s63 ? (s63) z63Var : null;
                    if (g76.L(bool, s63Var != null ? s63Var.c : null)) {
                        g73.Companion.getClass();
                        b1VarA = f73.a(z63Var);
                        if (b1VarA != null) {
                            b1VarA.c = this.c;
                        }
                    }
                }
                return b1VarA;
            case 3:
                if (deltaType == b1Var.a && i2 == b1Var.b()) {
                    f73 f73Var = g73.Companion;
                    z63 z63Var2 = b1Var.b;
                    f73Var.getClass();
                    b1VarA = f73.a(z63Var2);
                    if (b1VarA != null) {
                        b1VarA.c = this.c;
                    }
                }
                return b1VarA;
            default:
                return super.c(b1Var);
        }
    }

    @Override // defpackage.b1
    public final z63 a(fb9 fb9Var) {
        RichTextModel richTextModel;
        Object next;
        int i = this.e;
        int i2 = this.f;
        z63 z63Var = this.g;
        RichTextModel richTextModel2 = null;
        switch (i) {
            case 0:
                ArrayList arrayListN1 = bu1.n1(w2g.w(fb9Var));
                if (arrayListN1.size() < i2) {
                    lg8.i(b09.w(i2, "Paragraph cannot be inserted at invalid index "));
                    return null;
                }
                ArrayList arrayListN12 = bu1.n1(w2g.x(fb9Var));
                arrayListN1.add(i2, ((g63) z63Var).b);
                int i3 = nvb.a;
                Iterator it2 = d46.J(arrayListN12).iterator();
                while (((m46) it2).c) {
                    int iNextInt = ((g46) it2).nextInt();
                    SectionModel sectionModel = (SectionModel) arrayListN12.get(iNextInt);
                    int i4 = sectionModel.start_index;
                    if (i4 > 0 && i4 >= i2) {
                        ivb ivbVarNewBuilder = sectionModel.newBuilder();
                        ivbVarNewBuilder.b = Integer.valueOf(sectionModel.start_index + 1);
                        arrayListN12.set(iNextInt, ivbVarNewBuilder.build());
                    }
                }
                RichTextModel richTextModel3 = fb9Var.e;
                if (richTextModel3 != null) {
                    richTextModel = richTextModel3;
                } else {
                    RichTextModel richTextModel4 = new RichTextModel(null, null, null, 7, null);
                    fb9Var.e = richTextModel4;
                    richTextModel = richTextModel4;
                }
                fb9Var.e = RichTextModel.copy$default(richTextModel, arrayListN1, arrayListN12, null, 4, null);
                return new k63(i2);
            case 1:
                SectionModel sectionModel2 = ((h63) z63Var).b;
                ArrayList arrayListN13 = bu1.n1(w2g.x(fb9Var));
                int size = w2g.w(fb9Var).size();
                int i5 = sectionModel2.start_index;
                if (i2 < 0) {
                    lg8.i(b09.w(i2, "Section cannot be inserted at negative index "));
                    return null;
                }
                if (i2 > arrayListN13.size()) {
                    lg8.i(b09.w(i2, "Section cannot be inserted at invalid index "));
                    return null;
                }
                if (i2 == 0 && i5 != 0) {
                    lg8.i(b09.w(i5, "For the first section, start index should be 0 but was "));
                    return null;
                }
                if (i5 != 0 && size < i5) {
                    lg8.i(ev6.v("Section has an invalid start index ", i5, size, ", paragraph count "));
                    return null;
                }
                Iterator it3 = arrayListN13.iterator();
                while (true) {
                    if (it3.hasNext()) {
                        next = it3.next();
                        if (((SectionModel) next).start_index == i5) {
                        }
                    } else {
                        next = null;
                    }
                }
                SectionModel sectionModel3 = (SectionModel) next;
                if (sectionModel3 != null) {
                    if (i2 < arrayListN13.size() && ((SectionModel) arrayListN13.get(i2)).start_index == i5 && g76.L(((SectionModel) arrayListN13.get(i2)).name, sectionModel2.name) && g76.L(arrayListN13.get(i2), sectionModel3)) {
                        return new l63(i2);
                    }
                    throw new IllegalStateException("Cannot insert section at start_index " + i5 + CspinKvYN.OCjQijQjEPWL + sectionModel3 + ", Attempted: " + sectionModel2);
                }
                f17 f17VarB = d46.B();
                if (i2 > 0) {
                    f17VarB.add(arrayListN13.get(i2 - 1));
                }
                f17VarB.add(sectionModel2);
                if (i2 < arrayListN13.size()) {
                    f17VarB.add(arrayListN13.get(i2));
                }
                f17 f17VarW = d46.w(f17VarB);
                if (nvb.b(f17VarW)) {
                    arrayListN13.add(i2, sectionModel2);
                    w2g.L(fb9Var, arrayListN13);
                    return new l63(i2);
                }
                LinkedHashMap linkedHashMap = new LinkedHashMap();
                ListIterator listIterator = f17VarW.listIterator(0);
                while (true) {
                    wn5 wn5Var = (wn5) listIterator;
                    if (!wn5Var.hasNext()) {
                        LinkedHashMap linkedHashMap2 = new LinkedHashMap();
                        for (Map.Entry entry : linkedHashMap.entrySet()) {
                            if (((List) entry.getValue()).size() > 1) {
                                linkedHashMap2.put(entry.getKey(), entry.getValue());
                            }
                        }
                        if (linkedHashMap2.isEmpty()) {
                            ik4.o("Sections are not in a valid order: ", f17VarW);
                            return null;
                        }
                        lg8.u("Cannot insert section: duplicate sections detected at start_index(es) ", bu1.F0(linkedHashMap2.keySet(), null, null, null, null, 63), ". Sections: ", f17VarW);
                        return null;
                    }
                    Object next2 = wn5Var.next();
                    Integer numValueOf = Integer.valueOf(((SectionModel) next2).start_index);
                    Object arrayList = linkedHashMap.get(numValueOf);
                    if (arrayList == null) {
                        arrayList = new ArrayList();
                        linkedHashMap.put(numValueOf, arrayList);
                    }
                    ((List) arrayList).add(next2);
                }
                break;
            case 2:
                s63 s63Var = (s63) z63Var;
                RichTextModel richTextModel5 = fb9Var.e;
                if (richTextModel5 == null) {
                    RichTextModel richTextModel6 = new RichTextModel(null, null, null, 7, null);
                    fb9Var.e = richTextModel6;
                    richTextModel5 = richTextModel6;
                }
                ArrayList arrayListN14 = bu1.n1(richTextModel5.paragraphs);
                if (arrayListN14.size() <= i2) {
                    lg8.i(b09.w(i2, "Paragraph does not exist at index "));
                    return null;
                }
                ParagraphPb paragraphPb = (ParagraphPb) arrayListN14.get(i2);
                arrayListN14.set(i2, s63Var.b);
                RichTextModel richTextModel7 = fb9Var.build().body_model;
                if (richTextModel7 != null) {
                    ekb ekbVarNewBuilder = richTextModel7.newBuilder();
                    Internal.checkElementsNotNull(arrayListN14);
                    ekbVarNewBuilder.a = arrayListN14;
                    richTextModel2 = new RichTextModel(ekbVarNewBuilder.a, ekbVarNewBuilder.b, ekbVarNewBuilder.buildUnknownFields());
                }
                fb9Var.e = richTextModel2;
                return new s63(i2, paragraphPb, s63Var.c);
            default:
                SectionModel sectionModel4 = ((v63) z63Var).b;
                ArrayList arrayListN15 = bu1.n1(w2g.x(fb9Var));
                int size2 = w2g.w(fb9Var).size();
                int i6 = sectionModel4.start_index;
                int size3 = arrayListN15.size();
                if (i2 < 0 || i2 >= size3) {
                    lg8.i(b09.w(i2, "Section does not exist at index "));
                    return null;
                }
                if (i2 == 0 && i6 != 0) {
                    lg8.i(b09.w(i6, "For the first section, start index should be 0 but was "));
                    return null;
                }
                if (i6 != 0 && size2 <= i6) {
                    lg8.i(ev6.v("Section has an invalid start index ", i6, size2, ", paragraph count "));
                    return null;
                }
                f17 f17VarB2 = d46.B();
                if (i2 > 0) {
                    f17VarB2.add(arrayListN15.get(i2 - 1));
                }
                f17VarB2.add(sectionModel4);
                int i7 = i2 + 1;
                if (i7 < arrayListN15.size()) {
                    f17VarB2.add(arrayListN15.get(i7));
                }
                f17 f17VarW2 = d46.w(f17VarB2);
                if (!nvb.b(f17VarW2)) {
                    ik4.o("Sections are not in a valid order: ", f17VarW2);
                    return null;
                }
                SectionModel sectionModel5 = (SectionModel) arrayListN15.get(i2);
                arrayListN15.set(i2, sectionModel4);
                w2g.L(fb9Var, arrayListN15);
                return new v63(i2, sectionModel5);
        }
    }

    public a36(DeltaType deltaType, g63 g63Var) {
        super(deltaType, g63Var);
        this.g = g63Var;
        this.f = g63Var.a;
    }

    public a36(DeltaType deltaType, h63 h63Var) {
        super(deltaType, h63Var);
        this.g = h63Var;
        this.f = h63Var.a;
    }

    public a36(DeltaType deltaType, v63 v63Var) {
        super(deltaType, v63Var);
        this.g = v63Var;
        this.f = v63Var.a;
    }
}
