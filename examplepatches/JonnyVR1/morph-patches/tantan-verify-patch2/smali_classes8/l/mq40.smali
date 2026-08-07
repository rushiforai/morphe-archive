.class public final synthetic Ll/mq40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:I

.field public final synthetic c:F


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;IF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mq40;->a:Landroid/view/View;

    iput p2, p0, Ll/mq40;->b:I

    iput p3, p0, Ll/mq40;->c:F

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mq40;->a:Landroid/view/View;

    iget v1, p0, Ll/mq40;->b:I

    iget p0, p0, Ll/mq40;->c:F

    invoke-static {v0, v1, p0, p1}, Ll/nq40;->h(Landroid/view/View;IFLandroid/animation/ValueAnimator;)V

    return-void
.end method
