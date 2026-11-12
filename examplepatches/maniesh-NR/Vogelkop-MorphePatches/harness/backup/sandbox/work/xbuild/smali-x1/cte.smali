.class public final Lcte;
.super Loh4;
.source "SourceFile"


# instance fields
.field public b:Z

.field public final synthetic c:Ldte;

.field public final synthetic d:Landroid/content/Context;


# direct methods
.method public constructor <init>(Ldte;Landroid/content/Context;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcte;->c:Ldte;

    iput-object p2, p0, Lcte;->d:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final d(Ljava/lang/Object;)V
    .registers 10

    check-cast p1, Ll1c;

    iget-object v0, p0, Lcte;->c:Ldte;

    iget-object v1, v0, Ldte;->e:Lbte;

    if-nez p1, :cond_13

    sget-object p0, Ll08;->a:Ll08;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p1, v1, Lbte;->a:Lkze;

    invoke-virtual {p1, p0}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :cond_13
    iget-object v2, p1, Ll1c;->c:Ll0c;

    iput-object v2, v0, Ldte;->g:Ll0c;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iget-object p1, p1, Ll1c;->a:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_26
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_55

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ll0c;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lq0c;

    new-instance v5, Late;

    iget v6, v3, Lq0c;->a:I

    iget-object v7, p0, Lcte;->d:Landroid/content/Context;

    invoke-virtual {v7, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    iget v3, v3, Lq0c;->b:I

    invoke-virtual {v7, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v5, v4, v6, v3}, Late;-><init>(Ll0c;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_26

    :cond_55
    iget-object p0, v0, Ldte;->f:Lz8b;

    iget-object p0, p0, Lz8b;->a:Ljava/lang/Object;

    check-cast p0, Lc9;

    invoke-static {p0, v2}, Ln95;->r(Ljava/util/Comparator;Ljava/util/List;)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, v1, Lbte;->a:Lkze;

    invoke-virtual {p0, v2}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final e()V
    .registers 2

    iget-boolean v0, p0, Lcte;->b:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcte;->b:Z

    iget-object v0, p0, Lcte;->c:Ldte;

    iget-object v0, v0, Ldte;->b:Lfqe;

    invoke-virtual {v0, p0}, Lfqe;->a(Lq8j;)V

    return-void
.end method
