.class public Ll/zdu;
.super Ll/y8s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/y8s<",
        "Ll/oo2;",
        "Ll/xdu;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0
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
    new-instance p1, Ll/xdu;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/xdu;-><init>(Ll/zdu;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic S3(Ll/zdu;Ll/vdu;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zdu;->T3(Ll/vdu;)V

    return-void
.end method


# virtual methods
.method public T()V
    .locals 2

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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveTipEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveTipEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveTipEvent;->showTip()Ll/v3f$d;

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
    new-instance v1, Ll/ydu;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/ydu;-><init>(Ll/zdu;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final T3(Ll/vdu;)V
    .locals 3

    .line 1
    iget v0, p1, Ll/vdu;->a:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 28
    .line 29
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast p0, Ll/xdu;

    .line 32
    .line 33
    iget-object v2, p1, Ll/vdu;->d:Ljava/lang/String;

    .line 34
    .line 35
    iget-object p1, p1, Ll/vdu;->e:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p0, v0, v1, v2, p1}, Ll/xdu;->I(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    const/4 v1, 0x1

    .line 42
    if-ne v0, v1, :cond_1

    .line 43
    .line 44
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 45
    .line 46
    check-cast p0, Ll/xdu;

    .line 47
    .line 48
    iget-object v0, p1, Ll/vdu;->b:Ljava/lang/String;

    .line 49
    .line 50
    iget-object v1, p1, Ll/vdu;->c:Ljava/lang/String;

    .line 51
    .line 52
    iget-object v2, p1, Ll/vdu;->d:Ljava/lang/String;

    .line 53
    .line 54
    iget-object p1, p1, Ll/vdu;->e:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {p0, v0, v1, v2, p1}, Ll/xdu;->I(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :cond_1
    return-void
.end method
