.class public Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->l()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:F

.field public b:F

.field public c:F

.field public d:F

.field public final synthetic e:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView$a;->e:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

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
    .locals 1

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
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView$a;->a:F

    .line 12
    .line 13
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView$a;->b:F

    .line 18
    .line 19
    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    const/4 v0, 0x1

    .line 24
    if-ne p1, v0, :cond_2

    .line 25
    .line 26
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView$a;->c:F

    .line 31
    .line 32
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView$a;->d:F

    .line 37
    .line 38
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView$a;->b:F

    .line 39
    .line 40
    sub-float/2addr p1, p2

    .line 41
    const/high16 p2, 0x42a00000    # 80.0f

    .line 42
    .line 43
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    int-to-float p2, p2

    .line 48
    cmpl-float p1, p1, p2

    .line 49
    .line 50
    if-lez p1, :cond_1

    .line 51
    .line 52
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView$a;->a:F

    .line 53
    .line 54
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView$a;->c:F

    .line 55
    .line 56
    sub-float/2addr p1, p2

    .line 57
    const/high16 p2, 0x41a00000    # 20.0f

    .line 58
    .line 59
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    int-to-float p2, p2

    .line 64
    cmpg-float p1, p1, p2

    .line 65
    .line 66
    if-gez p1, :cond_1

    .line 67
    .line 68
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView$a;->e:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 69
    .line 70
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->e(Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;)Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView$b;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    if-eqz p1, :cond_2

    .line 75
    .line 76
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView$a;->e:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 77
    .line 78
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->e(Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;)Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView$b;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView$b;->a()V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView$a;->e:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 87
    .line 88
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->b(Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;)Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    if-eqz p1, :cond_2

    .line 93
    .line 94
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView$a;->e:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 95
    .line 96
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->b(Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;)Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-nez p1, :cond_2

    .line 105
    .line 106
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView$a;->e:Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;

    .line 107
    .line 108
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;->b(Lcom/p1/mobile/putong/core/ui/messages/media/widget/ShootingResultView;)Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/PlayerView;->z()V

    .line 113
    .line 114
    .line 115
    :cond_2
    :goto_0
    return v0
.end method
