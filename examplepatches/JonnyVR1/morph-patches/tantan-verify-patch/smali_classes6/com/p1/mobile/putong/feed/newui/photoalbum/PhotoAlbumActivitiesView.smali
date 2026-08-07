.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public A:Ll/omg;

.field public B:Ll/w30;

.field public C:I

.field public D:I

.field public E:Z

.field public F:I

.field public G:Landroid/animation/Animator;

.field public H:I

.field public I:Ljava/lang/Runnable;

.field public J:Z

.field public a:Landroid/widget/FrameLayout;

.field public b:Landroid/view/View;

.field public c:Landroid/widget/LinearLayout;

.field public d:Lv/VDraweeView;

.field public e:Landroid/widget/TextView;

.field public f:Lv/VImage;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;

.field public k:Landroid/widget/LinearLayout;

.field public l:Lv/VText;

.field public m:Landroid/widget/ImageView;

.field public n:Lv/VText;

.field public o:Lv/VText;

.field public p:Lv/VImage;

.field public q:Lv/VText;

.field public r:Landroid/widget/FrameLayout;

.field public s:Lv/VButton;

.field public t:Lv/VDraweeView;

.field public u:Lv/VText;

.field public v:[Lv/VDraweeView;

.field public w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

.field public x:Ljava/lang/String;

.field public y:Lcom/p1/mobile/putong/feed/data/TopicMoment;

.field public z:Ll/jh5;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x4

    .line 5
    new-array p1, p1, [Lv/VDraweeView;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->v:[Lv/VDraweeView;

    .line 8
    .line 9
    const/4 p1, -0x1

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->D:I

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->H:I

    .line 14
    .line 15
    new-instance v0, Ll/x470;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/x470;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I:Ljava/lang/Runnable;

    .line 21
    .line 22
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->J:Z

    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 25
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x4

    .line 26
    new-array p1, p1, [Lv/VDraweeView;

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->v:[Lv/VDraweeView;

    const/4 p1, -0x1

    .line 27
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->D:I

    const/4 p1, 0x0

    .line 28
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->H:I

    .line 29
    new-instance p2, Ll/x470;

    invoke-direct {p2, p0}, Ll/x470;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I:Ljava/lang/Runnable;

    .line 30
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->J:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 31
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x4

    .line 32
    new-array p1, p1, [Lv/VDraweeView;

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->v:[Lv/VDraweeView;

    const/4 p1, -0x1

    .line 33
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->D:I

    const/4 p1, 0x0

    .line 34
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->H:I

    .line 35
    new-instance p2, Ll/x470;

    invoke-direct {p2, p0}, Ll/x470;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I:Ljava/lang/Runnable;

    .line 36
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->J:Z

    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->u0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->n0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->z0()V

    return-void
.end method

.method public static synthetic D(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->h0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->Z(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->d0(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->g0(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->b0(Landroid/view/ViewGroup;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->m0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->v0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->y0()V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->l0()V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v2, 0x0

    .line 12
    const-string v3, "p_activity"

    .line 13
    .line 14
    invoke-virtual {v0, v1, p0, v2, v3}, Ll/jka;->m7(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)Lrx/c;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->t0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/feed/data/MomentActivity;ILl/omg;ILl/pf60;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->p0(Lcom/p1/mobile/putong/feed/data/MomentActivity;ILl/omg;ILl/pf60;)V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->A0(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->U0()V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;ZLcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->Y(ZLcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->k0(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->i0(Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->j0(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->e0(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/ViewGroup;)V

    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/data/Counter;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->flower:Lcom/p1/mobile/putong/data/FeedFlower;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/data/FeedFlower;->count:I

    .line 4
    .line 5
    if-lez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->o0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;ZLcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->f0(ZLcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->q0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->a0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->r0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic x(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->x0(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->S(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->c0(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/ViewGroup;)V

    return-void
.end method


# virtual methods
.method public final synthetic A0(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 5

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_8

    .line 6
    .line 7
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->g:Lv/VText;

    .line 8
    .line 9
    invoke-static {p2}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    const-string v0, ""

    .line 14
    .line 15
    if-eqz p2, :cond_1

    .line 16
    .line 17
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 18
    .line 19
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-eqz p2, :cond_1

    .line 24
    .line 25
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->g:Lv/VText;

    .line 26
    .line 27
    invoke-virtual {p2}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    if-nez p2, :cond_1

    .line 40
    .line 41
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 42
    .line 43
    invoke-static {p2}, Ll/pfh;->a(Lcom/p1/mobile/putong/feed/data/MomentActivity;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-nez v1, :cond_1

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->g:Lv/VText;

    .line 54
    .line 55
    invoke-virtual {v1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    const-string v2, "usertagname"

    .line 64
    .line 65
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 70
    .line 71
    if-nez v2, :cond_0

    .line 72
    .line 73
    move-object v2, v0

    .line 74
    goto :goto_0

    .line 75
    :cond_0
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 76
    .line 77
    :goto_0
    const-string v3, "moments_user_id"

    .line 78
    .line 79
    invoke-static {v3, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    filled-new-array {v1, v2}, [Ll/pf60;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    const-string v2, "p_activity"

    .line 88
    .line 89
    invoke-static {p2, v2, v1}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 90
    .line 91
    .line 92
    :cond_1
    sget-object p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->j:Ljava/lang/String;

    .line 93
    .line 94
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->x:Ljava/lang/String;

    .line 95
    .line 96
    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result p2

    .line 100
    if-eqz p2, :cond_2

    .line 101
    .line 102
    const-string p2, "photo_album_praised"

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_2
    const-string p2, "from_activities_moment"

    .line 106
    .line 107
    :goto_1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->a(Landroid/content/Context;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    invoke-virtual {v1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->f(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 116
    .line 117
    .line 118
    move-result-object p2

    .line 119
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 120
    .line 121
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 126
    .line 127
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->userIds:Ljava/util/List;

    .line 128
    .line 129
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 130
    .line 131
    invoke-virtual {p0, v2, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->N(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 136
    .line 137
    .line 138
    move-result-object p2

    .line 139
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 140
    .line 141
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 142
    .line 143
    const-string v2, "merge_likes"

    .line 144
    .line 145
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    const/4 v3, 0x1

    .line 150
    const-string v4, "like"

    .line 151
    .line 152
    if-nez v1, :cond_4

    .line 153
    .line 154
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 155
    .line 156
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 157
    .line 158
    invoke-static {v1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    if-eqz v1, :cond_3

    .line 163
    .line 164
    goto :goto_2

    .line 165
    :cond_3
    const/4 v1, 0x0

    .line 166
    goto :goto_3

    .line 167
    :cond_4
    :goto_2
    move v1, v3

    .line 168
    :goto_3
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->v(Z)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 169
    .line 170
    .line 171
    move-result-object p2

    .line 172
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 173
    .line 174
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->n(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 175
    .line 176
    .line 177
    move-result-object p2

    .line 178
    invoke-virtual {p2, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->t(Z)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 179
    .line 180
    .line 181
    move-result-object p2

    .line 182
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->momentValue:Ljava/lang/String;

    .line 183
    .line 184
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 189
    .line 190
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 191
    .line 192
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->W(Lcom/p1/mobile/putong/feed/data/ActivityActionApi;)Z

    .line 193
    .line 194
    .line 195
    move-result p2

    .line 196
    if-eqz p2, :cond_5

    .line 197
    .line 198
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 199
    .line 200
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/MomentActivity;->messageid:Ljava/lang/String;

    .line 201
    .line 202
    :cond_5
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->p(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->b()Landroid/content/Intent;

    .line 207
    .line 208
    .line 209
    move-result-object p1

    .line 210
    if-nez p1, :cond_6

    .line 211
    .line 212
    goto :goto_4

    .line 213
    :cond_6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 214
    .line 215
    .line 216
    move-result-object p2

    .line 217
    sget v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->h:I

    .line 218
    .line 219
    invoke-virtual {p2, p1, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 220
    .line 221
    .line 222
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 223
    .line 224
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 225
    .line 226
    const-string p2, "comment_reply"

    .line 227
    .line 228
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 229
    .line 230
    .line 231
    move-result p1

    .line 232
    if-nez p1, :cond_7

    .line 233
    .line 234
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 235
    .line 236
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 237
    .line 238
    const-string p2, "comment"

    .line 239
    .line 240
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 241
    .line 242
    .line 243
    move-result p1

    .line 244
    if-nez p1, :cond_7

    .line 245
    .line 246
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 247
    .line 248
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 249
    .line 250
    invoke-static {p1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 251
    .line 252
    .line 253
    move-result p1

    .line 254
    if-nez p1, :cond_7

    .line 255
    .line 256
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 257
    .line 258
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 259
    .line 260
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 261
    .line 262
    .line 263
    move-result p1

    .line 264
    if-nez p1, :cond_7

    .line 265
    .line 266
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 267
    .line 268
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 269
    .line 270
    const-string p2, "comment_like"

    .line 271
    .line 272
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 273
    .line 274
    .line 275
    move-result p1

    .line 276
    if-eqz p1, :cond_8

    .line 277
    .line 278
    :cond_7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->U0()V

    .line 279
    .line 280
    .line 281
    :cond_8
    :goto_4
    return-void
.end method

.method public B0(Ll/b370;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->wb()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p1, v0, v1}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance v0, Ll/d570;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/d570;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final C0(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 11

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->U0()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    new-array v0, v0, [Ll/tfj0$a;

    .line 6
    .line 7
    const-string v1, "e_red_flower"

    .line 8
    .line 9
    const-string v2, "p_activity"

    .line 10
    .line 11
    invoke-static {v1, v2, v0}, Ll/tfj0;->b(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    invoke-static {}, Ll/bch;->b()Ll/bch;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Ll/bch;->c()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 31
    .line 32
    iget-object v6, v0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    if-nez p1, :cond_0

    .line 36
    .line 37
    move-object v7, v0

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 40
    .line 41
    move-object v7, v1

    .line 42
    :goto_0
    if-nez p1, :cond_1

    .line 43
    .line 44
    :goto_1
    move-object v8, v0

    .line 45
    goto :goto_2

    .line 46
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :goto_2
    const-string p1, "red_flower"

    .line 50
    .line 51
    invoke-static {p1}, Lcom/p1/mobile/putong/data/Channel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Channel;

    .line 52
    .line 53
    .line 54
    move-result-object v9

    .line 55
    new-instance v10, Ll/y370;

    .line 56
    .line 57
    invoke-direct {v10, p0}, Ll/y370;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;)V

    .line 58
    .line 59
    .line 60
    invoke-interface/range {v3 .. v10}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Vk(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Channel;Ll/y20;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public D0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->J:Z

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->G:Landroid/animation/Animator;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->G:Landroid/animation/Animator;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->G:Landroid/animation/Animator;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public final E0(Lcom/p1/mobile/putong/feed/data/MomentActivity;ILl/omg;I)V
    .locals 10

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 2
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->A:Ll/omg;

    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->C:I

    .line 4
    iput p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->F:I

    .line 5
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->j:Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;

    const/4 v0, 0x0

    invoke-static {p3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    invoke-static {}, Ll/cmg;->j0()Z

    move-result p3

    if-eqz p3, :cond_3

    .line 7
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->c:Landroid/widget/LinearLayout;

    if-nez p4, :cond_0

    const/high16 v1, 0x40c00000    # 6.0f

    goto :goto_0

    :cond_0
    const/high16 v1, 0x41800000    # 16.0f

    :goto_0
    invoke-static {v1}, Ll/qa00;->d(F)I

    move-result v1

    invoke-static {p3, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 8
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->b:Landroid/view/View;

    if-nez p4, :cond_1

    const/high16 v1, 0x41b80000    # 23.0f

    goto :goto_1

    :cond_1
    const/high16 v1, 0x42040000    # 33.0f

    :goto_1
    invoke-static {v1}, Ll/qa00;->d(F)I

    move-result v1

    invoke-static {p3, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 9
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->t:Lv/VDraweeView;

    if-nez p4, :cond_2

    const/high16 p4, 0x3f800000    # 1.0f

    goto :goto_2

    :cond_2
    const/high16 p4, 0x41300000    # 11.0f

    :goto_2
    invoke-static {p4}, Ll/qa00;->d(F)I

    move-result p4

    invoke-static {p3, p4}, Ll/bnl0;->X(Landroid/view/View;I)V

    :cond_3
    const/4 p3, -0x1

    .line 10
    invoke-virtual {p0, p3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->getUserAndMoment()Ll/pf60;

    move-result-object p3

    .line 12
    iget-object p4, p3, Ll/pf60;->a:Ljava/lang/Object;

    check-cast p4, Lcom/p1/mobile/putong/data/User;

    .line 13
    iget-object p3, p3, Ll/pf60;->b:Ljava/lang/Object;

    check-cast p3, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->e:Landroid/widget/TextView;

    if-nez p4, :cond_4

    .line 15
    const-string p1, "\u3010\u5f02\u5e38\u7528\u6237\u3011"

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->d:Lv/VDraweeView;

    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    return-void

    .line 17
    :cond_4
    iget-object v2, p4, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    invoke-static {p3, v2}, Ll/at0;->a(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    sget-object v1, Ll/uqb0;->b0:Ll/sre0;

    iget-object v1, v1, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    move-result-object v2

    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->f:Lv/VImage;

    invoke-interface {v1, v2, p4, v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->d:Lv/VDraweeView;

    invoke-static {p3, v1, p4}, Ll/at0;->e(Lcom/p1/mobile/putong/feed/data/Moment;Lv/VDraweeView;Lcom/p1/mobile/putong/data/User;)V

    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->t:Lv/VDraweeView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 21
    iget-object v1, p4, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/HeadFrame;->expiredTime:Ljava/util/List;

    .line 22
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/User;->needShowFrame()Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_5

    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/User;->headFrameUrl()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_5

    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->t:Lv/VDraweeView;

    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->t:Lv/VDraweeView;

    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/User;->headFrameUrl()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v3, v5}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->t:Lv/VDraweeView;

    const/high16 v3, 0x41400000    # 12.0f

    invoke-static {v3}, Ll/qa00;->d(F)I

    move-result v3

    invoke-static {v1, v3}, Ll/bnl0;->V(Landroid/view/View;I)V

    goto :goto_3

    .line 26
    :cond_5
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 27
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Double;

    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v5

    invoke-static {}, Ll/pzi0;->o()J

    move-result-wide v7

    long-to-double v7, v7

    cmpl-double v1, v5, v7

    if-lez v1, :cond_6

    iget-object v1, p4, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    iget-object v1, v1, Lcom/p1/mobile/putong/data/HeadFrame;->url:Ljava/util/List;

    .line 28
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->t:Lv/VDraweeView;

    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 30
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->t:Lv/VDraweeView;

    iget-object v5, p4, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    iget-object v5, v5, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    iget-object v5, v5, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    iget-object v5, v5, Lcom/p1/mobile/putong/data/HeadFrame;->url:Ljava/util/List;

    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v1, v3, v5}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->t:Lv/VDraweeView;

    const/high16 v3, 0x40e00000    # 7.0f

    invoke-static {v3}, Ll/qa00;->d(F)I

    move-result v3

    invoke-static {v1, v3}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 32
    :cond_6
    :goto_3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->n:Lv/VText;

    iget-wide v5, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->createdTime:D

    invoke-static {v5, v6}, Ll/pzi0;->G(D)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->G0()V

    .line 34
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    const-string v3, "moment_swipe"

    invoke-static {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    const-string v3, "like"

    const/4 v5, 0x3

    const/4 v6, 0x0

    if-eqz v1, :cond_7

    .line 35
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->J0(Lcom/p1/mobile/putong/data/User;)V

    goto/16 :goto_6

    .line 36
    :cond_7
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    const-string v7, "follow"

    invoke-static {v1, v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 37
    invoke-virtual {p0, p4, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->H0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;)V

    goto/16 :goto_6

    .line 38
    :cond_8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->U(Lcom/p1/mobile/putong/feed/data/MomentActivity;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->r:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->h:Lv/VText;

    invoke-virtual {v1, v0, v0, v0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 41
    new-instance v1, Landroid/text/SpannableStringBuilder;

    iget-object v7, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->value:Ljava/lang/String;

    invoke-direct {v1, v7}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 42
    iget-object v7, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->h:Lv/VText;

    invoke-virtual {p0, p1, v1, v0, v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->K(Lcom/p1/mobile/putong/feed/data/MomentActivity;Landroid/text/SpannableStringBuilder;ZLcom/p1/mobile/putong/feed/data/MomentMessage;)Landroid/text/SpannableStringBuilder;

    move-result-object v1

    invoke-virtual {v7, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->i:Lv/VText;

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->h:Lv/VText;

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v7

    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_6

    .line 46
    :cond_9
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    invoke-static {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_d

    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    const-string v7, "merge_likes"

    .line 47
    invoke-static {v1, v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_a

    goto :goto_5

    .line 48
    :cond_a
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    const-string v7, "comment_like"

    invoke-static {v1, v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_c

    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    const-string v7, "topic_comment_like"

    .line 49
    invoke-static {v1, v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_b

    goto :goto_4

    .line 50
    :cond_b
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    const-string v7, "forward_moment"

    invoke-static {v1, v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->r:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->h:Lv/VText;

    invoke-virtual {v1, v0, v0, v0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->h:Lv/VText;

    const-string v7, "\u8f6c\u53d1\u4e86\u4f60\u7684\u89c6\u9891"

    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_6

    .line 55
    :cond_c
    :goto_4
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->r:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->h:Lv/VText;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->getLikeFontEmoj()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    sget v9, Lcom/p1/mobile/putong/feed/R$string;->C0:I

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 58
    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_6

    .line 60
    :cond_d
    :goto_5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->r:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->h:Lv/VText;

    sget v7, Ll/lbc0;->d2:I

    invoke-virtual {v1, v7, v0, v0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 62
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->getLikeFontEmoj()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    sget v8, Lcom/p1/mobile/putong/feed/R$string;->l1:I

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    iget-object v7, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->h:Lv/VText;

    invoke-virtual {v7, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 67
    :cond_e
    :goto_6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->M0()V

    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->i:Lv/VText;

    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->replyMessageId:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_f

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->U(Lcom/p1/mobile/putong/feed/data/MomentActivity;)Z

    move-result v1

    if-eqz v1, :cond_f

    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->replyMessageId:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->L(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/MomentMessage;

    move-result-object v1

    .line 71
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_f

    .line 72
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->i:Lv/VText;

    invoke-static {v2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 73
    new-instance v2, Landroid/text/SpannableStringBuilder;

    iget-object v7, v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    invoke-direct {v2, v7}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 74
    iget-object v7, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->i:Lv/VText;

    invoke-virtual {p0, p1, v2, v4, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->K(Lcom/p1/mobile/putong/feed/data/MomentActivity;Landroid/text/SpannableStringBuilder;ZLcom/p1/mobile/putong/feed/data/MomentMessage;)Landroid/text/SpannableStringBuilder;

    move-result-object v1

    invoke-virtual {v7, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->i:Lv/VText;

    invoke-virtual {v1, v0}, Landroid/view/View;->setFocusable(Z)V

    .line 76
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->i:Lv/VText;

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 77
    new-instance v1, Landroid/text/SpannableStringBuilder;

    const-string v2, "\u56de\u590d\u4e86\u4f60\u7684\u8bc4\u8bba\uff1a"

    invoke-direct {v1, v2}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 78
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->h:Lv/VText;

    invoke-virtual {v2}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v1, v7}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->i:Lv/VText;

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 80
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->i:Lv/VText;

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 81
    :cond_f
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I0(Lcom/p1/mobile/putong/feed/data/MomentActivity;ILcom/p1/mobile/putong/feed/data/Moment;)V

    .line 82
    invoke-virtual {p0, p3, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->Q(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;)V

    .line 83
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    const-string p2, "comment_reply"

    .line 84
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_11

    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    const-string p2, "comment"

    .line 85
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_10

    goto :goto_7

    :cond_10
    move p1, v0

    goto :goto_8

    :cond_11
    :goto_7
    move p1, v4

    .line 86
    :goto_8
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->o:Lv/VText;

    invoke-virtual {p2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object p2

    invoke-virtual {p2, v4}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 87
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->q:Lv/VText;

    invoke-virtual {p2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object p2

    invoke-virtual {p2, v4}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 88
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->q:Lv/VText;

    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 89
    const-string p2, "p_activity"

    if-eqz p1, :cond_12

    invoke-static {}, Ll/cmg;->o()Z

    move-result p1

    if-nez p1, :cond_12

    .line 90
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->o:Lv/VText;

    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 91
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->o:Lv/VText;

    const-string v1, "\u56de\u590d\u8bc4\u8bba"

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->o:Lv/VText;

    new-instance v1, Ll/y470;

    invoke-direct {v1, p0, p4, p3}, Ll/y470;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;)V

    invoke-static {p1, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 93
    invoke-static {}, Ll/cmg;->q()Z

    move-result p1

    if-eqz p1, :cond_15

    .line 94
    invoke-static {}, Ll/ksg;->d0()Z

    move-result p1

    invoke-static {p1}, Ll/cmg;->F(Z)Z

    move-result p1

    if-eqz p1, :cond_15

    .line 95
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    move-result-object p1

    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->counter_()Lcom/p1/mobile/putong/data/Counter;

    move-result-object p1

    iget-object p1, p1, Lcom/p1/mobile/putong/data/Counter;->flower:Lcom/p1/mobile/putong/data/FeedFlower;

    iget p1, p1, Lcom/p1/mobile/putong/data/FeedFlower;->count:I

    if-lez p1, :cond_15

    .line 96
    const-string p1, "e_red_flower"

    new-array v0, v0, [Ll/tfj0$a;

    invoke-static {p1, p2, v0}, Ll/tfj0;->d(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 97
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->q:Lv/VText;

    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 98
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->q:Lv/VText;

    new-instance p2, Ll/z470;

    invoke-direct {p2, p0, p4, p3}, Ll/z470;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;)V

    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    goto :goto_9

    .line 99
    :cond_12
    invoke-static {}, Ll/cmg;->L()Z

    move-result p1

    if-eqz p1, :cond_14

    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 100
    invoke-static {p1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_14

    .line 101
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_13

    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 102
    invoke-static {p1}, Ll/pfh;->b(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_13

    .line 103
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->q:Lv/VText;

    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 104
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->o:Lv/VText;

    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 105
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->o:Lv/VText;

    const-string p3, "\u804a\u804a"

    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 106
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 107
    const-string p3, "moments_user_id"

    invoke-static {p3, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object p1

    filled-new-array {p1}, [Ll/pf60;

    move-result-object p1

    .line 108
    const-string p3, "e_activity_chat"

    invoke-static {p3, p2, p1}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 109
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->o:Lv/VText;

    new-instance p2, Ll/a570;

    invoke-direct {p2, p0}, Ll/a570;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;)V

    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    goto :goto_9

    .line 110
    :cond_13
    invoke-virtual {p0, p3, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->L0(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;)V

    goto :goto_9

    .line 111
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->o:Lv/VText;

    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 112
    :cond_15
    :goto_9
    invoke-static {}, Ll/cmg;->L()Z

    move-result p1

    if-eqz p1, :cond_1a

    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 113
    invoke-static {p1}, Ll/pfh;->c(Lcom/p1/mobile/putong/feed/data/MomentActivity;)Z

    move-result p1

    if-eqz p1, :cond_1a

    .line 114
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    invoke-static {p1}, Ll/pfh;->e(Lcom/p1/mobile/putong/feed/data/MomentActivity;)Z

    move-result p1

    if-eqz p1, :cond_17

    .line 115
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    invoke-static {p1}, Ll/pfh;->b(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_16

    .line 116
    const-string v6, "\u597d\u53cb"

    goto :goto_a

    .line 117
    :cond_16
    const-string v6, "\u4f60\u559c\u6b22\u7684\u4eba"

    .line 118
    :cond_17
    :goto_a
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_19

    .line 119
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->g:Lv/VText;

    invoke-virtual {p1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object p1

    invoke-virtual {p1, v4}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 120
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->g:Lv/VText;

    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 121
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->g:Lv/VText;

    invoke-virtual {p1, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 122
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->D:I

    if-lez p1, :cond_18

    .line 123
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->e:Landroid/widget/TextView;

    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->g:Lv/VText;

    .line 124
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object p0

    invoke-virtual {p0, v6}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result p0

    float-to-int p0, p0

    sub-int/2addr p1, p0

    sget p0, Ll/qa00;->k:I

    sub-int/2addr p1, p0

    .line 125
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setMaxWidth(I)V

    :cond_18
    return-void

    .line 126
    :cond_19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->O()V

    return-void

    .line 127
    :cond_1a
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->O()V

    return-void
.end method

.method public F0(Ll/b370;Lcom/p1/mobile/putong/feed/data/MomentActivity;ILl/omg;I)V
    .locals 6

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->B0(Ll/b370;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 9
    .line 10
    iget-object v1, v1, Ll/jka;->S0:Lrx/subjects/b;

    .line 11
    .line 12
    invoke-virtual {p1, v0, v1}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/x370;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/x370;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ll/cmg;->q()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    invoke-static {}, Ll/ksg;->d0()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    invoke-static {v0}, Ll/cmg;->F(Z)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->counter()Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    new-instance v2, Ll/i470;

    .line 57
    .line 58
    invoke-direct {v2}, Ll/i470;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    iget-object v3, p2, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 74
    .line 75
    invoke-interface {v2, v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->M9(Ljava/lang/String;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {v2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    new-instance v3, Ll/zqz;

    .line 84
    .line 85
    invoke-direct {v3}, Ll/zqz;-><init>()V

    .line 86
    .line 87
    .line 88
    invoke-static {v1, v2, v3}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {p1, v0, v1}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    new-instance v0, Ll/t470;

    .line 97
    .line 98
    move-object v1, p0

    .line 99
    move-object v2, p2

    .line 100
    move v3, p3

    .line 101
    move-object v4, p4

    .line 102
    move v5, p5

    .line 103
    invoke-direct/range {v0 .. v5}, Ll/t470;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/feed/data/MomentActivity;ILl/omg;I)V

    .line 104
    .line 105
    .line 106
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 111
    .line 112
    .line 113
    return-void

    .line 114
    :cond_0
    move-object v1, p0

    .line 115
    move-object v2, p2

    .line 116
    move v3, p3

    .line 117
    move-object v4, p4

    .line 118
    move v5, p5

    .line 119
    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->E0(Lcom/p1/mobile/putong/feed/data/MomentActivity;ILl/omg;I)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public final G0()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->j:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->x:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 12
    .line 13
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->read:Z

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->b:Landroid/view/View;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    const/16 v0, 0x8

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 v0, 0x0

    .line 26
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 27
    .line 28
    .line 29
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->e:Landroid/widget/TextView;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    sget v2, Ll/k9c0;->l:I

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->h:Lv/VText;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    sget v2, Ll/k9c0;->C:I

    .line 59
    .line 60
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->i:Lv/VText;

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    sget v2, Ll/k9c0;->C:I

    .line 78
    .line 79
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->n:Lv/VText;

    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    sget v1, Ll/k9c0;->k:I

    .line 97
    .line 98
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public final H(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/k570;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final H0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 6

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->r:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 15
    .line 16
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    const/4 v1, -0x1

    .line 21
    const/4 v2, 0x1

    .line 22
    if-eqz p2, :cond_2

    .line 23
    .line 24
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 25
    .line 26
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 27
    .line 28
    const-string v3, "matched"

    .line 29
    .line 30
    invoke-static {p2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    if-nez p2, :cond_0

    .line 35
    .line 36
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 37
    .line 38
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 39
    .line 40
    const-string v4, "following"

    .line 41
    .line 42
    invoke-static {p2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    if-eqz p2, :cond_2

    .line 47
    .line 48
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    sget v5, Ll/lbc0;->n4:I

    .line 55
    .line 56
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    invoke-virtual {p2, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 61
    .line 62
    .line 63
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    .line 64
    .line 65
    invoke-virtual {p2, v2}, Landroid/view/View;->setSelected(Z)V

    .line 66
    .line 67
    .line 68
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    .line 69
    .line 70
    invoke-virtual {p2, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 74
    .line 75
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 76
    .line 77
    invoke-static {p1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    .line 82
    .line 83
    if-eqz p1, :cond_1

    .line 84
    .line 85
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->N2:I

    .line 86
    .line 87
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(I)V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    .line 91
    .line 92
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    invoke-virtual {p2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    sget v1, Ll/k9c0;->F:I

    .line 101
    .line 102
    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 103
    .line 104
    .line 105
    move-result p2

    .line 106
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 107
    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_1
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->P2:I

    .line 111
    .line 112
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(I)V

    .line 113
    .line 114
    .line 115
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    .line 116
    .line 117
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 118
    .line 119
    .line 120
    move-result-object p2

    .line 121
    invoke-virtual {p2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    sget v1, Ll/k9c0;->F:I

    .line 126
    .line 127
    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 128
    .line 129
    .line 130
    move-result p2

    .line 131
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 132
    .line 133
    .line 134
    goto :goto_0

    .line 135
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    .line 136
    .line 137
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 138
    .line 139
    .line 140
    move-result-object p2

    .line 141
    sget v3, Ll/lbc0;->q4:I

    .line 142
    .line 143
    invoke-virtual {p2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 144
    .line 145
    .line 146
    move-result-object p2

    .line 147
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 148
    .line 149
    .line 150
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    .line 151
    .line 152
    const-string p2, "\u56de\u5173"

    .line 153
    .line 154
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 155
    .line 156
    .line 157
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    .line 158
    .line 159
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 160
    .line 161
    .line 162
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    .line 163
    .line 164
    invoke-static {p1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 165
    .line 166
    .line 167
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 168
    .line 169
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 170
    .line 171
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 172
    .line 173
    invoke-virtual {p1, p2}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->J(Lcom/p1/mobile/putong/data/User;)V

    .line 182
    .line 183
    .line 184
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->h:Lv/VText;

    .line 185
    .line 186
    invoke-virtual {p1, v0, v0, v0, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 187
    .line 188
    .line 189
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->h:Lv/VText;

    .line 190
    .line 191
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->L2:I

    .line 192
    .line 193
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 194
    .line 195
    .line 196
    return-void
.end method

.method public I()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public final I0(Lcom/p1/mobile/putong/feed/data/MomentActivity;ILcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 3

    .line 1
    if-nez p2, :cond_2

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->X(Lcom/p1/mobile/putong/feed/data/MomentActivity;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const-string v0, ""

    .line 8
    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    sget-object p1, Ll/v370;->a:Ljava/util/Map;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->reference:Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 24
    .line 25
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->y:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 31
    .line 32
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->u:Lv/VText;

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_1
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_2

    .line 43
    .line 44
    const-string p1, "\\s*|\t|\r|\n"

    .line 45
    .line 46
    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iget-object v1, p3, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {p1, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->u:Lv/VText;

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    :cond_2
    :goto_1
    const/4 p1, 0x7

    .line 66
    const/4 v0, 0x0

    .line 67
    if-ne p2, p1, :cond_3

    .line 68
    .line 69
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_3

    .line 74
    .line 75
    iget-object p1, p3, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 76
    .line 77
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    check-cast p1, Lcom/p1/mobile/putong/data/Audio;

    .line 82
    .line 83
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->u:Lv/VText;

    .line 84
    .line 85
    iget p1, p1, Lcom/p1/mobile/putong/data/Audio;->duration:F

    .line 86
    .line 87
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    const-string p2, "%s\'\'"

    .line 100
    .line 101
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_3
    :goto_2
    if-ge v0, p2, :cond_8

    .line 110
    .line 111
    if-nez p3, :cond_4

    .line 112
    .line 113
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 114
    .line 115
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->v:[Lv/VDraweeView;

    .line 116
    .line 117
    aget-object v1, v1, v0

    .line 118
    .line 119
    invoke-virtual {p1, v1}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 120
    .line 121
    .line 122
    goto :goto_4

    .line 123
    :cond_4
    iget-object p1, p3, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 124
    .line 125
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 130
    .line 131
    instance-of v1, p1, Lcom/p1/mobile/putong/data/Video;

    .line 132
    .line 133
    if-eqz v1, :cond_5

    .line 134
    .line 135
    check-cast p1, Lcom/p1/mobile/putong/data/Video;

    .line 136
    .line 137
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 138
    .line 139
    goto :goto_3

    .line 140
    :cond_5
    instance-of v1, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 141
    .line 142
    if-eqz v1, :cond_6

    .line 143
    .line 144
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 145
    .line 146
    goto :goto_3

    .line 147
    :cond_6
    const/4 p1, 0x0

    .line 148
    :goto_3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    if-eqz v1, :cond_7

    .line 153
    .line 154
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 155
    .line 156
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->v:[Lv/VDraweeView;

    .line 157
    .line 158
    aget-object v2, v2, v0

    .line 159
    .line 160
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->momentPictureSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    invoke-virtual {v1, v2, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 165
    .line 166
    .line 167
    goto :goto_4

    .line 168
    :cond_7
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 169
    .line 170
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->v:[Lv/VDraweeView;

    .line 171
    .line 172
    aget-object v1, v1, v0

    .line 173
    .line 174
    invoke-virtual {p1, v1}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 175
    .line 176
    .line 177
    :goto_4
    add-int/lit8 v0, v0, 0x1

    .line 178
    .line 179
    goto :goto_2

    .line 180
    :cond_8
    return-void
.end method

.method public final J(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final J0(Lcom/p1/mobile/putong/data/User;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->r:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    sget v3, Ll/lbc0;->n4:I

    .line 21
    .line 22
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    .line 35
    .line 36
    const/4 v2, -0x1

    .line 37
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 41
    .line 42
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    const-string v2, "p_activity"

    .line 47
    .line 48
    const/4 v3, 0x1

    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 54
    .line 55
    const-string v4, "matched"

    .line 56
    .line 57
    invoke-static {v0, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_0

    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    .line 64
    .line 65
    const-string v4, "\u804a\u5929"

    .line 66
    .line 67
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    .line 71
    .line 72
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 73
    .line 74
    .line 75
    goto :goto_2

    .line 76
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 77
    .line 78
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_1

    .line 83
    .line 84
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 85
    .line 86
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 87
    .line 88
    const-string v4, "liked"

    .line 89
    .line 90
    invoke-static {v0, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-eqz v0, :cond_1

    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    .line 97
    .line 98
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 99
    .line 100
    .line 101
    goto :goto_2

    .line 102
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->pq()Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-nez v0, :cond_3

    .line 111
    .line 112
    invoke-static {}, Ll/ksg;->D()Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-nez v0, :cond_2

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    .line 120
    .line 121
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    .line 125
    .line 126
    const-string v3, "\u67e5\u770b"

    .line 127
    .line 128
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 129
    .line 130
    .line 131
    goto :goto_2

    .line 132
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    .line 133
    .line 134
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 135
    .line 136
    .line 137
    move-result v3

    .line 138
    if-eqz v3, :cond_4

    .line 139
    .line 140
    const-string v3, "\u5979"

    .line 141
    .line 142
    goto :goto_1

    .line 143
    :cond_4
    const-string v3, "\u4ed6"

    .line 144
    .line 145
    :goto_1
    const-string v4, "\u559c\u6b22"

    .line 146
    .line 147
    invoke-virtual {v4, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v3

    .line 151
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 152
    .line 153
    .line 154
    const-string v0, "user_id"

    .line 155
    .line 156
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 157
    .line 158
    invoke-static {v0, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    filled-new-array {v0}, [Ll/pf60;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    const-string v3, "e_respond_match"

    .line 167
    .line 168
    invoke-static {v3, v2, v0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 169
    .line 170
    .line 171
    :goto_2
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->pq()Z

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    if-nez v0, :cond_5

    .line 180
    .line 181
    invoke-static {}, Ll/cmg;->i()Z

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    if-eqz v0, :cond_5

    .line 186
    .line 187
    invoke-static {}, Ll/ksg;->D()Z

    .line 188
    .line 189
    .line 190
    move-result v0

    .line 191
    if-eqz v0, :cond_5

    .line 192
    .line 193
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 194
    .line 195
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->d:Lv/VDraweeView;

    .line 196
    .line 197
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 198
    .line 199
    .line 200
    move-result-object v4

    .line 201
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 202
    .line 203
    .line 204
    move-result-object v4

    .line 205
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v4

    .line 209
    const/4 v5, 0x4

    .line 210
    const/16 v6, 0x1e

    .line 211
    .line 212
    invoke-virtual {v0, v3, v4, v5, v6}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 213
    .line 214
    .line 215
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->h:Lv/VText;

    .line 216
    .line 217
    invoke-virtual {v0, v1, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 218
    .line 219
    .line 220
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->h:Lv/VText;

    .line 221
    .line 222
    const-string v0, "\u901a\u8fc7\u4f60\u53d1\u5e03\u7684\u52a8\u6001\u559c\u6b22\u4e86\u4f60"

    .line 223
    .line 224
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 225
    .line 226
    .line 227
    const-string p0, "moments_user_id"

    .line 228
    .line 229
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 230
    .line 231
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 232
    .line 233
    .line 234
    move-result-object p0

    .line 235
    filled-new-array {p0}, [Ll/pf60;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    const-string p1, "e_card_detail"

    .line 240
    .line 241
    invoke-static {p1, v2, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 242
    .line 243
    .line 244
    return-void
.end method

.method public final K(Lcom/p1/mobile/putong/feed/data/MomentActivity;Landroid/text/SpannableStringBuilder;ZLcom/p1/mobile/putong/feed/data/MomentMessage;)Landroid/text/SpannableStringBuilder;
    .locals 8

    .line 1
    invoke-virtual {p2}, Landroid/text/SpannableStringBuilder;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, " "

    .line 8
    .line 9
    invoke-virtual {p2, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 10
    .line 11
    .line 12
    :cond_0
    invoke-virtual {p2}, Landroid/text/SpannableStringBuilder;->length()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x1

    .line 17
    const/4 v2, 0x0

    .line 18
    if-nez p3, :cond_2

    .line 19
    .line 20
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->media:Lcom/p1/mobile/putong/data/Media;

    .line 21
    .line 22
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    if-nez v3, :cond_1

    .line 27
    .line 28
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->stickerInfo:Lcom/p1/mobile/putong/data/StickerInfo;

    .line 29
    .line 30
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    if-eqz v3, :cond_2

    .line 35
    .line 36
    :cond_1
    move v3, v1

    .line 37
    goto :goto_0

    .line 38
    :cond_2
    move v3, v2

    .line 39
    :goto_0
    if-eqz p3, :cond_3

    .line 40
    .line 41
    iget-object v4, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->replyStickerInfo:Lcom/p1/mobile/putong/data/StickerInfo;

    .line 42
    .line 43
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    if-nez v4, :cond_4

    .line 48
    .line 49
    iget-object v4, p4, Lcom/p1/mobile/putong/feed/data/MomentMessage;->messageType:Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 50
    .line 51
    const-string v5, "picture"

    .line 52
    .line 53
    invoke-static {v4, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    if-eqz v4, :cond_3

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_3
    if-eqz v3, :cond_8

    .line 61
    .line 62
    :cond_4
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    sget v4, Ll/lbc0;->p:I

    .line 67
    .line 68
    invoke-virtual {v3, v4}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 73
    .line 74
    .line 75
    move-result v4

    .line 76
    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 77
    .line 78
    .line 79
    move-result v5

    .line 80
    invoke-virtual {v3, v2, v2, v4, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 81
    .line 82
    .line 83
    new-instance v4, Ll/jeh;

    .line 84
    .line 85
    if-nez v0, :cond_5

    .line 86
    .line 87
    const/4 v5, 0x0

    .line 88
    goto :goto_2

    .line 89
    :cond_5
    const/high16 v5, 0x40a00000    # 5.0f

    .line 90
    .line 91
    :goto_2
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 92
    .line 93
    .line 94
    move-result v5

    .line 95
    const/high16 v6, 0x40400000    # 3.0f

    .line 96
    .line 97
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 98
    .line 99
    .line 100
    move-result v6

    .line 101
    invoke-direct {v4, v3, v5, v6}, Ll/jeh;-><init>(Landroid/graphics/drawable/Drawable;II)V

    .line 102
    .line 103
    .line 104
    if-nez v0, :cond_6

    .line 105
    .line 106
    move v3, v2

    .line 107
    goto :goto_3

    .line 108
    :cond_6
    add-int/lit8 v3, v0, -0x1

    .line 109
    .line 110
    :goto_3
    invoke-virtual {p2, v4, v3, v0, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 111
    .line 112
    .line 113
    new-instance v3, Landroid/text/SpannableStringBuilder;

    .line 114
    .line 115
    const-string v4, "\u67e5\u770b\u56fe\u7247"

    .line 116
    .line 117
    invoke-direct {v3, v4}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 118
    .line 119
    .line 120
    new-instance v4, Landroid/text/style/RelativeSizeSpan;

    .line 121
    .line 122
    const v5, 0x3f4ccccd    # 0.8f

    .line 123
    .line 124
    .line 125
    invoke-direct {v4, v5}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    .line 126
    .line 127
    .line 128
    const/4 v5, 0x4

    .line 129
    const/16 v6, 0x12

    .line 130
    .line 131
    invoke-virtual {v3, v4, v2, v5, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 132
    .line 133
    .line 134
    new-instance v4, Landroid/text/style/ForegroundColorSpan;

    .line 135
    .line 136
    const-string v7, "#FE7E1D"

    .line 137
    .line 138
    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 139
    .line 140
    .line 141
    move-result v7

    .line 142
    invoke-direct {v4, v7}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v3, v4, v2, v5, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {p2, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 149
    .line 150
    .line 151
    new-instance v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView$a;

    .line 152
    .line 153
    invoke-direct {v3, p0, p3, p4, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;ZLcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/p1/mobile/putong/feed/data/MomentActivity;)V

    .line 154
    .line 155
    .line 156
    if-nez v0, :cond_7

    .line 157
    .line 158
    goto :goto_4

    .line 159
    :cond_7
    add-int/lit8 v2, v0, -0x1

    .line 160
    .line 161
    :goto_4
    invoke-virtual {p2}, Landroid/text/SpannableStringBuilder;->length()I

    .line 162
    .line 163
    .line 164
    move-result p0

    .line 165
    sub-int/2addr p0, v1

    .line 166
    const/16 p1, 0x11

    .line 167
    .line 168
    invoke-virtual {p2, v3, v2, p0, p1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 169
    .line 170
    .line 171
    :cond_8
    return-object p2
.end method

.method public final K0(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 18
    .line 19
    const-string v2, "matched"

    .line 20
    .line 21
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    .line 28
    .line 29
    const-string p1, "\u804a\u5929"

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 44
    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 46
    .line 47
    const-string v2, "liked"

    .line 48
    .line 49
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    .line 56
    .line 57
    const/4 p1, 0x0

    .line 58
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    .line 63
    .line 64
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->pq()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_3

    .line 76
    .line 77
    invoke-static {}, Ll/ksg;->D()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_2

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    .line 85
    .line 86
    const-string p1, "\u67e5\u770b"

    .line 87
    .line 88
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_3
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    .line 93
    .line 94
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-eqz p1, :cond_4

    .line 99
    .line 100
    const-string p1, "\u5979"

    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_4
    const-string p1, "\u4ed6"

    .line 104
    .line 105
    :goto_1
    const-string v0, "\u559c\u6b22"

    .line 106
    .line 107
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public final L(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/MomentMessage;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jka;->H0:Ljava/util/Map;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 10
    .line 11
    return-object p0
.end method

.method public final L0(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;)V
    .locals 5

    .line 1
    invoke-static {}, Ll/cmg;->q()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "p_activity"

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v3, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 15
    .line 16
    invoke-interface {v0, v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->gp(Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v3, 0x1

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->q:Lv/VText;

    .line 24
    .line 25
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->o:Lv/VText;

    .line 29
    .line 30
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->o:Lv/VText;

    .line 34
    .line 35
    const-string v3, "\u804a\u804a"

    .line 36
    .line 37
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0, p1, v1, v2, v2}, Ll/er60;->t(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZZ)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    invoke-static {}, Ll/ksg;->d0()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    invoke-static {v0}, Ll/cmg;->F(Z)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->counter_()Lcom/p1/mobile/putong/data/Counter;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Counter;->flower:Lcom/p1/mobile/putong/data/FeedFlower;

    .line 67
    .line 68
    iget v0, v0, Lcom/p1/mobile/putong/data/FeedFlower;->count:I

    .line 69
    .line 70
    if-lez v0, :cond_1

    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->o:Lv/VText;

    .line 73
    .line 74
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->q:Lv/VText;

    .line 78
    .line 79
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    const-string v0, "e_red_flower"

    .line 83
    .line 84
    new-array v3, v2, [Ll/tfj0$a;

    .line 85
    .line 86
    invoke-static {v0, v1, v3}, Ll/tfj0;->d(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->q:Lv/VText;

    .line 90
    .line 91
    new-instance v1, Ll/b470;

    .line 92
    .line 93
    invoke-direct {v1, p0, p1}, Ll/b470;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 94
    .line 95
    .line 96
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 97
    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->o:Lv/VText;

    .line 101
    .line 102
    const-string v4, "\u6253\u62db\u547c"

    .line 103
    .line 104
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->o:Lv/VText;

    .line 108
    .line 109
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->q:Lv/VText;

    .line 113
    .line 114
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 115
    .line 116
    .line 117
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-virtual {v0, p1, v1, v3, v2}, Ll/er60;->t(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZZ)V

    .line 122
    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->o:Lv/VText;

    .line 126
    .line 127
    const-string v3, "\u793c\u8c8c\u56de\u8c22"

    .line 128
    .line 129
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 133
    .line 134
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 135
    .line 136
    const-string v3, "moments_user_id"

    .line 137
    .line 138
    invoke-static {v3, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    filled-new-array {v0}, [Ll/pf60;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    const-string v3, "e_polite_gratitude"

    .line 147
    .line 148
    invoke-static {v3, v1, v0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 149
    .line 150
    .line 151
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->o:Lv/VText;

    .line 152
    .line 153
    new-instance v1, Ll/c470;

    .line 154
    .line 155
    invoke-direct {v1, p0, p2, p1}, Ll/c470;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 156
    .line 157
    .line 158
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 159
    .line 160
    .line 161
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->J:Z

    .line 162
    .line 163
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->P0()V

    .line 164
    .line 165
    .line 166
    return-void
.end method

.method public final M(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ")",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    if-nez p2, :cond_0

    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    const-string v1, "moment_id"

    .line 12
    .line 13
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v1, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    const-string v1, "owner_id"

    .line 23
    .line 24
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v1, v2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->A:Ll/omg;

    .line 37
    .line 38
    invoke-interface {p0}, Ll/omg;->getFrom()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-static {p0}, Ll/er60;->D(Ljava/lang/String;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const-string v1, "moment_showfrom"

    .line 47
    .line 48
    invoke-static {v1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0, p1}, Ll/er60;->y(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const-string p1, "moment_type"

    .line 64
    .line 65
    invoke-static {p1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isChildComment()Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    if-eqz p0, :cond_1

    .line 77
    .line 78
    const-string p0, "reply"

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_1
    const-string p0, "comment"

    .line 82
    .line 83
    :goto_0
    const-string p1, "comment_detail"

    .line 84
    .line 85
    invoke-static {p1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    :cond_2
    :goto_1
    return-object v0
.end method

.method public M0()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->H:I

    .line 3
    .line 4
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->J:Z

    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->p:Lv/VImage;

    .line 7
    .line 8
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->D0()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final N(Ljava/util/List;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 4
    .line 5
    const-string v0, "like"

    .line 6
    .line 7
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    return-object p2

    .line 14
    :cond_0
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    const-string p0, ""

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .line 27
    .line 28
    const/4 p2, 0x0

    .line 29
    :cond_2
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-ge p2, v0, :cond_3

    .line 34
    .line 35
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    add-int/lit8 p2, p2, 0x1

    .line 45
    .line 46
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eq p2, v0, :cond_2

    .line 51
    .line 52
    const-string v0, ","

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_3
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method

.method public final N0(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->z:Ll/jh5;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/jh5;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    sget v2, Ll/fgc0;->b:I

    .line 12
    .line 13
    invoke-direct {v0, v1, v2}, Ll/jh5;-><init>(Landroid/content/Context;I)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->z:Ll/jh5;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/jh5;->a0()V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->z:Ll/jh5;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->e:Landroid/widget/TextView;

    .line 24
    .line 25
    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Ll/jh5;->d0(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->z:Ll/jh5;

    .line 37
    .line 38
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->x:Ljava/lang/String;

    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->parentMessageid:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 49
    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    iget-object v0, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->messageid:Ljava/lang/String;

    .line 53
    .line 54
    :goto_0
    move-object v5, v0

    .line 55
    goto :goto_1

    .line 56
    :cond_1
    iget-object v0, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->parentMessageid:Ljava/lang/String;

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :goto_1
    iget-object v6, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 60
    .line 61
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 62
    .line 63
    iget-object v7, p2, Lcom/p1/mobile/putong/feed/data/MomentActivity;->messageid:Ljava/lang/String;

    .line 64
    .line 65
    new-instance v8, Ll/p470;

    .line 66
    .line 67
    invoke-direct {v8, p0}, Ll/p470;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;)V

    .line 68
    .line 69
    .line 70
    move-object v3, p1

    .line 71
    invoke-virtual/range {v2 .. v8}, Ll/jh5;->b0(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 72
    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->z:Ll/jh5;

    .line 75
    .line 76
    invoke-virtual {p0}, Ll/jh5;->show()V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public final O()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->g:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->D:I

    .line 8
    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->e:Landroid/widget/TextView;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final O0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->messageid:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->L(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->M(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x0

    .line 14
    new-array v1, v1, [Ll/pf60;

    .line 15
    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, [Ll/pf60;

    .line 21
    .line 22
    const-string v1, "e_comment"

    .line 23
    .line 24
    const-string v2, "p_activity"

    .line 25
    .line 26
    invoke-static {v1, v2, v0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->N0(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public P(I)V
    .locals 8
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingInflatedId"
        }
    .end annotation

    .line 1
    sget v0, Ll/tec0;->A1:I

    .line 2
    .line 3
    const/4 v1, 0x6

    .line 4
    const/4 v2, 0x3

    .line 5
    const/4 v3, 0x2

    .line 6
    const/4 v4, 0x1

    .line 7
    if-eqz p1, :cond_6

    .line 8
    .line 9
    if-eq p1, v4, :cond_5

    .line 10
    .line 11
    if-eq p1, v3, :cond_4

    .line 12
    .line 13
    if-eq p1, v2, :cond_3

    .line 14
    .line 15
    const/4 v5, 0x4

    .line 16
    if-eq p1, v5, :cond_2

    .line 17
    .line 18
    if-eq p1, v1, :cond_1

    .line 19
    .line 20
    const/4 v5, 0x7

    .line 21
    if-eq p1, v5, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    sget v0, Ll/tec0;->B1:I

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    sget v0, Ll/tec0;->P4:I

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_2
    sget v0, Ll/tec0;->K4:I

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_3
    sget v0, Ll/tec0;->N4:I

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_4
    sget v0, Ll/tec0;->O4:I

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_5
    sget v0, Ll/tec0;->M4:I

    .line 40
    .line 41
    :cond_6
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    invoke-virtual {v5}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->r:Landroid/widget/FrameLayout;

    .line 50
    .line 51
    const/4 v7, 0x0

    .line 52
    invoke-virtual {v5, v0, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    sget v5, Ll/hdc0;->Q1:I

    .line 57
    .line 58
    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    check-cast v5, Lv/VText;

    .line 63
    .line 64
    iput-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->u:Lv/VText;

    .line 65
    .line 66
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->v:[Lv/VDraweeView;

    .line 67
    .line 68
    sget v6, Ll/hdc0;->o0:I

    .line 69
    .line 70
    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v6

    .line 74
    check-cast v6, Lv/VDraweeView;

    .line 75
    .line 76
    aput-object v6, v5, v7

    .line 77
    .line 78
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->v:[Lv/VDraweeView;

    .line 79
    .line 80
    sget v6, Ll/hdc0;->q0:I

    .line 81
    .line 82
    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object v6

    .line 86
    check-cast v6, Lv/VDraweeView;

    .line 87
    .line 88
    aput-object v6, v5, v4

    .line 89
    .line 90
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->v:[Lv/VDraweeView;

    .line 91
    .line 92
    sget v6, Ll/hdc0;->p0:I

    .line 93
    .line 94
    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object v6

    .line 98
    check-cast v6, Lv/VDraweeView;

    .line 99
    .line 100
    aput-object v6, v5, v3

    .line 101
    .line 102
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->v:[Lv/VDraweeView;

    .line 103
    .line 104
    sget v5, Ll/hdc0;->n0:I

    .line 105
    .line 106
    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object v5

    .line 110
    check-cast v5, Lv/VDraweeView;

    .line 111
    .line 112
    aput-object v5, v3, v2

    .line 113
    .line 114
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->r:Landroid/widget/FrameLayout;

    .line 115
    .line 116
    invoke-virtual {v2, v0, v7}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 117
    .line 118
    .line 119
    if-eq p1, v4, :cond_9

    .line 120
    .line 121
    if-ne p1, v1, :cond_7

    .line 122
    .line 123
    goto :goto_2

    .line 124
    :cond_7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->v:[Lv/VDraweeView;

    .line 125
    .line 126
    array-length p1, p0

    .line 127
    :goto_1
    if-ge v7, p1, :cond_b

    .line 128
    .line 129
    aget-object v0, p0, v7

    .line 130
    .line 131
    if-eqz v0, :cond_8

    .line 132
    .line 133
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    check-cast v0, Ll/wlj;

    .line 138
    .line 139
    new-instance v1, Lcom/facebook/drawee/generic/RoundingParams;

    .line 140
    .line 141
    invoke-direct {v1}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 142
    .line 143
    .line 144
    const/high16 v2, 0x40a00000    # 5.0f

    .line 145
    .line 146
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 147
    .line 148
    .line 149
    move-result v2

    .line 150
    int-to-float v2, v2

    .line 151
    invoke-virtual {v1, v2}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    invoke-virtual {v0, v1}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 156
    .line 157
    .line 158
    :cond_8
    add-int/lit8 v7, v7, 0x1

    .line 159
    .line 160
    goto :goto_1

    .line 161
    :cond_9
    :goto_2
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->v:[Lv/VDraweeView;

    .line 162
    .line 163
    array-length p1, p0

    .line 164
    :goto_3
    if-ge v7, p1, :cond_b

    .line 165
    .line 166
    aget-object v0, p0, v7

    .line 167
    .line 168
    if-eqz v0, :cond_a

    .line 169
    .line 170
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    check-cast v0, Ll/wlj;

    .line 175
    .line 176
    new-instance v1, Lcom/facebook/drawee/generic/RoundingParams;

    .line 177
    .line 178
    invoke-direct {v1}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 179
    .line 180
    .line 181
    const/high16 v2, 0x41200000    # 10.0f

    .line 182
    .line 183
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 184
    .line 185
    .line 186
    move-result v2

    .line 187
    int-to-float v2, v2

    .line 188
    invoke-virtual {v1, v2}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    invoke-virtual {v0, v1}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 193
    .line 194
    .line 195
    :cond_a
    add-int/lit8 v7, v7, 0x1

    .line 196
    .line 197
    goto :goto_3

    .line 198
    :cond_b
    return-void
.end method

.method public P0()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->G:Landroid/animation/Animator;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->G:Landroid/animation/Animator;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->p:Lv/VImage;

    .line 15
    .line 16
    new-instance v7, Landroid/view/animation/AccelerateDecelerateInterpolator;

    .line 17
    .line 18
    invoke-direct {v7}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 19
    .line 20
    .line 21
    const/high16 v0, 0x42700000    # 60.0f

    .line 22
    .line 23
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    int-to-float v0, v0

    .line 28
    const/4 v2, 0x2

    .line 29
    new-array v8, v2, [F

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    const/4 v3, 0x0

    .line 33
    aput v2, v8, v3

    .line 34
    .line 35
    const/4 v2, 0x1

    .line 36
    aput v0, v8, v2

    .line 37
    .line 38
    const-string v2, "translationX"

    .line 39
    .line 40
    const-wide/16 v3, 0x1f4

    .line 41
    .line 42
    const-wide/16 v5, 0x320

    .line 43
    .line 44
    invoke-static/range {v1 .. v8}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->G:Landroid/animation/Animator;

    .line 49
    .line 50
    new-instance v1, Ll/b570;

    .line 51
    .line 52
    invoke-direct {v1, p0}, Ll/b570;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v0, v1}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->G:Landroid/animation/Animator;

    .line 59
    .line 60
    new-instance v1, Ll/c570;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/c570;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->G:Landroid/animation/Animator;

    .line 69
    .line 70
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public final Q(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->a:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->c:Landroid/widget/LinearLayout;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->r:Landroid/widget/FrameLayout;

    .line 6
    .line 7
    const/4 v3, 0x3

    .line 8
    new-array v3, v3, [Landroid/view/ViewGroup;

    .line 9
    .line 10
    const/4 v4, 0x0

    .line 11
    aput-object v0, v3, v4

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    aput-object v1, v3, v0

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    aput-object v2, v3, v1

    .line 18
    .line 19
    invoke-static {v3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    new-instance v3, Ll/d470;

    .line 24
    .line 25
    invoke-direct {v3, p0}, Ll/d470;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v2, v3}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 29
    .line 30
    .line 31
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->d:Lv/VDraweeView;

    .line 32
    .line 33
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->S(Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    .line 37
    .line 38
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->S(Landroid/view/View;)V

    .line 39
    .line 40
    .line 41
    iget-object v2, p2, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 42
    .line 43
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    if-eqz v2, :cond_0

    .line 48
    .line 49
    iget-object v2, p2, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 50
    .line 51
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 52
    .line 53
    const-string v3, "matched"

    .line 54
    .line 55
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-eqz v2, :cond_0

    .line 60
    .line 61
    move v2, v0

    .line 62
    goto :goto_0

    .line 63
    :cond_0
    move v2, v4

    .line 64
    :goto_0
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 65
    .line 66
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 67
    .line 68
    const-string v5, "moment_swipe"

    .line 69
    .line 70
    invoke-static {v3, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    if-eqz v3, :cond_1

    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->c:Landroid/widget/LinearLayout;

    .line 77
    .line 78
    new-instance v1, Ll/e470;

    .line 79
    .line 80
    invoke-direct {v1, p0, v2, p1, p2}, Ll/e470;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;ZLcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 84
    .line 85
    .line 86
    goto/16 :goto_2

    .line 87
    .line 88
    :cond_1
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 89
    .line 90
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 91
    .line 92
    const-string v6, "follow"

    .line 93
    .line 94
    invoke-static {v3, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    if-eqz v3, :cond_2

    .line 99
    .line 100
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->c:Landroid/widget/LinearLayout;

    .line 101
    .line 102
    new-instance v1, Ll/f470;

    .line 103
    .line 104
    invoke-direct {v1, p0, p1, p2}, Ll/f470;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 108
    .line 109
    .line 110
    goto/16 :goto_2

    .line 111
    .line 112
    :cond_2
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 113
    .line 114
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->X(Lcom/p1/mobile/putong/feed/data/MomentActivity;)Z

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    if-eqz v3, :cond_3

    .line 119
    .line 120
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->c:Landroid/widget/LinearLayout;

    .line 121
    .line 122
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->r:Landroid/widget/FrameLayout;

    .line 123
    .line 124
    new-array v1, v1, [Landroid/view/ViewGroup;

    .line 125
    .line 126
    aput-object v3, v1, v4

    .line 127
    .line 128
    aput-object v6, v1, v0

    .line 129
    .line 130
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    new-instance v1, Ll/g470;

    .line 135
    .line 136
    invoke-direct {v1, p0}, Ll/g470;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;)V

    .line 137
    .line 138
    .line 139
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 140
    .line 141
    .line 142
    goto :goto_2

    .line 143
    :cond_3
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 144
    .line 145
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 146
    .line 147
    const-string v6, "comment_reply"

    .line 148
    .line 149
    invoke-static {v3, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 150
    .line 151
    .line 152
    move-result v3

    .line 153
    if-nez v3, :cond_8

    .line 154
    .line 155
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 156
    .line 157
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 158
    .line 159
    const-string v6, "comment"

    .line 160
    .line 161
    invoke-static {v3, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 162
    .line 163
    .line 164
    move-result v3

    .line 165
    if-eqz v3, :cond_4

    .line 166
    .line 167
    goto :goto_1

    .line 168
    :cond_4
    invoke-static {}, Ll/cmg;->W()Z

    .line 169
    .line 170
    .line 171
    move-result v3

    .line 172
    if-eqz v3, :cond_5

    .line 173
    .line 174
    sget-object v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->j:Ljava/lang/String;

    .line 175
    .line 176
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->x:Ljava/lang/String;

    .line 177
    .line 178
    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    move-result v3

    .line 182
    if-nez v3, :cond_6

    .line 183
    .line 184
    :cond_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->V()Z

    .line 185
    .line 186
    .line 187
    move-result v3

    .line 188
    if-eqz v3, :cond_7

    .line 189
    .line 190
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->c:Landroid/widget/LinearLayout;

    .line 191
    .line 192
    new-instance v1, Ll/j470;

    .line 193
    .line 194
    invoke-direct {v1, p0, p1, p2}, Ll/j470;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 198
    .line 199
    .line 200
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->r:Landroid/widget/FrameLayout;

    .line 201
    .line 202
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->Q0(Lcom/p1/mobile/putong/feed/data/Moment;)Landroid/view/View$OnClickListener;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 207
    .line 208
    .line 209
    goto :goto_2

    .line 210
    :cond_7
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->c:Landroid/widget/LinearLayout;

    .line 211
    .line 212
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->r:Landroid/widget/FrameLayout;

    .line 213
    .line 214
    new-array v1, v1, [Landroid/view/ViewGroup;

    .line 215
    .line 216
    aput-object v3, v1, v4

    .line 217
    .line 218
    aput-object v6, v1, v0

    .line 219
    .line 220
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    new-instance v1, Ll/k470;

    .line 225
    .line 226
    invoke-direct {v1, p0, p1}, Ll/k470;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 227
    .line 228
    .line 229
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 230
    .line 231
    .line 232
    goto :goto_2

    .line 233
    :cond_8
    :goto_1
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->c:Landroid/widget/LinearLayout;

    .line 234
    .line 235
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->r:Landroid/widget/FrameLayout;

    .line 236
    .line 237
    new-array v1, v1, [Landroid/view/ViewGroup;

    .line 238
    .line 239
    aput-object v3, v1, v4

    .line 240
    .line 241
    aput-object v6, v1, v0

    .line 242
    .line 243
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    new-instance v1, Ll/h470;

    .line 248
    .line 249
    invoke-direct {v1, p0, p1}, Ll/h470;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 250
    .line 251
    .line 252
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 253
    .line 254
    .line 255
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 256
    .line 257
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 258
    .line 259
    invoke-static {v0, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 260
    .line 261
    .line 262
    move-result v0

    .line 263
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->d:Lv/VDraweeView;

    .line 264
    .line 265
    if-eqz v0, :cond_9

    .line 266
    .line 267
    new-instance v0, Ll/l470;

    .line 268
    .line 269
    invoke-direct {v0, p0, v2, p1, p2}, Ll/l470;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;ZLcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;)V

    .line 270
    .line 271
    .line 272
    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 273
    .line 274
    .line 275
    goto :goto_3

    .line 276
    :cond_9
    invoke-virtual {p0, p1, v1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->T(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;Lcom/p1/mobile/putong/data/User;)V

    .line 277
    .line 278
    .line 279
    :goto_3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    .line 280
    .line 281
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->R(Landroid/view/View;Lcom/p1/mobile/putong/data/User;)V

    .line 282
    .line 283
    .line 284
    return-void
.end method

.method public final Q0(Lcom/p1/mobile/putong/feed/data/Moment;)Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, Ll/o470;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/o470;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final R(Landroid/view/View;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    new-instance v0, Ll/q470;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2}, Ll/q470;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final R0(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-static {p0, p1, p2, p3, v0}, Ll/at0;->j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final S(Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance v0, Ll/m470;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/m470;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final S0(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/at0;->d(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-string v0, "user_id"

    .line 9
    .line 10
    iget-object v1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v1, "moment_id"

    .line 17
    .line 18
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    filled-new-array {v0, p1}, [Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const-string v0, "e_likes_list"

    .line 29
    .line 30
    const-string v1, "p_content_likes"

    .line 31
    .line 32
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->T0(Lcom/p1/mobile/putong/data/User;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final T(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    new-instance v0, Ll/r470;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p3}, Ll/r470;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final T0(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    const-string v1, "photo_album_feed_from_activity"

    .line 12
    .line 13
    invoke-static {p0, p1, v1}, Ll/at0;->b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public U(Lcom/p1/mobile/putong/feed/data/MomentActivity;)Z
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 2
    .line 3
    const-string v0, "comment"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_1

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 12
    .line 13
    const-string v0, "comment_reply"

    .line 14
    .line 15
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 22
    .line 23
    const-string p1, "topic_comment_reply"

    .line 24
    .line 25
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return p0

    .line 34
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 35
    return p0
.end method

.method public final U0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 2
    .line 3
    iget-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->read:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v1, 0x1

    .line 9
    iput-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->read:Z

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->A:Ll/omg;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-interface {v1, v0, v2}, Ll/omg;->M1(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->b:Landroid/view/View;

    .line 20
    .line 21
    const/16 v0, 0x8

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final V()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/cmg;->W()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->j:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->x:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public final W(Lcom/p1/mobile/putong/feed/data/ActivityActionApi;)Z
    .locals 0

    .line 1
    const-string p0, "comment_reply"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    const-string p0, "comment"

    .line 10
    .line 11
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public final X(Lcom/p1/mobile/putong/feed/data/MomentActivity;)Z
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 2
    .line 3
    const-string v0, "topic_comment_like"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_1

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 12
    .line 13
    const-string p1, "topic_comment_reply"

    .line 14
    .line 15
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method public final synthetic Y(ZLcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p4

    .line 5
    invoke-interface {p4}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->pq()Z

    .line 6
    .line 7
    .line 8
    move-result p4

    .line 9
    if-nez p4, :cond_1

    .line 10
    .line 11
    if-nez p1, :cond_1

    .line 12
    .line 13
    invoke-static {}, Ll/ksg;->D()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const/4 p2, 0x0

    .line 25
    const-string p4, "p_activity,default"

    .line 26
    .line 27
    invoke-static {p1, p2, p4}, Ll/orb0;->E(Lcom/p1/mobile/android/app/Act;Ll/x20;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    :goto_0
    const-string p1, "photo_album_activities"

    .line 32
    .line 33
    invoke-virtual {p0, p2, p3, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->R0(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :goto_1
    const-string p1, "moments_user_id"

    .line 37
    .line 38
    iget-object p2, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {p1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    filled-new-array {p1}, [Ll/pf60;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    const-string p2, "e_card_detail"

    .line 49
    .line 50
    const-string p3, "p_activity"

    .line 51
    .line 52
    invoke-static {p2, p3, p1}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->U0()V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final synthetic Z(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p3, "photo_album_activities"

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->R0(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->U0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic a0(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->y:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->y:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-static {v0, v1, p0, v2}, Lcom/p1/mobile/putong/feed/newui/topic/vote/TopicVoteAggregationAct;->X1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic b0(Landroid/view/ViewGroup;)V
    .locals 1

    .line 1
    new-instance v0, Ll/s470;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/s470;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic c0(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->Q0(Lcom/p1/mobile/putong/feed/data/Moment;)Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic d0(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->S0(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic e0(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->Q0(Lcom/p1/mobile/putong/feed/data/Moment;)Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic f0(ZLcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p4

    .line 5
    invoke-interface {p4}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->pq()Z

    .line 6
    .line 7
    .line 8
    move-result p4

    .line 9
    if-nez p4, :cond_1

    .line 10
    .line 11
    if-nez p1, :cond_1

    .line 12
    .line 13
    invoke-static {}, Ll/ksg;->D()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const/4 p2, 0x0

    .line 25
    const-string p4, "p_activity,default"

    .line 26
    .line 27
    invoke-static {p1, p2, p4}, Ll/orb0;->E(Lcom/p1/mobile/android/app/Act;Ll/x20;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    :goto_0
    const-string p1, "photo_album_activities"

    .line 32
    .line 33
    invoke-virtual {p0, p2, p3, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->R0(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->U0()V

    .line 37
    .line 38
    .line 39
    const-string p0, "moments_user_id"

    .line 40
    .line 41
    iget-object p1, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    filled-new-array {p0}, [Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const-string p1, "e_card_detail"

    .line 52
    .line 53
    const-string p2, "p_activity"

    .line 54
    .line 55
    invoke-static {p1, p2, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final synthetic g0(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 10

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 4
    .line 5
    const-string v0, "moment_swipe"

    .line 6
    .line 7
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    const-string v0, "p_activity"

    .line 12
    .line 13
    if-eqz p2, :cond_4

    .line 14
    .line 15
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    .line 16
    .line 17
    invoke-virtual {p2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    const-string v1, "\u5979"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const-string v1, "\u4ed6"

    .line 31
    .line 32
    :goto_0
    const-string v2, "\u559c\u6b22"

    .line 33
    .line 34
    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {p2, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    if-eqz p2, :cond_2

    .line 43
    .line 44
    const-string p2, "user_id"

    .line 45
    .line 46
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {p2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    filled-new-array {p2}, [Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    const-string v1, "e_respond_match"

    .line 57
    .line 58
    invoke-static {v1, v0, p2}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 59
    .line 60
    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-interface {p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->pq()Z

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    if-eqz p2, :cond_1

    .line 78
    .line 79
    const-string p2, "momentPick"

    .line 80
    .line 81
    invoke-static {p2}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    :goto_1
    move-object v6, p2

    .line 86
    goto :goto_2

    .line 87
    :cond_1
    const-string p2, "moment"

    .line 88
    .line 89
    invoke-static {p2}, Lcom/p1/mobile/putong/data/LikeFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LikeFrom;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    goto :goto_1

    .line 94
    :goto_2
    const/4 v8, 0x1

    .line 95
    const-string v9, "featured"

    .line 96
    .line 97
    const/4 v5, 0x1

    .line 98
    const/4 v7, 0x0

    .line 99
    move-object v4, p1

    .line 100
    invoke-interface/range {v2 .. v9}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Rs(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLcom/p1/mobile/putong/data/LikeFrom;Ljava/lang/String;ZLjava/lang/String;)V

    .line 101
    .line 102
    .line 103
    goto :goto_3

    .line 104
    :cond_2
    move-object v4, p1

    .line 105
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->s:Lv/VButton;

    .line 106
    .line 107
    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    const-string p2, "\u67e5\u770b"

    .line 112
    .line 113
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    if-eqz p1, :cond_3

    .line 118
    .line 119
    const-string p1, "moments_user_id"

    .line 120
    .line 121
    iget-object p2, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 122
    .line 123
    invoke-static {p1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    filled-new-array {p1}, [Ll/pf60;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    const-string p2, "e_card_detail"

    .line 132
    .line 133
    invoke-static {p2, v0, p1}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    const/4 p2, 0x0

    .line 141
    const-string v0, "p_activity,default"

    .line 142
    .line 143
    invoke-static {p1, p2, v0}, Ll/orb0;->E(Lcom/p1/mobile/android/app/Act;Ll/x20;Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    goto :goto_3

    .line 147
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 152
    .line 153
    .line 154
    move-result-object p2

    .line 155
    iget-object v0, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 156
    .line 157
    const/4 v1, 0x0

    .line 158
    invoke-static {p2, v0, v1, v1}, Ll/orb0;->c(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 159
    .line 160
    .line 161
    move-result-object p2

    .line 162
    invoke-virtual {p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 163
    .line 164
    .line 165
    :goto_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->U0()V

    .line 166
    .line 167
    .line 168
    return-void

    .line 169
    :cond_4
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 170
    .line 171
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 172
    .line 173
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 174
    .line 175
    invoke-virtual {p1, p2}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    move-result p2

    .line 187
    if-eqz p2, :cond_9

    .line 188
    .line 189
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->U0()V

    .line 190
    .line 191
    .line 192
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 193
    .line 194
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 195
    .line 196
    .line 197
    move-result p2

    .line 198
    const/4 v1, 0x1

    .line 199
    if-eqz p2, :cond_8

    .line 200
    .line 201
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 202
    .line 203
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 204
    .line 205
    const-string v2, "matched"

    .line 206
    .line 207
    invoke-static {p2, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 208
    .line 209
    .line 210
    move-result v2

    .line 211
    if-nez v2, :cond_7

    .line 212
    .line 213
    const-string v2, "following"

    .line 214
    .line 215
    invoke-static {p2, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 216
    .line 217
    .line 218
    move-result p2

    .line 219
    if-eqz p2, :cond_5

    .line 220
    .line 221
    goto :goto_4

    .line 222
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 223
    .line 224
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 225
    .line 226
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/Moments;->hidePublicMoments:Z

    .line 227
    .line 228
    if-eqz p0, :cond_6

    .line 229
    .line 230
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->q:I

    .line 231
    .line 232
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 233
    .line 234
    .line 235
    return-void

    .line 236
    :cond_6
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 237
    .line 238
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 239
    .line 240
    .line 241
    move-result-object p2

    .line 242
    invoke-interface {p2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object p2

    .line 246
    invoke-virtual {p0, p2, p1, v1, v0}, Ll/jka;->m7(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)Lrx/c;

    .line 247
    .line 248
    .line 249
    return-void

    .line 250
    :cond_7
    :goto_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 251
    .line 252
    .line 253
    move-result-object p2

    .line 254
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 255
    .line 256
    .line 257
    move-result-object p0

    .line 258
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->z:I

    .line 259
    .line 260
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object p0

    .line 264
    new-instance v0, Ll/w470;

    .line 265
    .line 266
    invoke-direct {v0, p1}, Ll/w470;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 267
    .line 268
    .line 269
    invoke-static {p2, p0, v0}, Ll/k3h;->v0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V

    .line 270
    .line 271
    .line 272
    return-void

    .line 273
    :cond_8
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 274
    .line 275
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 276
    .line 277
    .line 278
    move-result-object p2

    .line 279
    invoke-interface {p2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object p2

    .line 283
    invoke-virtual {p0, p2, p1, v1, v0}, Ll/jka;->m7(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)Lrx/c;

    .line 284
    .line 285
    .line 286
    :cond_9
    return-void
.end method

.method public getLikeFontEmoj()Ljava/lang/String;
    .locals 3
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-static {}, Ll/cmg;->W()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, ""

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->j:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->x:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    return-object v1

    .line 20
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->V()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    return-object v1

    .line 27
    :cond_1
    const-string p0, "\u2764\ufe0f"

    .line 28
    .line 29
    return-object p0
.end method

.method public getUserAndMoment()Ll/pf60;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 6
    .line 7
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    sget-object v2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 14
    .line 15
    iget-object v2, v2, Ll/jka;->i0:Ljava/util/Map;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->reference:Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-interface {v2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 28
    .line 29
    invoke-direct {v0, v1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    return-object v0
.end method

.method public final synthetic h0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->B:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic i0(Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->A:Ll/omg;

    .line 2
    .line 3
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 4
    .line 5
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {p1, p2}, Ll/omg;->G3(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->B:Ll/w30;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic j0(Landroid/view/View;)Z
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->f:I

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    new-instance v1, Ll/w30$b;

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-direct {v1, p1}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 26
    .line 27
    .line 28
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->a:I

    .line 29
    .line 30
    invoke-virtual {v1, p1}, Ll/w30$b;->H(I)Ll/w30$b;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    new-instance v2, Ll/u470;

    .line 35
    .line 36
    invoke-direct {v2, p0}, Ll/u470;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, v2}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1, v0}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const/4 v0, 0x0

    .line 48
    filled-new-array {v0}, [I

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    sget v2, Ll/k9c0;->E:I

    .line 53
    .line 54
    filled-new-array {v2}, [I

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {p1, v0, v2}, Ll/w30$b;->R([I[I)Ll/w30$b;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    new-instance v0, Ll/v470;

    .line 63
    .line 64
    invoke-direct {v0, p0}, Ll/v470;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1, v0}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1}, Ll/w30$b;->F()Ll/w30;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->B:Ll/w30;

    .line 75
    .line 76
    invoke-virtual {p1}, Ll/w30;->f()V

    .line 77
    .line 78
    .line 79
    const/4 p0, 0x1

    .line 80
    return p0
.end method

.method public final synthetic k0(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->U0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->V()Z

    .line 5
    .line 6
    .line 7
    move-result p3

    .line 8
    if-eqz p3, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->S0(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const-string p3, "photo_album_activities"

    .line 15
    .line 16
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->R0(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic l0()V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->H:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->H:I

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->P0()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic m0(Ll/uxj0;)V
    .locals 3

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->E:Z

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->pq()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eq p1, v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->pq()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->E:Z

    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 24
    .line 25
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->C:I

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->A:Ll/omg;

    .line 28
    .line 29
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->F:I

    .line 30
    .line 31
    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->E0(Lcom/p1/mobile/putong/feed/data/MomentActivity;ILl/omg;I)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public final synthetic n0(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_1

    .line 33
    .line 34
    const-string p0, "\u5c0f\u7ea2\u82b1\u5df2\u53d1\u9001"

    .line 35
    .line 36
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic o0(Ll/pf60;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

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
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->K0(Lcom/p1/mobile/putong/data/User;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->D0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->H(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->e:Landroid/widget/TextView;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/widget/TextView;->getMaxWidth()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->D:I

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->pq()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->E:Z

    .line 24
    .line 25
    return-void
.end method

.method public final synthetic p0(Lcom/p1/mobile/putong/feed/data/MomentActivity;ILl/omg;ILl/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->E0(Lcom/p1/mobile/putong/feed/data/MomentActivity;ILl/omg;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic q0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->O0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic r0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->O0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final synthetic s0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/cmg;->x0()Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    new-instance v0, Ll/z370;

    .line 12
    .line 13
    invoke-direct {v0, p0, p1, p2}, Ll/z370;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 14
    .line 15
    .line 16
    new-instance v1, Ll/a470;

    .line 17
    .line 18
    invoke-direct {v1, p0, p1, p2}, Ll/a470;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 19
    .line 20
    .line 21
    const-string p0, "p_fake_nearby_comments_popup"

    .line 22
    .line 23
    invoke-static {p3, p0, p1, v0, v1}, Ll/zzg;->f(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ll/x20;Ll/y20;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->O0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public setFrom(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->x:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic t0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {p3, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->gp(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    const-string p0, "\u4f60\u4eec\u5df2\u7ecf\u662f\u597d\u53cb\u4e86\uff0c\u53bb\u804a\u804a\u5929\u5427"

    .line 14
    .line 15
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->C0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic u0(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, "moments_user_id"

    .line 6
    .line 7
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    filled-new-array {p1}, [Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v0, "e_activity_chat"

    .line 16
    .line 17
    const-string v1, "p_activity"

    .line 18
    .line 19
    invoke-static {v0, v1, p1}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-static {v0, p0, v1, v1}, Ll/orb0;->c(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final synthetic v0(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_1

    .line 33
    .line 34
    const-string p0, "\u793c\u8c8c\u56de\u8c22\u5df2\u53d1\u9001"

    .line 35
    .line 36
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic w0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->U0()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/cmg;->q()Z

    .line 5
    .line 6
    .line 7
    move-result p3

    .line 8
    const-string v0, "p_activity"

    .line 9
    .line 10
    if-eqz p3, :cond_0

    .line 11
    .line 12
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    const-string v5, "p_activity"

    .line 19
    .line 20
    const/4 v6, 0x0

    .line 21
    const/4 v4, 0x0

    .line 22
    move-object v3, p1

    .line 23
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/feed/api/b;->f3(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Z)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const/4 p1, 0x1

    .line 31
    const/4 p3, 0x0

    .line 32
    invoke-virtual {p0, p2, v0, p1, p3}, Ll/er60;->s(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZZ)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 39
    .line 40
    const-string p3, "moments_user_id"

    .line 41
    .line 42
    invoke-static {p3, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    filled-new-array {p1}, [Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    const-string p3, "e_polite_gratitude"

    .line 51
    .line 52
    invoke-static {p3, v0, p1}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 53
    .line 54
    .line 55
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-static {}, Ll/bch;->b()Ll/bch;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p1}, Ll/bch;->c()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->w:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 72
    .line 73
    iget-object v4, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 74
    .line 75
    const/4 p1, 0x0

    .line 76
    if-nez p2, :cond_1

    .line 77
    .line 78
    move-object v5, p1

    .line 79
    goto :goto_0

    .line 80
    :cond_1
    iget-object p3, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 81
    .line 82
    move-object v5, p3

    .line 83
    :goto_0
    if-nez p2, :cond_2

    .line 84
    .line 85
    :goto_1
    move-object v6, p1

    .line 86
    goto :goto_2

    .line 87
    :cond_2
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :goto_2
    const-string p1, "reply_thanks"

    .line 91
    .line 92
    invoke-static {p1}, Lcom/p1/mobile/putong/data/Channel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/Channel;

    .line 93
    .line 94
    .line 95
    move-result-object v7

    .line 96
    new-instance v8, Ll/n470;

    .line 97
    .line 98
    invoke-direct {v8, p0}, Ll/n470;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;)V

    .line 99
    .line 100
    .line 101
    invoke-interface/range {v1 .. v8}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Vk(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Channel;Ll/y20;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public final synthetic x0(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->C0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic y0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->p:Lv/VImage;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->o:Lv/VText;

    .line 4
    .line 5
    invoke-static {v1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->o:Lv/VText;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v1, "\u793c\u8c8c\u56de\u8c22"

    .line 22
    .line 23
    invoke-static {p0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    :goto_0
    invoke-static {v0, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic z0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->p:Lv/VImage;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->G:Landroid/animation/Animator;

    .line 10
    .line 11
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->H:I

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    if-gt v0, v1, :cond_0

    .line 15
    .line 16
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->J:Z

    .line 17
    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumActivitiesView;->I:Ljava/lang/Runnable;

    .line 25
    .line 26
    const-wide/16 v1, 0x2ee

    .line 27
    .line 28
    invoke-static {v0, p0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method
