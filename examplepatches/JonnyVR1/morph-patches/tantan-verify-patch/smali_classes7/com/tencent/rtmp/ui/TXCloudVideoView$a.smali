.class Lcom/tencent/rtmp/ui/TXCloudVideoView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/rtmp/ui/TXCloudVideoView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

.field private b:Landroid/view/View;

.field private c:Landroid/view/MotionEvent;


# direct methods
.method private constructor <init>(Lcom/tencent/rtmp/ui/TXCloudVideoView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$a;->a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/tencent/rtmp/ui/TXCloudVideoView;Lcom/tencent/rtmp/ui/TXCloudVideoView$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/tencent/rtmp/ui/TXCloudVideoView$a;-><init>(Lcom/tencent/rtmp/ui/TXCloudVideoView;)V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/MotionEvent;)V
    .locals 0

    .line 4
    iput-object p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$a;->c:Landroid/view/MotionEvent;

    return-void
.end method

.method public a(Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$a;->b:Landroid/view/View;

    .line 2
    .line 3
    return-void
.end method

.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$a;->a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->access$400(Lcom/tencent/rtmp/ui/TXCloudVideoView;)Lcom/tencent/liteav/k;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$a;->a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->access$700(Lcom/tencent/rtmp/ui/TXCloudVideoView;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$a;->a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->access$400(Lcom/tencent/rtmp/ui/TXCloudVideoView;)Lcom/tencent/liteav/k;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$a;->c:Landroid/view/MotionEvent;

    .line 24
    .line 25
    invoke-virtual {v1}, Landroid/view/MotionEvent;->getX()F

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    iget-object v2, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$a;->b:Landroid/view/View;

    .line 30
    .line 31
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    int-to-float v2, v2

    .line 36
    div-float/2addr v1, v2

    .line 37
    iget-object v2, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$a;->c:Landroid/view/MotionEvent;

    .line 38
    .line 39
    invoke-virtual {v2}, Landroid/view/MotionEvent;->getY()F

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    iget-object v3, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$a;->b:Landroid/view/View;

    .line 44
    .line 45
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    int-to-float v3, v3

    .line 50
    div-float/2addr v2, v3

    .line 51
    invoke-interface {v0, v1, v2}, Lcom/tencent/liteav/k;->a(FF)V

    .line 52
    .line 53
    .line 54
    :cond_0
    iget-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$a;->a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 55
    .line 56
    invoke-static {v0}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->access$700(Lcom/tencent/rtmp/ui/TXCloudVideoView;)Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_1

    .line 61
    .line 62
    iget-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$a;->a:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 63
    .line 64
    iget-object v1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$a;->c:Landroid/view/MotionEvent;

    .line 65
    .line 66
    invoke-virtual {v1}, Landroid/view/MotionEvent;->getX()F

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    float-to-int v1, v1

    .line 71
    iget-object p0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$a;->c:Landroid/view/MotionEvent;

    .line 72
    .line 73
    invoke-virtual {p0}, Landroid/view/MotionEvent;->getY()F

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    float-to-int p0, p0

    .line 78
    invoke-virtual {v0, v1, p0}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->onTouchFocus(II)V

    .line 79
    .line 80
    .line 81
    :cond_1
    return-void
.end method
