.class public Ll/a9k;
.super Ll/y8s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/y8s<",
        "Ll/rwn0;",
        "Ll/c9k;",
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
            "Ll/rwn0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/y8s;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/c9k;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/c9k;-><init>(Ll/a9k;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic S3(Ll/a9k;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/a9k;->U3()V

    return-void
.end method

.method public static synthetic T3(Ll/a9k;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a9k;->V3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;)V

    return-void
.end method


# virtual methods
.method public final synthetic U3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/c9k;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final V3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/c9k;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/c9k;->I(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    new-instance v0, Ll/z8k;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Ll/z8k;-><init>(Ll/a9k;)V

    .line 15
    .line 16
    .line 17
    const-wide/16 v1, 0x1388

    .line 18
    .line 19
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 20
    .line 21
    .line 22
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
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/aj1;->l()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/y8k;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/y8k;-><init>(Ll/a9k;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method
