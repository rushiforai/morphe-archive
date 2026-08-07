.class public final Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel$initView$1;
.super Landroidx/recyclerview/widget/LinearLayoutManager;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000)\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J/\u0010\t\u001a\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u00022\u000c\u0010\u0006\u001a\u0008\u0018\u00010\u0004R\u00020\u00052\u0008\u0010\u0008\u001a\u0004\u0018\u00010\u0007H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nJ\u000f\u0010\u000c\u001a\u00020\u000bH\u0016\u00a2\u0006\u0004\u0008\u000c\u0010\r\u00a8\u0006\u000e"
    }
    d2 = {
        "com/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel$initView$1",
        "Landroidx/recyclerview/widget/LinearLayoutManager;",
        "",
        "dy",
        "Landroidx/recyclerview/widget/RecyclerView$v;",
        "Landroidx/recyclerview/widget/RecyclerView;",
        "recycler",
        "Landroidx/recyclerview/widget/RecyclerView$a0;",
        "state",
        "scrollVerticallyBy",
        "(ILandroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)I",
        "",
        "canScrollVertically",
        "()Z",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel$initView$1;->a:Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public canScrollVertically()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel$initView$1;->a:Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->l(Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public scrollVerticallyBy(ILandroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)I
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollVerticallyBy(ILandroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel$initView$1;->a:Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;

    .line 6
    .line 7
    invoke-static {p3}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->k(Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;)Z

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    if-eqz p3, :cond_0

    .line 12
    .line 13
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel$initView$1;->a:Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;

    .line 14
    .line 15
    invoke-static {p3}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->l(Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;)Z

    .line 16
    .line 17
    .line 18
    move-result p3

    .line 19
    if-nez p3, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel$initView$1;->a:Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;

    .line 22
    .line 23
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;->j(Lcom/p1/mobile/putong/core/ui/intl/visitor/IntlVisitorsViewModel;I)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return p2
.end method
