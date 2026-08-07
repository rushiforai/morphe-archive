.class public Ll/r210;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/c0m;


# instance fields
.field public a:Ll/u1f;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/vwt;->k7()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-static {}, Ll/ac1;->b()V

    .line 22
    .line 23
    .line 24
    :cond_0
    new-instance v0, Ll/u1f;

    .line 25
    .line 26
    invoke-direct {v0, p1}, Ll/u1f;-><init>(Landroid/content/Context;)V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Ll/r210;->a:Ll/u1f;

    .line 30
    .line 31
    new-instance v1, Ll/b210;

    .line 32
    .line 33
    invoke-direct {v1, v0}, Ll/b210;-><init>(Ll/u1f;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ll/u1f;->a(Ll/b210;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/r210;->a:Ll/u1f;

    .line 40
    .line 41
    new-instance v1, Ll/p410;

    .line 42
    .line 43
    invoke-direct {v1, v0}, Ll/p410;-><init>(Ll/u1f;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ll/u1f;->e(Ll/p410;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/r210;->a:Ll/u1f;

    .line 50
    .line 51
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;

    .line 52
    .line 53
    invoke-direct {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;-><init>(Ll/u1f;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ll/u1f;->b(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ll/r210;->a:Ll/u1f;

    .line 60
    .line 61
    new-instance v1, Ll/n210;

    .line 62
    .line 63
    invoke-direct {v1, v0}, Ll/n210;-><init>(Ll/u1f;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v1}, Ll/u1f;->c(Ll/n210;)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Ll/r210;->a:Ll/u1f;

    .line 70
    .line 71
    new-instance v1, Ll/r610;

    .line 72
    .line 73
    iget-object v2, p0, Ll/r210;->a:Ll/u1f;

    .line 74
    .line 75
    invoke-direct {v1, v2}, Ll/r610;-><init>(Ll/u1f;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, v1}, Ll/u1f;->d(Ll/r610;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/r210;->a:Ll/u1f;

    .line 82
    .line 83
    new-instance v1, Ll/r510;

    .line 84
    .line 85
    invoke-direct {v1, p1, v0}, Ll/r510;-><init>(Landroid/content/Context;Ll/u1f;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, v1}, Ll/u1f;->f(Ll/r510;)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Ll/r210;->a:Ll/u1f;

    .line 92
    .line 93
    invoke-virtual {p0}, Ll/u1f;->g()V

    .line 94
    .line 95
    .line 96
    return-void
.end method


# virtual methods
.method public a()Ll/uzl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r210;->a:Ll/u1f;

    .line 2
    .line 3
    iget-object p0, p0, Ll/u1f;->e:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/momoengine/MomoEffectEngine;

    .line 4
    .line 5
    return-object p0
.end method

.method public b()Ll/wsl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r210;->a:Ll/u1f;

    .line 2
    .line 3
    iget-object p0, p0, Ll/u1f;->f:Ll/n210;

    .line 4
    .line 5
    return-object p0
.end method

.method public c()Ll/d0m;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r210;->a:Ll/u1f;

    .line 2
    .line 3
    iget-object p0, p0, Ll/u1f;->h:Ll/r510;

    .line 4
    .line 5
    return-object p0
.end method

.method public d()Ll/h0m;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r210;->a:Ll/u1f;

    .line 2
    .line 3
    iget-object p0, p0, Ll/u1f;->g:Ll/r610;

    .line 4
    .line 5
    return-object p0
.end method

.method public e()Ll/xzl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r210;->a:Ll/u1f;

    .line 2
    .line 3
    iget-object p0, p0, Ll/u1f;->d:Ll/p410;

    .line 4
    .line 5
    return-object p0
.end method

.method public f()Ll/szl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r210;->a:Ll/u1f;

    .line 2
    .line 3
    iget-object p0, p0, Ll/u1f;->c:Ll/b210;

    .line 4
    .line 5
    return-object p0
.end method

.method public onPause()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/r210;->a:Ll/u1f;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, v0, Ll/u1f;->c:Ll/b210;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/b210;->i1()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/r210;->a:Ll/u1f;

    .line 12
    .line 13
    iget-object v0, v0, Ll/u1f;->h:Ll/r510;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/r510;->j()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/r210;->a:Ll/u1f;

    .line 19
    .line 20
    iget-object p0, p0, Ll/u1f;->g:Ll/r610;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/r610;->l()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/r210;->a:Ll/u1f;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, v0, Ll/u1f;->h:Ll/r510;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/r510;->k()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/r210;->a:Ll/u1f;

    .line 12
    .line 13
    iget-object p0, p0, Ll/u1f;->g:Ll/r610;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/r610;->onResume()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public release()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r210;->a:Ll/u1f;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/u1f;->h()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
