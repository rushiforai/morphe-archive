package com.medium.proto.model;

import android.os.Parcelable;
import com.squareup.wire.AndroidMessage;
import com.squareup.wire.FieldEncoding;
import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.ProtoReader;
import com.squareup.wire.ProtoWriter;
import com.squareup.wire.ReverseProtoWriter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireField;
import com.squareup.wire.internal.Internal;
import defpackage.b09;
import defpackage.bu1;
import defpackage.ekb;
import defpackage.ey3;
import defpackage.fkb;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.n1b;
import defpackage.wg6;
import defpackage.wgd;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000B\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\b\b\u0007\u0018\u0000 \u001c2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001dB1\u0012\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003\u0012\u000e\b\u0002\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u0003\u0012\b\b\u0002\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\f\u0010\rJ\u001a\u0010\u0011\u001a\u00020\u00102\b\u0010\u000f\u001a\u0004\u0018\u00010\u000eH\u0096\u0002¢\u0006\u0004\b\u0011\u0010\u0012J\u000f\u0010\u0014\u001a\u00020\u0013H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0017\u001a\u00020\u0016H\u0016¢\u0006\u0004\b\u0017\u0010\u0018J7\u0010\u0019\u001a\u00020\u00002\u000e\b\u0002\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\u000e\b\u0002\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u00032\b\b\u0002\u0010\t\u001a\u00020\b¢\u0006\u0004\b\u0019\u0010\u001aR\u001a\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00040\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\u001bR\u001a\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00060\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001b¨\u0006\u001e"}, d2 = {"Lcom/medium/proto/model/RichTextModel;", "Lcom/squareup/wire/AndroidMessage;", "Lekb;", "", "Lcom/medium/proto/model/ParagraphPb;", "paragraphs", "Lcom/medium/proto/model/SectionModel;", "sections", "Lh21;", "unknownFields", "<init>", "(Ljava/util/List;Ljava/util/List;Lh21;)V", "newBuilder", "()Lekb;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "", "toString", "()Ljava/lang/String;", "copy", "(Ljava/util/List;Ljava/util/List;Lh21;)Lcom/medium/proto/model/RichTextModel;", "Ljava/util/List;", "Companion", "fkb", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class RichTextModel extends AndroidMessage<RichTextModel, ekb> {
    public static final ProtoAdapter<RichTextModel> ADAPTER;
    public static final Parcelable.Creator<RichTextModel> CREATOR;
    public static final fkb Companion = new fkb();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.model.ParagraphPb#ADAPTER", label = WireField.Label.REPEATED, schemaIndex = 0, tag = 1)
    public final List<ParagraphPb> paragraphs;

    @WireField(adapter = "com.medium.proto.model.SectionModel#ADAPTER", label = WireField.Label.REPEATED, schemaIndex = 1, tag = 2)
    public final List<SectionModel> sections;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(RichTextModel.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<RichTextModel> protoAdapter = new ProtoAdapter<RichTextModel>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.model.RichTextModel$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final RichTextModel decode(ProtoReader reader) {
                ArrayList arrayListF = b09.F(reader);
                ArrayList arrayList = new ArrayList();
                long jBeginMessage = reader.beginMessage();
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new RichTextModel(arrayListF, arrayList, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        arrayListF.add(ParagraphPb.ADAPTER.decode(reader));
                    } else if (iNextTag != 2) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        arrayList.add(SectionModel.ADAPTER.decode(reader));
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, RichTextModel value) {
                writer.getClass();
                value.getClass();
                ParagraphPb.ADAPTER.asRepeated().encodeWithTag(writer, 1, value.paragraphs);
                SectionModel.ADAPTER.asRepeated().encodeWithTag(writer, 2, value.sections);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(RichTextModel value) {
                value.getClass();
                return SectionModel.ADAPTER.asRepeated().encodedSizeWithTag(2, value.sections) + ParagraphPb.ADAPTER.asRepeated().encodedSizeWithTag(1, value.paragraphs) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final RichTextModel redact(RichTextModel value) {
                value.getClass();
                return value.copy(Internal.m97redactElements(value.paragraphs, ParagraphPb.ADAPTER), Internal.m97redactElements(value.sections, SectionModel.ADAPTER), h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, RichTextModel value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                SectionModel.ADAPTER.asRepeated().encodeWithTag(writer, 2, value.sections);
                ParagraphPb.ADAPTER.asRepeated().encodeWithTag(writer, 1, value.paragraphs);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public RichTextModel(List<ParagraphPb> list, List<SectionModel> list2, h21 h21Var) {
        super(ADAPTER, h21Var);
        list.getClass();
        list2.getClass();
        h21Var.getClass();
        this.paragraphs = Internal.immutableCopyOf("paragraphs", list);
        this.sections = Internal.immutableCopyOf("sections", list2);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ RichTextModel copy$default(RichTextModel richTextModel, List list, List list2, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            list = richTextModel.paragraphs;
        }
        if ((i & 2) != 0) {
            list2 = richTextModel.sections;
        }
        if ((i & 4) != 0) {
            h21Var = richTextModel.unknownFields();
        }
        return richTextModel.copy(list, list2, h21Var);
    }

    public final RichTextModel copy(List<ParagraphPb> paragraphs, List<SectionModel> sections, h21 unknownFields) {
        paragraphs.getClass();
        sections.getClass();
        unknownFields.getClass();
        return new RichTextModel(paragraphs, sections, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof RichTextModel)) {
            return false;
        }
        RichTextModel richTextModel = (RichTextModel) other;
        return g76.L(unknownFields(), richTextModel.unknownFields()) && g76.L(this.paragraphs, richTextModel.paragraphs) && g76.L(this.sections, richTextModel.sections);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = this.sections.hashCode() + wgd.p(unknownFields().hashCode() * 37, 37, this.paragraphs);
        this.hashCode = iHashCode;
        return iHashCode;
    }

    @Override // com.squareup.wire.Message
    public final ekb newBuilder() {
        ekb ekbVar = new ekb();
        ey3 ey3Var = ey3.a;
        ekbVar.a = ey3Var;
        ekbVar.b = ey3Var;
        ekbVar.a = this.paragraphs;
        ekbVar.b = this.sections;
        ekbVar.addUnknownFields(unknownFields());
        return ekbVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        if (!this.paragraphs.isEmpty()) {
            b09.J("paragraphs=", this.paragraphs, arrayList);
        }
        if (!this.sections.isEmpty()) {
            b09.J("sections=", this.sections, arrayList);
        }
        return bu1.F0(arrayList, ", ", "RichTextModel{", "}", null, 56);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ RichTextModel(List list, List list2, h21 h21Var, int i, gy2 gy2Var) {
        int i2 = i & 1;
        ey3 ey3Var = ey3.a;
        this(i2 != 0 ? ey3Var : list, (i & 2) != 0 ? ey3Var : list2, (i & 4) != 0 ? h21.d : h21Var);
    }

    public RichTextModel() {
        this(null, null, null, 7, null);
    }
}
