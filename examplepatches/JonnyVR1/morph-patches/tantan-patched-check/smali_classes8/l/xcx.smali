.class public Ll/xcx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qyl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/xcx$h;,
        Ll/xcx$g;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/qyl<",
        "Ll/xbx;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Lv/VLinear;

.field public B:Lv/VText;

.field public C:Lv/VImage;

.field public D:Landroid/widget/LinearLayout;

.field public E:Lv/VEditText;

.field public E0:I

.field public F:Lv/VText;

.field public F0:Landroid/animation/Animator;

.field public G:Lv/VLinear;

.field public G0:Z

.field public H:Landroid/widget/FrameLayout;

.field public H0:I

.field public I:Lcom/tantan/library/svga/SVGAnimationView;

.field public I0:F

.field public J:Landroid/widget/ImageView;

.field public J0:Z

.field public K:Lv/VText;

.field public K0:Lcom/p1/mobile/putong/data/User;

.field public L:Landroid/widget/FrameLayout;

.field public L0:Z

.field public M:Lcom/tantan/library/svga/SVGAnimationView;

.field public M0:Landroid/view/View$OnClickListener;

.field public N:Landroid/widget/ImageView;

.field public N0:Landroid/view/View$OnClickListener;

.field public O:Lv/VText;

.field public O0:Landroid/view/View$OnClickListener;

.field public P:Landroid/widget/FrameLayout;

.field public P0:Ll/f0r;

.field public Q:Lcom/tantan/library/svga/SVGAnimationView;

.field public Q0:F

.field public R:Landroid/widget/ImageView;

.field public R0:F

.field public S:Lv/VText;

.field public S0:I

.field public T:Landroid/widget/FrameLayout;

.field public T0:I

.field public U:Lcom/tantan/library/svga/SVGAnimationView;

.field public U0:Ll/xcx$g;

.field public V:Landroid/widget/ImageView;

.field public V0:Landroidx/recyclerview/widget/LinearLayoutManager;

.field public W:Lv/VText;

.field public W0:Lcom/p1/mobile/android/ui/bubble/d;

.field public X:Lv/VButton_FakeShadow;

.field public X0:Ll/vxd0;

.field public Y:Lv/VButton;

.field public Y0:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public Z:Lcom/p1/mobile/putong/core/ui/match/MatchAct;

.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Lcom/tantan/library/svga/SVGAnimationView;

.field public c:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public d:Lcom/p1/mobile/putong/core/view/HeartView;

.field public e:Lcom/sunshine/engine/bone/StageView;

.field public f:Lv/VText;

.field public g:Landroid/widget/TextView;

.field public h:Lv/VText;

.field public i:Landroid/widget/TextView;

.field public j:Lv/VText;

.field public k:Lv/VRelative;

.field public k0:Ll/xbx;

.field public l:Lv/VDraweeView;

.field public m:Lcom/tantan/library/svga/SVGAnimationView;

.field public n:Lv/VImage;

.field public o:Landroidx/constraintlayout/widget/Guideline;

.field public p:Lv/VRelative;

.field public p0:Z

.field public q:Lv/VDraweeView;

.field public r:Lv/VImage;

.field public s:Lv/VFrame;

.field public t:Lv/VIcon;

.field public u:Lv/VIcon;

.field public v:Landroid/view/View;

.field public w:Lv/VImage;

.field public x:Lv/VRecyclerView;

.field public y:Landroid/widget/TextView;

.field public z:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/match/MatchAct;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/xcx;->p0:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/xcx;->G0:Z

    .line 8
    .line 9
    const v1, 0x444ac000    # 811.0f

    .line 10
    .line 11
    .line 12
    iput v1, p0, Ll/xcx;->I0:F

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    iput-boolean v1, p0, Ll/xcx;->J0:Z

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    iput-object v1, p0, Ll/xcx;->K0:Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    new-instance v1, Ll/jcx;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/jcx;-><init>(Ll/xcx;)V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Ll/xcx;->M0:Landroid/view/View$OnClickListener;

    .line 26
    .line 27
    new-instance v1, Ll/pcx;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/pcx;-><init>(Ll/xcx;)V

    .line 30
    .line 31
    .line 32
    iput-object v1, p0, Ll/xcx;->N0:Landroid/view/View$OnClickListener;

    .line 33
    .line 34
    new-instance v1, Ll/qcx;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/qcx;-><init>(Ll/xcx;)V

    .line 37
    .line 38
    .line 39
    iput-object v1, p0, Ll/xcx;->O0:Landroid/view/View$OnClickListener;

    .line 40
    .line 41
    const/high16 v1, 0x3f800000    # 1.0f

    .line 42
    .line 43
    iput v1, p0, Ll/xcx;->Q0:F

    .line 44
    .line 45
    iput v1, p0, Ll/xcx;->R0:F

    .line 46
    .line 47
    const/high16 v2, 0x424c0000    # 51.0f

    .line 48
    .line 49
    mul-float/2addr v1, v2

    .line 50
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    iput v1, p0, Ll/xcx;->S0:I

    .line 55
    .line 56
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iput-object v1, p0, Ll/xcx;->W0:Lcom/p1/mobile/android/ui/bubble/d;

    .line 61
    .line 62
    new-instance v1, Ll/vxd0;

    .line 63
    .line 64
    new-instance v2, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    const-string v3, "core_match_ice_break_guide_shown_"

    .line 67
    .line 68
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-direct {v1, v2, v0}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 87
    .line 88
    .line 89
    iput-object v1, p0, Ll/xcx;->X0:Ll/vxd0;

    .line 90
    .line 91
    new-instance v0, Ljava/util/HashSet;

    .line 92
    .line 93
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 94
    .line 95
    .line 96
    iput-object v0, p0, Ll/xcx;->Y0:Ljava/util/Set;

    .line 97
    .line 98
    iput-object p1, p0, Ll/xcx;->Z:Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 99
    .line 100
    return-void
.end method

