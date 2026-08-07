.class public Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView$b;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->u(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView$b;->a:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;

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
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    if-ne p2, p1, :cond_0

    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView$b;->a:Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/group/dialog/insert/twolevellinkage/FeedPostSelectedCategoryTopicsView;->b:Lv/VSearchBar;

    .line 7
    .line 8
    invoke-virtual {p0}, Lv/VSearchBar;->clearFocus()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 0

    return-void
.end method
