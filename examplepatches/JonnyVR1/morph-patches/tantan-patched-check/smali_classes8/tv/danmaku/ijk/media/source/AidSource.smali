.class public Ltv/danmaku/ijk/media/source/AidSource;
.super Ll/gfj;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;
    }
.end annotation


# instance fields
.field private a:Landroid/app/Activity;

.field private b:Ljava/lang/String;

.field private c:I

.field private d:I

.field private e:J

.field private f:I

.field private g:Landroid/graphics/Bitmap;

.field private i:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$SizeChangedCallback;

.field private j:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$aidSwitchResolution;

.field private k:Ltv/danmaku/ijk/media/streamer/StreamProducer;

.field private l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

.field private m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

.field private n:Ltv/danmaku/ijk/media/util/helpSurface;

.field private o:Ltv/danmaku/ijk/media/streamer/MomoSurface;

.field private p:J

.field private q:I

.field private r:I

.field private s:I

.field private t:Ljava/nio/ByteBuffer;

.field private u:Lcom/immomo/mediacore/audio/AudioProcess;

.field private v:I

.field private x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Ltv/danmaku/ijk/media/streamer/StreamProducer;Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;Ljava/lang/String;Ltv/danmaku/ijk/media/streamer/MomoSurface;JLtv/danmaku/ijk/media/streamer/ijkMediaStreamer$SizeChangedCallback;IILtv/danmaku/ijk/media/streamer/ijkMediaStreamer$aidSwitchResolution;)V
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    move-wide/from16 v4, p6

    move/from16 v6, p9

    move/from16 v7, p10

    .line 1
    const-string v8, "AidSource: msg:209"

    const-string v9, "AidSource: msg:210"

    const-string v10, "AidSource: end, cost time:"

    invoke-direct {v0}, Ll/gfj;-><init>()V

    const/4 v11, 0x0

    .line 2
    iput-object v11, v0, Ltv/danmaku/ijk/media/source/AidSource;->a:Landroid/app/Activity;

    const/4 v12, -0x1

    .line 3
    iput v12, v0, Ltv/danmaku/ijk/media/source/AidSource;->c:I

    .line 4
    iput v12, v0, Ltv/danmaku/ijk/media/source/AidSource;->d:I

    const-wide/16 v13, -0x1

    .line 5
    iput-wide v13, v0, Ltv/danmaku/ijk/media/source/AidSource;->e:J

    .line 6
    iput v12, v0, Ltv/danmaku/ijk/media/source/AidSource;->f:I

    .line 7
    iput-object v11, v0, Ltv/danmaku/ijk/media/source/AidSource;->g:Landroid/graphics/Bitmap;

    .line 8
    iput-object v11, v0, Ltv/danmaku/ijk/media/source/AidSource;->i:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$SizeChangedCallback;

    .line 9
    iput-object v11, v0, Ltv/danmaku/ijk/media/source/AidSource;->j:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$aidSwitchResolution;

    .line 10
    iput-object v11, v0, Ltv/danmaku/ijk/media/source/AidSource;->k:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 11
    iput-object v11, v0, Ltv/danmaku/ijk/media/source/AidSource;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 12
    iput-object v11, v0, Ltv/danmaku/ijk/media/source/AidSource;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 13
    iput-object v11, v0, Ltv/danmaku/ijk/media/source/AidSource;->n:Ltv/danmaku/ijk/media/util/helpSurface;

    .line 14
    iput-object v11, v0, Ltv/danmaku/ijk/media/source/AidSource;->o:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    const/4 v13, 0x0

    .line 15
    iput v13, v0, Ltv/danmaku/ijk/media/source/AidSource;->q:I

    const/16 v14, 0x400

    .line 16
    iput v14, v0, Ltv/danmaku/ijk/media/source/AidSource;->r:I

    .line 17
    iput v13, v0, Ltv/danmaku/ijk/media/source/AidSource;->s:I

    .line 18
    invoke-static {v14}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v14

    iput-object v14, v0, Ltv/danmaku/ijk/media/source/AidSource;->t:Ljava/nio/ByteBuffer;

    .line 19
    iput v12, v0, Ltv/danmaku/ijk/media/source/AidSource;->v:I

    .line 20
    new-instance v14, Ltv/danmaku/ijk/media/source/AidSource$1;

    invoke-direct {v14, v0}, Ltv/danmaku/ijk/media/source/AidSource$1;-><init>(Ltv/danmaku/ijk/media/source/AidSource;)V

    iput-object v14, v0, Ltv/danmaku/ijk/media/source/AidSource;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;

    .line 21
    iput-object v2, v0, Ltv/danmaku/ijk/media/source/AidSource;->b:Ljava/lang/String;

    move-object/from16 v14, p1

    .line 22
    iput-object v14, v0, Ltv/danmaku/ijk/media/source/AidSource;->a:Landroid/app/Activity;

    .line 23
    iput-wide v4, v0, Ltv/danmaku/ijk/media/source/AidSource;->e:J

    .line 24
    iput-object v3, v0, Ltv/danmaku/ijk/media/source/AidSource;->o:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 25
    iput-object v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    move-object/from16 v14, p2

    .line 26
    iput-object v14, v0, Ltv/danmaku/ijk/media/source/AidSource;->k:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    const/4 v14, 0x1

    if-ne v6, v14, :cond_0

    move-object/from16 v15, p8

    .line 27
    invoke-virtual {v0, v15}, Ltv/danmaku/ijk/media/source/AidSource;->y2(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$SizeChangedCallback;)V

    :cond_0
    move-object/from16 v15, p11

    .line 28
    invoke-virtual {v0, v15}, Ltv/danmaku/ijk/media/source/AidSource;->x2(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$aidSwitchResolution;)V

    .line 29
    iget-object v15, v0, Ltv/danmaku/ijk/media/source/AidSource;->a:Landroid/app/Activity;

    const-string v14, "aidStream"

    if-eqz v15, :cond_17

    if-eqz v3, :cond_17

    if-eqz v1, :cond_17

    if-nez v2, :cond_1

    goto/16 :goto_f

    .line 30
    :cond_1
    iget v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->q:I

    if-eqz v1, :cond_2

    const/4 v2, 0x5

    if-eq v1, v2, :cond_2

    .line 31
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "----AidSource: open status error: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, v0, Ltv/danmaku/ijk/media/source/AidSource;->q:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v14, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "----AidSource: begin old:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, v0, Ltv/danmaku/ijk/media/source/AidSource;->f:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "--->new:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "; player status:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v0, Ltv/danmaku/ijk/media/source/AidSource;->q:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v14, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v1, 0x9

    const/4 v2, 0x3

    if-eq v7, v2, :cond_3

    if-eq v7, v12, :cond_3

    .line 33
    iget v3, v0, Ltv/danmaku/ijk/media/source/AidSource;->f:I

    if-ne v3, v1, :cond_3

    .line 34
    invoke-direct {v0, v13}, Ltv/danmaku/ijk/media/source/AidSource;->t2(Z)V

    .line 35
    :cond_3
    iput v6, v0, Ltv/danmaku/ijk/media/source/AidSource;->f:I

    .line 36
    iput v13, v0, Ltv/danmaku/ijk/media/source/AidSource;->q:I

    .line 37
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->p:J

    .line 38
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "AidSource: begin, "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, v0, Ltv/danmaku/ijk/media/source/AidSource;->b:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", type="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ",id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v2, v0, Ltv/danmaku/ijk/media/source/AidSource;->e:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v14, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    new-instance v1, Ltv/danmaku/ijk/media/util/helpSurface;

    iget-wide v2, v0, Ltv/danmaku/ijk/media/source/AidSource;->e:J

    invoke-direct {v1, v11, v2, v3}, Ltv/danmaku/ijk/media/util/helpSurface;-><init>(Landroid/view/SurfaceHolder;J)V

    iput-object v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->n:Ltv/danmaku/ijk/media/util/helpSurface;

    .line 40
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->o:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    iget v2, v0, Ltv/danmaku/ijk/media/source/AidSource;->f:I

    invoke-virtual {v1, v4, v5, v2, v13}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->d0(JII)V

    const/16 v5, 0x8

    const/4 v6, 0x2

    const/16 v7, 0xd2

    const/16 v12, 0xc8

    .line 41
    :try_start_0
    new-instance v15, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    iget-object v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->a:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v15, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;-><init>(Landroid/content/Context;)V

    iput-object v15, v0, Ltv/danmaku/ijk/media/source/AidSource;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 42
    new-instance v1, Ltv/danmaku/ijk/media/source/AidSource$3;

    invoke-direct {v1, v0}, Ltv/danmaku/ijk/media/source/AidSource$3;-><init>(Ltv/danmaku/ijk/media/source/AidSource;)V

    invoke-virtual {v15, v1}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnPreparedListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnPreparedListener;)V

    .line 43
    iget v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->f:I

    if-eq v1, v6, :cond_6

    const/4 v15, 0x3

    if-eq v1, v15, :cond_6

    const/16 v15, 0x9

    if-ne v1, v15, :cond_4

    goto :goto_0

    :cond_4
    const/4 v15, 0x1

    if-ne v1, v15, :cond_5

    .line 44
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->k:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    if-eqz v1, :cond_5

    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->H0()I

    move-result v1

    if-nez v1, :cond_5

    .line 45
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    invoke-virtual {v1, v13}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMediaCodecEnabled(Z)V

    .line 46
    iput v13, v0, Ltv/danmaku/ijk/media/source/AidSource;->v:I

    .line 47
    const-string v1, "----Media codec 1 change 0"

    invoke-static {v14, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :catch_0
    const/4 v15, 0x1

    goto/16 :goto_9

    .line 48
    :cond_5
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1

    const/4 v15, 0x1

    :try_start_1
    invoke-virtual {v1, v15}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMediaCodecEnabled(Z)V

    .line 49
    iput v15, v0, Ltv/danmaku/ijk/media/source/AidSource;->v:I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    .line 50
    :try_start_2
    const-string v1, "----Media codec 1"

    invoke-static {v14, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 51
    :cond_6
    :goto_0
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    invoke-virtual {v1, v13}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMediaCodecEnabled(Z)V

    .line 52
    iput v13, v0, Ltv/danmaku/ijk/media/source/AidSource;->v:I

    .line 53
    const-string v1, "----Media codec 0"

    invoke-static {v14, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    :goto_1
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    new-instance v15, Ltv/danmaku/ijk/media/source/AidSource$4;

    invoke-direct {v15, v0}, Ltv/danmaku/ijk/media/source/AidSource$4;-><init>(Ltv/danmaku/ijk/media/source/AidSource;)V

    invoke-virtual {v1, v15}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnCompletionListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnCompletionListener;)V

    .line 55
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    new-instance v15, Ltv/danmaku/ijk/media/source/AidSource$5;

    invoke-direct {v15, v0}, Ltv/danmaku/ijk/media/source/AidSource$5;-><init>(Ltv/danmaku/ijk/media/source/AidSource;)V

    invoke-virtual {v1, v15}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnSeekCompleteListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnSeekCompleteListener;)V

    .line 56
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    new-instance v15, Ltv/danmaku/ijk/media/source/AidSource$6;

    invoke-direct {v15, v0}, Ltv/danmaku/ijk/media/source/AidSource$6;-><init>(Ltv/danmaku/ijk/media/source/AidSource;)V

    invoke-virtual {v1, v15}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnInfoListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnInfoListener;)V

    .line 57
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    new-instance v15, Ltv/danmaku/ijk/media/source/AidSource$7;

    invoke-direct {v15, v0}, Ltv/danmaku/ijk/media/source/AidSource$7;-><init>(Ltv/danmaku/ijk/media/source/AidSource;)V

    invoke-virtual {v1, v15}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnBufferingUpdateListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnBufferingUpdateListener;)V

    .line 58
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    new-instance v15, Ltv/danmaku/ijk/media/source/AidSource$8;

    invoke-direct {v15, v0}, Ltv/danmaku/ijk/media/source/AidSource$8;-><init>(Ltv/danmaku/ijk/media/source/AidSource;)V

    invoke-virtual {v1, v15}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnVideoMediacodecChangedListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnVideoMediacodecChangedListener;)V

    .line 59
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    new-instance v15, Ltv/danmaku/ijk/media/source/AidSource$9;

    invoke-direct {v15, v0}, Ltv/danmaku/ijk/media/source/AidSource$9;-><init>(Ltv/danmaku/ijk/media/source/AidSource;)V

    invoke-virtual {v1, v15}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnVideoSizeChangedListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnVideoSizeChangedListener;)V

    .line 60
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    new-instance v15, Ltv/danmaku/ijk/media/source/AidSource$10;

    invoke-direct {v15, v0}, Ltv/danmaku/ijk/media/source/AidSource$10;-><init>(Ltv/danmaku/ijk/media/source/AidSource;)V

    invoke-virtual {v1, v15}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnErrorListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnErrorListener;)V

    .line 61
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    iget-object v15, v0, Ltv/danmaku/ijk/media/source/AidSource;->n:Ltv/danmaku/ijk/media/util/helpSurface;

    invoke-virtual {v15}, Ltv/danmaku/ijk/media/util/helpSurface;->c()Landroid/view/Surface;

    move-result-object v15

    invoke-virtual {v1, v15}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setSurfaceH(Landroid/view/Surface;)V

    .line 62
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    iget-object v15, v0, Ltv/danmaku/ijk/media/source/AidSource;->b:Ljava/lang/String;

    invoke-virtual {v15}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v1, v15}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 63
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_1

    const/4 v15, 0x1

    :try_start_3
    invoke-virtual {v1, v15}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMediaDateCallbackFlags(I)V

    .line 64
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->n:Ltv/danmaku/ijk/media/util/helpSurface;

    iget-object v2, v0, Ltv/danmaku/ijk/media/source/AidSource;->o:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    invoke-virtual {v1, v2}, Ltv/danmaku/ijk/media/util/helpSurface;->h(Ltv/danmaku/ijk/media/streamer/MomoSurface;)V

    .line 65
    iput v15, v0, Ltv/danmaku/ijk/media/source/AidSource;->q:I
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_1

    .line 66
    :try_start_4
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    invoke-virtual {v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->prepareAsync()V

    .line 67
    iget v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->f:I

    const/4 v15, 0x3

    if-eq v1, v15, :cond_8

    if-eq v1, v5, :cond_8

    const/16 v15, 0x9

    if-ne v1, v15, :cond_7

    goto :goto_2

    .line 68
    :cond_7
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setVolume(FF)V

    goto :goto_3

    .line 69
    :cond_8
    :goto_2
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setVolume(FF)V

    .line 70
    :goto_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v15

    iget-wide v3, v0, Ltv/danmaku/ijk/media/source/AidSource;->p:J

    sub-long v2, v15, v3

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, "ms"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v14, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_4 .. :try_end_4} :catch_1

    return-void

    .line 71
    :catch_1
    iget v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->f:I

    if-eqz v1, :cond_c

    const/4 v15, 0x1

    if-ne v1, v15, :cond_9

    goto :goto_5

    :cond_9
    if-eq v1, v6, :cond_b

    const/4 v15, 0x3

    if-eq v1, v15, :cond_b

    const/16 v15, 0x9

    if-ne v1, v15, :cond_a

    goto :goto_4

    :cond_a
    if-ne v1, v5, :cond_d

    .line 72
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    invoke-static {v1, v12, v7, v13, v11}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->postEventFromStreamPro(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;IIILjava/lang/Object;)V

    .line 73
    invoke-static {v14, v9}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_6

    .line 74
    :cond_b
    :goto_4
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    const/16 v2, 0xd1

    invoke-static {v1, v12, v2, v13, v11}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->postEventFromStreamPro(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;IIILjava/lang/Object;)V

    .line 75
    invoke-static {v14, v8}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_6

    .line 76
    :cond_c
    :goto_5
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    invoke-static {v1, v12, v7, v13, v11}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->postEventFromStreamPro(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;IIILjava/lang/Object;)V

    .line 77
    invoke-static {v14, v9}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    :cond_d
    :goto_6
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/source/AidSource;->q2()Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$aidSwitchResolution;

    move-result-object v1

    if-eqz v1, :cond_f

    iget v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->f:I

    const/4 v15, 0x1

    if-ne v1, v15, :cond_e

    .line 79
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/source/AidSource;->q2()Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$aidSwitchResolution;

    move-result-object v1

    const/16 v2, 0x280

    const/16 v3, 0x160

    invoke-interface {v1, v3, v2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$aidSwitchResolution;->a(II)V

    :cond_e
    :goto_7
    const/4 v1, 0x4

    goto :goto_8

    :cond_f
    const/4 v15, 0x1

    goto :goto_7

    .line 80
    :goto_8
    iput v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->q:I

    .line 81
    invoke-direct {v0, v15}, Ltv/danmaku/ijk/media/source/AidSource;->t2(Z)V

    return-void

    .line 82
    :catch_2
    :goto_9
    iget v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->f:I

    if-eqz v1, :cond_13

    if-ne v1, v15, :cond_10

    goto :goto_b

    :cond_10
    if-eq v1, v6, :cond_12

    const/4 v15, 0x3

    if-eq v1, v15, :cond_12

    const/16 v15, 0x9

    if-ne v1, v15, :cond_11

    goto :goto_a

    :cond_11
    if-ne v1, v5, :cond_14

    .line 83
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    invoke-static {v1, v12, v7, v13, v11}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->postEventFromStreamPro(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;IIILjava/lang/Object;)V

    .line 84
    invoke-static {v14, v9}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_c

    .line 85
    :cond_12
    :goto_a
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    const/16 v2, 0xd1

    invoke-static {v1, v12, v2, v13, v11}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->postEventFromStreamPro(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;IIILjava/lang/Object;)V

    .line 86
    invoke-static {v14, v8}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_c

    .line 87
    :cond_13
    :goto_b
    iget-object v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    invoke-static {v1, v12, v7, v13, v11}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->postEventFromStreamPro(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;IIILjava/lang/Object;)V

    .line 88
    invoke-static {v14, v9}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    :cond_14
    :goto_c
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/source/AidSource;->q2()Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$aidSwitchResolution;

    move-result-object v1

    if-eqz v1, :cond_16

    iget v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->f:I

    const/4 v15, 0x1

    if-ne v1, v15, :cond_15

    .line 90
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/source/AidSource;->q2()Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$aidSwitchResolution;

    move-result-object v1

    const/16 v2, 0x280

    const/16 v3, 0x160

    invoke-interface {v1, v3, v2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$aidSwitchResolution;->a(II)V

    :cond_15
    :goto_d
    const/4 v1, 0x4

    goto :goto_e

    :cond_16
    const/4 v15, 0x1

    goto :goto_d

    .line 91
    :goto_e
    iput v1, v0, Ltv/danmaku/ijk/media/source/AidSource;->q:I

    .line 92
    invoke-direct {v0, v15}, Ltv/danmaku/ijk/media/source/AidSource;->t2(Z)V

    return-void

    .line 93
    :cond_17
    :goto_f
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "----AidSource: input error---userid="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v2, v0, Ltv/danmaku/ijk/media/source/AidSource;->e:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v14, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public constructor <init>(Landroid/graphics/Bitmap;Ltv/danmaku/ijk/media/streamer/MomoSurface;JI)V
    .locals 14

    move-object/from16 v1, p2

    move-wide/from16 v2, p3

    .line 94
    invoke-direct {p0}, Ll/gfj;-><init>()V

    const/4 v4, 0x0

    .line 95
    iput-object v4, p0, Ltv/danmaku/ijk/media/source/AidSource;->a:Landroid/app/Activity;

    const/4 v5, -0x1

    .line 96
    iput v5, p0, Ltv/danmaku/ijk/media/source/AidSource;->c:I

    .line 97
    iput v5, p0, Ltv/danmaku/ijk/media/source/AidSource;->d:I

    const-wide/16 v6, -0x1

    .line 98
    iput-wide v6, p0, Ltv/danmaku/ijk/media/source/AidSource;->e:J

    .line 99
    iput v5, p0, Ltv/danmaku/ijk/media/source/AidSource;->f:I

    .line 100
    iput-object v4, p0, Ltv/danmaku/ijk/media/source/AidSource;->g:Landroid/graphics/Bitmap;

    .line 101
    iput-object v4, p0, Ltv/danmaku/ijk/media/source/AidSource;->i:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$SizeChangedCallback;

    .line 102
    iput-object v4, p0, Ltv/danmaku/ijk/media/source/AidSource;->j:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$aidSwitchResolution;

    .line 103
    iput-object v4, p0, Ltv/danmaku/ijk/media/source/AidSource;->k:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 104
    iput-object v4, p0, Ltv/danmaku/ijk/media/source/AidSource;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 105
    iput-object v4, p0, Ltv/danmaku/ijk/media/source/AidSource;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 106
    iput-object v4, p0, Ltv/danmaku/ijk/media/source/AidSource;->n:Ltv/danmaku/ijk/media/util/helpSurface;

    .line 107
    iput-object v4, p0, Ltv/danmaku/ijk/media/source/AidSource;->o:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    const/4 v4, 0x0

    .line 108
    iput v4, p0, Ltv/danmaku/ijk/media/source/AidSource;->q:I

    const/16 v6, 0x400

    .line 109
    iput v6, p0, Ltv/danmaku/ijk/media/source/AidSource;->r:I

    .line 110
    iput v4, p0, Ltv/danmaku/ijk/media/source/AidSource;->s:I

    .line 111
    invoke-static {v6}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v6

    iput-object v6, p0, Ltv/danmaku/ijk/media/source/AidSource;->t:Ljava/nio/ByteBuffer;

    .line 112
    iput v5, p0, Ltv/danmaku/ijk/media/source/AidSource;->v:I

    .line 113
    new-instance v5, Ltv/danmaku/ijk/media/source/AidSource$1;

    invoke-direct {v5, p0}, Ltv/danmaku/ijk/media/source/AidSource$1;-><init>(Ltv/danmaku/ijk/media/source/AidSource;)V

    iput-object v5, p0, Ltv/danmaku/ijk/media/source/AidSource;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;

    if-eqz p1, :cond_1

    if-eqz v1, :cond_1

    .line 114
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "@@@ AidSource: image begin---userid="

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "aidStream"

    invoke-static {v6, v5}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    iput-object v1, p0, Ltv/danmaku/ijk/media/source/AidSource;->o:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 116
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource;->g:Landroid/graphics/Bitmap;

    .line 117
    iput-wide v2, p0, Ltv/danmaku/ijk/media/source/AidSource;->e:J

    const/4 v1, 0x7

    .line 118
    iput v1, p0, Ltv/danmaku/ijk/media/source/AidSource;->f:I

    .line 119
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v5, "@@@ AidSource: cast image---userid="

    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v7, p0, Ltv/danmaku/ijk/media/source/AidSource;->e:J

    invoke-virtual {v1, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v5, ";aidMode="

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, p0, Ltv/danmaku/ijk/media/source/AidSource;->f:I

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v6, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    iput v1, p0, Ltv/danmaku/ijk/media/source/AidSource;->d:I

    .line 121
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    iput v0, p0, Ltv/danmaku/ijk/media/source/AidSource;->c:I

    .line 122
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/AidSource;->o:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    if-eqz v0, :cond_0

    .line 123
    iget v1, p0, Ltv/danmaku/ijk/media/source/AidSource;->f:I

    invoke-virtual {v0, v2, v3, v1, v4}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->d0(JII)V

    .line 124
    iget-object v7, p0, Ltv/danmaku/ijk/media/source/AidSource;->o:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    iget-wide v8, p0, Ltv/danmaku/ijk/media/source/AidSource;->e:J

    iget v10, p0, Ltv/danmaku/ijk/media/source/AidSource;->d:I

    iget v11, p0, Ltv/danmaku/ijk/media/source/AidSource;->c:I

    const/4 v12, 0x0

    iget v13, p0, Ltv/danmaku/ijk/media/source/AidSource;->f:I

    invoke-virtual/range {v7 .. v13}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->X0(JIIII)V

    .line 125
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/AidSource;->o:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    iget-wide v1, p0, Ltv/danmaku/ijk/media/source/AidSource;->e:J

    const/4 v4, -0x1

    iget-object v5, p0, Ltv/danmaku/ijk/media/source/AidSource;->g:Landroid/graphics/Bitmap;

    const/4 v3, 0x0

    invoke-virtual/range {v0 .. v5}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->i1(JLandroid/graphics/SurfaceTexture;ILandroid/graphics/Bitmap;)V

    .line 126
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "@@@ AidSource: image end, cost time:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 127
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-wide v3, p0, Ltv/danmaku/ijk/media/source/AidSource;->p:J

    sub-long/2addr v1, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p0, "ms"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 128
    invoke-static {v6, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    return-void
.end method

.method private A2(J)Ljava/lang/String;
    .locals 2

    .line 1
    const-wide/16 v0, 0x3e8

    .line 2
    .line 3
    div-long/2addr p1, v0

    .line 4
    long-to-int p0, p1

    .line 5
    rem-int/lit8 p1, p0, 0x3c

    .line 6
    .line 7
    div-int/lit8 p2, p0, 0x3c

    .line 8
    .line 9
    rem-int/lit8 p2, p2, 0x3c

    .line 10
    .line 11
    div-int/lit16 p0, p0, 0xe10

    .line 12
    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string p0, ":"

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0
.end method

.method private Q1(IIII)V
    .locals 8

    .line 1
    mul-int v1, p1, p4

    .line 2
    .line 3
    div-int v6, v1, p3

    .line 4
    .line 5
    mul-int v1, p2, p3

    .line 6
    .line 7
    div-int/2addr v1, p4

    .line 8
    if-ge v1, p1, :cond_0

    .line 9
    .line 10
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/AidSource;->o:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 11
    .line 12
    move v5, v1

    .line 13
    move-object v3, v2

    .line 14
    iget-wide v1, p0, Ltv/danmaku/ijk/media/source/AidSource;->e:J

    .line 15
    .line 16
    sub-int v0, p1, v5

    .line 17
    .line 18
    div-int/lit8 v0, v0, 0x2

    .line 19
    .line 20
    const/4 v4, 0x0

    .line 21
    const/4 v7, 0x0

    .line 22
    move-object v6, v3

    .line 23
    move v3, v0

    .line 24
    move-object v0, v6

    .line 25
    move v6, p2

    .line 26
    invoke-virtual/range {v0 .. v7}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->W0(JIIIII)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/AidSource;->o:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 31
    .line 32
    if-ge v6, p2, :cond_1

    .line 33
    .line 34
    move-object v3, v2

    .line 35
    iget-wide v1, p0, Ltv/danmaku/ijk/media/source/AidSource;->e:J

    .line 36
    .line 37
    sub-int v0, p2, v6

    .line 38
    .line 39
    div-int/lit8 v4, v0, 0x2

    .line 40
    .line 41
    const/4 v7, 0x0

    .line 42
    move-object v0, v3

    .line 43
    const/4 v3, 0x0

    .line 44
    move v5, p1

    .line 45
    invoke-virtual/range {v0 .. v7}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->W0(JIIIII)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_1
    move-object v3, v2

    .line 50
    iget-wide v1, p0, Ltv/danmaku/ijk/media/source/AidSource;->e:J

    .line 51
    .line 52
    const/4 v4, 0x0

    .line 53
    const/4 v7, 0x0

    .line 54
    move-object v0, v3

    .line 55
    const/4 v3, 0x0

    .line 56
    move v5, p1

    .line 57
    move v6, p2

    .line 58
    invoke-virtual/range {v0 .. v7}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->W0(JIIIII)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method private R1(Ltv/danmaku/ijk/media/player/IMediaPlayer;)V
    .locals 10

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/AidSource;->o:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    if-eqz v0, :cond_7

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    goto/16 :goto_3

    .line 8
    .line 9
    :cond_0
    iget-wide v1, p0, Ltv/danmaku/ijk/media/source/AidSource;->e:J

    .line 10
    .line 11
    iget v3, p0, Ltv/danmaku/ijk/media/source/AidSource;->d:I

    .line 12
    .line 13
    iget v4, p0, Ltv/danmaku/ijk/media/source/AidSource;->c:I

    .line 14
    .line 15
    const/4 v5, 0x0

    .line 16
    iget v6, p0, Ltv/danmaku/ijk/media/source/AidSource;->f:I

    .line 17
    .line 18
    invoke-virtual/range {v0 .. v6}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->X0(JIIII)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/AidSource;->o:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 22
    .line 23
    iget-wide v1, p0, Ltv/danmaku/ijk/media/source/AidSource;->e:J

    .line 24
    .line 25
    new-instance v3, Ltv/danmaku/ijk/media/source/AidSource$2;

    .line 26
    .line 27
    invoke-direct {v3, p0}, Ltv/danmaku/ijk/media/source/AidSource$2;-><init>(Ltv/danmaku/ijk/media/source/AidSource;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1, v2, v3}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->T0(JLtv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;)V

    .line 31
    .line 32
    .line 33
    const/4 v0, 0x2

    .line 34
    iput v0, p0, Ltv/danmaku/ijk/media/source/AidSource;->q:I

    .line 35
    .line 36
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/source/AidSource;->r2()Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$SizeChangedCallback;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/source/AidSource;->r2()Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$SizeChangedCallback;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iget v2, p0, Ltv/danmaku/ijk/media/source/AidSource;->d:I

    .line 47
    .line 48
    iget v3, p0, Ltv/danmaku/ijk/media/source/AidSource;->c:I

    .line 49
    .line 50
    invoke-interface {v1, v2, v3}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$SizeChangedCallback;->a(II)V

    .line 51
    .line 52
    .line 53
    :cond_1
    iget v1, p0, Ltv/danmaku/ijk/media/source/AidSource;->d:I

    .line 54
    .line 55
    iget v2, p0, Ltv/danmaku/ijk/media/source/AidSource;->c:I

    .line 56
    .line 57
    invoke-virtual {p0, v1, v2}, Ltv/danmaku/ijk/media/source/AidSource;->w2(II)V

    .line 58
    .line 59
    .line 60
    iget v1, p0, Ltv/danmaku/ijk/media/source/AidSource;->f:I

    .line 61
    .line 62
    const-string v2, "AidSource: msg:202"

    .line 63
    .line 64
    const/16 v3, 0xca

    .line 65
    .line 66
    const/4 v4, 0x3

    .line 67
    const-string v5, "aidStream"

    .line 68
    .line 69
    const/4 v6, 0x0

    .line 70
    const/4 v7, 0x0

    .line 71
    const/16 v8, 0xc8

    .line 72
    .line 73
    if-eqz v1, :cond_5

    .line 74
    .line 75
    const/4 v9, 0x1

    .line 76
    if-ne v1, v9, :cond_2

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_2
    if-eq v1, v0, :cond_4

    .line 80
    .line 81
    if-eq v1, v4, :cond_4

    .line 82
    .line 83
    const/16 v0, 0x9

    .line 84
    .line 85
    if-ne v1, v0, :cond_3

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_3
    const/16 v0, 0x8

    .line 89
    .line 90
    if-ne v1, v0, :cond_6

    .line 91
    .line 92
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/AidSource;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 93
    .line 94
    invoke-static {v0, v8, v3, v7, v6}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->postEventFromStreamPro(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;IIILjava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    invoke-static {v5, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 98
    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_4
    :goto_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/AidSource;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 102
    .line 103
    const/16 v1, 0xcc

    .line 104
    .line 105
    invoke-static {v0, v8, v1, v7, v6}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->postEventFromStreamPro(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;IIILjava/lang/Object;)V

    .line 106
    .line 107
    .line 108
    const-string v0, "AidSource: msg:204"

    .line 109
    .line 110
    invoke-static {v5, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    .line 112
    .line 113
    goto :goto_2

    .line 114
    :cond_5
    :goto_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/AidSource;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 115
    .line 116
    invoke-static {v0, v8, v3, v7, v6}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->postEventFromStreamPro(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;IIILjava/lang/Object;)V

    .line 117
    .line 118
    .line 119
    invoke-static {v5, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    .line 121
    .line 122
    :cond_6
    :goto_2
    invoke-interface {p1}, Ltv/danmaku/ijk/media/player/IMediaPlayer;->start()V

    .line 123
    .line 124
    .line 125
    iput v4, p0, Ltv/danmaku/ijk/media/source/AidSource;->q:I

    .line 126
    .line 127
    :cond_7
    :goto_3
    return-void
.end method

.method public static synthetic S1(Ltv/danmaku/ijk/media/source/AidSource;)Ltv/danmaku/ijk/media/streamer/StreamProducer;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/AidSource;->k:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic T1(Ltv/danmaku/ijk/media/source/AidSource;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/source/AidSource;->r:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic U1(Ltv/danmaku/ijk/media/source/AidSource;IIII)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Ltv/danmaku/ijk/media/source/AidSource;->Q1(IIII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic V1(Ltv/danmaku/ijk/media/source/AidSource;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/source/AidSource;->p:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic W1(Ltv/danmaku/ijk/media/source/AidSource;)Ltv/danmaku/ijk/media/streamer/MomoSurface;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/AidSource;->o:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic X1(Ltv/danmaku/ijk/media/source/AidSource;Ltv/danmaku/ijk/media/player/IMediaPlayer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/source/AidSource;->R1(Ltv/danmaku/ijk/media/player/IMediaPlayer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Y1(Ltv/danmaku/ijk/media/source/AidSource;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/source/AidSource;->t2(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Z1(Ltv/danmaku/ijk/media/source/AidSource;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/source/AidSource;->v:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic a2(Ltv/danmaku/ijk/media/source/AidSource;I)I
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/source/AidSource;->v:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic b2(Ltv/danmaku/ijk/media/source/AidSource;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/source/AidSource;->e:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic c2(Ltv/danmaku/ijk/media/source/AidSource;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/source/AidSource;->s:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic d2(Ltv/danmaku/ijk/media/source/AidSource;I)I
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/source/AidSource;->s:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic e2(Ltv/danmaku/ijk/media/source/AidSource;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/AidSource;->t:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f2(Ltv/danmaku/ijk/media/source/AidSource;)Lcom/immomo/mediacore/audio/AudioProcess;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/AidSource;->u:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g2(Ltv/danmaku/ijk/media/source/AidSource;Lcom/immomo/mediacore/audio/AudioProcess;)Lcom/immomo/mediacore/audio/AudioProcess;
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource;->u:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic h2(Ltv/danmaku/ijk/media/source/AidSource;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/AidSource;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic i2(Ltv/danmaku/ijk/media/source/AidSource;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/AidSource;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic j2(Ltv/danmaku/ijk/media/source/AidSource;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/source/AidSource;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic k2(Ltv/danmaku/ijk/media/source/AidSource;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/source/AidSource;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic l2(Ltv/danmaku/ijk/media/source/AidSource;I)I
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/source/AidSource;->d:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic m2(Ltv/danmaku/ijk/media/source/AidSource;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/source/AidSource;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic n2(Ltv/danmaku/ijk/media/source/AidSource;I)I
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/source/AidSource;->c:I

    .line 2
    .line 3
    return p1
.end method

.method private t2(Z)V
    .locals 4

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource;->o:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-wide v0, p0, Ltv/danmaku/ijk/media/source/AidSource;->e:J

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-virtual {p1, v0, v1, v2}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->b1(JZ)V

    .line 11
    .line 12
    .line 13
    :cond_0
    const/4 p1, -0x1

    .line 14
    iput p1, p0, Ltv/danmaku/ijk/media/source/AidSource;->f:I

    .line 15
    .line 16
    :cond_1
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    if-eqz p1, :cond_2

    .line 20
    .line 21
    iget p1, p0, Ltv/danmaku/ijk/media/source/AidSource;->q:I

    .line 22
    .line 23
    const/4 v1, 0x5

    .line 24
    if-eq p1, v1, :cond_2

    .line 25
    .line 26
    iput v1, p0, Ltv/danmaku/ijk/media/source/AidSource;->q:I

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/source/AidSource;->y2(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$SizeChangedCallback;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMediaDataCallback(Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnErrorListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnErrorListener;)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnCompletionListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnCompletionListener;)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnPreparedListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnPreparedListener;)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnVideoSizeChangedListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnVideoSizeChangedListener;)V

    .line 54
    .line 55
    .line 56
    const/4 p1, 0x0

    .line 57
    invoke-virtual {p0, p1, p1}, Ltv/danmaku/ijk/media/source/AidSource;->w2(II)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 61
    .line 62
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->stop()V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 66
    .line 67
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->release()V

    .line 68
    .line 69
    .line 70
    iput-object v0, p0, Ltv/danmaku/ijk/media/source/AidSource;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 71
    .line 72
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource;->n:Ltv/danmaku/ijk/media/util/helpSurface;

    .line 73
    .line 74
    if-eqz p1, :cond_2

    .line 75
    .line 76
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/util/helpSurface;->g()V

    .line 77
    .line 78
    .line 79
    iput-object v0, p0, Ltv/danmaku/ijk/media/source/AidSource;->n:Ltv/danmaku/ijk/media/util/helpSurface;

    .line 80
    .line 81
    :cond_2
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/source/AidSource;->x2(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$aidSwitchResolution;)V

    .line 82
    .line 83
    .line 84
    new-instance p1, Ljava/lang/StringBuilder;

    .line 85
    .line 86
    const-string v0, "AidSource: release, cost time:"

    .line 87
    .line 88
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 92
    .line 93
    .line 94
    move-result-wide v0

    .line 95
    iget-wide v2, p0, Ltv/danmaku/ijk/media/source/AidSource;->p:J

    .line 96
    .line 97
    sub-long/2addr v0, v2

    .line 98
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string p0, "ms"

    .line 102
    .line 103
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    const-string p1, "aidStream"

    .line 111
    .line 112
    invoke-static {p1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    .line 114
    .line 115
    return-void
.end method


# virtual methods
.method public B2(JLandroid/graphics/SurfaceTexture;ILandroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/AidSource;->o:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual/range {p0 .. p5}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->i1(JLandroid/graphics/SurfaceTexture;ILandroid/graphics/Bitmap;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public C2(JIIIII)V
    .locals 8

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/AidSource;->o:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "@@@ viewPort: id["

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "], view["

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ","

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, p6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "], z="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, p7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p7

    .line 55
    const-string v0, "aidStream"

    .line 56
    .line 57
    invoke-static {v0, p7}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    iget p7, p0, Ltv/danmaku/ijk/media/source/AidSource;->f:I

    .line 61
    .line 62
    int-to-long v0, p7

    .line 63
    cmp-long v0, p1, v0

    .line 64
    .line 65
    if-nez v0, :cond_0

    .line 66
    .line 67
    const/4 v0, 0x7

    .line 68
    if-ne p7, v0, :cond_0

    .line 69
    .line 70
    const/4 p7, 0x0

    .line 71
    :goto_0
    move v7, p7

    .line 72
    goto :goto_1

    .line 73
    :cond_0
    const/4 p7, 0x1

    .line 74
    goto :goto_0

    .line 75
    :goto_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/AidSource;->o:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 76
    .line 77
    move-wide v1, p1

    .line 78
    move v3, p3

    .line 79
    move v4, p4

    .line 80
    move v5, p5

    .line 81
    move v6, p6

    .line 82
    invoke-virtual/range {v0 .. v7}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->W0(JIIIII)V

    .line 83
    .line 84
    .line 85
    :cond_1
    return-void
.end method

.method public getDuration()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/AidSource;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getDuration()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public o2(JZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/AidSource;->o:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "@@@ fullScreen: id["

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "], full="

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "aidStream"

    .line 28
    .line 29
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/AidSource;->o:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 33
    .line 34
    invoke-virtual {p0, p1, p2, p3}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->U0(JZ)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public p2()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/AidSource;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getCurrentPosition()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public q2()Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$aidSwitchResolution;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "----"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Ltv/danmaku/ijk/media/source/AidSource;->d:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ","

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Ltv/danmaku/ijk/media/source/AidSource;->c:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "--->352,640"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "aidStream"

    .line 33
    .line 34
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/AidSource;->j:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$aidSwitchResolution;

    .line 38
    .line 39
    return-object p0
.end method

.method public r2()Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$SizeChangedCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/AidSource;->i:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$SizeChangedCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public s2(JZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/AidSource;->o:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->V0(JZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public u2(I)V
    .locals 12

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, " remove, start["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "]: cost time:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 17
    .line 18
    .line 19
    move-result-wide v2

    .line 20
    iget-wide v4, p0, Ltv/danmaku/ijk/media/source/AidSource;->p:J

    .line 21
    .line 22
    sub-long/2addr v2, v4

    .line 23
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v2, "ms"

    .line 27
    .line 28
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v3, "aidStream"

    .line 36
    .line 37
    invoke-static {v3, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    iget v0, p0, Ltv/danmaku/ijk/media/source/AidSource;->q:I

    .line 41
    .line 42
    const/4 v4, 0x2

    .line 43
    const/4 v5, 0x1

    .line 44
    const/4 v6, 0x3

    .line 45
    if-eq v0, v6, :cond_0

    .line 46
    .line 47
    if-eq v0, v5, :cond_0

    .line 48
    .line 49
    if-ne v0, v4, :cond_1

    .line 50
    .line 51
    :cond_0
    const/4 v0, 0x4

    .line 52
    iput v0, p0, Ltv/danmaku/ijk/media/source/AidSource;->q:I

    .line 53
    .line 54
    :cond_1
    const/4 v0, 0x0

    .line 55
    if-ne p1, v5, :cond_7

    .line 56
    .line 57
    iget v7, p0, Ltv/danmaku/ijk/media/source/AidSource;->f:I

    .line 58
    .line 59
    invoke-direct {p0, v5}, Ltv/danmaku/ijk/media/source/AidSource;->t2(Z)V

    .line 60
    .line 61
    .line 62
    const-string v8, "remove: msg:211"

    .line 63
    .line 64
    const/16 v9, 0xd3

    .line 65
    .line 66
    const/4 v10, 0x0

    .line 67
    const/16 v11, 0xc8

    .line 68
    .line 69
    if-eqz v7, :cond_5

    .line 70
    .line 71
    if-ne v7, v5, :cond_2

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_2
    if-eq v7, v4, :cond_4

    .line 75
    .line 76
    if-eq v7, v6, :cond_4

    .line 77
    .line 78
    iget v4, p0, Ltv/danmaku/ijk/media/source/AidSource;->f:I

    .line 79
    .line 80
    const/16 v5, 0x9

    .line 81
    .line 82
    if-ne v4, v5, :cond_3

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_3
    const/16 v5, 0x8

    .line 86
    .line 87
    if-ne v4, v5, :cond_6

    .line 88
    .line 89
    iget-object v4, p0, Ltv/danmaku/ijk/media/source/AidSource;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 90
    .line 91
    invoke-static {v4, v11, v9, v0, v10}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->postEventFromStreamPro(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;IIILjava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    invoke-static {v3, v8}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    .line 96
    .line 97
    goto :goto_2

    .line 98
    :cond_4
    :goto_0
    iget-object v4, p0, Ltv/danmaku/ijk/media/source/AidSource;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 99
    .line 100
    const/16 v5, 0xcf

    .line 101
    .line 102
    invoke-static {v4, v11, v5, v0, v10}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->postEventFromStreamPro(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;IIILjava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    const-string v0, "remove: msg:207"

    .line 106
    .line 107
    invoke-static {v3, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_5
    :goto_1
    iget-object v4, p0, Ltv/danmaku/ijk/media/source/AidSource;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 112
    .line 113
    invoke-static {v4, v11, v9, v0, v10}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->postEventFromStreamPro(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;IIILjava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    invoke-static {v3, v8}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    .line 118
    .line 119
    :cond_6
    :goto_2
    const/4 v0, -0x1

    .line 120
    iput v0, p0, Ltv/danmaku/ijk/media/source/AidSource;->f:I

    .line 121
    .line 122
    goto :goto_3

    .line 123
    :cond_7
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/source/AidSource;->t2(Z)V

    .line 124
    .line 125
    .line 126
    :goto_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    const-string v4, "remove, end["

    .line 129
    .line 130
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 140
    .line 141
    .line 142
    move-result-wide v4

    .line 143
    iget-wide p0, p0, Ltv/danmaku/ijk/media/source/AidSource;->p:J

    .line 144
    .line 145
    sub-long/2addr v4, p0

    .line 146
    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-static {v3, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 157
    .line 158
    .line 159
    return-void
.end method

.method public v2(J)V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/AidSource;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "-----seekTo:"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "("

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-direct {p0, p1, p2}, Ltv/danmaku/ijk/media/source/AidSource;->A2(J)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v1, ")ms"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const-string v1, "aidStream"

    .line 37
    .line 38
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/AidSource;->m:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 42
    .line 43
    invoke-virtual {p0, p1, p2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->seekTo(J)V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public w2(II)V
    .locals 0

    .line 1
    return-void
.end method

.method public x2(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$aidSwitchResolution;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource;->j:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$aidSwitchResolution;

    .line 2
    .line 3
    return-void
.end method

.method public y2(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$SizeChangedCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/AidSource;->i:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$SizeChangedCallback;

    .line 2
    .line 3
    return-void
.end method

.method public z2(JIIII)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/AidSource;->o:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual/range {p0 .. p6}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->X0(JIIII)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
