.class public Ll/nrk0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Ll/kuk0;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ll/itm0;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/kuk0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/kuk0;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/itm0;

    .line 13
    .line 14
    iget-object p1, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    iget-object v1, p0, Ll/cyr;->lifecycleProviderImpl:Ll/ner;

    .line 17
    .line 18
    invoke-direct {v0, p1, v1}, Ll/itm0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/ner;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/nrk0;->i:Ll/itm0;

    .line 22
    .line 23
    return-void
.end method

.method public static synthetic J3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic K3(Ll/nrk0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nrk0;->O3()V

    return-void
.end method

.method public static synthetic L3(Ll/nrk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nrk0;->P3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;)V

    return-void
.end method

.method public static synthetic M3(Ll/nrk0;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/nrk0;->R3(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic N3(Ll/nrk0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/nrk0;->U3(Ljava/lang/String;)V

    return-void
.end method

.method private synthetic R3(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/kuk0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/kuk0;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method private U3(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nrk0;->T3(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/kuk0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/kuk0;->n()V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final synthetic O3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/kuk0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/kuk0;->l()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic P3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/kuk0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/kuk0;->m(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCallSummary;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public S3(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nrk0;->i:Ll/itm0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast v1, Ll/kuk0;

    .line 6
    .line 7
    iget-object v1, v1, Ll/kuk0;->h:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    new-instance v2, Ll/mrk0;

    .line 10
    .line 11
    invoke-direct {v2, p0}, Ll/mrk0;-><init>(Ll/nrk0;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1, p1, p2, v2}, Ll/itm0;->n0(Landroid/view/ViewGroup;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public T3(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/api/VCallApiProvider;->callSummary(Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Ll/krk0;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/krk0;-><init>(Ll/nrk0;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ll/lrk0;

    .line 15
    .line 16
    invoke-direct {p0}, Ll/lrk0;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

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
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->openCallSummaryEvent()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/irk0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/irk0;-><init>(Ll/nrk0;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/jrk0;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/jrk0;-><init>(Ll/nrk0;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

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