.method public static synthetic A(Ll/xcx;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xcx;->v1(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic A0(Ll/xcx;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->j:Lv/VText;

    return-void
.end method

.method public static synthetic B(Ll/xcx;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xcx;->M1(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic B0(Ll/xcx;Lv/VImage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->n:Lv/VImage;

    return-void
.end method

.method public static synthetic C(Ll/xcx;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xcx;->o1(ILandroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic D0(Ll/xcx;Lv/VImage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->r:Lv/VImage;

    return-void
.end method

.method public static synthetic E(Ll/xcx;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xcx;->C1(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic E0(Ll/xcx;Lcom/tantan/library/svga/SVGAnimationView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->m:Lcom/tantan/library/svga/SVGAnimationView;

    return-void
.end method

.method public static bridge synthetic F(Ll/xcx;)Lv/VLinear;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xcx;->A:Lv/VLinear;

    return-object p0
.end method

.method public static bridge synthetic G(Ll/xcx;)Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xcx;->i:Landroid/widget/TextView;

    return-object p0
.end method

.method public static bridge synthetic G0(Ll/xcx;Lcom/tantan/library/svga/SVGAnimationView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->b:Lcom/tantan/library/svga/SVGAnimationView;

    return-void
.end method

.method public static bridge synthetic H(Ll/xcx;)Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xcx;->g:Landroid/widget/TextView;

    return-object p0
.end method

.method public static bridge synthetic H0(Ll/xcx;Lcom/tantan/library/svga/SVGAnimationView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->I:Lcom/tantan/library/svga/SVGAnimationView;

    return-void
.end method

.method public static bridge synthetic I(Ll/xcx;)Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xcx;->h:Lv/VText;

    return-object p0
.end method

.method public static bridge synthetic I0(Ll/xcx;Lcom/tantan/library/svga/SVGAnimationView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->U:Lcom/tantan/library/svga/SVGAnimationView;

    return-void
.end method

.method public static bridge synthetic J(Ll/xcx;)Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xcx;->f:Lv/VText;

    return-object p0
.end method

.method public static bridge synthetic J0(Ll/xcx;Lcom/tantan/library/svga/SVGAnimationView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->M:Lcom/tantan/library/svga/SVGAnimationView;

    return-void
.end method

.method public static bridge synthetic K(Ll/xcx;)Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xcx;->F:Lv/VText;

    return-object p0
.end method

.method public static bridge synthetic K0(Ll/xcx;Lcom/tantan/library/svga/SVGAnimationView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->Q:Lcom/tantan/library/svga/SVGAnimationView;

    return-void
.end method

.method public static bridge synthetic L(Ll/xcx;)Ll/xbx;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xcx;->k0:Ll/xbx;

    return-object p0
.end method

.method public static bridge synthetic L0(Ll/xcx;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->F:Lv/VText;

    return-void
.end method

.method public static bridge synthetic M(Ll/xcx;)Landroidx/recyclerview/widget/LinearLayoutManager;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xcx;->V0:Landroidx/recyclerview/widget/LinearLayoutManager;

    return-object p0
.end method

.method public static bridge synthetic M0(Ll/xcx;Landroid/widget/ImageView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->R:Landroid/widget/ImageView;

    return-void
.end method

.method public static bridge synthetic N(Ll/xcx;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/xcx;->L0:Z

    return p0
.end method

.method public static bridge synthetic N0(Ll/xcx;Landroid/widget/FrameLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->P:Landroid/widget/FrameLayout;

    return-void
.end method

.method public static bridge synthetic O(Ll/xcx;Lv/VButton_FakeShadow;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->X:Lv/VButton_FakeShadow;

    return-void
.end method

.method public static bridge synthetic O0(Ll/xcx;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->S:Lv/VText;

    return-void
.end method

.method public static bridge synthetic P(Ll/xcx;Lv/VLinear;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->A:Lv/VLinear;

    return-void
.end method

.method public static bridge synthetic P0(Ll/xcx;IILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/xcx;->b2(IILjava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic Q(Ll/xcx;Lv/VImage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->C:Lv/VImage;

    return-void
.end method

.method public static bridge synthetic Q0(Ll/xcx;Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/xcx;->g2(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic R(Ll/xcx;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->B:Lv/VText;

    return-void
.end method

.method public static bridge synthetic R0(Ll/xcx;Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/xcx;->h2(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic S(Ll/xcx;Lv/VEditText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->E:Lv/VEditText;

    return-void
.end method

.method public static bridge synthetic T(Ll/xcx;Landroid/widget/LinearLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->D:Landroid/widget/LinearLayout;

    return-void
.end method

.method public static bridge synthetic U(Ll/xcx;Lv/VLinear;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->G:Lv/VLinear;

    return-void
.end method

.method public static bridge synthetic V(Ll/xcx;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->z:Landroid/widget/TextView;

    return-void
.end method

.method public static bridge synthetic W(Ll/xcx;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->y:Landroid/widget/TextView;

    return-void
.end method

.method private W0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/xcx;->V0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static bridge synthetic X(Ll/xcx;Landroid/widget/ImageView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->J:Landroid/widget/ImageView;

    return-void
.end method

.method public static bridge synthetic Y(Ll/xcx;Landroid/widget/FrameLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->H:Landroid/widget/FrameLayout;

    return-void
.end method

.method private Y1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xcx;->r:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/d79;->j0()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Ll/xcx;->r:Lv/VImage;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sget v0, Ll/dbc0;->ce:I

    .line 20
    .line 21
    invoke-static {p0, v0}, Ll/j26;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v1, p0}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    sget v0, Ll/dbc0;->be:I

    .line 34
    .line 35
    invoke-static {p0, v0}, Ll/j26;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {v1, p0}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static bridge synthetic Z(Ll/xcx;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->K:Lv/VText;

    return-void
.end method

.method private Z1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xcx;->n:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/d79;->j0()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Ll/xcx;->n:Lv/VImage;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sget v0, Ll/dbc0;->ce:I

    .line 20
    .line 21
    invoke-static {p0, v0}, Ll/j26;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v1, p0}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    sget v0, Ll/dbc0;->be:I

    .line 34
    .line 35
    invoke-static {p0, v0}, Ll/j26;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {v1, p0}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static synthetic a(Ll/xcx;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xcx;->z1()V

    return-void
.end method

.method public static bridge synthetic a0(Ll/xcx;Landroid/widget/ImageView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->V:Landroid/widget/ImageView;

    return-void
.end method

.method private a2()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->globalLifeCycle_()Ljava/util/HashMap;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Landroid/app/Activity;->getTaskId()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ljava/util/ArrayList;

    .line 25
    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    iget-object p0, p0, Ll/xcx;->k0:Ll/xbx;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/xbx;->s1()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    const/4 v2, 0x0

    .line 39
    if-lez v1, :cond_1

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Lcom/p1/mobile/android/app/Act$r;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Landroid/app/Activity;

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    const/4 v0, 0x0

    .line 57
    :goto_0
    if-eqz v0, :cond_3

    .line 58
    .line 59
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    if-eqz v1, :cond_3

    .line 64
    .line 65
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    if-eqz v1, :cond_3

    .line 74
    .line 75
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-lez v1, :cond_3

    .line 88
    .line 89
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    if-gtz v1, :cond_2

    .line 102
    .line 103
    goto :goto_1

    .line 104
    :cond_2
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-static {v0, p0, v2}, Ll/z7x;->a(Landroid/app/Activity;Landroid/app/Activity;I)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_3
    :goto_1
    iget-object p0, p0, Ll/xcx;->k0:Ll/xbx;

    .line 113
    .line 114
    invoke-virtual {p0}, Ll/xbx;->s1()V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public static synthetic b(Ll/xcx;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xcx;->p1(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic b0(Ll/xcx;Landroid/widget/FrameLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->T:Landroid/widget/FrameLayout;

    return-void
.end method

.method public static synthetic c(Ll/xcx;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xcx;->E1(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic c0(Ll/xcx;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->W:Lv/VText;

    return-void
.end method

.method private c2()V
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v2, 0x0

    .line 16
    const/4 v3, 0x1

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 26
    .line 27
    iget-object v0, v0, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->rq(Lcom/p1/mobile/putong/data/SettingGroups;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    iget-object v0, p0, Ll/xcx;->K0:Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    iget-object v0, p0, Ll/xcx;->K0:Lcom/p1/mobile/putong/data/User;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 50
    .line 51
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_0

    .line 56
    .line 57
    iget-object v0, p0, Ll/xcx;->K0:Lcom/p1/mobile/putong/data/User;

    .line 58
    .line 59
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 66
    .line 67
    iget-object v0, v0, Lcom/p1/mobile/putong/data/IntlMoreGender;->newGender:Lcom/p1/mobile/putong/data/IntlGender;

    .line 68
    .line 69
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_0

    .line 74
    .line 75
    move v0, v3

    .line 76
    goto :goto_0

    .line 77
    :cond_0
    move v0, v2

    .line 78
    :goto_0
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 90
    .line 91
    .line 92
    move-result v4

    .line 93
    const/4 v5, -0x1

    .line 94
    sparse-switch v4, :sswitch_data_0

    .line 95
    .line 96
    .line 97
    :goto_1
    move v2, v5

    .line 98
    goto :goto_2

    .line 99
    :sswitch_0
    const-string v2, "zh"

    .line 100
    .line 101
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-nez v1, :cond_1

    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_1
    const/4 v2, 0x5

    .line 109
    goto :goto_2

    .line 110
    :sswitch_1
    const-string v2, "vi"

    .line 111
    .line 112
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    if-nez v1, :cond_2

    .line 117
    .line 118
    goto :goto_1

    .line 119
    :cond_2
    const/4 v2, 0x4

    .line 120
    goto :goto_2

    .line 121
    :sswitch_2
    const-string v2, "th"

    .line 122
    .line 123
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    if-nez v1, :cond_3

    .line 128
    .line 129
    goto :goto_1

    .line 130
    :cond_3
    const/4 v2, 0x3

    .line 131
    goto :goto_2

    .line 132
    :sswitch_3
    const-string v2, "ko"

    .line 133
    .line 134
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    if-nez v1, :cond_4

    .line 139
    .line 140
    goto :goto_1

    .line 141
    :cond_4
    const/4 v2, 0x2

    .line 142
    goto :goto_2

    .line 143
    :sswitch_4
    const-string v2, "ja"

    .line 144
    .line 145
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    if-nez v1, :cond_5

    .line 150
    .line 151
    goto :goto_1

    .line 152
    :cond_5
    move v2, v3

    .line 153
    goto :goto_2

    .line 154
    :sswitch_5
    const-string v3, "in"

    .line 155
    .line 156
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    if-nez v1, :cond_6

    .line 161
    .line 162
    goto :goto_1

    .line 163
    :cond_6
    :goto_2
    packed-switch v2, :pswitch_data_0

    .line 164
    .line 165
    .line 166
    if-eqz v0, :cond_7

    .line 167
    .line 168
    sget v0, Ll/dbc0;->L9:I

    .line 169
    .line 170
    goto/16 :goto_4

    .line 171
    .line 172
    :cond_7
    sget v0, Ll/dbc0;->T9:I

    .line 173
    .line 174
    goto/16 :goto_4

    .line 175
    .line 176
    :pswitch_0
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    invoke-virtual {v1}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    const-string v2, "TW"

    .line 185
    .line 186
    if-eq v1, v2, :cond_a

    .line 187
    .line 188
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    invoke-virtual {v1}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    const-string v2, "HK"

    .line 197
    .line 198
    if-eq v1, v2, :cond_a

    .line 199
    .line 200
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    invoke-virtual {v1}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v1

    .line 208
    const-string v2, "MO"

    .line 209
    .line 210
    if-ne v1, v2, :cond_8

    .line 211
    .line 212
    goto :goto_3

    .line 213
    :cond_8
    if-eqz v0, :cond_9

    .line 214
    .line 215
    sget v0, Ll/dbc0;->R9:I

    .line 216
    .line 217
    goto :goto_4

    .line 218
    :cond_9
    sget v0, Ll/dbc0;->Z9:I

    .line 219
    .line 220
    goto :goto_4

    .line 221
    :cond_a
    :goto_3
    if-eqz v0, :cond_b

    .line 222
    .line 223
    sget v0, Ll/dbc0;->S9:I

    .line 224
    .line 225
    goto :goto_4

    .line 226
    :cond_b
    sget v0, Ll/dbc0;->aa:I

    .line 227
    .line 228
    goto :goto_4

    .line 229
    :pswitch_1
    if-eqz v0, :cond_c

    .line 230
    .line 231
    sget v0, Ll/dbc0;->Q9:I

    .line 232
    .line 233
    goto :goto_4

    .line 234
    :cond_c
    sget v0, Ll/dbc0;->Y9:I

    .line 235
    .line 236
    goto :goto_4

    .line 237
    :pswitch_2
    if-eqz v0, :cond_d

    .line 238
    .line 239
    sget v0, Ll/dbc0;->P9:I

    .line 240
    .line 241
    goto :goto_4

    .line 242
    :cond_d
    sget v0, Ll/dbc0;->X9:I

    .line 243
    .line 244
    goto :goto_4

    .line 245
    :pswitch_3
    if-eqz v0, :cond_e

    .line 246
    .line 247
    sget v0, Ll/dbc0;->O9:I

    .line 248
    .line 249
    goto :goto_4

    .line 250
    :cond_e
    sget v0, Ll/dbc0;->W9:I

    .line 251
    .line 252
    goto :goto_4

    .line 253
    :pswitch_4
    if-eqz v0, :cond_f

    .line 254
    .line 255
    sget v0, Ll/dbc0;->N9:I

    .line 256
    .line 257
    goto :goto_4

    .line 258
    :cond_f
    sget v0, Ll/dbc0;->V9:I

    .line 259
    .line 260
    goto :goto_4

    .line 261
    :pswitch_5
    if-eqz v0, :cond_10

    .line 262
    .line 263
    sget v0, Ll/dbc0;->M9:I

    .line 264
    .line 265
    goto :goto_4

    .line 266
    :cond_10
    sget v0, Ll/dbc0;->U9:I

    .line 267
    .line 268
    :goto_4
    iget-object p0, p0, Ll/xcx;->w:Lv/VImage;

    .line 269
    .line 270
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 271
    .line 272
    .line 273
    return-void

    .line 274
    nop

    .line 275
    :sswitch_data_0
    .sparse-switch
        0xd25 -> :sswitch_5
        0xd37 -> :sswitch_4
        0xd64 -> :sswitch_3
        0xe74 -> :sswitch_2
        0xeb3 -> :sswitch_1
        0xf2e -> :sswitch_0
    .end sparse-switch

    .line 276
    .line 277
    .line 278
    .line 279
    .line 280
    .line 281
    .line 282
    .line 283
    .line 284
    .line 285
    .line 286
    .line 287
    .line 288
    .line 289
    .line 290
    .line 291
    .line 292
    .line 293
    .line 294
    .line 295
    .line 296
    .line 297
    .line 298
    .line 299
    .line 300
    .line 301
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static synthetic d(Ll/xcx;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xcx;->y1(Ljava/lang/Long;)V

    return-void
.end method

.method public static bridge synthetic d0(Ll/xcx;Landroidx/constraintlayout/widget/Guideline;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->o:Landroidx/constraintlayout/widget/Guideline;

    return-void
.end method

.method public static synthetic e(Ll/xcx;Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xcx;->r1(Landroid/view/View;Z)V

    return-void
.end method

.method public static bridge synthetic e0(Ll/xcx;Lcom/p1/mobile/putong/core/view/HeartView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->d:Lcom/p1/mobile/putong/core/view/HeartView;

    return-void
.end method

.method public static synthetic f(Ll/xcx;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xcx;->s1()V

    return-void
.end method

.method public static bridge synthetic f0(Ll/xcx;Lv/VRecyclerView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->x:Lv/VRecyclerView;

    return-void
.end method

.method public static bridge synthetic g0(Ll/xcx;Lv/VImage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->w:Lv/VImage;

    return-void
.end method

.method public static bridge synthetic h0(Ll/xcx;Lv/VDraweeView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->l:Lv/VDraweeView;

    return-void
.end method

.method public static synthetic i(Ll/xcx;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xcx;->K1(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic i0(Ll/xcx;Lv/VRelative;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->k:Lv/VRelative;

    return-void
.end method

.method public static synthetic j(Ll/xcx;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xcx;->I1(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static bridge synthetic j0(Ll/xcx;Lv/VDraweeView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->q:Lv/VDraweeView;

    return-void
.end method

.method public static synthetic k(Ll/xcx;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xcx;->A1(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic k0(Ll/xcx;Lv/VRelative;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->p:Lv/VRelative;

    return-void
.end method

.method public static synthetic l(Ll/xcx;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xcx;->H1(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic l0(Ll/xcx;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->i:Landroid/widget/TextView;

    return-void
.end method

.method public static synthetic m(Ll/xcx;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xcx;->F1(ILandroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic m0(Ll/xcx;Landroidx/constraintlayout/widget/ConstraintLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-void
.end method

.method private synthetic m1(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic n(Ll/xcx;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/xcx;->q1(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic n0(Ll/xcx;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->g:Landroid/widget/TextView;

    return-void
.end method

.method public static bridge synthetic o0(Ll/xcx;Landroidx/constraintlayout/widget/ConstraintLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->c:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-void
.end method

.method public static synthetic p(Ll/xcx;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xcx;->m1(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic p0(Ll/xcx;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->v:Landroid/view/View;

    return-void
.end method

.method public static synthetic q(Ll/xcx;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xcx;->t1(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic q0(Ll/xcx;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->h:Lv/VText;

    return-void
.end method

.method public static bridge synthetic r0(Ll/xcx;Lv/VFrame;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->s:Lv/VFrame;

    return-void
.end method

.method public static synthetic s(Ll/xcx;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xcx;->G1(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic s0(Ll/xcx;Lv/VIcon;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->u:Lv/VIcon;

    return-void
.end method

.method public static bridge synthetic t0(Ll/xcx;Lv/VIcon;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->t:Lv/VIcon;

    return-void
.end method

.method private synthetic t1(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/xcx;->k0:Ll/xbx;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->e:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ll/k8x;->p0(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v0, "match_source"

    .line 14
    .line 15
    invoke-static {v0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    filled-new-array {p1}, [Ll/sfj0$a;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v0, "e_matched_later"

    .line 24
    .line 25
    const-string v1, "p_successful_match_view"

    .line 26
    .line 27
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const/4 v0, 0x1

    .line 35
    iput-boolean v0, p1, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->i:Z

    .line 36
    .line 37
    iget-object p0, p0, Ll/xcx;->k0:Ll/xbx;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/xbx;->Z1()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static synthetic u(Ll/xcx;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xcx;->B1(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic u0(Ll/xcx;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->f:Lv/VText;

    return-void
.end method

.method private synthetic u1(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Ll/xcx;->J0:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const-string p1, "e_matched_share"

    .line 6
    .line 7
    const-string v0, "p_successful_match_view"

    .line 8
    .line 9
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/xcx;->k0:Ll/xbx;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xbx;->d2()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static synthetic v(Ll/xcx;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xcx;->J1(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic v0(Ll/xcx;Landroid/widget/ImageView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->N:Landroid/widget/ImageView;

    return-void
.end method

.method private synthetic v1(Landroid/view/View;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->pageId()Ljava/lang/String;

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
    const-string v1, "e_matched_send_message"

    .line 13
    .line 14
    invoke-static {v1, p1, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/xcx;->E:Lv/VEditText;

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-static {}, Ll/gra;->j2()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v1, p0, Ll/xcx;->K0:Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    new-instance v4, Ll/xcx$a;

    .line 44
    .line 45
    invoke-direct {v4, p0}, Ll/xcx$a;-><init>(Ll/xcx;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Ll/xcx;->k0:Ll/xbx;

    .line 49
    .line 50
    iget-object v5, p0, Ll/xbx;->i:Lcom/p1/mobile/putong/core/data/IceBreakQuestion;

    .line 51
    .line 52
    const/4 v3, 0x1

    .line 53
    invoke-static/range {v0 .. v5}, Ll/d810;->i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;ZLjava/lang/Runnable;Lcom/p1/mobile/putong/core/data/IceBreakQuestion;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_0
    iget-object p1, p0, Ll/xcx;->k0:Ll/xbx;

    .line 58
    .line 59
    iget-boolean p0, p0, Ll/xcx;->p0:Z

    .line 60
    .line 61
    invoke-virtual {p1, v2, p0}, Ll/xbx;->c2(Ljava/lang/String;Z)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public static synthetic w(Ll/xcx;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xcx;->n1(ILandroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic w0(Ll/xcx;Landroid/widget/FrameLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->L:Landroid/widget/FrameLayout;

    return-void
.end method

.method public static synthetic x(Ll/xcx;[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xcx;->w1([I)V

    return-void
.end method

.method public static bridge synthetic x0(Ll/xcx;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->O:Lv/VText;

    return-void
.end method

.method public static synthetic y(Ll/xcx;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xcx;->L1(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic y0(Ll/xcx;Lv/VButton;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->Y:Lv/VButton;

    return-void
.end method

.method public static synthetic z(Ll/xcx;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xcx;->u1(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic z0(Ll/xcx;Lcom/sunshine/engine/bone/StageView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->e:Lcom/sunshine/engine/bone/StageView;

    return-void
.end method


# virtual methods
.method public final synthetic A1(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/4 v0, 0x0

    .line 10
    new-array v1, v0, [Ll/sfj0$a;

    .line 11
    .line 12
    const-string v2, "e_intl_instantmatch_no_ultra_click"

    .line 13
    .line 14
    invoke-static {v2, p1, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/joa;->D3()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/a;->w()Lcom/p1/mobile/putong/core/ui/match/a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/match/a;->A()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-nez p1, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sget v1, Lcom/p1/mobile/putong/core/R$string;->u9:I

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {p1, v0}, Ll/o1j0;->F(Landroid/app/Activity;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/a;->w()Lcom/p1/mobile/putong/core/ui/match/a;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iget-object v1, p0, Ll/xcx;->K0:Lcom/p1/mobile/putong/data/User;

    .line 67
    .line 68
    new-instance v2, Ll/ecx;

    .line 69
    .line 70
    invoke-direct {v2, p0}, Ll/ecx;-><init>(Ll/xcx;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/match/a;->J(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/x20;)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_1
    iget-object p0, p0, Ll/xcx;->k0:Ll/xbx;

    .line 78
    .line 79
    invoke-virtual {p0, v0}, Ll/xbx;->f2(Z)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public final synthetic B1(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->pageId()Ljava/lang/String;

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
    const-string v1, "e_intl_instantmatch_no_ultra_giveup"

    .line 13
    .line 14
    invoke-static {v1, p1, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/xcx;->Z:Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic C1(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const/4 v0, 0x0

    .line 10
    new-array v1, v0, [Ll/sfj0$a;

    .line 11
    .line 12
    const-string v2, "e_intl_match_sayhi"

    .line 13
    .line 14
    invoke-static {v2, p1, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/xcx;->k0:Ll/xbx;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ll/xbx;->e2(Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic E1(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic F1(ILandroid/view/View;)V
    .locals 0

    .line 1
    const/16 p2, 0x2b

    .line 2
    .line 3
    if-ne p1, p2, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/xcx;->k0:Ll/xbx;

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-virtual {p0, p1}, Ll/xbx;->j2(Z)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic G1(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic H1(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 2

    .line 1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 18
    .line 19
    const-string v1, "verified"

    .line 20
    .line 21
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    const-string p0, "\u5df2\u8ba4\u8bc1"

    .line 28
    .line 29
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 40
    .line 41
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 42
    .line 43
    const-string v0, "pending"

    .line 44
    .line 45
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    if-eqz p2, :cond_1

    .line 50
    .line 51
    const-string p0, "\u6b63\u5728\u5ba1\u6838\u4e2d"

    .line 52
    .line 53
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-static {p0}, Ll/pq4;->q(Lcom/p1/mobile/android/app/Act;)V

    .line 62
    .line 63
    .line 64
    :goto_0
    const-string p0, "receiver_user_id"

    .line 65
    .line 66
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    filled-new-array {p0}, [Ll/pf60;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    const-string p1, "e_successful_match_view_verification"

    .line 77
    .line 78
    const-string p2, "p_successful_match_view"

    .line 79
    .line 80
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public final synthetic I1(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xcx;->d:Lcom/p1/mobile/putong/core/view/HeartView;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/Float;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/view/HeartView;->setPercent(F)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic J1(Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "["

    .line 4
    .line 5
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Hj:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v0, "]"

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const-string v0, "NEW_EMOJI_HAHE"

    .line 31
    .line 32
    const/4 v1, 0x1

    .line 33
    invoke-virtual {p0, p1, v0, v1}, Ll/xcx;->d1(Ljava/lang/String;Ljava/lang/String;I)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic K1(Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "["

    .line 4
    .line 5
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Gj:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v0, "]"

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const-string v0, "NEW_EMOJI_BEER"

    .line 31
    .line 32
    const/4 v1, 0x2

    .line 33
    invoke-virtual {p0, p1, v0, v1}, Ll/xcx;->d1(Ljava/lang/String;Ljava/lang/String;I)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic L1(Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "["

    .line 4
    .line 5
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget v1, Lcom/p1/mobile/putong/core/R$string;->j4:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v0, "]"

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const-string v0, "EMOJI_70"

    .line 31
    .line 32
    const/4 v1, 0x3

    .line 33
    invoke-virtual {p0, p1, v0, v1}, Ll/xcx;->d1(Ljava/lang/String;Ljava/lang/String;I)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic M1(Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "["

    .line 4
    .line 5
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget v1, Lcom/p1/mobile/putong/core/R$string;->i4:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v0, "]"

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const-string v0, "EMOJI_63"

    .line 31
    .line 32
    const/4 v1, 0x4

    .line 33
    invoke-virtual {p0, p1, v0, v1}, Ll/xcx;->d1(Ljava/lang/String;Ljava/lang/String;I)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final O1(Lcom/p1/mobile/putong/data/User;ILjava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            "I",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/16 v0, 0xf

    .line 2
    .line 3
    if-ne p2, v0, :cond_0

    .line 4
    .line 5
    iget-object p3, p0, Ll/xcx;->i:Landroid/widget/TextView;

    .line 6
    .line 7
    sget v0, Lcom/p1/mobile/putong/core/R$string;->R1:I

    .line 8
    .line 9
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(I)V

    .line 10
    .line 11
    .line 12
    goto/16 :goto_3

    .line 13
    .line 14
    :cond_0
    const/16 v0, 0xd

    .line 15
    .line 16
    const/16 v1, 0xb

    .line 17
    .line 18
    const/16 v2, 0xc

    .line 19
    .line 20
    if-eq p2, v2, :cond_6

    .line 21
    .line 22
    if-eq p2, v1, :cond_6

    .line 23
    .line 24
    if-ne p2, v0, :cond_1

    .line 25
    .line 26
    goto/16 :goto_2

    .line 27
    .line 28
    :cond_1
    if-eqz p2, :cond_5

    .line 29
    .line 30
    const/16 v0, 0x27

    .line 31
    .line 32
    if-eq p2, v0, :cond_5

    .line 33
    .line 34
    const/16 v0, 0x25

    .line 35
    .line 36
    if-eq p2, v0, :cond_5

    .line 37
    .line 38
    const/16 v0, 0x26

    .line 39
    .line 40
    if-eq p2, v0, :cond_5

    .line 41
    .line 42
    const/16 v0, 0x2f

    .line 43
    .line 44
    if-eq p2, v0, :cond_5

    .line 45
    .line 46
    const/16 v0, 0xa

    .line 47
    .line 48
    if-ne p2, v0, :cond_2

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_2
    const/4 v0, 0x1

    .line 52
    if-ne p2, v0, :cond_4

    .line 53
    .line 54
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-lez v0, :cond_3

    .line 59
    .line 60
    new-instance v0, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 63
    .line 64
    .line 65
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const-string v1, " ("

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const/4 v1, 0x0

    .line 76
    invoke-virtual {p3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p3

    .line 80
    check-cast p3, Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string p3, ")"

    .line 86
    .line 87
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p3

    .line 94
    goto :goto_0

    .line 95
    :cond_3
    iget-object p3, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 96
    .line 97
    :goto_0
    iget-object v0, p0, Ll/xcx;->i:Landroid/widget/TextView;

    .line 98
    .line 99
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Qm:I

    .line 104
    .line 105
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    invoke-virtual {p0, v0, v1, p3, p2}, Ll/xcx;->d2(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;I)V

    .line 110
    .line 111
    .line 112
    goto :goto_3

    .line 113
    :cond_4
    const/16 p3, 0x1a

    .line 114
    .line 115
    if-ne p2, p3, :cond_9

    .line 116
    .line 117
    iget-object p3, p0, Ll/xcx;->i:Landroid/widget/TextView;

    .line 118
    .line 119
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    sget v1, Lcom/p1/mobile/putong/core/R$string;->ei:I

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 130
    .line 131
    invoke-virtual {p0, p3, v0, v1, p2}, Ll/xcx;->d2(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;I)V

    .line 132
    .line 133
    .line 134
    goto :goto_3

    .line 135
    :cond_5
    :goto_1
    iget-object p3, p0, Ll/xcx;->i:Landroid/widget/TextView;

    .line 136
    .line 137
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    sget v1, Lcom/p1/mobile/putong/core/R$string;->ei:I

    .line 142
    .line 143
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 148
    .line 149
    invoke-virtual {p0, p3, v0, v1, p2}, Ll/xcx;->d2(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;I)V

    .line 150
    .line 151
    .line 152
    goto :goto_3

    .line 153
    :cond_6
    :goto_2
    if-ne p2, v2, :cond_7

    .line 154
    .line 155
    iget-object p3, p0, Ll/xcx;->i:Landroid/widget/TextView;

    .line 156
    .line 157
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    sget v1, Lcom/p1/mobile/putong/core/R$string;->X0:I

    .line 162
    .line 163
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 168
    .line 169
    invoke-virtual {p0, p3, v0, v1, p2}, Ll/xcx;->d2(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;I)V

    .line 170
    .line 171
    .line 172
    goto :goto_3

    .line 173
    :cond_7
    if-ne p2, v0, :cond_8

    .line 174
    .line 175
    iget-object p3, p0, Ll/xcx;->i:Landroid/widget/TextView;

    .line 176
    .line 177
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    sget v1, Lcom/p1/mobile/putong/core/R$string;->H2:I

    .line 182
    .line 183
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 188
    .line 189
    invoke-virtual {p0, p3, v0, v1, p2}, Ll/xcx;->d2(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;I)V

    .line 190
    .line 191
    .line 192
    goto :goto_3

    .line 193
    :cond_8
    if-ne p2, v1, :cond_9

    .line 194
    .line 195
    iget-object p3, p0, Ll/xcx;->i:Landroid/widget/TextView;

    .line 196
    .line 197
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    sget v1, Lcom/p1/mobile/putong/core/R$string;->W0:I

    .line 202
    .line 203
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 208
    .line 209
    invoke-virtual {p0, p3, v0, v1, p2}, Ll/xcx;->d2(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;I)V

    .line 210
    .line 211
    .line 212
    :cond_9
    :goto_3
    iget-boolean p3, p0, Ll/xcx;->J0:Z

    .line 213
    .line 214
    if-nez p3, :cond_a

    .line 215
    .line 216
    iget-object p3, p0, Ll/xcx;->i:Landroid/widget/TextView;

    .line 217
    .line 218
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    sget v1, Lcom/p1/mobile/putong/core/R$string;->S4:I

    .line 223
    .line 224
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 229
    .line 230
    invoke-virtual {p0, p3, v0, p1, p2}, Ll/xcx;->d2(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;I)V

    .line 231
    .line 232
    .line 233
    :cond_a
    return-void
.end method

.method public final P1(I)Landroid/animation/Animator;
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget v1, v0, Ll/xcx;->Q0:F

    .line 4
    .line 5
    const/high16 v2, 0x42200000    # 40.0f

    .line 6
    .line 7
    mul-float/2addr v1, v2

    .line 8
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/16 v3, 0x1f4

    .line 13
    .line 14
    const/4 v4, 0x0

    .line 15
    move/from16 v5, p1

    .line 16
    .line 17
    invoke-virtual {v0, v5, v3, v1, v4}, Ll/xcx;->k2(IIII)Landroid/animation/Animator;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const/4 v5, 0x1

    .line 22
    invoke-virtual {v0, v3, v4, v5}, Ll/xcx;->U0(III)Landroid/animation/Animator;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    iget-object v6, v0, Ll/xcx;->g:Landroid/widget/TextView;

    .line 27
    .line 28
    sget-object v7, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 29
    .line 30
    new-instance v12, Landroid/view/animation/DecelerateInterpolator;

    .line 31
    .line 32
    invoke-direct {v12}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 33
    .line 34
    .line 35
    const/4 v14, 0x2

    .line 36
    new-array v13, v14, [F

    .line 37
    .line 38
    fill-array-data v13, :array_0

    .line 39
    .line 40
    .line 41
    const-wide/16 v8, 0x0

    .line 42
    .line 43
    const-wide/16 v10, 0x1f4

    .line 44
    .line 45
    invoke-static/range {v6 .. v13}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 46
    .line 47
    .line 48
    move-result-object v6

    .line 49
    iget-object v15, v0, Ll/xcx;->g:Landroid/widget/TextView;

    .line 50
    .line 51
    sget-object v16, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 52
    .line 53
    new-instance v21, Landroid/view/animation/DecelerateInterpolator;

    .line 54
    .line 55
    invoke-direct/range {v21 .. v21}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    int-to-float v0, v0

    .line 63
    new-array v2, v14, [F

    .line 64
    .line 65
    aput v0, v2, v4

    .line 66
    .line 67
    const/4 v0, 0x0

    .line 68
    aput v0, v2, v5

    .line 69
    .line 70
    const-wide/16 v17, 0x0

    .line 71
    .line 72
    const-wide/16 v19, 0x1f4

    .line 73
    .line 74
    move-object/from16 v22, v2

    .line 75
    .line 76
    invoke-static/range {v15 .. v22}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    filled-new-array {v1, v3, v6, v0}, [Landroid/animation/Animator;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    return-object v0

    .line 89
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public Q1()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xcx;->X:Lv/VButton_FakeShadow;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroid/view/View;->setClickable(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final R1()Landroid/animation/Animator;
    .locals 15

    .line 1
    iget-object v0, p0, Ll/xcx;->k:Lv/VRelative;

    .line 2
    .line 3
    iget v1, p0, Ll/xcx;->R0:F

    .line 4
    .line 5
    const/high16 v2, 0x42d80000    # 108.0f

    .line 6
    .line 7
    mul-float/2addr v1, v2

    .line 8
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    neg-int v1, v1

    .line 13
    int-to-float v1, v1

    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/xcx;->p:Lv/VRelative;

    .line 18
    .line 19
    iget v1, p0, Ll/xcx;->R0:F

    .line 20
    .line 21
    mul-float/2addr v1, v2

    .line 22
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    int-to-float v1, v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 28
    .line 29
    .line 30
    new-instance v9, Ll/fzf0;

    .line 31
    .line 32
    const v0, 0x3ecccccd    # 0.4f

    .line 33
    .line 34
    .line 35
    invoke-direct {v9, v0}, Ll/fzf0;-><init>(F)V

    .line 36
    .line 37
    .line 38
    iget-object v3, p0, Ll/xcx;->k:Lv/VRelative;

    .line 39
    .line 40
    sget-object v4, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 41
    .line 42
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    neg-int v0, v0

    .line 47
    int-to-float v0, v0

    .line 48
    iget v1, p0, Ll/xcx;->R0:F

    .line 49
    .line 50
    mul-float/2addr v0, v1

    .line 51
    const/high16 v1, 0x41f00000    # 30.0f

    .line 52
    .line 53
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    int-to-float v5, v5

    .line 58
    iget v6, p0, Ll/xcx;->R0:F

    .line 59
    .line 60
    mul-float/2addr v5, v6

    .line 61
    const/4 v11, 0x2

    .line 62
    new-array v10, v11, [F

    .line 63
    .line 64
    const/4 v12, 0x0

    .line 65
    aput v0, v10, v12

    .line 66
    .line 67
    const/4 v0, 0x1

    .line 68
    aput v5, v10, v0

    .line 69
    .line 70
    const-wide/16 v5, 0xc8

    .line 71
    .line 72
    const-wide/16 v7, 0x2bc

    .line 73
    .line 74
    invoke-static/range {v3 .. v10}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 75
    .line 76
    .line 77
    move-result-object v13

    .line 78
    iget-object v3, p0, Ll/xcx;->p:Lv/VRelative;

    .line 79
    .line 80
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    int-to-float v2, v2

    .line 85
    iget v10, p0, Ll/xcx;->R0:F

    .line 86
    .line 87
    mul-float/2addr v2, v10

    .line 88
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    neg-int v1, v1

    .line 93
    int-to-float v1, v1

    .line 94
    iget v10, p0, Ll/xcx;->R0:F

    .line 95
    .line 96
    mul-float/2addr v1, v10

    .line 97
    new-array v10, v11, [F

    .line 98
    .line 99
    aput v2, v10, v12

    .line 100
    .line 101
    aput v1, v10, v0

    .line 102
    .line 103
    invoke-static/range {v3 .. v10}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    iget-object v1, p0, Ll/xcx;->k:Lv/VRelative;

    .line 108
    .line 109
    sget-object v2, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 110
    .line 111
    new-instance v7, Landroid/view/animation/AccelerateInterpolator;

    .line 112
    .line 113
    invoke-direct {v7}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 114
    .line 115
    .line 116
    new-array v8, v11, [F

    .line 117
    .line 118
    fill-array-data v8, :array_0

    .line 119
    .line 120
    .line 121
    const-wide/16 v3, 0x0

    .line 122
    .line 123
    invoke-static/range {v1 .. v8}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    iget-object v3, p0, Ll/xcx;->p:Lv/VRelative;

    .line 128
    .line 129
    new-instance v8, Landroid/view/animation/AccelerateInterpolator;

    .line 130
    .line 131
    invoke-direct {v8}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    .line 132
    .line 133
    .line 134
    new-array v9, v11, [F

    .line 135
    .line 136
    fill-array-data v9, :array_1

    .line 137
    .line 138
    .line 139
    const-wide/16 v4, 0x0

    .line 140
    .line 141
    const-wide/16 v6, 0xc8

    .line 142
    .line 143
    move-object v14, v3

    .line 144
    move-object v3, v2

    .line 145
    move-object v2, v14

    .line 146
    invoke-static/range {v2 .. v9}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    filled-new-array {v13, v0, v1, v2}, [Landroid/animation/Animator;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    iput-object v0, p0, Ll/xcx;->F0:Landroid/animation/Animator;

    .line 159
    .line 160
    return-object v0

    .line 161
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public S0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/xcx$h;->a(Ll/xcx;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public S1(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/BreakIce;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/xcx;->x:Lv/VRecyclerView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/xcx;->x:Lv/VRecyclerView;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 14
    .line 15
    iput-object v0, p0, Ll/xcx;->V0:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 16
    .line 17
    new-instance v0, Ll/xcx$g;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-direct {v0, p0, v1}, Ll/xcx$g;-><init>(Ll/xcx;Ll/zcx;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/xcx;->U0:Ll/xcx$g;

    .line 24
    .line 25
    iget-object v1, p0, Ll/xcx;->x:Lv/VRecyclerView;

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/xcx;->U0:Ll/xcx$g;

    .line 31
    .line 32
    invoke-virtual {v0, p1}, Ll/xcx$g;->I(Ljava/util/List;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Ll/xcx;->x:Lv/VRecyclerView;

    .line 36
    .line 37
    new-instance v0, Ll/acx;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/acx;-><init>(Ll/xcx;)V

    .line 40
    .line 41
    .line 42
    invoke-static {p1, v0}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Ll/xcx;->x:Lv/VRecyclerView;

    .line 46
    .line 47
    new-instance v0, Ll/xcx$c;

    .line 48
    .line 49
    invoke-direct {v0, p0}, Ll/xcx$c;-><init>(Ll/xcx;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 53
    .line 54
    .line 55
    const/high16 p1, 0x42c80000    # 100.0f

    .line 56
    .line 57
    iget v0, p0, Ll/xcx;->Q0:F

    .line 58
    .line 59
    mul-float/2addr v0, p1

    .line 60
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    iput p1, p0, Ll/xcx;->T0:I

    .line 65
    .line 66
    iget-object v0, p0, Ll/xcx;->D:Landroid/widget/LinearLayout;

    .line 67
    .line 68
    invoke-static {v0, p1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Ll/xcx;->x:Lv/VRecyclerView;

    .line 72
    .line 73
    const/high16 v0, 0x41200000    # 10.0f

    .line 74
    .line 75
    iget v1, p0, Ll/xcx;->Q0:F

    .line 76
    .line 77
    mul-float/2addr v1, v0

    .line 78
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    invoke-static {p1, v0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Ll/xcx;->T1()V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xcx;->Z:Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public final T1()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/xcx;->X0:Ll/vxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-static {}, Ll/gra;->f3()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-lt v0, v1, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-wide/16 v1, 0x2

    .line 25
    .line 26
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 27
    .line 28
    invoke-static {v1, v2, v3}, Lrx/c;->timer(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Ll/fcx;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/fcx;-><init>(Ll/xcx;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final U0(III)Landroid/animation/Animator;
    .locals 11

    .line 1
    new-instance v6, Landroid/view/animation/DecelerateInterpolator;

    .line 2
    .line 3
    invoke-direct {v6}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/gra;->j2()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v8, 0x1

    .line 11
    const/4 v9, 0x0

    .line 12
    const/4 v10, 0x2

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/xcx;->i:Landroid/widget/TextView;

    .line 16
    .line 17
    sget-object v1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 18
    .line 19
    int-to-long v4, p1

    .line 20
    int-to-float p1, p2

    .line 21
    int-to-float p2, p3

    .line 22
    new-array v7, v10, [F

    .line 23
    .line 24
    aput p1, v7, v9

    .line 25
    .line 26
    aput p2, v7, v8

    .line 27
    .line 28
    const-wide/16 v2, 0x0

    .line 29
    .line 30
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    iget-object v0, p0, Ll/xcx;->j:Lv/VText;

    .line 35
    .line 36
    new-array v7, v10, [F

    .line 37
    .line 38
    aput p1, v7, v9

    .line 39
    .line 40
    aput p2, v7, v8

    .line 41
    .line 42
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    filled-new-array {p3, p0}, [Landroid/animation/Animator;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-static {p0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0

    .line 55
    :cond_0
    iget-object v0, p0, Ll/xcx;->h:Lv/VText;

    .line 56
    .line 57
    sget-object v1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 58
    .line 59
    int-to-long v4, p1

    .line 60
    int-to-float p1, p2

    .line 61
    int-to-float p2, p3

    .line 62
    new-array v7, v10, [F

    .line 63
    .line 64
    aput p1, v7, v9

    .line 65
    .line 66
    aput p2, v7, v8

    .line 67
    .line 68
    const-wide/16 v2, 0x0

    .line 69
    .line 70
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 71
    .line 72
    .line 73
    move-result-object p3

    .line 74
    iget-object v0, p0, Ll/xcx;->i:Landroid/widget/TextView;

    .line 75
    .line 76
    new-array v7, v10, [F

    .line 77
    .line 78
    aput p1, v7, v9

    .line 79
    .line 80
    aput p2, v7, v8

    .line 81
    .line 82
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    filled-new-array {p3, p0}, [Landroid/animation/Animator;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-static {p0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    return-object p0
.end method

.method public U1(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;ILjava/util/ArrayList;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/User;",
            "I",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p2

    .line 2
    .line 3
    move/from16 v1, p3

    .line 4
    .line 5
    if-eqz p1, :cond_1a

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_b

    .line 10
    .line 11
    :cond_0
    iget-object v2, p0, Ll/xcx;->k0:Ll/xbx;

    .line 12
    .line 13
    invoke-virtual {v2}, Ll/xbx;->r1()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    const/16 v3, 0x33

    .line 18
    .line 19
    const/16 v4, 0x32

    .line 20
    .line 21
    if-eq v2, v4, :cond_2

    .line 22
    .line 23
    iget-object v2, p0, Ll/xcx;->k0:Ll/xbx;

    .line 24
    .line 25
    invoke-virtual {v2}, Ll/xbx;->r1()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-ne v2, v3, :cond_1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    iget-object v2, p0, Ll/xcx;->d:Lcom/p1/mobile/putong/core/view/HeartView;

    .line 33
    .line 34
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/view/HeartView;->c()V

    .line 35
    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_2
    :goto_0
    iget-object v2, p0, Ll/xcx;->d:Lcom/p1/mobile/putong/core/view/HeartView;

    .line 39
    .line 40
    const-string v5, "https://auto.tancdn.com/v1/images/eyJpZCI6IjU0SU1CU0ZaRktSNkJSTTY2UEpXUklTTkdNQlo2UzE0IiwidyI6MTUzNSwiaCI6MTM0MywiZCI6MCwibXQiOiJpbWFnZS9qcGVnIiwiZGgiOjg2ODY1NzI1MzAwODg4OTEzOX0.png"

    .line 41
    .line 42
    invoke-virtual {v2, v5}, Lcom/p1/mobile/putong/core/view/HeartView;->d(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object v2, p0, Ll/xcx;->d:Lcom/p1/mobile/putong/core/view/HeartView;

    .line 46
    .line 47
    const-string v5, "#F3E1FF"

    .line 48
    .line 49
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    invoke-virtual {v2, v5}, Landroid/view/View;->setBackgroundColor(I)V

    .line 54
    .line 55
    .line 56
    :goto_1
    iput-object v0, p0, Ll/xcx;->K0:Lcom/p1/mobile/putong/data/User;

    .line 57
    .line 58
    iget-object v2, p0, Ll/xcx;->k0:Ll/xbx;

    .line 59
    .line 60
    invoke-virtual {v2}, Ll/xbx;->r1()I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    const/16 v5, 0x28

    .line 65
    .line 66
    const/16 v6, 0x1e

    .line 67
    .line 68
    const/4 v7, 0x4

    .line 69
    if-ne v2, v5, :cond_4

    .line 70
    .line 71
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 72
    .line 73
    iget-object v2, p0, Ll/xcx;->l:Lv/VDraweeView;

    .line 74
    .line 75
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileBig()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    invoke-virtual {v1, v2, v3}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    iget-object v1, p0, Ll/xcx;->z:Landroid/widget/TextView;

    .line 91
    .line 92
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-virtual {v2}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    if-eqz v3, :cond_3

    .line 105
    .line 106
    sget v3, Lcom/p1/mobile/putong/core/R$string;->di:I

    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_3
    sget v3, Lcom/p1/mobile/putong/core/R$string;->ci:I

    .line 110
    .line 111
    :goto_2
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 116
    .line 117
    .line 118
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 119
    .line 120
    iget-object p0, p0, Ll/xcx;->q:Lv/VDraweeView;

    .line 121
    .line 122
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileBig()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-virtual {v1, p0, v0, v7, v6}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    :cond_4
    iget-object v2, p0, Ll/xcx;->k0:Ll/xbx;

    .line 139
    .line 140
    invoke-virtual {v2}, Ll/xbx;->r1()I

    .line 141
    .line 142
    .line 143
    move-result v2

    .line 144
    const/16 v5, 0x29

    .line 145
    .line 146
    const-string v8, "\u4ed6"

    .line 147
    .line 148
    const-string v9, "\u5979"

    .line 149
    .line 150
    if-ne v2, v5, :cond_8

    .line 151
    .line 152
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 153
    .line 154
    iget-object v2, p0, Ll/xcx;->l:Lv/VDraweeView;

    .line 155
    .line 156
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 157
    .line 158
    .line 159
    move-result-object v3

    .line 160
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 161
    .line 162
    .line 163
    move-result-object v3

    .line 164
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v3

    .line 168
    const/16 v4, 0xbe

    .line 169
    .line 170
    invoke-virtual {v1, v2, v3, v4, v4}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 171
    .line 172
    .line 173
    invoke-static {v0}, Ll/wj90;->c(Lcom/p1/mobile/putong/data/User;)Z

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    if-eqz v1, :cond_5

    .line 178
    .line 179
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 180
    .line 181
    iget-object v2, p0, Ll/xcx;->q:Lv/VDraweeView;

    .line 182
    .line 183
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 184
    .line 185
    .line 186
    move-result-object v3

    .line 187
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileBig()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 188
    .line 189
    .line 190
    move-result-object v3

    .line 191
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v3

    .line 195
    invoke-virtual {v1, v2, v3, v7, v6}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 196
    .line 197
    .line 198
    goto :goto_3

    .line 199
    :cond_5
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 200
    .line 201
    iget-object v2, p0, Ll/xcx;->q:Lv/VDraweeView;

    .line 202
    .line 203
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 204
    .line 205
    .line 206
    move-result-object v3

    .line 207
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 208
    .line 209
    .line 210
    move-result-object v3

    .line 211
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v3

    .line 215
    invoke-virtual {v1, v2, v3, v4, v4}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 216
    .line 217
    .line 218
    :goto_3
    iget-object v1, p0, Ll/xcx;->i:Landroid/widget/TextView;

    .line 219
    .line 220
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 221
    .line 222
    .line 223
    move-result v2

    .line 224
    if-eqz v2, :cond_6

    .line 225
    .line 226
    move-object v8, v9

    .line 227
    :cond_6
    filled-new-array {v8}, [Ljava/lang/Object;

    .line 228
    .line 229
    .line 230
    move-result-object v2

    .line 231
    const-string v3, "\u5f00\u901a\u9ed1\u91d1\u4f1a\u5458\u7acb\u5373\u4e0e%s\u804a\u5929\uff01"

    .line 232
    .line 233
    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v2

    .line 237
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 238
    .line 239
    .line 240
    iget-object v1, p0, Ll/xcx;->z:Landroid/widget/TextView;

    .line 241
    .line 242
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 243
    .line 244
    .line 245
    move-result-object p0

    .line 246
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 247
    .line 248
    .line 249
    move-result-object p0

    .line 250
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 251
    .line 252
    .line 253
    move-result v0

    .line 254
    if-eqz v0, :cond_7

    .line 255
    .line 256
    sget v0, Lcom/p1/mobile/putong/core/R$string;->di:I

    .line 257
    .line 258
    goto :goto_4

    .line 259
    :cond_7
    sget v0, Lcom/p1/mobile/putong/core/R$string;->ci:I

    .line 260
    .line 261
    :goto_4
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    .line 262
    .line 263
    .line 264
    move-result-object p0

    .line 265
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 266
    .line 267
    .line 268
    return-void

    .line 269
    :cond_8
    iget-object v2, p0, Ll/xcx;->k0:Ll/xbx;

    .line 270
    .line 271
    invoke-virtual {v2}, Ll/xbx;->r1()I

    .line 272
    .line 273
    .line 274
    move-result v2

    .line 275
    const v5, 0x7fffffff

    .line 276
    .line 277
    .line 278
    const-string v6, "#66000000"

    .line 279
    .line 280
    const/high16 v10, 0x41800000    # 16.0f

    .line 281
    .line 282
    const/high16 v11, 0x42600000    # 56.0f

    .line 283
    .line 284
    const/4 v12, 0x1

    .line 285
    const/4 v13, 0x0

    .line 286
    if-ne v2, v4, :cond_9

    .line 287
    .line 288
    iget-object v1, p0, Ll/xcx;->D:Landroid/widget/LinearLayout;

    .line 289
    .line 290
    invoke-static {v1, v13}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 291
    .line 292
    .line 293
    iget-object v1, p0, Ll/xcx;->X:Lv/VButton_FakeShadow;

    .line 294
    .line 295
    invoke-static {v1, v13}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 296
    .line 297
    .line 298
    iget-object v1, p0, Ll/xcx;->Y:Lv/VButton;

    .line 299
    .line 300
    invoke-static {v1, v13}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 301
    .line 302
    .line 303
    iget-object v1, p0, Ll/xcx;->y:Landroid/widget/TextView;

    .line 304
    .line 305
    invoke-static {v1, v12}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 306
    .line 307
    .line 308
    iget-object v1, p0, Ll/xcx;->z:Landroid/widget/TextView;

    .line 309
    .line 310
    invoke-static {v1, v12}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 311
    .line 312
    .line 313
    iget-object v1, p0, Ll/xcx;->w:Lv/VImage;

    .line 314
    .line 315
    invoke-static {v1, v12}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 316
    .line 317
    .line 318
    iget-object v1, p0, Ll/xcx;->g:Landroid/widget/TextView;

    .line 319
    .line 320
    invoke-static {v1, v12}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 321
    .line 322
    .line 323
    iget-object v1, p0, Ll/xcx;->g:Landroid/widget/TextView;

    .line 324
    .line 325
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 326
    .line 327
    .line 328
    move-result-object v2

    .line 329
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Up:I

    .line 330
    .line 331
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 332
    .line 333
    .line 334
    move-result-object v2

    .line 335
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 336
    .line 337
    .line 338
    iget-object v1, p0, Ll/xcx;->h:Lv/VText;

    .line 339
    .line 340
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 341
    .line 342
    .line 343
    move-result-object v2

    .line 344
    sget v3, Lcom/p1/mobile/putong/core/R$string;->vg:I

    .line 345
    .line 346
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 347
    .line 348
    .line 349
    move-result-object v2

    .line 350
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 351
    .line 352
    .line 353
    iget-object v1, p0, Ll/xcx;->h:Lv/VText;

    .line 354
    .line 355
    invoke-virtual {v1, v12}, Landroidx/appcompat/widget/AppCompatTextView;->setAutoSizeTextTypeWithDefaults(I)V

    .line 356
    .line 357
    .line 358
    iget-object v1, p0, Ll/xcx;->i:Landroid/widget/TextView;

    .line 359
    .line 360
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 361
    .line 362
    .line 363
    move-result-object v2

    .line 364
    sget v3, Lcom/p1/mobile/putong/core/R$string;->ug:I

    .line 365
    .line 366
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 367
    .line 368
    .line 369
    move-result-object v2

    .line 370
    iget-object v3, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 371
    .line 372
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 373
    .line 374
    .line 375
    move-result-object v3

    .line 376
    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 377
    .line 378
    .line 379
    move-result-object v2

    .line 380
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 381
    .line 382
    .line 383
    iget-object v1, p0, Ll/xcx;->i:Landroid/widget/TextView;

    .line 384
    .line 385
    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 386
    .line 387
    .line 388
    iget-object v1, p0, Ll/xcx;->i:Landroid/widget/TextView;

    .line 389
    .line 390
    sget v2, Lcom/p1/mobile/putong/core/R$string;->ug:I

    .line 391
    .line 392
    invoke-static {v1, v2}, Ll/e1b;->Q0(Landroid/widget/TextView;I)V

    .line 393
    .line 394
    .line 395
    iget-object v1, p0, Ll/xcx;->i:Landroid/widget/TextView;

    .line 396
    .line 397
    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 398
    .line 399
    .line 400
    move-result v2

    .line 401
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 402
    .line 403
    .line 404
    iget-object v1, p0, Ll/xcx;->y:Landroid/widget/TextView;

    .line 405
    .line 406
    iget v2, p0, Ll/xcx;->Q0:F

    .line 407
    .line 408
    mul-float/2addr v2, v11

    .line 409
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 410
    .line 411
    .line 412
    move-result v2

    .line 413
    invoke-static {v1, v2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 414
    .line 415
    .line 416
    iget-object v1, p0, Ll/xcx;->y:Landroid/widget/TextView;

    .line 417
    .line 418
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 419
    .line 420
    .line 421
    move-result-object v2

    .line 422
    sget v3, Lcom/p1/mobile/putong/core/R$string;->sg:I

    .line 423
    .line 424
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 425
    .line 426
    .line 427
    move-result-object v2

    .line 428
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 429
    .line 430
    .line 431
    iget-object v1, p0, Ll/xcx;->y:Landroid/widget/TextView;

    .line 432
    .line 433
    iget v2, p0, Ll/xcx;->Q0:F

    .line 434
    .line 435
    mul-float/2addr v2, v10

    .line 436
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 437
    .line 438
    .line 439
    iget-object v1, p0, Ll/xcx;->y:Landroid/widget/TextView;

    .line 440
    .line 441
    sget v2, Ll/dbc0;->kb:I

    .line 442
    .line 443
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 444
    .line 445
    .line 446
    iget-object v1, p0, Ll/xcx;->y:Landroid/widget/TextView;

    .line 447
    .line 448
    const-string v2, "#F9E7FF"

    .line 449
    .line 450
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 451
    .line 452
    .line 453
    move-result v2

    .line 454
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 455
    .line 456
    .line 457
    iget-object v1, p0, Ll/xcx;->z:Landroid/widget/TextView;

    .line 458
    .line 459
    iget v2, p0, Ll/xcx;->Q0:F

    .line 460
    .line 461
    mul-float/2addr v2, v11

    .line 462
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 463
    .line 464
    .line 465
    move-result v2

    .line 466
    invoke-static {v1, v2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 467
    .line 468
    .line 469
    iget-object v1, p0, Ll/xcx;->z:Landroid/widget/TextView;

    .line 470
    .line 471
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 472
    .line 473
    .line 474
    move-result-object v2

    .line 475
    sget v3, Lcom/p1/mobile/putong/core/R$string;->tg:I

    .line 476
    .line 477
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 478
    .line 479
    .line 480
    move-result-object v2

    .line 481
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 482
    .line 483
    .line 484
    iget-object v1, p0, Ll/xcx;->z:Landroid/widget/TextView;

    .line 485
    .line 486
    iget v2, p0, Ll/xcx;->Q0:F

    .line 487
    .line 488
    mul-float/2addr v2, v10

    .line 489
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 490
    .line 491
    .line 492
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 493
    .line 494
    .line 495
    move-result-object v1

    .line 496
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->pageId()Ljava/lang/String;

    .line 497
    .line 498
    .line 499
    move-result-object v1

    .line 500
    new-array v2, v13, [Ll/sfj0$a;

    .line 501
    .line 502
    const-string v3, "e_intl_instantmatch_no_ultra_click"

    .line 503
    .line 504
    invoke-static {v3, v1, v2}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 505
    .line 506
    .line 507
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 508
    .line 509
    .line 510
    move-result-object v1

    .line 511
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->pageId()Ljava/lang/String;

    .line 512
    .line 513
    .line 514
    move-result-object v1

    .line 515
    new-array v2, v13, [Ll/sfj0$a;

    .line 516
    .line 517
    const-string v3, "e_intl_instantmatch_no_ultra_giveup"

    .line 518
    .line 519
    invoke-static {v3, v1, v2}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 520
    .line 521
    .line 522
    iget-object v1, p0, Ll/xcx;->y:Landroid/widget/TextView;

    .line 523
    .line 524
    new-instance v2, Ll/rcx;

    .line 525
    .line 526
    invoke-direct {v2, p0}, Ll/rcx;-><init>(Ll/xcx;)V

    .line 527
    .line 528
    .line 529
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 530
    .line 531
    .line 532
    iget-object v1, p0, Ll/xcx;->z:Landroid/widget/TextView;

    .line 533
    .line 534
    new-instance v2, Ll/scx;

    .line 535
    .line 536
    invoke-direct {v2, p0}, Ll/scx;-><init>(Ll/xcx;)V

    .line 537
    .line 538
    .line 539
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 540
    .line 541
    .line 542
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 543
    .line 544
    iget-object v2, p0, Ll/xcx;->l:Lv/VDraweeView;

    .line 545
    .line 546
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 547
    .line 548
    .line 549
    move-result-object v3

    .line 550
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 551
    .line 552
    .line 553
    move-result-object v3

    .line 554
    invoke-virtual {v1, v2, v3, v13}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 555
    .line 556
    .line 557
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 558
    .line 559
    iget-object p0, p0, Ll/xcx;->q:Lv/VDraweeView;

    .line 560
    .line 561
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 562
    .line 563
    .line 564
    move-result-object v0

    .line 565
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 566
    .line 567
    .line 568
    move-result-object v0

    .line 569
    invoke-virtual {v1, p0, v0, v13}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 570
    .line 571
    .line 572
    return-void

    .line 573
    :cond_9
    const/16 v2, 0x30

    .line 574
    .line 575
    if-eq v1, v2, :cond_19

    .line 576
    .line 577
    const/16 v2, 0x31

    .line 578
    .line 579
    if-ne v1, v2, :cond_a

    .line 580
    .line 581
    goto/16 :goto_a

    .line 582
    .line 583
    :cond_a
    const/16 v2, 0x2a

    .line 584
    .line 585
    const/16 v4, 0x2b

    .line 586
    .line 587
    if-eq v1, v2, :cond_14

    .line 588
    .line 589
    if-ne v1, v4, :cond_b

    .line 590
    .line 591
    goto/16 :goto_6

    .line 592
    .line 593
    :cond_b
    const/16 v2, 0x2f

    .line 594
    .line 595
    if-ne v1, v2, :cond_c

    .line 596
    .line 597
    iget-object v2, p0, Ll/xcx;->g:Landroid/widget/TextView;

    .line 598
    .line 599
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 600
    .line 601
    .line 602
    move-result-object v4

    .line 603
    sget v8, Lcom/p1/mobile/putong/core/R$string;->Up:I

    .line 604
    .line 605
    invoke-virtual {v4, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 606
    .line 607
    .line 608
    move-result-object v4

    .line 609
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 610
    .line 611
    .line 612
    iget-object v2, p0, Ll/xcx;->h:Lv/VText;

    .line 613
    .line 614
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 615
    .line 616
    .line 617
    move-result-object v4

    .line 618
    sget v8, Lcom/p1/mobile/putong/core/R$string;->Ub:I

    .line 619
    .line 620
    invoke-virtual {v4, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 621
    .line 622
    .line 623
    move-result-object v4

    .line 624
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 625
    .line 626
    .line 627
    iget-object v2, p0, Ll/xcx;->h:Lv/VText;

    .line 628
    .line 629
    invoke-virtual {v2, v12}, Landroidx/appcompat/widget/AppCompatTextView;->setAutoSizeTextTypeWithDefaults(I)V

    .line 630
    .line 631
    .line 632
    iget-object v2, p0, Ll/xcx;->i:Landroid/widget/TextView;

    .line 633
    .line 634
    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 635
    .line 636
    .line 637
    move-result v4

    .line 638
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 639
    .line 640
    .line 641
    iget-object v2, p0, Ll/xcx;->w:Lv/VImage;

    .line 642
    .line 643
    invoke-static {v2, v12}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 644
    .line 645
    .line 646
    invoke-direct {p0}, Ll/xcx;->c2()V

    .line 647
    .line 648
    .line 649
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 650
    .line 651
    iget-object v4, p0, Ll/xcx;->l:Lv/VDraweeView;

    .line 652
    .line 653
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 654
    .line 655
    .line 656
    move-result-object v6

    .line 657
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 658
    .line 659
    .line 660
    move-result-object v6

    .line 661
    invoke-virtual {v2, v4, v6, v13}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 662
    .line 663
    .line 664
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 665
    .line 666
    iget-object v4, p0, Ll/xcx;->q:Lv/VDraweeView;

    .line 667
    .line 668
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 669
    .line 670
    .line 671
    move-result-object v6

    .line 672
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 673
    .line 674
    .line 675
    move-result-object v6

    .line 676
    invoke-virtual {v2, v4, v6, v13}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 677
    .line 678
    .line 679
    goto :goto_5

    .line 680
    :cond_c
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 681
    .line 682
    iget-object v4, p0, Ll/xcx;->l:Lv/VDraweeView;

    .line 683
    .line 684
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 685
    .line 686
    .line 687
    move-result-object v6

    .line 688
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 689
    .line 690
    .line 691
    move-result-object v6

    .line 692
    invoke-virtual {v2, v4, v6, v13}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 693
    .line 694
    .line 695
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 696
    .line 697
    iget-object v4, p0, Ll/xcx;->q:Lv/VDraweeView;

    .line 698
    .line 699
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 700
    .line 701
    .line 702
    move-result-object v6

    .line 703
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 704
    .line 705
    .line 706
    move-result-object v6

    .line 707
    invoke-virtual {v2, v4, v6, v13}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 708
    .line 709
    .line 710
    :goto_5
    if-ne v1, v3, :cond_d

    .line 711
    .line 712
    iget-object v2, p0, Ll/xcx;->i:Landroid/widget/TextView;

    .line 713
    .line 714
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 715
    .line 716
    .line 717
    move-result-object v3

    .line 718
    sget v4, Lcom/p1/mobile/putong/core/R$string;->wg:I

    .line 719
    .line 720
    iget-object v6, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 721
    .line 722
    filled-new-array {v6}, [Ljava/lang/Object;

    .line 723
    .line 724
    .line 725
    move-result-object v6

    .line 726
    invoke-virtual {v3, v4, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 727
    .line 728
    .line 729
    move-result-object v3

    .line 730
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 731
    .line 732
    .line 733
    iget-object v2, p0, Ll/xcx;->i:Landroid/widget/TextView;

    .line 734
    .line 735
    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 736
    .line 737
    .line 738
    iget-object v2, p0, Ll/xcx;->i:Landroid/widget/TextView;

    .line 739
    .line 740
    sget v3, Lcom/p1/mobile/putong/core/R$string;->wg:I

    .line 741
    .line 742
    invoke-static {v2, v3}, Ll/e1b;->Q0(Landroid/widget/TextView;I)V

    .line 743
    .line 744
    .line 745
    iget-object v2, p0, Ll/xcx;->F:Lv/VText;

    .line 746
    .line 747
    const-string v3, "#33000000"

    .line 748
    .line 749
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 750
    .line 751
    .line 752
    move-result v3

    .line 753
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 754
    .line 755
    .line 756
    iget-object v2, p0, Ll/xcx;->E:Lv/VEditText;

    .line 757
    .line 758
    sget v3, Ll/dbc0;->bu:I

    .line 759
    .line 760
    invoke-static {v2, v3}, Ll/qnp0;->e1(Landroid/widget/TextView;I)V

    .line 761
    .line 762
    .line 763
    :cond_d
    iget-object v2, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 764
    .line 765
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/messages/a;->p(Ljava/lang/String;)Z

    .line 766
    .line 767
    .line 768
    move-result v2

    .line 769
    if-eqz v2, :cond_e

    .line 770
    .line 771
    iput-boolean v13, p0, Ll/xcx;->J0:Z

    .line 772
    .line 773
    iget-object v2, p0, Ll/xcx;->g:Landroid/widget/TextView;

    .line 774
    .line 775
    invoke-static {v2, v13}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 776
    .line 777
    .line 778
    iget-object v2, p0, Ll/xcx;->X:Lv/VButton_FakeShadow;

    .line 779
    .line 780
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Q4:I

    .line 781
    .line 782
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 783
    .line 784
    .line 785
    iget-object v2, p0, Ll/xcx;->Y:Lv/VButton;

    .line 786
    .line 787
    const/4 v3, 0x0

    .line 788
    invoke-virtual {v2, v3, v3, v3, v3}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 789
    .line 790
    .line 791
    iget-object v2, p0, Ll/xcx;->Y:Lv/VButton;

    .line 792
    .line 793
    const/4 v3, 0x0

    .line 794
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 795
    .line 796
    .line 797
    move-result v3

    .line 798
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 799
    .line 800
    .line 801
    iget-object v2, p0, Ll/xcx;->Y:Lv/VButton;

    .line 802
    .line 803
    sget v3, Lcom/p1/mobile/putong/core/R$string;->R4:I

    .line 804
    .line 805
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 806
    .line 807
    .line 808
    iget-object v2, p0, Ll/xcx;->E:Lv/VEditText;

    .line 809
    .line 810
    sget v3, Lcom/p1/mobile/putong/core/R$string;->T4:I

    .line 811
    .line 812
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setHint(I)V

    .line 813
    .line 814
    .line 815
    iget-object v2, p0, Ll/xcx;->h:Lv/VText;

    .line 816
    .line 817
    sget v3, Lcom/p1/mobile/putong/core/R$string;->U4:I

    .line 818
    .line 819
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 820
    .line 821
    .line 822
    iget-object v2, p0, Ll/xcx;->k:Lv/VRelative;

    .line 823
    .line 824
    invoke-static {v2, v13}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 825
    .line 826
    .line 827
    iget-object v2, p0, Ll/xcx;->p:Lv/VRelative;

    .line 828
    .line 829
    const/high16 v3, 0x42be0000    # 95.0f

    .line 830
    .line 831
    iget v4, p0, Ll/xcx;->R0:F

    .line 832
    .line 833
    mul-float/2addr v4, v3

    .line 834
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 835
    .line 836
    .line 837
    move-result v3

    .line 838
    neg-int v3, v3

    .line 839
    int-to-float v3, v3

    .line 840
    invoke-virtual {v2, v3}, Landroid/view/View;->setTranslationX(F)V

    .line 841
    .line 842
    .line 843
    :cond_e
    move-object/from16 v2, p4

    .line 844
    .line 845
    invoke-virtual {p0, v0, v1, v2}, Ll/xcx;->O1(Lcom/p1/mobile/putong/data/User;ILjava/util/ArrayList;)V

    .line 846
    .line 847
    .line 848
    invoke-static {}, Ll/gra;->j2()Z

    .line 849
    .line 850
    .line 851
    move-result v2

    .line 852
    const-string v3, "p_successful_match_view"

    .line 853
    .line 854
    if-eqz v2, :cond_f

    .line 855
    .line 856
    invoke-virtual {p0, v0}, Ll/xcx;->X1(Lcom/p1/mobile/putong/data/User;)V

    .line 857
    .line 858
    .line 859
    iget-object v2, p0, Ll/xcx;->G:Lv/VLinear;

    .line 860
    .line 861
    invoke-static {v2, v12}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 862
    .line 863
    .line 864
    const-string v2, "emoji_quantity"

    .line 865
    .line 866
    invoke-static {v2, v7}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 867
    .line 868
    .line 869
    move-result-object v2

    .line 870
    filled-new-array {v2}, [Ll/sfj0$a;

    .line 871
    .line 872
    .line 873
    move-result-object v2

    .line 874
    const-string v4, "e_match_emoji"

    .line 875
    .line 876
    invoke-static {v4, v3, v2}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 877
    .line 878
    .line 879
    :cond_f
    invoke-static {}, Ll/gra;->r1()Z

    .line 880
    .line 881
    .line 882
    move-result v2

    .line 883
    if-eqz v2, :cond_10

    .line 884
    .line 885
    const/16 v2, 0x2c

    .line 886
    .line 887
    if-ne v1, v2, :cond_10

    .line 888
    .line 889
    iget-object v1, p0, Ll/xcx;->h:Lv/VText;

    .line 890
    .line 891
    const-string v2, "\u91cd\u9022\u914d\u5bf9"

    .line 892
    .line 893
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 894
    .line 895
    .line 896
    iget-object v1, p0, Ll/xcx;->i:Landroid/widget/TextView;

    .line 897
    .line 898
    const-string v2, "\u518d\u6b21\u91cd\u9022\u4f60\u4eec\u4f9d\u7136\u4e92\u76f8\u559c\u6b22\uff0c\u53bb\u804a\u804a\u5427"

    .line 899
    .line 900
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 901
    .line 902
    .line 903
    iget-object v1, p0, Ll/xcx;->i:Landroid/widget/TextView;

    .line 904
    .line 905
    const/high16 v2, 0x42000000    # 32.0f

    .line 906
    .line 907
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 908
    .line 909
    .line 910
    move-result v4

    .line 911
    invoke-static {v1, v4}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 912
    .line 913
    .line 914
    iget-object v1, p0, Ll/xcx;->i:Landroid/widget/TextView;

    .line 915
    .line 916
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 917
    .line 918
    .line 919
    move-result v2

    .line 920
    invoke-static {v1, v2}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 921
    .line 922
    .line 923
    :cond_10
    iget-boolean v1, p0, Ll/xcx;->J0:Z

    .line 924
    .line 925
    if-eqz v1, :cond_11

    .line 926
    .line 927
    iget-object v1, p0, Ll/xcx;->k:Lv/VRelative;

    .line 928
    .line 929
    const/high16 v2, 0x41f00000    # 30.0f

    .line 930
    .line 931
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 932
    .line 933
    .line 934
    move-result v4

    .line 935
    int-to-float v4, v4

    .line 936
    invoke-virtual {v1, v4}, Landroid/view/View;->setTranslationX(F)V

    .line 937
    .line 938
    .line 939
    iget-object v1, p0, Ll/xcx;->p:Lv/VRelative;

    .line 940
    .line 941
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 942
    .line 943
    .line 944
    move-result v2

    .line 945
    neg-int v2, v2

    .line 946
    int-to-float v2, v2

    .line 947
    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationX(F)V

    .line 948
    .line 949
    .line 950
    :cond_11
    invoke-static {}, Ll/nrb0;->b()Z

    .line 951
    .line 952
    .line 953
    move-result v1

    .line 954
    if-eqz v1, :cond_12

    .line 955
    .line 956
    invoke-static {}, Lcom/p1/mobile/putong/core/util/CertificationUtil;->l()Z

    .line 957
    .line 958
    .line 959
    move-result v1

    .line 960
    if-nez v1, :cond_12

    .line 961
    .line 962
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 963
    .line 964
    .line 965
    move-result v1

    .line 966
    if-eqz v1, :cond_12

    .line 967
    .line 968
    move v13, v12

    .line 969
    :cond_12
    iput-boolean v13, p0, Ll/xcx;->L0:Z

    .line 970
    .line 971
    if-eqz v13, :cond_13

    .line 972
    .line 973
    iget-object v1, p0, Ll/xcx;->D:Landroid/widget/LinearLayout;

    .line 974
    .line 975
    const/high16 v2, 0x42800000    # 64.0f

    .line 976
    .line 977
    iget v4, p0, Ll/xcx;->Q0:F

    .line 978
    .line 979
    mul-float/2addr v4, v2

    .line 980
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 981
    .line 982
    .line 983
    move-result v2

    .line 984
    invoke-static {v1, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 985
    .line 986
    .line 987
    iget-object v1, p0, Ll/xcx;->A:Lv/VLinear;

    .line 988
    .line 989
    new-instance v2, Ll/zbx;

    .line 990
    .line 991
    invoke-direct {v2, p0, v0}, Ll/zbx;-><init>(Ll/xcx;Lcom/p1/mobile/putong/data/User;)V

    .line 992
    .line 993
    .line 994
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 995
    .line 996
    .line 997
    iget-object p0, p0, Ll/xcx;->A:Lv/VLinear;

    .line 998
    .line 999
    invoke-static {p0, v12}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 1000
    .line 1001
    .line 1002
    const-string p0, "receiver_user_id"

    .line 1003
    .line 1004
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 1005
    .line 1006
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 1007
    .line 1008
    .line 1009
    move-result-object p0

    .line 1010
    filled-new-array {p0}, [Ll/pf60;

    .line 1011
    .line 1012
    .line 1013
    move-result-object p0

    .line 1014
    const-string v0, "e_successful_match_view_verification"

    .line 1015
    .line 1016
    invoke-static {v0, v3, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 1017
    .line 1018
    .line 1019
    :cond_13
    return-void

    .line 1020
    :cond_14
    :goto_6
    iget-object v2, p0, Ll/xcx;->D:Landroid/widget/LinearLayout;

    .line 1021
    .line 1022
    invoke-static {v2, v13}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 1023
    .line 1024
    .line 1025
    iget-object v2, p0, Ll/xcx;->X:Lv/VButton_FakeShadow;

    .line 1026
    .line 1027
    invoke-static {v2, v13}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 1028
    .line 1029
    .line 1030
    iget-object v2, p0, Ll/xcx;->Y:Lv/VButton;

    .line 1031
    .line 1032
    invoke-static {v2, v13}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 1033
    .line 1034
    .line 1035
    iget-object v2, p0, Ll/xcx;->y:Landroid/widget/TextView;

    .line 1036
    .line 1037
    invoke-static {v2, v12}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 1038
    .line 1039
    .line 1040
    iget-object v2, p0, Ll/xcx;->z:Landroid/widget/TextView;

    .line 1041
    .line 1042
    invoke-static {v2, v12}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 1043
    .line 1044
    .line 1045
    iget-object v2, p0, Ll/xcx;->g:Landroid/widget/TextView;

    .line 1046
    .line 1047
    const-string v3, "Congratulations\uff01"

    .line 1048
    .line 1049
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1050
    .line 1051
    .line 1052
    iget-object v2, p0, Ll/xcx;->h:Lv/VText;

    .line 1053
    .line 1054
    const-string v3, "\u4e92\u76f8\u559c\u6b22"

    .line 1055
    .line 1056
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1057
    .line 1058
    .line 1059
    iget-object v2, p0, Ll/xcx;->i:Landroid/widget/TextView;

    .line 1060
    .line 1061
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 1062
    .line 1063
    .line 1064
    move-result v3

    .line 1065
    if-eqz v3, :cond_15

    .line 1066
    .line 1067
    move-object v3, v9

    .line 1068
    goto :goto_7

    .line 1069
    :cond_15
    move-object v3, v8

    .line 1070
    :goto_7
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 1071
    .line 1072
    .line 1073
    move-result-object v3

    .line 1074
    const-string v5, "\u5f00\u901aSVIP\u4f1a\u5458\u7acb\u5373\u548c%s\u804a\u5929\uff01"

    .line 1075
    .line 1076
    invoke-static {v5, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 1077
    .line 1078
    .line 1079
    move-result-object v3

    .line 1080
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1081
    .line 1082
    .line 1083
    iget-object v2, p0, Ll/xcx;->y:Landroid/widget/TextView;

    .line 1084
    .line 1085
    iget v3, p0, Ll/xcx;->Q0:F

    .line 1086
    .line 1087
    mul-float/2addr v3, v11

    .line 1088
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 1089
    .line 1090
    .line 1091
    move-result v3

    .line 1092
    invoke-static {v2, v3}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 1093
    .line 1094
    .line 1095
    iget-object v2, p0, Ll/xcx;->y:Landroid/widget/TextView;

    .line 1096
    .line 1097
    if-ne v1, v4, :cond_16

    .line 1098
    .line 1099
    const-string v3, "\u53d1\u6d88\u606f"

    .line 1100
    .line 1101
    goto :goto_8

    .line 1102
    :cond_16
    const-string v3, "\u786e\u5b9a"

    .line 1103
    .line 1104
    :goto_8
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1105
    .line 1106
    .line 1107
    iget-object v2, p0, Ll/xcx;->y:Landroid/widget/TextView;

    .line 1108
    .line 1109
    iget v3, p0, Ll/xcx;->Q0:F

    .line 1110
    .line 1111
    mul-float/2addr v3, v10

    .line 1112
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1113
    .line 1114
    .line 1115
    iget-object v2, p0, Ll/xcx;->z:Landroid/widget/TextView;

    .line 1116
    .line 1117
    iget v3, p0, Ll/xcx;->Q0:F

    .line 1118
    .line 1119
    mul-float/2addr v3, v11

    .line 1120
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 1121
    .line 1122
    .line 1123
    move-result v3

    .line 1124
    invoke-static {v2, v3}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 1125
    .line 1126
    .line 1127
    iget-object v2, p0, Ll/xcx;->z:Landroid/widget/TextView;

    .line 1128
    .line 1129
    if-ne v1, v4, :cond_18

    .line 1130
    .line 1131
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 1132
    .line 1133
    .line 1134
    move-result v3

    .line 1135
    if-eqz v3, :cond_17

    .line 1136
    .line 1137
    move-object v8, v9

    .line 1138
    :cond_17
    filled-new-array {v8}, [Ljava/lang/Object;

    .line 1139
    .line 1140
    .line 1141
    move-result-object v3

    .line 1142
    const-string v4, "\u653e\u5f03%s"

    .line 1143
    .line 1144
    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 1145
    .line 1146
    .line 1147
    move-result-object v3

    .line 1148
    goto :goto_9

    .line 1149
    :cond_18
    const-string v3, "\u7ee7\u7eed\u63a2\u7d22"

    .line 1150
    .line 1151
    :goto_9
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1152
    .line 1153
    .line 1154
    iget-object v2, p0, Ll/xcx;->z:Landroid/widget/TextView;

    .line 1155
    .line 1156
    iget v3, p0, Ll/xcx;->Q0:F

    .line 1157
    .line 1158
    mul-float/2addr v3, v10

    .line 1159
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1160
    .line 1161
    .line 1162
    iget-object v2, p0, Ll/xcx;->y:Landroid/widget/TextView;

    .line 1163
    .line 1164
    new-instance v3, Ll/vcx;

    .line 1165
    .line 1166
    invoke-direct {v3, p0, v1}, Ll/vcx;-><init>(Ll/xcx;I)V

    .line 1167
    .line 1168
    .line 1169
    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1170
    .line 1171
    .line 1172
    iget-object v1, p0, Ll/xcx;->z:Landroid/widget/TextView;

    .line 1173
    .line 1174
    new-instance v2, Ll/wcx;

    .line 1175
    .line 1176
    invoke-direct {v2, p0}, Ll/wcx;-><init>(Ll/xcx;)V

    .line 1177
    .line 1178
    .line 1179
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1180
    .line 1181
    .line 1182
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 1183
    .line 1184
    iget-object v2, p0, Ll/xcx;->l:Lv/VDraweeView;

    .line 1185
    .line 1186
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 1187
    .line 1188
    .line 1189
    move-result-object v3

    .line 1190
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 1191
    .line 1192
    .line 1193
    move-result-object v3

    .line 1194
    invoke-virtual {v1, v2, v3, v13}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 1195
    .line 1196
    .line 1197
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 1198
    .line 1199
    iget-object p0, p0, Ll/xcx;->q:Lv/VDraweeView;

    .line 1200
    .line 1201
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 1202
    .line 1203
    .line 1204
    move-result-object v0

    .line 1205
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 1206
    .line 1207
    .line 1208
    move-result-object v0

    .line 1209
    invoke-virtual {v1, p0, v0, v13}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 1210
    .line 1211
    .line 1212
    return-void

    .line 1213
    :cond_19
    :goto_a
    iget-object v1, p0, Ll/xcx;->D:Landroid/widget/LinearLayout;

    .line 1214
    .line 1215
    invoke-static {v1, v13}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 1216
    .line 1217
    .line 1218
    iget-object v1, p0, Ll/xcx;->X:Lv/VButton_FakeShadow;

    .line 1219
    .line 1220
    invoke-static {v1, v13}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 1221
    .line 1222
    .line 1223
    iget-object v1, p0, Ll/xcx;->Y:Lv/VButton;

    .line 1224
    .line 1225
    invoke-static {v1, v13}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 1226
    .line 1227
    .line 1228
    iget-object v1, p0, Ll/xcx;->y:Landroid/widget/TextView;

    .line 1229
    .line 1230
    invoke-static {v1, v12}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 1231
    .line 1232
    .line 1233
    iget-object v1, p0, Ll/xcx;->z:Landroid/widget/TextView;

    .line 1234
    .line 1235
    invoke-static {v1, v12}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 1236
    .line 1237
    .line 1238
    iget-object v1, p0, Ll/xcx;->w:Lv/VImage;

    .line 1239
    .line 1240
    invoke-static {v1, v12}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 1241
    .line 1242
    .line 1243
    iget-object v1, p0, Ll/xcx;->g:Landroid/widget/TextView;

    .line 1244
    .line 1245
    invoke-static {v1, v12}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 1246
    .line 1247
    .line 1248
    invoke-direct {p0}, Ll/xcx;->c2()V

    .line 1249
    .line 1250
    .line 1251
    iget-object v1, p0, Ll/xcx;->g:Landroid/widget/TextView;

    .line 1252
    .line 1253
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 1254
    .line 1255
    .line 1256
    move-result-object v2

    .line 1257
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Up:I

    .line 1258
    .line 1259
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 1260
    .line 1261
    .line 1262
    move-result-object v2

    .line 1263
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1264
    .line 1265
    .line 1266
    iget-object v1, p0, Ll/xcx;->h:Lv/VText;

    .line 1267
    .line 1268
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 1269
    .line 1270
    .line 1271
    move-result-object v2

    .line 1272
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Ub:I

    .line 1273
    .line 1274
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 1275
    .line 1276
    .line 1277
    move-result-object v2

    .line 1278
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1279
    .line 1280
    .line 1281
    iget-object v1, p0, Ll/xcx;->h:Lv/VText;

    .line 1282
    .line 1283
    invoke-virtual {v1, v12}, Landroidx/appcompat/widget/AppCompatTextView;->setAutoSizeTextTypeWithDefaults(I)V

    .line 1284
    .line 1285
    .line 1286
    iget-object v1, p0, Ll/xcx;->i:Landroid/widget/TextView;

    .line 1287
    .line 1288
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 1289
    .line 1290
    .line 1291
    move-result-object v2

    .line 1292
    sget v3, Lcom/p1/mobile/putong/core/R$string;->tc:I

    .line 1293
    .line 1294
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 1295
    .line 1296
    .line 1297
    move-result-object v2

    .line 1298
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1299
    .line 1300
    .line 1301
    iget-object v1, p0, Ll/xcx;->i:Landroid/widget/TextView;

    .line 1302
    .line 1303
    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 1304
    .line 1305
    .line 1306
    move-result v2

    .line 1307
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1308
    .line 1309
    .line 1310
    iget-object v1, p0, Ll/xcx;->y:Landroid/widget/TextView;

    .line 1311
    .line 1312
    iget v2, p0, Ll/xcx;->Q0:F

    .line 1313
    .line 1314
    mul-float/2addr v2, v11

    .line 1315
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 1316
    .line 1317
    .line 1318
    move-result v2

    .line 1319
    invoke-static {v1, v2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 1320
    .line 1321
    .line 1322
    iget-object v1, p0, Ll/xcx;->y:Landroid/widget/TextView;

    .line 1323
    .line 1324
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 1325
    .line 1326
    .line 1327
    move-result-object v2

    .line 1328
    sget v3, Lcom/p1/mobile/putong/core/R$string;->rc:I

    .line 1329
    .line 1330
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 1331
    .line 1332
    .line 1333
    move-result-object v2

    .line 1334
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1335
    .line 1336
    .line 1337
    iget-object v1, p0, Ll/xcx;->y:Landroid/widget/TextView;

    .line 1338
    .line 1339
    iget v2, p0, Ll/xcx;->Q0:F

    .line 1340
    .line 1341
    mul-float/2addr v2, v10

    .line 1342
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1343
    .line 1344
    .line 1345
    iget-object v1, p0, Ll/xcx;->y:Landroid/widget/TextView;

    .line 1346
    .line 1347
    const-string v2, "#FF4B72"

    .line 1348
    .line 1349
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 1350
    .line 1351
    .line 1352
    move-result v2

    .line 1353
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1354
    .line 1355
    .line 1356
    iget-object v1, p0, Ll/xcx;->z:Landroid/widget/TextView;

    .line 1357
    .line 1358
    iget v2, p0, Ll/xcx;->Q0:F

    .line 1359
    .line 1360
    mul-float/2addr v2, v11

    .line 1361
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 1362
    .line 1363
    .line 1364
    move-result v2

    .line 1365
    invoke-static {v1, v2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 1366
    .line 1367
    .line 1368
    iget-object v1, p0, Ll/xcx;->z:Landroid/widget/TextView;

    .line 1369
    .line 1370
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 1371
    .line 1372
    .line 1373
    move-result-object v2

    .line 1374
    sget v3, Lcom/p1/mobile/putong/core/R$string;->sc:I

    .line 1375
    .line 1376
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 1377
    .line 1378
    .line 1379
    move-result-object v2

    .line 1380
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1381
    .line 1382
    .line 1383
    iget-object v1, p0, Ll/xcx;->z:Landroid/widget/TextView;

    .line 1384
    .line 1385
    iget v2, p0, Ll/xcx;->Q0:F

    .line 1386
    .line 1387
    mul-float/2addr v2, v10

    .line 1388
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 1389
    .line 1390
    .line 1391
    iget-object v1, p0, Ll/xcx;->y:Landroid/widget/TextView;

    .line 1392
    .line 1393
    new-instance v2, Ll/tcx;

    .line 1394
    .line 1395
    invoke-direct {v2, p0}, Ll/tcx;-><init>(Ll/xcx;)V

    .line 1396
    .line 1397
    .line 1398
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1399
    .line 1400
    .line 1401
    iget-object v1, p0, Ll/xcx;->z:Landroid/widget/TextView;

    .line 1402
    .line 1403
    new-instance v2, Ll/ucx;

    .line 1404
    .line 1405
    invoke-direct {v2, p0}, Ll/ucx;-><init>(Ll/xcx;)V

    .line 1406
    .line 1407
    .line 1408
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1409
    .line 1410
    .line 1411
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 1412
    .line 1413
    iget-object v2, p0, Ll/xcx;->l:Lv/VDraweeView;

    .line 1414
    .line 1415
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 1416
    .line 1417
    .line 1418
    move-result-object v3

    .line 1419
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 1420
    .line 1421
    .line 1422
    move-result-object v3

    .line 1423
    invoke-virtual {v1, v2, v3, v13}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 1424
    .line 1425
    .line 1426
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 1427
    .line 1428
    iget-object p0, p0, Ll/xcx;->q:Lv/VDraweeView;

    .line 1429
    .line 1430
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 1431
    .line 1432
    .line 1433
    move-result-object v0

    .line 1434
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 1435
    .line 1436
    .line 1437
    move-result-object v0

    .line 1438
    invoke-virtual {v1, p0, v0, v13}, Ll/fsb0;->J0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 1439
    .line 1440
    .line 1441
    return-void

    .line 1442
    :cond_1a
    :goto_b
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 1443
    .line 1444
    .line 1445
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 1446
    .line 1447
    .line 1448
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 1449
    .line 1450
    .line 1451
    move-result-object p0

    .line 1452
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 1453
    .line 1454
    .line 1455
    return-void
.end method

.method public V0(Z)V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    iget v2, v0, Ll/xcx;->T0:I

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    const/4 v4, 0x0

    .line 9
    if-lez v2, :cond_1

    .line 10
    .line 11
    iget-object v5, v0, Ll/xcx;->D:Landroid/widget/LinearLayout;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget v2, v0, Ll/xcx;->S0:I

    .line 16
    .line 17
    invoke-static {v5, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ll/gra;->f2()Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_1

    .line 25
    .line 26
    iget-object v2, v0, Ll/xcx;->x:Lv/VRecyclerView;

    .line 27
    .line 28
    invoke-static {v2, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-static {v5, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 33
    .line 34
    .line 35
    invoke-static {}, Ll/gra;->f2()Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_1

    .line 40
    .line 41
    iget-object v2, v0, Ll/xcx;->x:Lv/VRecyclerView;

    .line 42
    .line 43
    invoke-static {v2, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    :cond_1
    :goto_0
    sget-object v2, Lcom/p1/mobile/android/app/Act;->savedKeyboardHeight:Ll/vxd0;

    .line 47
    .line 48
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    check-cast v2, Ljava/lang/Integer;

    .line 53
    .line 54
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 55
    .line 56
    .line 57
    move-result-object v5

    .line 58
    iget v5, v5, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 59
    .line 60
    iget-object v6, v0, Ll/xcx;->D:Landroid/widget/LinearLayout;

    .line 61
    .line 62
    invoke-virtual {v6}, Landroid/view/View;->getBottom()I

    .line 63
    .line 64
    .line 65
    move-result v6

    .line 66
    sub-int/2addr v5, v6

    .line 67
    iget v6, v0, Ll/xcx;->H0:I

    .line 68
    .line 69
    add-int/2addr v6, v5

    .line 70
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 71
    .line 72
    .line 73
    move-result v7

    .line 74
    iget v8, v0, Ll/xcx;->Q0:F

    .line 75
    .line 76
    const/high16 v9, 0x42480000    # 50.0f

    .line 77
    .line 78
    mul-float/2addr v8, v9

    .line 79
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 80
    .line 81
    .line 82
    move-result v8

    .line 83
    add-int/2addr v7, v8

    .line 84
    if-ge v6, v7, :cond_2

    .line 85
    .line 86
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    sub-int/2addr v2, v5

    .line 91
    iget v5, v0, Ll/xcx;->Q0:F

    .line 92
    .line 93
    mul-float/2addr v5, v9

    .line 94
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 95
    .line 96
    .line 97
    move-result v5

    .line 98
    add-int/2addr v2, v5

    .line 99
    iput v2, v0, Ll/xcx;->H0:I

    .line 100
    .line 101
    :cond_2
    iput-boolean v1, v0, Ll/xcx;->G0:Z

    .line 102
    .line 103
    iget-object v2, v0, Ll/xcx;->k:Lv/VRelative;

    .line 104
    .line 105
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    const/high16 v5, 0x42200000    # 40.0f

    .line 110
    .line 111
    if-eqz v1, :cond_3

    .line 112
    .line 113
    move v6, v4

    .line 114
    goto :goto_1

    .line 115
    :cond_3
    iget v6, v0, Ll/xcx;->Q0:F

    .line 116
    .line 117
    mul-float/2addr v6, v5

    .line 118
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 119
    .line 120
    .line 121
    move-result v6

    .line 122
    neg-int v6, v6

    .line 123
    :goto_1
    if-eqz v1, :cond_4

    .line 124
    .line 125
    iget v7, v0, Ll/xcx;->Q0:F

    .line 126
    .line 127
    mul-float/2addr v7, v5

    .line 128
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 129
    .line 130
    .line 131
    move-result v5

    .line 132
    neg-int v5, v5

    .line 133
    goto :goto_2

    .line 134
    :cond_4
    move v5, v4

    .line 135
    :goto_2
    const/4 v7, -0x1

    .line 136
    const/16 v8, 0x12c

    .line 137
    .line 138
    invoke-virtual {v0, v7, v8, v6, v5}, Ll/xcx;->k2(IIII)Landroid/animation/Animator;

    .line 139
    .line 140
    .line 141
    move-result-object v5

    .line 142
    xor-int/lit8 v6, v1, 0x1

    .line 143
    .line 144
    invoke-virtual {v0, v8, v1, v6}, Ll/xcx;->U0(III)Landroid/animation/Animator;

    .line 145
    .line 146
    .line 147
    move-result-object v6

    .line 148
    filled-new-array {v5, v6}, [Landroid/animation/Animator;

    .line 149
    .line 150
    .line 151
    move-result-object v5

    .line 152
    invoke-static {v5}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 153
    .line 154
    .line 155
    move-result-object v5

    .line 156
    invoke-virtual {v5}, Landroid/animation/Animator;->start()V

    .line 157
    .line 158
    .line 159
    iget-object v6, v0, Ll/xcx;->n:Lv/VImage;

    .line 160
    .line 161
    const/4 v5, 0x2

    .line 162
    if-eqz v1, :cond_5

    .line 163
    .line 164
    sget-object v7, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 165
    .line 166
    new-instance v12, Landroid/view/animation/DecelerateInterpolator;

    .line 167
    .line 168
    invoke-direct {v12}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 169
    .line 170
    .line 171
    new-array v13, v5, [F

    .line 172
    .line 173
    fill-array-data v13, :array_0

    .line 174
    .line 175
    .line 176
    const-wide/16 v8, 0x0

    .line 177
    .line 178
    const-wide/16 v10, 0x12c

    .line 179
    .line 180
    invoke-static/range {v6 .. v13}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 181
    .line 182
    .line 183
    move-result-object v6

    .line 184
    invoke-virtual {v6}, Landroid/animation/Animator;->start()V

    .line 185
    .line 186
    .line 187
    move-object v8, v7

    .line 188
    iget-object v7, v0, Ll/xcx;->r:Lv/VImage;

    .line 189
    .line 190
    new-instance v13, Landroid/view/animation/DecelerateInterpolator;

    .line 191
    .line 192
    invoke-direct {v13}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 193
    .line 194
    .line 195
    new-array v14, v5, [F

    .line 196
    .line 197
    fill-array-data v14, :array_1

    .line 198
    .line 199
    .line 200
    const-wide/16 v9, 0x0

    .line 201
    .line 202
    const-wide/16 v11, 0x12c

    .line 203
    .line 204
    invoke-static/range {v7 .. v14}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 205
    .line 206
    .line 207
    move-result-object v6

    .line 208
    invoke-virtual {v6}, Landroid/animation/Animator;->start()V

    .line 209
    .line 210
    .line 211
    goto :goto_3

    .line 212
    :cond_5
    sget-object v7, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 213
    .line 214
    new-instance v12, Landroid/view/animation/DecelerateInterpolator;

    .line 215
    .line 216
    invoke-direct {v12}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 217
    .line 218
    .line 219
    new-array v13, v5, [F

    .line 220
    .line 221
    fill-array-data v13, :array_2

    .line 222
    .line 223
    .line 224
    const-wide/16 v8, 0x0

    .line 225
    .line 226
    const-wide/16 v10, 0x12c

    .line 227
    .line 228
    invoke-static/range {v6 .. v13}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 229
    .line 230
    .line 231
    move-result-object v6

    .line 232
    invoke-virtual {v6}, Landroid/animation/Animator;->start()V

    .line 233
    .line 234
    .line 235
    move-object v8, v7

    .line 236
    iget-object v7, v0, Ll/xcx;->r:Lv/VImage;

    .line 237
    .line 238
    new-instance v13, Landroid/view/animation/DecelerateInterpolator;

    .line 239
    .line 240
    invoke-direct {v13}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 241
    .line 242
    .line 243
    new-array v14, v5, [F

    .line 244
    .line 245
    fill-array-data v14, :array_3

    .line 246
    .line 247
    .line 248
    const-wide/16 v9, 0x0

    .line 249
    .line 250
    const-wide/16 v11, 0x12c

    .line 251
    .line 252
    invoke-static/range {v7 .. v14}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 253
    .line 254
    .line 255
    move-result-object v6

    .line 256
    invoke-virtual {v6}, Landroid/animation/Animator;->start()V

    .line 257
    .line 258
    .line 259
    :goto_3
    iget-object v6, v0, Ll/xcx;->k:Lv/VRelative;

    .line 260
    .line 261
    sget-object v7, Landroid/view/View;->TRANSLATION_X:Landroid/util/Property;

    .line 262
    .line 263
    const/high16 v8, 0x42080000    # 34.0f

    .line 264
    .line 265
    if-eqz v1, :cond_6

    .line 266
    .line 267
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 268
    .line 269
    .line 270
    move-result v9

    .line 271
    :goto_4
    int-to-float v9, v9

    .line 272
    goto :goto_5

    .line 273
    :cond_6
    div-int/lit8 v9, v2, 0x2

    .line 274
    .line 275
    goto :goto_4

    .line 276
    :goto_5
    if-eqz v1, :cond_7

    .line 277
    .line 278
    div-int/lit8 v10, v2, 0x2

    .line 279
    .line 280
    :goto_6
    int-to-float v10, v10

    .line 281
    goto :goto_7

    .line 282
    :cond_7
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 283
    .line 284
    .line 285
    move-result v10

    .line 286
    goto :goto_6

    .line 287
    :goto_7
    new-array v11, v5, [F

    .line 288
    .line 289
    aput v9, v11, v4

    .line 290
    .line 291
    aput v10, v11, v3

    .line 292
    .line 293
    invoke-static {v6, v7, v11}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 294
    .line 295
    .line 296
    move-result-object v12

    .line 297
    iget-object v6, v0, Ll/xcx;->k:Lv/VRelative;

    .line 298
    .line 299
    sget-object v9, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 300
    .line 301
    const/high16 v10, 0x41a00000    # 20.0f

    .line 302
    .line 303
    const/4 v11, 0x0

    .line 304
    if-eqz v1, :cond_8

    .line 305
    .line 306
    move v13, v11

    .line 307
    goto :goto_8

    .line 308
    :cond_8
    iget v13, v0, Ll/xcx;->H0:I

    .line 309
    .line 310
    iget v14, v0, Ll/xcx;->Q0:F

    .line 311
    .line 312
    mul-float/2addr v14, v10

    .line 313
    invoke-static {v14}, Ll/qa00;->d(F)I

    .line 314
    .line 315
    .line 316
    move-result v14

    .line 317
    sub-int/2addr v13, v14

    .line 318
    neg-int v13, v13

    .line 319
    int-to-float v13, v13

    .line 320
    :goto_8
    if-eqz v1, :cond_9

    .line 321
    .line 322
    iget v14, v0, Ll/xcx;->H0:I

    .line 323
    .line 324
    iget v15, v0, Ll/xcx;->Q0:F

    .line 325
    .line 326
    mul-float/2addr v15, v10

    .line 327
    invoke-static {v15}, Ll/qa00;->d(F)I

    .line 328
    .line 329
    .line 330
    move-result v15

    .line 331
    sub-int/2addr v14, v15

    .line 332
    neg-int v14, v14

    .line 333
    int-to-float v14, v14

    .line 334
    goto :goto_9

    .line 335
    :cond_9
    move v14, v11

    .line 336
    :goto_9
    new-array v15, v5, [F

    .line 337
    .line 338
    aput v13, v15, v4

    .line 339
    .line 340
    aput v14, v15, v3

    .line 341
    .line 342
    invoke-static {v6, v9, v15}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 343
    .line 344
    .line 345
    move-result-object v13

    .line 346
    iget-object v6, v0, Ll/xcx;->p:Lv/VRelative;

    .line 347
    .line 348
    if-eqz v1, :cond_a

    .line 349
    .line 350
    move v14, v11

    .line 351
    goto :goto_a

    .line 352
    :cond_a
    iget v14, v0, Ll/xcx;->H0:I

    .line 353
    .line 354
    iget v15, v0, Ll/xcx;->Q0:F

    .line 355
    .line 356
    mul-float/2addr v15, v10

    .line 357
    invoke-static {v15}, Ll/qa00;->d(F)I

    .line 358
    .line 359
    .line 360
    move-result v15

    .line 361
    sub-int/2addr v14, v15

    .line 362
    neg-int v14, v14

    .line 363
    int-to-float v14, v14

    .line 364
    :goto_a
    if-eqz v1, :cond_b

    .line 365
    .line 366
    iget v15, v0, Ll/xcx;->H0:I

    .line 367
    .line 368
    move/from16 v16, v3

    .line 369
    .line 370
    iget v3, v0, Ll/xcx;->Q0:F

    .line 371
    .line 372
    mul-float/2addr v3, v10

    .line 373
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 374
    .line 375
    .line 376
    move-result v3

    .line 377
    sub-int/2addr v15, v3

    .line 378
    neg-int v3, v15

    .line 379
    int-to-float v3, v3

    .line 380
    goto :goto_b

    .line 381
    :cond_b
    move/from16 v16, v3

    .line 382
    .line 383
    move v3, v11

    .line 384
    :goto_b
    new-array v10, v5, [F

    .line 385
    .line 386
    aput v14, v10, v4

    .line 387
    .line 388
    aput v3, v10, v16

    .line 389
    .line 390
    invoke-static {v6, v9, v10}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 391
    .line 392
    .line 393
    move-result-object v14

    .line 394
    iget-object v3, v0, Ll/xcx;->p:Lv/VRelative;

    .line 395
    .line 396
    sget-object v6, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    .line 397
    .line 398
    const v10, 0x3f8147ae    # 1.01f

    .line 399
    .line 400
    .line 401
    const/high16 v15, 0x3f800000    # 1.0f

    .line 402
    .line 403
    if-eqz v1, :cond_c

    .line 404
    .line 405
    move/from16 v17, v15

    .line 406
    .line 407
    goto :goto_c

    .line 408
    :cond_c
    move/from16 v17, v10

    .line 409
    .line 410
    :goto_c
    if-eqz v1, :cond_d

    .line 411
    .line 412
    move/from16 v18, v10

    .line 413
    .line 414
    :goto_d
    move/from16 v19, v8

    .line 415
    .line 416
    goto :goto_e

    .line 417
    :cond_d
    move/from16 v18, v15

    .line 418
    .line 419
    goto :goto_d

    .line 420
    :goto_e
    new-array v8, v5, [F

    .line 421
    .line 422
    aput v17, v8, v4

    .line 423
    .line 424
    aput v18, v8, v16

    .line 425
    .line 426
    invoke-static {v3, v6, v8}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 427
    .line 428
    .line 429
    move-result-object v3

    .line 430
    iget-object v6, v0, Ll/xcx;->p:Lv/VRelative;

    .line 431
    .line 432
    sget-object v8, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    .line 433
    .line 434
    if-eqz v1, :cond_e

    .line 435
    .line 436
    move/from16 v17, v15

    .line 437
    .line 438
    goto :goto_f

    .line 439
    :cond_e
    move/from16 v17, v10

    .line 440
    .line 441
    :goto_f
    if-eqz v1, :cond_f

    .line 442
    .line 443
    goto :goto_10

    .line 444
    :cond_f
    move v10, v15

    .line 445
    :goto_10
    new-array v15, v5, [F

    .line 446
    .line 447
    aput v17, v15, v4

    .line 448
    .line 449
    aput v10, v15, v16

    .line 450
    .line 451
    invoke-static {v6, v8, v15}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 452
    .line 453
    .line 454
    move-result-object v6

    .line 455
    iget-object v8, v0, Ll/xcx;->D:Landroid/widget/LinearLayout;

    .line 456
    .line 457
    if-eqz v1, :cond_10

    .line 458
    .line 459
    move v10, v11

    .line 460
    goto :goto_11

    .line 461
    :cond_10
    iget v10, v0, Ll/xcx;->H0:I

    .line 462
    .line 463
    neg-int v10, v10

    .line 464
    int-to-float v10, v10

    .line 465
    :goto_11
    if-eqz v1, :cond_11

    .line 466
    .line 467
    iget v11, v0, Ll/xcx;->H0:I

    .line 468
    .line 469
    neg-int v11, v11

    .line 470
    int-to-float v11, v11

    .line 471
    :cond_11
    new-array v15, v5, [F

    .line 472
    .line 473
    aput v10, v15, v4

    .line 474
    .line 475
    aput v11, v15, v16

    .line 476
    .line 477
    invoke-static {v8, v9, v15}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 478
    .line 479
    .line 480
    move-result-object v17

    .line 481
    invoke-static {v4}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 482
    .line 483
    .line 484
    move-result-object v18

    .line 485
    iget-boolean v8, v0, Ll/xcx;->J0:Z

    .line 486
    .line 487
    if-eqz v8, :cond_14

    .line 488
    .line 489
    iget-object v8, v0, Ll/xcx;->p:Lv/VRelative;

    .line 490
    .line 491
    if-eqz v1, :cond_12

    .line 492
    .line 493
    invoke-static/range {v19 .. v19}, Ll/qa00;->d(F)I

    .line 494
    .line 495
    .line 496
    move-result v9

    .line 497
    neg-int v9, v9

    .line 498
    :goto_12
    int-to-float v9, v9

    .line 499
    goto :goto_13

    .line 500
    :cond_12
    neg-int v9, v2

    .line 501
    div-int/2addr v9, v5

    .line 502
    goto :goto_12

    .line 503
    :goto_13
    if-eqz v1, :cond_13

    .line 504
    .line 505
    neg-int v2, v2

    .line 506
    div-int/2addr v2, v5

    .line 507
    :goto_14
    int-to-float v2, v2

    .line 508
    goto :goto_15

    .line 509
    :cond_13
    invoke-static/range {v19 .. v19}, Ll/qa00;->d(F)I

    .line 510
    .line 511
    .line 512
    move-result v2

    .line 513
    neg-int v2, v2

    .line 514
    goto :goto_14

    .line 515
    :goto_15
    new-array v5, v5, [F

    .line 516
    .line 517
    aput v9, v5, v4

    .line 518
    .line 519
    aput v2, v5, v16

    .line 520
    .line 521
    invoke-static {v8, v7, v5}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 522
    .line 523
    .line 524
    move-result-object v2

    .line 525
    :goto_16
    move-object/from16 v19, v2

    .line 526
    .line 527
    move-object v15, v3

    .line 528
    move-object/from16 v16, v6

    .line 529
    .line 530
    goto :goto_17

    .line 531
    :cond_14
    invoke-static {v4}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 532
    .line 533
    .line 534
    move-result-object v2

    .line 535
    goto :goto_16

    .line 536
    :goto_17
    filled-new-array/range {v12 .. v19}, [Landroid/animation/Animator;

    .line 537
    .line 538
    .line 539
    move-result-object v2

    .line 540
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 541
    .line 542
    .line 543
    move-result-object v2

    .line 544
    new-array v3, v4, [Landroid/animation/Animator;

    .line 545
    .line 546
    invoke-interface {v2, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 547
    .line 548
    .line 549
    move-result-object v2

    .line 550
    check-cast v2, [Landroid/animation/Animator;

    .line 551
    .line 552
    invoke-static {v2}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 553
    .line 554
    .line 555
    move-result-object v2

    .line 556
    new-instance v3, Landroid/view/animation/DecelerateInterpolator;

    .line 557
    .line 558
    invoke-direct {v3}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 559
    .line 560
    .line 561
    invoke-virtual {v2, v3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 562
    .line 563
    .line 564
    const-wide/16 v3, 0x12c

    .line 565
    .line 566
    invoke-virtual {v2, v3, v4}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 567
    .line 568
    .line 569
    new-instance v3, Ll/xcx$e;

    .line 570
    .line 571
    invoke-direct {v3, v0, v1}, Ll/xcx$e;-><init>(Ll/xcx;Z)V

    .line 572
    .line 573
    .line 574
    invoke-virtual {v2, v3}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 575
    .line 576
    .line 577
    invoke-virtual {v2}, Landroid/animation/Animator;->start()V

    .line 578
    .line 579
    .line 580
    return-void

    .line 581
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 582
    .line 583
    .line 584
    .line 585
    .line 586
    .line 587
    .line 588
    .line 589
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 590
    .line 591
    .line 592
    .line 593
    .line 594
    .line 595
    .line 596
    .line 597
    :array_2
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 598
    .line 599
    .line 600
    .line 601
    .line 602
    .line 603
    .line 604
    .line 605
    :array_3
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final V1()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/xcx;->k0:Ll/xbx;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xbx;->r1()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0x32

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-eq v0, v1, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Ll/xcx;->k0:Ll/xbx;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/xbx;->r1()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/16 v1, 0x33

    .line 19
    .line 20
    if-ne v0, v1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 v0, 0x2

    .line 24
    new-array v0, v0, [F

    .line 25
    .line 26
    fill-array-data v0, :array_0

    .line 27
    .line 28
    .line 29
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/ybx;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/ybx;-><init>(Ll/xcx;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 39
    .line 40
    .line 41
    new-instance v1, Landroid/view/animation/OvershootInterpolator;

    .line 42
    .line 43
    invoke-direct {v1}, Landroid/view/animation/OvershootInterpolator;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 47
    .line 48
    .line 49
    const-wide/16 v3, 0x1f4

    .line 50
    .line 51
    invoke-virtual {v0, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const-string v1, "https://auto.tancdn.com/v1/raw/45411073-a242-4383-adb6-d088856a7c6a10.so"

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iget-object v1, p0, Ll/xcx;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 82
    .line 83
    .line 84
    iget-object p0, p0, Ll/xcx;->e:Lcom/sunshine/engine/bone/StageView;

    .line 85
    .line 86
    const-string v0, "animations/match_heart_success/config.xml"

    .line 87
    .line 88
    const-string v1, "animations/match_heart_success/pic"

    .line 89
    .line 90
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {p0, v0}, Lcom/sunshine/engine/base/AnimView;->d([Ljava/lang/String;)Z

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/xcx;->d:Lcom/p1/mobile/putong/core/view/HeartView;

    .line 99
    .line 100
    const/4 v1, 0x0

    .line 101
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Ll/xcx;->e:Lcom/sunshine/engine/bone/StageView;

    .line 105
    .line 106
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    const-string v1, "https://auto.tancdn.com/v1/raw/7036ab37-664e-486d-a3b1-3162a0f94c9214.svga"

    .line 118
    .line 119
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    iget-object p0, p0, Ll/xcx;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 132
    .line 133
    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final X0(I)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Ll/xcx;->V0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final X1(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/xcx;->e1(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object p0, p0, Ll/xcx;->j:Lv/VText;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public Y0(Ll/xbx;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xcx;->k0:Ll/xbx;

    .line 2
    .line 3
    return-void
.end method

.method public final Z0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xcx;->n:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/xcx;->r:Lv/VImage;

    .line 8
    .line 9
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final a1()V
    .locals 1

    .line 1
    invoke-static {}, Ll/gra;->f2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/xcx;->W0:Lcom/p1/mobile/android/ui/bubble/d;

    .line 8
    .line 9
    const-string v0, "MatchIceBreakBubble"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final b2(IILjava/lang/String;)V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    move v2, p1

    .line 12
    :goto_0
    if-gt v2, p2, :cond_2

    .line 13
    .line 14
    iget-object v3, p0, Ll/xcx;->U0:Ll/xcx$g;

    .line 15
    .line 16
    invoke-virtual {v3, v2}, Ll/xcx$g;->G(I)Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/BreakIce;->tipId:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v4, p0, Ll/xcx;->Y0:Ljava/util/Set;

    .line 23
    .line 24
    invoke-interface {v4, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    if-nez v4, :cond_1

    .line 29
    .line 30
    if-le v2, p1, :cond_0

    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    if-lez v4, :cond_0

    .line 37
    .line 38
    const-string v4, ";"

    .line 39
    .line 40
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    :cond_0
    iget-object v4, p0, Ll/xcx;->U0:Ll/xcx$g;

    .line 47
    .line 48
    invoke-virtual {v4, v2}, Ll/xcx$g;->G(I)Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/BreakIce;->content:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    iget-object v4, p0, Ll/xcx;->Y0:Ljava/util/Set;

    .line 61
    .line 62
    invoke-interface {v4, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_2
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-lez p1, :cond_3

    .line 73
    .line 74
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->pageId()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    const-string p1, "status"

    .line 83
    .line 84
    invoke-static {p1, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    const-string p2, "message_id"

    .line 89
    .line 90
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p3

    .line 94
    invoke-static {p2, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 95
    .line 96
    .line 97
    move-result-object p2

    .line 98
    const-string p3, "chat_content"

    .line 99
    .line 100
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-static {p3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 105
    .line 106
    .line 107
    move-result-object p3

    .line 108
    filled-new-array {p1, p2, p3}, [Ll/pf60;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    const-string p2, "e_breakice_content"

    .line 113
    .line 114
    invoke-static {p2, p0, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 115
    .line 116
    .line 117
    :cond_3
    return-void
.end method

.method public final d1(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 2

    .line 1
    invoke-static {}, Ll/tye;->c()Ll/tye;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p2}, Ll/tye;->l(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    iget-object v0, p0, Ll/xcx;->K0:Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    new-instance v1, Ll/xcx$b;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/xcx$b;-><init>(Ll/xcx;)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    invoke-static {p2, v0, p1, p0, v1}, Ll/d810;->h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;ZLjava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    const-string p0, "select_emoji"

    .line 24
    .line 25
    invoke-static {p0, p3}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    filled-new-array {p0}, [Ll/sfj0$a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string p1, "e_match_emoji"

    .line 34
    .line 35
    const-string p2, "p_successful_match_view"

    .line 36
    .line 37
    invoke-static {p1, p2, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final d2(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/xcx$d;

    .line 6
    .line 7
    move-object v2, p0

    .line 8
    move-object v4, p1

    .line 9
    move-object v5, p2

    .line 10
    move-object v6, p3

    .line 11
    move v3, p4

    .line 12
    invoke-direct/range {v1 .. v6}, Ll/xcx$d;-><init>(Ll/xcx;ILandroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-wide/16 p0, 0x15e

    .line 16
    .line 17
    invoke-static {v0, v1, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xcx;->a1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final e1(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_4

    .line 17
    .line 18
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideLocationFromSVip()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_0

    .line 35
    .line 36
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 46
    .line 47
    iget v0, v0, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 48
    .line 49
    const/4 v1, 0x1

    .line 50
    invoke-static {v0, v1}, Ll/q8g0;->p(IZ)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-nez v1, :cond_0

    .line 59
    .line 60
    const-string v1, "("

    .line 61
    .line 62
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string v0, ")"

    .line 69
    .line 70
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 74
    .line 75
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 76
    .line 77
    invoke-static {v0}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    const-string v1, " \u00b7 "

    .line 86
    .line 87
    if-nez v0, :cond_2

    .line 88
    .line 89
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-eqz v0, :cond_1

    .line 98
    .line 99
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 100
    .line 101
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 102
    .line 103
    invoke-static {v0}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_1
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 115
    .line 116
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 117
    .line 118
    invoke-static {v0}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    :cond_2
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 126
    .line 127
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-lez v0, :cond_4

    .line 132
    .line 133
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideAgeFromSVip()Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    if-nez v0, :cond_4

    .line 138
    .line 139
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    const-string v2, "\u5c81"

    .line 148
    .line 149
    if-eqz v0, :cond_3

    .line 150
    .line 151
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 152
    .line 153
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    goto :goto_1

    .line 160
    :cond_3
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 164
    .line 165
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    :cond_4
    :goto_1
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    invoke-static {p0}, Ll/hmj0;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    return-object p0
.end method

.method public final e2()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/xcx;->K:Lv/VText;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "["

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    sget v4, Lcom/p1/mobile/putong/core/R$string;->Hj:I

    .line 15
    .line 16
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v3, "]"

    .line 24
    .line 25
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/xcx;->H:Landroid/widget/FrameLayout;

    .line 36
    .line 37
    new-instance v1, Ll/hcx;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/hcx;-><init>(Ll/xcx;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/xcx;->O:Lv/VText;

    .line 46
    .line 47
    new-instance v1, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    sget v5, Lcom/p1/mobile/putong/core/R$string;->Gj:I

    .line 57
    .line 58
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v4

    .line 62
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/xcx;->L:Landroid/widget/FrameLayout;

    .line 76
    .line 77
    new-instance v1, Ll/icx;

    .line 78
    .line 79
    invoke-direct {v1, p0}, Ll/icx;-><init>(Ll/xcx;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Ll/xcx;->S:Lv/VText;

    .line 86
    .line 87
    new-instance v1, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 93
    .line 94
    .line 95
    move-result-object v4

    .line 96
    sget v5, Lcom/p1/mobile/putong/core/R$string;->j4:I

    .line 97
    .line 98
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Ll/xcx;->P:Landroid/widget/FrameLayout;

    .line 116
    .line 117
    new-instance v1, Ll/kcx;

    .line 118
    .line 119
    invoke-direct {v1, p0}, Ll/kcx;-><init>(Ll/xcx;)V

    .line 120
    .line 121
    .line 122
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Ll/xcx;->W:Lv/VText;

    .line 126
    .line 127
    new-instance v1, Ljava/lang/StringBuilder;

    .line 128
    .line 129
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    sget v4, Lcom/p1/mobile/putong/core/R$string;->i4:I

    .line 137
    .line 138
    invoke-virtual {v2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 153
    .line 154
    .line 155
    iget-object v0, p0, Ll/xcx;->T:Landroid/widget/FrameLayout;

    .line 156
    .line 157
    new-instance v1, Ll/lcx;

    .line 158
    .line 159
    invoke-direct {v1, p0}, Ll/lcx;-><init>(Ll/xcx;)V

    .line 160
    .line 161
    .line 162
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 163
    .line 164
    .line 165
    return-void
.end method

.method public enterAnimation()Landroid/animation/Animator;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xcx;->V1()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ll/xcx;->J0:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xcx;->R1()Landroid/animation/Animator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p0, Ll/xcx;->k0:Ll/xbx;

    .line 13
    .line 14
    invoke-virtual {v1}, Ll/xbx;->r1()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {p0, v1}, Ll/xcx;->P1(I)Landroid/animation/Animator;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    filled-new-array {v0, p0}, [Landroid/animation/Animator;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :cond_0
    iget-object v0, p0, Ll/xcx;->k0:Ll/xbx;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/xbx;->r1()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-virtual {p0, v0}, Ll/xcx;->P1(I)Landroid/animation/Animator;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    filled-new-array {p0}, [Landroid/animation/Animator;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {p0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0
.end method

.method public exitAnimation()Landroid/animation/Animator;
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-static {p0}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public final f1()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xcx;->n:Lv/VImage;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public f2()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xcx;->E:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->clearFocus()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final g1()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xcx;->r:Lv/VImage;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final g2(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 1
    const-string p0, "%s"

    .line 2
    .line 3
    invoke-virtual {p2, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p2, p0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v1, "  "

    .line 17
    .line 18
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    new-instance v2, Landroid/text/SpannableString;

    .line 36
    .line 37
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {p2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-direct {v2, v0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    new-instance v0, Landroid/text/style/StyleSpan;

    .line 49
    .line 50
    const/4 v3, 0x1

    .line 51
    invoke-direct {v0, v3}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 52
    .line 53
    .line 54
    add-int/2addr v1, p0

    .line 55
    const/16 v4, 0x21

    .line 56
    .line 57
    invoke-virtual {v2, v0, p0, v1, v4}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1}, Landroid/widget/TextView;->getLineCount()I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    const/4 v1, 0x2

    .line 68
    if-gt v0, v1, :cond_1

    .line 69
    .line 70
    :goto_0
    return-void

    .line 71
    :cond_1
    invoke-virtual {p1}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0, v3}, Landroid/text/Layout;->getLineEnd(I)I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    sub-int/2addr v0, v1

    .line 84
    add-int/lit8 v0, v0, -0x3

    .line 85
    .line 86
    const-string v1, "... "

    .line 87
    .line 88
    const-string v2, " "

    .line 89
    .line 90
    if-gez v0, :cond_2

    .line 91
    .line 92
    new-instance v0, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p3

    .line 107
    filled-new-array {p3}, [Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-static {p2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p2

    .line 115
    goto :goto_1

    .line 116
    :cond_2
    new-instance v5, Ljava/lang/StringBuilder;

    .line 117
    .line 118
    invoke-direct {v5, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    const/4 v2, 0x0

    .line 122
    invoke-virtual {p3, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p3

    .line 126
    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p3

    .line 136
    filled-new-array {p3}, [Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-static {p2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p2

    .line 144
    :goto_1
    new-instance v0, Landroid/text/SpannableString;

    .line 145
    .line 146
    invoke-direct {v0, p2}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 147
    .line 148
    .line 149
    new-instance p2, Landroid/text/style/StyleSpan;

    .line 150
    .line 151
    invoke-direct {p2, v3}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 155
    .line 156
    .line 157
    move-result p3

    .line 158
    add-int/2addr p3, p0

    .line 159
    invoke-virtual {v0, p2, p0, p3, v4}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 163
    .line 164
    .line 165
    return-void
.end method

.method public h(II)V
    .locals 1

    .line 1
    iget p2, p0, Ll/xcx;->E0:I

    .line 2
    .line 3
    sub-int v0, p1, p2

    .line 4
    .line 5
    if-gtz v0, :cond_2

    .line 6
    .line 7
    if-lez p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sub-int p2, p1, p2

    .line 11
    .line 12
    if-gez p2, :cond_4

    .line 13
    .line 14
    iget-boolean p2, p0, Ll/xcx;->p0:Z

    .line 15
    .line 16
    if-eqz p2, :cond_1

    .line 17
    .line 18
    invoke-direct {p0}, Ll/xcx;->W0()V

    .line 19
    .line 20
    .line 21
    :cond_1
    const/4 p2, 0x0

    .line 22
    iput-boolean p2, p0, Ll/xcx;->p0:Z

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_2
    :goto_0
    iget-boolean p2, p0, Ll/xcx;->p0:Z

    .line 26
    .line 27
    if-nez p2, :cond_3

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ll/xcx;->X0(I)V

    .line 30
    .line 31
    .line 32
    :cond_3
    const/4 p2, 0x1

    .line 33
    iput-boolean p2, p0, Ll/xcx;->p0:Z

    .line 34
    .line 35
    :cond_4
    :goto_1
    iput p1, p0, Ll/xcx;->E0:I

    .line 36
    .line 37
    return-void
.end method

.method public final h1(I)V
    .locals 5

    .line 1
    const/16 v0, 0xd

    .line 2
    .line 3
    const/16 v1, 0xb

    .line 4
    .line 5
    const/16 v2, 0xc

    .line 6
    .line 7
    if-eq p1, v2, :cond_5

    .line 8
    .line 9
    if-eq p1, v1, :cond_5

    .line 10
    .line 11
    if-ne p1, v0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/pgj;->c()Z

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-eqz v3, :cond_0

    .line 18
    .line 19
    goto/16 :goto_1

    .line 20
    .line 21
    :cond_0
    const/16 v0, 0x26

    .line 22
    .line 23
    const/16 v1, 0x25

    .line 24
    .line 25
    const/16 v2, 0x27

    .line 26
    .line 27
    if-eq p1, v2, :cond_2

    .line 28
    .line 29
    if-eq p1, v1, :cond_2

    .line 30
    .line 31
    if-ne p1, v0, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    invoke-virtual {p0}, Ll/xcx;->Z0()V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_2
    :goto_0
    const/4 v3, 0x0

    .line 39
    const/4 v4, 0x1

    .line 40
    if-ne p1, v0, :cond_3

    .line 41
    .line 42
    iget-object p1, p0, Ll/xcx;->n:Lv/VImage;

    .line 43
    .line 44
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/xcx;->r:Lv/VImage;

    .line 48
    .line 49
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Ll/xcx;->n:Lv/VImage;

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    sget v0, Ll/dbc0;->ce:I

    .line 59
    .line 60
    invoke-static {p0, v0}, Ll/j26;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p1, p0}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_3
    if-ne p1, v1, :cond_4

    .line 69
    .line 70
    iget-object p1, p0, Ll/xcx;->n:Lv/VImage;

    .line 71
    .line 72
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Ll/xcx;->r:Lv/VImage;

    .line 76
    .line 77
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Ll/xcx;->r:Lv/VImage;

    .line 81
    .line 82
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    sget v0, Ll/dbc0;->ce:I

    .line 87
    .line 88
    invoke-static {p0, v0}, Ll/j26;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p1, p0}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_4
    if-ne p1, v2, :cond_8

    .line 97
    .line 98
    iget-object p1, p0, Ll/xcx;->n:Lv/VImage;

    .line 99
    .line 100
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 101
    .line 102
    .line 103
    iget-object p1, p0, Ll/xcx;->r:Lv/VImage;

    .line 104
    .line 105
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 106
    .line 107
    .line 108
    iget-object p1, p0, Ll/xcx;->n:Lv/VImage;

    .line 109
    .line 110
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    sget v1, Ll/dbc0;->ce:I

    .line 115
    .line 116
    invoke-static {v0, v1}, Ll/j26;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {p1, v0}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 121
    .line 122
    .line 123
    iget-object p1, p0, Ll/xcx;->r:Lv/VImage;

    .line 124
    .line 125
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    sget v0, Ll/dbc0;->ce:I

    .line 130
    .line 131
    invoke-static {p0, v0}, Ll/j26;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-virtual {p1, p0}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :cond_5
    :goto_1
    if-ne p1, v2, :cond_6

    .line 140
    .line 141
    invoke-direct {p0}, Ll/xcx;->Z1()V

    .line 142
    .line 143
    .line 144
    invoke-virtual {p0}, Ll/xcx;->g1()V

    .line 145
    .line 146
    .line 147
    return-void

    .line 148
    :cond_6
    if-ne p1, v1, :cond_7

    .line 149
    .line 150
    invoke-direct {p0}, Ll/xcx;->Y1()V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0}, Ll/xcx;->f1()V

    .line 154
    .line 155
    .line 156
    return-void

    .line 157
    :cond_7
    if-ne p1, v0, :cond_8

    .line 158
    .line 159
    invoke-direct {p0}, Ll/xcx;->Y1()V

    .line 160
    .line 161
    .line 162
    invoke-direct {p0}, Ll/xcx;->Z1()V

    .line 163
    .line 164
    .line 165
    :cond_8
    return-void
.end method

.method public final h2(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    .line 1
    if-eqz p2, :cond_4

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto/16 :goto_1

    .line 6
    .line 7
    :cond_0
    const-string p0, "%s"

    .line 8
    .line 9
    invoke-virtual {p2, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    goto/16 :goto_1

    .line 16
    .line 17
    :cond_1
    invoke-virtual {p2, p0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v1, " "

    .line 24
    .line 25
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    new-instance v3, Landroid/text/SpannableString;

    .line 43
    .line 44
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    invoke-static {p2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    invoke-direct {v3, v4}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    new-instance v4, Landroid/text/style/StyleSpan;

    .line 56
    .line 57
    const/4 v5, 0x1

    .line 58
    invoke-direct {v4, v5}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 59
    .line 60
    .line 61
    add-int/2addr v2, p0

    .line 62
    const/16 v6, 0x21

    .line 63
    .line 64
    invoke-virtual {v3, v4, p0, v2, v6}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 65
    .line 66
    .line 67
    new-instance v2, Landroid/text/style/ForegroundColorSpan;

    .line 68
    .line 69
    const-string v4, "#CC000000"

    .line 70
    .line 71
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result v7

    .line 75
    invoke-direct {v2, v7}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    add-int/2addr v0, p0

    .line 83
    invoke-virtual {v3, v2, p0, v0, v6}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p1}, Landroid/widget/TextView;->getLineCount()I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    const/4 v2, 0x2

    .line 94
    if-gt v0, v2, :cond_2

    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_2
    invoke-virtual {p1}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {v0, v5}, Landroid/text/Layout;->getLineEnd(I)I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    sub-int/2addr v0, v2

    .line 110
    add-int/lit8 v0, v0, -0x3

    .line 111
    .line 112
    const-string v2, "... "

    .line 113
    .line 114
    if-gez v0, :cond_3

    .line 115
    .line 116
    new-instance v0, Ljava/lang/StringBuilder;

    .line 117
    .line 118
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p3

    .line 131
    filled-new-array {p3}, [Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-static {p2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p2

    .line 139
    goto :goto_0

    .line 140
    :cond_3
    new-instance v3, Ljava/lang/StringBuilder;

    .line 141
    .line 142
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    const/4 v1, 0x0

    .line 146
    invoke-virtual {p3, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p3

    .line 150
    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p3

    .line 160
    filled-new-array {p3}, [Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-static {p2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object p2

    .line 168
    :goto_0
    new-instance v0, Landroid/text/SpannableString;

    .line 169
    .line 170
    invoke-direct {v0, p2}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 171
    .line 172
    .line 173
    new-instance p2, Landroid/text/style/StyleSpan;

    .line 174
    .line 175
    invoke-direct {p2, v5}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    add-int/2addr v1, p0

    .line 183
    invoke-virtual {v0, p2, p0, v1, v6}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 184
    .line 185
    .line 186
    new-instance p2, Landroid/text/style/ForegroundColorSpan;

    .line 187
    .line 188
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 189
    .line 190
    .line 191
    move-result v1

    .line 192
    invoke-direct {p2, v1}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 196
    .line 197
    .line 198
    move-result p3

    .line 199
    add-int/2addr p3, p0

    .line 200
    invoke-virtual {v0, p2, p0, p3, v6}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 204
    .line 205
    .line 206
    :cond_4
    :goto_1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/xbx;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/xcx;->Y0(Ll/xbx;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i2()V
    .locals 0

    .line 1
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xcx;->S0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public initAnimationState()V
    .locals 0

    .line 1
    return-void
.end method

.method public j1(ZI)V
    .locals 8

    .line 1
    invoke-static {}, Ll/bnl0;->w0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ll/rsf0;->i(I)F

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget v1, p0, Ll/xcx;->I0:F

    .line 10
    .line 11
    div-float/2addr v0, v1

    .line 12
    iput v0, p0, Ll/xcx;->Q0:F

    .line 13
    .line 14
    invoke-static {}, Ll/bnl0;->y0()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-static {v0}, Ll/rsf0;->i(I)F

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/high16 v1, 0x43b40000    # 360.0f

    .line 23
    .line 24
    cmpg-float v0, v0, v1

    .line 25
    .line 26
    if-gez v0, :cond_0

    .line 27
    .line 28
    invoke-static {}, Ll/bnl0;->y0()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    invoke-static {v0}, Ll/rsf0;->i(I)F

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    const v1, 0x43bb8000    # 375.0f

    .line 37
    .line 38
    .line 39
    div-float/2addr v0, v1

    .line 40
    iput v0, p0, Ll/xcx;->R0:F

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    iget v0, p0, Ll/xcx;->Q0:F

    .line 44
    .line 45
    iput v0, p0, Ll/xcx;->R0:F

    .line 46
    .line 47
    :goto_0
    iget v0, p0, Ll/xcx;->Q0:F

    .line 48
    .line 49
    const/high16 v1, 0x43020000    # 130.0f

    .line 50
    .line 51
    mul-float/2addr v0, v1

    .line 52
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    iput v0, p0, Ll/xcx;->H0:I

    .line 57
    .line 58
    iget-object v0, p0, Ll/xcx;->g:Landroid/widget/TextView;

    .line 59
    .line 60
    const/high16 v1, 0x42920000    # 73.0f

    .line 61
    .line 62
    iget v2, p0, Ll/xcx;->Q0:F

    .line 63
    .line 64
    mul-float/2addr v2, v1

    .line 65
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/xcx;->h:Lv/VText;

    .line 73
    .line 74
    const/high16 v1, 0x41f80000    # 31.0f

    .line 75
    .line 76
    iget v2, p0, Ll/xcx;->Q0:F

    .line 77
    .line 78
    mul-float/2addr v2, v1

    .line 79
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Ll/xcx;->i:Landroid/widget/TextView;

    .line 87
    .line 88
    iget v1, p0, Ll/xcx;->Q0:F

    .line 89
    .line 90
    const/high16 v2, 0x40a00000    # 5.0f

    .line 91
    .line 92
    mul-float/2addr v1, v2

    .line 93
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Ll/xcx;->k:Lv/VRelative;

    .line 101
    .line 102
    iget v1, p0, Ll/xcx;->Q0:F

    .line 103
    .line 104
    const/high16 v3, 0x43350000    # 181.0f

    .line 105
    .line 106
    mul-float/2addr v1, v3

    .line 107
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Ll/xcx;->p:Lv/VRelative;

    .line 115
    .line 116
    iget v1, p0, Ll/xcx;->Q0:F

    .line 117
    .line 118
    mul-float/2addr v1, v3

    .line 119
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Ll/xcx;->k:Lv/VRelative;

    .line 127
    .line 128
    iget v1, p0, Ll/xcx;->R0:F

    .line 129
    .line 130
    const/high16 v3, 0x43480000    # 200.0f

    .line 131
    .line 132
    mul-float/2addr v1, v3

    .line 133
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 138
    .line 139
    .line 140
    iget v0, p0, Ll/xcx;->R0:F

    .line 141
    .line 142
    const/high16 v1, 0x433e0000    # 190.0f

    .line 143
    .line 144
    mul-float/2addr v0, v1

    .line 145
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    iget-object v4, p0, Ll/xcx;->k:Lv/VRelative;

    .line 150
    .line 151
    const/4 v5, 0x1

    .line 152
    new-array v6, v5, [Landroid/view/View;

    .line 153
    .line 154
    const/4 v7, 0x0

    .line 155
    aput-object v4, v6, v7

    .line 156
    .line 157
    invoke-static {v0, v6}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 158
    .line 159
    .line 160
    iget-object v0, p0, Ll/xcx;->l:Lv/VDraweeView;

    .line 161
    .line 162
    iget v4, p0, Ll/xcx;->R0:F

    .line 163
    .line 164
    mul-float/2addr v4, v1

    .line 165
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 166
    .line 167
    .line 168
    move-result v4

    .line 169
    invoke-static {v0, v4}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 170
    .line 171
    .line 172
    iget v0, p0, Ll/xcx;->R0:F

    .line 173
    .line 174
    mul-float/2addr v0, v1

    .line 175
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    iget-object v4, p0, Ll/xcx;->l:Lv/VDraweeView;

    .line 180
    .line 181
    new-array v6, v5, [Landroid/view/View;

    .line 182
    .line 183
    aput-object v4, v6, v7

    .line 184
    .line 185
    invoke-static {v0, v6}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 186
    .line 187
    .line 188
    iget-object v0, p0, Ll/xcx;->p:Lv/VRelative;

    .line 189
    .line 190
    iget v4, p0, Ll/xcx;->R0:F

    .line 191
    .line 192
    mul-float/2addr v4, v3

    .line 193
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 194
    .line 195
    .line 196
    move-result v3

    .line 197
    invoke-static {v0, v3}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 198
    .line 199
    .line 200
    iget v0, p0, Ll/xcx;->R0:F

    .line 201
    .line 202
    mul-float/2addr v0, v1

    .line 203
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 204
    .line 205
    .line 206
    move-result v0

    .line 207
    iget-object v3, p0, Ll/xcx;->p:Lv/VRelative;

    .line 208
    .line 209
    new-array v4, v5, [Landroid/view/View;

    .line 210
    .line 211
    aput-object v3, v4, v7

    .line 212
    .line 213
    invoke-static {v0, v4}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 214
    .line 215
    .line 216
    iget-object v0, p0, Ll/xcx;->q:Lv/VDraweeView;

    .line 217
    .line 218
    iget v3, p0, Ll/xcx;->R0:F

    .line 219
    .line 220
    mul-float/2addr v3, v1

    .line 221
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 222
    .line 223
    .line 224
    move-result v3

    .line 225
    invoke-static {v0, v3}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 226
    .line 227
    .line 228
    iget v0, p0, Ll/xcx;->R0:F

    .line 229
    .line 230
    mul-float/2addr v0, v1

    .line 231
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 232
    .line 233
    .line 234
    move-result v0

    .line 235
    iget-object v1, p0, Ll/xcx;->q:Lv/VDraweeView;

    .line 236
    .line 237
    new-array v3, v5, [Landroid/view/View;

    .line 238
    .line 239
    aput-object v1, v3, v7

    .line 240
    .line 241
    invoke-static {v0, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 242
    .line 243
    .line 244
    iget-object v0, p0, Ll/xcx;->n:Lv/VImage;

    .line 245
    .line 246
    iget v1, p0, Ll/xcx;->R0:F

    .line 247
    .line 248
    const/high16 v3, 0x41f00000    # 30.0f

    .line 249
    .line 250
    mul-float/2addr v1, v3

    .line 251
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 252
    .line 253
    .line 254
    move-result v1

    .line 255
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 256
    .line 257
    .line 258
    iget v0, p0, Ll/xcx;->R0:F

    .line 259
    .line 260
    mul-float/2addr v0, v3

    .line 261
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 262
    .line 263
    .line 264
    move-result v0

    .line 265
    iget-object v1, p0, Ll/xcx;->n:Lv/VImage;

    .line 266
    .line 267
    new-array v4, v5, [Landroid/view/View;

    .line 268
    .line 269
    aput-object v1, v4, v7

    .line 270
    .line 271
    invoke-static {v0, v4}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 272
    .line 273
    .line 274
    iget-object v0, p0, Ll/xcx;->r:Lv/VImage;

    .line 275
    .line 276
    iget v1, p0, Ll/xcx;->R0:F

    .line 277
    .line 278
    mul-float/2addr v1, v3

    .line 279
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 280
    .line 281
    .line 282
    move-result v1

    .line 283
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 284
    .line 285
    .line 286
    iget v0, p0, Ll/xcx;->R0:F

    .line 287
    .line 288
    mul-float/2addr v0, v3

    .line 289
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 290
    .line 291
    .line 292
    move-result v0

    .line 293
    iget-object v1, p0, Ll/xcx;->r:Lv/VImage;

    .line 294
    .line 295
    new-array v3, v5, [Landroid/view/View;

    .line 296
    .line 297
    aput-object v1, v3, v7

    .line 298
    .line 299
    invoke-static {v0, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 300
    .line 301
    .line 302
    iget-object v0, p0, Ll/xcx;->D:Landroid/widget/LinearLayout;

    .line 303
    .line 304
    const/high16 v1, 0x42800000    # 64.0f

    .line 305
    .line 306
    iget v3, p0, Ll/xcx;->Q0:F

    .line 307
    .line 308
    mul-float/2addr v3, v1

    .line 309
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 310
    .line 311
    .line 312
    move-result v1

    .line 313
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 314
    .line 315
    .line 316
    iget-object v0, p0, Ll/xcx;->F:Lv/VText;

    .line 317
    .line 318
    const/high16 v1, 0x42400000    # 48.0f

    .line 319
    .line 320
    iget v3, p0, Ll/xcx;->Q0:F

    .line 321
    .line 322
    mul-float/2addr v3, v1

    .line 323
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 324
    .line 325
    .line 326
    move-result v1

    .line 327
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 328
    .line 329
    .line 330
    iget-object v0, p0, Ll/xcx;->X:Lv/VButton_FakeShadow;

    .line 331
    .line 332
    const/high16 v1, 0x41c80000    # 25.0f

    .line 333
    .line 334
    iget v3, p0, Ll/xcx;->Q0:F

    .line 335
    .line 336
    mul-float/2addr v3, v1

    .line 337
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 338
    .line 339
    .line 340
    move-result v1

    .line 341
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 342
    .line 343
    .line 344
    iget-object v0, p0, Ll/xcx;->Y:Lv/VButton;

    .line 345
    .line 346
    const/high16 v1, 0x41600000    # 14.0f

    .line 347
    .line 348
    iget v3, p0, Ll/xcx;->Q0:F

    .line 349
    .line 350
    mul-float/2addr v3, v1

    .line 351
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 352
    .line 353
    .line 354
    move-result v1

    .line 355
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 356
    .line 357
    .line 358
    iget-object v0, p0, Ll/xcx;->g:Landroid/widget/TextView;

    .line 359
    .line 360
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 361
    .line 362
    .line 363
    move-result-object v1

    .line 364
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Up:I

    .line 365
    .line 366
    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 367
    .line 368
    .line 369
    move-result-object v1

    .line 370
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 371
    .line 372
    .line 373
    iget-object v0, p0, Ll/xcx;->g:Landroid/widget/TextView;

    .line 374
    .line 375
    iget v1, p0, Ll/xcx;->Q0:F

    .line 376
    .line 377
    const/high16 v3, 0x41900000    # 18.0f

    .line 378
    .line 379
    mul-float/2addr v1, v3

    .line 380
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 381
    .line 382
    .line 383
    iget-object v0, p0, Ll/xcx;->h:Lv/VText;

    .line 384
    .line 385
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 386
    .line 387
    .line 388
    move-result-object v1

    .line 389
    sget v4, Lcom/p1/mobile/putong/core/R$string;->Tp:I

    .line 390
    .line 391
    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 392
    .line 393
    .line 394
    move-result-object v1

    .line 395
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 396
    .line 397
    .line 398
    iget-object v0, p0, Ll/xcx;->h:Lv/VText;

    .line 399
    .line 400
    const/high16 v1, 0x42080000    # 34.0f

    .line 401
    .line 402
    iget v4, p0, Ll/xcx;->Q0:F

    .line 403
    .line 404
    mul-float/2addr v4, v1

    .line 405
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 406
    .line 407
    .line 408
    iget-object v0, p0, Ll/xcx;->i:Landroid/widget/TextView;

    .line 409
    .line 410
    iget v1, p0, Ll/xcx;->Q0:F

    .line 411
    .line 412
    mul-float/2addr v1, v3

    .line 413
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 414
    .line 415
    .line 416
    iget-object v0, p0, Ll/xcx;->E:Lv/VEditText;

    .line 417
    .line 418
    iget v1, p0, Ll/xcx;->Q0:F

    .line 419
    .line 420
    mul-float/2addr v1, v3

    .line 421
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 422
    .line 423
    .line 424
    iget-object v0, p0, Ll/xcx;->F:Lv/VText;

    .line 425
    .line 426
    iget v1, p0, Ll/xcx;->Q0:F

    .line 427
    .line 428
    const/high16 v4, 0x41800000    # 16.0f

    .line 429
    .line 430
    mul-float/2addr v1, v4

    .line 431
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 432
    .line 433
    .line 434
    iget-object v0, p0, Ll/xcx;->X:Lv/VButton_FakeShadow;

    .line 435
    .line 436
    iget v1, p0, Ll/xcx;->Q0:F

    .line 437
    .line 438
    mul-float/2addr v1, v4

    .line 439
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 440
    .line 441
    .line 442
    iget-object v0, p0, Ll/xcx;->Y:Lv/VButton;

    .line 443
    .line 444
    iget v1, p0, Ll/xcx;->Q0:F

    .line 445
    .line 446
    mul-float/2addr v1, v4

    .line 447
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 448
    .line 449
    .line 450
    iget-object v0, p0, Ll/xcx;->F:Lv/VText;

    .line 451
    .line 452
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 453
    .line 454
    .line 455
    move-result-object v0

    .line 456
    invoke-virtual {v0, v5}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 457
    .line 458
    .line 459
    iget-object v0, p0, Ll/xcx;->Y:Lv/VButton;

    .line 460
    .line 461
    iget-object v1, p0, Ll/xcx;->N0:Landroid/view/View$OnClickListener;

    .line 462
    .line 463
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 464
    .line 465
    .line 466
    iget-object v0, p0, Ll/xcx;->X:Lv/VButton_FakeShadow;

    .line 467
    .line 468
    iget-object v1, p0, Ll/xcx;->M0:Landroid/view/View$OnClickListener;

    .line 469
    .line 470
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 471
    .line 472
    .line 473
    iget-object v0, p0, Ll/xcx;->F:Lv/VText;

    .line 474
    .line 475
    iget-object v1, p0, Ll/xcx;->O0:Landroid/view/View$OnClickListener;

    .line 476
    .line 477
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 478
    .line 479
    .line 480
    iget-object v0, p0, Ll/xcx;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 481
    .line 482
    new-instance v1, Ll/bcx;

    .line 483
    .line 484
    invoke-direct {v1, p0}, Ll/bcx;-><init>(Ll/xcx;)V

    .line 485
    .line 486
    .line 487
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 488
    .line 489
    .line 490
    invoke-virtual {p0}, Ll/xcx;->l1()V

    .line 491
    .line 492
    .line 493
    invoke-virtual {p0}, Ll/xcx;->k1()V

    .line 494
    .line 495
    .line 496
    invoke-virtual {p0, p2}, Ll/xcx;->h1(I)V

    .line 497
    .line 498
    .line 499
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 500
    .line 501
    .line 502
    move-result v0

    .line 503
    if-nez v0, :cond_1

    .line 504
    .line 505
    if-eqz p1, :cond_1

    .line 506
    .line 507
    invoke-direct {p0}, Ll/xcx;->a2()V

    .line 508
    .line 509
    .line 510
    :cond_1
    const/16 p1, 0x28

    .line 511
    .line 512
    const/high16 v0, 0x42600000    # 56.0f

    .line 513
    .line 514
    if-eq p2, p1, :cond_2

    .line 515
    .line 516
    const/16 p1, 0x29

    .line 517
    .line 518
    if-ne p2, p1, :cond_3

    .line 519
    .line 520
    :cond_2
    iget-object p1, p0, Ll/xcx;->D:Landroid/widget/LinearLayout;

    .line 521
    .line 522
    invoke-static {p1, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 523
    .line 524
    .line 525
    iget-object p1, p0, Ll/xcx;->X:Lv/VButton_FakeShadow;

    .line 526
    .line 527
    invoke-static {p1, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 528
    .line 529
    .line 530
    iget-object p1, p0, Ll/xcx;->Y:Lv/VButton;

    .line 531
    .line 532
    invoke-static {p1, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 533
    .line 534
    .line 535
    iget-object p1, p0, Ll/xcx;->y:Landroid/widget/TextView;

    .line 536
    .line 537
    invoke-static {p1, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 538
    .line 539
    .line 540
    iget-object p1, p0, Ll/xcx;->z:Landroid/widget/TextView;

    .line 541
    .line 542
    invoke-static {p1, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 543
    .line 544
    .line 545
    iget-object p1, p0, Ll/xcx;->g:Landroid/widget/TextView;

    .line 546
    .line 547
    const-string v1, "Congratulations\uff01"

    .line 548
    .line 549
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 550
    .line 551
    .line 552
    iget-object p1, p0, Ll/xcx;->y:Landroid/widget/TextView;

    .line 553
    .line 554
    iget v1, p0, Ll/xcx;->Q0:F

    .line 555
    .line 556
    mul-float/2addr v1, v0

    .line 557
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 558
    .line 559
    .line 560
    move-result v1

    .line 561
    invoke-static {p1, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 562
    .line 563
    .line 564
    iget-object p1, p0, Ll/xcx;->y:Landroid/widget/TextView;

    .line 565
    .line 566
    iget v1, p0, Ll/xcx;->Q0:F

    .line 567
    .line 568
    mul-float/2addr v1, v4

    .line 569
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 570
    .line 571
    .line 572
    iget-object p1, p0, Ll/xcx;->z:Landroid/widget/TextView;

    .line 573
    .line 574
    iget v1, p0, Ll/xcx;->Q0:F

    .line 575
    .line 576
    mul-float/2addr v1, v0

    .line 577
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 578
    .line 579
    .line 580
    move-result v1

    .line 581
    invoke-static {p1, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 582
    .line 583
    .line 584
    iget-object p1, p0, Ll/xcx;->z:Landroid/widget/TextView;

    .line 585
    .line 586
    iget v1, p0, Ll/xcx;->Q0:F

    .line 587
    .line 588
    mul-float/2addr v1, v4

    .line 589
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 590
    .line 591
    .line 592
    iget-object p1, p0, Ll/xcx;->y:Landroid/widget/TextView;

    .line 593
    .line 594
    new-instance v1, Ll/ccx;

    .line 595
    .line 596
    invoke-direct {v1, p0, p2}, Ll/ccx;-><init>(Ll/xcx;I)V

    .line 597
    .line 598
    .line 599
    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 600
    .line 601
    .line 602
    iget-object p1, p0, Ll/xcx;->z:Landroid/widget/TextView;

    .line 603
    .line 604
    new-instance v1, Ll/dcx;

    .line 605
    .line 606
    invoke-direct {v1, p0, p2}, Ll/dcx;-><init>(Ll/xcx;I)V

    .line 607
    .line 608
    .line 609
    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 610
    .line 611
    .line 612
    :cond_3
    invoke-static {}, Ll/gra;->j2()Z

    .line 613
    .line 614
    .line 615
    move-result p1

    .line 616
    if-eqz p1, :cond_4

    .line 617
    .line 618
    iget-object p1, p0, Ll/xcx;->g:Landroid/widget/TextView;

    .line 619
    .line 620
    invoke-static {p1, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 621
    .line 622
    .line 623
    iget-object p1, p0, Ll/xcx;->j:Lv/VText;

    .line 624
    .line 625
    invoke-static {p1, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 626
    .line 627
    .line 628
    iget-object p1, p0, Ll/xcx;->h:Lv/VText;

    .line 629
    .line 630
    const/high16 p2, 0x42000000    # 32.0f

    .line 631
    .line 632
    iget v1, p0, Ll/xcx;->Q0:F

    .line 633
    .line 634
    mul-float/2addr v1, p2

    .line 635
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 636
    .line 637
    .line 638
    iget-object p1, p0, Ll/xcx;->h:Lv/VText;

    .line 639
    .line 640
    const-string p2, "#CC000000"

    .line 641
    .line 642
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 643
    .line 644
    .line 645
    move-result p2

    .line 646
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 647
    .line 648
    .line 649
    iget-object p1, p0, Ll/xcx;->h:Lv/VText;

    .line 650
    .line 651
    invoke-static {v5}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 652
    .line 653
    .line 654
    move-result-object p2

    .line 655
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 656
    .line 657
    .line 658
    iget-object p1, p0, Ll/xcx;->i:Landroid/widget/TextView;

    .line 659
    .line 660
    iget p2, p0, Ll/xcx;->Q0:F

    .line 661
    .line 662
    mul-float/2addr p2, v3

    .line 663
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 664
    .line 665
    .line 666
    iget-object p1, p0, Ll/xcx;->i:Landroid/widget/TextView;

    .line 667
    .line 668
    const-string p2, "#66000000"

    .line 669
    .line 670
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 671
    .line 672
    .line 673
    move-result p2

    .line 674
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 675
    .line 676
    .line 677
    iget-object p1, p0, Ll/xcx;->j:Lv/VText;

    .line 678
    .line 679
    iget p2, p0, Ll/xcx;->Q0:F

    .line 680
    .line 681
    mul-float/2addr p2, v4

    .line 682
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 683
    .line 684
    .line 685
    iget-object p1, p0, Ll/xcx;->Y:Lv/VButton;

    .line 686
    .line 687
    invoke-static {v5}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 688
    .line 689
    .line 690
    move-result-object p2

    .line 691
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 692
    .line 693
    .line 694
    iget-object p1, p0, Ll/xcx;->f:Lv/VText;

    .line 695
    .line 696
    iget p2, p0, Ll/xcx;->Q0:F

    .line 697
    .line 698
    mul-float/2addr p2, v3

    .line 699
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 700
    .line 701
    .line 702
    iget-object p1, p0, Ll/xcx;->f:Lv/VText;

    .line 703
    .line 704
    invoke-static {v5}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 705
    .line 706
    .line 707
    move-result-object p2

    .line 708
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 709
    .line 710
    .line 711
    iget-object p1, p0, Ll/xcx;->F:Lv/VText;

    .line 712
    .line 713
    const-string p2, "#33000000"

    .line 714
    .line 715
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 716
    .line 717
    .line 718
    move-result p2

    .line 719
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 720
    .line 721
    .line 722
    iget-object p1, p0, Ll/xcx;->E:Lv/VEditText;

    .line 723
    .line 724
    iget p2, p0, Ll/xcx;->Q0:F

    .line 725
    .line 726
    mul-float/2addr p2, v4

    .line 727
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 728
    .line 729
    .line 730
    iget-object p1, p0, Ll/xcx;->D:Landroid/widget/LinearLayout;

    .line 731
    .line 732
    iget p2, p0, Ll/xcx;->Q0:F

    .line 733
    .line 734
    mul-float/2addr p2, v0

    .line 735
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 736
    .line 737
    .line 738
    move-result p2

    .line 739
    invoke-static {p1, p2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 740
    .line 741
    .line 742
    iget-object p1, p0, Ll/xcx;->h:Lv/VText;

    .line 743
    .line 744
    const/high16 p2, 0x426c0000    # 59.0f

    .line 745
    .line 746
    iget v0, p0, Ll/xcx;->Q0:F

    .line 747
    .line 748
    mul-float/2addr v0, p2

    .line 749
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 750
    .line 751
    .line 752
    move-result p2

    .line 753
    invoke-static {p1, p2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 754
    .line 755
    .line 756
    iget-object p1, p0, Ll/xcx;->i:Landroid/widget/TextView;

    .line 757
    .line 758
    const/high16 p2, 0x41c00000    # 24.0f

    .line 759
    .line 760
    iget v0, p0, Ll/xcx;->Q0:F

    .line 761
    .line 762
    mul-float/2addr v0, p2

    .line 763
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 764
    .line 765
    .line 766
    move-result p2

    .line 767
    invoke-static {p1, p2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 768
    .line 769
    .line 770
    iget-object p1, p0, Ll/xcx;->j:Lv/VText;

    .line 771
    .line 772
    iget p2, p0, Ll/xcx;->Q0:F

    .line 773
    .line 774
    mul-float/2addr p2, v2

    .line 775
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 776
    .line 777
    .line 778
    move-result p2

    .line 779
    invoke-static {p1, p2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 780
    .line 781
    .line 782
    iget-object p1, p0, Ll/xcx;->X:Lv/VButton_FakeShadow;

    .line 783
    .line 784
    const/high16 p2, 0x41a00000    # 20.0f

    .line 785
    .line 786
    iget v0, p0, Ll/xcx;->Q0:F

    .line 787
    .line 788
    mul-float/2addr v0, p2

    .line 789
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 790
    .line 791
    .line 792
    move-result p2

    .line 793
    invoke-static {p1, p2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 794
    .line 795
    .line 796
    iget-object p1, p0, Ll/xcx;->k:Lv/VRelative;

    .line 797
    .line 798
    iget p2, p0, Ll/xcx;->Q0:F

    .line 799
    .line 800
    const/high16 v0, 0x43640000    # 228.0f

    .line 801
    .line 802
    mul-float/2addr p2, v0

    .line 803
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 804
    .line 805
    .line 806
    move-result p2

    .line 807
    invoke-static {p1, p2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 808
    .line 809
    .line 810
    iget-object p1, p0, Ll/xcx;->p:Lv/VRelative;

    .line 811
    .line 812
    iget p2, p0, Ll/xcx;->Q0:F

    .line 813
    .line 814
    mul-float/2addr p2, v0

    .line 815
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 816
    .line 817
    .line 818
    move-result p2

    .line 819
    invoke-static {p1, p2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 820
    .line 821
    .line 822
    iget-object p1, p0, Ll/xcx;->D:Landroid/widget/LinearLayout;

    .line 823
    .line 824
    const/high16 p2, 0x42200000    # 40.0f

    .line 825
    .line 826
    iget v0, p0, Ll/xcx;->Q0:F

    .line 827
    .line 828
    mul-float/2addr v0, p2

    .line 829
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 830
    .line 831
    .line 832
    move-result p2

    .line 833
    invoke-static {p1, p2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 834
    .line 835
    .line 836
    iget-object p1, p0, Ll/xcx;->f:Lv/VText;

    .line 837
    .line 838
    const/high16 p2, 0x423c0000    # 47.0f

    .line 839
    .line 840
    iget v0, p0, Ll/xcx;->Q0:F

    .line 841
    .line 842
    mul-float/2addr v0, p2

    .line 843
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 844
    .line 845
    .line 846
    move-result p2

    .line 847
    invoke-static {p1, p2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 848
    .line 849
    .line 850
    invoke-virtual {p0}, Ll/xcx;->e2()V

    .line 851
    .line 852
    .line 853
    const-string p1, "e_matched_send_message"

    .line 854
    .line 855
    new-array p2, v7, [Ll/sfj0$a;

    .line 856
    .line 857
    const-string v0, "p_successful_match_view"

    .line 858
    .line 859
    invoke-static {p1, v0, p2}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 860
    .line 861
    .line 862
    const-string p1, "e_matched_text_box"

    .line 863
    .line 864
    new-array p2, v7, [Ll/sfj0$a;

    .line 865
    .line 866
    invoke-static {p1, v0, p2}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 867
    .line 868
    .line 869
    const-string p1, "e_matched_later"

    .line 870
    .line 871
    new-array p2, v7, [Ll/sfj0$a;

    .line 872
    .line 873
    invoke-static {p1, v0, p2}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 874
    .line 875
    .line 876
    goto :goto_1

    .line 877
    :cond_4
    iget-object p1, p0, Ll/xcx;->j:Lv/VText;

    .line 878
    .line 879
    invoke-static {p1, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 880
    .line 881
    .line 882
    iget-object p1, p0, Ll/xcx;->G:Lv/VLinear;

    .line 883
    .line 884
    invoke-static {p1, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 885
    .line 886
    .line 887
    iget-object p1, p0, Ll/xcx;->f:Lv/VText;

    .line 888
    .line 889
    invoke-static {p1, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 890
    .line 891
    .line 892
    :goto_1
    iget-object p1, p0, Ll/xcx;->A:Lv/VLinear;

    .line 893
    .line 894
    const/high16 p2, 0x41e00000    # 28.0f

    .line 895
    .line 896
    iget p0, p0, Ll/xcx;->Q0:F

    .line 897
    .line 898
    mul-float/2addr p0, p2

    .line 899
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 900
    .line 901
    .line 902
    move-result p0

    .line 903
    invoke-static {p1, p0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 904
    .line 905
    .line 906
    return-void
.end method

.method public final k1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xcx;->E:Lv/VEditText;

    .line 2
    .line 3
    new-instance v1, Ll/mcx;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/mcx;-><init>(Ll/xcx;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/xcx;->E:Lv/VEditText;

    .line 12
    .line 13
    new-instance v1, Ll/xcx$f;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/xcx$f;-><init>(Ll/xcx;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/xcx;->E:Lv/VEditText;

    .line 22
    .line 23
    new-instance v1, Ll/ncx;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/ncx;-><init>(Ll/xcx;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/xcx;->E:Lv/VEditText;

    .line 32
    .line 33
    new-instance v1, Ll/ocx;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/ocx;-><init>(Ll/xcx;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final k2(IIII)Landroid/animation/Animator;
    .locals 11

    .line 1
    new-instance v6, Landroid/view/animation/DecelerateInterpolator;

    .line 2
    .line 3
    invoke-direct {v6}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v0, 0x28

    .line 7
    .line 8
    const/4 v8, 0x1

    .line 9
    const/4 v9, 0x0

    .line 10
    const/4 v10, 0x2

    .line 11
    if-ne p1, v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/xcx;->y:Landroid/widget/TextView;

    .line 14
    .line 15
    sget-object v1, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 16
    .line 17
    int-to-long v4, p2

    .line 18
    int-to-float p1, p3

    .line 19
    int-to-float v2, p4

    .line 20
    new-array v7, v10, [F

    .line 21
    .line 22
    aput p1, v7, v9

    .line 23
    .line 24
    aput v2, v7, v8

    .line 25
    .line 26
    const-wide/16 v2, 0x0

    .line 27
    .line 28
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    iget-object v0, p0, Ll/xcx;->D:Landroid/widget/LinearLayout;

    .line 34
    .line 35
    sget-object v1, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 36
    .line 37
    int-to-long v4, p2

    .line 38
    int-to-float p1, p3

    .line 39
    int-to-float v2, p4

    .line 40
    new-array v7, v10, [F

    .line 41
    .line 42
    aput p1, v7, v9

    .line 43
    .line 44
    aput v2, v7, v8

    .line 45
    .line 46
    const-wide/16 v2, 0x0

    .line 47
    .line 48
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    :goto_0
    invoke-static {}, Ll/gra;->j2()Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    iget-object v0, p0, Ll/xcx;->i:Landroid/widget/TextView;

    .line 59
    .line 60
    sget-object v1, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 61
    .line 62
    int-to-long v4, p2

    .line 63
    int-to-float p2, p3

    .line 64
    int-to-float p3, p4

    .line 65
    new-array v7, v10, [F

    .line 66
    .line 67
    aput p2, v7, v9

    .line 68
    .line 69
    aput p3, v7, v8

    .line 70
    .line 71
    const-wide/16 v2, 0x0

    .line 72
    .line 73
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 74
    .line 75
    .line 76
    move-result-object p4

    .line 77
    iget-object v0, p0, Ll/xcx;->j:Lv/VText;

    .line 78
    .line 79
    new-array v7, v10, [F

    .line 80
    .line 81
    aput p2, v7, v9

    .line 82
    .line 83
    aput p3, v7, v8

    .line 84
    .line 85
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    filled-new-array {p4, p0, p1}, [Landroid/animation/Animator;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-static {p0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    return-object p0

    .line 98
    :cond_1
    iget-object v0, p0, Ll/xcx;->h:Lv/VText;

    .line 99
    .line 100
    sget-object v1, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 101
    .line 102
    int-to-long v4, p2

    .line 103
    int-to-float p2, p3

    .line 104
    int-to-float p3, p4

    .line 105
    new-array v7, v10, [F

    .line 106
    .line 107
    aput p2, v7, v9

    .line 108
    .line 109
    aput p3, v7, v8

    .line 110
    .line 111
    const-wide/16 v2, 0x0

    .line 112
    .line 113
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 114
    .line 115
    .line 116
    move-result-object p4

    .line 117
    iget-object v0, p0, Ll/xcx;->i:Landroid/widget/TextView;

    .line 118
    .line 119
    new-array v7, v10, [F

    .line 120
    .line 121
    aput p2, v7, v9

    .line 122
    .line 123
    aput p3, v7, v8

    .line 124
    .line 125
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    filled-new-array {p4, p0, p1}, [Landroid/animation/Animator;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-static {p0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    return-object p0
.end method

.method public final l1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xcx;->P0:Ll/f0r;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/f0r;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Ll/f0r;-><init>(Landroid/app/Activity;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/xcx;->P0:Ll/f0r;

    .line 15
    .line 16
    :cond_0
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/gcx;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/gcx;-><init>(Ll/xcx;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic n1(ILandroid/view/View;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xcx;->k0:Ll/xbx;

    .line 2
    .line 3
    const/4 p2, 0x0

    .line 4
    const/16 v0, 0x29

    .line 5
    .line 6
    if-ne p1, v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p2}, Ll/xbx;->g2(Z)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0, p2}, Ll/xbx;->h2(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic o1(ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    const/16 p2, 0x28

    .line 9
    .line 10
    if-ne p1, p2, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    sget p1, Lcom/p1/mobile/putong/core/member/R$string;->F0:I

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/4 p1, 0x0

    .line 27
    new-array p1, p1, [Ljava/lang/Object;

    .line 28
    .line 29
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public final synthetic p1(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string p1, "e_matched_text_box"

    .line 10
    .line 11
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic q1(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 1

    .line 1
    sget-object p1, Ll/qt4;->e:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_3

    .line 14
    .line 15
    iget-object p1, p0, Ll/xcx;->E:Lv/VEditText;

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    const/4 v0, 0x1

    .line 34
    if-eqz p1, :cond_0

    .line 35
    .line 36
    return v0

    .line 37
    :cond_0
    const/4 p1, 0x4

    .line 38
    if-eq p2, p1, :cond_1

    .line 39
    .line 40
    const/4 p1, 0x6

    .line 41
    if-eq p2, p1, :cond_1

    .line 42
    .line 43
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_2

    .line 48
    .line 49
    const/16 p1, 0x42

    .line 50
    .line 51
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getKeyCode()I

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    if-ne p1, p2, :cond_2

    .line 56
    .line 57
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-nez p1, :cond_2

    .line 62
    .line 63
    :cond_1
    iget-object p1, p0, Ll/xcx;->O0:Landroid/view/View$OnClickListener;

    .line 64
    .line 65
    iget-object p0, p0, Ll/xcx;->F:Lv/VText;

    .line 66
    .line 67
    invoke-interface {p1, p0}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 68
    .line 69
    .line 70
    :cond_2
    return v0

    .line 71
    :cond_3
    const/4 p0, 0x0

    .line 72
    return p0
.end method

.method public final synthetic r1(Landroid/view/View;Z)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/match/MatchAct;->pageId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string p1, "e_matched_text_box"

    .line 12
    .line 13
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final synthetic s1()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xcx;->P0:Ll/f0r;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/f0r;->h()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic w1([I)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/xcx;->V0:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x0

    .line 8
    const-string v1, "init"

    .line 9
    .line 10
    invoke-virtual {p0, v0, p1, v1}, Ll/xcx;->b2(IILjava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic y1(Ljava/lang/Long;)V
    .locals 4

    .line 1
    new-instance p1, Lcom/p1/mobile/android/ui/bubble/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const-string v0, "\u5de6\u6ed1\u53ef\u4ee5\u9009\u62e9\u66f4\u591a\u5185\u5bb9\u54e6\uff5e"

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget v1, Ll/c9c0;->I:I

    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    filled-new-array {v0}, [I

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    sget v0, Ll/c9c0;->N:I

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->G(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    const/4 v0, 0x1

    .line 41
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->t(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const/high16 v1, 0x41600000    # 14.0f

    .line 46
    .line 47
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    const/4 v1, 0x0

    .line 52
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/ui/bubble/a;->e(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/ui/bubble/a;->E(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    sget v1, Ll/qa00;->c:I

    .line 61
    .line 62
    neg-int v1, v1

    .line 63
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    const-wide/16 v1, 0x1388

    .line 68
    .line 69
    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    sget v1, Ll/zvk;->D:I

    .line 74
    .line 75
    sget v2, Ll/zvk;->E:I

    .line 76
    .line 77
    or-int/2addr v1, v2

    .line 78
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iget-object v1, p0, Ll/xcx;->W0:Lcom/p1/mobile/android/ui/bubble/d;

    .line 83
    .line 84
    iget-object v2, p0, Ll/xcx;->x:Lv/VRecyclerView;

    .line 85
    .line 86
    const-string v3, "MatchIceBreakBubble"

    .line 87
    .line 88
    invoke-virtual {v1, p1, v2, v3}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Ll/xcx;->X0:Ll/vxd0;

    .line 92
    .line 93
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    check-cast p1, Ljava/lang/Integer;

    .line 98
    .line 99
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    add-int/2addr p1, v0

    .line 104
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-virtual {p0, p1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public final synthetic z1()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/match/a;->w()Lcom/p1/mobile/putong/core/ui/match/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Ll/xcx;->K0:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/match/a;->z(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 12
    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->P1:Ll/e59;

    .line 17
    .line 18
    iget-object v0, v0, Ll/e59;->R:Lrx/subjects/b;

    .line 19
    .line 20
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ll/xcx;->T0()Lcom/p1/mobile/putong/core/ui/match/MatchAct;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 30
    .line 31
    .line 32
    return-void
.end method
