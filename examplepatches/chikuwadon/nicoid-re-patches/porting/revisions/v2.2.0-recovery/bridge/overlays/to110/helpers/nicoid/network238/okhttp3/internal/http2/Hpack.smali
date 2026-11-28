.class public final Lnicoid/network238/okhttp3/internal/http2/Hpack;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/http2/Hpack$Reader;,
        Lnicoid/network238/okhttp3/internal/http2/Hpack$Writer;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0006\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0008\u00c6\u0002\u0018\u00002\u00020\u0001:\u0002\u0019\u001aB\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0014\u0010\u0016\u001a\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u00050\u0012H\u0002J\u000e\u0010\u0017\u001a\u00020\u00132\u0006\u0010\u0018\u001a\u00020\u0013R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000R\u0019\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\r0\u000c\u00a2\u0006\n\n\u0002\u0010\u0010\u001a\u0004\u0008\u000e\u0010\u000fR\u001d\u0010\u0011\u001a\u000e\u0012\u0004\u0012\u00020\u0013\u0012\u0004\u0012\u00020\u00050\u0012\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0014\u0010\u0015\u00a8\u0006\u001b"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http2/Hpack;",
        "",
        "<init>",
        "()V",
        "PREFIX_4_BITS",
        "",
        "PREFIX_5_BITS",
        "PREFIX_6_BITS",
        "PREFIX_7_BITS",
        "SETTINGS_HEADER_TABLE_SIZE",
        "SETTINGS_HEADER_TABLE_SIZE_LIMIT",
        "STATIC_HEADER_TABLE",
        "",
        "Lnicoid/network238/okhttp3/internal/http2/Header;",
        "getSTATIC_HEADER_TABLE",
        "()[Lnicoid/network238/okhttp3/internal/http2/Header;",
        "[Lnicoid/network238/okhttp3/internal/http2/Header;",
        "NAME_TO_FIRST_INDEX",
        "",
        "Lnicoid/network238/okio/ByteString;",
        "getNAME_TO_FIRST_INDEX",
        "()Ljava/util/Map;",
        "nameToFirstIndex",
        "checkLowercase",
        "name",
        "Reader",
        "Writer",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lnicoid/network238/okhttp3/internal/http2/Hpack;

.field private static final NAME_TO_FIRST_INDEX:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lnicoid/network238/okio/ByteString;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final PREFIX_4_BITS:I = 0xf

.field private static final PREFIX_5_BITS:I = 0x1f

.field private static final PREFIX_6_BITS:I = 0x3f

.field private static final PREFIX_7_BITS:I = 0x7f

.field private static final SETTINGS_HEADER_TABLE_SIZE:I = 0x1000

.field private static final SETTINGS_HEADER_TABLE_SIZE_LIMIT:I = 0x4000

