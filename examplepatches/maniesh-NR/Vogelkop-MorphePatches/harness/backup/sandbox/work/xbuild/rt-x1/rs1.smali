.class public final Lrs1;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final b:Lot1;

.field public c:Lqs1;

.field public final synthetic d:Lss1;


# direct methods
.method public constructor <init>(Lss1;Lot1;)V
    .registers 3

    iput-object p1, p0, Lrs1;->d:Lss1;

    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p2, p0, Lrs1;->b:Lot1;

    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 11

    iget-object p1, p0, Lrs1;->d:Lss1;

    iget v0, p1, Lss1;->b:I

    iget-object p0, p0, Lrs1;->c:Lqs1;

    const/4 v1, 0x0

    if-nez p0, :cond_b

    move-object v2, v1

    goto :goto_c

    :cond_b
    move-object v2, p0

    :goto_c
    iget v2, v2, Lqs1;->a:I

    if-eq v0, v2, :cond_83

    if-nez p0, :cond_14

    move-object v0, v1

    goto :goto_15

    :cond_14
    move-object v0, p0

    :goto_15
    iget-boolean v0, v0, Lqs1;->c:Z

    const/4 v2, 0x0

    if-eqz v0, :cond_20

    iget-boolean v0, p1, Lss1;->c:Z

    if-nez v0, :cond_20

    const/4 v0, 0x1

    goto :goto_21

    :cond_20
    move v0, v2

    :goto_21
    iget-object p1, p1, Lss1;->d:Lole;

    iget-object p1, p1, Lole;->a:Ljava/lang/Object;

    move-object v4, p1

    check-cast v4, Lts1;

    if-nez p0, :cond_2c

    move-object v7, v1

    goto :goto_2d

    :cond_2c
    move-object v7, p0

    :goto_2d
    iget-object p0, v4, Lts1;->r:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lat1;

    invoke-virtual {v4}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget p1, v7, Lqs1;->a:I

    invoke-static {p1}, Ld7j;->d(I)Ld7j;

    move-result-object p1

    iget-boolean v3, p0, Lat1;->q:Z

    invoke-virtual {p0, p1, v2, v3}, Lat1;->k(Ld7j;ZZ)V

    iget-object v2, p0, Lat1;->l:Lekc;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    sget-object v3, Lm18;->b:Lm18;

    if-ne v2, v3, :cond_a0

    iget-boolean p1, v7, Lqs1;->d:Z

    if-eqz p1, :cond_9c

    iget-object p1, p0, Lat1;->m:Lr2i;

    iget-object p1, p1, Lr2i;->h:Lkze;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Iterable;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_63
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7f

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lk15;

    iget-object v2, v2, Lk15;->a:Ljava/lang/String;

    iget v3, v7, Lqs1;->a:I

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_63

    move-object v1, v0

    :cond_7f
    check-cast v1, Lk15;

    if-nez v1, :cond_84

    :cond_83
    return-void

    :cond_84
    iget-object p1, p0, Lat1;->n:Le4i;

    sget-object v0, Lo3i;->f:Lo3i;

    sget-object v2, Lq4i;->b:Lq4i;

    new-instance v3, Lxs1;

    const/4 v8, 0x1

    move-object v6, v4

    move-object v4, p0

    invoke-direct/range {v3 .. v8}, Lxs1;-><init>(Lat1;Landroid/content/Context;Lndc;Lqs1;B)V

    move-object v5, v0

    move-object v7, v2

    move-object v8, v3

    move-object v4, v6

    move-object v3, p1

    move-object v6, v1

    invoke-virtual/range {v3 .. v8}, Le4i;->b(Lndc;Lo3i;Lk15;Lq4i;Lkotlin/jvm/functions/Function1;)V

    return-void

    :cond_9c
    invoke-virtual {p0, v5, v4, v7}, Lat1;->g(Landroid/content/Context;Lndc;Lqs1;)V

    return-void

    :cond_a0
    if-nez v0, :cond_a6

    invoke-virtual {p0, v5, v4, v7}, Lat1;->g(Landroid/content/Context;Lndc;Lqs1;)V

    return-void

    :cond_a6
    iget-object v0, p0, Lat1;->e:Lgjm;

    new-instance v1, Llt1;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    new-instance v2, Lf9;

    const/4 v3, 0x5

    invoke-direct {v2, p0, p1, v5, v3}, Lf9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Lug;

    const/4 p1, 0x2

    invoke-direct {p0, v2, p1}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, v1, v4, p0}, Lgjm;->c(Lr37;Lndc;Lf7f;)V

    return-void
.end method
