.class public Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$f;
    }
.end annotation


# instance fields
.field public A:Ll/kcg0;

.field public B:Landroidx/viewpager2/widget/ViewPager2$i;

.field public C:I

.field public a:Lv/VText;

.field public b:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

.field public c:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

.field public d:Landroid/widget/ImageView;

.field public e:Landroid/widget/ImageView;

.field public f:Landroidx/viewpager2/widget/ViewPager2;

.field public g:Landroidx/recyclerview/widget/RecyclerView;

.field public h:Lcom/p1/mobile/putong/feed/newui/kankan/view/a;

.field public i:Ll/fwg;

.field public j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/CameraCategory;",
            ">;"
        }
    .end annotation
.end field

.field public k:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public l:Landroidx/recyclerview/widget/LinearLayoutManager;

.field public m:Landroidx/recyclerview/widget/w;

.field public n:Landroidx/recyclerview/widget/RecyclerView$n;

.field public o:I

.field public p:I

.field public q:Ll/a30;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a30<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/feed/data/CameraSticker;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public r:Ll/x20;

.field public s:Ll/x20;

.field public t:Ll/x20;

.field public u:Ll/x20;

.field public v:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar$b;

.field public w:Z

.field public x:I

.field public y:Z

.field public z:Ll/x20;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 55
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 54
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->j:Ljava/util/List;

    .line 10
    .line 11
    new-instance p1, Ljava/util/HashSet;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->k:Ljava/util/Set;

    .line 17
    .line 18
    const/high16 p1, 0x42b00000    # 88.0f

    .line 19
    .line 20
    invoke-static {p1}, Ll/bnl0;->w(F)I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->o:I

    .line 25
    .line 26
    const/4 p1, 0x2

    .line 27
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->p:I

    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->w:Z

    .line 31
    .line 32
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->x:I

    .line 33
    .line 34
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$a;

    .line 35
    .line 36
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)V

    .line 37
    .line 38
    .line 39
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->z:Ll/x20;

    .line 40
    .line 41
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$b;

    .line 42
    .line 43
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$b;-><init>(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)V

    .line 44
    .line 45
    .line 46
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->B:Landroidx/viewpager2/widget/ViewPager2$i;

    .line 47
    .line 48
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->C:I

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->w()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->B()V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->A(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->z(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;Lcom/p1/mobile/putong/feed/data/CameraCategory;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->x(Lcom/p1/mobile/putong/feed/data/CameraCategory;Ljava/lang/Integer;)V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->j:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)Landroidx/recyclerview/widget/LinearLayoutManager;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->l:Landroidx/recyclerview/widget/LinearLayoutManager;

    return-object p0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->x:I

    return p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->C:I

    return p0
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)Lcom/p1/mobile/putong/feed/newui/kankan/view/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->h:Lcom/p1/mobile/putong/feed/newui/kankan/view/a;

    return-object p0
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)Ljava/util/Set;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->k:Ljava/util/Set;

    return-object p0
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)Landroidx/recyclerview/widget/w;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->m:Landroidx/recyclerview/widget/w;

    return-object p0
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->v:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar$b;

    return-object p0
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->C:I

    return-void
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;Ll/kcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->A:Ll/kcg0;

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->p:I

    return-void
.end method

.method public static bridge synthetic q(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;III)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->t(III)I

    move-result p0

    return p0
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;Lcom/p1/mobile/putong/feed/data/CameraCategory;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->v(Lcom/p1/mobile/putong/feed/data/CameraCategory;I)V

    return-void
.end method


