.class public abstract Ll/ztk0;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/rwn0;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Ll/fuk0;

.field public final j:Ll/hrk0$b;

.field public k:Ll/r1n0;

.field public l:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public m:Ll/vmp0;

.field public n:Z


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/qtk0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/qtk0;-><init>(Ll/ztk0;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ztk0;->l:Ll/z20;

    .line 10
    .line 11
    new-instance v0, Ll/hrk0$b;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/hrk0$b;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/ztk0;->j:Ll/hrk0$b;

    .line 17
    .line 18
    new-instance v0, Ll/vmp0;

    .line 19
    .line 20
    invoke-direct {v0, p1}, Ll/vmp0;-><init>(Ll/dum;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ll/vmp0;

    .line 28
    .line 29
    iput-object v0, p0, Ll/ztk0;->m:Ll/vmp0;

    .line 30
    .line 31
    new-instance v0, Ll/fuk0;

    .line 32
    .line 33
    invoke-direct {v0, p1, p0}, Ll/fuk0;-><init>(Ll/dum;Ll/ztk0;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ll/fuk0;

    .line 41
    .line 42
    iput-object v0, p0, Ll/ztk0;->i:Ll/fuk0;

    .line 43
    .line 44
    new-instance v0, Ll/a1n0;

    .line 45
    .line 46
    invoke-direct {v0, p1, p0}, Ll/a1n0;-><init>(Ll/dum;Ll/ztk0;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 50
    .line 51
    .line 52
    new-instance v0, Ll/kym0;

    .line 53
    .line 54
    invoke-direct {v0, p1, p0}, Ll/kym0;-><init>(Ll/dum;Ll/ztk0;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public static synthetic J3(Ll/ztk0;Ll/bzm0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ztk0;->Y3(Ll/bzm0;)V

    return-void
.end method

.method public static synthetic K3(Ll/ztk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ztk0;->a4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method

.method public static synthetic L3(Ll/ztk0;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ztk0;->p4(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V

    return-void
.end method

.method public static synthetic M3(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const-string v0, "[voice][call]"

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {v0, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic N3(Ll/ztk0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ztk0;->Z3(Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public O3(Ll/ezm0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ztk0;->k:Ll/r1n0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/r1n0;->J3(Ll/ezm0;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/ztk0;->j:Ll/hrk0$b;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/hrk0$b;->b(Ll/ezm0;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public P3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ztk0;->k:Ll/r1n0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/r1n0;->K3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/ztk0;->j:Ll/hrk0$b;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/hrk0$b;->c(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public R3()Ll/z20;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/z20<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ztk0;->l:Ll/z20;

    .line 2
    .line 3
    return-object p0
.end method

.method public S3()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/vp20;->o()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/z310;

    .line 5
    .line 6
    const/16 v1, 0xd48

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/z310;-><init>(I)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/h0m;

    .line 16
    .line 17
    new-instance v1, Ll/qtk0;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/qtk0;-><init>(Ll/ztk0;)V

    .line 20
    .line 21
    .line 22
    invoke-interface {v0, v1}, Ll/h0m;->c(Ll/z20;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Ll/rwn0;

    .line 30
    .line 31
    iget-object v1, p0, Ll/ztk0;->j:Ll/hrk0$b;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ll/rwn0;->H2(Ll/hrk0$b;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ll/rwn0;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/rwn0;->Z2()Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const/4 v1, 0x0

    .line 47
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ll/rtk0;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/rtk0;-><init>(Ll/ztk0;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 68
    .line 69
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->leaveVoiceEvent()Ll/v3f$d;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    check-cast v0, Lrx/c;

    .line 78
    .line 79
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    new-instance v1, Ll/stk0;

    .line 84
    .line 85
    invoke-direct {v1, p0}, Ll/stk0;-><init>(Ll/ztk0;)V

    .line 86
    .line 87
    .line 88
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 93
    .line 94
    .line 95
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    sget-object v0, Ll/f5y;->a:Ljava/lang/String;

    .line 100
    .line 101
    invoke-static {p0, v0}, Ll/f5y;->a(Landroid/content/Context;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public abstract T3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
.end method

.method public U3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/r35;->c(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public abstract V3()V
.end method

.method public W3(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public X3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ztk0;->i:Ll/fuk0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fuk0;->M3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic Y3(Ll/bzm0;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/bzm0;->g:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Ll/ztk0;->b4(Ll/bzm0;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic Z3(Ljava/util/List;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/ztk0;->f4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic a4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ztk0;->X3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b4(Ll/bzm0;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p1, p1, Ll/bzm0;->e:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-static {p1}, Ll/guk0;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    const/4 v0, 0x3

    .line 20
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ll/rwn0;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/rwn0;->e3()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    invoke-static {p1, v0, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/call/api/VCallApiProvider;->hangUpVoiceCall(Ljava/lang/String;ZLjava/lang/String;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    new-instance p2, Ll/vtk0;

    .line 54
    .line 55
    invoke-direct {p2, p0}, Ll/vtk0;-><init>(Ll/ztk0;)V

    .line 56
    .line 57
    .line 58
    new-instance p0, Ll/wnt;

    .line 59
    .line 60
    invoke-direct {p0}, Ll/wnt;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-static {p2, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 68
    .line 69
    .line 70
    :cond_1
    :goto_0
    return-void
.end method

.method public abstract c4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
.end method

.method public d4(Ljava/lang/Integer;Ljava/lang/Object;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq v1, v0, :cond_1

    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v2, "onEngineCallback "

    .line 11
    .line 12
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-static {v2}, Ll/at2;->b(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v2, ","

    .line 27
    .line 28
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    if-nez p2, :cond_0

    .line 32
    .line 33
    const-string v2, ""

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    :goto_0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const-string v2, "[voice][call]"

    .line 48
    .line 49
    invoke-static {v2, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eq p1, v1, :cond_5

    .line 57
    .line 58
    const/4 v0, 0x2

    .line 59
    if-eq p1, v0, :cond_4

    .line 60
    .line 61
    const/4 v0, 0x3

    .line 62
    if-eq p1, v0, :cond_3

    .line 63
    .line 64
    const/4 p2, 0x4

    .line 65
    if-eq p1, p2, :cond_2

    .line 66
    .line 67
    return-void

    .line 68
    :cond_2
    iput-boolean v1, p0, Ll/ztk0;->n:Z

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/ztk0;->V3()V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_3
    iget-object p1, p0, Ll/ztk0;->i:Ll/fuk0;

    .line 75
    .line 76
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {p1, v0}, Ll/fuk0;->S3(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-virtual {p0, p1}, Ll/ztk0;->W3(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 95
    .line 96
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->enterRtcCallback()Ll/v3f$c;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-virtual {p1}, Ll/v3f$c;->p()V

    .line 101
    .line 102
    .line 103
    const/4 p1, 0x0

    .line 104
    iput-boolean p1, p0, Ll/ztk0;->n:Z

    .line 105
    .line 106
    return-void

    .line 107
    :cond_4
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    new-instance p2, Ll/wtk0;

    .line 112
    .line 113
    invoke-direct {p2, p0}, Ll/wtk0;-><init>(Ll/ztk0;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0, p1, p2}, Ll/ztk0;->h4(Ljava/lang/String;Ll/y20;)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_5
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    .line 121
    .line 122
    invoke-virtual {p0, p2}, Ll/ztk0;->n4(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)V

    .line 123
    .line 124
    .line 125
    iget-object p0, p0, Ll/ztk0;->m:Ll/vmp0;

    .line 126
    .line 127
    invoke-virtual {p0, p2}, Ll/vmp0;->M3(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)V

    .line 128
    .line 129
    .line 130
    return-void
.end method

.method public e4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 2

    .line 1
    const-string v0, "rejoinRtcRoom"

    .line 2
    .line 3
    const-string v1, "[voice][call]"

    .line 4
    .line 5
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Ll/ztk0;->n:Z

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string v0, "rejoinRtcRoom because push error"

    .line 13
    .line 14
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    new-instance v0, Ll/r410;

    .line 18
    .line 19
    const/16 v1, 0x2328

    .line 20
    .line 21
    invoke-direct {v0, v1}, Ll/r410;-><init>(I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Ll/xzl;

    .line 29
    .line 30
    new-instance v1, Ll/xtk0;

    .line 31
    .line 32
    invoke-direct {v1, p0, p1}, Ll/xtk0;-><init>(Ll/ztk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 33
    .line 34
    .line 35
    invoke-interface {v0, v1}, Ll/xzl;->c0(Ll/x20;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Ll/ztk0;->k4()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_0

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Ll/ztk0;->X3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public f4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ztk0;->k:Ll/r1n0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/r1n0;->N3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/ztk0;->j:Ll/hrk0$b;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/hrk0$b;->d(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public g4()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->isIncomerArea()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/4 v0, 0x0

    .line 22
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Ll/rwn0;

    .line 27
    .line 28
    invoke-virtual {v1}, Ll/vp20;->o()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Ll/rwn0;

    .line 37
    .line 38
    invoke-virtual {v2}, Ll/rwn0;->W0()Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    check-cast v3, Ll/rwn0;

    .line 47
    .line 48
    invoke-virtual {v3}, Ll/vp20;->k()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    check-cast v4, Ll/rwn0;

    .line 57
    .line 58
    invoke-virtual {v4}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    iget v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->callNumbers:I

    .line 63
    .line 64
    invoke-static {v1, v2, v3, v0, v4}, Lcom/p1/mobile/putong/live/livingroom/voice/call/api/VCallApiProvider;->getRoomMembers(Ljava/lang/String;ZLjava/lang/String;ZI)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v1, Ll/ttk0;

    .line 73
    .line 74
    invoke-direct {v1, p0}, Ll/ttk0;-><init>(Ll/ztk0;)V

    .line 75
    .line 76
    .line 77
    new-instance v2, Ll/utk0;

    .line 78
    .line 79
    invoke-direct {v2, p0}, Ll/utk0;-><init>(Ll/ztk0;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public h4(Ljava/lang/String;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ztk0;->S3()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/ztk0;->S3()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/api/VCallApiProvider;->requestSdkToken(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-virtual {p0, p1, v0}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance p1, Ll/ytk0;

    .line 26
    .line 27
    invoke-direct {p1}, Ll/ytk0;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {p2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public i4(Ll/ado0;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/ztk0;->l4(Ll/ado0;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p1, v0}, Ll/ado0;->C(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/ztk0;->X3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public abstract j4(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
.end method

.method public abstract k4()Z
.end method

.method public l4(Ll/ado0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ztk0;->k:Ll/r1n0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/r1n0;->R3(Ll/ado0;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/ztk0;->j:Ll/hrk0$b;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/hrk0$b;->e(Ll/ado0;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public m4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ztk0;->k:Ll/r1n0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/r1n0;->P3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/ztk0;->j:Ll/hrk0$b;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/hrk0$b;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/rwn0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/oo2;->Y0()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0}, Ll/f5y;->b(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public n4(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->memberVolume()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public o4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    const-string p0, "[voice][call]"

    .line 2
    .line 3
    const-string p1, "updateRtcInfo"

    .line 4
    .line 5
    invoke-static {p0, p1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final p4(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 2

    .line 1
    const-string v0, "[voice][call]"

    .line 2
    .line 3
    const-string v1, "callCoreModule updateRtcToken"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/r410;

    .line 9
    .line 10
    const/16 v1, 0x2328

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ll/r410;-><init>(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Ll/xzl;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->channelKey:Ljava/lang/String;

    .line 22
    .line 23
    invoke-interface {p0, p1}, Ll/xzl;->o(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/rwn0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->isIncomerArea()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ll/rwn0;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ll/hrk0;->r()Ll/ado0;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const/4 v1, 0x1

    .line 35
    invoke-virtual {v0, v1}, Ll/ado0;->Y(Z)V

    .line 36
    .line 37
    .line 38
    :cond_0
    invoke-virtual {p0}, Ll/ztk0;->g4()V

    .line 39
    .line 40
    .line 41
    return-void
.end method
