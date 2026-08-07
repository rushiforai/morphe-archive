.class Lcom/idv/identity/ocr/IdentityScanView$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


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

.field final synthetic c:Landroid/animation/Animator$AnimatorListener;

.field final synthetic d:Lcom/idv/identity/ocr/IdentityScanView;


# direct methods
.method public constructor <init>(Lcom/idv/identity/ocr/IdentityScanView;FFLandroid/animation/Animator$AnimatorListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/IdentityScanView$d;->d:Lcom/idv/identity/ocr/IdentityScanView;

    .line 2
    .line 3
    iput p2, p0, Lcom/idv/identity/ocr/IdentityScanView$d;->a:F

    .line 4
    .line 5
    iput p3, p0, Lcom/idv/identity/ocr/IdentityScanView$d;->b:F

    .line 6
    .line 7
    iput-object p4, p0, Lcom/idv/identity/ocr/IdentityScanView$d;->c:Landroid/animation/Animator$AnimatorListener;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/IdentityScanView$d;->c:Landroid/animation/Animator$AnimatorListener;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Landroid/animation/Animator$AnimatorListener;->onAnimationCancel(Landroid/animation/Animator;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    const-string v0, "\u7728\u773c\u52a8\u753b\u7ed3\u675f..."

    .line 2
    .line 3
    invoke-static {v0}, Ll/o6r0;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/idv/identity/ocr/IdentityScanView$d;->d:Lcom/idv/identity/ocr/IdentityScanView;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/idv/identity/ocr/IdentityScanView;->a(Lcom/idv/identity/ocr/IdentityScanView;)Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget v1, p0, Lcom/idv/identity/ocr/IdentityScanView$d;->a:F

    .line 13
    .line 14
    float-to-int v1, v1

    .line 15
    invoke-virtual {v0, v1}, Lcom/idv/identity/ocr/widget/RectMaskView;->setRectTop(I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/idv/identity/ocr/IdentityScanView$d;->d:Lcom/idv/identity/ocr/IdentityScanView;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/idv/identity/ocr/IdentityScanView;->a(Lcom/idv/identity/ocr/IdentityScanView;)Lcom/idv/identity/ocr/widget/RectMaskView;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget v1, p0, Lcom/idv/identity/ocr/IdentityScanView$d;->b:F

    .line 25
    .line 26
    float-to-int v1, v1

    .line 27
    invoke-virtual {v0, v1}, Lcom/idv/identity/ocr/widget/RectMaskView;->setRectHeight(I)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/idv/identity/ocr/IdentityScanView$d;->d:Lcom/idv/identity/ocr/IdentityScanView;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/idv/identity/ocr/IdentityScanView$d;->c:Landroid/animation/Animator$AnimatorListener;

    .line 36
    .line 37
    if-eqz p0, :cond_0

    .line 38
    .line 39
    invoke-interface {p0, p1}, Landroid/animation/Animator$AnimatorListener;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/ocr/IdentityScanView$d;->c:Landroid/animation/Animator$AnimatorListener;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Landroid/animation/Animator$AnimatorListener;->onAnimationRepeat(Landroid/animation/Animator;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    const-string p0, "\u7728\u773c\u52a8\u753b\u5f00\u59cb..."

    .line 2
    .line 3
    invoke-static {p0}, Ll/o6r0;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
