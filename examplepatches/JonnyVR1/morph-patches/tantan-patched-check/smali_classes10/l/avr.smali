.class public Ll/avr;
.super Ll/y8s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/y8s<",
        "Ll/oo2;",
        "Ll/xur;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/oo2;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/y8s;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/xur;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-direct {p1, v0, p0}, Ll/xur;-><init>(Lcom/p1/mobile/android/app/Act;Ll/avr;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic S3(Ll/avr;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/avr;->U3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;)V

    return-void
.end method


# virtual methods
.method public T3(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->openGiftDialogEvent()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance v0, Ll/lx50;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/lx50;-><init>()V

    .line 14
    .line 15
    .line 16
    const/16 v1, 0x5dd

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/lx50;->i(I)Ll/lx50;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/4 v1, -0x1

    .line 23
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {v1}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Ll/lx50;->g(Ljava/util/List;)Ll/lx50;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 39
    .line 40
    check-cast p1, Ll/xur;

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 43
    .line 44
    .line 45
    invoke-static {p0}, Ll/t3m0;->c(Ll/i6t;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final U3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/xur;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/xur;->K(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkAnchorGrowthMsg$VoiceAnchorGrowthMessage;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0}, Ll/t3m0;->d(Ll/i6t;)V

    .line 9
    .line 10
    .line 11
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
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v0, v0, Ll/aj1;->y1:Lrx/subjects/b;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/zur;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/zur;-><init>(Ll/avr;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

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
