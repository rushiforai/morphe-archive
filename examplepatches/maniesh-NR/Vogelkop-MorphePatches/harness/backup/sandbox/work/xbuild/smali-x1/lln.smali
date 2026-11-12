.class public final synthetic Llln;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lami;


# direct methods
.method public synthetic constructor <init>(Lami;B)V
    .registers 3

    iput-byte p2, p0, Llln;->a:B

    iput-object p1, p0, Llln;->b:Lami;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 10

    iget-byte v0, p0, Llln;->a:B

    iget-object p0, p0, Llln;->b:Lami;

    packed-switch v0, :pswitch_data_b8

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0}, Lami;->B()V

    return-void

    :pswitch_d
    check-cast p1, Lmln;

    sget-object v0, Lami;->m:Lby6;

    new-instance v1, Lmgh;

    iget-object v2, p0, Lami;->c:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-direct {v1, v2}, Lmgh;-><init>(Ljava/lang/String;)V

    sget-object v2, Lami;->l:Lill;

    invoke-virtual {v1, v2}, Lmgh;->a(Laln;)V

    iget-object v2, p1, Lmln;->a:Ljava/util/List;

    iget-object v3, p1, Lmln;->c:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_27
    :goto_27
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_47

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Laln;

    invoke-interface {v4}, Laln;->e()Z

    move-result v5

    if-eqz v5, :cond_43

    invoke-interface {v4}, Laln;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_27

    :cond_43
    invoke-virtual {v1, v4}, Lmgh;->a(Laln;)V

    goto :goto_27

    :cond_47
    iget-object p1, p1, Lmln;->b:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v2, 0x0

    move v4, v2

    :cond_4f
    :goto_4f
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_80

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Laln;

    invoke-interface {v5}, Laln;->getId()Ljava/lang/String;

    move-result-object v6

    const-string v7, "NETWORK_529"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6c

    invoke-virtual {v1, v0}, Lmgh;->a(Laln;)V

    const/4 v4, 0x1

    goto :goto_4f

    :cond_6c
    invoke-interface {v5}, Laln;->e()Z

    move-result v6

    if-eqz v6, :cond_7c

    invoke-interface {v5}, Laln;->getId()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4f

    :cond_7c
    invoke-virtual {v1, v5}, Lmgh;->a(Laln;)V

    goto :goto_4f

    :cond_80
    if-nez v4, :cond_85

    invoke-virtual {v1, v0}, Lmgh;->a(Laln;)V

    :cond_85
    iget-object p1, p0, Lami;->g:Ljava/lang/Object;

    check-cast p1, Lkze;

    iget-object v0, v1, Lmgh;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    new-instance v1, Lomj;

    const/16 v3, 0x14

    invoke-direct {v1, v3}, Lomj;-><init>(B)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    :goto_a0
    if-ge v2, v3, :cond_b0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v2, v2, 0x1

    check-cast v4, Ljnn;

    iget-object v4, v4, Ljnn;->a:Laln;

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_a0

    :cond_b0
    invoke-virtual {p1, v1}, Lekc;->r(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lami;->B()V

    return-void

    nop

    :pswitch_data_b8
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
