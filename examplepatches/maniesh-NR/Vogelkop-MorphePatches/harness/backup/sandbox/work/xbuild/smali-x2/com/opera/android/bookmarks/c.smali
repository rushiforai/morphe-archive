.class public final Lcom/opera/android/bookmarks/c;
.super Lcom/opera/android/bookmarks/b;
.source "SourceFile"

# interfaces
.implements Lml3;


# instance fields
.field public final d:I

.field public final e:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;


# direct methods
.method public constructor <init>(Lcom/opera/android/bookmarks/h;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;I)V
    .registers 4

    invoke-direct {p0, p1, p2}, Lcom/opera/android/bookmarks/b;-><init>(Lcom/opera/android/bookmarks/h;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)V

    iput p3, p0, Lcom/opera/android/bookmarks/c;->d:I

    invoke-virtual {p0}, Lcom/opera/android/bookmarks/c;->h()Z

    move-result p1

    if-eqz p1, :cond_14

    sget-object p1, Lcom/opera/android/bookmarks/BookmarksBridge;->a:Li7f;

    invoke-static {}, LJ/N;->M9gFEf_d()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    goto :goto_15

    :cond_14
    const/4 p1, 0x0

    :goto_15
    iput-object p1, p0, Lcom/opera/android/bookmarks/c;->e:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    return-void
.end method

.method public static m(Lcom/opera/android/bookmarks/h;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Lcom/opera/android/bookmarks/c;
    .registers 4

    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object v0

    iget-object v1, v0, Lcom/opera/android/bookmarks/b;->b:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    invoke-virtual {v1, p1}, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_14

    iget-object v1, v0, Lcom/opera/android/bookmarks/c;->e:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    invoke-virtual {v1, p1}, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_15

    :cond_14
    return-object v0

    :cond_15
    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->l()Lcom/opera/android/bookmarks/c;

    move-result-object v0

    iget-object v1, v0, Lcom/opera/android/bookmarks/b;->b:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    invoke-virtual {v1, p1}, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_22

    return-object v0

    :cond_22
    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->n()Lcom/opera/android/bookmarks/c;

    move-result-object v0

    iget-object v1, v0, Lcom/opera/android/bookmarks/b;->b:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    invoke-virtual {v1, p1}, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2f

    return-object v0

    :cond_2f
    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->p()Lcom/opera/android/bookmarks/c;

    move-result-object v0

    if-eqz v0, :cond_3e

    iget-object v1, v0, Lcom/opera/android/bookmarks/b;->b:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    invoke-virtual {v1, p1}, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3e

    return-object v0

    :cond_3e
    new-instance v0, Lcom/opera/android/bookmarks/c;

    const/4 v1, 0x5

    invoke-direct {v0, p0, p1, v1}, Lcom/opera/android/bookmarks/c;-><init>(Lcom/opera/android/bookmarks/h;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;I)V

    return-object v0
.end method

.method public static n(Lcom/opera/android/bookmarks/b;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;I)V
    .registers 9

    iget-object p0, p0, Lcom/opera/android/bookmarks/b;->b:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    const/4 v0, -0x1

    if-eq p2, v0, :cond_27

    const/4 v1, 0x0

    :goto_6
    int-to-long v2, v1

    iget-wide v4, p1, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v4, v5}, LJ/N;->Mc3pYXd5(J)J

    move-result-wide v4

    cmp-long v4, v2, v4

    if-gez v4, :cond_20

    invoke-virtual {p1, v2, v3}, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->j(J)Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d

    move v0, v1

    goto :goto_20

    :cond_1d
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    :cond_20
    :goto_20
    if-ltz v0, :cond_2e

    if-ge v0, p2, :cond_2e

    add-int/lit8 p2, p2, 0x1

    goto :goto_2e

    :cond_27
    iget-wide v0, p1, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v0, v1}, LJ/N;->Mc3pYXd5(J)J

    move-result-wide v0

    long-to-int p2, v0

    :cond_2e
    :goto_2e
    int-to-long v4, p2

    sget-object p2, Lcom/opera/android/bookmarks/BookmarksBridge;->a:Li7f;

    iget-wide v0, p0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    iget-wide v2, p1, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static/range {v0 .. v5}, LJ/N;->MEmZnfJz(JJJ)V

    return-void
.end method


# virtual methods
.method public final bridge synthetic a(Lcom/opera/android/bookmarks/c;)Lml3;
    .registers 2

    invoke-virtual {p0, p1}, Lcom/opera/android/bookmarks/c;->k(Lcom/opera/android/bookmarks/c;)Lcom/opera/android/bookmarks/c;

    move-result-object p0

    return-object p0
.end method

