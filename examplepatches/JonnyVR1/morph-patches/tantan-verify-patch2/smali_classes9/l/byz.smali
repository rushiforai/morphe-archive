.class public final synthetic Ll/byz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/qzz;

.field public final synthetic b:F

.field public final synthetic c:F


# direct methods
.method public synthetic constructor <init>(Ll/qzz;FF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/byz;->a:Ll/qzz;

    iput p2, p0, Ll/byz;->b:F

    iput p3, p0, Ll/byz;->c:F

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/byz;->a:Ll/qzz;

    iget v1, p0, Ll/byz;->b:F

    iget p0, p0, Ll/byz;->c:F

    invoke-static {v0, v1, p0, p1}, Ll/qzz;->l(Ll/qzz;FFLandroid/animation/ValueAnimator;)V

    return-void
.end method
