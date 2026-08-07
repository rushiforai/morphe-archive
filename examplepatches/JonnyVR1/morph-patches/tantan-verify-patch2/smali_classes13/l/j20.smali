.class public final synthetic Ll/j20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:I

.field public final synthetic c:I

.field public final synthetic d:I

.field public final synthetic e:I

.field public final synthetic f:Ll/c30;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;IIIILl/c30;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j20;->a:Lcom/p1/mobile/android/app/Act;

    iput p2, p0, Ll/j20;->b:I

    iput p3, p0, Ll/j20;->c:I

    iput p4, p0, Ll/j20;->d:I

    iput p5, p0, Ll/j20;->e:I

    iput-object p6, p0, Ll/j20;->f:Ll/c30;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/j20;->a:Lcom/p1/mobile/android/app/Act;

    iget v1, p0, Ll/j20;->b:I

    iget v2, p0, Ll/j20;->c:I

    iget v3, p0, Ll/j20;->d:I

    iget v4, p0, Ll/j20;->e:I

    iget-object v5, p0, Ll/j20;->f:Ll/c30;

    move-object v6, p1

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/android/app/Act;->t1(Lcom/p1/mobile/android/app/Act;IIIILl/c30;Landroid/animation/ValueAnimator;)V

    return-void
.end method
