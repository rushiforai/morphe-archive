package com.medium.proto.model;

import android.os.Parcelable;
import com.medium.proto.obv.post.SyntaxHighlightMode;
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
import defpackage.lv8;
import defpackage.mp1;
import defpackage.n1b;
import defpackage.np1;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u000b\u0018\u0000 \u001b2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001cB)\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000b\u0010\fJ\u001a\u0010\u0010\u001a\u00020\u000f2\b\u0010\u000e\u001a\u0004\u0018\u00010\rH\u0096\u0002¢\u0006\u0004\b\u0010\u0010\u0011J\u000f\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0015\u001a\u00020\u0005H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J/\u0010\u0017\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\u0017\u0010\u0018R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u0019R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001a¨\u0006\u001d"}, d2 = {"Lcom/medium/proto/model/CodeBlockMetadata;", "Lcom/squareup/wire/AndroidMessage;", "Lmp1;", "Lcom/medium/proto/obv/post/SyntaxHighlightMode;", "mode", "", "lang", "Lh21;", "unknownFields", "<init>", "(Lcom/medium/proto/obv/post/SyntaxHighlightMode;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lmp1;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Lcom/medium/proto/obv/post/SyntaxHighlightMode;Ljava/lang/String;Lh21;)Lcom/medium/proto/model/CodeBlockMetadata;", "Lcom/medium/proto/obv/post/SyntaxHighlightMode;", "Ljava/lang/String;", "Companion", "np1", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CodeBlockMetadata extends AndroidMessage<CodeBlockMetadata, mp1> {
    public static final ProtoAdapter<CodeBlockMetadata> ADAPTER;
    public static final Parcelable.Creator<CodeBlockMetadata> CREATOR;
    public static final np1 Companion = new np1();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String lang;

    @WireField(adapter = "com.medium.proto.obv.post.SyntaxHighlightMode#ADAPTER", schemaIndex = 0, tag = 1)
    public final SyntaxHighlightMode mode;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(CodeBlockMetadata.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<CodeBlockMetadata> protoAdapter = new ProtoAdapter<CodeBlockMetadata>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.model.CodeBlockMetadata$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final CodeBlockMetadata decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                SyntaxHighlightMode syntaxHighlightModeDecode = null;
                String strDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new CodeBlockMetadata(syntaxHighlightModeDecode, strDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        try {
                            syntaxHighlightModeDecode = SyntaxHighlightMode.ADAPTER.decode(reader);
                        } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                            reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                        }
                    } else if (iNextTag != 2) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, CodeBlockMetadata value) {
                writer.getClass();
                value.getClass();
                SyntaxHighlightMode.ADAPTER.encodeWithTag(writer, 1, value.mode);
                ProtoAdapter.STRING.encodeWithTag(writer, 2, value.lang);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(CodeBlockMetadata value) {
                value.getClass();
                return ProtoAdapter.STRING.encodedSizeWithTag(2, value.lang) + SyntaxHighlightMode.ADAPTER.encodedSizeWithTag(1, value.mode) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final CodeBlockMetadata redact(CodeBlockMetadata value) {
                value.getClass();
                return CodeBlockMetadata.copy$default(value, null, null, h21.d, 3, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, CodeBlockMetadata value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.STRING.encodeWithTag(writer, 2, value.lang);
                SyntaxHighlightMode.ADAPTER.encodeWithTag(writer, 1, value.mode);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ CodeBlockMetadata(SyntaxHighlightMode syntaxHighlightMode, String str, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : syntaxHighlightMode, (i & 2) != 0 ? null : str, (i & 4) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ CodeBlockMetadata copy$default(CodeBlockMetadata codeBlockMetadata, SyntaxHighlightMode syntaxHighlightMode, String str, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            syntaxHighlightMode = codeBlockMetadata.mode;
        }
        if ((i & 2) != 0) {
            str = codeBlockMetadata.lang;
        }
        if ((i & 4) != 0) {
            h21Var = codeBlockMetadata.unknownFields();
        }
        return codeBlockMetadata.copy(syntaxHighlightMode, str, h21Var);
    }

    public final CodeBlockMetadata copy(SyntaxHighlightMode mode, String lang, h21 unknownFields) {
        unknownFields.getClass();
        return new CodeBlockMetadata(mode, lang, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof CodeBlockMetadata)) {
            return false;
        }
        CodeBlockMetadata codeBlockMetadata = (CodeBlockMetadata) other;
        return g76.L(unknownFields(), codeBlockMetadata.unknownFields()) && this.mode == codeBlockMetadata.mode && g76.L(this.lang, codeBlockMetadata.lang);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        SyntaxHighlightMode syntaxHighlightMode = this.mode;
        int iHashCode2 = (iHashCode + (syntaxHighlightMode != null ? syntaxHighlightMode.hashCode() : 0)) * 37;
        String str = this.lang;
        int iHashCode3 = iHashCode2 + (str != null ? str.hashCode() : 0);
        this.hashCode = iHashCode3;
        return iHashCode3;
    }

    @Override // com.squareup.wire.Message
    public final mp1 newBuilder() {
        mp1 mp1Var = new mp1();
        mp1Var.a = this.mode;
        mp1Var.b = this.lang;
        mp1Var.addUnknownFields(unknownFields());
        return mp1Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        SyntaxHighlightMode syntaxHighlightMode = this.mode;
        if (syntaxHighlightMode != null) {
            arrayList.add("mode=" + syntaxHighlightMode);
        }
        String str = this.lang;
        if (str != null) {
            lv8.D(str, "lang=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "CodeBlockMetadata{", "}", null, 56);
    }

    public CodeBlockMetadata() {
        this(null, null, null, 7, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CodeBlockMetadata(SyntaxHighlightMode syntaxHighlightMode, String str, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.mode = syntaxHighlightMode;
        this.lang = str;
    }
}
