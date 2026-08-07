.class public final synthetic Ll/tsr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/vsr;


# direct methods
.method public synthetic constructor <init>(Ll/vsr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tsr;->a:Ll/vsr;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tsr;->a:Ll/vsr;

    invoke-static {p0, p1}, Ll/vsr;->m(Ll/vsr;Landroid/animation/ValueAnimator;)V

    return-void
.end method
