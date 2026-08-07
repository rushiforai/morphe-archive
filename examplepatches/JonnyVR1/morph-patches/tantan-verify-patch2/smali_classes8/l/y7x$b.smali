.class public Ll/y7x$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/y7x;->t0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/y7x;


# direct methods
.method public constructor <init>(Ll/y7x;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y7x$b;->a:Ll/y7x;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/y7x$b;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/y7x$b;->a:Ll/y7x;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Ll/y7x;->n0(Ll/y7x;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/y7x$b;->a:Ll/y7x;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/y7x;->V0()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y7x$b;->a:Ll/y7x;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-static {p0, p1}, Ll/y7x;->n0(Ll/y7x;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
