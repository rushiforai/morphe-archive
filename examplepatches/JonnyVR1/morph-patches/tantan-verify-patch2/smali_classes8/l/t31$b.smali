.class public Ll/t31$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/t31;->e(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/facebook/drawee/view/DraweeView;

.field public final synthetic b:Ll/t31;


# direct methods
.method public constructor <init>(Ll/t31;Lcom/facebook/drawee/view/DraweeView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/t31$b;->b:Ll/t31;

    .line 2
    .line 3
    iput-object p2, p0, Ll/t31$b;->a:Lcom/facebook/drawee/view/DraweeView;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/t31$b;->b:Ll/t31;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p1, Ll/t31;->x:Z

    .line 5
    .line 6
    invoke-static {p1}, Ll/t31;->k(Ll/t31;)Ll/am50;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/4 v0, 0x0

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Ll/t31$b;->b:Ll/t31;

    .line 14
    .line 15
    invoke-static {p1}, Ll/t31;->k(Ll/t31;)Ll/am50;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-interface {p1, v0, v0}, Ll/am50;->c(FF)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p1, p0, Ll/t31$b;->a:Lcom/facebook/drawee/view/DraweeView;

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/t31$b;->a:Lcom/facebook/drawee/view/DraweeView;

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/t31$b;->a:Lcom/facebook/drawee/view/DraweeView;

    .line 33
    .line 34
    const/high16 v0, 0x3f800000    # 1.0f

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleX(F)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/t31$b;->a:Lcom/facebook/drawee/view/DraweeView;

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleY(F)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method
