.class public Ll/nk00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/hj00;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Ll/hj00;

.field public B:Ll/hi00;

.field public C:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

.field public D:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

.field public E:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field public F:Lcom/p1/mobile/android/app/Act;

.field public G:Z

.field public H:I

.field public I:Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;

.field public J:Ljava/lang/String;

.field public K:Ll/dj70;

.field public L:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public M:Z

.field public N:Z

.field public O:Z

.field public P:Ljava/lang/Runnable;

.field public Q:Z

.field public R:Landroid/animation/ValueAnimator;

.field public S:Landroid/view/View;

.field public T:Z

.field public U:Z

.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Landroid/view/View;

.field public c:Landroid/widget/FrameLayout;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;

.field public f:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

.field public g:Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

.field public h:Landroid/view/View;

.field public i:Landroid/widget/FrameLayout;

.field public j:Landroid/view/View;

.field public k:Landroid/widget/LinearLayout;

.field public l:Landroid/widget/LinearLayout;

.field public m:Landroid/view/View;

.field public n:Lv/VLinear;

.field public o:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

.field public q:Lv/VImage;

.field public r:Landroid/widget/TextView;

.field public s:Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;

.field public t:Lv/VLinear;

.field public u:Lv/VImage;

.field public v:Lv/VText;

.field public w:Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;

.field public x:Landroid/view/View;

.field public y:Lv/VLinear;

.field public z:Lv/VImage;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/nk00;->G:Z

    .line 6
    .line 7
    new-instance v1, Ll/tj00;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/tj00;-><init>(Ll/nk00;)V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Ll/nk00;->L:Ll/y20;

    .line 13
    .line 14
    iput-boolean v0, p0, Ll/nk00;->M:Z

    .line 15
    .line 16
    iput-boolean v0, p0, Ll/nk00;->N:Z

    .line 17
    .line 18
    new-instance v1, Ll/nk00$a;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/nk00$a;-><init>(Ll/nk00;)V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Ll/nk00;->P:Ljava/lang/Runnable;

    .line 24
    .line 25
    iput-boolean v0, p0, Ll/nk00;->Q:Z

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    iput-object v1, p0, Ll/nk00;->R:Landroid/animation/ValueAnimator;

    .line 29
    .line 30
    iput-boolean v0, p0, Ll/nk00;->U:Z

    .line 31
    .line 32
    iput-object p1, p0, Ll/nk00;->C:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Ll/nk00;->F:Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    return-void
.end method

