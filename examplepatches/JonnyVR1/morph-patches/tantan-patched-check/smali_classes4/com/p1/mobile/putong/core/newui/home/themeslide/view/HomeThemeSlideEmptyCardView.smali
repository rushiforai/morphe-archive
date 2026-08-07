.class public Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;

.field public b:Lv/VDraweeView;

.field public c:Lv/VText;

.field public d:Lv/VButton;

.field public e:Lv/VButton;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Ll/x20;Landroid/view/View;)V
    .locals 2

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-static {}, Ll/sfj0$a;->e()Ll/sfj0$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "increase_distance_open"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ll/sfj0$a;->d(Ljava/lang/String;)Ll/sfj0$a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->autoAdjustSuggestRadius()Ljava/lang/Boolean;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    invoke-virtual {v0, p1}, Ll/sfj0$a;->o(Z)Ll/sfj0$a;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    filled-new-array {p1}, [Ll/sfj0$a;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    const-string v0, "e_edit_suggest_user_filter"

    .line 52
    .line 53
    const-string v1, "p_activity_momentcard_view"

    .line 54
    .line 55
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-eqz p1, :cond_1

    .line 63
    .line 64
    invoke-interface {p0}, Ll/x20;->call()V

    .line 65
    .line 66
    .line 67
    :cond_1
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->autoAdjustSuggestRadius()Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;->r(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic e(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;->s(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic h(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;->t(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;->q(Ll/x20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;->u(Landroid/net/NetworkInfo;)V

    return-void
.end method


# virtual methods
.method public final l(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/hcl;->a(Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public m()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;->a:Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;->b:Lv/VDraweeView;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;->o(Ll/x20;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public o(Ll/x20;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;->a:Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0x8

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;->a:Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-wide/16 v1, 0x190

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView$a;

    .line 30
    .line 31
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;Ll/x20;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;->l(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public p(Ll/x20;Ll/x20;Ll/ner;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/gra;->I0()Lcom/p1/mobile/putong/core/data/MomentThemeCardeConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/MomentThemeCardeConfig;->enabled:Z

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;->d:Lv/VButton;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    invoke-static {v1, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;->e:Lv/VButton;

    .line 17
    .line 18
    const-string v0, "\u56de\u5230\u9996\u9875"

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;->e:Lv/VButton;

    .line 24
    .line 25
    new-instance v0, Ll/wbl;

    .line 26
    .line 27
    invoke-direct {v0, p2}, Ll/wbl;-><init>(Ll/x20;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;->d:Lv/VButton;

    .line 38
    .line 39
    new-instance v1, Ll/zbl;

    .line 40
    .line 41
    invoke-direct {v1, p0, p1}, Ll/zbl;-><init>(Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;Ll/x20;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;->e:Lv/VButton;

    .line 48
    .line 49
    new-instance v0, Ll/acl;

    .line 50
    .line 51
    invoke-direct {v0, p2}, Ll/acl;-><init>(Ll/x20;)V

    .line 52
    .line 53
    .line 54
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 55
    .line 56
    .line 57
    :goto_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 58
    .line 59
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 60
    .line 61
    invoke-virtual {p1}, Ll/dkb;->o9()Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-interface {p3, p1}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    new-instance p2, Ll/bcl;

    .line 70
    .line 71
    invoke-direct {p2}, Ll/bcl;-><init>()V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1, p2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    new-instance p2, Ll/ccl;

    .line 79
    .line 80
    invoke-direct {p2}, Ll/ccl;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-virtual {p1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    new-instance p2, Ll/dcl;

    .line 92
    .line 93
    invoke-direct {p2, p0}, Ll/dcl;-><init>(Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;)V

    .line 94
    .line 95
    .line 96
    new-instance v0, Ll/ecl;

    .line 97
    .line 98
    invoke-direct {v0}, Ll/ecl;-><init>()V

    .line 99
    .line 100
    .line 101
    invoke-static {p2, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 102
    .line 103
    .line 104
    move-result-object p2

    .line 105
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 106
    .line 107
    .line 108
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 109
    .line 110
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->n0:Lcom/p1/mobile/putong/core/api/b0;

    .line 111
    .line 112
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/b0;->Z3()Lrx/c;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-interface {p3, p1}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 121
    .line 122
    .line 123
    move-result-object p2

    .line 124
    invoke-virtual {p1, p2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    new-instance p2, Ll/fcl;

    .line 129
    .line 130
    invoke-direct {p2, p0}, Ll/fcl;-><init>(Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;)V

    .line 131
    .line 132
    .line 133
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 134
    .line 135
    .line 136
    move-result-object p2

    .line 137
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 138
    .line 139
    .line 140
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    invoke-interface {p3, p1}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    invoke-virtual {p1, v2}, Lrx/c;->skip(I)Lrx/c;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-virtual {p1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 157
    .line 158
    .line 159
    move-result-object p2

    .line 160
    invoke-virtual {p1, p2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    new-instance p2, Ll/gcl;

    .line 165
    .line 166
    invoke-direct {p2, p0}, Ll/gcl;-><init>(Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;)V

    .line 167
    .line 168
    .line 169
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 170
    .line 171
    .line 172
    move-result-object p2

    .line 173
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 174
    .line 175
    .line 176
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;->a:Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;

    .line 177
    .line 178
    new-instance p2, Ll/xbl;

    .line 179
    .line 180
    invoke-direct {p2}, Ll/xbl;-><init>()V

    .line 181
    .line 182
    .line 183
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 184
    .line 185
    .line 186
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 187
    .line 188
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->n0:Lcom/p1/mobile/putong/core/api/b0;

    .line 189
    .line 190
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/b0;->Y3()Lrx/c;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    invoke-interface {p3, p1}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 199
    .line 200
    .line 201
    move-result-object p2

    .line 202
    invoke-virtual {p1, p2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    new-instance p2, Ll/ybl;

    .line 207
    .line 208
    invoke-direct {p2, p0}, Ll/ybl;-><init>(Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;)V

    .line 209
    .line 210
    .line 211
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 212
    .line 213
    .line 214
    move-result-object p0

    .line 215
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 216
    .line 217
    .line 218
    return-void
.end method

.method public final synthetic q(Ll/x20;Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p2, 0x0

    .line 2
    new-array p2, p2, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v0, "e_increase_distance_button"

    .line 5
    .line 6
    const-string v1, "p_suggest_users_home_view"

    .line 7
    .line 8
    invoke-static {v0, v1, p2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;->m()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;->o(Ll/x20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic r(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;->n()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic s(Ljava/lang/Boolean;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/gra;->I0()Lcom/p1/mobile/putong/core/data/MomentThemeCardeConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/MomentThemeCardeConfig;->enabled:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;->c:Lv/VText;

    .line 10
    .line 11
    const-string p1, "\u9644\u8fd1\u6ca1\u6709\u5176\u4ed6\u4eba\u4e86\uff0c\u56de\u9996\u9875\u770b\u770b\u5427"

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;->c:Lv/VText;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sget v2, Lcom/p1/mobile/putong/core/R$string;->rp:I

    .line 30
    .line 31
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    sget v2, Lcom/p1/mobile/putong/core/R$string;->sp:I

    .line 44
    .line 45
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;->d:Lv/VButton;

    .line 53
    .line 54
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-eqz p1, :cond_2

    .line 59
    .line 60
    const/16 p1, 0x8

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_2
    const/4 p1, 0x0

    .line 64
    :goto_1
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final synthetic t(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;->n()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic u(Landroid/net/NetworkInfo;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;->a:Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const/16 v0, 0x8

    .line 14
    .line 15
    if-eq p1, v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;->a:Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public v()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;->a:Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_0

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;->m()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;->a:Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;->a:Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;->a:Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const/high16 v1, 0x3f800000    # 1.0f

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-wide/16 v1, 0x190

    .line 39
    .line 40
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView$b;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView$b;-><init>(Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 54
    .line 55
    .line 56
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 57
    .line 58
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 59
    .line 60
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    const-string v2, "p_suggest_users_home_view"

    .line 69
    .line 70
    if-eqz v1, :cond_1

    .line 71
    .line 72
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 73
    .line 74
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-eqz v1, :cond_1

    .line 79
    .line 80
    invoke-static {}, Ll/sfj0$a;->e()Ll/sfj0$a;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    const-string v3, "increase_distance_open"

    .line 85
    .line 86
    invoke-virtual {v1, v3}, Ll/sfj0$a;->d(Ljava/lang/String;)Ll/sfj0$a;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 91
    .line 92
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->autoAdjustSuggestRadius()Ljava/lang/Boolean;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    invoke-virtual {v1, v0}, Ll/sfj0$a;->o(Z)Ll/sfj0$a;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-static {}, Ll/eui0;->b()Ll/sfj0$a;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    filled-new-array {v0, v1}, [Ll/sfj0$a;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    const-string v1, "e_edit_suggest_user_filter"

    .line 113
    .line 114
    invoke-static {v1, v2, v0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 115
    .line 116
    .line 117
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/themeslide/view/HomeThemeSlideEmptyCardView;->d:Lv/VButton;

    .line 118
    .line 119
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 120
    .line 121
    .line 122
    move-result p0

    .line 123
    if-nez p0, :cond_2

    .line 124
    .line 125
    invoke-static {}, Ll/eui0;->b()Ll/sfj0$a;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    filled-new-array {p0}, [Ll/sfj0$a;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    const-string v0, "e_increase_distance_button"

    .line 134
    .line 135
    invoke-static {v0, v2, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 136
    .line 137
    .line 138
    :cond_2
    :goto_0
    return-void
.end method
