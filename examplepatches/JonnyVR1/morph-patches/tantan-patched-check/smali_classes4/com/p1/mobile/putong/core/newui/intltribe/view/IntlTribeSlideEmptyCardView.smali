.class public Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;

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

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;->n(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic b(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;->l(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic d(Ll/x20;Landroid/view/View;)V
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
    const/4 p1, 0x0

    .line 9
    new-array p1, p1, [Ll/sfj0$a;

    .line 10
    .line 11
    const-string v0, "e_intl_tribe_empty_state_edit_profile_click"

    .line 12
    .line 13
    const-string v1, "p_intl_tribe_swipe_view"

    .line 14
    .line 15
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    invoke-interface {p0}, Ll/x20;->call()V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public static synthetic e(Ll/x20;Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p1, 0x0

    .line 2
    new-array p1, p1, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v0, "e_intl_tribe_empty_state_location_click"

    .line 5
    .line 6
    const-string v1, "p_intl_tribe_swipe_view"

    .line 7
    .line 8
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-interface {p0}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;->m(Landroid/net/NetworkInfo;)V

    return-void
.end method


# virtual methods
.method public final g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/nhp;->a(Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public h()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;->a:Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;->b:Lv/VDraweeView;

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

.method public i()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;->j(Ll/x20;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public j(Ll/x20;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;->a:Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;->a:Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;

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
    new-instance v1, Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView$a;

    .line 30
    .line 31
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView$a;-><init>(Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;Ll/x20;)V

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

.method public k(Ll/x20;Ll/x20;Ll/ner;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;->d:Lv/VButton;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;->d:Lv/VButton;

    .line 8
    .line 9
    new-instance v2, Ll/hhp;

    .line 10
    .line 11
    invoke-direct {v2, p1}, Ll/hhp;-><init>(Ll/x20;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;->e:Lv/VButton;

    .line 18
    .line 19
    new-instance v0, Ll/ihp;

    .line 20
    .line 21
    invoke-direct {v0, p2}, Ll/ihp;-><init>(Ll/x20;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->o0:Lcom/p1/mobile/putong/core/api/n;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/n;->b4()Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-interface {p3, p1}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    invoke-virtual {p1, p2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    new-instance p2, Ll/jhp;

    .line 48
    .line 49
    invoke-direct {p2, p0}, Ll/jhp;-><init>(Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;)V

    .line 50
    .line 51
    .line 52
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-interface {p3, p1}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p1, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    invoke-virtual {p1, p2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    new-instance p2, Ll/khp;

    .line 84
    .line 85
    invoke-direct {p2, p0}, Ll/khp;-><init>(Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;)V

    .line 86
    .line 87
    .line 88
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;->a:Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;

    .line 96
    .line 97
    new-instance p2, Ll/lhp;

    .line 98
    .line 99
    invoke-direct {p2}, Ll/lhp;-><init>()V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 103
    .line 104
    .line 105
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 106
    .line 107
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->o0:Lcom/p1/mobile/putong/core/api/n;

    .line 108
    .line 109
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/n;->a4()Lrx/c;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-interface {p3, p1}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 118
    .line 119
    .line 120
    move-result-object p2

    .line 121
    invoke-virtual {p1, p2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    new-instance p2, Ll/mhp;

    .line 126
    .line 127
    invoke-direct {p2, p0}, Ll/mhp;-><init>(Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;)V

    .line 128
    .line 129
    .line 130
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 135
    .line 136
    .line 137
    return-void
.end method

.method public final synthetic l(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;->i()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m(Landroid/net/NetworkInfo;)V
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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;->a:Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;->a:Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final synthetic n(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;->i()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public o()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;->a:Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;

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
    return-void

    .line 10
    :cond_0
    const-string v0, "empty_entrance"

    .line 11
    .line 12
    const-string v1, "tribe_level2"

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "e_intl_tribe_empty_view"

    .line 23
    .line 24
    const-string v2, "p_intl_tribe_swipe_view"

    .line 25
    .line 26
    invoke-static {v1, v2, v0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 27
    .line 28
    .line 29
    const-string v0, "e_intl_tribe_empty_state_location_click"

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    new-array v3, v1, [Ll/sfj0$a;

    .line 33
    .line 34
    invoke-static {v0, v2, v3}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 35
    .line 36
    .line 37
    const-string v0, "e_intl_tribe_empty_state_edit_profile_click"

    .line 38
    .line 39
    new-array v3, v1, [Ll/sfj0$a;

    .line 40
    .line 41
    invoke-static {v0, v2, v3}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;->h()V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;->a:Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;->a:Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;

    .line 53
    .line 54
    const/4 v1, 0x0

    .line 55
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;->a:Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;

    .line 59
    .line 60
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const/high16 v1, 0x3f800000    # 1.0f

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const-wide/16 v1, 0x190

    .line 71
    .line 72
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView$b;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView$b;-><init>(Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/intltribe/view/IntlTribeSlideEmptyCardView;->g(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
