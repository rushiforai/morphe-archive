.class public Ll/woo0;
.super Ll/i6t;
.source "SourceFile"

# interfaces
.implements Ll/c6m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/jqm0;",
        "Lcom/p1/mobile/putong/live/livingroom/voice/intl/player/VoiceRoomLoadingView;",
        ">;",
        "Ll/c6m;"
    }
.end annotation


# instance fields
.field public final i:Ll/bro0;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/voice/intl/player/VoiceRoomLoadingView;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/bro0;

    .line 5
    .line 6
    invoke-direct {v0, p1, p0}, Ll/bro0;-><init>(Ll/dum;Ll/woo0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Ll/bro0;

    .line 14
    .line 15
    iput-object p1, p0, Ll/woo0;->i:Ll/bro0;

    .line 16
    .line 17
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic J3(Ll/woo0;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/woo0;->N3(Ll/jsv;)V

    return-void
.end method

.method private K3(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/lti;->f()Z

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private L3(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/woo0;->U3()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/woo0;->V3()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private M3(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/player/VoiceRoomLoadingView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/player/VoiceRoomLoadingView;->e()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private N3(Ll/jsv;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/jsv;->a()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x2

    .line 6
    if-eq p1, v0, :cond_1

    .line 7
    .line 8
    const/4 v0, 0x4

    .line 9
    if-eq p1, v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-direct {p0}, Ll/woo0;->S3()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    invoke-direct {p0}, Ll/woo0;->P3()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private P3()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ll/jqm0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-direct {p0, v0}, Ll/woo0;->M3(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private R3()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/jqm0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

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
    new-instance v1, Ll/voo0;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/voo0;-><init>(Ll/woo0;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private S3()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/player/VoiceRoomLoadingView;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/player/VoiceRoomLoadingView;->d()V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Ll/woo0;->W3()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private W3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/player/VoiceRoomLoadingView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/player/VoiceRoomLoadingView;->d()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public O3()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/woo0;->i:Ll/bro0;

    .line 2
    .line 3
    const-string v0, "0"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/bro0;->X3(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public P0(ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Ll/woo0;->L3(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public T()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    const-string v0, "voice"

    .line 5
    .line 6
    invoke-direct {p0, v0}, Ll/woo0;->K3(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-direct {p0}, Ll/woo0;->R3()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public T3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/player/VoiceRoomLoadingView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/player/VoiceRoomLoadingView;->j()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final U3()Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/player/VoiceRoomLoadingView;

    .line 11
    .line 12
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->F9:I

    .line 13
    .line 14
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/player/VoiceRoomLoadingView;->k(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return v1

    .line 22
    :cond_0
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->k()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 29
    .line 30
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/player/VoiceRoomLoadingView;

    .line 31
    .line 32
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->D9:I

    .line 33
    .line 34
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/player/VoiceRoomLoadingView;->k(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return v1

    .line 42
    :cond_1
    const/4 p0, 0x0

    .line 43
    return p0
.end method

.method public final V3()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/player/VoiceRoomLoadingView;

    .line 4
    .line 5
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->F9:I

    .line 6
    .line 7
    invoke-static {v1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/player/VoiceRoomLoadingView;->k(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/player/VoiceRoomLoadingView;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/player/VoiceRoomLoadingView;->f()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public m(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/player/VoiceRoomLoadingView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/player/VoiceRoomLoadingView;->l(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public m1()V
    .locals 0

    .line 1
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/woo0;->T3()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Ll/i6t;->n()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
