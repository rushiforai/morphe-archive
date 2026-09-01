package gen.model;

import android.os.Parcelable;
import com.drew.lang.RandomAccessStreamReader;
import com.medium.proto.model.ParagraphPb;
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
import defpackage.era;
import defpackage.ey3;
import defpackage.fra;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import defpackage.wgd;
import defpackage.y30;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000Z\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0013\b\u0007\u0018\u0000 12\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u00022B©\u0001\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\u000e\b\u0002\u0010\t\u001a\b\u0012\u0004\u0012\u00020\b0\u0007\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\n\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\r\u0012\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0010\u0012\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u0012\u0012\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\n\u0012\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u0015\u0012\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\b\u0012\b\b\u0002\u0010\u0019\u001a\u00020\u0018¢\u0006\u0004\b\u001a\u0010\u001bJ\u000f\u0010\u001c\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u001c\u0010\u001dJ\u001a\u0010!\u001a\u00020 2\b\u0010\u001f\u001a\u0004\u0018\u00010\u001eH\u0096\u0002¢\u0006\u0004\b!\u0010\"J\u000f\u0010#\u001a\u00020\nH\u0016¢\u0006\u0004\b#\u0010$J\u000f\u0010%\u001a\u00020\u0003H\u0016¢\u0006\u0004\b%\u0010&J³\u0001\u0010'\u001a\u00020\u00002\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\u000e\b\u0002\u0010\t\u001a\b\u0012\u0004\u0012\u00020\b0\u00072\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\n2\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\r2\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u00102\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u00122\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\n2\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u00152\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\b2\b\b\u0002\u0010\u0019\u001a\u00020\u0018¢\u0006\u0004\b'\u0010(R\u0014\u0010\u0004\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010)R\u0014\u0010\u0005\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010)R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010)R\u0016\u0010\u000b\u001a\u0004\u0018\u00010\n8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010*R\u0016\u0010\f\u001a\u0004\u0018\u00010\n8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010*R\u0016\u0010\u000e\u001a\u0004\u0018\u00010\r8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010+R\u0016\u0010\u000f\u001a\u0004\u0018\u00010\r8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010+R\u0016\u0010\u0011\u001a\u0004\u0018\u00010\u00108\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0011\u0010,R\u0016\u0010\u0013\u001a\u0004\u0018\u00010\u00128\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0013\u0010-R\u0016\u0010\u0014\u001a\u0004\u0018\u00010\n8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0014\u0010*R\u0016\u0010\u0016\u001a\u0004\u0018\u00010\u00158\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0016\u0010.R\u0016\u0010\u0017\u001a\u0004\u0018\u00010\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0017\u0010/R\u001a\u0010\t\u001a\b\u0012\u0004\u0012\u00020\b0\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u00100¨\u00063"}, d2 = {"Lgen/model/Quote;", "Lcom/squareup/wire/AndroidMessage;", "Lera;", "", "quote_id", "post_id", "user_id", "", "Lcom/medium/proto/model/ParagraphPb;", "paragraphs", "", "start_offset", "end_offset", "", "created_at", "removed_at", "Lgen/model/User;", "user", "Lgen/model/Post;", "post", "count", "Lgen/model/QuoteType;", "quote_type", "quote_paragraph_preview", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/Long;Lgen/model/User;Lgen/model/Post;Ljava/lang/Integer;Lgen/model/QuoteType;Lcom/medium/proto/model/ParagraphPb;Lh21;)V", "newBuilder", "()Lera;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/Long;Lgen/model/User;Lgen/model/Post;Ljava/lang/Integer;Lgen/model/QuoteType;Lcom/medium/proto/model/ParagraphPb;Lh21;)Lgen/model/Quote;", "Ljava/lang/String;", "Ljava/lang/Integer;", "Ljava/lang/Long;", "Lgen/model/User;", "Lgen/model/Post;", "Lgen/model/QuoteType;", "Lcom/medium/proto/model/ParagraphPb;", "Ljava/util/List;", "Companion", "fra", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class Quote extends AndroidMessage<Quote, era> {
    public static final ProtoAdapter<Quote> ADAPTER;
    public static final Parcelable.Creator<Quote> CREATOR;
    public static final fra Companion = new fra();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 10, tag = 11)
    public final Integer count;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 6, tag = 7)
    public final Long created_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 5, tag = 6)
    public final Integer end_offset;

    @WireField(adapter = "com.medium.proto.model.ParagraphPb#ADAPTER", label = WireField.Label.REPEATED, schemaIndex = 3, tag = 4)
    public final List<ParagraphPb> paragraphs;

    @WireField(adapter = "gen.model.Post#ADAPTER", schemaIndex = 9, tag = 10)
    public final Post post;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", label = WireField.Label.REQUIRED, schemaIndex = 1, tag = 2)
    public final String post_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", label = WireField.Label.REQUIRED, schemaIndex = 0, tag = 1)
    public final String quote_id;

    @WireField(adapter = "com.medium.proto.model.ParagraphPb#ADAPTER", schemaIndex = 12, tag = 13)
    public final ParagraphPb quote_paragraph_preview;

    @WireField(adapter = "gen.model.QuoteType#ADAPTER", schemaIndex = 11, tag = 12)
    public final QuoteType quote_type;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT64", schemaIndex = 7, tag = 8)
    public final Long removed_at;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 4, tag = 5)
    public final Integer start_offset;

    @WireField(adapter = "gen.model.User#ADAPTER", schemaIndex = 8, tag = 9)
    public final User user;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String user_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(Quote.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<Quote> protoAdapter = new ProtoAdapter<Quote>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.Quote$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final Quote decode(ProtoReader reader) {
                String str;
                String str2;
                String str3;
                ArrayList arrayListF = b09.F(reader);
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                Integer numDecode = null;
                Integer numDecode2 = null;
                Long lDecode = null;
                Long lDecode2 = null;
                User userDecode = null;
                Post postDecode = null;
                Integer numDecode3 = null;
                QuoteType quoteTypeDecode = null;
                ParagraphPb paragraphPbDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        String str4 = strDecode;
                        String str5 = strDecode2;
                        String str6 = strDecode3;
                        h21 h21VarEndMessageAndGetUnknownFields = reader.endMessageAndGetUnknownFields(jBeginMessage);
                        Post post = postDecode;
                        String str7 = str4;
                        if (str7 == null) {
                            Internal.missingRequiredFields(str4, "quote_id");
                            throw null;
                        }
                        String str8 = str5;
                        if (str8 != null) {
                            return new Quote(str7, str8, str6, arrayListF, numDecode, numDecode2, lDecode, lDecode2, userDecode, post, numDecode3, quoteTypeDecode, paragraphPbDecode, h21VarEndMessageAndGetUnknownFields);
                        }
                        Internal.missingRequiredFields(str5, "post_id");
                        throw null;
                    }
                    switch (iNextTag) {
                        case 1:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            continue;
                        case 2:
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            continue;
                        case 3:
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
                            continue;
                        case 4:
                            str = strDecode;
                            str2 = strDecode2;
                            str3 = strDecode3;
                            arrayListF.add(ParagraphPb.ADAPTER.decode(reader));
                            break;
                        case 5:
                            numDecode = ProtoAdapter.INT32.decode(reader);
                            continue;
                        case 6:
                            numDecode2 = ProtoAdapter.INT32.decode(reader);
                            continue;
                        case 7:
                            lDecode = ProtoAdapter.INT64.decode(reader);
                            continue;
                        case 8:
                            lDecode2 = ProtoAdapter.INT64.decode(reader);
                            continue;
                        case 9:
                            userDecode = User.ADAPTER.decode(reader);
                            continue;
                        case 10:
                            postDecode = Post.ADAPTER.decode(reader);
                            continue;
                        case 11:
                            numDecode3 = ProtoAdapter.INT32.decode(reader);
                            continue;
                        case 12:
                            try {
                                quoteTypeDecode = QuoteType.ADAPTER.decode(reader);
                                continue;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                                str = strDecode;
                                str2 = strDecode2;
                                str3 = strDecode3;
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                                strDecode = str;
                                strDecode2 = str2;
                                strDecode3 = str3;
                            }
                            break;
                        case 13:
                            paragraphPbDecode = ParagraphPb.ADAPTER.decode(reader);
                            continue;
                        default:
                            reader.readUnknownField(iNextTag);
                            str = strDecode;
                            str2 = strDecode2;
                            str3 = strDecode3;
                            break;
                    }
                    strDecode = str;
                    strDecode2 = str2;
                    strDecode3 = str3;
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, Quote value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.quote_id);
                protoAdapter2.encodeWithTag(writer, 2, value.post_id);
                protoAdapter2.encodeWithTag(writer, 3, value.user_id);
                ProtoAdapter<ParagraphPb> protoAdapter3 = ParagraphPb.ADAPTER;
                protoAdapter3.asRepeated().encodeWithTag(writer, 4, value.paragraphs);
                ProtoAdapter<Integer> protoAdapter4 = ProtoAdapter.INT32;
                protoAdapter4.encodeWithTag(writer, 5, value.start_offset);
                protoAdapter4.encodeWithTag(writer, 6, value.end_offset);
                ProtoAdapter<Long> protoAdapter5 = ProtoAdapter.INT64;
                protoAdapter5.encodeWithTag(writer, 7, value.created_at);
                protoAdapter5.encodeWithTag(writer, 8, value.removed_at);
                User.ADAPTER.encodeWithTag(writer, 9, value.user);
                Post.ADAPTER.encodeWithTag(writer, 10, value.post);
                protoAdapter4.encodeWithTag(writer, 11, value.count);
                QuoteType.ADAPTER.encodeWithTag(writer, 12, value.quote_type);
                protoAdapter3.encodeWithTag(writer, 13, value.quote_paragraph_preview);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(Quote value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag = protoAdapter2.encodedSizeWithTag(3, value.user_id) + protoAdapter2.encodedSizeWithTag(2, value.post_id) + protoAdapter2.encodedSizeWithTag(1, value.quote_id) + iE;
                ProtoAdapter<ParagraphPb> protoAdapter3 = ParagraphPb.ADAPTER;
                int iEncodedSizeWithTag2 = protoAdapter3.asRepeated().encodedSizeWithTag(4, value.paragraphs) + iEncodedSizeWithTag;
                ProtoAdapter<Integer> protoAdapter4 = ProtoAdapter.INT32;
                int iEncodedSizeWithTag3 = protoAdapter4.encodedSizeWithTag(6, value.end_offset) + protoAdapter4.encodedSizeWithTag(5, value.start_offset) + iEncodedSizeWithTag2;
                ProtoAdapter<Long> protoAdapter5 = ProtoAdapter.INT64;
                return protoAdapter3.encodedSizeWithTag(13, value.quote_paragraph_preview) + QuoteType.ADAPTER.encodedSizeWithTag(12, value.quote_type) + protoAdapter4.encodedSizeWithTag(11, value.count) + Post.ADAPTER.encodedSizeWithTag(10, value.post) + User.ADAPTER.encodedSizeWithTag(9, value.user) + protoAdapter5.encodedSizeWithTag(8, value.removed_at) + protoAdapter5.encodedSizeWithTag(7, value.created_at) + iEncodedSizeWithTag3;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final Quote redact(Quote value) {
                value.getClass();
                List<ParagraphPb> list = value.paragraphs;
                ProtoAdapter<ParagraphPb> protoAdapter2 = ParagraphPb.ADAPTER;
                List listM97redactElements = Internal.m97redactElements(list, protoAdapter2);
                User user = value.user;
                User userRedact = user != null ? User.ADAPTER.redact(user) : null;
                Post post = value.post;
                Post postRedact = post != null ? Post.ADAPTER.redact(post) : null;
                ParagraphPb paragraphPb = value.quote_paragraph_preview;
                return value.copy((3319 & 1) != 0 ? value.quote_id : null, (3319 & 2) != 0 ? value.post_id : null, (3319 & 4) != 0 ? value.user_id : null, (3319 & 8) != 0 ? value.paragraphs : listM97redactElements, (3319 & 16) != 0 ? value.start_offset : null, (3319 & 32) != 0 ? value.end_offset : null, (3319 & 64) != 0 ? value.created_at : null, (3319 & 128) != 0 ? value.removed_at : null, (3319 & 256) != 0 ? value.user : userRedact, (3319 & 512) != 0 ? value.post : postRedact, (3319 & 1024) != 0 ? value.count : null, (3319 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? value.quote_type : null, (3319 & 4096) != 0 ? value.quote_paragraph_preview : paragraphPb != null ? protoAdapter2.redact(paragraphPb) : null, (3319 & 8192) != 0 ? value.unknownFields() : h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, Quote value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<ParagraphPb> protoAdapter2 = ParagraphPb.ADAPTER;
                protoAdapter2.encodeWithTag(writer, 13, value.quote_paragraph_preview);
                QuoteType.ADAPTER.encodeWithTag(writer, 12, value.quote_type);
                ProtoAdapter<Integer> protoAdapter3 = ProtoAdapter.INT32;
                protoAdapter3.encodeWithTag(writer, 11, value.count);
                Post.ADAPTER.encodeWithTag(writer, 10, value.post);
                User.ADAPTER.encodeWithTag(writer, 9, value.user);
                ProtoAdapter<Long> protoAdapter4 = ProtoAdapter.INT64;
                protoAdapter4.encodeWithTag(writer, 8, value.removed_at);
                protoAdapter4.encodeWithTag(writer, 7, value.created_at);
                protoAdapter3.encodeWithTag(writer, 6, value.end_offset);
                protoAdapter3.encodeWithTag(writer, 5, value.start_offset);
                protoAdapter2.asRepeated().encodeWithTag(writer, 4, value.paragraphs);
                ProtoAdapter<String> protoAdapter5 = ProtoAdapter.STRING;
                protoAdapter5.encodeWithTag(writer, 3, value.user_id);
                protoAdapter5.encodeWithTag(writer, 2, value.post_id);
                protoAdapter5.encodeWithTag(writer, 1, value.quote_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ Quote(String str, String str2, String str3, List list, Integer num, Integer num2, Long l, Long l2, User user, Post post, Integer num3, QuoteType quoteType, ParagraphPb paragraphPb, h21 h21Var, int i, gy2 gy2Var) {
        this(str, str2, (i & 4) != 0 ? null : str3, (i & 8) != 0 ? ey3.a : list, (i & 16) != 0 ? null : num, (i & 32) != 0 ? null : num2, (i & 64) != 0 ? null : l, (i & 128) != 0 ? null : l2, (i & 256) != 0 ? null : user, (i & 512) != 0 ? null : post, (i & 1024) != 0 ? null : num3, (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : quoteType, (i & 4096) != 0 ? null : paragraphPb, (i & 8192) != 0 ? h21.d : h21Var);
    }

    public final Quote copy(String quote_id, String post_id, String user_id, List<ParagraphPb> paragraphs, Integer start_offset, Integer end_offset, Long created_at, Long removed_at, User user, Post post, Integer count, QuoteType quote_type, ParagraphPb quote_paragraph_preview, h21 unknownFields) {
        quote_id.getClass();
        post_id.getClass();
        paragraphs.getClass();
        unknownFields.getClass();
        return new Quote(quote_id, post_id, user_id, paragraphs, start_offset, end_offset, created_at, removed_at, user, post, count, quote_type, quote_paragraph_preview, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof Quote)) {
            return false;
        }
        Quote quote = (Quote) other;
        return g76.L(unknownFields(), quote.unknownFields()) && g76.L(this.quote_id, quote.quote_id) && g76.L(this.post_id, quote.post_id) && g76.L(this.user_id, quote.user_id) && g76.L(this.paragraphs, quote.paragraphs) && g76.L(this.start_offset, quote.start_offset) && g76.L(this.end_offset, quote.end_offset) && g76.L(this.created_at, quote.created_at) && g76.L(this.removed_at, quote.removed_at) && g76.L(this.user, quote.user) && g76.L(this.post, quote.post) && g76.L(this.count, quote.count) && this.quote_type == quote.quote_type && g76.L(this.quote_paragraph_preview, quote.quote_paragraph_preview);
    }

    public final int hashCode() {
        int i;
        int i2;
        int i3 = this.hashCode;
        if (i3 != 0) {
            return i3;
        }
        int iO = wgd.o(wgd.o(unknownFields().hashCode() * 37, 37, this.quote_id), 37, this.post_id);
        String str = this.user_id;
        int iP = wgd.p((iO + (str != null ? str.hashCode() : 0)) * 37, 37, this.paragraphs);
        Integer num = this.start_offset;
        int iIntValue = (iP + (num != null ? num.intValue() : 0)) * 37;
        Integer num2 = this.end_offset;
        int iIntValue2 = (iIntValue + (num2 != null ? num2.intValue() : 0)) * 37;
        Long l = this.created_at;
        if (l != null) {
            long jLongValue = l.longValue();
            i = (int) (jLongValue ^ (jLongValue >>> 32));
        } else {
            i = 0;
        }
        int i4 = (iIntValue2 + i) * 37;
        Long l2 = this.removed_at;
        if (l2 != null) {
            long jLongValue2 = l2.longValue();
            i2 = (int) (jLongValue2 ^ (jLongValue2 >>> 32));
        } else {
            i2 = 0;
        }
        int i5 = (i4 + i2) * 37;
        User user = this.user;
        int iHashCode = (i5 + (user != null ? user.hashCode() : 0)) * 37;
        Post post = this.post;
        int iHashCode2 = (iHashCode + (post != null ? post.hashCode() : 0)) * 37;
        Integer num3 = this.count;
        int iIntValue3 = (iHashCode2 + (num3 != null ? num3.intValue() : 0)) * 37;
        QuoteType quoteType = this.quote_type;
        int iHashCode3 = (iIntValue3 + (quoteType != null ? quoteType.hashCode() : 0)) * 37;
        ParagraphPb paragraphPb = this.quote_paragraph_preview;
        int iHashCode4 = iHashCode3 + (paragraphPb != null ? paragraphPb.hashCode() : 0);
        this.hashCode = iHashCode4;
        return iHashCode4;
    }

    @Override // com.squareup.wire.Message
    public final era newBuilder() {
        era eraVar = new era();
        eraVar.d = ey3.a;
        eraVar.a = this.quote_id;
        eraVar.b = this.post_id;
        eraVar.c = this.user_id;
        eraVar.d = this.paragraphs;
        eraVar.e = this.start_offset;
        eraVar.f = this.end_offset;
        eraVar.g = this.created_at;
        eraVar.h = this.removed_at;
        eraVar.i = this.user;
        eraVar.j = this.post;
        eraVar.k = this.count;
        eraVar.l = this.quote_type;
        eraVar.m = this.quote_paragraph_preview;
        eraVar.addUnknownFields(unknownFields());
        return eraVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        lv8.D(this.quote_id, "quote_id=", arrayList);
        lv8.D(this.post_id, "post_id=", arrayList);
        String str = this.user_id;
        if (str != null) {
            lv8.D(str, "user_id=", arrayList);
        }
        if (!this.paragraphs.isEmpty()) {
            b09.J("paragraphs=", this.paragraphs, arrayList);
        }
        Integer num = this.start_offset;
        if (num != null) {
            lv8.B("start_offset=", num, arrayList);
        }
        Integer num2 = this.end_offset;
        if (num2 != null) {
            lv8.B("end_offset=", num2, arrayList);
        }
        Long l = this.created_at;
        if (l != null) {
            y30.A("created_at=", l, arrayList);
        }
        Long l2 = this.removed_at;
        if (l2 != null) {
            y30.A("removed_at=", l2, arrayList);
        }
        User user = this.user;
        if (user != null) {
            arrayList.add("user=" + user);
        }
        Post post = this.post;
        if (post != null) {
            arrayList.add("post=" + post);
        }
        Integer num3 = this.count;
        if (num3 != null) {
            lv8.B("count=", num3, arrayList);
        }
        QuoteType quoteType = this.quote_type;
        if (quoteType != null) {
            arrayList.add("quote_type=" + quoteType);
        }
        ParagraphPb paragraphPb = this.quote_paragraph_preview;
        if (paragraphPb != null) {
            arrayList.add("quote_paragraph_preview=" + paragraphPb);
        }
        return bu1.F0(arrayList, ", ", "Quote{", "}", null, 56);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Quote(String str, String str2, String str3, List<ParagraphPb> list, Integer num, Integer num2, Long l, Long l2, User user, Post post, Integer num3, QuoteType quoteType, ParagraphPb paragraphPb, h21 h21Var) {
        super(ADAPTER, h21Var);
        str.getClass();
        str2.getClass();
        list.getClass();
        h21Var.getClass();
        this.quote_id = str;
        this.post_id = str2;
        this.user_id = str3;
        this.start_offset = num;
        this.end_offset = num2;
        this.created_at = l;
        this.removed_at = l2;
        this.user = user;
        this.post = post;
        this.count = num3;
        this.quote_type = quoteType;
        this.quote_paragraph_preview = paragraphPb;
        this.paragraphs = Internal.immutableCopyOf("paragraphs", list);
    }
}
