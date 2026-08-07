.class public Ll/jfl0;
.super Ll/l4;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/jfl0$a;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/l4;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;Ll/hre;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jfl0;->n(Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;Ll/hre;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;Ll/hre;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->stop()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Ll/hre;->b()Ll/x20;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/hre;->b()Ll/x20;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p0}, Ll/x20;->call()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public static synthetic j(Ll/jfl0$a;Ll/udl0;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/jfl0$a;->a(Ll/udl0;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;ILjava/lang/String;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->stop()V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    return p1
.end method

.method public static synthetic l(Ll/hre;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;Ll/udl0;)V
    .locals 1

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p0}, Ll/hre;->h()Ll/z20;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/hre;->h()Ll/z20;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {v0, p3, p1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    const/4 p1, 0x1

    .line 18
    invoke-static {p2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    new-instance p1, Ll/sdl0$a;

    .line 22
    .line 23
    invoke-direct {p1}, Ll/sdl0$a;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, p3}, Ll/sdl0$a;->c(Ll/udl0;)Ll/sdl0$a;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    sget p3, Ll/sdl0;->j:I

    .line 31
    .line 32
    invoke-virtual {p1, p3}, Ll/sdl0$a;->d(I)Ll/sdl0$a;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance p3, Ll/gmw;

    .line 37
    .line 38
    invoke-direct {p3}, Ll/gmw;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, p3}, Ll/sdl0$a;->e(Ll/txl;)Ll/sdl0$a;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const/4 p3, 0x0

    .line 46
    invoke-virtual {p1, p3}, Ll/sdl0$a;->b(Ljava/util/List;)Ll/sdl0$a;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1}, Ll/sdl0$a;->a()Ll/sdl0;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->setVideoEffectConfig(Ll/sdl0;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->prepare()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->start()V

    .line 61
    .line 62
    .line 63
    new-instance p1, Ll/hfl0;

    .line 64
    .line 65
    invoke-direct {p1, p2, p0}, Ll/hfl0;-><init>(Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;Ll/hre;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->setCompletionListener(Ll/y9m;)V

    .line 69
    .line 70
    .line 71
    new-instance p0, Ll/ifl0;

    .line 72
    .line 73
    invoke-direct {p0, p2}, Ll/ifl0;-><init>(Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->setOnErrorListener(Ll/z9m;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public static n(Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;Ll/hre;)V
    .locals 8

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p1}, Ll/hre;->g()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    invoke-virtual {p1}, Ll/hre;->f()Ll/pcj;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/hre;->f()Ll/pcj;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Ljava/lang/Boolean;

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_2

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    invoke-virtual {p1}, Ll/hre;->g()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/efl0;

    .line 43
    .line 44
    invoke-direct {v1, p0, p1}, Ll/efl0;-><init>(Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;Ll/hre;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v0, v1}, Ll/wqe;->b(Ljava/lang/String;Ll/y20;)Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    if-nez v0, :cond_3

    .line 52
    .line 53
    :goto_0
    return-void

    .line 54
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->stop()V

    .line 55
    .line 56
    .line 57
    const-string v1, "video"

    .line 58
    .line 59
    invoke-static {v1}, Ll/wqe;->d(Ljava/lang/String;)Ll/l4;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    move-object v2, v1

    .line 64
    check-cast v2, Ll/jfl0;

    .line 65
    .line 66
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 67
    .line 68
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->hdType:Ljava/lang/String;

    .line 69
    .line 70
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->zip:Ljava/lang/String;

    .line 71
    .line 72
    iget-object v6, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->md5:Ljava/lang/String;

    .line 73
    .line 74
    new-instance v7, Ll/ffl0;

    .line 75
    .line 76
    invoke-direct {v7, p1, v0, p0}, Ll/ffl0;-><init>(Ll/hre;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual/range {v2 .. v7}, Ll/jfl0;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/jfl0$a;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)Ljava/lang/String;
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, ""

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    iget-object p0, p0, Ll/l4;->a:Ll/wpq0;

    .line 7
    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->hdType:Ljava/lang/String;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->zip:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0, v0, v1, p1}, Ll/w5;->p(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public d(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/l4;->a:Ll/wpq0;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->hdType:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->zip:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2, v3}, Ll/w5;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object p0, p0, Ll/l4;->a:Ll/wpq0;

    .line 14
    .line 15
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0, v0, v1}, Ll/wpq0;->v(Ljava/io/File;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    const/4 v1, 0x0

    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    new-instance p0, Ljava/io/File;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {v0}, Ll/udl0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-direct {p0, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_0

    .line 42
    .line 43
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Ll/ere;->e(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    const/4 p0, 0x1

    .line 53
    return p0

    .line 54
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string v0, "effect no config"

    .line 57
    .line 58
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-static {p0}, Ll/muj;->u(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    :cond_1
    return v1
.end method

.method public f(Ljava/lang/String;ZLl/w8e;Ll/e4d0;)Z
    .locals 10

    .line 1
    invoke-virtual {p0, p1}, Ll/l4;->c(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object v2, p0, Ll/l4;->a:Ll/wpq0;

    .line 10
    .line 11
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->id:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->hdType:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->zip:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v2, v3, v4, v5}, Ll/w5;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    iget-object v3, p0, Ll/l4;->a:Ll/wpq0;

    .line 22
    .line 23
    invoke-virtual {v3, v2, p1}, Ll/wpq0;->v(Ljava/io/File;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v3, :cond_2

    .line 28
    .line 29
    new-instance p0, Ljava/io/File;

    .line 30
    .line 31
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-static {p2}, Ll/udl0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-direct {p0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-eqz p0, :cond_1

    .line 47
    .line 48
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0, p1}, Ll/ere;->e(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    const/4 p0, 0x1

    .line 56
    return p0

    .line 57
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    const-string p2, "effect no config"

    .line 60
    .line 61
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-static {p0}, Ll/muj;->u(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_2
    if-eqz p2, :cond_3

    .line 76
    .line 77
    iget-object v2, p0, Ll/l4;->a:Ll/wpq0;

    .line 78
    .line 79
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->hdType:Ljava/lang/String;

    .line 80
    .line 81
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->zip:Ljava/lang/String;

    .line 82
    .line 83
    iget-object v6, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->md5:Ljava/lang/String;

    .line 84
    .line 85
    const-string p0, "IMMEDIATE"

    .line 86
    .line 87
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/Priority;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/Priority;

    .line 88
    .line 89
    .line 90
    move-result-object v7

    .line 91
    move-object v3, p1

    .line 92
    move-object v8, p3

    .line 93
    move-object v9, p4

    .line 94
    invoke-virtual/range {v2 .. v9}, Ll/w5;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/Priority;Ll/w8e;Ll/e4d0;)V

    .line 95
    .line 96
    .line 97
    :cond_3
    :goto_0
    return v1
.end method

.method public m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/jfl0$a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l4;->a:Ll/wpq0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/w5;->p(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance p1, Ll/ghe;

    .line 12
    .line 13
    invoke-direct {p1}, Ll/ghe;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    new-instance p1, Ll/gfl0;

    .line 29
    .line 30
    invoke-direct {p1, p5}, Ll/gfl0;-><init>(Ll/jfl0$a;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    return-void
.end method
