.class public Ll/cmp0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/cmp0$a;
    }
.end annotation


# instance fields
.field public a:Ll/tam;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ll/dmp0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/cmp0;-><init>()V

    return-void
.end method

.method public static d()Ll/cmp0;
    .locals 1

    .line 1
    invoke-static {}, Ll/cmp0$a;->a()Ll/cmp0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static g(Ll/rwn0;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/rwn0;->p()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/vwt;->W5()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    invoke-virtual {p0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Ll/vwt;->Z5()Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0

    .line 35
    :cond_1
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Ll/vwt;->X5()Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    return p0
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cmp0;->a:Ll/tam;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/cmp0;->a:Ll/tam;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-interface {v0, v1, v1}, Ll/tam;->K0(ZZ)V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Ll/cmp0;->a:Ll/tam;

    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cmp0;->a:Ll/tam;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/cmp0;->a:Ll/tam;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-interface {v0, v1, v1}, Ll/tam;->K0(ZZ)V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Ll/cmp0;->a:Ll/tam;

    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public c()Ll/oo2;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cmp0;->a:Ll/tam;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/cmp0;->a:Ll/tam;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/tam;->j()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cmp0;->a:Ll/tam;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/cmp0;->a:Ll/tam;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/tam;->i()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const-string p0, ""

    .line 17
    .line 18
    return-object p0
.end method

.method public f()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cmp0;->a:Ll/tam;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/cmp0;->a:Ll/tam;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/tam;->isShowing()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public h()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cmp0;->a:Ll/tam;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/cmp0;->a:Ll/tam;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/tam;->a()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public i()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cmp0;->a:Ll/tam;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/cmp0;->a:Ll/tam;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/tam;->B0()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public j()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cmp0;->a:Ll/tam;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/cmp0;->a:Ll/tam;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/tam;->q()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public k()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cmp0;->a:Ll/tam;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/tam;->G1()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public l(Ll/hti;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/hti<",
            "Ll/rwn0;",
            ">;)Z"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->v0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    if-eqz p1, :cond_3

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/hti;->e()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_3

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/hti;->e()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ll/rwn0;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_1
    invoke-virtual {p1}, Ll/hti;->e()Ll/oo2;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Ll/rwn0;

    .line 37
    .line 38
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {v0}, Ll/y6s;->b(Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    new-instance v1, Ll/uem0;

    .line 51
    .line 52
    invoke-direct {v1}, Ll/uem0;-><init>()V

    .line 53
    .line 54
    .line 55
    iput-object v1, p0, Ll/cmp0;->a:Ll/tam;

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    new-instance v1, Ll/hmp0;

    .line 59
    .line 60
    invoke-direct {v1}, Ll/hmp0;-><init>()V

    .line 61
    .line 62
    .line 63
    iput-object v1, p0, Ll/cmp0;->a:Ll/tam;

    .line 64
    .line 65
    :goto_0
    new-instance v1, Ll/rmp0;

    .line 66
    .line 67
    invoke-direct {v1, v0}, Ll/rmp0;-><init>(Z)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/cmp0;->a:Ll/tam;

    .line 71
    .line 72
    invoke-interface {v0, v1}, Ll/k3m;->C(Ll/iam;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/cmp0;->a:Ll/tam;

    .line 76
    .line 77
    invoke-virtual {v1, v0}, Ll/rmp0;->i(Ll/tam;)V

    .line 78
    .line 79
    .line 80
    const-string v0, "open_type"

    .line 81
    .line 82
    invoke-virtual {p1}, Ll/hti;->f()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    filled-new-array {v0}, [Ll/pf60;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    const-string v1, "e_audio_room_start_floating_bubble"

    .line 95
    .line 96
    const-string v2, ""

    .line 97
    .line 98
    invoke-static {v1, v2, v0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Ll/cmp0;->a:Ll/tam;

    .line 102
    .line 103
    invoke-interface {p0, p1}, Ll/tam;->p(Ll/hti;)Z

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    return p0

    .line 108
    :cond_3
    :goto_1
    return v1
.end method
