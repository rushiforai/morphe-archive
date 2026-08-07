.class public Ll/xgj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/xgj;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xgj;->h(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/xgj;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xgj;->g()V

    return-void
.end method

.method public static synthetic c(Ll/xgj;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xgj;->i()V

    return-void
.end method

.method public static synthetic d(Ll/xgj;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xgj;->f()V

    return-void
.end method


# virtual methods
.method public e()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xgj;->a:Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/xgj;->a:Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/xgj;->a:Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;

    .line 22
    .line 23
    sget-object v1, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    new-array v2, v2, [F

    .line 27
    .line 28
    fill-array-data v2, :array_0

    .line 29
    .line 30
    .line 31
    invoke-static {v0, v1, v2}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/wgj;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/wgj;-><init>(Ll/xgj;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void

    .line 48
    nop

    .line 49
    :array_0
    .array-data 4
        0x0
        -0x3d380000    # -100.0f
    .end array-data
.end method

.method public final synthetic f()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xgj;->a:Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/xgj;->a:Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ll/xgj;->a:Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Landroid/view/ViewGroup;

    .line 28
    .line 29
    iget-object v1, p0, Ll/xgj;->a:Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    iput-object v0, p0, Ll/xgj;->a:Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;

    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public final synthetic g()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xgj;->e()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic h(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p2, 0x0

    .line 2
    new-array p2, p2, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v0, "e_miss_a_match_toast"

    .line 5
    .line 6
    const-string v1, "p_suggest_users_home_view"

    .line 7
    .line 8
    invoke-static {v0, v1, p2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    const-string v0, "p_suggest_users_home_view,e_miss_a_match_toast,click"

    .line 20
    .line 21
    invoke-interface {p2, p1, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->l1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/xgj;->e()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic i()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xgj;->e()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/xgj;->a:Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget v2, Ll/kec0;->ge:I

    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    invoke-virtual {v0, v2, v3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;

    .line 18
    .line 19
    iput-object v0, p0, Ll/xgj;->a:Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;

    .line 20
    .line 21
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 22
    .line 23
    const/4 v2, -0x1

    .line 24
    const/4 v3, -0x2

    .line 25
    invoke-direct {v0, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ll/bnl0;->F0()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    invoke-virtual {v0, v1, v2, v1, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Ll/xgj;->a:Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;

    .line 36
    .line 37
    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    iget-object v0, p0, Ll/xgj;->a:Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;

    .line 52
    .line 53
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Landroid/view/ViewGroup;

    .line 58
    .line 59
    iget-object v2, p0, Ll/xgj;->a:Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;

    .line 60
    .line 61
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/xgj;->a:Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;

    .line 65
    .line 66
    new-instance v2, Ll/tgj;

    .line 67
    .line 68
    invoke-direct {v2, p0}, Ll/tgj;-><init>(Ll/xgj;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, p1, p2, v2}, Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;->s(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/Runnable;)V

    .line 72
    .line 73
    .line 74
    iget-object p2, p0, Ll/xgj;->a:Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;

    .line 75
    .line 76
    new-instance v0, Ll/ugj;

    .line 77
    .line 78
    invoke-direct {v0, p0, p1}, Ll/ugj;-><init>(Ll/xgj;Lcom/p1/mobile/android/app/Act;)V

    .line 79
    .line 80
    .line 81
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 82
    .line 83
    .line 84
    const-string p2, "p_suggest_users_home_view"

    .line 85
    .line 86
    new-array v0, v1, [Ll/sfj0$a;

    .line 87
    .line 88
    const-string v1, "e_miss_a_match_toast"

    .line 89
    .line 90
    invoke-static {v1, p2, v0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    invoke-virtual {p2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 98
    .line 99
    .line 100
    move-result-object p2

    .line 101
    check-cast p2, Landroid/view/ViewGroup;

    .line 102
    .line 103
    iget-object v0, p0, Ll/xgj;->a:Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;

    .line 104
    .line 105
    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 106
    .line 107
    .line 108
    iget-object p2, p0, Ll/xgj;->a:Lcom/p1/mobile/putong/core/newui/home/GPHomeMissMatchView;

    .line 109
    .line 110
    sget-object v0, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 111
    .line 112
    const/4 v1, 0x2

    .line 113
    new-array v1, v1, [F

    .line 114
    .line 115
    fill-array-data v1, :array_0

    .line 116
    .line 117
    .line 118
    invoke-static {p2, v0, v1}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    invoke-virtual {p2}, Landroid/animation/Animator;->start()V

    .line 123
    .line 124
    .line 125
    new-instance p2, Ll/vgj;

    .line 126
    .line 127
    invoke-direct {p2, p0}, Ll/vgj;-><init>(Ll/xgj;)V

    .line 128
    .line 129
    .line 130
    const-wide/16 v0, 0xbb8

    .line 131
    .line 132
    invoke-static {p1, p2, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    nop

    .line 137
    :array_0
    .array-data 4
        -0x3d380000    # -100.0f
        0x0
    .end array-data
.end method
