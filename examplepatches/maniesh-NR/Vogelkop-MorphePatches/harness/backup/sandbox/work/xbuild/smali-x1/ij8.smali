.class public final Lij8;
.super Liph;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lixh;

    const/high16 v1, 0x41000000    # 8.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    invoke-virtual {v0, p1}, Ly7h;->k(Landroid/content/Context;)I

    move-result v0

    iput v0, p0, Lij8;->a:I

    new-instance v0, Lixh;

    const/high16 v1, 0x41400000    # 12.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    invoke-virtual {v0, p1}, Ly7h;->k(Landroid/content/Context;)I

    move-result p1

    iput p1, p0, Lij8;->b:I

    return-void
.end method


# virtual methods
.method public final getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V
    .registers 7

    invoke-super {p0, p1, p2, p3, p4}, Liph;->getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V

    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object p2

    instance-of p4, p2, Lymh;

    if-eqz p4, :cond_21

    check-cast p2, Lymh;

    invoke-virtual {p2}, Landroidx/recyclerview/widget/i;->getBindingAdapterPosition()I

    move-result p2

    const/4 p4, -0x1

    if-eq p2, p4, :cond_21

    iget-object p3, p3, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/d;

    instance-of p4, p3, Lumh;

    const/4 v0, 0x0

    if-eqz p4, :cond_1e

    check-cast p3, Lumh;

    goto :goto_1f

    :cond_1e
    move-object p3, v0

    :goto_1f
    if-nez p3, :cond_22

    :cond_21
    return-void

    :cond_22
    iget-object p3, p3, Ldt1;->d:Ljava/lang/Object;

    check-cast p3, Ljava/util/ArrayList;

    if-nez p2, :cond_2a

    move-object p4, v0

    goto :goto_32

    :cond_2a
    add-int/lit8 p4, p2, -0x1

    invoke-virtual {p3, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lsmh;

    :goto_32
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-eq p2, v1, :cond_43

    add-int/lit8 p2, p2, 0x1

    invoke-virtual {p3, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    move-object v0, p2

    check-cast v0, Lsmh;

    :cond_43
    instance-of p2, p4, Lhj8;

    iget p3, p0, Lij8;->b:I

    iget p0, p0, Lij8;->a:I

    if-eqz p2, :cond_4d

    move p2, p0

    goto :goto_4e

    :cond_4d
    move p2, p3

    :goto_4e
    iput p2, p1, Landroid/graphics/Rect;->top:I

    instance-of p2, v0, Lhj8;

    if-eqz p2, :cond_55

    move p3, p0

    :cond_55
    iput p3, p1, Landroid/graphics/Rect;->bottom:I

    return-void
.end method
