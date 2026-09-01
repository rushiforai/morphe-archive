package gen.model;

import android.os.Parcelable;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.squareup.wire.AndroidMessage;
import com.squareup.wire.FieldEncoding;
import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.ProtoReader;
import com.squareup.wire.ProtoWriter;
import com.squareup.wire.ReverseProtoWriter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireField;
import defpackage.bu1;
import defpackage.er1;
import defpackage.fr1;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.n1b;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\b\u0018\u0000 &2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002'B¹\u0001\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\u0013\u001a\u00020\u0012¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0016\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u001a\u0010\u001b\u001a\u00020\u001a2\b\u0010\u0019\u001a\u0004\u0018\u00010\u0018H\u0096\u0002¢\u0006\u0004\b\u001b\u0010\u001cJ\u000f\u0010\u001e\u001a\u00020\u001dH\u0016¢\u0006\u0004\b\u001e\u0010\u001fJ\u000f\u0010!\u001a\u00020 H\u0016¢\u0006\u0004\b!\u0010\"J¿\u0001\u0010#\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0013\u001a\u00020\u0012¢\u0006\u0004\b#\u0010$R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010%R\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010%R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010%R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010%R\u0016\u0010\b\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010%R\u0016\u0010\t\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010%R\u0016\u0010\n\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010%R\u0016\u0010\u000b\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010%R\u0016\u0010\f\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010%R\u0016\u0010\r\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\r\u0010%R\u0016\u0010\u000e\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010%R\u0016\u0010\u000f\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010%R\u0016\u0010\u0010\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0010\u0010%R\u0016\u0010\u0011\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0011\u0010%¨\u0006("}, d2 = {"Lgen/model/CollectionColors;", "Lcom/squareup/wire/AndroidMessage;", "Ler1;", "Lgen/model/Color;", "primary_accent_text_color", "secondary_accent_text_color", "tertiary_accent_text_color", "primary_background_color", "secondary_background_color", "tertiary_background_color", "quaternary_background_color", "quote_background_color", "primary_main_text_color", "secondary_main_text_color", "tertiary_main_text_color", "quote_main_text_color", "subtle_text_color", "very_subtle_text_color", "Lh21;", "unknownFields", "<init>", "(Lgen/model/Color;Lgen/model/Color;Lgen/model/Color;Lgen/model/Color;Lgen/model/Color;Lgen/model/Color;Lgen/model/Color;Lgen/model/Color;Lgen/model/Color;Lgen/model/Color;Lgen/model/Color;Lgen/model/Color;Lgen/model/Color;Lgen/model/Color;Lh21;)V", "newBuilder", "()Ler1;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "", "toString", "()Ljava/lang/String;", "copy", "(Lgen/model/Color;Lgen/model/Color;Lgen/model/Color;Lgen/model/Color;Lgen/model/Color;Lgen/model/Color;Lgen/model/Color;Lgen/model/Color;Lgen/model/Color;Lgen/model/Color;Lgen/model/Color;Lgen/model/Color;Lgen/model/Color;Lgen/model/Color;Lh21;)Lgen/model/CollectionColors;", "Lgen/model/Color;", "Companion", "fr1", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CollectionColors extends AndroidMessage<CollectionColors, er1> {
    public static final ProtoAdapter<CollectionColors> ADAPTER;
    public static final Parcelable.Creator<CollectionColors> CREATOR;
    public static final fr1 Companion = new fr1();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "gen.model.Color#ADAPTER", schemaIndex = 0, tag = 1)
    public final Color primary_accent_text_color;

    @WireField(adapter = "gen.model.Color#ADAPTER", schemaIndex = 3, tag = 4)
    public final Color primary_background_color;

    @WireField(adapter = "gen.model.Color#ADAPTER", schemaIndex = 8, tag = 9)
    public final Color primary_main_text_color;

    @WireField(adapter = "gen.model.Color#ADAPTER", schemaIndex = 6, tag = 7)
    public final Color quaternary_background_color;

    @WireField(adapter = "gen.model.Color#ADAPTER", schemaIndex = 7, tag = 8)
    public final Color quote_background_color;

    @WireField(adapter = "gen.model.Color#ADAPTER", schemaIndex = 11, tag = 12)
    public final Color quote_main_text_color;

    @WireField(adapter = "gen.model.Color#ADAPTER", schemaIndex = 1, tag = 2)
    public final Color secondary_accent_text_color;

    @WireField(adapter = "gen.model.Color#ADAPTER", schemaIndex = 4, tag = 5)
    public final Color secondary_background_color;

    @WireField(adapter = "gen.model.Color#ADAPTER", schemaIndex = 9, tag = 10)
    public final Color secondary_main_text_color;

    @WireField(adapter = "gen.model.Color#ADAPTER", schemaIndex = 12, tag = 13)
    public final Color subtle_text_color;

    @WireField(adapter = "gen.model.Color#ADAPTER", schemaIndex = 2, tag = 3)
    public final Color tertiary_accent_text_color;

    @WireField(adapter = "gen.model.Color#ADAPTER", schemaIndex = 5, tag = 6)
    public final Color tertiary_background_color;

    @WireField(adapter = "gen.model.Color#ADAPTER", schemaIndex = 10, tag = 11)
    public final Color tertiary_main_text_color;

    @WireField(adapter = "gen.model.Color#ADAPTER", schemaIndex = 13, tag = 14)
    public final Color very_subtle_text_color;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(CollectionColors.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<CollectionColors> protoAdapter = new ProtoAdapter<CollectionColors>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.CollectionColors$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            /* JADX WARN: Failed to find 'out' block for switch in B:5:0x0024. Please report as an issue. */
            @Override // com.squareup.wire.ProtoAdapter
            public final CollectionColors decode(ProtoReader reader) {
                Color colorDecode;
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                Color color = null;
                Color colorDecode2 = null;
                Color colorDecode3 = null;
                Color colorDecode4 = null;
                Color colorDecode5 = null;
                Color colorDecode6 = null;
                Color colorDecode7 = null;
                Color colorDecode8 = null;
                Color colorDecode9 = null;
                Color colorDecode10 = null;
                Color colorDecode11 = null;
                Color colorDecode12 = null;
                Color colorDecode13 = null;
                Color colorDecode14 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    Color color2 = colorDecode2;
                    if (iNextTag == -1) {
                        return new CollectionColors(color, color2, colorDecode3, colorDecode4, colorDecode5, colorDecode6, colorDecode7, colorDecode8, colorDecode9, colorDecode10, colorDecode11, colorDecode12, colorDecode13, colorDecode14, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            colorDecode = Color.ADAPTER.decode(reader);
                            colorDecode2 = color2;
                            break;
                        case 2:
                            colorDecode2 = Color.ADAPTER.decode(reader);
                            colorDecode = color;
                            break;
                        case 3:
                            colorDecode3 = Color.ADAPTER.decode(reader);
                            colorDecode2 = color2;
                            colorDecode = color;
                            break;
                        case 4:
                            colorDecode4 = Color.ADAPTER.decode(reader);
                            colorDecode2 = color2;
                            colorDecode = color;
                            break;
                        case 5:
                            colorDecode5 = Color.ADAPTER.decode(reader);
                            colorDecode2 = color2;
                            colorDecode = color;
                            break;
                        case 6:
                            colorDecode6 = Color.ADAPTER.decode(reader);
                            colorDecode2 = color2;
                            colorDecode = color;
                            break;
                        case 7:
                            colorDecode7 = Color.ADAPTER.decode(reader);
                            colorDecode2 = color2;
                            colorDecode = color;
                            break;
                        case 8:
                            colorDecode8 = Color.ADAPTER.decode(reader);
                            colorDecode2 = color2;
                            colorDecode = color;
                            break;
                        case 9:
                            colorDecode9 = Color.ADAPTER.decode(reader);
                            colorDecode2 = color2;
                            colorDecode = color;
                            break;
                        case 10:
                            colorDecode10 = Color.ADAPTER.decode(reader);
                            colorDecode2 = color2;
                            colorDecode = color;
                            break;
                        case 11:
                            colorDecode11 = Color.ADAPTER.decode(reader);
                            colorDecode2 = color2;
                            colorDecode = color;
                            break;
                        case 12:
                            colorDecode12 = Color.ADAPTER.decode(reader);
                            colorDecode2 = color2;
                            colorDecode = color;
                            break;
                        case 13:
                            colorDecode13 = Color.ADAPTER.decode(reader);
                            colorDecode2 = color2;
                            colorDecode = color;
                            break;
                        case 14:
                            colorDecode14 = Color.ADAPTER.decode(reader);
                            colorDecode2 = color2;
                            colorDecode = color;
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            colorDecode = color;
                            colorDecode2 = color2;
                            break;
                    }
                    color = colorDecode;
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, CollectionColors value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<Color> protoAdapter2 = Color.ADAPTER;
                protoAdapter2.encodeWithTag(writer, 1, value.primary_accent_text_color);
                protoAdapter2.encodeWithTag(writer, 2, value.secondary_accent_text_color);
                protoAdapter2.encodeWithTag(writer, 3, value.tertiary_accent_text_color);
                protoAdapter2.encodeWithTag(writer, 4, value.primary_background_color);
                protoAdapter2.encodeWithTag(writer, 5, value.secondary_background_color);
                protoAdapter2.encodeWithTag(writer, 6, value.tertiary_background_color);
                protoAdapter2.encodeWithTag(writer, 7, value.quaternary_background_color);
                protoAdapter2.encodeWithTag(writer, 8, value.quote_background_color);
                protoAdapter2.encodeWithTag(writer, 9, value.primary_main_text_color);
                protoAdapter2.encodeWithTag(writer, 10, value.secondary_main_text_color);
                protoAdapter2.encodeWithTag(writer, 11, value.tertiary_main_text_color);
                protoAdapter2.encodeWithTag(writer, 12, value.quote_main_text_color);
                protoAdapter2.encodeWithTag(writer, 13, value.subtle_text_color);
                protoAdapter2.encodeWithTag(writer, 14, value.very_subtle_text_color);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(CollectionColors value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<Color> protoAdapter2 = Color.ADAPTER;
                return protoAdapter2.encodedSizeWithTag(14, value.very_subtle_text_color) + protoAdapter2.encodedSizeWithTag(13, value.subtle_text_color) + protoAdapter2.encodedSizeWithTag(12, value.quote_main_text_color) + protoAdapter2.encodedSizeWithTag(11, value.tertiary_main_text_color) + protoAdapter2.encodedSizeWithTag(10, value.secondary_main_text_color) + protoAdapter2.encodedSizeWithTag(9, value.primary_main_text_color) + protoAdapter2.encodedSizeWithTag(8, value.quote_background_color) + protoAdapter2.encodedSizeWithTag(7, value.quaternary_background_color) + protoAdapter2.encodedSizeWithTag(6, value.tertiary_background_color) + protoAdapter2.encodedSizeWithTag(5, value.secondary_background_color) + protoAdapter2.encodedSizeWithTag(4, value.primary_background_color) + protoAdapter2.encodedSizeWithTag(3, value.tertiary_accent_text_color) + protoAdapter2.encodedSizeWithTag(2, value.secondary_accent_text_color) + protoAdapter2.encodedSizeWithTag(1, value.primary_accent_text_color) + iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final CollectionColors redact(CollectionColors value) {
                value.getClass();
                Color color = value.primary_accent_text_color;
                Color colorRedact = color != null ? Color.ADAPTER.redact(color) : null;
                Color color2 = value.secondary_accent_text_color;
                Color colorRedact2 = color2 != null ? Color.ADAPTER.redact(color2) : null;
                Color color3 = value.tertiary_accent_text_color;
                Color colorRedact3 = color3 != null ? Color.ADAPTER.redact(color3) : null;
                Color color4 = value.primary_background_color;
                Color colorRedact4 = color4 != null ? Color.ADAPTER.redact(color4) : null;
                Color color5 = value.secondary_background_color;
                Color colorRedact5 = color5 != null ? Color.ADAPTER.redact(color5) : null;
                Color color6 = value.tertiary_background_color;
                Color colorRedact6 = color6 != null ? Color.ADAPTER.redact(color6) : null;
                Color color7 = value.quaternary_background_color;
                Color colorRedact7 = color7 != null ? Color.ADAPTER.redact(color7) : null;
                Color color8 = value.quote_background_color;
                Color colorRedact8 = color8 != null ? Color.ADAPTER.redact(color8) : null;
                Color color9 = value.primary_main_text_color;
                Color colorRedact9 = color9 != null ? Color.ADAPTER.redact(color9) : null;
                Color color10 = value.secondary_main_text_color;
                Color colorRedact10 = color10 != null ? Color.ADAPTER.redact(color10) : null;
                Color color11 = value.tertiary_main_text_color;
                Color colorRedact11 = color11 != null ? Color.ADAPTER.redact(color11) : null;
                Color color12 = value.quote_main_text_color;
                Color colorRedact12 = color12 != null ? Color.ADAPTER.redact(color12) : null;
                Color color13 = value.subtle_text_color;
                Color colorRedact13 = color13 != null ? Color.ADAPTER.redact(color13) : null;
                Color color14 = value.very_subtle_text_color;
                return value.copy(colorRedact, colorRedact2, colorRedact3, colorRedact4, colorRedact5, colorRedact6, colorRedact7, colorRedact8, colorRedact9, colorRedact10, colorRedact11, colorRedact12, colorRedact13, color14 != null ? Color.ADAPTER.redact(color14) : null, h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, CollectionColors value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<Color> protoAdapter2 = Color.ADAPTER;
                protoAdapter2.encodeWithTag(writer, 14, value.very_subtle_text_color);
                protoAdapter2.encodeWithTag(writer, 13, value.subtle_text_color);
                protoAdapter2.encodeWithTag(writer, 12, value.quote_main_text_color);
                protoAdapter2.encodeWithTag(writer, 11, value.tertiary_main_text_color);
                protoAdapter2.encodeWithTag(writer, 10, value.secondary_main_text_color);
                protoAdapter2.encodeWithTag(writer, 9, value.primary_main_text_color);
                protoAdapter2.encodeWithTag(writer, 8, value.quote_background_color);
                protoAdapter2.encodeWithTag(writer, 7, value.quaternary_background_color);
                protoAdapter2.encodeWithTag(writer, 6, value.tertiary_background_color);
                protoAdapter2.encodeWithTag(writer, 5, value.secondary_background_color);
                protoAdapter2.encodeWithTag(writer, 4, value.primary_background_color);
                protoAdapter2.encodeWithTag(writer, 3, value.tertiary_accent_text_color);
                protoAdapter2.encodeWithTag(writer, 2, value.secondary_accent_text_color);
                protoAdapter2.encodeWithTag(writer, 1, value.primary_accent_text_color);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ CollectionColors(Color color, Color color2, Color color3, Color color4, Color color5, Color color6, Color color7, Color color8, Color color9, Color color10, Color color11, Color color12, Color color13, Color color14, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : color, (i & 2) != 0 ? null : color2, (i & 4) != 0 ? null : color3, (i & 8) != 0 ? null : color4, (i & 16) != 0 ? null : color5, (i & 32) != 0 ? null : color6, (i & 64) != 0 ? null : color7, (i & 128) != 0 ? null : color8, (i & 256) != 0 ? null : color9, (i & 512) != 0 ? null : color10, (i & 1024) != 0 ? null : color11, (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : color12, (i & 4096) != 0 ? null : color13, (i & 8192) == 0 ? color14 : null, (i & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? h21.d : h21Var);
    }

    public final CollectionColors copy(Color primary_accent_text_color, Color secondary_accent_text_color, Color tertiary_accent_text_color, Color primary_background_color, Color secondary_background_color, Color tertiary_background_color, Color quaternary_background_color, Color quote_background_color, Color primary_main_text_color, Color secondary_main_text_color, Color tertiary_main_text_color, Color quote_main_text_color, Color subtle_text_color, Color very_subtle_text_color, h21 unknownFields) {
        unknownFields.getClass();
        return new CollectionColors(primary_accent_text_color, secondary_accent_text_color, tertiary_accent_text_color, primary_background_color, secondary_background_color, tertiary_background_color, quaternary_background_color, quote_background_color, primary_main_text_color, secondary_main_text_color, tertiary_main_text_color, quote_main_text_color, subtle_text_color, very_subtle_text_color, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof CollectionColors)) {
            return false;
        }
        CollectionColors collectionColors = (CollectionColors) other;
        return g76.L(unknownFields(), collectionColors.unknownFields()) && g76.L(this.primary_accent_text_color, collectionColors.primary_accent_text_color) && g76.L(this.secondary_accent_text_color, collectionColors.secondary_accent_text_color) && g76.L(this.tertiary_accent_text_color, collectionColors.tertiary_accent_text_color) && g76.L(this.primary_background_color, collectionColors.primary_background_color) && g76.L(this.secondary_background_color, collectionColors.secondary_background_color) && g76.L(this.tertiary_background_color, collectionColors.tertiary_background_color) && g76.L(this.quaternary_background_color, collectionColors.quaternary_background_color) && g76.L(this.quote_background_color, collectionColors.quote_background_color) && g76.L(this.primary_main_text_color, collectionColors.primary_main_text_color) && g76.L(this.secondary_main_text_color, collectionColors.secondary_main_text_color) && g76.L(this.tertiary_main_text_color, collectionColors.tertiary_main_text_color) && g76.L(this.quote_main_text_color, collectionColors.quote_main_text_color) && g76.L(this.subtle_text_color, collectionColors.subtle_text_color) && g76.L(this.very_subtle_text_color, collectionColors.very_subtle_text_color);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        Color color = this.primary_accent_text_color;
        int iHashCode2 = (iHashCode + (color != null ? color.hashCode() : 0)) * 37;
        Color color2 = this.secondary_accent_text_color;
        int iHashCode3 = (iHashCode2 + (color2 != null ? color2.hashCode() : 0)) * 37;
        Color color3 = this.tertiary_accent_text_color;
        int iHashCode4 = (iHashCode3 + (color3 != null ? color3.hashCode() : 0)) * 37;
        Color color4 = this.primary_background_color;
        int iHashCode5 = (iHashCode4 + (color4 != null ? color4.hashCode() : 0)) * 37;
        Color color5 = this.secondary_background_color;
        int iHashCode6 = (iHashCode5 + (color5 != null ? color5.hashCode() : 0)) * 37;
        Color color6 = this.tertiary_background_color;
        int iHashCode7 = (iHashCode6 + (color6 != null ? color6.hashCode() : 0)) * 37;
        Color color7 = this.quaternary_background_color;
        int iHashCode8 = (iHashCode7 + (color7 != null ? color7.hashCode() : 0)) * 37;
        Color color8 = this.quote_background_color;
        int iHashCode9 = (iHashCode8 + (color8 != null ? color8.hashCode() : 0)) * 37;
        Color color9 = this.primary_main_text_color;
        int iHashCode10 = (iHashCode9 + (color9 != null ? color9.hashCode() : 0)) * 37;
        Color color10 = this.secondary_main_text_color;
        int iHashCode11 = (iHashCode10 + (color10 != null ? color10.hashCode() : 0)) * 37;
        Color color11 = this.tertiary_main_text_color;
        int iHashCode12 = (iHashCode11 + (color11 != null ? color11.hashCode() : 0)) * 37;
        Color color12 = this.quote_main_text_color;
        int iHashCode13 = (iHashCode12 + (color12 != null ? color12.hashCode() : 0)) * 37;
        Color color13 = this.subtle_text_color;
        int iHashCode14 = (iHashCode13 + (color13 != null ? color13.hashCode() : 0)) * 37;
        Color color14 = this.very_subtle_text_color;
        int iHashCode15 = iHashCode14 + (color14 != null ? color14.hashCode() : 0);
        this.hashCode = iHashCode15;
        return iHashCode15;
    }

    @Override // com.squareup.wire.Message
    public final er1 newBuilder() {
        er1 er1Var = new er1();
        er1Var.a = this.primary_accent_text_color;
        er1Var.b = this.secondary_accent_text_color;
        er1Var.c = this.tertiary_accent_text_color;
        er1Var.d = this.primary_background_color;
        er1Var.e = this.secondary_background_color;
        er1Var.f = this.tertiary_background_color;
        er1Var.g = this.quaternary_background_color;
        er1Var.h = this.quote_background_color;
        er1Var.i = this.primary_main_text_color;
        er1Var.j = this.secondary_main_text_color;
        er1Var.k = this.tertiary_main_text_color;
        er1Var.l = this.quote_main_text_color;
        er1Var.m = this.subtle_text_color;
        er1Var.n = this.very_subtle_text_color;
        er1Var.addUnknownFields(unknownFields());
        return er1Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        Color color = this.primary_accent_text_color;
        if (color != null) {
            arrayList.add("primary_accent_text_color=" + color);
        }
        Color color2 = this.secondary_accent_text_color;
        if (color2 != null) {
            arrayList.add("secondary_accent_text_color=" + color2);
        }
        Color color3 = this.tertiary_accent_text_color;
        if (color3 != null) {
            arrayList.add("tertiary_accent_text_color=" + color3);
        }
        Color color4 = this.primary_background_color;
        if (color4 != null) {
            arrayList.add("primary_background_color=" + color4);
        }
        Color color5 = this.secondary_background_color;
        if (color5 != null) {
            arrayList.add("secondary_background_color=" + color5);
        }
        Color color6 = this.tertiary_background_color;
        if (color6 != null) {
            arrayList.add("tertiary_background_color=" + color6);
        }
        Color color7 = this.quaternary_background_color;
        if (color7 != null) {
            arrayList.add("quaternary_background_color=" + color7);
        }
        Color color8 = this.quote_background_color;
        if (color8 != null) {
            arrayList.add("quote_background_color=" + color8);
        }
        Color color9 = this.primary_main_text_color;
        if (color9 != null) {
            arrayList.add("primary_main_text_color=" + color9);
        }
        Color color10 = this.secondary_main_text_color;
        if (color10 != null) {
            arrayList.add("secondary_main_text_color=" + color10);
        }
        Color color11 = this.tertiary_main_text_color;
        if (color11 != null) {
            arrayList.add("tertiary_main_text_color=" + color11);
        }
        Color color12 = this.quote_main_text_color;
        if (color12 != null) {
            arrayList.add("quote_main_text_color=" + color12);
        }
        Color color13 = this.subtle_text_color;
        if (color13 != null) {
            arrayList.add("subtle_text_color=" + color13);
        }
        Color color14 = this.very_subtle_text_color;
        if (color14 != null) {
            arrayList.add("very_subtle_text_color=" + color14);
        }
        return bu1.F0(arrayList, ", ", "CollectionColors{", "}", null, 56);
    }

    public CollectionColors() {
        this(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 32767, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CollectionColors(Color color, Color color2, Color color3, Color color4, Color color5, Color color6, Color color7, Color color8, Color color9, Color color10, Color color11, Color color12, Color color13, Color color14, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.primary_accent_text_color = color;
        this.secondary_accent_text_color = color2;
        this.tertiary_accent_text_color = color3;
        this.primary_background_color = color4;
        this.secondary_background_color = color5;
        this.tertiary_background_color = color6;
        this.quaternary_background_color = color7;
        this.quote_background_color = color8;
        this.primary_main_text_color = color9;
        this.secondary_main_text_color = color10;
        this.tertiary_main_text_color = color11;
        this.quote_main_text_color = color12;
        this.subtle_text_color = color13;
        this.very_subtle_text_color = color14;
    }
}
