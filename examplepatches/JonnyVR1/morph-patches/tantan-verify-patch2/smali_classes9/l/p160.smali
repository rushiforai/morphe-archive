.class public final synthetic Ll/p160;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/t160;


# direct methods
.method public synthetic constructor <init>(Ll/t160;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p160;->a:Ll/t160;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p160;->a:Ll/t160;

    invoke-static {p0, p1}, Ll/t160;->b4(Ll/t160;Landroid/animation/ValueAnimator;)V

    return-void
.end method
