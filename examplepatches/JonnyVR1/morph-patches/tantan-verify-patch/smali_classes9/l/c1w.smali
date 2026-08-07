.class public Ll/c1w;
.super Ll/a3g0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/a3g0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ll/p2g0;)V
    .locals 4

    .line 1
    invoke-interface {p1}, Ll/p2g0;->a()Ll/d3g0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/d3g0;->e()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-interface {p1, p0}, Ll/p2g0;->b(Ll/d3g0;)Ll/p2g0;

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, Ll/d3g0;->c()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->live:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 24
    .line 25
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    new-instance v0, Landroid/os/Bundle;

    .line 38
    .line 39
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 40
    .line 41
    .line 42
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/act/InternationalAudioConflictAct;->c:Ljava/lang/String;

    .line 43
    .line 44
    sget-object v2, Lcom/p1/mobile/putong/live/livingroom/archi/act/InternationalAudioConflictAct;->d:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/act/InternationalAudioConflictAct;->e:Ljava/lang/String;

    .line 50
    .line 51
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->qf:I

    .line 52
    .line 53
    invoke-static {v2}, Ll/xau;->t(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    new-instance v1, Landroid/content/Intent;

    .line 61
    .line 62
    invoke-virtual {p0}, Ll/d3g0;->a()Landroid/content/Context;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    const-class v3, Lcom/p1/mobile/putong/live/livingroom/archi/act/InternationalAudioConflictAct;

    .line 67
    .line 68
    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, v1}, Ll/d3g0;->g(Landroid/content/Intent;)V

    .line 75
    .line 76
    .line 77
    invoke-interface {p1, p0}, Ll/p2g0;->b(Ll/d3g0;)Ll/p2g0;

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_1
    invoke-interface {p1, p0}, Ll/p2g0;->b(Ll/d3g0;)Ll/p2g0;

    .line 82
    .line 83
    .line 84
    return-void
.end method
