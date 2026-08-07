.class public final synthetic Ll/gp7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/qp7;


# direct methods
.method public synthetic constructor <init>(Ll/qp7;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gp7;->a:Ll/qp7;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gp7;->a:Ll/qp7;

    invoke-static {p0, p1}, Ll/qp7;->z(Ll/qp7;Landroid/animation/ValueAnimator;)V

    return-void
.end method
