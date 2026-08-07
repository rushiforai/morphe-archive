.class public Ll/jbi;
.super Ll/yqg;
.source "SourceFile"


# instance fields
.field public E0:Lv/VText;

.field public F0:Lv/VText;

.field public G0:Lv/VImage;

.field public H0:Landroid/view/View;

.field public I0:Lv/VText;

.field public J:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public J0:Lv/VImage;

.field public K:Landroid/view/View;

.field public K0:Landroid/view/View;

.field public L:Landroid/widget/LinearLayout;

.field public L0:Lv/VText;

.field public M:Lv/VImage;

.field public M0:Lv/VImage;

.field public N:Lv/VText;

.field public N0:Lv/VText;

.field public O:Lv/VImage;

.field public O0:Lv/VImage;

.field public P:Lv/VImage;

.field public P0:Lv/VDraweeView;

.field public Q:Landroid/view/View;

.field public Q0:Lv/VDraweeView;

.field public R:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public R0:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

.field public S:Landroid/view/View;

.field public S0:Landroid/view/View;

.field public T:Lcom/p1/mobile/putong/newui/view/InnerClickSpanTextView;

.field public T0:Lv/VText;

.field public U:Landroid/widget/FrameLayout;

.field public U0:Lv/VImage;

.field public V:Lv/VText;

.field public V0:Landroid/widget/LinearLayout;

.field public W:Landroid/widget/LinearLayout;

.field public W0:Landroid/widget/LinearLayout;

.field public X:Lv/VText;

.field public X0:Landroid/view/View;

.field public Y:Lv/VText;

.field public Y0:Landroid/widget/LinearLayout;

.field public Z:Landroid/widget/LinearLayout;

.field public Z0:Lv/VEditText;

.field public a1:Landroid/widget/TextView;

.field public b1:Lv/VLinear;

.field public c1:Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;

.field public d1:Z

.field public e1:Z

.field public f1:Z

.field public g1:Z

.field public h1:Ll/mxh;

.field public i1:Ll/qai;

.field public j1:Ll/x20;

.field public k0:Lv/VText;

.field public k1:Z

.field public l1:Z

.field public m1:I

.field public n1:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/feed/ui/PreviewVideoLikeImageView;",
            ">;"
        }
    .end annotation
.end field

