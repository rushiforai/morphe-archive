.class public Lcom/p1/mobile/putong/feed/ui/moments/MomentView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# static fields
.field public static final T0:I


# instance fields
.field public A:Landroid/widget/FrameLayout;

.field public B:Lv/VText;

.field public C:Lv/VText;

.field public D:Landroid/widget/FrameLayout;

.field public E:Landroid/widget/ImageView;

.field public E0:Landroid/widget/LinearLayout;

.field public F:Landroid/view/View;

.field public F0:Landroid/widget/LinearLayout;

.field public G:Landroid/widget/FrameLayout;

.field public G0:Landroid/view/View;

.field public H:Landroid/widget/ImageView;

.field public H0:Landroid/view/View;

.field public I:Lv/VDraweeView;

.field public I0:Lv/VFrame_Anim;

.field public J:Lv/VImage;

.field public J0:Lv/VFrame_Anim;

.field public K:Lv/VDraweeView;

.field public K0:Lv/VProgressBar;

.field public L:Lv/VImage;

.field public L0:Landroid/widget/ImageView;

.field public M:Lv/VDraweeView;

.field public M0:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

.field public N:Lv/VImage;

.field public N0:Lcom/p1/mobile/putong/feed/data/Moment;

.field public O:Lv/VDraweeView;

.field public O0:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lv/VDraweeView;",
            ">;"
        }
    .end annotation
.end field

.field public P:Lv/VImage;

.field public P0:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lv/VImage;",
            ">;"
        }
    .end annotation
.end field

.field public Q:Lv/VDraweeView;

.field public Q0:Lcom/p1/mobile/putong/data/User;

.field public R:Lv/VImage;

.field public R0:Ll/qo00;

.field public S:Lv/VDraweeView;

.field public S0:Landroid/view/View$OnClickListener;

.field public T:Lv/VImage;

.field public U:Landroid/widget/FrameLayout;

.field public V:Lv/VText;

.field public W:Landroid/view/View;

.field public a:Landroid/widget/LinearLayout;

.field public b:Lv/VDraweeView;

.field public c:Lv/VImage;

.field public d:Lv/VText;

.field public e:Lv/VDraweeView;

.field public f:Lv/VImage;

.field public g:Lv/VText;

.field public h:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

.field public i:Landroid/widget/FrameLayout;

.field public j:Landroid/widget/FrameLayout;

.field public k:Lv/VDraweeView;

.field public k0:Landroid/widget/FrameLayout;

.field public l:Lv/VImage;

.field public m:Lv/VDraweeView;

.field public n:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public o:Landroid/widget/LinearLayout;

.field public p:Lv/VText;

.field public p0:Lv/VText;

.field public q:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

.field public r:Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;

.field public s:Lv/VText;

.field public t:Lv/VText;

.field public u:Lv/VText;

.field public v:Landroid/widget/LinearLayout;

.field public w:Landroid/widget/FrameLayout;

.field public x:Lv/VText;

.field public y:Landroid/widget/FrameLayout;

