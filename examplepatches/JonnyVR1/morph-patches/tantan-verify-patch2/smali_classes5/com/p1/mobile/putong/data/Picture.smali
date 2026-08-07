.class public Lcom/p1/mobile/putong/data/Picture;
.super Lcom/p1/mobile/putong/data/Media;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/data/Picture$ImageUri;
    }
.end annotation


# static fields
.field public static final EMPTY:Lcom/p1/mobile/putong/data/Picture;

.field public static final FORMAT_BLUR:I = 0x3

.field public static final FORMAT_MAX:I = 0x1

.field public static final FORMAT_NO:I = 0x0

.field public static final FORMAT_SQUARE:I = 0x2

.field public static final MAX_PROFILE_SIZE:[I

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/Picture;",
            ">;"
        }
    .end annotation
.end field

.field public static final SIZES:[I

.field public static final SQUARE_SIZES:[I

.field public static final TYPE:Ljava/lang/String; = "picture"


# instance fields
.field public aiPosition:Lcom/p1/mobile/putong/data/AIPosition;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation
.end field

.field public attachments:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Picture;",
            ">;"
        }
    .end annotation
.end field

.field public gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x36
    .end annotation
.end field

.field public livePhoto:Lcom/p1/mobile/putong/data/LivePhoto;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x38
    .end annotation
.end field

.field public size:Lcom/p1/mobile/putong/data/Dimension;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->new_()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/p1/mobile/putong/data/Picture;->EMPTY:Lcom/p1/mobile/putong/data/Picture;

    .line 6
    .line 7
    const/16 v0, 0x3c0

    .line 8
    .line 9
    filled-new-array {v0, v0}, [I

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/Picture;->MAX_PROFILE_SIZE:[I

    .line 14
    .line 15
    const/16 v0, 0x1e0

    .line 16
    .line 17
    const/16 v1, 0x280

    .line 18
    .line 19
    const/16 v2, 0x80

    .line 20
    .line 21
    const/16 v3, 0xb4

    .line 22
    .line 23
    const/16 v4, 0x12c

    .line 24
    .line 25
    filled-new-array {v2, v3, v4, v0, v1}, [I

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sput-object v0, Lcom/p1/mobile/putong/data/Picture;->SQUARE_SIZES:[I

    .line 30
    .line 31
    const/4 v0, 0x6

    .line 32
    new-array v0, v0, [I

    .line 33
    .line 34
    fill-array-data v0, :array_0

    .line 35
    .line 36
    .line 37
    sput-object v0, Lcom/p1/mobile/putong/data/Picture;->SIZES:[I

    .line 38
    .line 39
    new-instance v0, Lcom/p1/mobile/putong/data/Picture$1;

    .line 40
    .line 41
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Picture$1;-><init>()V

    .line 42
    .line 43
    .line 44
    sput-object v0, Lcom/p1/mobile/putong/data/Picture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 45
    .line 46
    return-void

    .line 47
    :array_0
    .array-data 4
        0xb4
        0x12c
        0x1e0
        0x280
        0x2d0
        0x3c0
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Media;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/data/MediaLabel;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "WITH_LOW"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method private aboutWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->userWebpInPicture()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, ".webp"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, ".jpg"

    .line 11
    .line 12
    :goto_0
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/data/Picture;->aboutWidth(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method private atLeastWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->userWebpInPicture()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, ".webp"

    goto :goto_0

    :cond_0
    const-string v0, ".jpg"

    :goto_0
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/data/Picture;->atLeastWidth(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object p0

    return-object p0
.end method

.method private atLeastWidth(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/Picture;->SIZES:[I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget v2, v0, v1

    .line 5
    .line 6
    array-length v2, v0

    .line 7
    :goto_0
    if-ge v1, v2, :cond_1

    .line 8
    .line 9
    aget v3, v0, v1

    .line 10
    .line 11
    if-lt v3, p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, v3, p2}, Lcom/p1/mobile/putong/data/Picture;->maxWidth(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/data/Picture;->SIZES:[I

    .line 22
    .line 23
    array-length v0, p1

    .line 24
    add-int/lit8 v0, v0, -0x1

    .line 25
    .line 26
    aget p1, p1, v0

    .line 27
    .line 28
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/Picture;->maxWidth(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method private atMostHeight(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->userWebpInPicture()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, ".webp"

    goto :goto_0

    :cond_0
    const-string v0, ".jpg"

    :goto_0
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/data/Picture;->atMostHeight(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object p0

    return-object p0
.end method

.method private atMostHeight(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 2
    .line 3
    iget v1, v0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 4
    .line 5
    mul-int/2addr p1, v1

    .line 6
    iget v0, v0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 7
    .line 8
    const/16 v1, 0xa

    .line 9
    .line 10
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    div-int/2addr p1, v0

    .line 15
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/data/Picture;->atMostWidth(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method private atMostShortDimension(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->userWebpInPicture()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, ".webp"

    goto :goto_0

    :cond_0
    const-string v0, ".jpg"

    :goto_0
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/data/Picture;->atMostShortDimension(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object p0

    return-object p0
.end method

.method private atMostShortDimension(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 2
    .line 3
    iget v1, v0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 4
    .line 5
    iget v0, v0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 6
    .line 7
    if-ge v1, v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/data/Picture;->atMostWidth(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/data/Picture;->atMostHeight(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method private atMostWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->userWebpInPicture()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, ".webp"

    goto :goto_0

    :cond_0
    const-string v0, ".jpg"

    :goto_0
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/data/Picture;->atMostWidth(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object p0

    return-object p0
.end method

.method private atMostWidth(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 2
    .line 3
    iget v0, v0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 4
    .line 5
    if-ge v0, p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/data/Picture;->aspectRatioBiggest(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/data/Picture;->SIZES:[I

    .line 13
    .line 14
    array-length v0, v0

    .line 15
    add-int/lit8 v0, v0, -0x1

    .line 16
    .line 17
    :goto_0
    if-ltz v0, :cond_2

    .line 18
    .line 19
    sget-object v1, Lcom/p1/mobile/putong/data/Picture;->SIZES:[I

    .line 20
    .line 21
    aget v1, v1, v0

    .line 22
    .line 23
    if-gt v1, p1, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0, v1, p2}, Lcom/p1/mobile/putong/data/Picture;->maxWidth(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_1
    add-int/lit8 v0, v0, -0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_2
    sget-object p1, Lcom/p1/mobile/putong/data/Picture;->SIZES:[I

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    aget p1, p1, v0

    .line 37
    .line 38
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/Picture;->maxWidth(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/IdealTag;)Lcom/p1/mobile/putong/data/IdealTag;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/IdealTag;->clone()Lcom/p1/mobile/putong/data/IdealTag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/data/MediaLabel;Lcom/p1/mobile/putong/data/MediaLabel;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/data/MediaLabel;)Lcom/p1/mobile/putong/data/MediaLabel;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic e(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Picture;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->clone()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private maxWidth1080(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    const/16 v0, 0x438

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/data/Picture;->maxWidth(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private maxWidth1440(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    const/16 v0, 0x5a0

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/data/Picture;->maxWidth(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private maxWidth640(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    const/16 v0, 0x280

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/data/Picture;->maxWidth(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private maxWidth720(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    const/16 v0, 0x2d0

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/data/Picture;->maxWidth(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/data/Picture;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Picture;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->nullCheck()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method private square1080(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    const/16 v0, 0x438

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/data/Picture;->square(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private square128(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    const/16 v0, 0x80

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/data/Picture;->square(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private square1440(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    const/16 v0, 0x5a0

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/data/Picture;->square(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private square180(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    const/16 v0, 0xb4

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/data/Picture;->square(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private square480(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    const/16 v0, 0x1e0

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/data/Picture;->square(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private square640(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    const/16 v0, 0x280

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/data/Picture;->square(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private square720(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    const/16 v0, 0x2d0

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/data/Picture;->square(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private squareAbout(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->userWebpInPicture()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, ".webp"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, ".jpg"

    .line 11
    .line 12
    :goto_0
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/data/Picture;->squareAbout(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method private squareAbout(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 0

    mul-int/lit8 p1, p1, 0x7

    .line 17
    div-int/lit8 p1, p1, 0xa

    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/data/Picture;->squareAtLeast(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object p0

    return-object p0
.end method

.method private squareAtLeast(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->userWebpInPicture()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, ".webp"

    goto :goto_0

    :cond_0
    const-string v0, ".jpg"

    :goto_0
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/data/Picture;->squareAtLeast(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object p0

    return-object p0
.end method

.method private squareAtLeast(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/Picture;->SQUARE_SIZES:[I

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    const/4 v2, 0x0

    .line 5
    :goto_0
    if-ge v2, v1, :cond_1

    .line 6
    .line 7
    aget v3, v0, v2

    .line 8
    .line 9
    if-lt v3, p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, v3, p2}, Lcom/p1/mobile/putong/data/Picture;->square(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/data/Picture;->SQUARE_SIZES:[I

    .line 20
    .line 21
    array-length v0, p1

    .line 22
    add-int/lit8 v0, v0, -0x1

    .line 23
    .line 24
    aget p1, p1, v0

    .line 25
    .line 26
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/Picture;->square(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public static userWebpInPicture()Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "picture_format_config"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->s(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/kl40;->c()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    return v0

    .line 21
    :cond_0
    const/4 v0, 0x0

    .line 22
    return v0
.end method


# virtual methods
.method public aboutWidth(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 0

    mul-int/lit8 p1, p1, 0x7

    .line 17
    div-int/lit8 p1, p1, 0xa

    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/data/Picture;->atLeastWidth(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object p0

    return-object p0
.end method

.method public aspectRatioBiggest()Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->userWebpInPicture()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, ".webp"

    goto :goto_0

    :cond_0
    const-string v0, ".jpg"

    :goto_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/Picture;->aspectRatioBiggest(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object p0

    return-object p0
.end method

.method public aspectRatioBiggest(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 9

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/Picture;->SIZES:[I

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    add-int/lit8 v1, v1, -0x1

    .line 5
    .line 6
    aget v0, v0, v1

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    :goto_0
    sget-object v2, Lcom/p1/mobile/putong/data/Picture;->SIZES:[I

    .line 10
    .line 11
    array-length v3, v2

    .line 12
    if-ge v1, v3, :cond_1

    .line 13
    .line 14
    aget v2, v2, v1

    .line 15
    .line 16
    iget-object v3, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 17
    .line 18
    iget v3, v3, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 19
    .line 20
    if-le v2, v3, :cond_0

    .line 21
    .line 22
    move v7, v2

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    move v7, v0

    .line 28
    :goto_1
    new-instance v2, Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 29
    .line 30
    iget-object v3, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v4, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 35
    .line 36
    const-string v0, "normal"

    .line 37
    .line 38
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    xor-int/lit8 v8, p0, 0x1

    .line 43
    .line 44
    const/4 v6, 0x1

    .line 45
    move-object v5, p1

    .line 46
    invoke-direct/range {v2 .. v8}, Lcom/p1/mobile/putong/data/Picture$ImageUri;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/data/Dimension;Ljava/lang/String;IIZ)V

    .line 47
    .line 48
    .line 49
    return-object v2
.end method

.method public atMostLongDimension(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 2
    .line 3
    iget v1, v0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 4
    .line 5
    iget v0, v0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 6
    .line 7
    if-ge v1, v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/data/Picture;->atMostHeight(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/data/Picture;->atMostWidth(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public bigAspectRate()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 2
    .line 3
    iget v0, p0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 6
    .line 7
    if-le v0, p0, :cond_0

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    div-int/2addr v0, p0

    .line 12
    return v0

    .line 13
    :cond_0
    if-le p0, v0, :cond_1

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    div-int/2addr p0, v0

    .line 18
    return p0

    .line 19
    :cond_1
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public calculatedWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/data/Picture;->aboutWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 147
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->clone()Lcom/p1/mobile/putong/data/Picture;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic clone()Lcom/p1/mobile/putong/data/Media;
    .locals 0

    .line 145
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->clone()Lcom/p1/mobile/putong/data/Picture;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/Picture;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Picture;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->urlKey:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->urlKey:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->name:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->name:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 27
    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/MediaMeta;->clone()Lcom/p1/mobile/putong/data/MediaMeta;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 35
    .line 36
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 37
    .line 38
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 39
    .line 40
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Media;->isPortrait:Z

    .line 41
    .line 42
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/Media;->isPortrait:Z

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 45
    .line 46
    if-eqz v1, :cond_1

    .line 47
    .line 48
    new-instance v2, Ll/lp70;

    .line 49
    .line 50
    invoke-direct {v2}, Ll/lp70;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 58
    .line 59
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 60
    .line 61
    if-eqz v1, :cond_2

    .line 62
    .line 63
    new-instance v2, Ll/mp70;

    .line 64
    .line 65
    invoke-direct {v2}, Ll/mp70;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->tags:Ljava/util/List;

    .line 73
    .line 74
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->tagIdealInfo:Ljava/util/List;

    .line 75
    .line 76
    if-eqz v1, :cond_3

    .line 77
    .line 78
    new-instance v2, Ll/np70;

    .line 79
    .line 80
    invoke-direct {v2}, Ll/np70;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->tagIdealInfo:Ljava/util/List;

    .line 88
    .line 89
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 90
    .line 91
    if-eqz v1, :cond_4

    .line 92
    .line 93
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Dimension;->clone()Lcom/p1/mobile/putong/data/Dimension;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 98
    .line 99
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Picture;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 100
    .line 101
    if-eqz v1, :cond_5

    .line 102
    .line 103
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/AIPosition;->clone()Lcom/p1/mobile/putong/data/AIPosition;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Picture;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 108
    .line 109
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 110
    .line 111
    if-eqz v1, :cond_6

    .line 112
    .line 113
    new-instance v2, Ll/op70;

    .line 114
    .line 115
    invoke-direct {v2}, Ll/op70;-><init>()V

    .line 116
    .line 117
    .line 118
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 123
    .line 124
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Picture;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 125
    .line 126
    if-eqz v1, :cond_7

    .line 127
    .line 128
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/GaussianBlurParameters;->clone()Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Picture;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 133
    .line 134
    :cond_7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Picture;->livePhoto:Lcom/p1/mobile/putong/data/LivePhoto;

    .line 135
    .line 136
    if-eqz p0, :cond_8

    .line 137
    .line 138
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/LivePhoto;->clone()Lcom/p1/mobile/putong/data/LivePhoto;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Picture;->livePhoto:Lcom/p1/mobile/putong/data/LivePhoto;

    .line 143
    .line 144
    :cond_8
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 146
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->clone()Lcom/p1/mobile/putong/data/Picture;

    move-result-object p0

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/Picture;

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
    move-object v1, p1

    .line 12
    check-cast v1, Lcom/p1/mobile/putong/data/Picture;

    .line 13
    .line 14
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/data/Media;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_2

    .line 19
    .line 20
    return v2

    .line 21
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 22
    .line 23
    iget-object v3, v1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 24
    .line 25
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_3

    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Picture;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 32
    .line 33
    iget-object v3, v1, Lcom/p1/mobile/putong/data/Picture;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 34
    .line 35
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_3

    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 42
    .line 43
    iget-object v3, v1, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 44
    .line 45
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_3

    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Picture;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 52
    .line 53
    iget-object v3, v1, Lcom/p1/mobile/putong/data/Picture;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 54
    .line 55
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_3

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Picture;->livePhoto:Lcom/p1/mobile/putong/data/LivePhoto;

    .line 62
    .line 63
    iget-object p1, v1, Lcom/p1/mobile/putong/data/Picture;->livePhoto:Lcom/p1/mobile/putong/data/LivePhoto;

    .line 64
    .line 65
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-eqz p0, :cond_3

    .line 70
    .line 71
    return v0

    .line 72
    :cond_3
    return v2
.end method

.method public getAspectRate()F
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 2
    .line 3
    iget v0, p0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 4
    .line 5
    int-to-float v0, v0

    .line 6
    const/high16 v1, 0x3f800000    # 1.0f

    .line 7
    .line 8
    mul-float/2addr v0, v1

    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 10
    .line 11
    int-to-float p0, p0

    .line 12
    div-float/2addr v0, p0

    .line 13
    return v0
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "picture"

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
    if-nez v0, :cond_5

    .line 4
    .line 5
    invoke-super {p0}, Lcom/p1/mobile/putong/data/Media;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    mul-int/lit8 v0, v0, 0x29

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Dimension;->hashCode()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move v1, v2

    .line 22
    :goto_0
    add-int/2addr v0, v1

    .line 23
    mul-int/lit8 v0, v0, 0x29

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Picture;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/AIPosition;->hashCode()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    move v1, v2

    .line 35
    :goto_1
    add-int/2addr v0, v1

    .line 36
    mul-int/lit8 v0, v0, 0x29

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    goto :goto_2

    .line 47
    :cond_2
    move v1, v2

    .line 48
    :goto_2
    add-int/2addr v0, v1

    .line 49
    mul-int/lit8 v0, v0, 0x29

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Picture;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 52
    .line 53
    if-eqz v1, :cond_3

    .line 54
    .line 55
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/GaussianBlurParameters;->hashCode()I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    goto :goto_3

    .line 60
    :cond_3
    move v1, v2

    .line 61
    :goto_3
    add-int/2addr v0, v1

    .line 62
    mul-int/lit8 v0, v0, 0x29

    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Picture;->livePhoto:Lcom/p1/mobile/putong/data/LivePhoto;

    .line 65
    .line 66
    if-eqz v1, :cond_4

    .line 67
    .line 68
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LivePhoto;->hashCode()I

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    :cond_4
    add-int/2addr v0, v2

    .line 73
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 74
    .line 75
    :cond_5
    return v0
.end method

.method public isAiFakePic()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 10
    .line 11
    const-string v0, "WITH_AUDIT_AI_PICTURE"

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public isHorizontal()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 2
    .line 3
    iget v0, p0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 6
    .line 7
    if-le v0, p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public isLabelJudge(Lcom/p1/mobile/putong/data/MediaLabel;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public isLow()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 10
    .line 11
    const-string v0, "WITH_LOW"

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public isSquare()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->getAspectRate()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/high16 v0, 0x3f800000    # 1.0f

    .line 6
    .line 7
    sub-float/2addr p0, v0

    .line 8
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    const v0, 0x3d4ccccd    # 0.05f

    .line 13
    .line 14
    .line 15
    cmpg-float p0, p0, v0

    .line 16
    .line 17
    if-gez p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public isVerificationCheckFail()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 10
    .line 11
    const-string v0, "NOT_VERIFICATION"

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public jpgMaxWidth1080()Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->userWebpInPicture()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, ".webp"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, ".jpg"

    .line 11
    .line 12
    :goto_0
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/data/Picture;->maxWidth1080(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public jpgMaxWidth1440()Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->userWebpInPicture()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, ".webp"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, ".jpg"

    .line 11
    .line 12
    :goto_0
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/data/Picture;->maxWidth1440(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public jpgMaxWidth640()Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->userWebpInPicture()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, ".webp"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, ".jpg"

    .line 11
    .line 12
    :goto_0
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/data/Picture;->maxWidth640(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public jpgMaxWidth720()Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->userWebpInPicture()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, ".webp"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, ".jpg"

    .line 11
    .line 12
    :goto_0
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/data/Picture;->maxWidth720(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public jpgSquare1080()Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->userWebpInPicture()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, ".webp"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, ".jpg"

    .line 11
    .line 12
    :goto_0
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/data/Picture;->square1080(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public jpgSquare1440()Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->userWebpInPicture()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, ".webp"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, ".jpg"

    .line 11
    .line 12
    :goto_0
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/data/Picture;->square1440(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public jpgSquare640()Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->userWebpInPicture()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, ".webp"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, ".jpg"

    .line 11
    .line 12
    :goto_0
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/data/Picture;->square640(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public jpgSquare720()Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->userWebpInPicture()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, ".webp"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, ".jpg"

    .line 11
    .line 12
    :goto_0
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/data/Picture;->square720(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public maxWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->userWebpInPicture()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, ".webp"

    goto :goto_0

    :cond_0
    const-string v0, ".jpg"

    :goto_0
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/data/Picture;->maxWidth(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object p0

    return-object p0
.end method

.method public maxWidth(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 7

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 8
    .line 9
    const-string v3, "normal"

    .line 10
    .line 11
    invoke-static {p0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    xor-int/lit8 v6, p0, 0x1

    .line 16
    .line 17
    const/4 v4, 0x1

    .line 18
    move v5, p1

    .line 19
    move-object v3, p2

    .line 20
    invoke-direct/range {v0 .. v6}, Lcom/p1/mobile/putong/data/Picture$ImageUri;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/data/Dimension;Ljava/lang/String;IIZ)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public momentPictureSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    const/high16 v0, 0x42940000    # 74.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/data/Picture;->atMostShortDimension(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/data/Media;->nullCheck()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/data/Dimension;->new_()Lcom/p1/mobile/putong/data/Dimension;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Picture;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/data/AIPosition;->new_()Lcom/p1/mobile/putong/data/AIPosition;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Picture;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public profile128()Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->userWebpInPicture()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, ".webp"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, ".jpg"

    .line 11
    .line 12
    :goto_0
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/data/Picture;->square128(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public profile180()Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->userWebpInPicture()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, ".webp"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, ".jpg"

    .line 11
    .line 12
    :goto_0
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/data/Picture;->square180(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public profile480()Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->userWebpInPicture()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, ".webp"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, ".jpg"

    .line 11
    .line 12
    :goto_0
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/data/Picture;->square480(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public profileBig()Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->userWebpInPicture()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, ".webp"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, ".jpg"

    .line 11
    .line 12
    :goto_0
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/data/Picture;->square640(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->userWebpInPicture()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, ".webp"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, ".jpg"

    .line 11
    .line 12
    :goto_0
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/data/Picture;->square640(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public profileSize(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/data/Picture;->squareAtLeast(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    const/high16 v0, 0x42280000    # 42.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/data/Picture;->squareAtLeast(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public profileSmalleOriginalSize()Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 9

    .line 1
    sget v0, Ll/qa00;->F:I

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->userWebpInPicture()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    const-string v1, ".webp"

    .line 10
    .line 11
    :goto_0
    move-object v5, v1

    .line 12
    goto :goto_1

    .line 13
    :cond_0
    const-string v1, ".jpg"

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :goto_1
    sget-object v1, Lcom/p1/mobile/putong/data/Picture;->SIZES:[I

    .line 17
    .line 18
    array-length v2, v1

    .line 19
    const/4 v3, 0x0

    .line 20
    :goto_2
    if-ge v3, v2, :cond_2

    .line 21
    .line 22
    aget v7, v1, v3

    .line 23
    .line 24
    if-lt v7, v0, :cond_1

    .line 25
    .line 26
    new-instance v2, Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 27
    .line 28
    iget-object v3, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v4, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 33
    .line 34
    const-string v0, "normal"

    .line 35
    .line 36
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    xor-int/lit8 v8, p0, 0x1

    .line 41
    .line 42
    const/4 v6, 0x1

    .line 43
    invoke-direct/range {v2 .. v8}, Lcom/p1/mobile/putong/data/Picture$ImageUri;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/data/Dimension;Ljava/lang/String;IIZ)V

    .line 44
    .line 45
    .line 46
    return-object v2

    .line 47
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 48
    .line 49
    goto :goto_2

    .line 50
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->jpgMaxWidth720()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0
.end method

.method public removeLabel(Lcom/p1/mobile/putong/data/MediaLabel;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ll/jp70;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Ll/jp70;-><init>(Lcom/p1/mobile/putong/data/MediaLabel;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0, v0}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public removeLowLabel()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ll/kp70;

    .line 7
    .line 8
    invoke-direct {v0}, Ll/kp70;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-static {p0, v0}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setLabel(Lcom/p1/mobile/putong/data/MediaLabel;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method

.method public setLow()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 13
    .line 14
    const-string v1, "WITH_LOW"

    .line 15
    .line 16
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-interface {v0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->labels:Ljava/util/List;

    .line 27
    .line 28
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MediaLabel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLabel;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public square(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->userWebpInPicture()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, ".webp"

    goto :goto_0

    :cond_0
    const-string v0, ".jpg"

    :goto_0
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/data/Picture;->square(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    move-result-object p0

    return-object p0
.end method

.method public square(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 7

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 8
    .line 9
    const-string v3, "normal"

    .line 10
    .line 11
    invoke-static {p0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    xor-int/lit8 v6, p0, 0x1

    .line 16
    .line 17
    const/4 v4, 0x2

    .line 18
    move v5, p1

    .line 19
    move-object v3, p2

    .line 20
    invoke-direct/range {v0 .. v6}, Lcom/p1/mobile/putong/data/Picture$ImageUri;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/data/Dimension;Ljava/lang/String;IIZ)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public stickerItemInMessages()Ll/pf60;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Picture$ImageUri;",
            "Landroid/graphics/Point;",
            ">;"
        }
    .end annotation

    .line 1
    sget-boolean v0, Lcom/p1/mobile/android/app/App;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/high16 v0, 0x43000000    # 128.0f

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/high16 v0, 0x43100000    # 144.0f

    .line 9
    .line 10
    :goto_0
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 15
    .line 16
    iget v2, v1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 17
    .line 18
    iget v1, v1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 19
    .line 20
    const-string v3, ".png"

    .line 21
    .line 22
    if-le v2, v1, :cond_1

    .line 23
    .line 24
    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 29
    .line 30
    iget v2, v1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 31
    .line 32
    mul-int/2addr v2, v0

    .line 33
    iget v1, v1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 34
    .line 35
    div-int/2addr v2, v1

    .line 36
    invoke-virtual {p0, v0, v3}, Lcom/p1/mobile/putong/data/Picture;->aboutWidth(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    new-instance v1, Landroid/graphics/Point;

    .line 41
    .line 42
    invoke-direct {v1, v0, v2}, Landroid/graphics/Point;-><init>(II)V

    .line 43
    .line 44
    .line 45
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0

    .line 50
    :cond_1
    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 55
    .line 56
    iget v2, v1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 57
    .line 58
    mul-int/2addr v2, v0

    .line 59
    iget v1, v1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 60
    .line 61
    div-int/2addr v2, v1

    .line 62
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/putong/data/Picture;->aboutWidth(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    new-instance v1, Landroid/graphics/Point;

    .line 67
    .line 68
    invoke-direct {v1, v2, v0}, Landroid/graphics/Point;-><init>(II)V

    .line 69
    .line 70
    .line 71
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0
.end method

.method public stickerPackage()Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 2

    .line 1
    const/16 v0, 0xb4

    .line 2
    .line 3
    const-string v1, ".png"

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/data/Picture;->maxWidth(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public webpMaxWidth1080()Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    const-string v0, ".webp"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/data/Picture;->maxWidth1080(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
