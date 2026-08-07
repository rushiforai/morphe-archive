.class public Lcom/core/glcore/util/HandSegmentHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static TAG:Ljava/lang/String; = "HandSegmentHelper"

.field private static cvSegmentInfo:Lcom/momo/xeengine/cv/bean/CVSegmentInfo; = null

.field private static height:I = 0x0

.field private static info:Lcom/momocv/handsg/HandsgInfo; = null

.field private static modelBuff:[B = null

.field private static modelPath:Ljava/lang/String; = null

.field private static restore_degree:I = 0x5a

.field private static rotate_degree:I

.field private static final segMatrix:[F

.field private static segmentation:Lcom/momocv/handsg/Handsg;

.field private static width:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x9

    .line 2
    .line 3
    new-array v0, v0, [F

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/core/glcore/util/HandSegmentHelper;->segMatrix:[F

    .line 9
    .line 10
    new-instance v0, Lcom/momocv/handsg/HandsgInfo;

    .line 11
    .line 12
    invoke-direct {v0}, Lcom/momocv/handsg/HandsgInfo;-><init>()V

    .line 13
    .line 14
    .line 15
    sput-object v0, Lcom/core/glcore/util/HandSegmentHelper;->info:Lcom/momocv/handsg/HandsgInfo;

    .line 16
    .line 17
    return-void

    .line 18
    nop

    .line 19
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

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static dispatchSegmentInfo(Lcom/momocv/handsg/HandsgInfo;Ll/omw;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momocv/handsg/HandsgInfo;->mask_:[B

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    array-length v0, v0

    .line 6
    if-lez v0, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, Lcom/momocv/handsg/HandsgInfo;->warp_mat:[F

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    array-length v0, v0

    .line 13
    const/4 v1, 0x6

    .line 14
    if-lt v0, v1, :cond_1

    .line 15
    .line 16
    iget v0, p0, Lcom/momocv/handsg/HandsgInfo;->mask_width:I

    .line 17
    .line 18
    if-lez v0, :cond_1

    .line 19
    .line 20
    iget v0, p0, Lcom/momocv/handsg/HandsgInfo;->mask_height:I

    .line 21
    .line 22
    if-lez v0, :cond_1

    .line 23
    .line 24
    sget-object v0, Lcom/core/glcore/util/HandSegmentHelper;->cvSegmentInfo:Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    .line 25
    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    new-instance v0, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    .line 29
    .line 30
    invoke-direct {v0}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;-><init>()V

    .line 31
    .line 32
    .line 33
    sput-object v0, Lcom/core/glcore/util/HandSegmentHelper;->cvSegmentInfo:Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    .line 34
    .line 35
    :cond_0
    sget-object v0, Lcom/core/glcore/util/HandSegmentHelper;->cvSegmentInfo:Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    .line 36
    .line 37
    iget-object v2, p0, Lcom/momocv/handsg/HandsgInfo;->mask_:[B

    .line 38
    .line 39
    invoke-virtual {v0, v2}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setDatas([B)V

    .line 40
    .line 41
    .line 42
    sget-object v0, Lcom/core/glcore/util/HandSegmentHelper;->cvSegmentInfo:Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    .line 43
    .line 44
    iget-boolean p1, p1, Ll/omw;->a:Z

    .line 45
    .line 46
    invoke-virtual {v0, p1}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setFlipShowX(Z)V

    .line 47
    .line 48
    .line 49
    sget-object p1, Lcom/core/glcore/util/HandSegmentHelper;->cvSegmentInfo:Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    .line 50
    .line 51
    iget v0, p0, Lcom/momocv/handsg/HandsgInfo;->mask_height:I

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setHeight(I)V

    .line 54
    .line 55
    .line 56
    sget-object p1, Lcom/core/glcore/util/HandSegmentHelper;->cvSegmentInfo:Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    .line 57
    .line 58
    iget v0, p0, Lcom/momocv/handsg/HandsgInfo;->mask_width:I

    .line 59
    .line 60
    invoke-virtual {p1, v0}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setWidth(I)V

    .line 61
    .line 62
    .line 63
    sget-object p1, Lcom/core/glcore/util/HandSegmentHelper;->cvSegmentInfo:Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    .line 64
    .line 65
    iget-object v0, p0, Lcom/momocv/handsg/HandsgInfo;->mask_:[B

    .line 66
    .line 67
    array-length v0, v0

    .line 68
    invoke-virtual {p1, v0}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setLength(I)V

    .line 69
    .line 70
    .line 71
    sget-object p1, Lcom/core/glcore/util/HandSegmentHelper;->segMatrix:[F

    .line 72
    .line 73
    iget-object p0, p0, Lcom/momocv/handsg/HandsgInfo;->warp_mat:[F

    .line 74
    .line 75
    const/4 v0, 0x0

    .line 76
    aget v2, p0, v0

    .line 77
    .line 78
    aput v2, p1, v0

    .line 79
    .line 80
    const/4 v0, 0x1

    .line 81
    aget v2, p0, v0

    .line 82
    .line 83
    const/4 v3, 0x3

    .line 84
    aput v2, p1, v3

    .line 85
    .line 86
    const/4 v2, 0x2

    .line 87
    aget v2, p0, v2

    .line 88
    .line 89
    aput v2, p1, v1

    .line 90
    .line 91
    aget v1, p0, v3

    .line 92
    .line 93
    aput v1, p1, v0

    .line 94
    .line 95
    const/4 v0, 0x4

    .line 96
    aget v1, p0, v0

    .line 97
    .line 98
    aput v1, p1, v0

    .line 99
    .line 100
    const/4 v0, 0x5

    .line 101
    aget p0, p0, v0

    .line 102
    .line 103
    const/4 v0, 0x7

    .line 104
    aput p0, p1, v0

    .line 105
    .line 106
    sget-object p0, Lcom/core/glcore/util/HandSegmentHelper;->cvSegmentInfo:Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    .line 107
    .line 108
    invoke-virtual {p0, p1}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setWarpMat([F)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_1
    new-instance p0, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    .line 113
    .line 114
    invoke-direct {p0}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;-><init>()V

    .line 115
    .line 116
    .line 117
    sput-object p0, Lcom/core/glcore/util/HandSegmentHelper;->cvSegmentInfo:Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    .line 118
    .line 119
    return-void
.end method

.method public static getCvSegmentInfo()Lcom/momo/xeengine/cv/bean/CVSegmentInfo;
    .locals 1

    .line 1
    sget-object v0, Lcom/core/glcore/util/HandSegmentHelper;->cvSegmentInfo:Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getHandsgInfo()Lcom/momocv/handsg/HandsgInfo;
    .locals 1

    .line 1
    sget-object v0, Lcom/core/glcore/util/HandSegmentHelper;->info:Lcom/momocv/handsg/HandsgInfo;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getHeight()I
    .locals 1

    .line 1
    sget v0, Lcom/core/glcore/util/HandSegmentHelper;->height:I

    .line 2
    .line 3
    return v0
.end method

.method public static getModelPath()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/core/glcore/util/HandSegmentHelper;->modelPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getRestoreDegree()I
    .locals 1

    .line 1
    sget v0, Lcom/core/glcore/util/HandSegmentHelper;->restore_degree:I

    .line 2
    .line 3
    return v0
.end method

.method public static getRotateDegree()I
    .locals 1

    .line 1
    sget v0, Lcom/core/glcore/util/HandSegmentHelper;->rotate_degree:I

    .line 2
    .line 3
    return v0
.end method

.method public static getWidth()I
    .locals 1

    .line 1
    sget v0, Lcom/core/glcore/util/HandSegmentHelper;->width:I

    .line 2
    .line 3
    return v0
.end method

.method public static process(Ll/umw;Ll/lnw;Ll/omw;)Lcom/momocv/handsg/HandsgInfo;
    .locals 5

    .line 1
    const-string v0, "The HandSegment mode lode failed !!!"

    .line 2
    .line 3
    sget-object v1, Lcom/core/glcore/util/HandSegmentHelper;->modelPath:Ljava/lang/String;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/core/glcore/util/HandSegmentHelper;->info:Lcom/momocv/handsg/HandsgInfo;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    if-nez p2, :cond_1

    .line 11
    .line 12
    sget-object p0, Lcom/core/glcore/util/HandSegmentHelper;->info:Lcom/momocv/handsg/HandsgInfo;

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    sget-object v1, Lcom/core/glcore/util/HandSegmentHelper;->modelBuff:[B

    .line 16
    .line 17
    if-nez v1, :cond_5

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    :try_start_0
    new-instance v2, Ljava/io/FileInputStream;

    .line 21
    .line 22
    sget-object v3, Lcom/core/glcore/util/HandSegmentHelper;->modelPath:Ljava/lang/String;

    .line 23
    .line 24
    invoke-direct {v2, v3}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 25
    .line 26
    .line 27
    :try_start_1
    invoke-virtual {v2}, Ljava/io/FileInputStream;->available()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    new-array v1, v1, [B

    .line 32
    .line 33
    sput-object v1, Lcom/core/glcore/util/HandSegmentHelper;->modelBuff:[B

    .line 34
    .line 35
    invoke-virtual {v2, v1}, Ljava/io/FileInputStream;->read([B)I

    .line 36
    .line 37
    .line 38
    sget-object v1, Lcom/core/glcore/util/HandSegmentHelper;->segmentation:Lcom/momocv/handsg/Handsg;

    .line 39
    .line 40
    if-nez v1, :cond_2

    .line 41
    .line 42
    new-instance v1, Lcom/momocv/handsg/Handsg;

    .line 43
    .line 44
    invoke-direct {v1}, Lcom/momocv/handsg/Handsg;-><init>()V

    .line 45
    .line 46
    .line 47
    sput-object v1, Lcom/core/glcore/util/HandSegmentHelper;->segmentation:Lcom/momocv/handsg/Handsg;

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :catchall_0
    move-exception v1

    .line 51
    goto :goto_2

    .line 52
    :cond_2
    :goto_0
    sget-object v1, Lcom/core/glcore/util/HandSegmentHelper;->segmentation:Lcom/momocv/handsg/Handsg;

    .line 53
    .line 54
    sget-object v3, Lcom/core/glcore/util/HandSegmentHelper;->modelBuff:[B

    .line 55
    .line 56
    invoke-virtual {v1, v3}, Lcom/momocv/handsg/Handsg;->LoadModel([B)Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-nez v1, :cond_3

    .line 61
    .line 62
    sget-object v1, Lcom/core/glcore/util/HandSegmentHelper;->TAG:Ljava/lang/String;

    .line 63
    .line 64
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 65
    .line 66
    .line 67
    :cond_3
    :try_start_2
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 68
    .line 69
    .line 70
    goto :goto_4

    .line 71
    :catch_0
    move-exception v1

    .line 72
    sget-object v2, Lcom/core/glcore/util/HandSegmentHelper;->TAG:Ljava/lang/String;

    .line 73
    .line 74
    new-instance v3, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    :goto_1
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-static {v2, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    goto :goto_4

    .line 94
    :catchall_1
    move-exception v2

    .line 95
    move-object v4, v2

    .line 96
    move-object v2, v1

    .line 97
    move-object v1, v4

    .line 98
    :goto_2
    :try_start_3
    sget-object v3, Lcom/core/glcore/util/HandSegmentHelper;->TAG:Ljava/lang/String;

    .line 99
    .line 100
    invoke-static {v3, v1}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 101
    .line 102
    .line 103
    if-eqz v2, :cond_5

    .line 104
    .line 105
    :try_start_4
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 106
    .line 107
    .line 108
    goto :goto_4

    .line 109
    :catch_1
    move-exception v1

    .line 110
    sget-object v2, Lcom/core/glcore/util/HandSegmentHelper;->TAG:Ljava/lang/String;

    .line 111
    .line 112
    new-instance v3, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    goto :goto_1

    .line 118
    :catchall_2
    move-exception p0

    .line 119
    if-eqz v2, :cond_4

    .line 120
    .line 121
    :try_start_5
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    .line 122
    .line 123
    .line 124
    goto :goto_3

    .line 125
    :catch_2
    move-exception p1

    .line 126
    sget-object p2, Lcom/core/glcore/util/HandSegmentHelper;->TAG:Ljava/lang/String;

    .line 127
    .line 128
    new-instance v1, Ljava/lang/StringBuilder;

    .line 129
    .line 130
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    invoke-static {p2, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    :cond_4
    :goto_3
    throw p0

    .line 148
    :cond_5
    :goto_4
    sget-object v0, Lcom/core/glcore/util/HandSegmentHelper;->modelBuff:[B

    .line 149
    .line 150
    if-eqz v0, :cond_7

    .line 151
    .line 152
    sget-object v0, Lcom/core/glcore/util/HandSegmentHelper;->segmentation:Lcom/momocv/handsg/Handsg;

    .line 153
    .line 154
    if-nez v0, :cond_6

    .line 155
    .line 156
    new-instance v0, Lcom/momocv/handsg/Handsg;

    .line 157
    .line 158
    invoke-direct {v0}, Lcom/momocv/handsg/Handsg;-><init>()V

    .line 159
    .line 160
    .line 161
    sput-object v0, Lcom/core/glcore/util/HandSegmentHelper;->segmentation:Lcom/momocv/handsg/Handsg;

    .line 162
    .line 163
    :cond_6
    invoke-virtual {p1}, Ll/lnw;->c()Lcom/momocv/BaseParams;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    iget-boolean v0, p2, Ll/omw;->a:Z

    .line 168
    .line 169
    iput-boolean v0, p1, Lcom/momocv/BaseParams;->fliped_show_:Z

    .line 170
    .line 171
    invoke-virtual {p2, p1}, Ll/omw;->B(Lcom/momocv/BaseParams;)V

    .line 172
    .line 173
    .line 174
    sget-object p2, Lcom/core/glcore/util/HandSegmentHelper;->segmentation:Lcom/momocv/handsg/Handsg;

    .line 175
    .line 176
    invoke-virtual {p0}, Ll/umw;->b()Lcom/momocv/MMFrame;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    check-cast p1, Lcom/momocv/handsg/HandsgParams;

    .line 181
    .line 182
    sget-object v0, Lcom/core/glcore/util/HandSegmentHelper;->info:Lcom/momocv/handsg/HandsgInfo;

    .line 183
    .line 184
    invoke-virtual {p2, p0, p1, v0}, Lcom/momocv/handsg/Handsg;->ProcessFrame(Lcom/momocv/MMFrame;Lcom/momocv/handsg/HandsgParams;Lcom/momocv/handsg/HandsgInfo;)Z

    .line 185
    .line 186
    .line 187
    :cond_7
    sget-object p0, Lcom/core/glcore/util/HandSegmentHelper;->info:Lcom/momocv/handsg/HandsgInfo;

    .line 188
    .line 189
    return-object p0
.end method

.method public static processInfo(Ll/umw;Ll/lnw;)Lcom/momocv/handsg/HandsgInfo;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Lcom/core/glcore/util/HandSegmentHelper;->process(Ll/umw;Ll/lnw;Ll/omw;)Lcom/momocv/handsg/HandsgInfo;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static release()V
    .locals 3

    .line 1
    sget-object v0, Lcom/core/glcore/util/HandSegmentHelper;->segmentation:Lcom/momocv/handsg/Handsg;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/momocv/handsg/Handsg;->Release()V

    .line 7
    .line 8
    .line 9
    sput-object v1, Lcom/core/glcore/util/HandSegmentHelper;->segmentation:Lcom/momocv/handsg/Handsg;

    .line 10
    .line 11
    :cond_0
    sget-object v0, Lcom/core/glcore/util/HandSegmentHelper;->info:Lcom/momocv/handsg/HandsgInfo;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v2, v0, Lcom/momocv/handsg/HandsgInfo;->mask_:[B

    .line 16
    .line 17
    if-eqz v2, :cond_1

    .line 18
    .line 19
    iput-object v1, v0, Lcom/momocv/handsg/HandsgInfo;->mask_:[B

    .line 20
    .line 21
    :cond_1
    sget-object v0, Lcom/core/glcore/util/HandSegmentHelper;->modelBuff:[B

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    sput-object v1, Lcom/core/glcore/util/HandSegmentHelper;->modelBuff:[B

    .line 26
    .line 27
    :cond_2
    sput-object v1, Lcom/core/glcore/util/HandSegmentHelper;->cvSegmentInfo:Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    .line 28
    .line 29
    sget-object v0, Lcom/core/glcore/util/HandSegmentHelper;->TAG:Ljava/lang/String;

    .line 30
    .line 31
    const-string v1, "HandSegmentHelper release !!!"

    .line 32
    .line 33
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static setCvSegmentInfo(Lcom/momo/xeengine/cv/bean/CVSegmentInfo;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/core/glcore/util/HandSegmentHelper;->cvSegmentInfo:Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    .line 2
    .line 3
    return-void
.end method

.method public static setHandsgInfo(Lcom/momocv/handsg/HandsgInfo;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/core/glcore/util/HandSegmentHelper;->info:Lcom/momocv/handsg/HandsgInfo;

    .line 2
    .line 3
    return-void
.end method

.method public static setHeight(I)V
    .locals 0

    .line 1
    sput p0, Lcom/core/glcore/util/HandSegmentHelper;->height:I

    .line 2
    .line 3
    return-void
.end method

.method public static setModelPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/core/glcore/util/HandSegmentHelper;->modelPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public static setRestoreDegree(I)V
    .locals 0

    .line 1
    sput p0, Lcom/core/glcore/util/HandSegmentHelper;->restore_degree:I

    .line 2
    .line 3
    return-void
.end method

.method public static setRotateDegree(I)V
    .locals 0

    .line 1
    sput p0, Lcom/core/glcore/util/HandSegmentHelper;->rotate_degree:I

    .line 2
    .line 3
    return-void
.end method

.method public static setWidth(I)V
    .locals 0

    .line 1
    sput p0, Lcom/core/glcore/util/HandSegmentHelper;->width:I

    .line 2
    .line 3
    return-void
.end method
