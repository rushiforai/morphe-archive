.class public Ll/ebt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/k3m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/k3m<",
        "Ll/hbt;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/hbt;

.field public b:F

.field public c:Ll/hti;

.field public d:Ll/kcg0;

.field public e:Ll/kcg0;

.field public f:Ll/kcg0;

.field public g:Ll/jxd0;

.field public h:Ll/pwl;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/ebt;->b:F

    .line 6
    .line 7
    new-instance v0, Ll/ebt$a;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/ebt$a;-><init>(Ll/ebt;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/ebt;->h:Ll/pwl;

    .line 13
    .line 14
    return-void
.end method

.method private D(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ebt;->a:Ll/hbt;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/hbt;->f()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/ebt;->a:Ll/hbt;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/hbt;->d()Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 18
    .line 19
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Fd:I

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->o(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-virtual {v0}, Ll/hbt;->d()Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->n()V

    .line 34
    .line 35
    .line 36
    :goto_0
    iget-object p0, p0, Ll/ebt;->a:Ll/hbt;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/hbt;->d()Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->m(Z)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method private E()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Ll/ebt;->D(Z)V

    .line 3
    .line 4
    .line 5
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 6
    .line 7
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Rj:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/ebt;->F(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic b(Ll/ebt;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ebt;->t(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V

    return-void
.end method

.method public static synthetic c(Ll/ebt;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ebt;->w(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic d(Ll/ebt;Ll/ugd0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ebt;->v(Ll/ugd0;)V

    return-void
.end method

.method public static synthetic e(Ll/ebt;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ebt;->x(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic f(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static bridge synthetic g(Ll/ebt;)Ll/hti;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ebt;->c:Ll/hti;

    return-object p0
.end method

.method public static bridge synthetic h(Ll/ebt;)Ll/jxd0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ebt;->g:Ll/jxd0;

    return-object p0
.end method

.method public static bridge synthetic k(Ll/ebt;)Ll/hbt;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ebt;->a:Ll/hbt;

    return-object p0
.end method

.method public static bridge synthetic l(Ll/ebt;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ebt;->u()V

    return-void
.end method

.method public static bridge synthetic m(Ll/ebt;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ebt;->D(Z)V

    return-void
.end method

.method private y()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Ll/ebt;->D(Z)V

    .line 3
    .line 4
    .line 5
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 6
    .line 7
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->X6:I

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Ll/ebt;->F(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private z()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ebt;->u()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-direct {p0, v0}, Ll/ebt;->D(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public A(F)V
    .locals 2

    .line 1
    iget v0, p0, Ll/ebt;->b:F

    .line 2
    .line 3
    cmpl-float v0, v0, p1

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Ll/ebt;->a:Ll/hbt;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iput p1, p0, Ll/ebt;->b:F

    .line 13
    .line 14
    invoke-static {p1}, Ll/vti;->a(F)[I

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object p0, p0, Ll/ebt;->a:Ll/hbt;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    aget v0, p1, v0

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    aget p1, p1, v1

    .line 25
    .line 26
    invoke-virtual {p0, v0, p1}, Ll/hbt;->k(II)V

    .line 27
    .line 28
    .line 29
    :cond_1
    :goto_0
    return-void
.end method

.method public final B(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->h5(Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/cbt;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/cbt;-><init>(Ll/ebt;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Ll/dbt;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/dbt;-><init>(Ll/ebt;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Ll/ebt;->f:Ll/kcg0;

    .line 24
    .line 25
    return-void
.end method

.method public final F(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ebt;->a:Ll/hbt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/hbt;->d()Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->o(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public n(Ll/hbt;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ebt;->a:Ll/hbt;

    .line 2
    .line 3
    return-void
.end method

.method public o()Ll/eti;
    .locals 1

    .line 1
    new-instance v0, Ll/ebt$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ebt$b;-><init>(Ll/ebt;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public p(Ll/hti;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/hti<",
            "*>;)Z"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ebt;->c:Ll/hti;

    .line 2
    .line 3
    sget-object v0, Ll/htd0;->e:Ll/htd0;

    .line 4
    .line 5
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ll/ifv;

    .line 10
    .line 11
    iget-object v0, v0, Ll/ifv;->t:Ll/jxd0;

    .line 12
    .line 13
    iput-object v0, p0, Ll/ebt;->g:Ll/jxd0;

    .line 14
    .line 15
    iget-object v0, p0, Ll/ebt;->a:Ll/hbt;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/hbt;->f()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const-string v1, "live_float_window"

    .line 22
    .line 23
    const/4 v2, 0x1

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    const-string p0, "float has shown out app"

    .line 27
    .line 28
    invoke-static {v1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return v2

    .line 32
    :cond_0
    invoke-virtual {p1}, Ll/hti;->g()F

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iput v0, p0, Ll/ebt;->b:F

    .line 37
    .line 38
    iget-object v0, p0, Ll/ebt;->a:Ll/hbt;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/hbt;->j()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    const/4 v3, 0x0

    .line 45
    if-nez v0, :cond_1

    .line 46
    .line 47
    const-string p0, "show float fail out app"

    .line 48
    .line 49
    invoke-static {v1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return v3

    .line 53
    :cond_1
    iget-object v0, p0, Ll/ebt;->a:Ll/hbt;

    .line 54
    .line 55
    invoke-virtual {v0}, Ll/hbt;->d()Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->p(Z)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/ebt;->a:Ll/hbt;

    .line 63
    .line 64
    invoke-virtual {v0}, Ll/hbt;->d()Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iget-object v3, p0, Ll/ebt;->g:Ll/jxd0;

    .line 69
    .line 70
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    check-cast v3, Ljava/lang/Boolean;

    .line 75
    .line 76
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    xor-int/2addr v3, v2

    .line 81
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->setVoiceSelected(Z)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1}, Ll/hti;->d()Ll/qwl;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-interface {v0, v2}, Ll/qwl;->g(Z)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1}, Ll/hti;->d()Ll/qwl;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    iget-object v3, p0, Ll/ebt;->a:Ll/hbt;

    .line 96
    .line 97
    invoke-virtual {v3}, Ll/hbt;->d()Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    iget-object v3, v3, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->a:Landroid/widget/FrameLayout;

    .line 102
    .line 103
    invoke-interface {v0, v3}, Ll/qwl;->d(Landroid/widget/FrameLayout;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p1}, Ll/hti;->d()Ll/qwl;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iget-object v3, p0, Ll/ebt;->h:Ll/pwl;

    .line 111
    .line 112
    invoke-interface {v0, v3}, Ll/qwl;->c(Ll/pwl;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p1}, Ll/hti;->d()Ll/qwl;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    iget-object v3, p0, Ll/ebt;->g:Ll/jxd0;

    .line 120
    .line 121
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    check-cast v3, Ljava/lang/Boolean;

    .line 126
    .line 127
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 128
    .line 129
    .line 130
    move-result v3

    .line 131
    invoke-interface {v0, v3}, Ll/qwl;->setMute(Z)V

    .line 132
    .line 133
    .line 134
    iget-object v0, p0, Ll/ebt;->a:Ll/hbt;

    .line 135
    .line 136
    invoke-virtual {v0}, Ll/hbt;->i()V

    .line 137
    .line 138
    .line 139
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->front()Lrx/c;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    new-instance v3, Ll/zat;

    .line 144
    .line 145
    invoke-direct {v3}, Ll/zat;-><init>()V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v0, v3}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    new-instance v3, Ll/abt;

    .line 153
    .line 154
    invoke-direct {v3, p0}, Ll/abt;-><init>(Ll/ebt;)V

    .line 155
    .line 156
    .line 157
    invoke-static {v3}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 158
    .line 159
    .line 160
    move-result-object v3

    .line 161
    invoke-virtual {v0, v3}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    iput-object v0, p0, Ll/ebt;->d:Ll/kcg0;

    .line 166
    .line 167
    invoke-virtual {p1}, Ll/hti;->e()Ll/oo2;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    invoke-virtual {p1}, Ll/oo2;->n1()Lrx/c;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    new-instance v0, Ll/bbt;

    .line 176
    .line 177
    invoke-direct {v0, p0}, Ll/bbt;-><init>(Ll/ebt;)V

    .line 178
    .line 179
    .line 180
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    iput-object p1, p0, Ll/ebt;->e:Ll/kcg0;

    .line 189
    .line 190
    const-string p0, "show float success out app"

    .line 191
    .line 192
    invoke-static {v1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    return v2
.end method

.method public q()V
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->globalLifeCycle_()Ljava/util/HashMap;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x0

    .line 14
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    const/4 v3, 0x1

    .line 19
    if-eqz v2, :cond_2

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    if-eqz v4, :cond_0

    .line 36
    .line 37
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    check-cast v4, Lcom/p1/mobile/android/app/Act$r;

    .line 42
    .line 43
    iget-object v4, v4, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 44
    .line 45
    if-eqz v4, :cond_1

    .line 46
    .line 47
    invoke-virtual {v4}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    instance-of v4, v4, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;

    .line 52
    .line 53
    if-eqz v4, :cond_1

    .line 54
    .line 55
    new-instance v1, Landroid/content/Intent;

    .line 56
    .line 57
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 58
    .line 59
    const-class v4, Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveAct;

    .line 60
    .line 61
    invoke-direct {v1, v2, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 62
    .line 63
    .line 64
    const/high16 v2, 0x10200000

    .line 65
    .line 66
    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 67
    .line 68
    .line 69
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 70
    .line 71
    invoke-virtual {v2, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 72
    .line 73
    .line 74
    move v1, v3

    .line 75
    goto :goto_0

    .line 76
    :cond_2
    if-nez v1, :cond_3

    .line 77
    .line 78
    invoke-static {}, Ll/pzm;->c()Ll/pzm;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0, v3}, Ll/pzm;->e(Z)V

    .line 83
    .line 84
    .line 85
    :cond_3
    invoke-virtual {p0}, Ll/ebt;->r()V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ebt;->d:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ebt;->e:Ll/kcg0;

    .line 7
    .line 8
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/ebt;->f:Ll/kcg0;

    .line 12
    .line 13
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/ebt;->c:Ll/hti;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/hti;->d()Ll/qwl;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Ll/ebt;->c:Ll/hti;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/hti;->d()Ll/qwl;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object v1, p0, Ll/ebt;->h:Ll/pwl;

    .line 33
    .line 34
    invoke-interface {v0, v1}, Ll/qwl;->h(Ll/pwl;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    iget-object v0, p0, Ll/ebt;->a:Ll/hbt;

    .line 38
    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/hbt;->destroy()V

    .line 42
    .line 43
    .line 44
    :cond_1
    const/4 v0, 0x0

    .line 45
    iput-object v0, p0, Ll/ebt;->c:Ll/hti;

    .line 46
    .line 47
    return-void
.end method

.method public s()F
    .locals 0

    .line 1
    iget p0, p0, Ll/ebt;->b:F

    .line 2
    .line 3
    return p0
.end method

.method public final t(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "control msg:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->type:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "live_float_window"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->type:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    const/4 v2, -0x1

    .line 32
    sparse-switch v1, :sswitch_data_0

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :sswitch_0
    const-string v1, "recover"

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_0

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    const/4 v2, 0x6

    .line 46
    goto :goto_0

    .line 47
    :sswitch_1
    const-string v1, "forbidden_multidevice"

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    const/4 v2, 0x5

    .line 57
    goto :goto_0

    .line 58
    :sswitch_2
    const-string v1, "force_stop"

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_2

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    const/4 v2, 0x4

    .line 68
    goto :goto_0

    .line 69
    :sswitch_3
    const-string v1, "start"

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_3

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_3
    const/4 v2, 0x3

    .line 79
    goto :goto_0

    .line 80
    :sswitch_4
    const-string v1, "pause"

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-nez v0, :cond_4

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_4
    const/4 v2, 0x2

    .line 90
    goto :goto_0

    .line 91
    :sswitch_5
    const-string v1, "stop"

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-nez v0, :cond_5

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_5
    const/4 v2, 0x1

    .line 101
    goto :goto_0

    .line 102
    :sswitch_6
    const-string v1, "boot"

    .line 103
    .line 104
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-nez v0, :cond_6

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_6
    const/4 v2, 0x0

    .line 112
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :pswitch_0
    invoke-direct {p0}, Ll/ebt;->z()V

    .line 117
    .line 118
    .line 119
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->liveId:Ljava/lang/String;

    .line 120
    .line 121
    invoke-virtual {p0, p1}, Ll/ebt;->B(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :pswitch_1
    invoke-direct {p0}, Ll/ebt;->E()V

    .line 126
    .line 127
    .line 128
    return-void

    .line 129
    :pswitch_2
    invoke-direct {p0}, Ll/ebt;->y()V

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :pswitch_3
    invoke-virtual {p0}, Ll/ebt;->r()V

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :sswitch_data_0
    .sparse-switch
        0x2e3af2 -> :sswitch_6
        0x360802 -> :sswitch_5
        0x65825f6 -> :sswitch_4
        0x68ac462 -> :sswitch_3
        0x80850d6 -> :sswitch_2
        0x169d3189 -> :sswitch_1
        0x40872d64 -> :sswitch_0
    .end sparse-switch

    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_0
    .end packed-switch
.end method

.method public final u()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ebt;->a:Ll/hbt;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/hbt;->f()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/ebt;->a:Ll/hbt;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/hbt;->d()Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->n()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final synthetic v(Ll/ugd0;)V
    .locals 6

    .line 1
    iget-object p1, p1, Ll/mr2;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 4
    .line 5
    iget-object v0, p0, Ll/ebt;->c:Ll/hti;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/hti;->d()Ll/qwl;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, ""

    .line 12
    .line 13
    const-string v2, "outApp"

    .line 14
    .line 15
    invoke-interface {v0, v1, v2, p1}, Ll/qwl;->l(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/ebt;->c:Ll/hti;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/hti;->d()Ll/qwl;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pullFlv:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pullFlvIpv6:Ljava/lang/String;

    .line 29
    .line 30
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 31
    .line 32
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 33
    .line 34
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 35
    .line 36
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->provider:I

    .line 37
    .line 38
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 43
    .line 44
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->businessType:I

    .line 45
    .line 46
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    invoke-interface/range {v0 .. v5}, Ll/qwl;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final synthetic w(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-direct {p0, p1}, Ll/ebt;->D(Z)V

    .line 3
    .line 4
    .line 5
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 6
    .line 7
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Tj:I

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Ll/ebt;->F(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic x(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ebt;->r()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
