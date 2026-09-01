package gen.model;

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
import defpackage.lv8;
import defpackage.n1b;
import defpackage.tm7;
import defpackage.um7;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\n\u0018\u0000 \u001b2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001cBA\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bJ\u000f\u0010\f\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\f\u0010\rJ\u001a\u0010\u0011\u001a\u00020\u00102\b\u0010\u000f\u001a\u0004\u0018\u00010\u000eH\u0096\u0002¢\u0006\u0004\b\u0011\u0010\u0012J\u000f\u0010\u0014\u001a\u00020\u0013H\u0016¢\u0006\u0004\b\u0014\u0010\u0015J\u000f\u0010\u0016\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0016\u0010\u0017JG\u0010\u0018\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\t\u001a\u00020\b¢\u0006\u0004\b\u0018\u0010\u0019R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u001aR\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\u001aR\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001aR\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\u001a¨\u0006\u001d"}, d2 = {"Lgen/model/MediaResourceTweet;", "Lcom/squareup/wire/AndroidMessage;", "Ltm7;", "", "tweet_id", "tweet", "twitter_screen_name", "twitter_name", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)V", "newBuilder", "()Ltm7;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lh21;)Lgen/model/MediaResourceTweet;", "Ljava/lang/String;", "Companion", "um7", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class MediaResourceTweet extends AndroidMessage<MediaResourceTweet, tm7> {
    public static final ProtoAdapter<MediaResourceTweet> ADAPTER;
    public static final Parcelable.Creator<MediaResourceTweet> CREATOR;
    public static final um7 Companion = new um7();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String tweet;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String tweet_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String twitter_name;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String twitter_screen_name;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(MediaResourceTweet.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<MediaResourceTweet> protoAdapter = new ProtoAdapter<MediaResourceTweet>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.MediaResourceTweet$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final MediaResourceTweet decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                String strDecode2 = null;
                String strDecode3 = null;
                String strDecode4 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new MediaResourceTweet(strDecode, strDecode2, strDecode3, strDecode4, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 2) {
                        strDecode2 = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag == 3) {
                        strDecode3 = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag != 4) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        strDecode4 = ProtoAdapter.STRING.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, MediaResourceTweet value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.tweet_id);
                protoAdapter2.encodeWithTag(writer, 2, value.tweet);
                protoAdapter2.encodeWithTag(writer, 3, value.twitter_screen_name);
                protoAdapter2.encodeWithTag(writer, 4, value.twitter_name);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(MediaResourceTweet value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                return protoAdapter2.encodedSizeWithTag(4, value.twitter_name) + protoAdapter2.encodedSizeWithTag(3, value.twitter_screen_name) + protoAdapter2.encodedSizeWithTag(2, value.tweet) + protoAdapter2.encodedSizeWithTag(1, value.tweet_id) + iE;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final MediaResourceTweet redact(MediaResourceTweet value) {
                value.getClass();
                return MediaResourceTweet.copy$default(value, null, null, null, null, h21.d, 15, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, MediaResourceTweet value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 4, value.twitter_name);
                protoAdapter2.encodeWithTag(writer, 3, value.twitter_screen_name);
                protoAdapter2.encodeWithTag(writer, 2, value.tweet);
                protoAdapter2.encodeWithTag(writer, 1, value.tweet_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ MediaResourceTweet(String str, String str2, String str3, String str4, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : str2, (i & 4) != 0 ? null : str3, (i & 8) != 0 ? null : str4, (i & 16) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ MediaResourceTweet copy$default(MediaResourceTweet mediaResourceTweet, String str, String str2, String str3, String str4, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = mediaResourceTweet.tweet_id;
        }
        if ((i & 2) != 0) {
            str2 = mediaResourceTweet.tweet;
        }
        if ((i & 4) != 0) {
            str3 = mediaResourceTweet.twitter_screen_name;
        }
        if ((i & 8) != 0) {
            str4 = mediaResourceTweet.twitter_name;
        }
        if ((i & 16) != 0) {
            h21Var = mediaResourceTweet.unknownFields();
        }
        h21 h21Var2 = h21Var;
        String str5 = str3;
        return mediaResourceTweet.copy(str, str2, str5, str4, h21Var2);
    }

    public final MediaResourceTweet copy(String tweet_id, String tweet, String twitter_screen_name, String twitter_name, h21 unknownFields) {
        unknownFields.getClass();
        return new MediaResourceTweet(tweet_id, tweet, twitter_screen_name, twitter_name, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof MediaResourceTweet)) {
            return false;
        }
        MediaResourceTweet mediaResourceTweet = (MediaResourceTweet) other;
        return g76.L(unknownFields(), mediaResourceTweet.unknownFields()) && g76.L(this.tweet_id, mediaResourceTweet.tweet_id) && g76.L(this.tweet, mediaResourceTweet.tweet) && g76.L(this.twitter_screen_name, mediaResourceTweet.twitter_screen_name) && g76.L(this.twitter_name, mediaResourceTweet.twitter_name);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.tweet_id;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.tweet;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.twitter_screen_name;
        int iHashCode4 = (iHashCode3 + (str3 != null ? str3.hashCode() : 0)) * 37;
        String str4 = this.twitter_name;
        int iHashCode5 = iHashCode4 + (str4 != null ? str4.hashCode() : 0);
        this.hashCode = iHashCode5;
        return iHashCode5;
    }

    @Override // com.squareup.wire.Message
    public final tm7 newBuilder() {
        tm7 tm7Var = new tm7();
        tm7Var.a = this.tweet_id;
        tm7Var.b = this.tweet;
        tm7Var.c = this.twitter_screen_name;
        tm7Var.d = this.twitter_name;
        tm7Var.addUnknownFields(unknownFields());
        return tm7Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.tweet_id;
        if (str != null) {
            lv8.D(str, "tweet_id=", arrayList);
        }
        String str2 = this.tweet;
        if (str2 != null) {
            lv8.D(str2, "tweet=", arrayList);
        }
        String str3 = this.twitter_screen_name;
        if (str3 != null) {
            lv8.D(str3, "twitter_screen_name=", arrayList);
        }
        String str4 = this.twitter_name;
        if (str4 != null) {
            lv8.D(str4, "twitter_name=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "MediaResourceTweet{", "}", null, 56);
    }

    public MediaResourceTweet() {
        this(null, null, null, null, null, 31, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public MediaResourceTweet(String str, String str2, String str3, String str4, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.tweet_id = str;
        this.tweet = str2;
        this.twitter_screen_name = str3;
        this.twitter_name = str4;
    }
}
