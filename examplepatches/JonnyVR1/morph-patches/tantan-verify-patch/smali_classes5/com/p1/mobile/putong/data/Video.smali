.class public Lcom/p1/mobile/putong/data/Video;
.super Lcom/p1/mobile/putong/data/Media;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/Video;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "video"


# instance fields
.field public audio:Lcom/p1/mobile/putong/data/AudioMedia;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x37
    .end annotation
.end field

.field public cover:Lcom/p1/mobile/putong/data/Picture;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation
.end field

.field public cutting:Lcom/p1/mobile/putong/data/CuttingData;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3d
    .end annotation
.end field

.field public duration:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation
.end field

.field public gif:Lcom/p1/mobile/putong/data/GifMedia;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x38
    .end annotation
.end field

.field public hasMusic:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3c
    .end annotation
.end field

.field public hasOriginalSound:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3b
    .end annotation
.end field

.field public isFromNewCamera:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x39
    .end annotation
.end field

.field public isLocalMusic:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3a
    .end annotation
.end field

.field public music:Lcom/p1/mobile/putong/data/Music;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x36
    .end annotation
.end field

.field public size:Lcom/p1/mobile/putong/data/Dimension;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Video$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Video$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/Video;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    return-void
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

.method public static synthetic a(Lcom/p1/mobile/putong/data/IdealTag;)Lcom/p1/mobile/putong/data/IdealTag;
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

