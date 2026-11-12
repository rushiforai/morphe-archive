.class public final Ldte;
.super Ltwc;
.source "SourceFile"


# instance fields
.field public final b:Lfqe;

.field public final c:Lru9;

.field public final d:Lx5f;

.field public final e:Lbte;

.field public final f:Lz8b;

.field public g:Ll0c;

.field public h:Z

.field public final i:Lcte;


# direct methods
.method public constructor <init>(Lfqe;Lru9;Lx5f;Landroid/content/Context;)V
    .registers 14

    invoke-direct {p0}, Ltwc;-><init>()V

    iput-object p1, p0, Ldte;->b:Lfqe;

    iput-object p2, p0, Ldte;->c:Lru9;

    iput-object p3, p0, Ldte;->d:Lx5f;

    new-instance p1, Lbte;

    new-instance p3, Lkze;

    sget-object v0, Ll08;->a:Ll08;

    invoke-direct {p3, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    new-instance v0, Lkze;

    const-string v1, ""

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    new-instance v2, Lkze;

    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {v2, v3}, Lekc;-><init>(Ljava/lang/Object;)V

    iget-object p2, p2, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v3, "settings.news.language_region.recently_used"

    invoke-interface {p2, v3, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_2b

    move-object v1, p2

    :cond_2b
    const-string p2, ";"

    filled-new-array {p2}, [Ljava/lang/String;

    move-result-object p2

    const/4 v3, 0x6

    const/4 v4, 0x0

    invoke-static {v1, p2, v4, v3}, Lkotlin/text/StringsKt;->Y(Ljava/lang/CharSequence;[Ljava/lang/String;II)Ljava/util/List;

    move-result-object p2

    check-cast p2, Ljava/lang/Iterable;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_42
    :goto_42
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_58

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ll0c;->a(Ljava/lang/String;)Ll0c;

    move-result-object v3

    if-eqz v3, :cond_42

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_42

    :cond_58
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    :cond_61
    :goto_61
    if-ge v4, v3, :cond_8b

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Ll0c;

    invoke-static {v5}, Lr0c;->a(Ll0c;)Lq0c;

    move-result-object v6

    if-nez v6, :cond_73

    const/4 v5, 0x0

    goto :goto_85

    :cond_73
    new-instance v7, Late;

    iget v8, v6, Lq0c;->a:I

    invoke-virtual {p4, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    iget v6, v6, Lq0c;->b:I

    invoke-virtual {p4, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v7, v5, v8, v6}, Late;-><init>(Ll0c;Ljava/lang/String;Ljava/lang/String;)V

    move-object v5, v7

    :goto_85
    if-eqz v5, :cond_61

    invoke-virtual {p2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_61

    :cond_8b
    invoke-direct {p1, p3, v0, v2, p2}, Lbte;-><init>(Lkze;Lkze;Lkze;Ljava/util/ArrayList;)V

    iput-object p1, p0, Ldte;->e:Lbte;

    new-instance p1, Lz8b;

    const/16 p2, 0x16

    invoke-direct {p1, p2}, Lz8b;-><init>(B)V

    iput-object p1, p0, Ldte;->f:Lz8b;

    new-instance p1, Lcte;

    invoke-direct {p1, p0, p4}, Lcte;-><init>(Ldte;Landroid/content/Context;)V

    iput-object p1, p0, Ldte;->i:Lcte;

    return-void
.end method


# virtual methods
.method public final f()Lbte;
    .registers 1

    iget-object p0, p0, Ldte;->e:Lbte;

    return-object p0
.end method

.method public final g(Lij0;Ll0c;)V
    .registers 13

    iget-boolean v0, p0, Ldte;->h:Z

    if-nez v0, :cond_30

    const/4 v0, 0x1

    iput-boolean v0, p0, Ldte;->h:Z

    iget-object v1, p0, Ldte;->g:Ll0c;

    if-eqz v1, :cond_30

    const/4 v2, 0x0

    if-eqz p2, :cond_14

    invoke-virtual {p2, v1}, Ll0c;->equals(Ljava/lang/Object;)Z

    move-result v1

    xor-int/2addr v1, v0

    goto :goto_15

    :cond_14
    move v1, v2

    :goto_15
    if-eqz v1, :cond_1a

    sget-object v3, Lvb0;->b:Lvb0;

    goto :goto_1c

    :cond_1a
    sget-object v3, Lvb0;->c:Lvb0;

    :goto_1c
    iget-object v4, p0, Ldte;->g:Ll0c;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    if-eqz v1, :cond_29

    invoke-virtual {p2}, Ll0c;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_2a

    :cond_29
    const/4 p2, 0x0

    :goto_2a
    iget-object p0, p0, Ldte;->d:Lx5f;

    iget-boolean v1, p0, Lx5f;->h:Z

    if-nez v1, :cond_31

    :cond_30
    return-void

    :cond_31
    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v5

    new-instance v6, Ljj0;

    const/4 v7, -0x1

    const/4 v8, 0x4

    const/16 v9, 0x98b

    invoke-direct {v6, v9, v7, v8}, Ljf0;-><init>(III)V

    invoke-virtual {v6, v2, v0, v3}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v6, v0, v0, p1}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 p1, 0x2

    invoke-virtual {v6, p1, v0, v4}, Ljf0;->q(IILjava/lang/Object;)V

    if-eqz p2, :cond_4d

    move v2, v0

    :cond_4d
    const/4 p1, 0x3

    invoke-virtual {v6, p1, v2, p2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v5, v1}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object p1

    invoke-virtual {p1, v1}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object p1

    const/16 p2, 0x2d

    invoke-virtual {p1, p2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-eqz v1, :cond_6f

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_6f

    new-instance v0, Lhf0;

    invoke-direct {v0, p1, p2, v1}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_79

    :cond_6f
    invoke-static {p1, p2, v0}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v0

    new-instance v1, Lhf0;

    invoke-direct {v1, p1, p2, v0}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    move-object v0, v1

    :goto_79
    invoke-virtual {v0, v6}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v5}, Lx5f;->U0(Lx56;)V

    return-void
.end method
