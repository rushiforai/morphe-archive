.class public Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public A:I

.field public B:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public C:Ll/mql;

.field public a:Lcom/facebook/drawee/view/SimpleDraweeView;

.field public b:Lv/VFrame;

.field public c:Landroid/widget/FrameLayout;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VImage;

.field public g:Lv/VText;

.field public h:Lv/VImage;

.field public i:Landroid/widget/LinearLayout;

.field public j:Lv/VText;

.field public k:Lv/VImage;

.field public l:Lv/VText;

.field public m:Lcom/facebook/drawee/view/SimpleDraweeView;

.field public n:Lcom/facebook/drawee/view/SimpleDraweeView;

.field public o:Lv/VImage;

.field public p:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public q:Lv/VText;

.field public r:Lv/VFrame;

.field public s:Landroid/widget/FrameLayout;

.field public t:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;

.field public u:Lv/VDraweeView;

.field public v:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public w:Landroid/widget/FrameLayout;

.field public x:Lv/VImage;

.field public y:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public z:Ll/kcg0;


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
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->A:I

    .line 6
    .line 7
    new-instance p1, Ljava/util/HashSet;

    .line 8
    .line 9
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->B:Ljava/util/HashSet;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->B()V

    .line 15
    .line 16
    .line 17
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

    .line 18
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 19
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->A:I

    .line 20
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->B:Ljava/util/HashSet;

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->B()V

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

    .line 22
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 23
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->A:I

    .line 24
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->B:Ljava/util/HashSet;

    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->B()V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;[Ll/th0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->N([Ll/th0;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b([Ll/th0;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    aget-object p0, p0, p1

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/th0;->c()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;ILjava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->F(ILjava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->I(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->H(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/data/VerificationCenter;)Ll/pf60;
    .locals 3

    .line 1
    const-string v0, "default"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/StudentVerificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/data/StudentVerificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 18
    .line 19
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 28
    .line 29
    :cond_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-eqz v2, :cond_1

    .line 34
    .line 35
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 36
    .line 37
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_1

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 46
    .line 47
    :cond_1
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;ILjava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->G(ILjava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->J(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->E(Ll/pf60;)V

    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->D(Ll/pf60;)V

    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;ILjava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->L(ILjava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->C(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->K(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;ILjava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->M(ILjava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->u()Lcom/p1/mobile/android/app/Act;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->R(Ljava/lang/String;)V

    return-void
.end method

.method private setImageStyle(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->a:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/wlj;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/wlj;->p()Lcom/facebook/drawee/generic/RoundingParams;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Lcom/facebook/drawee/generic/RoundingParams;

    .line 16
    .line 17
    invoke-direct {v0}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 18
    .line 19
    .line 20
    :cond_0
    sget v1, Ll/qa00;->m:I

    .line 21
    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    sget v1, Ll/qa00;->o:I

    .line 25
    .line 26
    :cond_1
    move p1, v1

    .line 27
    int-to-float v1, v1

    .line 28
    int-to-float p1, p1

    .line 29
    invoke-virtual {v0, v1, v1, p1, p1}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->a:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    check-cast p0, Ll/wlj;

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method


# virtual methods
.method public final A(Ll/aoh0;Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->t:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->l()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->t:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;

    .line 7
    .line 8
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout$e;

    .line 9
    .line 10
    invoke-direct {v1, p0, p2}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout$e;-><init>(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;Lcom/p1/mobile/putong/data/User;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p1, p2, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->j(Ll/aoh0;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView$b;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final B()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/kec0;->Sb:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 17
    .line 18
    const/4 v2, -0x1

    .line 19
    invoke-direct {v1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->t(Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->a:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ll/wlj;

    .line 35
    .line 36
    new-instance v1, Ll/rc80;

    .line 37
    .line 38
    sget v2, Ll/qa00;->m:I

    .line 39
    .line 40
    int-to-float v2, v2

    .line 41
    invoke-direct {v1, v2}, Ll/rc80;-><init>(F)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ll/wlj;->E(Landroid/graphics/drawable/Drawable;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->i:Landroid/widget/LinearLayout;

    .line 48
    .line 49
    new-instance v1, Ll/zhe0;

    .line 50
    .line 51
    invoke-direct {v1}, Ll/zhe0;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->c:Landroid/widget/FrameLayout;

    .line 58
    .line 59
    new-instance v1, Ll/iie0;

    .line 60
    .line 61
    invoke-direct {v1}, Ll/iie0;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 65
    .line 66
    .line 67
    invoke-static {}, Ll/gra;->z()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->f:Lv/VImage;

    .line 72
    .line 73
    if-eqz v0, :cond_0

    .line 74
    .line 75
    sget v0, Ll/dbc0;->e7:I

    .line 76
    .line 77
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->k:Lv/VImage;

    .line 81
    .line 82
    sget v1, Ll/dbc0;->bt:I

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->m:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 88
    .line 89
    sget v1, Ll/dbc0;->d7:I

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->n:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 95
    .line 96
    sget v1, Ll/dbc0;->d7:I

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->p:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 102
    .line 103
    sget v1, Ll/dbc0;->x1:I

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 106
    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_0
    sget v0, Ll/dbc0;->b8:I

    .line 110
    .line 111
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->k:Lv/VImage;

    .line 115
    .line 116
    sget v1, Ll/dbc0;->g8:I

    .line 117
    .line 118
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->m:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 122
    .line 123
    sget v1, Ll/dbc0;->Z7:I

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 126
    .line 127
    .line 128
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->n:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 129
    .line 130
    sget v1, Ll/dbc0;->Z7:I

    .line 131
    .line 132
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->p:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 136
    .line 137
    sget v1, Ll/dbc0;->t:I

    .line 138
    .line 139
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 140
    .line 141
    .line 142
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->h:Lv/VImage;

    .line 143
    .line 144
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    const/high16 v1, 0x428c0000    # 70.0f

    .line 149
    .line 150
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 155
    .line 156
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 157
    .line 158
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->h:Lv/VImage;

    .line 159
    .line 160
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 161
    .line 162
    .line 163
    :goto_0
    invoke-static {}, Ll/gra;->N3()Z

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    if-eqz v0, :cond_1

    .line 168
    .line 169
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->t:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;

    .line 170
    .line 171
    const-string v1, "#57000000"

    .line 172
    .line 173
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->setIndicatorColor(I)V

    .line 178
    .line 179
    .line 180
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->t:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;

    .line 181
    .line 182
    const-string v1, "#57A0A0A0"

    .line 183
    .line 184
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 185
    .line 186
    .line 187
    move-result v1

    .line 188
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->setIndicatorColorBorder(I)V

    .line 189
    .line 190
    .line 191
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->t:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;

    .line 192
    .line 193
    const-string v1, "#4DA0A0A0"

    .line 194
    .line 195
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 196
    .line 197
    .line 198
    move-result v1

    .line 199
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->setIndicatorSelectedColorBorder(I)V

    .line 200
    .line 201
    .line 202
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->t:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;

    .line 203
    .line 204
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->s:Landroid/widget/FrameLayout;

    .line 205
    .line 206
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedImageSwitchView;->setupIndicator(Landroid/view/ViewGroup;)V

    .line 207
    .line 208
    .line 209
    :cond_1
    return-void
.end method

.method public final synthetic C(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic D(Ll/pf60;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic E(Ll/pf60;)V
    .locals 3

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 6
    .line 7
    move-object v1, p1

    .line 8
    check-cast v1, Ll/pf60;

    .line 9
    .line 10
    iget-object v1, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v1, Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 13
    .line 14
    check-cast p1, Ll/pf60;

    .line 15
    .line 16
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast p1, Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 19
    .line 20
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->A:I

    .line 21
    .line 22
    invoke-virtual {p0, v0, v1, p1, v2}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->P(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/StudentVerificationStatus;Lcom/p1/mobile/putong/data/StudentVerificationStatus;I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic F(ILjava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->v()Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->w()Z

    .line 9
    .line 10
    .line 11
    move-result p3

    .line 12
    if-eqz p3, :cond_1

    .line 13
    .line 14
    :goto_0
    return-void

    .line 15
    :cond_1
    const-string p3, "photo"

    .line 16
    .line 17
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->R(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 p3, 0x2

    .line 21
    if-ne p1, p3, :cond_2

    .line 22
    .line 23
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->MY_LIFE_SEE_MYSELF:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->z(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {p0}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    new-instance p1, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string p3, "tantan://user_mirror?entry=picture&from="

    .line 40
    .line 41
    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-static {p0, p1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final synthetic G(ILjava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->v()Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->w()Z

    .line 9
    .line 10
    .line 11
    move-result p3

    .line 12
    if-eqz p3, :cond_1

    .line 13
    .line 14
    :goto_0
    return-void

    .line 15
    :cond_1
    const-string p3, "photo"

    .line 16
    .line 17
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->R(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 p3, 0x2

    .line 21
    if-ne p1, p3, :cond_2

    .line 22
    .line 23
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->MY_LIFE_SEE_MYSELF:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->z(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {p0}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    new-instance p1, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string p3, "tantan://user_mirror?entry=picture&from="

    .line 40
    .line 41
    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-static {p0, p1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final synthetic H(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "swipe"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->R(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->I2:Lrx/subjects/a;

    .line 11
    .line 12
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-static {p1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic I(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->v()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->w()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    :goto_0
    return-void

    .line 15
    :cond_1
    const-string p1, "complete_profile"

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->R(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_2

    .line 35
    .line 36
    const-string p1, "signature"

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_2
    const-string p1, "picture"

    .line 40
    .line 41
    :goto_1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {p0}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string v0, "tantan://user_mirror?entry="

    .line 50
    .line 51
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-static {p0, p1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final synthetic J(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "later"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->R(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->I2:Lrx/subjects/a;

    .line 11
    .line 12
    sget-object p1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-static {p1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic K(Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p1, "avatar_verify"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->R(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {p0}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string p1, "tantan://verificationcenter"

    .line 15
    .line 16
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {p0, p1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic L(ILjava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->v()Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->w()Z

    .line 9
    .line 10
    .line 11
    move-result p3

    .line 12
    if-eqz p3, :cond_1

    .line 13
    .line 14
    :goto_0
    return-void

    .line 15
    :cond_1
    const-string p3, "avatar_verify"

    .line 16
    .line 17
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->R(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 p3, 0x2

    .line 21
    if-ne p1, p3, :cond_2

    .line 22
    .line 23
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->VERIFICATION:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->z(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {p0}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    new-instance p1, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string p3, "tantan://user_mirror?entry=verification&from="

    .line 40
    .line 41
    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-static {p0, p1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final synthetic M(ILjava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->v()Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->w()Z

    .line 9
    .line 10
    .line 11
    move-result p3

    .line 12
    if-eqz p3, :cond_1

    .line 13
    .line 14
    :goto_0
    return-void

    .line 15
    :cond_1
    const-string p3, "self_introduction"

    .line 16
    .line 17
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->R(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const/4 p3, 0x2

    .line 21
    if-ne p1, p3, :cond_2

    .line 22
    .line 23
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->SIGNATURE:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->z(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {p0}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    new-instance p1, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    const-string p3, "tantan://user_mirror?entry=signature&from="

    .line 40
    .line 41
    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-static {p0, p1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final synthetic N([Ll/th0;Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->u()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->u()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v1, "-1"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    const/4 v3, 0x0

    .line 17
    invoke-interface {v0, p0, v1, v2, v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->startMessagesAct(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 22
    .line 23
    .line 24
    aget-object p0, p1, v3

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/th0;->c()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public O(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->S(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->z:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/dkb;->o9()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->A:I

    .line 18
    .line 19
    const/4 v2, 0x2

    .line 20
    if-ne v1, v2, :cond_0

    .line 21
    .line 22
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v0, v0, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    :cond_0
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/jie0;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/jie0;-><init>(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 46
    .line 47
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/d0;->j4()Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    new-instance v2, Ll/kie0;

    .line 54
    .line 55
    invoke-direct {v2}, Ll/kie0;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    new-instance v2, Ll/lie0;

    .line 67
    .line 68
    invoke-direct {v2, p0}, Ll/lie0;-><init>(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1, v2}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    new-instance v2, Ll/mie0;

    .line 76
    .line 77
    invoke-direct {v2}, Ll/mie0;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-static {v0, v1, v2}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    new-instance v0, Ll/nie0;

    .line 89
    .line 90
    invoke-direct {v0, p0}, Ll/nie0;-><init>(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;)V

    .line 91
    .line 92
    .line 93
    new-instance v1, Ll/oie0;

    .line 94
    .line 95
    invoke-direct {v1}, Ll/oie0;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->z:Ll/kcg0;

    .line 107
    .line 108
    return-void
.end method

.method public final P(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/StudentVerificationStatus;Lcom/p1/mobile/putong/data/StudentVerificationStatus;I)V
    .locals 11

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x1

    .line 3
    const/4 v2, 0x0

    .line 4
    if-eqz p4, :cond_1

    .line 5
    .line 6
    if-ne p4, v0, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move v3, v2

    .line 10
    goto :goto_1

    .line 11
    :cond_1
    :goto_0
    move v3, v1

    .line 12
    :goto_1
    invoke-direct {p0, v3}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->setImageStyle(Z)V

    .line 13
    .line 14
    .line 15
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    new-instance v5, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v6, "fake_risk_audit_default_"

    .line 22
    .line 23
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object v6, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    invoke-virtual {v4, v5}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    invoke-virtual {p1, v4}, Lcom/p1/mobile/putong/data/User;->riskAuditUser(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    .line 42
    move-result-object v7

    .line 43
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 44
    .line 45
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->a:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 46
    .line 47
    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    invoke-static {v5}, Ll/nwb;->f(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v5

    .line 59
    invoke-virtual {p1, v4, v5}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->d:Lv/VText;

    .line 63
    .line 64
    new-instance v4, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    const-string v5, "Hi\uff0c"

    .line 67
    .line 68
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    iget-object v5, v7, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 81
    .line 82
    .line 83
    const-string p1, "home_complete_card"

    .line 84
    .line 85
    if-nez p4, :cond_2

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :cond_2
    if-ne p4, v1, :cond_3

    .line 89
    .line 90
    const-string p1, "mytab_complete_card"

    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_3
    if-ne p4, v0, :cond_4

    .line 94
    .line 95
    const-string p1, "edit_profile_complete_card"

    .line 96
    .line 97
    :cond_4
    :goto_2
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->e:Lv/VText;

    .line 98
    .line 99
    if-ne p4, v0, :cond_5

    .line 100
    .line 101
    const-string v5, "\u4f60\u7684\u5361\u7247\u4fe1\u606f\u6709\u70b9\u5c11\n\u8865\u5168\u4fe1\u606f\u53ef\u4ee5\u5438\u5f15\u5230\u66f4\u591a\u4eba\u7684\u559c\u6b22"

    .line 102
    .line 103
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 104
    .line 105
    .line 106
    goto :goto_3

    .line 107
    :cond_5
    const-string v5, "\u4f60\u7684\u5361\u7247\u4fe1\u606f\u6709\u70b9\u5c11\n\u8865\u5168\u4e00\u4e0b\u4f60\u7684\u4fe1\u606f\u5427"

    .line 108
    .line 109
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 110
    .line 111
    .line 112
    :goto_3
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->f:Lv/VImage;

    .line 113
    .line 114
    const/4 v5, 0x0

    .line 115
    invoke-static {v4, v5}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 116
    .line 117
    .line 118
    const-string v4, "verified"

    .line 119
    .line 120
    invoke-static {p2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 121
    .line 122
    .line 123
    move-result v6

    .line 124
    if-eqz v6, :cond_d

    .line 125
    .line 126
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->h:Lv/VImage;

    .line 127
    .line 128
    invoke-static {v6, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 129
    .line 130
    .line 131
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->f:Lv/VImage;

    .line 132
    .line 133
    invoke-static {v6, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 134
    .line 135
    .line 136
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->g:Lv/VText;

    .line 137
    .line 138
    invoke-static {v6, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 139
    .line 140
    .line 141
    invoke-static {}, Ll/gra;->z()Z

    .line 142
    .line 143
    .line 144
    move-result v6

    .line 145
    if-eqz v6, :cond_7

    .line 146
    .line 147
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->h:Lv/VImage;

    .line 148
    .line 149
    if-eqz v3, :cond_6

    .line 150
    .line 151
    const/high16 v8, 0x41f00000    # 30.0f

    .line 152
    .line 153
    :goto_4
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 154
    .line 155
    .line 156
    move-result v8

    .line 157
    goto :goto_5

    .line 158
    :cond_6
    const/high16 v8, 0x41c00000    # 24.0f

    .line 159
    .line 160
    goto :goto_4

    .line 161
    :goto_5
    invoke-static {v6, v8}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 162
    .line 163
    .line 164
    :cond_7
    invoke-static {p3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 165
    .line 166
    .line 167
    move-result v6

    .line 168
    if-eqz v6, :cond_a

    .line 169
    .line 170
    invoke-static {}, Ll/gra;->z()Z

    .line 171
    .line 172
    .line 173
    move-result v6

    .line 174
    iget-object v8, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->h:Lv/VImage;

    .line 175
    .line 176
    if-eqz v6, :cond_9

    .line 177
    .line 178
    if-eqz v3, :cond_8

    .line 179
    .line 180
    sget v3, Ll/dbc0;->P6:I

    .line 181
    .line 182
    goto :goto_6

    .line 183
    :cond_8
    sget v3, Ll/dbc0;->L2:I

    .line 184
    .line 185
    :goto_6
    invoke-virtual {v8, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 186
    .line 187
    .line 188
    goto :goto_8

    .line 189
    :cond_9
    sget v3, Ll/dbc0;->K2:I

    .line 190
    .line 191
    invoke-virtual {v8, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 192
    .line 193
    .line 194
    goto :goto_8

    .line 195
    :cond_a
    invoke-static {}, Ll/gra;->z()Z

    .line 196
    .line 197
    .line 198
    move-result v6

    .line 199
    iget-object v8, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->h:Lv/VImage;

    .line 200
    .line 201
    if-eqz v6, :cond_c

    .line 202
    .line 203
    if-eqz v3, :cond_b

    .line 204
    .line 205
    sget v3, Ll/dbc0;->W6:I

    .line 206
    .line 207
    goto :goto_7

    .line 208
    :cond_b
    sget v3, Ll/dbc0;->P2:I

    .line 209
    .line 210
    :goto_7
    invoke-virtual {v8, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 211
    .line 212
    .line 213
    goto :goto_8

    .line 214
    :cond_c
    sget v3, Ll/dbc0;->O2:I

    .line 215
    .line 216
    invoke-virtual {v8, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 217
    .line 218
    .line 219
    :goto_8
    if-ne p4, v0, :cond_f

    .line 220
    .line 221
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->h:Lv/VImage;

    .line 222
    .line 223
    new-instance v6, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout$a;

    .line 224
    .line 225
    invoke-direct {v6, p0, v7}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;Lcom/p1/mobile/putong/data/User;)V

    .line 226
    .line 227
    .line 228
    invoke-static {v3, v6}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 229
    .line 230
    .line 231
    goto :goto_a

    .line 232
    :cond_d
    const-string v3, "pending"

    .line 233
    .line 234
    invoke-static {p2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 235
    .line 236
    .line 237
    move-result v3

    .line 238
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->g:Lv/VText;

    .line 239
    .line 240
    if-eqz v3, :cond_e

    .line 241
    .line 242
    const-string v3, "\u8ba4\u8bc1\u4e2d"

    .line 243
    .line 244
    invoke-virtual {v6, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 245
    .line 246
    .line 247
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->f:Lv/VImage;

    .line 248
    .line 249
    new-instance v6, Ll/pie0;

    .line 250
    .line 251
    invoke-direct {v6, p0}, Ll/pie0;-><init>(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;)V

    .line 252
    .line 253
    .line 254
    invoke-static {v3, v6}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 255
    .line 256
    .line 257
    goto :goto_9

    .line 258
    :cond_e
    const-string v3, "\u5934\u50cf\u8ba4\u8bc1"

    .line 259
    .line 260
    invoke-virtual {v6, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 261
    .line 262
    .line 263
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->f:Lv/VImage;

    .line 264
    .line 265
    new-instance v6, Ll/qie0;

    .line 266
    .line 267
    invoke-direct {v6, p0, p4, p1}, Ll/qie0;-><init>(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;ILjava/lang/String;)V

    .line 268
    .line 269
    .line 270
    invoke-static {v3, v6}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 271
    .line 272
    .line 273
    :goto_9
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->h:Lv/VImage;

    .line 274
    .line 275
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 276
    .line 277
    .line 278
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->f:Lv/VImage;

    .line 279
    .line 280
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 281
    .line 282
    .line 283
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->g:Lv/VText;

    .line 284
    .line 285
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 286
    .line 287
    .line 288
    :cond_f
    :goto_a
    iget-object v3, v7, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 289
    .line 290
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 291
    .line 292
    .line 293
    move-result v3

    .line 294
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->l:Lv/VText;

    .line 295
    .line 296
    if-nez v3, :cond_10

    .line 297
    .line 298
    invoke-static {v6, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 299
    .line 300
    .line 301
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->k:Lv/VImage;

    .line 302
    .line 303
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 304
    .line 305
    .line 306
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->j:Lv/VText;

    .line 307
    .line 308
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 309
    .line 310
    .line 311
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->l:Lv/VText;

    .line 312
    .line 313
    iget-object v6, v7, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 314
    .line 315
    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 316
    .line 317
    .line 318
    goto :goto_b

    .line 319
    :cond_10
    invoke-static {v6, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 320
    .line 321
    .line 322
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->k:Lv/VImage;

    .line 323
    .line 324
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 325
    .line 326
    .line 327
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->j:Lv/VText;

    .line 328
    .line 329
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 330
    .line 331
    .line 332
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->j:Lv/VText;

    .line 333
    .line 334
    new-instance v6, Ll/aie0;

    .line 335
    .line 336
    invoke-direct {v6, p0, p4, p1}, Ll/aie0;-><init>(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;ILjava/lang/String;)V

    .line 337
    .line 338
    .line 339
    invoke-static {v3, v6}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 340
    .line 341
    .line 342
    :goto_b
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->m:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 343
    .line 344
    invoke-static {v3, v5}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 345
    .line 346
    .line 347
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->n:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 348
    .line 349
    invoke-static {v3, v5}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 350
    .line 351
    .line 352
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->m:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 353
    .line 354
    invoke-virtual {v3, v2}, Landroid/view/View;->setClickable(Z)V

    .line 355
    .line 356
    .line 357
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->n:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 358
    .line 359
    invoke-virtual {v3, v2}, Landroid/view/View;->setClickable(Z)V

    .line 360
    .line 361
    .line 362
    iget-object v3, v7, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 363
    .line 364
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 365
    .line 366
    .line 367
    move-result v3

    .line 368
    if-le v3, v1, :cond_11

    .line 369
    .line 370
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 371
    .line 372
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->m:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 373
    .line 374
    iget-object v8, v7, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 375
    .line 376
    invoke-interface {v8, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 377
    .line 378
    .line 379
    move-result-object v8

    .line 380
    check-cast v8, Lcom/p1/mobile/putong/data/Media;

    .line 381
    .line 382
    invoke-virtual {v8}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 383
    .line 384
    .line 385
    move-result-object v8

    .line 386
    invoke-virtual {v8}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 387
    .line 388
    .line 389
    move-result-object v8

    .line 390
    invoke-virtual {v8}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 391
    .line 392
    .line 393
    move-result-object v8

    .line 394
    invoke-virtual {v3, v6, v8}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 395
    .line 396
    .line 397
    goto :goto_c

    .line 398
    :cond_11
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->m:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 399
    .line 400
    invoke-virtual {v3, v2}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 401
    .line 402
    .line 403
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->m:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 404
    .line 405
    new-instance v6, Ll/bie0;

    .line 406
    .line 407
    invoke-direct {v6, p0, p4, p1}, Ll/bie0;-><init>(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;ILjava/lang/String;)V

    .line 408
    .line 409
    .line 410
    invoke-static {v3, v6}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 411
    .line 412
    .line 413
    :goto_c
    iget-object v3, v7, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 414
    .line 415
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 416
    .line 417
    .line 418
    move-result v3

    .line 419
    if-le v3, v0, :cond_12

    .line 420
    .line 421
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 422
    .line 423
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->n:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 424
    .line 425
    iget-object v6, v7, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 426
    .line 427
    invoke-interface {v6, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 428
    .line 429
    .line 430
    move-result-object v0

    .line 431
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 432
    .line 433
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 434
    .line 435
    .line 436
    move-result-object v0

    .line 437
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 438
    .line 439
    .line 440
    move-result-object v0

    .line 441
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 442
    .line 443
    .line 444
    move-result-object v0

    .line 445
    invoke-virtual {p1, v3, v0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 446
    .line 447
    .line 448
    goto :goto_d

    .line 449
    :cond_12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->n:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 450
    .line 451
    invoke-virtual {v0, v2}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 452
    .line 453
    .line 454
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->n:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 455
    .line 456
    new-instance v3, Ll/cie0;

    .line 457
    .line 458
    invoke-direct {v3, p0, p4, p1}, Ll/cie0;-><init>(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;ILjava/lang/String;)V

    .line 459
    .line 460
    .line 461
    invoke-static {v0, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 462
    .line 463
    .line 464
    :goto_d
    invoke-virtual {p0, v7}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->y(Lcom/p1/mobile/putong/data/User;)Z

    .line 465
    .line 466
    .line 467
    move-result p1

    .line 468
    if-eqz p1, :cond_13

    .line 469
    .line 470
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->T()V

    .line 471
    .line 472
    .line 473
    :cond_13
    invoke-static {}, Ll/gra;->N3()Z

    .line 474
    .line 475
    .line 476
    move-result p1

    .line 477
    if-eqz p1, :cond_18

    .line 478
    .line 479
    invoke-virtual {p0, v7}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->y(Lcom/p1/mobile/putong/data/User;)Z

    .line 480
    .line 481
    .line 482
    move-result p1

    .line 483
    if-eqz p1, :cond_18

    .line 484
    .line 485
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->b:Lv/VFrame;

    .line 486
    .line 487
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 488
    .line 489
    .line 490
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->r:Lv/VFrame;

    .line 491
    .line 492
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 493
    .line 494
    .line 495
    new-instance p1, Ll/aoh0;

    .line 496
    .line 497
    new-instance v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 498
    .line 499
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;-><init>()V

    .line 500
    .line 501
    .line 502
    invoke-direct {p1, v0, v7}, Ll/aoh0;-><init>(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;)V

    .line 503
    .line 504
    .line 505
    invoke-virtual {p0, p1, v7}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->A(Ll/aoh0;Lcom/p1/mobile/putong/data/User;)V

    .line 506
    .line 507
    .line 508
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->C:Ll/mql;

    .line 509
    .line 510
    if-nez p1, :cond_14

    .line 511
    .line 512
    new-instance p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;

    .line 513
    .line 514
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 515
    .line 516
    .line 517
    move-result-object v0

    .line 518
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->w:Landroid/widget/FrameLayout;

    .line 519
    .line 520
    invoke-direct {p1, v2, v0, v3, v5}, Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b;-><init>(ZLandroid/content/Context;Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/b$a;)V

    .line 521
    .line 522
    .line 523
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->C:Ll/mql;

    .line 524
    .line 525
    :cond_14
    new-instance v8, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 526
    .line 527
    invoke-direct {v8}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;-><init>()V

    .line 528
    .line 529
    .line 530
    iget-object p1, v7, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 531
    .line 532
    iput-object p1, v8, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 533
    .line 534
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->C:Ll/mql;

    .line 535
    .line 536
    const/4 v9, 0x1

    .line 537
    const/4 v10, 0x0

    .line 538
    const/4 v6, 0x0

    .line 539
    invoke-interface/range {v5 .. v10}, Ll/mql;->e(Ll/q7m;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;ZLcom/p1/mobile/putong/core/data/CoreMomentInfo;)V

    .line 540
    .line 541
    .line 542
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->C:Ll/mql;

    .line 543
    .line 544
    invoke-interface {p1, v2, v2}, Ll/mql;->a(IZ)V

    .line 545
    .line 546
    .line 547
    if-nez p4, :cond_17

    .line 548
    .line 549
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->y:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 550
    .line 551
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 552
    .line 553
    .line 554
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->x:Lv/VImage;

    .line 555
    .line 556
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 557
    .line 558
    .line 559
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->y:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 560
    .line 561
    new-instance p4, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout$b;

    .line 562
    .line 563
    invoke-direct {p4, p0}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout$b;-><init>(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;)V

    .line 564
    .line 565
    .line 566
    invoke-static {p1, p4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 567
    .line 568
    .line 569
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->v:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 570
    .line 571
    new-instance p4, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout$c;

    .line 572
    .line 573
    invoke-direct {p4, p0, v7}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout$c;-><init>(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;Lcom/p1/mobile/putong/data/User;)V

    .line 574
    .line 575
    .line 576
    invoke-static {p1, p4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 577
    .line 578
    .line 579
    invoke-static {p2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 580
    .line 581
    .line 582
    move-result p1

    .line 583
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->u:Lv/VDraweeView;

    .line 584
    .line 585
    if-eqz p1, :cond_16

    .line 586
    .line 587
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 588
    .line 589
    .line 590
    invoke-static {p3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 591
    .line 592
    .line 593
    move-result p1

    .line 594
    if-eqz p1, :cond_15

    .line 595
    .line 596
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 597
    .line 598
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->u:Lv/VDraweeView;

    .line 599
    .line 600
    sget p2, Ll/dbc0;->K2:I

    .line 601
    .line 602
    invoke-virtual {p1, p0, p2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 603
    .line 604
    .line 605
    return-void

    .line 606
    :cond_15
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 607
    .line 608
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->u:Lv/VDraweeView;

    .line 609
    .line 610
    sget p2, Ll/dbc0;->O2:I

    .line 611
    .line 612
    invoke-virtual {p1, p0, p2}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 613
    .line 614
    .line 615
    return-void

    .line 616
    :cond_16
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 617
    .line 618
    .line 619
    :cond_17
    return-void

    .line 620
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->b:Lv/VFrame;

    .line 621
    .line 622
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 623
    .line 624
    .line 625
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->r:Lv/VFrame;

    .line 626
    .line 627
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 628
    .line 629
    .line 630
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->p:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 631
    .line 632
    if-nez p4, :cond_1a

    .line 633
    .line 634
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 635
    .line 636
    .line 637
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->q:Lv/VText;

    .line 638
    .line 639
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 640
    .line 641
    .line 642
    invoke-virtual {p0, v7}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->y(Lcom/p1/mobile/putong/data/User;)Z

    .line 643
    .line 644
    .line 645
    move-result p1

    .line 646
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->p:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 647
    .line 648
    if-eqz p1, :cond_19

    .line 649
    .line 650
    const-string p1, "\u7ee7\u7eed\u5212\u5361"

    .line 651
    .line 652
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 653
    .line 654
    .line 655
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->p:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 656
    .line 657
    new-instance p2, Ll/die0;

    .line 658
    .line 659
    invoke-direct {p2, p0}, Ll/die0;-><init>(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;)V

    .line 660
    .line 661
    .line 662
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 663
    .line 664
    .line 665
    goto :goto_e

    .line 666
    :cond_19
    const-string p1, "\u7acb\u5373\u5b8c\u5584"

    .line 667
    .line 668
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 669
    .line 670
    .line 671
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->p:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 672
    .line 673
    new-instance p2, Ll/eie0;

    .line 674
    .line 675
    invoke-direct {p2, p0}, Ll/eie0;-><init>(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;)V

    .line 676
    .line 677
    .line 678
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 679
    .line 680
    .line 681
    :goto_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->q:Lv/VText;

    .line 682
    .line 683
    new-instance p2, Ll/fie0;

    .line 684
    .line 685
    invoke-direct {p2, p0}, Ll/fie0;-><init>(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;)V

    .line 686
    .line 687
    .line 688
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 689
    .line 690
    .line 691
    return-void

    .line 692
    :cond_1a
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 693
    .line 694
    .line 695
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->q:Lv/VText;

    .line 696
    .line 697
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 698
    .line 699
    .line 700
    return-void
.end method

.method public final Q()V
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    new-array v0, v0, [Ll/th0;

    .line 3
    .line 4
    new-instance v1, Ll/th0$a;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->u()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    invoke-direct {v1, v2}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v1, v2}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1, v2}, Ll/th0$a;->h(Z)Ll/th0$a;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->u()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-virtual {v3}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    sget v4, Lcom/p1/mobile/putong/core/profile/R$string;->L:I

    .line 31
    .line 32
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-virtual {v1, v3}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    new-instance v3, Ll/gie0;

    .line 41
    .line 42
    invoke-direct {v3, v0}, Ll/gie0;-><init>([Ll/th0;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, v3}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->u()Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    sget v4, Lcom/p1/mobile/putong/core/profile/R$string;->O:I

    .line 54
    .line 55
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-virtual {v1, v3}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    sget v5, Lcom/p1/mobile/putong/core/profile/R$string;->K:I

    .line 68
    .line 69
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    invoke-virtual {v3, v4}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    new-instance v4, Ll/hie0;

    .line 78
    .line 79
    invoke-direct {v4, p0, v0}, Ll/hie0;-><init>(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;[Ll/th0;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v3, v4}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v1}, Ll/th0$a;->a()Ll/th0;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    aput-object p0, v0, v2

    .line 90
    .line 91
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public final R(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->A:I

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, "p_suggest_users_home_view"

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v0, 0x1

    .line 9
    if-ne p0, v0, :cond_1

    .line 10
    .line 11
    const-string p0, "p_navigation_view"

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_1
    const/4 v0, 0x2

    .line 15
    if-ne p0, v0, :cond_2

    .line 16
    .line 17
    const-string p0, "p_edit_profile_view"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_2
    const-string p0, ""

    .line 21
    .line 22
    :goto_0
    const-string v0, "complete_card_info_entrance"

    .line 23
    .line 24
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    filled-new-array {p1}, [Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    const-string v0, "e_complete_card_info"

    .line 33
    .line 34
    invoke-static {v0, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final S(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->A:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const-string v2, "e_complete_card_info"

    .line 5
    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    instance-of p0, p1, Lcom/p1/mobile/putong/core/ui/profile/EditProfileAct;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/EditProfileAct;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/EditProfileAct;->c3()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    const-string p0, "p_edit_profile_view"

    .line 21
    .line 22
    invoke-static {v2, p0}, Ll/sfj0;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->B:Ljava/util/HashSet;

    .line 27
    .line 28
    const-string v0, "e_complete_card_info_mv"

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_2

    .line 35
    .line 36
    :cond_1
    return-void

    .line 37
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->B:Ljava/util/HashSet;

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->A:I

    .line 43
    .line 44
    if-nez p0, :cond_3

    .line 45
    .line 46
    const-string p0, "p_suggest_users_home_view"

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_3
    const-string p0, "p_navigation_view"

    .line 50
    .line 51
    :goto_0
    invoke-static {v2, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final T()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->B:Ljava/util/HashSet;

    .line 2
    .line 3
    const-string v1, "e_complete_card_success"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->B:Ljava/util/HashSet;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->A:I

    .line 18
    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    const-string p0, "p_suggest_users_home_view"

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    const-string p0, "p_navigation_view"

    .line 25
    .line 26
    :goto_0
    const/4 v0, 0x0

    .line 27
    new-array v0, v0, [Ll/pf60;

    .line 28
    .line 29
    invoke-static {v1, p0, v0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->z:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->B:Ljava/util/HashSet;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public setRenderType(I)V
    .locals 8

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->A:I

    .line 2
    .line 3
    const/high16 v0, 0x41900000    # 18.0f

    .line 4
    .line 5
    const/high16 v1, 0x42300000    # 44.0f

    .line 6
    .line 7
    const/high16 v2, 0x42600000    # 56.0f

    .line 8
    .line 9
    const/high16 v3, 0x40800000    # 4.0f

    .line 10
    .line 11
    const/high16 v4, 0x41700000    # 15.0f

    .line 12
    .line 13
    const/high16 v5, 0x41800000    # 16.0f

    .line 14
    .line 15
    if-nez p1, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->e:Lv/VText;

    .line 18
    .line 19
    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->e:Lv/VText;

    .line 23
    .line 24
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    invoke-static {p1, v3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->g:Lv/VText;

    .line 32
    .line 33
    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->j:Lv/VText;

    .line 37
    .line 38
    invoke-virtual {p1, v5}, Landroid/widget/TextView;->setTextSize(F)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->j:Lv/VText;

    .line 42
    .line 43
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    invoke-static {p1, v2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 48
    .line 49
    .line 50
    invoke-static {}, Ll/gra;->y()Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->l:Lv/VText;

    .line 55
    .line 56
    if-eqz p1, :cond_0

    .line 57
    .line 58
    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTextSize(F)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->l:Lv/VText;

    .line 62
    .line 63
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    invoke-static {p0, p1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_0
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_1
    const/4 v6, 0x1

    .line 76
    if-ne p1, v6, :cond_2

    .line 77
    .line 78
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->e:Lv/VText;

    .line 79
    .line 80
    const/high16 v0, 0x41500000    # 13.0f

    .line 81
    .line 82
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->e:Lv/VText;

    .line 86
    .line 87
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    invoke-static {p1, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 92
    .line 93
    .line 94
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->g:Lv/VText;

    .line 95
    .line 96
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->j:Lv/VText;

    .line 100
    .line 101
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->j:Lv/VText;

    .line 105
    .line 106
    const/high16 v0, 0x42400000    # 48.0f

    .line 107
    .line 108
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    invoke-static {p1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 113
    .line 114
    .line 115
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->l:Lv/VText;

    .line 116
    .line 117
    invoke-virtual {p0, v5}, Landroid/widget/TextView;->setTextSize(F)V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_2
    const/4 v7, 0x2

    .line 122
    if-ne p1, v7, :cond_4

    .line 123
    .line 124
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->e:Lv/VText;

    .line 125
    .line 126
    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 127
    .line 128
    .line 129
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->e:Lv/VText;

    .line 130
    .line 131
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    invoke-static {p1, v3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 136
    .line 137
    .line 138
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->g:Lv/VText;

    .line 139
    .line 140
    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 141
    .line 142
    .line 143
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->j:Lv/VText;

    .line 144
    .line 145
    invoke-virtual {p1, v5}, Landroid/widget/TextView;->setTextSize(F)V

    .line 146
    .line 147
    .line 148
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->j:Lv/VText;

    .line 149
    .line 150
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 151
    .line 152
    .line 153
    move-result v2

    .line 154
    invoke-static {p1, v2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 155
    .line 156
    .line 157
    invoke-static {}, Ll/gra;->y()Z

    .line 158
    .line 159
    .line 160
    move-result p1

    .line 161
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->l:Lv/VText;

    .line 162
    .line 163
    const/4 v3, 0x0

    .line 164
    if-eqz p1, :cond_3

    .line 165
    .line 166
    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTextSize(F)V

    .line 167
    .line 168
    .line 169
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->l:Lv/VText;

    .line 170
    .line 171
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    invoke-static {p1, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 176
    .line 177
    .line 178
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->o:Lv/VImage;

    .line 179
    .line 180
    invoke-static {p1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 181
    .line 182
    .line 183
    goto :goto_0

    .line 184
    :cond_3
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 185
    .line 186
    .line 187
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->l:Lv/VText;

    .line 188
    .line 189
    invoke-static {p1, v3}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 190
    .line 191
    .line 192
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->p:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 193
    .line 194
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 195
    .line 196
    .line 197
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->q:Lv/VText;

    .line 198
    .line 199
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 200
    .line 201
    .line 202
    :cond_4
    return-void
.end method

.method public final t(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/rie0;->a(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final u()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

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

.method public v()Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isJailed()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->startJailedDialogLikeAct()V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method public final w()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isProfileJailed()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->Q()V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public x()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->z:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final y(Lcom/p1/mobile/putong/data/User;)Z
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x3

    .line 8
    if-lt p0, v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-nez p0, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public z(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->VERIFICATION:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->u()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    sget-object v2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_FROM_MY_TAB_OPT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 13
    .line 14
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    iget-object v3, v3, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    invoke-static {v1, v2, p1, v3}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/data/User;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const-string v2, "loop_create_from_page"

    .line 25
    .line 26
    const-string v3, "edit_profile_complete_card"

    .line 27
    .line 28
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    const-string v2, "loop_edit_patch_flag"

    .line 32
    .line 33
    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->u()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v2, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout$d;

    .line 41
    .line 42
    invoke-direct {v2, p0, p1}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout$d;-><init>(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(Landroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method
