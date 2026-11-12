.class public abstract Lcom/opera/android/bookmarks/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lal3;


# instance fields
.field public final a:J

.field public final b:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

.field public final c:Lcom/opera/android/bookmarks/h;


# direct methods
.method public constructor <init>(Lcom/opera/android/bookmarks/h;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-wide v0, p2, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v0, v1}, LJ/N;->M16noF3m(J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/opera/android/bookmarks/b;->a:J

    iput-object p2, p0, Lcom/opera/android/bookmarks/b;->b:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    iput-object p1, p0, Lcom/opera/android/bookmarks/b;->c:Lcom/opera/android/bookmarks/h;

    return-void
.end method

.method public static j(Lcom/opera/android/bookmarks/h;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Lcom/opera/android/bookmarks/b;
    .registers 4

    iget-wide v0, p1, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v0, v1}, LJ/N;->MIH0RDIG(J)Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-static {p0, p1}, Lcom/opera/android/bookmarks/c;->m(Lcom/opera/android/bookmarks/h;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Lcom/opera/android/bookmarks/c;

    move-result-object p0

    return-object p0

    :cond_d
    new-instance v0, Lcom/opera/android/bookmarks/d;

    invoke-direct {v0, p0, p1}, Lcom/opera/android/bookmarks/b;-><init>(Lcom/opera/android/bookmarks/h;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)V

    return-object v0
.end method

.method public static l(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;Lzk3;)Z
    .registers 10

    invoke-interface {p1, p0}, Lzk3;->c(Lol3;)Z

    move-result v0

    iget-wide v1, p0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    const/4 v3, 0x0

    if-eqz v0, :cond_23

    invoke-static {v1, v2}, LJ/N;->MIH0RDIG(J)Z

    move-result v0

    if-eqz v0, :cond_27

    move v0, v3

    :goto_10
    int-to-long v4, v0

    invoke-static {v1, v2}, LJ/N;->Mc3pYXd5(J)J

    move-result-wide v6

    cmp-long v6, v4, v6

    if-gez v6, :cond_27

    invoke-virtual {p0, v4, v5}, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->j(J)Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    move-result-object v4

    invoke-static {v4, p1}, Lcom/opera/android/bookmarks/b;->l(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;Lzk3;)Z

    move-result v4

    if-nez v4, :cond_24

    :cond_23
    return v3

    :cond_24
    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    :cond_27
    const/4 p0, 0x1

    return p0
.end method


# virtual methods
.method public bridge synthetic a(Lcom/opera/android/bookmarks/c;)Lml3;
    .registers 2

    invoke-virtual {p0, p1}, Lcom/opera/android/bookmarks/b;->k(Lcom/opera/android/bookmarks/c;)Lcom/opera/android/bookmarks/c;

    move-result-object p0

    return-object p0
.end method

.method public c(Lzk3;)Z
    .registers 2

    iget-object p0, p0, Lcom/opera/android/bookmarks/b;->b:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    invoke-static {p0, p1}, Lcom/opera/android/bookmarks/b;->l(Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;Lzk3;)Z

    move-result p0

    return p0
.end method

.method public final e(Lml3;)Z
    .registers 4

    iget-object v0, p0, Lcom/opera/android/bookmarks/b;->c:Lcom/opera/android/bookmarks/h;

    invoke-virtual {v0}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/opera/android/bookmarks/b;->k(Lcom/opera/android/bookmarks/c;)Lcom/opera/android/bookmarks/c;

    move-result-object p0

    :goto_a
    if-eqz p0, :cond_1d

    invoke-virtual {p0, p1}, Lcom/opera/android/bookmarks/b;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_14

    const/4 p0, 0x1

    return p0

    :cond_14
    invoke-virtual {v0}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/opera/android/bookmarks/c;->k(Lcom/opera/android/bookmarks/c;)Lcom/opera/android/bookmarks/c;

    move-result-object p0

    goto :goto_a

    :cond_1d
    const/4 p0, 0x0

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    instance-of v0, p1, Lal3;

    if-eqz v0, :cond_12

    check-cast p1, Lal3;

    invoke-interface {p1}, Lal3;->getId()J

    move-result-wide v0

    iget-wide p0, p0, Lcom/opera/android/bookmarks/b;->a:J

    cmp-long p0, p0, v0

    if-nez p0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    const/4 p0, 0x0

    return p0
.end method

.method public final getId()J
    .registers 3

    iget-wide v0, p0, Lcom/opera/android/bookmarks/b;->a:J

    return-wide v0
.end method

.method public final getTitle()Ljava/lang/String;
    .registers 3

    iget-object p0, p0, Lcom/opera/android/bookmarks/b;->b:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    iget-wide v0, p0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v0, v1}, LJ/N;->MeTSvCdg(J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public final hashCode()I
    .registers 3

    iget-wide v0, p0, Lcom/opera/android/bookmarks/b;->a:J

    long-to-int p0, v0

    return p0
.end method

.method public k(Lcom/opera/android/bookmarks/c;)Lcom/opera/android/bookmarks/c;
    .registers 4

    iget-object v0, p0, Lcom/opera/android/bookmarks/b;->b:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    iget-wide v0, v0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v0, v1}, LJ/N;->MrHxfo1_(J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    if-nez v0, :cond_e

    const/4 p0, 0x0

    return-object p0

    :cond_e
    iget-object p0, p0, Lcom/opera/android/bookmarks/b;->c:Lcom/opera/android/bookmarks/h;

    iget-object v1, p0, Lcom/opera/android/bookmarks/h;->g:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    if-nez v1, :cond_1e

    sget-object v1, Lcom/opera/android/bookmarks/BookmarksBridge;->a:Li7f;

    invoke-static {}, LJ/N;->M9gFEf_d()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    iput-object v1, p0, Lcom/opera/android/bookmarks/h;->g:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    :cond_1e
    invoke-virtual {v0, v1}, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_25

    return-object p1

    :cond_25
    invoke-static {p0, v0}, Lcom/opera/android/bookmarks/b;->j(Lcom/opera/android/bookmarks/h;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Lcom/opera/android/bookmarks/b;

    move-result-object p0

    check-cast p0, Lcom/opera/android/bookmarks/c;

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
