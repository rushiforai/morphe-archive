package com.medium.proto.model;

import android.os.Parcelable;
import com.medium.proto.obv.post.ColorType;
import com.squareup.wire.AndroidMessage;
import com.squareup.wire.FieldEncoding;
import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.ProtoReader;
import com.squareup.wire.ProtoWriter;
import com.squareup.wire.ReverseProtoWriter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireField;
import defpackage.bu1;
import defpackage.df9;
import defpackage.ef9;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u000b\b\u0007\u0018\u0000 \u001d2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001eB)\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000b\u0010\fJ\u001a\u0010\u000f\u001a\u00020\u00032\b\u0010\u000e\u001a\u0004\u0018\u00010\rH\u0096\u0002¢\u0006\u0004\b\u000f\u0010\u0010J\u000f\u0010\u0012\u001a\u00020\u0011H\u0016¢\u0006\u0004\b\u0012\u0010\u0013J\u000f\u0010\u0015\u001a\u00020\u0014H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J/\u0010\u0017\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\u0017\u0010\u0018R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u0019R\u001c\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0006\u0010\u001a\u0012\u0004\b\u001b\u0010\u001c¨\u0006\u001f"}, d2 = {"Lcom/medium/proto/model/PostDisplay;", "Lcom/squareup/wire/AndroidMessage;", "Ldf9;", "", "coverless", "Lcom/medium/proto/obv/post/ColorType;", "color_theme", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/Boolean;Lcom/medium/proto/obv/post/ColorType;Lh21;)V", "newBuilder", "()Ldf9;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/Boolean;Lcom/medium/proto/obv/post/ColorType;Lh21;)Lcom/medium/proto/model/PostDisplay;", "Ljava/lang/Boolean;", "Lcom/medium/proto/obv/post/ColorType;", "getColor_theme$annotations", "()V", "Companion", "ef9", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PostDisplay extends AndroidMessage<PostDisplay, df9> {
    public static final ProtoAdapter<PostDisplay> ADAPTER;
    public static final Parcelable.Creator<PostDisplay> CREATOR;
    public static final ef9 Companion = new ef9();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.obv.post.ColorType#ADAPTER", schemaIndex = 1, tag = 2)
    public final ColorType color_theme;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 0, tag = 1)
    public final Boolean coverless;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(PostDisplay.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<PostDisplay> protoAdapter = new ProtoAdapter<PostDisplay>(fieldEncoding, wg6VarB, syntax) { // from class: com.medium.proto.model.PostDisplay$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final PostDisplay decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                Boolean boolDecode = null;
                ColorType colorTypeDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new PostDisplay(boolDecode, colorTypeDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        boolDecode = ProtoAdapter.BOOL.decode(reader);
                    } else if (iNextTag != 2) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        try {
                            colorTypeDecode = ColorType.ADAPTER.decode(reader);
                        } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                            reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                        }
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, PostDisplay value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter.BOOL.encodeWithTag(writer, 1, value.coverless);
                ColorType.ADAPTER.encodeWithTag(writer, 2, value.color_theme);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(PostDisplay value) {
                value.getClass();
                return ColorType.ADAPTER.encodedSizeWithTag(2, value.color_theme) + ProtoAdapter.BOOL.encodedSizeWithTag(1, value.coverless) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final PostDisplay redact(PostDisplay value) {
                value.getClass();
                return PostDisplay.copy$default(value, null, null, h21.d, 3, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, PostDisplay value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ColorType.ADAPTER.encodeWithTag(writer, 2, value.color_theme);
                ProtoAdapter.BOOL.encodeWithTag(writer, 1, value.coverless);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ PostDisplay(Boolean bool, ColorType colorType, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : bool, (i & 2) != 0 ? null : colorType, (i & 4) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ PostDisplay copy$default(PostDisplay postDisplay, Boolean bool, ColorType colorType, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            bool = postDisplay.coverless;
        }
        if ((i & 2) != 0) {
            colorType = postDisplay.color_theme;
        }
        if ((i & 4) != 0) {
            h21Var = postDisplay.unknownFields();
        }
        return postDisplay.copy(bool, colorType, h21Var);
    }

    public final PostDisplay copy(Boolean coverless, ColorType color_theme, h21 unknownFields) {
        unknownFields.getClass();
        return new PostDisplay(coverless, color_theme, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof PostDisplay)) {
            return false;
        }
        PostDisplay postDisplay = (PostDisplay) other;
        return g76.L(unknownFields(), postDisplay.unknownFields()) && g76.L(this.coverless, postDisplay.coverless) && this.color_theme == postDisplay.color_theme;
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        Boolean bool = this.coverless;
        int i2 = (iHashCode + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37;
        ColorType colorType = this.color_theme;
        int iHashCode2 = i2 + (colorType != null ? colorType.hashCode() : 0);
        this.hashCode = iHashCode2;
        return iHashCode2;
    }

    @Override // com.squareup.wire.Message
    public final df9 newBuilder() {
        df9 df9Var = new df9();
        df9Var.a = this.coverless;
        df9Var.b = this.color_theme;
        df9Var.addUnknownFields(unknownFields());
        return df9Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        Boolean bool = this.coverless;
        if (bool != null) {
            lv8.A("coverless=", bool, arrayList);
        }
        ColorType colorType = this.color_theme;
        if (colorType != null) {
            arrayList.add("color_theme=" + colorType);
        }
        return bu1.F0(arrayList, ", ", "PostDisplay{", "}", null, 56);
    }

    public static /* synthetic */ void getColor_theme$annotations() {
    }

    public PostDisplay() {
        this(null, null, null, 7, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PostDisplay(Boolean bool, ColorType colorType, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.coverless = bool;
        this.color_theme = colorType;
    }
}
