.class public final Lcom/opera/android/bookmarks/h;
.super Li53;
.source "SourceFile"


# instance fields
.field public final a:Lnrl;

.field public final b:Lh7f;

.field public final c:Lcom/opera/android/bookmarks/g;

.field public d:Lcom/opera/android/bookmarks/c;

.field public e:Lcom/opera/android/bookmarks/c;

.field public f:Lcom/opera/android/bookmarks/c;

.field public g:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

.field public h:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

.field public i:Lcom/opera/android/bookmarks/c;

.field public j:Lb59;

.field public final k:Lcq5;

.field public l:Lgrf;

.field public m:Leme;


# direct methods
.method public constructor <init>(Lzwk;Lcq5;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lnrl;

    const/16 v1, 0x1a

    invoke-direct {v0, v1}, Lnrl;-><init>(B)V

    iput-object v0, p0, Lcom/opera/android/bookmarks/h;->a:Lnrl;

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/opera/android/bookmarks/h;->b:Lh7f;

    new-instance v0, Lcom/opera/android/bookmarks/g;

    invoke-direct {v0, p0}, Lcom/opera/android/bookmarks/g;-><init>(Lcom/opera/android/bookmarks/h;)V

    iput-object v0, p0, Lcom/opera/android/bookmarks/h;->c:Lcom/opera/android/bookmarks/g;

    iput-object p2, p0, Lcom/opera/android/bookmarks/h;->k:Lcq5;

    iget-boolean p2, p1, Lzwk;->b:Z

    if-eqz p2, :cond_32

    new-instance p1, Lcom/opera/android/bookmarks/e;

    invoke-direct {p1, p0}, Lcom/opera/android/bookmarks/e;-><init>(Lcom/opera/android/bookmarks/h;)V

    invoke-static {p1}, Lcom/opera/android/favorites/FavoritesBridge;->a(Lus8;)V

    invoke-static {}, LJ/N;->MyZx5kBs()Z

    move-result p1

    if-eqz p1, :cond_31

    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->r()V

    :cond_31
    return-void

    :cond_32
    new-instance p2, Lf6e;

    invoke-direct {p2, p0, p1}, Lf6e;-><init>(Lcom/opera/android/bookmarks/h;Lzwk;)V

    invoke-virtual {p1, p2}, Lzwk;->a(Lywk;)V

    return-void
.end method

.method public static i(Lal3;Lml3;)Lcom/opera/android/bookmarks/b;
    .registers 9

    invoke-interface {p1}, Lml3;->i()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    move v2, v1

    :goto_6
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_66

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lal3;

    invoke-interface {p0}, Lol3;->g()Z

    move-result v4

    if-eqz v4, :cond_32

    invoke-interface {v3}, Lol3;->g()Z

    move-result v4

    if-eqz v4, :cond_63

    move-object v4, p0

    check-cast v4, Lml3;

    check-cast v3, Lml3;

    invoke-interface {v4}, Lal3;->getTitle()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3}, Lal3;->getTitle()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_63

    goto :goto_61

    :cond_32
    invoke-interface {v3}, Lol3;->g()Z

    move-result v4

    if-nez v4, :cond_63

    move-object v4, p0

    check-cast v4, Lpl3;

    check-cast v3, Lpl3;

    invoke-interface {v4}, Lal3;->getTitle()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3}, Lal3;->getTitle()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_63

    invoke-interface {v4}, Lpl3;->getUrl()Lshf;

    move-result-object v4

    iget-object v4, v4, Lshf;->a:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    invoke-interface {v3}, Lpl3;->getUrl()Lshf;

    move-result-object v3

    iget-object v3, v3, Lshf;->a:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_63

    :goto_61
    const/4 p0, 0x0

    return-object p0

    :cond_63
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_66
    check-cast p1, Lcom/opera/android/bookmarks/c;

    iget-object v0, p1, Lcom/opera/android/bookmarks/b;->b:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    iget-object v2, p1, Lcom/opera/android/bookmarks/b;->c:Lcom/opera/android/bookmarks/h;

    invoke-interface {p0}, Lol3;->g()Z

    move-result v3

    if-eqz v3, :cond_aa

    check-cast p0, Lml3;

    invoke-interface {p0}, Lal3;->getTitle()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0}, Lol3;->b()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcom/opera/android/bookmarks/BookmarksBridge;->a:Li7f;

    iget-wide v4, v0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v4, v5, v1, p1}, LJ/N;->MnxlR8LZ(JILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    invoke-static {v2, p1}, Lcom/opera/android/bookmarks/c;->m(Lcom/opera/android/bookmarks/h;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)Lcom/opera/android/bookmarks/c;

    move-result-object p1

    iget-object v0, p1, Lcom/opera/android/bookmarks/b;->b:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    iget-wide v0, v0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v0, v1, v3}, LJ/N;->MzRmE6Wi(JLjava/lang/Object;)V

    invoke-interface {p0}, Lml3;->i()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_9b
    if-ltz v0, :cond_a9

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lal3;

    invoke-static {v1, p1}, Lcom/opera/android/bookmarks/h;->i(Lal3;Lml3;)Lcom/opera/android/bookmarks/b;

    add-int/lit8 v0, v0, -0x1

    goto :goto_9b

    :cond_a9
    return-object p1

    :cond_aa
    check-cast p0, Lpl3;

    invoke-interface {p0}, Lal3;->getTitle()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p0}, Lpl3;->getUrl()Lshf;

    move-result-object p0

    iget-object p1, p1, Lcom/opera/android/bookmarks/c;->e:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    if-eqz p1, :cond_b9

    move-object v0, p1

    :cond_b9
    iget-object p1, p0, Lshf;->a:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    sget-object v4, Lp6l;->a:Lp6l;

    const/4 v4, 0x2

    invoke-static {p1, p0, v4}, Leti;->a(Ljava/lang/String;Lshf;I)Lorg/chromium/url/GURL;

    move-result-object p0

    invoke-virtual {p0}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object p0

    sget-object p1, Lcom/opera/android/bookmarks/BookmarksBridge;->a:Li7f;

    iget-wide v4, v0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v4, v5, v1, v3, p0}, LJ/N;->Ma7AURjI(JILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    new-instance p1, Lcom/opera/android/bookmarks/d;

    invoke-direct {p1, v2, p0}, Lcom/opera/android/bookmarks/b;-><init>(Lcom/opera/android/bookmarks/h;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;)V

    return-object p1
.end method

.method public static k(Ljava/util/HashSet;Lml3;)V
    .registers 4

    invoke-interface {p1}, Lml3;->i()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_8
    :goto_8
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_38

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lal3;

    instance-of v1, v0, Lpl3;

    if-eqz v1, :cond_2e

    check-cast v0, Lpl3;

    invoke-interface {v0}, Lpl3;->getUrl()Lshf;

    move-result-object v0

    if-eqz v0, :cond_8

    iget-object v0, v0, Lshf;->a:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_8

    invoke-virtual {p0, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_8

    :cond_2e
    instance-of v1, v0, Lml3;

    if-eqz v1, :cond_8

    check-cast v0, Lml3;

    invoke-static {p0, v0}, Lcom/opera/android/bookmarks/h;->k(Ljava/util/HashSet;Lml3;)V

    goto :goto_8

    :cond_38
    return-void
.end method


# virtual methods
.method public final a(Lql3;)V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/bookmarks/h;->b:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final b()I
    .registers 4

    sget-object v0, Lcom/opera/android/bookmarks/BookmarksBridge;->a:Li7f;

    invoke-static {}, LJ/N;->MtcDgF48()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_a

    return v1

    :cond_a
    new-instance v0, Lsa2;

    const/4 v2, 0x4

    invoke-direct {v0, v2, v1}, Lsa2;-><init>(BZ)V

    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/opera/android/bookmarks/c;->c(Lzk3;)Z

    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->l()Lcom/opera/android/bookmarks/c;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/opera/android/bookmarks/c;->c(Lzk3;)Z

    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->n()Lcom/opera/android/bookmarks/c;

    move-result-object p0

    invoke-virtual {p0, v0}, Lcom/opera/android/bookmarks/c;->c(Lzk3;)Z

    iget p0, v0, Lsa2;->b:I

    return p0
.end method

.method public final c(Ljava/lang/String;)Lal3;
    .registers 10

    sget-object v0, Lcom/opera/android/bookmarks/BookmarksBridge;->a:Li7f;

    invoke-static {p1}, LJ/N;->MLjrYLRT(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    if-nez v0, :cond_c

    const/4 p0, 0x0

    return-object p0

    :cond_c
    iget-wide v0, v0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v0, v1}, LJ/N;->M16noF3m(J)J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->p()Lcom/opera/android/bookmarks/c;

    move-result-object v2

    const/4 v3, 0x0

    if-eqz v2, :cond_5c

    const/4 v4, 0x1

    invoke-static {v0, v1, v2, v4}, Lalo;->L(JLml3;Z)Lal3;

    move-result-object v2

    if-eqz v2, :cond_5c

    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object v2

    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->l()Lcom/opera/android/bookmarks/c;

    move-result-object v5

    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->n()Lcom/opera/android/bookmarks/c;

    move-result-object v6

    const/4 v7, 0x3

    new-array v7, v7, [Lal3;

    aput-object v2, v7, v3

    aput-object v5, v7, v4

    const/4 v2, 0x2

    aput-object v6, v7, v2

    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-static {v2}, Lalo;->r(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    move v5, v3

    :cond_43
    if-ge v5, v4, :cond_5c

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    check-cast v6, Lpl3;

    invoke-interface {v6}, Lpl3;->getUrl()Lshf;

    move-result-object v7

    iget-object v7, v7, Lshf;->b:Ljava/lang/Object;

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_43

    return-object v6

    :cond_5c
    invoke-virtual {p0, v0, v1, v3}, Lcom/opera/android/bookmarks/h;->m(JZ)Lal3;

    move-result-object p0

    return-object p0
.end method

.method public final d()Z
    .registers 4

    sget-object v0, Lcom/opera/android/bookmarks/BookmarksBridge;->a:Li7f;

    invoke-static {}, LJ/N;->MtcDgF48()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_a

    return v1

    :cond_a
    invoke-static {p0}, Lalo;->G(Lcom/opera/android/bookmarks/h;)Z

    move-result v0

    if-nez v0, :cond_27

    sget-boolean v0, Lalo;->j:Z

    if-nez v0, :cond_25

    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->n()Lcom/opera/android/bookmarks/c;

    move-result-object v0

    invoke-virtual {v0}, Lcom/opera/android/bookmarks/c;->isEmpty()Z

    move-result v0

    xor-int/2addr v0, v1

    sget-boolean v2, Lalo;->j:Z

    if-eq v2, v0, :cond_24

    sput-boolean v0, Lalo;->j:Z

    goto :goto_25

    :cond_24
    move v0, v2

    :cond_25
    :goto_25
    if-eqz v0, :cond_29

    :cond_27
    const/4 p0, 0x0

    return p0

    :cond_29
    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object p0

    new-instance v0, Ll5b;

    invoke-direct {v0, v1}, Ll5b;-><init>(B)V

    invoke-virtual {p0, v0}, Lcom/opera/android/bookmarks/c;->c(Lzk3;)Z

    iget-boolean p0, v0, Ll5b;->b:Z

    xor-int/2addr p0, v1

    return p0
.end method

.method public final e(Ljava/util/AbstractList;)V
    .registers 9

    iget-object v0, p0, Lcom/opera/android/bookmarks/h;->c:Lcom/opera/android/bookmarks/g;

    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    :try_start_d
    iput-boolean v2, v0, Lcom/opera/android/bookmarks/g;->a:Z

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v4, 0x0

    :goto_14
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_37

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lal3;

    if-nez v4, :cond_2a

    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object v4

    invoke-interface {v5, v4}, Lal3;->a(Lcom/opera/android/bookmarks/c;)Lml3;

    move-result-object v4

    :cond_2a
    invoke-static {v5}, Ljkj;->j(Lal3;)Ljkj;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    check-cast v5, Lcom/opera/android/bookmarks/b;

    invoke-virtual {p0, v5}, Lcom/opera/android/bookmarks/h;->q(Lcom/opera/android/bookmarks/b;)V
    :try_end_36
    .catchall {:try_start_d .. :try_end_36} :catchall_56

    goto :goto_14

    :cond_37
    iput-boolean v3, v0, Lcom/opera/android/bookmarks/g;->a:Z

    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_55

    iget-object p0, p0, Lcom/opera/android/bookmarks/h;->b:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_45
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_55

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lql3;

    invoke-interface {p1, v1, v4}, Lql3;->D(Ljava/util/Collection;Lml3;)V

    goto :goto_45

    :cond_55
    return-void

    :catchall_56
    move-exception p0

    iput-boolean v3, v0, Lcom/opera/android/bookmarks/g;->a:Z

    throw p0
.end method

.method public final f(Lql3;)V
    .registers 3

    iget-object v0, p0, Lcom/opera/android/bookmarks/h;->b:Lh7f;

    invoke-virtual {v0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_13

    invoke-virtual {v0}, Lh7f;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_13

    iget-object p0, p0, Lcom/opera/android/bookmarks/h;->c:Lcom/opera/android/bookmarks/g;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/opera/android/bookmarks/g;->c:Lc5o;

    :cond_13
    return-void
.end method

.method public final h(Lal3;Lml3;I)V
    .registers 12

    invoke-interface {p1}, Lal3;->getId()J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lcom/opera/android/bookmarks/h;->m(JZ)Lal3;

    move-result-object v0

    check-cast v0, Lcom/opera/android/bookmarks/b;

    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/opera/android/bookmarks/b;->k(Lcom/opera/android/bookmarks/c;)Lcom/opera/android/bookmarks/c;

    move-result-object p0

    invoke-virtual {p0}, Lcom/opera/android/bookmarks/c;->i()Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    const/4 v3, -0x2

    if-eq p3, v3, :cond_25

    const/4 v3, -0x1

    if-eq p3, v3, :cond_26

    move v3, p3

    goto :goto_26

    :cond_25
    move v3, v1

    :cond_26
    :goto_26
    invoke-virtual {p0, p2}, Lcom/opera/android/bookmarks/b;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-ltz v1, :cond_2e

    if-ne v1, p3, :cond_2f

    :cond_2e
    const/4 v2, 0x0

    :cond_2f
    invoke-virtual {v0}, Lcom/opera/android/bookmarks/b;->getTitle()Ljava/lang/String;

    move-result-object p3

    iget-object v4, v0, Lcom/opera/android/bookmarks/b;->b:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    invoke-interface {p1}, Lal3;->getTitle()Ljava/lang/String;

    move-result-object v5

    invoke-static {p3, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_4a

    invoke-interface {p1}, Lal3;->getTitle()Ljava/lang/String;

    move-result-object p3

    sget-object v5, Lcom/opera/android/bookmarks/BookmarksBridge;->a:Li7f;

    iget-wide v5, v4, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v5, v6, p3}, LJ/N;->MZSGPlJd(JLjava/lang/Object;)V

    :cond_4a
    invoke-interface {v0}, Lol3;->g()Z

    move-result p3

    if-nez p3, :cond_88

    move-object p3, v0

    check-cast p3, Lcom/opera/android/bookmarks/d;

    invoke-virtual {p3}, Lcom/opera/android/bookmarks/d;->getUrl()Lshf;

    move-result-object v5

    move-object v6, p1

    check-cast v6, Lpl3;

    invoke-interface {v6}, Lpl3;->getUrl()Lshf;

    move-result-object v6

    iget-object v5, v5, Lshf;->b:Ljava/lang/Object;

    check-cast v5, Ljava/lang/String;

    iget-object v7, v6, Lshf;->b:Ljava/lang/Object;

    check-cast v7, Ljava/lang/String;

    invoke-static {v5, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_88

    iget-object v5, v6, Lshf;->a:Ljava/lang/Object;

    check-cast v5, Ljava/lang/String;

    iget-object v6, p3, Lcom/opera/android/bookmarks/b;->b:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    invoke-virtual {p3}, Lcom/opera/android/bookmarks/d;->getUrl()Lshf;

    move-result-object p3

    sget-object v7, Lp6l;->a:Lp6l;

    const/4 v7, 0x2

    invoke-static {v5, p3, v7}, Leti;->a(Ljava/lang/String;Lshf;I)Lorg/chromium/url/GURL;

    move-result-object p3

    invoke-virtual {p3}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object p3

    sget-object v5, Lcom/opera/android/bookmarks/BookmarksBridge;->a:Li7f;

    iget-wide v5, v6, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v5, v6, p3}, LJ/N;->MyRSikZv(JLjava/lang/Object;)V

    :cond_88
    invoke-interface {v0}, Lol3;->g()Z

    move-result p3

    if-eqz p3, :cond_a7

    invoke-virtual {v4}, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->b()Ljava/lang/String;

    move-result-object p3

    check-cast p1, Lml3;

    invoke-interface {p1}, Lol3;->b()Ljava/lang/String;

    move-result-object v5

    invoke-static {p3, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_a7

    invoke-interface {p1}, Lol3;->b()Ljava/lang/String;

    move-result-object p1

    iget-wide v4, v4, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {v4, v5, p1}, LJ/N;->MzRmE6Wi(JLjava/lang/Object;)V

    :cond_a7
    if-nez p0, :cond_ca

    check-cast p2, Lcom/opera/android/bookmarks/c;

    iget-object p0, p2, Lcom/opera/android/bookmarks/c;->e:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    invoke-interface {v0}, Lol3;->g()Z

    move-result p1

    iget-object p2, p2, Lcom/opera/android/bookmarks/b;->b:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    if-nez p1, :cond_b9

    if-eqz p0, :cond_b9

    move-object p1, p0

    goto :goto_ba

    :cond_b9
    move-object p1, p2

    :goto_ba
    if-ltz v3, :cond_c6

    if-ne p1, p0, :cond_c6

    iget-wide p2, p2, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {p2, p3}, LJ/N;->Mc3pYXd5(J)J

    move-result-wide p2

    long-to-int p0, p2

    sub-int/2addr v3, p0

    :cond_c6
    invoke-static {v0, p1, v3}, Lcom/opera/android/bookmarks/c;->n(Lcom/opera/android/bookmarks/b;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;I)V

    return-void

    :cond_ca
    if-eqz v2, :cond_ee

    if-eq v1, v3, :cond_ee

    check-cast p2, Lcom/opera/android/bookmarks/c;

    iget-object p0, p2, Lcom/opera/android/bookmarks/c;->e:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    invoke-interface {v0}, Lol3;->g()Z

    move-result p1

    iget-object p2, p2, Lcom/opera/android/bookmarks/b;->b:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    if-nez p1, :cond_de

    if-eqz p0, :cond_de

    move-object p1, p0

    goto :goto_df

    :cond_de
    move-object p1, p2

    :goto_df
    if-ltz v3, :cond_eb

    if-ne p1, p0, :cond_eb

    iget-wide p2, p2, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {p2, p3}, LJ/N;->Mc3pYXd5(J)J

    move-result-wide p2

    long-to-int p0, p2

    sub-int/2addr v3, p0

    :cond_eb
    invoke-static {v0, p1, v3}, Lcom/opera/android/bookmarks/c;->n(Lcom/opera/android/bookmarks/b;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;I)V

    :cond_ee
    return-void
.end method

.method public final j()V
    .registers 3

    iget-object p0, p0, Lcom/opera/android/bookmarks/h;->j:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "disable_import_promotion_shown"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lcom/appsflyer/internal/j;->d(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V

    return-void
.end method

.method public final l()Lcom/opera/android/bookmarks/c;
    .registers 4

    iget-object v0, p0, Lcom/opera/android/bookmarks/h;->e:Lcom/opera/android/bookmarks/c;

    if-nez v0, :cond_15

    sget-object v0, Lcom/opera/android/bookmarks/BookmarksBridge;->a:Li7f;

    invoke-static {}, LJ/N;->M3hQME_c()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    new-instance v1, Lcom/opera/android/bookmarks/c;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v0, v2}, Lcom/opera/android/bookmarks/c;-><init>(Lcom/opera/android/bookmarks/h;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;I)V

    iput-object v1, p0, Lcom/opera/android/bookmarks/h;->e:Lcom/opera/android/bookmarks/c;

    return-object v1

    :cond_15
    return-object v0
.end method

.method public final m(JZ)Lal3;
    .registers 9

    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object v0

    iget-wide v1, v0, Lcom/opera/android/bookmarks/b;->a:J

    cmp-long v1, v1, p1

    const/4 v2, 0x1

    if-eqz v1, :cond_f

    invoke-static {p1, p2, v0, v2}, Lalo;->L(JLml3;Z)Lal3;

    move-result-object v0

    :cond_f
    if-eqz v0, :cond_12

    return-object v0

    :cond_12
    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->l()Lcom/opera/android/bookmarks/c;

    move-result-object v0

    iget-wide v3, v0, Lcom/opera/android/bookmarks/b;->a:J

    cmp-long v1, v3, p1

    if-nez v1, :cond_1d

    return-object v0

    :cond_1d
    invoke-static {p1, p2, v0, v2}, Lalo;->L(JLml3;Z)Lal3;

    move-result-object v0

    if-eqz v0, :cond_24

    return-object v0

    :cond_24
    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->n()Lcom/opera/android/bookmarks/c;

    move-result-object v0

    iget-wide v3, v0, Lcom/opera/android/bookmarks/b;->a:J

    cmp-long v1, v3, p1

    if-nez v1, :cond_2f

    return-object v0

    :cond_2f
    invoke-static {p1, p2, v0, v2}, Lalo;->L(JLml3;Z)Lal3;

    move-result-object v0

    if-eqz v0, :cond_36

    return-object v0

    :cond_36
    if-eqz p3, :cond_3e

    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->p()Lcom/opera/android/bookmarks/c;

    move-result-object p0

    if-nez p0, :cond_40

    :cond_3e
    const/4 p0, 0x0

    return-object p0

    :cond_40
    iget-wide v0, p0, Lcom/opera/android/bookmarks/b;->a:J

    cmp-long p3, v0, p1

    if-nez p3, :cond_47

    return-object p0

    :cond_47
    invoke-static {p1, p2, p0, v2}, Lalo;->L(JLml3;Z)Lal3;

    move-result-object p0

    return-object p0
.end method

.method public final n()Lcom/opera/android/bookmarks/c;
    .registers 4

    iget-object v0, p0, Lcom/opera/android/bookmarks/h;->f:Lcom/opera/android/bookmarks/c;

    if-nez v0, :cond_15

    sget-object v0, Lcom/opera/android/bookmarks/BookmarksBridge;->a:Li7f;

    invoke-static {}, LJ/N;->M7dLQgZp()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    new-instance v1, Lcom/opera/android/bookmarks/c;

    const/4 v2, 0x3

    invoke-direct {v1, p0, v0, v2}, Lcom/opera/android/bookmarks/c;-><init>(Lcom/opera/android/bookmarks/h;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;I)V

    iput-object v1, p0, Lcom/opera/android/bookmarks/h;->f:Lcom/opera/android/bookmarks/c;

    return-object v1

    :cond_15
    return-object v0
.end method

.method public final o()Lcom/opera/android/bookmarks/c;
    .registers 4

    iget-object v0, p0, Lcom/opera/android/bookmarks/h;->d:Lcom/opera/android/bookmarks/c;

    if-nez v0, :cond_15

    sget-object v0, Lcom/opera/android/bookmarks/BookmarksBridge;->a:Li7f;

    invoke-static {}, LJ/N;->McWLLuCo()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    new-instance v1, Lcom/opera/android/bookmarks/c;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v0, v2}, Lcom/opera/android/bookmarks/c;-><init>(Lcom/opera/android/bookmarks/h;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;I)V

    iput-object v1, p0, Lcom/opera/android/bookmarks/h;->d:Lcom/opera/android/bookmarks/c;

    return-object v1

    :cond_15
    return-object v0
.end method

.method public final p()Lcom/opera/android/bookmarks/c;
    .registers 4

    iget-object v0, p0, Lcom/opera/android/bookmarks/h;->i:Lcom/opera/android/bookmarks/c;

    if-nez v0, :cond_1f

    iget-object v0, p0, Lcom/opera/android/bookmarks/h;->h:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    if-nez v0, :cond_12

    sget-object v0, Lcom/opera/android/bookmarks/BookmarksBridge;->a:Li7f;

    invoke-static {}, LJ/N;->MLsLgy31()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    iput-object v0, p0, Lcom/opera/android/bookmarks/h;->h:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    :cond_12
    if-nez v0, :cond_16

    const/4 p0, 0x0

    return-object p0

    :cond_16
    new-instance v1, Lcom/opera/android/bookmarks/c;

    const/4 v2, 0x4

    invoke-direct {v1, p0, v0, v2}, Lcom/opera/android/bookmarks/c;-><init>(Lcom/opera/android/bookmarks/h;Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;I)V

    iput-object v1, p0, Lcom/opera/android/bookmarks/h;->i:Lcom/opera/android/bookmarks/c;

    return-object v1

    :cond_1f
    return-object v0
.end method

.method public final q(Lcom/opera/android/bookmarks/b;)V
    .registers 5

    instance-of v0, p1, Lcom/opera/android/bookmarks/c;

    if-eqz v0, :cond_4c

    check-cast p1, Lcom/opera/android/bookmarks/c;

    invoke-virtual {p1}, Lcom/opera/android/bookmarks/c;->i()Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_12
    if-ltz v1, :cond_20

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/opera/android/bookmarks/b;

    invoke-virtual {p0, v2}, Lcom/opera/android/bookmarks/h;->q(Lcom/opera/android/bookmarks/b;)V

    add-int/lit8 v1, v1, -0x1

    goto :goto_12

    :cond_20
    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/opera/android/bookmarks/b;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2b

    return-void

    :cond_2b
    iget p0, p1, Lcom/opera/android/bookmarks/c;->d:I

    const/4 v0, 0x2

    const/4 v1, 0x0

    if-ne p0, v0, :cond_38

    sget-boolean p0, Lalo;->i:Z

    if-eqz p0, :cond_37

    sput-boolean v1, Lalo;->i:Z

    :cond_37
    return-void

    :cond_38
    const/4 v0, 0x3

    if-ne p0, v0, :cond_42

    sget-boolean p0, Lalo;->j:Z

    if-eqz p0, :cond_41

    sput-boolean v1, Lalo;->j:Z

    :cond_41
    return-void

    :cond_42
    iget-object p0, p1, Lcom/opera/android/bookmarks/b;->b:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    sget-object p1, Lcom/opera/android/bookmarks/BookmarksBridge;->a:Li7f;

    iget-wide p0, p0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {p0, p1}, LJ/N;->MsQpg03H(J)V

    return-void

    :cond_4c
    iget-object p0, p1, Lcom/opera/android/bookmarks/b;->b:Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;

    sget-object p1, Lcom/opera/android/bookmarks/BookmarksBridge;->a:Li7f;

    iget-wide p0, p0, Lcom/opera/android/bookmarks/BookmarksBridge$BookmarkNode;->a:J

    invoke-static {p0, p1}, LJ/N;->MsQpg03H(J)V

    return-void
.end method

.method public final r()V
    .registers 3

    sget-object v0, Lcom/opera/android/bookmarks/BookmarksBridge;->a:Li7f;

    iget-object v1, p0, Lcom/opera/android/bookmarks/h;->c:Lcom/opera/android/bookmarks/g;

    invoke-virtual {v0, v1}, Li7f;->b(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_12

    iget v0, v0, Li7f;->c:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_12

    invoke-static {}, LJ/N;->MeGodMMj()V

    :cond_12
    invoke-static {}, LJ/N;->MtcDgF48()Z

    move-result v0

    if-eqz v0, :cond_1d

    iget-object p0, p0, Lcom/opera/android/bookmarks/h;->a:Lnrl;

    invoke-virtual {p0}, Lnrl;->K()V

    :cond_1d
    return-void
.end method

.method public final s()Z
    .registers 4

    iget-object v0, p0, Lcom/opera/android/bookmarks/h;->j:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v1, "disable_import_promotion_shown"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_21

    iget-object p0, p0, Lcom/opera/android/bookmarks/h;->k:Lcq5;

    invoke-virtual {p0}, Lcq5;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lf8f;

    invoke-virtual {p0}, Lf8f;->f()Z

    move-result p0

    if-nez p0, :cond_21

    const/4 p0, 0x1

    return p0

    :cond_21
    return v2
.end method

.method public final t()Z
    .registers 2

    iget-object p0, p0, Lcom/opera/android/bookmarks/h;->l:Lgrf;

    if-eqz p0, :cond_11

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lfrf;

    iget p0, p0, Lfrf;->b:I

    const/4 v0, 0x1

    and-int/2addr p0, v0

    if-eqz p0, :cond_11

    return v0

    :cond_11
    const/4 p0, 0x0

    return p0
.end method
