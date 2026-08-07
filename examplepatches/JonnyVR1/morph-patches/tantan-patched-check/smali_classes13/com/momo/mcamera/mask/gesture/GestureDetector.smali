.class public Lcom/momo/mcamera/mask/gesture/GestureDetector;
.super Lcom/momo/mcamera/mask/gesture/CVDetector;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/mcamera/mask/gesture/GestureDetector$RenderHandler;,
        Lcom/momo/mcamera/mask/gesture/GestureDetector$GestureDetectThread;
    }
.end annotation


# instance fields
.field private cameraDegree:I

.field private curByteBuffer:Ljava/nio/ByteBuffer;

.field private dataFormatType:I

.field private detectInterval:I

.field private detectParams:Lcom/momocv/objectdetect/ObjectDetectParams;

.field detectThread:Lcom/momo/mcamera/mask/gesture/GestureDetector$GestureDetectThread;

.field private height:I

.field private isDetecting:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private isFrontCamera:Z

.field private mCallbackRenderHandler:Lcom/momo/mcamera/mask/gesture/GestureDetector$RenderHandler;

.field private mmFrame:Ll/umw;

.field private mmcvInfo:Ll/omw;

.field private objectDetectInfo:Lcom/momocv/objectdetect/ObjectDetectInfo;

.field private running:Z

.field private startSync:Ljava/lang/Object;

.field private waitSignal:Ljava/lang/Object;

.field private width:I


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/gesture/CVDetector;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x12c

    .line 5
    .line 6
    iput v0, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->detectInterval:I

    .line 7
    .line 8
    new-instance v0, Ll/umw;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/umw;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->mmFrame:Ll/umw;

    .line 14
    .line 15
    new-instance v0, Lcom/momocv/objectdetect/ObjectDetectParams;

    .line 16
    .line 17
    invoke-direct {v0}, Lcom/momocv/objectdetect/ObjectDetectParams;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->detectParams:Lcom/momocv/objectdetect/ObjectDetectParams;

    .line 21
    .line 22
    const/16 v0, 0x11

    .line 23
    .line 24
    iput v0, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->dataFormatType:I

    .line 25
    .line 26
    new-instance v0, Ljava/lang/Object;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->waitSignal:Ljava/lang/Object;

    .line 32
    .line 33
    new-instance v0, Ljava/lang/Object;

    .line 34
    .line 35
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->startSync:Ljava/lang/Object;

    .line 39
    .line 40
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->isDetecting:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 47
    .line 48
    iput-object p1, p0, Lcom/momo/mcamera/mask/gesture/CVDetector;->gestureDetectorListener:Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;

    .line 49
    .line 50
    return-void
.end method

