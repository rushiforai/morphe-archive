.class public Lcom/core/glcore/util/TietieHeartHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static volatile instance:Lcom/core/glcore/util/TietieHeartHelper;


# instance fields
.field private tietieHeartProcess:Lcom/momocv/tietieheart/TietieHeart;

.field private ttHeartInfo:Lcom/momocv/tietieheart/TietieHeartInfo;

.field private final ttHeartMatrix:[F

.field private xeTTHeart:Lcom/momo/xeengine/cv/bean/XETTHeartInfo;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x9

    .line 5
    .line 6
    new-array v0, v0, [F

    .line 7
    .line 8
    fill-array-data v0, :array_0

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/core/glcore/util/TietieHeartHelper;->ttHeartMatrix:[F

    .line 12
    .line 13
    return-void

    .line 14
    nop

    .line 15
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static getInstance()Lcom/core/glcore/util/TietieHeartHelper;
    .locals 2

    .line 1
    sget-object v0, Lcom/core/glcore/util/TietieHeartHelper;->instance:Lcom/core/glcore/util/TietieHeartHelper;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/core/glcore/util/TietieHeartHelper;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/core/glcore/util/TietieHeartHelper;->instance:Lcom/core/glcore/util/TietieHeartHelper;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/core/glcore/util/TietieHeartHelper;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/core/glcore/util/TietieHeartHelper;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/core/glcore/util/TietieHeartHelper;->instance:Lcom/core/glcore/util/TietieHeartHelper;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Lcom/core/glcore/util/TietieHeartHelper;->instance:Lcom/core/glcore/util/TietieHeartHelper;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public getTtHeartInfo()Lcom/momocv/tietieheart/TietieHeartInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/core/glcore/util/TietieHeartHelper;->ttHeartInfo:Lcom/momocv/tietieheart/TietieHeartInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getXeTTHeart()Lcom/momo/xeengine/cv/bean/XETTHeartInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/core/glcore/util/TietieHeartHelper;->xeTTHeart:Lcom/momo/xeengine/cv/bean/XETTHeartInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public declared-synchronized process(Ll/omw;)Lcom/momocv/tietieheart/TietieHeartInfo;
    .locals 1

    monitor-enter p0

    const/16 v0, 0x11

    .line 178
    :try_start_0
    invoke-virtual {p0, p1, v0}, Lcom/core/glcore/util/TietieHeartHelper;->process(Ll/omw;I)Lcom/momocv/tietieheart/TietieHeartInfo;

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

.method public declared-synchronized process(Ll/omw;I)Lcom/momocv/tietieheart/TietieHeartInfo;
    .locals 5

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
    iget-object v0, p0, Lcom/core/glcore/util/TietieHeartHelper;->tietieHeartProcess:Lcom/momocv/tietieheart/TietieHeart;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Lcom/momocv/tietieheart/TietieHeart;

    .line 16
    .line 17
    invoke-direct {v0}, Lcom/momocv/tietieheart/TietieHeart;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/core/glcore/util/TietieHeartHelper;->tietieHeartProcess:Lcom/momocv/tietieheart/TietieHeart;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception p1

    .line 24
    goto/16 :goto_2

    .line 25
    .line 26
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/core/glcore/util/TietieHeartHelper;->ttHeartInfo:Lcom/momocv/tietieheart/TietieHeartInfo;

    .line 27
    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    new-instance v0, Lcom/momocv/tietieheart/TietieHeartInfo;

    .line 31
    .line 32
    invoke-direct {v0}, Lcom/momocv/tietieheart/TietieHeartInfo;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lcom/core/glcore/util/TietieHeartHelper;->ttHeartInfo:Lcom/momocv/tietieheart/TietieHeartInfo;

    .line 36
    .line 37
    :cond_1
    const/4 v0, 0x0

    .line 38
    if-eqz p1, :cond_5

    .line 39
    .line 40
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    const/4 v2, 0x1

    .line 45
    if-lt v1, v2, :cond_5

    .line 46
    .line 47
    new-instance v1, Lcom/momocv/tietieheart/TietieHeartParams;

    .line 48
    .line 49
    invoke-direct {v1}, Lcom/momocv/tietieheart/TietieHeartParams;-><init>()V

    .line 50
    .line 51
    .line 52
    iget-boolean v3, p1, Ll/omw;->a:Z

    .line 53
    .line 54
    iput-boolean v3, v1, Lcom/momocv/BaseParams;->fliped_show_:Z

    .line 55
    .line 56
    iget v3, p1, Ll/omw;->b:I

    .line 57
    .line 58
    iput v3, v1, Lcom/momocv/BaseParams;->rotate_degree_:I

    .line 59
    .line 60
    iget v3, p1, Ll/omw;->c:I

    .line 61
    .line 62
    iput v3, v1, Lcom/momocv/BaseParams;->restore_degree_:I

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Ll/omw;->j(I)Ll/nuf;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    if-eqz v3, :cond_3

    .line 69
    .line 70
    invoke-virtual {v3}, Ll/nuf;->c()[F

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    iget-boolean v4, p1, Ll/omw;->a:Z

    .line 75
    .line 76
    if-eqz v4, :cond_2

    .line 77
    .line 78
    if-eqz v3, :cond_2

    .line 79
    .line 80
    array-length v4, v3

    .line 81
    if-le v4, v2, :cond_2

    .line 82
    .line 83
    aget v4, v3, v2

    .line 84
    .line 85
    neg-float v4, v4

    .line 86
    aput v4, v3, v2

    .line 87
    .line 88
    :cond_2
    iput-object v3, v1, Lcom/momocv/tietieheart/TietieHeartParams;->eular:[F

    .line 89
    .line 90
    :cond_3
    invoke-virtual {p1, v0}, Ll/omw;->j(I)Ll/nuf;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    if-eqz v2, :cond_4

    .line 95
    .line 96
    invoke-virtual {p1, v0}, Ll/omw;->j(I)Ll/nuf;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {v0}, Ll/nuf;->q()[F

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iput-object v0, v1, Lcom/momocv/tietieheart/TietieHeartParams;->orig_landmarks_222_:[F

    .line 105
    .line 106
    :cond_4
    new-instance v0, Ll/umw;

    .line 107
    .line 108
    invoke-direct {v0}, Ll/umw;-><init>()V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0, p2}, Ll/umw;->h(I)V

    .line 112
    .line 113
    .line 114
    iget-object p2, p1, Ll/omw;->g:[B

    .line 115
    .line 116
    invoke-virtual {v0, p2}, Ll/umw;->g([B)V

    .line 117
    .line 118
    .line 119
    iget-object p2, p1, Ll/omw;->g:[B

    .line 120
    .line 121
    array-length p2, p2

    .line 122
    invoke-virtual {v0, p2}, Ll/umw;->f(I)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p1}, Ll/omw;->t()I

    .line 126
    .line 127
    .line 128
    move-result p2

    .line 129
    invoke-virtual {v0, p2}, Ll/umw;->m(I)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p1}, Ll/omw;->m()I

    .line 133
    .line 134
    .line 135
    move-result p2

    .line 136
    invoke-virtual {v0, p2}, Ll/umw;->j(I)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p1}, Ll/omw;->t()I

    .line 140
    .line 141
    .line 142
    move-result p2

    .line 143
    invoke-virtual {v0, p2}, Ll/umw;->l(I)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p1, v1}, Ll/omw;->B(Lcom/momocv/BaseParams;)V

    .line 147
    .line 148
    .line 149
    iget-object p1, p0, Lcom/core/glcore/util/TietieHeartHelper;->tietieHeartProcess:Lcom/momocv/tietieheart/TietieHeart;

    .line 150
    .line 151
    invoke-virtual {v0}, Ll/umw;->b()Lcom/momocv/MMFrame;

    .line 152
    .line 153
    .line 154
    move-result-object p2

    .line 155
    iget-object v0, p0, Lcom/core/glcore/util/TietieHeartHelper;->ttHeartInfo:Lcom/momocv/tietieheart/TietieHeartInfo;

    .line 156
    .line 157
    invoke-virtual {p1, p2, v1, v0}, Lcom/momocv/tietieheart/TietieHeart;->ProcessFrame(Lcom/momocv/MMFrame;Lcom/momocv/tietieheart/TietieHeartParams;Lcom/momocv/tietieheart/TietieHeartInfo;)Z

    .line 158
    .line 159
    .line 160
    goto :goto_1

    .line 161
    :cond_5
    iget-object p1, p0, Lcom/core/glcore/util/TietieHeartHelper;->ttHeartInfo:Lcom/momocv/tietieheart/TietieHeartInfo;

    .line 162
    .line 163
    const/4 p2, 0x0

    .line 164
    iput-object p2, p1, Lcom/momocv/tietieheart/TietieHeartInfo;->warp_mat:[F

    .line 165
    .line 166
    iput-object p2, p1, Lcom/momocv/tietieheart/TietieHeartInfo;->mask_:[B

    .line 167
    .line 168
    iput v0, p1, Lcom/momocv/tietieheart/TietieHeartInfo;->mask_width:I

    .line 169
    .line 170
    iput v0, p1, Lcom/momocv/tietieheart/TietieHeartInfo;->mask_height:I

    .line 171
    .line 172
    :goto_1
    iget-object p1, p0, Lcom/core/glcore/util/TietieHeartHelper;->ttHeartInfo:Lcom/momocv/tietieheart/TietieHeartInfo;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 173
    .line 174
    monitor-exit p0

    .line 175
    return-object p1

    .line 176
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 177
    throw p1
.end method

.method public declared-synchronized release()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/core/glcore/util/TietieHeartHelper;->tietieHeartProcess:Lcom/momocv/tietieheart/TietieHeart;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/momocv/tietieheart/TietieHeart;->Release()V

    .line 8
    .line 9
    .line 10
    iput-object v1, p0, Lcom/core/glcore/util/TietieHeartHelper;->tietieHeartProcess:Lcom/momocv/tietieheart/TietieHeart;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    :goto_0
    iput-object v1, p0, Lcom/core/glcore/util/TietieHeartHelper;->ttHeartInfo:Lcom/momocv/tietieheart/TietieHeartInfo;

    .line 16
    .line 17
    iput-object v1, p0, Lcom/core/glcore/util/TietieHeartHelper;->xeTTHeart:Lcom/momo/xeengine/cv/bean/XETTHeartInfo;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    .line 19
    monitor-exit p0

    .line 20
    return-void

    .line 21
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    throw v0
.end method

.method public setTtHeartInfo(Lcom/momocv/tietieheart/TietieHeartInfo;)V
    .locals 0

    .line 215
    iput-object p1, p0, Lcom/core/glcore/util/TietieHeartHelper;->ttHeartInfo:Lcom/momocv/tietieheart/TietieHeartInfo;

    return-void
.end method

.method public setTtHeartInfo(Ll/omw;Lcom/momocv/tietieheart/TietieHeartInfo;)V
    .locals 7

    .line 1
    if-eqz p2, :cond_2

    .line 2
    .line 3
    iget-object v0, p2, Lcom/momocv/tietieheart/TietieHeartInfo;->mask_:[B

    .line 4
    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    array-length v0, v0

    .line 8
    if-lez v0, :cond_2

    .line 9
    .line 10
    iget v0, p2, Lcom/momocv/tietieheart/TietieHeartInfo;->mask_width:I

    .line 11
    .line 12
    if-lez v0, :cond_2

    .line 13
    .line 14
    iget v0, p2, Lcom/momocv/tietieheart/TietieHeartInfo;->mask_height:I

    .line 15
    .line 16
    if-lez v0, :cond_2

    .line 17
    .line 18
    iget-object v0, p2, Lcom/momocv/tietieheart/TietieHeartInfo;->alpha_all:[[F

    .line 19
    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    array-length v0, v0

    .line 23
    if-lez v0, :cond_2

    .line 24
    .line 25
    iget-object v0, p2, Lcom/momocv/tietieheart/TietieHeartInfo;->warp_mat:[F

    .line 26
    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    array-length v0, v0

    .line 30
    const/4 v1, 0x6

    .line 31
    if-lt v0, v1, :cond_2

    .line 32
    .line 33
    iget-object v0, p0, Lcom/core/glcore/util/TietieHeartHelper;->xeTTHeart:Lcom/momo/xeengine/cv/bean/XETTHeartInfo;

    .line 34
    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    new-instance v0, Lcom/momo/xeengine/cv/bean/XETTHeartInfo;

    .line 38
    .line 39
    invoke-direct {v0}, Lcom/momo/xeengine/cv/bean/XETTHeartInfo;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Lcom/core/glcore/util/TietieHeartHelper;->xeTTHeart:Lcom/momo/xeengine/cv/bean/XETTHeartInfo;

    .line 43
    .line 44
    :cond_0
    iget-object v0, p0, Lcom/core/glcore/util/TietieHeartHelper;->xeTTHeart:Lcom/momo/xeengine/cv/bean/XETTHeartInfo;

    .line 45
    .line 46
    iget-object v2, p2, Lcom/momocv/tietieheart/TietieHeartInfo;->mask_:[B

    .line 47
    .line 48
    invoke-virtual {v0, v2}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setDatas([B)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/core/glcore/util/TietieHeartHelper;->xeTTHeart:Lcom/momo/xeengine/cv/bean/XETTHeartInfo;

    .line 52
    .line 53
    iget v2, p2, Lcom/momocv/tietieheart/TietieHeartInfo;->mask_height:I

    .line 54
    .line 55
    invoke-virtual {v0, v2}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setHeight(I)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/core/glcore/util/TietieHeartHelper;->xeTTHeart:Lcom/momo/xeengine/cv/bean/XETTHeartInfo;

    .line 59
    .line 60
    iget v2, p2, Lcom/momocv/tietieheart/TietieHeartInfo;->mask_width:I

    .line 61
    .line 62
    invoke-virtual {v0, v2}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setWidth(I)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/core/glcore/util/TietieHeartHelper;->xeTTHeart:Lcom/momo/xeengine/cv/bean/XETTHeartInfo;

    .line 66
    .line 67
    iget-object v2, p2, Lcom/momocv/tietieheart/TietieHeartInfo;->mask_:[B

    .line 68
    .line 69
    array-length v2, v2

    .line 70
    invoke-virtual {v0, v2}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setLength(I)V

    .line 71
    .line 72
    .line 73
    new-instance v0, Ljava/util/ArrayList;

    .line 74
    .line 75
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 76
    .line 77
    .line 78
    iget-object v2, p2, Lcom/momocv/tietieheart/TietieHeartInfo;->alpha_all:[[F

    .line 79
    .line 80
    array-length v3, v2

    .line 81
    iget-object v4, p2, Lcom/momocv/tietieheart/TietieHeartInfo;->cx_all:[F

    .line 82
    .line 83
    array-length v4, v4

    .line 84
    const/4 v5, 0x0

    .line 85
    if-gt v3, v4, :cond_1

    .line 86
    .line 87
    array-length v3, v2

    .line 88
    iget-object v4, p2, Lcom/momocv/tietieheart/TietieHeartInfo;->cy_all:[F

    .line 89
    .line 90
    array-length v4, v4

    .line 91
    if-gt v3, v4, :cond_1

    .line 92
    .line 93
    array-length v3, v2

    .line 94
    iget-object v4, p2, Lcom/momocv/tietieheart/TietieHeartInfo;->ddistance_cns_alpha_sort_all:[[F

    .line 95
    .line 96
    array-length v4, v4

    .line 97
    if-gt v3, v4, :cond_1

    .line 98
    .line 99
    array-length v2, v2

    .line 100
    iget-object v3, p2, Lcom/momocv/tietieheart/TietieHeartInfo;->intensity_all:[F

    .line 101
    .line 102
    array-length v3, v3

    .line 103
    if-gt v2, v3, :cond_1

    .line 104
    .line 105
    move v2, v5

    .line 106
    :goto_0
    iget-object v3, p2, Lcom/momocv/tietieheart/TietieHeartInfo;->alpha_all:[[F

    .line 107
    .line 108
    array-length v3, v3

    .line 109
    if-ge v2, v3, :cond_1

    .line 110
    .line 111
    new-instance v3, Lcom/momo/xeengine/cv/bean/XETTHeartInfo$XETTHeartDataBlock;

    .line 112
    .line 113
    iget-object v4, p0, Lcom/core/glcore/util/TietieHeartHelper;->xeTTHeart:Lcom/momo/xeengine/cv/bean/XETTHeartInfo;

    .line 114
    .line 115
    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    invoke-direct {v3, v4}, Lcom/momo/xeengine/cv/bean/XETTHeartInfo$XETTHeartDataBlock;-><init>(Lcom/momo/xeengine/cv/bean/XETTHeartInfo;)V

    .line 119
    .line 120
    .line 121
    iget-object v4, p2, Lcom/momocv/tietieheart/TietieHeartInfo;->alpha_all:[[F

    .line 122
    .line 123
    aget-object v4, v4, v2

    .line 124
    .line 125
    iget-object v6, p2, Lcom/momocv/tietieheart/TietieHeartInfo;->cx_all:[F

    .line 126
    .line 127
    aget v6, v6, v2

    .line 128
    .line 129
    iput v6, v3, Lcom/momo/xeengine/cv/bean/XETTHeartInfo$XETTHeartDataBlock;->cx:F

    .line 130
    .line 131
    iget-object v6, p2, Lcom/momocv/tietieheart/TietieHeartInfo;->cy_all:[F

    .line 132
    .line 133
    aget v6, v6, v2

    .line 134
    .line 135
    iput v6, v3, Lcom/momo/xeengine/cv/bean/XETTHeartInfo$XETTHeartDataBlock;->cy:F

    .line 136
    .line 137
    iget-object v6, p2, Lcom/momocv/tietieheart/TietieHeartInfo;->intensity_all:[F

    .line 138
    .line 139
    aget v6, v6, v2

    .line 140
    .line 141
    iput v6, v3, Lcom/momo/xeengine/cv/bean/XETTHeartInfo$XETTHeartDataBlock;->intensity:F

    .line 142
    .line 143
    iget-object v6, p2, Lcom/momocv/tietieheart/TietieHeartInfo;->ddistance_cns_alpha_sort_all:[[F

    .line 144
    .line 145
    aget-object v6, v6, v2

    .line 146
    .line 147
    invoke-virtual {v3, v6}, Lcom/momo/xeengine/cv/bean/XETTHeartInfo$XETTHeartDataBlock;->setDistances([F)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v3, v4}, Lcom/momo/xeengine/cv/bean/XETTHeartInfo$XETTHeartDataBlock;->setAlphas([F)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    add-int/lit8 v2, v2, 0x1

    .line 157
    .line 158
    goto :goto_0

    .line 159
    :cond_1
    iget-object v2, p0, Lcom/core/glcore/util/TietieHeartHelper;->xeTTHeart:Lcom/momo/xeengine/cv/bean/XETTHeartInfo;

    .line 160
    .line 161
    invoke-virtual {v2, v0}, Lcom/momo/xeengine/cv/bean/XETTHeartInfo;->setDataBlocks(Ljava/util/List;)V

    .line 162
    .line 163
    .line 164
    iget-object v0, p0, Lcom/core/glcore/util/TietieHeartHelper;->ttHeartMatrix:[F

    .line 165
    .line 166
    iget-object p2, p2, Lcom/momocv/tietieheart/TietieHeartInfo;->warp_mat:[F

    .line 167
    .line 168
    aget v2, p2, v5

    .line 169
    .line 170
    aput v2, v0, v5

    .line 171
    .line 172
    const/4 v2, 0x1

    .line 173
    aget v3, p2, v2

    .line 174
    .line 175
    const/4 v4, 0x3

    .line 176
    aput v3, v0, v4

    .line 177
    .line 178
    const/4 v3, 0x2

    .line 179
    aget v3, p2, v3

    .line 180
    .line 181
    aput v3, v0, v1

    .line 182
    .line 183
    aget v1, p2, v4

    .line 184
    .line 185
    aput v1, v0, v2

    .line 186
    .line 187
    const/4 v1, 0x4

    .line 188
    aget v2, p2, v1

    .line 189
    .line 190
    aput v2, v0, v1

    .line 191
    .line 192
    const/4 v1, 0x5

    .line 193
    aget p2, p2, v1

    .line 194
    .line 195
    const/4 v1, 0x7

    .line 196
    aput p2, v0, v1

    .line 197
    .line 198
    iget-object p2, p0, Lcom/core/glcore/util/TietieHeartHelper;->xeTTHeart:Lcom/momo/xeengine/cv/bean/XETTHeartInfo;

    .line 199
    .line 200
    invoke-virtual {p2, v0}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setWarpMat([F)V

    .line 201
    .line 202
    .line 203
    iget-object p0, p0, Lcom/core/glcore/util/TietieHeartHelper;->xeTTHeart:Lcom/momo/xeengine/cv/bean/XETTHeartInfo;

    .line 204
    .line 205
    iget-boolean p1, p1, Ll/omw;->a:Z

    .line 206
    .line 207
    invoke-virtual {p0, p1}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setFlipShowX(Z)V

    .line 208
    .line 209
    .line 210
    return-void

    .line 211
    :cond_2
    const/4 p1, 0x0

    .line 212
    iput-object p1, p0, Lcom/core/glcore/util/TietieHeartHelper;->xeTTHeart:Lcom/momo/xeengine/cv/bean/XETTHeartInfo;

    .line 213
    .line 214
    return-void
.end method

.method public setXeTTHeart(Lcom/momo/xeengine/cv/bean/XETTHeartInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/core/glcore/util/TietieHeartHelper;->xeTTHeart:Lcom/momo/xeengine/cv/bean/XETTHeartInfo;

    .line 2
    .line 3
    return-void
.end method
