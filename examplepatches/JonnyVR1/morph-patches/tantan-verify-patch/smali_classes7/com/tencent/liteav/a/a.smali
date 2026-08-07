.class public Lcom/tencent/liteav/a/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/audio/f;
.implements Lcom/tencent/liteav/videoencoder/d;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/a/a$a;,
        Lcom/tencent/liteav/a/a$b;
    }
.end annotation


# instance fields
.field private a:Lcom/tencent/liteav/audio/impl/Record/b;

.field private b:Lcom/tencent/liteav/videoencoder/a;

.field private c:Lcom/tencent/liteav/muxer/c;

.field private d:Lcom/tencent/liteav/a/a$a;

.field private e:Lcom/tencent/liteav/a/a$b;

.field private f:J

.field private g:J

.field private h:Z

.field private i:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/tencent/liteav/a/a;->f:J

    .line 7
    .line 8
    const-wide/16 v0, -0x1

    .line 9
    .line 10
    iput-wide v0, p0, Lcom/tencent/liteav/a/a;->g:J

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Lcom/tencent/liteav/a/a;->h:Z

    .line 14
    .line 15
    new-instance v0, Lcom/tencent/liteav/a/a$1;

    .line 16
    .line 17
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-direct {v0, p0, v1}, Lcom/tencent/liteav/a/a$1;-><init>(Lcom/tencent/liteav/a/a;Landroid/os/Looper;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/tencent/liteav/a/a;->i:Landroid/os/Handler;

    .line 25
    .line 26
    new-instance v0, Lcom/tencent/liteav/audio/impl/Record/b;

    .line 27
    .line 28
    invoke-direct {v0}, Lcom/tencent/liteav/audio/impl/Record/b;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/tencent/liteav/a/a;->a:Lcom/tencent/liteav/audio/impl/Record/b;

    .line 32
    .line 33
    new-instance v0, Lcom/tencent/liteav/videoencoder/a;

    .line 34
    .line 35
    invoke-direct {v0}, Lcom/tencent/liteav/videoencoder/a;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/tencent/liteav/a/a;->b:Lcom/tencent/liteav/videoencoder/a;

    .line 39
    .line 40
    new-instance v0, Lcom/tencent/liteav/muxer/c;

    .line 41
    .line 42
    const/4 v1, 0x2

    .line 43
    invoke-direct {v0, p1, v1}, Lcom/tencent/liteav/muxer/c;-><init>(Landroid/content/Context;I)V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Lcom/tencent/liteav/a/a;->c:Lcom/tencent/liteav/muxer/c;

    .line 47
    .line 48
    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/a/a;)Lcom/tencent/liteav/a/a$b;
    .locals 0

    .line 109
    iget-object p0, p0, Lcom/tencent/liteav/a/a;->e:Lcom/tencent/liteav/a/a$b;

    return-object p0
.end method

