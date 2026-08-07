.class public Ll/u1f;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ll/v6m;

.field public c:Ll/b210;

.field public d:Ll/p410;

.field public e:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;

.field public f:Ll/n210;

.field public g:Ll/r610;

.field public h:Ll/r510;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/u1f;->a:Landroid/content/Context;

    .line 5
    .line 6
    new-instance v0, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$b;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$b;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Ll/vwt;->O4()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$b;->e(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/wrv;->V()Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-static {v1}, Ll/xau;->y(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$b;->g(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 36
    .line 37
    invoke-virtual {v1}, Ll/wrv;->p()Ll/vwt;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1}, Ll/vwt;->e5()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$b;->f(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    new-instance v1, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;

    .line 49
    .line 50
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    sget-object v2, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$LivePusherType;->NEW_MOMO:Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$LivePusherType;

    .line 55
    .line 56
    invoke-direct {v1, p1, v0, v2}, Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher;-><init>(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$b;Lcom/p1/mobile/putong/live/base/mmsdk/pusher/TTLivePusher$LivePusherType;)V

    .line 57
    .line 58
    .line 59
    iput-object v1, p0, Ll/u1f;->b:Ll/v6m;

    .line 60
    .line 61
    return-void
.end method


# virtual methods
.method public a(Ll/b210;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u1f;->c:Ll/b210;

    .line 2
    .line 3
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u1f;->e:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;

    .line 2
    .line 3
    return-void
.end method

.method public c(Ll/n210;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u1f;->f:Ll/n210;

    .line 2
    .line 3
    return-void
.end method

.method public d(Ll/r610;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u1f;->g:Ll/r610;

    .line 2
    .line 3
    return-void
.end method

.method public e(Ll/p410;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u1f;->d:Ll/p410;

    .line 2
    .line 3
    return-void
.end method

.method public f(Ll/r510;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u1f;->h:Ll/r510;

    .line 2
    .line 3
    return-void
.end method

.method public g()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u1f;->c:Ll/b210;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/b210;->b1()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/u1f;->d:Ll/p410;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/p410;->V0()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/u1f;->e:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->Y0()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/u1f;->f:Ll/n210;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/n210;->c()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/u1f;->g:Ll/r610;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/r610;->g()V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/u1f;->h:Ll/r510;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/r510;->i()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public h()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u1f;->b:Ll/v6m;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/u1f;->g:Ll/r610;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/r610;->m()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/u1f;->h:Ll/r510;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/r510;->l()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/u1f;->f:Ll/n210;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/n210;->d()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/u1f;->e:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->e1()V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/u1f;->e:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->stopSurroundMusic()V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/u1f;->b:Ll/v6m;

    .line 31
    .line 32
    invoke-interface {v0}, Ll/v6m;->release()V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/u1f;->c:Ll/b210;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/b210;->m1()V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/u1f;->c:Ll/b210;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/b210;->k1()V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/u1f;->d:Ll/p410;

    .line 46
    .line 47
    invoke-virtual {v0}, Ll/p410;->a1()V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Ll/u1f;->e:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;->b1()V

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void
.end method
