.class public Ll/coi;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/lang/String;

.field public static final b:Ljava/lang/String;

.field public static final c:Ljava/lang/String;

.field public static final d:Ljava/lang/String;

.field public static final e:Ljava/lang/String;

.field public static final f:Ljava/lang/String;

.field public static final g:Ll/vxd0;

.field public static final h:Ll/wyd0;

.field public static final i:Ll/wyd0;

.field public static final j:Ljava/lang/String;

.field public static final k:Ljava/lang/String;

.field public static final l:Ljava/lang/String;

.field public static final m:Ll/wyd0;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 7
    .line 8
    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v2, "live_camera_filter"

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sput-object v0, Ll/coi;->a:Ljava/lang/String;

    .line 34
    .line 35
    new-instance v2, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v3, "filters.zip"

    .line 47
    .line 48
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    sput-object v2, Ll/coi;->b:Ljava/lang/String;

    .line 56
    .line 57
    new-instance v2, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string v3, "filters"

    .line 69
    .line 70
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    sput-object v2, Ll/coi;->c:Ljava/lang/String;

    .line 78
    .line 79
    new-instance v3, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    const-string v4, "douyinResource"

    .line 91
    .line 92
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    sput-object v3, Ll/coi;->d:Ljava/lang/String;

    .line 100
    .line 101
    new-instance v3, Ljava/lang/StringBuilder;

    .line 102
    .line 103
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    const-string v2, "momoResource"

    .line 113
    .line 114
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    sput-object v2, Ll/coi;->e:Ljava/lang/String;

    .line 122
    .line 123
    new-instance v2, Ljava/lang/StringBuilder;

    .line 124
    .line 125
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    const-string v3, "lic"

    .line 135
    .line 136
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    sput-object v2, Ll/coi;->f:Ljava/lang/String;

    .line 144
    .line 145
    new-instance v2, Ll/vxd0;

    .line 146
    .line 147
    const-string v3, "live_camera_filter_version"

    .line 148
    .line 149
    const/4 v4, -0x1

    .line 150
    invoke-direct {v2, v3, v4}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 151
    .line 152
    .line 153
    sput-object v2, Ll/coi;->g:Ll/vxd0;

    .line 154
    .line 155
    new-instance v2, Ll/wyd0;

    .line 156
    .line 157
    const-string v3, "live_camera_filter_type"

    .line 158
    .line 159
    const-string v4, ""

    .line 160
    .line 161
    invoke-direct {v2, v3, v4}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    sput-object v2, Ll/coi;->h:Ll/wyd0;

    .line 165
    .line 166
    new-instance v2, Ll/wyd0;

    .line 167
    .line 168
    const-string v3, "live_momo_lic_md5"

    .line 169
    .line 170
    invoke-direct {v2, v3, v4}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    sput-object v2, Ll/coi;->i:Ll/wyd0;

    .line 174
    .line 175
    new-instance v2, Ljava/lang/StringBuilder;

    .line 176
    .line 177
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    const-string v3, "cvModel"

    .line 187
    .line 188
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v2

    .line 195
    sput-object v2, Ll/coi;->j:Ljava/lang/String;

    .line 196
    .line 197
    new-instance v3, Ljava/lang/StringBuilder;

    .line 198
    .line 199
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 200
    .line 201
    .line 202
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    const-string v0, "mmcv_android_byte_model.zip"

    .line 209
    .line 210
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    sput-object v0, Ll/coi;->k:Ljava/lang/String;

    .line 218
    .line 219
    new-instance v0, Ljava/lang/StringBuilder;

    .line 220
    .line 221
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 222
    .line 223
    .line 224
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    const-string v1, "mmcv_android_byte_model"

    .line 231
    .line 232
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    sput-object v0, Ll/coi;->l:Ljava/lang/String;

    .line 240
    .line 241
    new-instance v0, Ll/wyd0;

    .line 242
    .line 243
    const-string v1, "mmcv_android_byte_model_md5"

    .line 244
    .line 245
    invoke-direct {v0, v1, v4}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 246
    .line 247
    .line 248
    sput-object v0, Ll/coi;->m:Ll/wyd0;

    .line 249
    .line 250
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Ljava/lang/String;Ljava/lang/String;Ll/gcg0;Ljava/io/File;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V
    .locals 1

    .line 1
    const/4 p5, 0x1

    .line 2
    invoke-static {p0, p5}, Ll/xmi;->b(Ljava/lang/String;Z)V

    .line 3
    .line 4
    .line 5
    invoke-static {p6}, Ll/niw;->d(Ljava/io/File;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const/4 v0, 0x0

    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    new-instance p1, Ljava/lang/Throwable;

    .line 17
    .line 18
    const-string p3, "error:file md5 not equal to json\'s zipMd5"

    .line 19
    .line 20
    invoke-direct {p1, p3}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-interface {p2, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p0, v0}, Ll/xmi;->d(Ljava/lang/String;Z)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    invoke-static {p0, p5}, Ll/xmi;->d(Ljava/lang/String;Z)V

    .line 31
    .line 32
    .line 33
    :try_start_0
    invoke-static {p3}, Ll/ecj;->H(Ljava/io/File;)V

    .line 34
    .line 35
    .line 36
    invoke-static {p6, p3}, Ll/oki;->g(Ljava/io/File;Ljava/io/File;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-static {p1}, Ll/oki;->m(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    const-string p1, "[live]beauty_filter"

    .line 47
    .line 48
    const-string p6, "unzip success"

    .line 49
    .line 50
    invoke-static {p1, p6}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-static {p0, p5}, Ll/xmi;->e(Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    .line 55
    .line 56
    sget-object p0, Ll/coi;->g:Ll/vxd0;

    .line 57
    .line 58
    iget p1, p4, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;->version:I

    .line 59
    .line 60
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p0, p1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    sget-object p0, Ll/coi;->h:Ll/wyd0;

    .line 68
    .line 69
    invoke-static {}, Ll/coi;->o()Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    invoke-interface {p2, p4}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    invoke-interface {p2}, Ll/bb50;->onCompleted()V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :catch_0
    move-exception p1

    .line 88
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 89
    .line 90
    .line 91
    invoke-static {p3}, Ll/oki;->k(Ljava/io/File;)V

    .line 92
    .line 93
    .line 94
    invoke-interface {p2, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 95
    .line 96
    .line 97
    invoke-static {p0, v0}, Ll/xmi;->e(Ljava/lang/String;Z)V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public static synthetic c(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;Ll/gcg0;)V
    .locals 7

    .line 1
    :try_start_0
    invoke-static {p0}, Ll/ecj;->H(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/io/File;

    .line 5
    .line 6
    sget-object v1, Ll/coi;->b:Ljava/lang/String;

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v1, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 12
    .line 13
    sget-object v2, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 14
    .line 15
    invoke-virtual {v2}, Lcom/p1/mobile/putong/api/api/Network;->getDownloadHttp()Ll/rg50;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-direct {v1, v2}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;-><init>(Ll/rg50;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->q(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->n(Ljava/io/File;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/zni;

    .line 31
    .line 32
    move-object v5, p0

    .line 33
    move-object v2, p1

    .line 34
    move-object v3, p2

    .line 35
    move-object v6, p3

    .line 36
    move-object v4, p4

    .line 37
    invoke-direct/range {v1 .. v6}, Ll/zni;-><init>(Ljava/lang/String;Ljava/lang/String;Ll/gcg0;Ljava/io/File;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->j(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    new-instance p1, Ll/aoi;

    .line 45
    .line 46
    invoke-direct {p1, v4, v2}, Ll/aoi;-><init>(Ll/gcg0;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->f(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    new-instance p1, Ll/boi;

    .line 54
    .line 55
    invoke-direct {p1, v4, v2}, Ll/boi;-><init>(Ll/gcg0;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->d(Ll/y20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->a()Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-static {}, Lcom/p1/mobile/putong/ui/download/a;->u()Lcom/p1/mobile/putong/ui/download/a;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/ui/download/a;->o(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v2}, Ll/xmi;->c(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :catch_0
    move-exception v0

    .line 78
    move-object v4, p4

    .line 79
    move-object p0, v0

    .line 80
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 81
    .line 82
    .line 83
    invoke-interface {v4, p0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public static synthetic d(Ll/gcg0;Ljava/lang/String;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-interface {p0, p3}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    invoke-static {p1, p0}, Ll/xmi;->b(Ljava/lang/String;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e(Ll/gcg0;Ljava/lang/String;Lcom/p1/mobile/putong/ui/download/DownloadTask;)V
    .locals 1

    .line 1
    new-instance p2, Ljava/lang/RuntimeException;

    .line 2
    .line 3
    const-string v0, "canceled"

    .line 4
    .line 5
    invoke-direct {p2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0, p2}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    invoke-static {p1, p0}, Ll/xmi;->b(Ljava/lang/String;Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic f(Ljava/lang/String;Ll/gcg0;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V
    .locals 1

    .line 1
    const-string p3, "momo lic download success"

    .line 2
    .line 3
    const-string v0, "[live]beauty_filter"

    .line 4
    .line 5
    invoke-static {v0, p3}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p4}, Ll/niw;->d(Ljava/io/File;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p3

    .line 12
    invoke-virtual {p0, p3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 13
    .line 14
    .line 15
    move-result p3

    .line 16
    if-nez p3, :cond_0

    .line 17
    .line 18
    const-string p0, "momo lic md5 check error"

    .line 19
    .line 20
    invoke-static {v0, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Ll/oki;->m(Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    new-instance p0, Ljava/lang/Throwable;

    .line 31
    .line 32
    const-string p2, "error:file md5 not equal to json\'s zipMd5"

    .line 33
    .line 34
    invoke-direct {p0, p2}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-interface {p1, p0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    sget-object p3, Ll/coi;->i:Ll/wyd0;

    .line 42
    .line 43
    invoke-virtual {p3, p0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    sget-object p0, Ll/iit;->Companion:Ll/iit$a;

    .line 47
    .line 48
    sget-object p3, Ll/nu6;->INSTANCE:Ll/nu6;

    .line 49
    .line 50
    invoke-virtual {p0, p3}, Ll/iit$a;->K(Ll/iit;)Ll/iit;

    .line 51
    .line 52
    .line 53
    const-string p0, "momo lic set finish"

    .line 54
    .line 55
    invoke-static {v0, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-interface {p1, p2}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    invoke-interface {p1}, Ll/bb50;->onCompleted()V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public static synthetic g(Ll/gcg0;Lcom/p1/mobile/putong/ui/download/DownloadTask;)V
    .locals 1

    .line 1
    new-instance p1, Ljava/lang/RuntimeException;

    .line 2
    .line 3
    const-string v0, "canceled"

    .line 4
    .line 5
    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    const-string p0, "[live]beauty_filter"

    .line 12
    .line 13
    const-string p1, "momo lic download cancel"

    .line 14
    .line 15
    invoke-static {p0, p1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic h(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;Ll/gcg0;)V
    .locals 3

    .line 1
    const-string v0, "[live]beauty_filter"

    .line 2
    .line 3
    :try_start_0
    invoke-static {p0}, Lcom/tantanapp/media/ttmediautils/tinker/SharePatchFileUtil;->ensureDirectory(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    new-instance v1, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 7
    .line 8
    sget-object v2, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 9
    .line 10
    invoke-virtual {v2}, Lcom/p1/mobile/putong/api/api/Network;->getDownloadHttp()Ll/rg50;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-direct {v1, v2}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;-><init>(Ll/rg50;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->q(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->n(Ljava/io/File;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance p1, Ll/uni;

    .line 26
    .line 27
    invoke-direct {p1, p2, p4, p3}, Ll/uni;-><init>(Ljava/lang/String;Ll/gcg0;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->j(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    new-instance p1, Ll/wni;

    .line 35
    .line 36
    invoke-direct {p1, p4}, Ll/wni;-><init>(Ll/gcg0;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->f(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    new-instance p1, Ll/yni;

    .line 44
    .line 45
    invoke-direct {p1, p4}, Ll/yni;-><init>(Ll/gcg0;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->d(Ll/y20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->a()Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-static {}, Lcom/p1/mobile/putong/ui/download/a;->u()Lcom/p1/mobile/putong/ui/download/a;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/ui/download/a;->o(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    .line 61
    .line 62
    .line 63
    const-string p0, "momo lic download start"

    .line 64
    .line 65
    invoke-static {v0, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :catch_0
    move-exception p0

    .line 70
    new-instance p1, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    const-string p2, "momo lic ensure dir error "

    .line 73
    .line 74
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-static {v0, p1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 92
    .line 93
    .line 94
    invoke-interface {p4, p0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public static synthetic i(Ll/gcg0;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-interface {p0, p2}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string p1, "momo lic download fail "

    .line 7
    .line 8
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string p1, "[live]beauty_filter"

    .line 23
    .line 24
    invoke-static {p1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static j(Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;)Lcom/p1/mobile/putong/live/base/mmsdk/effect/filtermanager/TTPresetFilter;
    .locals 8

    .line 1
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/putong/live/base/mmsdk/effect/filtermanager/TTPresetFilter;

    .line 4
    .line 5
    invoke-direct {v1, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/filtermanager/TTPresetFilter;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v2}, Ll/p6s;->F1()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    const-string v3, "%s"

    .line 17
    .line 18
    const-string v4, "/filter"

    .line 19
    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    new-instance v2, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    sget-object v5, Ll/coi;->e:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    goto :goto_0

    .line 48
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 51
    .line 52
    .line 53
    sget-object v5, Ll/coi;->d:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const-string v4, "%s.png"

    .line 87
    .line 88
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    iget-object v4, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;->name:Ljava/lang/String;

    .line 96
    .line 97
    iput-object v4, v1, Lcom/momo/mcamera/filtermanager/MMFilter;->mFilterName:Ljava/lang/String;

    .line 98
    .line 99
    iget-object v4, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;->id:Ljava/lang/String;

    .line 100
    .line 101
    iput-object v4, v1, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->mFilterId:Ljava/lang/String;

    .line 102
    .line 103
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    iget-object v5, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;->resource:Ljava/lang/String;

    .line 108
    .line 109
    filled-new-array {v5, v5}, [Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v5

    .line 113
    invoke-static {v4, v3, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    iput-object v3, v1, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->lookupUrl:Ljava/lang/String;

    .line 118
    .line 119
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;->icon:Ljava/lang/String;

    .line 120
    .line 121
    iput-object v3, v1, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->mFilterIcon:Ljava/lang/String;

    .line 122
    .line 123
    const/4 v3, 0x0

    .line 124
    iput-boolean v3, v1, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->isIconLocal:Z

    .line 125
    .line 126
    new-instance v4, Ljava/io/File;

    .line 127
    .line 128
    iget-object v5, v1, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->lookupUrl:Ljava/lang/String;

    .line 129
    .line 130
    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    .line 134
    .line 135
    .line 136
    move-result v5

    .line 137
    if-eqz v5, :cond_2

    .line 138
    .line 139
    invoke-virtual {v4}, Ljava/io/File;->length()J

    .line 140
    .line 141
    .line 142
    move-result-wide v4

    .line 143
    const-wide/16 v6, 0x0

    .line 144
    .line 145
    cmp-long v4, v4, v6

    .line 146
    .line 147
    if-gtz v4, :cond_1

    .line 148
    .line 149
    goto :goto_1

    .line 150
    :cond_1
    const/4 v3, 0x1

    .line 151
    iput-boolean v3, v1, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->isFilterFileExist:Z

    .line 152
    .line 153
    iput-boolean v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;->isFilterFileExist:Z

    .line 154
    .line 155
    new-instance v3, Ljava/io/File;

    .line 156
    .line 157
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 158
    .line 159
    .line 160
    move-result-object v4

    .line 161
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;->resource:Ljava/lang/String;

    .line 162
    .line 163
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    invoke-static {v4, v2, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    invoke-direct {v3, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    invoke-static {v0, v3, v1}, Lcom/momo/mcamera/filtermanager/MMPresetFilterStore;->generateFilter(Landroid/content/Context;Ljava/io/File;Lcom/momo/mcamera/filtermanager/MMPresetFilter;)V

    .line 175
    .line 176
    .line 177
    return-object v1

    .line 178
    :cond_2
    :goto_1
    iput-boolean v3, v1, Lcom/momo/mcamera/filtermanager/MMPresetFilter;->isFilterFileExist:Z

    .line 179
    .line 180
    iput-boolean v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;->isFilterFileExist:Z

    .line 181
    .line 182
    const/4 p0, 0x0

    .line 183
    return-object p0
.end method

.method public static k(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;)Lrx/c;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;->licenseMd5:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "[live]beauty_filter"

    .line 8
    .line 9
    if-nez v0, :cond_3

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;->licenseUrl:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Ljava/io/File;

    .line 21
    .line 22
    sget-object v2, Ll/coi;->f:Ljava/lang/String;

    .line 23
    .line 24
    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_1

    .line 32
    .line 33
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;->licenseMd5:Ljava/lang/String;

    .line 34
    .line 35
    sget-object v3, Ll/coi;->i:Ll/wyd0;

    .line 36
    .line 37
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    check-cast v3, Ljava/lang/CharSequence;

    .line 42
    .line 43
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-eqz v2, :cond_1

    .line 48
    .line 49
    const-string v0, "lic exist, ignore"

    .line 50
    .line 51
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0

    .line 59
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_2

    .line 64
    .line 65
    invoke-static {v0}, Ll/oki;->k(Ljava/io/File;)V

    .line 66
    .line 67
    .line 68
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;->licenseUrl:Ljava/lang/String;

    .line 69
    .line 70
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;->licenseMd5:Ljava/lang/String;

    .line 71
    .line 72
    new-instance v3, Ll/sni;

    .line 73
    .line 74
    invoke-direct {v3, v0, v1, v2, p0}, Ll/sni;-><init>(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;)V

    .line 75
    .line 76
    .line 77
    invoke-static {v3}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0

    .line 82
    :cond_3
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    const-string v2, "lic config error, md5 = "

    .line 85
    .line 86
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;->licenseMd5:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    const-string v2, ", url = "

    .line 95
    .line 96
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;->licenseUrl:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-static {v1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    new-instance p0, Ljava/lang/RuntimeException;

    .line 112
    .line 113
    const-string v0, "md5 or url is empty"

    .line 114
    .line 115
    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    invoke-static {p0}, Lrx/c;->error(Ljava/lang/Throwable;)Lrx/c;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    return-object p0
.end method

.method public static l(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;)Lrx/c;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;",
            ">;"
        }
    .end annotation

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    new-instance p0, Ljava/lang/Exception;

    .line 4
    .line 5
    const-string v0, "filter is null"

    .line 6
    .line 7
    invoke-direct {p0, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p0}, Lrx/c;->error(Ljava/lang/Throwable;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    invoke-static {}, Ll/coi;->o()Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget-object v1, Ll/coi;->g:Ll/vxd0;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ljava/lang/Integer;

    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    iget v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;->version:I

    .line 36
    .line 37
    if-lt v1, v2, :cond_2

    .line 38
    .line 39
    sget-object v1, Ll/coi;->c:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v1}, Ll/coi;->r(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-nez v1, :cond_2

    .line 46
    .line 47
    sget-object v1, Ll/coi;->h:Ll/wyd0;

    .line 48
    .line 49
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-nez v1, :cond_1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    const/4 v1, 0x0

    .line 63
    goto :goto_1

    .line 64
    :cond_2
    :goto_0
    const/4 v1, 0x1

    .line 65
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    const-string v3, "beauty select: "

    .line 68
    .line 69
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const-string v0, " ver: "

    .line 76
    .line 77
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    iget v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;->version:I

    .line 81
    .line 82
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string v0, " update: "

    .line 86
    .line 87
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    const-string v2, "[live]beauty_filter"

    .line 98
    .line 99
    invoke-static {v2, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    if-nez v1, :cond_3

    .line 103
    .line 104
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    return-object p0

    .line 109
    :cond_3
    new-instance v0, Ljava/io/File;

    .line 110
    .line 111
    sget-object v1, Ll/coi;->c:Ljava/lang/String;

    .line 112
    .line 113
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    if-eqz v1, :cond_4

    .line 121
    .line 122
    invoke-static {v0}, Ll/oki;->k(Ljava/io/File;)V

    .line 123
    .line 124
    .line 125
    :cond_4
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    invoke-virtual {v1}, Ll/p6s;->F1()Z

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    if-eqz v1, :cond_5

    .line 134
    .line 135
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;->momoResourcesUrl:Ljava/lang/String;

    .line 136
    .line 137
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;->momoMd5:Ljava/lang/String;

    .line 138
    .line 139
    goto :goto_2

    .line 140
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;->resourcesUrl:Ljava/lang/String;

    .line 141
    .line 142
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;->md5:Ljava/lang/String;

    .line 143
    .line 144
    :goto_2
    new-instance v3, Ll/qni;

    .line 145
    .line 146
    invoke-direct {v3, v0, v1, v2, p0}, Ll/qni;-><init>(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;)V

    .line 147
    .line 148
    .line 149
    invoke-static {v3}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    return-object p0
.end method

.method public static m(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/coi;->l(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0}, Ll/coi;->k(Lcom/p1/mobile/putong/live/base/data/BLiveBeautyFilterConfig;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v1, Ll/oni;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/oni;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, p0, v1}, Lrx/c;->zip(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static n(Ljava/util/List;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/mmsdk/effect/filtermanager/TTPresetFilter;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    goto :goto_2

    .line 13
    :cond_0
    const/4 v1, 0x0

    .line 14
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-ge v1, v2, :cond_2

    .line 19
    .line 20
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;

    .line 25
    .line 26
    invoke-static {v2}, Ll/coi;->j(Lcom/p1/mobile/putong/live/base/data/BLiveFilterItem;)Lcom/p1/mobile/putong/live/base/mmsdk/effect/filtermanager/TTPresetFilter;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    if-nez v2, :cond_1

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    :goto_2
    return-object v0
.end method

.method public static o()Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;
    .locals 1

    .line 1
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/p6s;->F1()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;->BEAUTY_TYPE_ENGINE:Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;

    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_0
    sget-object v0, Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;->BEAUTY_TYPE_BYTE:Lcom/immomo/momomediaext/MomoMediaConstants$BEAUTY_TYPE;

    .line 15
    .line 16
    return-object v0
.end method

.method public static p()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/coi;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static q()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/p6s;->F1()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Ll/coi;->e:Ljava/lang/String;

    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_0
    sget-object v0, Ll/coi;->d:Ljava/lang/String;

    .line 15
    .line 16
    return-object v0
.end method

.method public static r(Ljava/lang/String;)Z
    .locals 1

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/io/File;->list()[Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, Ll/jyb;->K([Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0

    .line 25
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 26
    return p0
.end method