.method private a(I)Ljava/lang/String;
    .locals 3

    packed-switch p1, :pswitch_data_0

    .line 147
    const-string p1, ""

    goto :goto_0

    .line 148
    :pswitch_0
    const-string p1, "Video encoding failed"

    goto :goto_0

    .line 149
    :pswitch_1
    const-string p1, "Video encoding failed to initialize"

    goto :goto_0

    .line 150
    :pswitch_2
    const-string p1, "Illegal video input parameters"

    goto :goto_0

    .line 151
    :pswitch_3
    const-string p1, "Video encoder is not activated"

    .line 152
    :goto_0
    iget-object p0, p0, Lcom/tencent/liteav/a/a;->i:Landroid/os/Handler;

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-static {p0, v2, v0, v1, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-object p1

    :pswitch_data_0
    .packed-switch 0x989682
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static a(Landroid/content/Context;)Ljava/lang/String;
    .locals 3

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 142
    :cond_0
    const-string v1, "mounted"

    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 143
    invoke-static {}, Landroid/os/Environment;->isExternalStorageRemovable()Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    .line 144
    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 145
    :cond_2
    :goto_0
    sget-object v1, Landroid/os/Environment;->DIRECTORY_MOVIES:Ljava/lang/String;

    invoke-virtual {p0, v1}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    if-eqz p0, :cond_3

    .line 146
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_3
    return-object v0
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    .line 1
    const-string v0, "TXUGC_%s"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return-object v1

    .line 7
    :cond_0
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    const-wide/16 v4, 0x3e8

    .line 12
    .line 13
    div-long/2addr v2, v4

    .line 14
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    new-instance v3, Ljava/text/SimpleDateFormat;

    .line 19
    .line 20
    const-string v4, "yyyyMMdd_HHmmss"

    .line 21
    .line 22
    invoke-direct {v3, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    new-instance v4, Ljava/util/Date;

    .line 26
    .line 27
    new-instance v5, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v2, "000"

    .line 36
    .line 37
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-static {v2}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 49
    .line 50
    .line 51
    move-result-wide v5

    .line 52
    invoke-direct {v4, v5, v6}, Ljava/util/Date;-><init>(J)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v3, v4}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-static {p0}, Lcom/tencent/liteav/a/a;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    if-eqz v3, :cond_1

    .line 68
    .line 69
    return-object v1

    .line 70
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    new-instance v0, Ljava/io/File;

    .line 91
    .line 92
    invoke-direct {v0, p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    return-object p0

    .line 100
    :catch_0
    move-exception p0

    .line 101
    const-string p1, "TXCStreamRecord"

    .line 102
    .line 103
    const-string v0, "create file path failed."

    .line 104
    .line 105
    invoke-static {p1, v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 106
    .line 107
    .line 108
    return-object v1
.end method

.method public static synthetic b(Lcom/tencent/liteav/a/a;)Lcom/tencent/liteav/a/a$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/a/a;->d:Lcom/tencent/liteav/a/a$a;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public a()V
    .locals 4

    const/4 v0, 0x0

    .line 130
    iput-boolean v0, p0, Lcom/tencent/liteav/a/a;->h:Z

    .line 131
    iget-object v1, p0, Lcom/tencent/liteav/a/a;->a:Lcom/tencent/liteav/audio/impl/Record/b;

    invoke-virtual {v1}, Lcom/tencent/liteav/audio/impl/Record/b;->a()V

    .line 132
    iget-object v1, p0, Lcom/tencent/liteav/a/a;->b:Lcom/tencent/liteav/videoencoder/a;

    invoke-virtual {v1}, Lcom/tencent/liteav/videoencoder/a;->stop()V

    .line 133
    iget-object v1, p0, Lcom/tencent/liteav/a/a;->c:Lcom/tencent/liteav/muxer/c;

    invoke-virtual {v1}, Lcom/tencent/liteav/muxer/c;->b()I

    move-result v1

    .line 134
    iget-object p0, p0, Lcom/tencent/liteav/a/a;->i:Landroid/os/Handler;

    const/4 v2, 0x2

    if-gez v1, :cond_0

    const/4 v1, 0x1

    .line 135
    const-string v3, "mp4\u5408\u6210\u5931\u8d25"

    invoke-static {p0, v2, v1, v0, v3}, Landroid/os/Message;->obtain(Landroid/os/Handler;IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void

    .line 136
    :cond_0
    const-string v1, ""

    invoke-static {p0, v2, v0, v0, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public a(IJ)V
    .locals 6

    .line 137
    iget-object v0, p0, Lcom/tencent/liteav/a/a;->b:Lcom/tencent/liteav/videoencoder/a;

    iget-object p0, p0, Lcom/tencent/liteav/a/a;->d:Lcom/tencent/liteav/a/a$a;

    iget v2, p0, Lcom/tencent/liteav/a/a$a;->a:I

    iget v3, p0, Lcom/tencent/liteav/a/a$a;->b:I

    move v1, p1

    move-wide v4, p2

    invoke-virtual/range {v0 .. v5}, Lcom/tencent/liteav/videoencoder/a;->pushVideoFrame(IIIJ)J

    return-void
.end method

.method public a(IJJ)V
    .locals 0

    .line 141
    return-void
.end method

.method public a(Landroid/media/MediaFormat;)V
    .locals 3

    .line 161
    iget-object v0, p0, Lcom/tencent/liteav/a/a;->c:Lcom/tencent/liteav/muxer/c;

    invoke-virtual {v0, p1}, Lcom/tencent/liteav/muxer/c;->a(Landroid/media/MediaFormat;)V

    .line 162
    iget-object p1, p0, Lcom/tencent/liteav/a/a;->c:Lcom/tencent/liteav/muxer/c;

    invoke-virtual {p1}, Lcom/tencent/liteav/muxer/c;->c()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 163
    iget-object p1, p0, Lcom/tencent/liteav/a/a;->c:Lcom/tencent/liteav/muxer/c;

    invoke-virtual {p1}, Lcom/tencent/liteav/muxer/c;->a()I

    move-result p1

    if-gez p1, :cond_0

    .line 164
    iget-object p0, p0, Lcom/tencent/liteav/a/a;->i:Landroid/os/Handler;

    const/4 p1, 0x0

    const-string v0, "mp4 wrapper failed to start"

    const/4 v1, 0x2

    const/4 v2, 0x1

    invoke-static {p0, v1, v2, p1, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_0
    return-void
.end method

.method public a(Lcom/tencent/liteav/a/a$a;)V
    .locals 8

    .line 111
    iput-object p1, p0, Lcom/tencent/liteav/a/a;->d:Lcom/tencent/liteav/a/a$a;

    const-wide/16 v0, 0x0

    .line 112
    iput-wide v0, p0, Lcom/tencent/liteav/a/a;->f:J

    const-wide/16 v0, -0x1

    .line 113
    iput-wide v0, p0, Lcom/tencent/liteav/a/a;->g:J

    .line 114
    iget-object v0, p0, Lcom/tencent/liteav/a/a;->c:Lcom/tencent/liteav/muxer/c;

    iget-object v1, p1, Lcom/tencent/liteav/a/a$a;->f:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/tencent/liteav/muxer/c;->a(Ljava/lang/String;)V

    .line 115
    iget v5, p1, Lcom/tencent/liteav/a/a$a;->h:I

    const/4 v0, 0x1

    if-lez v5, :cond_0

    iget v4, p1, Lcom/tencent/liteav/a/a$a;->i:I

    if-lez v4, :cond_0

    iget v6, p1, Lcom/tencent/liteav/a/a$a;->j:I

    if-lez v6, :cond_0

    .line 116
    iget-object v2, p0, Lcom/tencent/liteav/a/a;->a:Lcom/tencent/liteav/audio/impl/Record/b;

    new-instance v7, Ljava/lang/ref/WeakReference;

    invoke-direct {v7, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    const/16 v3, 0xa

    invoke-virtual/range {v2 .. v7}, Lcom/tencent/liteav/audio/impl/Record/b;->a(IIIILjava/lang/ref/WeakReference;)V

    .line 117
    iget-object p1, p0, Lcom/tencent/liteav/a/a;->d:Lcom/tencent/liteav/a/a$a;

    iget v1, p1, Lcom/tencent/liteav/a/a$a;->i:I

    iget p1, p1, Lcom/tencent/liteav/a/a$a;->h:I

    const/4 v2, 0x2

    invoke-static {v1, p1, v2}, Lcom/tencent/liteav/basic/util/f;->a(III)Landroid/media/MediaFormat;

    move-result-object p1

    .line 118
    iget-object v1, p0, Lcom/tencent/liteav/a/a;->c:Lcom/tencent/liteav/muxer/c;

    invoke-virtual {v1, p1}, Lcom/tencent/liteav/muxer/c;->b(Landroid/media/MediaFormat;)V

    .line 119
    iput-boolean v0, p0, Lcom/tencent/liteav/a/a;->h:Z

    .line 120
    :cond_0
    iget-object p1, p0, Lcom/tencent/liteav/a/a;->b:Lcom/tencent/liteav/videoencoder/a;

    invoke-virtual {p1, p0}, Lcom/tencent/liteav/videoencoder/c;->setListener(Lcom/tencent/liteav/videoencoder/d;)V

    .line 121
    new-instance p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    invoke-direct {p1}, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;-><init>()V

    .line 122
    iget-object v1, p0, Lcom/tencent/liteav/a/a;->d:Lcom/tencent/liteav/a/a$a;

    iget v2, v1, Lcom/tencent/liteav/a/a$a;->a:I

    iput v2, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->width:I

    .line 123
    iget v2, v1, Lcom/tencent/liteav/a/a$a;->b:I

    iput v2, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->height:I

    .line 124
    iget v2, v1, Lcom/tencent/liteav/a/a$a;->c:I

    iput v2, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->fps:I

    .line 125
    iget-object v2, v1, Lcom/tencent/liteav/a/a$a;->e:Ljava/lang/Object;

    iput-object v2, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->glContext:Ljava/lang/Object;

    .line 126
    iput-boolean v0, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->annexb:Z

    const/4 v0, 0x0

    .line 127
    iput-boolean v0, p1, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->appendSpsPps:Z

    .line 128
    iget-object v0, p0, Lcom/tencent/liteav/a/a;->b:Lcom/tencent/liteav/videoencoder/a;

    iget v1, v1, Lcom/tencent/liteav/a/a$a;->d:I

    invoke-virtual {v0, v1}, Lcom/tencent/liteav/videoencoder/a;->setBitrate(I)V

    .line 129
    iget-object p0, p0, Lcom/tencent/liteav/a/a;->b:Lcom/tencent/liteav/videoencoder/a;

    invoke-virtual {p0, p1}, Lcom/tencent/liteav/videoencoder/a;->start(Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;)I

    return-void
.end method

.method public a(Lcom/tencent/liteav/a/a$b;)V
    .locals 0

    .line 110
    iput-object p1, p0, Lcom/tencent/liteav/a/a;->e:Lcom/tencent/liteav/a/a$b;

    return-void
.end method

.method public a(Lcom/tencent/liteav/basic/structs/TXSNALPacket;I)V
    .locals 8

    if-nez p2, :cond_2

    .line 153
    iget-object v0, p0, Lcom/tencent/liteav/a/a;->c:Lcom/tencent/liteav/muxer/c;

    iget-object v1, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalData:[B

    array-length v3, v1

    iget-wide v4, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->pts:J

    const-wide/16 v6, 0x3e8

    mul-long/2addr v4, v6

    iget-object p2, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->info:Landroid/media/MediaCodec$BufferInfo;

    iget v6, p2, Landroid/media/MediaCodec$BufferInfo;->flags:I

    const/4 v2, 0x0

    invoke-virtual/range {v0 .. v6}, Lcom/tencent/liteav/muxer/c;->b([BIIJI)V

    .line 154
    iget-wide v0, p0, Lcom/tencent/liteav/a/a;->g:J

    const-wide/16 v2, 0x0

    cmp-long p2, v0, v2

    if-gez p2, :cond_0

    .line 155
    iget-wide v0, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->pts:J

    iput-wide v0, p0, Lcom/tencent/liteav/a/a;->g:J

    .line 156
    :cond_0
    iget-wide v0, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->pts:J

    iget-wide v2, p0, Lcom/tencent/liteav/a/a;->f:J

    const-wide/16 v4, 0x1f4

    add-long/2addr v2, v4

    cmp-long p2, v0, v2

    if-lez p2, :cond_1

    .line 157
    iget-object p2, p0, Lcom/tencent/liteav/a/a;->i:Landroid/os/Handler;

    new-instance v2, Ljava/lang/Long;

    iget-wide v3, p0, Lcom/tencent/liteav/a/a;->g:J

    sub-long/2addr v0, v3

    invoke-direct {v2, v0, v1}, Ljava/lang/Long;-><init>(J)V

    const/4 v0, 0x1

    invoke-static {p2, v0, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 158
    iget-wide p1, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->pts:J

    iput-wide p1, p0, Lcom/tencent/liteav/a/a;->f:J

    :cond_1
    return-void

    .line 159
    :cond_2
    invoke-direct {p0, p2}, Lcom/tencent/liteav/a/a;->a(I)Ljava/lang/String;

    move-result-object p0

    .line 160
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "video encode error! errmsg: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "TXCStreamRecord"

    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public a([BJ)V
    .locals 1

    .line 138
    iget-boolean v0, p0, Lcom/tencent/liteav/a/a;->h:Z

    if-eqz v0, :cond_0

    .line 139
    iget-object p0, p0, Lcom/tencent/liteav/a/a;->a:Lcom/tencent/liteav/audio/impl/Record/b;

    invoke-virtual {p0, p1, p2, p3}, Lcom/tencent/liteav/audio/impl/Record/b;->a([BJ)V

    return-void

    .line 140
    :cond_0
    const-string p0, "TXCStreamRecord"

    const-string p1, "drainAudio fail because of not init yet!"

    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public k(I)V
    .locals 0

    return-void
.end method

.method public l(I)V
    .locals 0

    return-void
.end method

.method public onRecordEncData([BJIII)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/a/a;->c:Lcom/tencent/liteav/muxer/c;

    .line 2
    .line 3
    move-wide p4, p2

    .line 4
    array-length p3, p1

    .line 5
    const-wide/16 v0, 0x3e8

    .line 6
    .line 7
    mul-long/2addr p4, v0

    .line 8
    const/4 p6, 0x1

    .line 9
    const/4 p2, 0x0

    .line 10
    invoke-virtual/range {p0 .. p6}, Lcom/tencent/liteav/muxer/c;->a([BIIJI)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onRecordError(ILjava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onRecordPcmData([BJIII)V
    .locals 0

    return-void
.end method

.method public onRecordRawPcmData([BJIIIZ)V
    .locals 0

    return-void
.end method
