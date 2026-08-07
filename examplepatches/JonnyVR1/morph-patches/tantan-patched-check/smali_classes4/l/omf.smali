.class public Ll/omf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/nql;


# static fields
.field public static k:I = 0x5

.field public static l:I = 0x4

.field public static m:I = 0x4


# instance fields
.field public a:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public b:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public c:Z

.field public d:Z

.field public e:I

.field public f:I

.field public g:Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

.field public h:Ll/e3i0;

.field public final i:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ll/ner;",
            "Landroid/util/SparseArray<",
            "Landroidx/recyclerview/widget/RecyclerView$u;",
            ">;>;"
        }
    .end annotation
.end field

.field public final j:Ll/e3i0$e;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedDeque;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedDeque;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/omf;->a:Ljava/util/Deque;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {v1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iput-object v1, p0, Ll/omf;->b:Lrx/subjects/a;

    .line 21
    .line 22
    iput-boolean v0, p0, Ll/omf;->c:Z

    .line 23
    .line 24
    iput-boolean v0, p0, Ll/omf;->d:Z

    .line 25
    .line 26
    iput v0, p0, Ll/omf;->e:I

    .line 27
    .line 28
    iput v0, p0, Ll/omf;->f:I

    .line 29
    .line 30
    new-instance v0, Ljava/util/HashMap;

    .line 31
    .line 32
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Ll/omf;->i:Ljava/util/HashMap;

    .line 36
    .line 37
    new-instance v0, Ll/hmf;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/hmf;-><init>(Ll/omf;)V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Ll/omf;->j:Ll/e3i0$e;

    .line 43
    .line 44
    iput-object p1, p0, Ll/omf;->g:Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

    .line 45
    .line 46
    return-void
.end method

.method public static synthetic h(Ll/omf;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/omf;->w()V

    return-void
.end method

.method public static synthetic i(Ljava/lang/Integer;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic j(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic k(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic l(Ll/omf;Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/omf;->t(Ljava/lang/Integer;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m(Ll/omf;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/omf;->u(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic n(Ll/omf;Landroid/view/View;ILandroid/view/ViewGroup;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/omf;->v(Landroid/view/View;ILandroid/view/ViewGroup;)V

    return-void
.end method

.method public static bridge synthetic o(Ll/omf;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/omf;->f:I

    return p0
.end method

.method public static bridge synthetic p(Ll/omf;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/omf;->f:I

    return-void
.end method

.method private z(I)V
    .locals 1

    .line 1
    iget p0, p0, Ll/omf;->e:I

    .line 2
    .line 3
    sget v0, Ll/omf;->k:I

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    sget p0, Ll/omf;->l:I

    .line 8
    .line 9
    if-gt p1, p0, :cond_0

    .line 10
    .line 11
    const-string p0, "left_card_count"

    .line 12
    .line 13
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    filled-new-array {p0}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string p1, "e_preload_home_card_used"

    .line 26
    .line 27
    const-string v0, "p_suggest_users_home_view"

    .line 28
    .line 29
    invoke-static {p1, v0, p0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method


# virtual methods
.method public a(Z)I
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget p0, Ll/kec0;->ba:I

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    sget p0, Ll/kec0;->X2:I

    .line 7
    .line 8
    return p0
.end method

.method public b()Landroid/view/View;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/omf;->a:Ljava/util/Deque;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Deque;->pop()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/view/View;

    .line 8
    .line 9
    iget-object v1, p0, Ll/omf;->a:Ljava/util/Deque;

    .line 10
    .line 11
    invoke-interface {v1}, Ljava/util/Deque;->size()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-direct {p0, v1}, Ll/omf;->z(I)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public c()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/omf;->a:Ljava/util/Deque;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public d(I)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Ll/omf;->b:Lrx/subjects/a;

    .line 2
    .line 3
    new-instance v0, Ll/kmf;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/kmf;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    new-instance v0, Ll/lmf;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Ll/lmf;-><init>(Ll/omf;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    new-instance v0, Ll/mmf;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/mmf;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    new-instance v0, Ll/nmf;

    .line 31
    .line 32
    invoke-direct {v0, p0}, Ll/nmf;-><init>(Ll/omf;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, v0}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/omf;->h:Ll/e3i0;

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
    iget-object p0, p0, Ll/omf;->h:Ll/e3i0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/e3i0;->b()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public g(Landroid/content/Context;Ll/ner;)V
    .locals 8

    .line 1
    iget-boolean v0, p0, Ll/omf;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Ll/omf;->c:Z

    .line 11
    .line 12
    iget-object v1, p0, Ll/omf;->h:Ll/e3i0;

    .line 13
    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    new-instance v1, Ll/e3i0;

    .line 17
    .line 18
    invoke-direct {v1, p1}, Ll/e3i0;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Ll/omf;->h:Ll/e3i0;

    .line 22
    .line 23
    :cond_1
    const/4 v1, 0x0

    .line 24
    move v2, v1

    .line 25
    :goto_0
    sget v3, Ll/omf;->k:I

    .line 26
    .line 27
    if-ge v2, v3, :cond_4

    .line 28
    .line 29
    const/4 v3, 0x2

    .line 30
    if-ne v2, v3, :cond_2

    .line 31
    .line 32
    iget-object v4, p0, Ll/omf;->h:Ll/e3i0;

    .line 33
    .line 34
    invoke-virtual {p0, v4, p1}, Ll/omf;->q(Ll/e3i0;Landroid/content/Context;)V

    .line 35
    .line 36
    .line 37
    :cond_2
    iget-object v4, p0, Ll/omf;->h:Ll/e3i0;

    .line 38
    .line 39
    invoke-virtual {p0, v1}, Ll/omf;->a(Z)I

    .line 40
    .line 41
    .line 42
    move-result v5

    .line 43
    iget-object v6, p0, Ll/omf;->j:Ll/e3i0$e;

    .line 44
    .line 45
    if-ge v2, v3, :cond_3

    .line 46
    .line 47
    move v3, v0

    .line 48
    goto :goto_1

    .line 49
    :cond_3
    move v3, v1

    .line 50
    :goto_1
    const/4 v7, 0x0

    .line 51
    invoke-virtual {v4, v5, v7, v6, v3}, Ll/e3i0;->e(ILandroid/view/ViewGroup;Ll/e3i0$e;Z)V

    .line 52
    .line 53
    .line 54
    add-int/lit8 v2, v2, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_4
    new-instance p1, Ll/imf;

    .line 58
    .line 59
    invoke-direct {p1}, Ll/imf;-><init>()V

    .line 60
    .line 61
    .line 62
    new-instance v0, Ll/jmf;

    .line 63
    .line 64
    invoke-direct {v0, p0}, Ll/jmf;-><init>(Ll/omf;)V

    .line 65
    .line 66
    .line 67
    invoke-interface {p2, p1, v0}, Ll/ner;->creates(Ll/y20;Ll/x20;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final q(Ll/e3i0;Landroid/content/Context;)V
    .locals 9

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;->AVATAR:Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;

    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;->BASE_INFO:Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;

    .line 12
    .line 13
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    new-instance v5, Landroid/widget/FrameLayout;

    .line 17
    .line 18
    invoke-direct {v5, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_1

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    move-object v6, v1

    .line 42
    check-cast v6, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;

    .line 43
    .line 44
    invoke-virtual {v6}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;->getPreLoadSize()I

    .line 45
    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    :goto_0
    const/4 v2, 0x2

    .line 49
    if-ge v1, v2, :cond_0

    .line 50
    .line 51
    sget v7, Ll/omf;->m:I

    .line 52
    .line 53
    const/4 v8, 0x1

    .line 54
    move-object v2, p0

    .line 55
    move-object v3, p1

    .line 56
    move-object v4, p2

    .line 57
    invoke-virtual/range {v2 .. v8}, Ll/omf;->y(Ll/e3i0;Landroid/content/Context;Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;IZ)V

    .line 58
    .line 59
    .line 60
    add-int/lit8 v1, v1, 0x1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    return-void
.end method

.method public r()I
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    return p0
.end method

.method public s()Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/omf;->g:Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic t(Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Ll/omf;->r()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-lt p1, p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public final synthetic u(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic v(Landroid/view/View;ILandroid/view/ViewGroup;)V
    .locals 2

    .line 1
    iget-object p2, p0, Ll/omf;->a:Ljava/util/Deque;

    .line 2
    .line 3
    invoke-interface {p2, p1}, Ljava/util/Deque;->push(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    iget p1, p0, Ll/omf;->e:I

    .line 7
    .line 8
    add-int/lit8 p1, p1, 0x1

    .line 9
    .line 10
    iput p1, p0, Ll/omf;->e:I

    .line 11
    .line 12
    const/4 p2, 0x2

    .line 13
    if-ne p1, p2, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/omf;->b:Lrx/subjects/a;

    .line 16
    .line 17
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Ljava/lang/Integer;

    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    add-int/lit8 p1, p1, 0x1

    .line 28
    .line 29
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 37
    .line 38
    .line 39
    move-result-wide p0

    .line 40
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    .line 42
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 43
    .line 44
    iget-wide v0, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested;->y2:J

    .line 45
    .line 46
    sub-long/2addr p0, v0

    .line 47
    iput-wide p0, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested;->z2:J

    .line 48
    .line 49
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 52
    .line 53
    iget-wide p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->A2:J

    .line 54
    .line 55
    const-wide/16 p2, 0x0

    .line 56
    .line 57
    cmp-long p0, p0, p2

    .line 58
    .line 59
    if-lez p0, :cond_0

    .line 60
    .line 61
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 64
    .line 65
    iget-wide p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->z2:J

    .line 66
    .line 67
    cmp-long p0, p0, p2

    .line 68
    .line 69
    if-lez p0, :cond_0

    .line 70
    .line 71
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 74
    .line 75
    iget-wide p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->A2:J

    .line 76
    .line 77
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 78
    .line 79
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 80
    .line 81
    iget-wide p2, p2, Lcom/p1/mobile/putong/core/api/CoreSuggested;->z2:J

    .line 82
    .line 83
    sub-long/2addr p0, p2

    .line 84
    new-instance p2, Ll/pf60;

    .line 85
    .line 86
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 87
    .line 88
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 89
    .line 90
    iget-wide v0, p3, Lcom/p1/mobile/putong/core/api/CoreSuggested;->A2:J

    .line 91
    .line 92
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 93
    .line 94
    .line 95
    move-result-object p3

    .line 96
    const-string v0, "suggest_network_time"

    .line 97
    .line 98
    invoke-direct {p2, v0, p3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    new-instance p3, Ll/pf60;

    .line 102
    .line 103
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 104
    .line 105
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 106
    .line 107
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->z2:J

    .line 108
    .line 109
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    const-string v1, "card_layout_time"

    .line 114
    .line 115
    invoke-direct {p3, v1, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 116
    .line 117
    .line 118
    new-instance v0, Ll/pf60;

    .line 119
    .line 120
    const-string v1, "suggest_network_time_diff_card_layout_time"

    .line 121
    .line 122
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-direct {v0, v1, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 127
    .line 128
    .line 129
    filled-new-array {p2, p3, v0}, [Ll/pf60;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    const-string p1, "e_homepage_network_and_layout"

    .line 134
    .line 135
    const-string p2, "p_suggest_users_home_view"

    .line 136
    .line 137
    invoke-static {p1, p2, p0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 138
    .line 139
    .line 140
    :cond_0
    return-void
.end method

.method public final synthetic w()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/omf;->a:Ljava/util/Deque;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Collection;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/omf;->s()Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {p0}, Ll/uj4;->c(Lcom/p1/mobile/putong/core/newui/home/cache/CacheCardType;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public x(Ll/e3i0;Landroid/content/Context;Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;I)V
    .locals 7

    .line 1
    const/4 v6, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move-object v3, p3

    .line 6
    move-object v4, p4

    .line 7
    move v5, p5

    .line 8
    invoke-virtual/range {v0 .. v6}, Ll/omf;->y(Ll/e3i0;Landroid/content/Context;Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;IZ)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public y(Ll/e3i0;Landroid/content/Context;Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;IZ)V
    .locals 2

    .line 1
    invoke-virtual {p4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;->getLayoutId()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;->getLayoutId()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    new-instance v1, Ll/omf$a;

    .line 12
    .line 13
    invoke-direct {v1, p0, p4, p2, p5}, Ll/omf$a;-><init>(Ll/omf;Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;Landroid/content/Context;I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0, p3, v1, p6}, Ll/e3i0;->e(ILandroid/view/ViewGroup;Ll/e3i0$e;Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method
