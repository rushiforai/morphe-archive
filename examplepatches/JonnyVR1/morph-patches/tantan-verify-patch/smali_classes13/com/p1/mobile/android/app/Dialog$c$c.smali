.class public Lcom/p1/mobile/android/app/Dialog$c$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/android/app/Dialog$c;->onShow(Landroid/content/DialogInterface;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Dialog$c;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Dialog$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/app/Dialog$c$c;->a:Lcom/p1/mobile/android/app/Dialog$c;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Dialog$c$c;->a:Lcom/p1/mobile/android/app/Dialog$c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/android/app/Dialog$c;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 4
    .line 5
    iget-object v1, v0, Lcom/p1/mobile/android/app/Dialog;->j:Lv/VLinear_Foreground;

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const/high16 v3, 0x3f800000    # 1.0f

    .line 12
    .line 13
    sub-float v2, v3, v2

    .line 14
    .line 15
    iget-object v4, p0, Lcom/p1/mobile/android/app/Dialog$c$c;->a:Lcom/p1/mobile/android/app/Dialog$c;

    .line 16
    .line 17
    iget v4, v4, Lcom/p1/mobile/android/app/Dialog$c;->a:I

    .line 18
    .line 19
    int-to-float v4, v4

    .line 20
    mul-float/2addr v2, v4

    .line 21
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog;->i0(Landroid/view/ViewGroup;F)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/android/app/Dialog$c$c;->a:Lcom/p1/mobile/android/app/Dialog$c;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/android/app/Dialog$c;->b:Landroid/graphics/drawable/Drawable;

    .line 27
    .line 28
    const v0, 0x3fa66666    # 1.3f

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    mul-float/2addr p1, v0

    .line 36
    sub-float/2addr v3, p1

    .line 37
    const/high16 p1, 0x437f0000    # 255.0f

    .line 38
    .line 39
    mul-float/2addr v3, p1

    .line 40
    float-to-int p1, v3

    .line 41
    const/4 v0, 0x0

    .line 42
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 47
    .line 48
    .line 49
    return-void
.end method
