.class public final synthetic Ldc9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln5o;
.implements Ljr9;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lpc9;


# direct methods
.method public synthetic constructor <init>(Lpc9;B)V
    .registers 3

    iput-byte p2, p0, Ldc9;->a:B

    iput-object p1, p0, Ldc9;->b:Lpc9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    check-cast p1, [B

    iget-object p0, p0, Ldc9;->b:Lpc9;

    iget-object p0, p0, Lpc9;->c:Lbf9;

    invoke-virtual {p0}, Lbf9;->x()Ljavax/crypto/spec/SecretKeySpec;

    move-result-object p0

    if-nez p0, :cond_e

    const/4 p0, 0x0

    return-object p0

    :cond_e
    const/4 v0, 0x1

    invoke-static {v0, p0, p1, v0}, Lp36;->a(ILjavax/crypto/spec/SecretKeySpec;[BZ)Ljavax/crypto/Cipher;

    move-result-object p0

    return-object p0
.end method

.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Ldc9;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget-object p0, p0, Ldc9;->b:Lpc9;

    packed-switch v0, :pswitch_data_dc

    :pswitch_9
    check-cast p1, Landroid/util/Pair;

    if-eqz p1, :cond_20

    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p1, Lhb9;

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lpc9;->g(ILjava/util/List;)V

    :cond_20
    return-object v2

    :pswitch_21
    check-cast p1, Landroid/util/Pair;

    if-eqz p1, :cond_4b

    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-lez v0, :cond_3a

    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0, v1, v0}, Lpc9;->h(II)V

    :cond_3a
    iget-object v0, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4b

    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, v1, p1}, Lpc9;->g(ILjava/util/List;)V

    :cond_4b
    return-object v2

    :pswitch_4c
    check-cast p1, Ljava/lang/Integer;

    if-eqz p1, :cond_58

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lpc9;->h(II)V

    :cond_58
    return-object v2

    :pswitch_59
    check-cast p1, Landroid/util/Pair;

    if-eqz p1, :cond_b3

    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p1, Lhb9;

    iget-object v1, p0, Lpc9;->e:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_b3

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v3}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_7a
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_b3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lsc9;

    iget-object v5, p0, Lpc9;->f:Ljava/util/HashSet;

    invoke-virtual {v5, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_7a

    invoke-interface {v1, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7a

    check-cast v4, Lqc9;

    iget-object v4, v4, Lqc9;->a:Lrc9;

    iget-object v5, v4, Lrc9;->c:Ljava/util/ArrayList;

    invoke-virtual {v5, v0, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    iget-object v4, v4, Lrc9;->d:Lh7f;

    invoke-static {v4, v4}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v4

    :goto_a3
    invoke-virtual {v4}, Lg7f;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7a

    invoke-virtual {v4}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lmb9;

    invoke-interface {v5, v0}, Lmb9;->m(I)V

    goto :goto_a3

    :cond_b3
    return-object v2

    :pswitch_b4
    check-cast p1, Landroid/util/Pair;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p1, :cond_ce

    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p1, Lhb9;

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lpc9;->g(ILjava/util/List;)V

    :cond_ce
    return-object v2

    :pswitch_cf
    check-cast p1, Ljava/lang/Integer;

    if-eqz p1, :cond_da

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0, v1, p1}, Lpc9;->h(II)V

    :cond_da
    return-object v2

    nop

    :pswitch_data_dc
    .packed-switch 0x0
        :pswitch_cf
        :pswitch_b4
        :pswitch_9
        :pswitch_59
        :pswitch_4c
        :pswitch_21
    .end packed-switch
.end method
