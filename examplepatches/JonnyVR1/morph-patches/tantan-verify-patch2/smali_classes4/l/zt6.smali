.class public Ll/zt6;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;

.field public b:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/zt6;->b:Lrx/subjects/b;

    .line 9
    .line 10
    check-cast p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;

    .line 11
    .line 12
    iput-object p1, p0, Ll/zt6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic A0(Ll/zt6;Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zt6;->P0(Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;)V

    return-void
.end method

.method private synthetic E0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/util/DebugUtil;->Yj(Lcom/p1/mobile/android/app/Act;Z)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/util/DebugUtil;->Yj(Lcom/p1/mobile/android/app/Act;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private synthetic F0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/util/DebugUtil;->Yj(Lcom/p1/mobile/android/app/Act;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic G0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/util/DebugUtil;->Yj(Lcom/p1/mobile/android/app/Act;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic Q0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zt6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->b6()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic e0(Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {}, Ll/ji30;->h()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 6
    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static synthetic f0(Ll/zt6;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/zt6;->F0()V

    return-void
.end method

.method public static synthetic g0()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->Ae()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic h0()V
    .locals 1

    .line 1
    invoke-static {}, Ll/fdw;->e()Ll/fdw;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/fdw;->c()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic i0(Ll/zt6;Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zt6;->O0(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    return-void
.end method

.method public static synthetic j0(Ll/zt6;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/zt6;->Q0()V

    return-void
.end method

.method public static synthetic k0(Ll/zt6;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zt6;->L0()V

    return-void
.end method

.method public static synthetic l0(Ljava/lang/Boolean;Ljava/lang/Boolean;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic m0(Ll/zt6;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/zt6;->G0()V

    return-void
.end method

.method public static synthetic n0()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic o0(Ll/zt6;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zt6;->I0()V

    return-void
.end method

.method public static synthetic p0(Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;Ll/uxj0;)Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic q0(Ll/zt6;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zt6;->J0()V

    return-void
.end method

.method public static synthetic r0(Lcom/p1/mobile/putong/newui/main/base/TabName;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Ll/fdw;->e()Ll/fdw;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/fdw;->h()Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    xor-int/lit8 p0, p0, 0x1

    .line 14
    .line 15
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static synthetic s0(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic t0(Ll/zt6;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zt6;->N0()V

    return-void
.end method

.method public static synthetic u0(Ll/zt6;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zt6;->H0()V

    return-void
.end method

.method public static synthetic x0(Ll/zt6;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zt6;->R0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic y0(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic z0(Ll/zt6;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/zt6;->E0()V

    return-void
.end method


# virtual methods
.method public C0(Ljava/util/Collection;)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "+",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ll/x20;",
            ">;>;)",
            "Ljava/util/ArrayList<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ll/x20;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ll/pf60;

    .line 7
    .line 8
    new-instance v1, Ll/tt6;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/tt6;-><init>(Ll/zt6;)V

    .line 11
    .line 12
    .line 13
    const-string v2, "\u914d\u5bf9&\u6d88\u606f\u5217\u8868LiveStateDebugState"

    .line 14
    .line 15
    invoke-direct {p1, v2, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    new-instance p1, Ll/pf60;

    .line 22
    .line 23
    new-instance v1, Ll/ut6;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/ut6;-><init>(Ll/zt6;)V

    .line 26
    .line 27
    .line 28
    const-string v2, "\u914d\u5bf9\u5217\u8868LiveStateDebugState"

    .line 29
    .line 30
    invoke-direct {p1, v2, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    new-instance p1, Ll/pf60;

    .line 37
    .line 38
    new-instance v1, Ll/vt6;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/vt6;-><init>(Ll/zt6;)V

    .line 41
    .line 42
    .line 43
    const-string v2, "\u6d88\u606f\u5217\u8868LiveStateDebugState"

    .line 44
    .line 45
    invoke-direct {p1, v2, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-static {p1, p0}, Ll/dg6;->t(Lcom/p1/mobile/android/app/Act;Ll/zt6;)Ljava/util/ArrayList;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 60
    .line 61
    .line 62
    new-instance p1, Ll/wt6;

    .line 63
    .line 64
    invoke-direct {p1, p0}, Ll/wt6;-><init>(Ll/zt6;)V

    .line 65
    .line 66
    .line 67
    const-string v1, "\u60c5\u4e66\u5165\u53e3\u6c14\u6ce1"

    .line 68
    .line 69
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    new-instance p1, Ll/xt6;

    .line 77
    .line 78
    invoke-direct {p1, p0}, Ll/xt6;-><init>(Ll/zt6;)V

    .line 79
    .line 80
    .line 81
    const-string v1, "\u60c5\u4e66\u63a5\u53d7\u52a8\u753b"

    .line 82
    .line 83
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    new-instance p1, Ll/yt6;

    .line 91
    .line 92
    invoke-direct {p1, p0}, Ll/yt6;-><init>(Ll/zt6;)V

    .line 93
    .line 94
    .line 95
    const-string p0, "\u60c5\u4e66\u5f15\u5bfc"

    .line 96
    .line 97
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    new-instance p0, Ll/ft6;

    .line 105
    .line 106
    invoke-direct {p0}, Ll/ft6;-><init>()V

    .line 107
    .line 108
    .line 109
    const-string p1, "\u60c5\u4e66\u6e05\u9664\u6570\u636e"

    .line 110
    .line 111
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    return-object v0
.end method

.method public final D0()V
    .locals 3

    .line 1
    invoke-static {}, Ll/ji30;->k()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/lt6;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/lt6;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->takeWhile(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/mt6;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/mt6;-><init>(Ll/zt6;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 37
    .line 38
    iget-object v0, v0, Ll/dkb;->U1:Lrx/subjects/a;

    .line 39
    .line 40
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object v1, p0, Ll/zt6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;

    .line 45
    .line 46
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->Z:Lrx/subjects/a;

    .line 47
    .line 48
    new-instance v2, Ll/nt6;

    .line 49
    .line 50
    invoke-direct {v2}, Ll/nt6;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-static {v0, v1, v2}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ll/ot6;

    .line 58
    .line 59
    invoke-direct {v1}, Ll/ot6;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Ll/qt6;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Ll/qt6;-><init>(Ll/zt6;)V

    .line 73
    .line 74
    .line 75
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public final synthetic H0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zt6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->k6()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic I0()V
    .locals 4

    .line 1
    new-instance v0, Ll/p900;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/p900;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string v2, "-1"

    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    invoke-static {p0, v2, v3, v3}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->k2(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v1, p0, v0}, Lcom/p1/mobile/android/app/Act;->startActivityWithCustomTransition(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic J0()V
    .locals 3

    .line 1
    new-instance v0, Ll/fcw;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-direct {v0, v1, v2}, Ll/fcw;-><init>(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;)V

    .line 16
    .line 17
    .line 18
    new-instance v1, Ll/gt6;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/gt6;-><init>(Ll/zt6;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/fcw;->R(Ll/x20;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ll/fcw;->show()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic L0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zt6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->A5()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic N0()V
    .locals 3

    .line 1
    new-instance v0, Ll/cdw;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    new-instance v2, Ll/jt6;

    .line 8
    .line 9
    invoke-direct {v2, p0}, Ll/jt6;-><init>(Ll/zt6;)V

    .line 10
    .line 11
    .line 12
    new-instance p0, Ll/kt6;

    .line 13
    .line 14
    invoke-direct {p0}, Ll/kt6;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-direct {v0, v1, v2, p0}, Ll/cdw;-><init>(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ll/cdw;->show()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic O0(Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/dkb;->da()Lrx/c;

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object p0, p0, Ll/zt6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->E5()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic P0(Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;)V
    .locals 3

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->display:Z

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    iget-object v0, p0, Ll/zt6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->X:Lcom/p1/mobile/putong/core/newui/messages/ConversationRightToolBar;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->i6(Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;

    .line 25
    .line 26
    invoke-static {}, Ll/fdw;->e()Ll/fdw;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1, p1}, Ll/fdw;->l(Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->h6(Z)V

    .line 35
    .line 36
    .line 37
    invoke-static {}, Ll/fdw;->e()Ll/fdw;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v0, v0, Ll/fdw;->e:Ll/jxd0;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Ljava/lang/Boolean;

    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_1

    .line 54
    .line 55
    iget-object p0, p0, Ll/zt6;->b:Lrx/subjects/b;

    .line 56
    .line 57
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    invoke-static {}, Ll/fdw;->e()Ll/fdw;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0, p1}, Ll/fdw;->m(Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_2

    .line 72
    .line 73
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 74
    .line 75
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;

    .line 76
    .line 77
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->j6(Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;)V

    .line 78
    .line 79
    .line 80
    invoke-static {}, Ll/fdw;->e()Ll/fdw;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    iget-object p1, p1, Ll/fdw;->a:Ll/byd0;

    .line 85
    .line 86
    invoke-static {}, Ll/pzi0;->o()J

    .line 87
    .line 88
    .line 89
    move-result-wide v0

    .line 90
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {p1, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    iget-object p0, p0, Ll/zt6;->b:Lrx/subjects/b;

    .line 98
    .line 99
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 100
    .line 101
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_2
    invoke-static {}, Ll/fdw;->e()Ll/fdw;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {v0, p1}, Ll/fdw;->n(Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;)Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eqz v0, :cond_3

    .line 114
    .line 115
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 116
    .line 117
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;

    .line 118
    .line 119
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->k6()V

    .line 120
    .line 121
    .line 122
    invoke-static {}, Ll/fdw;->e()Ll/fdw;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    iget-object v0, v0, Ll/fdw;->b:Ll/jxd0;

    .line 127
    .line 128
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 129
    .line 130
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    invoke-static {}, Ll/fdw;->e()Ll/fdw;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    iget-object v0, v0, Ll/fdw;->d:Ll/jxd0;

    .line 138
    .line 139
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 143
    .line 144
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;

    .line 145
    .line 146
    invoke-static {}, Ll/fdw;->e()Ll/fdw;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    invoke-virtual {v2, p1}, Ll/fdw;->l(Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;)Z

    .line 151
    .line 152
    .line 153
    move-result p1

    .line 154
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;->h6(Z)V

    .line 155
    .line 156
    .line 157
    iget-object p0, p0, Ll/zt6;->b:Lrx/subjects/b;

    .line 158
    .line 159
    invoke-virtual {p0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 160
    .line 161
    .line 162
    return-void

    .line 163
    :cond_3
    iget-object p0, p0, Ll/zt6;->b:Lrx/subjects/b;

    .line 164
    .line 165
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 166
    .line 167
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 168
    .line 169
    .line 170
    return-void

    .line 171
    :cond_4
    iget-object p0, p0, Ll/zt6;->b:Lrx/subjects/b;

    .line 172
    .line 173
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 174
    .line 175
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 176
    .line 177
    .line 178
    return-void
.end method

.method public final synthetic R0(Ll/uxj0;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/zt6;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationsTabFrag;

    .line 2
    .line 3
    new-instance v0, Ll/ht6;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/ht6;-><init>(Ll/zt6;)V

    .line 6
    .line 7
    .line 8
    const-wide/16 v1, 0x1f4

    .line 9
    .line 10
    invoke-static {p1, v0, v1, v2}, Ll/l51;->I(Lcom/p1/mobile/android/app/Frag;Ljava/lang/Runnable;J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public S0(Z)V
    .locals 3

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->B5()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/b8d0;->b()Ll/b8d0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 v0, 0x1

    .line 18
    iput-boolean v0, p0, Ll/b8d0;->b:Z

    .line 19
    .line 20
    :cond_0
    invoke-static {}, Ll/b8d0;->b()Ll/b8d0;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    iget-object p0, p0, Ll/b8d0;->a:Lrx/subjects/a;

    .line 25
    .line 26
    xor-int/lit8 v0, p1, 0x1

    .line 27
    .line 28
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    invoke-static {}, Ll/gra;->t1()Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-nez p0, :cond_2

    .line 40
    .line 41
    sget-object p0, Ll/gra;->a:Ll/jxd0;

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    check-cast p0, Ljava/lang/Boolean;

    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-eqz p0, :cond_2

    .line 54
    .line 55
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 58
    .line 59
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/g;->Bh(Ljava/lang/Boolean;)V

    .line 62
    .line 63
    .line 64
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 65
    .line 66
    new-instance v0, Ll/it6;

    .line 67
    .line 68
    invoke-direct {v0}, Ll/it6;-><init>()V

    .line 69
    .line 70
    .line 71
    const-wide/16 v1, 0x64

    .line 72
    .line 73
    invoke-static {p0, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 74
    .line 75
    .line 76
    sget-object p0, Ll/gra;->a:Ll/jxd0;

    .line 77
    .line 78
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 79
    .line 80
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    :cond_2
    if-nez p1, :cond_3

    .line 84
    .line 85
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 86
    .line 87
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 88
    .line 89
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 90
    .line 91
    .line 92
    :cond_3
    return-void
.end method

.method public U0()V
    .locals 0

    .line 1
    return-void
.end method

.method public Z()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/h39;->N()Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/dkb;->da()Lrx/c;

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public a0()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/h39;->N()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/zt6;->D0()V

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-static {}, Ll/gra;->F0()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->og()Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/et6;

    .line 28
    .line 29
    invoke-direct {v1}, Ll/et6;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v1, p0, Ll/zt6;->b:Lrx/subjects/b;

    .line 37
    .line 38
    new-instance v2, Ll/pt6;

    .line 39
    .line 40
    invoke-direct {v2}, Ll/pt6;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    new-instance v2, Ll/rt6;

    .line 48
    .line 49
    invoke-direct {v2}, Ll/rt6;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v1, Ll/st6;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/st6;-><init>(Ll/zt6;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 70
    .line 71
    .line 72
    :cond_1
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method
