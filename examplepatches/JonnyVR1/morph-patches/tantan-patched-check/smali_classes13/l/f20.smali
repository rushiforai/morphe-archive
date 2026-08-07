.class public final synthetic Ll/f20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Landroid/app/Dialog;

.field public final synthetic c:Z

.field public final synthetic d:F

.field public final synthetic e:Landroid/view/WindowManager$LayoutParams;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Landroid/app/Dialog;ZFLandroid/view/WindowManager$LayoutParams;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f20;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/f20;->b:Landroid/app/Dialog;

    iput-boolean p3, p0, Ll/f20;->c:Z

    iput p4, p0, Ll/f20;->d:F

    iput-object p5, p0, Ll/f20;->e:Landroid/view/WindowManager$LayoutParams;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/f20;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/f20;->b:Landroid/app/Dialog;

    iget-boolean v2, p0, Ll/f20;->c:Z

    iget v3, p0, Ll/f20;->d:F

    iget-object v4, p0, Ll/f20;->e:Landroid/view/WindowManager$LayoutParams;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/android/app/Act;->r1(Lcom/p1/mobile/android/app/Act;Landroid/app/Dialog;ZFLandroid/view/WindowManager$LayoutParams;Landroid/animation/ValueAnimator;)V

    return-void
.end method
