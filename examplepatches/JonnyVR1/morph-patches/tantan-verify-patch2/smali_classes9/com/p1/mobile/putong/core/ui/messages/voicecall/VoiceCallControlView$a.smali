.class public Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->A(FFZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Z

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView$a;->c:Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView$a;->b:Z

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView$a;->a:Z

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationCancel(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView$a;->a:Z

    .line 6
    .line 7
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView$a;->a:Z

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView$a;->b:Z

    .line 10
    .line 11
    if-nez p1, :cond_1

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView$a;->c:Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView$a;->c:Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;

    .line 20
    .line 21
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->i(Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;)Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView$b;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_2

    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView$a;->c:Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;

    .line 32
    .line 33
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->i(Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;)Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView$b;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView$a;->b:Z

    .line 38
    .line 39
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView$b;->a(Z)V

    .line 40
    .line 41
    .line 42
    :cond_2
    :goto_0
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView$a;->a:Z

    .line 6
    .line 7
    return-void
.end method
