.class public Ll/o6v;
.super Ll/dvs;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dvs<",
        "Ll/q6v;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/ner;Ll/nus;Lv/VDraweeView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/dvs;-><init>(Ll/ner;Ll/nus;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/q6v;

    .line 5
    .line 6
    invoke-direct {p1, p3}, Ll/q6v;-><init>(Lv/VDraweeView;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic P2(Ll/o6v;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/o6v;->T2(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic Q2(Ll/o6v;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/o6v;->S2(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic R2(Ll/o6v;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/o6v;->V2(Z)V

    return-void
.end method

.method private synthetic S2(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/q6v;

    .line 4
    .line 5
    const-string v0, "tab_voice"

    .line 6
    .line 7
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0, p1}, Ll/q6v;->e(Z)V

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
    check-cast p0, Ll/q6v;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/q6v;->f(Ljava/lang/Boolean;)V

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
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Ll/q6v;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/q6v;->r()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomePageEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;->tabSelected()Ll/v3f$d;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lrx/c;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/l6v;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/l6v;-><init>(Ll/o6v;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Ll/ppi0;->y()Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    new-instance v1, Ll/m6v;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Ll/m6v;-><init>(Ll/o6v;)V

    .line 78
    .line 79
    .line 80
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iget-object v0, v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomeVoiceSelectTopic:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeVoiceSelectTopic;

    .line 92
    .line 93
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeVoiceSelectTopic;->notifySelectRoomSquare()Ll/v3f$d;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    check-cast v0, Lrx/c;

    .line 102
    .line 103
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    new-instance v1, Ll/n6v;

    .line 108
    .line 109
    invoke-direct {v1, p0}, Ll/n6v;-><init>(Ll/o6v;)V

    .line 110
    .line 111
    .line 112
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public U2(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/evo0;->c()V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 5
    .line 6
    invoke-direct {p1}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v0, "top_right"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->t(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->k()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0, p1}, Ll/iqn0;->e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 27
    .line 28
    check-cast p0, Ll/q6v;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/q6v;->c()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final V2(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    check-cast p0, Ll/q6v;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/q6v;->i()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    check-cast p0, Ll/q6v;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/q6v;->c()V

    .line 14
    .line 15
    .line 16
    return-void
.end method
