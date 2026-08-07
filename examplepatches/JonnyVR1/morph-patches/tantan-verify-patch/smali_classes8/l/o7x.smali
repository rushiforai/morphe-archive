.class public final synthetic Ll/o7x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/y7x;


# direct methods
.method public synthetic constructor <init>(Ll/y7x;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o7x;->a:Ll/y7x;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o7x;->a:Ll/y7x;

    invoke-static {p0, p1}, Ll/y7x;->j(Ll/y7x;Landroid/animation/ValueAnimator;)V

    return-void
.end method