# virtual methods
.method public final synthetic A(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->c:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->N()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide/16 v2, 0xbb8

    .line 8
    .line 9
    cmp-long p1, v0, v2

    .line 10
    .line 11
    if-gez p1, :cond_0

    .line 12
    .line 13
    sub-long/2addr v0, v2

    .line 14
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    const-wide/16 v2, 0x384

    .line 19
    .line 20
    cmp-long p1, v0, v2

    .line 21
    .line 22
    if-lez p1, :cond_0

    .line 23
    .line 24
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->B0:I

    .line 25
    .line 26
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    const/16 p1, 0x67

    .line 31
    .line 32
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->p:I

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->v:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar$b;

    .line 35
    .line 36
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar$b;->a(I)V

    .line 37
    .line 38
    .line 39
    const-string p0, "e_camera_video_next"

    .line 40
    .line 41
    const-string p1, "p_camera_video"

    .line 42
    .line 43
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final synthetic B()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->i:Ll/fwg;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/fwg;->getItemCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    if-le v0, v1, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 11
    .line 12
    invoke-static {p0, v1}, Ll/ezq;->c(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final C()Lcom/p1/mobile/putong/feed/data/CameraCategory;
    .locals 1

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/CameraCategory;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/CameraCategory;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "0"

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/CameraCategory;->id:Ljava/lang/String;

    .line 9
    .line 10
    return-object p0
.end method

.method public D()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->A:Ll/kcg0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/kcg0;->unsubscribe()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final E()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->r:Ll/x20;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public F()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->c:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->L()V

    .line 4
    .line 5
    .line 6
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->x:I

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->b:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->f:Landroidx/viewpager2/widget/ViewPager2;

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->d:Landroid/widget/ImageView;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->e:Landroid/widget/ImageView;

    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->a:Lv/VText;

    .line 38
    .line 39
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final G()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->w:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->w:Z

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->f:Landroidx/viewpager2/widget/ViewPager2;

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->b:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 15
    .line 16
    invoke-static {v1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->h:Lcom/p1/mobile/putong/feed/newui/kankan/view/a;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->j:Ljava/util/List;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/a;->Q(Ljava/util/List;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->h:Lcom/p1/mobile/putong/feed/newui/kankan/view/a;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->q:Ll/a30;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/a;->S(Ll/a30;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->h:Lcom/p1/mobile/putong/feed/newui/kankan/view/a;

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->r:Ll/x20;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/a;->R(Ll/x20;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->i:Ll/fwg;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->j:Ljava/util/List;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ll/fwg;->E(Ljava/util/List;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 48
    .line 49
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$e;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$e;-><init>(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->f:Landroidx/viewpager2/widget/ViewPager2;

    .line 58
    .line 59
    const/4 v1, 0x5

    .line 60
    invoke-virtual {v0, v1}, Landroidx/viewpager2/widget/ViewPager2;->setOffscreenPageLimit(I)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->f:Landroidx/viewpager2/widget/ViewPager2;

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->B:Landroidx/viewpager2/widget/ViewPager2$i;

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroidx/viewpager2/widget/ViewPager2;->g(Landroidx/viewpager2/widget/ViewPager2$i;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 71
    .line 72
    new-instance v1, Ll/mwg;

    .line 73
    .line 74
    invoke-direct {v1, p0}, Ll/mwg;-><init>(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)V

    .line 75
    .line 76
    .line 77
    invoke-static {v0, v1}, Ll/fq50;->a(Landroid/view/View;Ljava/lang/Runnable;)Ll/fq50;

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public H(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->c:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->p(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getState()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->p:I

    .line 2
    .line 3
    return p0
.end method

.method public s(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/qwg;->b(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public setCancel(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->r:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public setCategoryData(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/CameraCategory;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->j:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    new-instance p1, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->j:Ljava/util/List;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->j:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->j:Ljava/util/List;

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->C()Lcom/p1/mobile/putong/feed/data/CameraCategory;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-interface {p1, v0, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->G()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public setDelete(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->s:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public setOnPause(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->u:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public setOnPropSelect(Ll/a30;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a30<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/feed/data/CameraSticker;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->q:Ll/a30;

    .line 2
    .line 3
    return-void
.end method

.method public setOnRecord(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->t:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public setStateListener(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->v:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar$b;

    .line 2
    .line 3
    return-void
.end method

.method public final t(III)I
    .locals 0

    .line 1
    if-gt p3, p1, :cond_0

    return p1

    :cond_0
    if-lt p3, p2, :cond_1

    return p2

    :cond_1
    return p3
.end method

.method public final u(Lcom/p1/mobile/putong/feed/data/CameraCategory;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->j:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_5

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->x:I

    .line 13
    .line 14
    if-ne p2, v0, :cond_2

    .line 15
    .line 16
    invoke-static {}, Ll/xc4;->c()Ll/xc4;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Ll/xc4;->b()Lcom/p1/mobile/putong/feed/data/CameraSticker;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    iget-boolean p1, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->hasModelFile:Z

    .line 27
    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->z:Ll/x20;

    .line 31
    .line 32
    invoke-interface {p0}, Ll/x20;->call()V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void

    .line 36
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 37
    .line 38
    invoke-static {v0, p2}, Ll/ezq;->c(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->f:Landroidx/viewpager2/widget/ViewPager2;

    .line 42
    .line 43
    const/4 v1, 0x0

    .line 44
    invoke-virtual {v0, p2, v1}, Landroidx/viewpager2/widget/ViewPager2;->j(IZ)V

    .line 45
    .line 46
    .line 47
    if-eqz p2, :cond_3

    .line 48
    .line 49
    const/4 v1, 0x1

    .line 50
    :cond_3
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->x:I

    .line 51
    .line 52
    if-nez v1, :cond_4

    .line 53
    .line 54
    invoke-static {}, Ll/xc4;->c()Ll/xc4;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    const/4 v0, 0x0

    .line 59
    invoke-virtual {p2, v0}, Ll/xc4;->l(Lcom/p1/mobile/putong/feed/data/CameraSticker;)V

    .line 60
    .line 61
    .line 62
    invoke-static {}, Ll/xc4;->c()Ll/xc4;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    invoke-virtual {p2, v0}, Ll/xc4;->m(Lcom/p1/mobile/putong/feed/data/CameraSticker;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->E()V

    .line 70
    .line 71
    .line 72
    :cond_4
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->b:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 73
    .line 74
    invoke-static {p2, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->f:Landroidx/viewpager2/widget/ViewPager2;

    .line 78
    .line 79
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    new-instance p0, Ll/pf60;

    .line 83
    .line 84
    const-string p2, "special_effects_id"

    .line 85
    .line 86
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/CameraCategory;->id:Ljava/lang/String;

    .line 87
    .line 88
    invoke-direct {p0, p2, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    filled-new-array {p0}, [Ll/pf60;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    const-string p1, "e_camera_video_effect"

    .line 96
    .line 97
    const-string p2, "p_camera_video"

    .line 98
    .line 99
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_5
    :goto_0
    const-string p0, "\u8d44\u6e90\u52a0\u8f7d\u4e2d\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5"

    .line 104
    .line 105
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public final v(Lcom/p1/mobile/putong/feed/data/CameraCategory;I)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->x:I

    .line 2
    .line 3
    if-ne p2, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 7
    .line 8
    invoke-static {v0, p2}, Ll/ezq;->c(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->f:Landroidx/viewpager2/widget/ViewPager2;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, p2, v1}, Landroidx/viewpager2/widget/ViewPager2;->j(IZ)V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    if-eqz p2, :cond_1

    .line 19
    .line 20
    move v1, v0

    .line 21
    :cond_1
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->x:I

    .line 22
    .line 23
    if-nez v1, :cond_2

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->E()V

    .line 26
    .line 27
    .line 28
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->b:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 29
    .line 30
    invoke-static {p2, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->f:Landroidx/viewpager2/widget/ViewPager2;

    .line 34
    .line 35
    invoke-static {p2, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    iget-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->y:Z

    .line 39
    .line 40
    if-eqz p2, :cond_3

    .line 41
    .line 42
    new-instance p2, Ll/pf60;

    .line 43
    .line 44
    const-string v1, "special_effects_id"

    .line 45
    .line 46
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/CameraCategory;->id:Ljava/lang/String;

    .line 47
    .line 48
    invoke-direct {p2, v1, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    filled-new-array {p2}, [Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    const-string p2, "e_camera_video_effect"

    .line 56
    .line 57
    const-string v1, "p_camera_video"

    .line 58
    .line 59
    invoke-static {p2, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 60
    .line 61
    .line 62
    :cond_3
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->y:Z

    .line 63
    .line 64
    return-void
.end method

.method public final w()V
    .locals 5

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
    invoke-virtual {p0, v0, p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->s(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->f:Landroidx/viewpager2/widget/ViewPager2;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-virtual {v0, v1}, Landroidx/viewpager2/widget/ViewPager2;->setUserInputEnabled(Z)V

    .line 20
    .line 21
    .line 22
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/properties/AnimLinearLayoutManager;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-direct {v0, v2, v1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/properties/AnimLinearLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->l:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 32
    .line 33
    new-instance v0, Ll/fwg;

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-direct {v0, v2}, Ll/fwg;-><init>(Landroid/content/Context;)V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->i:Ll/fwg;

    .line 43
    .line 44
    new-instance v2, Ll/iwg;

    .line 45
    .line 46
    invoke-direct {v2, p0}, Ll/iwg;-><init>(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v2}, Ll/fwg;->F(Ll/z20;)V

    .line 50
    .line 51
    .line 52
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/kankan/view/a;

    .line 53
    .line 54
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-direct {v0, v2}, Lcom/p1/mobile/putong/feed/newui/kankan/view/a;-><init>(Landroid/content/Context;)V

    .line 59
    .line 60
    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->h:Lcom/p1/mobile/putong/feed/newui/kankan/view/a;

    .line 62
    .line 63
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->f:Landroidx/viewpager2/widget/ViewPager2;

    .line 64
    .line 65
    invoke-virtual {v2, v0}, Landroidx/viewpager2/widget/ViewPager2;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 66
    .line 67
    .line 68
    new-instance v0, Ll/nzb;

    .line 69
    .line 70
    invoke-direct {v0}, Ll/nzb;-><init>()V

    .line 71
    .line 72
    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->m:Landroidx/recyclerview/widget/w;

    .line 74
    .line 75
    new-instance v0, Ll/df3;

    .line 76
    .line 77
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->o:I

    .line 78
    .line 79
    const/4 v3, 0x1

    .line 80
    const/4 v4, 0x2

    .line 81
    invoke-direct {v0, v4, v2, v3}, Ll/df3;-><init>(IIZ)V

    .line 82
    .line 83
    .line 84
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->n:Landroidx/recyclerview/widget/RecyclerView$n;

    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->c:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 87
    .line 88
    new-instance v2, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;

    .line 89
    .line 90
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$c;-><init>(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->setStateListener(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar$b;)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->c:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 97
    .line 98
    new-instance v2, Ll/jwg;

    .line 99
    .line 100
    invoke-direct {v2, p0}, Ll/jwg;-><init>(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->d:Landroid/widget/ImageView;

    .line 107
    .line 108
    new-instance v2, Ll/kwg;

    .line 109
    .line 110
    invoke-direct {v2, p0}, Ll/kwg;-><init>(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->e:Landroid/widget/ImageView;

    .line 117
    .line 118
    new-instance v2, Ll/lwg;

    .line 119
    .line 120
    invoke-direct {v2, p0}, Ll/lwg;-><init>(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 127
    .line 128
    const/4 v2, 0x5

    .line 129
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setItemViewCacheSize(I)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 133
    .line 134
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->l:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 135
    .line 136
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 137
    .line 138
    .line 139
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 140
    .line 141
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->i:Ll/fwg;

    .line 142
    .line 143
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 144
    .line 145
    .line 146
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 147
    .line 148
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->n:Landroidx/recyclerview/widget/RecyclerView$n;

    .line 149
    .line 150
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 151
    .line 152
    .line 153
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->m:Landroidx/recyclerview/widget/w;

    .line 154
    .line 155
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 156
    .line 157
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/w;->b(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 158
    .line 159
    .line 160
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 161
    .line 162
    new-instance v2, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$d;

    .line 163
    .line 164
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$d;-><init>(Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;)V

    .line 165
    .line 166
    .line 167
    invoke-static {v0, v2, v1}, Ll/zf5;->f(Landroidx/recyclerview/widget/RecyclerView;Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView$f;Z)V

    .line 168
    .line 169
    .line 170
    return-void
.end method

.method public final synthetic x(Lcom/p1/mobile/putong/feed/data/CameraCategory;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->u(Lcom/p1/mobile/putong/feed/data/CameraCategory;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic y(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->j:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p1, :cond_2

    .line 4
    .line 5
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->c:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->B()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->c:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->M()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->c:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 25
    .line 26
    invoke-virtual {v2}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->getCount()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    const/16 v3, 0x65

    .line 31
    .line 32
    if-ne p1, v3, :cond_1

    .line 33
    .line 34
    if-nez v2, :cond_1

    .line 35
    .line 36
    const-wide/16 v2, 0x3e8

    .line 37
    .line 38
    cmp-long p1, v0, v2

    .line 39
    .line 40
    if-gez p1, :cond_1

    .line 41
    .line 42
    const-string p0, "\u62cd\u6444\u65f6\u957f\u8fc7\u77ed"

    .line 43
    .line 44
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->c:Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedCircleProgressBar;->o()V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_2
    :goto_0
    const-string p0, "\u8d44\u6e90\u52a0\u8f7d\u4e2d\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5"

    .line 55
    .line 56
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final synthetic z(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFacePropMenuView;->s:Ll/x20;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
