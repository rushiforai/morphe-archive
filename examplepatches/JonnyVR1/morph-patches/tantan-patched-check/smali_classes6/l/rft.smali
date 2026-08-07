.class public final Ll/rft;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/rft$b;
    }
.end annotation


# instance fields
.field public final a:F

.field public final b:Z

.field public final c:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Landroid/util/Pair<",
            "Ljava/lang/Boolean;",
            "Lcom/p1/mobile/putong/live/base/util/IntSet;",
            ">;>;"
        }
    .end annotation
.end field

.field public d:Landroidx/recyclerview/widget/RecyclerView;

.field public e:Lcom/p1/mobile/putong/live/base/util/IntSet;

.field public f:Ll/kcg0;

.field public g:Ll/kcg0;

.field public final h:Ljava/lang/Object;

.field public final i:Ljava/lang/Object;

.field public j:Ll/ner;

.field public k:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ll/rft$b;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final m:Landroidx/recyclerview/widget/RecyclerView$t;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(ZLl/ner;Ll/pcj;F)V
    .locals 1
    .param p2    # Ll/ner;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/pcj;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # F
        .annotation build Landroidx/annotation/FloatRange;
            from = 0.0
            to = 1.0
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ll/ner;",
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;F)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/rft;->c:Lrx/subjects/b;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Ll/rft;->e:Lcom/p1/mobile/putong/live/base/util/IntSet;

    .line 12
    .line 13
    new-instance v0, Ljava/lang/Object;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/rft;->h:Ljava/lang/Object;

    .line 19
    .line 20
    new-instance v0, Ljava/lang/Object;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/rft;->i:Ljava/lang/Object;

    .line 26
    .line 27
    new-instance v0, Ll/rft$a;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Ll/rft$a;-><init>(Ll/rft;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Ll/rft;->m:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 33
    .line 34
    iput-boolean p1, p0, Ll/rft;->b:Z

    .line 35
    .line 36
    iput-object p2, p0, Ll/rft;->j:Ll/ner;

    .line 37
    .line 38
    iput-object p3, p0, Ll/rft;->k:Ll/pcj;

    .line 39
    .line 40
    iput p4, p0, Ll/rft;->a:F

    .line 41
    .line 42
    return-void
.end method

.method public static synthetic a(Ll/rft;Landroid/util/Pair;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rft;->q(Landroid/util/Pair;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(Ll/rft;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rft;->o(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic c(Landroid/util/Pair;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/base/util/IntSet;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/android/app/Frag;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getUserVisibleHint()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic e(Ll/rft;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rft;->n(Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic f(Ll/rft;Landroid/util/Pair;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rft;->p(Landroid/util/Pair;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g(Landroid/util/Pair;Landroid/util/Pair;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    invoke-virtual {p1, p0}, Landroid/util/Pair;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static synthetic h(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic i(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic j(Ll/rft;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rft;->l(Z)V

    return-void
.end method


# virtual methods
.method public k(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 4
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rft;->w()V

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iget-object v0, p0, Ll/rft;->h:Ljava/lang/Object;

    .line 8
    .line 9
    monitor-enter v0

    .line 10
    :try_start_0
    iget-object v1, p0, Ll/rft;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 11
    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    iget-object v2, p0, Ll/rft;->m:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->removeOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    :goto_0
    iget-object v1, p0, Ll/rft;->m:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 23
    .line 24
    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Ll/rft;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 28
    .line 29
    iget-object p1, p0, Ll/rft;->c:Lrx/subjects/b;

    .line 30
    .line 31
    new-instance v1, Landroid/util/Pair;

    .line 32
    .line 33
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/live/base/util/IntSet;->emptySet()Lcom/p1/mobile/putong/live/base/util/IntSet;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-direct {v1, v2, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ll/rft;->t()V

    .line 46
    .line 47
    .line 48
    monitor-exit v0

    .line 49
    return-void

    .line 50
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    throw p0
.end method

.method public final l(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/rft;->h:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/rft;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    monitor-exit v0

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-boolean v2, p0, Ll/rft;->b:Z

    .line 13
    .line 14
    iget v3, p0, Ll/rft;->a:F

    .line 15
    .line 16
    invoke-static {v1, v2, v3}, Ll/xrc0;->e(Landroidx/recyclerview/widget/RecyclerView;ZF)Lcom/p1/mobile/putong/live/base/util/IntSet;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    iget-object p0, p0, Ll/rft;->c:Lrx/subjects/b;

    .line 22
    .line 23
    new-instance v0, Landroid/util/Pair;

    .line 24
    .line 25
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-direct {v0, p1, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    throw p0
.end method

.method public m()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/rft;->l:Ll/rft$b;

    .line 3
    .line 4
    iget-object v1, p0, Ll/rft;->h:Ljava/lang/Object;

    .line 5
    .line 6
    monitor-enter v1

    .line 7
    :try_start_0
    iget-object v2, p0, Ll/rft;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 8
    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    iget-object v3, p0, Ll/rft;->m:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 12
    .line 13
    invoke-virtual {v2, v3}, Landroidx/recyclerview/widget/RecyclerView;->removeOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/rft;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 17
    .line 18
    iget-object v2, p0, Ll/rft;->g:Ll/kcg0;

    .line 19
    .line 20
    invoke-static {v2}, Ll/psd0;->z(Ll/kcg0;)V

    .line 21
    .line 22
    .line 23
    iget-object v2, p0, Ll/rft;->f:Ll/kcg0;

    .line 24
    .line 25
    invoke-static {v2}, Ll/psd0;->z(Ll/kcg0;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Ll/rft;->j:Ll/ner;

    .line 29
    .line 30
    iput-object v0, p0, Ll/rft;->k:Ll/pcj;

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception p0

    .line 34
    goto :goto_1

    .line 35
    :cond_0
    :goto_0
    monitor-exit v1

    .line 36
    return-void

    .line 37
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    throw p0
.end method

.method public final n(Landroid/util/Pair;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair<",
            "Ljava/lang/Boolean;",
            "Lcom/p1/mobile/putong/live/base/util/IntSet;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/rft;->i:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast v1, Lcom/p1/mobile/putong/live/base/util/IntSet;

    .line 7
    .line 8
    iget-object v2, p0, Ll/rft;->e:Lcom/p1/mobile/putong/live/base/util/IntSet;

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    if-eqz v2, :cond_1

    .line 12
    .line 13
    iget-object v2, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v2, Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/util/IntSet;->max()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    iget-object v4, p0, Ll/rft;->e:Lcom/p1/mobile/putong/live/base/util/IntSet;

    .line 29
    .line 30
    invoke-virtual {v4}, Lcom/p1/mobile/putong/live/base/util/IntSet;->max()I

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    if-ge v2, v4, :cond_1

    .line 35
    .line 36
    const/4 v3, 0x1

    .line 37
    goto :goto_0

    .line 38
    :catchall_0
    move-exception p0

    .line 39
    goto :goto_2

    .line 40
    :cond_1
    :goto_0
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 41
    .line 42
    check-cast p1, Ljava/lang/Boolean;

    .line 43
    .line 44
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_2

    .line 49
    .line 50
    move-object p1, v1

    .line 51
    goto :goto_1

    .line 52
    :cond_2
    iget-object p1, p0, Ll/rft;->e:Lcom/p1/mobile/putong/live/base/util/IntSet;

    .line 53
    .line 54
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/live/base/util/IntSet;->difference(Lcom/p1/mobile/putong/live/base/util/IntSet;)Lcom/p1/mobile/putong/live/base/util/IntSet;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    :goto_1
    iput-object v1, p0, Ll/rft;->e:Lcom/p1/mobile/putong/live/base/util/IntSet;

    .line 59
    .line 60
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    :try_start_1
    iget-object p0, p0, Ll/rft;->l:Ll/rft$b;

    .line 62
    .line 63
    if-eqz p0, :cond_3

    .line 64
    .line 65
    new-instance v0, Ljava/util/ArrayList;

    .line 66
    .line 67
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 68
    .line 69
    .line 70
    invoke-interface {p0, v0, v3}, Ll/rft$b;->m(Ljava/util/List;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 71
    .line 72
    .line 73
    :cond_3
    return-void

    .line 74
    :catchall_1
    move-exception p0

    .line 75
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :goto_2
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 80
    throw p0
.end method

.method public final synthetic o(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Ll/rft;->l(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic p(Landroid/util/Pair;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    iget-object p0, p0, Ll/rft;->j:Ll/ner;

    .line 4
    .line 5
    invoke-interface {p0}, Ll/ner;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic q(Landroid/util/Pair;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rft;->k:Ll/pcj;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    invoke-interface {p0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public r(Lcom/p1/mobile/android/app/Frag;Lrx/subjects/b;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Frag;",
            "Lrx/subjects/b<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/rft;->g:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-virtual {p2}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p2, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    new-instance v0, Ll/ift;

    .line 23
    .line 24
    invoke-direct {v0, p1}, Ll/ift;-><init>(Lcom/p1/mobile/android/app/Frag;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p2, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    new-instance p2, Ll/jft;

    .line 32
    .line 33
    invoke-direct {p2, p0}, Ll/jft;-><init>(Ll/rft;)V

    .line 34
    .line 35
    .line 36
    new-instance v0, Ll/kft;

    .line 37
    .line 38
    invoke-direct {v0}, Ll/kft;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-static {p2, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iput-object p1, p0, Ll/rft;->g:Ll/kcg0;

    .line 50
    .line 51
    return-void
.end method

.method public s(Ll/rft$b;)V
    .locals 0
    .param p1    # Ll/rft$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/rft;->l:Ll/rft$b;

    .line 2
    .line 3
    return-void
.end method

.method public final t()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/rft;->f:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/rft;->j:Ll/ner;

    .line 7
    .line 8
    iget-object v1, p0, Ll/rft;->c:Lrx/subjects/b;

    .line 9
    .line 10
    invoke-interface {v0, v1}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/lft;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/lft;-><init>(Ll/rft;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/mft;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/mft;-><init>(Ll/rft;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/nft;

    .line 41
    .line 42
    invoke-direct {v1}, Ll/nft;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Lrx/c;->distinctUntilChanged(Ll/rcj;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/oft;

    .line 50
    .line 51
    invoke-direct {v1}, Ll/oft;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    new-instance v1, Ll/pft;

    .line 59
    .line 60
    invoke-direct {v1, p0}, Ll/pft;-><init>(Ll/rft;)V

    .line 61
    .line 62
    .line 63
    new-instance v2, Ll/qft;

    .line 64
    .line 65
    invoke-direct {v2}, Ll/qft;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iput-object v0, p0, Ll/rft;->f:Ll/kcg0;

    .line 77
    .line 78
    return-void
.end method

.method public u()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/rft;->l(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public v()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/rft;->l(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public w()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/rft;->h:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/rft;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    monitor-exit v0

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v1, p0, Ll/rft;->f:Ll/kcg0;

    .line 13
    .line 14
    invoke-static {v1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Ll/rft;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 18
    .line 19
    iget-object v2, p0, Ll/rft;->m:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->removeOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 22
    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    iput-object v1, p0, Ll/rft;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 26
    .line 27
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    iget-object v2, p0, Ll/rft;->i:Ljava/lang/Object;

    .line 29
    .line 30
    monitor-enter v2

    .line 31
    :try_start_1
    iput-object v1, p0, Ll/rft;->e:Lcom/p1/mobile/putong/live/base/util/IntSet;

    .line 32
    .line 33
    monitor-exit v2

    .line 34
    return-void

    .line 35
    :catchall_1
    move-exception p0

    .line 36
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 37
    throw p0

    .line 38
    :goto_0
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 39
    throw p0
.end method
