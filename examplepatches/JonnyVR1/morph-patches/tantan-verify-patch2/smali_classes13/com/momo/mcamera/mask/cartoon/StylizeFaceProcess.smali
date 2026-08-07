.class public Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/mcamera/mask/cartoon/IProcess;


# static fields
.field public static final NAME:Ljava/lang/String; = "StylizeFaceProcess"

.field private static volatile isLoadedModel:Z = false

.field private static volatile modelPath:Ljava/lang/String; = ""

.field private static volatile startLoad:Z


# instance fields
.field private mask:Lcom/momocv/stylizeface/StylizefaceInfo;

.field private mmFrame:Ll/umw;

.field private params:Lcom/momocv/stylizeface/StylizefaceParams;

.field private scaleFactor:F

.field private stylizeFaceProcess:Lcom/momocv/stylizeface/Stylizeface;


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
    const/high16 v0, -0x40800000    # -1.0f

    .line 5
    .line 6
    iput v0, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->scaleFactor:F

    .line 7
    .line 8
    new-instance v0, Lcom/momocv/stylizeface/Stylizeface;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/momocv/stylizeface/Stylizeface;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->stylizeFaceProcess:Lcom/momocv/stylizeface/Stylizeface;

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic access$000(Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;)Lcom/momocv/stylizeface/Stylizeface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->stylizeFaceProcess:Lcom/momocv/stylizeface/Stylizeface;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->isLoadedModel:Z

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic access$102(Z)Z
    .locals 0

    .line 1
    sput-boolean p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->isLoadedModel:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$200()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->modelPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$302(Z)Z
    .locals 0

    .line 1
    sput-boolean p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->startLoad:Z

    .line 2
    .line 3
    return p0
.end method

