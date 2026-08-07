.class public Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# static fields
.field public static final W:I


# instance fields
.field public A:Lv/VDraweeView;

.field public B:Lv/VImage;

.field public C:Lv/VDraweeView;

.field public D:Lv/VImage;

.field public E:Landroid/widget/FrameLayout;

.field public F:Lv/VText;

.field public G:Landroid/view/View;

.field public H:Landroid/widget/FrameLayout;

.field public I:Lv/VText;

.field public J:Landroid/widget/LinearLayout;

.field public K:Landroid/widget/LinearLayout;

.field public L:Landroid/view/View;

.field public M:Landroid/view/View;

.field public N:Lv/VFrame_Anim;

.field public O:Lv/VFrame_Anim;

.field public P:Lv/VProgressBar;

.field public Q:Landroid/widget/ImageView;

.field public R:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

.field public S:Lcom/p1/mobile/putong/feed/data/Moment;

.field public T:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lv/VDraweeView;",
            ">;"
        }
    .end annotation
.end field

.field public U:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lv/VImage;",
            ">;"
        }
    .end annotation
.end field

.field public V:Lcom/p1/mobile/putong/data/User;

.field public a:Landroid/widget/LinearLayout;

.field public b:Lv/VDraweeView;

.field public c:Lv/VImage;

.field public d:Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Landroid/widget/LinearLayout;

.field public h:Landroid/widget/FrameLayout;

.field public i:Lv/VText;

.field public j:Landroid/widget/FrameLayout;

.field public k:Landroid/widget/ImageView;

.field public l:Landroid/widget/FrameLayout;

.field public m:Lv/VText;

.field public n:Landroid/widget/FrameLayout;

.field public o:Landroid/widget/ImageView;

.field public p:Landroid/view/View;

.field public q:Landroid/widget/FrameLayout;

.field public r:Landroid/widget/ImageView;

.field public s:Lv/VDraweeView;

.field public t:Lv/VImage;

.field public u:Lv/VDraweeView;

.field public v:Lv/VImage;

.field public w:Lv/VDraweeView;

.field public x:Lv/VImage;

.field public y:Lv/VDraweeView;

.field public z:Lv/VImage;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 6
    .line 7
    const/high16 v1, 0x43200000    # 160.0f

    .line 8
    .line 9
    mul-float/2addr v0, v1

    .line 10
    const/high16 v1, 0x43b40000    # 360.0f

    .line 11
    .line 12
    cmpg-float v0, v0, v1

    .line 13
    .line 14
    if-gez v0, :cond_0

    .line 15
    .line 16
    const/4 v0, 0x5

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v0, 0x6

    .line 19
    :goto_0
    sput v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->W:I

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->S:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->S:Lcom/p1/mobile/putong/feed/data/Moment;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->S:Lcom/p1/mobile/putong/feed/data/Moment;

    return-void
.end method

