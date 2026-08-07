.class public Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView$a;
.super Landroidx/recyclerview/widget/GridLayoutManager$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroidx/recyclerview/widget/GridLayoutManager;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;Landroidx/recyclerview/widget/GridLayoutManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView$a;->b:Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView$a;->a:Landroidx/recyclerview/widget/GridLayoutManager;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView$a;->b:Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;->R(Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;)Ll/j0u;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->getItemCount()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    add-int/lit8 v0, v0, -0x1

    .line 12
    .line 13
    if-ne p1, v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView$a;->a:Landroidx/recyclerview/widget/GridLayoutManager;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroidx/recyclerview/widget/GridLayoutManager;->m()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView$a;->b:Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;

    .line 23
    .line 24
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;->R(Lcom/p1/mobile/putong/live/livingroom/common/roomsuggest/view/LiveRoomSuggestView;)Ll/j0u;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->K(I)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0
.end method