.method public static synthetic b(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/data/MediaLabel;)Lcom/p1/mobile/putong/data/MediaLabel;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/data/Video;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Video;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Video;->nullCheck()V

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

    .line 172
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Video;->clone()Lcom/p1/mobile/putong/data/Video;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic clone()Lcom/p1/mobile/putong/data/Media;
    .locals 0

    .line 170
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Video;->clone()Lcom/p1/mobile/putong/data/Video;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/Video;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Video;-><init>()V

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
    new-instance v2, Ll/cal0;

    .line 49
    .line 50
    invoke-direct {v2}, Ll/cal0;-><init>()V

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
    new-instance v2, Ll/dal0;

    .line 64
    .line 65
    invoke-direct {v2}, Ll/dal0;-><init>()V

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
    new-instance v2, Ll/eal0;

    .line 79
    .line 80
    invoke-direct {v2}, Ll/eal0;-><init>()V

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
    iget v1, p0, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 90
    .line 91
    iput v1, v0, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 92
    .line 93
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 94
    .line 95
    if-eqz v1, :cond_4

    .line 96
    .line 97
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Dimension;->clone()Lcom/p1/mobile/putong/data/Dimension;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 102
    .line 103
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 104
    .line 105
    if-eqz v1, :cond_5

    .line 106
    .line 107
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->clone()Lcom/p1/mobile/putong/data/Picture;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 112
    .line 113
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Video;->music:Lcom/p1/mobile/putong/data/Music;

    .line 114
    .line 115
    if-eqz v1, :cond_6

    .line 116
    .line 117
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Music;->clone()Lcom/p1/mobile/putong/data/Music;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Video;->music:Lcom/p1/mobile/putong/data/Music;

    .line 122
    .line 123
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Video;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 124
    .line 125
    if-eqz v1, :cond_7

    .line 126
    .line 127
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/AudioMedia;->clone()Lcom/p1/mobile/putong/data/AudioMedia;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Video;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 132
    .line 133
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Video;->gif:Lcom/p1/mobile/putong/data/GifMedia;

    .line 134
    .line 135
    if-eqz v1, :cond_8

    .line 136
    .line 137
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/GifMedia;->clone()Lcom/p1/mobile/putong/data/GifMedia;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Video;->gif:Lcom/p1/mobile/putong/data/GifMedia;

    .line 142
    .line 143
    :cond_8
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Video;->isFromNewCamera:Z

    .line 144
    .line 145
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/Video;->isFromNewCamera:Z

    .line 146
    .line 147
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Video;->isLocalMusic:Z

    .line 148
    .line 149
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/Video;->isLocalMusic:Z

    .line 150
    .line 151
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Video;->hasOriginalSound:Z

    .line 152
    .line 153
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/Video;->hasOriginalSound:Z

    .line 154
    .line 155
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Video;->hasMusic:Z

    .line 156
    .line 157
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/Video;->hasMusic:Z

    .line 158
    .line 159
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Video;->cutting:Lcom/p1/mobile/putong/data/CuttingData;

    .line 160
    .line 161
    if-eqz p0, :cond_9

    .line 162
    .line 163
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/CuttingData;->clone()Lcom/p1/mobile/putong/data/CuttingData;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Video;->cutting:Lcom/p1/mobile/putong/data/CuttingData;

    .line 168
    .line 169
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

    .line 171
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Video;->clone()Lcom/p1/mobile/putong/data/Video;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/Video;

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
    check-cast v1, Lcom/p1/mobile/putong/data/Video;

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
    iget p1, p0, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 22
    .line 23
    iget v3, v1, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 24
    .line 25
    cmpl-float p1, p1, v3

    .line 26
    .line 27
    if-nez p1, :cond_3

    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 30
    .line 31
    iget-object v3, v1, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 32
    .line 33
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_3

    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 40
    .line 41
    iget-object v3, v1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 42
    .line 43
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_3

    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Video;->music:Lcom/p1/mobile/putong/data/Music;

    .line 50
    .line 51
    iget-object v3, v1, Lcom/p1/mobile/putong/data/Video;->music:Lcom/p1/mobile/putong/data/Music;

    .line 52
    .line 53
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-eqz p1, :cond_3

    .line 58
    .line 59
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Video;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 60
    .line 61
    iget-object v3, v1, Lcom/p1/mobile/putong/data/Video;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 62
    .line 63
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-eqz p1, :cond_3

    .line 68
    .line 69
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Video;->gif:Lcom/p1/mobile/putong/data/GifMedia;

    .line 70
    .line 71
    iget-object v3, v1, Lcom/p1/mobile/putong/data/Video;->gif:Lcom/p1/mobile/putong/data/GifMedia;

    .line 72
    .line 73
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    if-eqz p1, :cond_3

    .line 78
    .line 79
    iget-boolean p1, p0, Lcom/p1/mobile/putong/data/Video;->isFromNewCamera:Z

    .line 80
    .line 81
    iget-boolean v3, v1, Lcom/p1/mobile/putong/data/Video;->isFromNewCamera:Z

    .line 82
    .line 83
    if-ne p1, v3, :cond_3

    .line 84
    .line 85
    iget-boolean p1, p0, Lcom/p1/mobile/putong/data/Video;->isLocalMusic:Z

    .line 86
    .line 87
    iget-boolean v3, v1, Lcom/p1/mobile/putong/data/Video;->isLocalMusic:Z

    .line 88
    .line 89
    if-ne p1, v3, :cond_3

    .line 90
    .line 91
    iget-boolean p1, p0, Lcom/p1/mobile/putong/data/Video;->hasOriginalSound:Z

    .line 92
    .line 93
    iget-boolean v3, v1, Lcom/p1/mobile/putong/data/Video;->hasOriginalSound:Z

    .line 94
    .line 95
    if-ne p1, v3, :cond_3

    .line 96
    .line 97
    iget-boolean p1, p0, Lcom/p1/mobile/putong/data/Video;->hasMusic:Z

    .line 98
    .line 99
    iget-boolean v3, v1, Lcom/p1/mobile/putong/data/Video;->hasMusic:Z

    .line 100
    .line 101
    if-ne p1, v3, :cond_3

    .line 102
    .line 103
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Video;->cutting:Lcom/p1/mobile/putong/data/CuttingData;

    .line 104
    .line 105
    iget-object p1, v1, Lcom/p1/mobile/putong/data/Video;->cutting:Lcom/p1/mobile/putong/data/CuttingData;

    .line 106
    .line 107
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    if-eqz p0, :cond_3

    .line 112
    .line 113
    return v0

    .line 114
    :cond_3
    return v2
.end method

.method public formatAspectRatio()Ljava/lang/String;
    .locals 2

    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    if-eqz v0, :cond_0

    const-string v1, "http"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 50
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Video;->withExtension()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "?format=max_720xX"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 51
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    return-object p0
.end method

