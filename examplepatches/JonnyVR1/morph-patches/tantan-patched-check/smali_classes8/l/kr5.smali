.class public Ll/kr5;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;

.field public final b:Lcom/p1/mobile/putong/core/data/Conversation;

.field public final c:Z

.field public d:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/kr5;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput-object p2, p0, Ll/kr5;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 7
    .line 8
    invoke-static {p2}, Ll/br5;->h(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iput-boolean p1, p0, Ll/kr5;->c:Z

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic a(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    sget v0, Lcom/p1/mobile/putong/core/message/R$string;->B2:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic b()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/g;->Fo()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic c(Ll/kr5;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/kr5;->m(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic d(Ll/kr5;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/kr5;->n(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/w20;->d()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-interface {v1, v0, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->ho(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, "compliment"

    .line 6
    .line 7
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static synthetic g(Ll/kr5;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/kr5;->l(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic h(Ll/kr5;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kr5;->o(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static bridge synthetic i(Ll/kr5;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/kr5;->p(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method


# virtual methods
.method public j(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/data/User;)Landroid/view/View;
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/kr5;->r()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_3

    .line 5
    .line 6
    iget-object v0, p0, Ll/kr5;->a:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    if-eqz v0, :cond_3

    .line 9
    .line 10
    if-nez p2, :cond_0

    .line 11
    .line 12
    goto/16 :goto_2

    .line 13
    .line 14
    :cond_0
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget v1, Ll/qec0;->r:I

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Ll/kr5;->d:Landroid/view/View;

    .line 26
    .line 27
    sget v0, Ll/edc0;->U:I

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    check-cast p1, Landroidx/appcompat/widget/AppCompatTextView;

    .line 34
    .line 35
    iget-object v0, p0, Ll/kr5;->d:Landroid/view/View;

    .line 36
    .line 37
    sget v1, Ll/edc0;->T:I

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Lv/VText_NoTopPadding;

    .line 44
    .line 45
    iget-object v1, p0, Ll/kr5;->d:Landroid/view/View;

    .line 46
    .line 47
    sget v2, Ll/edc0;->R:I

    .line 48
    .line 49
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    iget-object v2, p0, Ll/kr5;->d:Landroid/view/View;

    .line 54
    .line 55
    sget v3, Ll/edc0;->S:I

    .line 56
    .line 57
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    check-cast v2, Lv/VImage;

    .line 62
    .line 63
    iget-boolean v3, p0, Ll/kr5;->c:Z

    .line 64
    .line 65
    if-eqz v3, :cond_1

    .line 66
    .line 67
    sget-object v3, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 68
    .line 69
    sget v4, Lcom/p1/mobile/putong/core/message/R$string;->I3:I

    .line 70
    .line 71
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    .line 77
    .line 78
    const-string v3, "#3D2747"

    .line 79
    .line 80
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 85
    .line 86
    .line 87
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->Q3:I

    .line 88
    .line 89
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_1
    sget-object v3, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 94
    .line 95
    sget v4, Lcom/p1/mobile/putong/core/message/R$string;->G3:I

    .line 96
    .line 97
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    iget-object v4, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 102
    .line 103
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 112
    .line 113
    .line 114
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->H3:I

    .line 115
    .line 116
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 117
    .line 118
    .line 119
    const/high16 p1, -0x1000000

    .line 120
    .line 121
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 122
    .line 123
    .line 124
    sget p1, Ll/ibc0;->M:I

    .line 125
    .line 126
    invoke-virtual {v1, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 127
    .line 128
    .line 129
    :goto_0
    const/4 p1, 0x1

    .line 130
    invoke-static {v2, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 131
    .line 132
    .line 133
    iget-boolean p1, p0, Ll/kr5;->c:Z

    .line 134
    .line 135
    if-eqz p1, :cond_2

    .line 136
    .line 137
    sget p1, Ll/ibc0;->E0:I

    .line 138
    .line 139
    goto :goto_1

    .line 140
    :cond_2
    sget p1, Ll/ibc0;->G0:I

    .line 141
    .line 142
    :goto_1
    invoke-virtual {v2, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 143
    .line 144
    .line 145
    new-instance p1, Ll/cr5;

    .line 146
    .line 147
    invoke-direct {p1, p0, p2}, Ll/cr5;-><init>(Ll/kr5;Lcom/p1/mobile/putong/data/User;)V

    .line 148
    .line 149
    .line 150
    invoke-static {v1, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 151
    .line 152
    .line 153
    iget-object p0, p0, Ll/kr5;->d:Landroid/view/View;

    .line 154
    .line 155
    return-object p0

    .line 156
    :cond_3
    :goto_2
    const/4 p0, 0x0

    .line 157
    return-object p0
.end method

.method public final k(Ljava/util/List;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/UserPrivilege;",
            ">;)I"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    new-instance v0, Ll/ir5;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/ir5;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-static {p1, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/p1/mobile/putong/core/data/UserPrivilege;

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 19
    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    iget p0, p1, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->remaining:I

    .line 23
    .line 24
    :cond_1
    return p0
.end method

.method public final synthetic l(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p2, 0x1

    .line 2
    invoke-virtual {p0, p2}, Ll/kr5;->s(Z)V

    .line 3
    .line 4
    .line 5
    iget-boolean p2, p0, Ll/kr5;->c:Z

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/kr5;->q(Lcom/p1/mobile/putong/data/User;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0, p1}, Ll/kr5;->p(Lcom/p1/mobile/putong/data/User;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic m(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ll/uxj0;)V
    .locals 0

    .line 1
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p3, p1}, Lcom/p1/mobile/putong/core/api/g;->gp(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/kr5;->a:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 11
    .line 12
    .line 13
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 14
    .line 15
    new-instance p1, Ll/jr5;

    .line 16
    .line 17
    invoke-direct {p1, p2}, Ll/jr5;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 18
    .line 19
    .line 20
    const-wide/16 p2, 0x12c

    .line 21
    .line 22
    invoke-static {p0, p1, p2, p3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic n(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/util/List;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p3}, Ll/kr5;->k(Ljava/util/List;)I

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-gtz p3, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    const-string p3, "p_chat_view"

    .line 16
    .line 17
    const-string v0, "failed"

    .line 18
    .line 19
    invoke-interface {p2, p3, v0}, Ll/r97;->R7(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {p2}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    iget-object p3, p0, Ll/kr5;->a:Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    new-instance v0, Ll/kr5$a;

    .line 33
    .line 34
    invoke-direct {v0, p0, p1}, Ll/kr5$a;-><init>(Ll/kr5;Lcom/p1/mobile/putong/data/User;)V

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x0

    .line 38
    const-string p1, ""

    .line 39
    .line 40
    invoke-interface {p2, p3, p1, v0, p0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Kd(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/a30;Ll/x20;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 47
    .line 48
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/core/api/g;->Bq(Ljava/lang/String;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p3

    .line 52
    new-instance v0, Ll/gr5;

    .line 53
    .line 54
    invoke-direct {v0, p0, p2, p1}, Ll/gr5;-><init>(Ll/kr5;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)V

    .line 55
    .line 56
    .line 57
    new-instance p0, Ll/hr5;

    .line 58
    .line 59
    invoke-direct {p0}, Ll/hr5;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p3, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final synthetic o(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p0, p0, Ll/kr5;->a:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    const-string v0, ""

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-interface {p1, p0, v0, v1, v1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Kd(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/a30;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final p(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/kr5;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 15
    .line 16
    invoke-virtual {v1}, Ll/joa;->v4()Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    new-instance v2, Ll/er5;

    .line 21
    .line 22
    invoke-direct {v2, p0, p1, v0}, Ll/er5;-><init>(Ll/kr5;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    new-instance p1, Ll/fr5;

    .line 26
    .line 27
    invoke-direct {p1, p0}, Ll/fr5;-><init>(Ll/kr5;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v2, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final q(Lcom/p1/mobile/putong/data/User;)V
    .locals 6

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {}, Ll/br5;->n()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_2

    .line 9
    .line 10
    invoke-static {}, Ll/joa;->R3()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-gtz v0, :cond_2

    .line 15
    .line 16
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Ve()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v1, p0, Ll/kr5;->a:Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->immediately_match:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 40
    .line 41
    const/4 v4, 0x0

    .line 42
    const/4 v5, 0x0

    .line 43
    const-string v2, "p_intl_message_view,e_im_compliment_upgrade_guide,click"

    .line 44
    .line 45
    invoke-interface/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->r6(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/x20;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_2
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iget-object p0, p0, Ll/kr5;->a:Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    new-instance v1, Ll/dr5;

    .line 60
    .line 61
    invoke-direct {v1}, Ll/dr5;-><init>()V

    .line 62
    .line 63
    .line 64
    const-string v2, "p_intl_message_view,e_im_compliment_upgrade_guide,click"

    .line 65
    .line 66
    invoke-interface {v0, p0, p1, v1, v2}, Ll/r97;->Q3(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kr5;->d:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    instance-of v0, v0, Landroid/view/ViewGroup;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/kr5;->d:Landroid/view/View;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Landroid/view/ViewGroup;

    .line 20
    .line 21
    iget-object v1, p0, Ll/kr5;->d:Landroid/view/View;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    const/4 v0, 0x0

    .line 27
    iput-object v0, p0, Ll/kr5;->d:Landroid/view/View;

    .line 28
    .line 29
    return-void
.end method

.method public s(Z)V
    .locals 2

    .line 1
    iget-boolean p0, p0, Ll/kr5;->c:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string p0, "ultraPremium"

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const-string p0, "premium"

    .line 9
    .line 10
    :goto_0
    const-string v0, "compliment_upgrade_type"

    .line 11
    .line 12
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v0, "p_chat_view"

    .line 17
    .line 18
    const-string v1, "e_im_compliment_upgrade_guide"

    .line 19
    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    filled-new-array {p0}, [Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {v1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    filled-new-array {p0}, [Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {v1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public t()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kr5;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    invoke-static {p0}, Ll/br5;->c(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
