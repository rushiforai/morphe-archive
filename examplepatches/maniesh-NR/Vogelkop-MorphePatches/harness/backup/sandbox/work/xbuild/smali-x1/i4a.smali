.class public final Li4a;
.super Liph;
.source "SourceFile"


# instance fields
.field public final a:Lk8;


# direct methods
.method public constructor <init>(Lk8;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Li4a;->a:Lk8;

    return-void
.end method


# virtual methods
.method public final getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V
    .registers 6

    invoke-super {p0, p1, p2, p3, p4}, Liph;->getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V

    invoke-static {p2}, Landroidx/recyclerview/widget/RecyclerView;->S(Landroid/view/View;)I

    move-result p4

    const/4 v0, -0x1

    if-ne p4, v0, :cond_b

    return-void

    :cond_b
    iget-object p0, p0, Li4a;->a:Lk8;

    invoke-virtual {p0, p4}, Lk8;->T(I)Landroid/graphics/Rect;

    move-result-object p0

    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object p2

    instance-of p3, p2, Lh4a;

    if-eqz p3, :cond_1c

    check-cast p2, Lh4a;

    goto :goto_1d

    :cond_1c
    const/4 p2, 0x0

    :goto_1d
    if-eqz p2, :cond_22

    invoke-interface {p2, p0}, Lh4a;->l(Landroid/graphics/Rect;)V

    :cond_22
    invoke-virtual {p1, p0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    return-void
.end method