.method public static synthetic A(Ll/nk00;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nk00;->t0()V

    return-void
.end method

.method public static synthetic B(Ll/nk00;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nk00;->w0(Lcom/p1/mobile/putong/data/Media;)V

    return-void
.end method

.method public static synthetic C(Ll/nk00;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nk00;->j0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic E(Ll/nk00;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nk00;->G0(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static synthetic F(Ll/nk00;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nk00;->m0()V

    return-void
.end method

.method public static synthetic G(Ll/nk00;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nk00;->K0(Ljava/lang/String;Z)V

    return-void
.end method

.method public static synthetic H(Ll/nk00;Landroid/view/View;Lv/VImage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nk00;->u0(Landroid/view/View;Lv/VImage;)V

    return-void
.end method

.method public static synthetic I(Ll/nk00;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nk00;->A0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic J(Ll/nk00;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nk00;->k0(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private O()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/nk00;->A:Ll/hj00;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    iput-object v0, p0, Ll/hj00;->n:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Ll/hj00;->m:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Ll/hj00;->l:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 11
    .line 12
    return-void
.end method

.method private W()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/nk00;->Q:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/nk00;->R:Landroid/animation/ValueAnimator;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/nk00;->R:Landroid/animation/ValueAnimator;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 16
    .line 17
    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Ll/nk00;->Q:Z

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/nk00;->k1(I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static X(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string v0, "input_method"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/view/inputmethod/InputMethodManager;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, p1, v0}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic a(Ll/nk00;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nk00;->M0(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic b(Ll/nk00;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nk00;->I0()V

    return-void
.end method

.method public static synthetic c()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d(Ll/nk00;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nk00;->B0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic e(Ll/nk00;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nk00;->l0()V

    return-void
.end method

.method private e0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/nk00;->f1()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 25
    .line 26
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->D:I

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/nk00;->A:Ll/hj00;

    .line 40
    .line 41
    const-string v0, ""

    .line 42
    .line 43
    iput-object v0, p0, Ll/hj00;->n:Ljava/lang/String;

    .line 44
    .line 45
    const/4 v0, 0x0

    .line 46
    iput-object v0, p0, Ll/hj00;->m:Ljava/lang/String;

    .line 47
    .line 48
    iput-object v0, p0, Ll/hj00;->l:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 49
    .line 50
    :cond_0
    return-void
.end method

.method public static synthetic f(Ll/nk00;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nk00;->D0()V

    return-void
.end method

.method private g1()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/nk00;->A:Ll/hj00;

    .line 2
    .line 3
    iget-object v1, v0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-boolean v0, v0, Ll/hj00;->s:Z

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object p0, p0, Ll/nk00;->k:Landroid/widget/LinearLayout;

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    iget-object v0, p0, Ll/nk00;->g:Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v2, 0x4

    .line 26
    if-nez v0, :cond_2

    .line 27
    .line 28
    iget-object p0, p0, Ll/nk00;->k:Landroid/widget/LinearLayout;

    .line 29
    .line 30
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 35
    .line 36
    iget-object v3, p0, Ll/nk00;->A:Ll/hj00;

    .line 37
    .line 38
    invoke-virtual {v3}, Ll/hj00;->O0()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v0, v3}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-static {v0}, Ll/ksg;->b0(Lcom/p1/mobile/putong/data/User;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    iget-object p0, p0, Ll/nk00;->k:Landroid/widget/LinearLayout;

    .line 55
    .line 56
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_3
    new-instance v0, Landroid/graphics/Rect;

    .line 61
    .line 62
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 63
    .line 64
    .line 65
    iget-object v3, p0, Ll/nk00;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 66
    .line 67
    invoke-virtual {v3, v0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iget-object p0, p0, Ll/nk00;->k:Landroid/widget/LinearLayout;

    .line 72
    .line 73
    if-eqz v0, :cond_4

    .line 74
    .line 75
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_4
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public static synthetic i()V
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->I3:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic j(Ll/nk00;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nk00;->s0(Lcom/p1/mobile/putong/data/Media;)V

    return-void
.end method

.method private j1(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->A(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/nk00;->F:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    iget-object v1, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 15
    .line 16
    iget-object p0, p0, Ll/nk00;->A:Ll/hj00;

    .line 17
    .line 18
    invoke-virtual {p0, p1, p2}, Ll/hj00;->E1(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic k(Ll/nk00;Landroid/view/View;Lv/VImage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nk00;->r0(Landroid/view/View;Lv/VImage;)V

    return-void
.end method

.method public static synthetic l(Ll/nk00;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nk00;->H0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Ll/nk00;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nk00;->x0()V

    return-void
.end method

.method public static synthetic n(Ll/nk00;Landroid/view/View;Lv/VImage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nk00;->q0(Landroid/view/View;Lv/VImage;)V

    return-void
.end method

.method public static synthetic p(Ll/nk00;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nk00;->n0(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic q(Ll/nk00;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nk00;->p0()V

    return-void
.end method

.method public static synthetic s(Ll/nk00;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nk00;->L0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic u(Ll/nk00;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nk00;->z0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic v(Ll/nk00;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nk00;->o0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic w(Ll/nk00;Landroid/view/View;Lv/VImage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nk00;->v0(Landroid/view/View;Lv/VImage;)V

    return-void
.end method

.method public static synthetic x(Ll/nk00;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nk00;->y0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic y(Ll/nk00;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nk00;->J0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic z(Ll/nk00;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/nk00;->E0(Ljava/lang/Boolean;)V

    return-void
.end method


# virtual methods
.method public final synthetic A0(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    add-int/2addr v0, v1

    .line 20
    const/16 v1, 0xb4

    .line 21
    .line 22
    if-le v0, v1, :cond_0

    .line 23
    .line 24
    const-string p0, "\u6700\u591a\u53ef\u8f93\u5165180\u5b57"

    .line 25
    .line 26
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object v0, p0, Ll/nk00;->A:Ll/hj00;

    .line 31
    .line 32
    invoke-virtual {v0, p1}, Ll/hj00;->D1(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 36
    .line 37
    invoke-virtual {v0}, Landroid/widget/TextView;->getSelectionStart()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iget-object p0, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 42
    .line 43
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-interface {p0, v0, p1}, Landroid/text/Editable;->insert(ILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final synthetic B0(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nk00;->y:Lv/VLinear;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Ljava/lang/Boolean;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput-boolean v0, p0, Ll/nk00;->N:Z

    .line 15
    .line 16
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast v0, Ljava/lang/Boolean;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ll/nk00;->i0(Ll/pf60;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    invoke-virtual {p0, p1}, Ll/nk00;->h0(Ll/pf60;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/nk00;->F:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic D0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nk00;->a1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic E0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/nk00;->a1()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final synthetic G0(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/dk00;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/dk00;-><init>(Ll/nk00;)V

    .line 8
    .line 9
    .line 10
    new-instance v2, Ll/fk00;

    .line 11
    .line 12
    invoke-direct {v2, p0}, Ll/fk00;-><init>(Ll/nk00;)V

    .line 13
    .line 14
    .line 15
    const-string p0, "p_fake_nearby_comments_popup"

    .line 16
    .line 17
    invoke-static {v0, p0, p1, v1, v2}, Ll/zzg;->f(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ll/x20;Ll/y20;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic H0(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/nk00;->f0()Ll/pf60;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 6
    .line 7
    if-eqz v0, :cond_4

    .line 8
    .line 9
    check-cast v0, Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_4

    .line 16
    .line 17
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v0, Ljava/lang/CharSequence;

    .line 20
    .line 21
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 28
    .line 29
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast p1, Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const/4 p1, 0x0

    .line 39
    :goto_0
    invoke-static {}, Ll/cmg;->z()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_3

    .line 44
    .line 45
    iget-object v0, p0, Ll/nk00;->P:Ljava/lang/Runnable;

    .line 46
    .line 47
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/nk00;->y:Lv/VLinear;

    .line 51
    .line 52
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_2

    .line 57
    .line 58
    iget-object v0, p0, Ll/nk00;->y:Lv/VLinear;

    .line 59
    .line 60
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 65
    .line 66
    if-eqz v0, :cond_2

    .line 67
    .line 68
    iget-object v0, p0, Ll/nk00;->q:Lv/VImage;

    .line 69
    .line 70
    const/4 v1, 0x0

    .line 71
    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, v1}, Ll/nk00;->k1(I)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/nk00;->h:Landroid/view/View;

    .line 78
    .line 79
    invoke-static {}, Ll/cmg;->K()Z

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-eqz v2, :cond_1

    .line 84
    .line 85
    const/high16 v2, 0x42180000    # 38.0f

    .line 86
    .line 87
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    goto :goto_1

    .line 92
    :cond_1
    move v2, v1

    .line 93
    :goto_1
    invoke-static {v0, v2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Ll/nk00;->t:Lv/VLinear;

    .line 97
    .line 98
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-nez v0, :cond_2

    .line 103
    .line 104
    iget-object v0, p0, Ll/nk00;->t:Lv/VLinear;

    .line 105
    .line 106
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 107
    .line 108
    .line 109
    :cond_2
    iget-boolean v0, p0, Ll/nk00;->N:Z

    .line 110
    .line 111
    if-eqz v0, :cond_3

    .line 112
    .line 113
    invoke-direct {p0}, Ll/nk00;->W()V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Ll/nk00;->F:Lcom/p1/mobile/android/app/Act;

    .line 117
    .line 118
    iget-object v1, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 119
    .line 120
    invoke-static {v0, v1}, Ll/nk00;->X(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    .line 121
    .line 122
    .line 123
    :cond_3
    iget-object v0, p0, Ll/nk00;->F:Lcom/p1/mobile/android/app/Act;

    .line 124
    .line 125
    new-instance v1, Ll/zj00;

    .line 126
    .line 127
    invoke-direct {v1, p0, p1}, Ll/zj00;-><init>(Ll/nk00;Lcom/p1/mobile/putong/data/User;)V

    .line 128
    .line 129
    .line 130
    const-wide/16 p0, 0x96

    .line 131
    .line 132
    invoke-static {v0, v1, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :cond_4
    invoke-virtual {p0}, Ll/nk00;->a1()V

    .line 137
    .line 138
    .line 139
    return-void
.end method

.method public final synthetic I0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 2
    .line 3
    iget v1, p0, Ll/nk00;->H:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setInputType(I)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Ll/nk00;->e0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic J0(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/nk00;->A:Ll/hj00;

    .line 8
    .line 9
    iget-object v0, v0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

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
    invoke-virtual {p0}, Ll/nk00;->T()V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Ll/nk00;->A:Ll/hj00;

    .line 21
    .line 22
    iget-boolean v1, v0, Ll/hj00;->u:Z

    .line 23
    .line 24
    if-nez v1, :cond_1

    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    iput-boolean v1, v0, Ll/hj00;->s:Z

    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    iget-object v0, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 38
    .line 39
    if-eqz p1, :cond_2

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_2
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->D:I

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public K(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ok00;->b(Ll/nk00;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic K0(Ljava/lang/String;Z)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, v0}, Ll/nk00;->L(ZZ)V

    .line 3
    .line 4
    .line 5
    invoke-static {}, Ll/cmg;->G()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v1, p0, Ll/nk00;->A:Ll/hj00;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/hj00;->S0()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object v1, p0, Ll/nk00;->u:Lv/VImage;

    .line 20
    .line 21
    invoke-virtual {v1}, Landroid/view/View;->isSelected()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    iget-object v1, p0, Ll/nk00;->A:Ll/hj00;

    .line 28
    .line 29
    iget-object v2, p0, Ll/nk00;->F:Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    iget-object v3, v1, Ll/hj00;->p:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v4, v1, Ll/hj00;->o:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v1, v2, p1, v3, v4}, Ll/hj00;->C1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-object p1, p0, Ll/nk00;->B:Ll/hi00;

    .line 39
    .line 40
    iget-object v1, p0, Ll/nk00;->A:Ll/hj00;

    .line 41
    .line 42
    iget-object v1, v1, Ll/hj00;->l:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 43
    .line 44
    invoke-virtual {p1, v1}, Ll/hi00;->l0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    invoke-virtual {p0, p1}, Ll/nk00;->Z0(I)V

    .line 49
    .line 50
    .line 51
    if-eqz p2, :cond_1

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Ll/nk00;->d1(Z)V

    .line 54
    .line 55
    .line 56
    :cond_1
    return-void
.end method

.method public L(ZZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nk00;->b:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/nk00;->j:Landroid/view/View;

    .line 7
    .line 8
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    if-nez p1, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Ll/nk00;->y:Lv/VLinear;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x4

    .line 20
    if-eq v0, v1, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Ll/nk00;->y:Lv/VLinear;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/16 v1, 0x8

    .line 29
    .line 30
    if-ne v0, v1, :cond_1

    .line 31
    .line 32
    :cond_0
    const/4 v0, 0x1

    .line 33
    goto :goto_0

    .line 34
    :cond_1
    const/4 v0, 0x0

    .line 35
    :goto_0
    iget-object v1, p0, Ll/nk00;->x:Landroid/view/View;

    .line 36
    .line 37
    if-nez v0, :cond_3

    .line 38
    .line 39
    if-eqz p2, :cond_2

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_2
    const/high16 p2, 0x41300000    # 11.0f

    .line 43
    .line 44
    goto :goto_2

    .line 45
    :cond_3
    :goto_1
    const/high16 p2, 0x42040000    # 33.0f

    .line 46
    .line 47
    :goto_2
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    invoke-static {v1, p2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Ll/nk00;->F:Lcom/p1/mobile/android/app/Act;

    .line 55
    .line 56
    if-eqz p1, :cond_4

    .line 57
    .line 58
    const-string p1, "#4D000000"

    .line 59
    .line 60
    :goto_3
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    goto :goto_4

    .line 65
    :cond_4
    const-string p1, "#ffffff"

    .line 66
    .line 67
    goto :goto_3

    .line 68
    :goto_4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final synthetic L0(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 2
    .line 3
    iget v1, p0, Ll/nk00;->H:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setInputType(I)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, p1, p2}, Ll/nk00;->j1(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final M(Ll/x20;)V
    .locals 3

    .line 1
    iget-object p0, p0, Ll/nk00;->F:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    new-instance v0, Ll/qj00;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/qj00;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    sget-object v2, Ll/l3h;->c:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0, v0, v1, p1, v2}, Ll/k3h;->P0(Lcom/p1/mobile/android/app/Act;Ll/x20;ZLl/x20;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic M0(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object p0, p0, Ll/nk00;->y:Lv/VLinear;

    .line 12
    .line 13
    invoke-static {p0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public N(Ll/hj00;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nk00;->A:Ll/hj00;

    .line 2
    .line 3
    return-void
.end method

.method public N0(Z)V
    .locals 2

    .line 1
    invoke-static {}, Ll/cmg;->z()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {p0, v1, v0}, Ll/nk00;->L(ZZ)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/nk00;->P:Ljava/lang/Runnable;

    .line 13
    .line 14
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/nk00;->y:Lv/VLinear;

    .line 18
    .line 19
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Ll/nk00;->y:Lv/VLinear;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iget-object p1, p0, Ll/nk00;->q:Lv/VImage;

    .line 36
    .line 37
    invoke-virtual {p1, v1}, Landroid/view/View;->setSelected(Z)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v1}, Ll/nk00;->k1(I)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ll/nk00;->h:Landroid/view/View;

    .line 44
    .line 45
    invoke-static {}, Ll/cmg;->G()Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    const/high16 v0, 0x42180000    # 38.0f

    .line 52
    .line 53
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    goto :goto_0

    .line 58
    :cond_0
    move v0, v1

    .line 59
    :goto_0
    invoke-static {p1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Ll/nk00;->t:Lv/VLinear;

    .line 63
    .line 64
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-nez p1, :cond_3

    .line 69
    .line 70
    iget-object p0, p0, Ll/nk00;->t:Lv/VLinear;

    .line 71
    .line 72
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_1
    iget-boolean v0, p0, Ll/nk00;->N:Z

    .line 77
    .line 78
    if-eqz v0, :cond_2

    .line 79
    .line 80
    if-eqz p1, :cond_3

    .line 81
    .line 82
    invoke-direct {p0}, Ll/nk00;->W()V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Ll/nk00;->F:Lcom/p1/mobile/android/app/Act;

    .line 86
    .line 87
    iget-object p0, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 88
    .line 89
    invoke-static {p1, p0}, Ll/nk00;->X(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_2
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-eqz p1, :cond_3

    .line 102
    .line 103
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 108
    .line 109
    .line 110
    :cond_3
    return-void
.end method

.method public O0(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/nk00;->A:Ll/hj00;

    .line 2
    .line 3
    iget-boolean v0, v0, Ll/hj00;->q:Z

    .line 4
    .line 5
    iget-object p0, p0, Ll/nk00;->B:Ll/hi00;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance p1, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/hi00;->d0(Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-virtual {p0, p1}, Ll/hi00;->d0(Ljava/util/List;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public P()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nk00;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    sget v1, Ll/abc0;->n:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/nk00;->a:Lv/navigationbar/VNavigationBar;

    .line 9
    .line 10
    new-instance v1, Ll/rj00;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/rj00;-><init>(Ll/nk00;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/nk00;->k:Landroid/widget/LinearLayout;

    .line 19
    .line 20
    const/4 v1, 0x4

    .line 21
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/nk00;->a:Lv/navigationbar/VNavigationBar;

    .line 25
    .line 26
    iget-object v1, p0, Ll/nk00;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setTitleView(Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/nk00;->a:Lv/navigationbar/VNavigationBar;

    .line 32
    .line 33
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->getLeftIconContainer()Lv/VFrame;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-static {v0, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 42
    .line 43
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    iget-object v0, p0, Ll/nk00;->C:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 50
    .line 51
    iget-object v1, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 52
    .line 53
    const/4 v2, 0x1

    .line 54
    invoke-virtual {v1, v2}, Lv/VEditText;->i(Z)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v1, Ll/sj00;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/sj00;-><init>(Ll/nk00;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 72
    .line 73
    .line 74
    :cond_0
    iget-object v0, p0, Ll/nk00;->g:Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

    .line 75
    .line 76
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->b:Landroid/widget/TextView;

    .line 77
    .line 78
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->e4:I

    .line 83
    .line 84
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Ll/nk00;->g:Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

    .line 92
    .line 93
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 94
    .line 95
    sget v1, Ll/lbc0;->h6:I

    .line 96
    .line 97
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Ll/nk00;->g:Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

    .line 101
    .line 102
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 103
    .line 104
    const/high16 v1, 0x43660000    # 230.0f

    .line 105
    .line 106
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Ll/nk00;->E:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 114
    .line 115
    if-nez v0, :cond_1

    .line 116
    .line 117
    new-instance v0, Ll/uj00;

    .line 118
    .line 119
    invoke-direct {v0, p0}, Ll/uj00;-><init>(Ll/nk00;)V

    .line 120
    .line 121
    .line 122
    iput-object v0, p0, Ll/nk00;->E:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 123
    .line 124
    iget-object v0, p0, Ll/nk00;->k:Landroid/widget/LinearLayout;

    .line 125
    .line 126
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    iget-object p0, p0, Ll/nk00;->E:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 131
    .line 132
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 133
    .line 134
    .line 135
    :cond_1
    return-void
.end method

.method public P0(Ljava/util/List;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/StickerInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/nk00;->B:Ll/hi00;

    .line 8
    .line 9
    iget-object v0, v0, Ll/di5;->d:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/nk00;->B:Ll/hi00;

    .line 15
    .line 16
    iget-object v0, v0, Ll/di5;->d:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v0, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-virtual {p0, p1}, Ll/nk00;->O0(Ljava/util/List;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public Q()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nk00;->r:Landroid/widget/TextView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/nk00;->k:Landroid/widget/LinearLayout;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v2, p0, Ll/nk00;->E:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Ll/nk00;->E:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 24
    .line 25
    iput-object v1, p0, Ll/nk00;->L:Ll/y20;

    .line 26
    .line 27
    return-void
.end method

.method public Q0(Lcom/p1/mobile/putong/data/Links;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nk00;->B:Ll/hi00;

    .line 2
    .line 3
    iput-object p1, p0, Ll/hi00;->p:Lcom/p1/mobile/putong/data/Links;

    .line 4
    .line 5
    return-void
.end method

.method public R(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/nk00;->B:Ll/hi00;

    .line 2
    .line 3
    iget-object p0, p0, Ll/di5;->e:Ljava/util/Map;

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/CommentInfo;->parentMessageId:Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ljava/util/List;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public R0(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nk00;->B:Ll/hi00;

    .line 2
    .line 3
    iput-object p1, p0, Ll/hi00;->s:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    return-void
.end method

.method public final S()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nk00;->A:Ll/hj00;

    .line 2
    .line 3
    iget-object v0, v0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    invoke-static {v0}, Ll/ksg;->X(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/nk00;->A:Ll/hj00;

    .line 12
    .line 13
    iget-object v0, v0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, "owner_id"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object p0, p0, Ll/nk00;->A:Ll/hj00;

    .line 24
    .line 25
    iget-object p0, p0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 28
    .line 29
    const-string v1, "moment_id"

    .line 30
    .line 31
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string v1, "resource"

    .line 36
    .line 37
    const-string v2, ""

    .line 38
    .line 39
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    filled-new-array {v0, p0, v1}, [Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const-string v0, "e_moment_voice"

    .line 48
    .line 49
    const-string v1, "p_user_moment_interactions_details_view"

    .line 50
    .line 51
    invoke-static {v0, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    return-void
.end method

.method public S0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nk00;->B:Ll/hi00;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/di5;->e0(Lcom/p1/mobile/putong/feed/data/MomentMessage;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final T()V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/nk00;->A:Ll/hj00;

    .line 7
    .line 8
    iget-object v1, v1, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 9
    .line 10
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 11
    .line 12
    const-string v2, "moment_id"

    .line 13
    .line 14
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/nk00;->A:Ll/hj00;

    .line 22
    .line 23
    iget-object v1, v1, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 26
    .line 27
    const-string v2, "owner_id"

    .line 28
    .line 29
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Ll/nk00;->A:Ll/hj00;

    .line 40
    .line 41
    iget-object v1, v1, Ll/hj00;->j:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v1}, Ll/er60;->D(Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    const-string v2, "moment_showfrom"

    .line 48
    .line 49
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iget-object v2, p0, Ll/nk00;->A:Ll/hj00;

    .line 61
    .line 62
    iget-object v2, v2, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 63
    .line 64
    invoke-virtual {v1, v2}, Ll/er60;->y(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    const-string v2, "moment_type"

    .line 69
    .line 70
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    iget-boolean v1, p0, Ll/nk00;->G:Z

    .line 78
    .line 79
    if-eqz v1, :cond_0

    .line 80
    .line 81
    const-string v1, "reply"

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_0
    const-string v1, "comment"

    .line 85
    .line 86
    :goto_0
    const-string v2, "comment_detail"

    .line 87
    .line 88
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    iget-object v1, p0, Ll/nk00;->A:Ll/hj00;

    .line 96
    .line 97
    iget-object v1, v1, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 98
    .line 99
    invoke-static {v1}, Ll/ksg;->G(Lcom/p1/mobile/putong/feed/data/Moment;)J

    .line 100
    .line 101
    .line 102
    move-result-wide v1

    .line 103
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    const-string v2, "moment_distance"

    .line 108
    .line 109
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    iget-object v1, p0, Ll/nk00;->A:Ll/hj00;

    .line 117
    .line 118
    iget-object v1, v1, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 119
    .line 120
    invoke-static {v1}, Ll/ksg;->F(Lcom/p1/mobile/putong/feed/data/Moment;)J

    .line 121
    .line 122
    .line 123
    move-result-wide v1

    .line 124
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    const-string v2, "moment_create_time"

    .line 129
    .line 130
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 138
    .line 139
    iget-object p0, p0, Ll/nk00;->A:Ll/hj00;

    .line 140
    .line 141
    iget-object p0, p0, Ll/hj00;->p:Ljava/lang/String;

    .line 142
    .line 143
    invoke-virtual {v1, p0}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-static {p0}, Ll/ksg;->S(Lcom/p1/mobile/putong/data/User;)J

    .line 148
    .line 149
    .line 150
    move-result-wide v1

    .line 151
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    const-string v1, "owner_active_time"

    .line 156
    .line 157
    invoke-static {v1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    const/4 p0, 0x0

    .line 165
    new-array p0, p0, [Ll/pf60;

    .line 166
    .line 167
    invoke-interface {v0, p0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    check-cast p0, [Ll/pf60;

    .line 172
    .line 173
    const-string v0, "e_comment"

    .line 174
    .line 175
    const-string v1, "p_user_moment_interactions_details_view"

    .line 176
    .line 177
    invoke-static {v0, v1, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 178
    .line 179
    .line 180
    return-void
.end method

.method public T0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nk00;->A:Ll/hj00;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/hj00;->O0()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v1, p0, Ll/nk00;->B:Ll/hi00;

    .line 11
    .line 12
    iput-object v0, v1, Ll/hi00;->s:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 16
    .line 17
    .line 18
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->settings:Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 19
    .line 20
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentSettings;->visibility:Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;

    .line 21
    .line 22
    iget-object v2, p0, Ll/nk00;->I:Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;

    .line 23
    .line 24
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    iget-object v1, p0, Ll/nk00;->A:Ll/hj00;

    .line 31
    .line 32
    iput-object v0, v1, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 33
    .line 34
    iget-object v0, v1, Ll/hj00;->d:Ll/n570;

    .line 35
    .line 36
    iget-object v1, v1, Ll/hj00;->j:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {p0, v0, v1}, Ll/nk00;->X0(Ll/n570;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_1
    :goto_0
    return-void
.end method

.method public U(Ljava/lang/String;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/nk00;->B:Ll/hi00;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/di5;->S(Ljava/lang/String;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public U0(Ll/bkj0;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bkj0<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ll/pf60<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/StickerInfo;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
            ">;>;",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Music;",
            "Lcom/p1/mobile/putong/feed/data/RawFeed;",
            ">;>;)Z"
        }
    .end annotation

    .line 1
    iget-object p1, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Ll/nk00;->F:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 9
    .line 10
    .line 11
    return v0

    .line 12
    :cond_0
    iget-object p1, p0, Ll/nk00;->k:Landroid/widget/LinearLayout;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/nk00;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 19
    .line 20
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/nk00;->g:Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

    .line 24
    .line 25
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    return v1
.end method

.method public V()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nk00;->J:Ljava/lang/String;

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
    iget-object v1, p0, Ll/nk00;->J:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Ll/nk00;->J:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public V0(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nk00;->g:Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/nk00;->k:Landroid/widget/LinearLayout;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    instance-of v0, p1, Lcom/tantanapp/common/network/ApiExcep$Client$Forbidden;

    .line 17
    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    instance-of v2, p1, Lcom/tantanapp/common/network/ApiExcep$Client$NotFound;

    .line 21
    .line 22
    if-eqz v2, :cond_3

    .line 23
    .line 24
    :cond_1
    if-eqz v0, :cond_2

    .line 25
    .line 26
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 27
    .line 28
    iget p1, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 29
    .line 30
    const v0, 0x9d7a

    .line 31
    .line 32
    .line 33
    if-ne p1, v0, :cond_2

    .line 34
    .line 35
    sget p1, Lcom/p1/mobile/putong/feed/R$string;->b1:I

    .line 36
    .line 37
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 38
    .line 39
    .line 40
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_2
    iget-object p1, p0, Ll/nk00;->A:Ll/hj00;

    .line 49
    .line 50
    invoke-virtual {p1}, Ll/hj00;->O0()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-eqz p1, :cond_3

    .line 59
    .line 60
    iget-object p1, p0, Ll/nk00;->A:Ll/hj00;

    .line 61
    .line 62
    invoke-virtual {p1}, Ll/hj00;->O0()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-eqz p1, :cond_3

    .line 73
    .line 74
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 75
    .line 76
    iget-object v0, p0, Ll/nk00;->A:Ll/hj00;

    .line 77
    .line 78
    invoke-virtual {v0}, Ll/hj00;->O0()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {p1, v0}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-static {p1}, Ll/ksg;->b0(Lcom/p1/mobile/putong/data/User;)Z

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    if-nez p1, :cond_3

    .line 93
    .line 94
    iget-object p1, p0, Ll/nk00;->g:Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

    .line 95
    .line 96
    const/4 v0, 0x1

    .line 97
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Ll/nk00;->d:Landroid/widget/LinearLayout;

    .line 101
    .line 102
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 103
    .line 104
    .line 105
    iget-object p0, p0, Ll/nk00;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 106
    .line 107
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 108
    .line 109
    .line 110
    :cond_3
    :goto_0
    return-void
.end method

.method public W0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nk00;->z:Lv/VImage;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public X0(Ll/n570;Ljava/lang/String;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/nk00;->A:Ll/hj00;

    .line 2
    .line 3
    iget-object v0, v0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->settings:Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/MomentSettings;->visibility:Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;

    .line 11
    .line 12
    iput-object v0, p0, Ll/nk00;->I:Lcom/p1/mobile/putong/feed/data/MomentVisibilityStatus;

    .line 13
    .line 14
    invoke-static {}, Ll/dj70$a;->a()Ll/dj70$a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Ll/nk00;->F:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/dj70$a;->d(Lcom/p1/mobile/android/app/Act;)Ll/dj70$a;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v1, p0, Ll/nk00;->A:Ll/hj00;

    .line 25
    .line 26
    iget-object v1, v1, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ll/dj70$a;->k(Lcom/p1/mobile/putong/feed/data/Moment;)Ll/dj70$a;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-virtual {v0, v1}, Ll/dj70$a;->i(Z)Ll/dj70$a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v2, p0, Ll/nk00;->A:Ll/hj00;

    .line 38
    .line 39
    iget-boolean v2, v2, Ll/hj00;->x:Z

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Ll/dj70$a;->j(Z)Ll/dj70$a;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const/4 v2, 0x1

    .line 46
    invoke-virtual {v0, v2}, Ll/dj70$a;->h(Z)Ll/dj70$a;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget-object v2, p0, Ll/nk00;->A:Ll/hj00;

    .line 51
    .line 52
    iget-object v2, v2, Ll/hj00;->k:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-eqz v2, :cond_1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    iget-object p2, p0, Ll/nk00;->A:Ll/hj00;

    .line 62
    .line 63
    iget-object p2, p2, Ll/hj00;->k:Ljava/lang/String;

    .line 64
    .line 65
    :goto_0
    invoke-virtual {v0, p2}, Ll/dj70$a;->g(Ljava/lang/String;)Ll/dj70$a;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    invoke-virtual {p2, p1}, Ll/dj70$a;->e(Ll/n570;)Ll/dj70$a;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    const/4 p2, 0x0

    .line 74
    invoke-virtual {p1, p2}, Ll/dj70$a;->l(Landroid/os/Bundle;)Ll/dj70$a;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iget-object p2, p0, Ll/nk00;->A:Ll/hj00;

    .line 79
    .line 80
    iget-object p2, p2, Ll/hj00;->f:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 81
    .line 82
    invoke-virtual {p1, p2}, Ll/dj70$a;->f(Lcom/p1/mobile/putong/feed/data/RawFeed;)Ll/dj70$a;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p1}, Ll/dj70$a;->b()Ll/dj70;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iput-object p1, p0, Ll/nk00;->K:Ll/dj70;

    .line 91
    .line 92
    iget-object p1, p1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 93
    .line 94
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result p2

    .line 98
    const/high16 v0, 0x40800000    # 4.0f

    .line 99
    .line 100
    const/4 v2, -0x2

    .line 101
    if-eqz p2, :cond_2

    .line 102
    .line 103
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->needShowFrame()Z

    .line 104
    .line 105
    .line 106
    move-result p2

    .line 107
    if-eqz p2, :cond_2

    .line 108
    .line 109
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->headFrameUrl()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p2

    .line 113
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 114
    .line 115
    .line 116
    move-result p2

    .line 117
    if-nez p2, :cond_2

    .line 118
    .line 119
    iget-object p1, p0, Ll/nk00;->a:Lv/navigationbar/VNavigationBar;

    .line 120
    .line 121
    invoke-virtual {p1}, Lv/navigationbar/VNavigationBar;->getTitleContainer()Lv/VFrame;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    check-cast p1, Lv/VLinear;

    .line 130
    .line 131
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 132
    .line 133
    invoke-direct {p2, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 134
    .line 135
    .line 136
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 141
    .line 142
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 143
    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_2
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    move-result p2

    .line 150
    if-eqz p2, :cond_3

    .line 151
    .line 152
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 153
    .line 154
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    move-result p2

    .line 158
    if-eqz p2, :cond_3

    .line 159
    .line 160
    iget-object p2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 161
    .line 162
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 163
    .line 164
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 165
    .line 166
    iget-object p2, p2, Lcom/p1/mobile/putong/data/HeadFrame;->expiredTime:Ljava/util/List;

    .line 167
    .line 168
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 169
    .line 170
    .line 171
    move-result v3

    .line 172
    if-nez v3, :cond_3

    .line 173
    .line 174
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    move-result-object p2

    .line 178
    check-cast p2, Ljava/lang/Double;

    .line 179
    .line 180
    invoke-virtual {p2}, Ljava/lang/Double;->doubleValue()D

    .line 181
    .line 182
    .line 183
    move-result-wide v3

    .line 184
    invoke-static {}, Ll/pzi0;->o()J

    .line 185
    .line 186
    .line 187
    move-result-wide v5

    .line 188
    long-to-double v5, v5

    .line 189
    cmpl-double p2, v3, v5

    .line 190
    .line 191
    if-lez p2, :cond_3

    .line 192
    .line 193
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 194
    .line 195
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 196
    .line 197
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 198
    .line 199
    iget-object p1, p1, Lcom/p1/mobile/putong/data/HeadFrame;->url:Ljava/util/List;

    .line 200
    .line 201
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 202
    .line 203
    .line 204
    move-result p1

    .line 205
    if-nez p1, :cond_3

    .line 206
    .line 207
    iget-object p1, p0, Ll/nk00;->a:Lv/navigationbar/VNavigationBar;

    .line 208
    .line 209
    invoke-virtual {p1}, Lv/navigationbar/VNavigationBar;->getTitleContainer()Lv/VFrame;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 214
    .line 215
    .line 216
    move-result-object p1

    .line 217
    check-cast p1, Lv/VLinear;

    .line 218
    .line 219
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 220
    .line 221
    invoke-direct {p2, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 222
    .line 223
    .line 224
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 225
    .line 226
    .line 227
    move-result v0

    .line 228
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 229
    .line 230
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 231
    .line 232
    .line 233
    :cond_3
    :goto_1
    iget-object p1, p0, Ll/nk00;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    .line 234
    .line 235
    iget-object p0, p0, Ll/nk00;->K:Ll/dj70;

    .line 236
    .line 237
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->E(Ll/dj70;)V

    .line 238
    .line 239
    .line 240
    return-void
.end method

.method public Y(Ll/n570;)V
    .locals 11

    .line 1
    new-instance v0, Ll/hi00;

    .line 2
    .line 3
    iget-object v9, p0, Ll/nk00;->A:Ll/hj00;

    .line 4
    .line 5
    iget-boolean v1, v9, Ll/hj00;->q:Z

    .line 6
    .line 7
    iget-object v2, p0, Ll/nk00;->F:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    iget-object v4, v9, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    iget-object v5, v9, Ll/hj00;->p:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v6, v9, Ll/hj00;->j:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v7, p0, Ll/nk00;->C:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 16
    .line 17
    new-instance v10, Ll/vj00;

    .line 18
    .line 19
    invoke-direct {v10, p0}, Ll/vj00;-><init>(Ll/nk00;)V

    .line 20
    .line 21
    .line 22
    move-object v8, p0

    .line 23
    move-object v3, p1

    .line 24
    invoke-direct/range {v0 .. v10}, Ll/hi00;-><init>(ZLcom/p1/mobile/android/app/Act;Ll/n570;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;Ll/nk00;Ll/hj00;Ll/x20;)V

    .line 25
    .line 26
    .line 27
    iput-object v0, v8, Ll/nk00;->B:Ll/hi00;

    .line 28
    .line 29
    iget-object p0, v8, Ll/nk00;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, v8, Ll/nk00;->A:Ll/hj00;

    .line 35
    .line 36
    iget-boolean p0, p0, Ll/hj00;->q:Z

    .line 37
    .line 38
    if-eqz p0, :cond_0

    .line 39
    .line 40
    iget-object p0, v8, Ll/nk00;->B:Ll/hi00;

    .line 41
    .line 42
    new-instance p1, Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, p1}, Ll/hi00;->d0(Ljava/util/List;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    invoke-virtual {v8}, Ll/nk00;->S()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public Y0(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nk00;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/view/View;->canScrollVertically(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Ll/nk00;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;

    .line 11
    .line 12
    invoke-virtual {p0, v1, p1}, Landroid/view/View;->scrollBy(II)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object v0, p0, Ll/nk00;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Landroid/view/View;->canScrollVertically(I)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget-object p0, p0, Ll/nk00;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 25
    .line 26
    invoke-virtual {p0, v1, p1}, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public Z()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/nk00;->n:Lv/VLinear;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iget-object v2, p0, Ll/nk00;->F:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    iget-object v3, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 13
    .line 14
    new-instance v5, Ll/ik00;

    .line 15
    .line 16
    invoke-direct {v5, p0}, Ll/ik00;-><init>(Ll/nk00;)V

    .line 17
    .line 18
    .line 19
    const/4 v6, 0x0

    .line 20
    const/4 v4, 0x1

    .line 21
    invoke-interface/range {v1 .. v6}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->b6(Lcom/p1/mobile/android/app/Act;Landroid/widget/EditText;ZLl/y20;Z)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Ll/nk00;->S:Landroid/view/View;

    .line 26
    .line 27
    iget-object v1, p0, Ll/nk00;->n:Lv/VLinear;

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/nk00;->q:Lv/VImage;

    .line 33
    .line 34
    new-instance v1, Ll/jk00;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/jk00;-><init>(Ll/nk00;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    iget-object v3, p0, Ll/nk00;->F:Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    new-instance v4, Ll/kk00;

    .line 49
    .line 50
    invoke-direct {v4, p0}, Ll/kk00;-><init>(Ll/nk00;)V

    .line 51
    .line 52
    .line 53
    new-instance v5, Ll/lk00;

    .line 54
    .line 55
    invoke-direct {v5}, Ll/lk00;-><init>()V

    .line 56
    .line 57
    .line 58
    iget-object v6, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 59
    .line 60
    const/4 v7, 0x0

    .line 61
    iget-object v8, p0, Ll/nk00;->S:Landroid/view/View;

    .line 62
    .line 63
    invoke-interface/range {v2 .. v8}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->yo(Lcom/p1/mobile/android/app/Act;Ll/y20;Ll/x20;Lcom/p1/mobile/putong/newui/view/MessageInputEditView;ZLandroid/view/View;)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iget-object v1, p0, Ll/nk00;->y:Lv/VLinear;

    .line 68
    .line 69
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 70
    .line 71
    .line 72
    iget-object v1, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 73
    .line 74
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-eqz v1, :cond_0

    .line 79
    .line 80
    iget-object v1, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 81
    .line 82
    new-instance v2, Ll/b4h;

    .line 83
    .line 84
    const/16 v3, 0xb4

    .line 85
    .line 86
    invoke-direct {v2, v3}, Ll/b4h;-><init>(I)V

    .line 87
    .line 88
    .line 89
    const/4 v3, 0x1

    .line 90
    new-array v3, v3, [Landroid/text/InputFilter;

    .line 91
    .line 92
    const/4 v4, 0x0

    .line 93
    aput-object v2, v3, v4

    .line 94
    .line 95
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 96
    .line 97
    .line 98
    :cond_0
    iget-object v1, p0, Ll/nk00;->s:Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;

    .line 99
    .line 100
    iget-object v2, p0, Ll/nk00;->F:Lcom/p1/mobile/android/app/Act;

    .line 101
    .line 102
    new-instance v3, Ll/mk00;

    .line 103
    .line 104
    invoke-direct {v3, p0, v0}, Ll/mk00;-><init>(Ll/nk00;Landroid/view/View;)V

    .line 105
    .line 106
    .line 107
    new-instance v4, Ll/jj00;

    .line 108
    .line 109
    invoke-direct {v4, p0, v0}, Ll/jj00;-><init>(Ll/nk00;Landroid/view/View;)V

    .line 110
    .line 111
    .line 112
    new-instance v5, Ll/kj00;

    .line 113
    .line 114
    invoke-direct {v5, p0}, Ll/kj00;-><init>(Ll/nk00;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->b0(Lcom/p1/mobile/android/app/Act;Ll/y20;Ll/y20;Ll/x20;)V

    .line 118
    .line 119
    .line 120
    iget-object v1, p0, Ll/nk00;->w:Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;

    .line 121
    .line 122
    iget-object v2, p0, Ll/nk00;->F:Lcom/p1/mobile/android/app/Act;

    .line 123
    .line 124
    new-instance v3, Ll/lj00;

    .line 125
    .line 126
    invoke-direct {v3, p0, v0}, Ll/lj00;-><init>(Ll/nk00;Landroid/view/View;)V

    .line 127
    .line 128
    .line 129
    new-instance v4, Ll/mj00;

    .line 130
    .line 131
    invoke-direct {v4, p0, v0}, Ll/mj00;-><init>(Ll/nk00;Landroid/view/View;)V

    .line 132
    .line 133
    .line 134
    new-instance v0, Ll/nj00;

    .line 135
    .line 136
    invoke-direct {v0, p0}, Ll/nj00;-><init>(Ll/nk00;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v1, v2, v3, v4, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->b0(Lcom/p1/mobile/android/app/Act;Ll/y20;Ll/y20;Ll/x20;)V

    .line 140
    .line 141
    .line 142
    return-void
.end method

.method public Z0(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nk00;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nk00;->F:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;->h:Lrx/subjects/b;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/hk00;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/hk00;-><init>(Ll/nk00;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final a1()V
    .locals 7

    .line 1
    invoke-static {}, Ll/cmg;->G()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/nk00;->A:Ll/hj00;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/hj00;->S0()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/nk00;->u:Lv/VImage;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/view/View;->isSelected()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    sget-object v0, Ll/hj00;->K:Ll/byd0;

    .line 24
    .line 25
    invoke-static {}, Ll/pzi0;->o()J

    .line 26
    .line 27
    .line 28
    move-result-wide v1

    .line 29
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-object v0, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-static {}, Ll/cmg;->G()Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_2

    .line 51
    .line 52
    iget-object v1, p0, Ll/nk00;->A:Ll/hj00;

    .line 53
    .line 54
    invoke-virtual {v1}, Ll/hj00;->S0()Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_2

    .line 59
    .line 60
    iget-object v1, p0, Ll/nk00;->A:Ll/hj00;

    .line 61
    .line 62
    iget-object v1, v1, Ll/hj00;->p:Ljava/lang/String;

    .line 63
    .line 64
    const-string v2, "moments_user_id"

    .line 65
    .line 66
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    iget-object v2, p0, Ll/nk00;->u:Lv/VImage;

    .line 71
    .line 72
    invoke-virtual {v2}, Landroid/view/View;->isSelected()Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-eqz v2, :cond_1

    .line 77
    .line 78
    const-string v2, "1"

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_1
    const-string v2, "0"

    .line 82
    .line 83
    :goto_0
    const-string v3, "selection_situation"

    .line 84
    .line 85
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    filled-new-array {v1, v2}, [Ll/pf60;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    const-string v2, "e_greet_together"

    .line 94
    .line 95
    const-string v3, "p_user_moment_interactions_details_view"

    .line 96
    .line 97
    invoke-static {v2, v3, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 98
    .line 99
    .line 100
    :cond_2
    const/4 v1, 0x0

    .line 101
    iput-boolean v1, p0, Ll/nk00;->G:Z

    .line 102
    .line 103
    iget-object v2, p0, Ll/nk00;->A:Ll/hj00;

    .line 104
    .line 105
    iget-object v2, v2, Ll/hj00;->n:Ljava/lang/String;

    .line 106
    .line 107
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    if-eqz v2, :cond_4

    .line 112
    .line 113
    iget-object v2, p0, Ll/nk00;->A:Ll/hj00;

    .line 114
    .line 115
    iget-object v2, v2, Ll/hj00;->l:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 116
    .line 117
    if-eqz v2, :cond_3

    .line 118
    .line 119
    iget-object v2, v2, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 120
    .line 121
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 122
    .line 123
    .line 124
    move-result v2

    .line 125
    if-eqz v2, :cond_4

    .line 126
    .line 127
    :cond_3
    const/4 v2, 0x1

    .line 128
    goto :goto_1

    .line 129
    :cond_4
    move v2, v1

    .line 130
    :goto_1
    iget-object v3, p0, Ll/nk00;->A:Ll/hj00;

    .line 131
    .line 132
    iget-object v4, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 133
    .line 134
    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 135
    .line 136
    .line 137
    move-result-object v4

    .line 138
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v4

    .line 142
    iget-object v5, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 143
    .line 144
    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 145
    .line 146
    .line 147
    move-result-object v5

    .line 148
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v5

    .line 152
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v5

    .line 156
    new-instance v6, Ll/bk00;

    .line 157
    .line 158
    invoke-direct {v6, p0, v0, v2}, Ll/bk00;-><init>(Ll/nk00;Ljava/lang/String;Z)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v3, v4, v5, v6}, Ll/hj00;->x1(Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 162
    .line 163
    .line 164
    iget-object v0, p0, Ll/nk00;->y:Lv/VLinear;

    .line 165
    .line 166
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    if-eqz v0, :cond_5

    .line 171
    .line 172
    iget-object v0, p0, Ll/nk00;->y:Lv/VLinear;

    .line 173
    .line 174
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 179
    .line 180
    if-eqz v0, :cond_5

    .line 181
    .line 182
    invoke-virtual {p0, v1}, Ll/nk00;->k1(I)V

    .line 183
    .line 184
    .line 185
    :cond_5
    iget-object v0, p0, Ll/nk00;->F:Lcom/p1/mobile/android/app/Act;

    .line 186
    .line 187
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 188
    .line 189
    .line 190
    iget-object v0, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 191
    .line 192
    iget-object v2, p0, Ll/nk00;->C:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 193
    .line 194
    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 195
    .line 196
    .line 197
    move-result-object v2

    .line 198
    sget v3, Lcom/p1/mobile/putong/feed/R$string;->X2:I

    .line 199
    .line 200
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 205
    .line 206
    .line 207
    iget-object v0, p0, Ll/nk00;->q:Lv/VImage;

    .line 208
    .line 209
    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 210
    .line 211
    .line 212
    iget-object p0, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 213
    .line 214
    const/4 v0, 0x0

    .line 215
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 216
    .line 217
    .line 218
    return-void
.end method

.method public b0(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    sget p1, Ll/tec0;->f2:I

    .line 2
    .line 3
    iget-object v0, p0, Ll/nk00;->F:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    .line 16
    .line 17
    iput-object p1, p0, Ll/nk00;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->getProfile_pic()Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Landroid/widget/FrameLayout;

    .line 28
    .line 29
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    const/4 v1, 0x0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    invoke-static {p1, v0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 41
    .line 42
    .line 43
    :cond_0
    iget-object p1, p0, Ll/nk00;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->getAttention()Landroid/widget/LinearLayout;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    const/high16 v0, 0x40800000    # 4.0f

    .line 50
    .line 51
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    invoke-static {p1, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Ll/nk00;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    .line 59
    .line 60
    sget v0, Ll/hdc0;->X0:I

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    check-cast p1, Landroid/widget/RelativeLayout;

    .line 67
    .line 68
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    invoke-static {p1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Ll/nk00;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 76
    .line 77
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$l;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    const-wide/16 v0, 0x0

    .line 82
    .line 83
    invoke-virtual {p1, v0, v1}, Landroidx/recyclerview/widget/RecyclerView$l;->setAddDuration(J)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Ll/nk00;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 87
    .line 88
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$l;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {p1, v0, v1}, Landroidx/recyclerview/widget/RecyclerView$l;->setChangeDuration(J)V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Ll/nk00;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 96
    .line 97
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$l;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-virtual {p1, v0, v1}, Landroidx/recyclerview/widget/RecyclerView$l;->setMoveDuration(J)V

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Ll/nk00;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 105
    .line 106
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$l;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {p1, v0, v1}, Landroidx/recyclerview/widget/RecyclerView$l;->setRemoveDuration(J)V

    .line 111
    .line 112
    .line 113
    iget-object p0, p0, Ll/nk00;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 114
    .line 115
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getItemAnimator()Landroidx/recyclerview/widget/RecyclerView$l;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    check-cast p0, Landroidx/recyclerview/widget/v;

    .line 120
    .line 121
    invoke-virtual {p0, v2}, Landroidx/recyclerview/widget/v;->setSupportsChangeAnimations(Z)V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public c0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nk00;->r:Landroid/widget/TextView;

    .line 2
    .line 3
    new-instance v1, Ll/xj00;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/xj00;-><init>(Ll/nk00;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/nk00;->A:Ll/hj00;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/hj00;->R0()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public d0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/nk00;->G:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/nk00;->A:Ll/hj00;

    .line 5
    .line 6
    iget-boolean v0, v0, Ll/hj00;->s:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/nk00;->T()V

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-static {}, Ll/owi;->a()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    new-instance v0, Ll/ck00;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/ck00;-><init>(Ll/nk00;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ll/nk00;->M(Ll/x20;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    invoke-direct {p0}, Ll/nk00;->e0()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final d1(Z)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/nk00;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->getAttention()Landroid/widget/LinearLayout;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Ll/nk00;->A:Ll/hj00;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/hj00;->I0()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    :goto_0
    return-void

    .line 23
    :cond_1
    if-eqz p1, :cond_2

    .line 24
    .line 25
    const-string v0, "like_click"

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_2
    const-string v0, "comment_send"

    .line 29
    .line 30
    :goto_1
    const-string v1, "trigger_time"

    .line 31
    .line 32
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    filled-new-array {v1}, [Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    const-string v2, "e_follow_bubble_guide"

    .line 41
    .line 42
    const-string v3, "p_user_moment_interactions_details_view"

    .line 43
    .line 44
    invoke-static {v2, v3, v1}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Ll/nk00;->K:Ll/dj70;

    .line 48
    .line 49
    iput-object v0, v1, Ll/dj70;->q:Ljava/lang/String;

    .line 50
    .line 51
    iget-object v0, p0, Ll/nk00;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->E(Ll/dj70;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/nk00;->A:Ll/hj00;

    .line 57
    .line 58
    iget-object v0, v0, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 59
    .line 60
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    const-string v1, "\u4ed6"

    .line 65
    .line 66
    if-eqz v0, :cond_3

    .line 67
    .line 68
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 69
    .line 70
    iget-object v2, p0, Ll/nk00;->A:Ll/hj00;

    .line 71
    .line 72
    iget-object v2, v2, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 73
    .line 74
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {v0, v2}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v2

    .line 84
    if-eqz v2, :cond_3

    .line 85
    .line 86
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_3

    .line 91
    .line 92
    const-string v1, "\u5979"

    .line 93
    .line 94
    :cond_3
    const-string v0, "\u4f60\u521a\u521a\u8bc4\u8bba\u4e86"

    .line 95
    .line 96
    const-string v2, "\u5427"

    .line 97
    .line 98
    const-string v3, "\u611f\u5174\u8da3\u5c31\u5173\u6ce8"

    .line 99
    .line 100
    const-string v4, "\u7684\u52a8\u6001\uff0c\u5bf9"

    .line 101
    .line 102
    const-string v5, "\u4f60\u521a\u521a\u8d5e\u4e86"

    .line 103
    .line 104
    if-eqz p1, :cond_4

    .line 105
    .line 106
    new-instance v6, Ljava/lang/StringBuilder;

    .line 107
    .line 108
    invoke-direct {v6, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    goto :goto_2

    .line 134
    :cond_4
    new-instance v6, Ljava/lang/StringBuilder;

    .line 135
    .line 136
    invoke-direct {v6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    :goto_2
    invoke-static {}, Ll/cmg;->K()Z

    .line 162
    .line 163
    .line 164
    move-result v3

    .line 165
    if-eqz v3, :cond_6

    .line 166
    .line 167
    const-string v2, "\u7684\u52a8\u6001\uff0c\u53d1\u9001\u559c\u6b22\u6765\u8868\u8fbe\u5fc3\u610f\u5427"

    .line 168
    .line 169
    if-eqz p1, :cond_5

    .line 170
    .line 171
    new-instance p1, Ljava/lang/StringBuilder;

    .line 172
    .line 173
    invoke-direct {p1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    :goto_3
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    move-object v2, p1

    .line 187
    goto :goto_4

    .line 188
    :cond_5
    new-instance p1, Ljava/lang/StringBuilder;

    .line 189
    .line 190
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    goto :goto_3

    .line 194
    :cond_6
    :goto_4
    new-instance p1, Lcom/p1/mobile/android/ui/bubble/a;

    .line 195
    .line 196
    iget-object v0, p0, Ll/nk00;->F:Lcom/p1/mobile/android/app/Act;

    .line 197
    .line 198
    invoke-direct {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 199
    .line 200
    .line 201
    invoke-virtual {p1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    iget-object v0, p0, Ll/nk00;->F:Lcom/p1/mobile/android/app/Act;

    .line 206
    .line 207
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    sget v1, Ll/k9c0;->n:I

    .line 212
    .line 213
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 214
    .line 215
    .line 216
    move-result v0

    .line 217
    filled-new-array {v0}, [I

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 222
    .line 223
    .line 224
    move-result-object p1

    .line 225
    const/high16 v0, 0x41500000    # 13.0f

    .line 226
    .line 227
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 228
    .line 229
    .line 230
    move-result-object p1

    .line 231
    const/4 v0, 0x1

    .line 232
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->E(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 233
    .line 234
    .line 235
    move-result-object p1

    .line 236
    const-wide/16 v0, 0xbb8

    .line 237
    .line 238
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 239
    .line 240
    .line 241
    move-result-object p1

    .line 242
    sget v0, Ll/qa00;->g:I

    .line 243
    .line 244
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 245
    .line 246
    .line 247
    move-result-object p1

    .line 248
    sget v0, Lcom/p1/mobile/android/ui/bubble/a;->N:I

    .line 249
    .line 250
    sget v1, Lcom/p1/mobile/android/ui/bubble/a;->P:I

    .line 251
    .line 252
    or-int/2addr v0, v1

    .line 253
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 254
    .line 255
    .line 256
    move-result-object p1

    .line 257
    sget v0, Lcom/p1/mobile/android/ui/bubble/a;->P:I

    .line 258
    .line 259
    const/high16 v1, 0x40c00000    # 6.0f

    .line 260
    .line 261
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 262
    .line 263
    .line 264
    move-result v1

    .line 265
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->o(II)Lcom/p1/mobile/android/ui/bubble/a;

    .line 266
    .line 267
    .line 268
    move-result-object p1

    .line 269
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 270
    .line 271
    .line 272
    move-result-object v0

    .line 273
    iget-object v1, p0, Ll/nk00;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    .line 274
    .line 275
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->getAttention()Landroid/widget/LinearLayout;

    .line 276
    .line 277
    .line 278
    move-result-object v1

    .line 279
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/android/ui/bubble/d;->t(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;)Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object p1

    .line 283
    iput-object p1, p0, Ll/nk00;->J:Ljava/lang/String;

    .line 284
    .line 285
    iget-object p0, p0, Ll/nk00;->A:Ll/hj00;

    .line 286
    .line 287
    invoke-virtual {p0}, Ll/hj00;->L1()V

    .line 288
    .line 289
    .line 290
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e1()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/nk00;->N:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/nk00;->t:Lv/VLinear;

    .line 6
    .line 7
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/nk00;->A:Ll/hj00;

    .line 14
    .line 15
    iget-object v0, v0, Ll/hj00;->p:Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, "moments_user_id"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

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
    const-string v1, "e_greet_together"

    .line 28
    .line 29
    const-string v2, "p_user_moment_interactions_details_view"

    .line 30
    .line 31
    invoke-static {v1, v2, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/nk00;->t:Lv/VLinear;

    .line 35
    .line 36
    const/4 v0, 0x1

    .line 37
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public final f0()Ll/pf60;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/pf60<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/cmg;->x0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, ""

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance p0, Ll/pf60;

    .line 10
    .line 11
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-direct {p0, v0, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    iget-object p0, p0, Ll/nk00;->A:Ll/hj00;

    .line 18
    .line 19
    iget-object v0, p0, Ll/hj00;->m:Ljava/lang/String;

    .line 20
    .line 21
    iget-object p0, p0, Ll/hj00;->p:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-eqz v3, :cond_2

    .line 36
    .line 37
    invoke-static {v2, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_1

    .line 42
    .line 43
    new-instance v0, Ll/pf60;

    .line 44
    .line 45
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 46
    .line 47
    invoke-direct {v0, v1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    return-object v0

    .line 51
    :cond_1
    new-instance p0, Ll/pf60;

    .line 52
    .line 53
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 54
    .line 55
    invoke-direct {p0, v0, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    return-object p0

    .line 59
    :cond_2
    invoke-static {v2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    if-eqz p0, :cond_3

    .line 64
    .line 65
    new-instance p0, Ll/pf60;

    .line 66
    .line 67
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 68
    .line 69
    invoke-direct {p0, v0, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    return-object p0

    .line 73
    :cond_3
    new-instance p0, Ll/pf60;

    .line 74
    .line 75
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 76
    .line 77
    invoke-direct {p0, v1, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    return-object p0
.end method

.method public f1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/nk00;->F:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    iget-object p0, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public g0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nk00;->D:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public h0(Ll/pf60;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-boolean p1, p0, Ll/nk00;->O:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Ll/nk00;->O:Z

    .line 8
    .line 9
    iget-object v0, p0, Ll/nk00;->y:Lv/VLinear;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Ll/nk00;->y:Lv/VLinear;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/16 v1, 0x8

    .line 26
    .line 27
    if-ne v0, v1, :cond_2

    .line 28
    .line 29
    :cond_1
    iget-object v0, p0, Ll/nk00;->q:Lv/VImage;

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 32
    .line 33
    .line 34
    :cond_2
    iget-object v0, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 35
    .line 36
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setCursorVisible(Z)V

    .line 37
    .line 38
    .line 39
    iget-boolean v0, p0, Ll/nk00;->M:Z

    .line 40
    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    iput-boolean p1, p0, Ll/nk00;->M:Z

    .line 44
    .line 45
    return-void

    .line 46
    :cond_3
    invoke-virtual {p0, p1, p1}, Ll/nk00;->L(ZZ)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/nk00;->t:Lv/VLinear;

    .line 50
    .line 51
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_4

    .line 56
    .line 57
    iget-object v0, p0, Ll/nk00;->t:Lv/VLinear;

    .line 58
    .line 59
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    :cond_4
    iget-object v0, p0, Ll/nk00;->h:Landroid/view/View;

    .line 63
    .line 64
    invoke-static {}, Ll/cmg;->G()Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-eqz v1, :cond_5

    .line 69
    .line 70
    const/high16 p1, 0x42180000    # 38.0f

    .line 71
    .line 72
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    :cond_5
    invoke-static {v0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Ll/nk00;->y:Lv/VLinear;

    .line 80
    .line 81
    const/4 v0, 0x4

    .line 82
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 83
    .line 84
    .line 85
    invoke-direct {p0}, Ll/nk00;->W()V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public h1(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/nk00;->G:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/nk00;->A:Ll/hj00;

    .line 5
    .line 6
    iget-boolean v0, v0, Ll/hj00;->s:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/nk00;->T()V

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-static {}, Ll/owi;->a()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    new-instance v0, Ll/yj00;

    .line 20
    .line 21
    invoke-direct {v0, p0, p1, p2}, Ll/yj00;-><init>(Ll/nk00;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ll/nk00;->M(Ll/x20;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    invoke-direct {p0, p1, p2}, Ll/nk00;->j1(Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public i0(Ll/pf60;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, v0, v1}, Ll/nk00;->L(ZZ)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/cmg;->G()Z

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    iget-object v2, p0, Ll/nk00;->A:Ll/hj00;

    .line 13
    .line 14
    invoke-virtual {v2}, Ll/hj00;->S0()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    iget-object v2, p0, Ll/nk00;->A:Ll/hj00;

    .line 21
    .line 22
    iget-object v2, v2, Ll/hj00;->p:Ljava/lang/String;

    .line 23
    .line 24
    const-string v3, "moments_user_id"

    .line 25
    .line 26
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    filled-new-array {v2}, [Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    const-string v3, "e_greet_together"

    .line 35
    .line 36
    const-string v4, "p_user_moment_interactions_details_view"

    .line 37
    .line 38
    invoke-static {v3, v4, v2}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 39
    .line 40
    .line 41
    iget-object v2, p0, Ll/nk00;->t:Lv/VLinear;

    .line 42
    .line 43
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    :cond_0
    iput-boolean v0, p0, Ll/nk00;->O:Z

    .line 47
    .line 48
    iget-object v2, p0, Ll/nk00;->h:Landroid/view/View;

    .line 49
    .line 50
    iget-object v3, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 51
    .line 52
    check-cast v3, Ljava/lang/Integer;

    .line 53
    .line 54
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    invoke-static {}, Ll/cmg;->G()Z

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    if-eqz v4, :cond_1

    .line 63
    .line 64
    const/high16 v4, 0x42480000    # 50.0f

    .line 65
    .line 66
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    goto :goto_0

    .line 71
    :cond_1
    move v4, v1

    .line 72
    :goto_0
    add-int/2addr v3, v4

    .line 73
    invoke-static {v2, v3}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 74
    .line 75
    .line 76
    iget-object v2, p0, Ll/nk00;->q:Lv/VImage;

    .line 77
    .line 78
    invoke-virtual {v2, v1}, Landroid/view/View;->setSelected(Z)V

    .line 79
    .line 80
    .line 81
    iget-object v1, p0, Ll/nk00;->F:Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    iget-object v2, p0, Ll/nk00;->P:Ljava/lang/Runnable;

    .line 84
    .line 85
    const-wide/16 v3, 0x190

    .line 86
    .line 87
    invoke-static {v1, v2, v3, v4}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 88
    .line 89
    .line 90
    iget-object v1, p0, Ll/nk00;->y:Lv/VLinear;

    .line 91
    .line 92
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 97
    .line 98
    iget-object v2, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 99
    .line 100
    check-cast v2, Ljava/lang/Integer;

    .line 101
    .line 102
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    if-ne v1, v2, :cond_2

    .line 107
    .line 108
    return-void

    .line 109
    :cond_2
    iput-boolean v0, p0, Ll/nk00;->Q:Z

    .line 110
    .line 111
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 112
    .line 113
    check-cast p1, Ljava/lang/Integer;

    .line 114
    .line 115
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 116
    .line 117
    .line 118
    move-result p1

    .line 119
    invoke-virtual {p0, p1}, Ll/nk00;->k1(I)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/hj00;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/nk00;->N(Ll/hj00;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nk00;->K(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Ll/nk00;->C:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 6
    .line 7
    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    sget v0, Ll/k9c0;->p0:I

    .line 12
    .line 13
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 18
    .line 19
    .line 20
    iget-object p2, p0, Ll/nk00;->C:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/p1/mobile/android/app/Act;->keyboardListenerObservable(Landroid/view/View;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    iget-object v0, p0, Ll/nk00;->L:Ll/y20;

    .line 31
    .line 32
    invoke-virtual {p2, v0}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    iget-object p2, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 36
    .line 37
    iget-object v0, p0, Ll/nk00;->C:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 38
    .line 39
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    sget v1, Ll/k9c0;->q:I

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setHintTextColor(I)V

    .line 50
    .line 51
    .line 52
    iget-object p2, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 53
    .line 54
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->D:I

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 65
    .line 66
    .line 67
    invoke-static {}, Ll/owi;->a()Z

    .line 68
    .line 69
    .line 70
    move-result p2

    .line 71
    const/4 v0, 0x0

    .line 72
    if-nez p2, :cond_0

    .line 73
    .line 74
    iget-object p2, p0, Ll/nk00;->A:Ll/hj00;

    .line 75
    .line 76
    iget-boolean p2, p2, Ll/hj00;->q:Z

    .line 77
    .line 78
    if-eqz p2, :cond_1

    .line 79
    .line 80
    :cond_0
    iget-object p2, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 81
    .line 82
    invoke-virtual {p2}, Landroid/widget/TextView;->getInputType()I

    .line 83
    .line 84
    .line 85
    move-result p2

    .line 86
    iput p2, p0, Ll/nk00;->H:I

    .line 87
    .line 88
    iget-object p2, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 89
    .line 90
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setInputType(I)V

    .line 91
    .line 92
    .line 93
    :cond_1
    iget-object p2, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 94
    .line 95
    new-instance v1, Ll/ek00;

    .line 96
    .line 97
    invoke-direct {v1, p0}, Ll/ek00;-><init>(Ll/nk00;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p2, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 101
    .line 102
    .line 103
    iget-object p2, p0, Ll/nk00;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 104
    .line 105
    invoke-static {}, Ll/bnl0;->w0()I

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;->setMaxHeight(I)V

    .line 110
    .line 111
    .line 112
    iget-object p2, p0, Ll/nk00;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;

    .line 113
    .line 114
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedWithTwoRecyclerNestedScrollView;->setFirstRecyclerUserIntegerMaxHeight(Z)V

    .line 115
    .line 116
    .line 117
    iget-object p2, p0, Ll/nk00;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 118
    .line 119
    const/4 v0, 0x2

    .line 120
    invoke-virtual {p2, v0}, Landroid/view/View;->setOverScrollMode(I)V

    .line 121
    .line 122
    .line 123
    invoke-static {}, Ll/cmg;->z()Z

    .line 124
    .line 125
    .line 126
    move-result p2

    .line 127
    if-eqz p2, :cond_2

    .line 128
    .line 129
    invoke-virtual {p0}, Ll/nk00;->Z()V

    .line 130
    .line 131
    .line 132
    :cond_2
    iget-object p2, p0, Ll/nk00;->q:Lv/VImage;

    .line 133
    .line 134
    invoke-static {}, Ll/cmg;->z()Z

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 139
    .line 140
    .line 141
    invoke-static {}, Ll/cmg;->z()Z

    .line 142
    .line 143
    .line 144
    move-result p2

    .line 145
    if-nez p2, :cond_3

    .line 146
    .line 147
    iget-object p2, p0, Ll/nk00;->r:Landroid/widget/TextView;

    .line 148
    .line 149
    const/4 v0, 0x0

    .line 150
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 151
    .line 152
    .line 153
    iget-object p2, p0, Ll/nk00;->r:Landroid/widget/TextView;

    .line 154
    .line 155
    iget-object v0, p0, Ll/nk00;->F:Lcom/p1/mobile/android/app/Act;

    .line 156
    .line 157
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    sget v1, Ll/k9c0;->J:I

    .line 162
    .line 163
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 168
    .line 169
    .line 170
    :cond_3
    invoke-static {}, Ll/cmg;->G()Z

    .line 171
    .line 172
    .line 173
    move-result p2

    .line 174
    if-eqz p2, :cond_5

    .line 175
    .line 176
    iget-object p2, p0, Ll/nk00;->u:Lv/VImage;

    .line 177
    .line 178
    iget-object v0, p0, Ll/nk00;->A:Ll/hj00;

    .line 179
    .line 180
    invoke-virtual {v0}, Ll/hj00;->F1()Z

    .line 181
    .line 182
    .line 183
    move-result v0

    .line 184
    xor-int/lit8 v0, v0, 0x1

    .line 185
    .line 186
    invoke-virtual {p2, v0}, Landroid/view/View;->setSelected(Z)V

    .line 187
    .line 188
    .line 189
    iget-object p2, p0, Ll/nk00;->v:Lv/VText;

    .line 190
    .line 191
    iget-object v0, p0, Ll/nk00;->u:Lv/VImage;

    .line 192
    .line 193
    invoke-virtual {v0}, Landroid/view/View;->isSelected()Z

    .line 194
    .line 195
    .line 196
    move-result v0

    .line 197
    if-eqz v0, :cond_4

    .line 198
    .line 199
    const-string v0, "#cc000000"

    .line 200
    .line 201
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 202
    .line 203
    .line 204
    move-result v0

    .line 205
    goto :goto_0

    .line 206
    :cond_4
    const-string v0, "#33000000"

    .line 207
    .line 208
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 209
    .line 210
    .line 211
    move-result v0

    .line 212
    :goto_0
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 213
    .line 214
    .line 215
    iget-object p2, p0, Ll/nk00;->u:Lv/VImage;

    .line 216
    .line 217
    new-instance v0, Ll/gk00;

    .line 218
    .line 219
    invoke-direct {v0, p0}, Ll/gk00;-><init>(Ll/nk00;)V

    .line 220
    .line 221
    .line 222
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 223
    .line 224
    .line 225
    :cond_5
    return-object p1
.end method

.method public final synthetic j0(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Ll/nk00;->N0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic k0(Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 p1, 0x0

    .line 26
    :goto_0
    invoke-static {}, Ll/cmg;->z()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iget-object p0, p0, Ll/nk00;->r:Landroid/widget/TextView;

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final k1(I)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    iget-object p1, p0, Ll/nk00;->y:Lv/VLinear;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 11
    .line 12
    filled-new-array {p1, v0}, [I

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Ll/nk00;->R:Landroid/animation/ValueAnimator;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    filled-new-array {v0, p1}, [I

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Ll/nk00;->R:Landroid/animation/ValueAnimator;

    .line 32
    .line 33
    :goto_0
    iget-object p1, p0, Ll/nk00;->R:Landroid/animation/ValueAnimator;

    .line 34
    .line 35
    const-wide/16 v0, 0x96

    .line 36
    .line 37
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/nk00;->R:Landroid/animation/ValueAnimator;

    .line 41
    .line 42
    new-instance v0, Ll/xjg;

    .line 43
    .line 44
    invoke-direct {v0}, Ll/xjg;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ll/nk00;->R:Landroid/animation/ValueAnimator;

    .line 51
    .line 52
    new-instance v0, Ll/ij00;

    .line 53
    .line 54
    invoke-direct {v0, p0}, Ll/ij00;-><init>(Ll/nk00;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Ll/nk00;->R:Landroid/animation/ValueAnimator;

    .line 61
    .line 62
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public final synthetic l0()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/nk00;->g1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 2
    .line 3
    iget v1, p0, Ll/nk00;->H:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setInputType(I)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Ll/nk00;->O()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic n0(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 p2, 0x0

    .line 6
    const/4 v0, 0x1

    .line 7
    if-ne p1, v0, :cond_3

    .line 8
    .line 9
    iget-object p1, p0, Ll/nk00;->A:Ll/hj00;

    .line 10
    .line 11
    iget-boolean v1, p1, Ll/hj00;->q:Z

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->d3:I

    .line 16
    .line 17
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 18
    .line 19
    .line 20
    return p2

    .line 21
    :cond_0
    iget-boolean p1, p1, Ll/hj00;->s:Z

    .line 22
    .line 23
    if-nez p1, :cond_2

    .line 24
    .line 25
    iget-object p1, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_2

    .line 36
    .line 37
    invoke-static {}, Ll/owi;->a()Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    new-instance p1, Ll/oj00;

    .line 44
    .line 45
    invoke-direct {p1, p0}, Ll/oj00;-><init>(Ll/nk00;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, p1}, Ll/nk00;->M(Ll/x20;)V

    .line 49
    .line 50
    .line 51
    return p2

    .line 52
    :cond_1
    invoke-direct {p0}, Ll/nk00;->O()V

    .line 53
    .line 54
    .line 55
    :cond_2
    iget-boolean p1, p0, Ll/nk00;->O:Z

    .line 56
    .line 57
    if-nez p1, :cond_3

    .line 58
    .line 59
    iget-object p1, p0, Ll/nk00;->A:Ll/hj00;

    .line 60
    .line 61
    iget-object v1, p1, Ll/hj00;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 62
    .line 63
    iget-object p1, p1, Ll/hj00;->j:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {v1, p1}, Ll/y3i;->a(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    :cond_3
    invoke-static {}, Ll/cmg;->z()Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-eqz p1, :cond_4

    .line 73
    .line 74
    iget-object p0, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 75
    .line 76
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setCursorVisible(Z)V

    .line 77
    .line 78
    .line 79
    :cond_4
    return p2
.end method

.method public final synthetic o0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/nk00;->u:Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    xor-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/nk00;->v:Lv/VText;

    .line 13
    .line 14
    iget-object p0, p0, Ll/nk00;->u:Lv/VImage;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    const-string p0, "#cc000000"

    .line 23
    .line 24
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const-string p0, "#33000000"

    .line 30
    .line 31
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    :goto_0
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic p0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/nk00;->d1(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic q0(Landroid/view/View;Lv/VImage;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/nk00;->w:Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->setImageViewSelected(I)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-interface {p2, p1, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->c9(Landroid/view/View;I)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/nk00;->q:Lv/VImage;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic r0(Landroid/view/View;Lv/VImage;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/nk00;->w:Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->setImageViewSelected(I)V

    .line 5
    .line 6
    .line 7
    const-string p2, "e_comment_gif"

    .line 8
    .line 9
    const-string v0, "p_user_moment_interactions_details_view"

    .line 10
    .line 11
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    const/4 v0, 0x2

    .line 19
    invoke-interface {p2, p1, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->c9(Landroid/view/View;I)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/nk00;->q:Lv/VImage;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic s0(Lcom/p1/mobile/putong/data/Media;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/nk00;->S:Landroid/view/View;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-interface {v0, p0, v1, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->p7(Landroid/view/View;Ljava/lang/Object;Lcom/p1/mobile/putong/data/Media;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic t0()V
    .locals 3

    .line 1
    const-string v0, "e_comment_picture"

    .line 2
    .line 3
    const-string v1, "p_user_moment_interactions_details_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/nk00;->s:Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;

    .line 9
    .line 10
    iget-object v1, p0, Ll/nk00;->F:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    new-instance v2, Ll/pj00;

    .line 13
    .line 14
    invoke-direct {v2, p0}, Ll/pj00;-><init>(Ll/nk00;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->a0(Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic u0(Landroid/view/View;Lv/VImage;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/view/View;->isSelected()Z

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
    iget-object v0, p0, Ll/nk00;->w:Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;

    .line 9
    .line 10
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->setImageViewSelected(Lv/VImage;)V

    .line 11
    .line 12
    .line 13
    iget-object p2, p0, Ll/nk00;->y:Lv/VLinear;

    .line 14
    .line 15
    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-nez p2, :cond_1

    .line 20
    .line 21
    iget-object p2, p0, Ll/nk00;->y:Lv/VLinear;

    .line 22
    .line 23
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    iget p2, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 28
    .line 29
    if-nez p2, :cond_2

    .line 30
    .line 31
    :cond_1
    iget-object p0, p0, Ll/nk00;->q:Lv/VImage;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 34
    .line 35
    .line 36
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const/4 p2, 0x1

    .line 41
    invoke-interface {p0, p1, p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->c9(Landroid/view/View;I)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic v0(Landroid/view/View;Lv/VImage;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Landroid/view/View;->isSelected()Z

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
    const-string v0, "e_comment_gif"

    .line 9
    .line 10
    const-string v1, "p_user_moment_interactions_details_view"

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/nk00;->w:Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;

    .line 16
    .line 17
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->setImageViewSelected(Lv/VImage;)V

    .line 18
    .line 19
    .line 20
    iget-object p2, p0, Ll/nk00;->y:Lv/VLinear;

    .line 21
    .line 22
    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-nez p2, :cond_1

    .line 27
    .line 28
    iget-object p2, p0, Ll/nk00;->y:Lv/VLinear;

    .line 29
    .line 30
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    iget p2, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 35
    .line 36
    if-nez p2, :cond_2

    .line 37
    .line 38
    :cond_1
    iget-object p0, p0, Ll/nk00;->q:Lv/VImage;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 41
    .line 42
    .line 43
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const/4 p2, 0x2

    .line 48
    invoke-interface {p0, p1, p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->c9(Landroid/view/View;I)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final synthetic w0(Lcom/p1/mobile/putong/data/Media;)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/nk00;->U:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Ll/nk00;->U:Z

    .line 7
    .line 8
    iget-object v0, p0, Ll/nk00;->C:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailFrag;

    .line 9
    .line 10
    new-instance v1, Ll/ak00;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/ak00;-><init>(Ll/nk00;)V

    .line 13
    .line 14
    .line 15
    const-wide/16 v2, 0xfa

    .line 16
    .line 17
    invoke-static {v0, v1, v2, v3}, Ll/l51;->I(Lcom/p1/mobile/android/app/Frag;Ljava/lang/Runnable;J)V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object p0, p0, Ll/nk00;->S:Landroid/view/View;

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-interface {v0, p0, v1, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->p7(Landroid/view/View;Ljava/lang/Object;Lcom/p1/mobile/putong/data/Media;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic x0()V
    .locals 3

    .line 1
    const-string v0, "e_comment_picture"

    .line 2
    .line 3
    const-string v1, "p_user_moment_interactions_details_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Ll/nk00;->N:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Ll/nk00;->U:Z

    .line 11
    .line 12
    iget-object v0, p0, Ll/nk00;->w:Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;

    .line 13
    .line 14
    iget-object v1, p0, Ll/nk00;->F:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    new-instance v2, Ll/wj00;

    .line 17
    .line 18
    invoke-direct {v2, p0}, Ll/wj00;-><init>(Ll/nk00;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedItemCommendBotEmojiView;->a0(Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic y0(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput-boolean v0, p0, Ll/nk00;->T:Z

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Ll/nk00;->r:Landroid/widget/TextView;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object p0, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    xor-int/2addr p0, v1

    .line 35
    invoke-static {v0, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic z0(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p1, p0, Ll/nk00;->q:Lv/VImage;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/nk00;->q:Lv/VImage;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object p1, p0, Ll/nk00;->P:Ljava/lang/Runnable;

    .line 19
    .line 20
    invoke-static {p1}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/nk00;->q:Lv/VImage;

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/nk00;->y:Lv/VLinear;

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    const/16 v1, 0x8

    .line 36
    .line 37
    if-eq p1, v1, :cond_2

    .line 38
    .line 39
    iget-object p1, p0, Ll/nk00;->y:Lv/VLinear;

    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 46
    .line 47
    if-nez p1, :cond_1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    iput-boolean v0, p0, Ll/nk00;->M:Z

    .line 51
    .line 52
    goto/16 :goto_1

    .line 53
    .line 54
    :cond_2
    :goto_0
    const/4 p1, 0x0

    .line 55
    invoke-virtual {p0, v0, p1}, Ll/nk00;->L(ZZ)V

    .line 56
    .line 57
    .line 58
    invoke-static {}, Ll/cmg;->G()Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    const-string v2, "p_user_moment_interactions_details_view"

    .line 63
    .line 64
    if-eqz v1, :cond_3

    .line 65
    .line 66
    iget-object v1, p0, Ll/nk00;->A:Ll/hj00;

    .line 67
    .line 68
    invoke-virtual {v1}, Ll/hj00;->S0()Z

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    if-eqz v1, :cond_3

    .line 73
    .line 74
    iget-object v1, p0, Ll/nk00;->A:Ll/hj00;

    .line 75
    .line 76
    iget-object v1, v1, Ll/hj00;->p:Ljava/lang/String;

    .line 77
    .line 78
    const-string v3, "moments_user_id"

    .line 79
    .line 80
    invoke-static {v3, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    filled-new-array {v1}, [Ll/pf60;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    const-string v3, "e_greet_together"

    .line 89
    .line 90
    invoke-static {v3, v2, v1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 91
    .line 92
    .line 93
    iget-object v1, p0, Ll/nk00;->t:Lv/VLinear;

    .line 94
    .line 95
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 96
    .line 97
    .line 98
    :cond_3
    const-string v1, "e_emoji_comment"

    .line 99
    .line 100
    invoke-static {v1, v2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    iget-object v1, p0, Ll/nk00;->y:Lv/VLinear;

    .line 104
    .line 105
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 106
    .line 107
    .line 108
    sget-object v1, Lcom/p1/mobile/android/app/Act;->savedKeyboardHeight:Ll/vxd0;

    .line 109
    .line 110
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    check-cast v1, Ljava/lang/Integer;

    .line 115
    .line 116
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    sget-object v2, Lcom/p1/mobile/android/app/Act;->savedKeyboardHeight:Ll/vxd0;

    .line 121
    .line 122
    invoke-virtual {v2}, Ll/vxd0;->defaultValue()Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    check-cast v2, Ljava/lang/Integer;

    .line 127
    .line 128
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 129
    .line 130
    .line 131
    move-result v2

    .line 132
    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    invoke-virtual {p0, v1}, Ll/nk00;->k1(I)V

    .line 137
    .line 138
    .line 139
    iget-object v1, p0, Ll/nk00;->h:Landroid/view/View;

    .line 140
    .line 141
    sget-object v2, Lcom/p1/mobile/android/app/Act;->savedKeyboardHeight:Ll/vxd0;

    .line 142
    .line 143
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    check-cast v2, Ljava/lang/Integer;

    .line 148
    .line 149
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 150
    .line 151
    .line 152
    move-result v2

    .line 153
    sget-object v3, Lcom/p1/mobile/android/app/Act;->savedKeyboardHeight:Ll/vxd0;

    .line 154
    .line 155
    invoke-virtual {v3}, Ll/vxd0;->defaultValue()Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object v3

    .line 159
    check-cast v3, Ljava/lang/Integer;

    .line 160
    .line 161
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 162
    .line 163
    .line 164
    move-result v3

    .line 165
    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    .line 166
    .line 167
    .line 168
    move-result v2

    .line 169
    invoke-static {}, Ll/cmg;->G()Z

    .line 170
    .line 171
    .line 172
    move-result v3

    .line 173
    if-eqz v3, :cond_4

    .line 174
    .line 175
    const/high16 p1, 0x42480000    # 50.0f

    .line 176
    .line 177
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 178
    .line 179
    .line 180
    move-result p1

    .line 181
    :cond_4
    add-int/2addr v2, p1

    .line 182
    invoke-static {v1, v2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 183
    .line 184
    .line 185
    :goto_1
    iget-object p1, p0, Ll/nk00;->y:Lv/VLinear;

    .line 186
    .line 187
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 188
    .line 189
    .line 190
    iget-object p1, p0, Ll/nk00;->F:Lcom/p1/mobile/android/app/Act;

    .line 191
    .line 192
    iget-object p0, p0, Ll/nk00;->p:Lcom/p1/mobile/putong/newui/view/MessageInputEditView;

    .line 193
    .line 194
    invoke-static {p1, p0}, Ll/nk00;->X(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    .line 195
    .line 196
    .line 197
    return-void
.end method
