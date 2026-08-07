.class public final synthetic Ll/na0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/cb0;

.field public final synthetic b:Landroid/animation/ValueAnimator;

.field public final synthetic c:Landroid/graphics/drawable/GradientDrawable;


# direct methods
.method public synthetic constructor <init>(Ll/cb0;Landroid/animation/ValueAnimator;Landroid/graphics/drawable/GradientDrawable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/na0;->a:Ll/cb0;

    iput-object p2, p0, Ll/na0;->b:Landroid/animation/ValueAnimator;

    iput-object p3, p0, Ll/na0;->c:Landroid/graphics/drawable/GradientDrawable;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/na0;->a:Ll/cb0;

    iget-object v1, p0, Ll/na0;->b:Landroid/animation/ValueAnimator;

    iget-object p0, p0, Ll/na0;->c:Landroid/graphics/drawable/GradientDrawable;

    invoke-static {v0, v1, p0, p1}, Ll/cb0;->l(Ll/cb0;Landroid/animation/ValueAnimator;Landroid/graphics/drawable/GradientDrawable;Landroid/animation/ValueAnimator;)V

    return-void
.end method