.method private declared-synchronized asyncLoadModel(Lcom/momo/mcamera/mask/cartoon/ILoadModelListener;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    sget-object v0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->modelPath:Ljava/lang/String;

    .line 3
    .line 4
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    sget-boolean v0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->startLoad:Z

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    sget-boolean v0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->isLoadedModel:Z

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    sput-boolean v0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->startLoad:Z

    .line 20
    .line 21
    new-instance v0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess$1;

    .line 22
    .line 23
    invoke-direct {v0, p0, p1}, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess$1;-><init>(Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;Lcom/momo/mcamera/mask/cartoon/ILoadModelListener;)V

    .line 24
    .line 25
    .line 26
    const/4 p1, 0x2

    .line 27
    invoke-static {p1, v0}, Lcom/immomo/mmutil/task/c;->d(ILjava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    :goto_0
    monitor-exit p0

    .line 34
    return-void

    .line 35
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    throw p1
.end method

.method private loadModel(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->syncLoadModel()V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    const/4 p1, 0x0

    .line 8
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->asyncLoadModel(Lcom/momo/mcamera/mask/cartoon/ILoadModelListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private syncLoadModel()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->stylizeFaceProcess:Lcom/momocv/stylizeface/Stylizeface;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v1, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->modelPath:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/momocv/stylizeface/Stylizeface;->LoadModel(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    sput-boolean v0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->isLoadedModel:Z

    .line 12
    .line 13
    sget-boolean v0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->isLoadedModel:Z

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->stylizeFaceProcess:Lcom/momocv/stylizeface/Stylizeface;

    .line 18
    .line 19
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v0, "cartoon model is invalid:%s"

    .line 24
    .line 25
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method


# virtual methods
.method public preloadModel(Lcom/momo/mcamera/mask/cartoon/ILoadModelListener;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->asyncLoadModel(Lcom/momo/mcamera/mask/cartoon/ILoadModelListener;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public declared-synchronized process(Ll/omw;IZ)Lcom/momocv/stylizeface/StylizefaceInfo;
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-direct {p0, p3}, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->loadModel(Z)V

    .line 3
    .line 4
    .line 5
    iget-object p3, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->mask:Lcom/momocv/stylizeface/StylizefaceInfo;

    .line 6
    .line 7
    if-nez p3, :cond_0

    .line 8
    .line 9
    new-instance p3, Lcom/momocv/stylizeface/StylizefaceInfo;

    .line 10
    .line 11
    invoke-direct {p3}, Lcom/momocv/stylizeface/StylizefaceInfo;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p3, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->mask:Lcom/momocv/stylizeface/StylizefaceInfo;

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception p1

    .line 18
    goto/16 :goto_3

    .line 19
    .line 20
    :cond_0
    :goto_0
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 21
    .line 22
    .line 23
    move-result p3

    .line 24
    const/4 v0, 0x1

    .line 25
    const/4 v1, 0x0

    .line 26
    if-lt p3, v0, :cond_4

    .line 27
    .line 28
    iget-object p3, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->params:Lcom/momocv/stylizeface/StylizefaceParams;

    .line 29
    .line 30
    if-nez p3, :cond_1

    .line 31
    .line 32
    new-instance p3, Lcom/momocv/stylizeface/StylizefaceParams;

    .line 33
    .line 34
    invoke-direct {p3}, Lcom/momocv/stylizeface/StylizefaceParams;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object p3, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->params:Lcom/momocv/stylizeface/StylizefaceParams;

    .line 38
    .line 39
    :cond_1
    iget-object p3, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->params:Lcom/momocv/stylizeface/StylizefaceParams;

    .line 40
    .line 41
    iget-boolean v0, p1, Ll/omw;->a:Z

    .line 42
    .line 43
    iput-boolean v0, p3, Lcom/momocv/BaseParams;->fliped_show_:Z

    .line 44
    .line 45
    iget v0, p1, Ll/omw;->b:I

    .line 46
    .line 47
    iput v0, p3, Lcom/momocv/BaseParams;->rotate_degree_:I

    .line 48
    .line 49
    iget v0, p1, Ll/omw;->c:I

    .line 50
    .line 51
    iput v0, p3, Lcom/momocv/BaseParams;->restore_degree_:I

    .line 52
    .line 53
    iget v0, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->scaleFactor:F

    .line 54
    .line 55
    iput v0, p3, Lcom/momocv/BaseParams;->scale_factor_:F

    .line 56
    .line 57
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 58
    .line 59
    .line 60
    move-result p3

    .line 61
    iget-object v0, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->params:Lcom/momocv/stylizeface/StylizefaceParams;

    .line 62
    .line 63
    new-array v2, p3, [[F

    .line 64
    .line 65
    iput-object v2, v0, Lcom/momocv/stylizeface/StylizefaceParams;->orig_landmarks_222_all:[[F

    .line 66
    .line 67
    new-array v2, p3, [[F

    .line 68
    .line 69
    iput-object v2, v0, Lcom/momocv/stylizeface/StylizefaceParams;->eular_all:[[F

    .line 70
    .line 71
    :goto_1
    if-ge v1, p3, :cond_2

    .line 72
    .line 73
    invoke-virtual {p1, v1}, Ll/omw;->j(I)Ll/nuf;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    iget-object v2, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->params:Lcom/momocv/stylizeface/StylizefaceParams;

    .line 78
    .line 79
    iget-object v2, v2, Lcom/momocv/stylizeface/StylizefaceParams;->orig_landmarks_222_all:[[F

    .line 80
    .line 81
    invoke-virtual {v0}, Ll/nuf;->q()[F

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    aput-object v3, v2, v1

    .line 86
    .line 87
    iget-object v2, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->params:Lcom/momocv/stylizeface/StylizefaceParams;

    .line 88
    .line 89
    iget-object v2, v2, Lcom/momocv/stylizeface/StylizefaceParams;->eular_all:[[F

    .line 90
    .line 91
    invoke-virtual {v0}, Ll/nuf;->c()[F

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    aput-object v0, v2, v1

    .line 96
    .line 97
    add-int/lit8 v1, v1, 0x1

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_2
    iget-object p3, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->mmFrame:Ll/umw;

    .line 101
    .line 102
    if-nez p3, :cond_3

    .line 103
    .line 104
    new-instance p3, Ll/umw;

    .line 105
    .line 106
    invoke-direct {p3}, Ll/umw;-><init>()V

    .line 107
    .line 108
    .line 109
    iput-object p3, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->mmFrame:Ll/umw;

    .line 110
    .line 111
    :cond_3
    iget-object p3, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->mmFrame:Ll/umw;

    .line 112
    .line 113
    invoke-virtual {p3, p2}, Ll/umw;->h(I)V

    .line 114
    .line 115
    .line 116
    iget-object p2, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->mmFrame:Ll/umw;

    .line 117
    .line 118
    iget-object p3, p1, Ll/omw;->g:[B

    .line 119
    .line 120
    invoke-virtual {p2, p3}, Ll/umw;->g([B)V

    .line 121
    .line 122
    .line 123
    iget-object p2, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->mmFrame:Ll/umw;

    .line 124
    .line 125
    iget-object p3, p1, Ll/omw;->g:[B

    .line 126
    .line 127
    array-length p3, p3

    .line 128
    invoke-virtual {p2, p3}, Ll/umw;->f(I)V

    .line 129
    .line 130
    .line 131
    iget-object p2, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->mmFrame:Ll/umw;

    .line 132
    .line 133
    invoke-virtual {p1}, Ll/omw;->t()I

    .line 134
    .line 135
    .line 136
    move-result p3

    .line 137
    invoke-virtual {p2, p3}, Ll/umw;->m(I)V

    .line 138
    .line 139
    .line 140
    iget-object p2, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->mmFrame:Ll/umw;

    .line 141
    .line 142
    invoke-virtual {p1}, Ll/omw;->m()I

    .line 143
    .line 144
    .line 145
    move-result p3

    .line 146
    invoke-virtual {p2, p3}, Ll/umw;->j(I)V

    .line 147
    .line 148
    .line 149
    iget-object p2, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->mmFrame:Ll/umw;

    .line 150
    .line 151
    invoke-virtual {p1}, Ll/omw;->t()I

    .line 152
    .line 153
    .line 154
    move-result p3

    .line 155
    invoke-virtual {p2, p3}, Ll/umw;->l(I)V

    .line 156
    .line 157
    .line 158
    sget-boolean p2, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->isLoadedModel:Z

    .line 159
    .line 160
    if-eqz p2, :cond_5

    .line 161
    .line 162
    iget-object p2, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->stylizeFaceProcess:Lcom/momocv/stylizeface/Stylizeface;

    .line 163
    .line 164
    if-eqz p2, :cond_5

    .line 165
    .line 166
    iget-object p2, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->params:Lcom/momocv/stylizeface/StylizefaceParams;

    .line 167
    .line 168
    invoke-virtual {p1, p2}, Ll/omw;->B(Lcom/momocv/BaseParams;)V

    .line 169
    .line 170
    .line 171
    iget-object p1, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->stylizeFaceProcess:Lcom/momocv/stylizeface/Stylizeface;

    .line 172
    .line 173
    iget-object p2, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->mmFrame:Ll/umw;

    .line 174
    .line 175
    invoke-virtual {p2}, Ll/umw;->b()Lcom/momocv/MMFrame;

    .line 176
    .line 177
    .line 178
    move-result-object p2

    .line 179
    iget-object p3, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->params:Lcom/momocv/stylizeface/StylizefaceParams;

    .line 180
    .line 181
    iget-object v0, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->mask:Lcom/momocv/stylizeface/StylizefaceInfo;

    .line 182
    .line 183
    invoke-virtual {p1, p2, p3, v0}, Lcom/momocv/stylizeface/Stylizeface;->ProcessFrame(Lcom/momocv/MMFrame;Lcom/momocv/stylizeface/StylizefaceParams;Lcom/momocv/stylizeface/StylizefaceInfo;)Z

    .line 184
    .line 185
    .line 186
    goto :goto_2

    .line 187
    :cond_4
    iget-object p1, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->mask:Lcom/momocv/stylizeface/StylizefaceInfo;

    .line 188
    .line 189
    const/4 p2, 0x0

    .line 190
    iput-object p2, p1, Lcom/momocv/stylizeface/StylizefaceInfo;->warp_mat_all:[[F

    .line 191
    .line 192
    iput-object p2, p1, Lcom/momocv/stylizeface/StylizefaceInfo;->mask_all:[[B

    .line 193
    .line 194
    iput v1, p1, Lcom/momocv/stylizeface/StylizefaceInfo;->mask_width:I

    .line 195
    .line 196
    iput v1, p1, Lcom/momocv/stylizeface/StylizefaceInfo;->mask_height:I

    .line 197
    .line 198
    :cond_5
    :goto_2
    iget-object p1, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->mask:Lcom/momocv/stylizeface/StylizefaceInfo;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 199
    .line 200
    monitor-exit p0

    .line 201
    return-object p1

    .line 202
    :goto_3
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 203
    throw p1
.end method

.method public declared-synchronized process(Ll/omw;)Ljava/lang/Object;
    .locals 2

    monitor-enter p0

    const/16 v0, 0x11

    const/4 v1, 0x0

    .line 204
    :try_start_0
    invoke-virtual {p0, p1, v0, v1}, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->process(Ll/omw;IZ)Lcom/momocv/stylizeface/StylizefaceInfo;

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

.method public release()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->stylizeFaceProcess:Lcom/momocv/stylizeface/Stylizeface;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momocv/stylizeface/Stylizeface;->Release()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->stylizeFaceProcess:Lcom/momocv/stylizeface/Stylizeface;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->mask:Lcom/momocv/stylizeface/StylizefaceInfo;

    .line 12
    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    sput-boolean p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->isLoadedModel:Z

    .line 15
    .line 16
    sput-boolean p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->startLoad:Z

    .line 17
    .line 18
    return-void
.end method

.method public setModelPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p1, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->modelPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setScaleFactor(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/cartoon/StylizeFaceProcess;->scaleFactor:F

    .line 2
    .line 3
    return-void
.end method
