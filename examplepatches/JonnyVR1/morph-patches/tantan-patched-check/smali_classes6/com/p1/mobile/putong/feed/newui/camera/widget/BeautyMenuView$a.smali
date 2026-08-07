.class public Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->j()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->b(Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 p3, 0x1

    .line 8
    const/high16 v0, 0x42c80000    # 100.0f

    .line 9
    .line 10
    if-eq p1, p3, :cond_2

    .line 11
    .line 12
    const/4 p3, 0x2

    .line 13
    if-eq p1, p3, :cond_1

    .line 14
    .line 15
    const/4 p3, 0x3

    .line 16
    if-eq p1, p3, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;

    .line 20
    .line 21
    int-to-float p3, p2

    .line 22
    div-float/2addr p3, v0

    .line 23
    invoke-static {p1, p3}, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->e(Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;F)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;

    .line 28
    .line 29
    int-to-float p3, p2

    .line 30
    div-float/2addr p3, v0

    .line 31
    invoke-static {p1, p3}, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->d(Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;F)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;

    .line 36
    .line 37
    int-to-float p3, p2

    .line 38
    div-float/2addr p3, v0

    .line 39
    iput p3, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->k:F

    .line 40
    .line 41
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;

    .line 42
    .line 43
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->c(Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;)Ll/vmi;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_3

    .line 52
    .line 53
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;

    .line 54
    .line 55
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->c(Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;)Ll/vmi;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    int-to-float p2, p2

    .line 60
    div-float/2addr p2, v0

    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView$a;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;

    .line 62
    .line 63
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;->b(Lcom/p1/mobile/putong/feed/newui/camera/widget/BeautyMenuView;)I

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    invoke-interface {p1, p2, p0}, Ll/vmi;->n(FI)V

    .line 68
    .line 69
    .line 70
    :cond_3
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method
