.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# static fields
.field public static e1:Ljava/lang/String; = " "

.field public static final f1:I

.field public static final g1:I

.field public static final h1:I


# instance fields
.field public A:Landroid/widget/TextView;

.field public B:Lv/VLinear;

.field public C:Lv/VImage;

.field public D:Lv/VText;

.field public E:Landroid/widget/ImageView;

.field public E0:Lv/VDraweeView;

.field public F:Lv/VText;

.field public F0:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

.field public G:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public G0:Lv/VLinear;

.field public H:Lv/VDraweeView;

.field public H0:Landroid/widget/TextView;

.field public I:Lv/VText;

.field public I0:Lv/VText;

.field public J:Lv/VImage;

.field public J0:Z

.field public K:Lv/VText;

.field public K0:Z

.field public L:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public L0:Ll/x20;

.field public M:Lv/VRelative;

.field public M0:Landroid/view/View;

.field public N:Lv/VText;

.field public N0:Lcom/p1/mobile/putong/data/User;

.field public O:Lv/VText;

.field public O0:Lcom/p1/mobile/putong/feed/data/Moment;

.field public P:Lv/VImage;

.field public P0:Ljava/lang/String;

.field public Q:Landroid/view/View;

.field public Q0:Ll/n570;

.field public R:Landroid/widget/TextView;

.field public R0:Z

.field public S:Lv/VText_Expandable;

.field public S0:Ll/x20;

.field public T:Lv/VText;

.field public T0:Z

.field public U:Lv/VText;

.field public U0:I

.field public V:Lv/VLinear;

.field public V0:Landroid/view/View;

.field public W:Landroid/widget/RelativeLayout;

.field public W0:Z

.field public X0:Z

.field public Y0:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;

.field public Z0:Z

.field public a:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

.field public a1:Ll/fo00;

.field public b:Landroid/widget/LinearLayout;

.field public b1:Z

.field public c:Lv/VText_Expandable;

.field public c1:Z

.field public d:Lv/VText;

.field public d1:Z

.field public e:Lv/VText;

.field public f:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;

.field public g:Lv/VLinear;

.field public h:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;

.field public i:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTagView;

.field public j:Lv/VLinear;

.field public k:Lv/VText;

.field public k0:Lv/VRelative;

.field public l:Lv/VText;

.field public m:Lv/VText;

.field public n:Lv/VText;

.field public o:Lv/VLinear;

.field public p:Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;

.field public p0:Lv/VImage;

.field public q:Lv/VText;

.field public r:Lv/VImage;

.field public s:Landroid/widget/RelativeLayout;

.field public t:Lv/VRelative;

.field public u:Lv/VFrame;

.field public v:Lv/VImage;

.field public w:Lv/VDraweeView;

.field public x:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

.field public y:Lv/VLinear;

.field public z:Lv/VImage;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/high16 v0, 0x41000000    # 8.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    sput v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->f1:I

    .line 8
    .line 9
    const/high16 v1, 0x40c00000    # 6.0f

    .line 10
    .line 11
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    sput v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->g1:I

    .line 16
    .line 17
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    sput v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->h1:I

    .line 22
    .line 23
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->T0:Z

    .line 6
    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->U0:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->Y0:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;

    .line 11
    .line 12
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->Z0:Z

    .line 13
    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->b1:Z

    .line 15
    .line 16
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->c1:Z

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 19
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 20
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->T0:Z

    .line 21
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->U0:I

    const/4 p2, 0x0

    .line 22
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->Y0:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;

    .line 23
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->Z0:Z

    .line 24
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->b1:Z

    .line 25
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->c1:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 26
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 27
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->T0:Z

    .line 28
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->U0:I

    const/4 p2, 0x0

    .line 29
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->Y0:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;

    .line 30
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->Z0:Z

    .line 31
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->b1:Z

    .line 32
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->c1:Z

    return-void
.end method

