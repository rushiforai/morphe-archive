.class public Ll/qbn;
.super Ll/mdk;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mdk<",
        "Ll/fzq;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;

.field public final d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/fzq;",
            ">;"
        }
    .end annotation
.end field

.field public final e:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/fzq;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public g:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/mdk;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/qbn;->e:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashSet;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/qbn;->f:Ljava/util/Set;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Ll/qbn;->g:Z

    .line 20
    .line 21
    iput-object p1, p0, Ll/qbn;->c:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;

    .line 22
    .line 23
    new-instance p1, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Ll/qbn;->d:Ljava/util/List;

    .line 29
    .line 30
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;Z)V
    .locals 0

    .line 31
    invoke-direct {p0, p1}, Ll/qbn;-><init>(Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;)V

    .line 32
    iput-boolean p2, p0, Ll/qbn;->g:Z

    return-void
.end method

.method public static synthetic G([Ll/w30;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    aget-object p0, p0, p1

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic H(Ljava/lang/String;Ll/fzq;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/fzq;->p()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic I(Ll/fzq;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/fzq;->b()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->channel:Lcom/p1/mobile/putong/data/Channel;

    .line 6
    .line 7
    const-string v0, "instant_chat"

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/data/Channel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Channel;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    xor-int/lit8 p0, p0, 0x1

    .line 18
    .line 19
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static synthetic J(Ll/fzq;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/fzq;->b()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Greeting;->channel:Lcom/p1/mobile/putong/data/Channel;

    .line 6
    .line 7
    const-string v0, "instant_chat"

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/data/Channel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Channel;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static synthetic K(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic L(Ll/qbn;Ll/fzq;IILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Ll/qbn;->V(Ll/fzq;IILandroid/view/View;)V

    return-void
.end method

.method public static synthetic M(Ll/mdk;Ll/fzq;Ll/uxj0;)V
    .locals 0

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/api/j;->J6()Lrx/c;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Ll/fzq;->p()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Ll/mdk;->F(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic N(Ll/qbn;Ll/fzq;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/qbn;->W(Ll/fzq;Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic O(Ll/qbn;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qbn;->X(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;Ll/mdk;Ll/fzq;[Ll/w30;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/qbn;->S(Lcom/p1/mobile/android/app/Act;Ll/mdk;Ll/fzq;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    aget-object p0, p3, p0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private R(Ljava/util/List;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/fzq;",
            ">;)",
            "Ljava/util/List<",
            "Ll/fzq;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/fzq;

    .line 16
    .line 17
    const-string v1, "default"

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/fzq;->m()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    iget-object v2, p0, Ll/qbn;->e:Ljava/util/HashMap;

    .line 28
    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/fzq;->f()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v2, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    invoke-virtual {v0}, Ll/fzq;->f()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v2, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    new-instance p1, Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/qbn;->e:Ljava/util/HashMap;

    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-eqz v1, :cond_2

    .line 67
    .line 68
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    check-cast v1, Ljava/lang/String;

    .line 73
    .line 74
    iget-object v2, p0, Ll/qbn;->e:Ljava/util/HashMap;

    .line 75
    .line 76
    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    check-cast v1, Ll/fzq;

    .line 81
    .line 82
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_2
    iget-boolean p0, p0, Ll/qbn;->g:Z

    .line 87
    .line 88
    if-eqz p0, :cond_3

    .line 89
    .line 90
    invoke-static {p1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 91
    .line 92
    .line 93
    return-object p1

    .line 94
    :cond_3
    new-instance p0, Ll/lbn;

    .line 95
    .line 96
    invoke-direct {p0}, Ll/lbn;-><init>()V

    .line 97
    .line 98
    .line 99
    invoke-static {p1, p0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    new-instance v0, Ll/mhe;

    .line 104
    .line 105
    invoke-direct {v0}, Ll/mhe;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-static {p0, v0}, Ll/jyb;->I(Ljava/util/List;Ljava/util/Comparator;)V

    .line 109
    .line 110
    .line 111
    new-instance v0, Ll/mbn;

    .line 112
    .line 113
    invoke-direct {v0}, Ll/mbn;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-static {p1, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    new-instance v1, Ll/mhe;

    .line 121
    .line 122
    invoke-direct {v1}, Ll/mhe;-><init>()V

    .line 123
    .line 124
    .line 125
    invoke-static {v0, v1}, Ll/jyb;->I(Ljava/util/List;Ljava/util/Comparator;)V

    .line 126
    .line 127
    .line 128
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 129
    .line 130
    .line 131
    invoke-interface {p1, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 132
    .line 133
    .line 134
    invoke-interface {p1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 135
    .line 136
    .line 137
    return-object p1
.end method

.method private static S(Lcom/p1/mobile/android/app/Act;Ll/mdk;Ll/fzq;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/mdk<",
            "Ll/fzq;",
            ">;",
            "Ll/fzq;",
            ")V"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 4
    .line 5
    invoke-virtual {p2}, Ll/fzq;->p()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p2}, Ll/fzq;->b()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Greeting;->messages:Lcom/p1/mobile/putong/core/data/GreetingMessages;

    .line 14
    .line 15
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/GreetingMessages;->latestId:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/j;->j5(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const/4 v0, 0x1

    .line 26
    invoke-virtual {p0, v0}, Lrx/c;->take(I)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    new-instance v0, Ll/obn;

    .line 31
    .line 32
    invoke-direct {v0, p1, p2}, Ll/obn;-><init>(Ll/mdk;Ll/fzq;)V

    .line 33
    .line 34
    .line 35
    new-instance p1, Ll/pbn;

    .line 36
    .line 37
    invoke-direct {p1}, Ll/pbn;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-static {v0, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method private synthetic V(Ll/fzq;IILandroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qbn;->c:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;

    .line 2
    .line 3
    invoke-static {p0, p1, p2, p3}, Ll/qbn;->Z(Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;Ll/fzq;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic W(Ll/fzq;Landroid/view/View;)Z
    .locals 0

    .line 1
    iget-object p2, p0, Ll/qbn;->c:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;

    .line 2
    .line 3
    invoke-static {p2, p1, p0}, Ll/qbn;->a0(Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;Ll/fzq;Ll/mdk;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static Z(Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;Ll/fzq;II)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/fzq;->b()Lcom/p1/mobile/putong/core/data/Greeting;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    const-string p3, "undefined"

    .line 6
    .line 7
    invoke-static {p0, p2, p3}, Ll/non;->l(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/Greeting;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget p2, Ll/y7c0;->e:I

    .line 11
    .line 12
    sget p3, Ll/y7c0;->d:I

    .line 13
    .line 14
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 15
    .line 16
    .line 17
    const/4 p2, 0x0

    .line 18
    invoke-virtual {p1, p2}, Ll/fzq;->M(I)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;->a2()Ll/k4n;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/k4n;->e()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static a0(Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;Ll/fzq;Ll/mdk;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;",
            "Ll/fzq;",
            "Ll/mdk<",
            "Ll/fzq;",
            ">;)Z"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->d:I

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    new-array v2, v1, [Ll/w30;

    .line 17
    .line 18
    new-instance v3, Ll/w30$b;

    .line 19
    .line 20
    invoke-direct {v3, p0}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    sget v5, Lcom/p1/mobile/putong/core/message/R$string;->a:I

    .line 28
    .line 29
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    invoke-virtual {v3, v4}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    new-instance v5, Ll/ibn;

    .line 38
    .line 39
    invoke-direct {v5, v2}, Ll/ibn;-><init>([Ll/w30;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v4, v5}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    invoke-virtual {v4, v0}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    new-instance v4, Ll/jbn;

    .line 51
    .line 52
    invoke-direct {v4, p0, p2, p1, v2}, Ll/jbn;-><init>(Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;Ll/mdk;Ll/fzq;[Ll/w30;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v4}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v3}, Ll/w30$b;->F()Ll/w30;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const/4 p1, 0x0

    .line 63
    aput-object p0, v2, p1

    .line 64
    .line 65
    invoke-virtual {p0}, Ll/w30;->f()V

    .line 66
    .line 67
    .line 68
    return v1
.end method


# virtual methods
.method public C()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qbn;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/qbn;->d:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    iget-object p0, p0, Ll/qbn;->c:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/16 v1, 0xa

    .line 5
    .line 6
    if-ne p2, v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    sget p2, Ll/qec0;->Y3:I

    .line 13
    .line 14
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    sget p2, Ll/qec0;->N0:I

    .line 24
    .line 25
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public bridge synthetic E(Landroid/view/View;Ljava/lang/Object;Ljava/util/List;II)V
    .locals 0

    .line 1
    check-cast p2, Ll/fzq;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Ll/qbn;->Q(Landroid/view/View;Ll/fzq;Ljava/util/List;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public F(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/qbn;->c:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;

    .line 9
    .line 10
    new-instance v1, Ll/kbn;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1}, Ll/kbn;-><init>(Ll/qbn;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-wide/16 p0, 0x64

    .line 16
    .line 17
    invoke-static {v0, v1, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public Q(Landroid/view/View;Ll/fzq;Ljava/util/List;II)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ll/fzq;",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;II)V"
        }
    .end annotation

    .line 1
    const/16 p3, 0xa

    .line 2
    .line 3
    if-ne p4, p3, :cond_1

    .line 4
    .line 5
    sget p2, Ll/edc0;->X4:I

    .line 6
    .line 7
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lv/VText;

    .line 12
    .line 13
    iget-boolean p2, p0, Ll/qbn;->g:Z

    .line 14
    .line 15
    iget-object p4, p0, Ll/qbn;->c:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;

    .line 16
    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->a4:I

    .line 20
    .line 21
    invoke-virtual {p4, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    sget p2, Lcom/p1/mobile/putong/core/message/R$string;->b4:I

    .line 27
    .line 28
    invoke-virtual {p4, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    :goto_0
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    move-object v2, p0

    .line 36
    goto :goto_1

    .line 37
    :cond_1
    invoke-virtual {p0, p5}, Ll/qbn;->getItemViewType(I)I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    iget-object p4, p0, Ll/qbn;->f:Ljava/util/Set;

    .line 42
    .line 43
    invoke-virtual {p2}, Ll/fzq;->p()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-interface {p4, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p4

    .line 51
    if-nez p4, :cond_2

    .line 52
    .line 53
    iget-object p4, p0, Ll/qbn;->f:Ljava/util/Set;

    .line 54
    .line 55
    invoke-virtual {p2}, Ll/fzq;->p()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-interface {p4, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    :cond_2
    move-object v0, p1

    .line 63
    check-cast v0, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlGreetListItemView;

    .line 64
    .line 65
    iget-object v1, p0, Ll/qbn;->c:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;

    .line 66
    .line 67
    new-instance v5, Ll/gbn;

    .line 68
    .line 69
    invoke-direct {v5, p0, p2, p5, v4}, Ll/gbn;-><init>(Ll/qbn;Ll/fzq;II)V

    .line 70
    .line 71
    .line 72
    new-instance v6, Ll/hbn;

    .line 73
    .line 74
    invoke-direct {v6, p0, p2}, Ll/hbn;-><init>(Ll/qbn;Ll/fzq;)V

    .line 75
    .line 76
    .line 77
    move-object v2, p0

    .line 78
    move-object v3, p2

    .line 79
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlGreetListItemView;->h(Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;Ll/qbn;Ll/fzq;ILandroid/view/View$OnClickListener;Landroid/view/View$OnLongClickListener;)V

    .line 80
    .line 81
    .line 82
    :goto_1
    iget-object p0, v2, Ll/qbn;->d:Ljava/util/List;

    .line 83
    .line 84
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    add-int/lit8 p0, p0, -0x3

    .line 89
    .line 90
    if-lt p5, p0, :cond_3

    .line 91
    .line 92
    iget-object p0, v2, Ll/qbn;->d:Ljava/util/List;

    .line 93
    .line 94
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    if-le p0, p3, :cond_3

    .line 99
    .line 100
    iget-object p0, v2, Ll/qbn;->c:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;

    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;->Z1()Ll/j4n;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-virtual {p0}, Ll/j4n;->t0()V

    .line 107
    .line 108
    .line 109
    :cond_3
    return-void
.end method

.method public T()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/fzq;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qbn;->d:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public U(I)Ll/fzq;
    .locals 2

    .line 1
    new-instance v0, Ll/fzq;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/fzq;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/qbn;->d:Ljava/util/List;

    .line 7
    .line 8
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/qbn;->d:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Ll/fzq;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_0
    return-object v0
.end method

.method public final synthetic X(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qbn;->d:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/nbn;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/nbn;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-ltz p1, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Ll/qbn;->d:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ll/fzq;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    iget-object v1, p0, Ll/qbn;->e:Ljava/util/HashMap;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/fzq;->f()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    :cond_0
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRemoved(I)V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method public Y()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b0(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/fzq;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/zhe;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/zhe;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/jyb;->h(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object v0, p0, Ll/qbn;->d:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/qbn;->d:Ljava/util/List;

    .line 16
    .line 17
    invoke-direct {p0, p1}, Ll/qbn;->R(Ljava/util/List;)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public e(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qbn;->U(I)Ll/fzq;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    .line 1
    int-to-long p0, p1

    .line 2
    return-wide p0
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 1
    iget-object p1, p0, Ll/qbn;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/16 p0, 0xa

    .line 10
    .line 11
    return p0

    .line 12
    :cond_0
    iget-boolean p0, p0, Ll/qbn;->g:Z

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    const/16 p0, 0x1e

    .line 17
    .line 18
    return p0

    .line 19
    :cond_1
    const/16 p0, 0x14

    .line 20
    .line 21
    return p0
.end method
