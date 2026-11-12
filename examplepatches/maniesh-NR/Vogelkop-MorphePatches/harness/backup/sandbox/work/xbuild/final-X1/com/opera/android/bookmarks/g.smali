.class public final Lcom/opera/android/bookmarks/g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/android/bookmarks/a;


# instance fields
.field public a:Z

.field public b:Z

.field public c:Lc5o;

.field public final synthetic d:Lcom/opera/android/bookmarks/h;


# direct methods
.method public constructor <init>(Lcom/opera/android/bookmarks/h;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/bookmarks/g;->d:Lcom/opera/android/bookmarks/h;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/opera/android/bookmarks/g;->a:Z

    return-void
.end method


# virtual methods
.method public final a(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;J)V
    .registers 11

    iget-object v0, p0, Lcom/opera/android/bookmarks/g;->d:Lcom/opera/android/bookmarks/h;

    iget-object v1, v0, Lcom/opera/android/bookmarks/h;->b:Lh7f;

    invoke-virtual {v1}, Lh7f;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_53

    invoke-virtual {p0, p1}, Lcom/opera/android/bookmarks/g;->d(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Z

    move-result v2

    if-eqz v2, :cond_53

    invoke-virtual {p0}, Lcom/opera/android/bookmarks/g;->e()V

    invoke-virtual {p1, p2, p3}, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->j(J)Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/opera/android/bookmarks/b;->j(Lcom/opera/android/bookmarks/h;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Lcom/opera/android/bookmarks/b;

    move-result-object v2

    invoke-static {v0, p1}, Lcom/opera/android/bookmarks/c;->m(Lcom/opera/android/bookmarks/h;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Lcom/opera/android/bookmarks/c;

    move-result-object v0

    iget-boolean v3, p0, Lcom/opera/android/bookmarks/g;->b:Z

    if-eqz v3, :cond_37

    iget-wide v3, p1, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v3, v4}, LJ/N;->Mc3pYXd5(J)J

    move-result-wide v3

    const-wide/16 v5, 0x1

    sub-long/2addr v3, v5

    cmp-long p1, v3, p2

    if-nez p1, :cond_37

    new-instance p1, Lc5o;

    invoke-direct {p1, v2, v0}, Lc5o;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/opera/android/bookmarks/g;->c:Lc5o;

    :cond_37
    iget-boolean p1, p0, Lcom/opera/android/bookmarks/g;->a:Z

    if-eqz p1, :cond_53

    iget-object p0, p0, Lcom/opera/android/bookmarks/g;->c:Lc5o;

    if-nez p0, :cond_53

    invoke-static {v1, v1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_43
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_53

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lql3;

    invoke-interface {p1, v2, v0}, Lql3;->A(Lal3;Lml3;)V

    goto :goto_43

    :cond_53
    return-void
.end method

.method public final b(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)V
    .registers 7

    iget-object v0, p0, Lcom/opera/android/bookmarks/g;->d:Lcom/opera/android/bookmarks/h;

    iget-object v1, v0, Lcom/opera/android/bookmarks/h;->b:Lh7f;

    invoke-virtual {v1}, Lh7f;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_3b

    invoke-virtual {p0, p1}, Lcom/opera/android/bookmarks/g;->d(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Z

    move-result v2

    if-eqz v2, :cond_3b

    invoke-virtual {p0}, Lcom/opera/android/bookmarks/g;->e()V

    invoke-static {v0, p1}, Lcom/opera/android/bookmarks/b;->j(Lcom/opera/android/bookmarks/h;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Lcom/opera/android/bookmarks/b;

    move-result-object v2

    iget-wide v3, p1, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v3, v4}, LJ/N;->MrHxfo1_(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    invoke-static {v0, p1}, Lcom/opera/android/bookmarks/c;->m(Lcom/opera/android/bookmarks/h;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Lcom/opera/android/bookmarks/c;

    move-result-object p1

    iget-boolean p0, p0, Lcom/opera/android/bookmarks/g;->a:Z

    if-eqz p0, :cond_3b

    invoke-static {v1, v1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_2b
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3b

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lql3;

    invoke-interface {v0, v2, p1}, Lql3;->e(Lcom/opera/android/bookmarks/b;Lcom/opera/android/bookmarks/c;)V

    goto :goto_2b

    :cond_3b
    return-void
.end method

.method public final c(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)V
    .registers 6

    iget-object v0, p0, Lcom/opera/android/bookmarks/g;->d:Lcom/opera/android/bookmarks/h;

    iget-object v1, v0, Lcom/opera/android/bookmarks/h;->b:Lh7f;

    invoke-virtual {v1}, Lh7f;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_33

    invoke-virtual {p0, p1}, Lcom/opera/android/bookmarks/g;->d(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Z

    move-result v2

    if-eqz v2, :cond_33

    invoke-virtual {p0}, Lcom/opera/android/bookmarks/g;->e()V

    invoke-static {v0, p2}, Lcom/opera/android/bookmarks/b;->j(Lcom/opera/android/bookmarks/h;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Lcom/opera/android/bookmarks/b;

    move-result-object p2

    invoke-static {v0, p1}, Lcom/opera/android/bookmarks/c;->m(Lcom/opera/android/bookmarks/h;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Lcom/opera/android/bookmarks/c;

    move-result-object p1

    iget-boolean p0, p0, Lcom/opera/android/bookmarks/g;->a:Z

    if-eqz p0, :cond_33

    invoke-static {v1, v1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_23
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_33

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lql3;

    invoke-interface {v0, p2, p1}, Lql3;->y(Lcom/opera/android/bookmarks/b;Lcom/opera/android/bookmarks/c;)V

    goto :goto_23

    :cond_33
    return-void
.end method

.method public final d(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Z
    .registers 3

    iget-object p0, p0, Lcom/opera/android/bookmarks/g;->d:Lcom/opera/android/bookmarks/h;

    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object v0

    iget-object v0, v0, Lcom/opera/android/bookmarks/b;->b:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    invoke-virtual {p1, v0}, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->k(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Z

    move-result v0

    if-nez v0, :cond_58

    iget-object v0, p0, Lcom/opera/android/bookmarks/h;->g:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    if-nez v0, :cond_1c

    sget-object v0, Lcom/opera/android/bookmarks/BookmarksBridge;->a:Li7f;

    invoke-static {}, LJ/N;->M9gFEf_d()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    iput-object v0, p0, Lcom/opera/android/bookmarks/h;->g:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    :cond_1c
    invoke-virtual {p1, v0}, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->k(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Z

    move-result v0

    if-nez v0, :cond_58

    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->t()Z

    move-result v0

    if-eqz v0, :cond_3c

    iget-object v0, p0, Lcom/opera/android/bookmarks/h;->h:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    if-nez v0, :cond_36

    sget-object v0, Lcom/opera/android/bookmarks/BookmarksBridge;->a:Li7f;

    invoke-static {}, LJ/N;->MLsLgy31()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    iput-object v0, p0, Lcom/opera/android/bookmarks/h;->h:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    :cond_36
    invoke-virtual {p1, v0}, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->k(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Z

    move-result p0

    if-nez p0, :cond_58

    :cond_3c
    sget-object p0, Lcom/opera/android/bookmarks/BookmarksBridge;->a:Li7f;

    invoke-static {}, LJ/N;->M3hQME_c()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    invoke-virtual {p1, p0}, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->k(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Z

    move-result p0

    if-nez p0, :cond_58

    invoke-static {}, LJ/N;->M7dLQgZp()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    invoke-virtual {p1, p0}, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->k(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Z

    move-result p0

    if-nez p0, :cond_58

    const/4 p0, 0x0

    return p0

    :cond_58
    const/4 p0, 0x1

    return p0
.end method

.method public final e()V
    .registers 5

    iget-object v0, p0, Lcom/opera/android/bookmarks/g;->c:Lc5o;

    if-eqz v0, :cond_29

    iget-object v0, p0, Lcom/opera/android/bookmarks/g;->d:Lcom/opera/android/bookmarks/h;

    iget-object v0, v0, Lcom/opera/android/bookmarks/h;->b:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_c
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_26

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lql3;

    iget-object v2, p0, Lcom/opera/android/bookmarks/g;->c:Lc5o;

    iget-object v3, v2, Lc5o;->a:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/bookmarks/b;

    iget-object v2, v2, Lc5o;->b:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/bookmarks/c;

    invoke-interface {v1, v3, v2}, Lql3;->A(Lal3;Lml3;)V

    goto :goto_c

    :cond_26
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/bookmarks/g;->c:Lc5o;

    :cond_29
    return-void
.end method
