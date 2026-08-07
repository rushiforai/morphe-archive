.class public Ll/ye80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ie80;


# instance fields
.field public a:Ll/dyh0;

.field public b:Ll/ie80$a;

.field public c:Z

.field public d:Z

.field public e:Z

.field public f:Z

.field public g:J

.field public h:J

.field public i:J

.field public j:Z

.field public k:Ljava/lang/String;

.field public l:Ljava/lang/String;

.field public m:Z

.field public n:Ljava/lang/String;

.field public o:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/ye80;->f:Z

    .line 6
    .line 7
    const-wide/16 v1, -0x1

    .line 8
    .line 9
    iput-wide v1, p0, Ll/ye80;->g:J

    .line 10
    .line 11
    iput-wide v1, p0, Ll/ye80;->h:J

    .line 12
    .line 13
    iput-wide v1, p0, Ll/ye80;->i:J

    .line 14
    .line 15
    iput-boolean v0, p0, Ll/ye80;->j:Z

    .line 16
    .line 17
    const-string v0, ""

    .line 18
    .line 19
    iput-object v0, p0, Ll/ye80;->k:Ljava/lang/String;

    .line 20
    .line 21
    iput-object v0, p0, Ll/ye80;->l:Ljava/lang/String;

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    iput-boolean v0, p0, Ll/ye80;->o:Z

    .line 25
    .line 26
    return-void
.end method

