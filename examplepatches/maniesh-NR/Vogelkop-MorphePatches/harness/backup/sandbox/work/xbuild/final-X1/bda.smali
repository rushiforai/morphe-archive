.class public final synthetic Lbda;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvx4;
.implements Lxsi;
.implements Llkm;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ldda;


# direct methods
.method public synthetic constructor <init>(Ldda;B)V
    .registers 3

    iput-byte p2, p0, Lbda;->a:B

    iput-object p1, p0, Lbda;->b:Ldda;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final R(Ljava/util/ArrayList;)V
    .registers 8

    iget-byte v0, p0, Lbda;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget-object p0, p0, Lbda;->b:Ldda;

    packed-switch v0, :pswitch_data_de

    iget-object p0, p0, Ldda;->C:Ljy0;

    if-eqz p0, :cond_e

    move-object v2, p0

    :cond_e
    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1e
    :goto_1e
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4f

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v3

    iget-object v0, v2, Ljy0;->e:Ljava/util/LinkedHashSet;

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v0, v2, Ljy0;->f:Lwjh;

    iget-object v0, v0, Lwjh;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashMap;

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgy0;

    if-eqz v0, :cond_1e

    iget-object v0, v0, Lgy0;->a:Lyda;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1e

    :cond_4f
    iget-object p0, v2, Ljy0;->b:Lnv6;

    iget-object p0, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p0, Ldda;

    invoke-virtual {p0}, Ldda;->L0()Lcom/opera/android/history/f;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_60
    if-ge v1, v0, :cond_72

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lzda;

    iget-object v3, p0, Lcom/opera/android/history/f;->f:Lcom/opera/android/history/d;

    iget-object v3, v3, Lzsi;->k:Lati;

    invoke-interface {v3, v2}, Lati;->remove(Ljava/lang/Object;)V

    goto :goto_60

    :cond_72
    return-void

    :pswitch_73
    iget-object p0, p0, Ldda;->A:Lztn;

    if-eqz p0, :cond_78

    move-object v2, p0

    :cond_78
    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_88
    :goto_88
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_b9

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v3

    iget-object v0, v2, Lztn;->f:Ljava/util/HashSet;

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    iget-object v0, v2, Lztn;->g:Lwjj;

    iget-object v0, v0, Lwjj;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashMap;

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/history/g;

    if-eqz v0, :cond_88

    iget-object v0, v0, Lcom/opera/android/history/g;->a:Lcom/opera/android/history/c;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_88

    :cond_b9
    iget-object p0, v2, Lztn;->c:Lga6;

    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Ldda;

    invoke-virtual {p0}, Ldda;->L0()Lcom/opera/android/history/f;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_ca
    if-ge v1, v0, :cond_dc

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lzda;

    iget-object v3, p0, Lcom/opera/android/history/f;->f:Lcom/opera/android/history/d;

    iget-object v3, v3, Lzsi;->k:Lati;

    invoke-interface {v3, v2}, Lati;->remove(Ljava/lang/Object;)V

    goto :goto_ca

    :cond_dc
    return-void

    nop

    :pswitch_data_de
    .packed-switch 0x2
        :pswitch_73
    .end packed-switch
.end method

.method public final a(Lcom/google/android/material/chip/ChipGroup;)V
    .registers 4

    iget-object p1, p1, Lcom/google/android/material/chip/ChipGroup;->h:Lev4;

    invoke-virtual {p1}, Lev4;->e()I

    move-result p1

    iget-object p0, p0, Lbda;->b:Ldda;

    iget-object v0, p0, Ldda;->y:Lei;

    const/4 v1, 0x0

    if-nez v0, :cond_e

    move-object v0, v1

    :cond_e
    iget-object v0, v0, Lei;->g:Landroid/view/View;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaChip;

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v0

    if-ne p1, v0, :cond_22

    invoke-virtual {p0}, Ldda;->L0()Lcom/opera/android/history/f;

    move-result-object p0

    sget-object p1, Laea;->a:Laea;

    invoke-virtual {p0, p1}, Lcom/opera/android/history/f;->i(Laea;)V

    return-void

    :cond_22
    iget-object v0, p0, Ldda;->y:Lei;

    if-eqz v0, :cond_27

    move-object v1, v0

    :cond_27
    iget-object v0, v1, Lei;->d:Landroid/view/View;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaChip;

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v0

    if-ne p1, v0, :cond_3a

    invoke-virtual {p0}, Ldda;->L0()Lcom/opera/android/history/f;

    move-result-object p0

    sget-object p1, Laea;->b:Laea;

    invoke-virtual {p0, p1}, Lcom/opera/android/history/f;->i(Laea;)V

    :cond_3a
    return-void
.end method

.method public final b(Landroid/view/MenuItem;Z)V
    .registers 3

    iget-object p0, p0, Lbda;->b:Ldda;

    invoke-virtual {p0, p1, p2}, Ldda;->N0(Landroid/view/MenuItem;Z)V

    return-void
.end method
