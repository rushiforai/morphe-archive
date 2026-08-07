.class public final synthetic Ll/zh40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Ll/ai40;


# direct methods
.method public synthetic constructor <init>(Ll/ai40;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zh40;->a:Ll/ai40;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zh40;->a:Ll/ai40;

    invoke-static {p0, p1}, Ll/ai40;->i(Ll/ai40;Landroid/animation/ValueAnimator;)V

    return-void
.end method
