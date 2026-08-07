.class public Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2$a;
.super Landroidx/recyclerview/widget/RecyclerView$t;
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2$a;->a:Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2$a;->a:Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2;->p(Landroidx/recyclerview/widget/RecyclerView$o;)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    const/4 p2, -0x1

    .line 15
    if-ne p1, p2, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2$a;->a:Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/CircleIndicator2;->b(I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
