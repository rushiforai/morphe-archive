package gen.model;

import android.os.Parcelable;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.proto.model.ParagraphPb;
import com.medium.proto.model.SequenceColorPalette;
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
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.kzb;
import defpackage.lv8;
import defpackage.lzb;
import defpackage.n1b;
import defpackage.wg6;
import defpackage.wgd;
import defpackage.y30;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000j\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0005\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0018\b\u0007\u0018\u0000 I2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002JBé\u0002\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\f\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\f\u0012\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0010\u0012\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u0003\u0012\u000e\b\u0002\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u00170\u0016\u0012\n\b\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u001a\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u001b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u001c\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u001e\u001a\u0004\u0018\u00010\u001d\u0012\n\b\u0002\u0010 \u001a\u0004\u0018\u00010\u001f\u0012\n\b\u0002\u0010!\u001a\u0004\u0018\u00010\u0010\u0012\n\b\u0002\u0010\"\u001a\u0004\u0018\u00010\u0010\u0012\n\b\u0002\u0010#\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010$\u001a\u0004\u0018\u00010\u0010\u0012\u000e\b\u0002\u0010%\u001a\b\u0012\u0004\u0012\u00020\u00030\u0016\u0012\n\b\u0002\u0010&\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010(\u001a\u0004\u0018\u00010'\u0012\b\b\u0002\u0010*\u001a\u00020)¢\u0006\u0004\b+\u0010,J\u000f\u0010-\u001a\u00020\u0002H\u0016¢\u0006\u0004\b-\u0010.J\u001a\u00101\u001a\u00020\u00102\b\u00100\u001a\u0004\u0018\u00010/H\u0096\u0002¢\u0006\u0004\b1\u00102J\u000f\u00104\u001a\u000203H\u0016¢\u0006\u0004\b4\u00105J\u000f\u00106\u001a\u00020\u0003H\u0016¢\u0006\u0004\b6\u00107Jï\u0002\u00108\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n2\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f2\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\f2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\f2\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u00102\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u00032\u000e\b\u0002\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u00170\u00162\n\b\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u001a\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u001b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u001c\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u001e\u001a\u0004\u0018\u00010\u001d2\n\b\u0002\u0010 \u001a\u0004\u0018\u00010\u001f2\n\b\u0002\u0010!\u001a\u0004\u0018\u00010\u00102\n\b\u0002\u0010\"\u001a\u0004\u0018\u00010\u00102\n\b\u0002\u0010#\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010$\u001a\u0004\u0018\u00010\u00102\u000e\b\u0002\u0010%\u001a\b\u0012\u0004\u0012\u00020\u00030\u00162\n\b\u0002\u0010&\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010(\u001a\u0004\u0018\u00010'2\b\b\u0002\u0010*\u001a\u00020)¢\u0006\u0004\b8\u00109R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010:R\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010:R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010;R\u0016\u0010\b\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010;R\u0016\u0010\t\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010;R\u0016\u0010\u000b\u001a\u0004\u0018\u00010\n8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010<R\u001c\u0010\r\u001a\u0004\u0018\u00010\f8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\r\u0010=\u0012\u0004\b>\u0010?R\u001c\u0010\u000e\u001a\u0004\u0018\u00010\f8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u000e\u0010=\u0012\u0004\b@\u0010?R\u001c\u0010\u000f\u001a\u0004\u0018\u00010\f8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u000f\u0010=\u0012\u0004\bA\u0010?R\u0016\u0010\u0011\u001a\u0004\u0018\u00010\u00108\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0011\u0010BR\u0016\u0010\u0012\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0012\u0010:R\u0016\u0010\u0013\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0013\u0010:R\u0016\u0010\u0014\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0014\u0010:R\u0016\u0010\u0015\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0015\u0010:R\u0016\u0010\u0019\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0019\u0010:R\u0016\u0010\u001a\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001a\u0010:R\u0016\u0010\u001b\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001b\u0010:R\u0016\u0010\u001c\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001c\u0010:R\u0016\u0010\u001e\u001a\u0004\u0018\u00010\u001d8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001e\u0010CR\u0016\u0010 \u001a\u0004\u0018\u00010\u001f8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b \u0010DR\u0016\u0010!\u001a\u0004\u0018\u00010\u00108\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b!\u0010BR\u0016\u0010\"\u001a\u0004\u0018\u00010\u00108\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\"\u0010BR\u001c\u0010#\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b#\u0010:\u0012\u0004\bE\u0010?R\u001c\u0010$\u001a\u0004\u0018\u00010\u00108\u0006X\u0087\u0004¢\u0006\f\n\u0004\b$\u0010B\u0012\u0004\bF\u0010?R\u0016\u0010&\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b&\u0010:R\u0016\u0010(\u001a\u0004\u0018\u00010'8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b(\u0010GR\u001a\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u00170\u00168\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0018\u0010HR\u001a\u0010%\u001a\b\u0012\u0004\u0012\u00020\u00030\u00168\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b%\u0010H¨\u0006K"}, d2 = {"Lgen/model/Sequence;", "Lcom/squareup/wire/AndroidMessage;", "Lkzb;", "", "sequence_id", "slug", "", "created_at", "updated_at", "deleted_at", "Lgen/model/SequencePostLabelMode;", "post_label_mode", "Lgen/model/ImageMetadata;", "cover_image", "tablet_image", "thumbnail_image", "", "should_proxy_cover_image", "eyebrow", "title", "subtitle", "description", "", "Lcom/medium/proto/model/ParagraphPb;", "about_text", "featured_user_title", "featured_user_custom_bio", "color", "bg_color", "Lcom/medium/proto/model/SequenceColorPalette;", "palette", "Lgen/model/SequenceVisibility;", "visibility", "hide_index", "hide_author_in_previews", "catalog_id", "is_finished", "post_ids", "featured_user_id", "Lgen/model/User;", "featured_user", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Lgen/model/SequencePostLabelMode;Lgen/model/ImageMetadata;Lgen/model/ImageMetadata;Lgen/model/ImageMetadata;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/proto/model/SequenceColorPalette;Lgen/model/SequenceVisibility;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Boolean;Ljava/util/List;Ljava/lang/String;Lgen/model/User;Lh21;)V", "newBuilder", "()Lkzb;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Lgen/model/SequencePostLabelMode;Lgen/model/ImageMetadata;Lgen/model/ImageMetadata;Lgen/model/ImageMetadata;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/medium/proto/model/SequenceColorPalette;Lgen/model/SequenceVisibility;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Boolean;Ljava/util/List;Ljava/lang/String;Lgen/model/User;Lh21;)Lgen/model/Sequence;", "Ljava/lang/String;", "Ljava/lang/Long;", "Lgen/model/SequencePostLabelMode;", "Lgen/model/ImageMetadata;", "getCover_image$annotations", "()V", "getTablet_image$annotations", "getThumbnail_image$annotations", "Ljava/lang/Boolean;", "Lcom/medium/proto/model/SequenceColorPalette;", "Lgen/model/SequenceVisibility;", "getCatalog_id$annotations", "is_finished$annotations", "Lgen/model/User;", "Ljava/util/List;", "Companion", "lzb", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class Sequence extends AndroidMessage<Sequence, kzb> {
    public static final ProtoAdapter<Sequence> ADAPTER;
    public static final Parcelable.Creator<Sequence> CREATOR;
    public static final lzb Companion = new lzb();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.medium.proto.model.ParagraphPb#ADAPTER", label = WireField.Label.REPEATED, schemaIndex = 14, tag = 12)
    public final List<ParagraphPb> about_text;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 18, tag = 14)
    public final String bg_color;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 23, tag = 5)
    public final String catalog_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 17, tag = 11)
    public final String color;

    @WireField(adapter = "gen.model.ImageMetadata#ADAPTER", schemaIndex = 6, tag = 7)
    public final ImageMetadata cover_image;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 2, tag = 3)
    public final Long created_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 4, tag = 4)
    public final Long deleted_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 13, tag = 10)
    public final String description;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 10, tag = 20)
    public final String eyebrow;

    @WireField(adapter = "gen.model.User#ADAPTER", schemaIndex = 27, tag = 25)
    public final User featured_user;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 16, tag = 22)
    public final String featured_user_custom_bio;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 26, tag = 24)
    public final String featured_user_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 15, tag = 21)
    public final String featured_user_title;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 22, tag = 28)
    public final Boolean hide_author_in_previews;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 21, tag = 23)
    public final Boolean hide_index;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 24, tag = 6)
    public final Boolean is_finished;

    @WireField(adapter = "com.medium.proto.model.SequenceColorPalette#ADAPTER", schemaIndex = 19, tag = 13)
    public final SequenceColorPalette palette;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", label = WireField.Label.REPEATED, schemaIndex = 25, tag = 17)
    public final List<String> post_ids;

    @WireField(adapter = "gen.model.SequencePostLabelMode#ADAPTER", schemaIndex = 5, tag = 16)
    public final SequencePostLabelMode post_label_mode;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String sequence_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 9, tag = 27)
    public final Boolean should_proxy_cover_image;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String slug;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 12, tag = 9)
    public final String subtitle;

    @WireField(adapter = "gen.model.ImageMetadata#ADAPTER", schemaIndex = 7, tag = 18)
    public final ImageMetadata tablet_image;

    @WireField(adapter = "gen.model.ImageMetadata#ADAPTER", schemaIndex = 8, tag = 19)
    public final ImageMetadata thumbnail_image;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 11, tag = 8)
    public final String title;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 3, tag = 26)
    public final Long updated_at;

    @WireField(adapter = "gen.model.SequenceVisibility#ADAPTER", schemaIndex = 20, tag = 15)
    public final SequenceVisibility visibility;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(Sequence.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<Sequence> protoAdapter = new ProtoAdapter<Sequence>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.Sequence$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final Sequence decode(ProtoReader reader) {
                ArrayList arrayList;
                String str;
                Long l;
                String strDecode;
                ArrayList arrayListF = b09.F(reader);
                ArrayList arrayList2 = new ArrayList();
                long jBeginMessage = reader.beginMessage();
                String str2 = null;
                String strDecode2 = null;
                Long lDecode = null;
                Long lDecode2 = null;
                Long lDecode3 = null;
                SequencePostLabelMode sequencePostLabelModeDecode = null;
                ImageMetadata imageMetadataDecode = null;
                ImageMetadata imageMetadataDecode2 = null;
                ImageMetadata imageMetadataDecode3 = null;
                Boolean boolDecode = null;
                String strDecode3 = null;
                String strDecode4 = null;
                String strDecode5 = null;
                String strDecode6 = null;
                String strDecode7 = null;
                String strDecode8 = null;
                String strDecode9 = null;
                String strDecode10 = null;
                SequenceColorPalette sequenceColorPaletteDecode = null;
                SequenceVisibility sequenceVisibilityDecode = null;
                Boolean boolDecode2 = null;
                Boolean boolDecode3 = null;
                String strDecode11 = null;
                Boolean boolDecode4 = null;
                String strDecode12 = null;
                User userDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new Sequence(str2, strDecode2, lDecode, lDecode2, lDecode3, sequencePostLabelModeDecode, imageMetadataDecode, imageMetadataDecode2, imageMetadataDecode3, boolDecode, strDecode3, strDecode4, strDecode5, strDecode6, arrayListF, strDecode7, strDecode8, strDecode9, strDecode10, sequenceColorPaletteDecode, sequenceVisibilityDecode, boolDecode2, boolDecode3, strDecode11, boolDecode4, arrayList2, strDecode12, userDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            arrayList = arrayList2;
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 2:
                            arrayList = arrayList2;
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 3:
                            arrayList = arrayList2;
                            lDecode = ProtoAdapter.INT64.decode(reader);
                            strDecode = str2;
                            break;
                        case 4:
                            arrayList = arrayList2;
                            lDecode3 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str2;
                            break;
                        case 5:
                            arrayList = arrayList2;
                            strDecode11 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 6:
                            arrayList = arrayList2;
                            boolDecode4 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str2;
                            break;
                        case 7:
                            arrayList = arrayList2;
                            imageMetadataDecode = ImageMetadata.ADAPTER.decode(reader);
                            strDecode = str2;
                            break;
                        case 8:
                            arrayList = arrayList2;
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 9:
                            arrayList = arrayList2;
                            strDecode5 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 10:
                            arrayList = arrayList2;
                            strDecode6 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 11:
                            arrayList = arrayList2;
                            strDecode9 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 12:
                            arrayList = arrayList2;
                            str = strDecode2;
                            l = lDecode;
                            arrayListF.add(ParagraphPb.ADAPTER.decode(reader));
                            strDecode = str2;
                            strDecode2 = str;
                            lDecode = l;
                            break;
                        case 13:
                            arrayList = arrayList2;
                            sequenceColorPaletteDecode = SequenceColorPalette.ADAPTER.decode(reader);
                            strDecode = str2;
                            break;
                        case 14:
                            arrayList = arrayList2;
                            strDecode10 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 15:
                            arrayList = arrayList2;
                            str = strDecode2;
                            l = lDecode;
                            try {
                                sequenceVisibilityDecode = SequenceVisibility.ADAPTER.decode(reader);
                                strDecode2 = str;
                                lDecode = l;
                                strDecode = str2;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                                strDecode = str2;
                                strDecode2 = str;
                                lDecode = l;
                            }
                            break;
                        case 16:
                            try {
                                sequencePostLabelModeDecode = SequencePostLabelMode.ADAPTER.decode(reader);
                                arrayList = arrayList2;
                                strDecode = str2;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e2) {
                                arrayList = arrayList2;
                                str = strDecode2;
                                l = lDecode;
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e2.value));
                                strDecode = str2;
                                strDecode2 = str;
                                lDecode = l;
                            }
                            break;
                        case 17:
                            arrayList2.add(ProtoAdapter.STRING.decode(reader));
                            arrayList = arrayList2;
                            str = strDecode2;
                            l = lDecode;
                            strDecode = str2;
                            strDecode2 = str;
                            lDecode = l;
                            break;
                        case 18:
                            imageMetadataDecode2 = ImageMetadata.ADAPTER.decode(reader);
                            arrayList = arrayList2;
                            strDecode = str2;
                            break;
                        case 19:
                            imageMetadataDecode3 = ImageMetadata.ADAPTER.decode(reader);
                            arrayList = arrayList2;
                            strDecode = str2;
                            break;
                        case 20:
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
                            arrayList = arrayList2;
                            strDecode = str2;
                            break;
                        case 21:
                            strDecode7 = ProtoAdapter.STRING.decode(reader);
                            arrayList = arrayList2;
                            strDecode = str2;
                            break;
                        case 22:
                            strDecode8 = ProtoAdapter.STRING.decode(reader);
                            arrayList = arrayList2;
                            strDecode = str2;
                            break;
                        case 23:
                            boolDecode2 = ProtoAdapter.BOOL.decode(reader);
                            arrayList = arrayList2;
                            strDecode = str2;
                            break;
                        case 24:
                            strDecode12 = ProtoAdapter.STRING.decode(reader);
                            arrayList = arrayList2;
                            strDecode = str2;
                            break;
                        case 25:
                            userDecode = User.ADAPTER.decode(reader);
                            arrayList = arrayList2;
                            strDecode = str2;
                            break;
                        case 26:
                            lDecode2 = ProtoAdapter.INT64.decode(reader);
                            arrayList = arrayList2;
                            strDecode = str2;
                            break;
                        case 27:
                            boolDecode = ProtoAdapter.BOOL.decode(reader);
                            arrayList = arrayList2;
                            strDecode = str2;
                            break;
                        case 28:
                            boolDecode3 = ProtoAdapter.BOOL.decode(reader);
                            arrayList = arrayList2;
                            strDecode = str2;
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            arrayList = arrayList2;
                            str = strDecode2;
                            l = lDecode;
                            strDecode = str2;
                            strDecode2 = str;
                            lDecode = l;
                            break;
                    }
                    str2 = strDecode;
                    arrayList2 = arrayList;
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, Sequence value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.sequence_id);
                protoAdapter2.encodeWithTag(writer, 2, value.slug);
                ProtoAdapter<Long> protoAdapter3 = ProtoAdapter.INT64;
                protoAdapter3.encodeWithTag(writer, 3, value.created_at);
                protoAdapter3.encodeWithTag(writer, 26, value.updated_at);
                protoAdapter3.encodeWithTag(writer, 4, value.deleted_at);
                SequencePostLabelMode.ADAPTER.encodeWithTag(writer, 16, value.post_label_mode);
                ProtoAdapter<ImageMetadata> protoAdapter4 = ImageMetadata.ADAPTER;
                protoAdapter4.encodeWithTag(writer, 7, value.cover_image);
                protoAdapter4.encodeWithTag(writer, 18, value.tablet_image);
                protoAdapter4.encodeWithTag(writer, 19, value.thumbnail_image);
                ProtoAdapter<Boolean> protoAdapter5 = ProtoAdapter.BOOL;
                protoAdapter5.encodeWithTag(writer, 27, value.should_proxy_cover_image);
                protoAdapter2.encodeWithTag(writer, 20, value.eyebrow);
                protoAdapter2.encodeWithTag(writer, 8, value.title);
                protoAdapter2.encodeWithTag(writer, 9, value.subtitle);
                protoAdapter2.encodeWithTag(writer, 10, value.description);
                ParagraphPb.ADAPTER.asRepeated().encodeWithTag(writer, 12, value.about_text);
                protoAdapter2.encodeWithTag(writer, 21, value.featured_user_title);
                protoAdapter2.encodeWithTag(writer, 22, value.featured_user_custom_bio);
                protoAdapter2.encodeWithTag(writer, 11, value.color);
                protoAdapter2.encodeWithTag(writer, 14, value.bg_color);
                SequenceColorPalette.ADAPTER.encodeWithTag(writer, 13, value.palette);
                SequenceVisibility.ADAPTER.encodeWithTag(writer, 15, value.visibility);
                protoAdapter5.encodeWithTag(writer, 23, value.hide_index);
                protoAdapter5.encodeWithTag(writer, 28, value.hide_author_in_previews);
                protoAdapter2.encodeWithTag(writer, 5, value.catalog_id);
                protoAdapter5.encodeWithTag(writer, 6, value.is_finished);
                protoAdapter2.asRepeated().encodeWithTag(writer, 17, value.post_ids);
                protoAdapter2.encodeWithTag(writer, 24, value.featured_user_id);
                User.ADAPTER.encodeWithTag(writer, 25, value.featured_user);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(Sequence value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag = protoAdapter2.encodedSizeWithTag(2, value.slug) + protoAdapter2.encodedSizeWithTag(1, value.sequence_id) + iE;
                ProtoAdapter<Long> protoAdapter3 = ProtoAdapter.INT64;
                int iEncodedSizeWithTag2 = SequencePostLabelMode.ADAPTER.encodedSizeWithTag(16, value.post_label_mode) + protoAdapter3.encodedSizeWithTag(4, value.deleted_at) + protoAdapter3.encodedSizeWithTag(26, value.updated_at) + protoAdapter3.encodedSizeWithTag(3, value.created_at) + iEncodedSizeWithTag;
                ProtoAdapter<ImageMetadata> protoAdapter4 = ImageMetadata.ADAPTER;
                int iEncodedSizeWithTag3 = protoAdapter4.encodedSizeWithTag(19, value.thumbnail_image) + protoAdapter4.encodedSizeWithTag(18, value.tablet_image) + protoAdapter4.encodedSizeWithTag(7, value.cover_image) + iEncodedSizeWithTag2;
                ProtoAdapter<Boolean> protoAdapter5 = ProtoAdapter.BOOL;
                return User.ADAPTER.encodedSizeWithTag(25, value.featured_user) + protoAdapter2.encodedSizeWithTag(24, value.featured_user_id) + protoAdapter2.asRepeated().encodedSizeWithTag(17, value.post_ids) + protoAdapter5.encodedSizeWithTag(6, value.is_finished) + protoAdapter2.encodedSizeWithTag(5, value.catalog_id) + protoAdapter5.encodedSizeWithTag(28, value.hide_author_in_previews) + protoAdapter5.encodedSizeWithTag(23, value.hide_index) + SequenceVisibility.ADAPTER.encodedSizeWithTag(15, value.visibility) + SequenceColorPalette.ADAPTER.encodedSizeWithTag(13, value.palette) + protoAdapter2.encodedSizeWithTag(14, value.bg_color) + protoAdapter2.encodedSizeWithTag(11, value.color) + protoAdapter2.encodedSizeWithTag(22, value.featured_user_custom_bio) + protoAdapter2.encodedSizeWithTag(21, value.featured_user_title) + ParagraphPb.ADAPTER.asRepeated().encodedSizeWithTag(12, value.about_text) + protoAdapter2.encodedSizeWithTag(10, value.description) + protoAdapter2.encodedSizeWithTag(9, value.subtitle) + protoAdapter2.encodedSizeWithTag(8, value.title) + protoAdapter2.encodedSizeWithTag(20, value.eyebrow) + protoAdapter5.encodedSizeWithTag(27, value.should_proxy_cover_image) + iEncodedSizeWithTag3;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final Sequence redact(Sequence value) {
                value.getClass();
                ImageMetadata imageMetadata = value.cover_image;
                ImageMetadata imageMetadataRedact = imageMetadata != null ? ImageMetadata.ADAPTER.redact(imageMetadata) : null;
                ImageMetadata imageMetadata2 = value.tablet_image;
                ImageMetadata imageMetadataRedact2 = imageMetadata2 != null ? ImageMetadata.ADAPTER.redact(imageMetadata2) : null;
                ImageMetadata imageMetadata3 = value.thumbnail_image;
                ImageMetadata imageMetadataRedact3 = imageMetadata3 != null ? ImageMetadata.ADAPTER.redact(imageMetadata3) : null;
                List listM97redactElements = Internal.m97redactElements(value.about_text, ParagraphPb.ADAPTER);
                SequenceColorPalette sequenceColorPalette = value.palette;
                SequenceColorPalette sequenceColorPaletteRedact = sequenceColorPalette != null ? SequenceColorPalette.ADAPTER.redact(sequenceColorPalette) : null;
                User user = value.featured_user;
                return value.copy((133676607 & 1) != 0 ? value.sequence_id : null, (133676607 & 2) != 0 ? value.slug : null, (133676607 & 4) != 0 ? value.created_at : null, (133676607 & 8) != 0 ? value.updated_at : null, (133676607 & 16) != 0 ? value.deleted_at : null, (133676607 & 32) != 0 ? value.post_label_mode : null, (133676607 & 64) != 0 ? value.cover_image : imageMetadataRedact, (133676607 & 128) != 0 ? value.tablet_image : imageMetadataRedact2, (133676607 & 256) != 0 ? value.thumbnail_image : imageMetadataRedact3, (133676607 & 512) != 0 ? value.should_proxy_cover_image : null, (133676607 & 1024) != 0 ? value.eyebrow : null, (133676607 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? value.title : null, (133676607 & 4096) != 0 ? value.subtitle : null, (133676607 & 8192) != 0 ? value.description : null, (133676607 & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? value.about_text : listM97redactElements, (133676607 & 32768) != 0 ? value.featured_user_title : null, (133676607 & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? value.featured_user_custom_bio : null, (133676607 & 131072) != 0 ? value.color : null, (133676607 & 262144) != 0 ? value.bg_color : null, (133676607 & 524288) != 0 ? value.palette : sequenceColorPaletteRedact, (133676607 & 1048576) != 0 ? value.visibility : null, (133676607 & 2097152) != 0 ? value.hide_index : null, (133676607 & 4194304) != 0 ? value.hide_author_in_previews : null, (133676607 & 8388608) != 0 ? value.catalog_id : null, (133676607 & 16777216) != 0 ? value.is_finished : null, (133676607 & 33554432) != 0 ? value.post_ids : null, (133676607 & 67108864) != 0 ? value.featured_user_id : null, (133676607 & 134217728) != 0 ? value.featured_user : user != null ? User.ADAPTER.redact(user) : null, (133676607 & 268435456) != 0 ? value.unknownFields() : h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, Sequence value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                User.ADAPTER.encodeWithTag(writer, 25, value.featured_user);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 24, value.featured_user_id);
                protoAdapter2.asRepeated().encodeWithTag(writer, 17, value.post_ids);
                ProtoAdapter<Boolean> protoAdapter3 = ProtoAdapter.BOOL;
                protoAdapter3.encodeWithTag(writer, 6, value.is_finished);
                protoAdapter2.encodeWithTag(writer, 5, value.catalog_id);
                protoAdapter3.encodeWithTag(writer, 28, value.hide_author_in_previews);
                protoAdapter3.encodeWithTag(writer, 23, value.hide_index);
                SequenceVisibility.ADAPTER.encodeWithTag(writer, 15, value.visibility);
                SequenceColorPalette.ADAPTER.encodeWithTag(writer, 13, value.palette);
                protoAdapter2.encodeWithTag(writer, 14, value.bg_color);
                protoAdapter2.encodeWithTag(writer, 11, value.color);
                protoAdapter2.encodeWithTag(writer, 22, value.featured_user_custom_bio);
                protoAdapter2.encodeWithTag(writer, 21, value.featured_user_title);
                ParagraphPb.ADAPTER.asRepeated().encodeWithTag(writer, 12, value.about_text);
                protoAdapter2.encodeWithTag(writer, 10, value.description);
                protoAdapter2.encodeWithTag(writer, 9, value.subtitle);
                protoAdapter2.encodeWithTag(writer, 8, value.title);
                protoAdapter2.encodeWithTag(writer, 20, value.eyebrow);
                protoAdapter3.encodeWithTag(writer, 27, value.should_proxy_cover_image);
                ProtoAdapter<ImageMetadata> protoAdapter4 = ImageMetadata.ADAPTER;
                protoAdapter4.encodeWithTag(writer, 19, value.thumbnail_image);
                protoAdapter4.encodeWithTag(writer, 18, value.tablet_image);
                protoAdapter4.encodeWithTag(writer, 7, value.cover_image);
                SequencePostLabelMode.ADAPTER.encodeWithTag(writer, 16, value.post_label_mode);
                ProtoAdapter<Long> protoAdapter5 = ProtoAdapter.INT64;
                protoAdapter5.encodeWithTag(writer, 4, value.deleted_at);
                protoAdapter5.encodeWithTag(writer, 26, value.updated_at);
                protoAdapter5.encodeWithTag(writer, 3, value.created_at);
                protoAdapter2.encodeWithTag(writer, 2, value.slug);
                protoAdapter2.encodeWithTag(writer, 1, value.sequence_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ Sequence(String str, String str2, Long l, Long l2, Long l3, SequencePostLabelMode sequencePostLabelMode, ImageMetadata imageMetadata, ImageMetadata imageMetadata2, ImageMetadata imageMetadata3, Boolean bool, String str3, String str4, String str5, String str6, List list, String str7, String str8, String str9, String str10, SequenceColorPalette sequenceColorPalette, SequenceVisibility sequenceVisibility, Boolean bool2, Boolean bool3, String str11, Boolean bool4, List list2, String str12, User user, h21 h21Var, int i, gy2 gy2Var) {
        String str13 = (i & 1) != 0 ? null : str;
        String str14 = (i & 2) != 0 ? null : str2;
        Long l4 = (i & 4) != 0 ? null : l;
        Long l5 = (i & 8) != 0 ? null : l2;
        Long l6 = (i & 16) != 0 ? null : l3;
        SequencePostLabelMode sequencePostLabelMode2 = (i & 32) != 0 ? null : sequencePostLabelMode;
        ImageMetadata imageMetadata4 = (i & 64) != 0 ? null : imageMetadata;
        ImageMetadata imageMetadata5 = (i & 128) != 0 ? null : imageMetadata2;
        ImageMetadata imageMetadata6 = (i & 256) != 0 ? null : imageMetadata3;
        Boolean bool5 = (i & 512) != 0 ? null : bool;
        String str15 = (i & 1024) != 0 ? null : str3;
        String str16 = (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : str4;
        String str17 = (i & 4096) != 0 ? null : str5;
        String str18 = (i & 8192) != 0 ? null : str6;
        int i2 = i & OlympusMakernoteDirectory.TAG_MAIN_INFO;
        List list3 = ey3.a;
        this(str13, str14, l4, l5, l6, sequencePostLabelMode2, imageMetadata4, imageMetadata5, imageMetadata6, bool5, str15, str16, str17, str18, i2 != 0 ? list3 : list, (i & 32768) != 0 ? null : str7, (i & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? null : str8, (i & 131072) != 0 ? null : str9, (i & 262144) != 0 ? null : str10, (i & 524288) != 0 ? null : sequenceColorPalette, (i & 1048576) != 0 ? null : sequenceVisibility, (i & 2097152) != 0 ? null : bool2, (i & 4194304) != 0 ? null : bool3, (i & 8388608) != 0 ? null : str11, (i & 16777216) != 0 ? null : bool4, (i & 33554432) == 0 ? list2 : list3, (i & 67108864) != 0 ? null : str12, (i & 134217728) != 0 ? null : user, (i & 268435456) != 0 ? h21.d : h21Var);
    }

    public final Sequence copy(String sequence_id, String slug, Long created_at, Long updated_at, Long deleted_at, SequencePostLabelMode post_label_mode, ImageMetadata cover_image, ImageMetadata tablet_image, ImageMetadata thumbnail_image, Boolean should_proxy_cover_image, String eyebrow, String title, String subtitle, String description, List<ParagraphPb> about_text, String featured_user_title, String featured_user_custom_bio, String color, String bg_color, SequenceColorPalette palette, SequenceVisibility visibility, Boolean hide_index, Boolean hide_author_in_previews, String catalog_id, Boolean is_finished, List<String> post_ids, String featured_user_id, User featured_user, h21 unknownFields) {
        about_text.getClass();
        post_ids.getClass();
        unknownFields.getClass();
        return new Sequence(sequence_id, slug, created_at, updated_at, deleted_at, post_label_mode, cover_image, tablet_image, thumbnail_image, should_proxy_cover_image, eyebrow, title, subtitle, description, about_text, featured_user_title, featured_user_custom_bio, color, bg_color, palette, visibility, hide_index, hide_author_in_previews, catalog_id, is_finished, post_ids, featured_user_id, featured_user, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof Sequence)) {
            return false;
        }
        Sequence sequence = (Sequence) other;
        return g76.L(unknownFields(), sequence.unknownFields()) && g76.L(this.sequence_id, sequence.sequence_id) && g76.L(this.slug, sequence.slug) && g76.L(this.created_at, sequence.created_at) && g76.L(this.updated_at, sequence.updated_at) && g76.L(this.deleted_at, sequence.deleted_at) && this.post_label_mode == sequence.post_label_mode && g76.L(this.cover_image, sequence.cover_image) && g76.L(this.tablet_image, sequence.tablet_image) && g76.L(this.thumbnail_image, sequence.thumbnail_image) && g76.L(this.should_proxy_cover_image, sequence.should_proxy_cover_image) && g76.L(this.eyebrow, sequence.eyebrow) && g76.L(this.title, sequence.title) && g76.L(this.subtitle, sequence.subtitle) && g76.L(this.description, sequence.description) && g76.L(this.about_text, sequence.about_text) && g76.L(this.featured_user_title, sequence.featured_user_title) && g76.L(this.featured_user_custom_bio, sequence.featured_user_custom_bio) && g76.L(this.color, sequence.color) && g76.L(this.bg_color, sequence.bg_color) && g76.L(this.palette, sequence.palette) && this.visibility == sequence.visibility && g76.L(this.hide_index, sequence.hide_index) && g76.L(this.hide_author_in_previews, sequence.hide_author_in_previews) && g76.L(this.catalog_id, sequence.catalog_id) && g76.L(this.is_finished, sequence.is_finished) && g76.L(this.post_ids, sequence.post_ids) && g76.L(this.featured_user_id, sequence.featured_user_id) && g76.L(this.featured_user, sequence.featured_user);
    }

    public final int hashCode() {
        int i;
        int i2;
        int i3;
        int i4 = this.hashCode;
        if (i4 != 0) {
            return i4;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.sequence_id;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.slug;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        Long l = this.created_at;
        if (l != null) {
            long jLongValue = l.longValue();
            i = (int) (jLongValue ^ (jLongValue >>> 32));
        } else {
            i = 0;
        }
        int i5 = (iHashCode3 + i) * 37;
        Long l2 = this.updated_at;
        if (l2 != null) {
            long jLongValue2 = l2.longValue();
            i2 = (int) (jLongValue2 ^ (jLongValue2 >>> 32));
        } else {
            i2 = 0;
        }
        int i6 = (i5 + i2) * 37;
        Long l3 = this.deleted_at;
        if (l3 != null) {
            long jLongValue3 = l3.longValue();
            i3 = (int) (jLongValue3 ^ (jLongValue3 >>> 32));
        } else {
            i3 = 0;
        }
        int i7 = (i6 + i3) * 37;
        SequencePostLabelMode sequencePostLabelMode = this.post_label_mode;
        int iHashCode4 = (i7 + (sequencePostLabelMode != null ? sequencePostLabelMode.hashCode() : 0)) * 37;
        ImageMetadata imageMetadata = this.cover_image;
        int iHashCode5 = (iHashCode4 + (imageMetadata != null ? imageMetadata.hashCode() : 0)) * 37;
        ImageMetadata imageMetadata2 = this.tablet_image;
        int iHashCode6 = (iHashCode5 + (imageMetadata2 != null ? imageMetadata2.hashCode() : 0)) * 37;
        ImageMetadata imageMetadata3 = this.thumbnail_image;
        int iHashCode7 = (iHashCode6 + (imageMetadata3 != null ? imageMetadata3.hashCode() : 0)) * 37;
        Boolean bool = this.should_proxy_cover_image;
        int i8 = 1237;
        int i9 = (iHashCode7 + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37;
        String str3 = this.eyebrow;
        int iHashCode8 = (i9 + (str3 != null ? str3.hashCode() : 0)) * 37;
        String str4 = this.title;
        int iHashCode9 = (iHashCode8 + (str4 != null ? str4.hashCode() : 0)) * 37;
        String str5 = this.subtitle;
        int iHashCode10 = (iHashCode9 + (str5 != null ? str5.hashCode() : 0)) * 37;
        String str6 = this.description;
        int iP = wgd.p((iHashCode10 + (str6 != null ? str6.hashCode() : 0)) * 37, 37, this.about_text);
        String str7 = this.featured_user_title;
        int iHashCode11 = (iP + (str7 != null ? str7.hashCode() : 0)) * 37;
        String str8 = this.featured_user_custom_bio;
        int iHashCode12 = (iHashCode11 + (str8 != null ? str8.hashCode() : 0)) * 37;
        String str9 = this.color;
        int iHashCode13 = (iHashCode12 + (str9 != null ? str9.hashCode() : 0)) * 37;
        String str10 = this.bg_color;
        int iHashCode14 = (iHashCode13 + (str10 != null ? str10.hashCode() : 0)) * 37;
        SequenceColorPalette sequenceColorPalette = this.palette;
        int iHashCode15 = (iHashCode14 + (sequenceColorPalette != null ? sequenceColorPalette.hashCode() : 0)) * 37;
        SequenceVisibility sequenceVisibility = this.visibility;
        int iHashCode16 = (iHashCode15 + (sequenceVisibility != null ? sequenceVisibility.hashCode() : 0)) * 37;
        Boolean bool2 = this.hide_index;
        int i10 = (iHashCode16 + (bool2 != null ? bool2.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool3 = this.hide_author_in_previews;
        int i11 = (i10 + (bool3 != null ? bool3.booleanValue() ? 1231 : 1237 : 0)) * 37;
        String str11 = this.catalog_id;
        int iHashCode17 = (i11 + (str11 != null ? str11.hashCode() : 0)) * 37;
        Boolean bool4 = this.is_finished;
        if (bool4 == null) {
            i8 = 0;
        } else if (bool4.booleanValue()) {
            i8 = 1231;
        }
        int iP2 = wgd.p((iHashCode17 + i8) * 37, 37, this.post_ids);
        String str12 = this.featured_user_id;
        int iHashCode18 = (iP2 + (str12 != null ? str12.hashCode() : 0)) * 37;
        User user = this.featured_user;
        int iHashCode19 = iHashCode18 + (user != null ? user.hashCode() : 0);
        this.hashCode = iHashCode19;
        return iHashCode19;
    }

    @Override // com.squareup.wire.Message
    public final kzb newBuilder() {
        kzb kzbVar = new kzb();
        ey3 ey3Var = ey3.a;
        kzbVar.o = ey3Var;
        kzbVar.z = ey3Var;
        kzbVar.a = this.sequence_id;
        kzbVar.b = this.slug;
        kzbVar.c = this.created_at;
        kzbVar.d = this.updated_at;
        kzbVar.e = this.deleted_at;
        kzbVar.f = this.post_label_mode;
        kzbVar.g = this.cover_image;
        kzbVar.h = this.tablet_image;
        kzbVar.i = this.thumbnail_image;
        kzbVar.j = this.should_proxy_cover_image;
        kzbVar.k = this.eyebrow;
        kzbVar.l = this.title;
        kzbVar.m = this.subtitle;
        kzbVar.n = this.description;
        kzbVar.o = this.about_text;
        kzbVar.p = this.featured_user_title;
        kzbVar.q = this.featured_user_custom_bio;
        kzbVar.r = this.color;
        kzbVar.s = this.bg_color;
        kzbVar.t = this.palette;
        kzbVar.u = this.visibility;
        kzbVar.v = this.hide_index;
        kzbVar.w = this.hide_author_in_previews;
        kzbVar.x = this.catalog_id;
        kzbVar.y = this.is_finished;
        kzbVar.z = this.post_ids;
        kzbVar.A = this.featured_user_id;
        kzbVar.B = this.featured_user;
        kzbVar.addUnknownFields(unknownFields());
        return kzbVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.sequence_id;
        if (str != null) {
            lv8.D(str, "sequence_id=", arrayList);
        }
        String str2 = this.slug;
        if (str2 != null) {
            lv8.D(str2, "slug=", arrayList);
        }
        Long l = this.created_at;
        if (l != null) {
            y30.A("created_at=", l, arrayList);
        }
        Long l2 = this.updated_at;
        if (l2 != null) {
            y30.A("updated_at=", l2, arrayList);
        }
        Long l3 = this.deleted_at;
        if (l3 != null) {
            y30.A("deleted_at=", l3, arrayList);
        }
        SequencePostLabelMode sequencePostLabelMode = this.post_label_mode;
        if (sequencePostLabelMode != null) {
            arrayList.add("post_label_mode=" + sequencePostLabelMode);
        }
        ImageMetadata imageMetadata = this.cover_image;
        if (imageMetadata != null) {
            arrayList.add("cover_image=" + imageMetadata);
        }
        ImageMetadata imageMetadata2 = this.tablet_image;
        if (imageMetadata2 != null) {
            arrayList.add("tablet_image=" + imageMetadata2);
        }
        ImageMetadata imageMetadata3 = this.thumbnail_image;
        if (imageMetadata3 != null) {
            arrayList.add("thumbnail_image=" + imageMetadata3);
        }
        Boolean bool = this.should_proxy_cover_image;
        if (bool != null) {
            lv8.A("should_proxy_cover_image=", bool, arrayList);
        }
        String str3 = this.eyebrow;
        if (str3 != null) {
            lv8.D(str3, "eyebrow=", arrayList);
        }
        String str4 = this.title;
        if (str4 != null) {
            lv8.D(str4, "title=", arrayList);
        }
        String str5 = this.subtitle;
        if (str5 != null) {
            lv8.D(str5, "subtitle=", arrayList);
        }
        String str6 = this.description;
        if (str6 != null) {
            lv8.D(str6, "description=", arrayList);
        }
        if (!this.about_text.isEmpty()) {
            b09.J("about_text=", this.about_text, arrayList);
        }
        String str7 = this.featured_user_title;
        if (str7 != null) {
            lv8.D(str7, "featured_user_title=", arrayList);
        }
        String str8 = this.featured_user_custom_bio;
        if (str8 != null) {
            lv8.D(str8, "featured_user_custom_bio=", arrayList);
        }
        String str9 = this.color;
        if (str9 != null) {
            lv8.D(str9, "color=", arrayList);
        }
        String str10 = this.bg_color;
        if (str10 != null) {
            lv8.D(str10, "bg_color=", arrayList);
        }
        SequenceColorPalette sequenceColorPalette = this.palette;
        if (sequenceColorPalette != null) {
            arrayList.add("palette=" + sequenceColorPalette);
        }
        SequenceVisibility sequenceVisibility = this.visibility;
        if (sequenceVisibility != null) {
            arrayList.add("visibility=" + sequenceVisibility);
        }
        Boolean bool2 = this.hide_index;
        if (bool2 != null) {
            lv8.A("hide_index=", bool2, arrayList);
        }
        Boolean bool3 = this.hide_author_in_previews;
        if (bool3 != null) {
            lv8.A("hide_author_in_previews=", bool3, arrayList);
        }
        String str11 = this.catalog_id;
        if (str11 != null) {
            lv8.D(str11, "catalog_id=", arrayList);
        }
        Boolean bool4 = this.is_finished;
        if (bool4 != null) {
            lv8.A("is_finished=", bool4, arrayList);
        }
        if (!this.post_ids.isEmpty()) {
            arrayList.add("post_ids=".concat(Internal.sanitize(this.post_ids)));
        }
        String str12 = this.featured_user_id;
        if (str12 != null) {
            lv8.D(str12, "featured_user_id=", arrayList);
        }
        User user = this.featured_user;
        if (user != null) {
            arrayList.add("featured_user=" + user);
        }
        return bu1.F0(arrayList, ", ", "Sequence{", "}", null, 56);
    }

    public Sequence() {
        this(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 536870911, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Sequence(String str, String str2, Long l, Long l2, Long l3, SequencePostLabelMode sequencePostLabelMode, ImageMetadata imageMetadata, ImageMetadata imageMetadata2, ImageMetadata imageMetadata3, Boolean bool, String str3, String str4, String str5, String str6, List<ParagraphPb> list, String str7, String str8, String str9, String str10, SequenceColorPalette sequenceColorPalette, SequenceVisibility sequenceVisibility, Boolean bool2, Boolean bool3, String str11, Boolean bool4, List<String> list2, String str12, User user, h21 h21Var) {
        super(ADAPTER, h21Var);
        list.getClass();
        list2.getClass();
        h21Var.getClass();
        this.sequence_id = str;
        this.slug = str2;
        this.created_at = l;
        this.updated_at = l2;
        this.deleted_at = l3;
        this.post_label_mode = sequencePostLabelMode;
        this.cover_image = imageMetadata;
        this.tablet_image = imageMetadata2;
        this.thumbnail_image = imageMetadata3;
        this.should_proxy_cover_image = bool;
        this.eyebrow = str3;
        this.title = str4;
        this.subtitle = str5;
        this.description = str6;
        this.featured_user_title = str7;
        this.featured_user_custom_bio = str8;
        this.color = str9;
        this.bg_color = str10;
        this.palette = sequenceColorPalette;
        this.visibility = sequenceVisibility;
        this.hide_index = bool2;
        this.hide_author_in_previews = bool3;
        this.catalog_id = str11;
        this.is_finished = bool4;
        this.featured_user_id = str12;
        this.featured_user = user;
        this.about_text = Internal.immutableCopyOf("about_text", list);
        this.post_ids = Internal.immutableCopyOf("post_ids", list2);
    }

    public static /* synthetic */ void getCatalog_id$annotations() {
    }

    public static /* synthetic */ void getCover_image$annotations() {
    }

    public static /* synthetic */ void getTablet_image$annotations() {
    }

    public static /* synthetic */ void getThumbnail_image$annotations() {
    }

    public static /* synthetic */ void is_finished$annotations() {
    }
}
