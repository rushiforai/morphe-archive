.class public final synthetic Ll/l6g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/m6g;


# direct methods
.method public synthetic constructor <init>(Ll/m6g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l6g;->a:Ll/m6g;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l6g;->a:Ll/m6g;

    invoke-static {p0, p1}, Ll/m6g;->b(Ll/m6g;Landroid/animation/ValueAnimator;)V

    return-void
.end method
