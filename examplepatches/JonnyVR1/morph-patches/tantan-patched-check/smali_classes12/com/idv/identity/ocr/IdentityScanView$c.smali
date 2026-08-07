.class Lcom/idv/identity/ocr/IdentityScanView$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/ocr/IdentityScanView;->c(ILandroid/animation/Animator$AnimatorListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:F

.field final synthetic b:F

.field final synthetic c:Lcom/idv/identity/ocr/IdentityScanView;


# direct methods
.method public constructor <init>(Lcom/idv/identity/ocr/IdentityScanView;FF)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/IdentityScanView$c;->c:Lcom/idv/identity/ocr/IdentityScanView;

    .line 2
    .line 3
    iput p2, p0, Lcom/idv/identity/ocr/IdentityScanView$c;->a:F

    .line 4
    .line 5
    iput p3, p0, Lcom/idv/identity/ocr/IdentityScanView$c;->b:F

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Lcom/idv/identity/ocr/IdentityScanView$c;->c:Lcom/idv/identity/ocr/IdentityScanView;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/idv/identity/ocr/IdentityScanView;->a(Lcom/idv/identity/ocr/IdentityScanView;)Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget v1, p0, Lcom/idv/identity/ocr/IdentityScanView$c;->a:F

    .line 18
    .line 19
    add-float/2addr v1, p1

    .line 20
    float-to-int v1, v1

    .line 21
    invoke-virtual {v0, v1}, Lcom/idv/identity/ocr/widget/RectMaskView;->setRectTop(I)V

    .line 22
    .line 23
    .line 24
    iget v0, p0, Lcom/idv/identity/ocr/IdentityScanView$c;->b:F

    .line 25
    .line 26
    const/high16 v1, 0x40000000    # 2.0f

    .line 27
    .line 28
    mul-float/2addr p1, v1

    .line 29
    sub-float/2addr v0, p1

    .line 30
    float-to-int p1, v0

    .line 31
    if-gez p1, :cond_0

    .line 32
    .line 33
    const/4 p1, 0x0

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/idv/identity/ocr/IdentityScanView$c;->c:Lcom/idv/identity/ocr/IdentityScanView;

    .line 35
    .line 36
    invoke-static {v0}, Lcom/idv/identity/ocr/IdentityScanView;->a(Lcom/idv/identity/ocr/IdentityScanView;)Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0, p1}, Lcom/idv/identity/ocr/widget/RectMaskView;->setRectHeight(I)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/idv/identity/ocr/IdentityScanView$c;->c:Lcom/idv/identity/ocr/IdentityScanView;

    .line 44
    .line 45
    invoke-static {p0}, Lcom/idv/identity/ocr/IdentityScanView;->a(Lcom/idv/identity/ocr/IdentityScanView;)Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Lcom/idv/identity/ocr/widget/RectMaskView;->invalidate()V

    .line 50
    .line 51
    .line 52
    return-void
.end method
