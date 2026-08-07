.class Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableWithLifecycleContainerView;
.super Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final L()Landroid/app/Application$ActivityLifecycleCallbacks;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableWithLifecycleContainerView$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableWithLifecycleContainerView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableWithLifecycleContainerView;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public final M()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableWithLifecycleContainerView;->L()Landroid/app/Application$ActivityLifecycleCallbacks;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public p(Landroid/content/Context;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableContainerView;->p(Landroid/content/Context;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/suspenddraggableview/FeedFloatingDraggableWithLifecycleContainerView;->M()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
