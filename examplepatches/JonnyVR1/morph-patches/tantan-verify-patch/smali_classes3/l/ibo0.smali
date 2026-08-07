.class public Ll/ibo0;
.super Ll/y8s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/y8s<",
        "Ll/rwn0;",
        "Ll/xbo0;",
        ">;"
    }
.end annotation


# instance fields
.field public j:Ljava/lang/String;

.field public k:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/y8s;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/xbo0;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/xbo0;-><init>(Ll/ibo0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic S3(Ll/ibo0;Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3MainDetail;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ibo0;->Y3(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3MainDetail;)V

    return-void
.end method

.method public static synthetic T3(Ll/ibo0;Ll/bco0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ibo0;->W3(Ll/bco0;)V

    return-void
.end method

.method public static synthetic U3(Ll/ibo0;Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3Tab;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ibo0;->Z3(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3Tab;)V

    return-void
.end method

.method public static synthetic V3(Ll/ibo0;Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3Tab;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ibo0;->X3(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3Tab;)V

    return-void
.end method


# virtual methods
.method public T()V
    .locals 2

    .line 1
    new-instance v0, Ll/clp0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/clp0;-><init>(Ll/dum;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/ckn0;

    .line 12
    .line 13
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ll/ckn0;-><init>(Ll/dum;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 19
    .line 20
    .line 21
    invoke-super {p0}, Ll/l6t;->T()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceNewGiftWallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceNewGiftWallEvent;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceNewGiftWallEvent;->showMainPage()Ll/v3f$d;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/ebo0;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/ebo0;-><init>(Ll/ibo0;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final synthetic W3(Ll/bco0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/xbo0;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast v0, Ll/xbo0;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v0, p1, Ll/bco0;->b:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Ll/ibo0;->k:Ljava/lang/String;

    .line 21
    .line 22
    iget-object p1, p1, Ll/bco0;->a:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/ibo0;->b4(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p0, Ll/xbo0;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic X3(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3Tab;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/xbo0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xbo0;->m0(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3Tab;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic Y3(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3MainDetail;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/xbo0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xbo0;->j0(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3MainDetail;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic Z3(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3Tab;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/xbo0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/xbo0;->l0(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3Tab;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public a4(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/zbo0;->a(Ljava/lang/String;)Lrx/c;

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
    new-instance v0, Ll/gbo0;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/gbo0;-><init>(Ll/ibo0;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public b4(Ljava/lang/String;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/ibo0;->j:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Ll/zbo0;->b(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance v0, Ll/fbo0;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/fbo0;-><init>(Ll/ibo0;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public c4(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ibo0;->j:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0, p1, p2}, Ll/zbo0;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance p2, Ll/hbo0;

    .line 12
    .line 13
    invoke-direct {p2, p0}, Ll/hbo0;-><init>(Ll/ibo0;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 21
    .line 22
    .line 23
    return-void
.end method
