.class public Ll/x9m;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Lcom/p1/mobile/putong/feed/newui/camera/IVVideoEditFrag;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

.field public b:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e0(Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;)V
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

.method public f0(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/x9m;->b:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 2
    .line 3
    iput-object p2, p0, Ll/x9m;->a:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 4
    .line 5
    return-void
.end method

.method public g0(Ljava/lang/String;)V
    .locals 9

    .line 1
    new-instance v1, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/p1/mobile/putong/data/Video;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Video;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p1, p0, Ll/x9m;->a:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->path:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    iput-boolean p1, v0, Lcom/p1/mobile/putong/data/Video;->isFromNewCamera:Z

    .line 21
    .line 22
    const-string v2, "video/*"

    .line 23
    .line 24
    iput-object v2, v0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

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
    iput-object v2, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    iput-boolean v2, v0, Lcom/p1/mobile/putong/data/Video;->hasOriginalSound:Z

    .line 36
    .line 37
    iget-object v3, p0, Ll/x9m;->b:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 38
    .line 39
    if-eqz v3, :cond_0

    .line 40
    .line 41
    move v3, p1

    .line 42
    goto :goto_0

    .line 43
    :cond_0
    move v3, v2

    .line 44
    :goto_0
    iput-boolean v3, v0, Lcom/p1/mobile/putong/data/Video;->hasMusic:Z

    .line 45
    .line 46
    iget-object v3, p0, Ll/x9m;->a:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 47
    .line 48
    iget-wide v3, v3, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->length:J

    .line 49
    .line 50
    long-to-float v3, v3

    .line 51
    iput v3, v0, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 52
    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/data/AudioMedia;->new_()Lcom/p1/mobile/putong/data/AudioMedia;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    iput-object v3, v0, Lcom/p1/mobile/putong/data/Video;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 58
    .line 59
    new-instance v3, Lcom/p1/mobile/putong/data/Dimension;

    .line 60
    .line 61
    iget-object v4, p0, Ll/x9m;->a:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;

    .line 62
    .line 63
    iget v5, v4, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->width:I

    .line 64
    .line 65
    iget v4, v4, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->height:I

    .line 66
    .line 67
    invoke-direct {v3, v5, v4}, Lcom/p1/mobile/putong/data/Dimension;-><init>(II)V

    .line 68
    .line 69
    .line 70
    iput-object v3, v0, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 71
    .line 72
    iget-object v3, p0, Ll/x9m;->b:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 73
    .line 74
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    if-eqz v3, :cond_4

    .line 79
    .line 80
    iget-object v3, p0, Ll/x9m;->b:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 81
    .line 82
    iget v4, v3, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->type:I

    .line 83
    .line 84
    const/4 v5, 0x3

    .line 85
    if-ne v4, v5, :cond_1

    .line 86
    .line 87
    move v6, p1

    .line 88
    goto :goto_1

    .line 89
    :cond_1
    move v6, v2

    .line 90
    :goto_1
    iput-boolean v6, v0, Lcom/p1/mobile/putong/data/Video;->isLocalMusic:Z

    .line 91
    .line 92
    iget-object v6, v0, Lcom/p1/mobile/putong/data/Video;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 93
    .line 94
    const-string v7, ""

    .line 95
    .line 96
    if-eq v4, v5, :cond_2

    .line 97
    .line 98
    iget-object v8, v3, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->uri:Ljava/lang/String;

    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_2
    move-object v8, v7

    .line 102
    :goto_2
    iput-object v8, v6, Lcom/p1/mobile/putong/data/AudioMedia;->url:Ljava/lang/String;

    .line 103
    .line 104
    const-string v8, "audio/mp4"

    .line 105
    .line 106
    iput-object v8, v6, Lcom/p1/mobile/putong/data/AudioMedia;->type:Ljava/lang/String;

    .line 107
    .line 108
    if-eq v4, v5, :cond_3

    .line 109
    .line 110
    iget-object v7, v3, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->id:Ljava/lang/String;

    .line 111
    .line 112
    :cond_3
    iput-object v7, v6, Lcom/p1/mobile/putong/data/AudioMedia;->musicId:Ljava/lang/String;

    .line 113
    .line 114
    goto :goto_3

    .line 115
    :cond_4
    iput-boolean v2, v0, Lcom/p1/mobile/putong/data/Video;->isLocalMusic:Z

    .line 116
    .line 117
    :goto_3
    invoke-static {}, Lcom/p1/mobile/putong/data/MediaMeta;->new_()Lcom/p1/mobile/putong/data/MediaMeta;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    iput-object v3, v0, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 122
    .line 123
    const-string v4, "video"

    .line 124
    .line 125
    iput-object v4, v3, Lcom/p1/mobile/putong/data/MediaMeta;->type:Ljava/lang/String;

    .line 126
    .line 127
    const-string v4, "composer"

    .line 128
    .line 129
    iput-object v4, v3, Lcom/p1/mobile/putong/data/MediaMeta;->source:Ljava/lang/String;

    .line 130
    .line 131
    iget-object v4, v0, Lcom/p1/mobile/putong/data/Video;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 132
    .line 133
    iget-object v4, v4, Lcom/p1/mobile/putong/data/AudioMedia;->musicId:Ljava/lang/String;

    .line 134
    .line 135
    iput-object v4, v3, Lcom/p1/mobile/putong/data/MediaMeta;->musicId:Ljava/lang/String;

    .line 136
    .line 137
    iget-boolean v3, v0, Lcom/p1/mobile/putong/data/Video;->isLocalMusic:Z

    .line 138
    .line 139
    if-eqz v3, :cond_5

    .line 140
    .line 141
    const-string v3, "android"

    .line 142
    .line 143
    goto :goto_5

    .line 144
    :cond_5
    iget-object v3, p0, Ll/x9m;->b:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 145
    .line 146
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    move-result v3

    .line 150
    if-eqz v3, :cond_8

    .line 151
    .line 152
    iget-object v3, p0, Ll/x9m;->b:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 153
    .line 154
    iget-object v3, v3, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->source:Ljava/lang/String;

    .line 155
    .line 156
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 157
    .line 158
    .line 159
    move-result v3

    .line 160
    if-nez v3, :cond_8

    .line 161
    .line 162
    iget-object v3, p0, Ll/x9m;->b:Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;

    .line 163
    .line 164
    iget-object v3, v3, Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;->source:Ljava/lang/String;

    .line 165
    .line 166
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 167
    .line 168
    .line 169
    const-string v4, "brand"

    .line 170
    .line 171
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result v4

    .line 175
    if-nez v4, :cond_7

    .line 176
    .line 177
    const-string v4, "default"

    .line 178
    .line 179
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result v3

    .line 183
    if-nez v3, :cond_6

    .line 184
    .line 185
    goto :goto_4

    .line 186
    :cond_6
    const-string v3, "user"

    .line 187
    .line 188
    goto :goto_5

    .line 189
    :cond_7
    const-string v3, "official"

    .line 190
    .line 191
    goto :goto_5

    .line 192
    :cond_8
    :goto_4
    const/4 v3, 0x0

    .line 193
    :goto_5
    iget-object v4, v0, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 194
    .line 195
    iput-object v3, v4, Lcom/p1/mobile/putong/data/MediaMeta;->musicReference:Ljava/lang/String;

    .line 196
    .line 197
    iput-boolean p1, v4, Lcom/p1/mobile/putong/data/MediaMeta;->hasAudio:Z

    .line 198
    .line 199
    iput-boolean v2, v4, Lcom/p1/mobile/putong/data/MediaMeta;->isSameMusic:Z

    .line 200
    .line 201
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Dd()V

    .line 209
    .line 210
    .line 211
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    const-string v4, "immersion"

    .line 216
    .line 217
    const/4 v5, 0x1

    .line 218
    const-string v2, ""

    .line 219
    .line 220
    const/4 v3, 0x0

    .line 221
    invoke-static/range {v0 .. v5}, Ll/cn40;->t0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;Ljava/lang/String;ZLjava/lang/String;Z)V

    .line 222
    .line 223
    .line 224
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 229
    .line 230
    .line 231
    return-void
.end method