.field public z:Landroid/widget/ImageView;


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
    sput v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->T0:I

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
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->N0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    new-instance p1, Ll/fr00;

    .line 8
    .line 9
    invoke-direct {p1, p0}, Ll/fr00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->S0:Landroid/view/View$OnClickListener;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->N0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 17
    new-instance p1, Ll/fr00;

    invoke-direct {p1, p0}, Ll/fr00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->S0:Landroid/view/View$OnClickListener;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->N0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 20
    new-instance p1, Ll/fr00;

    invoke-direct {p1, p0}, Ll/fr00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->S0:Landroid/view/View$OnClickListener;

    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;ZLjava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p3}, Ll/i4h;->g(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 5
    .line 6
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->k0(ZLandroid/widget/ImageView;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Ll/qo00;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->W(Ll/qo00;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic C(Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;Z)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic D(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->Y(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->T(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Lcom/p1/mobile/putong/data/FollowshipStatus;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->R(Lcom/p1/mobile/putong/data/FollowshipStatus;)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;ZLjava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p3}, Ll/i4h;->g(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 5
    .line 6
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->k0(ZLandroid/widget/ImageView;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->b3:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic c(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->N(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->L(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->P(Landroid/view/View;)V

    return-void
.end method

.method public static h0(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;Z)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 2
    .line 3
    xor-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->k0(ZLandroid/widget/ImageView;Z)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v2, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    iget-boolean v3, p0, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 15
    .line 16
    xor-int/lit8 v3, v3, 0x1

    .line 17
    .line 18
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/feed/api/b;->R3(Ljava/lang/String;Ljava/lang/String;Z)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/gr00;

    .line 23
    .line 24
    invoke-direct {v1}, Ll/gr00;-><init>()V

    .line 25
    .line 26
    .line 27
    new-instance v2, Ll/hr00;

    .line 28
    .line 29
    invoke-direct {v2, p0, p1, p2}, Ll/hr00;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;Z)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->V(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->Q(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Lcom/p1/mobile/putong/data/PartialIdList;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->d0(Lcom/p1/mobile/putong/data/PartialIdList;ILandroid/view/View;)V

    return-void
.end method

.method public static k0(ZLandroid/widget/ImageView;Z)V
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

.method public static synthetic l(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;ILandroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    const/4 p3, 0x1

    .line 4
    invoke-static {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;->Z1(Landroid/content/Context;Ljava/lang/String;IZ)Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    new-instance p2, Ll/jx00;

    .line 9
    .line 10
    invoke-direct {p2}, Ll/jx00;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/android/app/Act;->startActivityWithCustomTransition(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Lcom/p1/mobile/putong/data/PartialIdList;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->c0(Lcom/p1/mobile/putong/data/PartialIdList;ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Lcom/p1/mobile/putong/feed/data/Moment;Ll/qo00;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->a0(Lcom/p1/mobile/putong/feed/data/Moment;Ll/qo00;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->Z(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->f0(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Lcom/p1/mobile/putong/feed/data/Moment;Ll/qo00;Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->b0(Lcom/p1/mobile/putong/feed/data/Moment;Ll/qo00;Landroid/view/ViewGroup;)V

    return-void
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->O(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->X(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->K(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->M(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;ILcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->e0(ILcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic x(Lcom/p1/mobile/putong/data/Followship;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->U(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->S(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final H(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ft00;->a(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public I()Lcom/p1/mobile/putong/app/PutongAct;
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

.method public final J(Lcom/p1/mobile/putong/data/FollowshipStatus;)V
    .locals 8

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v7, "p_nearby"

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    const-string v0, "following"

    .line 10
    .line 11
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const-string v0, "matched"

    .line 18
    .line 19
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I()Lcom/p1/mobile/putong/app/PutongAct;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->z:I

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/ir00;

    .line 40
    .line 41
    invoke-direct {v1, p0, v7}, Ll/ir00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-static {p1, v0, v1}, Ll/k3h;->v0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->Q0:Lcom/p1/mobile/putong/data/User;

    .line 49
    .line 50
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 53
    .line 54
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/Moments;->hidePublicMoments:Z

    .line 55
    .line 56
    if-eqz v0, :cond_2

    .line 57
    .line 58
    invoke-static {p1}, Lcom/p1/mobile/putong/data/User;->isMatched(Lcom/p1/mobile/putong/data/User;)Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-nez p1, :cond_2

    .line 63
    .line 64
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->q:I

    .line 65
    .line 66
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_2
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 71
    .line 72
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->Q0:Lcom/p1/mobile/putong/data/User;

    .line 81
    .line 82
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->N0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 83
    .line 84
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 85
    .line 86
    const-string v0, ""

    .line 87
    .line 88
    if-eqz p1, :cond_3

    .line 89
    .line 90
    const-string v4, "liveMomentNearby"

    .line 91
    .line 92
    move-object v5, v4

    .line 93
    goto :goto_0

    .line 94
    :cond_3
    move-object v5, v0

    .line 95
    :goto_0
    if-eqz p1, :cond_4

    .line 96
    .line 97
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 98
    .line 99
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 100
    .line 101
    :cond_4
    move-object v6, v0

    .line 102
    const/4 v4, 0x1

    .line 103
    invoke-virtual/range {v1 .. v7}, Ll/jka;->n7(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    new-instance p1, Ll/jr00;

    .line 108
    .line 109
    invoke-direct {p1}, Ll/jr00;-><init>()V

    .line 110
    .line 111
    .line 112
    new-instance v0, Ll/kr00;

    .line 113
    .line 114
    invoke-direct {v0}, Ll/kr00;-><init>()V

    .line 115
    .line 116
    .line 117
    invoke-static {p1, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public final synthetic K(Ljava/lang/String;)V
    .locals 3

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->Q0:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v1, p0, v2, p1}, Ll/jka;->m7(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance p1, Ll/cs00;

    .line 19
    .line 20
    invoke-direct {p1}, Ll/cs00;-><init>()V

    .line 21
    .line 22
    .line 23
    new-instance v0, Ll/ds00;

    .line 24
    .line 25
    invoke-direct {v0}, Ll/ds00;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-static {p1, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic L(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/j4h;->c()Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    iget-boolean p3, p1, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 8
    .line 9
    if-eqz p3, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I()Lcom/p1/mobile/putong/app/PutongAct;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string p2, ""

    .line 16
    .line 17
    invoke-static {p0, p2, p1}, Ll/rtg;->c(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    const/4 p3, 0x1

    .line 25
    invoke-static {p2, p0, p1, p3}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedPreviewAct;->Z1(Landroid/content/Context;Ljava/lang/String;IZ)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    new-instance p1, Ll/jx00;

    .line 30
    .line 31
    invoke-direct {p1}, Ll/jx00;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p2, p0, p1}, Lcom/p1/mobile/android/app/Act;->startActivityWithCustomTransition(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final synthetic M(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, ""

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->N0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 8
    .line 9
    invoke-static {p1, v0, p0}, Ll/rtg;->c(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic N(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->M0:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->N0:Lcom/p1/mobile/putong/feed/data/Moment;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I()Lcom/p1/mobile/putong/app/PutongAct;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->M0:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->N0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 40
    .line 41
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->N(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    return-void
.end method

.method public final synthetic O(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->M0:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->N0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->z:Landroid/widget/ImageView;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->i0(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final synthetic P(Landroid/view/View;)V
    .locals 8

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->M0:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I()Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I()Lcom/p1/mobile/putong/app/PutongAct;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->N0:Lcom/p1/mobile/putong/feed/data/Moment;

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

.method public final synthetic Q(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->M0:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

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

.method public final synthetic R(Lcom/p1/mobile/putong/data/FollowshipStatus;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->J(Lcom/p1/mobile/putong/data/FollowshipStatus;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic S(Landroid/view/View;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->N0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    iget-object v1, v2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 8
    .line 9
    new-instance v4, Ll/is00;

    .line 10
    .line 11
    invoke-direct {v4, p0}, Ll/is00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;)V

    .line 12
    .line 13
    .line 14
    new-instance v5, Ll/js00;

    .line 15
    .line 16
    invoke-direct {v5, p0}, Ll/js00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;)V

    .line 17
    .line 18
    .line 19
    const/4 v7, 0x0

    .line 20
    const/4 v8, 0x1

    .line 21
    const/4 v3, 0x0

    .line 22
    const/4 v6, 0x0

    .line 23
    invoke-static/range {v0 .. v8}, Ll/k3h;->x0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;Ll/y20;Ll/y20;Ll/y20;ZZZ)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic T(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->N0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p1, p0}, Ll/w1e;->b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public final synthetic U(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->N0:Lcom/p1/mobile/putong/feed/data/Moment;

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

.method public final synthetic V(Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance v0, Ll/yr00;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/yr00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic W(Ll/qo00;Lcom/p1/mobile/putong/data/User;)V
    .locals 5

    .line 1
    iget-object v0, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->Q0:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->b:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->d:Lv/VText;

    .line 21
    .line 22
    iget-object v1, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 32
    .line 33
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->getGPMemo(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-nez v1, :cond_0

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->d:Lv/VText;

    .line 44
    .line 45
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->a()Ll/tq8;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-interface {v0}, Ll/tq8;->d()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_1

    .line 61
    .line 62
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_1

    .line 67
    .line 68
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->gpHideVip()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-nez v0, :cond_1

    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->d:Lv/VText;

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I()Lcom/p1/mobile/putong/app/PutongAct;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    sget v2, Ll/k9c0;->k0:I

    .line 81
    .line 82
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->d:Lv/VText;

    .line 91
    .line 92
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I()Lcom/p1/mobile/putong/app/PutongAct;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    sget v2, Ll/k9c0;->l0:I

    .line 97
    .line 98
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 103
    .line 104
    .line 105
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I()Lcom/p1/mobile/putong/app/PutongAct;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->f:Lv/VImage;

    .line 110
    .line 111
    const/4 v2, 0x1

    .line 112
    const/4 v3, 0x0

    .line 113
    invoke-static {v0, p2, v1, v2, v3}, Ll/orb0;->y(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Landroid/widget/ImageView;ZZ)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->s:Lv/VText;

    .line 117
    .line 118
    const/16 v1, 0x8

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 121
    .line 122
    .line 123
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 124
    .line 125
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 126
    .line 127
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I()Lcom/p1/mobile/putong/app/PutongAct;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->c:Lv/VImage;

    .line 132
    .line 133
    invoke-interface {v0, v1, p2, v4}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 134
    .line 135
    .line 136
    invoke-static {}, Ll/j4h;->c()Z

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    if-eqz v0, :cond_2

    .line 141
    .line 142
    iget-object v0, p1, Ll/qo00;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 143
    .line 144
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 145
    .line 146
    if-eqz v0, :cond_2

    .line 147
    .line 148
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->w:Landroid/widget/FrameLayout;

    .line 149
    .line 150
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 151
    .line 152
    .line 153
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->y:Landroid/widget/FrameLayout;

    .line 154
    .line 155
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 156
    .line 157
    .line 158
    goto :goto_5

    .line 159
    :cond_2
    iget-object p1, p1, Ll/qo00;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 160
    .line 161
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 162
    .line 163
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result p1

    .line 175
    iget-object v0, p2, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 176
    .line 177
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PicVerification;->anchor:Lcom/p1/mobile/putong/data/VerificationResult;

    .line 178
    .line 179
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/VerificationResult;->verified:Z

    .line 180
    .line 181
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->w:Landroid/widget/FrameLayout;

    .line 182
    .line 183
    invoke-static {p2}, Lcom/p1/mobile/putong/data/User;->isMatched(Lcom/p1/mobile/putong/data/User;)Z

    .line 184
    .line 185
    .line 186
    move-result v4

    .line 187
    if-nez v4, :cond_4

    .line 188
    .line 189
    if-eqz v0, :cond_3

    .line 190
    .line 191
    if-nez p1, :cond_3

    .line 192
    .line 193
    goto :goto_1

    .line 194
    :cond_3
    move v4, v3

    .line 195
    goto :goto_2

    .line 196
    :cond_4
    :goto_1
    move v4, v2

    .line 197
    :goto_2
    invoke-static {v1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 198
    .line 199
    .line 200
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->y:Landroid/widget/FrameLayout;

    .line 201
    .line 202
    invoke-static {p2}, Lcom/p1/mobile/putong/data/User;->isMatched(Lcom/p1/mobile/putong/data/User;)Z

    .line 203
    .line 204
    .line 205
    move-result v4

    .line 206
    if-nez v4, :cond_6

    .line 207
    .line 208
    if-nez p1, :cond_6

    .line 209
    .line 210
    if-eqz v0, :cond_5

    .line 211
    .line 212
    goto :goto_3

    .line 213
    :cond_5
    move p1, v3

    .line 214
    goto :goto_4

    .line 215
    :cond_6
    :goto_3
    move p1, v2

    .line 216
    :goto_4
    invoke-static {v1, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 217
    .line 218
    .line 219
    :goto_5
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 220
    .line 221
    iget-object p1, p1, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 222
    .line 223
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->Q0:Lcom/p1/mobile/putong/data/User;

    .line 224
    .line 225
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 226
    .line 227
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->isCurrentMessageBlock(Ljava/lang/String;)Z

    .line 228
    .line 229
    .line 230
    move-result p1

    .line 231
    if-eqz p1, :cond_7

    .line 232
    .line 233
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->w:Landroid/widget/FrameLayout;

    .line 234
    .line 235
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 236
    .line 237
    .line 238
    :cond_7
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 239
    .line 240
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 241
    .line 242
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 243
    .line 244
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Interest;->emoji:Ljava/util/List;

    .line 245
    .line 246
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 247
    .line 248
    .line 249
    move-result p1

    .line 250
    if-nez p1, :cond_8

    .line 251
    .line 252
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->e:Lv/VDraweeView;

    .line 253
    .line 254
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 255
    .line 256
    .line 257
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 258
    .line 259
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->e:Lv/VDraweeView;

    .line 260
    .line 261
    new-instance v0, Ljava/lang/StringBuilder;

    .line 262
    .line 263
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 264
    .line 265
    .line 266
    sget-object v1, Ll/uqb0;->X:Ll/hj5;

    .line 267
    .line 268
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 269
    .line 270
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 271
    .line 272
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 273
    .line 274
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Interest;->emoji:Ljava/util/List;

    .line 275
    .line 276
    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 277
    .line 278
    .line 279
    move-result-object p2

    .line 280
    check-cast p2, Ljava/lang/String;

    .line 281
    .line 282
    invoke-virtual {v1, p2}, Ll/hj5;->n(Ljava/lang/String;)Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object p2

    .line 286
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 287
    .line 288
    .line 289
    const-string p2, ".png"

    .line 290
    .line 291
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 292
    .line 293
    .line 294
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 295
    .line 296
    .line 297
    move-result-object p2

    .line 298
    invoke-virtual {p1, p0, p2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 299
    .line 300
    .line 301
    :cond_8
    return-void
.end method

.method public final synthetic X(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I()Lcom/p1/mobile/putong/app/PutongAct;

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

.method public final synthetic Y(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I()Lcom/p1/mobile/putong/app/PutongAct;

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

.method public final synthetic Z(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->l0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic a0(Lcom/p1/mobile/putong/feed/data/Moment;Ll/qo00;Landroid/view/View;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v3, p2, Ll/qo00;->c:I

    .line 6
    .line 7
    new-instance v5, Ll/rmo;

    .line 8
    .line 9
    invoke-direct {v5}, Ll/rmo;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v1, "from_intl_moments"

    .line 13
    .line 14
    const/4 v4, 0x0

    .line 15
    move-object v2, p1

    .line 16
    invoke-static/range {v0 .. v5}, Ll/rtg;->e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/Moment;IZLl/n570;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic b0(Lcom/p1/mobile/putong/feed/data/Moment;Ll/qo00;Landroid/view/ViewGroup;)V
    .locals 1

    .line 1
    new-instance v0, Ll/es00;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/es00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Lcom/p1/mobile/putong/feed/data/Moment;Ll/qo00;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p3, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic c0(Lcom/p1/mobile/putong/data/PartialIdList;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I()Lcom/p1/mobile/putong/app/PutongAct;

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

.method public final synthetic d0(Lcom/p1/mobile/putong/data/PartialIdList;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I()Lcom/p1/mobile/putong/app/PutongAct;

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

.method public final synthetic e0(ILcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->O0:Ljava/util/ArrayList;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I()Lcom/p1/mobile/putong/app/PutongAct;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->P0:Ljava/util/ArrayList;

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

.method public final synthetic f0(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    if-nez p4, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->M0:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->M0:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

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

.method public g0(Lcom/p1/mobile/android/app/Act;Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 20

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    move-object/from16 v2, p3

    .line 6
    .line 7
    iget-object v3, v2, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {}, Ll/j4h;->c()Z

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    const/4 v4, 0x0

    .line 14
    if-eqz v3, :cond_2

    .line 15
    .line 16
    iget-boolean v3, v2, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 17
    .line 18
    if-eqz v3, :cond_2

    .line 19
    .line 20
    iget-object v3, v2, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 21
    .line 22
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Live;->snapshot:Lcom/p1/mobile/putong/data/Media;

    .line 23
    .line 24
    if-nez v3, :cond_1

    .line 25
    .line 26
    iget-object v3, v2, Lcom/p1/mobile/putong/feed/data/Moment;->liveRoom:Lcom/p1/mobile/putong/data/Room;

    .line 27
    .line 28
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-eqz v3, :cond_0

    .line 33
    .line 34
    iget-object v3, v2, Lcom/p1/mobile/putong/feed/data/Moment;->liveRoom:Lcom/p1/mobile/putong/data/Room;

    .line 35
    .line 36
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Room;->cover:Lcom/p1/mobile/putong/data/RoomCover;

    .line 37
    .line 38
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-eqz v3, :cond_0

    .line 43
    .line 44
    iget-object v3, v2, Lcom/p1/mobile/putong/feed/data/Moment;->liveRoom:Lcom/p1/mobile/putong/data/Room;

    .line 45
    .line 46
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Room;->cover:Lcom/p1/mobile/putong/data/RoomCover;

    .line 47
    .line 48
    iget-object v3, v3, Lcom/p1/mobile/putong/data/RoomCover;->media:Lcom/p1/mobile/putong/data/Picture;

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    move-object v3, v4

    .line 52
    :cond_1
    :goto_0
    filled-new-array {v3}, [Lcom/p1/mobile/putong/data/Media;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-static {v3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    goto :goto_1

    .line 61
    :cond_2
    iget-object v3, v2, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 62
    .line 63
    :goto_1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 64
    .line 65
    .line 66
    move-result v5

    .line 67
    const/high16 v6, 0x42fa0000    # 125.0f

    .line 68
    .line 69
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 70
    .line 71
    .line 72
    move-result v6

    .line 73
    sub-int/2addr v5, v6

    .line 74
    const/high16 v6, 0x40800000    # 4.0f

    .line 75
    .line 76
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 77
    .line 78
    .line 79
    move-result v7

    .line 80
    mul-int/lit8 v7, v7, 0x2

    .line 81
    .line 82
    sub-int v7, v5, v7

    .line 83
    .line 84
    div-int/lit8 v7, v7, 0x3

    .line 85
    .line 86
    const/4 v8, 0x0

    .line 87
    move v9, v8

    .line 88
    :goto_2
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 89
    .line 90
    .line 91
    move-result v10

    .line 92
    const/4 v11, 0x1

    .line 93
    sub-int/2addr v10, v11

    .line 94
    if-ge v9, v10, :cond_4

    .line 95
    .line 96
    invoke-virtual {v1, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v10

    .line 100
    invoke-static {v10, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 101
    .line 102
    .line 103
    instance-of v11, v10, Lv/VDraweeView;

    .line 104
    .line 105
    if-eqz v11, :cond_3

    .line 106
    .line 107
    move-object v11, v10

    .line 108
    goto :goto_3

    .line 109
    :cond_3
    sget v11, Ll/hdc0;->D:I

    .line 110
    .line 111
    invoke-virtual {v10, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 112
    .line 113
    .line 114
    move-result-object v11

    .line 115
    :goto_3
    check-cast v11, Lv/VDraweeView;

    .line 116
    .line 117
    sget-object v12, Ll/uqb0;->G:Ll/fsb0;

    .line 118
    .line 119
    invoke-virtual {v12, v11}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v11, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v10, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v11, v4}, Lv/VDraweeView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    add-int/lit8 v9, v9, 0x1

    .line 132
    .line 133
    goto :goto_2

    .line 134
    :cond_4
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 135
    .line 136
    .line 137
    move-result v9

    .line 138
    const-string v10, "moments"

    .line 139
    .line 140
    const-string v12, ""

    .line 141
    .line 142
    const-string v13, "raw"

    .line 143
    .line 144
    if-ne v9, v11, :cond_a

    .line 145
    .line 146
    invoke-interface {v3, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object v3

    .line 150
    check-cast v3, Lcom/p1/mobile/putong/data/Media;

    .line 151
    .line 152
    instance-of v6, v3, Lcom/p1/mobile/putong/data/Picture;

    .line 153
    .line 154
    if-eqz v6, :cond_5

    .line 155
    .line 156
    move-object v4, v3

    .line 157
    check-cast v4, Lcom/p1/mobile/putong/data/Picture;

    .line 158
    .line 159
    goto :goto_4

    .line 160
    :cond_5
    instance-of v6, v3, Lcom/p1/mobile/putong/data/Video;

    .line 161
    .line 162
    if-eqz v6, :cond_6

    .line 163
    .line 164
    move-object v4, v3

    .line 165
    check-cast v4, Lcom/p1/mobile/putong/data/Video;

    .line 166
    .line 167
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 168
    .line 169
    :cond_6
    :goto_4
    invoke-static {v4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    move-result v6

    .line 173
    if-eqz v6, :cond_f

    .line 174
    .line 175
    new-instance v6, Landroid/graphics/Point;

    .line 176
    .line 177
    iget-object v7, v4, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 178
    .line 179
    iget v9, v7, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 180
    .line 181
    iget v7, v7, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 182
    .line 183
    invoke-direct {v6, v9, v7}, Landroid/graphics/Point;-><init>(II)V

    .line 184
    .line 185
    .line 186
    invoke-static {v5, v6}, Ll/dmk0;->b(ILandroid/graphics/Point;)Landroid/graphics/Point;

    .line 187
    .line 188
    .line 189
    move-result-object v5

    .line 190
    instance-of v3, v3, Lcom/p1/mobile/putong/data/Video;

    .line 191
    .line 192
    if-eqz v3, :cond_7

    .line 193
    .line 194
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 195
    .line 196
    .line 197
    move-result v6

    .line 198
    add-int/lit8 v8, v6, -0x2

    .line 199
    .line 200
    :cond_7
    invoke-virtual {v1, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    invoke-static {v1, v11}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 205
    .line 206
    .line 207
    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    .line 208
    .line 209
    iget v7, v5, Landroid/graphics/Point;->x:I

    .line 210
    .line 211
    iget v8, v5, Landroid/graphics/Point;->y:I

    .line 212
    .line 213
    invoke-direct {v6, v7, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 214
    .line 215
    .line 216
    invoke-virtual {v1, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 217
    .line 218
    .line 219
    new-instance v6, Ll/zr00;

    .line 220
    .line 221
    move-object/from16 v7, p0

    .line 222
    .line 223
    invoke-direct {v6, v7, v2, v0}, Ll/zr00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/android/app/Act;)V

    .line 224
    .line 225
    .line 226
    invoke-virtual {v1, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 227
    .line 228
    .line 229
    instance-of v0, v1, Lv/VDraweeView;

    .line 230
    .line 231
    if-eqz v0, :cond_8

    .line 232
    .line 233
    goto :goto_5

    .line 234
    :cond_8
    sget v0, Ll/hdc0;->D:I

    .line 235
    .line 236
    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 237
    .line 238
    .line 239
    move-result-object v1

    .line 240
    :goto_5
    check-cast v1, Lv/VDraweeView;

    .line 241
    .line 242
    iget-object v0, v4, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 243
    .line 244
    invoke-static {v0, v13}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 245
    .line 246
    .line 247
    move-result v0

    .line 248
    if-nez v0, :cond_f

    .line 249
    .line 250
    iget-object v0, v4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 251
    .line 252
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 253
    .line 254
    .line 255
    move-result v0

    .line 256
    if-nez v0, :cond_f

    .line 257
    .line 258
    if-eqz v3, :cond_9

    .line 259
    .line 260
    move-object v10, v12

    .line 261
    :cond_9
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 262
    .line 263
    iget v2, v5, Landroid/graphics/Point;->x:I

    .line 264
    .line 265
    invoke-virtual {v4, v2}, Lcom/p1/mobile/putong/data/Picture;->calculatedWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 266
    .line 267
    .line 268
    move-result-object v2

    .line 269
    invoke-virtual {v0, v1, v2, v10}, Ll/fsb0;->R0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/lang/String;)V

    .line 270
    .line 271
    .line 272
    iget-object v0, v4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 273
    .line 274
    invoke-static {v0}, Lcom/p1/mobile/putong/data/Media;->URL_TO_CACHEKEY(Ljava/lang/String;)Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object v0

    .line 278
    invoke-virtual {v1, v0}, Lv/VDraweeView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 279
    .line 280
    .line 281
    return-void

    .line 282
    :cond_a
    move v4, v8

    .line 283
    :goto_6
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 284
    .line 285
    .line 286
    move-result v5

    .line 287
    if-ge v4, v5, :cond_f

    .line 288
    .line 289
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 290
    .line 291
    .line 292
    move-result-object v5

    .line 293
    check-cast v5, Lcom/p1/mobile/putong/data/Media;

    .line 294
    .line 295
    instance-of v9, v5, Lcom/p1/mobile/putong/data/Picture;

    .line 296
    .line 297
    if-eqz v9, :cond_b

    .line 298
    .line 299
    move-object v9, v5

    .line 300
    check-cast v9, Lcom/p1/mobile/putong/data/Picture;

    .line 301
    .line 302
    goto :goto_7

    .line 303
    :cond_b
    instance-of v9, v5, Lcom/p1/mobile/putong/data/Video;

    .line 304
    .line 305
    if-eqz v9, :cond_e

    .line 306
    .line 307
    move-object v9, v5

    .line 308
    check-cast v9, Lcom/p1/mobile/putong/data/Video;

    .line 309
    .line 310
    iget-object v9, v9, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 311
    .line 312
    :goto_7
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 313
    .line 314
    .line 315
    move-result-object v14

    .line 316
    check-cast v14, Lv/VDraweeView;

    .line 317
    .line 318
    invoke-static {v14, v11}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 319
    .line 320
    .line 321
    new-instance v15, Landroid/widget/FrameLayout$LayoutParams;

    .line 322
    .line 323
    invoke-direct {v15, v7, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 324
    .line 325
    .line 326
    invoke-virtual {v14, v15}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 327
    .line 328
    .line 329
    const/high16 v16, 0x41000000    # 8.0f

    .line 330
    .line 331
    packed-switch v4, :pswitch_data_0

    .line 332
    .line 333
    .line 334
    move/from16 v19, v6

    .line 335
    .line 336
    goto/16 :goto_8

    .line 337
    .line 338
    :pswitch_0
    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    .line 339
    .line 340
    .line 341
    move-result v17

    .line 342
    mul-int/lit8 v18, v7, 0x2

    .line 343
    .line 344
    move/from16 v19, v6

    .line 345
    .line 346
    add-int v6, v17, v18

    .line 347
    .line 348
    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    .line 349
    .line 350
    .line 351
    move-result v16

    .line 352
    add-int v11, v16, v18

    .line 353
    .line 354
    invoke-virtual {v15, v6, v11, v8, v8}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 355
    .line 356
    .line 357
    goto :goto_8

    .line 358
    :pswitch_1
    move/from16 v19, v6

    .line 359
    .line 360
    invoke-static/range {v19 .. v19}, Ll/qa00;->d(F)I

    .line 361
    .line 362
    .line 363
    move-result v6

    .line 364
    add-int/2addr v6, v7

    .line 365
    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    .line 366
    .line 367
    .line 368
    move-result v11

    .line 369
    mul-int/lit8 v16, v7, 0x2

    .line 370
    .line 371
    add-int v11, v11, v16

    .line 372
    .line 373
    invoke-virtual {v15, v6, v11, v8, v8}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 374
    .line 375
    .line 376
    goto :goto_8

    .line 377
    :pswitch_2
    move/from16 v19, v6

    .line 378
    .line 379
    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    .line 380
    .line 381
    .line 382
    move-result v6

    .line 383
    mul-int/lit8 v11, v7, 0x2

    .line 384
    .line 385
    add-int/2addr v6, v11

    .line 386
    invoke-virtual {v15, v8, v6, v8, v8}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 387
    .line 388
    .line 389
    goto :goto_8

    .line 390
    :pswitch_3
    move/from16 v19, v6

    .line 391
    .line 392
    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    .line 393
    .line 394
    .line 395
    move-result v6

    .line 396
    mul-int/lit8 v11, v7, 0x2

    .line 397
    .line 398
    add-int/2addr v6, v11

    .line 399
    invoke-static/range {v19 .. v19}, Ll/qa00;->d(F)I

    .line 400
    .line 401
    .line 402
    move-result v11

    .line 403
    add-int/2addr v11, v7

    .line 404
    invoke-virtual {v15, v6, v11, v8, v8}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 405
    .line 406
    .line 407
    goto :goto_8

    .line 408
    :pswitch_4
    move/from16 v19, v6

    .line 409
    .line 410
    invoke-static/range {v19 .. v19}, Ll/qa00;->d(F)I

    .line 411
    .line 412
    .line 413
    move-result v6

    .line 414
    add-int/2addr v6, v7

    .line 415
    invoke-static/range {v19 .. v19}, Ll/qa00;->d(F)I

    .line 416
    .line 417
    .line 418
    move-result v11

    .line 419
    add-int/2addr v11, v7

    .line 420
    invoke-virtual {v15, v6, v11, v8, v8}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 421
    .line 422
    .line 423
    goto :goto_8

    .line 424
    :pswitch_5
    move/from16 v19, v6

    .line 425
    .line 426
    invoke-static/range {v19 .. v19}, Ll/qa00;->d(F)I

    .line 427
    .line 428
    .line 429
    move-result v6

    .line 430
    add-int/2addr v6, v7

    .line 431
    invoke-virtual {v15, v8, v6, v8, v8}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 432
    .line 433
    .line 434
    goto :goto_8

    .line 435
    :pswitch_6
    move/from16 v19, v6

    .line 436
    .line 437
    invoke-static/range {v16 .. v16}, Ll/qa00;->d(F)I

    .line 438
    .line 439
    .line 440
    move-result v6

    .line 441
    mul-int/lit8 v11, v7, 0x2

    .line 442
    .line 443
    add-int/2addr v6, v11

    .line 444
    invoke-virtual {v15, v6, v8, v8, v8}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 445
    .line 446
    .line 447
    goto :goto_8

    .line 448
    :pswitch_7
    move/from16 v19, v6

    .line 449
    .line 450
    invoke-static/range {v19 .. v19}, Ll/qa00;->d(F)I

    .line 451
    .line 452
    .line 453
    move-result v6

    .line 454
    add-int/2addr v6, v7

    .line 455
    invoke-virtual {v15, v6, v8, v8, v8}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 456
    .line 457
    .line 458
    :goto_8
    iget-object v6, v9, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 459
    .line 460
    invoke-static {v6, v13}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 461
    .line 462
    .line 463
    move-result v6

    .line 464
    if-nez v6, :cond_d

    .line 465
    .line 466
    iget-object v6, v9, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 467
    .line 468
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 469
    .line 470
    .line 471
    move-result v6

    .line 472
    if-nez v6, :cond_d

    .line 473
    .line 474
    instance-of v5, v5, Lcom/p1/mobile/putong/data/Video;

    .line 475
    .line 476
    if-eqz v5, :cond_c

    .line 477
    .line 478
    move-object v5, v12

    .line 479
    goto :goto_9

    .line 480
    :cond_c
    move-object v5, v10

    .line 481
    :goto_9
    sget-object v6, Ll/uqb0;->G:Ll/fsb0;

    .line 482
    .line 483
    invoke-virtual {v9}, Lcom/p1/mobile/putong/data/Picture;->momentPictureSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 484
    .line 485
    .line 486
    move-result-object v11

    .line 487
    invoke-virtual {v6, v14, v11, v5}, Ll/fsb0;->R0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/lang/String;)V

    .line 488
    .line 489
    .line 490
    iget-object v5, v9, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 491
    .line 492
    invoke-static {v5}, Lcom/p1/mobile/putong/data/Media;->URL_TO_CACHEKEY(Ljava/lang/String;)Ljava/lang/String;

    .line 493
    .line 494
    .line 495
    move-result-object v5

    .line 496
    invoke-virtual {v14, v5}, Lv/VDraweeView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 497
    .line 498
    .line 499
    :cond_d
    new-instance v5, Ll/as00;

    .line 500
    .line 501
    invoke-direct {v5, v0, v2, v4}, Ll/as00;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;I)V

    .line 502
    .line 503
    .line 504
    invoke-virtual {v14, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 505
    .line 506
    .line 507
    goto :goto_a

    .line 508
    :cond_e
    move/from16 v19, v6

    .line 509
    .line 510
    :goto_a
    add-int/lit8 v4, v4, 0x1

    .line 511
    .line 512
    move/from16 v6, v19

    .line 513
    .line 514
    const/4 v11, 0x1

    .line 515
    goto/16 :goto_6

    .line 516
    .line 517
    :cond_f
    return-void

    .line 518
    nop

    .line 519
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final i0(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;Z)V
    .locals 2

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 2
    .line 3
    xor-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    invoke-static {v0, p2, p3}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->k0(ZLandroid/widget/ImageView;Z)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->M0:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->T(Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance v0, Ll/ks00;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/ks00;-><init>()V

    .line 17
    .line 18
    .line 19
    new-instance v1, Ll/ls00;

    .line 20
    .line 21
    invoke-direct {v1, p1, p2, p3}, Ll/ls00;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;Z)V

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

.method public j0(Ll/qo00;Ljava/util/HashMap;Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qo00;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;",
            ")V"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    .line 1
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->R0:Ll/qo00;

    move-object/from16 v4, p4

    .line 2
    iput-object v4, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->M0:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 3
    iget-object v4, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->b:Lv/VDraweeView;

    iget-object v5, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->d:Lv/VText;

    const/4 v6, 0x2

    new-array v7, v6, [Landroid/view/View;

    const/4 v8, 0x0

    aput-object v4, v7, v8

    const/4 v4, 0x1

    aput-object v5, v7, v4

    .line 4
    invoke-static {v7}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v5

    new-instance v7, Ll/lr00;

    invoke-direct {v7, v0}, Ll/lr00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;)V

    .line 5
    invoke-static {v5, v7}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 6
    iget-object v5, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->M0:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    iget-object v7, v1, Ll/qo00;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v7, v7, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    new-instance v9, Ll/nr00;

    invoke-direct {v9, v0, v1}, Ll/nr00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Ll/qo00;)V

    invoke-virtual {v5, v7, v9}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->P(Ljava/lang/String;Ll/y20;)V

    .line 7
    iget-object v5, v1, Ll/qo00;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 8
    iget-object v7, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->N0:Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {v7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    iget-object v7, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->N0:Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-virtual {v7, v5}, Lcom/p1/mobile/putong/feed/data/Moment;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 9
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    iget-object v7, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->N0:Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-virtual {v7}, Lcom/p1/mobile/putong/feed/data/Moment;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    move-result-object v7

    invoke-virtual {v5}, Lcom/p1/mobile/putong/feed/data/Moment;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    move-result-object v9

    invoke-static {v7, v9}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    move-result v7

    if-eqz v7, :cond_0

    return-void

    .line 10
    :cond_0
    iput-object v5, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->N0:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->m0()V

    .line 12
    iget-object v7, v5, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    invoke-static {v7}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    move-result v7

    .line 13
    iget-object v9, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->U:Landroid/widget/FrameLayout;

    const/4 v10, 0x0

    if-nez v7, :cond_1

    .line 14
    new-instance v7, Ll/or00;

    invoke-direct {v7, v0, v5}, Ll/or00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Lcom/p1/mobile/putong/feed/data/Moment;)V

    invoke-virtual {v9, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 15
    iget-object v7, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->k0:Landroid/widget/FrameLayout;

    new-instance v9, Ll/pr00;

    invoke-direct {v9, v0, v5}, Ll/pr00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Lcom/p1/mobile/putong/feed/data/Moment;)V

    invoke-virtual {v7, v9}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0

    .line 16
    :cond_1
    invoke-virtual {v9, v10}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 17
    iget-object v7, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->k0:Landroid/widget/FrameLayout;

    invoke-virtual {v7, v10}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 18
    :goto_0
    invoke-virtual {v5}, Lcom/p1/mobile/putong/feed/data/Moment;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    move-result-object v7

    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v7}, Ljava/lang/String;->hashCode()I

    move-result v9

    const-string v11, "normal"

    const/4 v12, -0x1

    sparse-switch v9, :sswitch_data_0

    :goto_1
    move v7, v12

    goto :goto_2

    :sswitch_0
    const-string v9, "sending"

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2

    goto :goto_1

    :cond_2
    move v7, v6

    goto :goto_2

    :sswitch_1
    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_3

    goto :goto_1

    :cond_3
    move v7, v4

    goto :goto_2

    :sswitch_2
    const-string v9, "failed"

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_4

    goto :goto_1

    :cond_4
    move v7, v8

    :goto_2
    packed-switch v7, :pswitch_data_0

    goto :goto_3

    .line 19
    :pswitch_0
    iget-object v7, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I0:Lv/VFrame_Anim;

    invoke-virtual {v7, v8}, Landroid/view/View;->setVisibility(I)V

    .line 20
    iget-object v7, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->J0:Lv/VFrame_Anim;

    iget-object v9, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->K0:Lv/VProgressBar;

    invoke-virtual {v7, v9}, Lv/VFrame_Anim;->G(Landroid/view/View;)V

    .line 21
    iget-object v7, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I0:Lv/VFrame_Anim;

    new-instance v9, Ll/sr00;

    invoke-direct {v9}, Ll/sr00;-><init>()V

    invoke-virtual {v7, v9}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_3

    .line 22
    :pswitch_1
    iget-object v7, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I0:Lv/VFrame_Anim;

    const/4 v9, 0x4

    invoke-virtual {v7, v9}, Landroid/view/View;->setVisibility(I)V

    .line 23
    iget-object v7, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I0:Lv/VFrame_Anim;

    invoke-virtual {v7, v10}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_3

    .line 24
    :pswitch_2
    iget-object v7, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I0:Lv/VFrame_Anim;

    invoke-virtual {v7, v8}, Landroid/view/View;->setVisibility(I)V

    .line 25
    iget-object v7, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->J0:Lv/VFrame_Anim;

    iget-object v9, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->L0:Landroid/widget/ImageView;

    invoke-virtual {v7, v9}, Lv/VFrame_Anim;->G(Landroid/view/View;)V

    .line 26
    iget-object v7, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I0:Lv/VFrame_Anim;

    new-instance v9, Ll/rr00;

    invoke-direct {v9, v0, v5}, Ll/rr00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Lcom/p1/mobile/putong/feed/data/Moment;)V

    invoke-virtual {v7, v9}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 27
    :goto_3
    iget-object v7, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->J0:Lv/VFrame_Anim;

    invoke-virtual {v5}, Lcom/p1/mobile/putong/feed/data/Moment;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    move-result-object v9

    invoke-static {v9, v11}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v9

    xor-int/2addr v9, v4

    invoke-static {v7, v9}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 28
    iget-object v7, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->g:Lv/VText;

    iget-wide v13, v5, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    invoke-static {v13, v14}, Ll/pzi0;->N(D)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    iget-object v7, v5, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 30
    iget-boolean v9, v5, Lcom/p1/mobile/putong/feed/data/Moment;->isVoiceLive:Z

    if-eqz v9, :cond_5

    .line 31
    iget-object v7, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->g:Lv/VText;

    invoke-static {v7, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    iget-object v7, v5, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    iget-object v7, v7, Lcom/p1/mobile/putong/feed/data/VoiceLive;->momentText:Ljava/lang/String;

    .line 33
    :cond_5
    iget-object v9, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->h:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 34
    iget-object v11, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v2, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    if-nez v11, :cond_6

    move v11, v8

    goto :goto_4

    :cond_6
    iget-object v11, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v2, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Boolean;

    invoke-virtual {v11}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v11

    .line 35
    :goto_4
    invoke-virtual {v9, v11}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->L(Z)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    move-result-object v9

    new-instance v11, Ll/tr00;

    invoke-direct {v11, v2, v5}, Ll/tr00;-><init>(Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 36
    invoke-virtual {v9, v11}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->Q(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$e;)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    move-result-object v2

    .line 37
    invoke-virtual {v2, v7}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->M(Ljava/lang/CharSequence;)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 38
    iget-object v2, v5, Lcom/p1/mobile/putong/feed/data/Moment;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    const/16 v7, 0x8

    if-eqz v2, :cond_7

    iget-object v2, v5, Lcom/p1/mobile/putong/feed/data/Moment;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_7

    .line 39
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->t:Lv/VText;

    invoke-virtual {v2, v8}, Landroid/view/View;->setVisibility(I)V

    .line 40
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->t:Lv/VText;

    iget-object v9, v5, Lcom/p1/mobile/putong/feed/data/Moment;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    iget-object v9, v9, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    invoke-virtual {v2, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_5

    .line 41
    :cond_7
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->t:Lv/VText;

    invoke-virtual {v2, v7}, Landroid/view/View;->setVisibility(I)V

    .line 42
    :goto_5
    invoke-static {}, Ll/j4h;->c()Z

    move-result v2

    if-eqz v2, :cond_c

    iget-boolean v2, v5, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    if-eqz v2, :cond_c

    .line 43
    iget-object v2, v5, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Live;->snapshot:Lcom/p1/mobile/putong/data/Media;

    if-nez v2, :cond_9

    .line 44
    iget-object v2, v5, Lcom/p1/mobile/putong/feed/data/Moment;->liveRoom:Lcom/p1/mobile/putong/data/Room;

    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    iget-object v2, v5, Lcom/p1/mobile/putong/feed/data/Moment;->liveRoom:Lcom/p1/mobile/putong/data/Room;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Room;->cover:Lcom/p1/mobile/putong/data/RoomCover;

    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 45
    iget-object v2, v5, Lcom/p1/mobile/putong/feed/data/Moment;->liveRoom:Lcom/p1/mobile/putong/data/Room;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/Room;->cover:Lcom/p1/mobile/putong/data/RoomCover;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/RoomCover;->media:Lcom/p1/mobile/putong/data/Picture;

    goto :goto_6

    :cond_8
    move-object v2, v10

    .line 46
    :cond_9
    :goto_6
    instance-of v9, v2, Lcom/p1/mobile/putong/data/Picture;

    if-nez v9, :cond_a

    move-object v2, v10

    :cond_a
    if-eqz v2, :cond_b

    :goto_7
    move v2, v4

    goto :goto_8

    :cond_b
    move v2, v8

    :goto_8
    move v9, v4

    goto :goto_9

    .line 47
    :cond_c
    iget-boolean v2, v5, Lcom/p1/mobile/putong/feed/data/Moment;->isVoiceLive:Z

    if-eqz v2, :cond_d

    move v2, v8

    move v9, v2

    goto :goto_9

    .line 48
    :cond_d
    iget-object v2, v5, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    if-eqz v2, :cond_b

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-eqz v2, :cond_b

    goto :goto_7

    .line 49
    :goto_9
    iget-object v11, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->j:Landroid/widget/FrameLayout;

    invoke-static {v11, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    iget-object v11, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->i:Landroid/widget/FrameLayout;

    invoke-static {v11, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    iget-object v11, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->v:Landroid/widget/LinearLayout;

    invoke-static {v11, v9}, Ll/bnl0;->M(Landroid/view/View;Z)V

    if-eqz v2, :cond_e

    .line 52
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I()Lcom/p1/mobile/putong/app/PutongAct;

    move-result-object v2

    iget-object v9, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->j:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v2, v9, v5}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->g0(Lcom/p1/mobile/android/app/Act;Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 53
    :cond_e
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->r:Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;

    invoke-static {v2, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    iget-boolean v2, v5, Lcom/p1/mobile/putong/feed/data/Moment;->isVoiceLive:Z

    if-eqz v2, :cond_10

    .line 55
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->r:Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;

    invoke-static {v2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 56
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->r:Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;

    invoke-virtual {v2, v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;->n(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 57
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->r:Lcom/p1/mobile/putong/feed/newui/photoalbum/livevoiceroom/FeedLiveVoiceRoomView;

    iget-object v9, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->h:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    new-array v11, v6, [Landroid/view/ViewGroup;

    aput-object v2, v11, v8

    aput-object v9, v11, v4

    .line 58
    invoke-static {v11}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v2

    new-instance v9, Ll/ur00;

    invoke-direct {v9, v0, v5, v1}, Ll/ur00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Lcom/p1/mobile/putong/feed/data/Moment;Ll/qo00;)V

    .line 59
    invoke-static {v2, v9}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 60
    new-instance v2, Ll/pf60;

    iget-object v9, v5, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    iget-object v9, v9, Lcom/p1/mobile/putong/feed/data/VoiceLive;->anchor:Lcom/p1/mobile/putong/data/Owner;

    iget-object v9, v9, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    const-string v11, "anchorId"

    invoke-direct {v2, v11, v9}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v9, Ll/pf60;

    iget-object v11, v5, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    iget-object v11, v11, Lcom/p1/mobile/putong/feed/data/VoiceLive;->id:Ljava/lang/String;

    const-string v13, "liveId"

    invoke-direct {v9, v13, v11}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v11, Ll/pf60;

    iget-object v13, v5, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    iget-object v13, v13, Lcom/p1/mobile/putong/feed/data/VoiceLive;->voiceRoomInfo:Lcom/p1/mobile/putong/data/VoiceRoomInfo;

    iget-object v13, v13, Lcom/p1/mobile/putong/data/VoiceRoomInfo;->topics:Ljava/util/List;

    .line 61
    invoke-interface {v13, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/p1/mobile/putong/data/VoiceRoomInfoTopic;

    iget-object v13, v13, Lcom/p1/mobile/putong/data/VoiceRoomInfoTopic;->id:Ljava/lang/String;

    const-string v14, "topic_id"

    invoke-direct {v11, v14, v13}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v13, Ll/pf60;

    iget v14, v1, Ll/qo00;->c:I

    .line 62
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const-string v15, "index"

    invoke-direct {v13, v15, v14}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v14, Ll/pf60;

    .line 63
    iget-object v15, v5, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    iget-object v15, v15, Lcom/p1/mobile/putong/feed/data/VoiceLive;->voiceRoomInfo:Lcom/p1/mobile/putong/data/VoiceRoomInfo;

    iget-boolean v15, v15, Lcom/p1/mobile/putong/data/VoiceRoomInfo;->maskMode:Z

    if-eqz v15, :cond_f

    const-string v15, "mask_audio"

    :goto_a
    move/from16 p4, v6

    goto :goto_b

    :cond_f
    const-string v15, "normal_audio"

    goto :goto_a

    :goto_b
    const-string v6, "audio_room_type"

    invoke-direct {v14, v6, v15}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    filled-new-array {v2, v9, v11, v13, v14}, [Ll/pf60;

    move-result-object v2

    .line 64
    const-string v6, "e_live_audio_room_enter"

    const-string v9, "p_follow"

    invoke-static {v6, v9, v2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    goto :goto_c

    :cond_10
    move/from16 p4, v6

    .line 65
    :goto_c
    iget-object v2, v5, Lcom/p1/mobile/putong/feed/data/Moment;->dynamicType:Lcom/p1/mobile/putong/data/DyMomentSource;

    const-string v6, "liked"

    invoke-static {v2, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_18

    iget-object v2, v5, Lcom/p1/mobile/putong/feed/data/Moment;->dynamicType:Lcom/p1/mobile/putong/data/DyMomentSource;

    const-string v9, "superLike"

    .line 66
    invoke-static {v2, v9}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_11

    goto/16 :goto_12

    .line 67
    :cond_11
    iget-object v2, v5, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object v6

    invoke-interface {v6}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 68
    iget-object v6, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->Q0:Lcom/p1/mobile/putong/data/User;

    if-eqz v6, :cond_12

    iget-object v9, v6, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    iget-object v9, v9, Lcom/p1/mobile/putong/data/PicVerification;->anchor:Lcom/p1/mobile/putong/data/VerificationResult;

    iget-boolean v9, v9, Lcom/p1/mobile/putong/data/VerificationResult;->verified:Z

    if-eqz v9, :cond_12

    move v9, v4

    goto :goto_d

    :cond_12
    move v9, v8

    .line 69
    :goto_d
    iget-object v11, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->w:Landroid/widget/FrameLayout;

    invoke-static {v6}, Lcom/p1/mobile/putong/data/User;->isMatched(Lcom/p1/mobile/putong/data/User;)Z

    move-result v6

    if-nez v6, :cond_14

    if-eqz v9, :cond_13

    if-nez v2, :cond_13

    goto :goto_e

    :cond_13
    move v6, v8

    goto :goto_f

    :cond_14
    :goto_e
    move v6, v4

    :goto_f
    invoke-static {v11, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 70
    iget-object v6, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->y:Landroid/widget/FrameLayout;

    iget-object v11, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->Q0:Lcom/p1/mobile/putong/data/User;

    invoke-static {v11}, Lcom/p1/mobile/putong/data/User;->isMatched(Lcom/p1/mobile/putong/data/User;)Z

    move-result v11

    if-nez v11, :cond_16

    if-nez v9, :cond_16

    if-eqz v2, :cond_15

    goto :goto_10

    :cond_15
    move v2, v8

    goto :goto_11

    :cond_16
    :goto_10
    move v2, v4

    :goto_11
    invoke-static {v6, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 71
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->Q0:Lcom/p1/mobile/putong/data/User;

    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_17

    sget-object v2, Ll/uqb0;->b0:Ll/sre0;

    iget-object v2, v2, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    iget-object v6, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->Q0:Lcom/p1/mobile/putong/data/User;

    iget-object v6, v6, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 72
    invoke-interface {v2, v6}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->isCurrentMessageBlock(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_17

    .line 73
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->w:Landroid/widget/FrameLayout;

    invoke-static {v2, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 74
    :cond_17
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->m:Lv/VDraweeView;

    invoke-static {v2, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 75
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->A:Landroid/widget/FrameLayout;

    invoke-static {v2, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    goto/16 :goto_15

    .line 76
    :cond_18
    :goto_12
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->j:Landroid/widget/FrameLayout;

    invoke-virtual {v2, v8}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 77
    iget v9, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-ne v9, v12, :cond_19

    .line 78
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->j:Landroid/widget/FrameLayout;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v9

    add-int/lit8 v9, v9, -0x2

    invoke-virtual {v2, v9}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 79
    :cond_19
    iget-object v9, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->m:Lv/VDraweeView;

    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    .line 80
    iget v11, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v11, v9, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 81
    iget v2, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    int-to-double v11, v2

    const-wide v13, 0x4003333333333333L    # 2.4

    div-double/2addr v11, v13

    double-to-int v2, v11

    iput v2, v9, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 82
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->m:Lv/VDraweeView;

    invoke-virtual {v2, v9}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 83
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    iget-object v11, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->m:Lv/VDraweeView;

    .line 84
    iget-object v12, v5, Lcom/p1/mobile/putong/feed/data/Moment;->dynamicType:Lcom/p1/mobile/putong/data/DyMomentSource;

    invoke-static {v12, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_1a

    .line 85
    const-string v12, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IkFKNlJFSlRKUlNKQTdDTkFRV0RaS0dSVlZDWENVQzE0IiwidyI6NzA1LCJoIjoyOTQsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo1NzkwNzI0MjM1NTEzMDgwMzJ9.webp"

    goto :goto_13

    .line 86
    :cond_1a
    const-string v12, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IktFRVc3TEFQTUtEWkJPQVIyUDM1NUxOM01LQVlMWTE0IiwidyI6NzA1LCJoIjoyOTQsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjoxNzI1NzUyODY4NTcyNzY0OTMwfQ.webp"

    :goto_13
    iget v13, v9, Landroid/view/ViewGroup$LayoutParams;->width:I

    iget v9, v9, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 87
    invoke-virtual {v2, v11, v12, v13, v9}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 88
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->m:Lv/VDraweeView;

    invoke-static {v2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 89
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->w:Landroid/widget/FrameLayout;

    invoke-static {v2, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 90
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->y:Landroid/widget/FrameLayout;

    invoke-static {v2, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 91
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->A:Landroid/widget/FrameLayout;

    invoke-static {v2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 92
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->h:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 93
    iget-object v9, v5, Lcom/p1/mobile/putong/feed/data/Moment;->dynamicType:Lcom/p1/mobile/putong/data/DyMomentSource;

    invoke-static {v9, v6}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1b

    .line 94
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I()Lcom/p1/mobile/putong/app/PutongAct;

    move-result-object v6

    iget-object v9, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-static {v6, v9}, Ll/q8g0;->w(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto :goto_14

    .line 95
    :cond_1b
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I()Lcom/p1/mobile/putong/app/PutongAct;

    move-result-object v6

    iget-object v9, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-static {v6, v9}, Ll/q8g0;->x(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 96
    :goto_14
    invoke-virtual {v2, v6}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->M(Ljava/lang/CharSequence;)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 97
    :goto_15
    invoke-static {}, Ll/j4h;->c()Z

    move-result v2

    if-eqz v2, :cond_1c

    iget-boolean v2, v5, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    if-eqz v2, :cond_1c

    .line 98
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->n:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-static {v2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 99
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->C:Lv/VText;

    invoke-static {v2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 100
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->w:Landroid/widget/FrameLayout;

    invoke-static {v2, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 101
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->y:Landroid/widget/FrameLayout;

    invoke-static {v2, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 102
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->g:Lv/VText;

    invoke-static {v2, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 103
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->C:Lv/VText;

    iget-object v6, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->S0:Landroid/view/View$OnClickListener;

    invoke-static {v2, v6}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 104
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->h:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    iget-object v6, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->S0:Landroid/view/View$OnClickListener;

    invoke-static {v2, v6}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    goto/16 :goto_1b

    .line 105
    :cond_1c
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->n:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-static {v2, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 106
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->C:Lv/VText;

    invoke-static {v2, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 107
    iget-object v2, v5, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object v6

    invoke-interface {v6}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 108
    iget-object v6, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->Q0:Lcom/p1/mobile/putong/data/User;

    if-eqz v6, :cond_1d

    iget-object v9, v6, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    iget-object v9, v9, Lcom/p1/mobile/putong/data/PicVerification;->anchor:Lcom/p1/mobile/putong/data/VerificationResult;

    iget-boolean v9, v9, Lcom/p1/mobile/putong/data/VerificationResult;->verified:Z

    if-eqz v9, :cond_1d

    move v9, v4

    goto :goto_16

    :cond_1d
    move v9, v8

    .line 109
    :goto_16
    iget-object v11, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->w:Landroid/widget/FrameLayout;

    invoke-static {v6}, Lcom/p1/mobile/putong/data/User;->isMatched(Lcom/p1/mobile/putong/data/User;)Z

    move-result v6

    if-nez v6, :cond_1f

    if-eqz v9, :cond_1e

    if-nez v2, :cond_1e

    goto :goto_17

    :cond_1e
    move v6, v8

    goto :goto_18

    :cond_1f
    :goto_17
    move v6, v4

    :goto_18
    invoke-static {v11, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 110
    iget-object v6, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->y:Landroid/widget/FrameLayout;

    iget-object v11, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->Q0:Lcom/p1/mobile/putong/data/User;

    invoke-static {v11}, Lcom/p1/mobile/putong/data/User;->isMatched(Lcom/p1/mobile/putong/data/User;)Z

    move-result v11

    if-nez v11, :cond_21

    if-nez v9, :cond_21

    if-eqz v2, :cond_20

    goto :goto_19

    :cond_20
    move v2, v8

    goto :goto_1a

    :cond_21
    :goto_19
    move v2, v4

    :goto_1a
    invoke-static {v6, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 111
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->Q0:Lcom/p1/mobile/putong/data/User;

    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_22

    sget-object v2, Ll/uqb0;->b0:Ll/sre0;

    iget-object v2, v2, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    iget-object v6, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->Q0:Lcom/p1/mobile/putong/data/User;

    iget-object v6, v6, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 112
    invoke-interface {v2, v6}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->isCurrentMessageBlock(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_22

    .line 113
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->w:Landroid/widget/FrameLayout;

    invoke-static {v2, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 114
    :cond_22
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->h:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    invoke-virtual {v2, v10}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 115
    :goto_1b
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->z:Landroid/widget/ImageView;

    .line 116
    iget-boolean v6, v5, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    if-eqz v6, :cond_23

    .line 117
    sget v6, Ll/lbc0;->d2:I

    goto :goto_1c

    .line 118
    :cond_23
    sget v6, Ll/lbc0;->o6:I

    .line 119
    :goto_1c
    invoke-virtual {v2, v6}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 120
    iget-object v2, v5, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    iget v6, v2, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    iget-object v2, v2, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v6, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 121
    iget-object v6, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->V:Lv/VText;

    invoke-static {v2}, Ll/q8g0;->h0(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 122
    iget-object v6, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->F:Landroid/view/View;

    if-eqz v2, :cond_24

    move v9, v4

    goto :goto_1d

    :cond_24
    move v9, v8

    :goto_1d
    invoke-static {v6, v9}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 123
    iget-object v6, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->U:Landroid/widget/FrameLayout;

    sget v9, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->T0:I

    if-le v2, v9, :cond_25

    move v11, v4

    goto :goto_1e

    :cond_25
    move v11, v8

    :goto_1e
    invoke-static {v6, v11}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 124
    :goto_1f
    iget-object v6, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->O0:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v9, v6, :cond_26

    .line 125
    iget-object v6, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->O0:Ljava/util/ArrayList;

    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lv/VDraweeView;

    invoke-virtual {v6, v7}, Landroid/view/View;->setVisibility(I)V

    .line 126
    iget-object v6, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->P0:Ljava/util/ArrayList;

    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lv/VImage;

    invoke-virtual {v6, v7}, Landroid/view/View;->setVisibility(I)V

    add-int/lit8 v9, v9, 0x1

    goto :goto_1f

    .line 127
    :cond_26
    iget-object v6, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v3, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_27

    iget-object v6, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 128
    invoke-virtual {v3, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-nez v6, :cond_27

    if-eqz v2, :cond_27

    .line 129
    iget-object v6, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->G:Landroid/widget/FrameLayout;

    invoke-virtual {v6, v8}, Landroid/view/View;->setVisibility(I)V

    goto :goto_20

    .line 130
    :cond_27
    iget-object v6, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-virtual {v3, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_28

    iget-object v6, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 131
    invoke-virtual {v3, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-eqz v6, :cond_28

    if-nez v2, :cond_28

    .line 132
    iget-object v6, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->G:Landroid/widget/FrameLayout;

    invoke-virtual {v6, v7}, Landroid/view/View;->setVisibility(I)V

    goto :goto_20

    .line 133
    :cond_28
    iget-object v6, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->G:Landroid/widget/FrameLayout;

    if-eqz v2, :cond_29

    .line 134
    invoke-virtual {v6, v8}, Landroid/view/View;->setVisibility(I)V

    .line 135
    iget-object v6, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->G:Landroid/widget/FrameLayout;

    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    const/high16 v9, 0x42400000    # 48.0f

    invoke-static {v9}, Ll/qa00;->d(F)I

    move-result v9

    iput v9, v6, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 136
    iget-object v6, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->G:Landroid/widget/FrameLayout;

    invoke-virtual {v6}, Landroid/view/View;->requestLayout()V

    goto :goto_20

    .line 137
    :cond_29
    invoke-virtual {v6, v7}, Landroid/view/View;->setVisibility(I)V

    .line 138
    :goto_20
    iget-object v6, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v3, v6, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    iget-object v2, v5, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    invoke-static {v2}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    move-result v2

    .line 140
    iget-object v3, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->k0:Landroid/widget/FrameLayout;

    if-eqz v2, :cond_2a

    .line 141
    invoke-static {v3, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    goto :goto_22

    .line 142
    :cond_2a
    iget v2, v1, Ll/qo00;->g:I

    const/16 v6, 0x64

    if-le v2, v6, :cond_2b

    move v2, v4

    goto :goto_21

    :cond_2b
    move v2, v8

    :goto_21
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 143
    :goto_22
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->W:Landroid/view/View;

    iget v3, v1, Ll/qo00;->f:I

    if-eqz v3, :cond_2c

    move v3, v4

    goto :goto_23

    :cond_2c
    move v3, v8

    :goto_23
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 144
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->p0:Lv/VText;

    .line 145
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I()Lcom/p1/mobile/putong/app/PutongAct;

    move-result-object v3

    sget v6, Lcom/p1/mobile/putong/feed/R$string;->P3:I

    iget v1, v1, Ll/qo00;->g:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v3, v6, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 146
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    move v1, v8

    .line 147
    :goto_24
    sget v2, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->T0:I

    if-ge v1, v2, :cond_2f

    .line 148
    iget-object v2, v5, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 149
    iget-object v3, v2, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    .line 150
    iget-object v6, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->O0:Ljava/util/ArrayList;

    if-gt v3, v1, :cond_2d

    .line 151
    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lv/VDraweeView;

    invoke-virtual {v2, v10}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 152
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->P0:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lv/VImage;

    invoke-virtual {v2, v10}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 153
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->O0:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-static {v2, v8}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 154
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->P0:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-static {v2, v8}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    goto :goto_26

    .line 155
    :cond_2d
    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    invoke-static {v3, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 156
    iget-object v3, v5, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    invoke-static {v3}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    move-result v3

    .line 157
    iget-object v6, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->O0:Ljava/util/ArrayList;

    if-nez v3, :cond_2e

    .line 158
    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lv/VDraweeView;

    new-instance v6, Ll/vr00;

    invoke-direct {v6, v0, v2, v1}, Ll/vr00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Lcom/p1/mobile/putong/data/PartialIdList;I)V

    .line 159
    invoke-virtual {v3, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 160
    iget-object v3, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->P0:Ljava/util/ArrayList;

    .line 161
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lv/VImage;

    new-instance v6, Ll/wr00;

    invoke-direct {v6, v0, v2, v1}, Ll/wr00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Lcom/p1/mobile/putong/data/PartialIdList;I)V

    .line 162
    invoke-virtual {v3, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_25

    .line 163
    :cond_2e
    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lv/VDraweeView;

    invoke-virtual {v3, v10}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 164
    iget-object v3, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->P0:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lv/VImage;

    invoke-virtual {v3, v10}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 165
    :goto_25
    iget-object v3, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->M0:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    iget-object v2, v2, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 166
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    new-instance v6, Ll/mr00;

    invoke-direct {v6, v0, v1}, Ll/mr00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;I)V

    .line 167
    invoke-virtual {v3, v2, v6}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->P(Ljava/lang/String;Ll/y20;)V

    :goto_26
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_24

    .line 168
    :cond_2f
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->u:Lv/VText;

    invoke-virtual {v0, v7}, Landroid/view/View;->setVisibility(I)V

    return-void

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

.method public final l0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;)V
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
    new-instance v0, Ll/xr00;

    .line 26
    .line 27
    invoke-direct {v0, p0, p2}, Ll/xr00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;Lcom/p1/mobile/putong/feed/data/Moment;)V

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

.method public final m0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->g:Lv/VText;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public n0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->F0:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final o0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->q:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->q:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 10
    .line 11
    new-instance v1, Lcom/p1/mobile/putong/feed/ui/moments/MomentView$a;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView$a;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    const-string v2, "feed_live_room_icon.svga"

    .line 18
    .line 19
    const/4 v3, -0x1

    .line 20
    invoke-virtual {v0, v2, v3, v1, p0}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;->loadAnimWithListener(Ljava/lang/String;ILcom/tantanapp/media/ttmediaeffect/anim/AnimListener;Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/j4h;->c()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->R0:Ll/qo00;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->R0:Ll/qo00;

    .line 19
    .line 20
    iget-object v0, v0, Ll/qo00;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 21
    .line 22
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->o0()V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 8

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->H(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->w:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    new-instance v1, Ll/qr00;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/qr00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->y:Landroid/widget/FrameLayout;

    .line 18
    .line 19
    new-instance v1, Ll/bs00;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/bs00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->A:Landroid/widget/FrameLayout;

    .line 28
    .line 29
    new-instance v1, Ll/fs00;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/fs00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->E:Landroid/widget/ImageView;

    .line 38
    .line 39
    new-instance v1, Ll/gs00;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/gs00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 45
    .line 46
    .line 47
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->I:Lv/VDraweeView;

    .line 48
    .line 49
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->K:Lv/VDraweeView;

    .line 50
    .line 51
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->M:Lv/VDraweeView;

    .line 52
    .line 53
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->O:Lv/VDraweeView;

    .line 54
    .line 55
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->Q:Lv/VDraweeView;

    .line 56
    .line 57
    iget-object v7, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->S:Lv/VDraweeView;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->O0:Ljava/util/ArrayList;

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->J:Lv/VImage;

    .line 70
    .line 71
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->L:Lv/VImage;

    .line 72
    .line 73
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->N:Lv/VImage;

    .line 74
    .line 75
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->P:Lv/VImage;

    .line 76
    .line 77
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->R:Lv/VImage;

    .line 78
    .line 79
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->T:Lv/VImage;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->P0:Ljava/util/ArrayList;

    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->h:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 92
    .line 93
    new-instance v1, Ll/hs00;

    .line 94
    .line 95
    invoke-direct {v1, p0}, Ll/hs00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentView;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method
