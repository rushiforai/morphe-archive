.class public final synthetic Ll/ja0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Landroid/animation/ValueAnimator;

.field public final synthetic b:Landroid/graphics/drawable/GradientDrawable;

.field public final synthetic c:Landroid/graphics/drawable/GradientDrawable;

.field public final synthetic d:Landroid/graphics/drawable/GradientDrawable;


# direct methods
.method public synthetic constructor <init>(Landroid/animation/ValueAnimator;Landroid/graphics/drawable/GradientDrawable;Landroid/graphics/drawable/GradientDrawable;Landroid/graphics/drawable/GradientDrawable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ja0;->a:Landroid/animation/ValueAnimator;

    iput-object p2, p0, Ll/ja0;->b:Landroid/graphics/drawable/GradientDrawable;

    iput-object p3, p0, Ll/ja0;->c:Landroid/graphics/drawable/GradientDrawable;

    iput-object p4, p0, Ll/ja0;->d:Landroid/graphics/drawable/GradientDrawable;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ja0;->a:Landroid/animation/ValueAnimator;

    iget-object v1, p0, Ll/ja0;->b:Landroid/graphics/drawable/GradientDrawable;

    iget-object v2, p0, Ll/ja0;->c:Landroid/graphics/drawable/GradientDrawable;

    iget-object p0, p0, Ll/ja0;->d:Landroid/graphics/drawable/GradientDrawable;

    invoke-static {v0, v1, v2, p0, p1}, Ll/cb0;->v(Landroid/animation/ValueAnimator;Landroid/graphics/drawable/GradientDrawable;Landroid/graphics/drawable/GradientDrawable;Landroid/graphics/drawable/GradientDrawable;Landroid/animation/ValueAnimator;)V

    return-void
.end method
