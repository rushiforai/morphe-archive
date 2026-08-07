.class public Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallUserInfoView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Lv/VText;

.field public f:Lv/VDraweeView;

.field public g:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;

.field public h:Lv/VText;

.field public i:Lv/VDraweeView;

.field public j:Lv/VText;


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


# virtual methods
.method public h0(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3MainDetail;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallUserInfoView;->d:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3MainDetail;->level:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserLevel;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserLevel;->smallBgImage:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0, v1}, Ll/izs;->y(Lv/VDraweeView;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallUserInfoView;->f:Lv/VDraweeView;

    .line 11
    .line 12
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3MainDetail;->user:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;

    .line 13
    .line 14
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;->avatar:Ljava/lang/String;

    .line 15
    .line 16
    const-string v2, "context_single_room"

    .line 17
    .line 18
    invoke-static {v2, v0, v1}, Ll/izs;->o(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallUserInfoView;->e:Lv/VText;

    .line 22
    .line 23
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3MainDetail;->user:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;->name:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallUserInfoView;->h:Lv/VText;

    .line 31
    .line 32
    new-instance v1, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 35
    .line 36
    .line 37
    iget-object v3, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3MainDetail;->level:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserLevel;

    .line 38
    .line 39
    iget v3, v3, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserLevel;->ownedGiftCount:I

    .line 40
    .line 41
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v3, "/"

    .line 45
    .line 46
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    iget-object v4, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3MainDetail;->level:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserLevel;

    .line 50
    .line 51
    iget v4, v4, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserLevel;->nextLevelGiftCount:I

    .line 52
    .line 53
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3MainDetail;->level:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserLevel;

    .line 64
    .line 65
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserLevel;->image:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallUserInfoView;->i:Lv/VDraweeView;

    .line 72
    .line 73
    const/4 v4, 0x1

    .line 74
    if-nez v0, :cond_0

    .line 75
    .line 76
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3MainDetail;->level:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserLevel;

    .line 77
    .line 78
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserLevel;->image:Ljava/lang/String;

    .line 79
    .line 80
    invoke-static {v2, v1, v0}, Ll/izs;->o(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallUserInfoView;->i:Lv/VDraweeView;

    .line 84
    .line 85
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_0
    const/4 v0, 0x0

    .line 90
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 91
    .line 92
    .line 93
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallUserInfoView;->j:Lv/VText;

    .line 94
    .line 95
    new-instance v1, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 98
    .line 99
    .line 100
    iget v2, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3MainDetail;->ownedGiftCount:I

    .line 101
    .line 102
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget v2, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3MainDetail;->totalGiftCount:I

    .line 109
    .line 110
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallUserInfoView;->g:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;

    .line 121
    .line 122
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3MainDetail;->level:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserLevel;

    .line 123
    .line 124
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserLevel;->progressColor:Ljava/lang/String;

    .line 125
    .line 126
    invoke-static {v1}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->setProgressColor(I)V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallUserInfoView;->g:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;

    .line 134
    .line 135
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3MainDetail;->level:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserLevel;

    .line 136
    .line 137
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserLevel;->progressBgColor:Ljava/lang/String;

    .line 138
    .line 139
    invoke-static {v1}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->setBackgroundColor(I)V

    .line 144
    .line 145
    .line 146
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3MainDetail;->level:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserLevel;

    .line 147
    .line 148
    iget v0, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserLevel;->ownedGiftCount:I

    .line 149
    .line 150
    int-to-float v1, v0

    .line 151
    const/high16 v2, 0x42c80000    # 100.0f

    .line 152
    .line 153
    mul-float/2addr v1, v2

    .line 154
    iget p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserLevel;->nextLevelGiftCount:I

    .line 155
    .line 156
    int-to-float p1, p1

    .line 157
    div-float/2addr v1, p1

    .line 158
    float-to-int p1, v1

    .line 159
    if-lez v0, :cond_1

    .line 160
    .line 161
    if-nez p1, :cond_1

    .line 162
    .line 163
    goto :goto_1

    .line 164
    :cond_1
    move v4, p1

    .line 165
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallUserInfoView;->g:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;

    .line 166
    .line 167
    invoke-virtual {p0, v4}, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;->setProgress(I)V

    .line 168
    .line 169
    .line 170
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->O7:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VDraweeView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallUserInfoView;->d:Lv/VDraweeView;

    .line 13
    .line 14
    sget v0, Ll/mdc0;->S7:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VText;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallUserInfoView;->e:Lv/VText;

    .line 23
    .line 24
    sget v0, Ll/mdc0;->L7:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lv/VDraweeView;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallUserInfoView;->f:Lv/VDraweeView;

    .line 33
    .line 34
    sget v0, Ll/mdc0;->K7:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallUserInfoView;->g:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/RoundedProgressBar;

    .line 43
    .line 44
    sget v0, Ll/mdc0;->J7:I

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lv/VText;

    .line 51
    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallUserInfoView;->h:Lv/VText;

    .line 53
    .line 54
    sget v0, Ll/mdc0;->t2:I

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Lv/VDraweeView;

    .line 61
    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallUserInfoView;->i:Lv/VDraweeView;

    .line 63
    .line 64
    sget v0, Ll/mdc0;->q3:I

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Lv/VText;

    .line 71
    .line 72
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/VoiceGiftWallUserInfoView;->j:Lv/VText;

    .line 73
    .line 74
    return-void
.end method
