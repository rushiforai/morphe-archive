.class public abstract Li53;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract a(Lql3;)V
.end method

.method public abstract b()I
.end method

.method public abstract c(Ljava/lang/String;)Lal3;
.end method

.method public abstract d()Z
.end method

.method public abstract e(Ljava/util/AbstractList;)V
.end method

.method public abstract f(Lql3;)V
.end method

.method public final g(Lal3;Lml3;)V
    .registers 7

    invoke-interface {p1}, Lal3;->getId()J

    move-result-wide v0

    move-object v2, p0

    check-cast v2, Lcom/opera/android/bookmarks/h;

    const/4 v3, 0x1

    invoke-virtual {v2, v0, v1, v3}, Lcom/opera/android/bookmarks/h;->m(JZ)Lal3;

    move-result-object v0

    invoke-virtual {v2}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object v1

    invoke-interface {v0, v1}, Lal3;->a(Lcom/opera/android/bookmarks/c;)Lml3;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_34

    invoke-interface {p2}, Lml3;->h()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_35

    invoke-interface {p1}, Lol3;->g()Z

    move-result v0

    if-nez v0, :cond_35

    move-object v0, p2

    check-cast v0, Lcom/opera/android/bookmarks/c;

    iget-object v0, v0, Lcom/opera/android/bookmarks/b;->b:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    iget-wide v0, v0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v0, v1}, LJ/N;->Mc3pYXd5(J)J

    move-result-wide v0

    long-to-int v1, v0

    goto :goto_35

    :cond_34
    const/4 v1, -0x2

    :cond_35
    :goto_35
    invoke-virtual {p0, p1, p2, v1}, Li53;->h(Lal3;Lml3;I)V

    return-void
.end method

.method public abstract h(Lal3;Lml3;I)V
.end method
