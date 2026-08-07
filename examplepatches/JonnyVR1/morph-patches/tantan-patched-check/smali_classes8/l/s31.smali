.class public final synthetic Ll/s31;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/t31;

.field public final synthetic b:F

.field public final synthetic c:F

.field public final synthetic d:Lcom/facebook/drawee/view/DraweeView;

.field public final synthetic e:F

.field public final synthetic f:Landroid/animation/ValueAnimator;


# direct methods
.method public synthetic constructor <init>(Ll/t31;FFLcom/facebook/drawee/view/DraweeView;FLandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s31;->a:Ll/t31;

    iput p2, p0, Ll/s31;->b:F

    iput p3, p0, Ll/s31;->c:F

    iput-object p4, p0, Ll/s31;->d:Lcom/facebook/drawee/view/DraweeView;

    iput p5, p0, Ll/s31;->e:F

    iput-object p6, p0, Ll/s31;->f:Landroid/animation/ValueAnimator;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/s31;->a:Ll/t31;

    iget v1, p0, Ll/s31;->b:F

    iget v2, p0, Ll/s31;->c:F

    iget-object v3, p0, Ll/s31;->d:Lcom/facebook/drawee/view/DraweeView;

    iget v4, p0, Ll/s31;->e:F

    iget-object v5, p0, Ll/s31;->f:Landroid/animation/ValueAnimator;

    move-object v6, p1

    invoke-static/range {v0 .. v6}, Ll/t31;->g(Ll/t31;FFLcom/facebook/drawee/view/DraweeView;FLandroid/animation/ValueAnimator;Landroid/animation/ValueAnimator;)V

    return-void
.end method
