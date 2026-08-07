.class public Lcom/p1/mobile/putong/feed/newui/camera/widget/b;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Landroid/content/Context;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;",
            ">;"
        }
    .end annotation
.end field

.field public e:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

.field public f:I

.field public g:I

.field public h:I

.field public i:Ll/a30;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a30<",
            "Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Landroid/util/Pair<",
            "Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(I)V
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
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->d:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->f:I

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->g:I

    .line 16
    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->h:I

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/feed/newui/camera/widget/b;Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->K(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/feed/newui/camera/widget/b;Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->N(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;)V

    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/feed/newui/camera/widget/b;Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;ILjava/io/File;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->L(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;ILjava/io/File;)V

    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/feed/newui/camera/widget/b;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->M(Landroid/util/Pair;)V

    return-void
.end method

.method private synthetic M(Landroid/util/Pair;)V
    .locals 1

    .line 1
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 4
    .line 5
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->R(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private V(I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->f:I

    .line 2
    .line 3
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->f:I

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0, v0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(ILjava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->f:I

    .line 14
    .line 15
    invoke-virtual {p0, v0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(ILjava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->c:Landroid/content/Context;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    return-object p0
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->I(Landroid/view/View;Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget p2, Ll/tec0;->T:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public I(Landroid/view/View;Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;II)V
    .locals 2

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeupDownloadItemView;

    .line 2
    .line 3
    iget p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->f:I

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    if-ne p4, p3, :cond_0

    .line 7
    .line 8
    move p3, v0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p3, 0x0

    .line 11
    :goto_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->isNone()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeupDownloadItemView;->b(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;Z)V

    .line 18
    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_1
    invoke-virtual {p1, p2, p3, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeupDownloadItemView;->c(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;ZZ)V

    .line 22
    .line 23
    .line 24
    :goto_1
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeupDownloadItemView;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeupDownloadItemView;

    .line 25
    .line 26
    new-instance p3, Ll/tv2;

    .line 27
    .line 28
    invoke-direct {p3, p0, p2, p4}, Ll/tv2;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/b;Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;I)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public J(I)Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic K(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;ILandroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->j:Ll/y20;

    .line 2
    .line 3
    new-instance p3, Landroid/util/Pair;

    .line 4
    .line 5
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-direct {p3, p1, p2}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    invoke-interface {p0, p3}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic L(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;ILjava/io/File;)V
    .locals 2

    .line 1
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    iput v0, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->state:I

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->hasModelFile:Z

    .line 12
    .line 13
    invoke-virtual {p3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    iput-object p3, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->modelFilePath:Ljava/lang/String;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p3, 0x4

    .line 21
    iput p3, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->state:I

    .line 22
    .line 23
    sget p3, Lcom/p1/mobile/putong/feed/R$string;->q1:I

    .line 24
    .line 25
    invoke-static {p3}, Ll/o1j0;->h(I)V

    .line 26
    .line 27
    .line 28
    :goto_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->O(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;)V

    .line 29
    .line 30
    .line 31
    iget p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->g:I

    .line 32
    .line 33
    if-ne p3, p2, :cond_2

    .line 34
    .line 35
    iget-boolean p3, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->hasModelFile:Z

    .line 36
    .line 37
    if-eqz p3, :cond_2

    .line 38
    .line 39
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->i:Ll/a30;

    .line 40
    .line 41
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p3

    .line 45
    if-eqz p3, :cond_2

    .line 46
    .line 47
    iget p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->f:I

    .line 48
    .line 49
    if-ne p2, p3, :cond_1

    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->i:Ll/a30;

    .line 53
    .line 54
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 59
    .line 60
    invoke-interface {p3, p1, v0, v1}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->Q(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;I)V

    .line 64
    .line 65
    .line 66
    :cond_2
    const/4 p1, 0x0

    .line 67
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p0, p2, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(ILjava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final synthetic N(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->P(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final O(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;)V
    .locals 1

    .line 1
    iget p0, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->state:I

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    if-eq p0, v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x3

    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x4

    .line 10
    if-eq p0, v0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->j:Lrx/subjects/a;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public P(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;)V
    .locals 5
    .param p1    # Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    move v1, v0

    .line 17
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->d:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-ge v1, v2, :cond_2

    .line 24
    .line 25
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->d:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 32
    .line 33
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-eqz v3, :cond_1

    .line 38
    .line 39
    iget-object v3, v2, Lcom/p1/mobile/putong/feed/data/CameraSticker;->id:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v4, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->id:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-eqz v3, :cond_1

    .line 48
    .line 49
    iget v3, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->state:I

    .line 50
    .line 51
    iput v3, v2, Lcom/p1/mobile/putong/feed/data/CameraSticker;->state:I

    .line 52
    .line 53
    const/4 v4, 0x3

    .line 54
    if-ne v3, v4, :cond_0

    .line 55
    .line 56
    const/4 v3, 0x1

    .line 57
    iput-boolean v3, v2, Lcom/p1/mobile/putong/feed/data/CameraSticker;->hasModelFile:Z

    .line 58
    .line 59
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->modelFilePath:Ljava/lang/String;

    .line 60
    .line 61
    iput-object v3, v2, Lcom/p1/mobile/putong/feed/data/CameraSticker;->modelFilePath:Ljava/lang/String;

    .line 62
    .line 63
    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {p0, v1, v2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(ILjava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_2
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;I)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->f:I

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->f:I

    .line 4
    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->e:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final R(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;I)V
    .locals 3

    .line 1
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->g:I

    .line 2
    .line 3
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->hasModelFile:Z

    .line 4
    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->isNone()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->state:I

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    if-ne v0, v1, :cond_1

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_1
    iput v1, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->state:I

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->O(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;)V

    .line 23
    .line 24
    .line 25
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->act()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 30
    .line 31
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/feed/api/a;->a2(Lcom/p1/mobile/putong/feed/data/CameraSticker;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    new-instance v1, Ll/wv2;

    .line 40
    .line 41
    invoke-direct {v1, p0, p1, p2}, Ll/wv2;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/b;Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;I)V

    .line 42
    .line 43
    .line 44
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->i:Ll/a30;

    .line 53
    .line 54
    if-eqz v0, :cond_4

    .line 55
    .line 56
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->f:I

    .line 57
    .line 58
    if-ne p2, v1, :cond_3

    .line 59
    .line 60
    :goto_1
    return-void

    .line 61
    :cond_3
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 66
    .line 67
    invoke-interface {v0, p1, v1, v2}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    :cond_4
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->Q(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;I)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public S(Ll/a30;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a30<",
            "Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->i:Ll/a30;

    .line 2
    .line 3
    return-void
.end method

.method public T(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lt p1, v0, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->i:Ll/a30;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->d:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 21
    .line 22
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-interface {v0, v1, v2, v3}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->V(I)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public U(Landroid/content/Context;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->c:Landroid/content/Context;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->d:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 6
    .line 7
    .line 8
    new-instance p1, Ll/uv2;

    .line 9
    .line 10
    invoke-direct {p1, p0}, Ll/uv2;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/b;)V

    .line 11
    .line 12
    .line 13
    const/16 v0, 0x12c

    .line 14
    .line 15
    invoke-static {v0, p1}, Ll/dmk0;->a(ILl/y20;)Ll/y20;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->j:Ll/y20;

    .line 20
    .line 21
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->d:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {p1, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 33
    .line 34
    .line 35
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->act()Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->j:Lrx/subjects/a;

    .line 44
    .line 45
    invoke-virtual {p0, p1, p2}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    invoke-virtual {p1, p2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    new-instance p2, Ll/vv2;

    .line 58
    .line 59
    invoke-direct {p2, p0}, Ll/vv2;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/b;)V

    .line 60
    .line 61
    .line 62
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/b;->J(I)Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
