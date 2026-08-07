.class public Lcom/p1/mobile/putong/core/ui/messages/aichat/TextHide$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/messages/aichat/TextHide;->r(Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/aichat/TextHide;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/aichat/TextHide;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextHide$a;->a:Lcom/p1/mobile/putong/core/ui/messages/aichat/TextHide;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextHide$a;->a:Lcom/p1/mobile/putong/core/ui/messages/aichat/TextHide;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextHide;->o(Lcom/p1/mobile/putong/core/ui/messages/aichat/TextHide;)Lcom/p1/mobile/putong/core/ui/messages/aichat/TextHide$b;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextHide$a;->a:Lcom/p1/mobile/putong/core/ui/messages/aichat/TextHide;

    .line 17
    .line 18
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextHide;->o(Lcom/p1/mobile/putong/core/ui/messages/aichat/TextHide;)Lcom/p1/mobile/putong/core/ui/messages/aichat/TextHide$b;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextHide$b;->a()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextHide$a;->a:Lcom/p1/mobile/putong/core/ui/messages/aichat/TextHide;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextHide;->o(Lcom/p1/mobile/putong/core/ui/messages/aichat/TextHide;)Lcom/p1/mobile/putong/core/ui/messages/aichat/TextHide$b;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextHide$a;->a:Lcom/p1/mobile/putong/core/ui/messages/aichat/TextHide;

    .line 17
    .line 18
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextHide;->o(Lcom/p1/mobile/putong/core/ui/messages/aichat/TextHide;)Lcom/p1/mobile/putong/core/ui/messages/aichat/TextHide$b;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/aichat/TextHide$b;->c()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method
