.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Ll/y0m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;",
        ">;",
        "Ll/y0m;"
    }
.end annotation


# static fields
.field public static X:I


# instance fields
.field public A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

.field public B:Landroid/widget/FrameLayout;

.field public C:Landroid/widget/FrameLayout;

.field public D:I

.field public E:Ll/r4h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/r4h<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation
.end field

.field public F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

.field public G:Ll/xl80;

.field public H:Landroidx/recyclerview/widget/LinearLayoutManager;

.field public I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

.field public J:Lcom/p1/mobile/putong/data/MessageLocation;

.field public K:Ljava/lang/String;

.field public L:Z

.field public M:I

.field public N:Lcom/p1/mobile/putong/feed/data/NewMomentDraft;

.field public O:Ll/jbj0;

.field public P:Ll/d8j0;

.field public Q:Z

.field public R:Z

.field public S:Ll/ath;

.field public T:Ll/mu4;

.field public U:Ll/iog;

.field public V:Ll/trg;

.field public W:Ll/jxd0;

.field public a:Lv/VLinear;

.field public b:Lv/VImage;

.field public c:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/FrameLayout;

.field public f:Lv/VScroll;

.field public g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

.field public h:Landroid/widget/LinearLayout;

.field public i:Landroid/view/View;

.field public j:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/FeedPostMediaRecyclerView;

.field public k:Landroid/widget/RelativeLayout;

.field public l:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

.field public m:Lv/VImage;

.field public n:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;

.field public o:Lorg/apmem/tools/layouts/FlowLayout;

.field public p:Lv/VLinear;

.field public q:Lv/VImage;

.field public r:Lv/VText;

.field public s:Lv/VImage;

.field public t:Lv/VLinear;

.field public u:Lv/VImage;

.field public v:Lv/VText;

.field public w:Lv/VImage;

.field public x:Landroid/widget/RelativeLayout;

.field public y:Lv/VCheckBox;

