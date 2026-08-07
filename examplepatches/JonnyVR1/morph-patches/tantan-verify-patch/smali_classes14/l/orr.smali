.class public final synthetic Ll/orr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/prr;

.field public final synthetic b:I

.field public final synthetic c:Ll/grr;

.field public final synthetic d:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Ll/prr;ILl/grr;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/orr;->a:Ll/prr;

    iput p2, p0, Ll/orr;->b:I

    iput-object p3, p0, Ll/orr;->c:Ll/grr;

    iput-object p4, p0, Ll/orr;->d:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/orr;->a:Ll/prr;

    iget v1, p0, Ll/orr;->b:I

    iget-object v2, p0, Ll/orr;->c:Ll/grr;

    iget-object p0, p0, Ll/orr;->d:Landroid/view/View;

    invoke-static {v0, v1, v2, p0, p1}, Ll/prr;->k(Ll/prr;ILl/grr;Landroid/view/View;Landroid/animation/ValueAnimator;)V

    return-void
.end method
