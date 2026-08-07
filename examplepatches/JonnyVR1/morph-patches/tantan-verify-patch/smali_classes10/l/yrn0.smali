.class public Ll/yrn0;
.super Ll/qct;
.source "SourceFile"

# interfaces
.implements Ll/yvl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/rwn0;",
        ">;",
        "Ll/yvl;"
    }
.end annotation


# instance fields
.field public i:Ll/msn0;

.field public final j:F

.field public k:F

.field public final l:F

.field public final m:F


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, -0x40800000    # -1.0f

    .line 5
    .line 6
    iput p1, p0, Ll/yrn0;->j:F

    .line 7
    .line 8
    iput p1, p0, Ll/yrn0;->k:F

    .line 9
    .line 10
    const/high16 p1, 0x40800000    # 4.0f

    .line 11
    .line 12
    iput p1, p0, Ll/yrn0;->l:F

    .line 13
    .line 14
    const/high16 p1, 0x3f800000    # 1.0f

    .line 15
    .line 16
    iput p1, p0, Ll/yrn0;->m:F

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/yrn0;->i4()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private A4(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yrn0;->i:Ll/msn0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/msn0;->V(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private B4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yrn0;->i:Ll/msn0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/msn0;->W(Ljava/lang/Boolean;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private C4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yrn0;->i:Ll/msn0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/msn0;->Y(Ljava/lang/Boolean;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic J3(Ll/yrn0;Ljava/lang/Float;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yrn0;->h4(Ljava/lang/Float;)V

    return-void
.end method

.method public static synthetic K3(Ll/yrn0;Ll/j120;)Ljava/lang/Long;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yrn0;->x4(Ll/j120;)Ljava/lang/Long;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L3(Ll/yrn0;Ll/o120;)Ljava/lang/Float;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yrn0;->t4(Ll/o120;)Ljava/lang/Float;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic M3(Ll/yrn0;Ljava/lang/Boolean;)Ljava/lang/Float;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yrn0;->r4(Ljava/lang/Boolean;)Ljava/lang/Float;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic N3(Ll/yrn0;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yrn0;->p4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic O3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic P3(Ll/yrn0;Ll/dob0;)Ljava/lang/Float;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yrn0;->u4(Ll/dob0;)Ljava/lang/Float;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic R3(Ll/yrn0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/yrn0;->B4(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic S3(Ll/yrn0;Ll/s660;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yrn0;->z4(Ll/s660;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic T3(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/android/app/c;->a:Z

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic U3(Ll/yrn0;Ll/cke;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yrn0;->y4(Ll/cke;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic V3(Ll/yrn0;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/yrn0;->A4(I)V

    return-void
.end method

.method public static synthetic W3(Ll/yrn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yrn0;->l4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method

.method public static synthetic X3(Ll/yrn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yrn0;->j4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V

    return-void
.end method

.method public static synthetic Y3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->state:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Z3(Ll/yrn0;Ll/ud80;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yrn0;->v4(Ll/ud80;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a4(Ll/yrn0;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yrn0;->q4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic b4(Ll/yrn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yrn0;->s4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V

    return-void
.end method

.method public static synthetic c4(Ll/yrn0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/yrn0;->C4(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic d4(Ll/yrn0;Ll/na1;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yrn0;->n4(Ll/na1;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e4(Ll/yrn0;Ll/r020;)Ljava/lang/Long;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yrn0;->w4(Ll/r020;)Ljava/lang/Long;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f4(Ll/yrn0;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yrn0;->o4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic g4(Ll/yrn0;Lcom/p1/mobile/android/app/c;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yrn0;->m4(Lcom/p1/mobile/android/app/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final D4()V
    .locals 2

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
    invoke-virtual {v0}, Ll/rwn0;->Z2()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/p3r;

    .line 16
    .line 17
    invoke-direct {v1}, Ll/p3r;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/nrn0;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/nrn0;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->distinctUntilChanged(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/orn0;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/orn0;-><init>(Ll/yrn0;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final E4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yrn0;->i:Ll/msn0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/msn0;->x()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/rwn0;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    sget-object v2, Ll/qd80;->k:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v1, v0, v2}, Ll/rqn0;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    new-instance v0, Ll/prn0;

    .line 34
    .line 35
    invoke-direct {v0}, Ll/prn0;-><init>()V

    .line 36
    .line 37
    .line 38
    new-instance v1, Ll/wnt;

    .line 39
    .line 40
    invoke-direct {v1}, Ll/wnt;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    :cond_0
    return-void
.end method

.method public L1(Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public T()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceKtvEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->registerPlayListener()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Ll/yrn0;->i:Ll/msn0;

    .line 15
    .line 16
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    new-instance v2, Ll/lrn0;

    .line 20
    .line 21
    invoke-direct {v2, v1}, Ll/lrn0;-><init>(Ll/msn0;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0, v2}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceKtvEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->removePlayListener()Ll/v3f$d;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v1, p0, Ll/yrn0;->i:Ll/msn0;

    .line 38
    .line 39
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    new-instance v2, Ll/mrn0;

    .line 43
    .line 44
    invoke-direct {v2, v1}, Ll/mrn0;-><init>(Ll/msn0;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v0, v2}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public Y1()Ll/rwn0;
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
    return-object p0
.end method

.method public final h4(Ljava/lang/Float;)V
    .locals 1

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
    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/guk0;->g(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/yrn0;->i:Ll/msn0;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ll/msn0;->o(Ljava/lang/Float;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iput p1, p0, Ll/yrn0;->k:F

    .line 27
    .line 28
    return-void
.end method

.method public final i4()V
    .locals 1

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
    invoke-virtual {v0}, Ll/rwn0;->U2()Ll/msn0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/rwn0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/rwn0;->U2()Ll/msn0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Ll/yrn0;->i:Ll/msn0;

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ll/msn0;->X(Ll/yvl;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    new-instance v0, Ll/msn0;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Ll/msn0;-><init>(Ll/yvl;)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Ll/yrn0;->i:Ll/msn0;

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
    iget-object p0, p0, Ll/yrn0;->i:Ll/msn0;

    .line 43
    .line 44
    invoke-virtual {v0, p0}, Ll/rwn0;->O3(Ll/msn0;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final j4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V
    .locals 3

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
    iget-boolean v0, v0, Ll/rwn0;->Q:Z

    .line 8
    .line 9
    const-string v1, "http"

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/yrn0;->i:Ll/msn0;

    .line 14
    .line 15
    invoke-virtual {p0, p1, v1}, Ll/msn0;->I(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->playInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->isValid(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->playInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

    .line 30
    .line 31
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 32
    .line 33
    invoke-virtual {v2}, Ll/wrv;->D0()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    check-cast p0, Ll/rwn0;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->playInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 54
    .line 55
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->orderId:Ljava/lang/String;

    .line 56
    .line 57
    sget-object v0, Ll/qd80;->n:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {p0, p1, v0}, Ll/rqn0;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    iget-object p0, p0, Ll/yrn0;->i:Ll/msn0;

    .line 64
    .line 65
    invoke-virtual {p0, p1, v1}, Ll/msn0;->I(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public final k4()V
    .locals 3

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
    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/guk0;->g(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/high16 v1, 0x40800000    # 4.0f

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const/high16 v2, -0x40800000    # -1.0f

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move v2, v1

    .line 23
    :goto_0
    iput v2, p0, Ll/yrn0;->k:F

    .line 24
    .line 25
    iget-object v2, p0, Ll/yrn0;->i:Ll/msn0;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    :cond_1
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v2, v0}, Ll/msn0;->o(Ljava/lang/Float;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ll/yrn0;->i:Ll/msn0;

    .line 38
    .line 39
    const/high16 v0, 0x3f800000    # 1.0f

    .line 40
    .line 41
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p0, v0}, Ll/msn0;->n(Ljava/lang/Float;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final synthetic l4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yrn0;->k4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m4(Lcom/p1/mobile/android/app/c;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/vp20;->k()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {p1}, Ll/rqn0;->h(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public n()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/yrn0;->i:Ll/msn0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    check-cast v1, Ll/rwn0;

    .line 11
    .line 12
    invoke-virtual {v1}, Ll/rwn0;->k3()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    xor-int/lit8 v1, v1, 0x1

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/msn0;->r(Z)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ll/rwn0;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/oo2;->H0()Ll/c0m;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ll/rwn0;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/oo2;->H0()Ll/c0m;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-interface {v0}, Ll/c0m;->e()Ll/xzl;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    check-cast p0, Ll/rwn0;

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/oo2;->H0()Ll/c0m;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-interface {p0}, Ll/c0m;->e()Ll/xzl;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const/4 v0, 0x0

    .line 64
    invoke-interface {p0, v0}, Ll/xzl;->Q(Ll/qcj;)V

    .line 65
    .line 66
    .line 67
    :cond_0
    return-void
.end method

.method public final synthetic n4(Ll/na1;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yrn0;->i:Ll/msn0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/msn0;->v()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic o4(Ll/vxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yrn0;->i:Ll/msn0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/msn0;->R()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic p4(Ll/vxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yrn0;->i:Ll/msn0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/msn0;->U()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic q4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/yrn0;->E4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic r4(Ljava/lang/Boolean;)Ljava/lang/Float;
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_0
    iget p1, p0, Ll/yrn0;->k:F

    .line 14
    .line 15
    cmpg-float p1, p1, v0

    .line 16
    .line 17
    if-gez p1, :cond_1

    .line 18
    .line 19
    const/high16 p1, 0x40800000    # 4.0f

    .line 20
    .line 21
    iput p1, p0, Ll/yrn0;->k:F

    .line 22
    .line 23
    :cond_1
    iget p0, p0, Ll/yrn0;->k:F

    .line 24
    .line 25
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public final synthetic s4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/yrn0;->i:Ll/msn0;

    .line 2
    .line 3
    const-string v0, "http"

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0}, Ll/msn0;->I(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    move-result-object v0

    check-cast v0, Ll/rwn0;

    iget-boolean v0, v0, Ll/rwn0;->Q:Z

    const/high16 v1, -0x40800000    # -1.0f

    if-nez v0, :cond_2

    .line 3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    move-result-object v0

    check-cast v0, Ll/rwn0;

    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    move-result-object v0

    invoke-static {v0}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 4
    invoke-virtual {p0}, Ll/yrn0;->D4()V

    goto :goto_0

    .line 5
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    move-result-object v0

    check-cast v0, Ll/rwn0;

    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    move-result-object v0

    invoke-static {v0}, Ll/guk0;->g(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 6
    invoke-virtual {p0}, Ll/yrn0;->k4()V

    goto :goto_0

    .line 7
    :cond_1
    iput v1, p0, Ll/yrn0;->k:F

    .line 8
    :goto_0
    iget-object v0, p0, Ll/yrn0;->i:Ll/msn0;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v0, v1}, Ll/msn0;->n(Ljava/lang/Float;)V

    goto :goto_1

    .line 9
    :cond_2
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    move-result-object v0

    check-cast v0, Ll/rwn0;

    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    move-result-object v0

    invoke-static {v0}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 10
    invoke-virtual {p0}, Ll/yrn0;->D4()V

    goto :goto_1

    .line 11
    :cond_3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    move-result-object v0

    check-cast v0, Ll/rwn0;

    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    move-result-object v0

    invoke-static {v0}, Ll/guk0;->g(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 12
    iput v1, p0, Ll/yrn0;->k:F

    goto :goto_1

    .line 13
    :cond_4
    iget-object v0, p0, Ll/yrn0;->i:Ll/msn0;

    invoke-virtual {v0}, Ll/msn0;->F()Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iput v0, p0, Ll/yrn0;->k:F

    .line 14
    :goto_1
    iget-object v0, p0, Ll/yrn0;->i:Ll/msn0;

    invoke-virtual {v0}, Ll/msn0;->Z()V

    .line 15
    invoke-virtual {p0}, Ll/i6t;->lifecycle()Lrx/c;

    move-result-object v0

    new-instance v1, Ll/yqn0;

    invoke-direct {v1}, Ll/yqn0;-><init>()V

    .line 16
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    move-result-object v0

    const/4 v1, 0x1

    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    move-result-object v0

    new-instance v1, Ll/arn0;

    invoke-direct {v1, p0}, Ll/arn0;-><init>(Ll/yrn0;)V

    .line 19
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    move-result-object v0

    new-instance v1, Ll/crn0;

    invoke-direct {v1, p0}, Ll/crn0;-><init>(Ll/yrn0;)V

    .line 20
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 21
    new-instance v0, Ll/drn0;

    invoke-direct {v0, p0}, Ll/drn0;-><init>(Ll/yrn0;)V

    const-class v1, Ll/o120;

    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 22
    new-instance v0, Ll/ern0;

    invoke-direct {v0, p0}, Ll/ern0;-><init>(Ll/yrn0;)V

    const-class v1, Ll/dob0;

    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 23
    new-instance v0, Ll/frn0;

    invoke-direct {v0, p0}, Ll/frn0;-><init>(Ll/yrn0;)V

    const-class v1, Ll/ud80;

    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 24
    new-instance v0, Ll/grn0;

    invoke-direct {v0, p0}, Ll/grn0;-><init>(Ll/yrn0;)V

    const-class v1, Ll/r020;

    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 25
    new-instance v0, Ll/hrn0;

    invoke-direct {v0, p0}, Ll/hrn0;-><init>(Ll/yrn0;)V

    const-class v1, Ll/j120;

    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 26
    new-instance v0, Ll/irn0;

    invoke-direct {v0, p0}, Ll/irn0;-><init>(Ll/yrn0;)V

    const-class v1, Ll/cke;

    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 27
    new-instance v0, Ll/krn0;

    invoke-direct {v0, p0}, Ll/krn0;-><init>(Ll/yrn0;)V

    const-class v1, Ll/s660;

    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 28
    new-instance v0, Ll/jrn0;

    invoke-direct {v0, p0}, Ll/jrn0;-><init>(Ll/yrn0;)V

    const-class v1, Ll/na1;

    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 29
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    move-result-object v0

    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceKtvEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;

    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->adjustMusicVolume()Ll/v3f$d;

    move-result-object v0

    iget-object v1, p0, Ll/yrn0;->i:Ll/msn0;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v2, Ll/qrn0;

    invoke-direct {v2, v1}, Ll/qrn0;-><init>(Ll/msn0;)V

    invoke-virtual {p0, v0, v2}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 30
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    move-result-object v0

    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceKtvEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;

    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->adjustRecordVolume()Ll/v3f$d;

    move-result-object v0

    new-instance v1, Ll/rrn0;

    invoke-direct {v1, p0}, Ll/rrn0;-><init>(Ll/yrn0;)V

    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 31
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    move-result-object v0

    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceKtvEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;

    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->pauseMusic()Ll/v3f$c;

    move-result-object v0

    new-instance v1, Ll/srn0;

    invoke-direct {v1, p0}, Ll/srn0;-><init>(Ll/yrn0;)V

    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 32
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    move-result-object v0

    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceKtvEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;

    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->resumeMusic()Ll/v3f$c;

    move-result-object v0

    new-instance v1, Ll/trn0;

    invoke-direct {v1, p0}, Ll/trn0;-><init>(Ll/yrn0;)V

    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 33
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    move-result-object v0

    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceKtvEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;

    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->switchNext()Ll/v3f$c;

    move-result-object v0

    new-instance v1, Ll/urn0;

    invoke-direct {v1, p0}, Ll/urn0;-><init>(Ll/yrn0;)V

    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 34
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    move-result-object v0

    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceKtvEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;

    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->setOriginalSwitcher()Ll/v3f$d;

    move-result-object v0

    new-instance v1, Ll/vrn0;

    invoke-direct {v1, p0}, Ll/vrn0;-><init>(Ll/yrn0;)V

    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 35
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    move-result-object v0

    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceKtvEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;

    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->setEarSwitcher()Ll/v3f$d;

    move-result-object v0

    new-instance v1, Ll/wrn0;

    invoke-direct {v1, p0}, Ll/wrn0;-><init>(Ll/yrn0;)V

    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 36
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    move-result-object v0

    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceKtvEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;

    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->setAudioEffectPreset()Ll/v3f$d;

    move-result-object v0

    new-instance v1, Ll/xrn0;

    invoke-direct {v1, p0}, Ll/xrn0;-><init>(Ll/yrn0;)V

    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 37
    new-instance v0, Ll/r410;

    const/16 v1, 0x1b61

    invoke-direct {v0, v1}, Ll/r410;-><init>(I)V

    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ll/xzl;

    new-instance v1, Ll/zqn0;

    invoke-direct {v1, p0}, Ll/zqn0;-><init>(Ll/yrn0;)V

    .line 38
    invoke-interface {v0, v1}, Ll/xzl;->Q(Ll/qcj;)V

    .line 39
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    move-result-object v0

    check-cast v0, Ll/rwn0;

    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ll/rqn0;->h(Ljava/lang/String;)Lrx/c;

    move-result-object v0

    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object v0

    new-instance v1, Ll/brn0;

    invoke-direct {v1, p0}, Ll/brn0;-><init>(Ll/yrn0;)V

    .line 40
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    move-result-object p0

    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    return-void
.end method

.method public t1(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/tqn0;->a(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic t4(Ll/o120;)Ljava/lang/Float;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yrn0;->i:Ll/msn0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/msn0;->C()Ljava/lang/Float;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic u4(Ll/dob0;)Ljava/lang/Float;
    .locals 1

    .line 1
    iget p0, p0, Ll/yrn0;->k:F

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    cmpg-float v0, p0, p1

    .line 5
    .line 6
    if-gez v0, :cond_0

    .line 7
    .line 8
    move p0, p1

    .line 9
    :cond_0
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic v4(Ll/ud80;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yrn0;->i:Ll/msn0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/msn0;->E()Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic w4(Ll/r020;)Ljava/lang/Long;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yrn0;->i:Ll/msn0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/msn0;->w()Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic x4(Ll/j120;)Ljava/lang/Long;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yrn0;->i:Ll/msn0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/msn0;->z()Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic y4(Ll/cke;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yrn0;->i:Ll/msn0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/msn0;->y()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic z4(Ll/s660;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yrn0;->i:Ll/msn0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/msn0;->D()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
