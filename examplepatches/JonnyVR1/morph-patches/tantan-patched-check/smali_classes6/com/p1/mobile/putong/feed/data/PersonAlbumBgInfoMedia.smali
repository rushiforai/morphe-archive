.class public Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;
.super Lcom/tantanapp/common/data/ValueObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "personalbumbginfomedia"


# instance fields
.field public aiPosition:Lcom/p1/mobile/putong/data/AIPosition;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public attachments:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;",
            ">;"
        }
    .end annotation
.end field

.field public audio:Lcom/p1/mobile/putong/data/AudioMedia;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public duration:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public gif:Lcom/p1/mobile/putong/data/GifMedia;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public mediaType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public music:Lcom/p1/mobile/putong/data/Music;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public name:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public size:Lcom/p1/mobile/putong/data/Dimension;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public status:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public url:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
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

.method public static synthetic a(Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;)Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->clone()Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->nullCheck()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public bridge synthetic clone()Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 107
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->clone()Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->name:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->name:Ljava/lang/String;

    .line 13
    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->duration:F

    .line 15
    .line 16
    iput v1, v0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->duration:F

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->mediaType:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->mediaType:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Dimension;->clone()Lcom/p1/mobile/putong/data/Dimension;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 31
    .line 32
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->attachments:Ljava/util/List;

    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    new-instance v2, Ll/ps60;

    .line 37
    .line 38
    invoke-direct {v2}, Ll/ps60;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->attachments:Ljava/util/List;

    .line 46
    .line 47
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->url:Ljava/lang/String;

    .line 48
    .line 49
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->url:Ljava/lang/String;

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 52
    .line 53
    if-eqz v1, :cond_2

    .line 54
    .line 55
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/AudioMedia;->clone()Lcom/p1/mobile/putong/data/AudioMedia;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 60
    .line 61
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->gif:Lcom/p1/mobile/putong/data/GifMedia;

    .line 62
    .line 63
    if-eqz v1, :cond_3

    .line 64
    .line 65
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/GifMedia;->clone()Lcom/p1/mobile/putong/data/GifMedia;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->gif:Lcom/p1/mobile/putong/data/GifMedia;

    .line 70
    .line 71
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->music:Lcom/p1/mobile/putong/data/Music;

    .line 72
    .line 73
    if-eqz v1, :cond_4

    .line 74
    .line 75
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Music;->clone()Lcom/p1/mobile/putong/data/Music;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->music:Lcom/p1/mobile/putong/data/Music;

    .line 80
    .line 81
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 82
    .line 83
    if-eqz v1, :cond_5

    .line 84
    .line 85
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/AIPosition;->clone()Lcom/p1/mobile/putong/data/AIPosition;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 90
    .line 91
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 92
    .line 93
    if-eqz v1, :cond_6

    .line 94
    .line 95
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/GaussianBlurParameters;->clone()Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 100
    .line 101
    :cond_6
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->status:Ljava/lang/String;

    .line 102
    .line 103
    iput-object p0, v0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->status:Ljava/lang/String;

    .line 104
    .line 105
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 106
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->clone()Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;

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
    check-cast p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->name:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->name:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->duration:F

    .line 34
    .line 35
    iget v3, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->duration:F

    .line 36
    .line 37
    cmpl-float v1, v1, v3

    .line 38
    .line 39
    if-nez v1, :cond_2

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->mediaType:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->mediaType:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_2

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 52
    .line 53
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 54
    .line 55
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_2

    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->attachments:Ljava/util/List;

    .line 62
    .line 63
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->attachments:Ljava/util/List;

    .line 64
    .line 65
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_2

    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->url:Ljava/lang/String;

    .line 72
    .line 73
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->url:Ljava/lang/String;

    .line 74
    .line 75
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-eqz v1, :cond_2

    .line 80
    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 82
    .line 83
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 84
    .line 85
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-eqz v1, :cond_2

    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->gif:Lcom/p1/mobile/putong/data/GifMedia;

    .line 92
    .line 93
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->gif:Lcom/p1/mobile/putong/data/GifMedia;

    .line 94
    .line 95
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    if-eqz v1, :cond_2

    .line 100
    .line 101
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->music:Lcom/p1/mobile/putong/data/Music;

    .line 102
    .line 103
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->music:Lcom/p1/mobile/putong/data/Music;

    .line 104
    .line 105
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-eqz v1, :cond_2

    .line 110
    .line 111
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 112
    .line 113
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 114
    .line 115
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    if-eqz v1, :cond_2

    .line 120
    .line 121
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 122
    .line 123
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 124
    .line 125
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    if-eqz v1, :cond_2

    .line 130
    .line 131
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->status:Ljava/lang/String;

    .line 132
    .line 133
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->status:Ljava/lang/String;

    .line 134
    .line 135
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result p0

    .line 139
    if-eqz p0, :cond_2

    .line 140
    .line 141
    return v0

    .line 142
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "personalbumbginfomedia"

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
    if-nez v0, :cond_c

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->id:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->name:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->duration:F

    .line 35
    .line 36
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    add-int/2addr v0, v1

    .line 41
    mul-int/lit8 v0, v0, 0x29

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->mediaType:Ljava/lang/String;

    .line 44
    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    goto :goto_2

    .line 52
    :cond_2
    move v1, v2

    .line 53
    :goto_2
    add-int/2addr v0, v1

    .line 54
    mul-int/lit8 v0, v0, 0x29

    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 57
    .line 58
    if-eqz v1, :cond_3

    .line 59
    .line 60
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Dimension;->hashCode()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    goto :goto_3

    .line 65
    :cond_3
    move v1, v2

    .line 66
    :goto_3
    add-int/2addr v0, v1

    .line 67
    mul-int/lit8 v0, v0, 0x29

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->attachments:Ljava/util/List;

    .line 70
    .line 71
    if-eqz v1, :cond_4

    .line 72
    .line 73
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    goto :goto_4

    .line 78
    :cond_4
    move v1, v2

    .line 79
    :goto_4
    add-int/2addr v0, v1

    .line 80
    mul-int/lit8 v0, v0, 0x29

    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->url:Ljava/lang/String;

    .line 83
    .line 84
    if-eqz v1, :cond_5

    .line 85
    .line 86
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    goto :goto_5

    .line 91
    :cond_5
    move v1, v2

    .line 92
    :goto_5
    add-int/2addr v0, v1

    .line 93
    mul-int/lit8 v0, v0, 0x29

    .line 94
    .line 95
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 96
    .line 97
    if-eqz v1, :cond_6

    .line 98
    .line 99
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/AudioMedia;->hashCode()I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    goto :goto_6

    .line 104
    :cond_6
    move v1, v2

    .line 105
    :goto_6
    add-int/2addr v0, v1

    .line 106
    mul-int/lit8 v0, v0, 0x29

    .line 107
    .line 108
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->gif:Lcom/p1/mobile/putong/data/GifMedia;

    .line 109
    .line 110
    if-eqz v1, :cond_7

    .line 111
    .line 112
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/GifMedia;->hashCode()I

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    goto :goto_7

    .line 117
    :cond_7
    move v1, v2

    .line 118
    :goto_7
    add-int/2addr v0, v1

    .line 119
    mul-int/lit8 v0, v0, 0x29

    .line 120
    .line 121
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->music:Lcom/p1/mobile/putong/data/Music;

    .line 122
    .line 123
    if-eqz v1, :cond_8

    .line 124
    .line 125
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Music;->hashCode()I

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    goto :goto_8

    .line 130
    :cond_8
    move v1, v2

    .line 131
    :goto_8
    add-int/2addr v0, v1

    .line 132
    mul-int/lit8 v0, v0, 0x29

    .line 133
    .line 134
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 135
    .line 136
    if-eqz v1, :cond_9

    .line 137
    .line 138
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/AIPosition;->hashCode()I

    .line 139
    .line 140
    .line 141
    move-result v1

    .line 142
    goto :goto_9

    .line 143
    :cond_9
    move v1, v2

    .line 144
    :goto_9
    add-int/2addr v0, v1

    .line 145
    mul-int/lit8 v0, v0, 0x29

    .line 146
    .line 147
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 148
    .line 149
    if-eqz v1, :cond_a

    .line 150
    .line 151
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/GaussianBlurParameters;->hashCode()I

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    goto :goto_a

    .line 156
    :cond_a
    move v1, v2

    .line 157
    :goto_a
    add-int/2addr v0, v1

    .line 158
    mul-int/lit8 v0, v0, 0x29

    .line 159
    .line 160
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->status:Ljava/lang/String;

    .line 161
    .line 162
    if-eqz v1, :cond_b

    .line 163
    .line 164
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 165
    .line 166
    .line 167
    move-result v2

    .line 168
    :cond_b
    add-int/2addr v0, v2

    .line 169
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 170
    .line 171
    :cond_c
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->mediaType:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->mediaType:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/data/Dimension;->new_()Lcom/p1/mobile/putong/data/Dimension;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 24
    .line 25
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->url:Ljava/lang/String;

    .line 26
    .line 27
    if-nez v0, :cond_3

    .line 28
    .line 29
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->url:Ljava/lang/String;

    .line 30
    .line 31
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 32
    .line 33
    if-nez v0, :cond_4

    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/data/AIPosition;->new_()Lcom/p1/mobile/putong/data/AIPosition;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 40
    .line 41
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->status:Ljava/lang/String;

    .line 42
    .line 43
    if-nez v0, :cond_5

    .line 44
    .line 45
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->status:Ljava/lang/String;

    .line 46
    .line 47
    :cond_5
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
