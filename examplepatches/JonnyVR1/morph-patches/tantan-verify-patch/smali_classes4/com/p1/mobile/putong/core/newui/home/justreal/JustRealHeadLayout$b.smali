.class public Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;->g(ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout$b;->a:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;

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
    .param p1    # Landroid/animation/Animator;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1
    .param p1    # Landroid/animation/Animator;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout$b;->a:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout$b;->a:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;

    .line 9
    .line 10
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;->d(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;)Ll/o4;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const/4 p1, 0x0

    .line 15
    invoke-virtual {p0, p1}, Ll/o4;->f(Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0
    .param p1    # Landroid/animation/Animator;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0
    .param p1    # Landroid/animation/Animator;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method
