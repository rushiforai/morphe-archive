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
import defpackage.km7;
import defpackage.lm7;
import defpackage.lv8;
import defpackage.n1b;
import defpackage.wg6;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u000b\u0018\u0000 \u001b2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002\u001cB)\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000b\u0010\fJ\u001a\u0010\u0010\u001a\u00020\u000f2\b\u0010\u000e\u001a\u0004\u0018\u00010\rH\u0096\u0002¢\u0006\u0004\b\u0010\u0010\u0011J\u000f\u0010\u0013\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0013\u0010\u0014J\u000f\u0010\u0015\u001a\u00020\u0003H\u0016¢\u0006\u0004\b\u0015\u0010\u0016J/\u0010\u0017\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\u0017\u0010\u0018R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u0019R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001a¨\u0006\u001d"}, d2 = {"Lgen/model/MediaResourceMediumPost;", "Lcom/squareup/wire/AndroidMessage;", "Lkm7;", "", "post_id", "Lgen/model/Post;", "post", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Lgen/model/Post;Lh21;)V", "newBuilder", "()Lkm7;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Lgen/model/Post;Lh21;)Lgen/model/MediaResourceMediumPost;", "Ljava/lang/String;", "Lgen/model/Post;", "Companion", "lm7", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class MediaResourceMediumPost extends AndroidMessage<MediaResourceMediumPost, km7> {
    public static final ProtoAdapter<MediaResourceMediumPost> ADAPTER;
    public static final Parcelable.Creator<MediaResourceMediumPost> CREATOR;
    public static final lm7 Companion = new lm7();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "gen.model.Post#ADAPTER", schemaIndex = 1, tag = 2)
    public final Post post;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String post_id;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(MediaResourceMediumPost.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<MediaResourceMediumPost> protoAdapter = new ProtoAdapter<MediaResourceMediumPost>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.MediaResourceMediumPost$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.squareup.wire.ProtoAdapter
            public final MediaResourceMediumPost decode(ProtoReader reader) {
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String strDecode = null;
                Post postDecode = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new MediaResourceMediumPost(strDecode, postDecode, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag == 1) {
                        strDecode = ProtoAdapter.STRING.decode(reader);
                    } else if (iNextTag != 2) {
                        reader.readUnknownField(iNextTag);
                    } else {
                        postDecode = Post.ADAPTER.decode(reader);
                    }
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, MediaResourceMediumPost value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter.STRING.encodeWithTag(writer, 1, value.post_id);
                Post.ADAPTER.encodeWithTag(writer, 2, value.post);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(MediaResourceMediumPost value) {
                value.getClass();
                return Post.ADAPTER.encodedSizeWithTag(2, value.post) + ProtoAdapter.STRING.encodedSizeWithTag(1, value.post_id) + value.unknownFields().e();
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final MediaResourceMediumPost redact(MediaResourceMediumPost value) {
                value.getClass();
                Post post = value.post;
                return MediaResourceMediumPost.copy$default(value, null, post != null ? Post.ADAPTER.redact(post) : null, h21.d, 1, null);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, MediaResourceMediumPost value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                Post.ADAPTER.encodeWithTag(writer, 2, value.post);
                ProtoAdapter.STRING.encodeWithTag(writer, 1, value.post_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ MediaResourceMediumPost(String str, Post post, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : post, (i & 4) != 0 ? h21.d : h21Var);
    }

    public static /* synthetic */ MediaResourceMediumPost copy$default(MediaResourceMediumPost mediaResourceMediumPost, String str, Post post, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            str = mediaResourceMediumPost.post_id;
        }
        if ((i & 2) != 0) {
            post = mediaResourceMediumPost.post;
        }
        if ((i & 4) != 0) {
            h21Var = mediaResourceMediumPost.unknownFields();
        }
        return mediaResourceMediumPost.copy(str, post, h21Var);
    }

    public final MediaResourceMediumPost copy(String post_id, Post post, h21 unknownFields) {
        unknownFields.getClass();
        return new MediaResourceMediumPost(post_id, post, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof MediaResourceMediumPost)) {
            return false;
        }
        MediaResourceMediumPost mediaResourceMediumPost = (MediaResourceMediumPost) other;
        return g76.L(unknownFields(), mediaResourceMediumPost.unknownFields()) && g76.L(this.post_id, mediaResourceMediumPost.post_id) && g76.L(this.post, mediaResourceMediumPost.post);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.post_id;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        Post post = this.post;
        int iHashCode3 = iHashCode2 + (post != null ? post.hashCode() : 0);
        this.hashCode = iHashCode3;
        return iHashCode3;
    }

    @Override // com.squareup.wire.Message
    public final km7 newBuilder() {
        km7 km7Var = new km7();
        km7Var.a = this.post_id;
        km7Var.b = this.post;
        km7Var.addUnknownFields(unknownFields());
        return km7Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.post_id;
        if (str != null) {
            lv8.D(str, "post_id=", arrayList);
        }
        Post post = this.post;
        if (post != null) {
            arrayList.add("post=" + post);
        }
        return bu1.F0(arrayList, ", ", "MediaResourceMediumPost{", "}", null, 56);
    }

    public MediaResourceMediumPost() {
        this(null, null, null, 7, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public MediaResourceMediumPost(String str, Post post, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.post_id = str;
        this.post = post;
    }
}
