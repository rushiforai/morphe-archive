package gen.model;

import android.os.Parcelable;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
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
import defpackage.wg6;
import defpackage.xl7;
import defpackage.yl7;
import java.util.ArrayList;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0082\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u001b\b\u0007\u0018\u0000 L2\u000e\u0012\u0004\u0012\u00020\u0000\u0012\u0004\u0012\u00020\u00020\u0001:\u0002\u0002MBÕ\u0002\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u000e\u0012\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u0010\u0012\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u000e\u0012\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u0013\u0012\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u0016\u0012\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u001a\u001a\u0004\u0018\u00010\u0019\u0012\n\b\u0002\u0010\u001b\u001a\u0004\u0018\u00010\u000e\u0012\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\u001c\u0012\n\b\u0002\u0010\u001e\u001a\u0004\u0018\u00010\u000e\u0012\n\b\u0002\u0010 \u001a\u0004\u0018\u00010\u001f\u0012\n\b\u0002\u0010\"\u001a\u0004\u0018\u00010!\u0012\n\b\u0002\u0010#\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010$\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010&\u001a\u0004\u0018\u00010%\u0012\n\b\u0002\u0010(\u001a\u0004\u0018\u00010'\u0012\n\b\u0002\u0010)\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010*\u001a\u0004\u0018\u00010\u0003\u0012\b\b\u0002\u0010,\u001a\u00020+¢\u0006\u0004\b-\u0010.J\u000f\u0010/\u001a\u00020\u0002H\u0016¢\u0006\u0004\b/\u00100J\u001a\u00104\u001a\u0002032\b\u00102\u001a\u0004\u0018\u000101H\u0096\u0002¢\u0006\u0004\b4\u00105J\u000f\u00106\u001a\u00020\u000eH\u0016¢\u0006\u0004\b6\u00107J\u000f\u00108\u001a\u00020\u0003H\u0016¢\u0006\u0004\b8\u00109JÛ\u0002\u0010:\u001a\u00020\u00002\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\n\u001a\u0004\u0018\u00010\t2\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f2\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u000e2\n\b\u0002\u0010\u0011\u001a\u0004\u0018\u00010\u00102\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u000e2\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u00132\n\b\u0002\u0010\u0015\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0017\u001a\u0004\u0018\u00010\u00162\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u001a\u001a\u0004\u0018\u00010\u00192\n\b\u0002\u0010\u001b\u001a\u0004\u0018\u00010\u000e2\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\u001c2\n\b\u0002\u0010\u001e\u001a\u0004\u0018\u00010\u000e2\n\b\u0002\u0010 \u001a\u0004\u0018\u00010\u001f2\n\b\u0002\u0010\"\u001a\u0004\u0018\u00010!2\n\b\u0002\u0010#\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010$\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010&\u001a\u0004\u0018\u00010%2\n\b\u0002\u0010(\u001a\u0004\u0018\u00010'2\n\b\u0002\u0010)\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010*\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010,\u001a\u00020+¢\u0006\u0004\b:\u0010;R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010<R\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010<R\u0016\u0010\u0006\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010<R\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010<R\u0016\u0010\b\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010<R\u0016\u0010\n\u001a\u0004\u0018\u00010\t8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\n\u0010=R\u0016\u0010\u000b\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010<R\u0016\u0010\r\u001a\u0004\u0018\u00010\f8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\r\u0010>R\u0016\u0010\u000f\u001a\u0004\u0018\u00010\u000e8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010?R\u0016\u0010\u0011\u001a\u0004\u0018\u00010\u00108\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0011\u0010@R\u0016\u0010\u0012\u001a\u0004\u0018\u00010\u000e8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0012\u0010?R\u0016\u0010\u0014\u001a\u0004\u0018\u00010\u00138\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0014\u0010AR\u0016\u0010\u0015\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0015\u0010<R\u0016\u0010\u0017\u001a\u0004\u0018\u00010\u00168\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0017\u0010BR\u0016\u0010\u0018\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0018\u0010<R\u0016\u0010\u001a\u001a\u0004\u0018\u00010\u00198\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001a\u0010CR\u0016\u0010\u001b\u001a\u0004\u0018\u00010\u000e8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001b\u0010?R\u0016\u0010\u001d\u001a\u0004\u0018\u00010\u001c8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001d\u0010DR\u0016\u0010\u001e\u001a\u0004\u0018\u00010\u000e8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u001e\u0010?R\u0016\u0010 \u001a\u0004\u0018\u00010\u001f8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b \u0010ER\u0016\u0010\"\u001a\u0004\u0018\u00010!8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\"\u0010FR\u0016\u0010#\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b#\u0010<R\u0016\u0010$\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b$\u0010<R\u0016\u0010&\u001a\u0004\u0018\u00010%8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b&\u0010GR\u0016\u0010(\u001a\u0004\u0018\u00010'8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b(\u0010HR\u001c\u0010)\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b)\u0010<\u0012\u0004\bI\u0010JR\u001c\u0010*\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\f\n\u0004\b*\u0010<\u0012\u0004\bK\u0010J¨\u0006N"}, d2 = {"Lgen/model/MediaResource;", "Lcom/squareup/wire/AndroidMessage;", "Lxl7;", "", "media_resource_id", "media_resource_type", "href", "domain", "title", "Lgen/model/MediaResourceMediumPost;", "medium_post", "description", "Lgen/model/MediaResourceExternalLink;", "external_link", "", "iframe_width", "Lgen/model/MediaResourceTweet;", "tweet", "iframe_height", "Lgen/model/MediaResourceGist;", "gist", "iframe_src", "Lgen/model/MediaResourceSuper;", "super_me", "thumbnail_url", "Lgen/model/MediaResourceCharted;", "charted", "thumbnail_width", "Lgen/model/MediaResourceMediumCollection;", "medium_collection", "thumbnail_height", "Lgen/model/MediaResourceMediumCatalog;", "medium_catalog", "Lgen/model/MediaResourceDisplay;", "display", "thumbnail_image_id", "author_name", "Lgen/model/MediaResourceMediumQuote;", "medium_quote", "Lgen/model/MediaResourceMoment;", "moment", "surrogate_post_id", "provider_name", "Lh21;", "unknownFields", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgen/model/MediaResourceMediumPost;Ljava/lang/String;Lgen/model/MediaResourceExternalLink;Ljava/lang/Integer;Lgen/model/MediaResourceTweet;Ljava/lang/Integer;Lgen/model/MediaResourceGist;Ljava/lang/String;Lgen/model/MediaResourceSuper;Ljava/lang/String;Lgen/model/MediaResourceCharted;Ljava/lang/Integer;Lgen/model/MediaResourceMediumCollection;Ljava/lang/Integer;Lgen/model/MediaResourceMediumCatalog;Lgen/model/MediaResourceDisplay;Ljava/lang/String;Ljava/lang/String;Lgen/model/MediaResourceMediumQuote;Lgen/model/MediaResourceMoment;Ljava/lang/String;Ljava/lang/String;Lh21;)V", "newBuilder", "()Lxl7;", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "hashCode", "()I", "toString", "()Ljava/lang/String;", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lgen/model/MediaResourceMediumPost;Ljava/lang/String;Lgen/model/MediaResourceExternalLink;Ljava/lang/Integer;Lgen/model/MediaResourceTweet;Ljava/lang/Integer;Lgen/model/MediaResourceGist;Ljava/lang/String;Lgen/model/MediaResourceSuper;Ljava/lang/String;Lgen/model/MediaResourceCharted;Ljava/lang/Integer;Lgen/model/MediaResourceMediumCollection;Ljava/lang/Integer;Lgen/model/MediaResourceMediumCatalog;Lgen/model/MediaResourceDisplay;Ljava/lang/String;Ljava/lang/String;Lgen/model/MediaResourceMediumQuote;Lgen/model/MediaResourceMoment;Ljava/lang/String;Ljava/lang/String;Lh21;)Lgen/model/MediaResource;", "Ljava/lang/String;", "Lgen/model/MediaResourceMediumPost;", "Lgen/model/MediaResourceExternalLink;", "Ljava/lang/Integer;", "Lgen/model/MediaResourceTweet;", "Lgen/model/MediaResourceGist;", "Lgen/model/MediaResourceSuper;", "Lgen/model/MediaResourceCharted;", "Lgen/model/MediaResourceMediumCollection;", "Lgen/model/MediaResourceMediumCatalog;", "Lgen/model/MediaResourceDisplay;", "Lgen/model/MediaResourceMediumQuote;", "Lgen/model/MediaResourceMoment;", "getSurrogate_post_id$annotations", "()V", "getProvider_name$annotations", "Companion", "yl7", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class MediaResource extends AndroidMessage<MediaResource, xl7> {
    public static final ProtoAdapter<MediaResource> ADAPTER;
    public static final Parcelable.Creator<MediaResource> CREATOR;
    public static final yl7 Companion = new yl7();
    private static final long serialVersionUID = 0;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 22, tag = 31)
    public final String author_name;

    @WireField(adapter = "gen.model.MediaResourceCharted#ADAPTER", schemaIndex = 15, tag = PhotoshopDirectory.TAG_DISPLAY_INFO_OBSOLETE)
    public final MediaResourceCharted charted;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 6, tag = 6)
    public final String description;

    @WireField(adapter = "gen.model.MediaResourceDisplay#ADAPTER", schemaIndex = 20, tag = 26)
    public final MediaResourceDisplay display;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 3, tag = 4)
    public final String domain;

    @WireField(adapter = "gen.model.MediaResourceExternalLink#ADAPTER", schemaIndex = 7, tag = PhotoshopDirectory.TAG_XML)
    public final MediaResourceExternalLink external_link;

    @WireField(adapter = "gen.model.MediaResourceGist#ADAPTER", schemaIndex = 11, tag = 1004)
    public final MediaResourceGist gist;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 2, tag = 3)
    public final String href;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 10, tag = 8)
    public final Integer iframe_height;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 12, tag = 9)
    public final String iframe_src;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 8, tag = 7)
    public final Integer iframe_width;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 0, tag = 1)
    public final String media_resource_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 1, tag = 2)
    public final String media_resource_type;

    @WireField(adapter = "gen.model.MediaResourceMediumCatalog#ADAPTER", schemaIndex = 19, tag = PhotoshopDirectory.TAG_BACKGROUND_COLOR)
    public final MediaResourceMediumCatalog medium_catalog;

    @WireField(adapter = "gen.model.MediaResourceMediumCollection#ADAPTER", schemaIndex = 17, tag = PhotoshopDirectory.TAG_CAPTION)
    public final MediaResourceMediumCollection medium_collection;

    @WireField(adapter = "gen.model.MediaResourceMediumPost#ADAPTER", schemaIndex = 5, tag = PhotoshopDirectory.TAG_MAC_PRINT_INFO)
    public final MediaResourceMediumPost medium_post;

    @WireField(adapter = "gen.model.MediaResourceMediumQuote#ADAPTER", schemaIndex = 23, tag = PhotoshopDirectory.TAG_ALPHA_CHANNELS)
    public final MediaResourceMediumQuote medium_quote;

    @WireField(adapter = "gen.model.MediaResourceMoment#ADAPTER", schemaIndex = 24, tag = PhotoshopDirectory.TAG_BORDER_INFORMATION)
    public final MediaResourceMoment moment;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 26, tag = 33)
    public final String provider_name;

    @WireField(adapter = "gen.model.MediaResourceSuper#ADAPTER", schemaIndex = 13, tag = PhotoshopDirectory.TAG_RESOLUTION_INFO)
    public final MediaResourceSuper super_me;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 25, tag = 32)
    public final String surrogate_post_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 18, tag = 25)
    public final Integer thumbnail_height;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 21, tag = 28)
    public final String thumbnail_image_id;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 14, tag = 23)
    public final String thumbnail_url;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#INT32", schemaIndex = 16, tag = 24)
    public final Integer thumbnail_width;

    @WireField(adapter = "com.squareup.wire.ProtoAdapter#STRING", schemaIndex = 4, tag = 5)
    public final String title;

    @WireField(adapter = "gen.model.MediaResourceTweet#ADAPTER", schemaIndex = 9, tag = PhotoshopDirectory.TAG_INDEXED_COLOR_TABLE)
    public final MediaResourceTweet tweet;

    static {
        final FieldEncoding fieldEncoding = FieldEncoding.LENGTH_DELIMITED;
        final wg6 wg6VarB = n1b.a.b(MediaResource.class);
        final Syntax syntax = Syntax.PROTO_2;
        ProtoAdapter<MediaResource> protoAdapter = new ProtoAdapter<MediaResource>(fieldEncoding, wg6VarB, syntax) { // from class: gen.model.MediaResource$Companion$ADAPTER$1
            /* JADX WARN: Can't rename method to resolve collision */
            /* JADX WARN: Failed to find 'out' block for switch in B:10:0x004a. Please report as an issue. */
            /* JADX WARN: Failed to find 'out' block for switch in B:8:0x0044. Please report as an issue. */
            /* JADX WARN: Failed to find 'out' block for switch in B:9:0x0047. Please report as an issue. */
            @Override // com.squareup.wire.ProtoAdapter
            public final MediaResource decode(ProtoReader reader) {
                String strDecode;
                String str;
                String str2;
                String str3;
                reader.getClass();
                long jBeginMessage = reader.beginMessage();
                String str4 = null;
                String strDecode2 = null;
                String strDecode3 = null;
                String strDecode4 = null;
                String strDecode5 = null;
                MediaResourceMediumPost mediaResourceMediumPostDecode = null;
                String strDecode6 = null;
                MediaResourceExternalLink mediaResourceExternalLinkDecode = null;
                Integer numDecode = null;
                MediaResourceTweet mediaResourceTweetDecode = null;
                Integer numDecode2 = null;
                MediaResourceGist mediaResourceGistDecode = null;
                String strDecode7 = null;
                MediaResourceSuper mediaResourceSuperDecode = null;
                String strDecode8 = null;
                MediaResourceCharted mediaResourceChartedDecode = null;
                Integer numDecode3 = null;
                MediaResourceMediumCollection mediaResourceMediumCollectionDecode = null;
                Integer numDecode4 = null;
                MediaResourceMediumCatalog mediaResourceMediumCatalogDecode = null;
                MediaResourceDisplay mediaResourceDisplayDecode = null;
                String strDecode9 = null;
                String strDecode10 = null;
                MediaResourceMediumQuote mediaResourceMediumQuoteDecode = null;
                MediaResourceMoment mediaResourceMomentDecode = null;
                String strDecode11 = null;
                String strDecode12 = null;
                while (true) {
                    int iNextTag = reader.nextTag();
                    if (iNextTag == -1) {
                        return new MediaResource(str4, strDecode2, strDecode3, strDecode4, strDecode5, mediaResourceMediumPostDecode, strDecode6, mediaResourceExternalLinkDecode, numDecode, mediaResourceTweetDecode, numDecode2, mediaResourceGistDecode, strDecode7, mediaResourceSuperDecode, strDecode8, mediaResourceChartedDecode, numDecode3, mediaResourceMediumCollectionDecode, numDecode4, mediaResourceMediumCatalogDecode, mediaResourceDisplayDecode, strDecode9, strDecode10, mediaResourceMediumQuoteDecode, mediaResourceMomentDecode, strDecode11, strDecode12, reader.endMessageAndGetUnknownFields(jBeginMessage));
                    }
                    if (iNextTag != 28) {
                        switch (iNextTag) {
                            case 1:
                                strDecode = ProtoAdapter.STRING.decode(reader);
                                continue;
                                str4 = strDecode;
                                break;
                            case 2:
                                strDecode2 = ProtoAdapter.STRING.decode(reader);
                                break;
                            case 3:
                                strDecode3 = ProtoAdapter.STRING.decode(reader);
                                break;
                            case 4:
                                strDecode4 = ProtoAdapter.STRING.decode(reader);
                                break;
                            case 5:
                                strDecode5 = ProtoAdapter.STRING.decode(reader);
                                break;
                            case 6:
                                strDecode6 = ProtoAdapter.STRING.decode(reader);
                                break;
                            case 7:
                                numDecode = ProtoAdapter.INT32.decode(reader);
                                break;
                            case 8:
                                numDecode2 = ProtoAdapter.INT32.decode(reader);
                                break;
                            case 9:
                                strDecode7 = ProtoAdapter.STRING.decode(reader);
                                break;
                            default:
                                switch (iNextTag) {
                                    case 23:
                                        strDecode8 = ProtoAdapter.STRING.decode(reader);
                                        break;
                                    case 24:
                                        numDecode3 = ProtoAdapter.INT32.decode(reader);
                                        break;
                                    case 25:
                                        numDecode4 = ProtoAdapter.INT32.decode(reader);
                                        break;
                                    case 26:
                                        try {
                                            mediaResourceDisplayDecode = MediaResourceDisplay.ADAPTER.decode(reader);
                                        } catch (ProtoAdapter.EnumConstantNotFoundException e) {
                                            str = strDecode2;
                                            str2 = strDecode3;
                                            str3 = strDecode4;
                                            reader.addUnknownField(iNextTag, FieldEncoding.VARINT, Long.valueOf(e.value));
                                            strDecode = str4;
                                            strDecode2 = str;
                                            strDecode3 = str2;
                                            strDecode4 = str3;
                                        }
                                        break;
                                    default:
                                        switch (iNextTag) {
                                            case 31:
                                                strDecode10 = ProtoAdapter.STRING.decode(reader);
                                                break;
                                            case 32:
                                                strDecode11 = ProtoAdapter.STRING.decode(reader);
                                                break;
                                            case 33:
                                                strDecode12 = ProtoAdapter.STRING.decode(reader);
                                                break;
                                            default:
                                                switch (iNextTag) {
                                                    case PhotoshopDirectory.TAG_MAC_PRINT_INFO /* 1001 */:
                                                        mediaResourceMediumPostDecode = MediaResourceMediumPost.ADAPTER.decode(reader);
                                                        break;
                                                    case PhotoshopDirectory.TAG_XML /* 1002 */:
                                                        mediaResourceExternalLinkDecode = MediaResourceExternalLink.ADAPTER.decode(reader);
                                                        break;
                                                    case PhotoshopDirectory.TAG_INDEXED_COLOR_TABLE /* 1003 */:
                                                        mediaResourceTweetDecode = MediaResourceTweet.ADAPTER.decode(reader);
                                                        break;
                                                    case 1004:
                                                        mediaResourceGistDecode = MediaResourceGist.ADAPTER.decode(reader);
                                                        break;
                                                    case PhotoshopDirectory.TAG_RESOLUTION_INFO /* 1005 */:
                                                        mediaResourceSuperDecode = MediaResourceSuper.ADAPTER.decode(reader);
                                                        break;
                                                    case PhotoshopDirectory.TAG_ALPHA_CHANNELS /* 1006 */:
                                                        mediaResourceMediumQuoteDecode = MediaResourceMediumQuote.ADAPTER.decode(reader);
                                                        break;
                                                    case PhotoshopDirectory.TAG_DISPLAY_INFO_OBSOLETE /* 1007 */:
                                                        mediaResourceChartedDecode = MediaResourceCharted.ADAPTER.decode(reader);
                                                        break;
                                                    case PhotoshopDirectory.TAG_CAPTION /* 1008 */:
                                                        mediaResourceMediumCollectionDecode = MediaResourceMediumCollection.ADAPTER.decode(reader);
                                                        break;
                                                    case PhotoshopDirectory.TAG_BORDER_INFORMATION /* 1009 */:
                                                        mediaResourceMomentDecode = MediaResourceMoment.ADAPTER.decode(reader);
                                                        break;
                                                    case PhotoshopDirectory.TAG_BACKGROUND_COLOR /* 1010 */:
                                                        mediaResourceMediumCatalogDecode = MediaResourceMediumCatalog.ADAPTER.decode(reader);
                                                        break;
                                                    default:
                                                        reader.readUnknownField(iNextTag);
                                                        str = strDecode2;
                                                        str2 = strDecode3;
                                                        str3 = strDecode4;
                                                        strDecode = str4;
                                                        strDecode2 = str;
                                                        strDecode3 = str2;
                                                        strDecode4 = str3;
                                                        break;
                                                }
                                                break;
                                        }
                                        break;
                                }
                                str4 = strDecode;
                                break;
                        }
                    } else {
                        strDecode9 = ProtoAdapter.STRING.decode(reader);
                    }
                    strDecode = str4;
                    str4 = strDecode;
                }
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ProtoWriter writer, MediaResource value) {
                writer.getClass();
                value.getClass();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 1, value.media_resource_id);
                protoAdapter2.encodeWithTag(writer, 2, value.media_resource_type);
                protoAdapter2.encodeWithTag(writer, 3, value.href);
                protoAdapter2.encodeWithTag(writer, 4, value.domain);
                protoAdapter2.encodeWithTag(writer, 5, value.title);
                protoAdapter2.encodeWithTag(writer, 6, value.description);
                ProtoAdapter<Integer> protoAdapter3 = ProtoAdapter.INT32;
                protoAdapter3.encodeWithTag(writer, 7, value.iframe_width);
                protoAdapter3.encodeWithTag(writer, 8, value.iframe_height);
                protoAdapter2.encodeWithTag(writer, 9, value.iframe_src);
                protoAdapter2.encodeWithTag(writer, 23, value.thumbnail_url);
                protoAdapter3.encodeWithTag(writer, 24, value.thumbnail_width);
                protoAdapter3.encodeWithTag(writer, 25, value.thumbnail_height);
                MediaResourceDisplay.ADAPTER.encodeWithTag(writer, 26, value.display);
                protoAdapter2.encodeWithTag(writer, 28, value.thumbnail_image_id);
                protoAdapter2.encodeWithTag(writer, 31, value.author_name);
                protoAdapter2.encodeWithTag(writer, 32, value.surrogate_post_id);
                protoAdapter2.encodeWithTag(writer, 33, value.provider_name);
                MediaResourceMediumPost.ADAPTER.encodeWithTag(writer, PhotoshopDirectory.TAG_MAC_PRINT_INFO, value.medium_post);
                MediaResourceExternalLink.ADAPTER.encodeWithTag(writer, PhotoshopDirectory.TAG_XML, value.external_link);
                MediaResourceTweet.ADAPTER.encodeWithTag(writer, PhotoshopDirectory.TAG_INDEXED_COLOR_TABLE, value.tweet);
                MediaResourceGist.ADAPTER.encodeWithTag(writer, 1004, value.gist);
                MediaResourceSuper.ADAPTER.encodeWithTag(writer, PhotoshopDirectory.TAG_RESOLUTION_INFO, value.super_me);
                MediaResourceCharted.ADAPTER.encodeWithTag(writer, PhotoshopDirectory.TAG_DISPLAY_INFO_OBSOLETE, value.charted);
                MediaResourceMediumCollection.ADAPTER.encodeWithTag(writer, PhotoshopDirectory.TAG_CAPTION, value.medium_collection);
                MediaResourceMediumCatalog.ADAPTER.encodeWithTag(writer, PhotoshopDirectory.TAG_BACKGROUND_COLOR, value.medium_catalog);
                MediaResourceMediumQuote.ADAPTER.encodeWithTag(writer, PhotoshopDirectory.TAG_ALPHA_CHANNELS, value.medium_quote);
                MediaResourceMoment.ADAPTER.encodeWithTag(writer, PhotoshopDirectory.TAG_BORDER_INFORMATION, value.moment);
                writer.writeBytes(value.unknownFields());
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final int encodedSize(MediaResource value) {
                value.getClass();
                int iE = value.unknownFields().e();
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                int iEncodedSizeWithTag = MediaResourceExternalLink.ADAPTER.encodedSizeWithTag(PhotoshopDirectory.TAG_XML, value.external_link) + protoAdapter2.encodedSizeWithTag(6, value.description) + MediaResourceMediumPost.ADAPTER.encodedSizeWithTag(PhotoshopDirectory.TAG_MAC_PRINT_INFO, value.medium_post) + protoAdapter2.encodedSizeWithTag(5, value.title) + protoAdapter2.encodedSizeWithTag(4, value.domain) + protoAdapter2.encodedSizeWithTag(3, value.href) + protoAdapter2.encodedSizeWithTag(2, value.media_resource_type) + protoAdapter2.encodedSizeWithTag(1, value.media_resource_id) + iE;
                ProtoAdapter<Integer> protoAdapter3 = ProtoAdapter.INT32;
                return protoAdapter2.encodedSizeWithTag(33, value.provider_name) + protoAdapter2.encodedSizeWithTag(32, value.surrogate_post_id) + MediaResourceMoment.ADAPTER.encodedSizeWithTag(PhotoshopDirectory.TAG_BORDER_INFORMATION, value.moment) + MediaResourceMediumQuote.ADAPTER.encodedSizeWithTag(PhotoshopDirectory.TAG_ALPHA_CHANNELS, value.medium_quote) + protoAdapter2.encodedSizeWithTag(31, value.author_name) + protoAdapter2.encodedSizeWithTag(28, value.thumbnail_image_id) + MediaResourceDisplay.ADAPTER.encodedSizeWithTag(26, value.display) + MediaResourceMediumCatalog.ADAPTER.encodedSizeWithTag(PhotoshopDirectory.TAG_BACKGROUND_COLOR, value.medium_catalog) + protoAdapter3.encodedSizeWithTag(25, value.thumbnail_height) + MediaResourceMediumCollection.ADAPTER.encodedSizeWithTag(PhotoshopDirectory.TAG_CAPTION, value.medium_collection) + protoAdapter3.encodedSizeWithTag(24, value.thumbnail_width) + MediaResourceCharted.ADAPTER.encodedSizeWithTag(PhotoshopDirectory.TAG_DISPLAY_INFO_OBSOLETE, value.charted) + protoAdapter2.encodedSizeWithTag(23, value.thumbnail_url) + MediaResourceSuper.ADAPTER.encodedSizeWithTag(PhotoshopDirectory.TAG_RESOLUTION_INFO, value.super_me) + protoAdapter2.encodedSizeWithTag(9, value.iframe_src) + MediaResourceGist.ADAPTER.encodedSizeWithTag(1004, value.gist) + protoAdapter3.encodedSizeWithTag(8, value.iframe_height) + MediaResourceTweet.ADAPTER.encodedSizeWithTag(PhotoshopDirectory.TAG_INDEXED_COLOR_TABLE, value.tweet) + protoAdapter3.encodedSizeWithTag(7, value.iframe_width) + iEncodedSizeWithTag;
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final MediaResource redact(MediaResource value) {
                value.getClass();
                MediaResourceMediumPost mediaResourceMediumPost = value.medium_post;
                MediaResourceMediumPost mediaResourceMediumPostRedact = mediaResourceMediumPost != null ? MediaResourceMediumPost.ADAPTER.redact(mediaResourceMediumPost) : null;
                MediaResourceExternalLink mediaResourceExternalLink = value.external_link;
                MediaResourceExternalLink mediaResourceExternalLinkRedact = mediaResourceExternalLink != null ? MediaResourceExternalLink.ADAPTER.redact(mediaResourceExternalLink) : null;
                MediaResourceTweet mediaResourceTweet = value.tweet;
                MediaResourceTweet mediaResourceTweetRedact = mediaResourceTweet != null ? MediaResourceTweet.ADAPTER.redact(mediaResourceTweet) : null;
                MediaResourceGist mediaResourceGist = value.gist;
                MediaResourceGist mediaResourceGistRedact = mediaResourceGist != null ? MediaResourceGist.ADAPTER.redact(mediaResourceGist) : null;
                MediaResourceSuper mediaResourceSuper = value.super_me;
                MediaResourceSuper mediaResourceSuperRedact = mediaResourceSuper != null ? MediaResourceSuper.ADAPTER.redact(mediaResourceSuper) : null;
                MediaResourceCharted mediaResourceCharted = value.charted;
                MediaResourceCharted mediaResourceChartedRedact = mediaResourceCharted != null ? MediaResourceCharted.ADAPTER.redact(mediaResourceCharted) : null;
                MediaResourceMediumCollection mediaResourceMediumCollection = value.medium_collection;
                MediaResourceMediumCollection mediaResourceMediumCollectionRedact = mediaResourceMediumCollection != null ? MediaResourceMediumCollection.ADAPTER.redact(mediaResourceMediumCollection) : null;
                MediaResourceMediumCatalog mediaResourceMediumCatalog = value.medium_catalog;
                MediaResourceMediumCatalog mediaResourceMediumCatalogRedact = mediaResourceMediumCatalog != null ? MediaResourceMediumCatalog.ADAPTER.redact(mediaResourceMediumCatalog) : null;
                MediaResourceMediumQuote mediaResourceMediumQuote = value.medium_quote;
                MediaResourceMediumQuote mediaResourceMediumQuoteRedact = mediaResourceMediumQuote != null ? MediaResourceMediumQuote.ADAPTER.redact(mediaResourceMediumQuote) : null;
                MediaResourceMoment mediaResourceMoment = value.moment;
                return value.copy((108352863 & 1) != 0 ? value.media_resource_id : null, (108352863 & 2) != 0 ? value.media_resource_type : null, (108352863 & 4) != 0 ? value.href : null, (108352863 & 8) != 0 ? value.domain : null, (108352863 & 16) != 0 ? value.title : null, (108352863 & 32) != 0 ? value.medium_post : mediaResourceMediumPostRedact, (108352863 & 64) != 0 ? value.description : null, (108352863 & 128) != 0 ? value.external_link : mediaResourceExternalLinkRedact, (108352863 & 256) != 0 ? value.iframe_width : null, (108352863 & 512) != 0 ? value.tweet : mediaResourceTweetRedact, (108352863 & 1024) != 0 ? value.iframe_height : null, (108352863 & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? value.gist : mediaResourceGistRedact, (108352863 & 4096) != 0 ? value.iframe_src : null, (108352863 & 8192) != 0 ? value.super_me : mediaResourceSuperRedact, (108352863 & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? value.thumbnail_url : null, (108352863 & 32768) != 0 ? value.charted : mediaResourceChartedRedact, (108352863 & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? value.thumbnail_width : null, (108352863 & 131072) != 0 ? value.medium_collection : mediaResourceMediumCollectionRedact, (108352863 & 262144) != 0 ? value.thumbnail_height : null, (108352863 & 524288) != 0 ? value.medium_catalog : mediaResourceMediumCatalogRedact, (108352863 & 1048576) != 0 ? value.display : null, (108352863 & 2097152) != 0 ? value.thumbnail_image_id : null, (108352863 & 4194304) != 0 ? value.author_name : null, (108352863 & 8388608) != 0 ? value.medium_quote : mediaResourceMediumQuoteRedact, (108352863 & 16777216) != 0 ? value.moment : mediaResourceMoment != null ? MediaResourceMoment.ADAPTER.redact(mediaResourceMoment) : null, (108352863 & 33554432) != 0 ? value.surrogate_post_id : null, (108352863 & 67108864) != 0 ? value.provider_name : null, (108352863 & 134217728) != 0 ? value.unknownFields() : h21.d);
            }

            @Override // com.squareup.wire.ProtoAdapter
            public final void encode(ReverseProtoWriter writer, MediaResource value) {
                writer.getClass();
                value.getClass();
                writer.writeBytes(value.unknownFields());
                MediaResourceMoment.ADAPTER.encodeWithTag(writer, PhotoshopDirectory.TAG_BORDER_INFORMATION, value.moment);
                MediaResourceMediumQuote.ADAPTER.encodeWithTag(writer, PhotoshopDirectory.TAG_ALPHA_CHANNELS, value.medium_quote);
                MediaResourceMediumCatalog.ADAPTER.encodeWithTag(writer, PhotoshopDirectory.TAG_BACKGROUND_COLOR, value.medium_catalog);
                MediaResourceMediumCollection.ADAPTER.encodeWithTag(writer, PhotoshopDirectory.TAG_CAPTION, value.medium_collection);
                MediaResourceCharted.ADAPTER.encodeWithTag(writer, PhotoshopDirectory.TAG_DISPLAY_INFO_OBSOLETE, value.charted);
                MediaResourceSuper.ADAPTER.encodeWithTag(writer, PhotoshopDirectory.TAG_RESOLUTION_INFO, value.super_me);
                MediaResourceGist.ADAPTER.encodeWithTag(writer, 1004, value.gist);
                MediaResourceTweet.ADAPTER.encodeWithTag(writer, PhotoshopDirectory.TAG_INDEXED_COLOR_TABLE, value.tweet);
                MediaResourceExternalLink.ADAPTER.encodeWithTag(writer, PhotoshopDirectory.TAG_XML, value.external_link);
                MediaResourceMediumPost.ADAPTER.encodeWithTag(writer, PhotoshopDirectory.TAG_MAC_PRINT_INFO, value.medium_post);
                ProtoAdapter<String> protoAdapter2 = ProtoAdapter.STRING;
                protoAdapter2.encodeWithTag(writer, 33, value.provider_name);
                protoAdapter2.encodeWithTag(writer, 32, value.surrogate_post_id);
                protoAdapter2.encodeWithTag(writer, 31, value.author_name);
                protoAdapter2.encodeWithTag(writer, 28, value.thumbnail_image_id);
                MediaResourceDisplay.ADAPTER.encodeWithTag(writer, 26, value.display);
                ProtoAdapter<Integer> protoAdapter3 = ProtoAdapter.INT32;
                protoAdapter3.encodeWithTag(writer, 25, value.thumbnail_height);
                protoAdapter3.encodeWithTag(writer, 24, value.thumbnail_width);
                protoAdapter2.encodeWithTag(writer, 23, value.thumbnail_url);
                protoAdapter2.encodeWithTag(writer, 9, value.iframe_src);
                protoAdapter3.encodeWithTag(writer, 8, value.iframe_height);
                protoAdapter3.encodeWithTag(writer, 7, value.iframe_width);
                protoAdapter2.encodeWithTag(writer, 6, value.description);
                protoAdapter2.encodeWithTag(writer, 5, value.title);
                protoAdapter2.encodeWithTag(writer, 4, value.domain);
                protoAdapter2.encodeWithTag(writer, 3, value.href);
                protoAdapter2.encodeWithTag(writer, 2, value.media_resource_type);
                protoAdapter2.encodeWithTag(writer, 1, value.media_resource_id);
            }
        };
        ADAPTER = protoAdapter;
        CREATOR = AndroidMessage.INSTANCE.newCreator(protoAdapter);
    }

    public /* synthetic */ MediaResource(String str, String str2, String str3, String str4, String str5, MediaResourceMediumPost mediaResourceMediumPost, String str6, MediaResourceExternalLink mediaResourceExternalLink, Integer num, MediaResourceTweet mediaResourceTweet, Integer num2, MediaResourceGist mediaResourceGist, String str7, MediaResourceSuper mediaResourceSuper, String str8, MediaResourceCharted mediaResourceCharted, Integer num3, MediaResourceMediumCollection mediaResourceMediumCollection, Integer num4, MediaResourceMediumCatalog mediaResourceMediumCatalog, MediaResourceDisplay mediaResourceDisplay, String str9, String str10, MediaResourceMediumQuote mediaResourceMediumQuote, MediaResourceMoment mediaResourceMoment, String str11, String str12, h21 h21Var, int i, gy2 gy2Var) {
        this((i & 1) != 0 ? null : str, (i & 2) != 0 ? null : str2, (i & 4) != 0 ? null : str3, (i & 8) != 0 ? null : str4, (i & 16) != 0 ? null : str5, (i & 32) != 0 ? null : mediaResourceMediumPost, (i & 64) != 0 ? null : str6, (i & 128) != 0 ? null : mediaResourceExternalLink, (i & 256) != 0 ? null : num, (i & 512) != 0 ? null : mediaResourceTweet, (i & 1024) != 0 ? null : num2, (i & RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH) != 0 ? null : mediaResourceGist, (i & 4096) != 0 ? null : str7, (i & 8192) != 0 ? null : mediaResourceSuper, (i & OlympusMakernoteDirectory.TAG_MAIN_INFO) != 0 ? null : str8, (i & 32768) != 0 ? null : mediaResourceCharted, (i & ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID) != 0 ? null : num3, (i & 131072) != 0 ? null : mediaResourceMediumCollection, (i & 262144) != 0 ? null : num4, (i & 524288) != 0 ? null : mediaResourceMediumCatalog, (i & 1048576) != 0 ? null : mediaResourceDisplay, (i & 2097152) != 0 ? null : str9, (i & 4194304) != 0 ? null : str10, (i & 8388608) != 0 ? null : mediaResourceMediumQuote, (i & 16777216) != 0 ? null : mediaResourceMoment, (i & 33554432) != 0 ? null : str11, (i & 67108864) != 0 ? null : str12, (i & 134217728) != 0 ? h21.d : h21Var);
    }

    public final MediaResource copy(String media_resource_id, String media_resource_type, String href, String domain, String title, MediaResourceMediumPost medium_post, String description, MediaResourceExternalLink external_link, Integer iframe_width, MediaResourceTweet tweet, Integer iframe_height, MediaResourceGist gist, String iframe_src, MediaResourceSuper super_me, String thumbnail_url, MediaResourceCharted charted, Integer thumbnail_width, MediaResourceMediumCollection medium_collection, Integer thumbnail_height, MediaResourceMediumCatalog medium_catalog, MediaResourceDisplay display, String thumbnail_image_id, String author_name, MediaResourceMediumQuote medium_quote, MediaResourceMoment moment, String surrogate_post_id, String provider_name, h21 unknownFields) {
        unknownFields.getClass();
        return new MediaResource(media_resource_id, media_resource_type, href, domain, title, medium_post, description, external_link, iframe_width, tweet, iframe_height, gist, iframe_src, super_me, thumbnail_url, charted, thumbnail_width, medium_collection, thumbnail_height, medium_catalog, display, thumbnail_image_id, author_name, medium_quote, moment, surrogate_post_id, provider_name, unknownFields);
    }

    public final boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof MediaResource)) {
            return false;
        }
        MediaResource mediaResource = (MediaResource) other;
        return g76.L(unknownFields(), mediaResource.unknownFields()) && g76.L(this.media_resource_id, mediaResource.media_resource_id) && g76.L(this.media_resource_type, mediaResource.media_resource_type) && g76.L(this.href, mediaResource.href) && g76.L(this.domain, mediaResource.domain) && g76.L(this.title, mediaResource.title) && g76.L(this.medium_post, mediaResource.medium_post) && g76.L(this.description, mediaResource.description) && g76.L(this.external_link, mediaResource.external_link) && g76.L(this.iframe_width, mediaResource.iframe_width) && g76.L(this.tweet, mediaResource.tweet) && g76.L(this.iframe_height, mediaResource.iframe_height) && g76.L(this.gist, mediaResource.gist) && g76.L(this.iframe_src, mediaResource.iframe_src) && g76.L(this.super_me, mediaResource.super_me) && g76.L(this.thumbnail_url, mediaResource.thumbnail_url) && g76.L(this.charted, mediaResource.charted) && g76.L(this.thumbnail_width, mediaResource.thumbnail_width) && g76.L(this.medium_collection, mediaResource.medium_collection) && g76.L(this.thumbnail_height, mediaResource.thumbnail_height) && g76.L(this.medium_catalog, mediaResource.medium_catalog) && this.display == mediaResource.display && g76.L(this.thumbnail_image_id, mediaResource.thumbnail_image_id) && g76.L(this.author_name, mediaResource.author_name) && g76.L(this.medium_quote, mediaResource.medium_quote) && g76.L(this.moment, mediaResource.moment) && g76.L(this.surrogate_post_id, mediaResource.surrogate_post_id) && g76.L(this.provider_name, mediaResource.provider_name);
    }

    public final int hashCode() {
        int i = this.hashCode;
        if (i != 0) {
            return i;
        }
        int iHashCode = unknownFields().hashCode() * 37;
        String str = this.media_resource_id;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 37;
        String str2 = this.media_resource_type;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 37;
        String str3 = this.href;
        int iHashCode4 = (iHashCode3 + (str3 != null ? str3.hashCode() : 0)) * 37;
        String str4 = this.domain;
        int iHashCode5 = (iHashCode4 + (str4 != null ? str4.hashCode() : 0)) * 37;
        String str5 = this.title;
        int iHashCode6 = (iHashCode5 + (str5 != null ? str5.hashCode() : 0)) * 37;
        MediaResourceMediumPost mediaResourceMediumPost = this.medium_post;
        int iHashCode7 = (iHashCode6 + (mediaResourceMediumPost != null ? mediaResourceMediumPost.hashCode() : 0)) * 37;
        String str6 = this.description;
        int iHashCode8 = (iHashCode7 + (str6 != null ? str6.hashCode() : 0)) * 37;
        MediaResourceExternalLink mediaResourceExternalLink = this.external_link;
        int iHashCode9 = (iHashCode8 + (mediaResourceExternalLink != null ? mediaResourceExternalLink.hashCode() : 0)) * 37;
        Integer num = this.iframe_width;
        int iIntValue = (iHashCode9 + (num != null ? num.intValue() : 0)) * 37;
        MediaResourceTweet mediaResourceTweet = this.tweet;
        int iHashCode10 = (iIntValue + (mediaResourceTweet != null ? mediaResourceTweet.hashCode() : 0)) * 37;
        Integer num2 = this.iframe_height;
        int iIntValue2 = (iHashCode10 + (num2 != null ? num2.intValue() : 0)) * 37;
        MediaResourceGist mediaResourceGist = this.gist;
        int iHashCode11 = (iIntValue2 + (mediaResourceGist != null ? mediaResourceGist.hashCode() : 0)) * 37;
        String str7 = this.iframe_src;
        int iHashCode12 = (iHashCode11 + (str7 != null ? str7.hashCode() : 0)) * 37;
        MediaResourceSuper mediaResourceSuper = this.super_me;
        int iHashCode13 = (iHashCode12 + (mediaResourceSuper != null ? mediaResourceSuper.hashCode() : 0)) * 37;
        String str8 = this.thumbnail_url;
        int iHashCode14 = (iHashCode13 + (str8 != null ? str8.hashCode() : 0)) * 37;
        MediaResourceCharted mediaResourceCharted = this.charted;
        int iHashCode15 = (iHashCode14 + (mediaResourceCharted != null ? mediaResourceCharted.hashCode() : 0)) * 37;
        Integer num3 = this.thumbnail_width;
        int iIntValue3 = (iHashCode15 + (num3 != null ? num3.intValue() : 0)) * 37;
        MediaResourceMediumCollection mediaResourceMediumCollection = this.medium_collection;
        int iHashCode16 = (iIntValue3 + (mediaResourceMediumCollection != null ? mediaResourceMediumCollection.hashCode() : 0)) * 37;
        Integer num4 = this.thumbnail_height;
        int iIntValue4 = (iHashCode16 + (num4 != null ? num4.intValue() : 0)) * 37;
        MediaResourceMediumCatalog mediaResourceMediumCatalog = this.medium_catalog;
        int iHashCode17 = (iIntValue4 + (mediaResourceMediumCatalog != null ? mediaResourceMediumCatalog.hashCode() : 0)) * 37;
        MediaResourceDisplay mediaResourceDisplay = this.display;
        int iHashCode18 = (iHashCode17 + (mediaResourceDisplay != null ? mediaResourceDisplay.hashCode() : 0)) * 37;
        String str9 = this.thumbnail_image_id;
        int iHashCode19 = (iHashCode18 + (str9 != null ? str9.hashCode() : 0)) * 37;
        String str10 = this.author_name;
        int iHashCode20 = (iHashCode19 + (str10 != null ? str10.hashCode() : 0)) * 37;
        MediaResourceMediumQuote mediaResourceMediumQuote = this.medium_quote;
        int iHashCode21 = (iHashCode20 + (mediaResourceMediumQuote != null ? mediaResourceMediumQuote.hashCode() : 0)) * 37;
        MediaResourceMoment mediaResourceMoment = this.moment;
        int iHashCode22 = (iHashCode21 + (mediaResourceMoment != null ? mediaResourceMoment.hashCode() : 0)) * 37;
        String str11 = this.surrogate_post_id;
        int iHashCode23 = (iHashCode22 + (str11 != null ? str11.hashCode() : 0)) * 37;
        String str12 = this.provider_name;
        int iHashCode24 = iHashCode23 + (str12 != null ? str12.hashCode() : 0);
        this.hashCode = iHashCode24;
        return iHashCode24;
    }

    @Override // com.squareup.wire.Message
    public final xl7 newBuilder() {
        xl7 xl7Var = new xl7();
        xl7Var.a = this.media_resource_id;
        xl7Var.b = this.media_resource_type;
        xl7Var.c = this.href;
        xl7Var.d = this.domain;
        xl7Var.e = this.title;
        xl7Var.f = this.medium_post;
        xl7Var.g = this.description;
        xl7Var.h = this.external_link;
        xl7Var.i = this.iframe_width;
        xl7Var.j = this.tweet;
        xl7Var.k = this.iframe_height;
        xl7Var.l = this.gist;
        xl7Var.m = this.iframe_src;
        xl7Var.n = this.super_me;
        xl7Var.o = this.thumbnail_url;
        xl7Var.p = this.charted;
        xl7Var.q = this.thumbnail_width;
        xl7Var.r = this.medium_collection;
        xl7Var.s = this.thumbnail_height;
        xl7Var.t = this.medium_catalog;
        xl7Var.u = this.display;
        xl7Var.v = this.thumbnail_image_id;
        xl7Var.w = this.author_name;
        xl7Var.x = this.medium_quote;
        xl7Var.y = this.moment;
        xl7Var.z = this.surrogate_post_id;
        xl7Var.A = this.provider_name;
        xl7Var.addUnknownFields(unknownFields());
        return xl7Var;
    }

    @Override // com.squareup.wire.Message
    public final String toString() {
        ArrayList arrayList = new ArrayList();
        String str = this.media_resource_id;
        if (str != null) {
            lv8.D(str, "media_resource_id=", arrayList);
        }
        String str2 = this.media_resource_type;
        if (str2 != null) {
            lv8.D(str2, "media_resource_type=", arrayList);
        }
        String str3 = this.href;
        if (str3 != null) {
            lv8.D(str3, "href=", arrayList);
        }
        String str4 = this.domain;
        if (str4 != null) {
            lv8.D(str4, "domain=", arrayList);
        }
        String str5 = this.title;
        if (str5 != null) {
            lv8.D(str5, "title=", arrayList);
        }
        MediaResourceMediumPost mediaResourceMediumPost = this.medium_post;
        if (mediaResourceMediumPost != null) {
            arrayList.add("medium_post=" + mediaResourceMediumPost);
        }
        String str6 = this.description;
        if (str6 != null) {
            lv8.D(str6, "description=", arrayList);
        }
        MediaResourceExternalLink mediaResourceExternalLink = this.external_link;
        if (mediaResourceExternalLink != null) {
            arrayList.add("external_link=" + mediaResourceExternalLink);
        }
        Integer num = this.iframe_width;
        if (num != null) {
            lv8.B("iframe_width=", num, arrayList);
        }
        MediaResourceTweet mediaResourceTweet = this.tweet;
        if (mediaResourceTweet != null) {
            arrayList.add("tweet=" + mediaResourceTweet);
        }
        Integer num2 = this.iframe_height;
        if (num2 != null) {
            lv8.B("iframe_height=", num2, arrayList);
        }
        MediaResourceGist mediaResourceGist = this.gist;
        if (mediaResourceGist != null) {
            arrayList.add("gist=" + mediaResourceGist);
        }
        String str7 = this.iframe_src;
        if (str7 != null) {
            lv8.D(str7, "iframe_src=", arrayList);
        }
        MediaResourceSuper mediaResourceSuper = this.super_me;
        if (mediaResourceSuper != null) {
            arrayList.add("super_me=" + mediaResourceSuper);
        }
        String str8 = this.thumbnail_url;
        if (str8 != null) {
            lv8.D(str8, "thumbnail_url=", arrayList);
        }
        MediaResourceCharted mediaResourceCharted = this.charted;
        if (mediaResourceCharted != null) {
            arrayList.add("charted=" + mediaResourceCharted);
        }
        Integer num3 = this.thumbnail_width;
        if (num3 != null) {
            lv8.B("thumbnail_width=", num3, arrayList);
        }
        MediaResourceMediumCollection mediaResourceMediumCollection = this.medium_collection;
        if (mediaResourceMediumCollection != null) {
            arrayList.add("medium_collection=" + mediaResourceMediumCollection);
        }
        Integer num4 = this.thumbnail_height;
        if (num4 != null) {
            lv8.B("thumbnail_height=", num4, arrayList);
        }
        MediaResourceMediumCatalog mediaResourceMediumCatalog = this.medium_catalog;
        if (mediaResourceMediumCatalog != null) {
            arrayList.add("medium_catalog=" + mediaResourceMediumCatalog);
        }
        MediaResourceDisplay mediaResourceDisplay = this.display;
        if (mediaResourceDisplay != null) {
            arrayList.add("display=" + mediaResourceDisplay);
        }
        String str9 = this.thumbnail_image_id;
        if (str9 != null) {
            lv8.D(str9, "thumbnail_image_id=", arrayList);
        }
        String str10 = this.author_name;
        if (str10 != null) {
            lv8.D(str10, "author_name=", arrayList);
        }
        MediaResourceMediumQuote mediaResourceMediumQuote = this.medium_quote;
        if (mediaResourceMediumQuote != null) {
            arrayList.add("medium_quote=" + mediaResourceMediumQuote);
        }
        MediaResourceMoment mediaResourceMoment = this.moment;
        if (mediaResourceMoment != null) {
            arrayList.add("moment=" + mediaResourceMoment);
        }
        String str11 = this.surrogate_post_id;
        if (str11 != null) {
            lv8.D(str11, "surrogate_post_id=", arrayList);
        }
        String str12 = this.provider_name;
        if (str12 != null) {
            lv8.D(str12, "provider_name=", arrayList);
        }
        return bu1.F0(arrayList, ", ", "MediaResource{", "}", null, 56);
    }

    public MediaResource() {
        this(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 268435455, null);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public MediaResource(String str, String str2, String str3, String str4, String str5, MediaResourceMediumPost mediaResourceMediumPost, String str6, MediaResourceExternalLink mediaResourceExternalLink, Integer num, MediaResourceTweet mediaResourceTweet, Integer num2, MediaResourceGist mediaResourceGist, String str7, MediaResourceSuper mediaResourceSuper, String str8, MediaResourceCharted mediaResourceCharted, Integer num3, MediaResourceMediumCollection mediaResourceMediumCollection, Integer num4, MediaResourceMediumCatalog mediaResourceMediumCatalog, MediaResourceDisplay mediaResourceDisplay, String str9, String str10, MediaResourceMediumQuote mediaResourceMediumQuote, MediaResourceMoment mediaResourceMoment, String str11, String str12, h21 h21Var) {
        super(ADAPTER, h21Var);
        h21Var.getClass();
        this.media_resource_id = str;
        this.media_resource_type = str2;
        this.href = str3;
        this.domain = str4;
        this.title = str5;
        this.medium_post = mediaResourceMediumPost;
        this.description = str6;
        this.external_link = mediaResourceExternalLink;
        this.iframe_width = num;
        this.tweet = mediaResourceTweet;
        this.iframe_height = num2;
        this.gist = mediaResourceGist;
        this.iframe_src = str7;
        this.super_me = mediaResourceSuper;
        this.thumbnail_url = str8;
        this.charted = mediaResourceCharted;
        this.thumbnail_width = num3;
        this.medium_collection = mediaResourceMediumCollection;
        this.thumbnail_height = num4;
        this.medium_catalog = mediaResourceMediumCatalog;
        this.display = mediaResourceDisplay;
        this.thumbnail_image_id = str9;
        this.author_name = str10;
        this.medium_quote = mediaResourceMediumQuote;
        this.moment = mediaResourceMoment;
        this.surrogate_post_id = str11;
        this.provider_name = str12;
    }

    public static /* synthetic */ void getProvider_name$annotations() {
    }

    public static /* synthetic */ void getSurrogate_post_id$annotations() {
    }
}
