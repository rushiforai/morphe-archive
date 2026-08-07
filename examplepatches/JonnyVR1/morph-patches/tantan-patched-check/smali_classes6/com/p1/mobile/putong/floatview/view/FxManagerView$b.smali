.class public final Lcom/p1/mobile/putong/floatview/view/FxManagerView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/floatview/view/FxManagerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "b"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0007\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\t\n\u0002\u0010\t\n\u0002\u0008\u0004\u0008\u0082\u0004\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001d\u0010\u0008\u001a\u00020\u00072\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u000f\u0010\n\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\r\u0010\u000c\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\u000c\u0010\u000bR\u0016\u0010\u000e\u001a\u00020\u00048\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0008\u0010\rR\u0016\u0010\u0010\u001a\u00020\u00048\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u000f\u0010\rR\u0016\u0010\u0014\u001a\u00020\u00118\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0012\u0010\u0013\u00a8\u0006\u0015"
    }
    d2 = {
        "Lcom/p1/mobile/putong/floatview/view/FxManagerView$b;",
        "Ljava/lang/Runnable;",
        "<init>",
        "(Lcom/p1/mobile/putong/floatview/view/FxManagerView;)V",
        "",
        "x",
        "y",
        "",
        "a",
        "(FF)V",
        "run",
        "()V",
        "stop",
        "F",
        "destinationX",
        "b",
        "destinationY",
        "",
        "c",
        "J",
        "startingTime",
        "putong-common_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public a:F

.field public b:F

.field public c:J

.field public final synthetic d:Lcom/p1/mobile/putong/floatview/view/FxManagerView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/floatview/view/FxManagerView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView$b;->d:Lcom/p1/mobile/putong/floatview/view/FxManagerView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(FF)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView$b;->a:F

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView$b;->b:F

    .line 4
    .line 5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide p1

    .line 9
    iput-wide p1, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView$b;->c:J

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->c()Landroid/os/Handler;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public run()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView$b;->d:Lcom/p1/mobile/putong/floatview/view/FxManagerView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->getChildFxView()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView$b;->d:Lcom/p1/mobile/putong/floatview/view/FxManagerView;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->getChildFxView()Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 v0, 0x0

    .line 23
    :goto_0
    if-nez v0, :cond_1

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 27
    .line 28
    .line 29
    move-result-wide v0

    .line 30
    iget-wide v2, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView$b;->c:J

    .line 31
    .line 32
    sub-long/2addr v0, v2

    .line 33
    long-to-float v0, v0

    .line 34
    const/high16 v1, 0x43c80000    # 400.0f

    .line 35
    .line 36
    div-float/2addr v0, v1

    .line 37
    const/high16 v1, 0x3f800000    # 1.0f

    .line 38
    .line 39
    invoke-static {v1, v0}, Lkotlin/ranges/a;->d(FF)F

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iget-object v2, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView$b;->d:Lcom/p1/mobile/putong/floatview/view/FxManagerView;

    .line 44
    .line 45
    invoke-virtual {v2}, Landroid/view/View;->getX()F

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    iget v4, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView$b;->a:F

    .line 50
    .line 51
    iget-object v5, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView$b;->d:Lcom/p1/mobile/putong/floatview/view/FxManagerView;

    .line 52
    .line 53
    invoke-virtual {v5}, Landroid/view/View;->getX()F

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    sub-float/2addr v4, v5

    .line 58
    mul-float/2addr v4, v0

    .line 59
    add-float/2addr v3, v4

    .line 60
    invoke-virtual {v2, v3}, Landroid/view/View;->setX(F)V

    .line 61
    .line 62
    .line 63
    iget-object v2, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView$b;->d:Lcom/p1/mobile/putong/floatview/view/FxManagerView;

    .line 64
    .line 65
    invoke-virtual {v2}, Landroid/view/View;->getY()F

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    iget v4, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView$b;->b:F

    .line 70
    .line 71
    iget-object v5, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView$b;->d:Lcom/p1/mobile/putong/floatview/view/FxManagerView;

    .line 72
    .line 73
    invoke-virtual {v5}, Landroid/view/View;->getY()F

    .line 74
    .line 75
    .line 76
    move-result v5

    .line 77
    sub-float/2addr v4, v5

    .line 78
    mul-float/2addr v4, v0

    .line 79
    add-float/2addr v3, v4

    .line 80
    invoke-virtual {v2, v3}, Landroid/view/View;->setY(F)V

    .line 81
    .line 82
    .line 83
    iget-object v2, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView$b;->d:Lcom/p1/mobile/putong/floatview/view/FxManagerView;

    .line 84
    .line 85
    invoke-virtual {v2}, Landroid/view/View;->getX()F

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->d(Lcom/p1/mobile/putong/floatview/view/FxManagerView;F)V

    .line 90
    .line 91
    .line 92
    iget-object v2, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView$b;->d:Lcom/p1/mobile/putong/floatview/view/FxManagerView;

    .line 93
    .line 94
    invoke-virtual {v2}, Landroid/view/View;->getY()F

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->e(Lcom/p1/mobile/putong/floatview/view/FxManagerView;F)V

    .line 99
    .line 100
    .line 101
    cmpg-float v0, v0, v1

    .line 102
    .line 103
    if-gez v0, :cond_2

    .line 104
    .line 105
    invoke-static {}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->c()Landroid/os/Handler;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView$b;->d:Lcom/p1/mobile/putong/floatview/view/FxManagerView;

    .line 114
    .line 115
    const/4 v0, 0x0

    .line 116
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->f(Lcom/p1/mobile/putong/floatview/view/FxManagerView;Z)V

    .line 117
    .line 118
    .line 119
    :cond_3
    :goto_1
    return-void
.end method

.method public final stop()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/floatview/view/FxManagerView$b;->d:Lcom/p1/mobile/putong/floatview/view/FxManagerView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->f(Lcom/p1/mobile/putong/floatview/view/FxManagerView;Z)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/floatview/view/FxManagerView;->c()Landroid/os/Handler;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
