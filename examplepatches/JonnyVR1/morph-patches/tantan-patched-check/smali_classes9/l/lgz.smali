.class public Ll/lgz;
.super Ll/qzz;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qzz<",
        "Ll/ggz;",
        ">;"
    }
.end annotation


# instance fields
.field public M1:Lcom/p1/mobile/putong/core/ui/messages/view/GroupBannedView;

.field public N1:Landroid/view/View;

.field public O1:Z

.field public P1:Ljava/lang/String;

.field public Q1:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qzz;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Ll/lgz;->O1:Z

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput-object p1, p0, Ll/lgz;->P1:Ljava/lang/String;

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Ll/lgz;->Q1:Z

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic l2(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic m2(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic n2(Ll/lgz;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lgz;->s2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic o2(Ll/lgz;Lcom/p1/mobile/putong/core/data/Conversation;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/lgz;->r2(Lcom/p1/mobile/putong/core/data/Conversation;Landroid/view/View;)V

    return-void
.end method

.method private y2()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/qzz;->q0()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/qzz;->q0()Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-boolean v1, p0, Ll/lgz;->O1:Z

    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-boolean v0, p0, Ll/lgz;->O1:Z

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/qzz;->q0()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p0, v0}, Ll/lgz;->v2(Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method


# virtual methods
.method public D0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/qzz;->D0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/qzz;->p1:Ll/clz;

    .line 5
    .line 6
    check-cast v0, Ll/ggz;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/ggz;->h4()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, v0}, Ll/lgz;->z2(Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public E1(Landroid/view/Menu;)Z
    .locals 6

    .line 1
    invoke-super {p0, p1}, Ll/qzz;->E1(Landroid/view/Menu;)Z

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Ll/r97;->E()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x1

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 22
    .line 23
    iget-object v2, p0, Ll/qzz;->p1:Ll/clz;

    .line 24
    .line 25
    check-cast v2, Ll/ggz;

    .line 26
    .line 27
    invoke-virtual {v2}, Ll/clz;->i3()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_0

    .line 40
    .line 41
    invoke-static {v0}, Ll/pm6;->a(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-eqz v2, :cond_0

    .line 46
    .line 47
    sget v2, Ll/edc0;->k2:I

    .line 48
    .line 49
    const-string v3, ""

    .line 50
    .line 51
    const/4 v4, 0x4

    .line 52
    const/4 v5, 0x2

    .line 53
    invoke-interface {p1, v4, v2, v5, v3}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-interface {p1, v5}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 58
    .line 59
    .line 60
    sget v2, Ll/qec0;->c1:I

    .line 61
    .line 62
    invoke-interface {p1, v2}, Landroid/view/MenuItem;->setActionView(I)Landroid/view/MenuItem;

    .line 63
    .line 64
    .line 65
    invoke-interface {p1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    sget v2, Ll/edc0;->l2:I

    .line 70
    .line 71
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iput-object p1, p0, Ll/lgz;->N1:Landroid/view/View;

    .line 76
    .line 77
    new-instance v2, Ll/hgz;

    .line 78
    .line 79
    invoke-direct {v2, p0, v0}, Ll/hgz;-><init>(Ll/lgz;Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 80
    .line 81
    .line 82
    invoke-static {p1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 83
    .line 84
    .line 85
    invoke-direct {p0}, Ll/lgz;->y2()V

    .line 86
    .line 87
    .line 88
    :cond_0
    return v1
.end method

.method public f0()Ll/rdz;
    .locals 0

    .line 1
    new-instance p0, Ll/edz;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/edz;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final p2()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/lgz;->M1:Lcom/p1/mobile/putong/core/ui/messages/view/GroupBannedView;

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sget v1, Ll/qec0;->f0:I

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/view/GroupBannedView;

    .line 21
    .line 22
    iput-object v0, p0, Ll/lgz;->M1:Lcom/p1/mobile/putong/core/ui/messages/view/GroupBannedView;

    .line 23
    .line 24
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 25
    .line 26
    const/4 v1, -0x1

    .line 27
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Ll/qzz;->p1:Ll/clz;

    .line 31
    .line 32
    move-object v2, v1

    .line 33
    check-cast v2, Ll/ggz;

    .line 34
    .line 35
    iget v2, v2, Ll/clz;->d:I

    .line 36
    .line 37
    const/16 v3, 0x21

    .line 38
    .line 39
    if-eq v2, v3, :cond_1

    .line 40
    .line 41
    check-cast v1, Ll/ggz;

    .line 42
    .line 43
    iget v1, v1, Ll/clz;->d:I

    .line 44
    .line 45
    const/16 v2, 0x20

    .line 46
    .line 47
    if-ne v1, v2, :cond_0

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    sget v1, Ll/qa00;->F:I

    .line 51
    .line 52
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_1
    :goto_0
    sget v1, Ll/qa00;->E:I

    .line 56
    .line 57
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 58
    .line 59
    :goto_1
    iget-object v1, p0, Ll/qzz;->i:Landroid/widget/FrameLayout;

    .line 60
    .line 61
    iget-object p0, p0, Ll/lgz;->M1:Lcom/p1/mobile/putong/core/ui/messages/view/GroupBannedView;

    .line 62
    .line 63
    invoke-virtual {v1, p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 64
    .line 65
    .line 66
    :cond_2
    return-void
.end method

.method public q2()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/lgz;->Q1:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/lgz;->Q1:Z

    .line 8
    .line 9
    iget-object v1, p0, Ll/qzz;->p1:Ll/clz;

    .line 10
    .line 11
    check-cast v1, Ll/ggz;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/j3z;->e0()Ll/mzl;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v1}, Ll/mzl;->B0()Ll/u1z;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Ll/j3z;->g0()Ll/iam;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Ll/d3z;

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget-object v2, p0, Ll/qzz;->o1:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->setGroupStyle(Lcom/p1/mobile/android/app/Act;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/qzz;->p1:Ll/clz;

    .line 37
    .line 38
    check-cast p0, Ll/ggz;

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-interface {p0}, Ll/mzl;->d0()Ll/vez;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0, v0}, Ll/vez;->N0(Z)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final synthetic r2(Lcom/p1/mobile/putong/core/data/Conversation;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/group/GroupSetAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic s2(Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/qzz;->q0()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/core/api/e;->E0:Ll/jxd0;

    .line 16
    .line 17
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    new-instance v0, Ll/zvk;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-direct {v0, v1}, Ll/zvk;-><init>(Landroid/content/Context;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->R2:I

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Ll/zvk;->u(Ljava/lang/String;)Ll/zvk;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    const/4 v2, 0x1

    .line 47
    invoke-virtual {v1, v2}, Ll/zvk;->r(Z)Ll/zvk;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    sget v2, Ll/zvk;->E:I

    .line 52
    .line 53
    sget v3, Ll/zvk;->A:I

    .line 54
    .line 55
    or-int/2addr v2, v3

    .line 56
    invoke-virtual {v1, v2}, Ll/zvk;->i(I)Ll/zvk;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    const/high16 v2, 0x40c00000    # 6.0f

    .line 61
    .line 62
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    neg-int v2, v2

    .line 67
    invoke-virtual {v1, v2}, Ll/zvk;->o(I)Ll/zvk;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    const/16 v2, -0x4500

    .line 72
    .line 73
    filled-new-array {v2}, [I

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-virtual {v1, v2}, Ll/zvk;->e([I)Ll/zvk;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    const-wide/16 v2, 0x1388

    .line 82
    .line 83
    invoke-virtual {v1, v2, v3}, Ll/zvk;->a(J)Ll/zvk;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    new-instance v2, Ll/jgz;

    .line 88
    .line 89
    invoke-direct {v2}, Ll/jgz;-><init>()V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1, v2}, Ll/zvk;->d(Ll/zvk$b;)Ll/zvk;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    new-instance v2, Ll/kgz;

    .line 97
    .line 98
    invoke-direct {v2}, Ll/kgz;-><init>()V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v1, v2}, Ll/zvk;->b(Ll/zvk$a;)Ll/zvk;

    .line 102
    .line 103
    .line 104
    invoke-static {}, Ll/fwk;->h()Ll/fwk;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-virtual {p0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    invoke-virtual {v2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    check-cast v2, Landroid/view/ViewGroup;

    .line 121
    .line 122
    invoke-virtual {v1, v0, p1, v2}, Ll/fwk;->r(Ll/zvk;Landroid/view/View;Landroid/view/ViewGroup;)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    iput-object p1, p0, Ll/lgz;->P1:Ljava/lang/String;

    .line 127
    .line 128
    return-void
.end method

.method public u2(Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/lgz;->w2(Z)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Ll/lgz;->M1:Lcom/p1/mobile/putong/core/ui/messages/view/GroupBannedView;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/GroupBannedView;->setBannedText(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final v2(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/lgz;->P1:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/putong/core/api/e;->E0:Ll/jxd0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ljava/lang/Boolean;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    :goto_0
    return-void

    .line 29
    :cond_1
    invoke-virtual {p0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/igz;

    .line 34
    .line 35
    invoke-direct {v1, p0, p1}, Ll/igz;-><init>(Ll/lgz;Landroid/view/View;)V

    .line 36
    .line 37
    .line 38
    const-wide/16 v2, 0x190

    .line 39
    .line 40
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    new-instance v0, Ll/lgz$a;

    .line 48
    .line 49
    invoke-direct {v0, p0}, Ll/lgz$a;-><init>(Ll/lgz;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->addSwipeBackListener(Ll/ujh0;)V

    .line 53
    .line 54
    .line 55
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 58
    .line 59
    sget-object p0, Lcom/p1/mobile/putong/core/api/e;->E0:Ll/jxd0;

    .line 60
    .line 61
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public w2(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/lgz;->p2()V

    .line 4
    .line 5
    .line 6
    :cond_0
    iget-object v0, p0, Ll/lgz;->M1:Lcom/p1/mobile/putong/core/ui/messages/view/GroupBannedView;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object p0, p0, Ll/lgz;->M1:Lcom/p1/mobile/putong/core/ui/messages/view/GroupBannedView;

    .line 15
    .line 16
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public z2(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/lgz;->O1:Z

    .line 2
    .line 3
    invoke-direct {p0}, Ll/lgz;->y2()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