.method public final b()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/bookmarks/b;->b:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    invoke-virtual {p0}, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->b()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final c(Lzk3;)Z
    .registers 3

    iget-object v0, p0, Lcom/opera/android/bookmarks/b;->b:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    invoke-static {v0, p1}, Lcom/opera/android/bookmarks/b;->l(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;Lzk3;)Z

    move-result v0

    if-eqz v0, :cond_12

    iget-object p0, p0, Lcom/opera/android/bookmarks/c;->e:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    if-eqz p0, :cond_14

    invoke-static {p0, p1}, Lcom/opera/android/bookmarks/b;->l(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;Lzk3;)Z

    move-result p0

    if-nez p0, :cond_14

    :cond_12
    const/4 p0, 0x0

    return p0

    :cond_14
    const/4 p0, 0x1

    return p0
.end method

.method public final d()J
    .registers 3

    iget-object p0, p0, Lcom/opera/android/bookmarks/b;->b:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    iget-wide v0, p0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v0, v1}, LJ/N;->MNmBobM5(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public final g()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final h()Z
    .registers 2

    iget p0, p0, Lcom/opera/android/bookmarks/c;->d:I

    const/4 v0, 0x1

    if-ne p0, v0, :cond_6

    return v0

    :cond_6
    const/4 p0, 0x0

    return p0
.end method

.method public final i()Ljava/util/List;
    .registers 10

    iget-object v0, p0, Lcom/opera/android/bookmarks/b;->b:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    iget-wide v1, v0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v1, v2}, LJ/N;->Mc3pYXd5(J)J

    move-result-wide v1

    long-to-int v1, v1

    iget-object v2, p0, Lcom/opera/android/bookmarks/c;->e:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    if-eqz v2, :cond_15

    iget-wide v3, v2, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v3, v4}, LJ/N;->Mc3pYXd5(J)J

    move-result-wide v3

    long-to-int v3, v3

    add-int/2addr v1, v3

    :cond_15
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v1}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v1, 0x0

    move v4, v1

    :goto_1c
    int-to-long v5, v4

    iget-wide v7, v0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v7, v8}, LJ/N;->Mc3pYXd5(J)J

    move-result-wide v7

    cmp-long v7, v5, v7

    iget-object v8, p0, Lcom/opera/android/bookmarks/b;->c:Lcom/opera/android/bookmarks/h;

    if-gez v7, :cond_37

    invoke-virtual {v0, v5, v6}, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->j(J)Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    move-result-object v5

    invoke-static {v8, v5}, Lcom/opera/android/bookmarks/b;->j(Lcom/opera/android/bookmarks/h;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Lcom/opera/android/bookmarks/b;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_1c

    :cond_37
    if-eqz v2, :cond_52

    :goto_39
    int-to-long v4, v1

    iget-wide v6, v2, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v6, v7}, LJ/N;->Mc3pYXd5(J)J

    move-result-wide v6

    cmp-long p0, v4, v6

    if-gez p0, :cond_52

    invoke-virtual {v2, v4, v5}, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->j(J)Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    move-result-object p0

    invoke-static {v8, p0}, Lcom/opera/android/bookmarks/b;->j(Lcom/opera/android/bookmarks/h;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Lcom/opera/android/bookmarks/b;

    move-result-object p0

    invoke-virtual {v3, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_39

    :cond_52
    return-object v3
.end method

.method public final isEmpty()Z
    .registers 4

    iget-object v0, p0, Lcom/opera/android/bookmarks/b;->b:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    iget-wide v0, v0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v0, v1}, LJ/N;->Mc3pYXd5(J)J

    move-result-wide v0

    long-to-int v0, v0

    iget-object p0, p0, Lcom/opera/android/bookmarks/c;->e:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    if-eqz p0, :cond_15

    iget-wide v1, p0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v1, v2}, LJ/N;->Mc3pYXd5(J)J

    move-result-wide v1

    long-to-int p0, v1

    add-int/2addr v0, p0

    :cond_15
    if-nez v0, :cond_19

    const/4 p0, 0x1

    return p0

    :cond_19
    const/4 p0, 0x0

    return p0
.end method

.method public final k(Lcom/opera/android/bookmarks/c;)Lcom/opera/android/bookmarks/c;
    .registers 4

    const/4 v0, 0x2

    iget v1, p0, Lcom/opera/android/bookmarks/c;->d:I

    if-ne v1, v0, :cond_6

    return-object p1

    :cond_6
    const/4 v0, 0x3

    if-ne v1, v0, :cond_a

    return-object p1

    :cond_a
    const/4 v0, 0x4

    if-ne v1, v0, :cond_e

    return-object p1

    :cond_e
    invoke-super {p0, p1}, Lcom/opera/android/bookmarks/b;->k(Lcom/opera/android/bookmarks/c;)Lcom/opera/android/bookmarks/c;

    move-result-object p0

    return-object p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
