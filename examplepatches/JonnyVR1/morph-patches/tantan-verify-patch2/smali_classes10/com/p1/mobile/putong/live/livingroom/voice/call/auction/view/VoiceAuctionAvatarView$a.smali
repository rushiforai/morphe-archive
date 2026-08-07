.class public Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->h()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView$a;->b:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView$a;->a:I

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView$a;->b:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->i()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView$a;->b:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->c(Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;)Ljava/util/List;

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
    check-cast p1, Lv/VDraweeView;

    .line 13
    .line 14
    sget v1, Ll/qa00;->g:I

    .line 15
    .line 16
    neg-int v2, v1

    .line 17
    int-to-float v2, v2

    .line 18
    invoke-virtual {p1, v2}, Landroid/view/View;->setTranslationX(F)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView$a;->b:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;

    .line 22
    .line 23
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->c(Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Lv/VDraweeView;

    .line 32
    .line 33
    neg-int v1, v1

    .line 34
    int-to-float v1, v1

    .line 35
    invoke-virtual {p1, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView$a;->b:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;

    .line 39
    .line 40
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->c(Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;)Ljava/util/List;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-interface {p1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    check-cast p1, Lv/VDraweeView;

    .line 49
    .line 50
    const/high16 v1, -0x40800000    # -1.0f

    .line 51
    .line 52
    invoke-virtual {p1, v1}, Landroid/view/View;->setZ(F)V

    .line 53
    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView$a;->b:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;

    .line 56
    .line 57
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->c(Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;)Ljava/util/List;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView$a;->b:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;

    .line 65
    .line 66
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->d(Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;)Ljava/util/List;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Ljava/lang/String;

    .line 75
    .line 76
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView$a;->b:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;

    .line 77
    .line 78
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->d(Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;)Ljava/util/List;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView$a;->b:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;

    .line 86
    .line 87
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->d(Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;)Ljava/util/List;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView$a;->b:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;

    .line 92
    .line 93
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->c(Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;)Ljava/util/List;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView$a;->b:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;

    .line 102
    .line 103
    invoke-static {v2}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;->d(Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView;)Ljava/util/List;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    rem-int/2addr v1, v2

    .line 112
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    check-cast v0, Ljava/lang/String;

    .line 117
    .line 118
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/view/VoiceAuctionAvatarView$a;->a:I

    .line 119
    .line 120
    const-string v1, "context_common"

    .line 121
    .line 122
    invoke-static {v1, p1, v0, p0}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 123
    .line 124
    .line 125
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
