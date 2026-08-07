.class public Ll/qdl0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/MediaMeta;",
            ">;"
        }
    .end annotation
.end field

.field public b:Z

.field public c:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;

.field public d:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

.field public e:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

.field public f:Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;

.field public g:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;

    .line 5
    .line 6
    iput-object p1, p0, Ll/qdl0;->f:Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e0(Lcom/p1/mobile/putong/data/MediaMeta;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/MediaMeta;->sticker:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f0(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic g0(Lcom/p1/mobile/putong/data/MediaMeta;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/MediaMeta;->camera:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/data/MediaMeta;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/MediaMeta;->filter:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method private j0()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qdl0;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p0, p0, Ll/qdl0;->a:Ljava/util/ArrayList;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/p1/mobile/putong/data/MediaMeta;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/data/MediaMeta;->proportion:Ljava/lang/String;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_1
    :goto_0
    const-string p0, ""

    .line 25
    .line 26
    return-object p0
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public i0(Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;)V
    .locals 0

    .line 1
    iget-boolean p0, p1, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->isChosenFromLocal:Z

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    new-instance p0, Ljava/io/File;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->path:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public k0(Ljava/util/ArrayList;ZLcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/MediaMeta;",
            ">;Z",
            "Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;",
            "Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/qdl0;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/qdl0;->b:Z

    .line 4
    .line 5
    iput-object p3, p0, Ll/qdl0;->c:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;

    .line 6
    .line 7
    iput-object p4, p0, Ll/qdl0;->d:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 8
    .line 9
    iput-object p5, p0, Ll/qdl0;->g:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public final l0(Ll/qcj;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "Lcom/p1/mobile/putong/data/MediaMeta;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qdl0;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/odl0;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Ll/odl0;-><init>(Ll/qcj;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance p1, Ll/pdl0;

    .line 16
    .line 17
    invoke-direct {p1}, Ll/pdl0;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-static {p0, p1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Ll/jyb;->n0(Ljava/util/List;)Ljava/util/Set;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string p1, ","

    .line 29
    .line 30
    invoke-static {p1, p0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public m0(Ljava/lang/String;)V
    .locals 9

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lcom/p1/mobile/putong/data/Video;

    .line 7
    .line 8
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/Video;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p1, p0, Ll/qdl0;->d:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->path:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p1, v1, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    iput-boolean p1, v1, Lcom/p1/mobile/putong/data/Video;->isFromNewCamera:Z

    .line 21
    .line 22
    const-string v2, "video/*"

    .line 23
    .line 24
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 25
    .line 26
    const-string v2, "raw"

    .line 27
    .line 28
    invoke-static {v2}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 33
    .line 34
    iget-boolean v2, p0, Ll/qdl0;->b:Z

    .line 35
    .line 36
    if-eqz v2, :cond_0

    .line 37
    .line 38
    move v2, p1

    .line 39
    goto :goto_0

    .line 40
    :cond_0
    iget-object v2, p0, Ll/qdl0;->c:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;

    .line 41
    .line 42
    iget-boolean v2, v2, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->hasOriginalSound:Z

    .line 43
    .line 44
    :goto_0
    iput-boolean v2, v1, Lcom/p1/mobile/putong/data/Video;->hasOriginalSound:Z

    .line 45
    .line 46
    iget-object v2, p0, Ll/qdl0;->e:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 47
    .line 48
    const/4 v3, 0x0

    .line 49
    if-eqz v2, :cond_1

    .line 50
    .line 51
    move v2, p1

    .line 52
    goto :goto_1

    .line 53
    :cond_1
    move v2, v3

    .line 54
    :goto_1
    iput-boolean v2, v1, Lcom/p1/mobile/putong/data/Video;->hasMusic:Z

    .line 55
    .line 56
    iget-object v2, p0, Ll/qdl0;->d:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 57
    .line 58
    iget-wide v4, v2, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->length:J

    .line 59
    .line 60
    long-to-float v2, v4

    .line 61
    iput v2, v1, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 62
    .line 63
    invoke-static {}, Lcom/p1/mobile/putong/data/AudioMedia;->new_()Lcom/p1/mobile/putong/data/AudioMedia;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Video;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 68
    .line 69
    new-instance v2, Lcom/p1/mobile/putong/data/Dimension;

    .line 70
    .line 71
    iget-object v4, p0, Ll/qdl0;->d:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 72
    .line 73
    iget v5, v4, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->width:I

    .line 74
    .line 75
    iget v4, v4, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->height:I

    .line 76
    .line 77
    invoke-direct {v2, v5, v4}, Lcom/p1/mobile/putong/data/Dimension;-><init>(II)V

    .line 78
    .line 79
    .line 80
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 81
    .line 82
    iget-object v2, p0, Ll/qdl0;->e:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 83
    .line 84
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    const-string v4, ""

    .line 89
    .line 90
    if-eqz v2, :cond_5

    .line 91
    .line 92
    iget-object v2, p0, Ll/qdl0;->e:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 93
    .line 94
    iget v5, v2, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->type:I

    .line 95
    .line 96
    const/4 v6, 0x3

    .line 97
    if-ne v5, v6, :cond_2

    .line 98
    .line 99
    move v7, p1

    .line 100
    goto :goto_2

    .line 101
    :cond_2
    move v7, v3

    .line 102
    :goto_2
    iput-boolean v7, v1, Lcom/p1/mobile/putong/data/Video;->isLocalMusic:Z

    .line 103
    .line 104
    iget-object v7, v1, Lcom/p1/mobile/putong/data/Video;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 105
    .line 106
    if-eq v5, v6, :cond_3

    .line 107
    .line 108
    iget-object v8, v2, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->uri:Ljava/lang/String;

    .line 109
    .line 110
    goto :goto_3

    .line 111
    :cond_3
    move-object v8, v4

    .line 112
    :goto_3
    iput-object v8, v7, Lcom/p1/mobile/putong/data/AudioMedia;->url:Ljava/lang/String;

    .line 113
    .line 114
    const-string v8, "audio/mp4"

    .line 115
    .line 116
    iput-object v8, v7, Lcom/p1/mobile/putong/data/AudioMedia;->type:Ljava/lang/String;

    .line 117
    .line 118
    if-eq v5, v6, :cond_4

    .line 119
    .line 120
    iget-object v2, v2, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->id:Ljava/lang/String;

    .line 121
    .line 122
    goto :goto_4

    .line 123
    :cond_4
    move-object v2, v4

    .line 124
    :goto_4
    iput-object v2, v7, Lcom/p1/mobile/putong/data/AudioMedia;->musicId:Ljava/lang/String;

    .line 125
    .line 126
    goto :goto_5

    .line 127
    :cond_5
    iput-boolean v3, v1, Lcom/p1/mobile/putong/data/Video;->isLocalMusic:Z

    .line 128
    .line 129
    :goto_5
    invoke-static {}, Lcom/p1/mobile/putong/data/MediaMeta;->new_()Lcom/p1/mobile/putong/data/MediaMeta;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 134
    .line 135
    const-string v5, "video"

    .line 136
    .line 137
    iput-object v5, v2, Lcom/p1/mobile/putong/data/MediaMeta;->type:Ljava/lang/String;

    .line 138
    .line 139
    invoke-direct {p0}, Ll/qdl0;->j0()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v5

    .line 143
    iput-object v5, v2, Lcom/p1/mobile/putong/data/MediaMeta;->proportion:Ljava/lang/String;

    .line 144
    .line 145
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 146
    .line 147
    iget-boolean v5, p0, Ll/qdl0;->b:Z

    .line 148
    .line 149
    if-eqz v5, :cond_6

    .line 150
    .line 151
    const-string v5, "upload"

    .line 152
    .line 153
    goto :goto_6

    .line 154
    :cond_6
    const-string v5, "shoot"

    .line 155
    .line 156
    :goto_6
    iput-object v5, v2, Lcom/p1/mobile/putong/data/MediaMeta;->source:Ljava/lang/String;

    .line 157
    .line 158
    iget-object v5, v1, Lcom/p1/mobile/putong/data/Video;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 159
    .line 160
    iget-object v5, v5, Lcom/p1/mobile/putong/data/AudioMedia;->musicId:Ljava/lang/String;

    .line 161
    .line 162
    iput-object v5, v2, Lcom/p1/mobile/putong/data/MediaMeta;->musicId:Ljava/lang/String;

    .line 163
    .line 164
    new-instance v5, Ll/ldl0;

    .line 165
    .line 166
    invoke-direct {v5}, Ll/ldl0;-><init>()V

    .line 167
    .line 168
    .line 169
    invoke-virtual {p0, v5}, Ll/qdl0;->l0(Ll/qcj;)Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v5

    .line 173
    iput-object v5, v2, Lcom/p1/mobile/putong/data/MediaMeta;->camera:Ljava/lang/String;

    .line 174
    .line 175
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 176
    .line 177
    new-instance v5, Ll/mdl0;

    .line 178
    .line 179
    invoke-direct {v5}, Ll/mdl0;-><init>()V

    .line 180
    .line 181
    .line 182
    invoke-virtual {p0, v5}, Ll/qdl0;->l0(Ll/qcj;)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v5

    .line 186
    iput-object v5, v2, Lcom/p1/mobile/putong/data/MediaMeta;->sticker:Ljava/lang/String;

    .line 187
    .line 188
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 189
    .line 190
    new-instance v5, Ll/ndl0;

    .line 191
    .line 192
    invoke-direct {v5}, Ll/ndl0;-><init>()V

    .line 193
    .line 194
    .line 195
    invoke-virtual {p0, v5}, Ll/qdl0;->l0(Ll/qcj;)Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v5

    .line 199
    iput-object v5, v2, Lcom/p1/mobile/putong/data/MediaMeta;->filter:Ljava/lang/String;

    .line 200
    .line 201
    iget-boolean v2, v1, Lcom/p1/mobile/putong/data/Video;->isLocalMusic:Z

    .line 202
    .line 203
    if-eqz v2, :cond_7

    .line 204
    .line 205
    const-string v2, "android"

    .line 206
    .line 207
    goto :goto_8

    .line 208
    :cond_7
    iget-object v2, p0, Ll/qdl0;->e:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 209
    .line 210
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 211
    .line 212
    .line 213
    move-result v2

    .line 214
    if-eqz v2, :cond_a

    .line 215
    .line 216
    iget-object v2, p0, Ll/qdl0;->e:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 217
    .line 218
    iget-object v2, v2, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->source:Ljava/lang/String;

    .line 219
    .line 220
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 221
    .line 222
    .line 223
    move-result v2

    .line 224
    if-nez v2, :cond_a

    .line 225
    .line 226
    iget-object v2, p0, Ll/qdl0;->e:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 227
    .line 228
    iget-object v2, v2, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->source:Ljava/lang/String;

    .line 229
    .line 230
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 231
    .line 232
    .line 233
    const-string v5, "brand"

    .line 234
    .line 235
    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 236
    .line 237
    .line 238
    move-result v5

    .line 239
    if-nez v5, :cond_9

    .line 240
    .line 241
    const-string v5, "default"

    .line 242
    .line 243
    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 244
    .line 245
    .line 246
    move-result v2

    .line 247
    if-nez v2, :cond_8

    .line 248
    .line 249
    goto :goto_7

    .line 250
    :cond_8
    const-string v2, "user"

    .line 251
    .line 252
    goto :goto_8

    .line 253
    :cond_9
    const-string v2, "official"

    .line 254
    .line 255
    goto :goto_8

    .line 256
    :cond_a
    :goto_7
    const/4 v2, 0x0

    .line 257
    :goto_8
    iget-object v5, v1, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 258
    .line 259
    iput-object v2, v5, Lcom/p1/mobile/putong/data/MediaMeta;->musicReference:Ljava/lang/String;

    .line 260
    .line 261
    iget-boolean v2, v1, Lcom/p1/mobile/putong/data/Video;->hasMusic:Z

    .line 262
    .line 263
    xor-int/2addr p1, v2

    .line 264
    iput-boolean p1, v5, Lcom/p1/mobile/putong/data/MediaMeta;->hasAudio:Z

    .line 265
    .line 266
    iget-object p1, p0, Ll/qdl0;->c:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;

    .line 267
    .line 268
    iget-boolean p1, p1, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/VideoInfo;->isSameMusic:Z

    .line 269
    .line 270
    iput-boolean p1, v5, Lcom/p1/mobile/putong/data/MediaMeta;->isSameMusic:Z

    .line 271
    .line 272
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 273
    .line 274
    .line 275
    iget-object p1, p0, Ll/qdl0;->f:Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;

    .line 276
    .line 277
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/camera/VideoEditFrag;->Y:Ljava/lang/String;

    .line 278
    .line 279
    const-string v1, "my_states"

    .line 280
    .line 281
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 282
    .line 283
    .line 284
    move-result p1

    .line 285
    if-eqz p1, :cond_b

    .line 286
    .line 287
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 288
    .line 289
    .line 290
    move-result-object p1

    .line 291
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 292
    .line 293
    .line 294
    move-result-object v1

    .line 295
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->v2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 296
    .line 297
    .line 298
    move-result-object v0

    .line 299
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 300
    .line 301
    .line 302
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 303
    .line 304
    .line 305
    move-result-object p1

    .line 306
    invoke-virtual {p1, v3, v3}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 307
    .line 308
    .line 309
    goto :goto_9

    .line 310
    :cond_b
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 311
    .line 312
    .line 313
    move-result-object p1

    .line 314
    iget-object v1, p0, Ll/qdl0;->g:Ljava/lang/String;

    .line 315
    .line 316
    invoke-static {p1, v0, v4, v3, v1}, Ll/cn40;->s0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;Ljava/lang/String;ZLjava/lang/String;)V

    .line 317
    .line 318
    .line 319
    :goto_9
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 320
    .line 321
    .line 322
    move-result-object p0

    .line 323
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 324
    .line 325
    .line 326
    return-void
.end method
