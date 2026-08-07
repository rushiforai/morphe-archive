.class public Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/ui/MultipleChatIconView;

.field public e:Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;

.field public f:Landroid/widget/TextView;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VText;


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

.method public static synthetic h0(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteItemView;ILcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteItemView;->k0(ILcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final i0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jnn0;->a(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final j0(ILcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p2, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 10
    .line 11
    iget-object v2, v2, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->liveId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->E(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const/4 v2, 0x1

    .line 18
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->Q(Z)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-static {v0, v1}, Ll/z91;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 35
    .line 36
    .line 37
    sget-object p0, Ll/zeu;->g:Ljava/lang/String;

    .line 38
    .line 39
    iget-object v0, p2, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->anchorId:Ljava/lang/String;

    .line 42
    .line 43
    const-string v1, "anchorId"

    .line 44
    .line 45
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    iget-object v0, p2, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomId:Ljava/lang/String;

    .line 52
    .line 53
    const-string v1, "roomId"

    .line 54
    .line 55
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    iget-object v0, p2, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 60
    .line 61
    iget-object v0, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->liveId:Ljava/lang/String;

    .line 62
    .line 63
    const-string v1, "liveId"

    .line 64
    .line 65
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    const-string v0, "index"

    .line 70
    .line 71
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    const-string p1, "audio_card_type"

    .line 80
    .line 81
    const-string v0, "liked_audio_room"

    .line 82
    .line 83
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 84
    .line 85
    .line 86
    move-result-object v6

    .line 87
    iget-object p1, p2, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 88
    .line 89
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->isLiving:Z

    .line 90
    .line 91
    if-eqz p1, :cond_0

    .line 92
    .line 93
    const-string p1, "onLive"

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_0
    const-string p1, "endLive"

    .line 97
    .line 98
    :goto_0
    const-string p2, "liveStatus"

    .line 99
    .line 100
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 101
    .line 102
    .line 103
    move-result-object v7

    .line 104
    filled-new-array/range {v2 .. v7}, [Ll/pf60;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    const-string p2, "e_live_audio_room_enter"

    .line 109
    .line 110
    invoke-static {p2, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 111
    .line 112
    .line 113
    return-void
.end method

.method public final synthetic k0(ILcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteItemView;->j0(ILcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l0(ILcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteItemView;->d:Lcom/p1/mobile/putong/ui/MultipleChatIconView;

    .line 2
    .line 3
    const/high16 v1, 0x425c0000    # 55.0f

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->setRadius(F)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteItemView;->d:Lcom/p1/mobile/putong/ui/MultipleChatIconView;

    .line 9
    .line 10
    iget-object v1, p2, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 11
    .line 12
    iget-object v1, v1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->avatars:Ljava/util/List;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->p0(Ljava/util/List;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteItemView;->f:Landroid/widget/TextView;

    .line 19
    .line 20
    iget-object v1, p2, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->title:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p2, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomStateText:Ljava/lang/String;

    .line 30
    .line 31
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 32
    .line 33
    invoke-direct {v1}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-nez v3, :cond_0

    .line 41
    .line 42
    invoke-virtual {v1, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v0, " \u00b7 "

    .line 46
    .line 47
    invoke-virtual {v1, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 48
    .line 49
    .line 50
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    .line 51
    .line 52
    iget-object v3, p2, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 53
    .line 54
    iget-object v3, v3, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomStateTextColor:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {v3}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    invoke-direct {v0, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    const/16 v4, 0x22

    .line 68
    .line 69
    invoke-virtual {v1, v0, v2, v3, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 70
    .line 71
    .line 72
    :cond_0
    iget-object v0, p2, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 73
    .line 74
    iget-object v0, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->commonMsg:Ljava/lang/String;

    .line 75
    .line 76
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-nez v0, :cond_1

    .line 81
    .line 82
    iget-object v0, p2, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 83
    .line 84
    iget-object v0, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->commonMsg:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {v1, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 87
    .line 88
    .line 89
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteItemView;->g:Lv/VText;

    .line 90
    .line 91
    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p2, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->roomInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 99
    .line 100
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->isLiving:Z

    .line 101
    .line 102
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteItemView;->h:Lv/VText;

    .line 103
    .line 104
    const/4 v3, 0x1

    .line 105
    if-eqz v0, :cond_2

    .line 106
    .line 107
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteItemView;->i:Lv/VText;

    .line 111
    .line 112
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteItemView;->e:Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;

    .line 116
    .line 117
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteItemView;->g:Lv/VText;

    .line 121
    .line 122
    const/high16 v1, 0x42a80000    # 84.0f

    .line 123
    .line 124
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    invoke-static {v0, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteItemView;->e:Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;

    .line 132
    .line 133
    const-string v1, "#41d2FF"

    .line 134
    .line 135
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    const-string v2, "#279Aff"

    .line 140
    .line 141
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 142
    .line 143
    .line 144
    move-result v2

    .line 145
    const/4 v3, 0x5

    .line 146
    invoke-static {v1, v2, v3}, Ll/fc2;->j(III)Landroid/graphics/drawable/GradientDrawable;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 151
    .line 152
    .line 153
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteItemView;->e:Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;

    .line 154
    .line 155
    const/4 v1, -0x1

    .line 156
    invoke-virtual {v0, v1, v1}, Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;->c(II)V

    .line 157
    .line 158
    .line 159
    goto :goto_0

    .line 160
    :cond_2
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 161
    .line 162
    .line 163
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteItemView;->i:Lv/VText;

    .line 164
    .line 165
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 166
    .line 167
    .line 168
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteItemView;->e:Lcom/p1/mobile/putong/live/base/view/LiveMainlandTagView;

    .line 169
    .line 170
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 171
    .line 172
    .line 173
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteItemView;->g:Lv/VText;

    .line 174
    .line 175
    const/high16 v1, 0x41800000    # 16.0f

    .line 176
    .line 177
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 178
    .line 179
    .line 180
    move-result v1

    .line 181
    invoke-static {v0, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 182
    .line 183
    .line 184
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteItemView;->h:Lv/VText;

    .line 185
    .line 186
    iget-object v1, p2, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->chatInfo:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;

    .line 187
    .line 188
    iget-wide v1, v1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemChat;->currentTime:J

    .line 189
    .line 190
    long-to-double v1, v1

    .line 191
    invoke-static {v1, v2}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 196
    .line 197
    .line 198
    :goto_0
    new-instance v0, Ll/inn0;

    .line 199
    .line 200
    invoke-direct {v0, p0, p1, p2}, Ll/inn0;-><init>(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteItemView;ILcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V

    .line 201
    .line 202
    .line 203
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 204
    .line 205
    .line 206
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteItemView;->i0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
