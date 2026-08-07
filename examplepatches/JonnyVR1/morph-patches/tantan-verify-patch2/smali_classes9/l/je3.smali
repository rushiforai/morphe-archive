.class public final synthetic Ll/je3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/le3;

.field public final synthetic b:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Ll/le3;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/je3;->a:Ll/le3;

    iput-object p2, p0, Ll/je3;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/je3;->a:Ll/le3;

    iget-object p0, p0, Ll/je3;->b:Landroid/view/View;

    invoke-static {v0, p0, p1}, Ll/le3;->q(Ll/le3;Landroid/view/View;Landroid/animation/ValueAnimator;)V

    return-void
.end method
