.class public final Lcom/opera/android/bookmarks/BookmarksBridge;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;
    }
.end annotation


# static fields
.field public static final a:Li7f;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    sput-object v0, Lcom/opera/android/bookmarks/BookmarksBridge;->a:Li7f;

    return-void
.end method

.method public static bookmarkAllUserNodesRemoved()V
    .registers 4

    sget-object v0, Lcom/opera/android/bookmarks/BookmarksBridge;->a:Li7f;

    invoke-static {v0, v0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v0

    :cond_6
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_39

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/opera/android/bookmarks/a;

    check-cast v1, Lcom/opera/android/bookmarks/g;

    iget-object v2, v1, Lcom/opera/android/bookmarks/g;->d:Lcom/opera/android/bookmarks/h;

    iget-object v2, v2, Lcom/opera/android/bookmarks/h;->b:Lh7f;

    invoke-virtual {v2}, Lh7f;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_6

    invoke-virtual {v1}, Lcom/opera/android/bookmarks/g;->e()V

    iget-boolean v1, v1, Lcom/opera/android/bookmarks/g;->a:Z

    if-eqz v1, :cond_6

    invoke-static {v2, v2}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v1

    :goto_29
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lql3;

    invoke-interface {v2}, Lql3;->m()V

    goto :goto_29

    :cond_39
    return-void
.end method

.method public static bookmarkMetaInfoChanged(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)V
    .registers 3
    .param p0    # Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Lcom/opera/android/bookmarks/BookmarksBridge;->a:Li7f;

    invoke-static {v0, v0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v0

    :goto_6
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_18

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/opera/android/bookmarks/a;

    check-cast v1, Lcom/opera/android/bookmarks/g;

    invoke-virtual {v1, p0}, Lcom/opera/android/bookmarks/g;->b(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)V

    goto :goto_6

    :cond_18
    return-void
.end method

.method public static bookmarkModelLoaded()V
    .registers 2

    sget-object v0, Lcom/opera/android/bookmarks/BookmarksBridge;->a:Li7f;

    invoke-static {v0, v0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v0

    :goto_6
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1c

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/opera/android/bookmarks/a;

    check-cast v1, Lcom/opera/android/bookmarks/g;

    iget-object v1, v1, Lcom/opera/android/bookmarks/g;->d:Lcom/opera/android/bookmarks/h;

    iget-object v1, v1, Lcom/opera/android/bookmarks/h;->a:Lnrl;

    invoke-virtual {v1}, Lnrl;->K()V

    goto :goto_6

    :cond_1c
    return-void
.end method

.method public static bookmarkNodeAdded(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;J)V
    .registers 5
    .param p0    # Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Lcom/opera/android/bookmarks/BookmarksBridge;->a:Li7f;

    invoke-static {v0, v0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v0

    :goto_6
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_18

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/opera/android/bookmarks/a;

    check-cast v1, Lcom/opera/android/bookmarks/g;

    invoke-virtual {v1, p0, p1, p2}, Lcom/opera/android/bookmarks/g;->a(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;J)V

    goto :goto_6

    :cond_18
    return-void
.end method

.method public static bookmarkNodeChanged(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)V
    .registers 3
    .param p0    # Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Lcom/opera/android/bookmarks/BookmarksBridge;->a:Li7f;

    invoke-static {v0, v0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v0

    :goto_6
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_18

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/opera/android/bookmarks/a;

    check-cast v1, Lcom/opera/android/bookmarks/g;

    invoke-virtual {v1, p0}, Lcom/opera/android/bookmarks/g;->b(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)V

    goto :goto_6

    :cond_18
    return-void
.end method

.method public static bookmarkNodeChildrenReordered(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)V
    .registers 6
    .param p0    # Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Lcom/opera/android/bookmarks/BookmarksBridge;->a:Li7f;

    invoke-static {v0, v0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v0

    :cond_6
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_44

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/opera/android/bookmarks/a;

    check-cast v1, Lcom/opera/android/bookmarks/g;

    iget-object v2, v1, Lcom/opera/android/bookmarks/g;->d:Lcom/opera/android/bookmarks/h;

    iget-object v3, v2, Lcom/opera/android/bookmarks/h;->b:Lh7f;

    invoke-virtual {v3}, Lh7f;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_6

    invoke-virtual {v1, p0}, Lcom/opera/android/bookmarks/g;->d(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-virtual {v1}, Lcom/opera/android/bookmarks/g;->e()V

    invoke-static {v2, p0}, Lcom/opera/android/bookmarks/c;->m(Lcom/opera/android/bookmarks/h;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Lcom/opera/android/bookmarks/c;

    move-result-object v2

    iget-boolean v1, v1, Lcom/opera/android/bookmarks/g;->a:Z

    if-eqz v1, :cond_6

    invoke-static {v3, v3}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v1

    :goto_33
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lql3;

    const/4 v4, 0x0

    invoke-interface {v3, v4, v2}, Lql3;->s(Lcom/opera/android/bookmarks/b;Lcom/opera/android/bookmarks/c;)V

    goto :goto_33

    :cond_44
    return-void
.end method

.method public static bookmarkNodeMoved(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;JLcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;J)V
    .registers 13
    .param p0    # Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-object p1, Lcom/opera/android/bookmarks/BookmarksBridge;->a:Li7f;

    invoke-static {p1, p1}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p1

    :cond_6
    :goto_6
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_a6

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/opera/android/bookmarks/a;

    check-cast p2, Lcom/opera/android/bookmarks/g;

    iget-object v0, p2, Lcom/opera/android/bookmarks/g;->d:Lcom/opera/android/bookmarks/h;

    iget-object v1, v0, Lcom/opera/android/bookmarks/h;->b:Lh7f;

    invoke-virtual {v1}, Lh7f;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_6

    invoke-virtual {p2, p0}, Lcom/opera/android/bookmarks/g;->d(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Z

    move-result v2

    if-nez v2, :cond_2e

    invoke-virtual {p2, p3}, Lcom/opera/android/bookmarks/g;->d(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {p2, p3, p4, p5}, Lcom/opera/android/bookmarks/g;->a(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;J)V

    goto :goto_6

    :cond_2e
    invoke-virtual {p2, p3}, Lcom/opera/android/bookmarks/g;->d(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Z

    move-result v2

    if-nez v2, :cond_3c

    invoke-virtual {p3, p4, p5}, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->j(J)Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    move-result-object v0

    invoke-virtual {p2, p0, v0}, Lcom/opera/android/bookmarks/g;->c(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)V

    goto :goto_6

    :cond_3c
    invoke-virtual {p3, p4, p5}, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->j(J)Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/opera/android/bookmarks/b;->j(Lcom/opera/android/bookmarks/h;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Lcom/opera/android/bookmarks/b;

    move-result-object v2

    invoke-static {v0, p0}, Lcom/opera/android/bookmarks/c;->m(Lcom/opera/android/bookmarks/h;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Lcom/opera/android/bookmarks/c;

    move-result-object v3

    invoke-static {v0, p3}, Lcom/opera/android/bookmarks/c;->m(Lcom/opera/android/bookmarks/h;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Lcom/opera/android/bookmarks/c;

    move-result-object v0

    invoke-virtual {v3, v0}, Lcom/opera/android/bookmarks/b;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_72

    iget-object v5, p2, Lcom/opera/android/bookmarks/g;->c:Lc5o;

    if-eqz v5, :cond_72

    iget-object v6, v5, Lc5o;->a:Ljava/lang/Object;

    check-cast v6, Lcom/opera/android/bookmarks/b;

    invoke-virtual {v6, v2}, Lcom/opera/android/bookmarks/b;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_72

    iget-object v5, v5, Lc5o;->b:Ljava/lang/Object;

    check-cast v5, Lcom/opera/android/bookmarks/c;

    invoke-virtual {v5, v0}, Lcom/opera/android/bookmarks/b;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_72

    const-wide/16 v5, 0x0

    cmp-long v5, p4, v5

    if-nez v5, :cond_72

    const/4 v5, 0x0

    goto :goto_73

    :cond_72
    const/4 v5, 0x1

    :goto_73
    invoke-virtual {p2}, Lcom/opera/android/bookmarks/g;->e()V

    iget-boolean p2, p2, Lcom/opera/android/bookmarks/g;->a:Z

    if-eqz p2, :cond_6

    if-nez v4, :cond_90

    invoke-static {v1, v1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p2

    :goto_80
    invoke-virtual {p2}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-virtual {p2}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lql3;

    invoke-interface {v1, v2, v3, v0}, Lql3;->a(Lcom/opera/android/bookmarks/b;Lcom/opera/android/bookmarks/c;Lcom/opera/android/bookmarks/c;)V

    goto :goto_80

    :cond_90
    if-eqz v5, :cond_6

    invoke-static {v1, v1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p2

    :goto_96
    invoke-virtual {p2}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-virtual {p2}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lql3;

    invoke-interface {v1, v2, v0}, Lql3;->s(Lcom/opera/android/bookmarks/b;Lcom/opera/android/bookmarks/c;)V

    goto :goto_96

    :cond_a6
    return-void
.end method

.method public static bookmarkNodeRemoved(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;JLcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)V
    .registers 4
    .param p0    # Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-object p1, Lcom/opera/android/bookmarks/BookmarksBridge;->a:Li7f;

    invoke-static {p1, p1}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p1

    :goto_6
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_18

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/opera/android/bookmarks/a;

    check-cast p2, Lcom/opera/android/bookmarks/g;

    invoke-virtual {p2, p0, p3}, Lcom/opera/android/bookmarks/g;->c(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)V

    goto :goto_6

    :cond_18
    return-void
.end method

.method public static callBooleanCallback(Lcom/opera/api/Callback;Z)V
    .registers 2
    .param p0    # Lcom/opera/api/Callback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/opera/api/Callback;",
            "Z)V"
        }
    .end annotation

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public static extensiveBookmarkChangesBeginning()V
    .registers 3

    sget-object v0, Lcom/opera/android/bookmarks/BookmarksBridge;->a:Li7f;

    invoke-static {v0, v0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v0

    :cond_6
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2f

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/opera/android/bookmarks/a;

    check-cast v1, Lcom/opera/android/bookmarks/g;

    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/opera/android/bookmarks/g;->b:Z

    iget-object v1, v1, Lcom/opera/android/bookmarks/g;->d:Lcom/opera/android/bookmarks/h;

    iget-object v1, v1, Lcom/opera/android/bookmarks/h;->b:Lh7f;

    invoke-static {v1, v1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v1

    :goto_1f
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lql3;

    invoke-interface {v2}, Lql3;->E()V

    goto :goto_1f

    :cond_2f
    return-void
.end method

.method public static extensiveBookmarkChangesEnded()V
    .registers 8

    sget-object v0, Lcom/opera/android/bookmarks/BookmarksBridge;->a:Li7f;

    invoke-static {v0, v0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v0

    :cond_6
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_a9

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/opera/android/bookmarks/a;

    check-cast v1, Lcom/opera/android/bookmarks/g;

    invoke-virtual {v1}, Lcom/opera/android/bookmarks/g;->e()V

    const/4 v2, 0x0

    iput-boolean v2, v1, Lcom/opera/android/bookmarks/g;->b:Z

    iget-object v1, v1, Lcom/opera/android/bookmarks/g;->d:Lcom/opera/android/bookmarks/h;

    invoke-virtual {v1}, Lcom/opera/android/bookmarks/h;->l()Lcom/opera/android/bookmarks/c;

    move-result-object v3

    invoke-virtual {v3}, Lcom/opera/android/bookmarks/c;->isEmpty()Z

    move-result v3

    const/4 v4, 0x1

    xor-int/2addr v3, v4

    sget-boolean v5, Lalo;->i:Z

    if-eq v5, v3, :cond_2d

    sput-boolean v3, Lalo;->i:Z

    move v2, v4

    :cond_2d
    iget-object v3, v1, Lcom/opera/android/bookmarks/h;->b:Lh7f;

    if-eqz v2, :cond_53

    invoke-static {v1}, Lalo;->G(Lcom/opera/android/bookmarks/h;)Z

    move-result v2

    if-nez v2, :cond_53

    invoke-static {v3, v3}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v2

    :goto_3b
    invoke-virtual {v2}, Lg7f;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_53

    invoke-virtual {v2}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lql3;

    invoke-virtual {v1}, Lcom/opera/android/bookmarks/h;->l()Lcom/opera/android/bookmarks/c;

    move-result-object v6

    invoke-virtual {v1}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object v7

    invoke-interface {v5, v6, v7}, Lql3;->y(Lcom/opera/android/bookmarks/b;Lcom/opera/android/bookmarks/c;)V

    goto :goto_3b

    :cond_53
    invoke-virtual {v1}, Lcom/opera/android/bookmarks/h;->n()Lcom/opera/android/bookmarks/c;

    move-result-object v2

    invoke-virtual {v2}, Lcom/opera/android/bookmarks/c;->isEmpty()Z

    move-result v2

    xor-int/lit8 v5, v2, 0x1

    sget-boolean v6, Lalo;->j:Z

    if-eq v6, v5, :cond_95

    sput-boolean v5, Lalo;->j:Z

    if-eqz v2, :cond_77

    invoke-virtual {v1}, Lcom/opera/android/bookmarks/h;->n()Lcom/opera/android/bookmarks/c;

    move-result-object v2

    invoke-virtual {v2}, Lcom/opera/android/bookmarks/c;->isEmpty()Z

    move-result v2

    xor-int/lit8 v5, v2, 0x1

    sget-boolean v2, Lalo;->j:Z

    if-eq v2, v5, :cond_76

    sput-boolean v5, Lalo;->j:Z

    goto :goto_77

    :cond_76
    move v5, v2

    :cond_77
    :goto_77
    if-nez v5, :cond_95

    invoke-static {v3, v3}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v2

    :goto_7d
    invoke-virtual {v2}, Lg7f;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_95

    invoke-virtual {v2}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lql3;

    invoke-virtual {v1}, Lcom/opera/android/bookmarks/h;->n()Lcom/opera/android/bookmarks/c;

    move-result-object v5

    invoke-virtual {v1}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Lql3;->y(Lcom/opera/android/bookmarks/b;Lcom/opera/android/bookmarks/c;)V

    goto :goto_7d

    :cond_95
    invoke-static {v3, v3}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v1

    :goto_99
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lql3;

    invoke-interface {v2}, Lql3;->p()V

    goto :goto_99

    :cond_a9
    return-void
.end method
