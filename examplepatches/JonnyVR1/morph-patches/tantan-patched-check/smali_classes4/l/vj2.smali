.class public abstract Ll/vj2;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ll/wj2<",
        "*>;>",
        "Ll/ar2<",
        "TV;>;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/pzi0;->o()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/Converter;->dateToApiTimeString(J)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {p1}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Ll/vj2;->a:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic e0(Ll/vj2;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vj2;->t0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic f0(Ll/vj2;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vj2;->x0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic g0(Ll/vj2;Lcom/p1/mobile/putong/core/data/Greeting;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vj2;->y0(Lcom/p1/mobile/putong/core/data/Greeting;)V

    return-void
.end method

.method public static synthetic h0(Ll/vj2;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vj2;->u0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic i0(Ll/vj2;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vj2;->q0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic j0(Ll/vj2;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vj2;->r0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic k0(Ll/vj2;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vj2;->s0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic l0(Ll/vj2;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/vj2;->p0(Landroid/os/Bundle;)V

    return-void
.end method

.method private synthetic p0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/wj2;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/wj2;->r()V

    .line 6
    .line 7
    .line 8
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/j;->R:Ll/jxd0;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Ljava/lang/Boolean;

    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-nez p1, :cond_0

    .line 25
    .line 26
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 27
    .line 28
    check-cast p0, Ll/wj2;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/wj2;->i()V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method private synthetic q0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/wj2;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Ll/wj2;->f(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic r0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/wj2;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Ll/wj2;->f(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private synthetic s0(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/vj2;->z0()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private synthetic u0(Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/wj2;

    .line 4
    .line 5
    iget-object p0, p0, Ll/wj2;->a:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->a2()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/j;->h5()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/j;->i5()V

    .line 26
    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public abstract A0(Z)V
.end method

.method public abstract C0()V
.end method

.method public a0()V
    .locals 3

    .line 1
    new-instance v0, Ll/nj2;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/nj2;-><init>(Ll/vj2;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/j;->n5()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/oj2;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/oj2;-><init>(Ll/vj2;)V

    .line 24
    .line 25
    .line 26
    new-instance v2, Ll/pj2;

    .line 27
    .line 28
    invoke-direct {v2, p0}, Ll/pj2;-><init>(Ll/vj2;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/qj2;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/qj2;-><init>(Ll/vj2;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 57
    .line 58
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/j;->q0:Lrx/subjects/b;

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    new-instance v1, Ll/rj2;

    .line 65
    .line 66
    invoke-direct {v1, p0}, Ll/rj2;-><init>(Ll/vj2;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 77
    .line 78
    check-cast v0, Ll/wj2;

    .line 79
    .line 80
    iget-object v0, v0, Ll/wj2;->a:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 81
    .line 82
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->a2()Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_0

    .line 87
    .line 88
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 89
    .line 90
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 91
    .line 92
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/j;->z6()Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    goto :goto_0

    .line 97
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 98
    .line 99
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 100
    .line 101
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/j;->C6()Lrx/c;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    :goto_0
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    new-instance v1, Ll/sj2;

    .line 110
    .line 111
    invoke-direct {v1, p0}, Ll/sj2;-><init>(Ll/vj2;)V

    .line 112
    .line 113
    .line 114
    new-instance v2, Ll/tj2;

    .line 115
    .line 116
    invoke-direct {v2, p0}, Ll/tj2;-><init>(Ll/vj2;)V

    .line 117
    .line 118
    .line 119
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 127
    .line 128
    check-cast v0, Ll/wj2;

    .line 129
    .line 130
    iget-object v0, v0, Ll/wj2;->a:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 131
    .line 132
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->a2()Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-eqz v0, :cond_1

    .line 137
    .line 138
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 139
    .line 140
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 141
    .line 142
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/j;->o0:Lrx/subjects/b;

    .line 143
    .line 144
    goto :goto_1

    .line 145
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 146
    .line 147
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 148
    .line 149
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/j;->n0:Lrx/subjects/b;

    .line 150
    .line 151
    :goto_1
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    new-instance v1, Ll/uj2;

    .line 156
    .line 157
    invoke-direct {v1, p0}, Ll/uj2;-><init>(Ll/vj2;)V

    .line 158
    .line 159
    .line 160
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 165
    .line 166
    .line 167
    const/4 v0, 0x1

    .line 168
    invoke-virtual {p0, v0}, Ll/vj2;->A0(Z)V

    .line 169
    .line 170
    .line 171
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public m0()V
    .locals 0

    .line 1
    return-void
.end method

.method public n0(Ljava/util/List;Ljava/util/List;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Greeting;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;)",
            "Ljava/util/List<",
            "Ll/fzq;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    goto/16 :goto_5

    .line 13
    .line 14
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_c

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/p1/mobile/putong/core/data/Greeting;

    .line 29
    .line 30
    new-instance v1, Ll/fzq;

    .line 31
    .line 32
    invoke-direct {v1}, Ll/fzq;-><init>()V

    .line 33
    .line 34
    .line 35
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ll/fzq;->x(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ll/fzq;->O(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 46
    .line 47
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 48
    .line 49
    iget-object v3, v0, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v2, v3}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-eqz v3, :cond_4

    .line 60
    .line 61
    invoke-static {v2}, Ll/ux6;->b(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    invoke-virtual {v1, v3}, Ll/fzq;->I(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    iget-wide v3, v0, Lcom/p1/mobile/putong/core/data/Greeting;->latestTime:D

    .line 77
    .line 78
    invoke-virtual {v1, v3, v4}, Ll/fzq;->L(D)V

    .line 79
    .line 80
    .line 81
    iget-object v3, v2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v1, v3}, Ll/fzq;->P(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    iget-object v3, v2, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 87
    .line 88
    invoke-virtual {v1, v3}, Ll/fzq;->Q(Lcom/p1/mobile/putong/data/Gender;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isIdAndPicBothVerified()Z

    .line 92
    .line 93
    .line 94
    move-result v3

    .line 95
    invoke-virtual {v1, v3}, Ll/fzq;->y(Z)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    invoke-virtual {v1, v3}, Ll/fzq;->F(Z)V

    .line 103
    .line 104
    .line 105
    iget-object v3, v2, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 106
    .line 107
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    invoke-virtual {v1, v3}, Ll/fzq;->N(I)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isHideIconFromSVipWithMe()Z

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    const/4 v4, 0x0

    .line 119
    const/4 v5, 0x1

    .line 120
    if-nez v3, :cond_1

    .line 121
    .line 122
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isODiamond()Z

    .line 123
    .line 124
    .line 125
    move-result v3

    .line 126
    if-eqz v3, :cond_1

    .line 127
    .line 128
    move v3, v5

    .line 129
    goto :goto_1

    .line 130
    :cond_1
    move v3, v4

    .line 131
    :goto_1
    invoke-virtual {v1, v3}, Ll/fzq;->C(Z)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isHideIconFromSVipWithMe()Z

    .line 135
    .line 136
    .line 137
    move-result v3

    .line 138
    if-nez v3, :cond_2

    .line 139
    .line 140
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isPlatinum()Z

    .line 141
    .line 142
    .line 143
    move-result v3

    .line 144
    if-eqz v3, :cond_2

    .line 145
    .line 146
    move v3, v5

    .line 147
    goto :goto_2

    .line 148
    :cond_2
    move v3, v4

    .line 149
    :goto_2
    invoke-virtual {v1, v3}, Ll/fzq;->H(Z)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isHideIconFromSVipWithMe()Z

    .line 153
    .line 154
    .line 155
    move-result v3

    .line 156
    if-nez v3, :cond_3

    .line 157
    .line 158
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isSupremePartner()Z

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    if-eqz v2, :cond_3

    .line 163
    .line 164
    move v4, v5

    .line 165
    :cond_3
    invoke-virtual {v1, v4}, Ll/fzq;->K(Z)V

    .line 166
    .line 167
    .line 168
    :cond_4
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/Greeting;->status:Ljava/lang/String;

    .line 169
    .line 170
    invoke-virtual {v1, v2}, Ll/fzq;->J(Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {v1, v0}, Ll/fzq;->w(Lcom/p1/mobile/putong/core/data/Greeting;)V

    .line 174
    .line 175
    .line 176
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/Greeting;->messages:Lcom/p1/mobile/putong/core/data/GreetingMessages;

    .line 177
    .line 178
    iget v2, v2, Lcom/p1/mobile/putong/core/data/GreetingMessages;->unread:I

    .line 179
    .line 180
    invoke-virtual {v1, v2}, Ll/fzq;->M(I)V

    .line 181
    .line 182
    .line 183
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 184
    .line 185
    .line 186
    move-result-object v2

    .line 187
    :cond_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 188
    .line 189
    .line 190
    move-result v3

    .line 191
    if-eqz v3, :cond_a

    .line 192
    .line 193
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    move-result-object v3

    .line 197
    check-cast v3, Lcom/p1/mobile/putong/core/data/Message;

    .line 198
    .line 199
    iget-object v4, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 200
    .line 201
    iget-object v5, v0, Lcom/p1/mobile/putong/core/data/Greeting;->messages:Lcom/p1/mobile/putong/core/data/GreetingMessages;

    .line 202
    .line 203
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/GreetingMessages;->latestId:Ljava/lang/String;

    .line 204
    .line 205
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    move-result v4

    .line 209
    if-eqz v4, :cond_5

    .line 210
    .line 211
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 212
    .line 213
    .line 214
    move-result-object v2

    .line 215
    const-string v4, "chat_gift"

    .line 216
    .line 217
    invoke-static {v4}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 218
    .line 219
    .line 220
    move-result-object v4

    .line 221
    if-ne v2, v4, :cond_6

    .line 222
    .line 223
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 224
    .line 225
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 226
    .line 227
    .line 228
    move-result-object v2

    .line 229
    invoke-interface {v2, v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Ac(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/CharSequence;

    .line 230
    .line 231
    .line 232
    move-result-object v2

    .line 233
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v2

    .line 237
    invoke-virtual {v1, v2}, Ll/fzq;->B(Ljava/lang/String;)V

    .line 238
    .line 239
    .line 240
    goto :goto_4

    .line 241
    :cond_6
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 242
    .line 243
    .line 244
    move-result-object v2

    .line 245
    const-string v4, "picture"

    .line 246
    .line 247
    invoke-static {v4}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 248
    .line 249
    .line 250
    move-result-object v4

    .line 251
    if-ne v2, v4, :cond_7

    .line 252
    .line 253
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 254
    .line 255
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 256
    .line 257
    .line 258
    move-result-object v2

    .line 259
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->q4:I

    .line 260
    .line 261
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v2

    .line 265
    invoke-virtual {v1, v2}, Ll/fzq;->B(Ljava/lang/String;)V

    .line 266
    .line 267
    .line 268
    goto :goto_4

    .line 269
    :cond_7
    iget-object v2, v3, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 270
    .line 271
    if-eqz v2, :cond_9

    .line 272
    .line 273
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 274
    .line 275
    .line 276
    move-result v2

    .line 277
    if-nez v2, :cond_8

    .line 278
    .line 279
    goto :goto_3

    .line 280
    :cond_8
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 281
    .line 282
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 283
    .line 284
    .line 285
    move-result-object v2

    .line 286
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->K4:I

    .line 287
    .line 288
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object v2

    .line 292
    invoke-virtual {v1, v2}, Ll/fzq;->B(Ljava/lang/String;)V

    .line 293
    .line 294
    .line 295
    goto :goto_4

    .line 296
    :cond_9
    :goto_3
    iget-object v2, v3, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 297
    .line 298
    invoke-virtual {v1, v2}, Ll/fzq;->B(Ljava/lang/String;)V

    .line 299
    .line 300
    .line 301
    :cond_a
    :goto_4
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 302
    .line 303
    iget-object v2, v2, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 304
    .line 305
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 306
    .line 307
    .line 308
    move-result v2

    .line 309
    if-nez v2, :cond_b

    .line 310
    .line 311
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 312
    .line 313
    .line 314
    move-result-object v2

    .line 315
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 316
    .line 317
    iget-object v0, v0, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 318
    .line 319
    sget-object v3, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 320
    .line 321
    invoke-interface {v2, v0, v3}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Mh(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;

    .line 322
    .line 323
    .line 324
    move-result-object v0

    .line 325
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 326
    .line 327
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 328
    .line 329
    .line 330
    move-result v2

    .line 331
    if-eqz v2, :cond_b

    .line 332
    .line 333
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 334
    .line 335
    invoke-virtual {v1, v2}, Ll/fzq;->z(Ljava/lang/String;)V

    .line 336
    .line 337
    .line 338
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 339
    .line 340
    invoke-virtual {v1, v0}, Ll/fzq;->A(Ljava/util/List;)V

    .line 341
    .line 342
    .line 343
    :cond_b
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 344
    .line 345
    .line 346
    goto/16 :goto_0

    .line 347
    .line 348
    :cond_c
    :goto_5
    return-object p0
.end method

.method public o0(Ll/vg60;Ljava/util/List;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/Greeting;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;)",
            "Ljava/util/List<",
            "Ll/fzq;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/vj2;->n0(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic t0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/vj2;->z0()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/vj2;->m0()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/vj2;->z0()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic x0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/wj2;

    .line 4
    .line 5
    iget-object p0, p0, Ll/wj2;->a:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;->a2()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/j;->h5()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/j;->i5()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic y0(Lcom/p1/mobile/putong/core/data/Greeting;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/wj2;

    .line 4
    .line 5
    iget-object v0, v0, Ll/wj2;->d:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast v0, Ll/wj2;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/wj2;->b()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const/4 v1, 0x0

    .line 22
    move v2, v1

    .line 23
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-ge v2, v3, :cond_1

    .line 28
    .line 29
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    check-cast v3, Ll/fzq;

    .line 34
    .line 35
    invoke-virtual {v3}, Ll/fzq;->f()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    iget-object v5, p1, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    if-eqz v4, :cond_0

    .line 46
    .line 47
    invoke-virtual {v3, v1}, Ll/fzq;->M(I)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 51
    .line 52
    check-cast p0, Ll/wj2;

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/wj2;->d()V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    return-void
.end method

.method public abstract z0()V
.end method