.method public formatAspectRatio(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const-string v1, "http"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Video;->withExtension()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string p0, "?format="

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_0

    .line 35
    .line 36
    const-string p1, "max_720xX"

    .line 37
    .line 38
    :cond_0
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 47
    .line 48
    return-object p0
.end method

.method public formatOriginal()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v1, "http"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Video;->withExtension()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string p0, "?format=originalOFGHLERTH"

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 36
    .line 37
    return-object p0
.end method

.method public formatSquare()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const-string v1, "http"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Video;->withExtension()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string p0, "?format=480x480"

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 36
    .line 37
    return-object p0
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "video"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 5

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_a

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
    iget v1, p0, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 12
    .line 13
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    add-int/2addr v0, v1

    .line 18
    mul-int/lit8 v0, v0, 0x29

    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Dimension;->hashCode()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    move v1, v2

    .line 31
    :goto_0
    add-int/2addr v0, v1

    .line 32
    mul-int/lit8 v0, v0, 0x29

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 35
    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->hashCode()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    goto :goto_1

    .line 43
    :cond_1
    move v1, v2

    .line 44
    :goto_1
    add-int/2addr v0, v1

    .line 45
    mul-int/lit8 v0, v0, 0x29

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Video;->music:Lcom/p1/mobile/putong/data/Music;

    .line 48
    .line 49
    if-eqz v1, :cond_2

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Music;->hashCode()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    goto :goto_2

    .line 56
    :cond_2
    move v1, v2

    .line 57
    :goto_2
    add-int/2addr v0, v1

    .line 58
    mul-int/lit8 v0, v0, 0x29

    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Video;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 61
    .line 62
    if-eqz v1, :cond_3

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/AudioMedia;->hashCode()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    goto :goto_3

    .line 69
    :cond_3
    move v1, v2

    .line 70
    :goto_3
    add-int/2addr v0, v1

    .line 71
    mul-int/lit8 v0, v0, 0x29

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Video;->gif:Lcom/p1/mobile/putong/data/GifMedia;

    .line 74
    .line 75
    if-eqz v1, :cond_4

    .line 76
    .line 77
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/GifMedia;->hashCode()I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    goto :goto_4

    .line 82
    :cond_4
    move v1, v2

    .line 83
    :goto_4
    add-int/2addr v0, v1

    .line 84
    mul-int/lit8 v0, v0, 0x29

    .line 85
    .line 86
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Video;->isFromNewCamera:Z

    .line 87
    .line 88
    const/16 v3, 0x4d5

    .line 89
    .line 90
    const/16 v4, 0x4cf

    .line 91
    .line 92
    if-eqz v1, :cond_5

    .line 93
    .line 94
    move v1, v4

    .line 95
    goto :goto_5

    .line 96
    :cond_5
    move v1, v3

    .line 97
    :goto_5
    add-int/2addr v0, v1

    .line 98
    mul-int/lit8 v0, v0, 0x29

    .line 99
    .line 100
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Video;->isLocalMusic:Z

    .line 101
    .line 102
    if-eqz v1, :cond_6

    .line 103
    .line 104
    move v1, v4

    .line 105
    goto :goto_6

    .line 106
    :cond_6
    move v1, v3

    .line 107
    :goto_6
    add-int/2addr v0, v1

    .line 108
    mul-int/lit8 v0, v0, 0x29

    .line 109
    .line 110
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Video;->hasOriginalSound:Z

    .line 111
    .line 112
    if-eqz v1, :cond_7

    .line 113
    .line 114
    move v1, v4

    .line 115
    goto :goto_7

    .line 116
    :cond_7
    move v1, v3

    .line 117
    :goto_7
    add-int/2addr v0, v1

    .line 118
    mul-int/lit8 v0, v0, 0x29

    .line 119
    .line 120
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Video;->hasMusic:Z

    .line 121
    .line 122
    if-eqz v1, :cond_8

    .line 123
    .line 124
    move v3, v4

    .line 125
    :cond_8
    add-int/2addr v0, v3

    .line 126
    mul-int/lit8 v0, v0, 0x29

    .line 127
    .line 128
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Video;->cutting:Lcom/p1/mobile/putong/data/CuttingData;

    .line 129
    .line 130
    if-eqz v1, :cond_9

    .line 131
    .line 132
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/CuttingData;->hashCode()I

    .line 133
    .line 134
    .line 135
    move-result v2

    .line 136
    :cond_9
    add-int/2addr v0, v2

    .line 137
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 138
    .line 139
    :cond_a
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/data/Media;->nullCheck()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->new_()Lcom/p1/mobile/putong/data/Picture;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public withExtension()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ".mp4"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method
