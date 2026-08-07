.class public Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/GestureDetector$OnGestureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;->d()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    sub-float/2addr p2, p1

    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;->a(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;)Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout$b;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    const/4 p4, 0x0

    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;->b()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    int-to-float v0, v0

    .line 32
    cmpl-float p1, p1, v0

    .line 33
    .line 34
    if-lez p1, :cond_1

    .line 35
    .line 36
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;->c()I

    .line 41
    .line 42
    .line 43
    move-result p3

    .line 44
    int-to-float p3, p3

    .line 45
    cmpl-float p1, p1, p3

    .line 46
    .line 47
    if-lez p1, :cond_1

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;

    .line 50
    .line 51
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;->a(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;)Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout$b;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const/4 p1, 0x0

    .line 56
    cmpg-float p1, p2, p1

    .line 57
    .line 58
    if-gez p1, :cond_0

    .line 59
    .line 60
    const/4 p1, 0x1

    .line 61
    goto :goto_0

    .line 62
    :cond_0
    move p1, p4

    .line 63
    :goto_0
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout$b;->c(Z)V

    .line 64
    .line 65
    .line 66
    :cond_1
    return p4
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 0

    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public onShowPress(Landroid/view/MotionEvent;)V
    .locals 0

    return-void
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;->a(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;)Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout$b;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;->a(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout;)Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout$b;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout$b;->a()V

    .line 20
    .line 21
    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method
