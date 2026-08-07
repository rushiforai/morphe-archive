.class Lcom/idv/identity/face/ui/widget/EllipseHoleView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/idv/identity/face/ui/widget/EllipseHoleView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/idv/identity/face/ui/widget/EllipseHoleView;


# direct methods
.method public constructor <init>(Lcom/idv/identity/face/ui/widget/EllipseHoleView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView$a;->a:Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView$a;->a:Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->d(Lcom/idv/identity/face/ui/widget/EllipseHoleView;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView$a;->a:Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {v1}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->g(Lcom/idv/identity/face/ui/widget/EllipseHoleView;)Landroid/os/Handler;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView$a;->a:Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 16
    .line 17
    invoke-static {v1}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->f(Lcom/idv/identity/face/ui/widget/EllipseHoleView;)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    iget-object v2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView$a;->a:Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 22
    .line 23
    invoke-virtual {v2}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->getMax()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    div-int/2addr v1, v2

    .line 28
    int-to-long v1, v1

    .line 29
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    invoke-virtual {v1}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->getProgress()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/lit8 v0, v0, 0x1

    .line 38
    .line 39
    iget-object v1, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView$a;->a:Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 40
    .line 41
    invoke-static {v1}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->h(Lcom/idv/identity/face/ui/widget/EllipseHoleView;)Ll/pte;

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView$a;->a:Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->getMax()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-lt v0, v1, :cond_1

    .line 51
    .line 52
    iget-object v0, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView$a;->a:Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 53
    .line 54
    invoke-virtual {v0}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->getMax()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    :cond_1
    iget-object v1, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView$a;->a:Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 59
    .line 60
    invoke-virtual {v1, v0}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->setProgress(I)V

    .line 61
    .line 62
    .line 63
    iget-object v1, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView$a;->a:Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 64
    .line 65
    invoke-virtual {v1}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->getMax()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    iget-object v2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView$a;->a:Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 70
    .line 71
    if-lt v0, v1, :cond_2

    .line 72
    .line 73
    invoke-static {v2}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->h(Lcom/idv/identity/face/ui/widget/EllipseHoleView;)Ll/pte;

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_2
    invoke-static {v2}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->g(Lcom/idv/identity/face/ui/widget/EllipseHoleView;)Landroid/os/Handler;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iget-object v1, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView$a;->a:Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 82
    .line 83
    invoke-static {v1}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->f(Lcom/idv/identity/face/ui/widget/EllipseHoleView;)I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    iget-object v2, p0, Lcom/idv/identity/face/ui/widget/EllipseHoleView$a;->a:Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 88
    .line 89
    invoke-virtual {v2}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->getMax()I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    div-int/2addr v1, v2

    .line 94
    int-to-long v1, v1

    .line 95
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 96
    .line 97
    .line 98
    return-void
.end method
