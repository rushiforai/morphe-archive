.class public final Ll/qmj0$c;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/qmj0;->k()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0006*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0017\u0010\u0007\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0006J\r\u0010\u0008\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0008\u0010\t\u00a8\u0006\n"
    }
    d2 = {
        "l/qmj0$c",
        "Landroid/animation/AnimatorListenerAdapter;",
        "Landroid/animation/Animator;",
        "animation",
        "",
        "onAnimationCancel",
        "(Landroid/animation/Animator;)V",
        "onAnimationEnd",
        "a",
        "()V",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Ll/qmj0;

.field public final synthetic b:F

.field public final synthetic c:F

.field public final synthetic d:I

.field public final synthetic e:I

.field public final synthetic f:F

.field public final synthetic g:F

.field public final synthetic h:I

.field public final synthetic i:I

.field public final synthetic j:Landroid/animation/ValueAnimator;


# direct methods
.method public constructor <init>(Ll/qmj0;FFIIFFIILandroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qmj0$c;->a:Ll/qmj0;

    .line 2
    .line 3
    iput p2, p0, Ll/qmj0$c;->b:F

    .line 4
    .line 5
    iput p3, p0, Ll/qmj0$c;->c:F

    .line 6
    .line 7
    iput p4, p0, Ll/qmj0$c;->d:I

    .line 8
    .line 9
    iput p5, p0, Ll/qmj0$c;->e:I

    .line 10
    .line 11
    iput p6, p0, Ll/qmj0$c;->f:F

    .line 12
    .line 13
    iput p7, p0, Ll/qmj0$c;->g:F

    .line 14
    .line 15
    iput p8, p0, Ll/qmj0$c;->h:I

    .line 16
    .line 17
    iput p9, p0, Ll/qmj0$c;->i:I

    .line 18
    .line 19
    iput-object p10, p0, Ll/qmj0$c;->j:Landroid/animation/ValueAnimator;

    .line 20
    .line 21
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 22
    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 11

    .line 1
    iget-object v0, p0, Ll/qmj0$c;->a:Ll/qmj0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/qmj0;->d(Ll/qmj0;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Ll/qmj0$c;->a:Ll/qmj0;

    .line 10
    .line 11
    iget v3, p0, Ll/qmj0$c;->b:F

    .line 12
    .line 13
    iget v4, p0, Ll/qmj0$c;->c:F

    .line 14
    .line 15
    iget v5, p0, Ll/qmj0$c;->d:I

    .line 16
    .line 17
    iget v6, p0, Ll/qmj0$c;->e:I

    .line 18
    .line 19
    iget v7, p0, Ll/qmj0$c;->f:F

    .line 20
    .line 21
    iget v8, p0, Ll/qmj0$c;->g:F

    .line 22
    .line 23
    iget v9, p0, Ll/qmj0$c;->h:I

    .line 24
    .line 25
    iget v10, p0, Ll/qmj0$c;->i:I

    .line 26
    .line 27
    const/high16 v2, 0x3f800000    # 1.0f

    .line 28
    .line 29
    invoke-static/range {v1 .. v10}, Ll/qmj0;->e(Ll/qmj0;FFFIIFFII)V

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object v0, p0, Ll/qmj0$c;->a:Ll/qmj0;

    .line 33
    .line 34
    invoke-static {v0}, Ll/qmj0;->c(Ll/qmj0;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/qmj0$c;->j:Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Ll/qmj0$c;->j:Landroid/animation/ValueAnimator;

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationCancel(Landroid/animation/Animator;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/qmj0$c;->a()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/qmj0$c;->a()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
