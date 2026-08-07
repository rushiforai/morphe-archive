.class public Ll/re80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ie80;


# instance fields
.field public a:Landroid/media/MediaPlayer;

.field public b:Ll/ie80$a;

.field public c:Z

.field public d:Z

.field public e:Z

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:J

.field public i:J

.field public j:Ll/x20;

.field public k:Landroid/media/MediaPlayer$OnSeekCompleteListener;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/re80;->e:Z

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    iput-object v0, p0, Ll/re80;->f:Ljava/lang/String;

    .line 10
    .line 11
    const-wide/16 v0, -0x1

    .line 12
    .line 13
    iput-wide v0, p0, Ll/re80;->h:J

    .line 14
    .line 15
    iput-wide v0, p0, Ll/re80;->i:J

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic g(Ll/re80;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/re80;->s(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic h(Ll/re80;Landroid/media/MediaPlayer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/re80;->r(Landroid/media/MediaPlayer;)V

    return-void
.end method

.method public static synthetic i(Ll/re80;Landroid/media/MediaPlayer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/re80;->o(Landroid/media/MediaPlayer;)V

    return-void
.end method

.method public static synthetic j(Ll/re80;Landroid/media/MediaPlayer;II)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/re80;->q(Landroid/media/MediaPlayer;II)Z

    move-result p0

    return p0
.end method

.method public static synthetic k(Ll/re80;Landroid/media/MediaPlayer;II)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/re80;->p(Landroid/media/MediaPlayer;II)Z

    move-result p0

    return p0
.end method

.method public static synthetic l(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/re80;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/re80;->a:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1, v1}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Ll/re80;->e:Z

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/re80;->b:Ll/ie80$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/re80;->a:Landroid/media/MediaPlayer;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/re80;->b:Ll/ie80$a;

    .line 16
    .line 17
    iget-object p0, p0, Ll/re80;->a:Landroid/media/MediaPlayer;

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-interface {v0, p0}, Ll/ie80$b;->b(I)V

    .line 24
    .line 25
    .line 26
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
    iput-object v0, p0, Ll/re80;->f:Ljava/lang/String;

    .line 39
    .line 40
    const-string v1, "http"

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 49
    .line 50
    invoke-static {v0}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_2

    .line 55
    .line 56
    sget p0, Lcom/p1/mobile/putong/common/R$string;->F:I

    .line 57
    .line 58
    invoke-static {p0}, Ll/o1j0;->n(I)V

    .line 59
    .line 60
    .line 61
    invoke-interface {p1}, Ll/ie80$b;->d()V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_2
    const/4 v0, 0x0

    .line 66
    iput-boolean v0, p0, Ll/re80;->c:Z

    .line 67
    .line 68
    iget-object v0, p0, Ll/re80;->b:Ll/ie80$a;

    .line 69
    .line 70
    if-ne v0, p1, :cond_5

    .line 71
    .line 72
    iget-object v0, p0, Ll/re80;->a:Landroid/media/MediaPlayer;

    .line 73
    .line 74
    if-eqz v0, :cond_4

    .line 75
    .line 76
    iget-boolean v0, p0, Ll/re80;->d:Z

    .line 77
    .line 78
    if-eqz v0, :cond_3

    .line 79
    .line 80
    invoke-interface {p1}, Ll/ie80$b;->onResume()V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Ll/re80;->a:Landroid/media/MediaPlayer;

    .line 84
    .line 85
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->start()V

    .line 86
    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_3
    invoke-interface {p1}, Ll/ie80$b;->c()V

    .line 90
    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_4
    invoke-virtual {p0}, Ll/re80;->n()V

    .line 94
    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_5
    if-eqz v0, :cond_6

    .line 98
    .line 99
    invoke-interface {v0}, Ll/ie80$b;->e()V

    .line 100
    .line 101
    .line 102
    :cond_6
    iput-object p1, p0, Ll/re80;->b:Ll/ie80$a;

    .line 103
    .line 104
    invoke-virtual {p0}, Ll/re80;->n()V

    .line 105
    .line 106
    .line 107
    :goto_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 108
    .line 109
    .line 110
    move-result-wide v0

    .line 111
    iput-wide v0, p0, Ll/re80;->h:J

    .line 112
    .line 113
    if-nez p2, :cond_7

    .line 114
    .line 115
    invoke-static {}, Ll/cbl0;->n()Ll/cbl0;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    iget-object p2, p0, Ll/re80;->f:Ljava/lang/String;

    .line 120
    .line 121
    invoke-virtual {p1, p2}, Ll/cbl0;->I(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    invoke-static {}, Ll/cbl0;->n()Ll/cbl0;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    iget-object p2, p0, Ll/re80;->f:Ljava/lang/String;

    .line 129
    .line 130
    invoke-virtual {p1, p2}, Ll/cbl0;->q(Ljava/lang/String;)Lrx/c;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 135
    .line 136
    .line 137
    move-result-object p2

    .line 138
    invoke-virtual {p1, p2}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    new-instance p2, Ll/le80;

    .line 143
    .line 144
    invoke-direct {p2, p0}, Ll/le80;-><init>(Ll/re80;)V

    .line 145
    .line 146
    .line 147
    new-instance p0, Ll/me80;

    .line 148
    .line 149
    invoke-direct {p0}, Ll/me80;-><init>()V

    .line 150
    .line 151
    .line 152
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 157
    .line 158
    .line 159
    :cond_7
    :goto_2
    return-void
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/re80;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public f(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public final m()V
    .locals 2

    .line 1
    new-instance v0, Landroid/media/MediaPlayer;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/re80;->a:Landroid/media/MediaPlayer;

    .line 7
    .line 8
    new-instance v1, Ll/ne80;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/ne80;-><init>(Ll/re80;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/re80;->a:Landroid/media/MediaPlayer;

    .line 17
    .line 18
    new-instance v1, Ll/oe80;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/oe80;-><init>(Ll/re80;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnInfoListener(Landroid/media/MediaPlayer$OnInfoListener;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/re80;->a:Landroid/media/MediaPlayer;

    .line 27
    .line 28
    new-instance v1, Ll/pe80;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/pe80;-><init>(Ll/re80;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/re80;->a:Landroid/media/MediaPlayer;

    .line 37
    .line 38
    new-instance v1, Ll/qe80;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/qe80;-><init>(Ll/re80;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/re80;->k:Landroid/media/MediaPlayer$OnSeekCompleteListener;

    .line 47
    .line 48
    if-eqz v0, :cond_0

    .line 49
    .line 50
    iget-object p0, p0, Ll/re80;->a:Landroid/media/MediaPlayer;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Landroid/media/MediaPlayer;->setOnSeekCompleteListener(Landroid/media/MediaPlayer$OnSeekCompleteListener;)V

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void
.end method

.method public mute(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/re80;->a:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-boolean p1, p0, Ll/re80;->e:Z

    .line 7
    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    invoke-virtual {v0, p0, p0}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_1
    const/high16 p0, 0x3f800000    # 1.0f

    .line 16
    .line 17
    invoke-virtual {v0, p0, p0}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final n()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/re80;->b:Ll/ie80$a;

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
    invoke-virtual {p0, v0}, Ll/re80;->w(Z)V

    .line 10
    .line 11
    .line 12
    :try_start_0
    invoke-virtual {p0}, Ll/re80;->m()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/re80;->a:Landroid/media/MediaPlayer;

    .line 16
    .line 17
    iget-object v1, p0, Ll/re80;->b:Ll/ie80$a;

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
    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/re80;->a:Landroid/media/MediaPlayer;

    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepareAsync()V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/re80;->a:Landroid/media/MediaPlayer;

    .line 48
    .line 49
    iget-object v1, p0, Ll/re80;->b:Ll/ie80$a;

    .line 50
    .line 51
    invoke-interface {v1}, Ll/ie80$a;->getSurface()Landroid/view/Surface;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setSurface(Landroid/view/Surface;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :catch_0
    move-exception v0

    .line 60
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Ll/re80;->b:Ll/ie80$a;

    .line 64
    .line 65
    if-eqz p0, :cond_1

    .line 66
    .line 67
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 68
    .line 69
    const-string v2, "Failed to prepare media player"

    .line 70
    .line 71
    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 72
    .line 73
    .line 74
    invoke-interface {p0, v1}, Ll/ie80$b;->a(Ljava/lang/Exception;)V

    .line 75
    .line 76
    .line 77
    :cond_1
    return-void
.end method

.method public final synthetic o(Landroid/media/MediaPlayer;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/re80;->d:Z

    .line 3
    .line 4
    iget-boolean p0, p0, Ll/re80;->c:Z

    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->start()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final synthetic p(Landroid/media/MediaPlayer;II)Z
    .locals 8

    .line 1
    const/4 p1, 0x3

    .line 2
    const/4 p3, 0x1

    .line 3
    if-eq p2, p1, :cond_6

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
    iget-boolean p1, p0, Ll/re80;->c:Z

    .line 16
    .line 17
    if-nez p1, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Ll/re80;->b:Ll/ie80$a;

    .line 20
    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    invoke-interface {p1}, Ll/ie80$b;->onResume()V

    .line 24
    .line 25
    .line 26
    :cond_1
    iget-wide p1, p0, Ll/re80;->i:J

    .line 27
    .line 28
    const-wide/16 v0, -0x1

    .line 29
    .line 30
    cmp-long p1, p1, v0

    .line 31
    .line 32
    if-eqz p1, :cond_3

    .line 33
    .line 34
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 35
    .line 36
    .line 37
    move-result-wide v4

    .line 38
    iget-wide p1, p0, Ll/re80;->i:J

    .line 39
    .line 40
    sub-long p1, v4, p1

    .line 41
    .line 42
    const-wide/16 v2, 0xc8

    .line 43
    .line 44
    cmp-long v2, p1, v2

    .line 45
    .line 46
    if-gez v2, :cond_2

    .line 47
    .line 48
    return p3

    .line 49
    :cond_2
    iget-object v2, p0, Ll/re80;->g:Ljava/lang/String;

    .line 50
    .line 51
    iget-object v3, p0, Ll/re80;->f:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {p1, p2, v2, v3}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->h0(JLjava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-wide v2, p0, Ll/re80;->i:J

    .line 57
    .line 58
    iget-object v6, p0, Ll/re80;->f:Ljava/lang/String;

    .line 59
    .line 60
    sget v7, Ll/c7y;->b:I

    .line 61
    .line 62
    invoke-static/range {v2 .. v7}, Ll/c7y;->b(JJLjava/lang/String;I)V

    .line 63
    .line 64
    .line 65
    iput-wide v0, p0, Ll/re80;->i:J

    .line 66
    .line 67
    :cond_3
    return p3

    .line 68
    :cond_4
    iget-object p1, p0, Ll/re80;->b:Ll/ie80$a;

    .line 69
    .line 70
    if-eqz p1, :cond_5

    .line 71
    .line 72
    invoke-interface {p1}, Ll/ie80$b;->c()V

    .line 73
    .line 74
    .line 75
    :cond_5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 76
    .line 77
    .line 78
    move-result-wide p1

    .line 79
    iput-wide p1, p0, Ll/re80;->i:J

    .line 80
    .line 81
    return p3

    .line 82
    :cond_6
    iget-boolean p1, p0, Ll/re80;->c:Z

    .line 83
    .line 84
    if-nez p1, :cond_7

    .line 85
    .line 86
    iget-object p1, p0, Ll/re80;->b:Ll/ie80$a;

    .line 87
    .line 88
    if-eqz p1, :cond_7

    .line 89
    .line 90
    invoke-interface {p1}, Ll/ie80$b;->onStart()V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Ll/re80;->b:Ll/ie80$a;

    .line 94
    .line 95
    invoke-interface {p1}, Ll/ie80$b;->onResume()V

    .line 96
    .line 97
    .line 98
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 99
    .line 100
    .line 101
    move-result-wide v2

    .line 102
    iget-wide v0, p0, Ll/re80;->h:J

    .line 103
    .line 104
    iget-object v4, p0, Ll/re80;->f:Ljava/lang/String;

    .line 105
    .line 106
    sget v5, Ll/c7y;->b:I

    .line 107
    .line 108
    invoke-static/range {v0 .. v5}, Ll/c7y;->c(JJLjava/lang/String;I)V

    .line 109
    .line 110
    .line 111
    :cond_7
    return p3
.end method

.method public pause()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/re80;->c:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/re80;->b:Ll/ie80$a;

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
    iget-object v0, p0, Ll/re80;->a:Landroid/media/MediaPlayer;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Ll/re80;->a:Landroid/media/MediaPlayer;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/media/MediaPlayer;->pause()V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public final synthetic q(Landroid/media/MediaPlayer;II)Z
    .locals 3

    .line 1
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x1

    .line 8
    xor-int/2addr p1, v0

    .line 9
    const/4 v1, 0x0

    .line 10
    iput-boolean v1, p0, Ll/re80;->d:Z

    .line 11
    .line 12
    if-ne p2, v0, :cond_0

    .line 13
    .line 14
    const/high16 v1, -0x80000000

    .line 15
    .line 16
    if-ne p3, v1, :cond_0

    .line 17
    .line 18
    iget-object v1, p0, Ll/re80;->f:Ljava/lang/String;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    const-string v2, "http"

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    sget v1, Lcom/p1/mobile/putong/common/R$string;->F:I

    .line 31
    .line 32
    invoke-static {v1}, Ll/o1j0;->n(I)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object v1, p0, Ll/re80;->b:Ll/ie80$a;

    .line 36
    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    new-instance v2, Ljava/lang/IllegalStateException;

    .line 40
    .line 41
    invoke-direct {v2}, Ljava/lang/IllegalStateException;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-interface {v1, v2}, Ll/ie80$b;->a(Ljava/lang/Exception;)V

    .line 45
    .line 46
    .line 47
    :cond_1
    iget-object p0, p0, Ll/re80;->f:Ljava/lang/String;

    .line 48
    .line 49
    sget v1, Ll/c7y;->b:I

    .line 50
    .line 51
    invoke-static {p2, p3, p1, p0, v1}, Ll/c7y;->e(IIZLjava/lang/String;I)V

    .line 52
    .line 53
    .line 54
    return v0
.end method

.method public final synthetic r(Landroid/media/MediaPlayer;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/re80;->b:Ll/ie80$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/ie80$b;->d()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/re80;->b:Ll/ie80$a;

    .line 9
    .line 10
    invoke-interface {v0}, Ll/ie80$b;->onComplete()V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Ll/re80;->j:Ll/x20;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    invoke-interface {p0}, Ll/x20;->call()V

    .line 18
    .line 19
    .line 20
    :cond_1
    const/4 p0, 0x0

    .line 21
    invoke-virtual {p1, p0}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public release()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/re80;->w(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public resume()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic s(Ljava/lang/Integer;)V
    .locals 3

    .line 1
    iget-wide v0, p0, Ll/re80;->h:J

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object p0, p0, Ll/re80;->f:Ljava/lang/String;

    .line 8
    .line 9
    sget v2, Ll/c7y;->b:I

    .line 10
    .line 11
    invoke-static {v0, v1, p1, p0, v2}, Ll/c7y;->d(JILjava/lang/String;I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public stop()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/re80;->w(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public t(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/re80;->a:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean p0, p0, Ll/re80;->d:Z

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 11
    .line 12
    .line 13
    :cond_1
    :goto_0
    return-void
.end method

.method public u(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/re80;->j:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public v(Landroid/media/MediaPlayer$OnSeekCompleteListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/re80;->k:Landroid/media/MediaPlayer$OnSeekCompleteListener;

    .line 2
    .line 3
    return-void
.end method

.method public final w(Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Ll/re80;->b:Ll/ie80$a;

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
    iput-boolean p1, p0, Ll/re80;->c:Z

    .line 12
    .line 13
    iget-object v0, p0, Ll/re80;->a:Landroid/media/MediaPlayer;

    .line 14
    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    iget-boolean v1, p0, Ll/re80;->d:Z

    .line 18
    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 22
    .line 23
    .line 24
    :cond_1
    iget-object v0, p0, Ll/re80;->a:Landroid/media/MediaPlayer;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 27
    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    iput-object v0, p0, Ll/re80;->a:Landroid/media/MediaPlayer;

    .line 31
    .line 32
    iput-boolean p1, p0, Ll/re80;->d:Z

    .line 33
    .line 34
    :cond_2
    return-void
.end method