.method public static synthetic access$000(Lcom/momo/mcamera/mask/gesture/GestureDetector;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->running:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$002(Lcom/momo/mcamera/mask/gesture/GestureDetector;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->running:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$100(Lcom/momo/mcamera/mask/gesture/GestureDetector;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->waitSignal:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/momo/mcamera/mask/gesture/GestureDetector;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/gesture/GestureDetector;->detectGesture()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$300(Lcom/momo/mcamera/mask/gesture/GestureDetector;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->curByteBuffer:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$302(Lcom/momo/mcamera/mask/gesture/GestureDetector;Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->curByteBuffer:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p1
.end method

.method private detectGesture()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->isDetecting:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    new-instance v2, Lcom/core/glcore/cv/MMCVBoxes;

    .line 12
    .line 13
    invoke-direct {v2}, Lcom/core/glcore/cv/MMCVBoxes;-><init>()V

    .line 14
    .line 15
    .line 16
    iget-object v3, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->curByteBuffer:Ljava/nio/ByteBuffer;

    .line 17
    .line 18
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    iget v4, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->dataFormatType:I

    .line 23
    .line 24
    const/4 v5, 0x4

    .line 25
    if-ne v4, v5, :cond_0

    .line 26
    .line 27
    iget-object v3, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->curByteBuffer:Ljava/nio/ByteBuffer;

    .line 28
    .line 29
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    iget v4, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->width:I

    .line 34
    .line 35
    iget v5, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->height:I

    .line 36
    .line 37
    const/4 v6, 0x0

    .line 38
    invoke-static {v3, v4, v5, v6}, Lcom/core/glcore/yuvutil/YuvTools;->a([BII[B)[B

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    const/16 v4, 0x11

    .line 43
    .line 44
    iput v4, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->dataFormatType:I

    .line 45
    .line 46
    :cond_0
    iget-object v4, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->mmFrame:Ll/umw;

    .line 47
    .line 48
    iget v5, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->dataFormatType:I

    .line 49
    .line 50
    invoke-virtual {v4, v5}, Ll/umw;->h(I)V

    .line 51
    .line 52
    .line 53
    iget-object v4, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->mmFrame:Ll/umw;

    .line 54
    .line 55
    iget v5, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->width:I

    .line 56
    .line 57
    invoke-virtual {v4, v5}, Ll/umw;->l(I)V

    .line 58
    .line 59
    .line 60
    iget-object v4, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->mmFrame:Ll/umw;

    .line 61
    .line 62
    iget v5, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->width:I

    .line 63
    .line 64
    invoke-virtual {v4, v5}, Ll/umw;->m(I)V

    .line 65
    .line 66
    .line 67
    iget-object v4, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->mmFrame:Ll/umw;

    .line 68
    .line 69
    iget v5, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->height:I

    .line 70
    .line 71
    invoke-virtual {v4, v5}, Ll/umw;->j(I)V

    .line 72
    .line 73
    .line 74
    iget-object v4, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->mmFrame:Ll/umw;

    .line 75
    .line 76
    invoke-virtual {v4, v3}, Ll/umw;->g([B)V

    .line 77
    .line 78
    .line 79
    iget-object v4, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->mmFrame:Ll/umw;

    .line 80
    .line 81
    array-length v3, v3

    .line 82
    invoke-virtual {v4, v3}, Ll/umw;->f(I)V

    .line 83
    .line 84
    .line 85
    iget-object v3, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->detectParams:Lcom/momocv/objectdetect/ObjectDetectParams;

    .line 86
    .line 87
    iget v4, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->cameraDegree:I

    .line 88
    .line 89
    iput v4, v3, Lcom/momocv/BaseParams;->rotate_degree_:I

    .line 90
    .line 91
    iget-boolean v4, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->isFrontCamera:Z

    .line 92
    .line 93
    iput-boolean v4, v3, Lcom/momocv/BaseParams;->fliped_show_:Z

    .line 94
    .line 95
    new-instance v3, Lcom/momocv/objectdetect/ObjectDetectInfo;

    .line 96
    .line 97
    invoke-direct {v3}, Lcom/momocv/objectdetect/ObjectDetectInfo;-><init>()V

    .line 98
    .line 99
    .line 100
    iput-object v3, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->objectDetectInfo:Lcom/momocv/objectdetect/ObjectDetectInfo;

    .line 101
    .line 102
    iget-object v3, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->mmcvInfo:Ll/omw;

    .line 103
    .line 104
    iget-object v4, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->detectParams:Lcom/momocv/objectdetect/ObjectDetectParams;

    .line 105
    .line 106
    invoke-virtual {v3, v4}, Ll/omw;->B(Lcom/momocv/BaseParams;)V

    .line 107
    .line 108
    .line 109
    invoke-static {}, Ll/c950;->b()Ll/c950;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    iget-object v4, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->mmFrame:Ll/umw;

    .line 114
    .line 115
    invoke-virtual {v4}, Ll/umw;->b()Lcom/momocv/MMFrame;

    .line 116
    .line 117
    .line 118
    move-result-object v4

    .line 119
    iget-object v5, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->detectParams:Lcom/momocv/objectdetect/ObjectDetectParams;

    .line 120
    .line 121
    iget-object v6, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->objectDetectInfo:Lcom/momocv/objectdetect/ObjectDetectInfo;

    .line 122
    .line 123
    invoke-virtual {v3, v4, v5, v6}, Ll/c950;->e(Lcom/momocv/MMFrame;Lcom/momocv/objectdetect/ObjectDetectParams;Lcom/momocv/objectdetect/ObjectDetectInfo;)V

    .line 124
    .line 125
    .line 126
    iget-object v3, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->mmcvInfo:Ll/omw;

    .line 127
    .line 128
    iget-object v4, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->objectDetectInfo:Lcom/momocv/objectdetect/ObjectDetectInfo;

    .line 129
    .line 130
    iput-object v4, v3, Ll/omw;->G:Lcom/momocv/objectdetect/ObjectDetectInfo;

    .line 131
    .line 132
    iget-object v3, v4, Lcom/momocv/objectdetect/ObjectDetectInfo;->detect_results_:[Lcom/momocv/MMBox;

    .line 133
    .line 134
    invoke-virtual {v2, v3}, Lcom/core/glcore/cv/MMCVBoxes;->setDetectResult([Lcom/momocv/MMBox;)V

    .line 135
    .line 136
    .line 137
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 138
    .line 139
    .line 140
    move-result-wide v3

    .line 141
    sub-long/2addr v3, v0

    .line 142
    iget-object v0, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->objectDetectInfo:Lcom/momocv/objectdetect/ObjectDetectInfo;

    .line 143
    .line 144
    iget-object v0, v0, Lcom/momocv/objectdetect/ObjectDetectInfo;->detect_results_:[Lcom/momocv/MMBox;

    .line 145
    .line 146
    invoke-direct {p0, v0, v3, v4}, Lcom/momo/mcamera/mask/gesture/GestureDetector;->uploadGestureInfo([Lcom/momocv/MMBox;J)V

    .line 147
    .line 148
    .line 149
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-virtual {v0, v3, v4}, Ll/u6y;->i0(J)V

    .line 154
    .line 155
    .line 156
    invoke-static {}, Ll/cyx;->a()Z

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    if-eqz v0, :cond_1

    .line 161
    .line 162
    iget-object v0, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->objectDetectInfo:Lcom/momocv/objectdetect/ObjectDetectInfo;

    .line 163
    .line 164
    iget-object v0, v0, Lcom/momocv/objectdetect/ObjectDetectInfo;->detect_results_:[Lcom/momocv/MMBox;

    .line 165
    .line 166
    invoke-static {v0}, Lcom/core/glcore/util/CVObjectHelper;->transObjectInfos([Lcom/momocv/MMBox;)Ljava/util/List;

    .line 167
    .line 168
    .line 169
    :cond_1
    iget v0, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->detectInterval:I

    .line 170
    .line 171
    if-lez v0, :cond_2

    .line 172
    .line 173
    int-to-long v0, v0

    .line 174
    invoke-static {v0, v1}, Landroid/os/SystemClock;->sleep(J)V

    .line 175
    .line 176
    .line 177
    :cond_2
    iget-object v0, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->isDetecting:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 178
    .line 179
    const/4 v1, 0x0

    .line 180
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 181
    .line 182
    .line 183
    iget-object v0, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->curByteBuffer:Ljava/nio/ByteBuffer;

    .line 184
    .line 185
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 186
    .line 187
    .line 188
    new-instance v0, Landroid/os/Message;

    .line 189
    .line 190
    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 191
    .line 192
    .line 193
    iput-object v2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 194
    .line 195
    iget-object p0, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->mCallbackRenderHandler:Lcom/momo/mcamera/mask/gesture/GestureDetector$RenderHandler;

    .line 196
    .line 197
    if-eqz p0, :cond_3

    .line 198
    .line 199
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 200
    .line 201
    .line 202
    :cond_3
    return-void
.end method

.method private uploadGestureInfo([Lcom/momocv/MMBox;J)V
    .locals 8

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    array-length p0, p1

    .line 4
    if-gtz p0, :cond_0

    .line 5
    .line 6
    goto :goto_2

    .line 7
    :cond_0
    array-length p0, p1

    .line 8
    const/4 v0, 0x0

    .line 9
    :goto_0
    if-ge v0, p0, :cond_2

    .line 10
    .line 11
    aget-object v1, p1, v0

    .line 12
    .line 13
    iget-object v3, v1, Lcom/momocv/MMBox;->class_name_:Ljava/lang/String;

    .line 14
    .line 15
    iget v1, v1, Lcom/momocv/MMBox;->class_index_:I

    .line 16
    .line 17
    if-lez v1, :cond_1

    .line 18
    .line 19
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_1

    .line 24
    .line 25
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 30
    .line 31
    .line 32
    move-result-wide v6

    .line 33
    move-wide v4, p2

    .line 34
    invoke-virtual/range {v2 .. v7}, Ll/u6y;->j0(Ljava/lang/String;JJ)V

    .line 35
    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_1
    move-wide v4, p2

    .line 39
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 40
    .line 41
    move-wide p2, v4

    .line 42
    goto :goto_0

    .line 43
    :cond_2
    :goto_2
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/momo/mcamera/mask/gesture/CVDetector;->gestureDetectorListener:Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->running:Z

    .line 6
    .line 7
    iget-object v1, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->curByteBuffer:Ljava/nio/ByteBuffer;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v1, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->detectThread:Lcom/momo/mcamera/mask/gesture/GestureDetector$GestureDetectThread;

    .line 15
    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    :try_start_0
    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    .line 21
    :catch_0
    :cond_1
    iput-object v0, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->detectThread:Lcom/momo/mcamera/mask/gesture/GestureDetector$GestureDetectThread;

    .line 22
    .line 23
    return-void
.end method

.method public setDetectInterval(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->detectInterval:I

    .line 2
    .line 3
    return-void
.end method

.method public setGestureDetectorListener(Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/gesture/CVDetector;->gestureDetectorListener:Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;

    .line 2
    .line 3
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->isDetecting:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p1, Ll/omw;->g:[B

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    :goto_0
    return-void

    .line 15
    :cond_1
    iget v0, p1, Ll/omw;->e:I

    .line 16
    .line 17
    iput v0, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->width:I

    .line 18
    .line 19
    iget v0, p1, Ll/omw;->f:I

    .line 20
    .line 21
    iput v0, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->height:I

    .line 22
    .line 23
    iget-boolean v0, p1, Ll/omw;->a:Z

    .line 24
    .line 25
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->isFrontCamera:Z

    .line 26
    .line 27
    iget v0, p1, Ll/omw;->b:I

    .line 28
    .line 29
    iput v0, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->cameraDegree:I

    .line 30
    .line 31
    invoke-virtual {p1}, Ll/omw;->e()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iput v0, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->dataFormatType:I

    .line 36
    .line 37
    iget-object v0, p1, Ll/omw;->g:[B

    .line 38
    .line 39
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iput-object v0, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->curByteBuffer:Ljava/nio/ByteBuffer;

    .line 44
    .line 45
    iput-object p1, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->mmcvInfo:Ll/omw;

    .line 46
    .line 47
    iget-object p1, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->waitSignal:Ljava/lang/Object;

    .line 48
    .line 49
    monitor-enter p1

    .line 50
    :try_start_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->waitSignal:Ljava/lang/Object;

    .line 51
    .line 52
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 53
    .line 54
    .line 55
    monitor-exit p1

    .line 56
    return-void

    .line 57
    :catchall_0
    move-exception p0

    .line 58
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    throw p0
.end method

.method public startDetect()V
    .locals 3

    .line 1
    invoke-static {}, Ll/c950;->b()Ll/c950;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/c950;->a()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->startSync:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    iget-object v1, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->detectThread:Lcom/momo/mcamera/mask/gesture/GestureDetector$GestureDetectThread;

    .line 12
    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->running:Z

    .line 17
    .line 18
    new-instance v2, Lcom/momo/mcamera/mask/gesture/GestureDetector$GestureDetectThread;

    .line 19
    .line 20
    invoke-direct {v2, p0}, Lcom/momo/mcamera/mask/gesture/GestureDetector$GestureDetectThread;-><init>(Lcom/momo/mcamera/mask/gesture/GestureDetector;)V

    .line 21
    .line 22
    .line 23
    iput-object v2, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->detectThread:Lcom/momo/mcamera/mask/gesture/GestureDetector$GestureDetectThread;

    .line 24
    .line 25
    invoke-virtual {v2, v1}, Ljava/lang/Thread;->setPriority(I)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->detectThread:Lcom/momo/mcamera/mask/gesture/GestureDetector$GestureDetectThread;

    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->mCallbackRenderHandler:Lcom/momo/mcamera/mask/gesture/GestureDetector$RenderHandler;

    .line 34
    .line 35
    if-nez v1, :cond_0

    .line 36
    .line 37
    new-instance v1, Lcom/momo/mcamera/mask/gesture/GestureDetector$RenderHandler;

    .line 38
    .line 39
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-direct {v1, p0, v2}, Lcom/momo/mcamera/mask/gesture/GestureDetector$RenderHandler;-><init>(Lcom/momo/mcamera/mask/gesture/GestureDetector;Landroid/os/Looper;)V

    .line 44
    .line 45
    .line 46
    iput-object v1, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->mCallbackRenderHandler:Lcom/momo/mcamera/mask/gesture/GestureDetector$RenderHandler;

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :catchall_0
    move-exception p0

    .line 50
    goto :goto_1

    .line 51
    :cond_0
    :goto_0
    monitor-exit v0

    .line 52
    return-void

    .line 53
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    throw p0
.end method

.method public stopDetect()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/gesture/GestureDetector;->cancel()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/momo/mcamera/mask/gesture/GestureDetector;->detectThread:Lcom/momo/mcamera/mask/gesture/GestureDetector$GestureDetectThread;

    .line 6
    .line 7
    invoke-static {}, Ll/c950;->b()Ll/c950;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/c950;->f()V

    .line 12
    .line 13
    .line 14
    return-void
.end method
