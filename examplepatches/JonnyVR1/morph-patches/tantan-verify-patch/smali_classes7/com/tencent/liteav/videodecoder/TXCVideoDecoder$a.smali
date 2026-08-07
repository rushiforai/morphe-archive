.class Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/liteav/videodecoder/TXCVideoDecoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field a:Lcom/tencent/liteav/videodecoder/b;

.field b:Lcom/tencent/liteav/videodecoder/f;

.field c:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/basic/b/b;",
            ">;"
        }
    .end annotation
.end field

.field d:Z

.field e:Z

.field f:Landroid/view/Surface;

.field private g:Ljava/nio/ByteBuffer;

.field private h:Ljava/nio/ByteBuffer;


# direct methods
.method public constructor <init>(Landroid/os/Looper;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private a(Z)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->a:Lcom/tencent/liteav/videodecoder/b;

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->d:Z

    .line 4
    .line 5
    const-string v2, "TXCVideoDecoder"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance p0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string p1, "play:decode: start decode ignore hwdec: "

    .line 12
    .line 13
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {v2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    if-eqz v1, :cond_1

    .line 28
    .line 29
    new-instance v0, Lcom/tencent/liteav/videodecoder/e;

    .line 30
    .line 31
    invoke-direct {v0}, Lcom/tencent/liteav/videodecoder/e;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->a:Lcom/tencent/liteav/videodecoder/b;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    new-instance v0, Lcom/tencent/liteav/videodecoder/TXCVideoFfmpegDecoder;

    .line 38
    .line 39
    invoke-direct {v0}, Lcom/tencent/liteav/videodecoder/TXCVideoFfmpegDecoder;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->a:Lcom/tencent/liteav/videodecoder/b;

    .line 43
    .line 44
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->a:Lcom/tencent/liteav/videodecoder/b;

    .line 45
    .line 46
    iget-object v1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->b:Lcom/tencent/liteav/videodecoder/f;

    .line 47
    .line 48
    invoke-interface {v0, v1}, Lcom/tencent/liteav/videodecoder/b;->setListener(Lcom/tencent/liteav/videodecoder/f;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->a:Lcom/tencent/liteav/videodecoder/b;

    .line 52
    .line 53
    iget-object v1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->c:Ljava/lang/ref/WeakReference;

    .line 54
    .line 55
    invoke-interface {v0, v1}, Lcom/tencent/liteav/videodecoder/b;->setNotifyListener(Ljava/lang/ref/WeakReference;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->a:Lcom/tencent/liteav/videodecoder/b;

    .line 59
    .line 60
    iget-object v1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->f:Landroid/view/Surface;

    .line 61
    .line 62
    invoke-interface {v0, v1}, Lcom/tencent/liteav/videodecoder/b;->config(Landroid/view/Surface;)I

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->a:Lcom/tencent/liteav/videodecoder/b;

    .line 66
    .line 67
    iget-object v1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->g:Ljava/nio/ByteBuffer;

    .line 68
    .line 69
    iget-object v3, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->h:Ljava/nio/ByteBuffer;

    .line 70
    .line 71
    iget-boolean v4, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->e:Z

    .line 72
    .line 73
    invoke-interface {v0, v1, v3, p1, v4}, Lcom/tencent/liteav/videodecoder/b;->start(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;ZZ)I

    .line 74
    .line 75
    .line 76
    new-instance p1, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    const-string v0, "play:decode: start decode hwdec: "

    .line 79
    .line 80
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    iget-boolean v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->d:Z

    .line 84
    .line 85
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    const-string v0, ", hevc: "

    .line 89
    .line 90
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    iget-boolean p0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->e:Z

    .line 94
    .line 95
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-static {v2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method private a(ZZ)V
    .locals 1

    .line 115
    iput-boolean p1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->d:Z

    .line 116
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "play:decode: restart decode hwdec: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->d:Z

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "TXCVideoDecoder"

    invoke-static {v0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    iget-object p1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->a:Lcom/tencent/liteav/videodecoder/b;

    if-eqz p1, :cond_0

    .line 118
    invoke-interface {p1}, Lcom/tencent/liteav/videodecoder/b;->stop()V

    .line 119
    iget-object p1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->a:Lcom/tencent/liteav/videodecoder/b;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lcom/tencent/liteav/videodecoder/b;->setListener(Lcom/tencent/liteav/videodecoder/f;)V

    .line 120
    iget-object p1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->a:Lcom/tencent/liteav/videodecoder/b;

    invoke-interface {p1, v0}, Lcom/tencent/liteav/videodecoder/b;->setNotifyListener(Ljava/lang/ref/WeakReference;)V

    .line 121
    iput-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->a:Lcom/tencent/liteav/videodecoder/b;

    .line 122
    :cond_0
    invoke-direct {p0, p2}, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->a(Z)V

    return-void
.end method

.method private a([BJJI)V
    .locals 1

    .line 108
    new-instance v0, Lcom/tencent/liteav/basic/structs/TXSNALPacket;

    invoke-direct {v0}, Lcom/tencent/liteav/basic/structs/TXSNALPacket;-><init>()V

    .line 109
    iput-object p1, v0, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalData:[B

    .line 110
    iput-wide p2, v0, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->pts:J

    .line 111
    iput-wide p4, v0, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->dts:J

    .line 112
    iput p6, v0, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->codecId:I

    .line 113
    iget-object p0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->a:Lcom/tencent/liteav/videodecoder/b;

    if-eqz p0, :cond_0

    .line 114
    invoke-interface {p0, v0}, Lcom/tencent/liteav/videodecoder/b;->decode(Lcom/tencent/liteav/basic/structs/TXSNALPacket;)V

    :cond_0
    return-void
.end method

.method private b()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->a:Lcom/tencent/liteav/videodecoder/b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/tencent/liteav/videodecoder/b;->stop()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->a:Lcom/tencent/liteav/videodecoder/b;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-interface {v0, v1}, Lcom/tencent/liteav/videodecoder/b;->setListener(Lcom/tencent/liteav/videodecoder/f;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->a:Lcom/tencent/liteav/videodecoder/b;

    .line 15
    .line 16
    invoke-interface {v0, v1}, Lcom/tencent/liteav/videodecoder/b;->setNotifyListener(Ljava/lang/ref/WeakReference;)V

    .line 17
    .line 18
    .line 19
    iput-object v1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->a:Lcom/tencent/liteav/videodecoder/b;

    .line 20
    .line 21
    :cond_0
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Landroid/os/Looper;->quit()V

    .line 26
    .line 27
    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    const-string v1, "play:decode: stop decode hwdec: "

    .line 31
    .line 32
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-boolean p0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->d:Z

    .line 36
    .line 37
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const-string v0, "TXCVideoDecoder"

    .line 45
    .line 46
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method


# virtual methods
.method public a(ZZLandroid/view/Surface;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Lcom/tencent/liteav/videodecoder/f;Lcom/tencent/liteav/basic/b/b;)V
    .locals 0

    .line 123
    iput-boolean p1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->e:Z

    .line 124
    iput-boolean p2, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->d:Z

    .line 125
    iput-object p3, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->f:Landroid/view/Surface;

    .line 126
    iput-object p4, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->g:Ljava/nio/ByteBuffer;

    .line 127
    iput-object p5, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->h:Ljava/nio/ByteBuffer;

    .line 128
    iput-object p6, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->b:Lcom/tencent/liteav/videodecoder/f;

    .line 129
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p7}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->c:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public a()Z
    .locals 0

    .line 106
    iget-object p0, p0, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->a:Lcom/tencent/liteav/videodecoder/b;

    if-eqz p0, :cond_0

    .line 107
    invoke-interface {p0}, Lcom/tencent/liteav/videodecoder/b;->isHevc()Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 8

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :pswitch_0
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v2, 0x1

    .line 11
    if-ne v0, v2, :cond_0

    .line 12
    .line 13
    move v0, v2

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v0, v1

    .line 16
    :goto_0
    iget p1, p1, Landroid/os/Message;->arg2:I

    .line 17
    .line 18
    if-ne p1, v2, :cond_1

    .line 19
    .line 20
    move v1, v2

    .line 21
    :cond_1
    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->a(ZZ)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :pswitch_1
    invoke-direct {p0}, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->b()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :pswitch_2
    :try_start_0
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const-string v0, "nal"

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getByteArray(Ljava/lang/String;)[B

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    const-string v0, "pts"

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;)J

    .line 42
    .line 43
    .line 44
    move-result-wide v3

    .line 45
    const-string v0, "dts"

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;)J

    .line 48
    .line 49
    .line 50
    move-result-wide v5

    .line 51
    const-string v0, "codecId"

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result v7

    .line 57
    move-object v1, p0

    .line 58
    invoke-direct/range {v1 .. v7}, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->a([BJJI)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :catch_0
    move-exception v0

    .line 63
    move-object p0, v0

    .line 64
    new-instance p1, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    const-string v0, "decode frame failed."

    .line 67
    .line 68
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    const-string p1, "TXCVideoDecoder"

    .line 83
    .line 84
    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :pswitch_3
    move-object v1, p0

    .line 89
    iget-object p0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 90
    .line 91
    check-cast p0, Ljava/lang/Boolean;

    .line 92
    .line 93
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    invoke-direct {v1, p0}, Lcom/tencent/liteav/videodecoder/TXCVideoDecoder$a;->a(Z)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :pswitch_data_0
    .packed-switch 0x64
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
