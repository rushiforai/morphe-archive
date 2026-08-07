.class public Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->i()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView$a;->b:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView$a;->a:I

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

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView$a;->b:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->j()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView$a;->b:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->d(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;

    .line 13
    .line 14
    sget v1, Ll/qa00;->m:I

    .line 15
    .line 16
    int-to-float v2, v1

    .line 17
    invoke-virtual {p1, v2}, Landroid/view/View;->setTranslationX(F)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView$a;->b:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->d(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;)Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;

    .line 31
    .line 32
    neg-int v1, v1

    .line 33
    int-to-float v1, v1

    .line 34
    invoke-virtual {p1, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView$a;->b:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;

    .line 38
    .line 39
    invoke-static {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->d(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;)Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-interface {p1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    check-cast p1, Lcom/p1/mobile/putong/live/external/voice/entry/LiveEntryAvatarBorderView;

    .line 48
    .line 49
    const/high16 v1, -0x40800000    # -1.0f

    .line 50
    .line 51
    invoke-virtual {p1, v1}, Landroid/view/View;->setZ(F)V

    .line 52
    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView$a;->b:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;

    .line 55
    .line 56
    invoke-static {v1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->d(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;)Ljava/util/List;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView$a;->b:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;

    .line 64
    .line 65
    invoke-static {v1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->e(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;)Ljava/util/List;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Ljava/lang/String;

    .line 74
    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView$a;->b:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;

    .line 76
    .line 77
    invoke-static {v1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->e(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;)Ljava/util/List;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView$a;->b:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;

    .line 85
    .line 86
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->e(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;)Ljava/util/List;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView$a;->b:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;

    .line 91
    .line 92
    invoke-static {v1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->d(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;)Ljava/util/List;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView$a;->b:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;

    .line 101
    .line 102
    invoke-static {v2}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->e(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;)Ljava/util/List;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    rem-int/2addr v1, v2

    .line 111
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    check-cast v0, Ljava/lang/String;

    .line 116
    .line 117
    iget p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView$a;->a:I

    .line 118
    .line 119
    const-string v1, "context_common"

    .line 120
    .line 121
    invoke-static {v1, p1, v0, p0}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 122
    .line 123
    .line 124
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
