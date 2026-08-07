.class public final synthetic Ll/olf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/rlf;

.field public final synthetic b:Landroid/animation/ValueAnimator;

.field public final synthetic c:I

.field public final synthetic d:Landroid/graphics/drawable/GradientDrawable;


# direct methods
.method public synthetic constructor <init>(Ll/rlf;Landroid/animation/ValueAnimator;ILandroid/graphics/drawable/GradientDrawable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/olf;->a:Ll/rlf;

    iput-object p2, p0, Ll/olf;->b:Landroid/animation/ValueAnimator;

    iput p3, p0, Ll/olf;->c:I

    iput-object p4, p0, Ll/olf;->d:Landroid/graphics/drawable/GradientDrawable;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/olf;->a:Ll/rlf;

    iget-object v1, p0, Ll/olf;->b:Landroid/animation/ValueAnimator;

    iget v2, p0, Ll/olf;->c:I

    iget-object p0, p0, Ll/olf;->d:Landroid/graphics/drawable/GradientDrawable;

    invoke-static {v0, v1, v2, p0, p1}, Ll/rlf;->c(Ll/rlf;Landroid/animation/ValueAnimator;ILandroid/graphics/drawable/GradientDrawable;Landroid/animation/ValueAnimator;)V

    return-void
.end method
