.class public Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/live/base/mmsdk/player/a$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;-><init>(Landroid/content/Context;Ll/cgu;Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer$PlayerType;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer$a;->a:Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer$a;->a:Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;->g(Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;)Ll/x6m;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 p1, 0x1

    .line 8
    invoke-interface {p0, p1}, Ll/x6m;->setMute(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public b(ILjava/lang/String;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer$a;->a:Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;->f(Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer$a;->a:Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;->g(Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;)Ll/x6m;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-interface {p0, p1}, Ll/x6m;->setMute(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public c(I)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer$a;->a:Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;->f(Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer$a;->a:Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;->g(Lcom/p1/mobile/putong/live/base/mmsdk/player/TTLivePlayer;)Ll/x6m;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-interface {p0, p1}, Ll/x6m;->setMute(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method
