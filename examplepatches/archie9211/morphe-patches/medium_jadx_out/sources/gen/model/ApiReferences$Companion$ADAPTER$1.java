package gen.model;

import com.squareup.wire.FieldEncoding;
import com.squareup.wire.MapProtoAdapter;
import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.ProtoReader;
import com.squareup.wire.ProtoWriter;
import com.squareup.wire.ReverseProtoWriter;
import com.squareup.wire.Syntax;
import com.squareup.wire.internal.Internal;
import defpackage.h21;
import defpackage.n7;
import defpackage.vq6;
import defpackage.w5d;
import defpackage.wg6;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000[\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004*\u0001\u0000\b\n\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0005\u0010\u0006J\u001f\u0010\n\u001a\u00020\t2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\u0003\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\n\u0010\u000bJ\u001f\u0010\n\u001a\u00020\t2\u0006\u0010\b\u001a\u00020\f2\u0006\u0010\u0003\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\n\u0010\rJ\u0017\u0010\u0010\u001a\u00020\u00022\u0006\u0010\u000f\u001a\u00020\u000eH\u0016¢\u0006\u0004\b\u0010\u0010\u0011J\u0017\u0010\u0012\u001a\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0012\u0010\u0013R-\u0010\u001b\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0015\u0012\u0004\u0012\u00020\u00160\u00140\u00018BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b\u0017\u0010\u0018\u001a\u0004\b\u0019\u0010\u001aR-\u0010\u001f\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0015\u0012\u0004\u0012\u00020\u001c0\u00140\u00018BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b\u001d\u0010\u0018\u001a\u0004\b\u001e\u0010\u001aR-\u0010#\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0015\u0012\u0004\u0012\u00020 0\u00140\u00018BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b!\u0010\u0018\u001a\u0004\b\"\u0010\u001aR-\u0010'\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0015\u0012\u0004\u0012\u00020$0\u00140\u00018BX\u0082\u0084\u0002¢\u0006\f\n\u0004\b%\u0010\u0018\u001a\u0004\b&\u0010\u001a¨\u0006("}, d2 = {"gen/model/ApiReferences$Companion$ADAPTER$1", "Lcom/squareup/wire/ProtoAdapter;", "Lgen/model/ApiReferences;", "value", "", "encodedSize", "(Lgen/model/ApiReferences;)I", "Lcom/squareup/wire/ProtoWriter;", "writer", "Lc1e;", "encode", "(Lcom/squareup/wire/ProtoWriter;Lgen/model/ApiReferences;)V", "Lcom/squareup/wire/ReverseProtoWriter;", "(Lcom/squareup/wire/ReverseProtoWriter;Lgen/model/ApiReferences;)V", "Lcom/squareup/wire/ProtoReader;", "reader", "decode", "(Lcom/squareup/wire/ProtoReader;)Lgen/model/ApiReferences;", "redact", "(Lgen/model/ApiReferences;)Lgen/model/ApiReferences;", "", "", "Lgen/model/User;", "usersAdapter$delegate", "Lvq6;", "getUsersAdapter", "()Lcom/squareup/wire/ProtoAdapter;", "usersAdapter", "Lgen/model/MediaResource;", "media_resourcesAdapter$delegate", "getMedia_resourcesAdapter", "media_resourcesAdapter", "Lgen/model/Post;", "postsAdapter$delegate", "getPostsAdapter", "postsAdapter", "Lgen/model/Quote;", "quotesAdapter$delegate", "getQuotesAdapter", "quotesAdapter", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ApiReferences$Companion$ADAPTER$1 extends ProtoAdapter<ApiReferences> {

    /* JADX INFO: renamed from: media_resourcesAdapter$delegate, reason: from kotlin metadata */
    private final vq6 media_resourcesAdapter;

    /* JADX INFO: renamed from: postsAdapter$delegate, reason: from kotlin metadata */
    private final vq6 postsAdapter;

    /* JADX INFO: renamed from: quotesAdapter$delegate, reason: from kotlin metadata */
    private final vq6 quotesAdapter;

    /* JADX INFO: renamed from: usersAdapter$delegate, reason: from kotlin metadata */
    private final vq6 usersAdapter;

    public ApiReferences$Companion$ADAPTER$1(FieldEncoding fieldEncoding, wg6 wg6Var, Syntax syntax) {
        super(fieldEncoding, wg6Var, "type.googleapis.com/gen.model.ApiReferences", syntax, (Object) null, "proto/model/apiReferences.proto");
        this.usersAdapter = new w5d(new n7(3));
        this.media_resourcesAdapter = new w5d(new n7(4));
        this.postsAdapter = new w5d(new n7(5));
        this.quotesAdapter = new w5d(new n7(6));
    }

    public static /* synthetic */ MapProtoAdapter a() {
        return (MapProtoAdapter) usersAdapter_delegate$lambda$0();
    }

    public static /* synthetic */ MapProtoAdapter b() {
        return (MapProtoAdapter) quotesAdapter_delegate$lambda$3();
    }

    public static /* synthetic */ MapProtoAdapter c() {
        return (MapProtoAdapter) postsAdapter_delegate$lambda$2();
    }

    public static /* synthetic */ MapProtoAdapter d() {
        return (MapProtoAdapter) media_resourcesAdapter_delegate$lambda$1();
    }

    private final ProtoAdapter<Map<String, MediaResource>> getMedia_resourcesAdapter() {
        return (ProtoAdapter) this.media_resourcesAdapter.getValue();
    }

    private final ProtoAdapter<Map<String, Post>> getPostsAdapter() {
        return (ProtoAdapter) this.postsAdapter.getValue();
    }

    private final ProtoAdapter<Map<String, Quote>> getQuotesAdapter() {
        return (ProtoAdapter) this.quotesAdapter.getValue();
    }

    private final ProtoAdapter<Map<String, User>> getUsersAdapter() {
        return (ProtoAdapter) this.usersAdapter.getValue();
    }

    private static final ProtoAdapter media_resourcesAdapter_delegate$lambda$1() {
        return ProtoAdapter.INSTANCE.newMapAdapter(ProtoAdapter.STRING, MediaResource.ADAPTER);
    }

    private static final ProtoAdapter postsAdapter_delegate$lambda$2() {
        return ProtoAdapter.INSTANCE.newMapAdapter(ProtoAdapter.STRING, Post.ADAPTER);
    }

    private static final ProtoAdapter quotesAdapter_delegate$lambda$3() {
        return ProtoAdapter.INSTANCE.newMapAdapter(ProtoAdapter.STRING, Quote.ADAPTER);
    }

    private static final ProtoAdapter usersAdapter_delegate$lambda$0() {
        return ProtoAdapter.INSTANCE.newMapAdapter(ProtoAdapter.STRING, User.ADAPTER);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.squareup.wire.ProtoAdapter
    public final ApiReferences decode(ProtoReader reader) {
        reader.getClass();
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        LinkedHashMap linkedHashMap2 = new LinkedHashMap();
        LinkedHashMap linkedHashMap3 = new LinkedHashMap();
        LinkedHashMap linkedHashMap4 = new LinkedHashMap();
        long jBeginMessage = reader.beginMessage();
        while (true) {
            int iNextTag = reader.nextTag();
            if (iNextTag == -1) {
                return new ApiReferences(linkedHashMap, linkedHashMap2, linkedHashMap3, linkedHashMap4, reader.endMessageAndGetUnknownFields(jBeginMessage));
            }
            if (iNextTag == 1) {
                linkedHashMap.putAll(getUsersAdapter().decode(reader));
            } else if (iNextTag == 2) {
                linkedHashMap2.putAll(getMedia_resourcesAdapter().decode(reader));
            } else if (iNextTag == 3) {
                linkedHashMap3.putAll(getPostsAdapter().decode(reader));
            } else if (iNextTag != 4) {
                reader.readUnknownField(iNextTag);
            } else {
                linkedHashMap4.putAll(getQuotesAdapter().decode(reader));
            }
        }
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final void encode(ProtoWriter writer, ApiReferences value) {
        writer.getClass();
        value.getClass();
        getUsersAdapter().encodeWithTag(writer, 1, value.users);
        getMedia_resourcesAdapter().encodeWithTag(writer, 2, value.media_resources);
        getPostsAdapter().encodeWithTag(writer, 3, value.posts);
        getQuotesAdapter().encodeWithTag(writer, 4, value.quotes);
        writer.writeBytes(value.unknownFields());
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final int encodedSize(ApiReferences value) {
        value.getClass();
        return getQuotesAdapter().encodedSizeWithTag(4, value.quotes) + getPostsAdapter().encodedSizeWithTag(3, value.posts) + getMedia_resourcesAdapter().encodedSizeWithTag(2, value.media_resources) + getUsersAdapter().encodedSizeWithTag(1, value.users) + value.unknownFields().e();
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final ApiReferences redact(ApiReferences value) {
        value.getClass();
        return value.copy(Internal.m98redactElements(value.users, User.ADAPTER), Internal.m98redactElements(value.media_resources, MediaResource.ADAPTER), Internal.m98redactElements(value.posts, Post.ADAPTER), Internal.m98redactElements(value.quotes, Quote.ADAPTER), h21.d);
    }

    @Override // com.squareup.wire.ProtoAdapter
    public final void encode(ReverseProtoWriter writer, ApiReferences value) {
        writer.getClass();
        value.getClass();
        writer.writeBytes(value.unknownFields());
        getQuotesAdapter().encodeWithTag(writer, 4, value.quotes);
        getPostsAdapter().encodeWithTag(writer, 3, value.posts);
        getMedia_resourcesAdapter().encodeWithTag(writer, 2, value.media_resources);
        getUsersAdapter().encodeWithTag(writer, 1, value.users);
    }
}
