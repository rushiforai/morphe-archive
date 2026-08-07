.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;
.super Lv/VPager;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager$a;
    }
.end annotation


# instance fields
.field public P0:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager$a;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VPager;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;->P0:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager$a;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Lv/VPager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;->P0:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager$a;

    return-void
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;->P0:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager$a;

    .line 9
    .line 10
    :cond_0
    invoke-super {p0, p1}, Lv/VPager;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroidx/viewpager/widget/ViewPager;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;->P0:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager$a;

    .line 6
    .line 7
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    if-ne v0, v1, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;->P0:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager$a;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;->P0:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager$a;

    .line 17
    .line 18
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager$a;->a(Landroid/view/MotionEvent;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0

    .line 27
    :cond_1
    :goto_0
    invoke-super {p0, p1}, Lv/VPager;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0
.end method

.method public setEdgeTouch(Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;->P0:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager$a;

    .line 2
    .line 3
    return-void
.end method
