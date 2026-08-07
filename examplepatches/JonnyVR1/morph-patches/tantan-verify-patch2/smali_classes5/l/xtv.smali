.class public final synthetic Ll/xtv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;


# direct methods
.method public synthetic constructor <init>(Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xtv;->a:Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xtv;->a:Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;

    invoke-static {p0, p1}, Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;->a(Lcom/tencent/could/huiyansdk/view/LoadingFrontAnimatorView;Landroid/animation/ValueAnimator;)V

    return-void
.end method
