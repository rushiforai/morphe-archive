.class public Ll/z8t;
.super Ll/dvs;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dvs<",
        "Ll/b9t;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/ner;Ll/nus;Lv/navigationbar/VNavigationBar;Landroid/view/View;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2}, Ll/dvs;-><init>(Ll/ner;Ll/nus;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/b9t;

    .line 5
    .line 6
    invoke-direct {v0, p3, p4, p5}, Ll/b9t;-><init>(Lv/navigationbar/VNavigationBar;Landroid/view/View;Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 12
    .line 13
    .line 14
    new-instance p3, Ll/r6u;

    .line 15
    .line 16
    iget-object p4, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast p4, Ll/b9t;

    .line 19
    .line 20
    iget-object p4, p4, Ll/b9t;->b:Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonViewModel;

    .line 21
    .line 22
    invoke-direct {p3, p1, p2, p4}, Ll/r6u;-><init>(Ll/ner;Ll/nus;Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonViewModel;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic P2(Ll/z8t;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/z8t;->S2(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic Q2(Ll/z8t;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/z8t;->U2(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic R2(Ll/z8t;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/z8t;->T2(Ljava/lang/Boolean;)V

    return-void
.end method

.method private synthetic S2(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/b9t;

    .line 4
    .line 5
    const-string v0, "square-curated"

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0, p1}, Ll/b9t;->e(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private synthetic T2(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/b9t;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/b9t;->f(Ljava/lang/Boolean;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic U2(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/b9t;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/b9t;->d(Ljava/lang/Boolean;)V

    .line 6
    .line 7
    .line 8
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
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomePageEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;->tabSelected()Ll/v3f$d;

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
    new-instance v1, Ll/w8t;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/w8t;-><init>(Ll/z8t;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v0, v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomeMenuEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;->onMenuDialogShow()Ll/v3f$d;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lrx/c;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/x8t;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/x8t;-><init>(Ll/z8t;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0}, Ll/ppi0;->y()Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    new-instance v1, Ll/y8t;

    .line 81
    .line 82
    invoke-direct {v1, p0}, Ll/y8t;-><init>(Ll/z8t;)V

    .line 83
    .line 84
    .line 85
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 90
    .line 91
    .line 92
    return-void
.end method
