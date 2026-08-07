.class public Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2$b;
.super Landroidx/recyclerview/widget/RecyclerView$i;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2$b;->a:Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$i;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onChanged()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroidx/recyclerview/widget/RecyclerView$i;->onChanged()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2$b;->a:Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2;->l(Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2;)Landroidx/recyclerview/widget/RecyclerView;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2$b;->a:Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2;->l(Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2;)Landroidx/recyclerview/widget/RecyclerView;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    goto :goto_0

    .line 30
    :cond_1
    const/4 v0, 0x0

    .line 31
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2$b;->a:Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2;

    .line 32
    .line 33
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-ne v0, v1, :cond_2

    .line 38
    .line 39
    :goto_1
    return-void

    .line 40
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2$b;->a:Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2;

    .line 41
    .line 42
    iget v2, v1, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->l:I

    .line 43
    .line 44
    if-ge v2, v0, :cond_3

    .line 45
    .line 46
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2;->l(Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2;)Landroidx/recyclerview/widget/RecyclerView;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2;->p(Landroidx/recyclerview/widget/RecyclerView$o;)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iput v0, v1, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->l:I

    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_3
    const/4 v0, -0x1

    .line 62
    iput v0, v1, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->l:I

    .line 63
    .line 64
    :goto_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2$b;->a:Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2;

    .line 65
    .line 66
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2;->m(Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public onItemRangeChanged(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$i;->onItemRangeChanged(II)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2$b;->onChanged()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onItemRangeChanged(IILjava/lang/Object;)V
    .locals 0
    .param p3    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 8
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$i;->onItemRangeChanged(IILjava/lang/Object;)V

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2$b;->onChanged()V

    return-void
.end method

.method public onItemRangeInserted(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$i;->onItemRangeInserted(II)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2$b;->onChanged()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onItemRangeMoved(III)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$i;->onItemRangeMoved(III)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2$b;->onChanged()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onItemRangeRemoved(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$i;->onItemRangeRemoved(II)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2$b;->onChanged()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
