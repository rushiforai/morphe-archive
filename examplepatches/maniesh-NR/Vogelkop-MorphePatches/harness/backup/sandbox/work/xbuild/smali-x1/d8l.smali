.class public final synthetic Ld8l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lj8l;


# direct methods
.method public synthetic constructor <init>(Lj8l;B)V
    .registers 3

    iput-byte p2, p0, Ld8l;->a:B

    iput-object p1, p0, Ld8l;->b:Lj8l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 7

    iget-byte v0, p0, Ld8l;->a:B

    iget-object p0, p0, Ld8l;->b:Lj8l;

    packed-switch v0, :pswitch_data_82

    iget-object v0, p0, Lj8l;->b:Lk6l;

    iget-object v1, v0, Lk6l;->b:Ljava/util/ArrayList;

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_75

    iget-object p0, p0, Lj8l;->a:Lc8l;

    iget-object v0, v0, Lk6l;->b:Ljava/util/ArrayList;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    new-instance v1, Ljava/util/ArrayList;

    const/16 v2, 0xa

    invoke-static {v0, v2}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb2l;

    check-cast v3, Ld7l;

    iget-object v3, v3, Ld7l;->j:Le7l;

    invoke-interface {v3}, Lb9l;->getId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2e

    :cond_4a
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lp6l;->a:Lp6l;

    invoke-virtual {p0, v1}, Lc8l;->c(Lp6l;)Lmcj;

    move-result-object v3

    iget-object v4, v3, Lmcj;->b:Ljava/lang/Object;

    check-cast v4, Lo7l;

    new-instance v5, Ltmi;

    invoke-direct {v5, p0, v3, v1, v2}, Ltmi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v4, v0, v5}, Lo7l;->e(Ljava/util/Set;Ltmi;)V

    sget-object v1, Lp6l;->b:Lp6l;

    invoke-virtual {p0, v1}, Lc8l;->c(Lp6l;)Lmcj;

    move-result-object v3

    iget-object v4, v3, Lmcj;->b:Ljava/lang/Object;

    check-cast v4, Lo7l;

    new-instance v5, Ltmi;

    invoke-direct {v5, p0, v3, v1, v2}, Ltmi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v4, v0, v5}, Lo7l;->e(Ljava/util/Set;Ltmi;)V

    :cond_75
    return-void

    :pswitch_76
    sget-object v0, Lava;->a:Lcva;

    new-instance v1, Ld8l;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Ld8l;-><init>(Lj8l;B)V

    invoke-virtual {v0, v1}, Lcva;->a(Ljava/lang/Runnable;)V

    return-void

    :pswitch_data_82
    .packed-switch 0x0
        :pswitch_76
    .end packed-switch
.end method
