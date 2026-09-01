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
import com.squareup.wire.internal.Internal;
import defpackage.b09;
import defpackage.bu1;
import defpackage.ey3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.ly8;
import defpackage.my8;
import defpackage.n1b;
import defpackage.wg6;
import defpackage.wgd;
import defpackage.y30;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\b\n\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000f\u0018\u0000 +2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002,BÉ\u0001\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0005\u0012\u000e\b\u0002\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\t\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u0014\u0012\b\b\u0002\u0010\u0017\u001a\u00020\u0016¢\u0006\u0004\b\u0018\u0010\u0019J\u000f\u0010\u001a\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u001a\u0010\u001f\u001a\u00020\u001e2\b\u0010\u001d\u001a\u0004\u0018\u00010\u001cH\u0096\u0002¢\u0006\u0004\b\u001f\u0010 J\u000f\u0010!\u001a\u00020\u0003H\u0016¢\u0006\u0004\b!\u0010\"J\u000f\u0010#\u001a\u00020\u0005H\u0016¢\u0006\u0004\b#\u0010$JÏ\u0001\u0010%\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00052\u000e\b\u0002\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\t2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u00142\b\b\u0002\u0010\u0017\u001a\u00020\u0016¢\u0006\u0004\b%\u0010&R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010'R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010(R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010(R\u0016\u0010\b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010(R\u0016\u0010\u000b\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010'R\u0016\u0010\f\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010'R\u0016\u0010\r\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\r\u0010(R\u0016\u0010\u000e\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010(R\u0016\u0010\u000f\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010(R\u0016\u0010\u0010\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0010\u0010(R\u0016\u0010\u0011\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0011\u0010(R\u0016\u0010\u0012\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0012\u0010(R\u0016\u0010\u0013\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0013\u0010'R\u0016\u0010\u0015\u001a\u0004\u0018\u00010\u00148\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0015\u0010)R\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00050\t8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010*¨\u0006-"}, d2 = {"Lgen/model/PageParams;", "Lcom/squareup/wire/AndroidMessage;", "Lly8;", "", "limit", "", "from", "to", "source", "", "ignored_ids", "page", "page_size", "filter", "order", "sort_by", "collection_id", "user_id", "bucket_type", "index_offset", "", "since", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Long;Lh21;)V", "newBuilder", "()Lly8;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Long;Lh21;)Lgen/model/PageParams;", "Ljava/lang/Integer;", "Ljava/lang/String;", "Ljava/lang/Long;", "Ljava/util/List;", "Companion", "my8", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PageParams extends AndroidMessage<PageParams, ly8> {
    public static final ProtoAdapter<PageParams> ADAPTER;
    public static final Parcelable.Creator<PageParams> CREATOR;
    public static final my8 Companion = new my8();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 12, tag = 11)
    public final String bucket_type;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 10, tag = 10)
    public final String collection_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 7, tag = 8)
    public final String filter;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String from;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", label = WireField.Label.REPEATED, schemaIndex = 4, tag = 5)
    public final List<String> ignored_ids;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 13, tag = 14)
    public final Integer index_offset;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 0, tag = 1)
    public final Integer limit;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 8, tag = 9)
    public final String order;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 5, tag = 6)
    public final Integer page;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 6, tag = 7)
    public final Integer page_size;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 14, tag = 15)
    public final Long since;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 9, tag = 12)
    public final String sort_by;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String source;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String to;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 11, tag = 13)
    public final String user_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(PageParams.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<PageParams> protoAdapter = new ProtoAdapter<PageParams>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.PageParams$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            /* JADX WARN: Failed to find 'out' block for switch in B:5:0x0026. Please report as an issue. */
            @Override // com.squareup.wire.ProtoAdapter
            public final PageParams decode(ProtoReader reader) {
                Integer numDecode;
                ArrayList arrayListF = b09.F(reader);
                long jBeginMessage = reader.beginMessage();
                Integer num = null;
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                Integer numDecode2 = null;
                Integer numDecode3 = null;
                String strDecode4 = null;
                String strDecode5 = null;
                String strDecode6 = null;
                String strDecode7 = null;
                String strDecode8 = null;
                String strDecode9 = null;
                Integer numDecode4 = null;
                Long lDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    String str = strDecode;
                    if (iNextTag == -1) {
                        return new PageParams(num, str, strDecode2, strDecode3, arrayListF, numDecode2, numDecode3, strDecode4, strDecode5, strDecode6, strDecode7, strDecode8, strDecode9, numDecode4, lDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            numDecode = ProtoAdapter.INT32.decode(reader);
                            strDecode = str;
                            break;
                        case 2:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            numDecode = num;
                            break;
                        case 3:
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            numDecode = num;
                            break;
                        case 4:
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            numDecode = num;
                            break;
                        case 5:
                            arrayListF.add(ProtoAdapter.STRING.decode(reader));
                            numDecode = num;
                            strDecode = str;
                            break;
                        case 6:
                            numDecode2 = ProtoAdapter.INT32.decode(reader);
                            strDecode = str;
                            numDecode = num;
                            break;
                        case 7:
                            numDecode3 = ProtoAdapter.INT32.decode(reader);
                            strDecode = str;
                            numDecode = num;
                            break;
                        case 8:
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            numDecode = num;
                            break;
                        case 9:
                            strDecode5 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            numDecode = num;
                            break;
                        case 10:
                            strDecode7 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            numDecode = num;
                            break;
                        case 11:
                            strDecode9 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            numDecode = num;
                            break;
                        case 12:
                            strDecode6 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            numDecode = num;
                            break;
                        case 13:
                            strDecode8 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str;
                            numDecode = num;
                            break;
                        case 14:
                            numDecode4 = ProtoAdapter.INT32.decode(reader);
                            strDecode = str;
                            numDecode = num;
                            break;
                        case 15:
                            lDecode = ProtoAdapter.INT64.decode(reader);
                            strDecode = str;
                            numDecode = num;
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            numDecode = num;
                            strDecode = str;
                            break;
                    }
                    num = numDecode;
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, PageParams value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<Integer> protoAdapter2 = ProtoAdapter.INT32;
                protoAdapter2.encodeWithTag(writer, 1, value.limit);
                ProtoAdapter<String> protoAdapter3 = ProtoAdapter.STRING;
                protoAdapter3.encodeWithTag(writer, 2, value.from);
                protoAdapter3.encodeWithTag(writer, 3, value.to);
                protoAdapter3.encodeWithTag(writer, 4, value.source);
                protoAdapter3.asRepeated().encodeWithTag(writer, 5, value.ignored_ids);
                protoAdapter2.encodeWithTag(writer, 6, value.page);
                protoAdapter2.encodeWithTag(writer, 7, value.page_size);
                protoAdapter3.encodeWithTag(writer, 8, value.filter);
                protoAdapter3.encodeWithTag(writer, 9, value.order);
                protoAdapter3.encodeWithTag(writer, 12, value.sort_by);
                protoAdapter3.encodeWithTag(writer, 10, value.collection_id);
                protoAdapter3.encodeWithTag(writer, 13, value.user_id);
                protoAdapter3.encodeWithTag(writer, 11, value.bucket_type);
                protoAdapter2.encodeWithTag(writer, 14, value.index_offset);
                ProtoAdapter.INT64.encodeWithTag(writer, 15, value.since);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(PageParams value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<Integer> protoAdapter2 = ProtoAdapter.INT32;
                int iEncodedSizeWithTag = protoAdapter2.encodedSizeWithTag(1, value.limit) + iE;
                ProtoAdapter<String> protoAdapter3 = ProtoAdapter.STRING;
                return ProtoAdapter.INT64.encodedSizeWithTag(15, value.since) + protoAdapter2.encodedSizeWithTag(14, value.index_offset) + protoAdapter3.encodedSizeWithTag(11, value.bucket_type) + protoAdapter3.encodedSizeWithTag(13, value.user_id) + protoAdapter3.encodedSizeWithTag(10, value.collection_id) + protoAdapter3.encodedSizeWithTag(12, value.sort_by) + protoAdapter3.encodedSizeWithTag(9, value.order) + protoAdapter3.encodedSizeWithTag(8, value.filter) + protoAdapter2.encodedSizeWithTag(7, value.page_size) + protoAdapter2.encodedSizeWithTag(6, value.page) + protoAdapter3.asRepeated().encodedSizeWithTag(5, value.ignored_ids) + protoAdapter3.encodedSizeWithTag(4, value.source) + protoAdapter3.encodedSizeWithTag(3, value.to) + protoAdapter3.encodedSizeWithTag(2, value.from) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final PageParams redact(PageParams value) {
                value.getClass();
                return value.copy((32767 & 1) != 0 ? value.limit : null, (32767 & 2) != 0 ? value.from : null, (32767 & 4) != 0 ? value.to : null, (32767 & 8) != 0 ? value.source : null, (32767 & 16) != 0 ? value.ignored_ids : null, (32767 & 32) != 0 ? value.page : null, (32767 & 64) != 0 ? value.page_size : null, (32767 & 128) != 0 ? value.filter : null, (32767 & 256) != 0 ? value.order : null, (32767 & 512) != 0 ? value.sort_by : null, (32767 & 1024) != 0 ? value.collection_id : null, (32767 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? value.user_id : null, (32767 & 4096) != 0 ? value.bucket_type : null, (32767 & 8192) != 0 ? value.index_offset : null, (32767 & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? value.since : null, (32767 & 32768) != 0 ? value.unknownFields() : h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, PageParams value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter.INT64.encodeWithTag(writer, 15, value.since);
                ProtoAdapter<Integer> protoAdapter2 = ProtoAdapter.INT32;
                protoAdapter2.encodeWithTag(writer, 14, value.index_offset);
                ProtoAdapter<String> protoAdapter3 = ProtoAdapter.STRING;
                protoAdapter3.encodeWithTag(writer, 11, value.bucket_type);
                protoAdapter3.encodeWithTag(writer, 13, value.user_id);
                protoAdapter3.encodeWithTag(writer, 10, value.collection_id);
                protoAdapter3.encodeWithTag(writer, 12, value.sort_by);
                protoAdapter3.encodeWithTag(writer, 9, value.order);
                protoAdapter3.encodeWithTag(writer, 8, value.filter);
                protoAdapter2.encodeWithTag(writer, 7, value.page_size);
                protoAdapter2.encodeWithTag(writer, 6, value.page);
                protoAdapter3.asRepeated().encodeWithTag(writer, 5, value.ignored_ids);
                protoAdapter3.encodeWithTag(writer, 4, value.source);
                protoAdapter3.encodeWithTag(writer, 3, value.to);
                protoAdapter3.encodeWithTag(writer, 2, value.from);
                protoAdapter2.encodeWithTag(writer, 1, value.limit);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ PageParams(Integer num, String str, String str2, String str3, List list, Integer num2, Integer num3, String str4, String str5, String str6, String str7, String str8, String str9, Integer num4, Long l, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : num, (i & 2) != 0 ? null : str, (i & 4) != 0 ? null : str2, (i & 8) != 0 ? null : str3, (i & 16) != 0 ? ey3.a : list, (i & 32) != 0 ? null : num2, (i & 64) != 0 ? null : num3, (i & 128) != 0 ? null : str4, (i & 256) != 0 ? null : str5, (i & 512) != 0 ? null : str6, (i & 1024) != 0 ? null : str7, (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : str8, (i & 4096) != 0 ? null : str9, (i & 8192) != 0 ? null : num4, (i & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? null : l, (i & 32768) != 0 ? h21.d : h21Var);
    }

    public final PageParams copy(Integer limit, String from, String to, String source, List<String> ignored_ids, Integer page, Integer page_size, String filter, String order, String sort_by, String collection_id, String user_id, String bucket_type, Integer index_offset, Long since, h21 unknownFields) {
        ignored_ids.getClass();
        unknownFields.getClass();
        return new PageParams(limit, from, to, source, ignored_ids, page, page_size, filter, order, sort_by, collection_id, user_id, bucket_type, index_offset, since, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof PageParams)) {
            return false;
        }
        PageParams pageParams = (PageParams) other;
        return g76.L(unknownFields(), pageParams.unknownFields()) && g76.L(this.limit, pageParams.limit) && g76.L(this.from, pageParams.from) && g76.L(this.to, pageParams.to) && g76.L(this.source, pageParams.source) && g76.L(this.ignored_ids, pageParams.ignored_ids) && g76.L(this.page, pageParams.page) && g76.L(this.page_size, pageParams.page_size) && g76.L(this.filter, pageParams.filter) && g76.L(this.order, pageParams.order) && g76.L(this.sort_by, pageParams.sort_by) && g76.L(this.collection_id, pageParams.collection_id) && g76.L(this.user_id, pageParams.user_id) && g76.L(this.bucket_type, pageParams.bucket_type) && g76.L(this.index_offset, pageParams.index_offset) && g76.L(this.since, pageParams.since);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        Integer num = this.limit;
        int i2 = 0;
        int iIntValue = (iHashCode + (num != null ? num.intValue() : 0)) * 37;
        String str = this.from;
        int iHashCode2 = (iIntValue + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.to;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.source;
        int iP = wgd.p((iHashCode3 + (str3 != null ? str3.hashCode() : 0)) * 37, 37, this.ignored_ids);
        Integer num2 = this.page;
        int iIntValue2 = (iP + (num2 != null ? num2.intValue() : 0)) * 37;
        Integer num3 = this.page_size;
        int iIntValue3 = (iIntValue2 + (num3 != null ? num3.intValue() : 0)) * 37;
        String str4 = this.filter;
        int iHashCode4 = (iIntValue3 + (str4 != null ? str4.hashCode() : 0)) * 37;
        String str5 = this.order;
        int iHashCode5 = (iHashCode4 + (str5 != null ? str5.hashCode() : 0)) * 37;
        String str6 = this.sort_by;
        int iHashCode6 = (iHashCode5 + (str6 != null ? str6.hashCode() : 0)) * 37;
        String str7 = this.collection_id;
        int iHashCode7 = (iHashCode6 + (str7 != null ? str7.hashCode() : 0)) * 37;
        String str8 = this.user_id;
        int iHashCode8 = (iHashCode7 + (str8 != null ? str8.hashCode() : 0)) * 37;
        String str9 = this.bucket_type;
        int iHashCode9 = (iHashCode8 + (str9 != null ? str9.hashCode() : 0)) * 37;
        Integer num4 = this.index_offset;
        int iIntValue4 = (iHashCode9 + (num4 != null ? num4.intValue() : 0)) * 37;
        Long l = this.since;
        if (l != null) {
            long jLongValue = l.longValue();
            i2 = (int) (jLongValue ^ (jLongValue >>> 32));
        }
        int i3 = iIntValue4 + i2;
        this.hashCode = i3;
        return i3;
    }

    @Override // com.squareup.wire.Message
    public final ly8 newBuilder() {
        ly8 ly8Var = new ly8();
        ly8Var.e = ey3.a;
        ly8Var.a = this.limit;
        ly8Var.b = this.from;
        ly8Var.c = this.to;
        ly8Var.d = this.source;
        ly8Var.e = this.ignored_ids;
        ly8Var.f = this.page;
        ly8Var.g = this.page_size;
        ly8Var.h = this.filter;
        ly8Var.i = this.order;
        ly8Var.j = this.sort_by;
        ly8Var.k = this.collection_id;
        ly8Var.l = this.user_id;
        ly8Var.m = this.bucket_type;
        ly8Var.n = this.index_offset;
        ly8Var.o = this.since;
        ly8Var.addUnknownFields(unknownFields());
        return ly8Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        Integer num = this.limit;
        if (num != null) {
            lv8.B("limit=", num, arrayList);
        }
        String str = this.from;
        if (str != null) {
            lv8.D(str, "from=", arrayList);
        }
        String str2 = this.to;
        if (str2 != null) {
            lv8.D(str2, "to=", arrayList);
        }
        String str3 = this.source;
        if (str3 != null) {
            lv8.D(str3, "source=", arrayList);
        }
        if (!this.ignored_ids.isEmpty()) {
            arrayList.add("ignored_ids=".concat(Internal.sanitize(this.ignored_ids)));
        }
        Integer num2 = this.page;
        if (num2 != null) {
            lv8.B("page=", num2, arrayList);
        }
        Integer num3 = this.page_size;
        if (num3 != null) {
            lv8.B("page_size=", num3, arrayList);
        }
        String str4 = this.filter;
        if (str4 != null) {
            lv8.D(str4, "filter=", arrayList);
        }
        String str5 = this.order;
        if (str5 != null) {
            lv8.D(str5, "order=", arrayList);
        }
        String str6 = this.sort_by;
        if (str6 != null) {
            lv8.D(str6, "sort_by=", arrayList);
        }
        String str7 = this.collection_id;
        if (str7 != null) {
            lv8.D(str7, "collection_id=", arrayList);
        }
        String str8 = this.user_id;
        if (str8 != null) {
            lv8.D(str8, "user_id=", arrayList);
        }
        String str9 = this.bucket_type;
        if (str9 != null) {
            lv8.D(str9, "bucket_type=", arrayList);
        }
        Integer num4 = this.index_offset;
        if (num4 != null) {
            lv8.B("index_offset=", num4, arrayList);
        }
        Long l = this.since;
        if (l != null) {
            y30.A("since=", l, arrayList);
        }
        return bu1.F0(arrayList, ", ", "PageParams{", "}", null, 56);
    }

    public PageParams() {
        this(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 65535, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PageParams(Integer num, String str, String str2, String str3, List<String> list, Integer num2, Integer num3, String str4, String str5, String str6, String str7, String str8, String str9, Integer num4, Long l, h21 h21Var) {
        super(ADAPTER, h21Var);
        list.getClass();
        h21Var.getClass();
        this.limit = num;
        this.from = str;
        this.to = str2;
        this.source = str3;
        this.page = num2;
        this.page_size = num3;
        this.filter = str4;
        this.order = str5;
        this.sort_by = str6;
        this.collection_id = str7;
        this.user_id = str8;
        this.bucket_type = str9;
        this.index_offset = num4;
        this.since = l;
        this.ignored_ids = Internal.immutableCopyOf("ignored_ids", list);
    }
}
