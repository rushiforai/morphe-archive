.class public Ll/tcv;
.super Ll/cyr;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/cyr<",
        "Ll/wcv;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Ll/nus;


# direct methods
.method public constructor <init>(Ll/nus;Lv/navigationbar/VNavigationBar;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/nus;->b:Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/cyr;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Ll/tcv;->a:Ll/nus;

    .line 7
    .line 8
    new-instance p1, Ll/wcv;

    .line 9
    .line 10
    invoke-direct {p1, p2}, Ll/wcv;-><init>(Lv/navigationbar/VNavigationBar;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/cyr;->C(Ll/iam;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic q2(Ll/tcv;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tcv;->A2(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;)V

    return-void
.end method

.method public static synthetic r2(Ll/tcv;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tcv;->B2(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic s2(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic u2(Ll/tcv;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tcv;->z2(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic v2(Ljava/lang/Throwable;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {}, Lrx/c;->empty()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private synthetic z2(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tcv;->C2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final synthetic A2(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/wcv;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/wcv;->i(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic B2(Ljava/util/List;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/wcv;

    .line 4
    .line 5
    iget-object p0, p0, Ll/tcv;->a:Ll/nus;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/nus;->a()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0, p1}, Ll/wcv;->j(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public C2()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/virtual/api/VirtualVoiceRoomApiProvider;->getVoiceSquareButtons()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/rcv;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/rcv;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->onErrorResumeNext(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/scv;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/scv;-><init>(Ll/tcv;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public w2()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/cyr;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/ocv;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/ocv;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/pcv;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/pcv;-><init>(Ll/tcv;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/tcv;->a:Ll/nus;

    .line 31
    .line 32
    iget-object v0, v0, Ll/nus;->a:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveVoiceInternalWidgetEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveVoiceInternalWidgetEvent;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveVoiceInternalWidgetEvent;->bottomWidget()Ll/v3f$d;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Lrx/c;

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v1, Ll/qcv;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/qcv;-><init>(Ll/tcv;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public y2()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/wcv;

    .line 4
    .line 5
    iget-object p0, p0, Ll/tcv;->a:Ll/nus;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/nus;->a()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Ll/wcv;->e(Lcom/p1/mobile/android/app/Act;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
