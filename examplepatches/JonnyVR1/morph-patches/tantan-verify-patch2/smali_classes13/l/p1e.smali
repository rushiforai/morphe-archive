.class public final synthetic Ll/p1e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Dialog;

.field public final synthetic b:F


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Dialog;F)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p1e;->a:Lcom/p1/mobile/android/app/Dialog;

    iput p2, p0, Ll/p1e;->b:F

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p1e;->a:Lcom/p1/mobile/android/app/Dialog;

    iget p0, p0, Ll/p1e;->b:F

    invoke-static {v0, p0, p1}, Ll/q1e;->d(Lcom/p1/mobile/android/app/Dialog;FLandroid/animation/ValueAnimator;)V

    return-void
.end method
