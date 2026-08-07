.class public Ll/iq40;
.super Ll/xek0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/xek0<",
        "Ll/ip40;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Landroid/widget/LinearLayout;

.field public B:Lv/VText;

.field public C:Landroidx/legacy/widget/Space;

.field public D:Lv/VOnlineIndicator;

.field public E:Lv/VText;

.field public F:Landroid/view/View;

.field public G:Landroid/widget/LinearLayout;

.field public H:Lv/VText;

.field public I:Lv/VText;

.field public J:Landroid/view/View;

.field public K:Landroid/widget/LinearLayout;

.field public L:Lv/VText;

.field public M:Lv/VOnlineIndicator;

.field public N:Lv/VText;

.field public O:Lv/VLinear;

.field public P:Landroid/view/View;

.field public Q:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public R:Ll/ip40;

.field public final S:Landroid/content/Context;

.field public final T:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public U:Ll/y6k0;

.field public V:Lcom/p1/mobile/putong/data/User;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public W:Ljava/lang/String;

.field public X:Ljava/lang/String;

.field public Y:Landroid/animation/Animator;

.field public a:Lv/VFrame;

.field public b:Landroid/widget/LinearLayout;

.field public c:Landroid/widget/FrameLayout;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public f:Landroid/widget/TextView;

.field public g:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public h:Landroid/widget/LinearLayout;

.field public i:Landroid/widget/LinearLayout;

.field public j:Lv/VText;

.field public k:Lv/VOnlineIndicator;

.field public l:Lv/VText;

.field public m:Landroid/view/View;

.field public n:Landroid/widget/LinearLayout;

.field public o:Landroid/widget/RelativeLayout;

.field public p:Lv/VText;

.field public q:Lv/VText;

.field public r:Lv/VText;

.field public s:Landroid/widget/LinearLayout;

.field public t:Lv/VText;

.field public u:Landroid/widget/LinearLayout;

.field public v:Lv/VText;

.field public w:Lv/VText;

.field public x:Landroid/widget/LinearLayout;

