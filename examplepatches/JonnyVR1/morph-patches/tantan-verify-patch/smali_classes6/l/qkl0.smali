.class public final synthetic Ll/qkl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/skl0;

.field public final synthetic b:F

.field public final synthetic c:F

.field public final synthetic d:F

.field public final synthetic e:Landroid/animation/ValueAnimator;

.field public final synthetic f:F


# direct methods
.method public synthetic constructor <init>(Ll/skl0;FFFLandroid/animation/ValueAnimator;F)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qkl0;->a:Ll/skl0;

    iput p2, p0, Ll/qkl0;->b:F

    iput p3, p0, Ll/qkl0;->c:F

    iput p4, p0, Ll/qkl0;->d:F

    iput-object p5, p0, Ll/qkl0;->e:Landroid/animation/ValueAnimator;

    iput p6, p0, Ll/qkl0;->f:F

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/qkl0;->a:Ll/skl0;

    iget v1, p0, Ll/qkl0;->b:F

    iget v2, p0, Ll/qkl0;->c:F

    iget v3, p0, Ll/qkl0;->d:F

    iget-object v4, p0, Ll/qkl0;->e:Landroid/animation/ValueAnimator;

    iget v5, p0, Ll/qkl0;->f:F

    move-object v6, p1

    invoke-static/range {v0 .. v6}, Ll/skl0;->a(Ll/skl0;FFFLandroid/animation/ValueAnimator;FLandroid/animation/ValueAnimator;)V

    return-void
.end method
