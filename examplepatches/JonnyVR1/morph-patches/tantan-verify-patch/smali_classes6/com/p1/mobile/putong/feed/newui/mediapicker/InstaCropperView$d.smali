.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ScaleGestureDetector$OnScaleGestureListener;


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
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$d;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onScale(Landroid/view/ScaleGestureDetector;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$d;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->r(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$d;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getScaleFactor()F

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-static {v1, v2, v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->o(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;FF)F

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$d;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusX()F

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->m(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;F)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$d;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/view/ScaleGestureDetector;->getFocusY()F

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    invoke-static {v1, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->n(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;F)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$d;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 36
    .line 37
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->d(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)F

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    mul-float/2addr v1, v0

    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$d;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 43
    .line 44
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->f(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)F

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView$d;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;

    .line 49
    .line 50
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->g(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;)F

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    invoke-static {p1, v1, v0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;->v(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaCropperView;FFF)V

    .line 55
    .line 56
    .line 57
    const/4 p0, 0x1

    .line 58
    return p0
.end method

.method public onScaleBegin(Landroid/view/ScaleGestureDetector;)Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public onScaleEnd(Landroid/view/ScaleGestureDetector;)V
    .locals 0

    return-void
.end method
