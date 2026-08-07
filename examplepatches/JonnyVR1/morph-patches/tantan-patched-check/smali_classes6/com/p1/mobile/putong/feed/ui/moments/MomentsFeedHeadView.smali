.class public Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VImage;

.field public b:Lv/VDraweeView;

.field public c:Lv/VImage;

.field public d:Lv/VText;

.field public e:Lv/VDraweeView;

.field public f:Landroid/widget/LinearLayout;

.field public g:Lv/VDraweeView;

.field public h:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

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
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    .param p3    # I
        .annotation build Landroidx/annotation/AttrRes;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;[ILandroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->t([ILandroid/graphics/Bitmap;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->w(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->x(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->r(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;Lcom/p1/mobile/putong/data/User;[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->u(Lcom/p1/mobile/putong/data/User;[I)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/data/Counter;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->activities:Lcom/p1/mobile/putong/data/CounterActivities;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/data/CounterActivities;->unread:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic h(Ll/vg60;)Lrx/c;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 17
    .line 18
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->read:Z

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {p0}, Ll/mrb0;->W(Ljava/lang/String;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0

    .line 38
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 39
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->y(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->q(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->v(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->s(Landroid/graphics/Bitmap;)V

    return-void
.end method


# virtual methods
.method public A(I)V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-lez p1, :cond_0

    .line 3
    .line 4
    move v1, v0

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v1, 0x0

    .line 7
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->g:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->f:Landroid/widget/LinearLayout;

    .line 13
    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    sget v3, Ll/lbc0;->p6:I

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_1
    sget v3, Ll/lbc0;->a2:I

    .line 20
    .line 21
    :goto_1
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 22
    .line 23
    .line 24
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->h:Lv/VText;

    .line 25
    .line 26
    if-eqz v1, :cond_3

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    if-le p1, v0, :cond_2

    .line 33
    .line 34
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->M3:I

    .line 35
    .line 36
    goto :goto_2

    .line 37
    :cond_2
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->N3:I

    .line 38
    .line 39
    :goto_2
    invoke-static {p1}, Ll/a9g0;->f(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {v3, v0, p1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    goto :goto_3

    .line 52
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->n()Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->Q3:I

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    :goto_3
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->h:Lv/VText;

    .line 66
    .line 67
    if-eqz v1, :cond_4

    .line 68
    .line 69
    const/4 p1, -0x1

    .line 70
    goto :goto_4

    .line 71
    :cond_4
    const p1, -0x77000001

    .line 72
    .line 73
    .line 74
    :goto_4
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public final m(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/qw00;->a(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public n()Lcom/p1/mobile/android/app/Act;
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->o(Landroid/content/Context;)Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final o(Landroid/content/Context;)Lcom/p1/mobile/android/app/Act;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    instance-of v1, p1, Landroid/app/Activity;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    return-object p1

    .line 12
    :cond_1
    instance-of v1, p1, Landroid/content/ContextWrapper;

    .line 13
    .line 14
    if-eqz v1, :cond_2

    .line 15
    .line 16
    check-cast p1, Landroid/content/ContextWrapper;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->o(Landroid/content/Context;)Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_2
    return-object v0
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->m(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->f:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    new-instance v1, Ll/ew00;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/ew00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public p(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/mrb0;->j()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/hw00;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/hw00;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/iw00;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/iw00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;)V

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
    invoke-static {}, Ll/mrb0;->B()Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/jw00;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Ll/jw00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    invoke-static {}, Ll/mrb0;->B()Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    new-instance v1, Ll/kw00;

    .line 67
    .line 68
    invoke-direct {v1, p0}, Ll/kw00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 76
    .line 77
    .line 78
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 79
    .line 80
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/api/b;->O2()Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    new-instance v1, Ll/lw00;

    .line 85
    .line 86
    invoke-direct {v1}, Ll/lw00;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    new-instance v0, Ll/mw00;

    .line 98
    .line 99
    invoke-direct {v0, p0}, Ll/mw00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;)V

    .line 100
    .line 101
    .line 102
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public final synthetic q(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->g:Lv/VDraweeView;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->g:Lv/VDraweeView;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic r(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->A(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic s(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->a:Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic t([ILandroid/graphics/Bitmap;)V
    .locals 3

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    aget v0, p1, v0

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    aget p1, p1, v1

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    sget v2, Ll/k9c0;->U:I

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const/high16 v2, 0x40800000    # 4.0f

    .line 24
    .line 25
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    invoke-static {p2, v0, p1, v1, v2}, Ll/bsj0;->q(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance p2, Ll/gw00;

    .line 34
    .line 35
    invoke-direct {p2, p0, p1}, Ll/gw00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;Landroid/graphics/Bitmap;)V

    .line 36
    .line 37
    .line 38
    invoke-static {p2}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public final synthetic u(Lcom/p1/mobile/putong/data/User;[I)V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance v1, Ll/fw00;

    .line 12
    .line 13
    invoke-direct {v1, p0, p2}, Ll/fw00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;[I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1, v1}, Ll/fsb0;->G(Lcom/p1/mobile/putong/data/Picture$ImageUri;Ll/y20;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic v(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->a:Lv/VImage;

    .line 2
    .line 3
    new-instance v1, Ll/pw00;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/pw00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;Lcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic w(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->b:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 14
    .line 15
    .line 16
    new-instance v0, Ll/nw00;

    .line 17
    .line 18
    invoke-direct {v0, p0, p1}, Ll/nw00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;Lcom/p1/mobile/putong/data/User;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 25
    .line 26
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->n()Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->c:Lv/VImage;

    .line 33
    .line 34
    invoke-interface {v0, v1, p1, p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final synthetic x(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->n()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->n()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    const-string v0, "from_MomentsFeedAct"

    .line 12
    .line 13
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;->X1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

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

.method public final synthetic y(Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->b:Lv/VDraweeView;

    .line 2
    .line 3
    new-instance v1, Ll/ow00;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/ow00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;Lcom/p1/mobile/putong/data/User;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->d:Lv/VText;

    .line 12
    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Interest;->emoji:Ljava/util/List;

    .line 25
    .line 26
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_0

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->e:Lv/VDraweeView;

    .line 33
    .line 34
    const/4 v1, 0x1

    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->e:Lv/VDraweeView;

    .line 41
    .line 42
    new-instance v1, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 45
    .line 46
    .line 47
    sget-object v2, Ll/uqb0;->X:Ll/hj5;

    .line 48
    .line 49
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 52
    .line 53
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 54
    .line 55
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Interest;->emoji:Ljava/util/List;

    .line 56
    .line 57
    const/4 v3, 0x0

    .line 58
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    check-cast p1, Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v2, p1}, Ll/hj5;->n(Ljava/lang/String;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string p1, ".png"

    .line 72
    .line 73
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    :cond_0
    return-void
.end method

.method public final synthetic z(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->n()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Landroid/content/Intent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedHeadView;->n()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-class v1, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesAct;

    .line 12
    .line 13
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 14
    .line 15
    .line 16
    const/16 p0, 0x48

    .line 17
    .line 18
    invoke-virtual {p1, v0, p0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
