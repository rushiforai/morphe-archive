.class public Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI$AVOptions;
    }
.end annotation


# instance fields
.field private a:J

.field private volatile b:Z

.field private volatile c:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->a:J

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->init()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    iput-wide v0, p0, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->a:J

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p0, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->b:Z

    .line 16
    .line 17
    return-void
.end method

.method private b(Ljava/nio/ByteBuffer;I)[B
    .locals 0

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 41
    :cond_0
    new-array p0, p2, [B

    .line 42
    invoke-virtual {p1, p0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    return-object p0
.end method

.method private native init()J
.end method

.method private native release(J)V
.end method

.method private native setAVParams(JLcom/tencent/liteav/muxer/jni/TXSWMuxerJNI$AVOptions;)V
.end method

.method private native setAudioCSD(J[B)V
.end method

.method private native setDstPath(JLjava/lang/String;)V
.end method

.method private native setVideoCSD(J[B[B)V
.end method

.method private native start(J)I
.end method

.method private native stop(J)I
.end method

.method private native writeFrame(J[BIIIIJ)I
.end method


# virtual methods
.method public a()I
    .locals 4

    .line 62
    iget-boolean v0, p0, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->b:Z

    const-string v1, "TXSWMuxerJNI"

    if-eqz v0, :cond_1

    .line 63
    iget-wide v2, p0, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->a:J

    invoke-direct {p0, v2, v3}, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->start(J)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v1, 0x1

    .line 64
    iput-boolean v1, p0, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->c:Z

    return v0

    .line 65
    :cond_0
    const-string p0, "Start Muxer Error!!!"

    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v0

    .line 66
    :cond_1
    const-string p0, "Muxer isn\'t init yet!"

    invoke-static {v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, -0x1

    return p0
.end method

.method public a(Ljava/nio/ByteBuffer;IIIIJ)I
    .locals 11

    .line 1
    iget-boolean v1, p0, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->b:Z

    .line 2
    .line 3
    const/4 v2, -0x1

    .line 4
    const-string v10, "TXSWMuxerJNI"

    .line 5
    .line 6
    if-eqz v1, :cond_2

    .line 7
    .line 8
    iget-boolean v1, p0, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->c:Z

    .line 9
    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    iget-wide v1, p0, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->a:J

    .line 13
    .line 14
    invoke-direct {p0, p1, p4}, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->b(Ljava/nio/ByteBuffer;I)[B

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    move-object v0, p0

    .line 19
    move v4, p2

    .line 20
    move v5, p3

    .line 21
    move v6, p4

    .line 22
    move/from16 v7, p5

    .line 23
    .line 24
    move-wide/from16 v8, p6

    .line 25
    .line 26
    invoke-direct/range {v0 .. v9}, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->writeFrame(J[BIIIIJ)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    const-string v1, "Muxer write frame error!"

    .line 33
    .line 34
    invoke-static {v10, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return v0

    .line 38
    :cond_1
    const-string v0, "Muxer isn\'t start yet!"

    .line 39
    .line 40
    invoke-static {v10, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return v2

    .line 44
    :cond_2
    const-string v0, "Muxer isn\'t init yet!"

    .line 45
    .line 46
    invoke-static {v10, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return v2
.end method

.method public a(Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI$AVOptions;)V
    .locals 2

    .line 59
    iget-boolean v0, p0, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->b:Z

    if-eqz v0, :cond_0

    .line 60
    iget-wide v0, p0, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->a:J

    invoke-direct {p0, v0, v1, p1}, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->setAVParams(JLcom/tencent/liteav/muxer/jni/TXSWMuxerJNI$AVOptions;)V

    return-void

    .line 61
    :cond_0
    const-string p0, "TXSWMuxerJNI"

    const-string p1, "Muxer isn\'t init yet!"

    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public a(Ljava/lang/String;)V
    .locals 2

    .line 50
    iget-boolean v0, p0, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->b:Z

    if-eqz v0, :cond_0

    .line 51
    iget-wide v0, p0, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->a:J

    invoke-direct {p0, v0, v1, p1}, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->setDstPath(JLjava/lang/String;)V

    return-void

    .line 52
    :cond_0
    const-string p0, "TXSWMuxerJNI"

    const-string p1, "Muxer isn\'t init yet!"

    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public a(Ljava/nio/ByteBuffer;I)V
    .locals 2

    .line 56
    iget-boolean v0, p0, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->b:Z

    if-eqz v0, :cond_0

    .line 57
    iget-wide v0, p0, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->a:J

    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->b(Ljava/nio/ByteBuffer;I)[B

    move-result-object p1

    invoke-direct {p0, v0, v1, p1}, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->setAudioCSD(J[B)V

    return-void

    .line 58
    :cond_0
    const-string p0, "TXSWMuxerJNI"

    const-string p1, "Muxer isn\'t init yet!"

    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public a(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;I)V
    .locals 2

    .line 53
    iget-boolean v0, p0, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->b:Z

    if-eqz v0, :cond_0

    .line 54
    iget-wide v0, p0, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->a:J

    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->b(Ljava/nio/ByteBuffer;I)[B

    move-result-object p1

    invoke-direct {p0, p3, p4}, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->b(Ljava/nio/ByteBuffer;I)[B

    move-result-object p2

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->setVideoCSD(J[B[B)V

    return-void

    .line 55
    :cond_0
    const-string p0, "TXSWMuxerJNI"

    const-string p1, "Muxer isn\'t init yet!"

    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public b()I
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->b:Z

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const-string v2, "TXSWMuxerJNI"

    .line 5
    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    iget-boolean v0, p0, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->c:Z

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->c:Z

    .line 14
    .line 15
    iget-wide v0, p0, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->a:J

    .line 16
    .line 17
    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->stop(J)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const-string v0, "Stop Muxer Error!!!"

    .line 24
    .line 25
    invoke-static {v2, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return p0

    .line 29
    :cond_1
    const-string p0, "Muxer isn\'t start yet!"

    .line 30
    .line 31
    invoke-static {v2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return v1

    .line 35
    :cond_2
    const-string p0, "Muxer isn\'t init yet!"

    .line 36
    .line 37
    invoke-static {v2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return v1
.end method

.method public c()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-wide v0, p0, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->a:J

    .line 6
    .line 7
    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->release(J)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->b:Z

    .line 12
    .line 13
    iput-boolean v0, p0, Lcom/tencent/liteav/muxer/jni/TXSWMuxerJNI;->c:Z

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const-string p0, "TXSWMuxerJNI"

    .line 17
    .line 18
    const-string v0, "Muxer isn\'t init yet!"

    .line 19
    .line 20
    invoke-static {p0, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
