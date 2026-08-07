.class public abstract Lcom/p1/mobile/putong/data/Media;
.super Lcom/tantanapp/common/data/ValueObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field private static TANTAN_CDN_URL:Ljava/lang/String; = "https://auto.tancdn.com"

.field public static final TYPE:Ljava/lang/String; = "media"


# instance fields
.field public compressType:I

.field public isPortrait:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public labels:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/MediaLabel;",
            ">;"
        }
    .end annotation
.end field

.field public mediaFileLength:J

.field public mediaType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public meta:Lcom/p1/mobile/putong/data/MediaMeta;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public name:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public netReqTimeParams:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public okPerformanceKey:Ljava/lang/String;

.field public originUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public processEndTime:J

.field public processStartTime:J

.field public status:Lcom/p1/mobile/putong/data/MediaLocalStatus;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public tagIdealInfo:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/IdealTag;",
            ">;"
        }
    .end annotation
.end field

.field public tags:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public tempUrl:Ljava/lang/String;

.field public uploadEndTime:J

.field public uploadStartTime:J

.field public url:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public urlKey:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Media$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Media$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/ValueObject;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static URL_TO_CACHEKEY(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/ecj;->J(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private add(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    new-instance p0, Ll/pf60;

    .line 9
    .line 10
    invoke-direct {p0, p2, p3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static fromUrl(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Media;
    .locals 4

    .line 1
    :try_start_0
    new-instance v0, Ljava/net/URL;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    const/4 v2, 0x1

    .line 11
    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const-string v3, "/"

    .line 16
    .line 17
    invoke-virtual {v1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {v0}, Lcom/p1/mobile/putong/data/Media;->isValidCloudMediaURL(Ljava/net/URL;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    array-length v0, v1

    .line 28
    sub-int/2addr v0, v2

    .line 29
    aget-object v0, v1, v0

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    invoke-static {v0, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ljava/lang/String;

    .line 37
    .line 38
    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 39
    .line 40
    invoke-direct {v1, v0, v2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 41
    .line 42
    .line 43
    new-instance v0, Lorg/json/JSONObject;

    .line 44
    .line 45
    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    const-string v1, "mt"

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    const-string v2, "w"

    .line 55
    .line 56
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    const-string v3, "h"

    .line 61
    .line 62
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    invoke-static {v1}, Lcom/p1/mobile/putong/data/Media;->isImage(Ljava/lang/String;)Z

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    if-eqz v3, :cond_0

    .line 71
    .line 72
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->new_()Lcom/p1/mobile/putong/data/Picture;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    iput-object p0, v3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 77
    .line 78
    iput-object v1, v3, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 79
    .line 80
    iget-object v1, v3, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 81
    .line 82
    iput v2, v1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 83
    .line 84
    iput v0, v1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 85
    .line 86
    return-object v3

    .line 87
    :cond_0
    invoke-static {v1}, Lcom/p1/mobile/putong/data/Media;->isVideo(Ljava/lang/String;)Z

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    if-eqz v3, :cond_1

    .line 92
    .line 93
    invoke-static {}, Lcom/p1/mobile/putong/data/Video;->new_()Lcom/p1/mobile/putong/data/Video;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    iput-object p0, v3, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 98
    .line 99
    iput-object v1, v3, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 100
    .line 101
    iget-object v1, v3, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 102
    .line 103
    iput v2, v1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 104
    .line 105
    iput v0, v1, Lcom/p1/mobile/putong/data/Dimension;->height:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 106
    .line 107
    return-object v3

    .line 108
    :catch_0
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->new_()Lcom/p1/mobile/putong/data/Picture;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 113
    .line 114
    return-object v0
.end method

.method public static isImage(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const-string v0, "image/jpg"

    .line 2
    .line 3
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const-string v0, "image/jpeg"

    .line 10
    .line 11
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    const-string v0, "image/png"

    .line 18
    .line 19
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    const-string v0, "image/gif"

    .line 26
    .line 27
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    const-string v0, "image/webp"

    .line 34
    .line 35
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    const-string v0, "image/heif"

    .line 42
    .line 43
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_1

    .line 48
    .line 49
    const-string v0, "image/heic"

    .line 50
    .line 51
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-eqz p0, :cond_0

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    const/4 p0, 0x0

    .line 59
    return p0

    .line 60
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 61
    return p0
.end method

.method public static isValidCloudMediaURL(Ljava/net/URL;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    sget-object v1, Ll/qv5;->g:Ljava/lang/String;

    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    sget-object v1, Lcom/p1/mobile/putong/data/Media;->TANTAN_CDN_URL:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    return v0

    .line 27
    :cond_0
    invoke-virtual {p0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const/4 v1, 0x1

    .line 32
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const-string v2, "/"

    .line 37
    .line 38
    invoke-virtual {p0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    array-length p0, p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    const/4 v2, 0x3

    .line 44
    if-ge p0, v2, :cond_1

    .line 45
    .line 46
    return v0

    .line 47
    :cond_1
    return v1

    .line 48
    :catch_0
    return v0
.end method

.method public static isVideo(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const-string v0, "video/mp4"

    .line 2
    .line 3
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static setFocusPoint(Lcom/p1/mobile/putong/data/Media;[F)V
    .locals 7

    .line 1
    if-eqz p1, :cond_6

    .line 2
    .line 3
    array-length v0, p1

    .line 4
    const/4 v1, 0x2

    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    const/high16 v2, 0x3f000000    # 0.5f

    .line 10
    .line 11
    aput v2, p1, v0

    .line 12
    .line 13
    const/4 v3, 0x1

    .line 14
    aput v2, p1, v3

    .line 15
    .line 16
    instance-of v4, p0, Lcom/p1/mobile/putong/data/Picture;

    .line 17
    .line 18
    if-eqz v4, :cond_6

    .line 19
    .line 20
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 21
    .line 22
    iget-object v4, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 23
    .line 24
    if-eqz v4, :cond_6

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Picture;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 27
    .line 28
    if-eqz p0, :cond_6

    .line 29
    .line 30
    iget v4, p0, Lcom/p1/mobile/putong/data/AIPosition;->x:I

    .line 31
    .line 32
    iget p0, p0, Lcom/p1/mobile/putong/data/AIPosition;->y:I

    .line 33
    .line 34
    const/high16 v5, 0x3f800000    # 1.0f

    .line 35
    .line 36
    const/4 v6, 0x0

    .line 37
    if-nez v4, :cond_1

    .line 38
    .line 39
    aput v6, p1, v0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    if-ne v4, v3, :cond_2

    .line 43
    .line 44
    aput v2, p1, v0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    if-ne v4, v1, :cond_3

    .line 48
    .line 49
    aput v5, p1, v0

    .line 50
    .line 51
    :cond_3
    :goto_0
    if-nez p0, :cond_4

    .line 52
    .line 53
    aput v6, p1, v3

    .line 54
    .line 55
    return-void

    .line 56
    :cond_4
    if-ne p0, v3, :cond_5

    .line 57
    .line 58
    aput v2, p1, v3

    .line 59
    .line 60
    return-void

    .line 61
    :cond_5
    if-ne p0, v1, :cond_6

    .line 62
    .line 63
    aput v5, p1, v3

    .line 64
    .line 65
    :cond_6
    :goto_1
    return-void
.end method


# virtual methods
.method public buildMediaLogParmas(Ljava/util/ArrayList;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string v1, "type"

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/data/MediaMeta;->type:Ljava/lang/String;

    .line 9
    .line 10
    invoke-direct {p0, p1, v1, v0}, Lcom/p1/mobile/putong/data/Media;->add(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/data/MediaMeta;->source:Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, "source"

    .line 18
    .line 19
    invoke-direct {p0, p1, v1, v0}, Lcom/p1/mobile/putong/data/Media;->add(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/data/MediaMeta;->proportion:Ljava/lang/String;

    .line 25
    .line 26
    const-string v1, "proportion"

    .line 27
    .line 28
    invoke-direct {p0, p1, v1, v0}, Lcom/p1/mobile/putong/data/Media;->add(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/data/MediaMeta;->camera:Ljava/lang/String;

    .line 34
    .line 35
    const-string v1, "camera"

    .line 36
    .line 37
    invoke-direct {p0, p1, v1, v0}, Lcom/p1/mobile/putong/data/Media;->add(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/data/MediaMeta;->sticker:Ljava/lang/String;

    .line 43
    .line 44
    const-string v1, "sticker"

    .line 45
    .line 46
    invoke-direct {p0, p1, v1, v0}, Lcom/p1/mobile/putong/data/Media;->add(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/data/MediaMeta;->filter:Ljava/lang/String;

    .line 52
    .line 53
    const-string v1, "filter"

    .line 54
    .line 55
    invoke-direct {p0, p1, v1, v0}, Lcom/p1/mobile/putong/data/Media;->add(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    instance-of v0, p0, Lcom/p1/mobile/putong/data/Video;

    .line 59
    .line 60
    if-nez v0, :cond_1

    .line 61
    .line 62
    :goto_0
    return-void

    .line 63
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 64
    .line 65
    iget-object v0, v0, Lcom/p1/mobile/putong/data/MediaMeta;->musicReference:Ljava/lang/String;

    .line 66
    .line 67
    const-string v1, "musicreference"

    .line 68
    .line 69
    invoke-direct {p0, p1, v1, v0}, Lcom/p1/mobile/putong/data/Media;->add(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 73
    .line 74
    iget-object v0, v0, Lcom/p1/mobile/putong/data/MediaMeta;->musicId:Ljava/lang/String;

    .line 75
    .line 76
    const-string v1, "musicid"

    .line 77
    .line 78
    invoke-direct {p0, p1, v1, v0}, Lcom/p1/mobile/putong/data/Media;->add(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 82
    .line 83
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/MediaMeta;->hasAudio:Z

    .line 84
    .line 85
    const-string v1, "no"

    .line 86
    .line 87
    const-string v2, "yes"

    .line 88
    .line 89
    if-eqz v0, :cond_2

    .line 90
    .line 91
    move-object v0, v2

    .line 92
    goto :goto_1

    .line 93
    :cond_2
    move-object v0, v1

    .line 94
    :goto_1
    const-string v3, "hasaudio"

    .line 95
    .line 96
    invoke-direct {p0, p1, v3, v0}, Lcom/p1/mobile/putong/data/Media;->add(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 100
    .line 101
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/MediaMeta;->isSameMusic:Z

    .line 102
    .line 103
    if-eqz v0, :cond_3

    .line 104
    .line 105
    move-object v1, v2

    .line 106
    :cond_3
    const-string v0, "origin"

    .line 107
    .line 108
    invoke-direct {p0, p1, v0, v1}, Lcom/p1/mobile/putong/data/Media;->add(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->clone()Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public abstract clone()Lcom/p1/mobile/putong/data/Media;
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->clone()Lcom/p1/mobile/putong/data/Media;

    move-result-object p0

    return-object p0
.end method

.method public cover()Lcom/p1/mobile/putong/data/Picture;
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/data/Video;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    instance-of v0, p0, Lcom/p1/mobile/putong/data/Picture;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/data/Media;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 16
    .line 17
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_4

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->urlKey:Ljava/lang/String;

    .line 24
    .line 25
    if-nez v1, :cond_2

    .line 26
    .line 27
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Media;->urlKey:Ljava/lang/String;

    .line 28
    .line 29
    if-nez v1, :cond_2

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-nez v1, :cond_3

    .line 40
    .line 41
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->urlKey:Ljava/lang/String;

    .line 42
    .line 43
    if-eqz v1, :cond_4

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Media;->urlKey:Ljava/lang/String;

    .line 46
    .line 47
    if-eqz v3, :cond_4

    .line 48
    .line 49
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_4

    .line 54
    .line 55
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->name:Ljava/lang/String;

    .line 56
    .line 57
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Media;->name:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_4

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 66
    .line 67
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-eqz v1, :cond_4

    .line 74
    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 76
    .line 77
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 78
    .line 79
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-eqz v1, :cond_4

    .line 84
    .line 85
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 86
    .line 87
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    if-eqz v1, :cond_4

    .line 94
    .line 95
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Media;->isPortrait:Z

    .line 96
    .line 97
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/Media;->isPortrait:Z

    .line 98
    .line 99
    if-ne v1, v3, :cond_4

    .line 100
    .line 101
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 102
    .line 103
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 104
    .line 105
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-eqz v1, :cond_4

    .line 110
    .line 111
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 112
    .line 113
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 114
    .line 115
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    if-eqz v1, :cond_4

    .line 120
    .line 121
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->tagIdealInfo:Ljava/util/List;

    .line 122
    .line 123
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->tagIdealInfo:Ljava/util/List;

    .line 124
    .line 125
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result p0

    .line 129
    if-eqz p0, :cond_4

    .line 130
    .line 131
    return v0

    .line 132
    :cond_4
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "media"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 3

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_a

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v1, v2

    .line 18
    :goto_0
    add-int/2addr v0, v1

    .line 19
    mul-int/lit8 v0, v0, 0x29

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->urlKey:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    move v1, v2

    .line 31
    :goto_1
    add-int/2addr v0, v1

    .line 32
    mul-int/lit8 v0, v0, 0x29

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->name:Ljava/lang/String;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    goto :goto_2

    .line 43
    :cond_2
    move v1, v2

    .line 44
    :goto_2
    add-int/2addr v0, v1

    .line 45
    mul-int/lit8 v0, v0, 0x29

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    goto :goto_3

    .line 56
    :cond_3
    move v1, v2

    .line 57
    :goto_3
    add-int/2addr v0, v1

    .line 58
    mul-int/lit8 v0, v0, 0x29

    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/MediaMeta;->hashCode()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    goto :goto_4

    .line 69
    :cond_4
    move v1, v2

    .line 70
    :goto_4
    add-int/2addr v0, v1

    .line 71
    mul-int/lit8 v0, v0, 0x29

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    goto :goto_5

    .line 82
    :cond_5
    move v1, v2

    .line 83
    :goto_5
    add-int/2addr v0, v1

    .line 84
    mul-int/lit8 v0, v0, 0x29

    .line 85
    .line 86
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Media;->isPortrait:Z

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    const/16 v1, 0x4cf

    .line 91
    .line 92
    goto :goto_6

    .line 93
    :cond_6
    const/16 v1, 0x4d5

    .line 94
    .line 95
    :goto_6
    add-int/2addr v0, v1

    .line 96
    mul-int/lit8 v0, v0, 0x29

    .line 97
    .line 98
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 99
    .line 100
    if-eqz v1, :cond_7

    .line 101
    .line 102
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    goto :goto_7

    .line 107
    :cond_7
    move v1, v2

    .line 108
    :goto_7
    add-int/2addr v0, v1

    .line 109
    mul-int/lit8 v0, v0, 0x29

    .line 110
    .line 111
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 112
    .line 113
    if-eqz v1, :cond_8

    .line 114
    .line 115
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    goto :goto_8

    .line 120
    :cond_8
    move v1, v2

    .line 121
    :goto_8
    add-int/2addr v0, v1

    .line 122
    mul-int/lit8 v0, v0, 0x29

    .line 123
    .line 124
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->tagIdealInfo:Ljava/util/List;

    .line 125
    .line 126
    if-eqz v1, :cond_9

    .line 127
    .line 128
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 129
    .line 130
    .line 131
    move-result v2

    .line 132
    :cond_9
    add-int/2addr v0, v2

    .line 133
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 134
    .line 135
    :cond_a
    return v0
.end method

.method public isFromShoot()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/MediaMeta;->source:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "shoot"

    .line 8
    .line 9
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public isSameOrigin(Lcom/p1/mobile/putong/data/Media;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method public newBuildMediaLogParmas(Lorg/json/JSONObject;)V
    .locals 4

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    const-string v1, "moment_type"

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/data/MediaMeta;->type:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    const-string v0, "moment_source"

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/data/MediaMeta;->source:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 20
    .line 21
    .line 22
    const-string v0, "moment_proportion"

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/data/MediaMeta;->proportion:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 29
    .line 30
    .line 31
    const-string v0, "moment_camera"

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/data/MediaMeta;->camera:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 38
    .line 39
    .line 40
    const-string v0, "moment_sticker"

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 43
    .line 44
    iget-object v1, v1, Lcom/p1/mobile/putong/data/MediaMeta;->sticker:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 47
    .line 48
    .line 49
    const-string v0, "filter_id"

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 52
    .line 53
    iget-object v1, v1, Lcom/p1/mobile/putong/data/MediaMeta;->filter:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 56
    .line 57
    .line 58
    instance-of v0, p0, Lcom/p1/mobile/putong/data/Video;

    .line 59
    .line 60
    if-nez v0, :cond_1

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_1
    const-string v0, "moment_musicreference"

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 66
    .line 67
    iget-object v1, v1, Lcom/p1/mobile/putong/data/MediaMeta;->musicReference:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 70
    .line 71
    .line 72
    const-string v0, "moment_musicid"

    .line 73
    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 75
    .line 76
    iget-object v1, v1, Lcom/p1/mobile/putong/data/MediaMeta;->musicId:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 79
    .line 80
    .line 81
    const-string v0, "moment_hasaudio"

    .line 82
    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 84
    .line 85
    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/MediaMeta;->hasAudio:Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 86
    .line 87
    const-string v2, "no"

    .line 88
    .line 89
    const-string v3, "yes"

    .line 90
    .line 91
    if-eqz v1, :cond_2

    .line 92
    .line 93
    move-object v1, v3

    .line 94
    goto :goto_0

    .line 95
    :cond_2
    move-object v1, v2

    .line 96
    :goto_0
    :try_start_1
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 97
    .line 98
    .line 99
    const-string v0, "moment_origin"

    .line 100
    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 102
    .line 103
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/MediaMeta;->isSameMusic:Z

    .line 104
    .line 105
    if-eqz p0, :cond_3

    .line 106
    .line 107
    move-object v2, v3

    .line 108
    :cond_3
    invoke-virtual {p1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 109
    .line 110
    .line 111
    :catch_0
    :goto_1
    return-void
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/data/MediaLocalStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, ""

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->urlKey:Ljava/lang/String;

    .line 24
    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Media;->urlKey:Ljava/lang/String;

    .line 28
    .line 29
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 30
    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 34
    .line 35
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 36
    .line 37
    if-nez v0, :cond_4

    .line 38
    .line 39
    new-instance v0, Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 45
    .line 46
    :cond_4
    return-void
.end method
