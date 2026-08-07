.class public Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/recyclerview/widget/RecyclerView$q;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger$a;->a:Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger$a;->a:Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;->c(Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;)Landroidx/recyclerview/widget/RecyclerView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->getChildPosition(Landroid/view/View;)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger$a;->a:Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;->a(Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger$a;->a:Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;

    .line 22
    .line 23
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;->e(Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;)Ll/y20;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger$a;->a:Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;

    .line 34
    .line 35
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;->e(Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;)Ll/y20;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const/4 v0, 0x0

    .line 40
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-interface {p1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger$a;->a:Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;

    .line 48
    .line 49
    const/4 p1, 0x1

    .line 50
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;->f(Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;Z)V

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method
