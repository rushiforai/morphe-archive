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
import defpackage.bu1;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.k0a;
import defpackage.l0a;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\f\u0018\u0000 \u001d2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001eB5\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u000b\u0010\fJ\u000f\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\r\u0010\u000eJ\u001a\u0010\u0011\u001a\u00020\u00052\b\u0010\u0010\u001a\u0004\u0018\u00010\u000fH\u0096\u0002¢\u0006\u0004\b\u0011\u0010\u0012J\u000f\u0010\u0014\u001a\u00020\u0013H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0016\u001a\u00020\u0007H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J;\u0010\u0018\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00072\b\b\u0002\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u0018\u0010\u0019R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001aR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001bR\u0016\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001c¨\u0006\u001f"}, d2 = {"Lcom/medium/proto/model/PreviewContent;", "Lcom/squareup/wire/AndroidMessage;", "Lk0a;", "Lcom/medium/proto/model/RichTextModel;", "body_model", "", "is_full_content", "", "subtitle", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/model/RichTextModel;Ljava/lang/Boolean;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lk0a;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/model/RichTextModel;Ljava/lang/Boolean;Ljava/lang/String;Lh21;)Lcom/medium/proto/model/PreviewContent;", "Lcom/medium/proto/model/RichTextModel;", "Ljava/lang/Boolean;", "Ljava/lang/String;", "Companion", "l0a", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PreviewContent extends AndroidMessage<PreviewContent, k0a> {
    public static final ProtoAdapter<PreviewContent> ADAPTER;
    public static final Parcelable.Creator<PreviewContent> CREATOR;
    public static final l0a Companion = new l0a();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.model.RichTextModel#ADAPTER", schemaIndex = 0, tag = 1)
    public final RichTextModel body_model;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 1, tag = 2)
    public final Boolean is_full_content;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String subtitle;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(PreviewContent.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<PreviewContent> protoAdapter = new ProtoAdapter<PreviewContent>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.model.PreviewContent$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final PreviewContent decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                RichTextModel richTextModelDecode = null;
                Boolean boolDecode = null;
                String strDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new PreviewContent(richTextModelDecode, boolDecode, strDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        richTextModelDecode = RichTextModel.ADAPTER.decode(reader);
                    } else if (iNextTag == 2) {
                        boolDecode = ProtoAdapter.BOOL.decode(reader);
                    } else if (iNextTag != 3) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, PreviewContent value) {
                writer.getClass();
                value.getClass();
                RichTextModel.ADAPTER.encodeWithTag(writer, 1, value.body_model);
                ProtoAdapter.BOOL.encodeWithTag(writer, 2, value.is_full_content);
                ProtoAdapter.STRING.encodeWithTag(writer, 3, value.subtitle);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(PreviewContent value) {
                value.getClass();
                return ProtoAdapter.STRING.encodedSizeWithTag(3, value.subtitle) + ProtoAdapter.BOOL.encodedSizeWithTag(2, value.is_full_content) + RichTextModel.ADAPTER.encodedSizeWithTag(1, value.body_model) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final PreviewContent redact(PreviewContent value) {
                value.getClass();
                RichTextModel richTextModel = value.body_model;
                return PreviewContent.copy$default(value, richTextModel != null ? RichTextModel.ADAPTER.redact(richTextModel) : null, null, null, h21.d, 6, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, PreviewContent value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.STRING.encodeWithTag(writer, 3, value.subtitle);
                ProtoAdapter.BOOL.encodeWithTag(writer, 2, value.is_full_content);
                RichTextModel.ADAPTER.encodeWithTag(writer, 1, value.body_model);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ PreviewContent(RichTextModel richTextModel, Boolean bool, String str, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : richTextModel, (i & 2) != 0 ? null : bool, (i & 4) != 0 ? null : str, (i & 8) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ PreviewContent copy$default(PreviewContent previewContent, RichTextModel richTextModel, Boolean bool, String str, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            richTextModel = previewContent.body_model;
        }
        if ((i & 2) != 0) {
            bool = previewContent.is_full_content;
        }
        if ((i & 4) != 0) {
            str = previewContent.subtitle;
        }
        if ((i & 8) != 0) {
            h21Var = previewContent.unknownFields();
        }
        return previewContent.copy(richTextModel, bool, str, h21Var);
    }

    public final PreviewContent copy(RichTextModel body_model, Boolean is_full_content, String subtitle, h21 unknownFields) {
        unknownFields.getClass();
        return new PreviewContent(body_model, is_full_content, subtitle, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof PreviewContent)) {
            return false;
        }
        PreviewContent previewContent = (PreviewContent) other;
        return g76.L(unknownFields(), previewContent.unknownFields()) && g76.L(this.body_model, previewContent.body_model) && g76.L(this.is_full_content, previewContent.is_full_content) && g76.L(this.subtitle, previewContent.subtitle);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        RichTextModel richTextModel = this.body_model;
        int iHashCode2 = (iHashCode + (richTextModel != null ? richTextModel.hashCode() : 0)) * 37;
        Boolean bool = this.is_full_content;
        int i2 = (iHashCode2 + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37;
        String str = this.subtitle;
        int iHashCode3 = i2 + (str != null ? str.hashCode() : 0);
        this.hashCode = iHashCode3;
        return iHashCode3;
    }

    @Override // com.squareup.wire.Message
    public final k0a newBuilder() {
        k0a k0aVar = new k0a();
        k0aVar.a = this.body_model;
        k0aVar.b = this.is_full_content;
        k0aVar.c = this.subtitle;
        k0aVar.addUnknownFields(unknownFields());
        return k0aVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        RichTextModel richTextModel = this.body_model;
        if (richTextModel != null) {
            arrayList.add("body_model=" + richTextModel);
        }
        Boolean bool = this.is_full_content;
        if (bool != null) {
            lv8.A("is_full_content=", bool, arrayList);
        }
        String str = this.subtitle;
        if (str != null) {
            lv8.D(str, "subtitle=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "PreviewContent{", "}", null, 56);
    }

    public PreviewContent() {
        this(null, null, null, null, 15, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PreviewContent(RichTextModel richTextModel, Boolean bool, String str, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.body_model = richTextModel;
        this.is_full_content = bool;
        this.subtitle = str;
    }
}
