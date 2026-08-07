.class Lcom/tencent/rtmp/ui/TXCloudVideoView$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/rtmp/ui/TXCloudVideoView;->setLogMarginRatio(FFFF)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:F

.field final synthetic b:F

.field final synthetic c:F

.field final synthetic d:F

.field final synthetic e:Lcom/tencent/rtmp/ui/TXCloudVideoView;


# direct methods
.method public constructor <init>(Lcom/tencent/rtmp/ui/TXCloudVideoView;FFFF)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$1;->e:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$1;->a:F

    .line 4
    .line 5
    iput p3, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$1;->b:F

    .line 6
    .line 7
    iput p4, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$1;->c:F

    .line 8
    .line 9
    iput p5, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$1;->d:F

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$1;->e:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    int-to-float v1, v1

    .line 8
    iget v2, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$1;->a:F

    .line 9
    .line 10
    mul-float/2addr v1, v2

    .line 11
    invoke-static {v0, v1}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->access$002(Lcom/tencent/rtmp/ui/TXCloudVideoView;F)F

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$1;->e:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    int-to-float v1, v1

    .line 21
    iget v2, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$1;->b:F

    .line 22
    .line 23
    mul-float/2addr v1, v2

    .line 24
    invoke-static {v0, v1}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->access$102(Lcom/tencent/rtmp/ui/TXCloudVideoView;F)F

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$1;->e:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    int-to-float v1, v1

    .line 34
    iget v2, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$1;->c:F

    .line 35
    .line 36
    mul-float/2addr v1, v2

    .line 37
    invoke-static {v0, v1}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->access$202(Lcom/tencent/rtmp/ui/TXCloudVideoView;F)F

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$1;->e:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    int-to-float v1, v1

    .line 47
    iget v2, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$1;->d:F

    .line 48
    .line 49
    mul-float/2addr v1, v2

    .line 50
    invoke-static {v0, v1}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->access$302(Lcom/tencent/rtmp/ui/TXCloudVideoView;F)F

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$1;->e:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 54
    .line 55
    iget-object v1, v0, Lcom/tencent/rtmp/ui/TXCloudVideoView;->mDashBoard:Lcom/tencent/rtmp/ui/TXDashBoard;

    .line 56
    .line 57
    if-eqz v1, :cond_0

    .line 58
    .line 59
    invoke-static {v0}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->access$000(Lcom/tencent/rtmp/ui/TXCloudVideoView;)F

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    float-to-int v0, v0

    .line 64
    iget-object v2, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$1;->e:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 65
    .line 66
    invoke-static {v2}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->access$200(Lcom/tencent/rtmp/ui/TXCloudVideoView;)F

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    float-to-int v2, v2

    .line 71
    iget-object v3, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$1;->e:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 72
    .line 73
    invoke-static {v3}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->access$100(Lcom/tencent/rtmp/ui/TXCloudVideoView;)F

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    float-to-int v3, v3

    .line 78
    iget-object p0, p0, Lcom/tencent/rtmp/ui/TXCloudVideoView$1;->e:Lcom/tencent/rtmp/ui/TXCloudVideoView;

    .line 79
    .line 80
    invoke-static {p0}, Lcom/tencent/rtmp/ui/TXCloudVideoView;->access$300(Lcom/tencent/rtmp/ui/TXCloudVideoView;)F

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    float-to-int p0, p0

    .line 85
    invoke-virtual {v1, v0, v2, v3, p0}, Lcom/tencent/rtmp/ui/TXDashBoard;->a(IIII)V

    .line 86
    .line 87
    .line 88
    :cond_0
    return-void
.end method
