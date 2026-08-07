.class public Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView$a;->a:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView$a;->a:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;->i0(Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;)Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView$b;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView$a;->a:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;

    .line 20
    .line 21
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;->i0(Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView;)Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView$b;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideRightView$b;->a()V

    .line 26
    .line 27
    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0
.end method