.field public y:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public z:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/xek0;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "default"

    .line 5
    .line 6
    invoke-static {v0}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Ll/iq40;->T:Ljava/util/ArrayList;

    .line 11
    .line 12
    iput-object p1, p0, Ll/iq40;->S:Landroid/content/Context;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic A(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic B(Ll/iq40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/iq40;->b0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic C(Ll/iq40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/iq40;->W(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic E(Ll/iq40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/iq40;->U(Landroid/view/View;)V

    return-void
.end method

.method public static K(J)Ljava/lang/String;
    .locals 6

    .line 1
    new-instance v0, Ljava/text/DecimalFormat;

    .line 2
    .line 3
    const-string v1, "#.##"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-wide/16 v1, 0x3e7

    .line 9
    .line 10
    cmp-long v1, p0, v1

    .line 11
    .line 12
    if-gtz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0, p0, p1}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_0
    const-wide/16 v1, 0x270f

    .line 20
    .line 21
    cmp-long v1, p0, v1

    .line 22
    .line 23
    const-string v2, "w"

    .line 24
    .line 25
    const v3, 0x461c4000    # 10000.0f

    .line 26
    .line 27
    .line 28
    if-gtz v1, :cond_1

    .line 29
    .line 30
    new-instance v1, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    long-to-float p0, p0

    .line 36
    div-float/2addr p0, v3

    .line 37
    float-to-double p0, p0

    .line 38
    invoke-virtual {v0, p0, p1}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0

    .line 53
    :cond_1
    const-wide/32 v4, 0x98967f

    .line 54
    .line 55
    .line 56
    cmp-long v1, p0, v4

    .line 57
    .line 58
    if-gez v1, :cond_2

    .line 59
    .line 60
    new-instance v1, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 63
    .line 64
    .line 65
    long-to-float p0, p0

    .line 66
    div-float/2addr p0, v3

    .line 67
    float-to-double p0, p0

    .line 68
    invoke-virtual {v0, p0, p1}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    return-object p0

    .line 83
    :cond_2
    const-string p0, "999w+"

    .line 84
    .line 85
    return-object p0
.end method

.method public static L(J)Ljava/lang/String;
    .locals 2

    .line 1
    const-wide/16 v0, 0x270f

    .line 2
    .line 3
    cmp-long v0, p0, v0

    .line 4
    .line 5
    if-gtz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string p0, ""

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0

    .line 25
    :cond_0
    const-wide/32 v0, 0x98967f

    .line 26
    .line 27
    .line 28
    cmp-long v0, p0, v0

    .line 29
    .line 30
    if-gez v0, :cond_1

    .line 31
    .line 32
    new-instance v0, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 35
    .line 36
    .line 37
    long-to-float p0, p0

    .line 38
    const p1, 0x461c4000    # 10000.0f

    .line 39
    .line 40
    .line 41
    div-float/2addr p0, p1

    .line 42
    float-to-double p0, p0

    .line 43
    invoke-static {p0, p1}, Ll/a9g0;->c(D)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string p0, "w"

    .line 51
    .line 52
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0

    .line 60
    :cond_1
    const-string p0, "999w+"

    .line 61
    .line 62
    return-object p0
.end method

.method private P()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/iq40;->b:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    new-instance v1, Ll/lp40;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/lp40;-><init>(Ll/iq40;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/gra;->p2()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/iq40;->U:Ll/y6k0;

    .line 18
    .line 19
    new-instance v1, Ll/mp40;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/mp40;-><init>(Ll/iq40;)V

    .line 22
    .line 23
    .line 24
    invoke-interface {v0, v1}, Ll/y6k0;->k(Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object v0, p0, Ll/iq40;->U:Ll/y6k0;

    .line 28
    .line 29
    new-instance v1, Ll/np40;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/np40;-><init>(Ll/iq40;)V

    .line 32
    .line 33
    .line 34
    invoke-interface {v0, v1}, Ll/y6k0;->h(Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/iq40;->i:Landroid/widget/LinearLayout;

    .line 38
    .line 39
    new-instance v1, Ll/op40;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/op40;-><init>(Ll/iq40;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/iq40;->n:Landroid/widget/LinearLayout;

    .line 48
    .line 49
    new-instance v1, Ll/pp40;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/pp40;-><init>(Ll/iq40;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/iq40;->u:Landroid/widget/LinearLayout;

    .line 58
    .line 59
    new-instance v1, Ll/qp40;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Ll/qp40;-><init>(Ll/iq40;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Ll/iq40;->x:Landroid/widget/LinearLayout;

    .line 68
    .line 69
    new-instance v1, Ll/rp40;

    .line 70
    .line 71
    invoke-direct {v1, p0}, Ll/rp40;-><init>(Ll/iq40;)V

    .line 72
    .line 73
    .line 74
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/iq40;->U:Ll/y6k0;

    .line 78
    .line 79
    new-instance v1, Ll/sp40;

    .line 80
    .line 81
    invoke-direct {v1, p0}, Ll/sp40;-><init>(Ll/iq40;)V

    .line 82
    .line 83
    .line 84
    new-instance v2, Ll/tp40;

    .line 85
    .line 86
    invoke-direct {v2, p0}, Ll/tp40;-><init>(Ll/iq40;)V

    .line 87
    .line 88
    .line 89
    invoke-interface {v0, v1, v2}, Ll/y6k0;->j(Landroid/view/View$OnClickListener;Landroid/view/View$OnClickListener;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public static synthetic a(Ll/iq40;Lcom/p1/mobile/putong/core/data/RealPicturesBanner;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/iq40;->o0(Lcom/p1/mobile/putong/core/data/RealPicturesBanner;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/iq40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/iq40;->l0(Landroid/view/View;)V

    return-void
.end method

.method private synthetic b0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iq40;->R:Ll/ip40;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ip40;->j1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic c(Ll/iq40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/iq40;->Y(Landroid/view/View;)V

    return-void
.end method

.method private synthetic c0(Landroid/view/View;)V
    .locals 8

    .line 1
    const-string p1, "e_my_moment"

    .line 2
    .line 3
    const-string v0, "p_navigation_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    const/4 v6, 0x0

    .line 25
    const/4 v7, 0x0

    .line 26
    const-string v4, "p_my_moment"

    .line 27
    .line 28
    const/4 v5, -0x1

    .line 29
    invoke-interface/range {v1 .. v7}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->argsToPhotoAlbumFeedAct(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static synthetic d(Ll/iq40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/iq40;->d0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/iq40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/iq40;->i0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Ll/iq40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/iq40;->m0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ll/iq40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/iq40;->T(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j(Ll/iq40;Ljava/lang/String;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/iq40;->e0(Ljava/lang/String;Ll/bkj0;)V

    return-void
.end method

.method public static synthetic k(Ll/iq40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/iq40;->j0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Ll/iq40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/iq40;->V(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Ll/iq40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/iq40;->k0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n(Ll/iq40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/iq40;->c0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p(Ll/iq40;[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/iq40;->g0([I)V

    return-void
.end method

.method public static synthetic q(Ll/iq40;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/iq40;->n0()V

    return-void
.end method

.method private r()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/iq40;->U:Ll/y6k0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/y6k0;->t()Lv/VText;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/iq40;->U:Ll/y6k0;

    .line 13
    .line 14
    invoke-interface {v0}, Ll/y6k0;->d()Lv/VImage;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/jp40;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/jp40;-><init>(Ll/iq40;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/iq40;->i:Landroid/widget/LinearLayout;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/iq40;->m:Landroid/view/View;

    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/iq40;->h:Landroid/widget/LinearLayout;

    .line 38
    .line 39
    sget v2, Ll/qa00;->j:I

    .line 40
    .line 41
    neg-int v3, v2

    .line 42
    invoke-static {v0, v3}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/iq40;->h:Landroid/widget/LinearLayout;

    .line 46
    .line 47
    neg-int v2, v2

    .line 48
    invoke-static {v0, v2}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ll/iq40;->S()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    const-string v2, "\u52a8\u6001"

    .line 56
    .line 57
    if-nez v0, :cond_0

    .line 58
    .line 59
    invoke-static {}, Ll/gra;->p2()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_1

    .line 64
    .line 65
    :cond_0
    iget-object v0, p0, Ll/iq40;->a:Lv/VFrame;

    .line 66
    .line 67
    sget v3, Ll/qa00;->h:I

    .line 68
    .line 69
    invoke-static {v0, v3}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/iq40;->a:Lv/VFrame;

    .line 73
    .line 74
    invoke-static {v0, v3}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/iq40;->h:Landroid/widget/LinearLayout;

    .line 78
    .line 79
    sget v3, Ll/qa00;->f:I

    .line 80
    .line 81
    invoke-static {v0, v3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Ll/iq40;->H:Lv/VText;

    .line 85
    .line 86
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    .line 88
    .line 89
    :cond_1
    invoke-virtual {p0}, Ll/iq40;->S()Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-eqz v0, :cond_2

    .line 94
    .line 95
    invoke-static {}, Ll/gra;->p2()Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-nez v0, :cond_2

    .line 100
    .line 101
    invoke-static {}, Ll/spl0;->L()Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-nez v0, :cond_2

    .line 106
    .line 107
    iget-object v0, p0, Ll/iq40;->F:Landroid/view/View;

    .line 108
    .line 109
    const/4 v3, 0x1

    .line 110
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Ll/iq40;->G:Landroid/widget/LinearLayout;

    .line 114
    .line 115
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Ll/iq40;->G:Landroid/widget/LinearLayout;

    .line 119
    .line 120
    new-instance v3, Ll/up40;

    .line 121
    .line 122
    invoke-direct {v3, p0}, Ll/up40;-><init>(Ll/iq40;)V

    .line 123
    .line 124
    .line 125
    invoke-static {v0, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 126
    .line 127
    .line 128
    :cond_2
    invoke-static {}, Ll/e7d0;->f()Z

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    if-eqz v0, :cond_3

    .line 133
    .line 134
    iget-object v0, p0, Ll/iq40;->h:Landroid/widget/LinearLayout;

    .line 135
    .line 136
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 137
    .line 138
    .line 139
    goto :goto_0

    .line 140
    :cond_3
    invoke-virtual {p0}, Ll/iq40;->S()Z

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    if-eqz v0, :cond_5

    .line 145
    .line 146
    invoke-static {}, Ll/gra;->p2()Z

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    if-nez v0, :cond_5

    .line 151
    .line 152
    invoke-static {}, Ll/gra;->z()Z

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    if-eqz v0, :cond_4

    .line 157
    .line 158
    iget-object v0, p0, Ll/iq40;->j:Lv/VText;

    .line 159
    .line 160
    const/high16 v3, -0x1000000

    .line 161
    .line 162
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 163
    .line 164
    .line 165
    iget-object v0, p0, Ll/iq40;->p:Lv/VText;

    .line 166
    .line 167
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 168
    .line 169
    .line 170
    iget-object v0, p0, Ll/iq40;->q:Lv/VText;

    .line 171
    .line 172
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 173
    .line 174
    .line 175
    iget-object v0, p0, Ll/iq40;->v:Lv/VText;

    .line 176
    .line 177
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 178
    .line 179
    .line 180
    iget-object v0, p0, Ll/iq40;->z:Lv/VText;

    .line 181
    .line 182
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 183
    .line 184
    .line 185
    iget-object v0, p0, Ll/iq40;->H:Lv/VText;

    .line 186
    .line 187
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 188
    .line 189
    .line 190
    iget-object v0, p0, Ll/iq40;->j:Lv/VText;

    .line 191
    .line 192
    const/high16 v3, 0x41a00000    # 20.0f

    .line 193
    .line 194
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 195
    .line 196
    .line 197
    iget-object v0, p0, Ll/iq40;->p:Lv/VText;

    .line 198
    .line 199
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 200
    .line 201
    .line 202
    iget-object v0, p0, Ll/iq40;->q:Lv/VText;

    .line 203
    .line 204
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 205
    .line 206
    .line 207
    iget-object v0, p0, Ll/iq40;->v:Lv/VText;

    .line 208
    .line 209
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 210
    .line 211
    .line 212
    iget-object v0, p0, Ll/iq40;->z:Lv/VText;

    .line 213
    .line 214
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 215
    .line 216
    .line 217
    iget-object v0, p0, Ll/iq40;->H:Lv/VText;

    .line 218
    .line 219
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 220
    .line 221
    .line 222
    :cond_4
    iget-object v0, p0, Ll/iq40;->l:Lv/VText;

    .line 223
    .line 224
    sget v3, Ll/qa00;->g:I

    .line 225
    .line 226
    invoke-static {v0, v3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 227
    .line 228
    .line 229
    iget-object v0, p0, Ll/iq40;->s:Landroid/widget/LinearLayout;

    .line 230
    .line 231
    invoke-static {v0, v3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 232
    .line 233
    .line 234
    iget-object v0, p0, Ll/iq40;->w:Lv/VText;

    .line 235
    .line 236
    invoke-static {v0, v3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 237
    .line 238
    .line 239
    iget-object v0, p0, Ll/iq40;->B:Lv/VText;

    .line 240
    .line 241
    invoke-static {v0, v3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 242
    .line 243
    .line 244
    iget-object v0, p0, Ll/iq40;->I:Lv/VText;

    .line 245
    .line 246
    invoke-static {v0, v3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 247
    .line 248
    .line 249
    iget-object v0, p0, Ll/iq40;->N:Lv/VText;

    .line 250
    .line 251
    invoke-static {v0, v3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 252
    .line 253
    .line 254
    iget-object v0, p0, Ll/iq40;->I:Lv/VText;

    .line 255
    .line 256
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 257
    .line 258
    .line 259
    :cond_5
    :goto_0
    invoke-static {}, Ll/spl0;->L()Z

    .line 260
    .line 261
    .line 262
    move-result v0

    .line 263
    if-eqz v0, :cond_6

    .line 264
    .line 265
    invoke-virtual {p0, v1}, Ll/iq40;->J0(I)V

    .line 266
    .line 267
    .line 268
    :cond_6
    return-void
.end method

.method public static synthetic s(Ll/iq40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/iq40;->X(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic u(Ll/iq40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/iq40;->M(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic v(Ll/iq40;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/iq40;->h0(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic w(Ll/iq40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/iq40;->a0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic x(Ll/iq40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/iq40;->f0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic y(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic z(Ll/iq40;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/iq40;->Z(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final A0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iq40;->U:Ll/y6k0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y6k0;->p(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final B0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iq40;->U:Ll/y6k0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y6k0;->i(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/iq40;->S:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public final D0(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/aw90;->S()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    invoke-static {}, Ll/gra;->Y1()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    invoke-static {}, Ll/gra;->p2()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_2

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/iq40;->S()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_0
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0, p1}, Ll/aw90;->L(Lcom/p1/mobile/putong/data/User;)I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    iget-object v0, p0, Ll/iq40;->d:Landroid/widget/LinearLayout;

    .line 40
    .line 41
    const/16 v2, 0x32

    .line 42
    .line 43
    if-ge p1, v2, :cond_1

    .line 44
    .line 45
    const/4 p1, 0x1

    .line 46
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Ll/iq40;->e:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 50
    .line 51
    const-string v0, "\u5f53\u524d\u66dd\u5149\u8f83\u5c11"

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Ll/iq40;->f:Landroid/widget/TextView;

    .line 57
    .line 58
    const-string v0, "\u5b8c\u5584\u8d44\u6599\uff0c\u4f18\u5148\u63a8\u8350\u7ed9\u66f4\u591a\u5408\u9002\u7684\u4eba"

    .line 59
    .line 60
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Ll/iq40;->g:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 64
    .line 65
    const-string v0, "\u53bb\u5b8c\u5584"

    .line 66
    .line 67
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Ll/iq40;->R:Ll/ip40;

    .line 71
    .line 72
    iget-object p1, p1, Ll/ip40;->b:Ll/yek0;

    .line 73
    .line 74
    invoke-interface {p1}, Ll/yek0;->v()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    const-string v0, "e_ideal_exposure_complete_profile"

    .line 79
    .line 80
    invoke-static {v0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_1
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    :goto_0
    iget-object p1, p0, Ll/iq40;->d:Landroid/widget/LinearLayout;

    .line 88
    .line 89
    new-instance v0, Ll/hq40;

    .line 90
    .line 91
    invoke-direct {v0}, Ll/hq40;-><init>()V

    .line 92
    .line 93
    .line 94
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Ll/iq40;->g:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 98
    .line 99
    new-instance v0, Ll/kp40;

    .line 100
    .line 101
    invoke-direct {v0, p0}, Ll/kp40;-><init>(Ll/iq40;)V

    .line 102
    .line 103
    .line 104
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_2
    :goto_1
    iget-object p0, p0, Ll/iq40;->d:Landroid/widget/LinearLayout;

    .line 109
    .line 110
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public D1()V
    .locals 0

    .line 1
    return-void
.end method

.method public E0(Lcom/p1/mobile/putong/data/User;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/iq40;->U:Ll/y6k0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/y6k0;->g()Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/iq40;->U:Ll/y6k0;

    .line 8
    .line 9
    invoke-interface {v1}, Ll/y6k0;->d()Lv/VImage;

    .line 10
    .line 11
    .line 12
    move-result-object v5

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    invoke-static {v5, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ll/t450;->j()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const/4 v2, 0x1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->o0()V

    .line 31
    .line 32
    .line 33
    new-instance p1, Ll/gq40;

    .line 34
    .line 35
    invoke-direct {p1, p0}, Ll/gq40;-><init>(Ll/iq40;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    invoke-static {v5, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Ll/j49;->e()Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    const/4 v6, 0x1

    .line 58
    const/4 v7, 0x1

    .line 59
    move-object v4, p1

    .line 60
    invoke-interface/range {v2 .. v7}, Lcom/p1/mobile/putong/core/biz/service/CoreMemberInnerService;->j7(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Landroid/widget/ImageView;ZZ)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    const/4 p1, -0x2

    .line 68
    iput p1, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 69
    .line 70
    invoke-virtual {v5, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public F(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/jq40;->b(Ll/iq40;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public G(Ll/ip40;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/iq40;->R:Ll/ip40;

    .line 2
    .line 3
    return-void
.end method

.method public G0(Ll/ovb0;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ovb0<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/core/api/CoreLikers$a;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p1, p1, Ll/ovb0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->receivedLikes:Ljava/lang/Long;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    :goto_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 21
    .line 22
    iget-wide v2, p1, Ll/dkb;->j3:J

    .line 23
    .line 24
    cmp-long p1, v0, v2

    .line 25
    .line 26
    if-lez p1, :cond_1

    .line 27
    .line 28
    iget-object p1, p0, Ll/iq40;->R:Ll/ip40;

    .line 29
    .line 30
    iget-object p1, p1, Ll/ip40;->b:Ll/yek0;

    .line 31
    .line 32
    invoke-interface {p1}, Ll/yek0;->v()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    const/4 v2, 0x0

    .line 37
    new-array v2, v2, [Ll/sfj0$a;

    .line 38
    .line 39
    const-string v3, "e_my_tab_see_red_dot"

    .line 40
    .line 41
    invoke-static {v3, p1, v2}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 47
    .line 48
    iget-wide v2, p1, Ll/dkb;->j3:J

    .line 49
    .line 50
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    .line 51
    .line 52
    .line 53
    move-result-wide v0

    .line 54
    iput-wide v0, p1, Ll/dkb;->j3:J

    .line 55
    .line 56
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 57
    .line 58
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 59
    .line 60
    iget-wide v0, p1, Ll/dkb;->j3:J

    .line 61
    .line 62
    invoke-static {v0, v1}, Ll/iq40;->L(J)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iget-object v0, p0, Ll/iq40;->p:Lv/VText;

    .line 67
    .line 68
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 76
    .line 77
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 78
    .line 79
    iget-wide v0, v0, Ll/dkb;->j3:J

    .line 80
    .line 81
    invoke-virtual {p1, v0, v1}, Ll/aw90;->G(J)J

    .line 82
    .line 83
    .line 84
    move-result-wide v0

    .line 85
    invoke-virtual {p0, v0, v1}, Ll/iq40;->r0(J)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public H()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/iq40;->U:Ll/y6k0;

    .line 2
    .line 3
    instance-of v0, p0, Ll/kfk0;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Ll/kfk0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/kfk0;->J()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public H0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/iq40;->T:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    add-int/lit8 v1, v1, -0x1

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    const-string v1, "appeal"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-nez v1, :cond_1

    .line 25
    .line 26
    const-string v1, "picture_fake"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget-object v0, p0, Ll/iq40;->R:Ll/ip40;

    .line 36
    .line 37
    iget-object v0, v0, Ll/ip40;->b:Ll/yek0;

    .line 38
    .line 39
    invoke-interface {v0}, Ll/yek0;->v()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const/4 v1, 0x0

    .line 44
    new-array v1, v1, [Ll/sfj0$a;

    .line 45
    .line 46
    const-string v2, "e_picture_fake_button"

    .line 47
    .line 48
    invoke-static {v2, v0, v1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    iget-object v0, p0, Ll/iq40;->R:Ll/ip40;

    .line 53
    .line 54
    iget-object v0, v0, Ll/ip40;->b:Ll/yek0;

    .line 55
    .line 56
    invoke-interface {v0}, Ll/yek0;->v()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-static {}, Ll/yc2;->e()Ll/yc2;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v1}, Ll/yc2;->b()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    const-string v2, "ban_user_appeal_state"

    .line 69
    .line 70
    invoke-static {v2, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    filled-new-array {v1}, [Ll/sfj0$a;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    const-string v2, "e_my_profile_navigation_appeal_guide"

    .line 79
    .line 80
    invoke-static {v2, v0, v1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 81
    .line 82
    .line 83
    :goto_0
    invoke-static {}, Ll/gra;->p2()Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_9

    .line 88
    .line 89
    iget-object p0, p0, Ll/iq40;->V:Lcom/p1/mobile/putong/data/User;

    .line 90
    .line 91
    invoke-static {p0}, Ll/aw90;->U(Lcom/p1/mobile/putong/data/User;)Z

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    if-eqz p0, :cond_2

    .line 96
    .line 97
    const-string p0, "complete_card_info"

    .line 98
    .line 99
    goto/16 :goto_2

    .line 100
    .line 101
    :cond_2
    invoke-static {}, Ll/gra;->e2()Z

    .line 102
    .line 103
    .line 104
    move-result p0

    .line 105
    const-string v0, "default"

    .line 106
    .line 107
    if-eqz p0, :cond_3

    .line 108
    .line 109
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 110
    .line 111
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 112
    .line 113
    iget-object p0, p0, Ll/dkb;->Z3:Ll/wyd0;

    .line 114
    .line 115
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    check-cast p0, Ljava/lang/CharSequence;

    .line 120
    .line 121
    const-string v1, "marryMode"

    .line 122
    .line 123
    invoke-static {p0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    if-nez p0, :cond_8

    .line 128
    .line 129
    :cond_3
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 130
    .line 131
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 132
    .line 133
    iget-object p0, p0, Ll/dkb;->j7:Lrx/subjects/a;

    .line 134
    .line 135
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result p0

    .line 143
    if-eqz p0, :cond_8

    .line 144
    .line 145
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 146
    .line 147
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 148
    .line 149
    iget-object p0, p0, Ll/dkb;->j7:Lrx/subjects/a;

    .line 150
    .line 151
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    check-cast p0, Lcom/p1/mobile/putong/core/data/MyTabTask;

    .line 156
    .line 157
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->type:Ljava/lang/String;

    .line 158
    .line 159
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 160
    .line 161
    .line 162
    move-result p0

    .line 163
    if-nez p0, :cond_8

    .line 164
    .line 165
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 166
    .line 167
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 168
    .line 169
    iget-object p0, p0, Ll/dkb;->j7:Lrx/subjects/a;

    .line 170
    .line 171
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    check-cast p0, Lcom/p1/mobile/putong/core/data/MyTabTask;

    .line 176
    .line 177
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MyTabTask;->type:Ljava/lang/String;

    .line 178
    .line 179
    const-string v1, "boost"

    .line 180
    .line 181
    invoke-static {p0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    if-eqz v1, :cond_4

    .line 186
    .line 187
    const-string v0, "upload_photo_award"

    .line 188
    .line 189
    goto :goto_1

    .line 190
    :cond_4
    const-string v1, "selection"

    .line 191
    .line 192
    invoke-static {p0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 193
    .line 194
    .line 195
    move-result v1

    .line 196
    if-eqz v1, :cond_5

    .line 197
    .line 198
    const-string v0, "task_selected"

    .line 199
    .line 200
    goto :goto_1

    .line 201
    :cond_5
    const-string v1, "mbti"

    .line 202
    .line 203
    invoke-static {p0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 204
    .line 205
    .line 206
    move-result v1

    .line 207
    if-eqz v1, :cond_6

    .line 208
    .line 209
    const-string v0, "task_mbti"

    .line 210
    .line 211
    goto :goto_1

    .line 212
    :cond_6
    const-string v1, "game"

    .line 213
    .line 214
    invoke-static {p0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 215
    .line 216
    .line 217
    move-result v1

    .line 218
    if-eqz v1, :cond_7

    .line 219
    .line 220
    const-string v0, "task_game"

    .line 221
    .line 222
    :cond_7
    :goto_1
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 223
    .line 224
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 225
    .line 226
    const-string v2, "exposure"

    .line 227
    .line 228
    const-string v3, "avatar"

    .line 229
    .line 230
    invoke-virtual {v1, p0, v2, v3}, Ll/dkb;->ja(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 231
    .line 232
    .line 233
    :cond_8
    move-object p0, v0

    .line 234
    :goto_2
    const-string v0, "edit_button_status"

    .line 235
    .line 236
    invoke-static {v0, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 237
    .line 238
    .line 239
    move-result-object p0

    .line 240
    filled-new-array {p0}, [Ll/sfj0$a;

    .line 241
    .line 242
    .line 243
    move-result-object p0

    .line 244
    const-string v0, "e_e_self_icon"

    .line 245
    .line 246
    const-string v1, "p_navigation_view"

    .line 247
    .line 248
    invoke-static {v0, v1, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 249
    .line 250
    .line 251
    :cond_9
    return-void
.end method

.method public I()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/iq40;->Y:Landroid/animation/Animator;

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
    iget-object v0, p0, Ll/iq40;->Y:Landroid/animation/Animator;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Ll/iq40;->Y:Landroid/animation/Animator;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public I0(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/iq40;->U:Ll/y6k0;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ll/y6k0;->o(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/iq40;->S()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-static {}, Ll/gra;->p2()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Ll/iq40;->G:Landroid/widget/LinearLayout;

    .line 19
    .line 20
    new-instance v1, Ll/yp40;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/yp40;-><init>(Ll/iq40;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object p0, p0, Ll/iq40;->H:Lv/VText;

    .line 29
    .line 30
    int-to-long v0, p1

    .line 31
    invoke-static {v0, v1}, Ll/iq40;->K(J)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public J()Lv/VImage;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iq40;->U:Ll/y6k0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/y6k0;->v()Lv/VImage;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public J0(I)V
    .locals 2

    .line 1
    invoke-static {}, Ll/spl0;->L()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/iq40;->K:Landroid/widget/LinearLayout;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/iq40;->J:Landroid/view/View;

    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ll/joa;->f4()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    if-lez p1, :cond_1

    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m2:Ll/f4a;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/f4a;->q3()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    iget-object v0, p0, Ll/iq40;->M:Lv/VOnlineIndicator;

    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    iget-object v0, p0, Ll/iq40;->M:Lv/VOnlineIndicator;

    .line 44
    .line 45
    const/4 v1, 0x0

    .line 46
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    :goto_0
    iget-object v0, p0, Ll/iq40;->L:Lv/VText;

    .line 50
    .line 51
    const/16 v1, 0x63

    .line 52
    .line 53
    if-le p1, v1, :cond_2

    .line 54
    .line 55
    const-string p1, "99+"

    .line 56
    .line 57
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string p1, ""

    .line 70
    .line 71
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    .line 80
    .line 81
    :goto_1
    iget-object p1, p0, Ll/iq40;->K:Landroid/widget/LinearLayout;

    .line 82
    .line 83
    new-instance v0, Ll/vp40;

    .line 84
    .line 85
    invoke-direct {v0, p0}, Ll/vp40;-><init>(Ll/iq40;)V

    .line 86
    .line 87
    .line 88
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public K0()V
    .locals 4

    .line 1
    invoke-static {}, Ll/gra;->z2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/gra;->A2()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_0

    .line 14
    .line 15
    :cond_0
    invoke-static {}, Ll/gra;->z2()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-static {}, Ll/e7d0;->f()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_5

    .line 26
    .line 27
    :cond_1
    invoke-virtual {p0}, Ll/iq40;->S()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_5

    .line 32
    .line 33
    invoke-static {}, Ll/gra;->p2()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    goto/16 :goto_0

    .line 40
    .line 41
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->r2:Ll/mk8;

    .line 52
    .line 53
    invoke-virtual {v1}, Ll/mk8;->o3()Lcom/p1/mobile/putong/core/data/RealPicturesBanner;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    if-eqz v1, :cond_4

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBanned()Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-nez v2, :cond_4

    .line 64
    .line 65
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isProfileJailed()Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-nez v2, :cond_4

    .line 70
    .line 71
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFakeUser()Z

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    if-nez v2, :cond_4

    .line 76
    .line 77
    const-string v2, "fake"

    .line 78
    .line 79
    const-string v3, "used"

    .line 80
    .line 81
    filled-new-array {v2, v3}, [Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/RealPicturesBanner;->status:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    if-nez v2, :cond_4

    .line 96
    .line 97
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/RealPicturesBanner;->text:Lcom/p1/mobile/putong/core/data/RealPicturesBannerText;

    .line 98
    .line 99
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/RealPicturesBannerText;->title:Ljava/lang/String;

    .line 100
    .line 101
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    if-nez v2, :cond_4

    .line 106
    .line 107
    iget-object v2, p0, Ll/iq40;->d:Landroid/widget/LinearLayout;

    .line 108
    .line 109
    const/4 v3, 0x1

    .line 110
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 111
    .line 112
    .line 113
    invoke-static {}, Ll/gra;->A2()Z

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    if-eqz v2, :cond_3

    .line 118
    .line 119
    invoke-static {}, Ll/e7d0;->f()Z

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    if-eqz v2, :cond_3

    .line 124
    .line 125
    iget-object v2, p0, Ll/iq40;->d:Landroid/widget/LinearLayout;

    .line 126
    .line 127
    const/4 v3, 0x0

    .line 128
    invoke-static {v2, v3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 129
    .line 130
    .line 131
    iget-object v2, p0, Ll/iq40;->d:Landroid/widget/LinearLayout;

    .line 132
    .line 133
    const/high16 v3, 0x41000000    # 8.0f

    .line 134
    .line 135
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 136
    .line 137
    .line 138
    move-result v3

    .line 139
    invoke-static {v2, v3}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 140
    .line 141
    .line 142
    :cond_3
    iget-object v2, p0, Ll/iq40;->e:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 143
    .line 144
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/RealPicturesBanner;->text:Lcom/p1/mobile/putong/core/data/RealPicturesBannerText;

    .line 145
    .line 146
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/RealPicturesBannerText;->title:Ljava/lang/String;

    .line 147
    .line 148
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 149
    .line 150
    .line 151
    iget-object v2, p0, Ll/iq40;->f:Landroid/widget/TextView;

    .line 152
    .line 153
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/RealPicturesBanner;->text:Lcom/p1/mobile/putong/core/data/RealPicturesBannerText;

    .line 154
    .line 155
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/RealPicturesBannerText;->subTitle:Ljava/lang/String;

    .line 156
    .line 157
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 158
    .line 159
    .line 160
    iget-object v2, p0, Ll/iq40;->g:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 161
    .line 162
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/RealPicturesBanner;->text:Lcom/p1/mobile/putong/core/data/RealPicturesBannerText;

    .line 163
    .line 164
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/RealPicturesBannerText;->button:Ljava/lang/String;

    .line 165
    .line 166
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 167
    .line 168
    .line 169
    iget-object v2, p0, Ll/iq40;->g:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 170
    .line 171
    new-instance v3, Ll/wp40;

    .line 172
    .line 173
    invoke-direct {v3, p0, v1, v0}, Ll/wp40;-><init>(Ll/iq40;Lcom/p1/mobile/putong/core/data/RealPicturesBanner;Lcom/p1/mobile/putong/data/User;)V

    .line 174
    .line 175
    .line 176
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 177
    .line 178
    .line 179
    iget-object v0, p0, Ll/iq40;->d:Landroid/widget/LinearLayout;

    .line 180
    .line 181
    new-instance v2, Ll/xp40;

    .line 182
    .line 183
    invoke-direct {v2}, Ll/xp40;-><init>()V

    .line 184
    .line 185
    .line 186
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 187
    .line 188
    .line 189
    iget-object v0, p0, Ll/iq40;->R:Ll/ip40;

    .line 190
    .line 191
    iget-object v0, v0, Ll/ip40;->b:Ll/yek0;

    .line 192
    .line 193
    invoke-interface {v0}, Ll/yek0;->v()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/RealPicturesBanner;->status:Ljava/lang/String;

    .line 198
    .line 199
    invoke-virtual {p0, v1}, Ll/iq40;->p0(Ljava/lang/String;)Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object p0

    .line 203
    const-string v1, "upload_photo_award_status"

    .line 204
    .line 205
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 206
    .line 207
    .line 208
    move-result-object p0

    .line 209
    filled-new-array {p0}, [Ll/pf60;

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    const-string v1, "e_upload_photo_award"

    .line 214
    .line 215
    invoke-static {v1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 216
    .line 217
    .line 218
    return-void

    .line 219
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 220
    .line 221
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 222
    .line 223
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 228
    .line 229
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 230
    .line 231
    new-instance v2, Ljava/lang/StringBuilder;

    .line 232
    .line 233
    const-string v3, "fake_risk_audit_default_"

    .line 234
    .line 235
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 236
    .line 237
    .line 238
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 239
    .line 240
    .line 241
    move-result-object v3

    .line 242
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object v3

    .line 246
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v2

    .line 253
    invoke-virtual {v1, v2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 254
    .line 255
    .line 256
    move-result-object v1

    .line 257
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/User;->riskAuditUser(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    invoke-virtual {p0, v0}, Ll/iq40;->D0(Lcom/p1/mobile/putong/data/User;)V

    .line 262
    .line 263
    .line 264
    :cond_5
    :goto_0
    return-void
.end method

.method public L0(Lcom/p1/mobile/putong/data/User;)V
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
    iget-object p0, p0, Ll/iq40;->j:Lv/VText;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Moments;->counters:Lcom/p1/mobile/putong/data/MomentCounter;

    .line 14
    .line 15
    iget p1, p1, Lcom/p1/mobile/putong/data/MomentCounter;->receiveMomentLikes:I

    .line 16
    .line 17
    int-to-long v0, p1

    .line 18
    invoke-static {v0, v1}, Ll/iq40;->L(J)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public final M(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/iq40;->V:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-static {v0}, Ll/aw90;->U(Lcom/p1/mobile/putong/data/User;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Ll/gra;->e2()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    iget-object v0, v0, Ll/dkb;->Z3:Ll/wyd0;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ljava/lang/CharSequence;

    .line 26
    .line 27
    const-string v1, "marryMode"

    .line 28
    .line 29
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    :cond_0
    iget-object v0, p0, Ll/iq40;->R:Ll/ip40;

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ll/ip40;->i1(Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    const-string p1, "complete_card_info"

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_1
    iget-object v0, p0, Ll/iq40;->R:Ll/ip40;

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/ip40;->S0()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iget-object v1, p0, Ll/iq40;->R:Ll/ip40;

    .line 50
    .line 51
    const-string v2, "default"

    .line 52
    .line 53
    if-eqz v0, :cond_6

    .line 54
    .line 55
    invoke-virtual {v1, p1}, Ll/ip40;->i1(Landroid/view/View;)V

    .line 56
    .line 57
    .line 58
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 59
    .line 60
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 61
    .line 62
    iget-object p1, p1, Ll/dkb;->j7:Lrx/subjects/a;

    .line 63
    .line 64
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    check-cast p1, Lcom/p1/mobile/putong/core/data/MyTabTask;

    .line 69
    .line 70
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MyTabTask;->type:Ljava/lang/String;

    .line 71
    .line 72
    const-string v0, "boost"

    .line 73
    .line 74
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_2

    .line 79
    .line 80
    const-string v0, "upload_photo_award"

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_2
    const-string v0, "selection"

    .line 84
    .line 85
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-eqz v0, :cond_3

    .line 90
    .line 91
    const-string v0, "task_selected"

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_3
    const-string v0, "mbti"

    .line 95
    .line 96
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-eqz v0, :cond_4

    .line 101
    .line 102
    const-string v0, "task_mbti"

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_4
    const-string v0, "game"

    .line 106
    .line 107
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_5

    .line 112
    .line 113
    const-string v0, "task_game"

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_5
    move-object v0, v2

    .line 117
    :goto_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 118
    .line 119
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 120
    .line 121
    const-string v2, "click"

    .line 122
    .line 123
    const-string v3, "avatar"

    .line 124
    .line 125
    invoke-virtual {v1, p1, v2, v3}, Ll/dkb;->ja(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 126
    .line 127
    .line 128
    move-object p1, v0

    .line 129
    goto :goto_1

    .line 130
    :cond_6
    invoke-virtual {v1}, Ll/ip40;->O0()V

    .line 131
    .line 132
    .line 133
    move-object p1, v2

    .line 134
    :goto_1
    iget-object p0, p0, Ll/iq40;->R:Ll/ip40;

    .line 135
    .line 136
    iget-object p0, p0, Ll/ip40;->b:Ll/yek0;

    .line 137
    .line 138
    invoke-interface {p0}, Ll/yek0;->v()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    const-string v0, "edit_button_status"

    .line 143
    .line 144
    invoke-static {v0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    filled-new-array {p1}, [Ll/sfj0$a;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    const-string v0, "e_e_self_icon"

    .line 153
    .line 154
    invoke-static {v0, p0, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 155
    .line 156
    .line 157
    return-void
.end method

.method public M0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iq40;->U:Ll/y6k0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y6k0;->q(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public N()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/iq40;->X:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Ll/iq40;->X:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Ll/iq40;->X:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final N0(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/iq40;->U:Ll/y6k0;

    .line 2
    .line 3
    instance-of v0, p0, Ll/kfk0;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/y6k0;->m(Lcom/p1/mobile/putong/data/User;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public O()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/iq40;->D:Lv/VOnlineIndicator;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/iq40;->E:Lv/VText;

    .line 8
    .line 9
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public O0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iq40;->U:Ll/y6k0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/y6k0;->s()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public P0(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iput-object p1, p0, Ll/iq40;->V:Lcom/p1/mobile/putong/data/User;

    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 9
    .line 10
    new-instance v1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v2, "fake_risk_audit_default_"

    .line 13
    .line 14
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/User;->riskAuditUser(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object v0, p0, Ll/iq40;->U:Ll/y6k0;

    .line 35
    .line 36
    invoke-interface {v0}, Ll/y6k0;->t()Lv/VText;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ll/iq40;->E0(Lcom/p1/mobile/putong/data/User;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, p1}, Ll/iq40;->z0(Lcom/p1/mobile/putong/data/User;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, p1}, Ll/iq40;->y0(Lcom/p1/mobile/putong/data/User;)V

    .line 52
    .line 53
    .line 54
    invoke-direct {p0}, Ll/iq40;->P()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, p1}, Ll/iq40;->B0(Lcom/p1/mobile/putong/data/User;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, p1}, Ll/iq40;->M0(Lcom/p1/mobile/putong/data/User;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, p1}, Ll/iq40;->A0(Lcom/p1/mobile/putong/data/User;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0, p1}, Ll/iq40;->D0(Lcom/p1/mobile/putong/data/User;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Ll/iq40;->K0()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, p1}, Ll/iq40;->N0(Lcom/p1/mobile/putong/data/User;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final Q(Ljava/lang/String;Ll/bkj0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/bkj0<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/iq40;->U:Ll/y6k0;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/y6k0;->e(Ljava/lang/String;Ll/bkj0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final R()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/iq40;->U:Ll/y6k0;

    .line 2
    .line 3
    new-instance v1, Ll/bq40;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/bq40;-><init>(Ll/iq40;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ll/y6k0;->n(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/iq40;->R:Ll/ip40;

    .line 12
    .line 13
    iget-object v0, v0, Ll/ip40;->b:Ll/yek0;

    .line 14
    .line 15
    invoke-interface {v0}, Ll/yek0;->v()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object p0, p0, Ll/iq40;->R:Ll/ip40;

    .line 20
    .line 21
    iget-object p0, p0, Ll/ip40;->b:Ll/yek0;

    .line 22
    .line 23
    invoke-interface {p0}, Ll/yek0;->v()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v1, "source_page"

    .line 28
    .line 29
    invoke-static {v1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    filled-new-array {p0}, [Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string v1, "e_set_my_state"

    .line 38
    .line 39
    invoke-static {v1, v0, p0}, Ll/sfj0;->l(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public S()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/iq40;->R:Ll/ip40;

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
    iget-object p0, p0, Ll/iq40;->R:Ll/ip40;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ip40;->R0()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public final synthetic T(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iq40;->R:Ll/ip40;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ip40;->g1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic U(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iq40;->R:Ll/ip40;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ip40;->l1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic V(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iq40;->R:Ll/ip40;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ip40;->k1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic W(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iq40;->R:Ll/ip40;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ip40;->Q0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic X(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iq40;->R:Ll/ip40;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ip40;->P0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic Y(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/iq40;->U:Ll/y6k0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/y6k0;->r()Z

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
    iget-object p0, p0, Ll/iq40;->R:Ll/ip40;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/ip40;->i1(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic Z(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->p2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/iq40;->M(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object p1, p0, Ll/iq40;->R:Ll/ip40;

    .line 12
    .line 13
    iget-object p1, p1, Ll/ip40;->b:Ll/yek0;

    .line 14
    .line 15
    invoke-interface {p1}, Ll/yek0;->v()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const/4 v0, 0x0

    .line 20
    new-array v0, v0, [Ll/sfj0$a;

    .line 21
    .line 22
    const-string v1, "e_navigation_profile_edit_button"

    .line 23
    .line 24
    invoke-static {v1, p1, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/iq40;->R:Ll/ip40;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/ip40;->O0()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic a0(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/iq40;->R:Ll/ip40;

    .line 2
    .line 3
    iget-object p1, p1, Ll/ip40;->b:Ll/yek0;

    .line 4
    .line 5
    invoke-interface {p1}, Ll/yek0;->v()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/4 v0, 0x0

    .line 10
    new-array v0, v0, [Ll/sfj0$a;

    .line 11
    .line 12
    const-string v1, "e_content_likes"

    .line 13
    .line 14
    invoke-static {v1, p1, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->qo(Lcom/p1/mobile/android/app/Act;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic d0(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/iq40;->R:Ll/ip40;

    .line 2
    .line 3
    iget-object p1, p1, Ll/ip40;->b:Ll/yek0;

    .line 4
    .line 5
    invoke-interface {p1}, Ll/yek0;->v()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Ll/iq40;->R:Ll/ip40;

    .line 10
    .line 11
    iget-object v0, v0, Ll/ip40;->b:Ll/yek0;

    .line 12
    .line 13
    invoke-interface {v0}, Ll/yek0;->v()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "source_page"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    filled-new-array {v0}, [Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "e_set_my_state"

    .line 28
    .line 29
    invoke-static {v1, p1, v0}, Ll/sfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const-string v1, "p_navigation_view"

    .line 41
    .line 42
    invoke-interface {p1, v0, v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->j9(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ll/iq40;->N()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/iq40;->I()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic e0(Ljava/lang/String;Ll/bkj0;)V
    .locals 1

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    iget-object v0, p2, Ll/bkj0;->a:Ljava/lang/Object;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    check-cast v0, Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Ll/iq40;->W:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p0, p1, p2}, Ll/iq40;->Q(Ljava/lang/String;Ll/bkj0;)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->ko()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_2

    .line 24
    .line 25
    iget-object p0, p0, Ll/iq40;->U:Ll/y6k0;

    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    invoke-interface {p0, p1}, Ll/y6k0;->b(Z)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    :goto_0
    const-string p1, ""

    .line 33
    .line 34
    iput-object p1, p0, Ll/iq40;->W:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/iq40;->R()V

    .line 37
    .line 38
    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->ko()Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_2

    .line 48
    .line 49
    iget-object p0, p0, Ll/iq40;->U:Ll/y6k0;

    .line 50
    .line 51
    const/4 p1, 0x1

    .line 52
    invoke-interface {p0, p1}, Ll/y6k0;->b(Z)V

    .line 53
    .line 54
    .line 55
    :cond_2
    return-void
.end method

.method public final synthetic f0(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "me_like_max"

    .line 6
    .line 7
    invoke-static {p0, p1}, Ll/tr90;->A(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->F6()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const-string p1, "me_like"

    .line 22
    .line 23
    :goto_0
    const-string p0, "slot_source"

    .line 24
    .line 25
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    filled-new-array {p0}, [Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string p1, "e_me_verify_guide"

    .line 34
    .line 35
    const-string v0, "p_navigation_view"

    .line 36
    .line 37
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic g0([I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/iq40;->P:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    new-array v1, v0, [I

    .line 9
    .line 10
    iget-object v2, p0, Ll/iq40;->n:Landroid/widget/LinearLayout;

    .line 11
    .line 12
    invoke-virtual {v2, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 13
    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    aget v1, v1, v2

    .line 17
    .line 18
    aget p1, p1, v2

    .line 19
    .line 20
    add-int/2addr v1, p1

    .line 21
    sget p1, Ll/qa00;->C:I

    .line 22
    .line 23
    sub-int/2addr v1, p1

    .line 24
    div-int/2addr v1, v0

    .line 25
    iget-object p1, p0, Ll/iq40;->a:Lv/VFrame;

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    sub-int/2addr v1, p1

    .line 32
    iget-object p0, p0, Ll/iq40;->P:Landroid/view/View;

    .line 33
    .line 34
    invoke-static {p0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final synthetic h0(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isIdAndPicBothVerified()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-nez p2, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isStudentVerified()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const/4 p2, 0x0

    .line 38
    invoke-static {p0, p2}, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterAct;->Y1(Landroid/content/Context;Z)Landroid/content/Intent;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 43
    .line 44
    .line 45
    const-string p0, "e_mine_verification_bubble"

    .line 46
    .line 47
    const-string p1, "p_new_navigation"

    .line 48
    .line 49
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public final synthetic i0(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterAct;->Y1(Landroid/content/Context;Z)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 25
    .line 26
    .line 27
    const-string p0, "e_mine_verification_bubble"

    .line 28
    .line 29
    const-string p1, "p_new_navigation"

    .line 30
    .line 31
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ip40;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/iq40;->G(Ll/ip40;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/iq40;->F(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-static {}, Ll/gra;->p2()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/kfk0;

    .line 12
    .line 13
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-direct {v0, v1}, Ll/kfk0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll/iq40;->U:Ll/y6k0;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-static {}, Ll/e7d0;->f()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    new-instance v0, Ll/w33;

    .line 30
    .line 31
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-direct {v0, v1}, Ll/w33;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Ll/iq40;->U:Ll/y6k0;

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    invoke-virtual {p0}, Ll/iq40;->S()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    new-instance v0, Ll/kfk0;

    .line 48
    .line 49
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-direct {v0, v1}, Ll/kfk0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Ll/iq40;->U:Ll/y6k0;

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_2
    new-instance v0, Ll/qtd;

    .line 60
    .line 61
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-direct {v0, v1}, Ll/qtd;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 66
    .line 67
    .line 68
    iput-object v0, p0, Ll/iq40;->U:Ll/y6k0;

    .line 69
    .line 70
    :goto_0
    iget-object v0, p0, Ll/iq40;->U:Ll/y6k0;

    .line 71
    .line 72
    iget-object v1, p0, Ll/iq40;->c:Landroid/widget/FrameLayout;

    .line 73
    .line 74
    invoke-interface {v0, p1, v1}, Ll/y6k0;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iget-object v0, p0, Ll/iq40;->c:Landroid/widget/FrameLayout;

    .line 79
    .line 80
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 81
    .line 82
    .line 83
    invoke-static {}, Ll/gra;->p2()Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_3

    .line 88
    .line 89
    invoke-static {}, Ll/e7d0;->f()Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-eqz v0, :cond_3

    .line 94
    .line 95
    sget v0, Ll/qa00;->h:I

    .line 96
    .line 97
    invoke-static {p1, v0}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 98
    .line 99
    .line 100
    invoke-static {p1, v0}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 101
    .line 102
    .line 103
    const/high16 v0, 0x41880000    # 17.0f

    .line 104
    .line 105
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    invoke-static {p1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 110
    .line 111
    .line 112
    const/high16 v0, 0x41900000    # 18.0f

    .line 113
    .line 114
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    invoke-static {p1, v0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 119
    .line 120
    .line 121
    :cond_3
    invoke-direct {p0}, Ll/iq40;->r()V

    .line 122
    .line 123
    .line 124
    return-object p2
.end method

.method public final synthetic j0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/iq40;->R:Ll/ip40;

    .line 2
    .line 3
    iget-object p1, p1, Ll/ip40;->b:Ll/yek0;

    .line 4
    .line 5
    invoke-interface {p1}, Ll/yek0;->v()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "e_ideal_exposure_complete_profile"

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string p1, "tantan://profile/edit?mode=dating&from=from_ideal_type_mine_tab_guide"

    .line 19
    .line 20
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {p0, p1}, Ll/xwa;->D(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic k0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/iq40;->R:Ll/ip40;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "diamond"

    .line 12
    .line 13
    invoke-static {v0}, Ll/oql0;->a(Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->c2(Landroid/content/Context;I)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic l0(Landroid/view/View;)V
    .locals 9

    .line 1
    const-string p1, "e_my_moment"

    .line 2
    .line 3
    const-string v0, "p_navigation_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    const-string v7, "pageid"

    .line 29
    .line 30
    const/4 v8, 0x0

    .line 31
    const-string v3, "from_profile"

    .line 32
    .line 33
    const/4 v4, -0x1

    .line 34
    const-string v5, ""

    .line 35
    .line 36
    const/4 v6, 0x2

    .line 37
    invoke-interface/range {v0 .. v8}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->bb(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;Z)Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic m0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iq40;->R:Ll/ip40;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ip40;->h1(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic n0()V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/f5g;->h(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic o0(Lcom/p1/mobile/putong/core/data/RealPicturesBanner;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p3, p0, Ll/iq40;->R:Ll/ip40;

    .line 2
    .line 3
    iget-object p3, p3, Ll/ip40;->b:Ll/yek0;

    .line 4
    .line 5
    invoke-interface {p3}, Ll/yek0;->v()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/RealPicturesBanner;->status:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/iq40;->p0(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v0, "upload_photo_award_status"

    .line 16
    .line 17
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    filled-new-array {p1}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const-string v0, "e_upload_photo_award"

    .line 26
    .line 27
    invoke-static {v0, p3, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isBanned()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    const/4 p3, 0x1

    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    invoke-static {p3}, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->p2(Z)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isFakeUser()Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_1

    .line 46
    .line 47
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    sget v1, Lcom/p1/mobile/putong/core/R$string;->el:I

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v1, Ll/zp40;

    .line 66
    .line 67
    invoke-direct {v1, p0}, Ll/zp40;-><init>(Ll/iq40;)V

    .line 68
    .line 69
    .line 70
    invoke-static {p1, p3, p2, v0, v1}, Ll/qtk;->V0(Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/data/Media;Ljava/lang/CharSequence;Ljava/lang/Runnable;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_1
    iget-object p1, p0, Ll/iq40;->R:Ll/ip40;

    .line 75
    .line 76
    invoke-virtual {p1}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskCenterAct;->Z1(Landroid/content/Context;)Landroid/content/Intent;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public final p0(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    sparse-switch p0, :sswitch_data_0

    .line 6
    .line 7
    .line 8
    goto :goto_1

    .line 9
    :sswitch_0
    const-string p0, "default"

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const-string p0, "upload"

    .line 18
    .line 19
    return-object p0

    .line 20
    :sswitch_1
    const-string p0, "using"

    .line 21
    .line 22
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    const-string p0, "boosting"

    .line 29
    .line 30
    return-object p0

    .line 31
    :sswitch_2
    const-string p0, "stock_pending"

    .line 32
    .line 33
    :goto_0
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    goto :goto_1

    .line 37
    :sswitch_3
    const-string p0, "used"

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :sswitch_4
    const-string p0, "fake"

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :sswitch_5
    const-string p0, "rejected"

    .line 44
    .line 45
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p0, :cond_0

    .line 50
    .line 51
    const-string p0, "failed"

    .line 52
    .line 53
    return-object p0

    .line 54
    :sswitch_6
    const-string p0, "pending"

    .line 55
    .line 56
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-eqz p0, :cond_0

    .line 61
    .line 62
    const-string p0, "review"

    .line 63
    .line 64
    return-object p0

    .line 65
    :sswitch_7
    const-string p0, "passed"

    .line 66
    .line 67
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_0

    .line 72
    .line 73
    const-string p0, "start_boost"

    .line 74
    .line 75
    return-object p0

    .line 76
    :cond_0
    :goto_1
    const-string p0, ""

    .line 77
    .line 78
    return-object p0

    .line 79
    :sswitch_data_0
    .sparse-switch
        -0x3b544f90 -> :sswitch_7
        -0x28af7669 -> :sswitch_6
        -0x2444eb82 -> :sswitch_5
        0x2fd755 -> :sswitch_4
        0x36ebbd -> :sswitch_3
        0x565b16e -> :sswitch_2
        0x6a69c84 -> :sswitch_1
        0x5c13d641 -> :sswitch_0
    .end sparse-switch
.end method

.method public q0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/iq40;->U:Ll/y6k0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/y6k0;->c()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 15
    .line 16
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-interface {v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Tg()Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    new-instance v2, Ll/aq40;

    .line 33
    .line 34
    invoke-direct {v2, p0, v0}, Ll/aq40;-><init>(Ll/iq40;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->cd()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_0

    .line 53
    .line 54
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->ko()Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-nez v0, :cond_0

    .line 63
    .line 64
    iget-object p0, p0, Ll/iq40;->U:Ll/y6k0;

    .line 65
    .line 66
    const/4 v0, 0x0

    .line 67
    invoke-interface {p0, v0}, Ll/y6k0;->b(Z)V

    .line 68
    .line 69
    .line 70
    :cond_0
    return-void
.end method

.method public final r0(J)V
    .locals 3

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/spl0;->K()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/iq40;->r:Lv/VText;

    .line 14
    .line 15
    const-wide/16 v1, 0x3e7

    .line 16
    .line 17
    invoke-static {p1, p2, v1, v2}, Ljava/lang/Math;->min(JJ)J

    .line 18
    .line 19
    .line 20
    move-result-wide p1

    .line 21
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/iq40;->r:Lv/VText;

    .line 29
    .line 30
    const/4 p1, 0x1

    .line 31
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    iget-object p0, p0, Ll/iq40;->r:Lv/VText;

    .line 36
    .line 37
    const/4 p1, 0x0

    .line 38
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public s0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iq40;->U:Ll/y6k0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/y6k0;->f()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public t0()V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/j;->U:Ll/jxd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    new-instance v0, Lv/VText;

    .line 21
    .line 22
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-direct {v0, v1}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 27
    .line 28
    .line 29
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    .line 30
    .line 31
    sget v2, Ll/bnl0;->e:I

    .line 32
    .line 33
    invoke-direct {v1, v2, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 37
    .line 38
    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-interface {v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->cd()Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    const-string v1, "\u5206\u4eab\u65e0\u538b\u529b\uff0c24\u5c0f\u65f6\u540e\u81ea\u52a8\u6d88\u5931"

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    const-string v1, "\u652f\u6301\u4ec5\u5bf9\u597d\u53cb24\u5c0f\u65f6\u5185\u53ef\u89c1"

    .line 53
    .line 54
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    sget v1, Ll/qa00;->m:I

    .line 58
    .line 59
    const/high16 v2, 0x41200000    # 10.0f

    .line 60
    .line 61
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    invoke-virtual {v0, v1, v3, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 70
    .line 71
    .line 72
    const/4 v1, -0x1

    .line 73
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    const/4 v2, 0x1

    .line 81
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 82
    .line 83
    .line 84
    new-instance v1, Lcom/p1/mobile/android/ui/bubble/a;

    .line 85
    .line 86
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    invoke-direct {v1, v3}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->s(Landroid/view/View;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;->e(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    sget v3, Ll/c9c0;->I:I

    .line 110
    .line 111
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    filled-new-array {v1}, [I

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    const/high16 v1, 0x41600000    # 14.0f

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    const-wide/16 v3, 0x1388

    .line 130
    .line 131
    invoke-virtual {v0, v3, v4}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;->y(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    sget v1, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 140
    .line 141
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    sget v1, Ll/qa00;->e:I

    .line 146
    .line 147
    neg-int v1, v1

    .line 148
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    iget-object v2, p0, Ll/iq40;->U:Ll/y6k0;

    .line 157
    .line 158
    invoke-interface {v2}, Ll/y6k0;->a()Landroid/view/View;

    .line 159
    .line 160
    .line 161
    move-result-object v2

    .line 162
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/android/ui/bubble/d;->t(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    iput-object v0, p0, Ll/iq40;->X:Ljava/lang/String;

    .line 167
    .line 168
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 169
    .line 170
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 171
    .line 172
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/j;->U:Ll/jxd0;

    .line 173
    .line 174
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 175
    .line 176
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    return-void
.end method

.method public u0()V
    .locals 3

    .line 1
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/aw90;->R()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->m6()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-ltz v0, :cond_2

    .line 21
    .line 22
    iget-object v0, p0, Ll/iq40;->O:Lv/VLinear;

    .line 23
    .line 24
    const/4 v2, 0x1

    .line 25
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/iq40;->P:Landroid/view/View;

    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->F6()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iget-object v1, p0, Ll/iq40;->Q:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 42
    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    new-instance v0, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    const-string v2, "\u4eca\u5929\u6536\u83b7"

    .line 48
    .line 49
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-static {}, Ll/gra;->j1()I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string v2, "/"

    .line 60
    .line 61
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-static {}, Ll/gra;->j1()I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const-string v2, "\u4e2a\u559c\u6b22\uff0c\u5df2\u9690\u85cf\u5361\u7247\u6682\u505c\u66dd\u5149"

    .line 72
    .line 73
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 85
    .line 86
    const-string v2, "\u4eca\u65e5\u6536\u83b7"

    .line 87
    .line 88
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 92
    .line 93
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 94
    .line 95
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->m6()I

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    const-string v2, "\u4e2a\u559c\u6b22\uff0c\u672a\u8ba4\u8bc1\u6bcf\u65e5\u53ef\u83b7"

    .line 103
    .line 104
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-static {}, Ll/gra;->j1()I

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    const-string v2, "\u4e2a\u559c\u6b22"

    .line 115
    .line 116
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    .line 125
    .line 126
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 127
    .line 128
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 129
    .line 130
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->F6()Z

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    if-eqz v0, :cond_1

    .line 135
    .line 136
    const-string v0, "me_like_max"

    .line 137
    .line 138
    goto :goto_1

    .line 139
    :cond_1
    const-string v0, "me_like"

    .line 140
    .line 141
    :goto_1
    const-string v1, "slot_source"

    .line 142
    .line 143
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    filled-new-array {v0}, [Ll/pf60;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    const-string v1, "e_me_verify_guide"

    .line 152
    .line 153
    const-string v2, "p_navigation_view"

    .line 154
    .line 155
    invoke-static {v1, v2, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 156
    .line 157
    .line 158
    iget-object v0, p0, Ll/iq40;->O:Lv/VLinear;

    .line 159
    .line 160
    new-instance v1, Ll/cq40;

    .line 161
    .line 162
    invoke-direct {v1, p0}, Ll/cq40;-><init>(Ll/iq40;)V

    .line 163
    .line 164
    .line 165
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 166
    .line 167
    .line 168
    iget-object v0, p0, Ll/iq40;->n:Landroid/widget/LinearLayout;

    .line 169
    .line 170
    new-instance v1, Ll/dq40;

    .line 171
    .line 172
    invoke-direct {v1, p0}, Ll/dq40;-><init>(Ll/iq40;)V

    .line 173
    .line 174
    .line 175
    invoke-static {v0, v1}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 176
    .line 177
    .line 178
    return-void

    .line 179
    :cond_2
    iget-object p0, p0, Ll/iq40;->O:Lv/VLinear;

    .line 180
    .line 181
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 182
    .line 183
    .line 184
    return-void
.end method

.method public v0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/iq40;->U:Ll/y6k0;

    .line 2
    .line 3
    instance-of v0, v0, Ll/kfk0;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    iget-object v0, v0, Ll/dkb;->w6:Ll/jxd0;

    .line 12
    .line 13
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 21
    .line 22
    iget-object v0, v0, Ll/dkb;->x6:Ll/byd0;

    .line 23
    .line 24
    const-wide/16 v1, 0x0

    .line 25
    .line 26
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/iq40;->U:Ll/y6k0;

    .line 34
    .line 35
    check-cast p0, Ll/kfk0;

    .line 36
    .line 37
    iget-object v0, p0, Ll/kfk0;->c:Lv/VLinear;

    .line 38
    .line 39
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    xor-int/lit8 v0, v0, 0x1

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Ll/kfk0;->W(Z)V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method public w0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iq40;->U:Ll/y6k0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/y6k0;->u()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public x0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/iq40;->W:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/iq40;->R:Ll/ip40;

    .line 10
    .line 11
    iget-object v0, v0, Ll/ip40;->b:Ll/yek0;

    .line 12
    .line 13
    invoke-interface {v0}, Ll/yek0;->v()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "state_id"

    .line 18
    .line 19
    iget-object p0, p0, Ll/iq40;->W:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    filled-new-array {p0}, [Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string v1, "e_my_state"

    .line 30
    .line 31
    invoke-static {v1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public final y0(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iq40;->U:Ll/y6k0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y6k0;->l(Lcom/p1/mobile/putong/data/User;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final z0(Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/iq40;->J()Lv/VImage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/nrb0;->b()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x1

    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    invoke-static {p1}, Lcom/p1/mobile/putong/core/util/CertificationUtil;->h(Lcom/p1/mobile/putong/data/User;)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/4 v3, -0x1

    .line 17
    if-eq v1, v3, :cond_0

    .line 18
    .line 19
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 v1, 0x0

    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    :goto_0
    new-instance v1, Ll/eq40;

    .line 31
    .line 32
    invoke-direct {v1, p0, p1}, Ll/eq40;-><init>(Ll/iq40;Lcom/p1/mobile/putong/data/User;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    sget p0, Ll/dbc0;->Du:I

    .line 49
    .line 50
    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isStudentVerified()Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-eqz p1, :cond_3

    .line 59
    .line 60
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    sget p0, Ll/dbc0;->Is:I

    .line 64
    .line 65
    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_3
    sget p1, Ll/dbc0;->Nq:I

    .line 70
    .line 71
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 72
    .line 73
    .line 74
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    new-instance p1, Ll/fq40;

    .line 78
    .line 79
    invoke-direct {p1, p0}, Ll/fq40;-><init>(Ll/iq40;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method
