.class public final synthetic Ll/ka0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/cb0;

.field public final synthetic b:Landroid/animation/ValueAnimator;

.field public final synthetic c:Landroid/graphics/drawable/GradientDrawable;

.field public final synthetic d:Landroid/graphics/drawable/GradientDrawable;

.field public final synthetic e:Landroid/graphics/drawable/GradientDrawable;


# direct methods
.method public synthetic constructor <init>(Ll/cb0;Landroid/animation/ValueAnimator;Landroid/graphics/drawable/GradientDrawable;Landroid/graphics/drawable/GradientDrawable;Landroid/graphics/drawable/GradientDrawable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ka0;->a:Ll/cb0;

    iput-object p2, p0, Ll/ka0;->b:Landroid/animation/ValueAnimator;

    iput-object p3, p0, Ll/ka0;->c:Landroid/graphics/drawable/GradientDrawable;

    iput-object p4, p0, Ll/ka0;->d:Landroid/graphics/drawable/GradientDrawable;

    iput-object p5, p0, Ll/ka0;->e:Landroid/graphics/drawable/GradientDrawable;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ka0;->a:Ll/cb0;

    iget-object v1, p0, Ll/ka0;->b:Landroid/animation/ValueAnimator;

    iget-object v2, p0, Ll/ka0;->c:Landroid/graphics/drawable/GradientDrawable;

    iget-object v3, p0, Ll/ka0;->d:Landroid/graphics/drawable/GradientDrawable;

    iget-object v4, p0, Ll/ka0;->e:Landroid/graphics/drawable/GradientDrawable;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Ll/cb0;->m(Ll/cb0;Landroid/animation/ValueAnimator;Landroid/graphics/drawable/GradientDrawable;Landroid/graphics/drawable/GradientDrawable;Landroid/graphics/drawable/GradientDrawable;Landroid/animation/ValueAnimator;)V

    return-void
.end method
