.class public final Lrqk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final a:Lcom/opera/android/custom_views/FadingRecyclerView;

.field public final b:Lhqk;

.field public final c:[I

.field public final d:Lqqk;

.field public e:Lpa3;

.field public f:I


# direct methods
.method public constructor <init>(Lcom/opera/android/custom_views/FadingRecyclerView;Lhqk;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrqk;->a:Lcom/opera/android/custom_views/FadingRecyclerView;

    iput-object p2, p0, Lrqk;->b:Lhqk;

    const/16 p1, 0x14

    new-array p2, p1, [I

    const/4 v0, 0x0

    move v1, v0

    :goto_d
    if-ge v1, p1, :cond_1c

    if-eqz v1, :cond_16

    const/4 v2, 0x1

    if-eq v1, v2, :cond_17

    move v2, v0

    goto :goto_17

    :cond_16
    const/4 v2, 0x2

    :cond_17
    :goto_17
    aput v2, p2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    :cond_1c
    iput-object p2, p0, Lrqk;->c:[I

    new-instance p1, Lqqk;

    invoke-direct {p1}, Lqqk;-><init>()V

    iput-object p1, p0, Lrqk;->d:Lqqk;

    iget-object p0, p0, Lrqk;->a:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->D0(Lro9;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 3

    iget v0, p0, Lrqk;->f:I

    iget-object v1, p0, Lrqk;->c:[I

    array-length v1, v1

    if-lt v0, v1, :cond_c

    iget-object v0, p0, Lrqk;->e:Lpa3;

    if-nez v0, :cond_c

    return-void

    :cond_c
    sget-object v0, Lava;->a:Lcva;

    invoke-virtual {v0, p0}, Lcva;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final run()V
    .registers 4

    iget-object v0, p0, Lrqk;->b:Lhqk;

    iget-object v1, v0, Lhqk;->y:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-eqz v1, :cond_b

    return-void

    :cond_b
    iget-object v1, p0, Lrqk;->e:Lpa3;

    if-eqz v1, :cond_25

    invoke-virtual {v1}, Lpa3;->V()Z

    move-result v0

    if-eqz v0, :cond_18

    invoke-virtual {v1}, Lpa3;->X()V

    :cond_18
    invoke-virtual {v1}, Lpa3;->V()Z

    move-result v0

    if-nez v0, :cond_21

    const/4 v0, 0x0

    iput-object v0, p0, Lrqk;->e:Lpa3;

    :cond_21
    invoke-virtual {p0}, Lrqk;->a()V

    return-void

    :cond_25
    iget-object v1, p0, Lrqk;->c:[I

    iget v2, p0, Lrqk;->f:I

    aget v1, v1, v2

    iget-object v2, p0, Lrqk;->a:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {v0, v2, v1}, Landroidx/recyclerview/widget/d;->createViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;

    move-result-object v0

    check-cast v0, Lpa3;

    iget-object v1, p0, Lrqk;->d:Lqqk;

    iget-object v2, v1, Lqqk;->l:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1, v0}, Lro9;->F(Landroidx/recyclerview/widget/i;)V

    invoke-virtual {v0}, Lpa3;->V()Z

    move-result v1

    if-eqz v1, :cond_45

    iput-object v0, p0, Lrqk;->e:Lpa3;

    :cond_45
    iget v0, p0, Lrqk;->f:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lrqk;->f:I

    invoke-virtual {p0}, Lrqk;->a()V

    return-void
.end method