.field private static final STATIC_HEADER_TABLE:[Lnicoid/network238/okhttp3/internal/http2/Header;


# direct methods
.method static constructor <clinit>()V
    .registers 64

    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Hpack;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/internal/http2/Hpack;-><init>()V

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/Hpack;->INSTANCE:Lnicoid/network238/okhttp3/internal/http2/Hpack;

    .line 60
    new-instance v1, Lnicoid/network238/okhttp3/internal/http2/Header;

    sget-object v2, Lnicoid/network238/okhttp3/internal/http2/Header;->TARGET_AUTHORITY:Lnicoid/network238/okio/ByteString;

    const-string v3, ""

    invoke-direct {v1, v2, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Lnicoid/network238/okio/ByteString;Ljava/lang/String;)V

    .line 61
    new-instance v2, Lnicoid/network238/okhttp3/internal/http2/Header;

    sget-object v4, Lnicoid/network238/okhttp3/internal/http2/Header;->TARGET_METHOD:Lnicoid/network238/okio/ByteString;

    const-string v5, "GET"

    invoke-direct {v2, v4, v5}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Lnicoid/network238/okio/ByteString;Ljava/lang/String;)V

    .line 62
    new-instance v5, Lnicoid/network238/okhttp3/internal/http2/Header;

    const-string v6, "POST"

    invoke-direct {v5, v4, v6}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Lnicoid/network238/okio/ByteString;Ljava/lang/String;)V

    .line 63
    new-instance v4, Lnicoid/network238/okhttp3/internal/http2/Header;

    sget-object v6, Lnicoid/network238/okhttp3/internal/http2/Header;->TARGET_PATH:Lnicoid/network238/okio/ByteString;

    const-string v7, "/"

    invoke-direct {v4, v6, v7}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Lnicoid/network238/okio/ByteString;Ljava/lang/String;)V

    .line 64
    new-instance v7, Lnicoid/network238/okhttp3/internal/http2/Header;

    const-string v8, "/index.html"

    invoke-direct {v7, v6, v8}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Lnicoid/network238/okio/ByteString;Ljava/lang/String;)V

    .line 65
    new-instance v6, Lnicoid/network238/okhttp3/internal/http2/Header;

    sget-object v8, Lnicoid/network238/okhttp3/internal/http2/Header;->TARGET_SCHEME:Lnicoid/network238/okio/ByteString;

    const-string v9, "http"

    invoke-direct {v6, v8, v9}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Lnicoid/network238/okio/ByteString;Ljava/lang/String;)V

    .line 66
    new-instance v9, Lnicoid/network238/okhttp3/internal/http2/Header;

    const-string v10, "https"

    invoke-direct {v9, v8, v10}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Lnicoid/network238/okio/ByteString;Ljava/lang/String;)V

    .line 67
    new-instance v8, Lnicoid/network238/okhttp3/internal/http2/Header;

    sget-object v10, Lnicoid/network238/okhttp3/internal/http2/Header;->RESPONSE_STATUS:Lnicoid/network238/okio/ByteString;

    const-string v11, "200"

    invoke-direct {v8, v10, v11}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Lnicoid/network238/okio/ByteString;Ljava/lang/String;)V

    .line 68
    new-instance v11, Lnicoid/network238/okhttp3/internal/http2/Header;

    const-string v12, "204"

    invoke-direct {v11, v10, v12}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Lnicoid/network238/okio/ByteString;Ljava/lang/String;)V

    .line 69
    new-instance v12, Lnicoid/network238/okhttp3/internal/http2/Header;

    const-string v13, "206"

    invoke-direct {v12, v10, v13}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Lnicoid/network238/okio/ByteString;Ljava/lang/String;)V

    .line 70
    new-instance v13, Lnicoid/network238/okhttp3/internal/http2/Header;

    const-string v14, "304"

    invoke-direct {v13, v10, v14}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Lnicoid/network238/okio/ByteString;Ljava/lang/String;)V

    .line 71
    new-instance v14, Lnicoid/network238/okhttp3/internal/http2/Header;

    const-string v15, "400"

    invoke-direct {v14, v10, v15}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Lnicoid/network238/okio/ByteString;Ljava/lang/String;)V

    .line 72
    new-instance v15, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v16, v0

    const-string v0, "404"

    invoke-direct {v15, v10, v0}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Lnicoid/network238/okio/ByteString;Ljava/lang/String;)V

    .line 73
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v17, v1

    const-string v1, "500"

    invoke-direct {v0, v10, v1}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Lnicoid/network238/okio/ByteString;Ljava/lang/String;)V

    .line 74
    new-instance v1, Lnicoid/network238/okhttp3/internal/http2/Header;

    const-string v10, "accept-charset"

    invoke-direct {v1, v10, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    new-instance v10, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v18, v0

    const-string v0, "accept-encoding"

    move-object/from16 v19, v1

    const-string v1, "gzip, deflate"

    invoke-direct {v10, v0, v1}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Header;

    const-string v1, "accept-language"

    invoke-direct {v0, v1, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    new-instance v1, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v20, v0

    const-string v0, "accept-ranges"

    invoke-direct {v1, v0, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v21, v1

    const-string v1, "accept"

    invoke-direct {v0, v1, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    new-instance v1, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v22, v0

    const-string v0, "access-control-allow-origin"

    invoke-direct {v1, v0, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v23, v1

    const-string v1, "age"

    invoke-direct {v0, v1, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    new-instance v1, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v24, v0

    const-string v0, "allow"

    invoke-direct {v1, v0, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v25, v1

    const-string v1, "authorization"

    invoke-direct {v0, v1, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    new-instance v1, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v26, v0

    const-string v0, "cache-control"

    invoke-direct {v1, v0, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v27, v1

    const-string v1, "content-disposition"

    invoke-direct {v0, v1, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    new-instance v1, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v28, v0

    const-string v0, "content-encoding"

    invoke-direct {v1, v0, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v29, v1

    const-string v1, "content-language"

    invoke-direct {v0, v1, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    new-instance v1, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v30, v0

    const-string v0, "content-length"

    invoke-direct {v1, v0, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v31, v1

    const-string v1, "content-location"

    invoke-direct {v0, v1, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    new-instance v1, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v32, v0

    const-string v0, "content-range"

    invoke-direct {v1, v0, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v33, v1

    const-string v1, "content-type"

    invoke-direct {v0, v1, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    new-instance v1, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v34, v0

    const-string v0, "cookie"

    invoke-direct {v1, v0, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v35, v1

    const-string v1, "date"

    invoke-direct {v0, v1, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    new-instance v1, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v36, v0

    const-string v0, "etag"

    invoke-direct {v1, v0, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v37, v1

    const-string v1, "expect"

    invoke-direct {v0, v1, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    new-instance v1, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v38, v0

    const-string v0, "expires"

    invoke-direct {v1, v0, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v39, v1

    const-string v1, "from"

    invoke-direct {v0, v1, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    new-instance v1, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v40, v0

    const-string v0, "host"

    invoke-direct {v1, v0, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v41, v1

    const-string v1, "if-match"

    invoke-direct {v0, v1, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    new-instance v1, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v42, v0

    const-string v0, "if-modified-since"

    invoke-direct {v1, v0, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v43, v1

    const-string v1, "if-none-match"

    invoke-direct {v0, v1, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    new-instance v1, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v44, v0

    const-string v0, "if-range"

    invoke-direct {v1, v0, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v45, v1

    const-string v1, "if-unmodified-since"

    invoke-direct {v0, v1, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    new-instance v1, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v46, v0

    const-string v0, "last-modified"

    invoke-direct {v1, v0, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v47, v1

    const-string v1, "link"

    invoke-direct {v0, v1, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    new-instance v1, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v48, v0

    const-string v0, "location"

    invoke-direct {v1, v0, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v49, v1

    const-string v1, "max-forwards"

    invoke-direct {v0, v1, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    new-instance v1, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v50, v0

    const-string v0, "proxy-authenticate"

    invoke-direct {v1, v0, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v51, v1

    const-string v1, "proxy-authorization"

    invoke-direct {v0, v1, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    new-instance v1, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v52, v0

    const-string v0, "range"

    invoke-direct {v1, v0, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v53, v1

    const-string v1, "referer"

    invoke-direct {v0, v1, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    new-instance v1, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v54, v0

    const-string v0, "refresh"

    invoke-direct {v1, v0, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v55, v1

    const-string v1, "retry-after"

    invoke-direct {v0, v1, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    new-instance v1, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v56, v0

    const-string v0, "server"

    invoke-direct {v1, v0, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v57, v1

    const-string v1, "set-cookie"

    invoke-direct {v0, v1, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    new-instance v1, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v58, v0

    const-string v0, "strict-transport-security"

    invoke-direct {v1, v0, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v59, v1

    const-string v1, "transfer-encoding"

    invoke-direct {v0, v1, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    new-instance v1, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v60, v0

    const-string v0, "user-agent"

    invoke-direct {v1, v0, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v61, v1

    const-string v1, "vary"

    invoke-direct {v0, v1, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    new-instance v1, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v62, v0

    const-string v0, "via"

    invoke-direct {v1, v0, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    new-instance v0, Lnicoid/network238/okhttp3/internal/http2/Header;

    move-object/from16 v63, v1

    const-string v1, "www-authenticate"

    invoke-direct {v0, v1, v3}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/16 v1, 0x3d

    new-array v1, v1, [Lnicoid/network238/okhttp3/internal/http2/Header;

    const/4 v3, 0x0

    aput-object v17, v1, v3

    const/4 v3, 0x1

    aput-object v2, v1, v3

    const/4 v2, 0x2

    aput-object v5, v1, v2

    const/4 v2, 0x3

    aput-object v4, v1, v2

    const/4 v2, 0x4

    aput-object v7, v1, v2

    const/4 v2, 0x5

    aput-object v6, v1, v2

    const/4 v2, 0x6

    aput-object v9, v1, v2

    const/4 v2, 0x7

    aput-object v8, v1, v2

    const/16 v2, 0x8

    aput-object v11, v1, v2

    const/16 v2, 0x9

    aput-object v12, v1, v2

    const/16 v2, 0xa

    aput-object v13, v1, v2

    const/16 v2, 0xb

    aput-object v14, v1, v2

    const/16 v2, 0xc

    aput-object v15, v1, v2

    const/16 v2, 0xd

    aput-object v18, v1, v2

    const/16 v2, 0xe

    aput-object v19, v1, v2

    const/16 v2, 0xf

    aput-object v10, v1, v2

    const/16 v2, 0x10

    aput-object v20, v1, v2

    const/16 v2, 0x11

    aput-object v21, v1, v2

    const/16 v2, 0x12

    aput-object v22, v1, v2

    const/16 v2, 0x13

    aput-object v23, v1, v2

    const/16 v2, 0x14

    aput-object v24, v1, v2

    const/16 v2, 0x15

    aput-object v25, v1, v2

    const/16 v2, 0x16

    aput-object v26, v1, v2

    const/16 v2, 0x17

    aput-object v27, v1, v2

    const/16 v2, 0x18

    aput-object v28, v1, v2

    const/16 v2, 0x19

    aput-object v29, v1, v2

    const/16 v2, 0x1a

    aput-object v30, v1, v2

    const/16 v2, 0x1b

    aput-object v31, v1, v2

    const/16 v2, 0x1c

    aput-object v32, v1, v2

    const/16 v2, 0x1d

    aput-object v33, v1, v2

    const/16 v2, 0x1e

    aput-object v34, v1, v2

    const/16 v2, 0x1f

    aput-object v35, v1, v2

    const/16 v2, 0x20

    aput-object v36, v1, v2

    const/16 v2, 0x21

    aput-object v37, v1, v2

    const/16 v2, 0x22

    aput-object v38, v1, v2

    const/16 v2, 0x23

    aput-object v39, v1, v2

    const/16 v2, 0x24

    aput-object v40, v1, v2

    const/16 v2, 0x25

    aput-object v41, v1, v2

    const/16 v2, 0x26

    aput-object v42, v1, v2

    const/16 v2, 0x27

    aput-object v43, v1, v2

    const/16 v2, 0x28

    aput-object v44, v1, v2

    const/16 v2, 0x29

    aput-object v45, v1, v2

    const/16 v2, 0x2a

    aput-object v46, v1, v2

    const/16 v2, 0x2b

    aput-object v47, v1, v2

    const/16 v2, 0x2c

    aput-object v48, v1, v2

    const/16 v2, 0x2d

    aput-object v49, v1, v2

    const/16 v2, 0x2e

    aput-object v50, v1, v2

    const/16 v2, 0x2f

    aput-object v51, v1, v2

    const/16 v2, 0x30

    aput-object v52, v1, v2

    const/16 v2, 0x31

    aput-object v53, v1, v2

    const/16 v2, 0x32

    aput-object v54, v1, v2

    const/16 v2, 0x33

    aput-object v55, v1, v2

    const/16 v2, 0x34

    aput-object v56, v1, v2

    const/16 v2, 0x35

    aput-object v57, v1, v2

    const/16 v2, 0x36

    aput-object v58, v1, v2

    const/16 v2, 0x37

    aput-object v59, v1, v2

    const/16 v2, 0x38

    aput-object v60, v1, v2

    const/16 v2, 0x39

    aput-object v61, v1, v2

    const/16 v2, 0x3a

    aput-object v62, v1, v2

    const/16 v2, 0x3b

    aput-object v63, v1, v2

    const/16 v2, 0x3c

    aput-object v0, v1, v2

    .line 59
    sput-object v1, Lnicoid/network238/okhttp3/internal/http2/Hpack;->STATIC_HEADER_TABLE:[Lnicoid/network238/okhttp3/internal/http2/Header;

    .line 123
    invoke-direct/range {v16 .. v16}, Lnicoid/network238/okhttp3/internal/http2/Hpack;->nameToFirstIndex()Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/internal/http2/Hpack;->NAME_TO_FIRST_INDEX:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final nameToFirstIndex()Ljava/util/Map;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lnicoid/network238/okio/ByteString;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 424
    new-instance v0, Ljava/util/LinkedHashMap;

    sget-object v1, Lnicoid/network238/okhttp3/internal/http2/Hpack;->STATIC_HEADER_TABLE:[Lnicoid/network238/okhttp3/internal/http2/Header;

    array-length v2, v1

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v0, v2, v3}, Ljava/util/LinkedHashMap;-><init>(IF)V

    .line 425
    array-length v1, v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    .line 426
    sget-object v3, Lnicoid/network238/okhttp3/internal/http2/Hpack;->STATIC_HEADER_TABLE:[Lnicoid/network238/okhttp3/internal/http2/Header;

    aget-object v4, v3, v2

    iget-object v4, v4, Lnicoid/network238/okhttp3/internal/http2/Header;->name:Lnicoid/network238/okio/ByteString;

    invoke-virtual {v0, v4}, Ljava/util/AbstractMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 427
    aget-object v3, v3, v2

    iget-object v3, v3, Lnicoid/network238/okhttp3/internal/http2/Header;->name:Lnicoid/network238/okio/ByteString;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 683
    :cond_1
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object v0
.end method


# virtual methods
.method public final checkLowercase(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/ByteString;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 674
    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 675
    invoke-virtual {p1, v1}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v2

    const/16 v3, 0x41

    if-gt v3, v2, :cond_0

    const/16 v3, 0x5b

    if-ge v2, v3, :cond_0

    .line 676
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "PROTOCOL_ERROR response malformed: mixed case name: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->utf8()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object p1
.end method

.method public final getNAME_TO_FIRST_INDEX()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lnicoid/network238/okio/ByteString;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 123
    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/Hpack;->NAME_TO_FIRST_INDEX:Ljava/util/Map;

    return-object v0
.end method

.method public final getSTATIC_HEADER_TABLE()[Lnicoid/network238/okhttp3/internal/http2/Header;
    .registers 2

    .line 58
    sget-object v0, Lnicoid/network238/okhttp3/internal/http2/Hpack;->STATIC_HEADER_TABLE:[Lnicoid/network238/okhttp3/internal/http2/Header;

    return-object v0
.end method
