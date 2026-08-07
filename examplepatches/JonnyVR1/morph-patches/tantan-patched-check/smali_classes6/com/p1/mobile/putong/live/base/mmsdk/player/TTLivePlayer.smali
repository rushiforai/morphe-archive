.class public Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x6m;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer$PlayerType;
    }
.end annotation


# instance fields
.field public a:Ll/x6m;

.field public b:Lcom/p1/mobile/putong/live/base/mmsdk/player/a$b;

.field public c:Lcom/p1/mobile/putong/live/base/mmsdk/player/a;

.field public d:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/cgu;Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer$PlayerType;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->b()Lcom/p1/mobile/putong/live/base/mmsdk/player/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;->c:Lcom/p1/mobile/putong/live/base/mmsdk/player/a;

    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer$b;->a:[I

    .line 11
    .line 12
    invoke-virtual {p3}, Ljava/lang/Enum;->ordinal()I

    .line 13
    .line 14
    .line 15
    move-result p3

    .line 16
    aget p3, v0, p3

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    if-eq p3, v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    new-instance p3, Ll/t210;

    .line 23
    .line 24
    invoke-direct {p3, p2, p1}, Ll/t210;-><init>(Ll/cgu;Landroid/content/Context;)V

    .line 25
    .line 26
    .line 27
    iput-object p3, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;->a:Ll/x6m;

    .line 28
    .line 29
    :goto_0
    new-instance p1, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer$a;

    .line 30
    .line 31
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer$a;-><init>(Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;)V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;->b:Lcom/p1/mobile/putong/live/base/mmsdk/player/a$b;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;->c:Lcom/p1/mobile/putong/live/base/mmsdk/player/a;

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->c(Lcom/p1/mobile/putong/live/base/mmsdk/player/a$b;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;->d:Z

    return p0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;)Ll/x6m;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;->a:Ll/x6m;

    return-object p0
.end method


# virtual methods
.method public a()Ltv/danmaku/ijk/media/player/PullWatchInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;->a:Ll/x6m;

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
    invoke-interface {p0}, Ll/x6m;->a()Ltv/danmaku/ijk/media/player/PullWatchInfo;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public b(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;->a:Ll/x6m;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/x6m;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Ll/pxh0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;->a:Ll/x6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/x6m;->c(Ll/pxh0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d(Landroid/view/Surface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;->a:Ll/x6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/x6m;->d(Landroid/view/Surface;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;->a:Ll/x6m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/x6m;->e(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public isPlaying()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;->a:Ll/x6m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x6m;->isPlaying()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public release()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;->a:Ll/x6m;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/x6m;->release()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;->c:Lcom/p1/mobile/putong/live/base/mmsdk/player/a;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;->b:Lcom/p1/mobile/putong/live/base/mmsdk/player/a$b;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/base/mmsdk/player/a;->d(Lcom/p1/mobile/putong/live/base/mmsdk/player/a$b;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setMute(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;->a:Ll/x6m;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ll/x6m;->setMute(Z)V

    .line 4
    .line 5
    .line 6
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;->d:Z

    .line 7
    .line 8
    return-void
.end method
