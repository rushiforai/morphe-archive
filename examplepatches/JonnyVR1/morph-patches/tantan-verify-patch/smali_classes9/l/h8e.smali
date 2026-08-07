.class public final synthetic Ll/h8e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/l8e;


# direct methods
.method public synthetic constructor <init>(Ll/l8e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h8e;->a:Ll/l8e;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h8e;->a:Ll/l8e;

    invoke-static {p0, p1}, Ll/l8e;->k(Ll/l8e;Landroid/animation/ValueAnimator;)V

    return-void
.end method
