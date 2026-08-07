.class public Ll/ywg;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/feed/data/CameraSticker;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Landroid/content/Context;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/CameraSticker;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/animation/Animator;",
            ">;"
        }
    .end annotation
.end field

.field public final f:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/bkj0<",
            "Lcom/p1/mobile/putong/feed/data/CameraSticker;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation
.end field

.field public g:I

.field public h:I

.field public i:Lcom/p1/mobile/putong/feed/data/CameraSticker;

.field public j:Ll/a30;
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


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
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
    iput-object v0, p0, Ll/ywg;->d:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/ywg;->e:Ljava/util/HashMap;

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    iput v0, p0, Ll/ywg;->h:I

    .line 20
    .line 21
    iput-object p1, p0, Ll/ywg;->c:Landroid/content/Context;

    .line 22
    .line 23
    new-instance p1, Ll/vwg;

    .line 24
    .line 25
    invoke-direct {p1, p0}, Ll/vwg;-><init>(Ll/ywg;)V

    .line 26
    .line 27
    .line 28
    const/16 v0, 0x12c

    .line 29
    .line 30
    invoke-static {v0, p1}, Ll/dmk0;->a(ILl/y20;)Ll/y20;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iput-object p1, p0, Ll/ywg;->f:Ll/y20;

    .line 35
    .line 36
    invoke-direct {p0}, Ll/ywg;->act()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-static {}, Ll/xc4;->c()Ll/xc4;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object v0, v0, Ll/xc4;->f:Lrx/subjects/a;

    .line 45
    .line 46
    invoke-virtual {p0, p1, v0}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    new-instance v0, Ll/wwg;

    .line 59
    .line 60
    invoke-direct {v0, p0}, Ll/wwg;-><init>(Ll/ywg;)V

    .line 61
    .line 62
    .line 63
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public static synthetic E(Ll/ywg;ILcom/p1/mobile/putong/feed/data/CameraSticker;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ywg;->L(ILcom/p1/mobile/putong/feed/data/CameraSticker;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Ll/ywg;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ywg;->N(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic G(Ll/ywg;Lcom/p1/mobile/putong/feed/data/CameraSticker;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ywg;->O(Lcom/p1/mobile/putong/feed/data/CameraSticker;)V

    return-void
.end method

.method public static synthetic H(Ll/ywg;Lcom/p1/mobile/putong/feed/data/CameraSticker;IZLjava/io/File;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/ywg;->M(Lcom/p1/mobile/putong/feed/data/CameraSticker;IZLjava/io/File;)V

    return-void
.end method

.method private synthetic O(Lcom/p1/mobile/putong/feed/data/CameraSticker;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ywg;->Q(Lcom/p1/mobile/putong/feed/data/CameraSticker;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private P(Lcom/p1/mobile/putong/feed/data/CameraSticker;)V
    .locals 1

    .line 1
    iget p0, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->state:I

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    if-eq p0, v0, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x3

    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x4

    .line 10
    if-eq p0, v0, :cond_1

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-static {}, Ll/xc4;->c()Ll/xc4;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object p0, p0, Ll/xc4;->f:Lrx/subjects/a;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ll/xc4;->c()Ll/xc4;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Ll/xc4;->d()Ljava/util/Map;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->id:Ljava/lang/String;

    .line 31
    .line 32
    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    invoke-static {}, Ll/xc4;->c()Ll/xc4;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    iget-object p0, p0, Ll/xc4;->f:Lrx/subjects/a;

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    invoke-static {}, Ll/xc4;->c()Ll/xc4;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Ll/xc4;->d()Ljava/util/Map;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->id:Ljava/lang/String;

    .line 54
    .line 55
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method private R(Lcom/p1/mobile/putong/feed/data/CameraSticker;I)V
    .locals 1

    .line 1
    iget v0, p0, Ll/ywg;->h:I

    .line 2
    .line 3
    iput p2, p0, Ll/ywg;->h:I

    .line 4
    .line 5
    iput-object p1, p0, Ll/ywg;->i:Lcom/p1/mobile/putong/feed/data/CameraSticker;

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

.method private act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ywg;->c:Landroid/content/Context;

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
    check-cast p2, Lcom/p1/mobile/putong/feed/data/CameraSticker;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/ywg;->I(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/CameraSticker;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ywg;->d:Ljava/util/List;

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
    .locals 0

    .line 1
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFaceItemView;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ywg;->c:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFaceItemView;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public I(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/CameraSticker;II)V
    .locals 2

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFaceItemView;

    .line 2
    .line 3
    iget-object p3, p0, Ll/ywg;->d:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    if-ge p4, p3, :cond_1

    .line 10
    .line 11
    iget-object p3, p0, Ll/ywg;->d:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p3, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    check-cast p3, Lcom/p1/mobile/putong/feed/data/CameraSticker;

    .line 18
    .line 19
    iget-object v0, p3, Lcom/p1/mobile/putong/feed/data/CameraSticker;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/ywg;->e:Ljava/util/HashMap;

    .line 25
    .line 26
    invoke-static {}, Ll/xc4;->c()Ll/xc4;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1}, Ll/xc4;->e()Lcom/p1/mobile/putong/feed/data/CameraSticker;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {p1, p2, v0, p4, v1}, Lcom/p1/mobile/putong/feed/newui/kankan/view/FeedComicFaceItemView;->c(Lcom/p1/mobile/putong/feed/data/CameraSticker;Ljava/util/HashMap;ILcom/p1/mobile/putong/feed/data/CameraSticker;)Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    if-eqz p2, :cond_0

    .line 39
    .line 40
    iput p4, p0, Ll/ywg;->h:I

    .line 41
    .line 42
    :cond_0
    new-instance p2, Ll/uwg;

    .line 43
    .line 44
    invoke-direct {p2, p0, p4, p3}, Ll/uwg;-><init>(Ll/ywg;ILcom/p1/mobile/putong/feed/data/CameraSticker;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    return-void
.end method

.method public final J(Lcom/p1/mobile/putong/feed/data/CameraSticker;IZ)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/ywg;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->b:Lcom/p1/mobile/putong/feed/api/a;

    .line 6
    .line 7
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/feed/api/a;->c2(Lcom/p1/mobile/putong/feed/data/CameraSticker;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/xwg;

    .line 16
    .line 17
    invoke-direct {v1, p0, p1, p2, p3}, Ll/xwg;-><init>(Ll/ywg;Lcom/p1/mobile/putong/feed/data/CameraSticker;IZ)V

    .line 18
    .line 19
    .line 20
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public K(I)Lcom/p1/mobile/putong/feed/data/CameraSticker;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ywg;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ge p1, v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/ywg;->d:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/p1/mobile/putong/feed/data/CameraSticker;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public final synthetic L(ILcom/p1/mobile/putong/feed/data/CameraSticker;Landroid/view/View;)V
    .locals 1

    .line 1
    iget v0, p0, Ll/ywg;->g:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 7
    .line 8
    .line 9
    move-result-object p3

    .line 10
    check-cast p3, Landroidx/recyclerview/widget/RecyclerView;

    .line 11
    .line 12
    invoke-static {p3, p1}, Ll/ezq;->c(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/ywg;->f:Ll/y20;

    .line 16
    .line 17
    new-instance p3, Ll/bkj0;

    .line 18
    .line 19
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-direct {p3, p2, p1, v0}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    invoke-interface {p0, p3}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic M(Lcom/p1/mobile/putong/feed/data/CameraSticker;IZLjava/io/File;)V
    .locals 1

    .line 1
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

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
    invoke-virtual {p4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p4

    .line 17
    iput-object p4, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->modelFilePath:Ljava/lang/String;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p4, 0x4

    .line 21
    iput p4, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->state:I

    .line 22
    .line 23
    sget p4, Lcom/p1/mobile/putong/feed/R$string;->q1:I

    .line 24
    .line 25
    invoke-static {p4}, Ll/o1j0;->h(I)V

    .line 26
    .line 27
    .line 28
    :goto_0
    invoke-direct {p0, p1}, Ll/ywg;->P(Lcom/p1/mobile/putong/feed/data/CameraSticker;)V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Ll/xc4;->c()Ll/xc4;

    .line 32
    .line 33
    .line 34
    move-result-object p4

    .line 35
    invoke-virtual {p4}, Ll/xc4;->b()Lcom/p1/mobile/putong/feed/data/CameraSticker;

    .line 36
    .line 37
    .line 38
    move-result-object p4

    .line 39
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    iget-object p4, p4, Lcom/p1/mobile/putong/feed/data/CameraSticker;->cId:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->cId:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {p4, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result p4

    .line 53
    if-eqz p4, :cond_2

    .line 54
    .line 55
    iget p4, p0, Ll/ywg;->g:I

    .line 56
    .line 57
    if-ne p4, p2, :cond_2

    .line 58
    .line 59
    iget-boolean p4, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->hasModelFile:Z

    .line 60
    .line 61
    if-eqz p4, :cond_2

    .line 62
    .line 63
    iget-object p4, p0, Ll/ywg;->j:Ll/a30;

    .line 64
    .line 65
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p4

    .line 69
    if-eqz p4, :cond_1

    .line 70
    .line 71
    iget-object p4, p0, Ll/ywg;->j:Ll/a30;

    .line 72
    .line 73
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 78
    .line 79
    .line 80
    move-result-object p3

    .line 81
    invoke-interface {p4, v0, p1, p3}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    :cond_1
    invoke-direct {p0, p1, p2}, Ll/ywg;->R(Lcom/p1/mobile/putong/feed/data/CameraSticker;I)V

    .line 85
    .line 86
    .line 87
    :cond_2
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public final synthetic N(Ll/bkj0;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/feed/data/CameraSticker;

    .line 4
    .line 5
    iget-object v1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p1, Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    invoke-virtual {p0, v0, v1, p1}, Ll/ywg;->S(Lcom/p1/mobile/putong/feed/data/CameraSticker;IZ)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public Q(Lcom/p1/mobile/putong/feed/data/CameraSticker;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ywg;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_3

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    :goto_0
    iget-object v1, p0, Ll/ywg;->d:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-ge v0, v1, :cond_3

    .line 23
    .line 24
    iget-object v1, p0, Ll/ywg;->d:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/p1/mobile/putong/feed/data/CameraSticker;

    .line 31
    .line 32
    if-ne v1, p1, :cond_0

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_0
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_2

    .line 40
    .line 41
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->id:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->id:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-eqz v2, :cond_2

    .line 50
    .line 51
    iget v2, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->state:I

    .line 52
    .line 53
    iput v2, v1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->state:I

    .line 54
    .line 55
    const/4 v3, 0x3

    .line 56
    if-ne v2, v3, :cond_1

    .line 57
    .line 58
    const/4 v2, 0x1

    .line 59
    iput-boolean v2, v1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->hasModelFile:Z

    .line 60
    .line 61
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->modelFilePath:Ljava/lang/String;

    .line 62
    .line 63
    iput-object v2, v1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->modelFilePath:Ljava/lang/String;

    .line 64
    .line 65
    :cond_1
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 66
    .line 67
    .line 68
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_3
    :goto_1
    return-void
.end method

.method public final S(Lcom/p1/mobile/putong/feed/data/CameraSticker;IZ)V
    .locals 2

    .line 1
    iput p2, p0, Ll/ywg;->g:I

    .line 2
    .line 3
    invoke-static {}, Ll/xc4;->c()Ll/xc4;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Ll/xc4;->l(Lcom/p1/mobile/putong/feed/data/CameraSticker;)V

    .line 8
    .line 9
    .line 10
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->hasModelFile:Z

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Ll/ywg;->j:Ll/a30;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Ll/ywg;->j:Ll/a30;

    .line 23
    .line 24
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    invoke-interface {v0, v1, p1, p3}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    invoke-direct {p0, p1, p2}, Ll/ywg;->R(Lcom/p1/mobile/putong/feed/data/CameraSticker;I)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->state:I

    .line 40
    .line 41
    const/4 v1, 0x2

    .line 42
    if-ne v0, v1, :cond_2

    .line 43
    .line 44
    return-void

    .line 45
    :cond_2
    iput v1, p1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->state:I

    .line 46
    .line 47
    invoke-direct {p0, p1}, Ll/ywg;->P(Lcom/p1/mobile/putong/feed/data/CameraSticker;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, p1, p2, p3}, Ll/ywg;->J(Lcom/p1/mobile/putong/feed/data/CameraSticker;IZ)V

    .line 51
    .line 52
    .line 53
    :goto_0
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public T(Ll/a30;)V
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
    iput-object p1, p0, Ll/ywg;->j:Ll/a30;

    .line 2
    .line 3
    return-void
.end method

.method public U(Ljava/util/List;)V
    .locals 1
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/CameraSticker;",
            ">;)V"
        }
    .end annotation

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
    iget-object v0, p0, Ll/ywg;->d:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p1, v0}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iput-object p1, p0, Ll/ywg;->d:Ljava/util/List;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ywg;->K(I)Lcom/p1/mobile/putong/feed/data/CameraSticker;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
