.class public final Lote;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final b:Lcom/google/android/material/chip/Chip;

.field public final synthetic c:Lpte;


# direct methods
.method public constructor <init>(Lpte;Landroid/view/View;)V
    .registers 3

    iput-object p1, p0, Lote;->c:Lpte;

    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    check-cast p2, Lcom/google/android/material/chip/Chip;

    iput-object p2, p0, Lote;->b:Lcom/google/android/material/chip/Chip;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 8

    invoke-virtual {p0}, Landroidx/recyclerview/widget/i;->getAdapterPosition()I

    move-result p1

    iget-object p0, p0, Lote;->c:Lpte;

    iget-object v0, p0, Lpte;->w:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcwf;

    iget-boolean v1, v0, Lcwf;->b:Z

    xor-int/lit8 v2, v1, 0x1

    if-eqz v1, :cond_46

    iget-object v3, p0, Lpte;->w:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const/4 v4, 0x0

    :cond_1b
    :goto_1b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2e

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcwf;

    iget-boolean v5, v5, Lcwf;->b:Z

    if-eqz v5, :cond_1b

    add-int/lit8 v4, v4, 0x1

    goto :goto_1b

    :cond_2e
    const/4 v3, 0x1

    if-ne v4, v3, :cond_46

    iget-object p0, p0, Lltl;->n:Lqm9;

    new-instance p1, Lglj;

    new-instance v0, Lrxh;

    const v1, 0x7f140570

    invoke-direct {v0, v1}, Lrxh;-><init>(I)V

    const/16 v1, 0x9c4

    invoke-direct {p1, v0, v1}, Lglj;-><init>(Lpxh;I)V

    invoke-virtual {p0, p1}, Lqm9;->f(Lo93;)V

    return-void

    :cond_46
    iput-boolean v2, v0, Lcwf;->b:Z

    instance-of v3, v0, Lcwf;

    if-eqz v3, :cond_70

    iget-object v0, v0, Lcwf;->f:Lbwf;

    invoke-virtual {v0}, Lbwf;->a()Ljava/lang/String;

    move-result-object v3

    const-string v4, "cur_city_id"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6b

    iput-boolean v2, p0, Lpte;->E:Z

    iget-object v2, p0, Lpte;->z:Lwte;

    iget-object v2, v2, Lwte;->e:Lv9j;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lste;

    if-eqz v2, :cond_6b

    invoke-virtual {p0, v2}, Lpte;->L0(Lste;)V

    :cond_6b
    if-nez v1, :cond_70

    invoke-virtual {v0}, Lbwf;->a()Ljava/lang/String;

    :cond_70
    iget-object v0, p0, Lpte;->y:Lx93;

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    invoke-virtual {p0}, Lpte;->J0()V

    return-void
.end method
