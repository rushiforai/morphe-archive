.class public Lcom/tencent/liteav/basic/module/StatusBucket;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "com.tencent.liteav.basic.module.StatusBucket"


# instance fields
.field private mBucketObj:J


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/tencent/liteav/basic/module/StatusBucket;->mBucketObj:J

    .line 7
    .line 8
    invoke-static {}, Lcom/tencent/liteav/basic/module/StatusBucket;->nativeCreateStatusBucket()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    iput-wide v0, p0, Lcom/tencent/liteav/basic/module/StatusBucket;->mBucketObj:J

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(J)V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-wide p1, p0, Lcom/tencent/liteav/basic/module/StatusBucket;->mBucketObj:J

    return-void
.end method

.method private static native nativeCreateStatusBucket()J
.end method

.method private static native nativeDestroyStatusBucket(J)V
.end method

.method private static native nativeGetBooleanStatus(JLjava/lang/String;I)Z
.end method

.method private static native nativeGetIntStatus(JLjava/lang/String;I)I
.end method

.method private static native nativeGetLongStatus(JLjava/lang/String;I)J
.end method

.method private static native nativeMerge(JJ)V
.end method

.method private static native nativeSetBooleanStatus(JLjava/lang/String;IZ)V
.end method

.method private static native nativeSetIntStatus(JLjava/lang/String;II)V
.end method

.method private static native nativeSetLongStatus(JLjava/lang/String;IJ)V
.end method

.method public static testStatusBucket()V
    .locals 15

    .line 1
    new-instance v0, Lcom/tencent/liteav/basic/module/StatusBucket;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/liteav/basic/module/StatusBucket;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lcom/tencent/liteav/basic/module/StatusBucket;

    .line 7
    .line 8
    invoke-direct {v1}, Lcom/tencent/liteav/basic/module/StatusBucket;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v2, "1"

    .line 12
    .line 13
    const/4 v3, 0x1

    .line 14
    invoke-virtual {v0, v2, v3, v3}, Lcom/tencent/liteav/basic/module/StatusBucket;->setBooleanStatus(Ljava/lang/String;IZ)V

    .line 15
    .line 16
    .line 17
    const-string v4, "2"

    .line 18
    .line 19
    const/4 v5, 0x2

    .line 20
    invoke-virtual {v0, v4, v5, v5}, Lcom/tencent/liteav/basic/module/StatusBucket;->setIntStatus(Ljava/lang/String;II)V

    .line 21
    .line 22
    .line 23
    const-wide/16 v6, 0x3

    .line 24
    .line 25
    const-string v8, "3"

    .line 26
    .line 27
    const/4 v9, 0x3

    .line 28
    invoke-virtual {v0, v8, v9, v6, v7}, Lcom/tencent/liteav/basic/module/StatusBucket;->setLongStatus(Ljava/lang/String;IJ)V

    .line 29
    .line 30
    .line 31
    const/4 v6, 0x4

    .line 32
    invoke-virtual {v1, v2, v6, v6}, Lcom/tencent/liteav/basic/module/StatusBucket;->setIntStatus(Ljava/lang/String;II)V

    .line 33
    .line 34
    .line 35
    const-string v7, "5"

    .line 36
    .line 37
    const/4 v10, 0x5

    .line 38
    invoke-virtual {v1, v7, v10, v3}, Lcom/tencent/liteav/basic/module/StatusBucket;->setBooleanStatus(Ljava/lang/String;IZ)V

    .line 39
    .line 40
    .line 41
    const-wide/16 v11, 0x6

    .line 42
    .line 43
    const-string v13, "6"

    .line 44
    .line 45
    const/4 v14, 0x6

    .line 46
    invoke-virtual {v1, v13, v14, v11, v12}, Lcom/tencent/liteav/basic/module/StatusBucket;->setLongStatus(Ljava/lang/String;IJ)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/basic/module/StatusBucket;->merge(Lcom/tencent/liteav/basic/module/StatusBucket;)V

    .line 50
    .line 51
    .line 52
    sget-object v1, Lcom/tencent/liteav/basic/module/StatusBucket;->TAG:Ljava/lang/String;

    .line 53
    .line 54
    new-instance v11, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string v12, "test_status_bucket: id:1, key:1, value:"

    .line 57
    .line 58
    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v2, v3}, Lcom/tencent/liteav/basic/module/StatusBucket;->getBooleanStatus(Ljava/lang/String;I)Z

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-static {v1, v3}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    new-instance v3, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    const-string v11, "test_status_bucket: id:1, key:4, value:"

    .line 78
    .line 79
    invoke-direct {v3, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, v2, v6}, Lcom/tencent/liteav/basic/module/StatusBucket;->getIntStatus(Ljava/lang/String;I)I

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-static {v1, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    new-instance v2, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    const-string v3, "test_status_bucket: id:2, key:2, value:"

    .line 99
    .line 100
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0, v4, v5}, Lcom/tencent/liteav/basic/module/StatusBucket;->getIntStatus(Ljava/lang/String;I)I

    .line 104
    .line 105
    .line 106
    move-result v3

    .line 107
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-static {v1, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    new-instance v2, Ljava/lang/StringBuilder;

    .line 118
    .line 119
    const-string v3, "test_status_bucket: id:3, key:3, value:"

    .line 120
    .line 121
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0, v8, v9}, Lcom/tencent/liteav/basic/module/StatusBucket;->getLongStatus(Ljava/lang/String;I)J

    .line 125
    .line 126
    .line 127
    move-result-wide v3

    .line 128
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-static {v1, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    new-instance v2, Ljava/lang/StringBuilder;

    .line 139
    .line 140
    const-string v3, "test_status_bucket: id:5, key:5, value:"

    .line 141
    .line 142
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v0, v7, v10}, Lcom/tencent/liteav/basic/module/StatusBucket;->getBooleanStatus(Ljava/lang/String;I)Z

    .line 146
    .line 147
    .line 148
    move-result v3

    .line 149
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v2

    .line 156
    invoke-static {v1, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    new-instance v2, Ljava/lang/StringBuilder;

    .line 160
    .line 161
    const-string v3, "test_status_bucket: id:6, key:6, value:"

    .line 162
    .line 163
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v0, v13, v14}, Lcom/tencent/liteav/basic/module/StatusBucket;->getLongStatus(Ljava/lang/String;I)J

    .line 167
    .line 168
    .line 169
    move-result-wide v3

    .line 170
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    return-void
.end method


