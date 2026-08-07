.class public final synthetic Ll/o7n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/q7n;


# direct methods
.method public synthetic constructor <init>(Ll/q7n;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o7n;->a:Ll/q7n;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o7n;->a:Ll/q7n;

    invoke-static {p0, p1}, Ll/q7n;->M(Ll/q7n;Landroid/animation/ValueAnimator;)V

    return-void
.end method
