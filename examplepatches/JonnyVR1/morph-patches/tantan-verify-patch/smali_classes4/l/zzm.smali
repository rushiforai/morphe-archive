.class public Ll/zzm;
.super Ll/fqe0;
.source "SourceFile"


# instance fields
.field public final i:Ll/iam;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/iam<",
            "*>;"
        }
    .end annotation
.end field

.field public final j:Lcom/p1/mobile/putong/data/PushMessageCustom;

.field public final k:Lcom/p1/mobile/putong/data/PushMessage;

.field public final l:Ll/a0n;

.field public final m:Lcom/p1/mobile/android/app/Act;

.field public n:Ll/v0t;


# direct methods
.method public constructor <init>(Ll/iam;Lcom/p1/mobile/putong/data/PushMessage;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/fqe0;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/zzm;->m:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    iput-object p1, p0, Ll/zzm;->i:Ll/iam;

    .line 11
    .line 12
    iput-object p2, p0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 13
    .line 14
    iget-object p1, p2, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 15
    .line 16
    iput-object p1, p0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 17
    .line 18
    invoke-static {p2, p0}, Ll/a0n;->a(Lcom/p1/mobile/putong/data/PushMessage;Ll/zzm;)Ll/a0n;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Ll/zzm;->l:Ll/a0n;

    .line 23
    .line 24
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    new-instance p2, Ll/tzm;

    .line 28
    .line 29
    invoke-direct {p2, p1}, Ll/tzm;-><init>(Ll/a0n;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p2}, Ll/fqe0;->z(Ll/pcj;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    new-instance p2, Ll/uzm;

    .line 39
    .line 40
    invoke-direct {p2, p1}, Ll/uzm;-><init>(Ll/a0n;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, p2}, Ll/jlb0;->s(Ll/x20;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static synthetic B(Ll/zzm;Ljava/lang/Runnable;Ll/v0t;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zzm;->N(Ljava/lang/Runnable;Ll/v0t;)V

    return-void
.end method

.method public static synthetic C(Ll/zzm;Ll/v0t;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zzm;->L(Ll/v0t;)V

    return-void
.end method

.method public static synthetic F(Ll/zzm;Ll/v0t;Landroid/view/View;ILcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;Ljava/lang/Runnable;I)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/zzm;->O(Ll/v0t;Landroid/view/View;ILcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;Ljava/lang/Runnable;I)V

    return-void
.end method

.method public static synthetic H(Ll/zzm;Ll/v0t;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zzm;->M(Ll/v0t;)V

    return-void
.end method

.method public static bridge synthetic I(Ll/zzm;)Ll/a0n;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zzm;->l:Ll/a0n;

    return-object p0
.end method


# virtual methods
.method public A()I
    .locals 12

    .line 1
    iget-object v0, p0, Ll/fqe0;->d:Ll/pcj;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    invoke-interface {v0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ljava/lang/Boolean;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move v0, v1

    .line 20
    goto :goto_1

    .line 21
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 22
    :goto_1
    iget-object v2, p0, Ll/zzm;->i:Ll/iam;

    .line 23
    .line 24
    invoke-interface {v2}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    if-eqz v2, :cond_2

    .line 31
    .line 32
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    :cond_2
    move-object v5, p0

    .line 39
    goto :goto_4

    .line 40
    :cond_3
    iget-object v0, p0, Ll/zzm;->l:Ll/a0n;

    .line 41
    .line 42
    iget-object v3, p0, Ll/zzm;->i:Ll/iam;

    .line 43
    .line 44
    invoke-interface {v3}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v0, v3}, Ll/a0n;->c(Lcom/p1/mobile/android/app/Act;)Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;

    .line 49
    .line 50
    .line 51
    move-result-object v9

    .line 52
    new-instance v6, Ll/v0t;

    .line 53
    .line 54
    invoke-direct {v6, v9}, Ll/v0t;-><init>(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;)V

    .line 55
    .line 56
    .line 57
    iput-object v6, p0, Ll/zzm;->n:Ll/v0t;

    .line 58
    .line 59
    new-instance v10, Ll/vzm;

    .line 60
    .line 61
    invoke-direct {v10, p0, v6}, Ll/vzm;-><init>(Ll/zzm;Ll/v0t;)V

    .line 62
    .line 63
    .line 64
    new-instance v0, Ll/zzm$a;

    .line 65
    .line 66
    invoke-direct {v0, p0}, Ll/zzm$a;-><init>(Ll/zzm;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v6, v0}, Ll/v0t;->n(Ll/x20;)V

    .line 70
    .line 71
    .line 72
    new-instance v0, Ll/wzm;

    .line 73
    .line 74
    invoke-direct {v0, p0, v6}, Ll/wzm;-><init>(Ll/zzm;Ll/v0t;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v6, v0}, Ll/v0t;->o(Ll/x20;)V

    .line 78
    .line 79
    .line 80
    new-instance v0, Ll/xzm;

    .line 81
    .line 82
    invoke-direct {v0, p0, v10, v6}, Ll/xzm;-><init>(Ll/zzm;Ljava/lang/Runnable;Ll/v0t;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v6, v0}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    if-nez v0, :cond_4

    .line 93
    .line 94
    invoke-virtual {v2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {v0}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    :goto_2
    move-object v7, v0

    .line 107
    move v8, v1

    .line 108
    goto :goto_3

    .line 109
    :cond_4
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 110
    .line 111
    .line 112
    move-result v3

    .line 113
    if-nez v3, :cond_5

    .line 114
    .line 115
    goto :goto_2

    .line 116
    :cond_5
    invoke-static {v2}, Ll/bnl0;->C(Landroid/content/Context;)I

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    neg-int v1, v1

    .line 121
    goto :goto_2

    .line 122
    :goto_3
    iget-object v0, p0, Ll/zzm;->l:Ll/a0n;

    .line 123
    .line 124
    invoke-virtual {v0}, Ll/a0n;->b()I

    .line 125
    .line 126
    .line 127
    move-result v11

    .line 128
    new-instance v4, Ll/yzm;

    .line 129
    .line 130
    move-object v5, p0

    .line 131
    invoke-direct/range {v4 .. v11}, Ll/yzm;-><init>(Ll/zzm;Ll/v0t;Landroid/view/View;ILcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;Ljava/lang/Runnable;I)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v7, v4}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 135
    .line 136
    .line 137
    iget-object p0, v5, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 138
    .line 139
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/PushMessageCustom;->toJson()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    return v11

    .line 143
    :goto_4
    iget-object p0, v5, Ll/jlb0;->b:Ll/x20;

    .line 144
    .line 145
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result p0

    .line 149
    if-eqz p0, :cond_6

    .line 150
    .line 151
    iget-object p0, v5, Ll/jlb0;->b:Ll/x20;

    .line 152
    .line 153
    invoke-interface {p0}, Ll/x20;->call()V

    .line 154
    .line 155
    .line 156
    :cond_6
    return v1
.end method

.method public J()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zzm;->n:Ll/v0t;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/v0t;->dismiss()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public K()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/zzm;->i:Ll/iam;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    instance-of v0, p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    check-cast p0, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->c6()Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast p0, Ljava/lang/String;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    const-string p0, "p_suggest_users_home_view"

    .line 23
    .line 24
    return-object p0
.end method

.method public final synthetic L(Ll/v0t;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->LIVE_PUSH:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->getOnlyName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    sget-object v2, Lcom/p1/mobile/android/ui/poplevel/PopAction;->AUTO_CLOSE:Lcom/p1/mobile/android/ui/poplevel/PopAction;

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/ui/poplevel/a;->o(Ljava/lang/String;Lcom/p1/mobile/android/ui/poplevel/PopAction;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/zzm;->l:Ll/a0n;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/a0n;->e()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Ll/v0t;->dismiss()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic M(Ll/v0t;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->LIVE_PUSH:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->getOnlyName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    sget-object v2, Lcom/p1/mobile/android/ui/poplevel/PopAction;->USER_CLOSE:Lcom/p1/mobile/android/ui/poplevel/PopAction;

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/ui/poplevel/a;->o(Ljava/lang/String;Lcom/p1/mobile/android/ui/poplevel/PopAction;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/zzm;->l:Ll/a0n;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/a0n;->i(Ll/v0t;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic N(Ljava/lang/Runnable;Ll/v0t;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/zzm;->l:Ll/a0n;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Ll/a0n;->g(Ll/v0t;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Ll/jlb0;->b:Ll/x20;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-interface {p0}, Ll/x20;->call()V

    .line 16
    .line 17
    .line 18
    :cond_1
    return-void
.end method

.method public final synthetic O(Ll/v0t;Landroid/view/View;ILcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;Ljava/lang/Runnable;I)V
    .locals 7

    .line 1
    iget-object v2, p0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 2
    .line 3
    sget v3, Ll/qa00;->i:I

    .line 4
    .line 5
    invoke-virtual {p4}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;->getShowAnim()Landroid/animation/Animator;

    .line 6
    .line 7
    .line 8
    move-result-object v5

    .line 9
    invoke-virtual {p4}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;->getHideAnim()Landroid/animation/Animator;

    .line 10
    .line 11
    .line 12
    move-result-object v6

    .line 13
    move-object v0, p1

    .line 14
    move-object v1, p2

    .line 15
    move v4, p3

    .line 16
    invoke-virtual/range {v0 .. v6}, Ll/v0t;->p(Landroid/view/View;Lcom/p1/mobile/putong/data/PushMessageCustom;IILandroid/animation/Animator;Landroid/animation/Animator;)V

    .line 17
    .line 18
    .line 19
    :try_start_0
    iget-object p1, p0, Ll/zzm;->l:Ll/a0n;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/v0t;->i()Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {p1, p2}, Ll/a0n;->j(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catch_0
    move-exception v0

    .line 30
    move-object p1, v0

    .line 31
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    :goto_0
    iget-object p1, p0, Ll/jlb0;->a:Ll/x20;

    .line 35
    .line 36
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_0

    .line 41
    .line 42
    iget-object p1, p0, Ll/jlb0;->a:Ll/x20;

    .line 43
    .line 44
    invoke-interface {p1}, Ll/x20;->call()V

    .line 45
    .line 46
    .line 47
    :cond_0
    iget-object p1, p0, Ll/zzm;->l:Ll/a0n;

    .line 48
    .line 49
    invoke-virtual {p1}, Ll/a0n;->d()Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-eqz p1, :cond_1

    .line 54
    .line 55
    iget-object p1, p0, Ll/zzm;->i:Ll/iam;

    .line 56
    .line 57
    invoke-interface {p1}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    int-to-long p2, p6

    .line 62
    invoke-static {p1, p5, p2, p3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 63
    .line 64
    .line 65
    :cond_1
    iget-object p0, p0, Ll/zzm;->l:Ll/a0n;

    .line 66
    .line 67
    invoke-virtual {p0}, Ll/a0n;->l()V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public f(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zzm;->n:Ll/v0t;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/zzm;->n:Ll/v0t;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/v0t;->i()Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/zzm;->n:Ll/v0t;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/v0t;->i()Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const/high16 p1, 0x3f800000    # 1.0f

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    invoke-virtual {v0}, Ll/v0t;->i()Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const/high16 v0, -0x3a860000    # -4000.0f

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 42
    .line 43
    .line 44
    iget-object p0, p0, Ll/zzm;->n:Ll/v0t;

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/v0t;->i()Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public j()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zzm;->i:Ll/iam;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public m()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zzm;->i:Ll/iam;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public n(Z)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/zzm;->n:Ll/v0t;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/zzm;->n:Ll/v0t;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/v0t;->dismiss()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iget-object p1, p0, Ll/fqe0;->f:Ll/z2m;

    .line 18
    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    invoke-interface {p1, p0}, Ll/z2m;->a(Ll/d3m;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public o()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;->INTERNAL_PUSH_LIVE:Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;->getGroup()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public p()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;->INTERNAL_PUSH_LIVE:Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/bubble/MagicBubble;->getId()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveId:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method
