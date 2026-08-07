.class public Lcom/p1/mobile/putong/data/RawPicture;
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
            "Lcom/p1/mobile/putong/data/RawPicture;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/RawPicture;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "rawpicture"


# instance fields
.field public aiPosition:Lcom/p1/mobile/putong/data/AIPosition;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
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
            "Lcom/p1/mobile/putong/data/RawPicture;",
            ">;"
        }
    .end annotation
.end field

.field public audio:Lcom/p1/mobile/putong/data/AudioMedia;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public duration:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public gif:Lcom/p1/mobile/putong/data/GifMedia;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public isPortrait:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public labels:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/MediaLabel;",
            ">;"
        }
    .end annotation
.end field

.field public livePhoto:Lcom/p1/mobile/putong/data/LivePhoto;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public mediaType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public music:Lcom/p1/mobile/putong/data/Music;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public name:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public size:Lcom/p1/mobile/putong/data/Dimension;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public status:Lcom/p1/mobile/putong/data/MediaLocalStatus;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public tags:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public url:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/RawPicture$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/RawPicture$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/RawPicture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/RawPicture$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/RawPicture$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/RawPicture;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/data/MediaLabel;)Lcom/p1/mobile/putong/data/MediaLabel;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic b(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/data/RawPicture;)Lcom/p1/mobile/putong/data/RawPicture;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/RawPicture;->clone()Lcom/p1/mobile/putong/data/RawPicture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/data/RawPicture;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/RawPicture;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/RawPicture;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/RawPicture;->nullCheck()V

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

    .line 147
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/RawPicture;->clone()Lcom/p1/mobile/putong/data/RawPicture;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/RawPicture;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/RawPicture;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/RawPicture;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->name:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/RawPicture;->name:Ljava/lang/String;

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->duration:F

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/data/RawPicture;->duration:F

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->mediaType:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/data/RawPicture;->mediaType:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Dimension;->clone()Lcom/p1/mobile/putong/data/Dimension;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iput-object v1, v0, Lcom/p1/mobile/putong/data/RawPicture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 27
    .line 28
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->url:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/data/RawPicture;->url:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->attachments:Ljava/util/List;

    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    new-instance v2, Ll/olc0;

    .line 37
    .line 38
    invoke-direct {v2}, Ll/olc0;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iput-object v1, v0, Lcom/p1/mobile/putong/data/RawPicture;->attachments:Ljava/util/List;

    .line 46
    .line 47
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 48
    .line 49
    if-eqz v1, :cond_2

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/AudioMedia;->clone()Lcom/p1/mobile/putong/data/AudioMedia;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    iput-object v1, v0, Lcom/p1/mobile/putong/data/RawPicture;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 56
    .line 57
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->gif:Lcom/p1/mobile/putong/data/GifMedia;

    .line 58
    .line 59
    if-eqz v1, :cond_3

    .line 60
    .line 61
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/GifMedia;->clone()Lcom/p1/mobile/putong/data/GifMedia;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iput-object v1, v0, Lcom/p1/mobile/putong/data/RawPicture;->gif:Lcom/p1/mobile/putong/data/GifMedia;

    .line 66
    .line 67
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->music:Lcom/p1/mobile/putong/data/Music;

    .line 68
    .line 69
    if-eqz v1, :cond_4

    .line 70
    .line 71
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Music;->clone()Lcom/p1/mobile/putong/data/Music;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    iput-object v1, v0, Lcom/p1/mobile/putong/data/RawPicture;->music:Lcom/p1/mobile/putong/data/Music;

    .line 76
    .line 77
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 78
    .line 79
    if-eqz v1, :cond_5

    .line 80
    .line 81
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/AIPosition;->clone()Lcom/p1/mobile/putong/data/AIPosition;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    iput-object v1, v0, Lcom/p1/mobile/putong/data/RawPicture;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 86
    .line 87
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 88
    .line 89
    if-eqz v1, :cond_6

    .line 90
    .line 91
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/GaussianBlurParameters;->clone()Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    iput-object v1, v0, Lcom/p1/mobile/putong/data/RawPicture;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 96
    .line 97
    :cond_6
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->isPortrait:Z

    .line 98
    .line 99
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/RawPicture;->isPortrait:Z

    .line 100
    .line 101
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->labels:Ljava/util/List;

    .line 102
    .line 103
    if-eqz v1, :cond_7

    .line 104
    .line 105
    new-instance v2, Ll/plc0;

    .line 106
    .line 107
    invoke-direct {v2}, Ll/plc0;-><init>()V

    .line 108
    .line 109
    .line 110
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    iput-object v1, v0, Lcom/p1/mobile/putong/data/RawPicture;->labels:Ljava/util/List;

    .line 115
    .line 116
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 117
    .line 118
    iput-object v1, v0, Lcom/p1/mobile/putong/data/RawPicture;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 119
    .line 120
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->livePhoto:Lcom/p1/mobile/putong/data/LivePhoto;

    .line 121
    .line 122
    if-eqz v1, :cond_8

    .line 123
    .line 124
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LivePhoto;->clone()Lcom/p1/mobile/putong/data/LivePhoto;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    iput-object v1, v0, Lcom/p1/mobile/putong/data/RawPicture;->livePhoto:Lcom/p1/mobile/putong/data/LivePhoto;

    .line 129
    .line 130
    :cond_8
    iget-object p0, p0, Lcom/p1/mobile/putong/data/RawPicture;->tags:Ljava/util/List;

    .line 131
    .line 132
    if-eqz p0, :cond_9

    .line 133
    .line 134
    new-instance v1, Ll/qlc0;

    .line 135
    .line 136
    invoke-direct {v1}, Ll/qlc0;-><init>()V

    .line 137
    .line 138
    .line 139
    invoke-static {p0, v1}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    iput-object p0, v0, Lcom/p1/mobile/putong/data/RawPicture;->tags:Ljava/util/List;

    .line 144
    .line 145
    :cond_9
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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/RawPicture;->clone()Lcom/p1/mobile/putong/data/RawPicture;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/RawPicture;

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
    check-cast p1, Lcom/p1/mobile/putong/data/RawPicture;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->name:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/RawPicture;->name:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->duration:F

    .line 24
    .line 25
    iget v3, p1, Lcom/p1/mobile/putong/data/RawPicture;->duration:F

    .line 26
    .line 27
    cmpl-float v1, v1, v3

    .line 28
    .line 29
    if-nez v1, :cond_2

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->mediaType:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v3, p1, Lcom/p1/mobile/putong/data/RawPicture;->mediaType:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_2

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 42
    .line 43
    iget-object v3, p1, Lcom/p1/mobile/putong/data/RawPicture;->size:Lcom/p1/mobile/putong/data/Dimension;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->url:Ljava/lang/String;

    .line 52
    .line 53
    iget-object v3, p1, Lcom/p1/mobile/putong/data/RawPicture;->url:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->attachments:Ljava/util/List;

    .line 62
    .line 63
    iget-object v3, p1, Lcom/p1/mobile/putong/data/RawPicture;->attachments:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 72
    .line 73
    iget-object v3, p1, Lcom/p1/mobile/putong/data/RawPicture;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->gif:Lcom/p1/mobile/putong/data/GifMedia;

    .line 82
    .line 83
    iget-object v3, p1, Lcom/p1/mobile/putong/data/RawPicture;->gif:Lcom/p1/mobile/putong/data/GifMedia;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->music:Lcom/p1/mobile/putong/data/Music;

    .line 92
    .line 93
    iget-object v3, p1, Lcom/p1/mobile/putong/data/RawPicture;->music:Lcom/p1/mobile/putong/data/Music;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 102
    .line 103
    iget-object v3, p1, Lcom/p1/mobile/putong/data/RawPicture;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 112
    .line 113
    iget-object v3, p1, Lcom/p1/mobile/putong/data/RawPicture;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->isPortrait:Z

    .line 122
    .line 123
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/RawPicture;->isPortrait:Z

    .line 124
    .line 125
    if-ne v1, v3, :cond_2

    .line 126
    .line 127
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->labels:Ljava/util/List;

    .line 128
    .line 129
    iget-object v3, p1, Lcom/p1/mobile/putong/data/RawPicture;->labels:Ljava/util/List;

    .line 130
    .line 131
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    if-eqz v1, :cond_2

    .line 136
    .line 137
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 138
    .line 139
    iget-object v3, p1, Lcom/p1/mobile/putong/data/RawPicture;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 140
    .line 141
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result v1

    .line 145
    if-eqz v1, :cond_2

    .line 146
    .line 147
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->livePhoto:Lcom/p1/mobile/putong/data/LivePhoto;

    .line 148
    .line 149
    iget-object v3, p1, Lcom/p1/mobile/putong/data/RawPicture;->livePhoto:Lcom/p1/mobile/putong/data/LivePhoto;

    .line 150
    .line 151
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    if-eqz v1, :cond_2

    .line 156
    .line 157
    iget-object p0, p0, Lcom/p1/mobile/putong/data/RawPicture;->tags:Ljava/util/List;

    .line 158
    .line 159
    iget-object p1, p1, Lcom/p1/mobile/putong/data/RawPicture;->tags:Ljava/util/List;

    .line 160
    .line 161
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result p0

    .line 165
    if-eqz p0, :cond_2

    .line 166
    .line 167
    return v0

    .line 168
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "rawpicture"

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
    if-nez v0, :cond_f

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->name:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->duration:F

    .line 22
    .line 23
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    add-int/2addr v0, v1

    .line 28
    mul-int/lit8 v0, v0, 0x29

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->mediaType:Ljava/lang/String;

    .line 31
    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    goto :goto_1

    .line 39
    :cond_1
    move v1, v2

    .line 40
    :goto_1
    add-int/2addr v0, v1

    .line 41
    mul-int/lit8 v0, v0, 0x29

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 44
    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Dimension;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->url:Ljava/lang/String;

    .line 57
    .line 58
    if-eqz v1, :cond_3

    .line 59
    .line 60
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->attachments:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 83
    .line 84
    if-eqz v1, :cond_5

    .line 85
    .line 86
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/AudioMedia;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->gif:Lcom/p1/mobile/putong/data/GifMedia;

    .line 96
    .line 97
    if-eqz v1, :cond_6

    .line 98
    .line 99
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/GifMedia;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->music:Lcom/p1/mobile/putong/data/Music;

    .line 109
    .line 110
    if-eqz v1, :cond_7

    .line 111
    .line 112
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Music;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 122
    .line 123
    if-eqz v1, :cond_8

    .line 124
    .line 125
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/AIPosition;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 135
    .line 136
    if-eqz v1, :cond_9

    .line 137
    .line 138
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/GaussianBlurParameters;->hashCode()I

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->isPortrait:Z

    .line 148
    .line 149
    if-eqz v1, :cond_a

    .line 150
    .line 151
    const/16 v1, 0x4cf

    .line 152
    .line 153
    goto :goto_a

    .line 154
    :cond_a
    const/16 v1, 0x4d5

    .line 155
    .line 156
    :goto_a
    add-int/2addr v0, v1

    .line 157
    mul-int/lit8 v0, v0, 0x29

    .line 158
    .line 159
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->labels:Ljava/util/List;

    .line 160
    .line 161
    if-eqz v1, :cond_b

    .line 162
    .line 163
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 164
    .line 165
    .line 166
    move-result v1

    .line 167
    goto :goto_b

    .line 168
    :cond_b
    move v1, v2

    .line 169
    :goto_b
    add-int/2addr v0, v1

    .line 170
    mul-int/lit8 v0, v0, 0x29

    .line 171
    .line 172
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 173
    .line 174
    if-eqz v1, :cond_c

    .line 175
    .line 176
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 177
    .line 178
    .line 179
    move-result v1

    .line 180
    goto :goto_c

    .line 181
    :cond_c
    move v1, v2

    .line 182
    :goto_c
    add-int/2addr v0, v1

    .line 183
    mul-int/lit8 v0, v0, 0x29

    .line 184
    .line 185
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->livePhoto:Lcom/p1/mobile/putong/data/LivePhoto;

    .line 186
    .line 187
    if-eqz v1, :cond_d

    .line 188
    .line 189
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LivePhoto;->hashCode()I

    .line 190
    .line 191
    .line 192
    move-result v1

    .line 193
    goto :goto_d

    .line 194
    :cond_d
    move v1, v2

    .line 195
    :goto_d
    add-int/2addr v0, v1

    .line 196
    mul-int/lit8 v0, v0, 0x29

    .line 197
    .line 198
    iget-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->tags:Ljava/util/List;

    .line 199
    .line 200
    if-eqz v1, :cond_e

    .line 201
    .line 202
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 203
    .line 204
    .line 205
    move-result v2

    .line 206
    :cond_e
    add-int/2addr v0, v2

    .line 207
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 208
    .line 209
    :cond_f
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/RawPicture;->mediaType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->mediaType:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/RawPicture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/data/Dimension;->new_()Lcom/p1/mobile/putong/data/Dimension;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/data/RawPicture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 18
    .line 19
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/RawPicture;->url:Ljava/lang/String;

    .line 20
    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    iput-object v1, p0, Lcom/p1/mobile/putong/data/RawPicture;->url:Ljava/lang/String;

    .line 24
    .line 25
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/RawPicture;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 26
    .line 27
    if-nez v0, :cond_3

    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/data/AIPosition;->new_()Lcom/p1/mobile/putong/data/AIPosition;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/data/RawPicture;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 34
    .line 35
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/RawPicture;->tags:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/RawPicture;->tags:Ljava/util/List;

    .line 45
    .line 46
    :cond_4
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/RawPicture;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