.field public p0:Lv/VText;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/data/Moment;ZZLcom/p1/mobile/android/app/Act;Ll/mxh;)V
    .locals 0

    .line 1
    invoke-direct {p0, p4}, Ll/yqg;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    const/4 p4, -0x1

    .line 5
    iput p4, p0, Ll/jbi;->m1:I

    .line 6
    .line 7
    new-instance p4, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {p4}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p4, p0, Ll/jbi;->n1:Ljava/util/ArrayList;

    .line 13
    .line 14
    iput-object p1, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 15
    .line 16
    iput-boolean p2, p0, Ll/jbi;->k1:Z

    .line 17
    .line 18
    iput-boolean p3, p0, Ll/jbi;->l1:Z

    .line 19
    .line 20
    const-string p2, "video"

    .line 21
    .line 22
    iput-object p2, p0, Ll/yqg;->x:Ljava/lang/String;

    .line 23
    .line 24
    iput-object p5, p0, Ll/jbi;->h1:Ll/mxh;

    .line 25
    .line 26
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    if-eqz p2, :cond_0

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 33
    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p2, p1}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Ll/yqg;->B:Lcom/p1/mobile/putong/data/User;

    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public static synthetic A0(Ll/jbi;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jbi;->Y0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic B0(Ll/jbi;Lcom/p1/mobile/putong/data/Music;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jbi;->U0(Lcom/p1/mobile/putong/data/Music;)V

    return-void
.end method

.method public static synthetic C0(Ll/jbi;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jbi;->V0(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic D0(Ll/jbi;)Ll/x20;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jbi;->j1:Ll/x20;

    return-object p0
.end method

.method public static bridge synthetic E0(Ll/jbi;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/jbi;->g1:Z

    return p0
.end method

.method public static bridge synthetic F0(Ll/jbi;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/jbi;->g1:Z

    return-void
.end method

.method public static bridge synthetic G0(Ll/jbi;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/jbi;->f1:Z

    return-void
.end method

.method public static bridge synthetic H0(Ll/jbi;)Ll/qai;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jbi;->Q0()Ll/qai;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic I0(Ll/jbi;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jbi;->d1(I)V

    return-void
.end method

.method public static bridge synthetic J0(Ll/jbi;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jbi;->s1(Z)V

    return-void
.end method

.method public static bridge synthetic K0(Ll/jbi;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jbi;->v1()V

    return-void
.end method

.method private R0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-static {v0}, Ll/at0;->d(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Ll/cmg;->q()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    return-void

    .line 17
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/jbi;->T0:Lv/VText;

    .line 18
    .line 19
    const/16 v1, 0x8

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/jbi;->S0:Landroid/view/View;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/jbi;->U:Landroid/widget/FrameLayout;

    .line 30
    .line 31
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public static synthetic u0(Ll/jbi;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jbi;->c1()V

    return-void
.end method

.method public static synthetic v0(Ll/jbi;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jbi;->a1(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic w0(Ll/jbi;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jbi;->b1(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic x0(Ll/jbi;Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jbi;->Z0(Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;)V

    return-void
.end method

.method public static synthetic y0(Ll/jbi;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jbi;->X0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z0(Ll/jbi;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jbi;->W0(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public D()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yqg;->H:Ll/ogh;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-static {}, Ll/cmg;->P()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/yqg;->r0()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    iget-object v1, p0, Ll/yqg;->H:Ll/ogh;

    .line 22
    .line 23
    iget-object v1, v1, Ll/ogh;->h:Ljava/lang/String;

    .line 24
    .line 25
    iget-object p0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v0, v1, p0}, Ll/ksg;->I0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    invoke-super {p0}, Ll/yqg;->D()V

    .line 34
    .line 35
    .line 36
    :cond_2
    :goto_0
    return-void
.end method

.method public H()Landroid/view/View;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, v1}, Ll/jbi;->L0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0}, Ll/jbi;->N0()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/jbi;->M0()V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ll/cmg;->R()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/jbi;->p1()V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Ll/jbi;->V:Lv/VText;

    .line 28
    .line 29
    const/high16 v2, 0x41800000    # 16.0f

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Ll/jbi;->T:Lcom/p1/mobile/putong/newui/view/InnerClickSpanTextView;

    .line 35
    .line 36
    const/high16 v2, 0x41600000    # 14.0f

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 39
    .line 40
    .line 41
    :cond_0
    invoke-static {}, Ll/cmg;->o()Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_1

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    invoke-virtual {p0, v1}, Ll/jbi;->o1(Z)V

    .line 49
    .line 50
    .line 51
    iget-object v2, p0, Ll/jbi;->S:Landroid/view/View;

    .line 52
    .line 53
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Ll/jbi;->R:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 57
    .line 58
    const/high16 v2, 0x41c00000    # 24.0f

    .line 59
    .line 60
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    invoke-static {v1, v2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 65
    .line 66
    .line 67
    :cond_1
    invoke-static {}, Ll/j4h;->h()Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-eqz v1, :cond_2

    .line 72
    .line 73
    iget-object p0, p0, Ll/jbi;->X:Lv/VText;

    .line 74
    .line 75
    sget v1, Ll/lbc0;->W2:I

    .line 76
    .line 77
    invoke-virtual {p0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 78
    .line 79
    .line 80
    :cond_2
    return-object v0
.end method

.method public L0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/kbi;->b(Ll/jbi;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public M0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jbi;->P0:Lv/VDraweeView;

    .line 2
    .line 3
    iput-object v0, p0, Ll/yqg;->b:Lv/VDraweeView;

    .line 4
    .line 5
    iget-object v0, p0, Ll/jbi;->Q0:Lv/VDraweeView;

    .line 6
    .line 7
    iput-object v0, p0, Ll/yqg;->c:Lv/VDraweeView;

    .line 8
    .line 9
    iget-object v0, p0, Ll/jbi;->R0:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 10
    .line 11
    iput-object v0, p0, Ll/yqg;->d:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;

    .line 12
    .line 13
    iget-object v0, p0, Ll/jbi;->V:Lv/VText;

    .line 14
    .line 15
    iput-object v0, p0, Ll/yqg;->e:Lv/VText;

    .line 16
    .line 17
    iget-object v0, p0, Ll/jbi;->T0:Lv/VText;

    .line 18
    .line 19
    iput-object v0, p0, Ll/yqg;->f:Lv/VText;

    .line 20
    .line 21
    iget-object v0, p0, Ll/jbi;->T:Lcom/p1/mobile/putong/newui/view/InnerClickSpanTextView;

    .line 22
    .line 23
    iput-object v0, p0, Ll/yqg;->g:Lv/VText;

    .line 24
    .line 25
    iget-object v0, p0, Ll/jbi;->O0:Lv/VImage;

    .line 26
    .line 27
    iput-object v0, p0, Ll/yqg;->h:Lv/VImage;

    .line 28
    .line 29
    iget-object v0, p0, Ll/jbi;->N0:Lv/VText;

    .line 30
    .line 31
    iput-object v0, p0, Ll/yqg;->i:Lv/VText;

    .line 32
    .line 33
    iget-object v0, p0, Ll/jbi;->L0:Lv/VText;

    .line 34
    .line 35
    iput-object v0, p0, Ll/yqg;->k:Lv/VText;

    .line 36
    .line 37
    iget-object v0, p0, Ll/jbi;->M0:Lv/VImage;

    .line 38
    .line 39
    iput-object v0, p0, Ll/yqg;->j:Lv/VImage;

    .line 40
    .line 41
    iget-object v0, p0, Ll/jbi;->V0:Landroid/widget/LinearLayout;

    .line 42
    .line 43
    iput-object v0, p0, Ll/yqg;->l:Landroid/widget/LinearLayout;

    .line 44
    .line 45
    iget-object v0, p0, Ll/jbi;->W0:Landroid/widget/LinearLayout;

    .line 46
    .line 47
    iput-object v0, p0, Ll/yqg;->m:Landroid/widget/LinearLayout;

    .line 48
    .line 49
    iget-object v0, p0, Ll/jbi;->Z0:Lv/VEditText;

    .line 50
    .line 51
    iput-object v0, p0, Ll/yqg;->n:Lv/VEditText;

    .line 52
    .line 53
    iget-object v0, p0, Ll/jbi;->a1:Landroid/widget/TextView;

    .line 54
    .line 55
    iput-object v0, p0, Ll/yqg;->o:Landroid/widget/TextView;

    .line 56
    .line 57
    iget-object v0, p0, Ll/jbi;->K:Landroid/view/View;

    .line 58
    .line 59
    iput-object v0, p0, Ll/yqg;->a:Landroid/view/View;

    .line 60
    .line 61
    iget-object v0, p0, Ll/jbi;->L:Landroid/widget/LinearLayout;

    .line 62
    .line 63
    iput-object v0, p0, Ll/yqg;->p:Landroid/widget/LinearLayout;

    .line 64
    .line 65
    iget-object v0, p0, Ll/jbi;->R:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 66
    .line 67
    iput-object v0, p0, Ll/yqg;->t:Landroid/view/View;

    .line 68
    .line 69
    iget-object v0, p0, Ll/jbi;->N:Lv/VText;

    .line 70
    .line 71
    iput-object v0, p0, Ll/yqg;->r:Landroid/widget/TextView;

    .line 72
    .line 73
    iget-object v0, p0, Ll/jbi;->M:Lv/VImage;

    .line 74
    .line 75
    iput-object v0, p0, Ll/yqg;->q:Lv/VImage;

    .line 76
    .line 77
    iget-object v0, p0, Ll/jbi;->P:Lv/VImage;

    .line 78
    .line 79
    iput-object v0, p0, Ll/yqg;->s:Lv/VImage;

    .line 80
    .line 81
    iget-object v0, p0, Ll/jbi;->Q:Landroid/view/View;

    .line 82
    .line 83
    iput-object v0, p0, Ll/yqg;->u:Landroid/view/View;

    .line 84
    .line 85
    iget-object v0, p0, Ll/jbi;->Y0:Landroid/widget/LinearLayout;

    .line 86
    .line 87
    iput-object v0, p0, Ll/yqg;->v:Landroid/widget/LinearLayout;

    .line 88
    .line 89
    return-void
.end method

.method public final N0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yqg;->B:Lcom/p1/mobile/putong/data/User;

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
    iget-object v0, p0, Ll/yqg;->B:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Ll/kyi;->a(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p0, v0}, Ll/jbi;->n1(Z)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Ll/j4h;->h()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    iget-object v0, p0, Ll/jbi;->M0:Lv/VImage;

    .line 28
    .line 29
    sget v1, Ll/lbc0;->F5:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/jbi;->J0:Lv/VImage;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/yqg;->A()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->n5:I

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iget-object p0, p0, Ll/jbi;->I0:Lv/VText;

    .line 47
    .line 48
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-eqz p0, :cond_1

    .line 57
    .line 58
    sget p0, Ll/lbc0;->h4:I

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    sget p0, Ll/lbc0;->k4:I

    .line 62
    .line 63
    :goto_0
    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 64
    .line 65
    .line 66
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->a()Ll/tq8;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-interface {p0}, Ll/tq8;->I5()Z

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public O0()Ll/qai;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jbi;->i1:Ll/qai;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/qai;

    .line 6
    .line 7
    iget-object v1, p0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ll/qai;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/jbi;->i1:Ll/qai;

    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Ll/jbi;->i1:Ll/qai;

    .line 15
    .line 16
    return-object p0
.end method

.method public P(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/yqg;->P(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/jbi;->T0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final P0(Lcom/p1/mobile/putong/data/Music;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jbi;->c1:Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/jbi;->U:Landroid/widget/FrameLayout;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget v1, Ll/tec0;->y5:I

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;

    .line 24
    .line 25
    iput-object v0, p0, Ll/jbi;->c1:Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;

    .line 26
    .line 27
    iget-object v1, p0, Ll/jbi;->U:Landroid/widget/FrameLayout;

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/jbi;->c1:Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;

    .line 33
    .line 34
    new-instance v1, Ll/abi;

    .line 35
    .line 36
    invoke-direct {v1, p0, p1}, Ll/abi;-><init>(Ll/jbi;Lcom/p1/mobile/putong/data/Music;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;->d(Ll/x20;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    iget-object p0, p0, Ll/jbi;->c1:Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Music;->cover:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;->e(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/yqg;->Q(Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/jbi;->V:Lv/VText;

    .line 5
    .line 6
    iget-object p0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/at0;->a(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string p1, "@%s"

    .line 19
    .line 20
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final Q0()Ll/qai;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->c2()Ll/qai;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    instance-of v1, v0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;

    .line 15
    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/videoflow/FeedVideoFlowAct;->a2()Ll/qai;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0

    .line 25
    :cond_1
    invoke-virtual {p0}, Ll/jbi;->O0()Ll/qai;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public S0()Lcom/p1/mobile/putong/feed/ui/PreviewVideoLikeImageView;
    .locals 2

    .line 1
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 2
    .line 3
    const/4 v1, -0x2

    .line 4
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 5
    .line 6
    .line 7
    new-instance v1, Lcom/p1/mobile/putong/feed/ui/PreviewVideoLikeImageView;

    .line 8
    .line 9
    iget-object p0, p0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/ui/PreviewVideoLikeImageView;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    sget p0, Ll/lbc0;->W3:I

    .line 15
    .line 16
    invoke-virtual {v1, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 20
    .line 21
    .line 22
    const/16 p0, 0x8

    .line 23
    .line 24
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/feed/ui/PreviewVideoLikeImageView;->setVisibility(I)V

    .line 25
    .line 26
    .line 27
    return-object v1
.end method

.method public final T0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yqg;->D:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/yqg;->D:Ljava/util/List;

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
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Video;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Ll/yqg;->D:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/p1/mobile/putong/data/Video;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Video;->music:Lcom/p1/mobile/putong/data/Music;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/jbi;->f1(Lcom/p1/mobile/putong/data/Music;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public final synthetic U0(Lcom/p1/mobile/putong/data/Music;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->l2(Landroid/content/Context;Lcom/p1/mobile/putong/data/Music;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic V0(Landroid/view/View;)V
    .locals 10

    .line 1
    iget-object p1, p0, Ll/jbi;->I0:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0}, Ll/yqg;->A()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->Q0:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    const/4 v0, 0x0

    .line 26
    if-nez p1, :cond_2

    .line 27
    .line 28
    iget-object p1, p0, Ll/jbi;->I0:Lv/VText;

    .line 29
    .line 30
    invoke-virtual {p1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const-string v1, "\u62a2\u5148\u544a\u767d"

    .line 39
    .line 40
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-eqz p1, :cond_0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iget-object v1, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 52
    .line 53
    iget-object v2, p0, Ll/yqg;->H:Ll/ogh;

    .line 54
    .line 55
    iget-object v2, v2, Ll/ogh;->h:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {p1, v1, v2, v0, v0}, Ll/er60;->s(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZZ)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Ll/yqg;->B:Lcom/p1/mobile/putong/data/User;

    .line 61
    .line 62
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-eqz p1, :cond_1

    .line 67
    .line 68
    invoke-virtual {p0}, Ll/yqg;->A()Lcom/p1/mobile/android/app/Act;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p0}, Ll/yqg;->A()Lcom/p1/mobile/android/app/Act;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    iget-object p0, p0, Ll/yqg;->B:Lcom/p1/mobile/putong/data/User;

    .line 77
    .line 78
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 79
    .line 80
    invoke-static {v1, p0, v0, v0}, Ll/orb0;->c(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 85
    .line 86
    .line 87
    :cond_1
    return-void

    .line 88
    :cond_2
    :goto_0
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    iget-object v1, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 93
    .line 94
    iget-object v2, p0, Ll/yqg;->H:Ll/ogh;

    .line 95
    .line 96
    iget-object v2, v2, Ll/ogh;->h:Ljava/lang/String;

    .line 97
    .line 98
    const/4 v3, 0x1

    .line 99
    invoke-virtual {p1, v1, v2, v3, v0}, Ll/er60;->s(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ZZ)V

    .line 100
    .line 101
    .line 102
    sget-object v4, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 103
    .line 104
    iget-object v5, p0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 105
    .line 106
    iget-object v6, p0, Ll/yqg;->B:Lcom/p1/mobile/putong/data/User;

    .line 107
    .line 108
    iget-object v7, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 109
    .line 110
    iget-object p1, p0, Ll/yqg;->H:Ll/ogh;

    .line 111
    .line 112
    iget-object v8, p1, Ll/ogh;->h:Ljava/lang/String;

    .line 113
    .line 114
    iget-boolean v9, p0, Ll/jbi;->l1:Z

    .line 115
    .line 116
    invoke-virtual/range {v4 .. v9}, Lcom/p1/mobile/putong/feed/api/b;->f3(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Z)V

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public final synthetic W0(Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance v0, Ll/fbi;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/fbi;-><init>(Ll/jbi;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/ksg;->G0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic X0(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p1, p0, Ll/yqg;->H:Ll/ogh;

    .line 2
    .line 3
    iget-object p1, p1, Ll/ogh;->h:Ljava/lang/String;

    .line 4
    .line 5
    new-instance v0, Ll/pf60;

    .line 6
    .line 7
    iget-object v1, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    const-string v2, "moment_id"

    .line 12
    .line 13
    invoke-direct {v0, v2, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    new-instance v1, Ll/pf60;

    .line 17
    .line 18
    iget-object v2, p0, Ll/yqg;->H:Ll/ogh;

    .line 19
    .line 20
    iget-object v2, v2, Ll/ogh;->l:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v2}, Ll/er60;->D(Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    const-string v3, "video_moment_preview_showfrom"

    .line 27
    .line 28
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "e_forwarding"

    .line 36
    .line 37
    invoke-static {v1, p1, v0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 38
    .line 39
    .line 40
    invoke-static {}, Ll/mrb0;->C()Lcom/p1/mobile/putong/data/User;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isJailedOrRestrict()Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_0

    .line 49
    .line 50
    invoke-static {}, Ll/orb0;->I()V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 55
    .line 56
    iget-object v0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 57
    .line 58
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p1, v0}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-static {p1}, Ll/ksg;->q0(Lcom/p1/mobile/putong/data/User;)Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_1

    .line 69
    .line 70
    iget-object p1, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 71
    .line 72
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {p1}, Ll/ksg;->r0(Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-eqz p1, :cond_2

    .line 79
    .line 80
    :cond_1
    iget-object p1, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 81
    .line 82
    invoke-static {p1}, Ll/ksg;->e0(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-eqz p1, :cond_3

    .line 87
    .line 88
    :cond_2
    const-string p0, "\u4f5c\u8005\u5df2\u7981\u6b62\u8f6c\u53d1\u6b64\u6761\u89c6\u9891"

    .line 89
    .line 90
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_3
    iget-object p1, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 95
    .line 96
    invoke-static {p1}, Ll/ksg;->g0(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    if-eqz p1, :cond_4

    .line 101
    .line 102
    const-string p0, "\u89c6\u9891\u5ba1\u6838\u4e2d\u65e0\u6cd5\u8f6c\u53d1"

    .line 103
    .line 104
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_4
    iget-object p1, p0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 109
    .line 110
    iget-object v0, p0, Ll/yqg;->H:Ll/ogh;

    .line 111
    .line 112
    iget-object v0, v0, Ll/ogh;->h:Ljava/lang/String;

    .line 113
    .line 114
    iget-object p0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 115
    .line 116
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 117
    .line 118
    invoke-static {p1, v0, p0}, Ll/ksg;->H0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public final synthetic Y0(Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance v0, Ll/ebi;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ebi;-><init>(Ll/jbi;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/ksg;->G0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic Z0(Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/jbi;->S0()Lcom/p1/mobile/putong/feed/ui/PreviewVideoLikeImageView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p1, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Ll/jbi;->n1:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 18
    .line 19
    .line 20
    move-result-wide v1

    .line 21
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 22
    .line 23
    .line 24
    move-result-wide v3

    .line 25
    const-wide/high16 v5, 0x3fe0000000000000L    # 0.5

    .line 26
    .line 27
    cmpl-double v3, v3, v5

    .line 28
    .line 29
    const/4 v4, 0x1

    .line 30
    if-lez v3, :cond_0

    .line 31
    .line 32
    move v3, v4

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 v3, -0x1

    .line 35
    :goto_0
    int-to-double v5, v3

    .line 36
    mul-double/2addr v1, v5

    .line 37
    const-wide/high16 v5, 0x4034000000000000L    # 20.0

    .line 38
    .line 39
    mul-double/2addr v1, v5

    .line 40
    double-to-int v1, v1

    .line 41
    int-to-float v1, v1

    .line 42
    invoke-virtual {v0, v1}, Landroid/view/View;->setRotation(F)V

    .line 43
    .line 44
    .line 45
    const/high16 v1, 0x3fc00000    # 1.5f

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 51
    .line 52
    .line 53
    iget v1, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->c:I

    .line 54
    .line 55
    const/high16 v2, 0x41f00000    # 30.0f

    .line 56
    .line 57
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    sub-int/2addr v1, v2

    .line 62
    int-to-float v1, v1

    .line 63
    invoke-virtual {v0, v1}, Landroid/view/View;->setY(F)V

    .line 64
    .line 65
    .line 66
    iget v1, p1, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->b:I

    .line 67
    .line 68
    const/high16 v2, 0x41d80000    # 27.0f

    .line 69
    .line 70
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    sub-int/2addr v1, v2

    .line 75
    int-to-float v1, v1

    .line 76
    invoke-virtual {v0, v1}, Landroid/view/View;->setX(F)V

    .line 77
    .line 78
    .line 79
    const/4 v1, 0x0

    .line 80
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/ui/PreviewVideoLikeImageView;->setVisibility(I)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0, p1}, Ll/jbi;->g1(Landroid/view/ViewGroup;)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 87
    .line 88
    iget-boolean p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 89
    .line 90
    if-nez p1, :cond_1

    .line 91
    .line 92
    iget-object p1, p0, Ll/yqg;->H:Ll/ogh;

    .line 93
    .line 94
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-eqz p1, :cond_1

    .line 99
    .line 100
    iget-object p1, p0, Ll/yqg;->H:Ll/ogh;

    .line 101
    .line 102
    iget-object p0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 103
    .line 104
    invoke-virtual {p1, p0, v4}, Ll/ogh;->B(Lcom/p1/mobile/putong/feed/data/Moment;Z)V

    .line 105
    .line 106
    .line 107
    :cond_1
    return-void
.end method

.method public final synthetic a1(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p1, ""

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p1}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Ljava/lang/Float;->intValue()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    invoke-virtual {p0, p1}, Ll/jbi;->e1(I)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public b(Ll/cf60;)V
    .locals 1

    .line 1
    instance-of v0, p1, Ll/wf70;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/wf70;

    .line 6
    .line 7
    iget-object p0, p0, Ll/jbi;->O:Lv/VImage;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Ll/wf70;->m0(Lv/VImage;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final synthetic b1(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Ll/jbi;->U0:Lv/VImage;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/jbi;->S0:Landroid/view/View;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public c0()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/jbi;->f1:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-super {p0}, Ll/yqg;->c0()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Ll/jbi;->d1:Z

    .line 11
    .line 12
    return-void
.end method

.method public final synthetic c1()V
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/ibi;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/ibi;-><init>(Ll/jbi;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 17
    .line 18
    .line 19
    new-instance v1, Ll/jbi$b;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/jbi$b;-><init>(Ll/jbi;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final d1(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jbi;->T0:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/jbi;->S0:Landroid/view/View;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/jbi;->T0:Lv/VText;

    .line 12
    .line 13
    const/high16 p1, 0x3f800000    # 1.0f

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public e()Ll/ie80$c;
    .locals 1

    .line 1
    new-instance v0, Ll/jbi$c;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/jbi$c;-><init>(Ll/jbi;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final e1(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jbi;->S0:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 8
    .line 9
    iget-object p0, p0, Ll/jbi;->S0:Landroid/view/View;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public f1(Lcom/p1/mobile/putong/data/Music;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-static {v0}, Ll/at0;->d(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/jbi;->U:Landroid/widget/FrameLayout;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/jbi;->P0(Lcom/p1/mobile/putong/data/Music;)V

    .line 22
    .line 23
    .line 24
    const/4 p1, 0x1

    .line 25
    invoke-virtual {p0, p1}, Ll/jbi;->s1(Z)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public g0(Lcom/p1/mobile/putong/data/User;)V
    .locals 5

    .line 1
    iput-object p1, p0, Ll/yqg;->B:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-static {}, Ll/cmg;->o()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x4

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Ll/jbi;->d1(I)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, v0}, Ll/jbi;->d1(I)V

    .line 16
    .line 17
    .line 18
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 19
    .line 20
    sget-object v3, Ll/uqb0;->b0:Ll/sre0;

    .line 21
    .line 22
    iget-object v3, v3, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 23
    .line 24
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-nez v2, :cond_a

    .line 33
    .line 34
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 35
    .line 36
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    const-string v3, "matched"

    .line 41
    .line 42
    if-eqz v2, :cond_1

    .line 43
    .line 44
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 45
    .line 46
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 47
    .line 48
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-eqz v2, :cond_1

    .line 53
    .line 54
    goto/16 :goto_2

    .line 55
    .line 56
    :cond_1
    iget-object v2, p0, Ll/jbi;->T0:Lv/VText;

    .line 57
    .line 58
    invoke-virtual {v2, v0}, Landroid/view/View;->setSelected(Z)V

    .line 59
    .line 60
    .line 61
    iget-object v2, p0, Ll/jbi;->S0:Landroid/view/View;

    .line 62
    .line 63
    const/high16 v4, 0x3f800000    # 1.0f

    .line 64
    .line 65
    invoke-virtual {v2, v4}, Landroid/view/View;->setAlpha(F)V

    .line 66
    .line 67
    .line 68
    invoke-static {}, Ll/cmg;->K()Z

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    if-eqz v2, :cond_4

    .line 73
    .line 74
    invoke-static {p1}, Ll/hyh;->i(Lcom/p1/mobile/putong/data/User;)Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-eqz p1, :cond_3

    .line 79
    .line 80
    iget-boolean p1, p0, Ll/jbi;->d1:Z

    .line 81
    .line 82
    if-eqz p1, :cond_2

    .line 83
    .line 84
    invoke-virtual {p0}, Ll/jbi;->u1()V

    .line 85
    .line 86
    .line 87
    iput-boolean v0, p0, Ll/jbi;->d1:Z

    .line 88
    .line 89
    goto/16 :goto_3

    .line 90
    .line 91
    :cond_2
    invoke-virtual {p0, v1}, Ll/jbi;->d1(I)V

    .line 92
    .line 93
    .line 94
    goto/16 :goto_3

    .line 95
    .line 96
    :cond_3
    invoke-virtual {p0}, Ll/jbi;->t1()V

    .line 97
    .line 98
    .line 99
    goto/16 :goto_3

    .line 100
    .line 101
    :cond_4
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 102
    .line 103
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    const-string v4, "#ffffff"

    .line 108
    .line 109
    if-eqz v2, :cond_8

    .line 110
    .line 111
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 112
    .line 113
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 114
    .line 115
    const-string v2, "following"

    .line 116
    .line 117
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 118
    .line 119
    .line 120
    move-result v2

    .line 121
    if-nez v2, :cond_6

    .line 122
    .line 123
    invoke-static {p1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    if-nez p1, :cond_6

    .line 128
    .line 129
    iget-object p1, p0, Ll/yqg;->H:Ll/ogh;

    .line 130
    .line 131
    invoke-virtual {p1}, Ll/ogh;->X()V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p0, v0}, Ll/jbi;->d1(I)V

    .line 135
    .line 136
    .line 137
    iget-object p1, p0, Ll/jbi;->T0:Lv/VText;

    .line 138
    .line 139
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 144
    .line 145
    .line 146
    iget-object p1, p0, Ll/jbi;->T0:Lv/VText;

    .line 147
    .line 148
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->R2:I

    .line 149
    .line 150
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(I)V

    .line 151
    .line 152
    .line 153
    iget-object p1, p0, Ll/jbi;->S0:Landroid/view/View;

    .line 154
    .line 155
    invoke-static {}, Ll/j4h;->h()Z

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    if-eqz v1, :cond_5

    .line 160
    .line 161
    sget v1, Ll/lbc0;->o4:I

    .line 162
    .line 163
    goto :goto_0

    .line 164
    :cond_5
    sget v1, Ll/lbc0;->n4:I

    .line 165
    .line 166
    :goto_0
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {p0, v0}, Ll/jbi;->e1(I)V

    .line 170
    .line 171
    .line 172
    goto :goto_3

    .line 173
    :cond_6
    iget-boolean p1, p0, Ll/jbi;->d1:Z

    .line 174
    .line 175
    if-eqz p1, :cond_7

    .line 176
    .line 177
    invoke-virtual {p0}, Ll/jbi;->u1()V

    .line 178
    .line 179
    .line 180
    iput-boolean v0, p0, Ll/jbi;->d1:Z

    .line 181
    .line 182
    goto :goto_3

    .line 183
    :cond_7
    invoke-virtual {p0, v1}, Ll/jbi;->d1(I)V

    .line 184
    .line 185
    .line 186
    goto :goto_3

    .line 187
    :cond_8
    iget-object p1, p0, Ll/yqg;->H:Ll/ogh;

    .line 188
    .line 189
    invoke-virtual {p1}, Ll/ogh;->X()V

    .line 190
    .line 191
    .line 192
    invoke-virtual {p0, v0}, Ll/jbi;->d1(I)V

    .line 193
    .line 194
    .line 195
    iget-object p1, p0, Ll/jbi;->T0:Lv/VText;

    .line 196
    .line 197
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 202
    .line 203
    .line 204
    iget-object p1, p0, Ll/jbi;->T0:Lv/VText;

    .line 205
    .line 206
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->R2:I

    .line 207
    .line 208
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 209
    .line 210
    .line 211
    iget-object p1, p0, Ll/jbi;->S0:Landroid/view/View;

    .line 212
    .line 213
    invoke-static {}, Ll/j4h;->h()Z

    .line 214
    .line 215
    .line 216
    move-result v0

    .line 217
    if-eqz v0, :cond_9

    .line 218
    .line 219
    sget v0, Ll/lbc0;->o4:I

    .line 220
    .line 221
    goto :goto_1

    .line 222
    :cond_9
    sget v0, Ll/lbc0;->n4:I

    .line 223
    .line 224
    :goto_1
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 225
    .line 226
    .line 227
    goto :goto_3

    .line 228
    :cond_a
    :goto_2
    invoke-virtual {p0, v1}, Ll/jbi;->d1(I)V

    .line 229
    .line 230
    .line 231
    :goto_3
    invoke-direct {p0}, Ll/jbi;->R0()V

    .line 232
    .line 233
    .line 234
    return-void
.end method

.method public g1(Landroid/view/ViewGroup;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jbi;->n1:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, -0x1

    .line 8
    .line 9
    :goto_0
    if-lez v0, :cond_1

    .line 10
    .line 11
    iget-object v1, p0, Ll/jbi;->n1:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/feed/ui/PreviewVideoLikeImageView;

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    const/16 v3, 0x8

    .line 24
    .line 25
    if-ne v2, v3, :cond_0

    .line 26
    .line 27
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Ll/jbi;->n1:Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    return-void
.end method

.method public h1(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/Moment;->getLocationName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/Moment;->getLocationName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string p1, ""

    .line 17
    .line 18
    :goto_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iget-object v1, p0, Ll/jbi;->W:Landroid/widget/LinearLayout;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    const/16 p0, 0x8

    .line 27
    .line 28
    invoke-virtual {v1, p0}, Landroid/view/View;->setVisibility(I)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    const/4 v0, 0x0

    .line 33
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/jbi;->Y:Lv/VText;

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public i0(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iput-object p1, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 5
    .line 6
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 7
    .line 8
    iget-object v1, p0, Ll/yqg;->i:Lv/VText;

    .line 9
    .line 10
    if-nez v0, :cond_2

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/yqg;->A()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v2, Ll/k9c0;->p0:I

    .line 21
    .line 22
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/yqg;->h:Lv/VImage;

    .line 30
    .line 31
    invoke-static {}, Ll/j4h;->h()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    sget v1, Ll/lbc0;->I5:I

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    sget v1, Ll/lbc0;->J5:I

    .line 41
    .line 42
    :goto_0
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 43
    .line 44
    .line 45
    goto :goto_3

    .line 46
    :cond_2
    invoke-virtual {p0}, Ll/yqg;->A()Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-static {}, Ll/j4h;->h()Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-eqz v2, :cond_3

    .line 59
    .line 60
    sget v2, Ll/k9c0;->i:I

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_3
    sget v2, Ll/k9c0;->n:I

    .line 64
    .line 65
    :goto_1
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/yqg;->h:Lv/VImage;

    .line 73
    .line 74
    invoke-static {}, Ll/j4h;->h()Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-eqz v1, :cond_4

    .line 79
    .line 80
    sget v1, Ll/lbc0;->G5:I

    .line 81
    .line 82
    goto :goto_2

    .line 83
    :cond_4
    sget v1, Ll/lbc0;->H5:I

    .line 84
    .line 85
    :goto_2
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 86
    .line 87
    .line 88
    :goto_3
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 89
    .line 90
    iget v1, v0, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 91
    .line 92
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 93
    .line 94
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-lez v0, :cond_5

    .line 103
    .line 104
    iget-object v1, p0, Ll/yqg;->i:Lv/VText;

    .line 105
    .line 106
    invoke-static {v0}, Ll/q8g0;->h0(I)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 111
    .line 112
    .line 113
    goto :goto_4

    .line 114
    :cond_5
    if-nez v0, :cond_6

    .line 115
    .line 116
    iget-object v0, p0, Ll/yqg;->i:Lv/VText;

    .line 117
    .line 118
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->k:I

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 121
    .line 122
    .line 123
    :cond_6
    :goto_4
    invoke-static {}, Ll/cmg;->R()Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    const/16 v1, 0x8

    .line 128
    .line 129
    if-eqz v0, :cond_9

    .line 130
    .line 131
    invoke-static {}, Ll/cmg;->R()Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-eqz v0, :cond_8

    .line 136
    .line 137
    iget-object v0, p0, Ll/yqg;->B:Lcom/p1/mobile/putong/data/User;

    .line 138
    .line 139
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-eqz v0, :cond_7

    .line 144
    .line 145
    iget-object v0, p0, Ll/yqg;->B:Lcom/p1/mobile/putong/data/User;

    .line 146
    .line 147
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    if-nez v0, :cond_7

    .line 152
    .line 153
    invoke-virtual {p0, p1}, Ll/jbi;->i1(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 154
    .line 155
    .line 156
    goto :goto_5

    .line 157
    :cond_7
    iget-object v0, p0, Ll/jbi;->W:Landroid/widget/LinearLayout;

    .line 158
    .line 159
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 160
    .line 161
    .line 162
    :goto_5
    invoke-virtual {p0, p1}, Ll/jbi;->k1(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 163
    .line 164
    .line 165
    return-void

    .line 166
    :cond_8
    invoke-virtual {p0, p1}, Ll/jbi;->j1(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {p0, p1}, Ll/jbi;->h1(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 170
    .line 171
    .line 172
    return-void

    .line 173
    :cond_9
    iget-object p1, p0, Ll/jbi;->W:Landroid/widget/LinearLayout;

    .line 174
    .line 175
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 176
    .line 177
    .line 178
    iget-object p1, p0, Ll/jbi;->p0:Lv/VText;

    .line 179
    .line 180
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 181
    .line 182
    .line 183
    iget-object p0, p0, Ll/jbi;->E0:Lv/VText;

    .line 184
    .line 185
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 186
    .line 187
    .line 188
    return-void
.end method

.method public final i1(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yqg;->B:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object v1, p0, Ll/yqg;->E:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, v0, v1}, Ll/o6i;->a(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Ll/jbi;->Y:Lv/VText;

    .line 10
    .line 11
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    const-string v1, ""

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move-object v1, p1

    .line 21
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/jbi;->W:Landroid/widget/LinearLayout;

    .line 25
    .line 26
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    xor-int/lit8 p1, p1, 0x1

    .line 31
    .line 32
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public j(ILcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Ll/yqg;->j(ILcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/jbi;->h1:Ll/mxh;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/jbi;->h1:Ll/mxh;

    .line 13
    .line 14
    invoke-interface {v0, p1, p2}, Ll/mxh;->b(ILcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;->setLoopMode(Z)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Ll/jbi;->h1:Ll/mxh;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    iget-object p0, p0, Ll/jbi;->h1:Ll/mxh;

    .line 33
    .line 34
    invoke-interface {p0, p1, p2}, Ll/mxh;->a(ILcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_1

    .line 39
    .line 40
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;->y()Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-nez p0, :cond_2

    .line 45
    .line 46
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;->F()V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;->y()Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-eqz p0, :cond_2

    .line 55
    .line 56
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;->J()V

    .line 57
    .line 58
    .line 59
    :cond_2
    return-void
.end method

.method public j1(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 4

    .line 1
    iget-wide v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    .line 2
    .line 3
    double-to-long v0, v0

    .line 4
    iget-object p1, p0, Ll/yqg;->B:Lcom/p1/mobile/putong/data/User;

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getLastActiveTimeMillis()J

    .line 12
    .line 13
    .line 14
    move-result-wide v2

    .line 15
    :goto_0
    invoke-static {v0, v1, v2, v3}, Ll/ksg;->H(JJ)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object v0, p0, Ll/jbi;->p0:Lv/VText;

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/jbi;->p0:Lv/VText;

    .line 25
    .line 26
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    xor-int/lit8 p1, p1, 0x1

    .line 31
    .line 32
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public k0(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/cmg;->R()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p0, v0}, Ll/jbi;->q1(Z)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->forwards:Lcom/p1/mobile/putong/feed/data/MomentForwards;

    .line 13
    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/MomentForwards;->count:I

    .line 18
    .line 19
    :goto_0
    if-lez v1, :cond_2

    .line 20
    .line 21
    iget-object p0, p0, Ll/jbi;->F0:Lv/VText;

    .line 22
    .line 23
    if-lez v1, :cond_1

    .line 24
    .line 25
    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    const-string p1, "\u8f6c\u53d1"

    .line 31
    .line 32
    :goto_1
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    :cond_2
    return-void

    .line 36
    :cond_3
    invoke-virtual {p0, v1}, Ll/jbi;->q1(Z)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public k1(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/yqg;->B:Lcom/p1/mobile/putong/data/User;

    .line 7
    .line 8
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    iget-object v1, p0, Ll/yqg;->B:Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    iget-object v1, p0, Ll/yqg;->B:Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    iget-object v2, p0, Ll/yqg;->E:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p1, v1, v2}, Ll/o6i;->b(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    :cond_0
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->views:I

    .line 34
    .line 35
    if-lez v1, :cond_2

    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-lez v1, :cond_1

    .line 42
    .line 43
    const-string v1, " \u00b7 "

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    :cond_1
    iget p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->views:I

    .line 49
    .line 50
    invoke-static {p1}, Ll/q8g0;->t(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    const-string p1, "\u6b21\u64ad\u653e"

    .line 58
    .line 59
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    :cond_2
    iget-object p1, p0, Ll/jbi;->E0:Lv/VText;

    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    iget-object v0, p0, Ll/jbi;->E0:Lv/VText;

    .line 76
    .line 77
    const/4 v1, 0x0

    .line 78
    if-lez p1, :cond_3

    .line 79
    .line 80
    const/4 p1, 0x1

    .line 81
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Ll/jbi;->V:Lv/VText;

    .line 85
    .line 86
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    check-cast p1, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 91
    .line 92
    iget-object v0, p0, Ll/jbi;->E0:Lv/VText;

    .line 93
    .line 94
    invoke-virtual {v0}, Landroid/view/View;->getId()I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    iput v0, p1, Landroidx/constraintlayout/widget/ConstraintLayout$a;->j:I

    .line 99
    .line 100
    sget v0, Ll/qa00;->d:I

    .line 101
    .line 102
    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 103
    .line 104
    iput v1, p1, Landroidx/constraintlayout/widget/ConstraintLayout$a;->w:I

    .line 105
    .line 106
    iget-object p0, p0, Ll/jbi;->V:Lv/VText;

    .line 107
    .line 108
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_3
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 113
    .line 114
    .line 115
    iget-object p1, p0, Ll/jbi;->V:Lv/VText;

    .line 116
    .line 117
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    check-cast p1, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 122
    .line 123
    iget-object v0, p0, Ll/jbi;->T:Lcom/p1/mobile/putong/newui/view/InnerClickSpanTextView;

    .line 124
    .line 125
    invoke-virtual {v0}, Landroid/view/View;->getId()I

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    iput v0, p1, Landroidx/constraintlayout/widget/ConstraintLayout$a;->j:I

    .line 130
    .line 131
    sget v0, Ll/qa00;->h:I

    .line 132
    .line 133
    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 134
    .line 135
    sget v0, Ll/qa00;->m:I

    .line 136
    .line 137
    iput v0, p1, Landroidx/constraintlayout/widget/ConstraintLayout$a;->w:I

    .line 138
    .line 139
    iget-object p0, p0, Ll/jbi;->V:Lv/VText;

    .line 140
    .line 141
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 142
    .line 143
    .line 144
    return-void
.end method

.method public l(Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/yqg;->l(Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/jbi;->r1(Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public l0(Lcom/p1/mobile/putong/feed/data/RawFeed;)V
    .locals 1

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
    iget-boolean p1, p1, Lcom/p1/mobile/putong/feed/data/RawFeed;->canGreeting:Z

    .line 8
    .line 9
    iput-boolean p1, p0, Ll/jbi;->k1:Z

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/jbi;->N0()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/jbi;->m1()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public l1(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jbi;->j1:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/RawFeed;Lcom/p1/mobile/putong/data/Music;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/yqg;->m(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/RawFeed;Lcom/p1/mobile/putong/data/Music;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p3}, Ll/jbi;->f1(Lcom/p1/mobile/putong/data/Music;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public m1()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jbi;->I0:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p0, Ll/jbi;->J0:Lv/VImage;

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    new-array v2, v2, [Landroid/view/View;

    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    aput-object v0, v2, v3

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    aput-object v1, v2, v0

    .line 13
    .line 14
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/cbi;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/cbi;-><init>(Ll/jbi;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public n1(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jbi;->I0:Lv/VText;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    move v3, v2

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move v3, v1

    .line 11
    :goto_0
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/jbi;->J0:Lv/VImage;

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    move v3, v2

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    move v3, v1

    .line 21
    :goto_1
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/jbi;->K0:Landroid/view/View;

    .line 25
    .line 26
    if-eqz p1, :cond_2

    .line 27
    .line 28
    move v1, v2

    .line 29
    :cond_2
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public o1(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jbi;->M0:Lv/VImage;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    move v3, v2

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move v3, v1

    .line 11
    :goto_0
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/jbi;->L0:Lv/VText;

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    move v1, v2

    .line 19
    :cond_1
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/jbi;->N0:Lv/VText;

    .line 23
    .line 24
    if-eqz p1, :cond_2

    .line 25
    .line 26
    const/high16 p1, 0x41a00000    # 20.0f

    .line 27
    .line 28
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    :cond_2
    invoke-static {p0, v2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/yqg;->onDestroy()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Ll/jbi;->s1(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public p1()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jbi;->F0:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p0, Ll/jbi;->G0:Lv/VImage;

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    new-array v2, v2, [Landroid/view/View;

    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    aput-object v0, v2, v3

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    aput-object v1, v2, v0

    .line 13
    .line 14
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/dbi;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/dbi;-><init>(Ll/jbi;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public q1(Z)V
    .locals 5

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/jbi;->F0:Lv/VText;

    .line 4
    .line 5
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/yqg;->H:Ll/ogh;

    .line 12
    .line 13
    iget-object v0, v0, Ll/ogh;->h:Ljava/lang/String;

    .line 14
    .line 15
    new-instance v1, Ll/pf60;

    .line 16
    .line 17
    iget-object v2, p0, Ll/yqg;->A:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 20
    .line 21
    const-string v3, "moment_id"

    .line 22
    .line 23
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    new-instance v2, Ll/pf60;

    .line 27
    .line 28
    iget-object v3, p0, Ll/yqg;->H:Ll/ogh;

    .line 29
    .line 30
    iget-object v3, v3, Ll/ogh;->l:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v3}, Ll/er60;->D(Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    const-string v4, "video_moment_preview_showfrom"

    .line 37
    .line 38
    invoke-direct {v2, v4, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    filled-new-array {v1, v2}, [Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const-string v2, "e_forwarding"

    .line 46
    .line 47
    invoke-static {v2, v0, v1}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    iget-object v0, p0, Ll/jbi;->F0:Lv/VText;

    .line 51
    .line 52
    const/16 v1, 0x8

    .line 53
    .line 54
    const/4 v2, 0x0

    .line 55
    if-eqz p1, :cond_1

    .line 56
    .line 57
    move v3, v2

    .line 58
    goto :goto_0

    .line 59
    :cond_1
    move v3, v1

    .line 60
    :goto_0
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/jbi;->G0:Lv/VImage;

    .line 64
    .line 65
    if-eqz p1, :cond_2

    .line 66
    .line 67
    move v3, v2

    .line 68
    goto :goto_1

    .line 69
    :cond_2
    move v3, v1

    .line 70
    :goto_1
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Ll/jbi;->H0:Landroid/view/View;

    .line 74
    .line 75
    if-eqz p1, :cond_3

    .line 76
    .line 77
    move v1, v2

    .line 78
    :cond_3
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public r1(Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;)V
    .locals 1

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
    new-instance v0, Ll/bbi;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1}, Ll/bbi;-><init>(Ll/jbi;Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/view/FeedVideoLikeContainerView;->setOnClick(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final s1(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jbi;->c1:Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;

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
    iget-boolean v0, p0, Ll/jbi;->e1:Z

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    iget-object p1, p0, Ll/jbi;->c1:Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;->f()V

    .line 18
    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    iput-boolean p1, p0, Ll/jbi;->e1:Z

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object p1, p0, Ll/jbi;->c1:Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;->g()V

    .line 29
    .line 30
    .line 31
    const/4 p1, 0x0

    .line 32
    iput-boolean p1, p0, Ll/jbi;->e1:Z

    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public t1()V
    .locals 3

    .line 1
    iget v0, p0, Ll/jbi;->m1:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/jbi;->e1(I)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Ll/jbi;->T0:Lv/VText;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 16
    .line 17
    const/high16 v1, 0x42240000    # 41.0f

    .line 18
    .line 19
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 24
    .line 25
    const/high16 v1, 0x41a00000    # 20.0f

    .line 26
    .line 27
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 32
    .line 33
    iget-object v1, p0, Ll/jbi;->T0:Lv/VText;

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/jbi;->T0:Lv/VText;

    .line 39
    .line 40
    const/4 v1, 0x0

    .line 41
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Ll/jbi;->T0:Lv/VText;

    .line 45
    .line 46
    const/high16 v2, 0x41400000    # 12.0f

    .line 47
    .line 48
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/jbi;->T0:Lv/VText;

    .line 52
    .line 53
    const/4 v2, 0x0

    .line 54
    invoke-virtual {v0, v2, v2, v2, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/jbi;->T0:Lv/VText;

    .line 58
    .line 59
    const-string v2, "\u559c\u6b22"

    .line 60
    .line 61
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/yqg;->H:Ll/ogh;

    .line 65
    .line 66
    invoke-virtual {v0}, Ll/ogh;->X()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, v1}, Ll/jbi;->d1(I)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/jbi;->T0:Lv/VText;

    .line 73
    .line 74
    const-string v1, "#ffffff"

    .line 75
    .line 76
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 81
    .line 82
    .line 83
    iget-object p0, p0, Ll/jbi;->S0:Landroid/view/View;

    .line 84
    .line 85
    invoke-static {}, Ll/j4h;->h()Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-eqz v0, :cond_1

    .line 90
    .line 91
    sget v0, Ll/lbc0;->o4:I

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_1
    sget v0, Ll/lbc0;->n4:I

    .line 95
    .line 96
    :goto_0
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public final u1()V
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/jbi;->f1:Z

    .line 3
    .line 4
    iget-object v1, p0, Ll/jbi;->T0:Lv/VText;

    .line 5
    .line 6
    const/4 v2, 0x2

    .line 7
    new-array v3, v2, [F

    .line 8
    .line 9
    fill-array-data v3, :array_0

    .line 10
    .line 11
    .line 12
    const-string v4, "alpha"

    .line 13
    .line 14
    invoke-static {v1, v4, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object v3, p0, Ll/jbi;->S0:Landroid/view/View;

    .line 19
    .line 20
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    iput v3, p0, Ll/jbi;->m1:I

    .line 25
    .line 26
    iget-object v3, p0, Ll/jbi;->S0:Landroid/view/View;

    .line 27
    .line 28
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    int-to-float v3, v3

    .line 33
    iget-object v4, p0, Ll/jbi;->S0:Landroid/view/View;

    .line 34
    .line 35
    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    int-to-float v4, v4

    .line 40
    new-array v5, v2, [F

    .line 41
    .line 42
    const/4 v6, 0x0

    .line 43
    aput v3, v5, v6

    .line 44
    .line 45
    aput v4, v5, v0

    .line 46
    .line 47
    invoke-static {v5}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    new-instance v4, Ll/gbi;

    .line 52
    .line 53
    invoke-direct {v4, p0}, Ll/gbi;-><init>(Ll/jbi;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v3, v4}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 57
    .line 58
    .line 59
    const-wide/16 v4, 0x190

    .line 60
    .line 61
    invoke-virtual {v1, v4, v5}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v3, v4, v5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 65
    .line 66
    .line 67
    new-instance v4, Landroid/animation/AnimatorSet;

    .line 68
    .line 69
    invoke-direct {v4}, Landroid/animation/AnimatorSet;-><init>()V

    .line 70
    .line 71
    .line 72
    new-array v2, v2, [Landroid/animation/Animator;

    .line 73
    .line 74
    aput-object v3, v2, v6

    .line 75
    .line 76
    aput-object v1, v2, v0

    .line 77
    .line 78
    invoke-virtual {v4, v2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 79
    .line 80
    .line 81
    new-instance v0, Ll/jbi$a;

    .line 82
    .line 83
    invoke-direct {v0, p0}, Ll/jbi$a;-><init>(Ll/jbi;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v4, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v4}, Landroid/animation/AnimatorSet;->start()V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final v1()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/jbi;->U0:Lv/VImage;

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    sget v1, Ll/lbc0;->V3:I

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/j26;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Landroid/graphics/drawable/AnimatedVectorDrawable;

    .line 17
    .line 18
    iget-object v1, p0, Ll/jbi;->U0:Lv/VImage;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/graphics/drawable/AnimatedVectorDrawable;->start()V

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object v0, p0, Ll/yqg;->C:Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    new-instance v1, Ll/hbi;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/hbi;-><init>(Ll/jbi;)V

    .line 37
    .line 38
    .line 39
    const-wide/16 v2, 0x4b0

    .line 40
    .line 41
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 42
    .line 43
    .line 44
    return-void
.end method