.field public z:Lv/VText;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x43910000    # 290.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->X:I

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->X:I

    .line 5
    .line 6
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->D:I

    .line 7
    .line 8
    const/16 v0, 0x5dc

    .line 9
    .line 10
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->M:I

    .line 11
    .line 12
    new-instance v0, Ll/jxd0;

    .line 13
    .line 14
    new-instance v1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v2, "has_show_post_moment_long_click_tip"

    .line 17
    .line 18
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    sget-object v2, Ll/uqb0;->b0:Ll/sre0;

    .line 22
    .line 23
    iget-object v2, v2, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 24
    .line 25
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 37
    .line 38
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->W:Ll/jxd0;

    .line 42
    .line 43
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 44
    .line 45
    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->e1(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->P0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->R0(Landroid/view/View;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g1(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->h1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 1
    new-instance p0, Ll/pf60;

    .line 2
    .line 3
    const-string v0, "selection_situation"

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-direct {p0, v0, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    filled-new-array {p0}, [Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string p1, "e_allow_forwarding"

    .line 17
    .line 18
    const-string v0, "p_moment_post"

    .line 19
    .line 20
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->L0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->d1(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic J(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->j1(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic K(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->O0()V

    return-void
.end method

.method public static synthetic L(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->a1()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method private synthetic L0(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 2
    .line 3
    iget-boolean p1, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->w:Z

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "poitagshow"

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    filled-new-array {p1}, [Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const-string v0, "e_poi_tag"

    .line 20
    .line 21
    const-string v1, "p_moment_post"

    .line 22
    .line 23
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->p1()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private L1(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->D:I

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eq v0, v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->D:I

    .line 20
    .line 21
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->setAlbumHeight(Ljava/lang/Integer;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic M(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;ZLcom/p1/mobile/putong/feed/data/NotifyUsers;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->n1(ZLcom/p1/mobile/putong/feed/data/NotifyUsers;)V

    return-void
.end method

.method private synthetic M0(Landroid/view/View;)V
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
    new-instance v0, Ll/ld40;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/ld40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static synthetic N(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->k1(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic O(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->o1()V

    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->N0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;Ljava/lang/String;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->f1(Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method

.method public static bridge synthetic R(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)Ll/xl80;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->G:Ll/xl80;

    return-object p0
.end method

.method public static bridge synthetic S(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->R:Z

    return p0
.end method

.method public static bridge synthetic T(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)Ll/iog;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->U:Ll/iog;

    return-object p0
.end method

.method public static bridge synthetic U(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)Ll/d8j0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->P:Ll/d8j0;

    return-object p0
.end method

.method private synthetic U0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->onBackPressed()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static bridge synthetic V(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    return-object p0
.end method

.method private synthetic V0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->d2()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static bridge synthetic W(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->R:Z

    return-void
.end method

.method public static bridge synthetic X(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->O1(Z)V

    return-void
.end method

.method public static bridge synthetic Y(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;Landroidx/recyclerview/widget/RecyclerView$e0;IZ)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->Z1(Landroidx/recyclerview/widget/RecyclerView$e0;IZ)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;Ljava/lang/Boolean;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->B1(Ljava/lang/Boolean;Ljava/lang/Integer;)V

    return-void
.end method

.method private b0()V
    .locals 2

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/k;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$c;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$c;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/k;-><init>(Landroidx/recyclerview/widget/k$e;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->j:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/FeedPostMediaRecyclerView;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/k;->g(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->S1()V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->K0(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->p1()V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;Lcom/p1/mobile/putong/data/Audio;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->r1(Lcom/p1/mobile/putong/data/Audio;)V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->W0()V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/feed/data/TopicMoment;Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->l1()V

    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->V0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->J0()V

    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->Y0()V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->M0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->S0()V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I0()V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->Z0()V

    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->U0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->T0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic x(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->m1()V

    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->X0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p9}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->Q0(Landroid/view/View;IIIIIIII)V

    return-void
.end method


# virtual methods
.method public A0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/Act;->savedKeyboardHeight:Ll/vxd0;

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
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/high16 v1, 0x435c0000    # 220.0f

    .line 16
    .line 17
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eq v0, v1, :cond_0

    .line 22
    .line 23
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->D:I

    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public A1(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 13
    .line 14
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Audio;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    check-cast p1, Lcom/p1/mobile/putong/data/Audio;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->r1(Lcom/p1/mobile/putong/data/Audio;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public final B0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/ge40;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/ge40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final B1(Ljava/lang/Boolean;Ljava/lang/Integer;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->Q:Z

    .line 6
    .line 7
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->L1(Ljava/lang/Integer;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->t1(Ljava/lang/Boolean;)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/cmg;->p0()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->O:Ll/jbj0;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->O:Ll/jbj0;

    .line 34
    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    invoke-virtual {v1, v0}, Ll/jbj0;->G(I)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    invoke-virtual {v1}, Ll/jbj0;->m()V

    .line 46
    .line 47
    .line 48
    :cond_1
    :goto_0
    invoke-static {}, Ll/cmg;->x()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->T:Ll/mu4;

    .line 55
    .line 56
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->T:Ll/mu4;

    .line 67
    .line 68
    if-eqz p1, :cond_2

    .line 69
    .line 70
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    invoke-virtual {p0, p1}, Ll/mu4;->r(I)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_2
    invoke-virtual {p0}, Ll/mu4;->h()V

    .line 79
    .line 80
    .line 81
    :cond_3
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public C1(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->u1(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public D0(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->k0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->Q1()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->G1()V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/j4h;->h()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    const/4 v0, 0x0

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->b:Lv/VImage;

    .line 18
    .line 19
    sget v1, Ll/lbc0;->J3:I

    .line 20
    .line 21
    invoke-virtual {p1, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    sget v1, Ll/lbc0;->O3:I

    .line 31
    .line 32
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    invoke-virtual {p1, v0, v0, v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->d:Landroid/widget/TextView;

    .line 48
    .line 49
    const/4 v2, 0x0

    .line 50
    invoke-virtual {v1, v2, v2, p1, v2}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->d:Landroid/widget/TextView;

    .line 54
    .line 55
    const/high16 v1, 0x40000000    # 2.0f

    .line 56
    .line 57
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 65
    .line 66
    invoke-static {p1}, Ll/wpe;->a(Lv/VEditText;)V

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 72
    .line 73
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    sget v2, Ll/k9c0;->h:I

    .line 78
    .line 79
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setHintTextColor(I)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 87
    .line 88
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    sget v2, Ll/k9c0;->g:I

    .line 95
    .line 96
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 101
    .line 102
    .line 103
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->b:Lv/VImage;

    .line 104
    .line 105
    new-instance v1, Ll/od40;

    .line 106
    .line 107
    invoke-direct {v1, p0}, Ll/od40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 108
    .line 109
    .line 110
    invoke-static {p1, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 111
    .line 112
    .line 113
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->d:Landroid/widget/TextView;

    .line 114
    .line 115
    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 116
    .line 117
    .line 118
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->d:Landroid/widget/TextView;

    .line 119
    .line 120
    new-instance v0, Ll/pd40;

    .line 121
    .line 122
    invoke-direct {v0, p0}, Ll/pd40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 123
    .line 124
    .line 125
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 126
    .line 127
    .line 128
    invoke-static {}, Ll/cmg;->u0()Z

    .line 129
    .line 130
    .line 131
    move-result p1

    .line 132
    if-eqz p1, :cond_1

    .line 133
    .line 134
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->c:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;

    .line 135
    .line 136
    const/4 v0, 0x1

    .line 137
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 138
    .line 139
    .line 140
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->c:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;

    .line 141
    .line 142
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 143
    .line 144
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;->R(Lcom/p1/mobile/android/app/Act;)V

    .line 145
    .line 146
    .line 147
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 148
    .line 149
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->d1()V

    .line 150
    .line 151
    .line 152
    :cond_1
    return-void
.end method

.method public final E0()V
    .locals 3

    .line 1
    invoke-static {}, Ll/ksg;->m0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->B0()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 11
    .line 12
    new-instance v1, Ll/sd40;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/sd40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->K0(Ll/x20;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->m:Lv/VImage;

    .line 21
    .line 22
    new-instance v1, Ll/td40;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/td40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    invoke-static {}, Ll/cmg;->p0()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    new-instance v0, Ll/jbj0;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 39
    .line 40
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->B:Landroid/widget/FrameLayout;

    .line 41
    .line 42
    invoke-direct {v0, v1, v2}, Ll/jbj0;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/widget/FrameLayout;)V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->O:Ll/jbj0;

    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;

    .line 50
    .line 51
    new-instance v1, Ll/ud40;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/ud40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->setAddTopicClickHooker(Ll/x20;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->O:Ll/jbj0;

    .line 60
    .line 61
    new-instance v1, Ll/vd40;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/vd40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v1}, Ll/jbj0;->B(Ll/x20;)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->O:Ll/jbj0;

    .line 70
    .line 71
    new-instance v1, Ll/wd40;

    .line 72
    .line 73
    invoke-direct {v1, p0}, Ll/wd40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, v1}, Ll/jbj0;->A(Ll/pcj;)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->O:Ll/jbj0;

    .line 80
    .line 81
    new-instance v1, Ll/xd40;

    .line 82
    .line 83
    invoke-direct {v1, p0}, Ll/xd40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ll/jbj0;->C(Ll/y20;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->O:Ll/jbj0;

    .line 90
    .line 91
    new-instance v1, Ll/yd40;

    .line 92
    .line 93
    invoke-direct {v1, p0}, Ll/yd40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0, v1}, Ll/jbj0;->E(Ll/y20;)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->O:Ll/jbj0;

    .line 100
    .line 101
    new-instance v1, Ll/zd40;

    .line 102
    .line 103
    invoke-direct {v1, p0}, Ll/zd40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v0, v1}, Ll/jbj0;->D(Ll/z20;)V

    .line 107
    .line 108
    .line 109
    new-instance v0, Ll/d8j0;

    .line 110
    .line 111
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 112
    .line 113
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->O:Ll/jbj0;

    .line 114
    .line 115
    invoke-direct {v0, v1, v2}, Ll/d8j0;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;Ll/jbj0;)V

    .line 116
    .line 117
    .line 118
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->P:Ll/d8j0;

    .line 119
    .line 120
    :cond_1
    invoke-static {}, Ll/cmg;->x()Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-eqz v0, :cond_2

    .line 125
    .line 126
    new-instance v0, Ll/mu4;

    .line 127
    .line 128
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 129
    .line 130
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->C:Landroid/widget/FrameLayout;

    .line 131
    .line 132
    invoke-direct {v0, v1, v2}, Ll/mu4;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/widget/FrameLayout;)V

    .line 133
    .line 134
    .line 135
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->T:Ll/mu4;

    .line 136
    .line 137
    new-instance v1, Ll/ae40;

    .line 138
    .line 139
    invoke-direct {v1, p0}, Ll/ae40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v0, v1}, Ll/mu4;->p(Ll/y20;)V

    .line 143
    .line 144
    .line 145
    new-instance v0, Ll/iog;

    .line 146
    .line 147
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->T:Ll/mu4;

    .line 148
    .line 149
    invoke-direct {v0, v1}, Ll/iog;-><init>(Ll/mu4;)V

    .line 150
    .line 151
    .line 152
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->U:Ll/iog;

    .line 153
    .line 154
    :cond_2
    return-void
.end method

.method public final E1(Lcom/p1/mobile/putong/feed/data/NewMomentDraft;)V
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->images:Ljava/util/List;

    .line 2
    .line 3
    check-cast v0, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    instance-of v1, v1, Lcom/p1/mobile/putong/data/Audio;

    .line 17
    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    const/high16 v2, -0x40800000    # -1.0f

    .line 22
    .line 23
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->v0(FF)V

    .line 24
    .line 25
    .line 26
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    new-instance v2, Ll/rd40;

    .line 31
    .line 32
    invoke-direct {v2, p0}, Ll/rd40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 33
    .line 34
    .line 35
    const-wide/16 v3, 0x1f4

    .line 36
    .line 37
    invoke-static {v1, v2, v3, v4}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 38
    .line 39
    .line 40
    :cond_0
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->z1(Ljava/util/ArrayList;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->d:Lrx/subjects/a;

    .line 46
    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->images:Ljava/util/List;

    .line 48
    .line 49
    check-cast p1, Ljava/util/ArrayList;

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public F1(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->o1(Ljava/util/ArrayList;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance p1, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->G:Ll/xl80;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_6

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->G:Ll/xl80;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ll/xl80;->H(Ljava/util/ArrayList;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->W:Ll/jxd0;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Ljava/lang/Boolean;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    const/4 v1, 0x2

    .line 40
    if-nez v0, :cond_1

    .line 41
    .line 42
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-lt v0, v1, :cond_1

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->W:Ll/jxd0;

    .line 55
    .line 56
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 57
    .line 58
    invoke-virtual {v0, v2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->U1()V

    .line 62
    .line 63
    .line 64
    :cond_1
    if-eqz p1, :cond_2

    .line 65
    .line 66
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-ge v0, v1, :cond_3

    .line 71
    .line 72
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->j0()V

    .line 73
    .line 74
    .line 75
    :cond_3
    invoke-static {}, Ll/cmg;->R()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    const/4 v1, 0x0

    .line 80
    if-eqz v0, :cond_4

    .line 81
    .line 82
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-nez v0, :cond_4

    .line 87
    .line 88
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Video;

    .line 93
    .line 94
    if-eqz v0, :cond_4

    .line 95
    .line 96
    const/4 v0, 0x1

    .line 97
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->P1(Z)V

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_4
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->P1(Z)V

    .line 102
    .line 103
    .line 104
    :goto_0
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-nez v0, :cond_5

    .line 109
    .line 110
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    instance-of p1, p1, Lcom/p1/mobile/putong/data/Video;

    .line 115
    .line 116
    if-eqz p1, :cond_5

    .line 117
    .line 118
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->j:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/FeedPostMediaRecyclerView;

    .line 119
    .line 120
    sget p1, Ll/qa00;->m:I

    .line 121
    .line 122
    invoke-static {p0, p1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 123
    .line 124
    .line 125
    return-void

    .line 126
    :cond_5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->j:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/FeedPostMediaRecyclerView;

    .line 127
    .line 128
    const/high16 p1, 0x41500000    # 13.0f

    .line 129
    .line 130
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    invoke-static {p0, p1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 135
    .line 136
    .line 137
    :cond_6
    return-void
.end method

.method public final G0(FF)Z
    .locals 5

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 5
    .line 6
    invoke-virtual {v1, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    aget v2, v0, v1

    .line 11
    .line 12
    const/4 v3, 0x1

    .line 13
    aget v0, v0, v3

    .line 14
    .line 15
    int-to-float v4, v2

    .line 16
    cmpg-float v4, p1, v4

    .line 17
    .line 18
    if-ltz v4, :cond_1

    .line 19
    .line 20
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 21
    .line 22
    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    add-int/2addr v2, v4

    .line 27
    int-to-float v2, v2

    .line 28
    cmpl-float p1, p1, v2

    .line 29
    .line 30
    if-gtz p1, :cond_1

    .line 31
    .line 32
    int-to-float p1, v0

    .line 33
    cmpg-float p1, p2, p1

    .line 34
    .line 35
    if-ltz p1, :cond_1

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    add-int/2addr v0, p0

    .line 44
    int-to-float p0, v0

    .line 45
    cmpl-float p0, p2, p0

    .line 46
    .line 47
    if-lez p0, :cond_0

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    return v3

    .line 51
    :cond_1
    :goto_0
    return v1
.end method

.method public G1()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->q:Lcom/p1/mobile/putong/feed/data/MomentShareInfoParcelable;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->n:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 v0, 0x1

    .line 15
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->n:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;

    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->q:Lcom/p1/mobile/putong/feed/data/MomentShareInfoParcelable;

    .line 23
    .line 24
    const-string v3, "p_moment_post"

    .line 25
    .line 26
    invoke-virtual {v0, v1, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->e(Lcom/p1/mobile/putong/feed/data/MomentShareInfo;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->n:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;

    .line 30
    .line 31
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSharelinkView;->setCanClick(Z)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final H0(FF)Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpl-float v0, p2, v0

    .line 3
    .line 4
    if-lez v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->G0(FF)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public H1(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->y1(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic I0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->S1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public I1(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->z1()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-lez v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->o:Lorg/apmem/tools/layouts/FlowLayout;

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->o:Lorg/apmem/tools/layouts/FlowLayout;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->E:Ll/r4h;

    .line 32
    .line 33
    check-cast p0, Ll/b9j0;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ll/b9j0;->E(Ljava/util/List;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic J0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->S1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public J1()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->o0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->d:Landroid/widget/TextView;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->d:Landroid/widget/TextView;

    .line 13
    .line 14
    invoke-virtual {v1, v0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->Z1(ZLandroid/widget/TextView;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic K0(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->J1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public K1(Ll/pf60;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicCategorie;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->B1(Ll/pf60;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final M1(Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/data/MediaMeta;->new_()Lcom/p1/mobile/putong/data/MediaMeta;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 15
    .line 16
    const-string p1, "voice"

    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/data/MediaMeta;->type:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method

.method public final synthetic N0(Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->J:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->r0()Lv/VText;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->q0()Lv/VLinear;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/16 p1, 0x8

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic O0()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ll/pf60;

    .line 3
    .line 4
    const-string v1, "e_moment_at"

    .line 5
    .line 6
    const-string v2, "p_moment_post"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->c0()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final O1(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->S:Ll/ath;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/ath;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 8
    .line 9
    sget v2, Ll/fgc0;->e:I

    .line 10
    .line 11
    new-instance v3, Ll/ee40;

    .line 12
    .line 13
    invoke-direct {v3, p0}, Ll/ee40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {v0, v1, v2, v3}, Ll/ath;-><init>(Lcom/p1/mobile/android/app/Act;ILl/x20;)V

    .line 17
    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {v0, v1}, Ll/ath;->t(Z)Ll/ath;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->S:Ll/ath;

    .line 25
    .line 26
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->S:Ll/ath;

    .line 27
    .line 28
    invoke-static {}, Ll/dth;->c()Ljava/util/ArrayList;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Ll/ath;->z(Ljava/util/List;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->S:Ll/ath;

    .line 36
    .line 37
    new-instance v1, Ll/fe40;

    .line 38
    .line 39
    invoke-direct {v1, p0, p1}, Ll/fe40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;Z)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ll/ath;->A(Ll/y20;)Ll/ath;

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->S:Ll/ath;

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/ath;->show()V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final synthetic P0(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "everyone"

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->P1(Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const/4 p1, 0x0

    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->P1(Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public P1(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->x:Landroid/widget/RelativeLayout;

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
    if-eqz p1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    if-eqz p1, :cond_1

    .line 13
    .line 14
    new-instance v0, Ll/pf60;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, "selection_situation"

    .line 22
    .line 23
    invoke-direct {v0, v2, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    filled-new-array {v0}, [Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "e_allow_forwarding"

    .line 31
    .line 32
    const-string v2, "p_moment_post"

    .line 33
    .line 34
    invoke-static {v1, v2, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->x:Landroid/widget/RelativeLayout;

    .line 38
    .line 39
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->y:Lv/VCheckBox;

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final synthetic Q0(Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->f:Lv/VScroll;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 8
    .line 9
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->e:Landroid/widget/FrameLayout;

    .line 10
    .line 11
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    sub-int/2addr p2, p3

    .line 16
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->f:Lv/VScroll;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public Q1()V
    .locals 4

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/he40;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/he40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 8
    .line 9
    .line 10
    const-wide/16 v2, 0x1f4

    .line 11
    .line 12
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic R0(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    const/16 p1, 0x43

    .line 2
    .line 3
    if-ne p2, p1, :cond_1

    .line 4
    .line 5
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_1

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->U:Ll/iog;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->U:Ll/iog;

    .line 20
    .line 21
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 22
    .line 23
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p1, p2}, Ll/iog;->e(Landroid/text/Editable;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->V:Ll/trg;

    .line 31
    .line 32
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->V:Ll/trg;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p1, p0}, Ll/trg;->e(Landroid/text/Editable;)V

    .line 47
    .line 48
    .line 49
    :cond_1
    const/4 p0, 0x0

    .line 50
    return p0
.end method

.method public R1()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->o:Lcom/p1/mobile/putong/data/DoublePair;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/putong/data/MessageLocation;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/MessageLocation;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->J:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 19
    .line 20
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->m:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v2, v0, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->n:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v2, v0, Lcom/p1/mobile/putong/data/MessageLocation;->address:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->o:Lcom/p1/mobile/putong/data/DoublePair;

    .line 29
    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/data/MessageLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->r0()Lv/VText;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->J:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 37
    .line 38
    iget-object v1, v1, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->q0()Lv/VLinear;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const/4 v1, 0x0

    .line 48
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 52
    .line 53
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->w:Z

    .line 54
    .line 55
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const-string v0, "poitagshow"

    .line 60
    .line 61
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    filled-new-array {p0}, [Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    const-string v0, "e_poi_tag"

    .line 70
    .line 71
    const-string v1, "p_moment_post"

    .line 72
    .line 73
    invoke-static {v0, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_0
    const/4 v0, 0x0

    .line 78
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->J:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->r0()Lv/VText;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->q0()Lv/VLinear;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    const/16 v0, 0x8

    .line 92
    .line 93
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public final synthetic S0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->S1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final S1()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->A(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic T0(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->J1()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final T1(Lcom/p1/mobile/putong/data/Audio;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->g1()Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 11
    .line 12
    iput-object p1, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->p:Lcom/p1/mobile/putong/data/Audio;

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->k:Landroid/widget/RelativeLayout;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->l:Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 21
    .line 22
    iget v1, p1, Lcom/p1/mobile/putong/data/Audio;->duration:F

    .line 23
    .line 24
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;->X0(FLjava/lang/String;)Lcom/p1/mobile/putong/feed/newui/view/FeedAudioPlayerView;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->J1()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->M1(Lcom/p1/mobile/putong/data/Media;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final U1()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Lcom/p1/mobile/android/ui/bubble/a;

    .line 6
    .line 7
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 8
    .line 9
    invoke-direct {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 13
    .line 14
    invoke-virtual {v2}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    sget v3, Lcom/p1/mobile/putong/feed/R$string;->H1:I

    .line 19
    .line 20
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    sget v2, Lcom/p1/mobile/android/ui/bubble/a;->O:I

    .line 29
    .line 30
    const/high16 v3, 0x41000000    # 8.0f

    .line 31
    .line 32
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->o(II)Lcom/p1/mobile/android/ui/bubble/a;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    sget v2, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 41
    .line 42
    sget v3, Lcom/p1/mobile/android/ui/bubble/a;->O:I

    .line 43
    .line 44
    or-int/2addr v2, v3

    .line 45
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    const-wide/16 v2, 0xbb8

    .line 50
    .line 51
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->i:Landroid/view/View;

    .line 56
    .line 57
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/ui/bubble/d;->t(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->K:Ljava/lang/String;

    .line 62
    .line 63
    return-void
.end method

.method public V1(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->K1(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic W0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->T:Ll/mu4;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->T:Ll/mu4;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/mu4;->g()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic X0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->i0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public X1()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->L1()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic Y0()V
    .locals 4

    .line 1
    const-string v0, "e_create_topic"

    .line 2
    .line 3
    const-string v1, "p_moment_post"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->Q:Z

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/widget/TextView;->getSelectionStart()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 32
    .line 33
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const-string v2, "#"

    .line 38
    .line 39
    if-lez v0, :cond_1

    .line 40
    .line 41
    add-int/lit8 v3, v0, -0x1

    .line 42
    .line 43
    invoke-interface {v1, v3, v0}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->P:Ll/d8j0;

    .line 58
    .line 59
    invoke-virtual {v0}, Ll/d8j0;->c()V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->O:Ll/jbj0;

    .line 63
    .line 64
    invoke-virtual {v0}, Ll/jbj0;->F()V

    .line 65
    .line 66
    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->O:Ll/jbj0;

    .line 68
    .line 69
    const-string v0, ""

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Ll/jbj0;->x(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 76
    .line 77
    invoke-static {p0, v2}, Ll/c4h;->a(Landroid/widget/EditText;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public Y1()V
    .locals 1

    .line 1
    invoke-static {}, Ll/cmg;->u0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->c:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->e1()Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostStatusView;->l0(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public Z(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/te40;->b(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic Z0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomTopicView;->G()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final Z1(Landroidx/recyclerview/widget/RecyclerView$e0;IZ)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    if-ge v0, p2, :cond_3

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->j:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/FeedPostMediaRecyclerView;

    .line 5
    .line 6
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildAt(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    iget-object v2, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 21
    .line 22
    if-ne v1, v2, :cond_0

    .line 23
    .line 24
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;

    .line 25
    .line 26
    invoke-virtual {v1, p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->setImageDeleteVisible(Z)V

    .line 27
    .line 28
    .line 29
    goto :goto_2

    .line 30
    :cond_0
    const v2, 0x3f666666    # 0.9f

    .line 31
    .line 32
    .line 33
    const/high16 v3, 0x3f800000    # 1.0f

    .line 34
    .line 35
    if-eqz p3, :cond_1

    .line 36
    .line 37
    move v4, v3

    .line 38
    goto :goto_1

    .line 39
    :cond_1
    move v4, v2

    .line 40
    :goto_1
    invoke-virtual {v1, v4}, Landroid/view/View;->setScaleX(F)V

    .line 41
    .line 42
    .line 43
    if-eqz p3, :cond_2

    .line 44
    .line 45
    move v2, v3

    .line 46
    :cond_2
    invoke-virtual {v1, v2}, Landroid/view/View;->setScaleY(F)V

    .line 47
    .line 48
    .line 49
    :goto_2
    add-int/lit8 v0, v0, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_3
    return-void
.end method

.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->G:Ll/xl80;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xl80;->G()Ljava/util/ArrayList;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->h1(Ljava/util/ArrayList;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public a0(Ljava/lang/String;Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

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
    move-result v1

    .line 15
    const-string v2, ""

    .line 16
    .line 17
    if-lez v1, :cond_0

    .line 18
    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    add-int/lit8 p2, p2, -0x1

    .line 26
    .line 27
    invoke-virtual {v0, p2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    move-object p2, v2

    .line 33
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    const-string v1, "@"

    .line 39
    .line 40
    invoke-static {p2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    if-eqz p2, :cond_1

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    move-object v2, v1

    .line 48
    :goto_1
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 59
    .line 60
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 65
    .line 66
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-static {v0}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    invoke-interface {p2, v0, p1}, Landroid/text/Editable;->insert(ILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 75
    .line 76
    .line 77
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 78
    .line 79
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->D:I

    .line 80
    .line 81
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->M1(Ljava/lang/Integer;)V

    .line 86
    .line 87
    .line 88
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    new-instance p2, Ll/ie40;

    .line 93
    .line 94
    invoke-direct {p2, p0}, Ll/ie40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 95
    .line 96
    .line 97
    const-wide/16 v0, 0x12c

    .line 98
    .line 99
    invoke-static {p1, p2, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public final synthetic a1()Lrx/c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->F:Ll/yaj0;

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/yaj0;->c()Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 16
    return-object p0
.end method

.method public final c0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->G1(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->z0()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->O1(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public d0(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic d1(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->a1(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public e0()Z
    .locals 1

    .line 1
    invoke-static {}, Ll/cmg;->p0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->O:Ll/jbj0;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->O:Ll/jbj0;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/jbj0;->o()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x1

    .line 26
    return p0
.end method

.method public final synthetic e1(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->U0(Lcom/p1/mobile/putong/feed/data/TopicMoment;Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public f0(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->isFromShoot()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    const/4 p1, 0x0

    .line 31
    const/high16 v0, -0x40800000    # -1.0f

    .line 32
    .line 33
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->v0(FF)V

    .line 34
    .line 35
    .line 36
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    new-instance v0, Ll/ke40;

    .line 41
    .line 42
    invoke-direct {v0, p0}, Ll/ke40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 43
    .line 44
    .line 45
    const-wide/16 v1, 0x1f4

    .line 46
    .line 47
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 48
    .line 49
    .line 50
    :cond_2
    :goto_0
    return-void
.end method

.method public final synthetic f1(Ljava/lang/String;Ljava/util/List;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->F:Ll/yaj0;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->F:Ll/yaj0;

    .line 22
    .line 23
    invoke-virtual {p0, p1, p2}, Ll/yaj0;->e(Ljava/lang/String;Ljava/util/List;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public g0()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->R0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->g1()Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-lez v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 22
    .line 23
    new-instance v1, Ll/md40;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/md40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 26
    .line 27
    .line 28
    const-wide/16 v2, 0xc8

    .line 29
    .line 30
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public final synthetic g1(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-static {p1}, Ll/dth;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-interface {v0, p0, p1}, Landroid/text/Editable;->insert(ILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public h0()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto/16 :goto_0

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->i:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const/4 v1, 0x1

    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->R:Z

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 33
    .line 34
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 35
    .line 36
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->i:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->g1()Ljava/util/ArrayList;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->V0(Ljava/util/ArrayList;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->j1()V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 56
    .line 57
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->M:I

    .line 58
    .line 59
    invoke-virtual {v0, v2}, Lv/VEditText;->setMaxLength(I)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 63
    .line 64
    invoke-virtual {v0}, Lv/VEditText;->h()Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    new-instance v2, Ll/nd40;

    .line 69
    .line 70
    invoke-direct {v2, p0}, Ll/nd40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 71
    .line 72
    .line 73
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 81
    .line 82
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->I0()V

    .line 83
    .line 84
    .line 85
    new-instance v0, Ll/xl80;

    .line 86
    .line 87
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 88
    .line 89
    const/4 v3, 0x0

    .line 90
    invoke-direct {v0, v2, p0, v3, p0}, Ll/xl80;-><init>(Lcom/p1/mobile/putong/app/PutongAct;Ll/y0m;ZLcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 91
    .line 92
    .line 93
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->G:Ll/xl80;

    .line 94
    .line 95
    new-instance v0, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 96
    .line 97
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 98
    .line 99
    const/4 v4, 0x3

    .line 100
    invoke-direct {v0, v2, v4}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 101
    .line 102
    .line 103
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->H:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 104
    .line 105
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->j:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/FeedPostMediaRecyclerView;

    .line 106
    .line 107
    new-instance v2, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$b;

    .line 108
    .line 109
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$b;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->j:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/FeedPostMediaRecyclerView;

    .line 116
    .line 117
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->H:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 118
    .line 119
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->j:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/FeedPostMediaRecyclerView;

    .line 123
    .line 124
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->G:Ll/xl80;

    .line 125
    .line 126
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->j:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/view/FeedPostMediaRecyclerView;

    .line 130
    .line 131
    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/RecyclerView;->setNestedScrollingEnabled(Z)V

    .line 132
    .line 133
    .line 134
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->H:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 135
    .line 136
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->G:Ll/xl80;

    .line 137
    .line 138
    invoke-virtual {v2}, Ll/jic0;->getItemCount()I

    .line 139
    .line 140
    .line 141
    move-result v2

    .line 142
    sub-int/2addr v2, v1

    .line 143
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPosition(I)V

    .line 144
    .line 145
    .line 146
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->b0()V

    .line 147
    .line 148
    .line 149
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 150
    .line 151
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->g1()Ljava/util/ArrayList;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->f0(Ljava/util/ArrayList;)V

    .line 156
    .line 157
    .line 158
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 159
    .line 160
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->g1()Ljava/util/ArrayList;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->z1(Ljava/util/ArrayList;)V

    .line 165
    .line 166
    .line 167
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 168
    .line 169
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->h:Ljava/lang/String;

    .line 170
    .line 171
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->H1(Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 175
    .line 176
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->l1()V

    .line 177
    .line 178
    .line 179
    :cond_2
    :goto_0
    return-void
.end method

.method public final synthetic h1(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 4
    .line 5
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    new-instance v1, Ll/fd40;

    .line 9
    .line 10
    invoke-direct {v1, v0}, Ll/fd40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->m0()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 18
    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->p:Lcom/p1/mobile/putong/data/Audio;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->e:Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-virtual {p1, v1, v0, v2, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->U1(Ll/x20;Ljava/lang/String;Lcom/p1/mobile/putong/data/Audio;Ljava/util/ArrayList;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final i0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->p:Lcom/p1/mobile/putong/data/Audio;

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->k:Landroid/widget/RelativeLayout;

    .line 7
    .line 8
    const/16 v1, 0x8

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/lpg;->v()Ll/lpg;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/lpg;->j0()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->J1()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->d0(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 7

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->Z(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance p2, Ll/b9j0;

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->e:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 16
    .line 17
    invoke-direct {p2, v0, v1, v2}, Ll/b9j0;-><init>(Ljava/util/List;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;)V

    .line 18
    .line 19
    .line 20
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->E:Ll/r4h;

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->o:Lorg/apmem/tools/layouts/FlowLayout;

    .line 23
    .line 24
    invoke-virtual {p2, v0}, Ll/r4h;->t(Lorg/apmem/tools/layouts/FlowLayout;)V

    .line 25
    .line 26
    .line 27
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 28
    .line 29
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->k:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    if-nez p2, :cond_0

    .line 36
    .line 37
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->k:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 47
    .line 48
    const/4 v0, 0x0

    .line 49
    const/4 v1, 0x1

    .line 50
    invoke-virtual {p2, v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 51
    .line 52
    .line 53
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->q:Lv/VImage;

    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->r:Lv/VText;

    .line 56
    .line 57
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->u:Lv/VImage;

    .line 58
    .line 59
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->v:Lv/VText;

    .line 60
    .line 61
    const/4 v4, 0x4

    .line 62
    new-array v4, v4, [Landroid/view/View;

    .line 63
    .line 64
    const/4 v5, 0x0

    .line 65
    aput-object p2, v4, v5

    .line 66
    .line 67
    aput-object v0, v4, v1

    .line 68
    .line 69
    const/4 p2, 0x2

    .line 70
    aput-object v2, v4, p2

    .line 71
    .line 72
    const/4 v0, 0x3

    .line 73
    aput-object v3, v4, v0

    .line 74
    .line 75
    invoke-static {v4}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    new-instance v2, Ll/le40;

    .line 80
    .line 81
    invoke-direct {v2, p0}, Ll/le40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 82
    .line 83
    .line 84
    invoke-static {v0, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->r0()Lv/VText;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    const v2, 0x438d8000    # 283.0f

    .line 92
    .line 93
    .line 94
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->p0()Lv/VImage;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->p0()Lv/VImage;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    new-instance v2, Ll/ne40;

    .line 113
    .line 114
    invoke-direct {v2, p0}, Ll/ne40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 115
    .line 116
    .line 117
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 121
    .line 122
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 123
    .line 124
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 125
    .line 126
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->O0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 130
    .line 131
    new-instance v2, Ll/oe40;

    .line 132
    .line 133
    invoke-direct {v2, p0}, Ll/oe40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->setFeedPostAudioFinishListener(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView$d;)V

    .line 137
    .line 138
    .line 139
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 140
    .line 141
    new-instance v2, Ll/pe40;

    .line 142
    .line 143
    invoke-direct {v2, p0}, Ll/pe40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->setFeedPostLocationListener(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView$e;)V

    .line 147
    .line 148
    .line 149
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 150
    .line 151
    new-instance v2, Ll/qe40;

    .line 152
    .line 153
    invoke-direct {v2, p0}, Ll/qe40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->setFeedPostAtListener(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView$c;)V

    .line 157
    .line 158
    .line 159
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 160
    .line 161
    new-instance v2, Ll/gd40;

    .line 162
    .line 163
    invoke-direct {v2, p0}, Ll/gd40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->setHideInputEditFieldAction(Ll/x20;)V

    .line 167
    .line 168
    .line 169
    invoke-static {}, Ll/cmg;->R()Z

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    if-eqz v0, :cond_1

    .line 174
    .line 175
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 176
    .line 177
    new-instance v2, Ll/hd40;

    .line 178
    .line 179
    invoke-direct {v2, p0}, Ll/hd40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->setIMomentVisibleChangedListener(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView$f;)V

    .line 183
    .line 184
    .line 185
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->y:Lv/VCheckBox;

    .line 186
    .line 187
    new-instance v2, Ll/id40;

    .line 188
    .line 189
    invoke-direct {v2}, Ll/id40;-><init>()V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v0, v2}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 193
    .line 194
    .line 195
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 196
    .line 197
    new-instance v2, Ll/jd40;

    .line 198
    .line 199
    invoke-direct {v2, p0}, Ll/jd40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 200
    .line 201
    .line 202
    invoke-virtual {v0, v2}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->E0()V

    .line 206
    .line 207
    .line 208
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 209
    .line 210
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->l0()Landroid/text/TextWatcher;

    .line 211
    .line 212
    .line 213
    move-result-object v2

    .line 214
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 215
    .line 216
    .line 217
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 218
    .line 219
    new-instance v2, Ll/kd40;

    .line 220
    .line 221
    invoke-direct {v2, p0}, Ll/kd40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 222
    .line 223
    .line 224
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;->setOnKeyEventListener(Landroid/view/View$OnKeyListener;)V

    .line 225
    .line 226
    .line 227
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 228
    .line 229
    new-instance v2, Ll/gkh;

    .line 230
    .line 231
    new-instance v3, Ll/wzh;

    .line 232
    .line 233
    const-class v4, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedHighlightSpan;

    .line 234
    .line 235
    invoke-direct {v3, v4}, Ll/wzh;-><init>(Ljava/lang/Class;)V

    .line 236
    .line 237
    .line 238
    new-instance v4, Ll/wzh;

    .line 239
    .line 240
    const-class v6, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/span/FeedTitleTagsSpan;

    .line 241
    .line 242
    invoke-direct {v4, v6}, Ll/wzh;-><init>(Ljava/lang/Class;)V

    .line 243
    .line 244
    .line 245
    new-array p2, p2, [Landroid/text/NoCopySpan;

    .line 246
    .line 247
    aput-object v3, p2, v5

    .line 248
    .line 249
    aput-object v4, p2, v1

    .line 250
    .line 251
    invoke-direct {v2, p2}, Ll/gkh;-><init>([Landroid/text/NoCopySpan;)V

    .line 252
    .line 253
    .line 254
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setEditableFactory(Landroid/text/Editable$Factory;)V

    .line 255
    .line 256
    .line 257
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->z0()V

    .line 258
    .line 259
    .line 260
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 261
    .line 262
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->A:Lcom/p1/mobile/putong/feed/data/FeedPostTitleTagConfig;

    .line 263
    .line 264
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 265
    .line 266
    .line 267
    move-result p2

    .line 268
    if-eqz p2, :cond_2

    .line 269
    .line 270
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 271
    .line 272
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->A:Lcom/p1/mobile/putong/feed/data/FeedPostTitleTagConfig;

    .line 273
    .line 274
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/FeedPostTitleTagConfig;->titles:Ljava/util/List;

    .line 275
    .line 276
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 277
    .line 278
    .line 279
    move-result p2

    .line 280
    if-nez p2, :cond_2

    .line 281
    .line 282
    new-instance p2, Ll/trg;

    .line 283
    .line 284
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 285
    .line 286
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 287
    .line 288
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->A:Lcom/p1/mobile/putong/feed/data/FeedPostTitleTagConfig;

    .line 289
    .line 290
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/FeedPostTitleTagConfig;->titles:Ljava/util/List;

    .line 291
    .line 292
    invoke-direct {p2, v0, v1}, Ll/trg;-><init>(Landroid/widget/EditText;Ljava/util/List;)V

    .line 293
    .line 294
    .line 295
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->V:Ll/trg;

    .line 296
    .line 297
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 298
    .line 299
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 300
    .line 301
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->A:Lcom/p1/mobile/putong/feed/data/FeedPostTitleTagConfig;

    .line 302
    .line 303
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/FeedPostTitleTagConfig;->titles:Ljava/util/List;

    .line 304
    .line 305
    invoke-virtual {v0, v1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->A1(Ljava/util/List;Ll/trg;)V

    .line 306
    .line 307
    .line 308
    :cond_2
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 309
    .line 310
    .line 311
    move-result-object p2

    .line 312
    new-instance v0, Landroid/view/View;

    .line 313
    .line 314
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 315
    .line 316
    .line 317
    move-result-object v1

    .line 318
    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 319
    .line 320
    .line 321
    new-instance v1, Ll/me40;

    .line 322
    .line 323
    invoke-direct {v1, p0}, Ll/me40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 324
    .line 325
    .line 326
    invoke-virtual {p2, p1, v0, v1}, Lcom/p1/mobile/android/app/Act;->setUpKeyboardDetectorLayout(Landroid/view/View;Landroid/view/View;Ll/z20;)Landroid/view/View;

    .line 327
    .line 328
    .line 329
    move-result-object p0

    .line 330
    return-object p0
.end method

.method public j0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->K:Ljava/lang/String;

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
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->K:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->K:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final synthetic j1(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 4
    .line 5
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/fd40;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/fd40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->Q0(Ll/x20;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final k0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->q1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->h0()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final synthetic k1(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->J:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 4
    .line 5
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->L1(Ljava/lang/String;Lcom/p1/mobile/putong/data/MessageLocation;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->finish()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final l0()Landroid/text/TextWatcher;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$a;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final synthetic l1()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->S1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final m0()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->V:Ll/trg;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->V:Ll/trg;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Ll/trg;->b(Landroid/text/Editable;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public final synthetic m1()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->l:Landroid/widget/ImageView;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setSelected(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final n0()Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->V:Ll/trg;

    .line 8
    .line 9
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->V:Ll/trg;

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ll/trg;->k(Landroid/text/Editable;)Landroid/text/Editable;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {}, Ll/cmg;->x()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 36
    .line 37
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->G:Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-nez v1, :cond_1

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 46
    .line 47
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->G:Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-eqz v2, :cond_1

    .line 58
    .line 59
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    check-cast v0, Ljava/lang/String;

    .line 64
    .line 65
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 66
    .line 67
    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    const-string v3, ""

    .line 80
    .line 81
    invoke-virtual {v2, v0, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    goto :goto_0

    .line 86
    :cond_1
    return-object v0
.end method

.method public final synthetic n1(ZLcom/p1/mobile/putong/feed/data/NotifyUsers;)V
    .locals 1

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 8
    .line 9
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->O0(Lcom/p1/mobile/putong/feed/data/NotifyUsers;Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public o0()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->g1()Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->o1(Ljava/util/ArrayList;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    new-instance v0, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->z:Lv/VText;

    .line 21
    .line 22
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    const/16 v2, 0x8

    .line 27
    .line 28
    if-ne v1, v2, :cond_3

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_2

    .line 37
    .line 38
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->n0()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->I1()Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-nez p0, :cond_3

    .line 55
    .line 56
    :cond_2
    const/4 p0, 0x1

    .line 57
    return p0

    .line 58
    :cond_3
    const/4 p0, 0x0

    .line 59
    return p0
.end method

.method public final synthetic o1()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->E1()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {}, Ll/cng;->g()Ll/cng;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {v0, p0}, Ll/cng;->e(Lcom/p1/mobile/android/app/Act;)Z

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final p0()Lv/VImage;
    .locals 1

    .line 1
    invoke-static {}, Ll/j4h;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->w:Lv/VImage;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->s:Lv/VImage;

    .line 11
    .line 12
    return-object p0
.end method

.method public final p1()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->v:[D

    .line 6
    .line 7
    const-string v2, "p_moment_post"

    .line 8
    .line 9
    invoke-static {v0, v2, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostLocationAct;->Y1(Landroid/content/Context;Ljava/lang/String;[D)Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/16 v2, 0x2724

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 19
    .line 20
    sget v0, Ll/a8c0;->i:I

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final q0()Lv/VLinear;
    .locals 1

    .line 1
    invoke-static {}, Ll/j4h;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->t:Lv/VLinear;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->p:Lv/VLinear;

    .line 11
    .line 12
    return-object p0
.end method

.method public final q1()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->G:Ll/xl80;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final r0()Lv/VText;
    .locals 1

    .line 1
    invoke-static {}, Ll/j4h;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->v:Lv/VText;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->r:Lv/VText;

    .line 11
    .line 12
    return-object p0
.end method

.method public final r1(Lcom/p1/mobile/putong/data/Audio;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->T1(Lcom/p1/mobile/putong/data/Audio;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->S1()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public s0()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->getSelectedPosition()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public s1()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->g1()Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->o1(Ljava/util/ArrayList;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    new-instance v0, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->D0()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->n0()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    const-string v2, "from_h5_moment_level_open_camera"

    .line 38
    .line 39
    const-string v3, "share"

    .line 40
    .line 41
    if-eqz v1, :cond_5

    .line 42
    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-nez v1, :cond_5

    .line 50
    .line 51
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 52
    .line 53
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->I1()Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_5

    .line 58
    .line 59
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 64
    .line 65
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->c:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_4

    .line 72
    .line 73
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 78
    .line 79
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->c:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-eqz v0, :cond_3

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 89
    .line 90
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 91
    .line 92
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    new-instance v1, Ll/fd40;

    .line 96
    .line 97
    invoke-direct {v1, p0}, Ll/fd40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->Q0(Ll/x20;)V

    .line 101
    .line 102
    .line 103
    return-void

    .line 104
    :cond_4
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 105
    .line 106
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->g2()V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->n0()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    if-eqz v1, :cond_7

    .line 119
    .line 120
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    if-eqz v1, :cond_6

    .line 125
    .line 126
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    if-eqz v1, :cond_6

    .line 131
    .line 132
    const/4 v1, 0x0

    .line 133
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v4

    .line 137
    check-cast v4, Lcom/p1/mobile/putong/data/Media;

    .line 138
    .line 139
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 140
    .line 141
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 142
    .line 143
    .line 144
    move-result v4

    .line 145
    if-eqz v4, :cond_7

    .line 146
    .line 147
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 152
    .line 153
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 154
    .line 155
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    if-eqz v0, :cond_7

    .line 160
    .line 161
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 162
    .line 163
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->I1()Z

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    if-nez v0, :cond_8

    .line 168
    .line 169
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 170
    .line 171
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->g:Z

    .line 172
    .line 173
    if-nez v0, :cond_8

    .line 174
    .line 175
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 180
    .line 181
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->c:Ljava/lang/String;

    .line 182
    .line 183
    const-string v1, "immersion_cartoon_effects"

    .line 184
    .line 185
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    if-nez v0, :cond_8

    .line 190
    .line 191
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 196
    .line 197
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->c:Ljava/lang/String;

    .line 198
    .line 199
    const-string v1, "immersion"

    .line 200
    .line 201
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 202
    .line 203
    .line 204
    move-result v0

    .line 205
    if-nez v0, :cond_8

    .line 206
    .line 207
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 212
    .line 213
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->c:Ljava/lang/String;

    .line 214
    .line 215
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 216
    .line 217
    .line 218
    move-result v0

    .line 219
    if-nez v0, :cond_8

    .line 220
    .line 221
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 226
    .line 227
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->c:Ljava/lang/String;

    .line 228
    .line 229
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 230
    .line 231
    .line 232
    move-result v0

    .line 233
    if-nez v0, :cond_8

    .line 234
    .line 235
    invoke-static {}, Ll/lpg;->v()Ll/lpg;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    invoke-virtual {v0}, Ll/lpg;->j0()V

    .line 240
    .line 241
    .line 242
    new-instance v0, Ll/th0$a;

    .line 243
    .line 244
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 245
    .line 246
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 247
    .line 248
    .line 249
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->J1:I

    .line 250
    .line 251
    invoke-virtual {v0, v1}, Ll/th0$a;->i(I)Ll/th0$a;

    .line 252
    .line 253
    .line 254
    move-result-object v0

    .line 255
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->Y1:I

    .line 256
    .line 257
    invoke-virtual {v0, v1}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    new-instance v1, Ll/qd40;

    .line 262
    .line 263
    invoke-direct {v1, p0}, Ll/qd40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 264
    .line 265
    .line 266
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->s1:I

    .line 271
    .line 272
    invoke-virtual {v0, v1}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    new-instance v1, Ll/be40;

    .line 277
    .line 278
    invoke-direct {v1, p0}, Ll/be40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 279
    .line 280
    .line 281
    invoke-virtual {v0, v1}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 282
    .line 283
    .line 284
    move-result-object p0

    .line 285
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 286
    .line 287
    .line 288
    move-result-object p0

    .line 289
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 290
    .line 291
    .line 292
    return-void

    .line 293
    :cond_8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 294
    .line 295
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;->g2()V

    .line 296
    .line 297
    .line 298
    return-void
.end method

.method public t0()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->getTopicList()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public t1()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->E:Z

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->V:Ll/trg;

    .line 16
    .line 17
    if-eqz v2, :cond_1

    .line 18
    .line 19
    invoke-virtual {v2, v0}, Ll/trg;->k(Landroid/text/Editable;)Landroid/text/Editable;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 32
    .line 33
    if-nez v2, :cond_2

    .line 34
    .line 35
    new-instance v2, Ll/je40;

    .line 36
    .line 37
    invoke-direct {v2, p0, v0}, Ll/je40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v3, v0, v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->Y0(Ljava/lang/String;Ll/x20;)V

    .line 41
    .line 42
    .line 43
    return v1

    .line 44
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->J:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 45
    .line 46
    invoke-virtual {v3, v0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->L1(Ljava/lang/String;Lcom/p1/mobile/putong/data/MessageLocation;)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    return p0
.end method

.method public final u0()Z
    .locals 1

    .line 1
    const-string p0, "android.permission.READ_EXTERNAL_STORAGE"

    .line 2
    .line 3
    const-string v0, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 4
    .line 5
    filled-new-array {p0, v0}, [Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public u1(Lcom/p1/mobile/putong/feed/data/NewMomentDraft;)V
    .locals 4

    .line 1
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->text:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_1

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->R:Z

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->V:Ll/trg;

    .line 18
    .line 19
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->V:Ll/trg;

    .line 26
    .line 27
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->text:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ll/trg;->j(Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->text:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v1}, Ll/trg;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 44
    .line 45
    .line 46
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 47
    .line 48
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->M:I

    .line 56
    .line 57
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 62
    .line 63
    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setSelection(I)V

    .line 64
    .line 65
    .line 66
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->u0()Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-nez v0, :cond_3

    .line 71
    .line 72
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->images:Ljava/util/List;

    .line 73
    .line 74
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_3

    .line 79
    .line 80
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->images:Ljava/util/List;

    .line 81
    .line 82
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    if-eqz v1, :cond_3

    .line 91
    .line 92
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 97
    .line 98
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 99
    .line 100
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    if-nez v2, :cond_2

    .line 105
    .line 106
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 107
    .line 108
    const-string v3, "com.p1.mobile.putong/cache/.tantan"

    .line 109
    .line 110
    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    if-nez v2, :cond_2

    .line 115
    .line 116
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->originUrl:Ljava/lang/String;

    .line 117
    .line 118
    const-string v2, "com.p1.mobile.putong/files/moment"

    .line 119
    .line 120
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    if-nez v1, :cond_2

    .line 125
    .line 126
    return-void

    .line 127
    :cond_3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->E1(Lcom/p1/mobile/putong/feed/data/NewMomentDraft;)V

    .line 128
    .line 129
    .line 130
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/NewMomentDraft;->images:Ljava/util/List;

    .line 131
    .line 132
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    if-lez p1, :cond_4

    .line 137
    .line 138
    const/4 p1, 0x0

    .line 139
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->y0(Z)V

    .line 140
    .line 141
    .line 142
    :cond_4
    return-void
.end method

.method public v0(FF)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->H0(FF)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-virtual {v0, p2, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->H0(FZ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public v1()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->q1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->L:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->h0()V

    .line 12
    .line 13
    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->L:Z

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->N:Lcom/p1/mobile/putong/feed/data/NewMomentDraft;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->N:Lcom/p1/mobile/putong/feed/data/NewMomentDraft;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->E1(Lcom/p1/mobile/putong/feed/data/NewMomentDraft;)V

    .line 28
    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->N:Lcom/p1/mobile/putong/feed/data/NewMomentDraft;

    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public w0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->clearFocus()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->g:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedEditText;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public w1(Ljava/lang/String;Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/cmg;->p0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->e:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 40
    .line 41
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->I:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;

    .line 42
    .line 43
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/a;->e:Ljava/util/ArrayList;

    .line 44
    .line 45
    new-instance v3, Ll/ce40;

    .line 46
    .line 47
    invoke-direct {v3, v1}, Ll/ce40;-><init>(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v2, v3}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    iput-boolean v2, v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->selected:Z

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 58
    .line 59
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->p1(Ljava/lang/String;Ljava/util/List;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public x0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->u0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->y0(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final y0(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->D:I

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->M1(Ljava/lang/Integer;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->G1(Z)V

    .line 15
    .line 16
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
    new-instance v0, Ll/de40;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Ll/de40;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V

    .line 26
    .line 27
    .line 28
    const-wide/16 v1, 0x32

    .line 29
    .line 30
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public y1(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->w1(Ljava/lang/String;Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final z0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->F:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/NewPostAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "extra_show_audio_input"

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 17
    .line 18
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->k1(Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public z1(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->A:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->q1(Ljava/util/ArrayList;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