.method public static L(ZLandroid/widget/ImageView;Z)V
    .locals 10

    .line 1
    const/4 v0, 0x2

    .line 2
    const/high16 v1, 0x40000000    # 2.0f

    .line 3
    .line 4
    if-nez p0, :cond_1

    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    sget p0, Ll/lbc0;->o6:I

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    sget p0, Ll/lbc0;->q6:I

    .line 12
    .line 13
    :goto_0
    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 14
    .line 15
    .line 16
    sget-object v3, Ll/gt0;->i:Landroid/util/Property;

    .line 17
    .line 18
    new-instance v8, Landroid/view/animation/AnticipateOvershootInterpolator;

    .line 19
    .line 20
    invoke-direct {v8, v1}, Landroid/view/animation/AnticipateOvershootInterpolator;-><init>(F)V

    .line 21
    .line 22
    .line 23
    new-array v9, v0, [F

    .line 24
    .line 25
    fill-array-data v9, :array_0

    .line 26
    .line 27
    .line 28
    const-wide/16 v4, 0x0

    .line 29
    .line 30
    const-wide/16 v6, 0x1f4

    .line 31
    .line 32
    move-object v2, p1

    .line 33
    invoke-static/range {v2 .. v9}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {v2, p0}, Ll/gt0;->b(Landroid/view/View;Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    move-object v2, p1

    .line 42
    sget p0, Ll/lbc0;->d2:I

    .line 43
    .line 44
    invoke-virtual {v2, p0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 45
    .line 46
    .line 47
    move p0, v1

    .line 48
    sget-object v1, Ll/gt0;->i:Landroid/util/Property;

    .line 49
    .line 50
    new-instance v6, Landroid/view/animation/AnticipateOvershootInterpolator;

    .line 51
    .line 52
    invoke-direct {v6, p0}, Landroid/view/animation/AnticipateOvershootInterpolator;-><init>(F)V

    .line 53
    .line 54
    .line 55
    new-array v7, v0, [F

    .line 56
    .line 57
    fill-array-data v7, :array_1

    .line 58
    .line 59
    .line 60
    move-object v0, v2

    .line 61
    const-wide/16 v2, 0x0

    .line 62
    .line 63
    const-wide/16 v4, 0x1f4

    .line 64
    .line 65
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-static {v0, p0}, Ll/gt0;->b(Landroid/view/View;Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :array_0
    .array-data 4
        0x3faccccd    # 1.35f
        0x3f800000    # 1.0f
    .end array-data

    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    :array_1
    .array-data 4
        0x3faccccd    # 1.35f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->u(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->C(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->w(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->E(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;Ll/qo00;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->B(Ll/qo00;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;ILcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->H(ILcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->x(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->I(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;ZLjava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p3}, Ll/i4h;->g(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 5
    .line 6
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->L(ZLandroid/widget/ImageView;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;Lcom/p1/mobile/putong/data/PartialIdList;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->G(Lcom/p1/mobile/putong/data/PartialIdList;ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->D(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->A(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->v(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;Lcom/p1/mobile/putong/data/PartialIdList;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->F(Lcom/p1/mobile/putong/data/PartialIdList;ILandroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final synthetic A(Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance v0, Ll/us00;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/us00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic B(Ll/qo00;Lcom/p1/mobile/putong/data/User;)V
    .locals 5

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->V:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->b:Lv/VDraweeView;

    .line 6
    .line 7
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;

    .line 19
    .line 20
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->v0(Lcom/p1/mobile/putong/data/User;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->e:Lv/VText;

    .line 24
    .line 25
    const/16 v1, 0x8

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 28
    .line 29
    .line 30
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 31
    .line 32
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->t()Lcom/p1/mobile/putong/app/PutongAct;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->c:Lv/VImage;

    .line 39
    .line 40
    invoke-interface {v0, v1, p2, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p1, Ll/qo00;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 44
    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 60
    .line 61
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PicVerification;->anchor:Lcom/p1/mobile/putong/data/VerificationResult;

    .line 62
    .line 63
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/VerificationResult;->verified:Z

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->h:Landroid/widget/FrameLayout;

    .line 66
    .line 67
    invoke-static {p2}, Lcom/p1/mobile/putong/data/User;->isMatched(Lcom/p1/mobile/putong/data/User;)Z

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    const/4 v3, 0x1

    .line 72
    const/4 v4, 0x0

    .line 73
    if-nez v2, :cond_1

    .line 74
    .line 75
    if-eqz v0, :cond_0

    .line 76
    .line 77
    if-nez p1, :cond_0

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_0
    move v2, v4

    .line 81
    goto :goto_1

    .line 82
    :cond_1
    :goto_0
    move v2, v3

    .line 83
    :goto_1
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 84
    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->j:Landroid/widget/FrameLayout;

    .line 87
    .line 88
    invoke-static {p2}, Lcom/p1/mobile/putong/data/User;->isMatched(Lcom/p1/mobile/putong/data/User;)Z

    .line 89
    .line 90
    .line 91
    move-result p2

    .line 92
    if-nez p2, :cond_3

    .line 93
    .line 94
    if-nez p1, :cond_3

    .line 95
    .line 96
    if-eqz v0, :cond_2

    .line 97
    .line 98
    goto :goto_2

    .line 99
    :cond_2
    move v3, v4

    .line 100
    :cond_3
    :goto_2
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 101
    .line 102
    .line 103
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 104
    .line 105
    iget-object p1, p1, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 106
    .line 107
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->V:Lcom/p1/mobile/putong/data/User;

    .line 108
    .line 109
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 110
    .line 111
    invoke-interface {p1, p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->isCurrentMessageBlock(Ljava/lang/String;)Z

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    if-eqz p1, :cond_4

    .line 116
    .line 117
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->h:Landroid/widget/FrameLayout;

    .line 118
    .line 119
    invoke-static {p0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 120
    .line 121
    .line 122
    :cond_4
    return-void
.end method

.method public final synthetic C(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->t()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->t()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0, v0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/LikesDetailAct;->X1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

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

.method public final synthetic D(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->t()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->t()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    const/4 v2, 0x1

    .line 15
    invoke-static {p0, v0, p1, v1, v2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;->X1(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic E(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->t()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->M(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic F(Lcom/p1/mobile/putong/data/PartialIdList;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->t()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->t()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Ljava/lang/String;

    .line 16
    .line 17
    const-string p2, "from_MomentsFeedAct"

    .line 18
    .line 19
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;->X1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const/16 p1, 0x16

    .line 24
    .line 25
    invoke-virtual {p3, p0, p1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic G(Lcom/p1/mobile/putong/data/PartialIdList;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->t()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->t()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Ljava/lang/String;

    .line 16
    .line 17
    const-string p2, "from_MomentsFeedAct"

    .line 18
    .line 19
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;->X1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const/16 p1, 0x16

    .line 24
    .line 25
    invoke-virtual {p3, p0, p1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic H(ILcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->T:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 10
    .line 11
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 20
    .line 21
    .line 22
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 23
    .line 24
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->t()Lcom/p1/mobile/putong/app/PutongAct;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->U:Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Lv/VImage;

    .line 37
    .line 38
    invoke-interface {v0, v1, p2, p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic I(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    if-nez p4, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->R:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->e:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;

    .line 6
    .line 7
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;->j(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const/4 p2, 0x1

    .line 12
    if-ne p2, p4, :cond_1

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->R:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->e:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;

    .line 17
    .line 18
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;->f(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public final J(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;Z)V
    .locals 2

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 2
    .line 3
    xor-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    invoke-static {v0, p2, p3}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->L(ZLandroid/widget/ImageView;Z)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->R:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->T(Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance v0, Ll/ys00;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/ys00;-><init>()V

    .line 17
    .line 18
    .line 19
    new-instance v1, Ll/zs00;

    .line 20
    .line 21
    invoke-direct {v1, p1, p2, p3}, Ll/zs00;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;Z)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public K(Ll/qo00;Ljava/util/HashMap;Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qo00;",
            "Ljava/util/HashMap;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->R:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 2
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->b:Lv/VDraweeView;

    iget-object p4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;

    iget-object p4, p4, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->e:Lv/VText;

    const/4 v0, 0x2

    new-array v1, v0, [Landroid/view/View;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 p2, 0x1

    aput-object p4, v1, p2

    .line 3
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object p4

    new-instance v1, Ll/bt00;

    invoke-direct {v1, p0}, Ll/bt00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;)V

    .line 4
    invoke-static {p4, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 5
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->R:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    iget-object v1, p1, Ll/qo00;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    new-instance v3, Ll/ct00;

    invoke-direct {v3, p0, p1}, Ll/ct00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;Ll/qo00;)V

    invoke-virtual {p4, v1, v3}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->P(Ljava/lang/String;Ll/y20;)V

    .line 6
    iget-object p4, p1, Ll/qo00;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->S:Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->S:Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-virtual {v1, p4}, Lcom/p1/mobile/putong/feed/data/Moment;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 8
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->S:Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/Moment;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    move-result-object v1

    invoke-virtual {p4}, Lcom/p1/mobile/putong/feed/data/Moment;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto/16 :goto_15

    .line 9
    :cond_0
    iput-object p4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->S:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    iget-object v1, p4, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    invoke-static {v1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    move-result v1

    .line 11
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->E:Landroid/widget/FrameLayout;

    const/4 v4, 0x0

    if-nez v1, :cond_1

    .line 12
    new-instance v1, Ll/dt00;

    invoke-direct {v1, p0, p4}, Ll/dt00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;Lcom/p1/mobile/putong/feed/data/Moment;)V

    invoke-virtual {v3, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->H:Landroid/widget/FrameLayout;

    new-instance v3, Ll/ns00;

    invoke-direct {v3, p0, p4}, Ll/ns00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;Lcom/p1/mobile/putong/feed/data/Moment;)V

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0

    .line 14
    :cond_1
    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->H:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 16
    :goto_0
    invoke-virtual {p4}, Lcom/p1/mobile/putong/feed/data/Moment;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    move-result-object v1

    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v3

    const-string v5, "normal"

    const/4 v6, -0x1

    sparse-switch v3, :sswitch_data_0

    :goto_1
    move v0, v6

    goto :goto_2

    :sswitch_0
    const-string v3, "sending"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    goto :goto_1

    :sswitch_1
    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_1

    :cond_2
    move v0, p2

    goto :goto_2

    :sswitch_2
    const-string v0, "failed"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_1

    :cond_3
    move v0, v2

    :cond_4
    :goto_2
    packed-switch v0, :pswitch_data_0

    goto :goto_3

    .line 17
    :pswitch_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->N:Lv/VFrame_Anim;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->O:Lv/VFrame_Anim;

    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->P:Lv/VProgressBar;

    invoke-virtual {v0, v1}, Lv/VFrame_Anim;->G(Landroid/view/View;)V

    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->N:Lv/VFrame_Anim;

    new-instance v1, Ll/ps00;

    invoke-direct {v1}, Ll/ps00;-><init>()V

    invoke-virtual {v0, v1}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_3

    .line 20
    :pswitch_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->N:Lv/VFrame_Anim;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->N:Lv/VFrame_Anim;

    invoke-virtual {v0, v4}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_3

    .line 22
    :pswitch_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->N:Lv/VFrame_Anim;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->O:Lv/VFrame_Anim;

    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->Q:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Lv/VFrame_Anim;->G(Landroid/view/View;)V

    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->N:Lv/VFrame_Anim;

    new-instance v1, Ll/os00;

    invoke-direct {v1, p0, p4}, Ll/os00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;Lcom/p1/mobile/putong/feed/data/Moment;)V

    invoke-virtual {v0, v1}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 25
    :goto_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->O:Lv/VFrame_Anim;

    invoke-virtual {p4}, Lcom/p1/mobile/putong/feed/data/Moment;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    move-result-object v1

    invoke-static {v1, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v1

    xor-int/2addr v1, p2

    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;

    invoke-virtual {v0, p4}, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->u0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 27
    iget-object v0, p4, Lcom/p1/mobile/putong/feed/data/Moment;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    const/16 v1, 0x8

    if-eqz v0, :cond_5

    iget-object v0, p4, Lcom/p1/mobile/putong/feed/data/Moment;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    iget-object v0, v0, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->f:Lv/VText;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->f:Lv/VText;

    iget-object v3, p4, Lcom/p1/mobile/putong/feed/data/Moment;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    iget-object v3, v3, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_4

    .line 30
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->f:Lv/VText;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 31
    :goto_4
    iget-object v0, p1, Ll/qo00;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object v3

    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 32
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->V:Lcom/p1/mobile/putong/data/User;

    if-eqz v3, :cond_6

    iget-object v5, v3, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    iget-object v5, v5, Lcom/p1/mobile/putong/data/PicVerification;->anchor:Lcom/p1/mobile/putong/data/VerificationResult;

    iget-boolean v5, v5, Lcom/p1/mobile/putong/data/VerificationResult;->verified:Z

    if-eqz v5, :cond_6

    move v5, p2

    goto :goto_5

    :cond_6
    move v5, v2

    .line 33
    :goto_5
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->h:Landroid/widget/FrameLayout;

    invoke-static {v3}, Lcom/p1/mobile/putong/data/User;->isMatched(Lcom/p1/mobile/putong/data/User;)Z

    move-result v3

    if-nez v3, :cond_8

    if-eqz v5, :cond_7

    if-nez v0, :cond_7

    goto :goto_6

    :cond_7
    move v3, v2

    goto :goto_7

    :cond_8
    :goto_6
    move v3, p2

    :goto_7
    invoke-static {v6, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->j:Landroid/widget/FrameLayout;

    iget-object v6, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->V:Lcom/p1/mobile/putong/data/User;

    invoke-static {v6}, Lcom/p1/mobile/putong/data/User;->isMatched(Lcom/p1/mobile/putong/data/User;)Z

    move-result v6

    if-nez v6, :cond_a

    if-nez v5, :cond_a

    if-eqz v0, :cond_9

    goto :goto_8

    :cond_9
    move v0, v2

    goto :goto_9

    :cond_a
    :goto_8
    move v0, p2

    :goto_9
    invoke-static {v3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->V:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->V:Lcom/p1/mobile/putong/data/User;

    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 36
    invoke-interface {v0, v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->isCurrentMessageBlock(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->h:Landroid/widget/FrameLayout;

    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->k:Landroid/widget/ImageView;

    .line 39
    iget-boolean v3, p4, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    if-eqz v3, :cond_c

    .line 40
    sget v3, Ll/lbc0;->d2:I

    goto :goto_a

    .line 41
    :cond_c
    sget v3, Ll/lbc0;->o6:I

    .line 42
    :goto_a
    invoke-virtual {v0, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 43
    iget-object v0, p4, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    iget v3, v0, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    iget-object v0, v0, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-static {v3, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 44
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->F:Lv/VText;

    invoke-static {v0}, Ll/q8g0;->h0(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->p:Landroid/view/View;

    if-eqz v0, :cond_d

    move v5, p2

    goto :goto_b

    :cond_d
    move v5, v2

    :goto_b
    invoke-static {v3, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->E:Landroid/widget/FrameLayout;

    sget v5, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->W:I

    if-le v0, v5, :cond_e

    move v6, p2

    goto :goto_c

    :cond_e
    move v6, v2

    :goto_c
    invoke-static {v3, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    :goto_d
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->T:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v5, v3, :cond_f

    .line 48
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->T:Ljava/util/ArrayList;

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lv/VDraweeView;

    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    .line 49
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->U:Ljava/util/ArrayList;

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lv/VImage;

    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_d

    .line 50
    :cond_f
    iget-object v3, p4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {p3, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_10

    iget-object v3, p4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 51
    invoke-virtual {p3, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-nez v3, :cond_10

    if-eqz v0, :cond_10

    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->q:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_e

    .line 53
    :cond_10
    iget-object v3, p4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {p3, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_11

    iget-object v3, p4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 54
    invoke-virtual {p3, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-eqz v3, :cond_11

    if-nez v0, :cond_11

    .line 55
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->q:Landroid/widget/FrameLayout;

    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_e

    .line 56
    :cond_11
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->q:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_12

    .line 57
    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->q:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    const/high16 v3, 0x42400000    # 48.0f

    invoke-static {v3}, Ll/qa00;->d(F)I

    move-result v3

    iput v3, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->q:Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/view/View;->requestLayout()V

    goto :goto_e

    .line 60
    :cond_12
    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    .line 61
    :goto_e
    iget-object v1, p4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p3, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    iget-object p3, p4, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    invoke-static {p3}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    move-result p3

    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->H:Landroid/widget/FrameLayout;

    if-eqz p3, :cond_13

    .line 64
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    goto :goto_10

    .line 65
    :cond_13
    iget p3, p1, Ll/qo00;->g:I

    const/16 v1, 0x64

    if-le p3, v1, :cond_14

    move p3, p2

    goto :goto_f

    :cond_14
    move p3, v2

    :goto_f
    invoke-static {v0, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 66
    :goto_10
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->G:Landroid/view/View;

    iget v0, p1, Ll/qo00;->f:I

    if-eqz v0, :cond_15

    move v0, p2

    goto :goto_11

    :cond_15
    move v0, v2

    :goto_11
    invoke-static {p3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 67
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->I:Lv/VText;

    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->t()Lcom/p1/mobile/putong/app/PutongAct;

    move-result-object v0

    sget v1, Lcom/p1/mobile/putong/feed/R$string;->P3:I

    iget p1, p1, Ll/qo00;->g:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 69
    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    move p1, v2

    .line 70
    :goto_12
    sget p3, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->W:I

    if-ge p1, p3, :cond_18

    .line 71
    iget-object p3, p4, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 72
    iget-object v0, p3, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->T:Ljava/util/ArrayList;

    if-gt v0, p1, :cond_16

    .line 74
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lv/VDraweeView;

    invoke-virtual {p3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 75
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->U:Ljava/util/ArrayList;

    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lv/VImage;

    invoke-virtual {p3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 76
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->T:Ljava/util/ArrayList;

    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/view/View;

    invoke-static {p3, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 77
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->U:Ljava/util/ArrayList;

    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/view/View;

    invoke-static {p3, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    goto :goto_14

    .line 78
    :cond_16
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-static {v0, p2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 79
    iget-object v0, p4, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    move-result v0

    .line 80
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->T:Ljava/util/ArrayList;

    if-nez v0, :cond_17

    .line 81
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lv/VDraweeView;

    new-instance v1, Ll/qs00;

    invoke-direct {v1, p0, p3, p1}, Ll/qs00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;Lcom/p1/mobile/putong/data/PartialIdList;I)V

    .line 82
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->U:Ljava/util/ArrayList;

    .line 84
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lv/VImage;

    new-instance v1, Ll/rs00;

    invoke-direct {v1, p0, p3, p1}, Ll/rs00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;Lcom/p1/mobile/putong/data/PartialIdList;I)V

    .line 85
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_13

    .line 86
    :cond_17
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lv/VDraweeView;

    invoke-virtual {v0, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 87
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->U:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lv/VImage;

    invoke-virtual {v0, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 88
    :goto_13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->R:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    iget-object p3, p3, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 89
    invoke-interface {p3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    new-instance v1, Ll/ss00;

    invoke-direct {v1, p0, p1}, Ll/ss00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;I)V

    .line 90
    invoke-virtual {v0, p3, v1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->P(Ljava/lang/String;Ll/y20;)V

    :goto_14
    add-int/lit8 p1, p1, 0x1

    goto/16 :goto_12

    :cond_18
    :goto_15
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        -0x4c696bc3 -> :sswitch_2
        -0x3df94319 -> :sswitch_1
        0x76033b5a -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final M(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->n:I

    .line 6
    .line 7
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->f:I

    .line 12
    .line 13
    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    filled-new-array {v1, p1}, [Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->f0([Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    new-instance v0, Ll/ts00;

    .line 26
    .line 27
    invoke-direct {v0, p0, p2}, Ll/ts00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->g0(Lcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public N(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->K:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onFinishInflate()V
    .locals 8

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->s(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->h:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    new-instance v1, Ll/ms00;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/ms00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->j:Landroid/widget/FrameLayout;

    .line 18
    .line 19
    new-instance v1, Ll/vs00;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/vs00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->l:Landroid/widget/FrameLayout;

    .line 28
    .line 29
    new-instance v1, Ll/ws00;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/ws00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->o:Landroid/widget/ImageView;

    .line 38
    .line 39
    new-instance v1, Ll/xs00;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/xs00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 45
    .line 46
    .line 47
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->s:Lv/VDraweeView;

    .line 48
    .line 49
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->u:Lv/VDraweeView;

    .line 50
    .line 51
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->w:Lv/VDraweeView;

    .line 52
    .line 53
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->y:Lv/VDraweeView;

    .line 54
    .line 55
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->A:Lv/VDraweeView;

    .line 56
    .line 57
    iget-object v7, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->C:Lv/VDraweeView;

    .line 58
    .line 59
    filled-new-array/range {v2 .. v7}, [Lv/VDraweeView;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->T:Ljava/util/ArrayList;

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->t:Lv/VImage;

    .line 70
    .line 71
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->v:Lv/VImage;

    .line 72
    .line 73
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->x:Lv/VImage;

    .line 74
    .line 75
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->z:Lv/VImage;

    .line 76
    .line 77
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->B:Lv/VImage;

    .line 78
    .line 79
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->D:Lv/VImage;

    .line 80
    .line 81
    filled-new-array/range {v1 .. v6}, [Lv/VImage;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->U:Ljava/util/ArrayList;

    .line 90
    .line 91
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->d:Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;

    .line 92
    .line 93
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentHeaderLargeView;->s0()V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public final s(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/et00;->a(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final t()Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public final synthetic u(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->R:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 10
    .line 11
    iget-object p1, p1, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->S:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 16
    .line 17
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->shouldLockComment(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 24
    .line 25
    iget-object p1, p1, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->t()Lcom/p1/mobile/putong/app/PutongAct;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string v0, "moment_square"

    .line 32
    .line 33
    invoke-interface {p1, p0, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showProofAgeDlg(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->R:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->S:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 40
    .line 41
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->N(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    return-void
.end method

.method public final synthetic v(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->R:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->S:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->k:Landroid/widget/ImageView;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->J(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final synthetic w(Landroid/view/View;)V
    .locals 8

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->R:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->t()Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->t()Lcom/p1/mobile/putong/app/PutongAct;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->S:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 20
    .line 21
    const/4 v6, 0x0

    .line 22
    const/4 v7, -0x1

    .line 23
    const/4 v2, 0x0

    .line 24
    const/4 v3, 0x0

    .line 25
    const/4 v4, 0x0

    .line 26
    const/4 v5, 0x0

    .line 27
    invoke-static/range {v0 .. v7}, Ll/orb0;->e(Landroid/content/Context;Ljava/lang/String;ZZZZLandroid/content/Intent;I)Landroid/content/Intent;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public final synthetic x(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->R:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->l:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;->U4(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic y(Landroid/view/View;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->t()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->S:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    iget-object v1, v2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 8
    .line 9
    new-instance v4, Ll/at00;

    .line 10
    .line 11
    invoke-direct {v4, p0}, Ll/at00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;)V

    .line 12
    .line 13
    .line 14
    const/4 v7, 0x0

    .line 15
    const/4 v8, 0x1

    .line 16
    const/4 v3, 0x0

    .line 17
    const/4 v5, 0x0

    .line 18
    const/4 v6, 0x0

    .line 19
    invoke-static/range {v0 .. v8}, Ll/k3h;->x0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Ll/y20;Ll/y20;Ll/y20;ZZZ)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic z(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->t()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->t()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->S:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "from_MomentsFeedAct"

    .line 14
    .line 15
    invoke-static {v0, p0, v1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfileAct;->X1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/16 v0, 0x16

    .line 20
    .line 21
    invoke-virtual {p1, p0, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
