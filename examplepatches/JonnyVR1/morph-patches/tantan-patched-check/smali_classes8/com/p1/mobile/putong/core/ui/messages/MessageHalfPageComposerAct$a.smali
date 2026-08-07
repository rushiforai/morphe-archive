.class public Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->n2(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct$a;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;

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

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct$a;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;->l2(Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct$a;->a:Lcom/p1/mobile/putong/core/ui/messages/MessageHalfPageComposerAct;

    .line 7
    .line 8
    sget p1, Ll/y7c0;->c:I

    .line 9
    .line 10
    sget v0, Ll/y7c0;->d:I

    .line 11
    .line 12
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 13
    .line 14
    .line 15
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
