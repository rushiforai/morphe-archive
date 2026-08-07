.class public final synthetic Ll/ux10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/xx10;

.field public final synthetic b:F


# direct methods
.method public synthetic constructor <init>(Ll/xx10;F)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ux10;->a:Ll/xx10;

    iput p2, p0, Ll/ux10;->b:F

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ux10;->a:Ll/xx10;

    iget p0, p0, Ll/ux10;->b:F

    invoke-static {v0, p0, p1}, Ll/xx10;->g(Ll/xx10;FLandroid/animation/ValueAnimator;)V

    return-void
.end method
