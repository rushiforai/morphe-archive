.class public final synthetic Ltte;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lxxf;


# instance fields
.field public final synthetic a:Lwte;


# direct methods
.method public synthetic constructor <init>(Lwte;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltte;->a:Lwte;

    return-void
.end method


# virtual methods
.method public final f()V
    .registers 7

    iget-object p0, p0, Ltte;->a:Lwte;

    iget-object v0, p0, Lwte;->f:Lzxf;

    invoke-virtual {v0}, Lzxf;->e()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_54

    invoke-virtual {p0}, Lwte;->a()Z

    move-result v1

    if-eqz v1, :cond_54

    iget-object v1, p0, Lwte;->g:Lzxf;

    invoke-virtual {v1}, Lzxf;->e()Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->i0(Ljava/lang/Iterable;)Ljava/util/HashSet;

    move-result-object v1

    check-cast v0, Ljava/lang/Iterable;

    new-instance v2, Ljava/util/ArrayList;

    const/16 v3, 0xa

    invoke-static {v0, v3}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_32
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lbwf;

    new-instance v4, Lcwf;

    invoke-virtual {v1, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v5

    invoke-direct {v4, v3, v5}, Lcwf;-><init>(Lbwf;Z)V

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_32

    :cond_4b
    iput-object v2, p0, Lwte;->n:Ljava/util/List;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lwte;->q:Z

    invoke-virtual {p0}, Lwte;->b()V

    return-void

    :cond_54
    iput-boolean v2, p0, Lwte;->q:Z

    invoke-virtual {p0}, Lwte;->b()V

    return-void
.end method
