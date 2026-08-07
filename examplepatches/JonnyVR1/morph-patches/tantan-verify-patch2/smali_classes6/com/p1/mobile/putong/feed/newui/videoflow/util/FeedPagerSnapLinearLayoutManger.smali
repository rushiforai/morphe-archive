.class public Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;
.super Landroidx/recyclerview/widget/LinearLayoutManager;
.source "SourceFile"


# instance fields
.field public a:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public b:Landroidx/recyclerview/widget/s;

.field public c:Landroidx/recyclerview/widget/RecyclerView;

.field public d:Z

.field public e:Landroidx/recyclerview/widget/RecyclerView$q;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger$a;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger$a;-><init>(Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;->e:Landroidx/recyclerview/widget/RecyclerView$q;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;->g()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 16
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger$a;-><init>(Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;->e:Landroidx/recyclerview/widget/RecyclerView$q;

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;->g()V

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;->d:Z

    return p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;)Landroidx/recyclerview/widget/RecyclerView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;->c:Landroidx/recyclerview/widget/RecyclerView;

    return-object p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;)Ll/y20;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;->a:Ll/y20;

    return-object p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;->d:Z

    return-void
.end method


# virtual methods
.method public final g()V
    .locals 1

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/s;

    .line 2
    .line 3
    invoke-direct {v0}, Landroidx/recyclerview/widget/s;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;->b:Landroidx/recyclerview/widget/s;

    .line 7
    .line 8
    return-void
.end method

.method public h(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;->a:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public onAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->onAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;->b:Landroidx/recyclerview/widget/s;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/w;->b(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;->e:Landroidx/recyclerview/widget/RecyclerView$q;

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->addOnChildAttachStateChangeListener(Landroidx/recyclerview/widget/RecyclerView$q;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onScrollStateChanged(I)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;->b:Landroidx/recyclerview/widget/s;

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/s;->h(Landroidx/recyclerview/widget/RecyclerView$o;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->getPosition(Landroid/view/View;)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;->a:Ll/y20;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/util/FeedPagerSnapLinearLayoutManger;->a:Ll/y20;

    .line 29
    .line 30
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    :goto_0
    return-void
.end method
