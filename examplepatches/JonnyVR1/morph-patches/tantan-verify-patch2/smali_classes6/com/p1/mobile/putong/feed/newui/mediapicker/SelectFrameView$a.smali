.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView$a;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->g()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->d(Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    add-int/lit8 v0, v0, -0x14

    .line 12
    .line 13
    int-to-float v0, v0

    .line 14
    cmpl-float v0, p1, v0

    .line 15
    .line 16
    if-lez v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->d(Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;

    .line 25
    .line 26
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->c(Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;)I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    add-int/2addr v0, p0

    .line 31
    add-int/lit8 v0, v0, 0x14

    .line 32
    .line 33
    int-to-float p0, v0

    .line 34
    cmpg-float p0, p1, p0

    .line 35
    .line 36
    if-gez p0, :cond_0

    .line 37
    .line 38
    const/4 p0, 0x1

    .line 39
    return p0

    .line 40
    :cond_0
    const/4 p0, 0x0

    .line 41
    return p0
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->d(Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;)I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    float-to-int p3, p3

    .line 8
    sub-int/2addr p2, p3

    .line 9
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->e(Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;I)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;

    .line 13
    .line 14
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->d(Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;

    .line 19
    .line 20
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->a(Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;)I

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;

    .line 25
    .line 26
    if-ge p1, p2, :cond_0

    .line 27
    .line 28
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->a(Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;)I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    invoke-static {p3, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->e(Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;I)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->d(Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;)I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;

    .line 41
    .line 42
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->b(Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;)I

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    if-le p1, p2, :cond_1

    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;

    .line 49
    .line 50
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->b(Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;)I

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->e(Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;I)V

    .line 55
    .line 56
    .line 57
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;

    .line 58
    .line 59
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->i:Ll/y20;

    .line 60
    .line 61
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-eqz p1, :cond_2

    .line 66
    .line 67
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;

    .line 68
    .line 69
    iget-object p2, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->i:Ll/y20;

    .line 70
    .line 71
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->d(Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;)I

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;

    .line 76
    .line 77
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;->a(Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;)I

    .line 78
    .line 79
    .line 80
    move-result p3

    .line 81
    sub-int/2addr p1, p3

    .line 82
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-interface {p2, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView$a;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/SelectFrameView;

    .line 90
    .line 91
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 92
    .line 93
    .line 94
    const/4 p0, 0x1

    .line 95
    return p0
.end method
