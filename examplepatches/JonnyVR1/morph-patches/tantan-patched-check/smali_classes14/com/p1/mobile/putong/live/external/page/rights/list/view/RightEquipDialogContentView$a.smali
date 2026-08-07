.class public Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView$a;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;->onFinishInflate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView$a;->a:Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 1
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView$a;->a:Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;->m0(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;->o0(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;Landroidx/recyclerview/widget/RecyclerView;IZ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView$a;->a:Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;

    .line 5
    .line 6
    if-lez p3, :cond_0

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p1, 0x0

    .line 11
    :goto_0
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;->n0(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightEquipDialogContentView;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
