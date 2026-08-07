.class public Lcom/p1/mobile/putong/feed/newui/camera/b;
.super Ll/jic0;
.source "SourceFile"


# instance fields
.field public final c:Landroid/content/Context;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Music;",
            ">;"
        }
    .end annotation
.end field

.field public e:Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView$a;

.field public f:I

.field public g:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ljava/lang/String;

.field public i:Z

.field public j:Ll/hz10;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/hz10;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->d:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->f:I

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->i:Z

    .line 16
    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->c:Landroid/content/Context;

    .line 18
    .line 19
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->j:Ll/hz10;

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/feed/newui/camera/b;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/b;->O(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;I)V

    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/feed/newui/camera/b;Lcom/p1/mobile/putong/data/Music;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/b;->P(Lcom/p1/mobile/putong/data/Music;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/putong/feed/newui/camera/b;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->f:I

    return p0
.end method

.method public static bridge synthetic H(Lcom/p1/mobile/putong/feed/newui/camera/b;)Ll/hz10;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->j:Ll/hz10;

    return-object p0
.end method

.method public static bridge synthetic I(Lcom/p1/mobile/putong/feed/newui/camera/b;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->h:Ljava/lang/String;

    return-void
.end method

.method public static bridge synthetic J(Lcom/p1/mobile/putong/feed/newui/camera/b;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->f:I

    return-void
.end method

.method public static bridge synthetic K(Lcom/p1/mobile/putong/feed/newui/camera/b;I)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/b;->U(I)Z

    move-result p0

    return p0
.end method

.method private U(I)Z
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->f:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, p1, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    if-ltz v0, :cond_1

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->d:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/p1/mobile/putong/data/Music;

    .line 16
    .line 17
    iput v1, p1, Lcom/p1/mobile/putong/data/Music;->playState:I

    .line 18
    .line 19
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->f:I

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 22
    .line 23
    .line 24
    :cond_1
    const/4 p0, 0x0

    .line 25
    return p0
.end method


# virtual methods
.method public A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p4}, Lcom/p1/mobile/putong/feed/newui/camera/b;->getItemViewType(I)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/4 p3, 0x1

    .line 6
    if-ne p2, p3, :cond_0

    .line 7
    .line 8
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->b:Landroid/widget/TextView;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/b;->N()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;

    .line 21
    .line 22
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->e:Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView$a;

    .line 23
    .line 24
    iput-object p2, p1, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->l:Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView$a;

    .line 25
    .line 26
    new-instance p2, Ll/yy10;

    .line 27
    .line 28
    invoke-direct {p2, p0}, Ll/yy10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/b;)V

    .line 29
    .line 30
    .line 31
    iput-object p2, p1, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->k:Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView$b;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->d:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {p0, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Lcom/p1/mobile/putong/data/Music;

    .line 40
    .line 41
    invoke-virtual {p1, p0, p4}, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->L(Lcom/p1/mobile/putong/data/Music;I)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    add-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-ne p2, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/b;->L()Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget p2, Ll/tec0;->e:I

    .line 14
    .line 15
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;

    .line 20
    .line 21
    const/high16 p1, 0x41000000    # 8.0f

    .line 22
    .line 23
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    invoke-static {p0, p1}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 28
    .line 29
    .line 30
    const/high16 p1, 0x42f00000    # 120.0f

    .line 31
    .line 32
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    invoke-static {p0, p1}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 40
    .line 41
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/b;->L()Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    invoke-virtual {p2}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    sget v0, Ll/tec0;->X4:I

    .line 54
    .line 55
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    check-cast p2, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;

    .line 60
    .line 61
    iput-object p0, p2, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->n:Ll/jic0;

    .line 62
    .line 63
    iput-object p1, p2, Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView;->q:Landroid/view/ViewGroup;

    .line 64
    .line 65
    return-object p2
.end method

.method public final L()Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->c:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;

    .line 4
    .line 5
    return-object p0
.end method

.method public M()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->f:I

    .line 2
    .line 3
    if-ltz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->d:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-ge v0, v1, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->d:Ljava/util/List;

    .line 14
    .line 15
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->f:I

    .line 16
    .line 17
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/p1/mobile/putong/data/Music;

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    iput v1, v0, Lcom/p1/mobile/putong/data/Music;->playState:I

    .line 25
    .line 26
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->f:I

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 29
    .line 30
    .line 31
    const/4 v0, -0x1

    .line 32
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->f:I

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->h:Ljava/lang/String;

    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public final N()Ljava/lang/String;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/b;->L()Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->X0:I

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->d:Ljava/util/List;

    .line 17
    .line 18
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/b;->L()Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->z1:I

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/b;->L()Lcom/p1/mobile/putong/feed/newui/camera/MusicListAct;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->v1:I

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public final synthetic O(Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->g:Ll/y20;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic P(Lcom/p1/mobile/putong/data/Music;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Music;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->h:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

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

.method public Q(Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/camera/b$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/b$a;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/b;Ll/y20;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->e:Lcom/p1/mobile/putong/feed/newui/camera/MusicItemView$a;

    .line 7
    .line 8
    return-void
.end method

.method public R(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->g:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public S(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Music;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->h:Ljava/lang/String;

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
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->f:I

    .line 10
    .line 11
    const/4 v1, -0x1

    .line 12
    if-eq v0, v1, :cond_1

    .line 13
    .line 14
    new-instance v0, Ll/zy10;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/zy10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/b;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p1, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lcom/p1/mobile/putong/data/Music;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    const/4 v1, 0x3

    .line 32
    iput v1, v0, Lcom/p1/mobile/putong/data/Music;->playState:I

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 v0, 0x0

    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->h:Ljava/lang/String;

    .line 37
    .line 38
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->f:I

    .line 39
    .line 40
    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->d:Ljava/util/List;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public T()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->i:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public e(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/jic0;->getItemCount()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    add-int/lit8 v0, v0, -0x5

    .line 14
    .line 15
    if-le p1, v0, :cond_0

    .line 16
    .line 17
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->i:Z

    .line 18
    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->j:Ll/hz10;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/hz10;->l0()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/b;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-lt p1, p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x2

    .line 12
    return p0
.end method
