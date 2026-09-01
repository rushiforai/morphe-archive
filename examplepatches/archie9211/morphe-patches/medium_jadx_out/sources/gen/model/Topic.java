package gen.model;

import android.os.Parcelable;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
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
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import defpackage.wgd;
import defpackage.wod;
import defpackage.xod;
import defpackage.y30;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010 \n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0014\b\u0007\u0018\u0000 92\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002:Bõ\u0001\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0006\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r\u0012\u000e\b\u0002\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00030\u000f\u0012\u000e\b\u0002\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00000\u000f\u0012\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u0012\u0012\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u0017\u0012\n\b\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u0006\u0012\u000e\b\u0002\u0010\u001b\u001a\b\u0012\u0004\u0012\u00020\u001a0\u000f\u0012\n\b\u0002\u0010\u001c\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\u001e\u001a\u00020\u001d¢\u0006\u0004\b\u001f\u0010 J\u000f\u0010!\u001a\u00020\u0002H\u0016¢\u0006\u0004\b!\u0010\"J\u001a\u0010%\u001a\u00020\r2\b\u0010$\u001a\u0004\u0018\u00010#H\u0096\u0002¢\u0006\u0004\b%\u0010&J\u000f\u0010(\u001a\u00020'H\u0016¢\u0006\u0004\b(\u0010)J\u000f\u0010*\u001a\u00020\u0003H\u0016¢\u0006\u0004\b*\u0010+Jû\u0001\u0010,\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00062\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r2\u000e\b\u0002\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00030\u000f2\u000e\b\u0002\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00000\u000f2\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u00122\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u00172\n\b\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u00062\u000e\b\u0002\u0010\u001b\u001a\b\u0012\u0004\u0012\u00020\u001a0\u000f2\n\b\u0002\u0010\u001c\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u001e\u001a\u00020\u001d¢\u0006\u0004\b,\u0010-R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010.R\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010.R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010/R\u0016\u0010\b\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010/R\u0016\u0010\n\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u00100R\u0016\u0010\u000b\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010.R\u0016\u0010\f\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010.R\u0016\u0010\u000e\u001a\u0004\u0018\u00010\r8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000e\u00101R\u0016\u0010\u0013\u001a\u0004\u0018\u00010\u00128\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0013\u00102R\u0016\u0010\u0014\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0014\u0010.R\u0016\u0010\u0015\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0015\u0010.R\u001c\u0010\u0016\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0016\u0010.\u0012\u0004\b3\u00104R\u001c\u0010\u0018\u001a\u0004\u0018\u00010\u00178\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0018\u00105\u0012\u0004\b6\u00104R\u001c\u0010\u0019\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0019\u0010/\u0012\u0004\b7\u00104R\u0016\u0010\u001c\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001c\u0010.R\u001a\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00030\u000f8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0010\u00108R\u001a\u0010\u0011\u001a\b\u0012\u0004\u0012\u00020\u00000\u000f8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0011\u00108R\u001a\u0010\u001b\u001a\b\u0012\u0004\u0012\u00020\u001a0\u000f8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001b\u00108¨\u0006;"}, d2 = {"Lgen/model/Topic;", "Lcom/squareup/wire/AndroidMessage;", "Lwod;", "", "topic_id", "slug", "", "created_at", "deleted_at", "Lgen/model/ImageMetadata;", "image", "name", "description", "", "is_following", "", "related_topic_ids", "related_topics", "Lgen/model/TopicVisibility;", "visibility", "brief_catalog_id", "canonical_slug", "queue_catalog_id", "Lgen/model/TopicUpdateSchedule;", "brief_update_schedule", "last_scheduled_brief_update_at", "Lgen/model/Tag;", "related_tags", "seo_title", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Lgen/model/ImageMetadata;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/util/List;Ljava/util/List;Lgen/model/TopicVisibility;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgen/model/TopicUpdateSchedule;Ljava/lang/Long;Ljava/util/List;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lwod;", "", "other", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Lgen/model/ImageMetadata;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/util/List;Ljava/util/List;Lgen/model/TopicVisibility;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgen/model/TopicUpdateSchedule;Ljava/lang/Long;Ljava/util/List;Ljava/lang/String;Lh21;)Lgen/model/Topic;", "Ljava/lang/String;", "Ljava/lang/Long;", "Lgen/model/ImageMetadata;", "Ljava/lang/Boolean;", "Lgen/model/TopicVisibility;", "getQueue_catalog_id$annotations", "()V", "Lgen/model/TopicUpdateSchedule;", "getBrief_update_schedule$annotations", "getLast_scheduled_brief_update_at$annotations", "Ljava/util/List;", "Companion", "xod", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class Topic extends AndroidMessage<Topic, wod> {
    public static final ProtoAdapter<Topic> ADAPTER;
    public static final Parcelable.Creator<Topic> CREATOR;
    public static final xod Companion = new xod();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 11, tag = 9)
    public final String brief_catalog_id;

    @WireField(adapter = "gen.model.TopicUpdateSchedule#ADAPTER", schemaIndex = 14, tag = 11)
    public final TopicUpdateSchedule brief_update_schedule;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 12, tag = 16)
    public final String canonical_slug;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 2, tag = 3)
    public final Long created_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 3, tag = 4)
    public final Long deleted_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 6, tag = 7)
    public final String description;

    @WireField(adapter = "gen.model.ImageMetadata#ADAPTER", schemaIndex = 4, tag = 5)
    public final ImageMetadata image;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 7, tag = 8)
    public final Boolean is_following;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 15, tag = 12)
    public final Long last_scheduled_brief_update_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 5, tag = 6)
    public final String name;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 13, tag = 10)
    public final String queue_catalog_id;

    @WireField(adapter = "gen.model.Tag#ADAPTER", label = WireField.Label.REPEATED, schemaIndex = 16, tag = 15)
    public final List<Tag> related_tags;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", label = WireField.Label.REPEATED, schemaIndex = 8, tag = 17)
    public final List<String> related_topic_ids;

    @WireField(adapter = "gen.model.Topic#ADAPTER", label = WireField.Label.REPEATED, schemaIndex = 9, tag = 13)
    public final List<Topic> related_topics;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 17, tag = 18)
    public final String seo_title;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String slug;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String topic_id;

    @WireField(adapter = "gen.model.TopicVisibility#ADAPTER", schemaIndex = 10, tag = 14)
    public final TopicVisibility visibility;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(Topic.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<Topic> protoAdapter = new ProtoAdapter<Topic>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.Topic$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final Topic decode(ProtoReader reader) {
                ArrayList arrayList;
                String str;
                Long l;
                String strDecode;
                ArrayList arrayListF = b09.F(reader);
                ArrayList arrayList2 = new ArrayList();
                ArrayList arrayList3 = new ArrayList();
                long jBeginMessage = reader.beginMessage();
                String str2 = null;
                String strDecode2 = null;
                Long lDecode = null;
                Long lDecode2 = null;
                ImageMetadata imageMetadataDecode = null;
                String strDecode3 = null;
                String strDecode4 = null;
                Boolean boolDecode = null;
                TopicVisibility topicVisibilityDecode = null;
                String strDecode5 = null;
                String strDecode6 = null;
                String strDecode7 = null;
                TopicUpdateSchedule topicUpdateScheduleDecode = null;
                Long lDecode3 = null;
                String strDecode8 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new Topic(str2, strDecode2, lDecode, lDecode2, imageMetadataDecode, strDecode3, strDecode4, boolDecode, arrayListF, arrayList2, topicVisibilityDecode, strDecode5, strDecode6, strDecode7, topicUpdateScheduleDecode, lDecode3, arrayList3, strDecode8, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            arrayList = arrayList3;
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 2:
                            arrayList = arrayList3;
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 3:
                            arrayList = arrayList3;
                            lDecode = ProtoAdapter.INT64.decode(reader);
                            strDecode = str2;
                            break;
                        case 4:
                            arrayList = arrayList3;
                            lDecode2 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str2;
                            break;
                        case 5:
                            arrayList = arrayList3;
                            imageMetadataDecode = ImageMetadata.ADAPTER.decode(reader);
                            strDecode = str2;
                            break;
                        case 6:
                            arrayList = arrayList3;
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 7:
                            arrayList = arrayList3;
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 8:
                            arrayList = arrayList3;
                            boolDecode = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str2;
                            break;
                        case 9:
                            arrayList = arrayList3;
                            strDecode5 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 10:
                            arrayList = arrayList3;
                            strDecode7 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str2;
                            break;
                        case 11:
                            arrayList = arrayList3;
                            str = strDecode2;
                            l = lDecode;
                            try {
                                topicUpdateScheduleDecode = TopicUpdateSchedule.ADAPTER.decode(reader);
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
                        case 12:
                            arrayList = arrayList3;
                            lDecode3 = ProtoAdapter.INT64.decode(reader);
                            strDecode = str2;
                            break;
                        case 13:
                            arrayList = arrayList3;
                            str = strDecode2;
                            l = lDecode;
                            arrayList2.add(Topic.ADAPTER.decode(reader));
                            strDecode = str2;
                            strDecode2 = str;
                            lDecode = l;
                            break;
                        case 14:
                            try {
                                topicVisibilityDecode = TopicVisibility.ADAPTER.decode(reader);
                                arrayList = arrayList3;
                                strDecode = str2;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e2) {
                                arrayList = arrayList3;
                                str = strDecode2;
                                l = lDecode;
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e2.value));
                                strDecode = str2;
                                strDecode2 = str;
                                lDecode = l;
                            }
                            break;
                        case 15:
                            arrayList3.add(Tag.ADAPTER.decode(reader));
                            arrayList = arrayList3;
                            str = strDecode2;
                            l = lDecode;
                            strDecode = str2;
                            strDecode2 = str;
                            lDecode = l;
                            break;
                        case 16:
                            strDecode6 = ProtoAdapter.STRING.decode(reader);
                            arrayList = arrayList3;
                            strDecode = str2;
                            break;
                        case 17:
                            arrayListF.add(ProtoAdapter.STRING.decode(reader));
                            arrayList = arrayList3;
                            str = strDecode2;
                            l = lDecode;
                            strDecode = str2;
                            strDecode2 = str;
                            lDecode = l;
                            break;
                        case 18:
                            strDecode8 = ProtoAdapter.STRING.decode(reader);
                            arrayList = arrayList3;
                            strDecode = str2;
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            arrayList = arrayList3;
                            str = strDecode2;
                            l = lDecode;
                            strDecode = str2;
                            strDecode2 = str;
                            lDecode = l;
                            break;
                    }
                    str2 = strDecode;
                    arrayList3 = arrayList;
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, Topic value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.topic_id);
                protoAdapter2.encodeWithTag(writer, 2, value.slug);
                ProtoAdapter<Long> protoAdapter3 = ProtoAdapter.INT64;
                protoAdapter3.encodeWithTag(writer, 3, value.created_at);
                protoAdapter3.encodeWithTag(writer, 4, value.deleted_at);
                ImageMetadata.ADAPTER.encodeWithTag(writer, 5, value.image);
                protoAdapter2.encodeWithTag(writer, 6, value.name);
                protoAdapter2.encodeWithTag(writer, 7, value.description);
                ProtoAdapter.BOOL.encodeWithTag(writer, 8, value.is_following);
                protoAdapter2.asRepeated().encodeWithTag(writer, 17, value.related_topic_ids);
                Topic.ADAPTER.asRepeated().encodeWithTag(writer, 13, value.related_topics);
                TopicVisibility.ADAPTER.encodeWithTag(writer, 14, value.visibility);
                protoAdapter2.encodeWithTag(writer, 9, value.brief_catalog_id);
                protoAdapter2.encodeWithTag(writer, 16, value.canonical_slug);
                protoAdapter2.encodeWithTag(writer, 10, value.queue_catalog_id);
                TopicUpdateSchedule.ADAPTER.encodeWithTag(writer, 11, value.brief_update_schedule);
                protoAdapter3.encodeWithTag(writer, 12, value.last_scheduled_brief_update_at);
                Tag.ADAPTER.asRepeated().encodeWithTag(writer, 15, value.related_tags);
                protoAdapter2.encodeWithTag(writer, 18, value.seo_title);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(Topic value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag = protoAdapter2.encodedSizeWithTag(2, value.slug) + protoAdapter2.encodedSizeWithTag(1, value.topic_id) + iE;
                ProtoAdapter<Long> protoAdapter3 = ProtoAdapter.INT64;
                return protoAdapter2.encodedSizeWithTag(18, value.seo_title) + Tag.ADAPTER.asRepeated().encodedSizeWithTag(15, value.related_tags) + protoAdapter3.encodedSizeWithTag(12, value.last_scheduled_brief_update_at) + TopicUpdateSchedule.ADAPTER.encodedSizeWithTag(11, value.brief_update_schedule) + protoAdapter2.encodedSizeWithTag(10, value.queue_catalog_id) + protoAdapter2.encodedSizeWithTag(16, value.canonical_slug) + protoAdapter2.encodedSizeWithTag(9, value.brief_catalog_id) + TopicVisibility.ADAPTER.encodedSizeWithTag(14, value.visibility) + Topic.ADAPTER.asRepeated().encodedSizeWithTag(13, value.related_topics) + protoAdapter2.asRepeated().encodedSizeWithTag(17, value.related_topic_ids) + ProtoAdapter.BOOL.encodedSizeWithTag(8, value.is_following) + protoAdapter2.encodedSizeWithTag(7, value.description) + protoAdapter2.encodedSizeWithTag(6, value.name) + ImageMetadata.ADAPTER.encodedSizeWithTag(5, value.image) + protoAdapter3.encodedSizeWithTag(4, value.deleted_at) + protoAdapter3.encodedSizeWithTag(3, value.created_at) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final Topic redact(Topic value) {
                value.getClass();
                ImageMetadata imageMetadata = value.image;
                return value.copy((196079 & 1) != 0 ? value.topic_id : null, (196079 & 2) != 0 ? value.slug : null, (196079 & 4) != 0 ? value.created_at : null, (196079 & 8) != 0 ? value.deleted_at : null, (196079 & 16) != 0 ? value.image : imageMetadata != null ? ImageMetadata.ADAPTER.redact(imageMetadata) : null, (196079 & 32) != 0 ? value.name : null, (196079 & 64) != 0 ? value.description : null, (196079 & 128) != 0 ? value.is_following : null, (196079 & 256) != 0 ? value.related_topic_ids : null, (196079 & 512) != 0 ? value.related_topics : Internal.m97redactElements(value.related_topics, Topic.ADAPTER), (196079 & 1024) != 0 ? value.visibility : null, (196079 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? value.brief_catalog_id : null, (196079 & 4096) != 0 ? value.canonical_slug : null, (196079 & 8192) != 0 ? value.queue_catalog_id : null, (196079 & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? value.brief_update_schedule : null, (196079 & 32768) != 0 ? value.last_scheduled_brief_update_at : null, (196079 & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? value.related_tags : Internal.m97redactElements(value.related_tags, Tag.ADAPTER), (196079 & 131072) != 0 ? value.seo_title : null, (196079 & 262144) != 0 ? value.unknownFields() : h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, Topic value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 18, value.seo_title);
                Tag.ADAPTER.asRepeated().encodeWithTag(writer, 15, value.related_tags);
                ProtoAdapter<Long> protoAdapter3 = ProtoAdapter.INT64;
                protoAdapter3.encodeWithTag(writer, 12, value.last_scheduled_brief_update_at);
                TopicUpdateSchedule.ADAPTER.encodeWithTag(writer, 11, value.brief_update_schedule);
                protoAdapter2.encodeWithTag(writer, 10, value.queue_catalog_id);
                protoAdapter2.encodeWithTag(writer, 16, value.canonical_slug);
                protoAdapter2.encodeWithTag(writer, 9, value.brief_catalog_id);
                TopicVisibility.ADAPTER.encodeWithTag(writer, 14, value.visibility);
                Topic.ADAPTER.asRepeated().encodeWithTag(writer, 13, value.related_topics);
                protoAdapter2.asRepeated().encodeWithTag(writer, 17, value.related_topic_ids);
                ProtoAdapter.BOOL.encodeWithTag(writer, 8, value.is_following);
                protoAdapter2.encodeWithTag(writer, 7, value.description);
                protoAdapter2.encodeWithTag(writer, 6, value.name);
                ImageMetadata.ADAPTER.encodeWithTag(writer, 5, value.image);
                protoAdapter3.encodeWithTag(writer, 4, value.deleted_at);
                protoAdapter3.encodeWithTag(writer, 3, value.created_at);
                protoAdapter2.encodeWithTag(writer, 2, value.slug);
                protoAdapter2.encodeWithTag(writer, 1, value.topic_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ Topic(String str, String str2, Long l, Long l2, ImageMetadata imageMetadata, String str3, String str4, Boolean bool, List list, List list2, TopicVisibility topicVisibility, String str5, String str6, String str7, TopicUpdateSchedule topicUpdateSchedule, Long l3, List list3, String str8, h21 h21Var, int i, gy2 gy2Var) {
        String str9 = (i & 1) != 0 ? null : str;
        String str10 = (i & 2) != 0 ? null : str2;
        Long l4 = (i & 4) != 0 ? null : l;
        Long l5 = (i & 8) != 0 ? null : l2;
        ImageMetadata imageMetadata2 = (i & 16) != 0 ? null : imageMetadata;
        String str11 = (i & 32) != 0 ? null : str3;
        String str12 = (i & 64) != 0 ? null : str4;
        Boolean bool2 = (i & 128) != 0 ? null : bool;
        int i2 = i & 256;
        List list4 = ey3.a;
        this(str9, str10, l4, l5, imageMetadata2, str11, str12, bool2, i2 != 0 ? list4 : list, (i & 512) != 0 ? list4 : list2, (i & 1024) != 0 ? null : topicVisibility, (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : str5, (i & 4096) != 0 ? null : str6, (i & 8192) != 0 ? null : str7, (i & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? null : topicUpdateSchedule, (i & 32768) != 0 ? null : l3, (i & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) == 0 ? list3 : list4, (i & 131072) != 0 ? null : str8, (i & 262144) != 0 ? h21.d : h21Var);
    }

    public final Topic copy(String topic_id, String slug, Long created_at, Long deleted_at, ImageMetadata image, String name, String description, Boolean is_following, List<String> related_topic_ids, List<Topic> related_topics, TopicVisibility visibility, String brief_catalog_id, String canonical_slug, String queue_catalog_id, TopicUpdateSchedule brief_update_schedule, Long last_scheduled_brief_update_at, List<Tag> related_tags, String seo_title, h21 unknownFields) {
        related_topic_ids.getClass();
        related_topics.getClass();
        related_tags.getClass();
        unknownFields.getClass();
        return new Topic(topic_id, slug, created_at, deleted_at, image, name, description, is_following, related_topic_ids, related_topics, visibility, brief_catalog_id, canonical_slug, queue_catalog_id, brief_update_schedule, last_scheduled_brief_update_at, related_tags, seo_title, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof Topic)) {
            return false;
        }
        Topic topic = (Topic) other;
        return g76.L(unknownFields(), topic.unknownFields()) && g76.L(this.topic_id, topic.topic_id) && g76.L(this.slug, topic.slug) && g76.L(this.created_at, topic.created_at) && g76.L(this.deleted_at, topic.deleted_at) && g76.L(this.image, topic.image) && g76.L(this.name, topic.name) && g76.L(this.description, topic.description) && g76.L(this.is_following, topic.is_following) && g76.L(this.related_topic_ids, topic.related_topic_ids) && g76.L(this.related_topics, topic.related_topics) && this.visibility == topic.visibility && g76.L(this.brief_catalog_id, topic.brief_catalog_id) && g76.L(this.canonical_slug, topic.canonical_slug) && g76.L(this.queue_catalog_id, topic.queue_catalog_id) && this.brief_update_schedule == topic.brief_update_schedule && g76.L(this.last_scheduled_brief_update_at, topic.last_scheduled_brief_update_at) && g76.L(this.related_tags, topic.related_tags) && g76.L(this.seo_title, topic.seo_title);
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
        String str = this.topic_id;
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
        Long l2 = this.deleted_at;
        if (l2 != null) {
            long jLongValue2 = l2.longValue();
            i2 = (int) (jLongValue2 ^ (jLongValue2 >>> 32));
        } else {
            i2 = 0;
        }
        int i6 = (i5 + i2) * 37;
        ImageMetadata imageMetadata = this.image;
        int iHashCode4 = (i6 + (imageMetadata != null ? imageMetadata.hashCode() : 0)) * 37;
        String str3 = this.name;
        int iHashCode5 = (iHashCode4 + (str3 != null ? str3.hashCode() : 0)) * 37;
        String str4 = this.description;
        int iHashCode6 = (iHashCode5 + (str4 != null ? str4.hashCode() : 0)) * 37;
        Boolean bool = this.is_following;
        int iP = wgd.p(wgd.p((iHashCode6 + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37, 37, this.related_topic_ids), 37, this.related_topics);
        TopicVisibility topicVisibility = this.visibility;
        int iHashCode7 = (iP + (topicVisibility != null ? topicVisibility.hashCode() : 0)) * 37;
        String str5 = this.brief_catalog_id;
        int iHashCode8 = (iHashCode7 + (str5 != null ? str5.hashCode() : 0)) * 37;
        String str6 = this.canonical_slug;
        int iHashCode9 = (iHashCode8 + (str6 != null ? str6.hashCode() : 0)) * 37;
        String str7 = this.queue_catalog_id;
        int iHashCode10 = (iHashCode9 + (str7 != null ? str7.hashCode() : 0)) * 37;
        TopicUpdateSchedule topicUpdateSchedule = this.brief_update_schedule;
        int iHashCode11 = (iHashCode10 + (topicUpdateSchedule != null ? topicUpdateSchedule.hashCode() : 0)) * 37;
        Long l3 = this.last_scheduled_brief_update_at;
        if (l3 != null) {
            long jLongValue3 = l3.longValue();
            i3 = (int) (jLongValue3 ^ (jLongValue3 >>> 32));
        } else {
            i3 = 0;
        }
        int iP2 = wgd.p((iHashCode11 + i3) * 37, 37, this.related_tags);
        String str8 = this.seo_title;
        int iHashCode12 = iP2 + (str8 != null ? str8.hashCode() : 0);
        this.hashCode = iHashCode12;
        return iHashCode12;
    }

    @Override // com.squareup.wire.Message
    public final wod newBuilder() {
        wod wodVar = new wod();
        ey3 ey3Var = ey3.a;
        wodVar.i = ey3Var;
        wodVar.j = ey3Var;
        wodVar.q = ey3Var;
        wodVar.a = this.topic_id;
        wodVar.b = this.slug;
        wodVar.c = this.created_at;
        wodVar.d = this.deleted_at;
        wodVar.e = this.image;
        wodVar.f = this.name;
        wodVar.g = this.description;
        wodVar.h = this.is_following;
        wodVar.i = this.related_topic_ids;
        wodVar.j = this.related_topics;
        wodVar.k = this.visibility;
        wodVar.l = this.brief_catalog_id;
        wodVar.m = this.canonical_slug;
        wodVar.n = this.queue_catalog_id;
        wodVar.o = this.brief_update_schedule;
        wodVar.p = this.last_scheduled_brief_update_at;
        wodVar.q = this.related_tags;
        wodVar.r = this.seo_title;
        wodVar.addUnknownFields(unknownFields());
        return wodVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.topic_id;
        if (str != null) {
            lv8.D(str, "topic_id=", arrayList);
        }
        String str2 = this.slug;
        if (str2 != null) {
            lv8.D(str2, "slug=", arrayList);
        }
        Long l = this.created_at;
        if (l != null) {
            y30.A("created_at=", l, arrayList);
        }
        Long l2 = this.deleted_at;
        if (l2 != null) {
            y30.A("deleted_at=", l2, arrayList);
        }
        ImageMetadata imageMetadata = this.image;
        if (imageMetadata != null) {
            arrayList.add("image=" + imageMetadata);
        }
        String str3 = this.name;
        if (str3 != null) {
            lv8.D(str3, "name=", arrayList);
        }
        String str4 = this.description;
        if (str4 != null) {
            lv8.D(str4, "description=", arrayList);
        }
        Boolean bool = this.is_following;
        if (bool != null) {
            lv8.A("is_following=", bool, arrayList);
        }
        if (!this.related_topic_ids.isEmpty()) {
            arrayList.add("related_topic_ids=".concat(Internal.sanitize(this.related_topic_ids)));
        }
        if (!this.related_topics.isEmpty()) {
            b09.J("related_topics=", this.related_topics, arrayList);
        }
        TopicVisibility topicVisibility = this.visibility;
        if (topicVisibility != null) {
            arrayList.add("visibility=" + topicVisibility);
        }
        String str5 = this.brief_catalog_id;
        if (str5 != null) {
            lv8.D(str5, "brief_catalog_id=", arrayList);
        }
        String str6 = this.canonical_slug;
        if (str6 != null) {
            lv8.D(str6, "canonical_slug=", arrayList);
        }
        String str7 = this.queue_catalog_id;
        if (str7 != null) {
            lv8.D(str7, "queue_catalog_id=", arrayList);
        }
        TopicUpdateSchedule topicUpdateSchedule = this.brief_update_schedule;
        if (topicUpdateSchedule != null) {
            arrayList.add("brief_update_schedule=" + topicUpdateSchedule);
        }
        Long l3 = this.last_scheduled_brief_update_at;
        if (l3 != null) {
            y30.A("last_scheduled_brief_update_at=", l3, arrayList);
        }
        if (!this.related_tags.isEmpty()) {
            b09.J("related_tags=", this.related_tags, arrayList);
        }
        String str8 = this.seo_title;
        if (str8 != null) {
            lv8.D(str8, "seo_title=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "Topic{", "}", null, 56);
    }

    public Topic() {
        this(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 524287, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Topic(String str, String str2, Long l, Long l2, ImageMetadata imageMetadata, String str3, String str4, Boolean bool, List<String> list, List<Topic> list2, TopicVisibility topicVisibility, String str5, String str6, String str7, TopicUpdateSchedule topicUpdateSchedule, Long l3, List<Tag> list3, String str8, h21 h21Var) {
        super(ADAPTER, h21Var);
        list.getClass();
        list2.getClass();
        list3.getClass();
        h21Var.getClass();
        this.topic_id = str;
        this.slug = str2;
        this.created_at = l;
        this.deleted_at = l2;
        this.image = imageMetadata;
        this.name = str3;
        this.description = str4;
        this.is_following = bool;
        this.visibility = topicVisibility;
        this.brief_catalog_id = str5;
        this.canonical_slug = str6;
        this.queue_catalog_id = str7;
        this.brief_update_schedule = topicUpdateSchedule;
        this.last_scheduled_brief_update_at = l3;
        this.seo_title = str8;
        this.related_topic_ids = Internal.immutableCopyOf("related_topic_ids", list);
        this.related_topics = Internal.immutableCopyOf("related_topics", list2);
        this.related_tags = Internal.immutableCopyOf("related_tags", list3);
    }

    public static /* synthetic */ void getBrief_update_schedule$annotations() {
    }

    public static /* synthetic */ void getLast_scheduled_brief_update_at$annotations() {
    }

    public static /* synthetic */ void getQueue_catalog_id$annotations() {
    }
}
