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
import defpackage.bu1;
import defpackage.fg8;
import defpackage.g76;
import defpackage.gg8;
import defpackage.gy2;
import defpackage.h21;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import defpackage.z73;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\b\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0013\u0018\u0000 .2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002/BÑ\u0001\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000b\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u000b\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u000b\u0012\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u0014\u0012\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u0014\u0012\b\b\u0002\u0010\u0018\u001a\u00020\u0017¢\u0006\u0004\b\u0019\u0010\u001aJ\u000f\u0010\u001b\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u001b\u0010\u001cJ\u001a\u0010\u001f\u001a\u00020\u000b2\b\u0010\u001e\u001a\u0004\u0018\u00010\u001dH\u0096\u0002¢\u0006\u0004\b\u001f\u0010 J\u000f\u0010!\u001a\u00020\u0014H\u0016¢\u0006\u0004\b!\u0010\"J\u000f\u0010#\u001a\u00020\u0003H\u0016¢\u0006\u0004\b#\u0010$J×\u0001\u0010%\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\u000b2\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\u000b2\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u000b2\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0013\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u00142\n\b\u0002\u0010\u0016\u001a\u0004\u0018\u00010\u00142\b\b\u0002\u0010\u0018\u001a\u00020\u0017¢\u0006\u0004\b%\u0010&R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010'R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010(R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010'R\u0016\u0010\b\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010'R\u0016\u0010\t\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010'R\u0016\u0010\n\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010'R\u0016\u0010\f\u001a\u0004\u0018\u00010\u000b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010)R\u0016\u0010\r\u001a\u0004\u0018\u00010\u000b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\r\u0010)R\u0016\u0010\u000e\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010'R\u0016\u0010\u000f\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010'R\u0016\u0010\u0010\u001a\u0004\u0018\u00010\u000b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0010\u0010)R\u0016\u0010\u0011\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0011\u0010'R\u0016\u0010\u0012\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0012\u0010'R\u0016\u0010\u0013\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0013\u0010'R\u001c\u0010\u0015\u001a\u0004\u0018\u00010\u00148\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0015\u0010*\u0012\u0004\b+\u0010,R\u001c\u0010\u0016\u001a\u0004\u0018\u00010\u00148\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0016\u0010*\u0012\u0004\b-\u0010,¨\u00060"}, d2 = {"Lgen/model/NewsletterV3;", "Lcom/squareup/wire/AndroidMessage;", "Lfg8;", "", "newsletter_v3_id", "Lgen/model/NewsletterV3Type;", "type", "name", "description", "collection_id", "newsletter_slug", "", "is_subscribed", "show_promo", "avatar_image_id", "creator_id", "show_newsletter_posts_in_collection_home", "promo_headline", "promo_body", "reply_to_email", "", "exportable_subscribers_count", "subscribers_count", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Lgen/model/NewsletterV3Type;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Lh21;)V", "newBuilder", "()Lfg8;", "", "other", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Lgen/model/NewsletterV3Type;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Lh21;)Lgen/model/NewsletterV3;", "Ljava/lang/String;", "Lgen/model/NewsletterV3Type;", "Ljava/lang/Boolean;", "Ljava/lang/Integer;", "getExportable_subscribers_count$annotations", "()V", "getSubscribers_count$annotations", "Companion", "gg8", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class NewsletterV3 extends AndroidMessage<NewsletterV3, fg8> {
    public static final ProtoAdapter<NewsletterV3> ADAPTER;
    public static final Parcelable.Creator<NewsletterV3> CREATOR;
    public static final gg8 Companion = new gg8();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 8, tag = 9)
    public final String avatar_image_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 4, tag = 5)
    public final String collection_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 9, tag = 10)
    public final String creator_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String description;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 14, tag = 12)
    public final Integer exportable_subscribers_count;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 6, tag = 7)
    public final Boolean is_subscribed;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String name;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 5, tag = 6)
    public final String newsletter_slug;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String newsletter_v3_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 12, tag = 15)
    public final String promo_body;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 11, tag = 14)
    public final String promo_headline;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 13, tag = 16)
    public final String reply_to_email;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 10, tag = 11)
    public final Boolean show_newsletter_posts_in_collection_home;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#BOOL", schemaIndex = 7, tag = 8)
    public final Boolean show_promo;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 15, tag = 13)
    public final Integer subscribers_count;

    @WireField(adapter = "gen.model.NewsletterV3Type#ADAPTER", schemaIndex = 1, tag = 2)
    public final NewsletterV3Type type;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(NewsletterV3.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<NewsletterV3> protoAdapter = new ProtoAdapter<NewsletterV3>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.NewsletterV3$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final NewsletterV3 decode(ProtoReader reader) {
                NewsletterV3Type newsletterV3Type;
                String str;
                String str2;
                String strDecode;
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String str3 = null;
                NewsletterV3Type newsletterV3TypeDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                String strDecode4 = null;
                String strDecode5 = null;
                Boolean boolDecode = null;
                Boolean boolDecode2 = null;
                String strDecode6 = null;
                String strDecode7 = null;
                Boolean boolDecode3 = null;
                String strDecode8 = null;
                String strDecode9 = null;
                String strDecode10 = null;
                Integer numDecode = null;
                Integer numDecode2 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new NewsletterV3(str3, newsletterV3TypeDecode, strDecode2, strDecode3, strDecode4, strDecode5, boolDecode, boolDecode2, strDecode6, strDecode7, boolDecode3, strDecode8, strDecode9, strDecode10, numDecode, numDecode2, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    switch (iNextTag) {
                        case 1:
                            strDecode = ProtoAdapter.STRING.decode(reader);
                            break;
                        case 2:
                            try {
                                newsletterV3TypeDecode = NewsletterV3Type.ADAPTER.decode(reader);
                                strDecode = str3;
                            } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                                newsletterV3Type = newsletterV3TypeDecode;
                                str = strDecode2;
                                str2 = strDecode3;
                                reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                                strDecode = str3;
                                newsletterV3TypeDecode = newsletterV3Type;
                                strDecode3 = str2;
                                strDecode2 = str;
                            }
                            break;
                        case 3:
                            strDecode2 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 4:
                            strDecode3 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 5:
                            strDecode4 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 6:
                            strDecode5 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 7:
                            boolDecode = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 8:
                            boolDecode2 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 9:
                            strDecode6 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 10:
                            strDecode7 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 11:
                            boolDecode3 = ProtoAdapter.BOOL.decode(reader);
                            strDecode = str3;
                            break;
                        case 12:
                            numDecode = ProtoAdapter.INT32.decode(reader);
                            strDecode = str3;
                            break;
                        case 13:
                            numDecode2 = ProtoAdapter.INT32.decode(reader);
                            strDecode = str3;
                            break;
                        case 14:
                            strDecode8 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 15:
                            strDecode9 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        case 16:
                            strDecode10 = ProtoAdapter.STRING.decode(reader);
                            strDecode = str3;
                            break;
                        default:
                            reader.readUnknownField(iNextTag);
                            newsletterV3Type = newsletterV3TypeDecode;
                            str = strDecode2;
                            str2 = strDecode3;
                            strDecode = str3;
                            newsletterV3TypeDecode = newsletterV3Type;
                            strDecode3 = str2;
                            strDecode2 = str;
                            break;
                    }
                    str3 = strDecode;
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, NewsletterV3 value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.newsletter_v3_id);
                NewsletterV3Type.ADAPTER.encodeWithTag(writer, 2, value.type);
                protoAdapter2.encodeWithTag(writer, 3, value.name);
                protoAdapter2.encodeWithTag(writer, 4, value.description);
                protoAdapter2.encodeWithTag(writer, 5, value.collection_id);
                protoAdapter2.encodeWithTag(writer, 6, value.newsletter_slug);
                ProtoAdapter<Boolean> protoAdapter3 = ProtoAdapter.BOOL;
                protoAdapter3.encodeWithTag(writer, 7, value.is_subscribed);
                protoAdapter3.encodeWithTag(writer, 8, value.show_promo);
                protoAdapter2.encodeWithTag(writer, 9, value.avatar_image_id);
                protoAdapter2.encodeWithTag(writer, 10, value.creator_id);
                protoAdapter3.encodeWithTag(writer, 11, value.show_newsletter_posts_in_collection_home);
                protoAdapter2.encodeWithTag(writer, 14, value.promo_headline);
                protoAdapter2.encodeWithTag(writer, 15, value.promo_body);
                protoAdapter2.encodeWithTag(writer, 16, value.reply_to_email);
                ProtoAdapter<Integer> protoAdapter4 = ProtoAdapter.INT32;
                protoAdapter4.encodeWithTag(writer, 12, value.exportable_subscribers_count);
                protoAdapter4.encodeWithTag(writer, 13, value.subscribers_count);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(NewsletterV3 value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag = protoAdapter2.encodedSizeWithTag(6, value.newsletter_slug) + protoAdapter2.encodedSizeWithTag(5, value.collection_id) + protoAdapter2.encodedSizeWithTag(4, value.description) + protoAdapter2.encodedSizeWithTag(3, value.name) + NewsletterV3Type.ADAPTER.encodedSizeWithTag(2, value.type) + protoAdapter2.encodedSizeWithTag(1, value.newsletter_v3_id) + iE;
                ProtoAdapter<Boolean> protoAdapter3 = ProtoAdapter.BOOL;
                int iEncodedSizeWithTag2 = protoAdapter2.encodedSizeWithTag(16, value.reply_to_email) + protoAdapter2.encodedSizeWithTag(15, value.promo_body) + protoAdapter2.encodedSizeWithTag(14, value.promo_headline) + protoAdapter3.encodedSizeWithTag(11, value.show_newsletter_posts_in_collection_home) + protoAdapter2.encodedSizeWithTag(10, value.creator_id) + protoAdapter2.encodedSizeWithTag(9, value.avatar_image_id) + protoAdapter3.encodedSizeWithTag(8, value.show_promo) + protoAdapter3.encodedSizeWithTag(7, value.is_subscribed) + iEncodedSizeWithTag;
                ProtoAdapter<Integer> protoAdapter4 = ProtoAdapter.INT32;
                return protoAdapter4.encodedSizeWithTag(13, value.subscribers_count) + protoAdapter4.encodedSizeWithTag(12, value.exportable_subscribers_count) + iEncodedSizeWithTag2;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final NewsletterV3 redact(NewsletterV3 value) {
                value.getClass();
                return value.copy((65535 & 1) != 0 ? value.newsletter_v3_id : null, (65535 & 2) != 0 ? value.type : null, (65535 & 4) != 0 ? value.name : null, (65535 & 8) != 0 ? value.description : null, (65535 & 16) != 0 ? value.collection_id : null, (65535 & 32) != 0 ? value.newsletter_slug : null, (65535 & 64) != 0 ? value.is_subscribed : null, (65535 & 128) != 0 ? value.show_promo : null, (65535 & 256) != 0 ? value.avatar_image_id : null, (65535 & 512) != 0 ? value.creator_id : null, (65535 & 1024) != 0 ? value.show_newsletter_posts_in_collection_home : null, (65535 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? value.promo_headline : null, (65535 & 4096) != 0 ? value.promo_body : null, (65535 & 8192) != 0 ? value.reply_to_email : null, (65535 & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? value.exportable_subscribers_count : null, (65535 & 32768) != 0 ? value.subscribers_count : null, (65535 & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? value.unknownFields() : h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, NewsletterV3 value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<Integer> protoAdapter2 = ProtoAdapter.INT32;
                protoAdapter2.encodeWithTag(writer, 13, value.subscribers_count);
                protoAdapter2.encodeWithTag(writer, 12, value.exportable_subscribers_count);
                ProtoAdapter<String> protoAdapter3 = ProtoAdapter.STRING;
                protoAdapter3.encodeWithTag(writer, 16, value.reply_to_email);
                protoAdapter3.encodeWithTag(writer, 15, value.promo_body);
                protoAdapter3.encodeWithTag(writer, 14, value.promo_headline);
                ProtoAdapter<Boolean> protoAdapter4 = ProtoAdapter.BOOL;
                protoAdapter4.encodeWithTag(writer, 11, value.show_newsletter_posts_in_collection_home);
                protoAdapter3.encodeWithTag(writer, 10, value.creator_id);
                protoAdapter3.encodeWithTag(writer, 9, value.avatar_image_id);
                protoAdapter4.encodeWithTag(writer, 8, value.show_promo);
                protoAdapter4.encodeWithTag(writer, 7, value.is_subscribed);
                protoAdapter3.encodeWithTag(writer, 6, value.newsletter_slug);
                protoAdapter3.encodeWithTag(writer, 5, value.collection_id);
                protoAdapter3.encodeWithTag(writer, 4, value.description);
                protoAdapter3.encodeWithTag(writer, 3, value.name);
                NewsletterV3Type.ADAPTER.encodeWithTag(writer, 2, value.type);
                protoAdapter3.encodeWithTag(writer, 1, value.newsletter_v3_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ NewsletterV3(String str, NewsletterV3Type newsletterV3Type, String str2, String str3, String str4, String str5, Boolean bool, Boolean bool2, String str6, String str7, Boolean bool3, String str8, String str9, String str10, Integer num, Integer num2, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : newsletterV3Type, (i & 4) != 0 ? null : str2, (i & 8) != 0 ? null : str3, (i & 16) != 0 ? null : str4, (i & 32) != 0 ? null : str5, (i & 64) != 0 ? null : bool, (i & 128) != 0 ? null : bool2, (i & 256) != 0 ? null : str6, (i & 512) != 0 ? null : str7, (i & 1024) != 0 ? null : bool3, (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : str8, (i & 4096) != 0 ? null : str9, (i & 8192) != 0 ? null : str10, (i & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? null : num, (i & 32768) != 0 ? null : num2, (i & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? h21.d : h21Var);
    }

    public final NewsletterV3 copy(String newsletter_v3_id, NewsletterV3Type type, String name, String description, String collection_id, String newsletter_slug, Boolean is_subscribed, Boolean show_promo, String avatar_image_id, String creator_id, Boolean show_newsletter_posts_in_collection_home, String promo_headline, String promo_body, String reply_to_email, Integer exportable_subscribers_count, Integer subscribers_count, h21 unknownFields) {
        unknownFields.getClass();
        return new NewsletterV3(newsletter_v3_id, type, name, description, collection_id, newsletter_slug, is_subscribed, show_promo, avatar_image_id, creator_id, show_newsletter_posts_in_collection_home, promo_headline, promo_body, reply_to_email, exportable_subscribers_count, subscribers_count, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof NewsletterV3)) {
            return false;
        }
        NewsletterV3 newsletterV3 = (NewsletterV3) other;
        return g76.L(unknownFields(), newsletterV3.unknownFields()) && g76.L(this.newsletter_v3_id, newsletterV3.newsletter_v3_id) && this.type == newsletterV3.type && g76.L(this.name, newsletterV3.name) && g76.L(this.description, newsletterV3.description) && g76.L(this.collection_id, newsletterV3.collection_id) && g76.L(this.newsletter_slug, newsletterV3.newsletter_slug) && g76.L(this.is_subscribed, newsletterV3.is_subscribed) && g76.L(this.show_promo, newsletterV3.show_promo) && g76.L(this.avatar_image_id, newsletterV3.avatar_image_id) && g76.L(this.creator_id, newsletterV3.creator_id) && g76.L(this.show_newsletter_posts_in_collection_home, newsletterV3.show_newsletter_posts_in_collection_home) && g76.L(this.promo_headline, newsletterV3.promo_headline) && g76.L(this.promo_body, newsletterV3.promo_body) && g76.L(this.reply_to_email, newsletterV3.reply_to_email) && g76.L(this.exportable_subscribers_count, newsletterV3.exportable_subscribers_count) && g76.L(this.subscribers_count, newsletterV3.subscribers_count);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.newsletter_v3_id;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        NewsletterV3Type newsletterV3Type = this.type;
        int iHashCode3 = (iHashCode2 + (newsletterV3Type != null ? newsletterV3Type.hashCode() : 0)) * 37;
        String str2 = this.name;
        int iHashCode4 = (iHashCode3 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.description;
        int iHashCode5 = (iHashCode4 + (str3 != null ? str3.hashCode() : 0)) * 37;
        String str4 = this.collection_id;
        int iHashCode6 = (iHashCode5 + (str4 != null ? str4.hashCode() : 0)) * 37;
        String str5 = this.newsletter_slug;
        int iHashCode7 = (iHashCode6 + (str5 != null ? str5.hashCode() : 0)) * 37;
        Boolean bool = this.is_subscribed;
        int i2 = 1237;
        int i3 = (iHashCode7 + (bool != null ? bool.booleanValue() ? 1231 : 1237 : 0)) * 37;
        Boolean bool2 = this.show_promo;
        int i4 = (i3 + (bool2 != null ? bool2.booleanValue() ? 1231 : 1237 : 0)) * 37;
        String str6 = this.avatar_image_id;
        int iHashCode8 = (i4 + (str6 != null ? str6.hashCode() : 0)) * 37;
        String str7 = this.creator_id;
        int iHashCode9 = (iHashCode8 + (str7 != null ? str7.hashCode() : 0)) * 37;
        Boolean bool3 = this.show_newsletter_posts_in_collection_home;
        if (bool3 == null) {
            i2 = 0;
        } else if (bool3.booleanValue()) {
            i2 = 1231;
        }
        int i5 = (iHashCode9 + i2) * 37;
        String str8 = this.promo_headline;
        int iHashCode10 = (i5 + (str8 != null ? str8.hashCode() : 0)) * 37;
        String str9 = this.promo_body;
        int iHashCode11 = (iHashCode10 + (str9 != null ? str9.hashCode() : 0)) * 37;
        String str10 = this.reply_to_email;
        int iHashCode12 = (iHashCode11 + (str10 != null ? str10.hashCode() : 0)) * 37;
        Integer num = this.exportable_subscribers_count;
        int iIntValue = (iHashCode12 + (num != null ? num.intValue() : 0)) * 37;
        Integer num2 = this.subscribers_count;
        int iIntValue2 = iIntValue + (num2 != null ? num2.intValue() : 0);
        this.hashCode = iIntValue2;
        return iIntValue2;
    }

    @Override // com.squareup.wire.Message
    public final fg8 newBuilder() {
        fg8 fg8Var = new fg8();
        fg8Var.a = this.newsletter_v3_id;
        fg8Var.b = this.type;
        fg8Var.c = this.name;
        fg8Var.d = this.description;
        fg8Var.e = this.collection_id;
        fg8Var.f = this.newsletter_slug;
        fg8Var.g = this.is_subscribed;
        fg8Var.h = this.show_promo;
        fg8Var.i = this.avatar_image_id;
        fg8Var.j = this.creator_id;
        fg8Var.k = this.show_newsletter_posts_in_collection_home;
        fg8Var.l = this.promo_headline;
        fg8Var.m = this.promo_body;
        fg8Var.n = this.reply_to_email;
        fg8Var.o = this.exportable_subscribers_count;
        fg8Var.p = this.subscribers_count;
        fg8Var.addUnknownFields(unknownFields());
        return fg8Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.newsletter_v3_id;
        if (str != null) {
            lv8.D(str, "newsletter_v3_id=", arrayList);
        }
        NewsletterV3Type newsletterV3Type = this.type;
        if (newsletterV3Type != null) {
            arrayList.add("type=" + newsletterV3Type);
        }
        String str2 = this.name;
        if (str2 != null) {
            lv8.D(str2, "name=", arrayList);
        }
        String str3 = this.description;
        if (str3 != null) {
            lv8.D(str3, "description=", arrayList);
        }
        String str4 = this.collection_id;
        if (str4 != null) {
            lv8.D(str4, "collection_id=", arrayList);
        }
        String str5 = this.newsletter_slug;
        if (str5 != null) {
            lv8.D(str5, "newsletter_slug=", arrayList);
        }
        Boolean bool = this.is_subscribed;
        if (bool != null) {
            lv8.A("is_subscribed=", bool, arrayList);
        }
        Boolean bool2 = this.show_promo;
        if (bool2 != null) {
            lv8.A("show_promo=", bool2, arrayList);
        }
        String str6 = this.avatar_image_id;
        if (str6 != null) {
            lv8.D(str6, "avatar_image_id=", arrayList);
        }
        String str7 = this.creator_id;
        if (str7 != null) {
            lv8.D(str7, "creator_id=", arrayList);
        }
        Boolean bool3 = this.show_newsletter_posts_in_collection_home;
        if (bool3 != null) {
            lv8.A("show_newsletter_posts_in_collection_home=", bool3, arrayList);
        }
        String str8 = this.promo_headline;
        if (str8 != null) {
            lv8.D(str8, "promo_headline=", arrayList);
        }
        String str9 = this.promo_body;
        if (str9 != null) {
            lv8.D(str9, "promo_body=", arrayList);
        }
        String str10 = this.reply_to_email;
        if (str10 != null) {
            lv8.D(str10, "reply_to_email=", arrayList);
        }
        Integer num = this.exportable_subscribers_count;
        if (num != null) {
            lv8.B("exportable_subscribers_count=", num, arrayList);
        }
        Integer num2 = this.subscribers_count;
        if (num2 != null) {
            lv8.B("subscribers_count=", num2, arrayList);
        }
        return bu1.F0(arrayList, ", ", "NewsletterV3{", "}", null, 56);
    }

    public NewsletterV3() {
        this(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 131071, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public NewsletterV3(String str, NewsletterV3Type newsletterV3Type, String str2, String str3, String str4, String str5, Boolean bool, Boolean bool2, String str6, String str7, Boolean bool3, String str8, String str9, String str10, Integer num, Integer num2, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.newsletter_v3_id = str;
        this.type = newsletterV3Type;
        this.name = str2;
        this.description = str3;
        this.collection_id = str4;
        this.newsletter_slug = str5;
        this.is_subscribed = bool;
        this.show_promo = bool2;
        this.avatar_image_id = str6;
        this.creator_id = str7;
        this.show_newsletter_posts_in_collection_home = bool3;
        this.promo_headline = str8;
        this.promo_body = str9;
        this.reply_to_email = str10;
        this.exportable_subscribers_count = num;
        this.subscribers_count = num2;
    }

    @z73
    public static /* synthetic */ void getExportable_subscribers_count$annotations() {
    }

    @z73
    public static /* synthetic */ void getSubscribers_count$annotations() {
    }
}
