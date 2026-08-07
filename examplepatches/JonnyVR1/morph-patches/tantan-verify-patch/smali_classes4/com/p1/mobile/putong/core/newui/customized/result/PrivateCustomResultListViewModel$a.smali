.class public final Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel$a;
.super Landroidx/recyclerview/widget/GridLayoutManager$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->A()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0004*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0004\u001a\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0004\u0010\u0005\u00a8\u0006\u0006"
    }
    d2 = {
        "com/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel$a",
        "Landroidx/recyclerview/widget/GridLayoutManager$c;",
        "",
        "position",
        "f",
        "(I)I",
        "member_intlGmsRelease"
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
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel$initRecyclerView$1$1;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel$initRecyclerView$1$1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel$a;->a:Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel$a;->b:Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel$initRecyclerView$1$1;

    .line 4
    .line 5
    invoke-direct {p0}, Landroidx/recyclerview/widget/GridLayoutManager$c;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public f(I)I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel$a;->a:Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel;->m()Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListFrag;->U4()Lcom/p1/mobile/putong/core/newui/customized/result/a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/customized/result/a;->getItemViewType(I)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    if-eq p1, v0, :cond_0

    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    return p0

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel$a;->b:Lcom/p1/mobile/putong/core/newui/customized/result/PrivateCustomResultListViewModel$initRecyclerView$1$1;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->m()I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0
.end method
