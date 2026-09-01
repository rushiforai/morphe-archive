package gen.model;

import android.os.Parcelable;
import com.squareup.wire.AndroidMessage;
import com.squareup.wire.FieldEncoding;
import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireField;
import com.squareup.wire.internal.Internal;
import defpackage.bu1;
import defpackage.fy3;
import defpackage.g76;
import defpackage.gy2;
import defpackage.h21;
import defpackage.iz;
import defpackage.jz;
import defpackage.n1b;
import java.util.ArrayList;
import java.util.Map;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000J\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\n\u0018\u0000  2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002!Bi\u0012\u0014\b\u0002\u0010\u0006\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00050\u0003\u0012\u0014\b\u0002\u0010\b\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00070\u0003\u0012\u0014\b\u0002\u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\t0\u0003\u0012\u0014\b\u0002\u0010\f\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u000b0\u0003\u0012\b\b\u0002\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\u000f\u0010\u0010J\u000f\u0010\u0011\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0011\u0010\u0012J\u001a\u0010\u0016\u001a\u00020\u00152\b\u0010\u0014\u001a\u0004\u0018\u00010\u0013H\u0096\u0002¢\u0006\u0004\b\u0016\u0010\u0017J\u000f\u0010\u0019\u001a\u00020\u0018H\u0016¢\u0006\u0004\b\u0019\u0010\u001aJ\u000f\u0010\u001b\u001a\u00020\u0004H\u0016¢\u0006\u0004\b\u001b\u0010\u001cJo\u0010\u001d\u001a\u00020\u00002\u0014\b\u0002\u0010\u0006\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00050\u00032\u0014\b\u0002\u0010\b\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00070\u00032\u0014\b\u0002\u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\t0\u00032\u0014\b\u0002\u0010\f\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u000b0\u00032\b\b\u0002\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\u001d\u0010\u001eR \u0010\u0006\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00050\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u001fR \u0010\b\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00070\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\u001fR \u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\t0\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010\u001fR \u0010\f\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u000b0\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\f\u0010\u001f¨\u0006\""}, d2 = {"Lgen/model/ApiReferences;", "Lcom/squareup/wire/AndroidMessage;", "Liz;", "", "", "Lgen/model/User;", "users", "Lgen/model/MediaResource;", "media_resources", "Lgen/model/Post;", "posts", "Lgen/model/Quote;", "quotes", "Lh21;", "unknownFields", "<init>", "(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Lh21;)V", "newBuilder", "()Liz;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Lh21;)Lgen/model/ApiReferences;", "Ljava/util/Map;", "Companion", "jz", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ApiReferences extends AndroidMessage<ApiReferences, iz> {
    public static final ProtoAdapter<ApiReferences> ADAPTER;
    public static final Parcelable.Creator<ApiReferences> CREATOR;
    public static final jz Companion = new jz();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "gen.model.MediaResource#ADAPTER", jsonName = "MediaResource", keyAdapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final Map<String, MediaResource> media_resources;

    @WireField(adapter = "gen.model.Post#ADAPTER", jsonName = "Post", keyAdapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final Map<String, Post> posts;

    @WireField(adapter = "gen.model.Quote#ADAPTER", jsonName = "Quote", keyAdapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final Map<String, Quote> quotes;

    @WireField(adapter = "gen.model.User#ADAPTER", jsonName = "User", keyAdapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final Map<String, User> users;

    static {
        ApiReferences$Companion$ADAPTER$1 apiReferences$Companion$ADAPTER$1 = new ApiReferences$Companion$ADAPTER$1(FieldEncoding.LENGTH_DELIMITED, n1b.a.b(ApiReferences.class), Syntax.PROTO_2);
        ADAPTER = apiReferences$Companion$ADAPTER$1;
        CREATOR = AndroidMessage.INSTANCE.newCreator(apiReferences$Companion$ADAPTER$1);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ApiReferences(Map<String, User> map, Map<String, MediaResource> map2, Map<String, Post> map3, Map<String, Quote> map4, h21 h21Var) {
        super(ADAPTER, h21Var);
        map.getClass();
        map2.getClass();
        map3.getClass();
        map4.getClass();
        h21Var.getClass();
        this.users = Internal.immutableCopyOf("users", map);
        this.media_resources = Internal.immutableCopyOf("media_resources", map2);
        this.posts = Internal.immutableCopyOf("posts", map3);
        this.quotes = Internal.immutableCopyOf("quotes", map4);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ ApiReferences copy$default(ApiReferences apiReferences, Map map, Map map2, Map map3, Map map4, h21 h21Var, int i, Object obj) {
        if ((i & 1) != 0) {
            map = apiReferences.users;
        }
        if ((i & 2) != 0) {
            map2 = apiReferences.media_resources;
        }
        if ((i & 4) != 0) {
            map3 = apiReferences.posts;
        }
        if ((i & 8) != 0) {
            map4 = apiReferences.quotes;
        }
        if ((i & 16) != 0) {
            h21Var = apiReferences.unknownFields();
        }
        h21 h21Var2 = h21Var;
        Map map5 = map3;
        return apiReferences.copy(map, map2, map5, map4, h21Var2);
    }

    public final ApiReferences copy(Map<String, User> users, Map<String, MediaResource> media_resources, Map<String, Post> posts, Map<String, Quote> quotes, h21 unknownFields) {
        users.getClass();
        media_resources.getClass();
        posts.getClass();
        quotes.getClass();
        unknownFields.getClass();
        return new ApiReferences(users, media_resources, posts, quotes, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof ApiReferences)) {
            return false;
        }
        ApiReferences apiReferences = (ApiReferences) other;
        return g76.L(unknownFields(), apiReferences.unknownFields()) && g76.L(this.users, apiReferences.users) && g76.L(this.media_resources, apiReferences.media_resources) && g76.L(this.posts, apiReferences.posts) && g76.L(this.quotes, apiReferences.quotes);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = this.quotes.hashCode() + ((this.posts.hashCode() + ((this.media_resources.hashCode() + ((this.users.hashCode() + (unknownFields().hashCode() * 37)) * 37)) * 37)) * 37);
        this.hashCode = iHashCode;
        return iHashCode;
    }

    @Override // com.squareup.wire.Message
    public final iz newBuilder() {
        iz izVar = new iz();
        fy3 fy3Var = fy3.a;
        izVar.a = fy3Var;
        izVar.b = fy3Var;
        izVar.c = fy3Var;
        izVar.d = fy3Var;
        izVar.a = this.users;
        izVar.b = this.media_resources;
        izVar.c = this.posts;
        izVar.d = this.quotes;
        izVar.addUnknownFields(unknownFields());
        return izVar;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        if (!this.users.isEmpty()) {
            arrayList.add("users=" + this.users);
        }
        if (!this.media_resources.isEmpty()) {
            arrayList.add("media_resources=" + this.media_resources);
        }
        if (!this.posts.isEmpty()) {
            arrayList.add("posts=" + this.posts);
        }
        if (!this.quotes.isEmpty()) {
            arrayList.add("quotes=" + this.quotes);
        }
        return bu1.F0(arrayList, ", ", "ApiReferences{", "}", null, 56);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ ApiReferences(Map map, Map map2, Map map3, Map map4, h21 h21Var, int i, gy2 gy2Var) {
        int i2 = i & 1;
        fy3 fy3Var = fy3.a;
        this(i2 != 0 ? fy3Var : map, (i & 2) != 0 ? fy3Var : map2, (i & 4) != 0 ? fy3Var : map3, (i & 8) != 0 ? fy3Var : map4, (i & 16) != 0 ? h21.d : h21Var);
    }

    public ApiReferences() {
        this(null, null, null, null, null, 31, null);
    }
}
