.class public final Lbue;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ls5j;

.field public final c:Liu2;

.field private d:Lzte;
    .annotation build Lcom/opera/android/annotations/WeakOwner;
    .end annotation
.end field

.field private e:Laue;
    .annotation build Lcom/opera/android/annotations/WeakOwner;
    .end annotation
.end field

.field public final synthetic f:Lvzk;


# direct methods
.method public constructor <init>(Lvzk;Ljava/lang/String;Ls5j;Liu2;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbue;->f:Lvzk;

    iput-object p2, p0, Lbue;->a:Ljava/lang/String;

    iput-object p3, p0, Lbue;->b:Ls5j;

    iput-object p4, p0, Lbue;->c:Liu2;

    iget-object p2, p3, Ls5j;->b:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_17

    invoke-virtual {p0}, Lbue;->a()V

    return-void

    :cond_17
    iget-object p2, p1, Lvzk;->d:Ljava/lang/Object;

    check-cast p2, Ljava/util/LinkedHashSet;

    invoke-interface {p2, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    new-instance p2, Lzte;

    iget-object p1, p1, Lvzk;->a:Ljava/lang/Object;

    check-cast p1, Lwv1;

    invoke-virtual {p1}, Lwv1;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lfqe;

    invoke-direct {p2, p0, p1}, Lzte;-><init>(Lbue;Lfqe;)V

    iput-object p2, p0, Lbue;->d:Lzte;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    iget-object v0, p0, Lbue;->f:Lvzk;

    iget-object v1, v0, Lvzk;->b:Ljava/lang/Object;

    check-cast v1, Lesk;

    invoke-interface {v1}, Lesk;->get()Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Lcue;->c:Lcue;

    if-ne v1, v2, :cond_2b

    iget-object v1, v0, Lvzk;->a:Ljava/lang/Object;

    check-cast v1, Lwv1;

    invoke-virtual {v1}, Lwv1;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfqe;

    invoke-virtual {v1}, Lfqe;->c()Luqe;

    move-result-object v1

    iget-object v0, v0, Lvzk;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashSet;

    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    new-instance v0, Laue;

    invoke-direct {v0, p0, v1}, Laue;-><init>(Lbue;Luqe;)V

    iput-object v0, p0, Lbue;->e:Laue;

    return-void

    :cond_2b
    new-instance v0, Lhjb;

    iget-object v1, p0, Lbue;->b:Ls5j;

    iget-object v1, v1, Ly5j;->a:Ljava/lang/String;

    invoke-direct {v0, v1}, Lhjb;-><init>(Ljava/lang/String;)V

    new-instance v1, Lrw7;

    invoke-direct {v1, v0}, Lrw7;-><init>(Ljava/lang/Object;)V

    iget-object p0, p0, Lbue;->c:Liu2;

    invoke-virtual {p0, v1}, Liu2;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final b(Ll0c;Z)V
    .registers 17

    iget-object v1, p0, Lbue;->f:Lvzk;

    iget-object v0, v1, Lvzk;->a:Ljava/lang/Object;

    check-cast v0, Lwv1;

    invoke-virtual {v0}, Lwv1;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lfqe;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lrqd;

    const/16 v3, 0x10

    invoke-direct {v2, v3}, Lrqd;-><init>(B)V

    const/4 v3, 0x0

    invoke-static {v2, v3}, Luqe;->d(Ltff;Ljava/net/CookieManager;)Lg77;

    move-result-object v2

    invoke-virtual {v0}, Lwv1;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lfqe;

    new-instance v0, Lyte;

    move-object v3, p0

    move-object v5, p1

    move/from16 v4, p2

    invoke-direct/range {v0 .. v5}, Lyte;-><init>(Lvzk;Lg77;Lbue;ZLl0c;)V

    move-object v10, v0

    iget-object v1, v6, Lfqe;->a:Landroid/content/Context;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->D()Ljtg;

    move-result-object v11

    iget-boolean v12, v6, Lfqe;->k:Z

    iget-object v0, v6, Lfqe;->a:Landroid/content/Context;

    invoke-static {v0}, Le3j;->t(Landroid/content/Context;)Le3j;

    move-result-object v0

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ld3j;

    const/4 v4, 0x4

    const/4 v5, 0x0

    invoke-virtual {v0, v4, v5}, Ld3j;->d(IZ)Lc3j;

    move-result-object v0

    if-eqz v0, :cond_55

    iget-object v0, v0, Lc3j;->d:Ljava/lang/Comparable;

    check-cast v0, Ljava/lang/String;

    goto :goto_57

    :cond_55
    const-string v0, "news.opera-api.com"

    :goto_57
    new-instance v4, Landroid/net/Uri$Builder;

    invoke-direct {v4}, Landroid/net/Uri$Builder;-><init>()V

    const-string v5, "https"

    invoke-virtual {v4, v5}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v4

    new-instance v0, Lx79;

    new-instance v5, Lga6;

    const/4 v6, 0x5

    invoke-direct {v5, v2, v6}, Lga6;-><init>(Ljava/lang/Object;B)V

    iget-object v13, p0, Lbue;->a:Ljava/lang/String;

    move-object v3, p1

    move-object v2, v5

    move-object v5, v13

    invoke-direct/range {v0 .. v5}, Lx79;-><init>(Landroid/content/Context;Lywh;Ll0c;Landroid/net/Uri;Ljava/lang/String;)V

    new-instance v7, Lrqe;

    move-object v9, p1

    move-object v8, v1

    invoke-direct/range {v7 .. v13}, Lrqe;-><init>(Landroid/content/Context;Ll0c;Lyte;Ljtg;ZLjava/lang/String;)V

    invoke-virtual {v0, v7}, Lx79;->U(Lxla;)V

    return-void
.end method

.method public final c(Ll0c;Ljava/util/List;)V
    .registers 9

    iget-object v0, p0, Lbue;->b:Ls5j;

    iget-object v0, v0, Ls5j;->c:Ljava/util/List;

    check-cast p2, Ljava/lang/Iterable;

    new-instance v1, Ljava/util/ArrayList;

    const/16 v2, 0xa

    invoke-static {p2, v2}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_15
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_27

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lyqe;

    iget-object v2, v2, Lyqe;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_15

    :cond_27
    move-object p2, v0

    check-cast p2, Ljava/lang/Iterable;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_33
    :goto_33
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_55

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v5, "<existing>"

    invoke-static {v3, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4e

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4f

    :cond_4e
    move-object v4, v3

    :cond_4f
    if-eqz v4, :cond_33

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_33

    :cond_55
    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result p2

    iget-object p0, p0, Lbue;->c:Liu2;

    if-nez p2, :cond_70

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_70

    new-instance p1, Lrw7;

    sget-object p2, Lkye;->b:Lkye;

    invoke-direct {p1, p2}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, p1}, Liu2;->run(Ljava/lang/Object;)V

    return-void

    :cond_70
    new-instance p2, Lt5j;

    if-eqz p1, :cond_78

    invoke-virtual {p1}, Ll0c;->toString()Ljava/lang/String;

    move-result-object v4

    :cond_78
    invoke-direct {p2, v4, v2}, Lt5j;-><init>(Ljava/lang/String;Ljava/util/ArrayList;)V

    new-instance p1, Lsw7;

    invoke-direct {p1, p2}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, p1}, Liu2;->run(Ljava/lang/Object;)V

    return-void
.end method
