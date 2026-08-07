.class public final synthetic Ll/gx4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/mw4;


# direct methods
.method public synthetic constructor <init>(Ll/mw4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gx4;->a:Ll/mw4;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gx4;->a:Ll/mw4;

    invoke-static {p0, p1}, Ll/ix4;->R(Ll/mw4;Landroid/animation/ValueAnimator;)V

    return-void
.end method
