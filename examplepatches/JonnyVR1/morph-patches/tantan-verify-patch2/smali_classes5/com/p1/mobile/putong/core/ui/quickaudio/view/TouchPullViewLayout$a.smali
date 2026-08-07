.class public Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/GestureDetector$OnGestureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout$a;->a:Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;

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

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    sub-float/2addr p2, p1

    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout$a;->a:Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;->h0(Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;)Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout$b;

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
    if-eqz p1, :cond_0

    .line 21
    .line 22
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;->i0()I

    .line 27
    .line 28
    .line 29
    move-result p4

    .line 30
    int-to-float p4, p4

    .line 31
    cmpl-float p1, p1, p4

    .line 32
    .line 33
    if-lez p1, :cond_0

    .line 34
    .line 35
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;->j0()I

    .line 40
    .line 41
    .line 42
    move-result p3

    .line 43
    int-to-float p3, p3

    .line 44
    cmpl-float p1, p1, p3

    .line 45
    .line 46
    if-lez p1, :cond_0

    .line 47
    .line 48
    const/4 p1, 0x0

    .line 49
    cmpg-float p1, p2, p1

    .line 50
    .line 51
    if-gez p1, :cond_0

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout$a;->a:Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;

    .line 54
    .line 55
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;->h0(Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;)Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout$b;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout$b;->a()V

    .line 60
    .line 61
    .line 62
    :cond_0
    const/4 p0, 0x0

    .line 63
    return p0
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 0

    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout$a;->a:Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;->h0(Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;)Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout$a;->a:Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;->h0(Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout;)Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout$b;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/quickaudio/view/TouchPullViewLayout$b;->onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)V

    .line 20
    .line 21
    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
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
