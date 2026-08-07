.class public Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Lv/VDraweeView;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lv/VImage;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
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
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->s(Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Lcom/p1/mobile/putong/data/BubbleInfo;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;Lcom/p1/mobile/putong/data/BubbleInfo;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->n(Lcom/p1/mobile/putong/data/BubbleInfo;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->u(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->r(Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->p()V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;Lcom/p1/mobile/putong/data/BubbleInfo;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->q(Lcom/p1/mobile/putong/data/BubbleInfo;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;Lcom/p1/mobile/putong/data/BubbleInfo;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->o(Lcom/p1/mobile/putong/data/BubbleInfo;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Lcom/p1/mobile/putong/data/BubbleInfo;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->t(Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Lcom/p1/mobile/putong/data/BubbleInfo;Ll/uxj0;)V

    return-void
.end method


# virtual methods
.method public i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/tck;->b(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final j(Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 2

    .line 1
    iget-boolean p0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->haveLiked:Z

    .line 2
    .line 3
    xor-int/lit8 p0, p0, 0x1

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v0, "be_liked"

    .line 10
    .line 11
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "state_id"

    .line 16
    .line 17
    iget-object v1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 26
    .line 27
    const-string v1, "owner_id"

    .line 28
    .line 29
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    filled-new-array {p0, v0, p1}, [Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string p1, "e_other_state_like"

    .line 38
    .line 39
    const-string v0, "p_kankan_chat_popup"

    .line 40
    .line 41
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final k(Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 2

    .line 1
    iget-boolean p0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->haveLiked:Z

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "be_liked"

    .line 8
    .line 9
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v0, "state_id"

    .line 14
    .line 15
    iget-object v1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 24
    .line 25
    const-string v1, "owner_id"

    .line 26
    .line 27
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    filled-new-array {p0, v0, p1}, [Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string p1, "e_other_state_like"

    .line 36
    .line 37
    const-string v0, "p_kankan_chat_popup"

    .line 38
    .line 39
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final l(Lcom/p1/mobile/putong/data/BubbleInfo;Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->haveLiked:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v2, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 12
    .line 13
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-interface {v0, v1, v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Ll(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    new-instance v0, Ll/nck;

    .line 24
    .line 25
    invoke-direct {v0, p0, p1}, Ll/nck;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 26
    .line 27
    .line 28
    new-instance p1, Ll/ock;

    .line 29
    .line 30
    invoke-direct {p1, p0}, Ll/ock;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v0, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v2, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 48
    .line 49
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 50
    .line 51
    invoke-interface {v0, v1, v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Bg(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v1, Ll/pck;

    .line 60
    .line 61
    invoke-direct {v1, p0, p1, p2}, Ll/pck;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;Lcom/p1/mobile/putong/data/BubbleInfo;Lcom/p1/mobile/android/app/Act;)V

    .line 62
    .line 63
    .line 64
    new-instance p1, Ll/ock;

    .line 65
    .line 66
    invoke-direct {p1, p0}, Ll/ock;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v1, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->d:Lv/VText;

    .line 4
    .line 5
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 39
    .line 40
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Zk(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    const-string v1, "\u4ed6\u66f4\u65b0\u4e86\u72b6\u6001"

    .line 49
    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_0

    .line 57
    .line 58
    const-string v1, "\u5979\u66f4\u65b0\u4e86\u72b6\u6001"

    .line 59
    .line 60
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->d:Lv/VText;

    .line 61
    .line 62
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->d:Lv/VText;

    .line 67
    .line 68
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    :cond_2
    return-void
.end method

.method public final synthetic n(Lcom/p1/mobile/putong/data/BubbleInfo;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->j(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x0

    .line 5
    iput-boolean p2, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->haveLiked:Z

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->e:Lv/VImage;

    .line 8
    .line 9
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 10
    .line 11
    sget p2, Ll/ibc0;->k0:I

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic o(Lcom/p1/mobile/putong/data/BubbleInfo;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->j(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 2
    .line 3
    .line 4
    const/4 p3, 0x1

    .line 5
    iput-boolean p3, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->haveLiked:Z

    .line 6
    .line 7
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->e:Lv/VImage;

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 10
    .line 11
    sget v1, Ll/ibc0;->j0:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p3, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 18
    .line 19
    .line 20
    instance-of p3, p2, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 21
    .line 22
    if-eqz p3, :cond_0

    .line 23
    .line 24
    check-cast p2, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    .line 25
    .line 26
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->w(Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0, p0}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic p()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->d:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_1

    .line 8
    .line 9
    const/high16 v1, 0x42c80000    # 100.0f

    .line 10
    .line 11
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-gt v0, v1, :cond_0

    .line 16
    .line 17
    const/high16 v0, 0x429c0000    # 78.0f

    .line 18
    .line 19
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/high16 v0, 0x41800000    # 16.0f

    .line 25
    .line 26
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->d:Lv/VText;

    .line 31
    .line 32
    invoke-static {p0, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public final synthetic q(Lcom/p1/mobile/putong/data/BubbleInfo;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->l(Lcom/p1/mobile/putong/data/BubbleInfo;Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic r(Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->z(Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic s(Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 4
    .line 5
    const-string v1, "greetNumber"

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/lqb;->s4(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "coin"

    .line 16
    .line 17
    invoke-virtual {p0, p1, v1, p2, v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->x(Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Ljava/lang/String;Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Xe()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic t(Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Lcom/p1/mobile/putong/data/BubbleInfo;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p3}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    invoke-interface {p3}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Fh()I

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    if-lez p3, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->y(Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final u(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    move-object p0, p1

    .line 6
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 7
    .line 8
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 9
    .line 10
    const/16 v0, 0x190

    .line 11
    .line 12
    if-ne p0, v0, :cond_0

    .line 13
    .line 14
    const-string p0, "\u72b6\u6001\u5df2\u7ed3\u675f"

    .line 15
    .line 16
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 21
    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 25
    .line 26
    iget p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 27
    .line 28
    const p1, 0x9d75

    .line 29
    .line 30
    .line 31
    if-ne p0, p1, :cond_1

    .line 32
    .line 33
    const-string p0, "\u5bf9\u65b9\u62c9\u9ed1\u4e86\u4f60"

    .line 34
    .line 35
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    const-string p0, "\u5bf9\u65b9\u8d26\u53f7\u5f02\u5e38"

    .line 40
    .line 41
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public v(Lcom/p1/mobile/putong/data/BubbleInfo;Lcom/p1/mobile/android/app/Act;)V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->c:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Emotion;->text:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->m(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->d:Lv/VText;

    .line 14
    .line 15
    new-instance v1, Ll/lck;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/lck;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 21
    .line 22
    .line 23
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->haveLiked:Z

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->e:Lv/VImage;

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 30
    .line 31
    sget v2, Ll/ibc0;->j0:I

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 42
    .line 43
    sget v2, Ll/ibc0;->k0:I

    .line 44
    .line 45
    invoke-virtual {v0, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 50
    .line 51
    .line 52
    :goto_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->b:Lv/VDraweeView;

    .line 55
    .line 56
    iget-object v2, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 57
    .line 58
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 59
    .line 60
    sget v3, Ll/qa00;->F:I

    .line 61
    .line 62
    invoke-virtual {v0, v1, v2, v3, v3}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->e:Lv/VImage;

    .line 66
    .line 67
    new-instance v1, Ll/mck;

    .line 68
    .line 69
    invoke-direct {v1, p0, p1, p2}, Ll/mck;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;Lcom/p1/mobile/putong/data/BubbleInfo;Lcom/p1/mobile/android/app/Act;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 73
    .line 74
    .line 75
    const-string p2, "state_id"

    .line 76
    .line 77
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {p2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    iget-object v0, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 84
    .line 85
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 86
    .line 87
    const-string v1, "owner_id"

    .line 88
    .line 89
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    filled-new-array {p2, v0}, [Ll/pf60;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    const-string v0, "e_other_state"

    .line 98
    .line 99
    const-string v1, "p_kankan_chat_popup"

    .line 100
    .line 101
    invoke-static {v0, v1, p2}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->k(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public final w(Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/joa;->N3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->g2()Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/greet/GreetActViewModel;->k0()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Fh()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-lez v0, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->y(Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->e2()Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/greet/c;->getFrom()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    new-instance v2, Ll/qck;

    .line 53
    .line 54
    invoke-direct {v2, p0, p1, p2}, Ll/qck;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 55
    .line 56
    .line 57
    invoke-interface {v0, p1, v1, v2}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Pk(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_2
    :goto_0
    const-string v0, "privilege"

    .line 62
    .line 63
    const-string v1, ""

    .line 64
    .line 65
    invoke-virtual {p0, p1, v0, p2, v1}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->x(Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Ljava/lang/String;Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public final x(Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Ljava/lang/String;Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Message;->new_()Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "state_like"

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 12
    .line 13
    const-string v0, "\u8d5e\u4e86\u4f60\u7684\u72b6\u6001"

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageReference;->new_()Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "state"

    .line 22
    .line 23
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageReference;->type:Ljava/lang/String;

    .line 24
    .line 25
    iget-object p3, p3, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 26
    .line 27
    iput-object p3, v0, Lcom/p1/mobile/putong/core/data/MessageReference;->id:Ljava/lang/String;

    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_reference:Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 30
    .line 31
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/MessageChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 32
    .line 33
    .line 34
    move-result-object p3

    .line 35
    iput-object p3, p0, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 36
    .line 37
    iput-object p2, p0, Lcom/p1/mobile/putong/core/data/Message;->consumeType:Ljava/lang/String;

    .line 38
    .line 39
    iput-object p4, p0, Lcom/p1/mobile/putong/core/data/Message;->coinSign:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetAct;->e2()Lcom/p1/mobile/putong/core/ui/greet/a;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/greet/a;->J1(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final y(Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 7

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Wi()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/lqb;->t5()I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    new-instance v6, Ll/rck;

    .line 30
    .line 31
    invoke-direct {v6, p0, p1, p2}, Ll/rck;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 32
    .line 33
    .line 34
    const/4 v4, 0x0

    .line 35
    const/4 v5, 0x0

    .line 36
    move-object v2, p1

    .line 37
    invoke-interface/range {v1 .. v6}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->jf(Lcom/p1/mobile/android/app/Act;ILjava/lang/Runnable;Ljava/lang/Runnable;Ll/x20;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    move-object v2, p1

    .line 42
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 45
    .line 46
    const-string v0, "greetNumber"

    .line 47
    .line 48
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p1, v0}, Ll/lqb;->s4(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    const-string v0, "coin"

    .line 57
    .line 58
    invoke-virtual {p0, v2, v0, p2, p1}, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;->x(Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Ljava/lang/String;Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final z(Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/lqb;->k5()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/sck;

    .line 25
    .line 26
    invoke-direct {v1, p0, p1, p2}, Ll/sck;-><init>(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageStateNewView;Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method
