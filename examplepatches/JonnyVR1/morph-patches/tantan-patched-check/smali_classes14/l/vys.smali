.class public Ll/vys;
.super Ll/dvs;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dvs<",
        "Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/teenmode/LiveTeenModeViewModel;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/ner;Ll/nus;Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/teenmode/LiveTeenModeViewModel;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/dvs;-><init>(Ll/ner;Ll/nus;)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    invoke-virtual {p0, p3}, Ll/l6t;->C(Ll/iam;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic P2(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1, p0}, Ll/ppi0;->C(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic Q2(Landroid/view/ViewGroup;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public R2(Landroid/view/ViewGroup;Landroid/view/View;Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    new-instance v0, Ll/tys;

    .line 2
    .line 3
    invoke-direct {v0, p3}, Ll/tys;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-virtual {p2}, Ll/ppi0;->x()Z

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    invoke-static {p1, p2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-virtual {p2}, Ll/ppi0;->y()Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p0, p2}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-virtual {p0, p2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    new-instance p2, Ll/uys;

    .line 41
    .line 42
    invoke-direct {p2, p1}, Ll/uys;-><init>(Landroid/view/ViewGroup;)V

    .line 43
    .line 44
    .line 45
    invoke-static {p2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public T()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    move-object v1, v0

    .line 7
    check-cast v1, Landroid/view/ViewGroup;

    .line 8
    .line 9
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/teenmode/LiveTeenModeViewModel;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/teenmode/LiveTeenModeViewModel;->a:Lv/VButton;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {p0, v1, v0, v2}, Ll/vys;->R2(Landroid/view/ViewGroup;Landroid/view/View;Lcom/p1/mobile/android/app/Act;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
