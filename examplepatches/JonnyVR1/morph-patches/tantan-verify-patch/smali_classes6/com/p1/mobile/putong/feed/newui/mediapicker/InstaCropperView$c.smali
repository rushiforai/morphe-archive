.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/GestureDetector$OnGestureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$c;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

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
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 0

    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 1

    .line 1
    neg-float p1, p3

    .line 2
    neg-float p2, p4

    .line 3
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$c;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 4
    .line 5
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->e(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)Landroid/graphics/RectF;

    .line 6
    .line 7
    .line 8
    move-result-object p4

    .line 9
    invoke-static {p3, p4}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->q(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;Landroid/graphics/RectF;)V

    .line 10
    .line 11
    .line 12
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$c;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 13
    .line 14
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->e(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)Landroid/graphics/RectF;

    .line 15
    .line 16
    .line 17
    move-result-object p4

    .line 18
    invoke-static {p3, p4}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->s(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;Landroid/graphics/RectF;)F

    .line 19
    .line 20
    .line 21
    move-result p3

    .line 22
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$c;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 23
    .line 24
    invoke-static {p4}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->e(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)Landroid/graphics/RectF;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {p4, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->t(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;Landroid/graphics/RectF;)F

    .line 29
    .line 30
    .line 31
    move-result p4

    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$c;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 33
    .line 34
    invoke-static {v0, p1, p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->p(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;FF)F

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$c;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 39
    .line 40
    invoke-static {p3, p2, p4}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->p(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;FF)F

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$c;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 45
    .line 46
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->b(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)F

    .line 47
    .line 48
    .line 49
    move-result p4

    .line 50
    add-float/2addr p4, p1

    .line 51
    invoke-static {p3, p4}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->h(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;F)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$c;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 55
    .line 56
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->c(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)F

    .line 57
    .line 58
    .line 59
    move-result p3

    .line 60
    add-float/2addr p3, p2

    .line 61
    invoke-static {p1, p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->i(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;F)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$c;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 65
    .line 66
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->w(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$c;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 72
    .line 73
    .line 74
    const/4 p0, 0x1

    .line 75
    return p0
.end method

.method public onShowPress(Landroid/view/MotionEvent;)V
    .locals 0

    return-void
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method
