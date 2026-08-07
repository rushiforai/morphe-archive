.class public Ll/fi;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/account/data/CameraSticker;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/account/data/CameraSticker;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field public d:Landroid/content/Context;

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/account/data/CameraSticker;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/animation/Animator;",
            ">;"
        }
    .end annotation
.end field

.field public g:I

.field public h:I

.field public i:Lcom/p1/mobile/putong/account/data/CameraSticker;

.field public j:I


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
    iput-object v0, p0, Ll/fi;->e:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/fi;->f:Ljava/util/HashMap;

    .line 17
    .line 18
    const/4 v0, -0x1

    .line 19
    iput v0, p0, Ll/fi;->g:I

    .line 20
    .line 21
    iput v0, p0, Ll/fi;->h:I

    .line 22
    .line 23
    iput-object p1, p0, Ll/fi;->d:Landroid/content/Context;

    .line 24
    .line 25
    new-instance p1, Ll/ci;

    .line 26
    .line 27
    invoke-direct {p1, p0}, Ll/ci;-><init>(Ll/fi;)V

    .line 28
    .line 29
    .line 30
    const/16 v0, 0x12c

    .line 31
    .line 32
    invoke-static {v0, p1}, Ll/dmk0;->a(ILl/y20;)Ll/y20;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iput-object p1, p0, Ll/fi;->c:Ll/y20;

    .line 37
    .line 38
    invoke-direct {p0}, Ll/fi;->act()Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-static {}, Ll/pj;->c()Ll/pj;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object v0, v0, Ll/pj;->f:Lrx/subjects/a;

    .line 47
    .line 48
    invoke-virtual {p0, p1, v0}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    new-instance v0, Ll/di;

    .line 61
    .line 62
    invoke-direct {v0, p0}, Ll/di;-><init>(Ll/fi;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public static synthetic E(Ll/fi;Lcom/p1/mobile/putong/account/data/CameraSticker;ILjava/io/File;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/fi;->M(Lcom/p1/mobile/putong/account/data/CameraSticker;ILjava/io/File;)V

    return-void
.end method

.method public static synthetic F(Ll/fi;Lcom/p1/mobile/putong/account/data/CameraSticker;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fi;->L(Lcom/p1/mobile/putong/account/data/CameraSticker;)V

    return-void
.end method

.method public static synthetic G(Ll/fi;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/fi;->K(Ll/pf60;)V

    return-void
.end method

.method private synthetic K(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/account/data/CameraSticker;

    .line 4
    .line 5
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

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
    invoke-virtual {p0, v0, p1}, Ll/fi;->Q(Lcom/p1/mobile/putong/account/data/CameraSticker;I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fi;->d:Landroid/content/Context;

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
    check-cast p2, Lcom/p1/mobile/putong/account/data/CameraSticker;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/fi;->H(Landroid/view/View;Lcom/p1/mobile/putong/account/data/CameraSticker;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fi;->e:Ljava/util/List;

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
    invoke-direct {p0}, Ll/fi;->act()Lcom/p1/mobile/android/app/Act;

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
    sget p2, Ll/hec0;->i:I

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

.method public H(Landroid/view/View;Lcom/p1/mobile/putong/account/data/CameraSticker;II)V
    .locals 6

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMaskItemView;

    .line 3
    .line 4
    iget-object v3, p0, Ll/fi;->f:Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-static {}, Ll/pj;->c()Ll/pj;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Ll/pj;->e()Lcom/p1/mobile/putong/account/data/CameraSticker;

    .line 11
    .line 12
    .line 13
    move-result-object v5

    .line 14
    move-object v2, p0

    .line 15
    move-object v1, p2

    .line 16
    move v4, p4

    .line 17
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountCameraMaskItemView;->d(Lcom/p1/mobile/putong/account/data/CameraSticker;Ll/fi;Ljava/util/HashMap;ILcom/p1/mobile/putong/account/data/CameraSticker;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    iput v4, v2, Ll/fi;->g:I

    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public I()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, -0x1

    .line 3
    invoke-virtual {p0, v0, v1}, Ll/fi;->P(Lcom/p1/mobile/putong/account/data/CameraSticker;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public J(I)Lcom/p1/mobile/putong/account/data/CameraSticker;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fi;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/account/data/CameraSticker;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic L(Lcom/p1/mobile/putong/account/data/CameraSticker;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fi;->O(Lcom/p1/mobile/putong/account/data/CameraSticker;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic M(Lcom/p1/mobile/putong/account/data/CameraSticker;ILjava/io/File;)V
    .locals 1

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
    iput v0, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->state:I

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->hasModelFile:Z

    .line 12
    .line 13
    invoke-virtual {p3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p3

    .line 17
    iput-object p3, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->modelFilePath:Ljava/lang/String;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p3, 0x4

    .line 21
    iput p3, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->state:I

    .line 22
    .line 23
    const-string p3, "\u7f51\u7edc\u4e0d\u7ed9\u529b"

    .line 24
    .line 25
    invoke-static {p3}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :goto_0
    invoke-virtual {p0, p1}, Ll/fi;->N(Lcom/p1/mobile/putong/account/data/CameraSticker;)V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Ll/pj;->c()Ll/pj;

    .line 32
    .line 33
    .line 34
    move-result-object p3

    .line 35
    invoke-virtual {p3}, Ll/pj;->b()Lcom/p1/mobile/putong/account/data/CameraSticker;

    .line 36
    .line 37
    .line 38
    move-result-object p3

    .line 39
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    iget-object p3, p3, Lcom/p1/mobile/putong/account/data/CameraSticker;->cId:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->cId:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {p3, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result p3

    .line 53
    if-eqz p3, :cond_2

    .line 54
    .line 55
    iget p3, p0, Ll/fi;->h:I

    .line 56
    .line 57
    if-ne p3, p2, :cond_2

    .line 58
    .line 59
    iget-boolean p1, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->hasModelFile:Z

    .line 60
    .line 61
    if-eqz p1, :cond_2

    .line 62
    .line 63
    const/4 p1, 0x0

    .line 64
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result p3

    .line 68
    if-nez p3, :cond_1

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_1
    throw p1

    .line 72
    :cond_2
    :goto_1
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final N(Lcom/p1/mobile/putong/account/data/CameraSticker;)V
    .locals 1

    .line 1
    iget p0, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->state:I

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
    invoke-static {}, Ll/pj;->c()Ll/pj;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object p0, p0, Ll/pj;->f:Lrx/subjects/a;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ll/pj;->c()Ll/pj;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Ll/pj;->d()Ljava/util/Map;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    iget-object p1, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->id:Ljava/lang/String;

    .line 31
    .line 32
    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    invoke-static {}, Ll/pj;->c()Ll/pj;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    iget-object p0, p0, Ll/pj;->f:Lrx/subjects/a;

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    invoke-static {}, Ll/pj;->c()Ll/pj;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Ll/pj;->d()Ljava/util/Map;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->id:Ljava/lang/String;

    .line 54
    .line 55
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public O(Lcom/p1/mobile/putong/account/data/CameraSticker;)V
    .locals 4
    .param p1    # Lcom/p1/mobile/putong/account/data/CameraSticker;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/fi;->e:Ljava/util/List;

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
    iget-object v1, p0, Ll/fi;->e:Ljava/util/List;

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
    iget-object v1, p0, Ll/fi;->e:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lcom/p1/mobile/putong/account/data/CameraSticker;

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
    iget-object v2, v1, Lcom/p1/mobile/putong/account/data/CameraSticker;->id:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v3, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->id:Ljava/lang/String;

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
    iget v2, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->state:I

    .line 52
    .line 53
    iput v2, v1, Lcom/p1/mobile/putong/account/data/CameraSticker;->state:I

    .line 54
    .line 55
    const/4 v3, 0x3

    .line 56
    if-ne v2, v3, :cond_1

    .line 57
    .line 58
    const/4 v2, 0x1

    .line 59
    iput-boolean v2, v1, Lcom/p1/mobile/putong/account/data/CameraSticker;->hasModelFile:Z

    .line 60
    .line 61
    iget-object v2, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->modelFilePath:Ljava/lang/String;

    .line 62
    .line 63
    iput-object v2, v1, Lcom/p1/mobile/putong/account/data/CameraSticker;->modelFilePath:Ljava/lang/String;

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

.method public final P(Lcom/p1/mobile/putong/account/data/CameraSticker;I)V
    .locals 1

    .line 1
    iget v0, p0, Ll/fi;->g:I

    .line 2
    .line 3
    iput p2, p0, Ll/fi;->g:I

    .line 4
    .line 5
    iput-object p1, p0, Ll/fi;->i:Lcom/p1/mobile/putong/account/data/CameraSticker;

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

.method public final Q(Lcom/p1/mobile/putong/account/data/CameraSticker;I)V
    .locals 2

    .line 1
    invoke-static {}, Ll/pj;->c()Ll/pj;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Ll/pj;->j(Lcom/p1/mobile/putong/account/data/CameraSticker;)V

    .line 6
    .line 7
    .line 8
    iput p2, p0, Ll/fi;->h:I

    .line 9
    .line 10
    invoke-static {}, Ll/pj;->c()Ll/pj;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0, p1}, Ll/pj;->l(Lcom/p1/mobile/putong/account/data/CameraSticker;)V

    .line 15
    .line 16
    .line 17
    iget-boolean v0, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->hasModelFile:Z

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-nez v1, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0, p1, p2}, Ll/fi;->P(Lcom/p1/mobile/putong/account/data/CameraSticker;I)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    throw v0

    .line 33
    :cond_1
    iget v0, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->state:I

    .line 34
    .line 35
    const/4 v1, 0x2

    .line 36
    if-ne v0, v1, :cond_2

    .line 37
    .line 38
    return-void

    .line 39
    :cond_2
    iput v1, p1, Lcom/p1/mobile/putong/account/data/CameraSticker;->state:I

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Ll/fi;->N(Lcom/p1/mobile/putong/account/data/CameraSticker;)V

    .line 42
    .line 43
    .line 44
    invoke-direct {p0}, Ll/fi;->act()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    sget-object v1, Lcom/p1/mobile/putong/account/ui/accountai/SignUpAiAct;->c:Ll/lh;

    .line 49
    .line 50
    invoke-virtual {v1, p1}, Ll/lh;->C(Lcom/p1/mobile/putong/account/data/CameraSticker;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v1, Ll/ei;

    .line 59
    .line 60
    invoke-direct {v1, p0, p1, p2}, Ll/ei;-><init>(Ll/fi;Lcom/p1/mobile/putong/account/data/CameraSticker;I)V

    .line 61
    .line 62
    .line 63
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 68
    .line 69
    .line 70
    :goto_0
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public R(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView$a;)V
    .locals 0

    .line 1
    return-void
.end method

.method public S(Ljava/util/List;)V
    .locals 1
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/account/data/CameraSticker;",
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
    iput-object p1, p0, Ll/fi;->e:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {}, Ll/pj;->c()Ll/pj;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0, p1}, Ll/pj;->f(Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fi;->J(I)Lcom/p1/mobile/putong/account/data/CameraSticker;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
