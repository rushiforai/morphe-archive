.class public Ll/t210;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x6m;


# instance fields
.field public a:Ll/fnw;


# direct methods
.method public constructor <init>(Ll/cgu;Landroid/content/Context;)V
    .locals 8

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;

    .line 5
    .line 6
    iget-object v1, p1, Ll/cgu;->a:Ljava/lang/String;

    .line 7
    .line 8
    iget-object v2, p1, Ll/cgu;->f:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v3, p1, Ll/cgu;->b:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v4, p1, Ll/cgu;->c:Ljava/lang/String;

    .line 13
    .line 14
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 15
    .line 16
    invoke-static {p1}, Ll/wx0;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v5

    .line 20
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 21
    .line 22
    invoke-static {p1}, Ll/wx0;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v6

    .line 26
    const/4 v7, 0x0

    .line 27
    invoke-direct/range {v0 .. v7}, Lcom/immomo/momomediaext/utils/MMLiveUserConfig;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 28
    .line 29
    .line 30
    new-instance p1, Ll/fnw;

    .line 31
    .line 32
    invoke-direct {p1, p2, v0}, Ll/fnw;-><init>(Landroid/content/Context;Lcom/immomo/momomediaext/utils/MMLiveUserConfig;)V

    .line 33
    .line 34
    .line 35
    iput-object p1, p0, Ll/t210;->a:Ll/fnw;

    .line 36
    .line 37
    return-void
.end method


# virtual methods
.method public a()Ltv/danmaku/ijk/media/player/PullWatchInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t210;->a:Ll/fnw;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Ll/fnw;->i()Ltv/danmaku/ijk/media/player/PullWatchInfo;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public b(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLivePlayerConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/momomediaext/utils/MMLivePlayerConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, v0, Lcom/immomo/momomediaext/utils/MMLivePlayerConfig;->url:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p2, v0, Lcom/immomo/momomediaext/utils/MMLivePlayerConfig;->ipv6Url:Ljava/lang/String;

    .line 9
    .line 10
    iget-object p0, p0, Ll/t210;->a:Ll/fnw;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/fnw;->o(Lcom/immomo/momomediaext/utils/MMLivePlayerConfig;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public c(Ll/pxh0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/t210;->a:Ll/fnw;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    invoke-virtual {v0, p0}, Ll/fnw;->m(Ll/dnw;)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance v1, Ll/t210$a;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1}, Ll/t210$a;-><init>(Ll/t210;Ll/pxh0;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/fnw;->m(Ll/dnw;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public d(Landroid/view/Surface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t210;->a:Ll/fnw;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fnw;->n(Landroid/view/Surface;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t210;->a:Ll/fnw;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/fnw;->p()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f()Lcom/p1/mobile/putong/live/base/mmsdk/player/LivePlayerStatus;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/t210;->a:Ll/fnw;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/fnw;->h()Lcom/immomo/momomediaext/utils/MMLivePlayerStatus;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/t210;->g(Lcom/immomo/momomediaext/utils/MMLivePlayerStatus;)Lcom/p1/mobile/putong/live/base/mmsdk/player/LivePlayerStatus;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final g(Lcom/immomo/momomediaext/utils/MMLivePlayerStatus;)Lcom/p1/mobile/putong/live/base/mmsdk/player/LivePlayerStatus;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/LivePlayerStatus;->Unknown:Lcom/p1/mobile/putong/live/base/mmsdk/player/LivePlayerStatus;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    sget-object p0, Ll/t210$b;->a:[I

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    aget p0, p0, p1

    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    if-eq p0, p1, :cond_5

    .line 16
    .line 17
    const/4 p1, 0x2

    .line 18
    if-eq p0, p1, :cond_4

    .line 19
    .line 20
    const/4 p1, 0x3

    .line 21
    if-eq p0, p1, :cond_3

    .line 22
    .line 23
    const/4 p1, 0x4

    .line 24
    if-eq p0, p1, :cond_2

    .line 25
    .line 26
    const/4 p1, 0x5

    .line 27
    if-eq p0, p1, :cond_1

    .line 28
    .line 29
    sget-object p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/LivePlayerStatus;->Unknown:Lcom/p1/mobile/putong/live/base/mmsdk/player/LivePlayerStatus;

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/LivePlayerStatus;->Failed:Lcom/p1/mobile/putong/live/base/mmsdk/player/LivePlayerStatus;

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/LivePlayerStatus;->Finished:Lcom/p1/mobile/putong/live/base/mmsdk/player/LivePlayerStatus;

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_3
    sget-object p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/LivePlayerStatus;->Stopped:Lcom/p1/mobile/putong/live/base/mmsdk/player/LivePlayerStatus;

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_4
    sget-object p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/LivePlayerStatus;->Buffering:Lcom/p1/mobile/putong/live/base/mmsdk/player/LivePlayerStatus;

    .line 42
    .line 43
    return-object p0

    .line 44
    :cond_5
    sget-object p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/LivePlayerStatus;->Playing:Lcom/p1/mobile/putong/live/base/mmsdk/player/LivePlayerStatus;

    .line 45
    .line 46
    return-object p0
.end method

.method public isPlaying()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/t210;->f()Lcom/p1/mobile/putong/live/base/mmsdk/player/LivePlayerStatus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/live/base/mmsdk/player/LivePlayerStatus;->Playing:Lcom/p1/mobile/putong/live/base/mmsdk/player/LivePlayerStatus;

    .line 6
    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public release()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t210;->a:Ll/fnw;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/fnw;->k()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setMute(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t210;->a:Ll/fnw;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fnw;->l(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
