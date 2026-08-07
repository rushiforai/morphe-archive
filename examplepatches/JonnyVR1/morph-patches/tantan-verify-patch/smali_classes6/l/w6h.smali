.class public Ll/w6h;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/groupfriend/FeedGroupFriendFrag;Landroid/view/View;)V
    .locals 2

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroid/view/ViewGroup;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lv/VPullDownRefreshLayout;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/groupfriend/FeedGroupFriendFrag;->z:Lv/VPullDownRefreshLayout;

    .line 12
    .line 13
    sget v0, Ll/hdc0;->x1:I

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 20
    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/groupfriend/FeedGroupFriendFrag;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 22
    .line 23
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/groupfriend/FeedGroupFriendFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/tec0;->F0:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p0, p1}, Ll/w6h;->a(Lcom/p1/mobile/putong/feed/newui/group/groupdetail/module/groupfriend/FeedGroupFriendFrag;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
