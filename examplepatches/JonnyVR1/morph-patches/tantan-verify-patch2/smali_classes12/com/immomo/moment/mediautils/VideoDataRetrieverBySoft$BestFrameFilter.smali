.class Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "BestFrameFilter"
.end annotation


# instance fields
.field private mInterval:I

.field private mMaxCnt:I

.field private mNeedFrameCnt:I

.field private mPtsStep:J

.field processInput:Ll/cr2;

.field final synthetic this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

.field private yuv:[B


# direct methods
.method public constructor <init>(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->mMaxCnt:I

    .line 8
    .line 9
    const-wide/16 v0, 0x0

    .line 10
    .line 11
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->mPtsStep:J

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic access$000(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->setFrameCnt(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$700(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;[B)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->setYuv([B)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private setFrameCnt(II)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->mNeedFrameCnt:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-nez p2, :cond_3

    .line 5
    .line 6
    const/16 p2, 0xa

    .line 7
    .line 8
    if-gt p1, p2, :cond_0

    .line 9
    .line 10
    const/4 p2, 0x3

    .line 11
    iput p2, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->mInterval:I

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/16 p2, 0x14

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    if-gt p1, p2, :cond_1

    .line 18
    .line 19
    iput v1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->mInterval:I

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/16 p2, 0x1e

    .line 23
    .line 24
    if-gt p1, p2, :cond_2

    .line 25
    .line 26
    iput v1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->mInterval:I

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_2
    iput v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->mInterval:I

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_3
    iget v1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->mInterval:I

    .line 33
    .line 34
    if-lez v1, :cond_4

    .line 35
    .line 36
    iput p2, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->mInterval:I

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_4
    iput v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->mInterval:I

    .line 40
    .line 41
    :goto_0
    iget p2, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->mInterval:I

    .line 42
    .line 43
    if-ne p2, v0, :cond_5

    .line 44
    .line 45
    const-wide/32 p1, 0x9c40

    .line 46
    .line 47
    .line 48
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->mPtsStep:J

    .line 49
    .line 50
    return-void

    .line 51
    :cond_5
    mul-int/2addr p1, p2

    .line 52
    iput p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->mMaxCnt:I

    .line 53
    .line 54
    iget-object p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 55
    .line 56
    invoke-static {p1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$1000(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)J

    .line 57
    .line 58
    .line 59
    move-result-wide p1

    .line 60
    iget v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->mMaxCnt:I

    .line 61
    .line 62
    int-to-long v0, v0

    .line 63
    div-long/2addr p1, v0

    .line 64
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->mPtsStep:J

    .line 65
    .line 66
    iget-object p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 67
    .line 68
    invoke-static {p1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$100(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    new-instance p2, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    const-string v0, "  setFrameCnt method,  mNeedFrameCnt:"

    .line 75
    .line 76
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    iget v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->mNeedFrameCnt:I

    .line 80
    .line 81
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    const-string v0, ", mInterval:"

    .line 85
    .line 86
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    iget v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->mInterval:I

    .line 90
    .line 91
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    const-string v0, ", mMaxCnt:"

    .line 95
    .line 96
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    iget v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->mMaxCnt:I

    .line 100
    .line 101
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    const-string v0, ", mDuration:"

    .line 105
    .line 106
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 110
    .line 111
    invoke-static {v0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$1000(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)J

    .line 112
    .line 113
    .line 114
    move-result-wide v0

    .line 115
    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    const-string v0, ",mPtsStep:"

    .line 119
    .line 120
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->mPtsStep:J

    .line 124
    .line 125
    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-static {p1, p0}, Ll/lyv;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method private setYuv([B)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->yuv:[B

    .line 2
    .line 3
    return-void
.end method


# virtual methods
.method public doFrameFilter()V
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 4
    .line 5
    invoke-static {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$100(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "doFrameFilter is called"

    .line 10
    .line 11
    invoke-static {v1, v2}, Ll/lyv;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    iget-object v1, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-static {v1, v2}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$1200(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;Z)V

    .line 18
    .line 19
    .line 20
    iget v1, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->mInterval:I

    .line 21
    .line 22
    iget-object v3, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 23
    .line 24
    const-string v4, "            mHandler:"

    .line 25
    .line 26
    const-string v5, "doFrameFilter nativeDecodeOneFrame or mHandler is error!"

    .line 27
    .line 28
    const-string v6, "  doFrameFilter:needPts "

    .line 29
    .line 30
    const-wide/16 v7, 0x0

    .line 31
    .line 32
    const/high16 v9, -0x40800000    # -1.0f

    .line 33
    .line 34
    if-eq v1, v2, :cond_6

    .line 35
    .line 36
    invoke-static {v3}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$100(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    const-string v2, "doFrameFilter:mInterval != 1"

    .line 41
    .line 42
    invoke-static {v1, v2}, Ll/lyv;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    const/4 v1, 0x0

    .line 46
    move v2, v1

    .line 47
    move-wide v10, v7

    .line 48
    move v3, v9

    .line 49
    :goto_0
    iget v12, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->mMaxCnt:I

    .line 50
    .line 51
    if-ge v1, v12, :cond_b

    .line 52
    .line 53
    iget-object v12, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 54
    .line 55
    invoke-static {v12}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$100(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v12

    .line 59
    new-instance v13, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-direct {v13, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v13, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v13

    .line 71
    invoke-static {v12, v13}, Ll/lyv;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    iget-object v12, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 75
    .line 76
    invoke-static {v12}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$1300(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Z

    .line 77
    .line 78
    .line 79
    move-result v12

    .line 80
    if-eqz v12, :cond_0

    .line 81
    .line 82
    goto/16 :goto_5

    .line 83
    .line 84
    :cond_0
    iget-object v12, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 85
    .line 86
    invoke-static {v12, v10, v11}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$1400(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;J)I

    .line 87
    .line 88
    .line 89
    move-result v12

    .line 90
    if-ltz v12, :cond_4

    .line 91
    .line 92
    iget-object v13, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 93
    .line 94
    invoke-static {v13}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$1500(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)J

    .line 95
    .line 96
    .line 97
    move-result-wide v13

    .line 98
    cmp-long v13, v13, v7

    .line 99
    .line 100
    if-eqz v13, :cond_4

    .line 101
    .line 102
    iget-object v13, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 103
    .line 104
    iget-object v14, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->yuv:[B

    .line 105
    .line 106
    invoke-static {v13, v14}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$1600(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;[B)I

    .line 107
    .line 108
    .line 109
    if-ltz v12, :cond_5

    .line 110
    .line 111
    invoke-static {}, Ll/byx;->a()Z

    .line 112
    .line 113
    .line 114
    move-result v12

    .line 115
    if-eqz v12, :cond_1

    .line 116
    .line 117
    iget-object v12, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->yuv:[B

    .line 118
    .line 119
    invoke-virtual {v0, v12}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->doMMCVFilter([B)F

    .line 120
    .line 121
    .line 122
    move-result v12

    .line 123
    cmpl-float v13, v12, v3

    .line 124
    .line 125
    if-lez v13, :cond_2

    .line 126
    .line 127
    iget-object v3, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 128
    .line 129
    invoke-static {v3}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$1700(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)[I

    .line 130
    .line 131
    .line 132
    move-result-object v13

    .line 133
    invoke-static {v3, v13}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$1800(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;[I)I

    .line 134
    .line 135
    .line 136
    move v3, v12

    .line 137
    goto :goto_1

    .line 138
    :cond_1
    iget-object v12, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 139
    .line 140
    invoke-static {v12}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$1700(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)[I

    .line 141
    .line 142
    .line 143
    move-result-object v13

    .line 144
    invoke-static {v12, v13}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$1800(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;[I)I

    .line 145
    .line 146
    .line 147
    :cond_2
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 148
    .line 149
    iget v12, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->mInterval:I

    .line 150
    .line 151
    rem-int/2addr v2, v12

    .line 152
    if-nez v2, :cond_5

    .line 153
    .line 154
    iget-object v3, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 155
    .line 156
    invoke-static {v3}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$1700(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)[I

    .line 157
    .line 158
    .line 159
    move-result-object v12

    .line 160
    iget-object v13, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 161
    .line 162
    invoke-static {v13}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$400(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)I

    .line 163
    .line 164
    .line 165
    move-result v14

    .line 166
    iget-object v13, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 167
    .line 168
    invoke-static {v13}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$400(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)I

    .line 169
    .line 170
    .line 171
    move-result v15

    .line 172
    iget-object v13, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 173
    .line 174
    invoke-static {v13}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$500(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)I

    .line 175
    .line 176
    .line 177
    move-result v16

    .line 178
    sget-object v17, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 179
    .line 180
    const/4 v13, 0x0

    .line 181
    invoke-static/range {v12 .. v17}, Landroid/graphics/Bitmap;->createBitmap([IIIIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 182
    .line 183
    .line 184
    move-result-object v12

    .line 185
    iput-object v12, v3, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mCurBmp:Landroid/graphics/Bitmap;

    .line 186
    .line 187
    iget-object v3, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 188
    .line 189
    invoke-static {v3}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$900(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$ImageFrameFilterListener;

    .line 190
    .line 191
    .line 192
    move-result-object v3

    .line 193
    if-eqz v3, :cond_3

    .line 194
    .line 195
    iget-object v3, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 196
    .line 197
    invoke-static {v3}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$900(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$ImageFrameFilterListener;

    .line 198
    .line 199
    .line 200
    move-result-object v3

    .line 201
    iget-object v12, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 202
    .line 203
    iget-object v12, v12, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mCurBmp:Landroid/graphics/Bitmap;

    .line 204
    .line 205
    invoke-interface {v3, v12}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$ImageFrameFilterListener;->doFilterFrame(Landroid/graphics/Bitmap;)V

    .line 206
    .line 207
    .line 208
    :cond_3
    move v3, v9

    .line 209
    goto :goto_2

    .line 210
    :cond_4
    iget-object v12, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 211
    .line 212
    invoke-static {v12}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$100(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object v12

    .line 216
    invoke-static {v12, v5}, Ll/lyv;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 217
    .line 218
    .line 219
    iget-object v12, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 220
    .line 221
    invoke-static {v12}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$100(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v12

    .line 225
    new-instance v13, Ljava/lang/StringBuilder;

    .line 226
    .line 227
    invoke-direct {v13, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    iget-object v14, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 231
    .line 232
    invoke-static {v14}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$1500(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)J

    .line 233
    .line 234
    .line 235
    move-result-wide v14

    .line 236
    invoke-virtual {v13, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 237
    .line 238
    .line 239
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v13

    .line 243
    invoke-static {v12, v13}, Ll/lyv;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 244
    .line 245
    .line 246
    :cond_5
    :goto_2
    iget-wide v12, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->mPtsStep:J

    .line 247
    .line 248
    add-long/2addr v10, v12

    .line 249
    add-int/lit8 v1, v1, 0x1

    .line 250
    .line 251
    goto/16 :goto_0

    .line 252
    .line 253
    :cond_6
    invoke-static {v3}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$100(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v1

    .line 257
    const-string v2, "doFrameFilter:mInterval == 1"

    .line 258
    .line 259
    invoke-static {v1, v2}, Ll/lyv;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 260
    .line 261
    .line 262
    iget-object v1, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 263
    .line 264
    invoke-static {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$1900(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)J

    .line 265
    .line 266
    .line 267
    move-result-wide v1

    .line 268
    iput-wide v1, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->mPtsStep:J

    .line 269
    .line 270
    iget-object v3, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 271
    .line 272
    invoke-static {v3, v1, v2}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$2000(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;J)J

    .line 273
    .line 274
    .line 275
    move-result-wide v1

    .line 276
    move-wide v10, v7

    .line 277
    :goto_3
    cmp-long v3, v10, v1

    .line 278
    .line 279
    if-gtz v3, :cond_a

    .line 280
    .line 281
    iget-object v3, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 282
    .line 283
    invoke-static {v3}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$1300(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Z

    .line 284
    .line 285
    .line 286
    move-result v3

    .line 287
    if-nez v3, :cond_a

    .line 288
    .line 289
    iget-object v3, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 290
    .line 291
    invoke-static {v3}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$100(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object v3

    .line 295
    new-instance v12, Ljava/lang/StringBuilder;

    .line 296
    .line 297
    invoke-direct {v12, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 298
    .line 299
    .line 300
    invoke-virtual {v12, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 301
    .line 302
    .line 303
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 304
    .line 305
    .line 306
    move-result-object v12

    .line 307
    invoke-static {v3, v12}, Ll/lyv;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 308
    .line 309
    .line 310
    iget-object v3, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 311
    .line 312
    invoke-static {v3, v10, v11}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$1400(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;J)I

    .line 313
    .line 314
    .line 315
    move-result v3

    .line 316
    if-lez v3, :cond_9

    .line 317
    .line 318
    iget-object v12, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 319
    .line 320
    invoke-static {v12}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$1500(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)J

    .line 321
    .line 322
    .line 323
    move-result-wide v12

    .line 324
    cmp-long v12, v12, v7

    .line 325
    .line 326
    if-eqz v12, :cond_9

    .line 327
    .line 328
    iget-object v12, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 329
    .line 330
    iget-object v13, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->yuv:[B

    .line 331
    .line 332
    invoke-static {v12, v13}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$1600(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;[B)I

    .line 333
    .line 334
    .line 335
    if-ltz v3, :cond_8

    .line 336
    .line 337
    invoke-static {}, Ll/byx;->a()Z

    .line 338
    .line 339
    .line 340
    move-result v3

    .line 341
    if-eqz v3, :cond_7

    .line 342
    .line 343
    iget-object v3, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->yuv:[B

    .line 344
    .line 345
    invoke-virtual {v0, v3}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->doMMCVFilter([B)F

    .line 346
    .line 347
    .line 348
    move-result v3

    .line 349
    cmpl-float v12, v3, v9

    .line 350
    .line 351
    if-lez v12, :cond_9

    .line 352
    .line 353
    iget-object v9, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 354
    .line 355
    invoke-static {v9}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$1700(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)[I

    .line 356
    .line 357
    .line 358
    move-result-object v12

    .line 359
    invoke-static {v9, v12}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$1800(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;[I)I

    .line 360
    .line 361
    .line 362
    move v9, v3

    .line 363
    goto :goto_4

    .line 364
    :cond_7
    iget-object v3, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 365
    .line 366
    invoke-static {v3}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$1700(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)[I

    .line 367
    .line 368
    .line 369
    move-result-object v12

    .line 370
    invoke-static {v3, v12}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$1800(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;[I)I

    .line 371
    .line 372
    .line 373
    goto :goto_4

    .line 374
    :cond_8
    iget-object v3, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 375
    .line 376
    invoke-static {v3}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$100(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Ljava/lang/String;

    .line 377
    .line 378
    .line 379
    move-result-object v3

    .line 380
    invoke-static {v3, v5}, Ll/lyv;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 381
    .line 382
    .line 383
    iget-object v3, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 384
    .line 385
    invoke-static {v3}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$100(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Ljava/lang/String;

    .line 386
    .line 387
    .line 388
    move-result-object v3

    .line 389
    new-instance v12, Ljava/lang/StringBuilder;

    .line 390
    .line 391
    invoke-direct {v12, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 392
    .line 393
    .line 394
    iget-object v13, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 395
    .line 396
    invoke-static {v13}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$1500(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)J

    .line 397
    .line 398
    .line 399
    move-result-wide v13

    .line 400
    invoke-virtual {v12, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 401
    .line 402
    .line 403
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 404
    .line 405
    .line 406
    move-result-object v12

    .line 407
    invoke-static {v3, v12}, Ll/lyv;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 408
    .line 409
    .line 410
    :cond_9
    :goto_4
    iget-wide v12, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->mPtsStep:J

    .line 411
    .line 412
    add-long/2addr v10, v12

    .line 413
    goto/16 :goto_3

    .line 414
    .line 415
    :cond_a
    iget-object v1, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 416
    .line 417
    invoke-static {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$1700(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)[I

    .line 418
    .line 419
    .line 420
    move-result-object v2

    .line 421
    iget-object v3, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 422
    .line 423
    invoke-static {v3}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$400(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)I

    .line 424
    .line 425
    .line 426
    move-result v4

    .line 427
    iget-object v3, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 428
    .line 429
    invoke-static {v3}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$400(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)I

    .line 430
    .line 431
    .line 432
    move-result v5

    .line 433
    iget-object v3, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 434
    .line 435
    invoke-static {v3}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$500(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)I

    .line 436
    .line 437
    .line 438
    move-result v6

    .line 439
    sget-object v7, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 440
    .line 441
    const/4 v3, 0x0

    .line 442
    invoke-static/range {v2 .. v7}, Landroid/graphics/Bitmap;->createBitmap([IIIIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 443
    .line 444
    .line 445
    move-result-object v2

    .line 446
    iput-object v2, v1, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mCurBmp:Landroid/graphics/Bitmap;

    .line 447
    .line 448
    iget-object v1, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 449
    .line 450
    invoke-static {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$900(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$ImageFrameFilterListener;

    .line 451
    .line 452
    .line 453
    move-result-object v1

    .line 454
    if-eqz v1, :cond_b

    .line 455
    .line 456
    iget-object v1, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 457
    .line 458
    invoke-static {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$900(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$ImageFrameFilterListener;

    .line 459
    .line 460
    .line 461
    move-result-object v1

    .line 462
    iget-object v2, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 463
    .line 464
    iget-object v2, v2, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mCurBmp:Landroid/graphics/Bitmap;

    .line 465
    .line 466
    invoke-interface {v1, v2}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$ImageFrameFilterListener;->doFilterFrame(Landroid/graphics/Bitmap;)V

    .line 467
    .line 468
    .line 469
    :cond_b
    :goto_5
    iget-object v1, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 470
    .line 471
    invoke-static {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$900(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$ImageFrameFilterListener;

    .line 472
    .line 473
    .line 474
    move-result-object v1

    .line 475
    if-eqz v1, :cond_c

    .line 476
    .line 477
    iget-object v1, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 478
    .line 479
    invoke-static {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$900(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$ImageFrameFilterListener;

    .line 480
    .line 481
    .line 482
    move-result-object v1

    .line 483
    invoke-interface {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$ImageFrameFilterListener;->doFilterComplete()V

    .line 484
    .line 485
    .line 486
    :cond_c
    iget-object v0, v0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 487
    .line 488
    invoke-static {v0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$100(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Ljava/lang/String;

    .line 489
    .line 490
    .line 491
    move-result-object v0

    .line 492
    const-string v1, "doFrameFilter is complete, VideoDataRetrieverBySoft will be release!"

    .line 493
    .line 494
    invoke-static {v0, v1}, Ll/lyv;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 495
    .line 496
    .line 497
    return-void
.end method

.method public doMMCVFilter([B)F
    .locals 2

    .line 1
    new-instance v0, Ll/cr2;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/cr2;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->processInput:Ll/cr2;

    .line 7
    .line 8
    const/16 v1, 0x11

    .line 9
    .line 10
    iput v1, v0, Ll/cr2;->g:I

    .line 11
    .line 12
    iput-object p1, v0, Ll/cr2;->e:[B

    .line 13
    .line 14
    iget-object p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$400(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iput p1, v0, Ll/cr2;->a:I

    .line 21
    .line 22
    iget-object p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->processInput:Ll/cr2;

    .line 23
    .line 24
    iget-object v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$500(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iput v0, p1, Ll/cr2;->b:I

    .line 31
    .line 32
    iget-object p0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->this$0:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 33
    .line 34
    invoke-static {p0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->access$200(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Ll/o3m;

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x0

    .line 38
    return p0
.end method

.method public resetMMCV()V
    .locals 0

    return-void
.end method
