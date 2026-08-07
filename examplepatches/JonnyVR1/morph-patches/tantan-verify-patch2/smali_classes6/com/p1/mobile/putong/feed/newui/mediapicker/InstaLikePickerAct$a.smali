.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$a;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->m3()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:I

.field public final synthetic b:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$a;->b:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$a;->a:I

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 0

    .line 1
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$a;->a:I

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$a;->a:I

    .line 8
    .line 9
    if-nez p2, :cond_1

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$a;->b:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->r:Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorRecyclerView;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 20
    .line 21
    invoke-virtual {p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstCompletelyVisibleItemPosition()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-nez p1, :cond_1

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$a;->b:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->l:Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/CoordinatorLinearLayout;->g()V

    .line 32
    .line 33
    .line 34
    :cond_1
    :goto_0
    return-void
.end method

.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct$a;->a:I

    .line 5
    .line 6
    return-void
.end method
