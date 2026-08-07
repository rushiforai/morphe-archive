.class public Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public a:Landroid/view/ScaleGestureDetector;

.field public b:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;

.field public final synthetic c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$b;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Landroid/view/ScaleGestureDetector;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    new-instance v2, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$c;

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    invoke-direct {v2, p1, v3}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$c;-><init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;Ll/vvb;)V

    .line 16
    .line 17
    .line 18
    invoke-direct {v0, v1, v2}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$b;->a:Landroid/view/ScaleGestureDetector;

    .line 22
    .line 23
    new-instance v0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;

    .line 24
    .line 25
    invoke-direct {v0, p1, v3}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;-><init>(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;Ll/vvb;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$b;->b:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;

    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public a(Landroid/view/MotionEvent;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$b;->b:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;->b(Landroid/view/MotionEvent;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Landroid/view/MotionEvent;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    if-eq v0, v1, :cond_1

    .line 9
    .line 10
    const/4 v2, 0x3

    .line 11
    if-eq v0, v2, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$b;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->g(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)Ll/wvb;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/wvb;->m()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$b;->a:Landroid/view/ScaleGestureDetector;

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$b;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 31
    .line 32
    invoke-static {v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->g(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)Ll/wvb;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Ll/wvb;->n()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$b;->b:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$b;->a:Landroid/view/ScaleGestureDetector;

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/view/ScaleGestureDetector;->isInProgress()Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    xor-int/2addr p0, v1

    .line 51
    invoke-virtual {v0, p1, p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$d;->d(Landroid/view/MotionEvent;Z)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView$b;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;

    .line 56
    .line 57
    invoke-static {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;->l(Lcom/p1/mobile/android/ui/cropiwa/CropIwaImageView;)V

    .line 58
    .line 59
    .line 60
    :cond_2
    return-void
.end method