.method public static synthetic g(Ll/ye80;Lcom/tantanapp/ijk/media/player/IMediaPlayer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ye80;->r(Lcom/tantanapp/ijk/media/player/IMediaPlayer;)V

    return-void
.end method

.method public static synthetic h(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic i(Ll/ye80;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ye80;->s(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic j(Ll/ye80;Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ye80;->p(Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z

    move-result p0

    return p0
.end method

.method public static synthetic k(Ll/ye80;Lcom/tantanapp/ijk/media/player/IMediaPlayer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ye80;->o(Lcom/tantanapp/ijk/media/player/IMediaPlayer;)V

    return-void
.end method

.method public static synthetic l(Ll/ye80;Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ye80;->q(Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z

    move-result p0

    return p0
.end method

.method private m()V
    .locals 5

    .line 1
    invoke-static {}, Ll/fyh0;->d()Ll/fyh0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/fyh0;->e()Ll/dyh0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/ye80;->a:Ll/dyh0;

    .line 10
    .line 11
    const-string v1, "start-on-prepared"

    .line 12
    .line 13
    const-wide/16 v2, 0x0

    .line 14
    .line 15
    const/4 v4, 0x4

    .line 16
    invoke-virtual {v0, v4, v1, v2, v3}, Ll/dyh0;->setOption(ILjava/lang/String;J)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/ye80;->a:Ll/dyh0;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/dyh0;->a()V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/ye80;->a:Ll/dyh0;

    .line 25
    .line 26
    new-instance v1, Ll/ue80;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/ue80;-><init>(Ll/ye80;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ll/dyh0;->setOnPreparedListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnPreparedListener;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/ye80;->a:Ll/dyh0;

    .line 35
    .line 36
    new-instance v1, Ll/ve80;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/ve80;-><init>(Ll/ye80;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ll/dyh0;->setOnInfoListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnInfoListener;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/ye80;->a:Ll/dyh0;

    .line 45
    .line 46
    new-instance v1, Ll/we80;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Ll/we80;-><init>(Ll/ye80;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ll/dyh0;->setOnErrorListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnErrorListener;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Ll/ye80;->a:Ll/dyh0;

    .line 55
    .line 56
    new-instance v1, Ll/xe80;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/xe80;-><init>(Ll/ye80;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ll/dyh0;->setOnCompletionListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnCompletionListener;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method private n()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ye80;->b:Ll/ie80$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/ie80$b;->c()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    invoke-direct {p0, v0}, Ll/ye80;->t(Z)V

    .line 10
    .line 11
    .line 12
    :try_start_0
    invoke-direct {p0}, Ll/ye80;->m()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/ye80;->a:Ll/dyh0;

    .line 16
    .line 17
    iget-object v1, p0, Ll/ye80;->b:Ll/ie80$a;

    .line 18
    .line 19
    invoke-interface {v1}, Ll/ie80$a;->f()Lcom/p1/mobile/putong/data/Video;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Video;->formatAspectRatio()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {v1}, Ll/uqb0;->d0(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Ll/dyh0;->setDataSource(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/ye80;->a:Ll/dyh0;

    .line 43
    .line 44
    invoke-virtual {v0}, Ll/dyh0;->prepareAsync()V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/ye80;->a:Ll/dyh0;

    .line 48
    .line 49
    iget-object v1, p0, Ll/ye80;->b:Ll/ie80$a;

    .line 50
    .line 51
    invoke-interface {v1}, Ll/ie80$a;->getSurface()Landroid/view/Surface;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, v1}, Ll/dyh0;->setSurface(Landroid/view/Surface;)V

    .line 56
    .line 57
    .line 58
    const/4 v0, 0x1

    .line 59
    iput-boolean v0, p0, Ll/ye80;->f:Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    .line 61
    return-void

    .line 62
    :catch_0
    move-exception v0

    .line 63
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Ll/ye80;->b:Ll/ie80$a;

    .line 67
    .line 68
    if-eqz p0, :cond_1

    .line 69
    .line 70
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 71
    .line 72
    const-string v2, "Failed to prepare media player"

    .line 73
    .line 74
    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 75
    .line 76
    .line 77
    invoke-interface {p0, v1}, Ll/ie80$b;->a(Ljava/lang/Exception;)V

    .line 78
    .line 79
    .line 80
    :cond_1
    return-void
.end method

.method private synthetic s(Ljava/lang/Integer;)V
    .locals 3

    .line 1
    iget-wide v0, p0, Ll/ye80;->g:J

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object p0, p0, Ll/ye80;->k:Ljava/lang/String;

    .line 8
    .line 9
    sget v2, Ll/c7y;->a:I

    .line 10
    .line 11
    invoke-static {v0, v1, p1, p0, v2}, Ll/c7y;->d(JILjava/lang/String;I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private t(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Ll/ye80;->b:Ll/ie80$a;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Ll/ie80$b;->d()V

    .line 8
    .line 9
    .line 10
    :cond_0
    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Ll/ye80;->e:Z

    .line 12
    .line 13
    iput-boolean p1, p0, Ll/ye80;->c:Z

    .line 14
    .line 15
    iget-object v0, p0, Ll/ye80;->a:Ll/dyh0;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/dyh0;->stop()V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Ll/ye80;->a:Ll/dyh0;

    .line 24
    .line 25
    iput-boolean p1, p0, Ll/ye80;->d:Z

    .line 26
    .line 27
    :cond_1
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ye80;->n:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public b()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/ye80;->m:Z

    .line 3
    .line 4
    iget-object v1, p0, Ll/ye80;->a:Ll/dyh0;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-virtual {v1, v2, v2}, Ll/dyh0;->setVolume(FF)V

    .line 10
    .line 11
    .line 12
    iput-boolean v0, p0, Ll/ye80;->o:Z

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public c()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ye80;->b:Ll/ie80$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/ye80;->a:Ll/dyh0;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/dyh0;->isPlaying()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/ye80;->b:Ll/ie80$a;

    .line 16
    .line 17
    iget-object p0, p0, Ll/ye80;->a:Ll/dyh0;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/dyh0;->getCurrentPosition()J

    .line 20
    .line 21
    .line 22
    move-result-wide v1

    .line 23
    long-to-int p0, v1

    .line 24
    invoke-interface {v0, p0}, Ll/ie80$b;->b(I)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public d(Ll/ie80$a;Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_7

    .line 2
    .line 3
    invoke-interface {p1}, Ll/ie80$a;->f()Lcom/p1/mobile/putong/data/Video;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_7

    .line 8
    .line 9
    invoke-interface {p1}, Ll/ie80$a;->getSurface()Landroid/view/Surface;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto/16 :goto_2

    .line 16
    .line 17
    :cond_0
    invoke-interface {p1}, Ll/ie80$a;->f()Lcom/p1/mobile/putong/data/Video;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Video;->formatAspectRatio()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-interface {p1}, Ll/ie80$a;->f()Lcom/p1/mobile/putong/data/Video;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Video;->formatAspectRatio()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    goto :goto_0

    .line 36
    :cond_1
    const-string v0, ""

    .line 37
    .line 38
    :goto_0
    iput-object v0, p0, Ll/ye80;->k:Ljava/lang/String;

    .line 39
    .line 40
    invoke-interface {p1}, Ll/ie80$a;->f()Lcom/p1/mobile/putong/data/Video;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget v0, v0, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 45
    .line 46
    float-to-int v0, v0

    .line 47
    mul-int/lit16 v0, v0, 0x3e8

    .line 48
    .line 49
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iput-object v0, p0, Ll/ye80;->l:Ljava/lang/String;

    .line 54
    .line 55
    const/4 v0, 0x0

    .line 56
    iput-boolean v0, p0, Ll/ye80;->c:Z

    .line 57
    .line 58
    iget-object v0, p0, Ll/ye80;->b:Ll/ie80$a;

    .line 59
    .line 60
    if-ne v0, p1, :cond_4

    .line 61
    .line 62
    iget-object v0, p0, Ll/ye80;->a:Ll/dyh0;

    .line 63
    .line 64
    if-eqz v0, :cond_3

    .line 65
    .line 66
    iget-boolean v1, p0, Ll/ye80;->d:Z

    .line 67
    .line 68
    if-eqz v1, :cond_2

    .line 69
    .line 70
    invoke-virtual {v0}, Ll/dyh0;->start()V

    .line 71
    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_2
    invoke-interface {p1}, Ll/ie80$b;->c()V

    .line 75
    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_3
    invoke-direct {p0}, Ll/ye80;->n()V

    .line 79
    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_4
    if-eqz v0, :cond_5

    .line 83
    .line 84
    invoke-interface {v0}, Ll/ie80$b;->e()V

    .line 85
    .line 86
    .line 87
    :cond_5
    iput-object p1, p0, Ll/ye80;->b:Ll/ie80$a;

    .line 88
    .line 89
    invoke-direct {p0}, Ll/ye80;->n()V

    .line 90
    .line 91
    .line 92
    :goto_1
    const/4 p1, 0x1

    .line 93
    iput-boolean p1, p0, Ll/ye80;->e:Z

    .line 94
    .line 95
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 96
    .line 97
    .line 98
    move-result-wide v0

    .line 99
    iput-wide v0, p0, Ll/ye80;->g:J

    .line 100
    .line 101
    if-nez p2, :cond_6

    .line 102
    .line 103
    invoke-static {}, Ll/cbl0;->n()Ll/cbl0;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    iget-object p2, p0, Ll/ye80;->k:Ljava/lang/String;

    .line 108
    .line 109
    invoke-virtual {p1, p2}, Ll/cbl0;->I(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    invoke-static {}, Ll/cbl0;->n()Ll/cbl0;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    iget-object p2, p0, Ll/ye80;->k:Ljava/lang/String;

    .line 117
    .line 118
    invoke-virtual {p1, p2}, Ll/cbl0;->q(Ljava/lang/String;)Lrx/c;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 123
    .line 124
    .line 125
    move-result-object p2

    .line 126
    invoke-virtual {p1, p2}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    new-instance p2, Ll/se80;

    .line 131
    .line 132
    invoke-direct {p2, p0}, Ll/se80;-><init>(Ll/ye80;)V

    .line 133
    .line 134
    .line 135
    new-instance v0, Ll/te80;

    .line 136
    .line 137
    invoke-direct {v0}, Ll/te80;-><init>()V

    .line 138
    .line 139
    .line 140
    invoke-static {p2, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 141
    .line 142
    .line 143
    move-result-object p2

    .line 144
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 145
    .line 146
    .line 147
    :cond_6
    const-wide/16 p1, -0x1

    .line 148
    .line 149
    iput-wide p1, p0, Ll/ye80;->h:J

    .line 150
    .line 151
    iput-wide p1, p0, Ll/ye80;->i:J

    .line 152
    .line 153
    :cond_7
    :goto_2
    return-void
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ye80;->o:Z

    .line 2
    .line 3
    return p0
.end method

.method public f(Z)V
    .locals 2

    .line 1
    iput-boolean p1, p0, Ll/ye80;->f:Z

    .line 2
    .line 3
    const-wide/16 v0, -0x1

    .line 4
    .line 5
    iput-wide v0, p0, Ll/ye80;->h:J

    .line 6
    .line 7
    iput-wide v0, p0, Ll/ye80;->i:J

    .line 8
    .line 9
    return-void
.end method

.method public mute(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Ll/ye80;->m:Z

    .line 2
    .line 3
    iget-object v0, p0, Ll/ye80;->a:Ll/dyh0;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput-boolean p1, p0, Ll/ye80;->o:Z

    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    invoke-virtual {v0, p0, p0}, Ll/dyh0;->setVolume(FF)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_1
    const/high16 p0, 0x3f800000    # 1.0f

    .line 18
    .line 19
    invoke-virtual {v0, p0, p0}, Ll/dyh0;->setVolume(FF)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic o(Lcom/tantanapp/ijk/media/player/IMediaPlayer;)V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/ye80;->d:Z

    .line 3
    .line 4
    iget-boolean v1, p0, Ll/ye80;->m:Z

    .line 5
    .line 6
    iget-object v2, p0, Ll/ye80;->a:Ll/dyh0;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v2, v1, v1}, Ll/dyh0;->setVolume(FF)V

    .line 12
    .line 13
    .line 14
    iput-boolean v0, p0, Ll/ye80;->o:Z

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 18
    .line 19
    invoke-virtual {v2, v0, v0}, Ll/dyh0;->setVolume(FF)V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-boolean v0, p0, Ll/ye80;->o:Z

    .line 24
    .line 25
    :goto_0
    iget-wide v0, p0, Ll/ye80;->h:J

    .line 26
    .line 27
    const-wide/16 v2, 0x0

    .line 28
    .line 29
    cmp-long v0, v0, v2

    .line 30
    .line 31
    if-lez v0, :cond_1

    .line 32
    .line 33
    const-wide/16 v0, -0x1

    .line 34
    .line 35
    iput-wide v0, p0, Ll/ye80;->h:J

    .line 36
    .line 37
    :cond_1
    iget-boolean v0, p0, Ll/ye80;->c:Z

    .line 38
    .line 39
    if-nez v0, :cond_2

    .line 40
    .line 41
    iget-boolean p0, p0, Ll/ye80;->e:Z

    .line 42
    .line 43
    if-eqz p0, :cond_2

    .line 44
    .line 45
    invoke-interface {p1}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->start()V

    .line 46
    .line 47
    .line 48
    :cond_2
    return-void
.end method

.method public final synthetic p(Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z
    .locals 9

    .line 1
    const/4 p3, 0x3

    .line 2
    const/4 v0, 0x1

    .line 3
    if-eq p2, p3, :cond_6

    .line 4
    .line 5
    const/16 p1, 0x2bd

    .line 6
    .line 7
    if-eq p2, p1, :cond_4

    .line 8
    .line 9
    const/16 p1, 0x2be

    .line 10
    .line 11
    if-eq p2, p1, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_0
    iget-object p1, p0, Ll/ye80;->b:Ll/ie80$a;

    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    invoke-interface {p1}, Ll/ie80$b;->g()V

    .line 20
    .line 21
    .line 22
    :cond_1
    iget-wide p1, p0, Ll/ye80;->i:J

    .line 23
    .line 24
    const-wide/16 v1, -0x1

    .line 25
    .line 26
    cmp-long p1, p1, v1

    .line 27
    .line 28
    if-eqz p1, :cond_3

    .line 29
    .line 30
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 31
    .line 32
    .line 33
    move-result-wide v5

    .line 34
    iget-wide p1, p0, Ll/ye80;->i:J

    .line 35
    .line 36
    sub-long p1, v5, p1

    .line 37
    .line 38
    const-wide/16 v3, 0xc8

    .line 39
    .line 40
    cmp-long p3, p1, v3

    .line 41
    .line 42
    if-gez p3, :cond_2

    .line 43
    .line 44
    return v0

    .line 45
    :cond_2
    iget-object p3, p0, Ll/ye80;->n:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v3, p0, Ll/ye80;->k:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {p1, p2, p3, v3}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->h0(JLjava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-wide v3, p0, Ll/ye80;->i:J

    .line 53
    .line 54
    iget-object v7, p0, Ll/ye80;->k:Ljava/lang/String;

    .line 55
    .line 56
    sget v8, Ll/c7y;->a:I

    .line 57
    .line 58
    invoke-static/range {v3 .. v8}, Ll/c7y;->b(JJLjava/lang/String;I)V

    .line 59
    .line 60
    .line 61
    iput-wide v1, p0, Ll/ye80;->i:J

    .line 62
    .line 63
    :cond_3
    return v0

    .line 64
    :cond_4
    iget-object p1, p0, Ll/ye80;->b:Ll/ie80$a;

    .line 65
    .line 66
    if-eqz p1, :cond_5

    .line 67
    .line 68
    invoke-interface {p1}, Ll/ie80$b;->c()V

    .line 69
    .line 70
    .line 71
    :cond_5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 72
    .line 73
    .line 74
    move-result-wide p1

    .line 75
    iput-wide p1, p0, Ll/ye80;->i:J

    .line 76
    .line 77
    return v0

    .line 78
    :cond_6
    iget-boolean p2, p0, Ll/ye80;->c:Z

    .line 79
    .line 80
    if-nez p2, :cond_7

    .line 81
    .line 82
    iget-boolean p2, p0, Ll/ye80;->e:Z

    .line 83
    .line 84
    if-eqz p2, :cond_7

    .line 85
    .line 86
    iget-object p2, p0, Ll/ye80;->b:Ll/ie80$a;

    .line 87
    .line 88
    if-eqz p2, :cond_7

    .line 89
    .line 90
    invoke-interface {p1}, Lcom/tantanapp/ijk/media/player/IMediaPlayer;->start()V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Ll/ye80;->b:Ll/ie80$a;

    .line 94
    .line 95
    invoke-interface {p1}, Ll/ie80$b;->onStart()V

    .line 96
    .line 97
    .line 98
    :cond_7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 99
    .line 100
    .line 101
    move-result-wide v3

    .line 102
    iget-wide v1, p0, Ll/ye80;->g:J

    .line 103
    .line 104
    iget-object v5, p0, Ll/ye80;->k:Ljava/lang/String;

    .line 105
    .line 106
    sget v6, Ll/c7y;->a:I

    .line 107
    .line 108
    invoke-static/range {v1 .. v6}, Ll/c7y;->c(JJLjava/lang/String;I)V

    .line 109
    .line 110
    .line 111
    return v0
.end method

.method public pause()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/ye80;->c:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/ye80;->b:Ll/ie80$a;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-interface {v0}, Ll/ie80$b;->onPause()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/ye80;->a:Ll/dyh0;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/dyh0;->isPlaying()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Ll/ye80;->a:Ll/dyh0;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/dyh0;->pause()V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public final synthetic q(Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z
    .locals 2

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/ye80;->d:Z

    .line 3
    .line 4
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    xor-int/lit8 v0, p1, 0x1

    .line 11
    .line 12
    const v1, -0x20464f45

    .line 13
    .line 14
    .line 15
    if-ne p2, v1, :cond_0

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    sget p1, Lcom/p1/mobile/putong/common/R$string;->F:I

    .line 20
    .line 21
    invoke-static {p1}, Ll/o1j0;->n(I)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object p1, p0, Ll/ye80;->b:Ll/ie80$a;

    .line 25
    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 29
    .line 30
    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-interface {p1, v1}, Ll/ie80$b;->a(Ljava/lang/Exception;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    iget-object p0, p0, Ll/ye80;->k:Ljava/lang/String;

    .line 37
    .line 38
    sget p1, Ll/c7y;->a:I

    .line 39
    .line 40
    invoke-static {p2, p3, v0, p0, p1}, Ll/c7y;->e(IIZLjava/lang/String;I)V

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x1

    .line 44
    return p0
.end method

.method public final synthetic r(Lcom/tantanapp/ijk/media/player/IMediaPlayer;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ye80;->b:Ll/ie80$a;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Ll/ie80$b;->d()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/ye80;->b:Ll/ie80$a;

    .line 9
    .line 10
    invoke-interface {p1}, Ll/ie80$b;->onComplete()V

    .line 11
    .line 12
    .line 13
    :cond_0
    const/4 p1, 0x1

    .line 14
    invoke-virtual {p0, p1}, Ll/ye80;->f(Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public release()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Ll/ye80;->t(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public resume()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ye80;->b:Ll/ie80$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Ll/ye80;->d:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-interface {v0}, Ll/ie80$b;->onResume()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public stop()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Ll/ye80;->t(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/ye80;->f(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
