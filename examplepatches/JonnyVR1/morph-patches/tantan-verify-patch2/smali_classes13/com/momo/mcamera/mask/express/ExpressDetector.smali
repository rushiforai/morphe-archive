.class public Lcom/momo/mcamera/mask/express/ExpressDetector;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/mcamera/mask/detect/IPatternDetect;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/mcamera/mask/express/ExpressDetector$ExpressThread;
    }
.end annotation


# instance fields
.field private curByteBuffer:Ljava/nio/ByteBuffer;

.field private detectThread:Lcom/momo/mcamera/mask/express/ExpressDetector$ExpressThread;

.field private express:Lcom/momocv/express/Express;

.field private expressInfo:Lcom/momocv/express/ExpressInfo;

.field private expressModelPath:Ljava/lang/String;

.field private isDetecting:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private listener:Lcom/momo/mcamera/mask/detect/IPatternDetect$ExpressDetectListener;

.field private mmFrame:Ll/umw;

.field private paramsInfo:Ll/lnw;

.field private running:Z

.field private startSync:Ljava/lang/Object;

.field private waitSignal:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/umw;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/umw;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->mmFrame:Ll/umw;

    .line 10
    .line 11
    new-instance v0, Ll/lnw;

    .line 12
    .line 13
    const/4 v1, 0x6

    .line 14
    invoke-direct {v0, v1}, Ll/lnw;-><init>(I)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->paramsInfo:Ll/lnw;

    .line 18
    .line 19
    new-instance v0, Lcom/momocv/express/ExpressInfo;

    .line 20
    .line 21
    invoke-direct {v0}, Lcom/momocv/express/ExpressInfo;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->expressInfo:Lcom/momocv/express/ExpressInfo;

    .line 25
    .line 26
    new-instance v0, Ljava/lang/Object;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->waitSignal:Ljava/lang/Object;

    .line 32
    .line 33
    new-instance v0, Ljava/lang/Object;

    .line 34
    .line 35
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->startSync:Ljava/lang/Object;

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
    iput-object v0, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->isDetecting:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 47
    .line 48
    return-void
.end method

