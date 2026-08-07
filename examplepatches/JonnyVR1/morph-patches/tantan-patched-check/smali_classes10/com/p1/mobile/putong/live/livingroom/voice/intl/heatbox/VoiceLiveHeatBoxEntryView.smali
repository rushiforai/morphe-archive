.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "Ll/iam<",
        "Ll/bzn0;",
        ">;"
    }
.end annotation


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;

.field public e:Landroid/view/View;

.field public f:Lv/VDraweeView;

.field public g:Lv/VMarqueeText;

.field public h:Lv/VMarqueeText;

.field public i:Z

.field public j:Ll/bzn0;

.field public k:Landroid/animation/Animator;

.field public l:Landroid/animation/Animator;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->k0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public final i0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/dzn0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/bzn0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->j0(Ll/bzn0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public j0(Ll/bzn0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->j:Ll/bzn0;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic k0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->j:Ll/bzn0;

    .line 2
    .line 3
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->i:Z

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->giftSchema:Ljava/lang/String;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->h5JumpUrl:Ljava/lang/String;

    .line 11
    .line 12
    :goto_0
    invoke-virtual {p2, p0}, Ll/bzn0;->M3(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public l0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;Z)V
    .locals 4

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->showEntrance:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->i:Z

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const/4 v0, 0x1

    .line 13
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->g:Lv/VMarqueeText;

    .line 17
    .line 18
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->giftContent:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->h:Lv/VMarqueeText;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->content:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->k:Landroid/animation/Animator;

    .line 31
    .line 32
    invoke-static {v2}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->l:Landroid/animation/Animator;

    .line 36
    .line 37
    invoke-static {v2}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 38
    .line 39
    .line 40
    if-eqz p2, :cond_2

    .line 41
    .line 42
    iget-boolean p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->distribute:Z

    .line 43
    .line 44
    if-nez p2, :cond_2

    .line 45
    .line 46
    iget-boolean p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->i:Z

    .line 47
    .line 48
    if-nez p2, :cond_1

    .line 49
    .line 50
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->g:Lv/VMarqueeText;

    .line 51
    .line 52
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->n0(Landroid/view/View;)V

    .line 53
    .line 54
    .line 55
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->h:Lv/VMarqueeText;

    .line 56
    .line 57
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->o0(Landroid/view/View;)V

    .line 58
    .line 59
    .line 60
    :cond_1
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->i:Z

    .line 61
    .line 62
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->m0(Z)V

    .line 63
    .line 64
    .line 65
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->g:Lv/VMarqueeText;

    .line 66
    .line 67
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_2
    iget-boolean p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->i:Z

    .line 72
    .line 73
    if-eqz p2, :cond_3

    .line 74
    .line 75
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->h:Lv/VMarqueeText;

    .line 76
    .line 77
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->n0(Landroid/view/View;)V

    .line 78
    .line 79
    .line 80
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->g:Lv/VMarqueeText;

    .line 81
    .line 82
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->o0(Landroid/view/View;)V

    .line 83
    .line 84
    .line 85
    :cond_3
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->i:Z

    .line 86
    .line 87
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->m0(Z)V

    .line 88
    .line 89
    .line 90
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->f:Lv/VDraweeView;

    .line 91
    .line 92
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;->iconUrl:Ljava/lang/String;

    .line 93
    .line 94
    const-string v1, "context_livingAct"

    .line 95
    .line 96
    invoke-static {v1, p2, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    new-instance p2, Ll/czn0;

    .line 100
    .line 101
    invoke-direct {p2, p0, p1}, Ll/czn0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHeatBoxEntrance;)V

    .line 102
    .line 103
    .line 104
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public final m0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->e:Landroid/view/View;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    sget p1, Ll/obc0;->D0:I

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget p1, Ll/obc0;->P:I

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final n0(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    const/4 v1, 0x2

    .line 7
    new-array v1, v1, [F

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    aput v0, v1, v2

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    const/4 v2, 0x1

    .line 14
    aput v0, v1, v2

    .line 15
    .line 16
    sget-object v0, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 17
    .line 18
    invoke-static {p1, v0, v1}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->k:Landroid/animation/Animator;

    .line 23
    .line 24
    const-wide/16 v0, 0x190

    .line 25
    .line 26
    invoke-virtual {p1, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->k:Landroid/animation/Animator;

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final o0(Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    neg-int v0, v0

    .line 6
    int-to-float v0, v0

    .line 7
    const/4 v1, 0x2

    .line 8
    new-array v1, v1, [F

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    const/4 v3, 0x0

    .line 12
    aput v2, v1, v3

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    aput v0, v1, v2

    .line 16
    .line 17
    sget-object v0, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    .line 18
    .line 19
    invoke-static {p1, v0, v1}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->l:Landroid/animation/Animator;

    .line 24
    .line 25
    const-wide/16 v0, 0x190

    .line 26
    .line 27
    invoke-virtual {p1, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->l:Landroid/animation/Animator;

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;->i0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