# virtual methods
.method public finalize()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/tencent/liteav/basic/module/StatusBucket;->mBucketObj:J

    .line 5
    .line 6
    const-wide/16 v2, 0x0

    .line 7
    .line 8
    iput-wide v2, p0, Lcom/tencent/liteav/basic/module/StatusBucket;->mBucketObj:J

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/module/StatusBucket;->nativeDestroyStatusBucket(J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public getBooleanStatus(Ljava/lang/String;I)Z
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/liteav/basic/module/StatusBucket;->mBucketObj:J

    .line 2
    .line 3
    invoke-static {v0, v1, p1, p2}, Lcom/tencent/liteav/basic/module/StatusBucket;->nativeGetBooleanStatus(JLjava/lang/String;I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getIntStatus(Ljava/lang/String;I)I
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/liteav/basic/module/StatusBucket;->mBucketObj:J

    .line 2
    .line 3
    invoke-static {v0, v1, p1, p2}, Lcom/tencent/liteav/basic/module/StatusBucket;->nativeGetIntStatus(JLjava/lang/String;I)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getLongStatus(Ljava/lang/String;I)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/liteav/basic/module/StatusBucket;->mBucketObj:J

    .line 2
    .line 3
    invoke-static {v0, v1, p1, p2}, Lcom/tencent/liteav/basic/module/StatusBucket;->nativeGetLongStatus(JLjava/lang/String;I)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    return-wide p0
.end method

.method public merge(Lcom/tencent/liteav/basic/module/StatusBucket;)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/liteav/basic/module/StatusBucket;->mBucketObj:J

    .line 2
    .line 3
    iget-wide p0, p1, Lcom/tencent/liteav/basic/module/StatusBucket;->mBucketObj:J

    .line 4
    .line 5
    invoke-static {v0, v1, p0, p1}, Lcom/tencent/liteav/basic/module/StatusBucket;->nativeMerge(JJ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setBooleanStatus(Ljava/lang/String;IZ)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/liteav/basic/module/StatusBucket;->mBucketObj:J

    .line 2
    .line 3
    invoke-static {v0, v1, p1, p2, p3}, Lcom/tencent/liteav/basic/module/StatusBucket;->nativeSetBooleanStatus(JLjava/lang/String;IZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setIntStatus(Ljava/lang/String;II)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/liteav/basic/module/StatusBucket;->mBucketObj:J

    .line 2
    .line 3
    invoke-static {v0, v1, p1, p2, p3}, Lcom/tencent/liteav/basic/module/StatusBucket;->nativeSetIntStatus(JLjava/lang/String;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setLongStatus(Ljava/lang/String;IJ)V
    .locals 6

    .line 1
    iget-wide v0, p0, Lcom/tencent/liteav/basic/module/StatusBucket;->mBucketObj:J

    .line 2
    .line 3
    move-object v2, p1

    .line 4
    move v3, p2

    .line 5
    move-wide v4, p3

    .line 6
    invoke-static/range {v0 .. v5}, Lcom/tencent/liteav/basic/module/StatusBucket;->nativeSetLongStatus(JLjava/lang/String;IJ)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