.method public static E(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/GroupIdBox;)V
    .locals 1

    .line 1
    const-string v0, "circle_id"

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "moment_id"

    .line 10
    .line 11
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    filled-new-array {p1, p0}, [Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string p1, "e_circle_tag"

    .line 22
    .line 23
    const-string v0, "p_user_moment_interactions_details_view"

    .line 24
    .line 25
    invoke-static {p1, v0, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->W(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;ZLcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O(ZLcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->S(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->X(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;ZLandroid/widget/ImageView;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->P(ZLandroid/widget/ImageView;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->Y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->a0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic i(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->R(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->Q(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->T(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->b0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;Landroid/text/SpannableStringBuilder;[Landroid/text/style/URLSpan;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->V(Landroid/text/SpannableStringBuilder;[Landroid/text/style/URLSpan;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->Z()V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;Landroid/widget/ImageView;Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->U(Landroid/widget/ImageView;Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;Z)V

    return-void
.end method

.method public static bridge synthetic q(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;)Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    return-object p0
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->X0:Z

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->u()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    return-object p0
.end method

.method private setUserViewsHistoryVisitiby(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->q:Lv/VText;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->p:Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;

    .line 7
    .line 8
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->o:Lv/VLinear;

    .line 12
    .line 13
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static z(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/GroupIdBox;)V
    .locals 1

    .line 1
    const-string v0, "circle_id"

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "moment_id"

    .line 10
    .line 11
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    filled-new-array {p1, p0}, [Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string p1, "e_circle_tag"

    .line 22
    .line 23
    const-string v0, "p_user_moment_interactions_details_view"

    .line 24
    .line 25
    invoke-static {p1, v0, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public final A()V
    .locals 4

    .line 1
    new-instance v0, Ll/srg$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->u()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 8
    .line 9
    invoke-virtual {v2}, Lcom/p1/mobile/putong/feed/data/Moment;->getTopicList()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->g:Lv/VLinear;

    .line 14
    .line 15
    invoke-direct {v0, v1, v2, v3}, Ll/srg$a;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Landroid/view/ViewGroup;)V

    .line 16
    .line 17
    .line 18
    const-string v1, "p_user_moment_interactions_details_view"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/srg$a;->j(Ljava/lang/String;)Ll/srg$a;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/srg$a;->h()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->M0:Landroid/view/View;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->M0:Landroid/view/View;

    .line 37
    .line 38
    invoke-static {}, Ll/cmg;->C0()Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_0

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 45
    .line 46
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_0

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 53
    .line 54
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->mediaRepeatIndexList:Ljava/util/List;

    .line 55
    .line 56
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-nez v1, :cond_0

    .line 61
    .line 62
    const/high16 v1, 0x40800000    # 4.0f

    .line 63
    .line 64
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    goto :goto_0

    .line 69
    :cond_0
    const/high16 v1, 0x41400000    # 12.0f

    .line 70
    .line 71
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 76
    .line 77
    .line 78
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->v()V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public final B(Landroid/widget/ImageView;Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;Z)V
    .locals 2

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->Q0:Ll/n570;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    invoke-virtual {p2, v0}, Ll/n570;->s(Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    new-instance v0, Ll/wk00;

    .line 10
    .line 11
    invoke-direct {v0, p0, p3}, Ll/wk00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;Z)V

    .line 12
    .line 13
    .line 14
    new-instance v1, Ll/xk00;

    .line 15
    .line 16
    invoke-direct {v1, p0, p3, p1}, Ll/xk00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;ZLandroid/widget/ImageView;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final C(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->name:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-nez p0, :cond_1

    .line 13
    .line 14
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->id:Ljava/lang/String;

    .line 17
    .line 18
    const-string v0, "activity_id"

    .line 19
    .line 20
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->name:Ljava/lang/String;

    .line 27
    .line 28
    const-string v1, "activity_name"

    .line 29
    .line 30
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "moment_show_type"

    .line 35
    .line 36
    const-string v2, "text_and_url"

    .line 37
    .line 38
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const-string v2, "moments_user_id"

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {v2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    filled-new-array {p0, v0, v1, p1}, [Ll/pf60;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const-string p1, "e_activity_moment"

    .line 55
    .line 56
    const-string v0, "p_user_moment_interactions_details_view"

    .line 57
    .line 58
    invoke-static {p1, v0, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 59
    .line 60
    .line 61
    :cond_1
    :goto_0
    return-void
.end method

.method public final D(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->name:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-nez p0, :cond_1

    .line 13
    .line 14
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->id:Ljava/lang/String;

    .line 17
    .line 18
    const-string v0, "activity_id"

    .line 19
    .line 20
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->name:Ljava/lang/String;

    .line 27
    .line 28
    const-string v1, "activity_name"

    .line 29
    .line 30
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "moment_show_type"

    .line 35
    .line 36
    const-string v2, "text_and_url"

    .line 37
    .line 38
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const-string v2, "moments_user_id"

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {v2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    filled-new-array {p0, v0, v1, p1}, [Ll/pf60;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const-string p1, "e_activity_moment"

    .line 55
    .line 56
    const-string v0, "p_user_moment_interactions_details_view"

    .line 57
    .line 58
    invoke-static {p1, v0, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 59
    .line 60
    .line 61
    :cond_1
    :goto_0
    return-void
.end method

.method public final F()V
    .locals 3

    .line 1
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->t(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->c:Lv/VText_Expandable;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->S:Lv/VText_Expandable;

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->m:Lv/VText;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->T:Lv/VText;

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->s:Landroid/widget/RelativeLayout;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->W:Landroid/widget/RelativeLayout;

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->t:Lv/VRelative;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->k0:Lv/VRelative;

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->v:Lv/VImage;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->p0:Lv/VImage;

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->w:Lv/VDraweeView;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->E0:Lv/VDraweeView;

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->x:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->F0:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->y:Lv/VLinear;

    .line 33
    .line 34
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->G0:Lv/VLinear;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->A:Landroid/widget/TextView;

    .line 37
    .line 38
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->H0:Landroid/widget/TextView;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->K:Lv/VText;

    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->I0:Lv/VText;

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->n:Lv/VText;

    .line 45
    .line 46
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->U:Lv/VText;

    .line 47
    .line 48
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_0

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->F0:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->u()Lcom/p1/mobile/android/app/Act;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    sget v2, Ll/k9c0;->g0:I

    .line 65
    .line 66
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->setTextColor(I)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->F0:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 74
    .line 75
    const/high16 v1, 0x41400000    # 12.0f

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->setTextSize(F)V

    .line 78
    .line 79
    .line 80
    :cond_0
    sget v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->f1:I

    .line 81
    .line 82
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->setLikeCommentRightMargin(I)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->p0:Lv/VImage;

    .line 86
    .line 87
    const/4 v1, 0x0

    .line 88
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->C:Lv/VImage;

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->z:Lv/VImage;

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->E:Landroid/widget/ImageView;

    .line 102
    .line 103
    invoke-virtual {p0, v1}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public G(Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Ll/zuf0;->a(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 15
    .line 16
    return-object p0
.end method

.method public H(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/jka;->B7(Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance v0, Ll/cl00;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/cl00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;)V

    .line 20
    .line 21
    .line 22
    new-instance p0, Ll/dl00;

    .line 23
    .line 24
    invoke-direct {p0}, Ll/dl00;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public I(Landroid/view/View;FF)Lcom/tantan/library/svga/SVGAnimationView;
    .locals 7

    .line 1
    new-instance v0, Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->u()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lcom/tantan/library/svga/SVGAnimationView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Landroid/graphics/Rect;

    .line 11
    .line 12
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 13
    .line 14
    .line 15
    new-instance v2, Landroid/graphics/Rect;

    .line 16
    .line 17
    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v1}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v2}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    check-cast v3, Landroid/widget/RelativeLayout$LayoutParams;

    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    mul-int/lit8 v4, v4, 0x2

    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 42
    .line 43
    .line 44
    move-result v5

    .line 45
    mul-int/lit8 v5, v5, 0x2

    .line 46
    .line 47
    iput v4, v3, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 48
    .line 49
    iput v5, v3, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 50
    .line 51
    invoke-virtual {v0, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 52
    .line 53
    .line 54
    iget v3, v1, Landroid/graphics/Rect;->top:I

    .line 55
    .line 56
    iget v6, v2, Landroid/graphics/Rect;->top:I

    .line 57
    .line 58
    sub-int/2addr v3, v6

    .line 59
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    iget v6, v2, Landroid/graphics/Rect;->top:I

    .line 64
    .line 65
    add-int/2addr p0, v6

    .line 66
    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    .line 67
    .line 68
    sub-int/2addr p0, v2

    .line 69
    add-int/2addr v3, p0

    .line 70
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    iget v2, v1, Landroid/graphics/Rect;->top:I

    .line 75
    .line 76
    add-int/2addr p0, v2

    .line 77
    iget v2, v1, Landroid/graphics/Rect;->bottom:I

    .line 78
    .line 79
    sub-int/2addr p0, v2

    .line 80
    sub-int/2addr v3, p0

    .line 81
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    sub-int/2addr p0, v5

    .line 86
    div-int/lit8 p0, p0, 0x2

    .line 87
    .line 88
    add-int/2addr v3, p0

    .line 89
    int-to-float p0, v3

    .line 90
    add-float/2addr p0, p3

    .line 91
    invoke-virtual {v0, p0}, Landroid/view/View;->setY(F)V

    .line 92
    .line 93
    .line 94
    iget p0, v1, Landroid/graphics/Rect;->left:I

    .line 95
    .line 96
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    sub-int/2addr p1, v4

    .line 101
    div-int/lit8 p1, p1, 0x2

    .line 102
    .line 103
    add-int/2addr p0, p1

    .line 104
    int-to-float p0, p0

    .line 105
    add-float/2addr p0, p2

    .line 106
    invoke-virtual {v0, p0}, Landroid/view/View;->setX(F)V

    .line 107
    .line 108
    .line 109
    return-object v0
.end method

.method public J(Lcom/p1/mobile/putong/feed/data/Group;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->K(Lcom/p1/mobile/putong/feed/data/Group;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, ""

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->K(Lcom/p1/mobile/putong/feed/data/Group;)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-static {p0}, Ll/ksg;->r(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Group;->state:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public K(Lcom/p1/mobile/putong/feed/data/Group;)I
    .locals 0

    .line 1
    iget p0, p1, Lcom/p1/mobile/putong/feed/data/Group;->userCounter:I

    .line 2
    .line 3
    return p0
.end method

.method public final L(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->k0:Lv/VRelative;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->F0:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->clearAnimation()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->F0:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 13
    .line 14
    if-lez p1, :cond_0

    .line 15
    .line 16
    invoke-static {p1}, Ll/q8g0;->h0(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->u()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->k:I

    .line 29
    .line 30
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->G0:Lv/VLinear;

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 44
    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 46
    .line 47
    iget p1, p1, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 48
    .line 49
    if-eqz p1, :cond_2

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->N0:Lcom/p1/mobile/putong/data/User;

    .line 52
    .line 53
    invoke-static {v1}, Ll/ksg;->b0(Lcom/p1/mobile/putong/data/User;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_1

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->R:Landroid/widget/TextView;

    .line 61
    .line 62
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    .line 66
    .line 67
    const/high16 v1, 0x40800000    # 4.0f

    .line 68
    .line 69
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    invoke-static {v0, v1}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 74
    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->R:Landroid/widget/TextView;

    .line 78
    .line 79
    const/16 v1, 0x8

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;

    .line 85
    .line 86
    const/high16 v1, 0x41200000    # 10.0f

    .line 87
    .line 88
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    invoke-static {v0, v1}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 93
    .line 94
    .line 95
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->H0:Landroid/widget/TextView;

    .line 96
    .line 97
    if-lez p1, :cond_3

    .line 98
    .line 99
    invoke-static {p1}, Ll/q8g0;->h0(I)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 104
    .line 105
    .line 106
    goto :goto_3

    .line 107
    :cond_3
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->d:I

    .line 108
    .line 109
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 110
    .line 111
    .line 112
    :goto_3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 113
    .line 114
    iget-boolean p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 115
    .line 116
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->p0:Lv/VImage;

    .line 117
    .line 118
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->k0(ZLandroid/widget/ImageView;)V

    .line 119
    .line 120
    .line 121
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->k0:Lv/VRelative;

    .line 122
    .line 123
    new-instance v0, Ll/sk00;

    .line 124
    .line 125
    invoke-direct {v0, p0}, Ll/sk00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p1, v0}, Lv/VRelative;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 129
    .line 130
    .line 131
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->G:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 132
    .line 133
    new-instance v0, Ll/tk00;

    .line 134
    .line 135
    invoke-direct {v0, p0}, Ll/tk00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;)V

    .line 136
    .line 137
    .line 138
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 139
    .line 140
    .line 141
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->G0:Lv/VLinear;

    .line 142
    .line 143
    new-instance v0, Ll/uk00;

    .line 144
    .line 145
    invoke-direct {v0, p0}, Ll/uk00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {p1, v0}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 149
    .line 150
    .line 151
    return-void
.end method

.method public final M(Lcom/p1/mobile/putong/feed/data/Moment;)Z
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    return p0

    .line 10
    :cond_1
    :try_start_0
    iget v0, v0, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->count:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catch_0
    move-exception v0

    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    const/4 v0, -0x1

    .line 18
    :goto_0
    iget p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->views:I

    .line 19
    .line 20
    if-ne p1, v0, :cond_2

    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    :cond_2
    return p0
.end method

.method public N(Lcom/p1/mobile/putong/feed/data/Moment;)Z
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->shareMyVote:Z

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    return p0

    .line 10
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/Moment;->getTopicList()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    return p0

    .line 21
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/Moment;->getTopicList()Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->options:Ljava/util/List;

    .line 32
    .line 33
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_3

    .line 38
    .line 39
    return p0

    .line 40
    :cond_3
    move v0, p0

    .line 41
    :goto_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/Moment;->getTopicList()Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-interface {v1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    check-cast v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 50
    .line 51
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->options:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-ge v0, v1, :cond_5

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/Moment;->getTopicList()Ljava/util/List;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-interface {v1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    check-cast v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 68
    .line 69
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->options:Ljava/util/List;

    .line 70
    .line 71
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    check-cast v1, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 76
    .line 77
    iget-boolean v1, v1, Lcom/p1/mobile/putong/feed/data/VoteOptions;->haveliked:Z

    .line 78
    .line 79
    if-eqz v1, :cond_4

    .line 80
    .line 81
    const/4 p0, 0x1

    .line 82
    return p0

    .line 83
    :cond_4
    add-int/lit8 v0, v0, 0x1

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_5
    return p0
.end method

.method public final synthetic O(ZLcom/p1/mobile/putong/data/Envelope;)V
    .locals 3

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->L0:Ll/x20;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    iget-boolean p2, p2, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 12
    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->L0:Ll/x20;

    .line 16
    .line 17
    invoke-interface {p2}, Ll/x20;->call()V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->P0:Ljava/lang/String;

    .line 27
    .line 28
    const/16 v2, 0xc9

    .line 29
    .line 30
    invoke-virtual {p2, v0, v1, v2, p1}, Ll/er60;->k(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;IZ)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->Q0:Ll/n570;

    .line 34
    .line 35
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 36
    .line 37
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p1, p2}, Ll/n570;->y(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->Q0:Ll/n570;

    .line 46
    .line 47
    instance-of p2, p1, Ll/wh00;

    .line 48
    .line 49
    if-eqz p2, :cond_1

    .line 50
    .line 51
    check-cast p1, Ll/wh00;

    .line 52
    .line 53
    invoke-interface {p1}, Ll/wh00;->c()V

    .line 54
    .line 55
    .line 56
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 57
    .line 58
    iget-boolean p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 59
    .line 60
    if-eqz p1, :cond_2

    .line 61
    .line 62
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->P0:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->r0(Ljava/lang/String;)Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_2

    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->q0()V

    .line 71
    .line 72
    .line 73
    :cond_2
    return-void
.end method

.method public final synthetic P(ZLandroid/widget/ImageView;Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->P0:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2, p3, p1}, Ll/er60;->l(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/Throwable;Z)V

    .line 10
    .line 11
    .line 12
    invoke-static {p3}, Ll/i4h;->g(Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 16
    .line 17
    iget-boolean p3, p3, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 18
    .line 19
    invoke-virtual {p0, p3, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->k0(ZLandroid/widget/ImageView;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->j0(Z)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic Q(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->groups:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 21
    .line 22
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 27
    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->groups:Ljava/util/List;

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Group;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->h0(Lcom/p1/mobile/putong/feed/data/Group;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic R(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->R0:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->d3:I

    .line 6
    .line 7
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->N0:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    invoke-static {p1}, Ll/ksg;->b0(Lcom/p1/mobile/putong/data/User;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->k1:I

    .line 20
    .line 21
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->P0:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {p1, v0}, Ll/y3i;->a(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->Q0:Ll/n570;

    .line 33
    .line 34
    check-cast p0, Ll/wh00;

    .line 35
    .line 36
    invoke-interface {p0}, Ll/wh00;->f()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic S(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->N0:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-static {p1}, Ll/ksg;->b0(Lcom/p1/mobile/putong/data/User;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const-string p0, "\u7531\u4e8e\u9690\u79c1\u8bbe\u7f6e\uff0c\u8be5\u52a8\u6001\u4e0d\u652f\u6301\u964c\u751f\u4eba\u70b9\u8d5e"

    .line 10
    .line 11
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->p0:Lv/VImage;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->F0:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 20
    .line 21
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->c0(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic T(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->B:Lv/VLinear;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic U(Landroid/widget/ImageView;Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->B(Landroid/widget/ImageView;Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic V(Landroid/text/SpannableStringBuilder;[Landroid/text/style/URLSpan;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->u()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->u()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const/4 v1, 0x0

    .line 14
    aget-object p2, p2, v1

    .line 15
    .line 16
    invoke-virtual {p2}, Landroid/text/style/URLSpan;->getURL()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-static {v0, p1, p2}, Ll/orb0;->j(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p3, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->C(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 33
    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->name:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_0

    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 45
    .line 46
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 47
    .line 48
    const-string p2, "moment_id"

    .line 49
    .line 50
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 59
    .line 60
    invoke-virtual {p2, p3}, Ll/er60;->y(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    const-string p3, "moment_type"

    .line 65
    .line 66
    invoke-static {p3, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 73
    .line 74
    const-string p3, "actor_user_id"

    .line 75
    .line 76
    invoke-static {p3, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    filled-new-array {p1, p2, p0}, [Ll/pf60;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    const-string p1, "e_campaign_quiz"

    .line 85
    .line 86
    const-string p2, "p_user_moment_interactions_details_view"

    .line 87
    .line 88
    invoke-static {p1, p2, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 89
    .line 90
    .line 91
    :cond_0
    return-void
.end method

.method public final synthetic W(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->views:I

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->viewers:Ljava/util/List;

    .line 11
    .line 12
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 20
    .line 21
    if-nez p1, :cond_2

    .line 22
    .line 23
    :goto_0
    return-void

    .line 24
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->u()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 29
    .line 30
    iget-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->P0:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->M(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    const-string v0, "p_user_moment_interactions_details_view"

    .line 39
    .line 40
    invoke-static {p1, v0, v1, v2, p0}, Ll/zzg;->d(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final synthetic X(Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance v0, Ll/el00;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/el00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic Y(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->Q0:Ll/n570;

    .line 4
    .line 5
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    new-instance v1, Ll/rk00;

    .line 9
    .line 10
    invoke-direct {v1, p1}, Ll/rk00;-><init>(Ll/n570;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->Q0:Ll/n570;

    .line 14
    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 16
    .line 17
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p1, v2}, Ll/n570;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->u()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->P0:Ljava/lang/String;

    .line 28
    .line 29
    const/4 v5, 0x1

    .line 30
    invoke-static/range {v0 .. v5}, Ll/rzi;->P(Lcom/p1/mobile/putong/feed/data/Moment;Ll/qcj;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic Z()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->c1:Z

    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->N0:Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 11
    .line 12
    invoke-interface {v1, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Zj(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {v1}, Ll/ksg;->U(Lcom/p1/mobile/putong/data/ConversationStatus;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->d1:Z

    .line 21
    .line 22
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 23
    .line 24
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->N0:Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->N0:Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 35
    .line 36
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->d1:Z

    .line 43
    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 47
    .line 48
    invoke-static {v1}, Ll/at0;->d(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-nez v1, :cond_0

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    const/4 v0, 0x0

    .line 56
    :goto_0
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->d1:Z

    .line 57
    .line 58
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->y()V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final synthetic a0(Ljava/lang/Boolean;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->u()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/fl00;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/fl00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;)V

    .line 8
    .line 9
    .line 10
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->c1:Z

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const-wide/16 v1, 0x3e8

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const-wide/16 v1, 0x0

    .line 18
    .line 19
    :goto_0
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic b0(Landroid/view/View;)V
    .locals 10

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->G:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x1

    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->I:Lv/VText;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string v2, "\u901a\u8fc7\u52a8\u6001\u6253\u62db\u547c\uff0c\u66f4\u5bb9\u6613\u5f97\u5230\u56de\u590d"

    .line 22
    .line 23
    invoke-static {p1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    move p1, v0

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    move p1, v1

    .line 32
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->D:Lv/VText;

    .line 33
    .line 34
    invoke-virtual {v2}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->u()Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    sget v4, Lcom/p1/mobile/putong/feed/R$string;->Q0:I

    .line 47
    .line 48
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    const-string v3, "p_user_moment_interactions_details_view"

    .line 57
    .line 58
    if-eqz v2, :cond_1

    .line 59
    .line 60
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 65
    .line 66
    invoke-virtual {v1, v2, v3, v0, p1}, Ll/er60;->s(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZZ)V

    .line 67
    .line 68
    .line 69
    sget-object v4, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->u()Lcom/p1/mobile/android/app/Act;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->N0:Lcom/p1/mobile/putong/data/User;

    .line 76
    .line 77
    iget-object v7, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 78
    .line 79
    const-string v8, "p_user_moment_interactions_details_view"

    .line 80
    .line 81
    iget-boolean v9, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->K0:Z

    .line 82
    .line 83
    invoke-virtual/range {v4 .. v9}, Lcom/p1/mobile/putong/feed/api/b;->f3(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Z)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_1
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 92
    .line 93
    invoke-virtual {v0, v2, v3, v1, p1}, Ll/er60;->s(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZZ)V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->N0:Lcom/p1/mobile/putong/data/User;

    .line 97
    .line 98
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    if-eqz p1, :cond_2

    .line 103
    .line 104
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->u()Lcom/p1/mobile/android/app/Act;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->u()Lcom/p1/mobile/android/app/Act;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->N0:Lcom/p1/mobile/putong/data/User;

    .line 113
    .line 114
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 115
    .line 116
    invoke-static {v0, p0, v1, v1}, Ll/orb0;->c(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 121
    .line 122
    .line 123
    :cond_2
    return-void
.end method

.method public final c0(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;)V
    .locals 4

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->P0:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, v1, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->s0(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->u()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {}, Ll/nkh;->l()Ll/nkh;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-virtual {p2}, Ll/nkh;->f()Ljava/util/ArrayList;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    const-string p3, "p_user_moment_interactions_details_view"

    .line 26
    .line 27
    invoke-static {p0, p3, p1, p2}, Ll/x31;->a(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/util/List;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    new-instance v1, Ll/vk00;

    .line 32
    .line 33
    invoke-direct {v1, p0, p2, p3, v0}, Ll/vk00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;Landroid/widget/ImageView;Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;Z)V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->S0:Ll/x20;

    .line 37
    .line 38
    invoke-interface {v1}, Ll/x20;->call()V

    .line 39
    .line 40
    .line 41
    iget-object p3, p1, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 42
    .line 43
    iget v1, p3, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 44
    .line 45
    iget-object p3, p3, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 48
    .line 49
    .line 50
    move-result p3

    .line 51
    invoke-static {v1, p3}, Ljava/lang/Math;->max(II)I

    .line 52
    .line 53
    .line 54
    move-result p3

    .line 55
    const/4 v1, 0x0

    .line 56
    const/4 v2, 0x1

    .line 57
    if-nez v0, :cond_2

    .line 58
    .line 59
    const v0, 0x3fa66666    # 1.3f

    .line 60
    .line 61
    .line 62
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    int-to-float v0, v0

    .line 67
    const/4 v3, 0x0

    .line 68
    invoke-virtual {p0, p2, v3, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->I(Landroid/view/View;FF)Lcom/tantan/library/svga/SVGAnimationView;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->k0:Lv/VRelative;

    .line 73
    .line 74
    invoke-virtual {v3, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->u()Lcom/p1/mobile/android/app/Act;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-static {v1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    const-string v3, "feed_like_newui.svga"

    .line 89
    .line 90
    invoke-virtual {v1, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-virtual {v1, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {v1, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    new-instance v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$c;

    .line 103
    .line 104
    invoke-direct {v3, p0, p2, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$c;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;Landroid/widget/ImageView;Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v1, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    invoke-virtual {v1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->F0:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 115
    .line 116
    if-nez p3, :cond_1

    .line 117
    .line 118
    const-string p3, "1"

    .line 119
    .line 120
    invoke-virtual {v0, p3, v2}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->h(Ljava/lang/CharSequence;Z)V

    .line 121
    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_1
    add-int/2addr p3, v2

    .line 125
    invoke-static {p3}, Ll/q8g0;->h0(I)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p3

    .line 129
    invoke-virtual {v0, p3, v2}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->h(Ljava/lang/CharSequence;Z)V

    .line 130
    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->F0:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 134
    .line 135
    if-ne p3, v2, :cond_3

    .line 136
    .line 137
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->u()Lcom/p1/mobile/android/app/Act;

    .line 138
    .line 139
    .line 140
    move-result-object p3

    .line 141
    sget v3, Lcom/p1/mobile/putong/feed/R$string;->k:I

    .line 142
    .line 143
    invoke-virtual {p3, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p3

    .line 147
    invoke-virtual {v0, p3, v1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->h(Ljava/lang/CharSequence;Z)V

    .line 148
    .line 149
    .line 150
    goto :goto_0

    .line 151
    :cond_3
    sub-int/2addr p3, v2

    .line 152
    invoke-static {p3}, Ll/q8g0;->h0(I)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p3

    .line 156
    invoke-virtual {v0, p3, v1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->h(Ljava/lang/CharSequence;Z)V

    .line 157
    .line 158
    .line 159
    :goto_0
    iget-boolean p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 160
    .line 161
    xor-int/2addr p1, v2

    .line 162
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->k0(ZLandroid/widget/ImageView;)V

    .line 163
    .line 164
    .line 165
    return-void
.end method

.method public d0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->getCenterVieoView()Ll/stl;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/stl;->pause()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public e0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->getCenterVieoView()Ll/stl;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/stl;->play()V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-interface {p0, v0}, Ll/stl;->mute(Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public f0(Ll/n570;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZZLl/x20;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->Q0:Ll/n570;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->P0:Ljava/lang/String;

    .line 6
    .line 7
    iput-boolean p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->R0:Z

    .line 8
    .line 9
    iput-boolean p5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->J0:Z

    .line 10
    .line 11
    iput-boolean p7, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->K0:Z

    .line 12
    .line 13
    iput-object p6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->L0:Ll/x20;

    .line 14
    .line 15
    invoke-static {}, Ll/cmg;->n0()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    const/4 p3, 0x0

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->b1:Z

    .line 23
    .line 24
    if-nez p1, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->N(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    const/4 p1, 0x1

    .line 33
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->b1:Z

    .line 34
    .line 35
    new-instance p1, Ll/pf60;

    .line 36
    .line 37
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/data/Moment;->getTopicList()Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-interface {p2, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    check-cast p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 46
    .line 47
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 48
    .line 49
    const-string p4, "topic_id"

    .line 50
    .line 51
    invoke-direct {p1, p4, p2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    filled-new-array {p1}, [Ll/pf60;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    const-string p2, "e_moment_post"

    .line 59
    .line 60
    const-string p4, "p_user_moment_interactions_details_view"

    .line 61
    .line 62
    invoke-static {p2, p4, p1}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 63
    .line 64
    .line 65
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->g0()V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->i:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTagView;

    .line 69
    .line 70
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    if-eqz p1, :cond_1

    .line 75
    .line 76
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->i:Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTagView;

    .line 77
    .line 78
    invoke-static {p0, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 79
    .line 80
    .line 81
    :cond_1
    return-void
.end method

.method public g0()V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    move v0, v1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move v0, v2

    .line 10
    :goto_0
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->S:Lv/VText_Expandable;

    .line 19
    .line 20
    if-nez v3, :cond_2

    .line 21
    .line 22
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/helper/exception/MomentDetailHeaderBottomViewNullException;->reportContentViewNull(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_2
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->Q0:Ll/n570;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v3, v0}, Ll/n570;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->N0:Lcom/p1/mobile/putong/data/User;

    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->momentValue:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->G(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->N0:Lcom/p1/mobile/putong/data/User;

    .line 44
    .line 45
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    const/16 v3, 0x8

    .line 50
    .line 51
    if-eqz v0, :cond_4

    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-nez v0, :cond_3

    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->N0:Lcom/p1/mobile/putong/data/User;

    .line 64
    .line 65
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 66
    .line 67
    new-instance v4, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const-string v5, "\uff1a"

    .line 76
    .line 77
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 81
    .line 82
    iget-object v6, v6, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    new-instance v6, Landroid/text/SpannableString;

    .line 92
    .line 93
    invoke-direct {v6, v4}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 94
    .line 95
    .line 96
    new-instance v7, Landroid/text/style/ForegroundColorSpan;

    .line 97
    .line 98
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 99
    .line 100
    .line 101
    move-result-object v8

    .line 102
    sget v9, Ll/k9c0;->e0:I

    .line 103
    .line 104
    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getColor(I)I

    .line 105
    .line 106
    .line 107
    move-result v8

    .line 108
    invoke-direct {v7, v8}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 109
    .line 110
    .line 111
    new-instance v8, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v8

    .line 126
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    .line 127
    .line 128
    .line 129
    move-result v8

    .line 130
    const/16 v9, 0x21

    .line 131
    .line 132
    invoke-virtual {v6, v7, v2, v8, v9}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 133
    .line 134
    .line 135
    new-instance v7, Landroid/text/style/ForegroundColorSpan;

    .line 136
    .line 137
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 138
    .line 139
    .line 140
    move-result-object v8

    .line 141
    sget v10, Ll/k9c0;->c0:I

    .line 142
    .line 143
    invoke-virtual {v8, v10}, Landroid/content/res/Resources;->getColor(I)I

    .line 144
    .line 145
    .line 146
    move-result v8

    .line 147
    invoke-direct {v7, v8}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 148
    .line 149
    .line 150
    new-instance v8, Ljava/lang/StringBuilder;

    .line 151
    .line 152
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 170
    .line 171
    .line 172
    move-result v4

    .line 173
    invoke-virtual {v6, v7, v0, v4, v9}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 174
    .line 175
    .line 176
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->S:Lv/VText_Expandable;

    .line 177
    .line 178
    invoke-virtual {v0, v6}, Lv/VText_Expandable;->setText(Ljava/lang/CharSequence;)V

    .line 179
    .line 180
    .line 181
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->S:Lv/VText_Expandable;

    .line 182
    .line 183
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 184
    .line 185
    .line 186
    goto :goto_1

    .line 187
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->S:Lv/VText_Expandable;

    .line 188
    .line 189
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 190
    .line 191
    .line 192
    goto :goto_1

    .line 193
    :cond_4
    new-instance v0, Ljava/lang/Exception;

    .line 194
    .line 195
    new-instance v4, Ljava/lang/StringBuilder;

    .line 196
    .line 197
    const-string v5, "MomentDetailHeaderBottomView renderDetail user = null id:"

    .line 198
    .line 199
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 203
    .line 204
    iget-object v5, v5, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 205
    .line 206
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    const-string v5, ",from:"

    .line 210
    .line 211
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->P0:Ljava/lang/String;

    .line 215
    .line 216
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    const-string v5, ",momentid:"

    .line 220
    .line 221
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 225
    .line 226
    iget-object v5, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 227
    .line 228
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v4

    .line 235
    invoke-direct {v0, v4}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 236
    .line 237
    .line 238
    const/16 v4, 0x2710

    .line 239
    .line 240
    invoke-static {v0, v4}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 241
    .line 242
    .line 243
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->g:Lv/VLinear;

    .line 244
    .line 245
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 246
    .line 247
    .line 248
    move-result v0

    .line 249
    if-eqz v0, :cond_5

    .line 250
    .line 251
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->g:Lv/VLinear;

    .line 252
    .line 253
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 254
    .line 255
    .line 256
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->a1:Ll/fo00;

    .line 257
    .line 258
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 259
    .line 260
    .line 261
    move-result v0

    .line 262
    if-eqz v0, :cond_6

    .line 263
    .line 264
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->S:Lv/VText_Expandable;

    .line 265
    .line 266
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 267
    .line 268
    .line 269
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->e:Lv/VText;

    .line 270
    .line 271
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 272
    .line 273
    .line 274
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;

    .line 275
    .line 276
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 277
    .line 278
    .line 279
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->g:Lv/VLinear;

    .line 280
    .line 281
    const/high16 v4, 0x41000000    # 8.0f

    .line 282
    .line 283
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 284
    .line 285
    .line 286
    move-result v4

    .line 287
    invoke-static {v0, v4}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 288
    .line 289
    .line 290
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->d:Lv/VText;

    .line 291
    .line 292
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 293
    .line 294
    .line 295
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->a1:Ll/fo00;

    .line 296
    .line 297
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->P0:Ljava/lang/String;

    .line 298
    .line 299
    invoke-virtual {v0, v4}, Ll/fo00;->f(Ljava/lang/String;)V

    .line 300
    .line 301
    .line 302
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->a1:Ll/fo00;

    .line 303
    .line 304
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->g:Lv/VLinear;

    .line 305
    .line 306
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->u()Lcom/p1/mobile/android/app/Act;

    .line 307
    .line 308
    .line 309
    move-result-object v5

    .line 310
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 311
    .line 312
    invoke-virtual {v0, v4, v5, v6}, Ll/fo00;->c(Lv/VLinear;Landroid/content/Context;Ljava/lang/Object;)V

    .line 313
    .line 314
    .line 315
    goto/16 :goto_4

    .line 316
    .line 317
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 318
    .line 319
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->hyperlink:Ljava/lang/String;

    .line 320
    .line 321
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 322
    .line 323
    .line 324
    move-result v0

    .line 325
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->e:Lv/VText;

    .line 326
    .line 327
    if-nez v0, :cond_7

    .line 328
    .line 329
    invoke-static {v4, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 330
    .line 331
    .line 332
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 333
    .line 334
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->D(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 335
    .line 336
    .line 337
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 338
    .line 339
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->hyperlink:Ljava/lang/String;

    .line 340
    .line 341
    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    .line 342
    .line 343
    .line 344
    move-result-object v0

    .line 345
    new-instance v4, Landroid/text/SpannableStringBuilder;

    .line 346
    .line 347
    invoke-direct {v4, v0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 348
    .line 349
    .line 350
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 351
    .line 352
    .line 353
    move-result v0

    .line 354
    const-class v5, Landroid/text/style/URLSpan;

    .line 355
    .line 356
    invoke-virtual {v4, v2, v0, v5}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 357
    .line 358
    .line 359
    move-result-object v0

    .line 360
    check-cast v0, [Landroid/text/style/URLSpan;

    .line 361
    .line 362
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->e:Lv/VText;

    .line 363
    .line 364
    invoke-virtual {v4}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    .line 365
    .line 366
    .line 367
    move-result-object v6

    .line 368
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 369
    .line 370
    .line 371
    if-eqz v0, :cond_8

    .line 372
    .line 373
    array-length v5, v0

    .line 374
    if-lez v5, :cond_8

    .line 375
    .line 376
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->e:Lv/VText;

    .line 377
    .line 378
    new-instance v6, Ll/yk00;

    .line 379
    .line 380
    invoke-direct {v6, p0, v4, v0}, Ll/yk00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;Landroid/text/SpannableStringBuilder;[Landroid/text/style/URLSpan;)V

    .line 381
    .line 382
    .line 383
    invoke-static {v5, v6}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 384
    .line 385
    .line 386
    goto :goto_2

    .line 387
    :cond_7
    invoke-static {v4, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 388
    .line 389
    .line 390
    :cond_8
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 391
    .line 392
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 393
    .line 394
    if-eqz v0, :cond_a

    .line 395
    .line 396
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->share:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 397
    .line 398
    if-eqz v0, :cond_a

    .line 399
    .line 400
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/MomentShareInfo;->isMomentShareEmpty()Z

    .line 401
    .line 402
    .line 403
    move-result v0

    .line 404
    if-eqz v0, :cond_9

    .line 405
    .line 406
    goto :goto_3

    .line 407
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;

    .line 408
    .line 409
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 410
    .line 411
    .line 412
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;

    .line 413
    .line 414
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 415
    .line 416
    iget-object v5, v4, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 417
    .line 418
    iget-object v5, v5, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->share:Lcom/p1/mobile/putong/feed/data/MomentShareInfo;

    .line 419
    .line 420
    iget-object v6, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 421
    .line 422
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 423
    .line 424
    const-string v7, "p_user_moment_interactions_details_view"

    .line 425
    .line 426
    invoke-virtual {v0, v5, v7, v6, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->f(Lcom/p1/mobile/putong/feed/data/MomentShareInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 427
    .line 428
    .line 429
    goto :goto_4

    .line 430
    :cond_a
    :goto_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;

    .line 431
    .line 432
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 433
    .line 434
    .line 435
    :goto_4
    invoke-static {}, Ll/cmg;->n0()Z

    .line 436
    .line 437
    .line 438
    move-result v0

    .line 439
    if-eqz v0, :cond_b

    .line 440
    .line 441
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 442
    .line 443
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 444
    .line 445
    .line 446
    move-result v0

    .line 447
    if-eqz v0, :cond_b

    .line 448
    .line 449
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 450
    .line 451
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->shareMyVote:Z

    .line 452
    .line 453
    if-nez v0, :cond_c

    .line 454
    .line 455
    :cond_b
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->A()V

    .line 456
    .line 457
    .line 458
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->N0:Lcom/p1/mobile/putong/data/User;

    .line 459
    .line 460
    if-eqz v0, :cond_d

    .line 461
    .line 462
    invoke-static {v0}, Ll/ksg;->n0(Lcom/p1/mobile/putong/data/User;)Z

    .line 463
    .line 464
    .line 465
    move-result v0

    .line 466
    if-nez v0, :cond_e

    .line 467
    .line 468
    :cond_d
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->w()Landroid/view/View;

    .line 469
    .line 470
    .line 471
    move-result-object v0

    .line 472
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->V0:Landroid/view/View;

    .line 473
    .line 474
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->V0:Landroid/view/View;

    .line 475
    .line 476
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 477
    .line 478
    .line 479
    move-result v0

    .line 480
    if-eqz v0, :cond_f

    .line 481
    .line 482
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->W:Landroid/widget/RelativeLayout;

    .line 483
    .line 484
    const/high16 v4, 0x41100000    # 9.0f

    .line 485
    .line 486
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 487
    .line 488
    .line 489
    move-result v4

    .line 490
    invoke-static {v0, v4}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 491
    .line 492
    .line 493
    goto :goto_5

    .line 494
    :cond_f
    invoke-static {}, Ll/cmg;->X()Z

    .line 495
    .line 496
    .line 497
    move-result v0

    .line 498
    if-eqz v0, :cond_10

    .line 499
    .line 500
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->W:Landroid/widget/RelativeLayout;

    .line 501
    .line 502
    const/high16 v4, 0x41a00000    # 20.0f

    .line 503
    .line 504
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 505
    .line 506
    .line 507
    move-result v4

    .line 508
    invoke-static {v0, v4}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 509
    .line 510
    .line 511
    :cond_10
    :goto_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->l0()V

    .line 512
    .line 513
    .line 514
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->g:Lv/VLinear;

    .line 515
    .line 516
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 517
    .line 518
    .line 519
    move-result v0

    .line 520
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->g:Lv/VLinear;

    .line 521
    .line 522
    if-nez v0, :cond_11

    .line 523
    .line 524
    invoke-virtual {v4, v3}, Landroid/view/View;->setVisibility(I)V

    .line 525
    .line 526
    .line 527
    goto :goto_6

    .line 528
    :cond_11
    invoke-virtual {v4, v2}, Landroid/view/View;->setVisibility(I)V

    .line 529
    .line 530
    .line 531
    :goto_6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->getCenterVieoView()Ll/stl;

    .line 532
    .line 533
    .line 534
    move-result-object v0

    .line 535
    if-eqz v0, :cond_12

    .line 536
    .line 537
    invoke-interface {v0}, Ll/stl;->getPlayerView()Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 538
    .line 539
    .line 540
    move-result-object v0

    .line 541
    goto :goto_7

    .line 542
    :cond_12
    const/4 v0, 0x0

    .line 543
    :goto_7
    if-eqz v0, :cond_13

    .line 544
    .line 545
    new-instance v4, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$a;

    .line 546
    .line 547
    invoke-direct {v4, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;)V

    .line 548
    .line 549
    .line 550
    invoke-virtual {v0, v4}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->x(Ll/ie80$b;)V

    .line 551
    .line 552
    .line 553
    :cond_13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->l:Lv/VText;

    .line 554
    .line 555
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 556
    .line 557
    .line 558
    move-result v0

    .line 559
    if-eqz v0, :cond_14

    .line 560
    .line 561
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->l:Lv/VText;

    .line 562
    .line 563
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 564
    .line 565
    iget-wide v4, v4, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    .line 566
    .line 567
    invoke-static {v4, v5}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 568
    .line 569
    .line 570
    move-result-object v4

    .line 571
    invoke-virtual {p0, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->x(Ljava/lang/String;)Ljava/lang/String;

    .line 572
    .line 573
    .line 574
    move-result-object v4

    .line 575
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 576
    .line 577
    .line 578
    :cond_14
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 579
    .line 580
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->m0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 581
    .line 582
    .line 583
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->p:Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;

    .line 584
    .line 585
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->q:Lv/VText;

    .line 586
    .line 587
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->r:Lv/VImage;

    .line 588
    .line 589
    const/4 v6, 0x3

    .line 590
    new-array v6, v6, [Landroid/view/View;

    .line 591
    .line 592
    aput-object v0, v6, v2

    .line 593
    .line 594
    aput-object v4, v6, v1

    .line 595
    .line 596
    const/4 v0, 0x2

    .line 597
    aput-object v5, v6, v0

    .line 598
    .line 599
    invoke-static {v6}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 600
    .line 601
    .line 602
    move-result-object v0

    .line 603
    new-instance v4, Ll/zk00;

    .line 604
    .line 605
    invoke-direct {v4, p0}, Ll/zk00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;)V

    .line 606
    .line 607
    .line 608
    invoke-static {v0, v4}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 609
    .line 610
    .line 611
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->j:Lv/VLinear;

    .line 612
    .line 613
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->k:Lv/VText;

    .line 614
    .line 615
    invoke-static {v4}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 616
    .line 617
    .line 618
    move-result v4

    .line 619
    if-nez v4, :cond_16

    .line 620
    .line 621
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->l:Lv/VText;

    .line 622
    .line 623
    invoke-static {v4}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 624
    .line 625
    .line 626
    move-result v4

    .line 627
    if-nez v4, :cond_16

    .line 628
    .line 629
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->T:Lv/VText;

    .line 630
    .line 631
    invoke-static {v4}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 632
    .line 633
    .line 634
    move-result v4

    .line 635
    if-eqz v4, :cond_15

    .line 636
    .line 637
    goto :goto_8

    .line 638
    :cond_15
    move v4, v2

    .line 639
    goto :goto_9

    .line 640
    :cond_16
    :goto_8
    move v4, v1

    .line 641
    :goto_9
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 642
    .line 643
    .line 644
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->E:Landroid/widget/ImageView;

    .line 645
    .line 646
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 647
    .line 648
    .line 649
    move-result v0

    .line 650
    if-eqz v0, :cond_17

    .line 651
    .line 652
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->E:Landroid/widget/ImageView;

    .line 653
    .line 654
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 655
    .line 656
    .line 657
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->E:Landroid/widget/ImageView;

    .line 658
    .line 659
    new-instance v4, Ll/al00;

    .line 660
    .line 661
    invoke-direct {v4, p0}, Ll/al00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;)V

    .line 662
    .line 663
    .line 664
    invoke-virtual {v0, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 665
    .line 666
    .line 667
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 668
    .line 669
    invoke-static {v0}, Ll/ksg;->V(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 670
    .line 671
    .line 672
    move-result v0

    .line 673
    if-eqz v0, :cond_17

    .line 674
    .line 675
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->E:Landroid/widget/ImageView;

    .line 676
    .line 677
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 678
    .line 679
    .line 680
    :cond_17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 681
    .line 682
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 683
    .line 684
    if-eqz v0, :cond_18

    .line 685
    .line 686
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 687
    .line 688
    .line 689
    move-result v0

    .line 690
    if-nez v0, :cond_19

    .line 691
    .line 692
    :cond_18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->S:Lv/VText_Expandable;

    .line 693
    .line 694
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 695
    .line 696
    .line 697
    :cond_19
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 698
    .line 699
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 700
    .line 701
    iget v4, v0, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 702
    .line 703
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 704
    .line 705
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 706
    .line 707
    .line 708
    move-result v0

    .line 709
    invoke-static {v4, v0}, Ljava/lang/Math;->max(II)I

    .line 710
    .line 711
    .line 712
    move-result v0

    .line 713
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->L(I)V

    .line 714
    .line 715
    .line 716
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->U:Lv/VText;

    .line 717
    .line 718
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 719
    .line 720
    .line 721
    move-result v0

    .line 722
    if-eqz v0, :cond_1a

    .line 723
    .line 724
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->U:Lv/VText;

    .line 725
    .line 726
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 727
    .line 728
    .line 729
    :cond_1a
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 730
    .line 731
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 732
    .line 733
    .line 734
    move-result v0

    .line 735
    if-eqz v0, :cond_1b

    .line 736
    .line 737
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 738
    .line 739
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 740
    .line 741
    .line 742
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->P0:Ljava/lang/String;

    .line 743
    .line 744
    invoke-static {v3}, Ll/er60;->D(Ljava/lang/String;)Ljava/lang/String;

    .line 745
    .line 746
    .line 747
    move-result-object v3

    .line 748
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/feed/data/Moment;->setMomentShowFrom(Ljava/lang/String;)V

    .line 749
    .line 750
    .line 751
    :cond_1b
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->F:Lv/VText;

    .line 752
    .line 753
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 754
    .line 755
    .line 756
    move-result v0

    .line 757
    if-eqz v0, :cond_1c

    .line 758
    .line 759
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->F:Lv/VText;

    .line 760
    .line 761
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 762
    .line 763
    .line 764
    :cond_1c
    invoke-static {}, Ll/cmg;->O()Z

    .line 765
    .line 766
    .line 767
    move-result v0

    .line 768
    if-eqz v0, :cond_1f

    .line 769
    .line 770
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 771
    .line 772
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 773
    .line 774
    .line 775
    move-result v0

    .line 776
    if-eqz v0, :cond_1f

    .line 777
    .line 778
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 779
    .line 780
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/Moment;->isAnonymousMoment()Z

    .line 781
    .line 782
    .line 783
    move-result v0

    .line 784
    if-nez v0, :cond_1f

    .line 785
    .line 786
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 787
    .line 788
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 789
    .line 790
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->id:Ljava/lang/String;

    .line 791
    .line 792
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 793
    .line 794
    .line 795
    move-result v0

    .line 796
    if-nez v0, :cond_1f

    .line 797
    .line 798
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->L:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 799
    .line 800
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 801
    .line 802
    .line 803
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->N:Lv/VText;

    .line 804
    .line 805
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 806
    .line 807
    .line 808
    move-result-object v0

    .line 809
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 810
    .line 811
    .line 812
    move-result v2

    .line 813
    if-eqz v2, :cond_1d

    .line 814
    .line 815
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 816
    .line 817
    .line 818
    :cond_1d
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->N:Lv/VText;

    .line 819
    .line 820
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 821
    .line 822
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 823
    .line 824
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->name:Ljava/lang/String;

    .line 825
    .line 826
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 827
    .line 828
    .line 829
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->u()Lcom/p1/mobile/android/app/Act;

    .line 830
    .line 831
    .line 832
    move-result-object v0

    .line 833
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->i0(Lcom/p1/mobile/android/app/Act;)V

    .line 834
    .line 835
    .line 836
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->T0:Z

    .line 837
    .line 838
    if-nez v0, :cond_1e

    .line 839
    .line 840
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 841
    .line 842
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 843
    .line 844
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->E(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/GroupIdBox;)V

    .line 845
    .line 846
    .line 847
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->T0:Z

    .line 848
    .line 849
    :cond_1e
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->L:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 850
    .line 851
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$b;

    .line 852
    .line 853
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView$b;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;)V

    .line 854
    .line 855
    .line 856
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 857
    .line 858
    .line 859
    goto :goto_a

    .line 860
    :cond_1f
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->L:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 861
    .line 862
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 863
    .line 864
    .line 865
    :goto_a
    invoke-static {}, Ll/j4h;->a()Z

    .line 866
    .line 867
    .line 868
    move-result v0

    .line 869
    if-nez v0, :cond_20

    .line 870
    .line 871
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->y()V

    .line 872
    .line 873
    .line 874
    goto :goto_b

    .line 875
    :cond_20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->N0:Lcom/p1/mobile/putong/data/User;

    .line 876
    .line 877
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 878
    .line 879
    .line 880
    move-result v0

    .line 881
    if-eqz v0, :cond_21

    .line 882
    .line 883
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->u()Lcom/p1/mobile/android/app/Act;

    .line 884
    .line 885
    .line 886
    move-result-object v0

    .line 887
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->N0:Lcom/p1/mobile/putong/data/User;

    .line 888
    .line 889
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 890
    .line 891
    invoke-static {v1}, Ll/kyi;->b(Ljava/lang/String;)Lrx/c;

    .line 892
    .line 893
    .line 894
    move-result-object v1

    .line 895
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 896
    .line 897
    .line 898
    move-result-object v0

    .line 899
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 900
    .line 901
    .line 902
    move-result-object v0

    .line 903
    new-instance v1, Ll/bl00;

    .line 904
    .line 905
    invoke-direct {v1, p0}, Ll/bl00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;)V

    .line 906
    .line 907
    .line 908
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 909
    .line 910
    .line 911
    move-result-object v1

    .line 912
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 913
    .line 914
    .line 915
    :cond_21
    :goto_b
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->p0()V

    .line 916
    .line 917
    .line 918
    return-void
.end method

.method public getCenterVieoView()Ll/stl;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->g:Lv/VLinear;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_2

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-gtz v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->g:Lv/VLinear;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    instance-of v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    instance-of v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 40
    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_2
    :goto_0
    return-object v1
.end method

.method public getMomentHeaderInsertProxy()Ll/fo00;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->a1:Ll/fo00;

    .line 2
    .line 3
    return-object p0
.end method

.method public h0(Lcom/p1/mobile/putong/feed/data/Group;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->J(Lcom/p1/mobile/putong/feed/data/Group;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O:Lv/VText;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/16 p0, 0x8

    .line 17
    .line 18
    invoke-virtual {v1, p0}, Landroid/view/View;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    const/4 v0, 0x0

    .line 23
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O:Lv/VText;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public i0(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->id:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ll/jka;->u7(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Group;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->h0(Lcom/p1/mobile/putong/feed/data/Group;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->H(Lcom/p1/mobile/android/app/Act;)V

    .line 44
    .line 45
    .line 46
    :cond_1
    return-void
.end method

.method public final j0(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->F0:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->clearAnimation()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->F0:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 7
    .line 8
    const-string v1, "1"

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->getText()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->u()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sget v3, Lcom/p1/mobile/putong/feed/R$string;->k:I

    .line 22
    .line 23
    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->F0:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 32
    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->h(Ljava/lang/CharSequence;Z)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->getText()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    add-int/2addr p1, v2

    .line 48
    invoke-static {p1}, Ll/q8g0;->h0(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p0, p1, v2}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->h(Ljava/lang/CharSequence;Z)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->getText()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->F0:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 65
    .line 66
    const/4 v1, 0x0

    .line 67
    if-eqz p1, :cond_2

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->u()Lcom/p1/mobile/android/app/Act;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->k:I

    .line 74
    .line 75
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->h(Ljava/lang/CharSequence;Z)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_2
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->getText()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    sub-int/2addr p0, v2

    .line 92
    invoke-static {p0}, Ll/q8g0;->h0(I)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->h(Ljava/lang/CharSequence;Z)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public final k0(ZLandroid/widget/ImageView;)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    const/4 v2, 0x1

    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->E0:Lv/VDraweeView;

    .line 10
    .line 11
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->F0:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->u()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    sget v1, Ll/k9c0;->K:I

    .line 25
    .line 26
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->setTextColor(I)V

    .line 31
    .line 32
    .line 33
    sget p0, Ll/lbc0;->c3:I

    .line 34
    .line 35
    invoke-virtual {p2, p0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->P0:Ljava/lang/String;

    .line 43
    .line 44
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 45
    .line 46
    invoke-virtual {p0, p1, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->s0(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_5

    .line 51
    .line 52
    invoke-static {}, Ll/nkh;->l()Ll/nkh;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 57
    .line 58
    iget v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->attitudeId:I

    .line 59
    .line 60
    invoke-virtual {p1, v0}, Ll/nkh;->j(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-static {p2}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-nez v0, :cond_3

    .line 69
    .line 70
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->U0:I

    .line 71
    .line 72
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 73
    .line 74
    iget v3, v3, Lcom/p1/mobile/putong/feed/data/Moment;->attitudeId:I

    .line 75
    .line 76
    if-eq v0, v3, :cond_1

    .line 77
    .line 78
    if-lez v0, :cond_1

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_1
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 82
    .line 83
    .line 84
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->E0:Lv/VDraweeView;

    .line 85
    .line 86
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 87
    .line 88
    .line 89
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    if-nez p2, :cond_2

    .line 94
    .line 95
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 96
    .line 97
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->E0:Lv/VDraweeView;

    .line 98
    .line 99
    invoke-virtual {p2, v0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 103
    .line 104
    iget p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->attitudeId:I

    .line 105
    .line 106
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->U0:I

    .line 107
    .line 108
    return-void

    .line 109
    :cond_3
    :goto_0
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 110
    .line 111
    .line 112
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->E0:Lv/VDraweeView;

    .line 113
    .line 114
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 115
    .line 116
    .line 117
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 118
    .line 119
    .line 120
    move-result p2

    .line 121
    if-nez p2, :cond_4

    .line 122
    .line 123
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 124
    .line 125
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->E0:Lv/VDraweeView;

    .line 126
    .line 127
    invoke-virtual {p2, v0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    invoke-static {}, Ll/nkh;->l()Ll/nkh;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->E0:Lv/VDraweeView;

    .line 135
    .line 136
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->u:Lv/VFrame;

    .line 137
    .line 138
    invoke-virtual {p1, p2, v0}, Ll/nkh;->n(Landroid/view/View;Landroid/view/View;)V

    .line 139
    .line 140
    .line 141
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 142
    .line 143
    iget p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->attitudeId:I

    .line 144
    .line 145
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->U0:I

    .line 146
    .line 147
    return-void

    .line 148
    :cond_5
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->X0:Z

    .line 149
    .line 150
    if-nez p1, :cond_6

    .line 151
    .line 152
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 153
    .line 154
    .line 155
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->E0:Lv/VDraweeView;

    .line 156
    .line 157
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 158
    .line 159
    .line 160
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->F0:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 161
    .line 162
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->u()Lcom/p1/mobile/android/app/Act;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    sget v1, Ll/k9c0;->n:I

    .line 171
    .line 172
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 173
    .line 174
    .line 175
    move-result p0

    .line 176
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;->setTextColor(I)V

    .line 177
    .line 178
    .line 179
    sget p0, Ll/lbc0;->Y2:I

    .line 180
    .line 181
    invoke-virtual {p2, p0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    .line 185
    .line 186
    .line 187
    return-void
.end method

.method public final l0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->T:Lv/VText;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "poiname"

    .line 22
    .line 23
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    filled-new-array {v0}, [Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "e_moment_poi_tag"

    .line 32
    .line 33
    const-string v2, "p_user_moment_interactions_details_view"

    .line 34
    .line 35
    invoke-static {v1, v2, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->T:Lv/VText;

    .line 39
    .line 40
    const/4 v1, 0x0

    .line 41
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->T:Lv/VText;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->T:Lv/VText;

    .line 57
    .line 58
    const/16 v0, 0x8

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final m0(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 5

    .line 1
    invoke-static {}, Ll/cmg;->T()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    invoke-static {}, Ll/mrb0;->C()Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->k:Lv/VText;

    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->setUserViewsHistoryVisitiby(Z)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->n0()V

    .line 32
    .line 33
    .line 34
    new-array v0, v1, [Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_0

    .line 45
    .line 46
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 47
    .line 48
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-eqz v2, :cond_0

    .line 53
    .line 54
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 55
    .line 56
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->viewers:Ljava/util/List;

    .line 57
    .line 58
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-nez v2, :cond_0

    .line 63
    .line 64
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 65
    .line 66
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->viewers:Ljava/util/List;

    .line 67
    .line 68
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    const/4 v3, 0x3

    .line 73
    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    move v3, v1

    .line 78
    :goto_0
    if-ge v3, v2, :cond_0

    .line 79
    .line 80
    iget-object v4, p1, Lcom/p1/mobile/putong/feed/data/Moment;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 81
    .line 82
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->viewers:Ljava/util/List;

    .line 83
    .line 84
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    check-cast v4, Lcom/p1/mobile/putong/feed/data/ViewersBox;

    .line 89
    .line 90
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/ViewersBox;->userId:Ljava/lang/String;

    .line 91
    .line 92
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    add-int/lit8 v3, v3, 0x1

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_0
    invoke-static {v0}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 99
    .line 100
    .line 101
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->q:Lv/VText;

    .line 102
    .line 103
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    if-eqz v2, :cond_1

    .line 108
    .line 109
    move v2, v1

    .line 110
    goto :goto_1

    .line 111
    :cond_1
    const/high16 v2, 0x40800000    # 4.0f

    .line 112
    .line 113
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    :goto_1
    invoke-static {p1, v2}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 118
    .line 119
    .line 120
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->p:Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;

    .line 121
    .line 122
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->n0(Ljava/util/List;Z)V

    .line 123
    .line 124
    .line 125
    return-void

    .line 126
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->r:Lv/VImage;

    .line 127
    .line 128
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 129
    .line 130
    .line 131
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->setUserViewsHistoryVisitiby(Z)V

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method public final n0()V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->views:I

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->r:Lv/VImage;

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->q:Lv/VText;

    .line 16
    .line 17
    const-string v2, "0\u6d4f\u89c8"

    .line 18
    .line 19
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->viewers:Ljava/util/List;

    .line 45
    .line 46
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_2

    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->r:Lv/VImage;

    .line 53
    .line 54
    const/4 v1, 0x1

    .line 55
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->r:Lv/VImage;

    .line 60
    .line 61
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 62
    .line 63
    .line 64
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->q:Lv/VText;

    .line 65
    .line 66
    new-instance v1, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 72
    .line 73
    iget p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->views:I

    .line 74
    .line 75
    invoke-static {p0}, Ll/q8g0;->i0(I)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    const-string p0, "\u6d4f\u89c8"

    .line 83
    .line 84
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public o0()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->d1:Z

    .line 2
    .line 3
    const-string v1, "p_user_moment_interactions_details_view"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->N0:Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    invoke-static {v0}, Ll/ksg;->n0(Lcom/p1/mobile/putong/data/User;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->J0:Z

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 25
    .line 26
    invoke-virtual {v0, p0, v1, v2, v2}, Ll/er60;->t(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZZ)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->J0:Z

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->N0:Lcom/p1/mobile/putong/data/User;

    .line 35
    .line 36
    invoke-static {v0}, Ll/ksg;->n0(Lcom/p1/mobile/putong/data/User;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_1

    .line 41
    .line 42
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 47
    .line 48
    const/4 v3, 0x1

    .line 49
    invoke-virtual {v0, p0, v1, v3, v2}, Ll/er60;->t(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZZ)V

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->F()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->V:Lv/VLinear;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/16 v1, 0x8

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->V:Lv/VLinear;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->W:Landroid/widget/RelativeLayout;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->I0:Lv/VText;

    .line 29
    .line 30
    new-instance v2, Ll/qk00;

    .line 31
    .line 32
    invoke-direct {v2}, Ll/qk00;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->l:Lv/VText;

    .line 39
    .line 40
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public p0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->B:Lv/VLinear;

    .line 2
    .line 3
    new-instance v1, Ll/gl00;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/gl00;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/ksg;->G0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final q0()V
    .locals 6

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->H0:Landroid/widget/TextView;

    .line 5
    .line 6
    invoke-virtual {v1, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Landroid/graphics/Point;

    .line 10
    .line 11
    invoke-direct {v1}, Landroid/graphics/Point;-><init>()V

    .line 12
    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    aget v3, v0, v2

    .line 16
    .line 17
    const/high16 v4, 0x42fa0000    # 125.0f

    .line 18
    .line 19
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    sub-int/2addr v3, v4

    .line 24
    invoke-static {}, Ll/bnl0;->F0()I

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    const/high16 v5, 0x42300000    # 44.0f

    .line 29
    .line 30
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    add-int/2addr v4, v5

    .line 35
    const/high16 v5, 0x41400000    # 12.0f

    .line 36
    .line 37
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result v5

    .line 41
    add-int/2addr v4, v5

    .line 42
    if-ge v3, v4, :cond_0

    .line 43
    .line 44
    aget v0, v0, v2

    .line 45
    .line 46
    const/high16 v2, 0x41200000    # 10.0f

    .line 47
    .line 48
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    sub-int v3, v0, v2

    .line 53
    .line 54
    :cond_0
    iput v3, v1, Landroid/graphics/Point;->y:I

    .line 55
    .line 56
    const/4 v0, 0x0

    .line 57
    iput v0, v1, Landroid/graphics/Point;->x:I

    .line 58
    .line 59
    new-instance v0, Ll/jrg;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->u()Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 66
    .line 67
    const-string v4, "p_user_moment_interactions_details_view"

    .line 68
    .line 69
    invoke-direct {v0, v2, v1, v3, v4}, Ll/jrg;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/graphics/Point;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->H0:Landroid/widget/TextView;

    .line 73
    .line 74
    invoke-virtual {v0, p0}, Ll/jrg;->a(Landroid/view/View;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public final r0(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {}, Ll/cmg;->X()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "from_discover_discussion"

    .line 8
    .line 9
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

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
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final s0(Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;)Z
    .locals 0

    .line 1
    invoke-static {}, Ll/cmg;->X()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "from_discover_discussion"

    .line 8
    .line 9
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    iget p0, p2, Lcom/p1/mobile/putong/feed/data/Moment;->attitudeId:I

    .line 16
    .line 17
    if-lez p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public setLikeCommentRightMargin(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->W:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    instance-of v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->W:Landroid/widget/RelativeLayout;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 18
    .line 19
    iput p1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->W:Landroid/widget/RelativeLayout;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public setMomentHeaderInsertProxy(Ll/fo00;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->a1:Ll/fo00;

    .line 2
    .line 3
    return-void
.end method

.method public final t(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/il00;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public t0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->getCenterVieoView()Ll/stl;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/stl;->stop()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final u()Lcom/p1/mobile/android/app/Act;
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

.method public final v()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->Y0:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->g:Lv/VLinear;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->Y0:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;

    .line 17
    .line 18
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->Y0:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->u()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 25
    .line 26
    const/4 v7, 0x0

    .line 27
    sget v8, Ll/qa00;->j:I

    .line 28
    .line 29
    const-string v5, ""

    .line 30
    .line 31
    const-string v6, "p_user_moment_interactions_details_view"

    .line 32
    .line 33
    invoke-virtual/range {v2 .. v8}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;->P(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/String;ZI)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->g:Lv/VLinear;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->Y0:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 41
    .line 42
    .line 43
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->Z0:Z

    .line 44
    .line 45
    if-nez v0, :cond_1

    .line 46
    .line 47
    const/4 v0, 0x1

    .line 48
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->Z0:Z

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->Y0:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveView;->R()V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method public w()Landroid/view/View;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->P0:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->r0(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return-object v1

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->Q0:Ll/n570;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    return-object v1

    .line 16
    :cond_1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->W0:Z

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    const-string v2, "p_user_moment_interactions_details_view"

    .line 20
    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    new-array v0, v0, [Ll/pf60;

    .line 25
    .line 26
    const-string v3, "e_attitude_guide"

    .line 27
    .line 28
    invoke-static {v3, v2, v0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 29
    .line 30
    .line 31
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->W0:Z

    .line 32
    .line 33
    :cond_2
    new-instance v0, Ll/qrg$a;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->u()Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->g:Lv/VLinear;

    .line 40
    .line 41
    invoke-direct {v0, v3, v4}, Ll/qrg$a;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)V

    .line 42
    .line 43
    .line 44
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->Q0:Ll/n570;

    .line 45
    .line 46
    invoke-virtual {v0, v3}, Ll/qrg$a;->k(Ll/n570;)Ll/qrg$a;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 51
    .line 52
    invoke-virtual {v0, p0}, Ll/qrg$a;->i(Lcom/p1/mobile/putong/feed/data/Moment;)Ll/qrg$a;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0, v2}, Ll/qrg$a;->j(Ljava/lang/String;)Ll/qrg$a;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0, v1}, Ll/qrg$a;->h(Z)Ll/qrg$a;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Ll/qrg$a;->g()Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0
.end method

.method public final x(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    sget-object p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->e1:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public final y()V
    .locals 9

    .line 1
    sget v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->f1:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->setLikeCommentRightMargin(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->B:Lv/VLinear;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->G0:Lv/VLinear;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->z:Lv/VImage;

    .line 15
    .line 16
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->H0:Landroid/widget/TextView;

    .line 17
    .line 18
    invoke-static {v0, v1, v2}, Ll/h9i;->c(Landroid/view/View;Lv/VImage;Landroid/widget/TextView;)V

    .line 19
    .line 20
    .line 21
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->k0:Lv/VRelative;

    .line 22
    .line 23
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->G0:Lv/VLinear;

    .line 24
    .line 25
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->p0:Lv/VImage;

    .line 26
    .line 27
    iget-object v7, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->F0:Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;

    .line 28
    .line 29
    iget-object v8, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->P0:Ljava/lang/String;

    .line 30
    .line 31
    const/4 v6, 0x0

    .line 32
    invoke-static/range {v3 .. v8}, Ll/h9i;->d(Landroid/view/View;Landroid/view/View;Lv/VImage;Lcom/tantan/library/svga/SVGAnimationView;Lcom/p1/mobile/putong/feed/newui/view/FeedAutoScrollTextView;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->E:Landroid/widget/ImageView;

    .line 36
    .line 37
    invoke-static {v0}, Ll/h9i;->e(Landroid/widget/ImageView;)V

    .line 38
    .line 39
    .line 40
    invoke-static {}, Ll/j4h;->f()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 47
    .line 48
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->O0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-nez v0, :cond_1

    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->P0:Ljava/lang/String;

    .line 73
    .line 74
    const-string v1, "from_discover_dating"

    .line 75
    .line 76
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-nez v0, :cond_0

    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->P0:Ljava/lang/String;

    .line 83
    .line 84
    const-string v1, "from_like"

    .line 85
    .line 86
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-nez v0, :cond_0

    .line 91
    .line 92
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->P0:Ljava/lang/String;

    .line 93
    .line 94
    const-string v1, "from_album"

    .line 95
    .line 96
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-nez v0, :cond_0

    .line 101
    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->P0:Ljava/lang/String;

    .line 103
    .line 104
    const-string v1, "from_nearby_falls_feed"

    .line 105
    .line 106
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-nez v0, :cond_0

    .line 111
    .line 112
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->P0:Ljava/lang/String;

    .line 113
    .line 114
    const-string v1, "from_discover_discussion"

    .line 115
    .line 116
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    if-nez v0, :cond_0

    .line 121
    .line 122
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->P0:Ljava/lang/String;

    .line 123
    .line 124
    const-string v1, "from_nearby_focus"

    .line 125
    .line 126
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    if-nez v0, :cond_0

    .line 131
    .line 132
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->P0:Ljava/lang/String;

    .line 133
    .line 134
    const-string v1, "from_activity_tab_one"

    .line 135
    .line 136
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    if-nez v0, :cond_0

    .line 141
    .line 142
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->P0:Ljava/lang/String;

    .line 143
    .line 144
    const-string v1, "from_activity_tab_two"

    .line 145
    .line 146
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    if-eqz v0, :cond_1

    .line 151
    .line 152
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentDetailHeaderBottomView;->E:Landroid/widget/ImageView;

    .line 153
    .line 154
    sget v0, Ll/lbc0;->W4:I

    .line 155
    .line 156
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 157
    .line 158
    .line 159
    :cond_1
    return-void
.end method