.method public static synthetic access$000(Lcom/momo/mcamera/mask/express/ExpressDetector;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->running:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$002(Lcom/momo/mcamera/mask/express/ExpressDetector;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->running:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$100(Lcom/momo/mcamera/mask/express/ExpressDetector;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->waitSignal:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/momo/mcamera/mask/express/ExpressDetector;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->curByteBuffer:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$202(Lcom/momo/mcamera/mask/express/ExpressDetector;Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->curByteBuffer:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p1
.end method


# virtual methods
.method public detect()V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->isDetecting:Ljava/util/concurrent/atomic/AtomicBoolean;

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
    iget-object v2, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->express:Lcom/momocv/express/Express;

    .line 12
    .line 13
    if-nez v2, :cond_0

    .line 14
    .line 15
    iget-object v2, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->expressModelPath:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-nez v2, :cond_0

    .line 22
    .line 23
    new-instance v2, Lcom/momocv/express/Express;

    .line 24
    .line 25
    invoke-direct {v2}, Lcom/momocv/express/Express;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v2, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->express:Lcom/momocv/express/Express;

    .line 29
    .line 30
    iget-object v3, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->expressModelPath:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v2, v3}, Lcom/momocv/express/Express;->LoadModel(Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object v2, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->express:Lcom/momocv/express/Express;

    .line 36
    .line 37
    const/4 v3, 0x0

    .line 38
    if-eqz v2, :cond_3

    .line 39
    .line 40
    iget-object v2, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->curByteBuffer:Ljava/nio/ByteBuffer;

    .line 41
    .line 42
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    iget-object v4, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->mmFrame:Ll/umw;

    .line 47
    .line 48
    invoke-virtual {v4, v2}, Ll/umw;->g([B)V

    .line 49
    .line 50
    .line 51
    iget-object v4, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->mmFrame:Ll/umw;

    .line 52
    .line 53
    array-length v2, v2

    .line 54
    invoke-virtual {v4, v2}, Ll/umw;->f(I)V

    .line 55
    .line 56
    .line 57
    iget-object v2, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->express:Lcom/momocv/express/Express;

    .line 58
    .line 59
    iget-object v4, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->mmFrame:Ll/umw;

    .line 60
    .line 61
    invoke-virtual {v4}, Ll/umw;->b()Lcom/momocv/MMFrame;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    iget-object v5, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->paramsInfo:Ll/lnw;

    .line 66
    .line 67
    invoke-virtual {v5}, Ll/lnw;->b()Lcom/momocv/express/ExpressParams;

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    iget-object v6, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->expressInfo:Lcom/momocv/express/ExpressInfo;

    .line 72
    .line 73
    invoke-virtual {v2, v4, v5, v6}, Lcom/momocv/express/Express;->ProcessFrame(Lcom/momocv/MMFrame;Lcom/momocv/express/ExpressParams;Lcom/momocv/express/ExpressInfo;)Z

    .line 74
    .line 75
    .line 76
    iget-object v2, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->expressInfo:Lcom/momocv/express/ExpressInfo;

    .line 77
    .line 78
    iget-object v2, v2, Lcom/momocv/express/ExpressInfo;->express_infos_:[Lcom/momocv/express/SingleExpressInfo;

    .line 79
    .line 80
    if-eqz v2, :cond_3

    .line 81
    .line 82
    array-length v2, v2

    .line 83
    if-lez v2, :cond_3

    .line 84
    .line 85
    invoke-static {}, Ll/cyx;->a()Z

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    if-eqz v2, :cond_3

    .line 90
    .line 91
    new-instance v2, Ljava/util/ArrayList;

    .line 92
    .line 93
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 94
    .line 95
    .line 96
    iget-object v4, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->expressInfo:Lcom/momocv/express/ExpressInfo;

    .line 97
    .line 98
    iget-object v4, v4, Lcom/momocv/express/ExpressInfo;->express_infos_:[Lcom/momocv/express/SingleExpressInfo;

    .line 99
    .line 100
    array-length v5, v4

    .line 101
    move v6, v3

    .line 102
    :goto_0
    if-ge v6, v5, :cond_1

    .line 103
    .line 104
    aget-object v7, v4, v6

    .line 105
    .line 106
    new-instance v8, Lcom/momo/xeengine/cv/bean/CVExpressInfo;

    .line 107
    .line 108
    invoke-direct {v8}, Lcom/momo/xeengine/cv/bean/CVExpressInfo;-><init>()V

    .line 109
    .line 110
    .line 111
    iget v9, v7, Lcom/momocv/express/SingleExpressInfo;->head_:I

    .line 112
    .line 113
    invoke-virtual {v8, v9}, Lcom/momo/xeengine/cv/bean/CVExpressInfo;->setHead(I)V

    .line 114
    .line 115
    .line 116
    iget v9, v7, Lcom/momocv/express/SingleExpressInfo;->lefteye_:I

    .line 117
    .line 118
    invoke-virtual {v8, v9}, Lcom/momo/xeengine/cv/bean/CVExpressInfo;->setLeftEye(I)V

    .line 119
    .line 120
    .line 121
    iget v9, v7, Lcom/momocv/express/SingleExpressInfo;->righteye_:I

    .line 122
    .line 123
    invoke-virtual {v8, v9}, Lcom/momo/xeengine/cv/bean/CVExpressInfo;->setRightEye(I)V

    .line 124
    .line 125
    .line 126
    iget v9, v7, Lcom/momocv/express/SingleExpressInfo;->mouth_:I

    .line 127
    .line 128
    invoke-virtual {v8, v9}, Lcom/momo/xeengine/cv/bean/CVExpressInfo;->setMouth(I)V

    .line 129
    .line 130
    .line 131
    iget v7, v7, Lcom/momocv/express/SingleExpressInfo;->neck_:I

    .line 132
    .line 133
    invoke-virtual {v8, v7}, Lcom/momo/xeengine/cv/bean/CVExpressInfo;->setNeck(I)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    add-int/lit8 v6, v6, 0x1

    .line 140
    .line 141
    goto :goto_0

    .line 142
    :cond_1
    iget-object v4, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->listener:Lcom/momo/mcamera/mask/detect/IPatternDetect$ExpressDetectListener;

    .line 143
    .line 144
    if-eqz v4, :cond_2

    .line 145
    .line 146
    iget-object v5, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->expressInfo:Lcom/momocv/express/ExpressInfo;

    .line 147
    .line 148
    invoke-interface {v4, v5}, Lcom/momo/mcamera/mask/detect/IPatternDetect$ExpressDetectListener;->onExpressDetect(Lcom/momocv/express/ExpressInfo;)V

    .line 149
    .line 150
    .line 151
    :cond_2
    invoke-static {v2}, Lcom/core/glcore/util/XEEngineHelper;->setExpressionInfos(Ljava/util/ArrayList;)V

    .line 152
    .line 153
    .line 154
    :cond_3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 155
    .line 156
    .line 157
    move-result-wide v4

    .line 158
    sub-long/2addr v4, v0

    .line 159
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    invoke-virtual {v0, v4, v5}, Ll/u6y;->d0(J)V

    .line 164
    .line 165
    .line 166
    const-wide/16 v0, 0xc8

    .line 167
    .line 168
    invoke-static {v0, v1}, Landroid/os/SystemClock;->sleep(J)V

    .line 169
    .line 170
    .line 171
    iget-object p0, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->isDetecting:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 172
    .line 173
    invoke-virtual {p0, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 174
    .line 175
    .line 176
    return-void
.end method

.method public setExpressDetectListener(Lcom/momo/mcamera/mask/detect/IPatternDetect$ExpressDetectListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->listener:Lcom/momo/mcamera/mask/detect/IPatternDetect$ExpressDetectListener;

    .line 2
    .line 3
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->isDetecting:Ljava/util/concurrent/atomic/AtomicBoolean;

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
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->mmFrame:Ll/umw;

    .line 11
    .line 12
    const/16 v1, 0x11

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/umw;->h(I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->mmFrame:Ll/umw;

    .line 18
    .line 19
    iget v1, p1, Ll/omw;->e:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/umw;->m(I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->mmFrame:Ll/umw;

    .line 25
    .line 26
    iget v1, p1, Ll/omw;->f:I

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ll/umw;->j(I)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->mmFrame:Ll/umw;

    .line 32
    .line 33
    iget v1, p1, Ll/omw;->e:I

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ll/umw;->l(I)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p1, Ll/omw;->g:[B

    .line 39
    .line 40
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iput-object v0, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->curByteBuffer:Ljava/nio/ByteBuffer;

    .line 45
    .line 46
    iget-object v0, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->paramsInfo:Ll/lnw;

    .line 47
    .line 48
    iget-boolean v1, p1, Ll/omw;->a:Z

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ll/lnw;->p(Z)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->paramsInfo:Ll/lnw;

    .line 54
    .line 55
    iget v1, p1, Ll/omw;->b:I

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ll/lnw;->A(I)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->paramsInfo:Ll/lnw;

    .line 61
    .line 62
    iget v1, p1, Ll/omw;->c:I

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ll/lnw;->z(I)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->paramsInfo:Ll/lnw;

    .line 68
    .line 69
    invoke-virtual {p1}, Ll/omw;->o()[[F

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v0, v1}, Ll/lnw;->u([[F)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->paramsInfo:Ll/lnw;

    .line 77
    .line 78
    invoke-virtual {p1}, Ll/omw;->p()[[F

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-virtual {v0, p1}, Ll/lnw;->v([[F)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->waitSignal:Ljava/lang/Object;

    .line 86
    .line 87
    monitor-enter p1

    .line 88
    :try_start_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->waitSignal:Ljava/lang/Object;

    .line 89
    .line 90
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 91
    .line 92
    .line 93
    monitor-exit p1

    .line 94
    return-void

    .line 95
    :catchall_0
    move-exception p0

    .line 96
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 97
    throw p0
.end method

.method public setModelPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->expressModelPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public startDetect()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->startSync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->detectThread:Lcom/momo/mcamera/mask/express/ExpressDetector$ExpressThread;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->running:Z

    .line 10
    .line 11
    new-instance v1, Lcom/momo/mcamera/mask/express/ExpressDetector$ExpressThread;

    .line 12
    .line 13
    const-string v2, "ExpressDetect"

    .line 14
    .line 15
    invoke-direct {v1, p0, v2}, Lcom/momo/mcamera/mask/express/ExpressDetector$ExpressThread;-><init>(Lcom/momo/mcamera/mask/express/ExpressDetector;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->detectThread:Lcom/momo/mcamera/mask/express/ExpressDetector$ExpressThread;

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception p0

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    :goto_0
    monitor-exit v0

    .line 27
    return-void

    .line 28
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    throw p0
.end method

.method public stopDetect()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->running:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->curByteBuffer:Ljava/nio/ByteBuffer;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->detectThread:Lcom/momo/mcamera/mask/express/ExpressDetector$ExpressThread;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    :catch_0
    iput-object v1, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->detectThread:Lcom/momo/mcamera/mask/express/ExpressDetector$ExpressThread;

    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->express:Lcom/momocv/express/Express;

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/momocv/express/Express;->Release()V

    .line 26
    .line 27
    .line 28
    iput-object v1, p0, Lcom/momo/mcamera/mask/express/ExpressDetector;->express:Lcom/momocv/express/Express;

    .line 29
    .line 30
    :cond_2
    return-void
.end method
