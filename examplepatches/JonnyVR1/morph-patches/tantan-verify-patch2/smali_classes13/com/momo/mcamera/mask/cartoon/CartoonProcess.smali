.class public Lcom/momo/mcamera/mask/cartoon/CartoonProcess;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static volatile isLoadedModel:Z

.field public static volatile path:Ljava/lang/String;

.field private static volatile resetPath:Z

.field private static volatile startLoad:Z


# instance fields
.field private cartoonProcess:Lcom/momocv/cartoonface/Cartoonface;

.field private mask:Lcom/momocv/cartoonface/CartoonfaceInfo;

.field private mmFrame:Ll/umw;

.field private params:Lcom/momocv/cartoonface/CartoonfaceParams;

.field private volatile release:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->release:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic access$000()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->isLoadedModel:Z

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic access$002(Z)Z
    .locals 0

    .line 1
    sput-boolean p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->isLoadedModel:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$100(Lcom/momo/mcamera/mask/cartoon/CartoonProcess;)Lcom/momocv/cartoonface/Cartoonface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->cartoonProcess:Lcom/momocv/cartoonface/Cartoonface;

    .line 2
    .line 3
    return-object p0
.end method

.method private loadModel(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    sput-boolean v0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->startLoad:Z

    .line 5
    .line 6
    iget-object p0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->cartoonProcess:Lcom/momocv/cartoonface/Cartoonface;

    .line 7
    .line 8
    sget-object p1, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->path:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/momocv/cartoonface/Cartoonface;->LoadModel(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    sput-boolean p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->isLoadedModel:Z

    .line 15
    .line 16
    sget-boolean p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->isLoadedModel:Z

    .line 17
    .line 18
    if-nez p0, :cond_1

    .line 19
    .line 20
    sget-object p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->path:Ljava/lang/String;

    .line 21
    .line 22
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string p1, "cartoon model is invalid:%s"

    .line 27
    .line 28
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    sget-object p1, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->path:Ljava/lang/String;

    .line 33
    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    sget-boolean p1, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->startLoad:Z

    .line 37
    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    sget-boolean p1, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->isLoadedModel:Z

    .line 41
    .line 42
    if-nez p1, :cond_1

    .line 43
    .line 44
    sput-boolean v0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->startLoad:Z

    .line 45
    .line 46
    new-instance p1, Lcom/momo/mcamera/mask/cartoon/CartoonProcess$1;

    .line 47
    .line 48
    invoke-direct {p1, p0}, Lcom/momo/mcamera/mask/cartoon/CartoonProcess$1;-><init>(Lcom/momo/mcamera/mask/cartoon/CartoonProcess;)V

    .line 49
    .line 50
    .line 51
    const/4 p0, 0x2

    .line 52
    invoke-static {p0, p1}, Lcom/immomo/mmutil/task/c;->d(ILjava/lang/Runnable;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method public static resetPath(Ljava/lang/String;)V
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    sget-object v0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->path:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    sput-object p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->path:Ljava/lang/String;

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    sput-boolean p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->resetPath:Z

    .line 15
    .line 16
    :cond_0
    return-void
.end method


# virtual methods
.method public delayRelease()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->release:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->release:Z

    .line 8
    .line 9
    invoke-static {}, Lcom/core/glcore/util/DetectDelayStopHelper;->getInstance()Lcom/core/glcore/util/DetectDelayStopHelper;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Lcom/momo/mcamera/mask/cartoon/CartoonProcess$2;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Lcom/momo/mcamera/mask/cartoon/CartoonProcess$2;-><init>(Lcom/momo/mcamera/mask/cartoon/CartoonProcess;)V

    .line 16
    .line 17
    .line 18
    const/16 p0, 0x2f0

    .line 19
    .line 20
    invoke-virtual {v0, p0, v1}, Lcom/core/glcore/util/DetectDelayStopHelper;->delayRelease(ILjava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public declared-synchronized process(Ll/omw;)Lcom/momocv/cartoonface/CartoonfaceInfo;
    .locals 2

    monitor-enter p0

    const/16 v0, 0x11

    const/4 v1, 0x0

    .line 222
    :try_start_0
    invoke-virtual {p0, p1, v0, v1}, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->process(Ll/omw;IZ)Lcom/momocv/cartoonface/CartoonfaceInfo;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized process(Ll/omw;IZ)Lcom/momocv/cartoonface/CartoonfaceInfo;
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-static {}, Lcom/core/glcore/util/DetectDelayStopHelper;->getInstance()Lcom/core/glcore/util/DetectDelayStopHelper;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    const/16 v1, 0x2f0

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/core/glcore/util/DetectDelayStopHelper;->cancelRelease(I)V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->release:Z

    .line 13
    .line 14
    sget-boolean v1, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->resetPath:Z

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    iget-object v1, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->cartoonProcess:Lcom/momocv/cartoonface/Cartoonface;

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/momocv/cartoonface/Cartoonface;->Release()V

    .line 24
    .line 25
    .line 26
    iput-object v2, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->cartoonProcess:Lcom/momocv/cartoonface/Cartoonface;

    .line 27
    .line 28
    iput-object v2, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->mask:Lcom/momocv/cartoonface/CartoonfaceInfo;

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto/16 :goto_2

    .line 33
    .line 34
    :cond_0
    :goto_0
    sput-boolean v0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->isLoadedModel:Z

    .line 35
    .line 36
    sput-boolean v0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->startLoad:Z

    .line 37
    .line 38
    sput-boolean v0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->resetPath:Z

    .line 39
    .line 40
    :cond_1
    iget-object v1, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->cartoonProcess:Lcom/momocv/cartoonface/Cartoonface;

    .line 41
    .line 42
    if-nez v1, :cond_2

    .line 43
    .line 44
    new-instance v1, Lcom/momocv/cartoonface/Cartoonface;

    .line 45
    .line 46
    invoke-direct {v1}, Lcom/momocv/cartoonface/Cartoonface;-><init>()V

    .line 47
    .line 48
    .line 49
    iput-object v1, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->cartoonProcess:Lcom/momocv/cartoonface/Cartoonface;

    .line 50
    .line 51
    :cond_2
    invoke-direct {p0, p3}, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->loadModel(Z)V

    .line 52
    .line 53
    .line 54
    iget-object p3, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->mask:Lcom/momocv/cartoonface/CartoonfaceInfo;

    .line 55
    .line 56
    if-nez p3, :cond_3

    .line 57
    .line 58
    new-instance p3, Lcom/momocv/cartoonface/CartoonfaceInfo;

    .line 59
    .line 60
    invoke-direct {p3}, Lcom/momocv/cartoonface/CartoonfaceInfo;-><init>()V

    .line 61
    .line 62
    .line 63
    iput-object p3, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->mask:Lcom/momocv/cartoonface/CartoonfaceInfo;

    .line 64
    .line 65
    :cond_3
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 66
    .line 67
    .line 68
    move-result p3

    .line 69
    const/4 v1, 0x1

    .line 70
    if-lt p3, v1, :cond_7

    .line 71
    .line 72
    iget-object p3, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->params:Lcom/momocv/cartoonface/CartoonfaceParams;

    .line 73
    .line 74
    if-nez p3, :cond_4

    .line 75
    .line 76
    new-instance p3, Lcom/momocv/cartoonface/CartoonfaceParams;

    .line 77
    .line 78
    invoke-direct {p3}, Lcom/momocv/cartoonface/CartoonfaceParams;-><init>()V

    .line 79
    .line 80
    .line 81
    iput-object p3, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->params:Lcom/momocv/cartoonface/CartoonfaceParams;

    .line 82
    .line 83
    :cond_4
    iget-object p3, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->params:Lcom/momocv/cartoonface/CartoonfaceParams;

    .line 84
    .line 85
    iget-boolean v1, p1, Ll/omw;->a:Z

    .line 86
    .line 87
    iput-boolean v1, p3, Lcom/momocv/BaseParams;->fliped_show_:Z

    .line 88
    .line 89
    iget v1, p1, Ll/omw;->b:I

    .line 90
    .line 91
    iput v1, p3, Lcom/momocv/BaseParams;->rotate_degree_:I

    .line 92
    .line 93
    iget v1, p1, Ll/omw;->c:I

    .line 94
    .line 95
    iput v1, p3, Lcom/momocv/BaseParams;->restore_degree_:I

    .line 96
    .line 97
    invoke-virtual {p1, v0}, Ll/omw;->j(I)Ll/nuf;

    .line 98
    .line 99
    .line 100
    move-result-object p3

    .line 101
    if-eqz p3, :cond_5

    .line 102
    .line 103
    invoke-virtual {p1, v0}, Ll/omw;->j(I)Ll/nuf;

    .line 104
    .line 105
    .line 106
    move-result-object p3

    .line 107
    iget-object v0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->params:Lcom/momocv/cartoonface/CartoonfaceParams;

    .line 108
    .line 109
    invoke-virtual {p3}, Ll/nuf;->q()[F

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    iput-object v1, v0, Lcom/momocv/cartoonface/CartoonfaceParams;->orig_landmarks_222_:[F

    .line 114
    .line 115
    iget-object v0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->params:Lcom/momocv/cartoonface/CartoonfaceParams;

    .line 116
    .line 117
    invoke-virtual {p3}, Ll/nuf;->c()[F

    .line 118
    .line 119
    .line 120
    move-result-object p3

    .line 121
    iput-object p3, v0, Lcom/momocv/cartoonface/CartoonfaceParams;->eular:[F

    .line 122
    .line 123
    :cond_5
    iget-object p3, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->mmFrame:Ll/umw;

    .line 124
    .line 125
    if-nez p3, :cond_6

    .line 126
    .line 127
    new-instance p3, Ll/umw;

    .line 128
    .line 129
    invoke-direct {p3}, Ll/umw;-><init>()V

    .line 130
    .line 131
    .line 132
    iput-object p3, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->mmFrame:Ll/umw;

    .line 133
    .line 134
    :cond_6
    iget-object p3, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->mmFrame:Ll/umw;

    .line 135
    .line 136
    invoke-virtual {p3, p2}, Ll/umw;->h(I)V

    .line 137
    .line 138
    .line 139
    iget-object p2, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->mmFrame:Ll/umw;

    .line 140
    .line 141
    iget-object p3, p1, Ll/omw;->g:[B

    .line 142
    .line 143
    invoke-virtual {p2, p3}, Ll/umw;->g([B)V

    .line 144
    .line 145
    .line 146
    iget-object p2, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->mmFrame:Ll/umw;

    .line 147
    .line 148
    iget-object p3, p1, Ll/omw;->g:[B

    .line 149
    .line 150
    array-length p3, p3

    .line 151
    invoke-virtual {p2, p3}, Ll/umw;->f(I)V

    .line 152
    .line 153
    .line 154
    iget-object p2, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->mmFrame:Ll/umw;

    .line 155
    .line 156
    invoke-virtual {p1}, Ll/omw;->t()I

    .line 157
    .line 158
    .line 159
    move-result p3

    .line 160
    invoke-virtual {p2, p3}, Ll/umw;->m(I)V

    .line 161
    .line 162
    .line 163
    iget-object p2, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->mmFrame:Ll/umw;

    .line 164
    .line 165
    invoke-virtual {p1}, Ll/omw;->m()I

    .line 166
    .line 167
    .line 168
    move-result p3

    .line 169
    invoke-virtual {p2, p3}, Ll/umw;->j(I)V

    .line 170
    .line 171
    .line 172
    iget-object p2, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->mmFrame:Ll/umw;

    .line 173
    .line 174
    invoke-virtual {p1}, Ll/omw;->t()I

    .line 175
    .line 176
    .line 177
    move-result p3

    .line 178
    invoke-virtual {p2, p3}, Ll/umw;->l(I)V

    .line 179
    .line 180
    .line 181
    sget-boolean p2, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->isLoadedModel:Z

    .line 182
    .line 183
    if-eqz p2, :cond_8

    .line 184
    .line 185
    iget-object p2, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->params:Lcom/momocv/cartoonface/CartoonfaceParams;

    .line 186
    .line 187
    invoke-virtual {p1, p2}, Ll/omw;->B(Lcom/momocv/BaseParams;)V

    .line 188
    .line 189
    .line 190
    iget-object p1, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->cartoonProcess:Lcom/momocv/cartoonface/Cartoonface;

    .line 191
    .line 192
    iget-object p2, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->mmFrame:Ll/umw;

    .line 193
    .line 194
    invoke-virtual {p2}, Ll/umw;->b()Lcom/momocv/MMFrame;

    .line 195
    .line 196
    .line 197
    move-result-object p2

    .line 198
    iget-object p3, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->params:Lcom/momocv/cartoonface/CartoonfaceParams;

    .line 199
    .line 200
    iget-object v0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->mask:Lcom/momocv/cartoonface/CartoonfaceInfo;

    .line 201
    .line 202
    invoke-virtual {p1, p2, p3, v0}, Lcom/momocv/cartoonface/Cartoonface;->ProcessFrame(Lcom/momocv/MMFrame;Lcom/momocv/cartoonface/CartoonfaceParams;Lcom/momocv/cartoonface/CartoonfaceInfo;)Z

    .line 203
    .line 204
    .line 205
    goto :goto_1

    .line 206
    :cond_7
    iget-object p1, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->mask:Lcom/momocv/cartoonface/CartoonfaceInfo;

    .line 207
    .line 208
    iput-object v2, p1, Lcom/momocv/cartoonface/CartoonfaceInfo;->warp_mat:[F

    .line 209
    .line 210
    iput-object v2, p1, Lcom/momocv/cartoonface/CartoonfaceInfo;->mask_:[B

    .line 211
    .line 212
    iput v0, p1, Lcom/momocv/cartoonface/CartoonfaceInfo;->mask_width:I

    .line 213
    .line 214
    iput v0, p1, Lcom/momocv/cartoonface/CartoonfaceInfo;->mask_height:I

    .line 215
    .line 216
    :cond_8
    :goto_1
    iget-object p1, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->mask:Lcom/momocv/cartoonface/CartoonfaceInfo;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 217
    .line 218
    monitor-exit p0

    .line 219
    return-object p1

    .line 220
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 221
    throw p1
.end method

.method public declared-synchronized release()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->cartoonProcess:Lcom/momocv/cartoonface/Cartoonface;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/momocv/cartoonface/Cartoonface;->Release()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->cartoonProcess:Lcom/momocv/cartoonface/Cartoonface;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->mask:Lcom/momocv/cartoonface/CartoonfaceInfo;

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception v0

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    :goto_0
    const/4 v0, 0x0

    .line 18
    sput-boolean v0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->startLoad:Z

    .line 19
    .line 20
    sput-boolean v0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->isLoadedModel:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    monitor-exit p0

    .line 23
    return-void

    .line 24
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    throw v0
.end method

.method public declared-synchronized switchCartoon()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    :try_start_0
    iput-object v0, p0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->mask:Lcom/momocv/cartoonface/CartoonfaceInfo;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    sput-boolean v0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->startLoad:Z

    .line 7
    .line 8
    sput-boolean v0, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->isLoadedModel:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    monitor-exit p0

    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception v0

    .line 13
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    throw v0
.end method
