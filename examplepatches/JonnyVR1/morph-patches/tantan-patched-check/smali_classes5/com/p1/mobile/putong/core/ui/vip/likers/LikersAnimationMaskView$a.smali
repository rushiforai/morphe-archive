.class public Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAnimationMaskView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAnimationMaskView;->e(Ll/x20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/x20;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAnimationMaskView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAnimationMaskView;Ll/x20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAnimationMaskView$a;->b:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAnimationMaskView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAnimationMaskView$a;->a:Ll/x20;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAnimationMaskView$a;->b:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAnimationMaskView;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAnimationMaskView$a;->b:Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAnimationMaskView;

    .line 10
    .line 11
    const/16 v0, 0x8

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAnimationMaskView$a;->a:Ll/x20;

    .line 17
    .line 18
    invoke-interface {p0}, Ll/x20;->call()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method
