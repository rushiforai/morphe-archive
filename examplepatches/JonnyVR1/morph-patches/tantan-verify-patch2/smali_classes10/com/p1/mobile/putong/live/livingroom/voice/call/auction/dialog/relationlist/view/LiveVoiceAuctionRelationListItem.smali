.class public final Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/relationlist/view/LiveVoiceAuctionRelationListItem;
.super Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001B\u001b\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0015\u0010\u000b\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0017\u0010\r\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\r\u0010\u000cJ\u000f\u0010\u000e\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u0017\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0011\u001a\u00020\u0010H\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\u0014\u00a8\u0006\u0015"
    }
    d2 = {
        "Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/relationlist/view/LiveVoiceAuctionRelationListItem;",
        "Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "Ll/mpm0;",
        "model",
        "",
        "d",
        "(Ll/mpm0;)V",
        "b",
        "e",
        "()V",
        "",
        "heart",
        "",
        "c",
        "(I)Ljava/lang/String;",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/relationlist/view/LiveVoiceAuctionRelationListItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final b(Ll/mpm0;)V
    .locals 2

    .line 1
    sget-object v0, Ll/htd0;->e:Ll/htd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/ifv;

    .line 8
    .line 9
    iget-object v0, v0, Ll/ifv;->v:Ll/jxd0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const-string v0, "personal"

    .line 25
    .line 26
    invoke-virtual {p1}, Ll/mpm0;->J()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    invoke-virtual {p1}, Ll/mpm0;->I()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->otherUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->userId:Ljava/lang/String;

    .line 44
    .line 45
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 46
    .line 47
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_2

    .line 56
    .line 57
    invoke-virtual {p1}, Ll/mpm0;->I()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->userInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 62
    .line 63
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->userId:Ljava/lang/String;

    .line 64
    .line 65
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 66
    .line 67
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-nez p1, :cond_2

    .line 76
    .line 77
    :goto_0
    return-void

    .line 78
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/relationlist/view/LiveVoiceAuctionRelationListItem;->e()V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public final c(I)Ljava/lang/String;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, "0"

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    int-to-double p0, p1

    .line 7
    invoke-static {p0, p1}, Ll/yau;->c(D)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    return-object p0
.end method

.method public final d(Ll/mpm0;)V
    .locals 12
    .param p1    # Ll/mpm0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;->b:Lv/VText;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/mpm0;->H()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x1

    .line 11
    add-int/2addr v1, v2

    .line 12
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;->g:Lv/VText;

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/mpm0;->I()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->userInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->userName:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    const/4 v3, 0x3

    .line 33
    invoke-static {v1, v3}, Ll/bf10;->w(Ljava/lang/String;I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {p1}, Ll/mpm0;->I()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->otherUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 42
    .line 43
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->userName:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 46
    .line 47
    .line 48
    invoke-static {v4, v3}, Ll/bf10;->w(Ljava/lang/String;I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    new-instance v4, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string v1, "&"

    .line 61
    .line 62
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;->i:Lv/VText;

    .line 76
    .line 77
    invoke-virtual {p1}, Ll/mpm0;->I()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->relationDetail:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 82
    .line 83
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;->name:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;->h:Lv/VDraweeView;

    .line 89
    .line 90
    invoke-virtual {p1}, Ll/mpm0;->I()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->relationDetail:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 95
    .line 96
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;->tagImage:Ljava/lang/String;

    .line 97
    .line 98
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    xor-int/2addr v1, v2

    .line 103
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;->i:Lv/VText;

    .line 107
    .line 108
    invoke-virtual {p1}, Ll/mpm0;->I()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->relationDetail:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 113
    .line 114
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;->tagImage:Ljava/lang/String;

    .line 115
    .line 116
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p1}, Ll/mpm0;->I()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->relationDetail:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 128
    .line 129
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;->tagImage:Ljava/lang/String;

    .line 130
    .line 131
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-nez v0, :cond_0

    .line 136
    .line 137
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;->h:Lv/VDraweeView;

    .line 138
    .line 139
    invoke-virtual {p1}, Ll/mpm0;->I()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->relationDetail:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 144
    .line 145
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;->tagImage:Ljava/lang/String;

    .line 146
    .line 147
    const/high16 v0, 0x42740000    # 61.0f

    .line 148
    .line 149
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 150
    .line 151
    .line 152
    move-result v6

    .line 153
    const/high16 v0, 0x41600000    # 14.0f

    .line 154
    .line 155
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 156
    .line 157
    .line 158
    move-result v7

    .line 159
    new-instance v11, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/relationlist/view/LiveVoiceAuctionRelationListItem$a;

    .line 160
    .line 161
    invoke-direct {v11, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/relationlist/view/LiveVoiceAuctionRelationListItem$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/relationlist/view/LiveVoiceAuctionRelationListItem;)V

    .line 162
    .line 163
    .line 164
    const-string v3, "context_livingAct"

    .line 165
    .line 166
    const/4 v8, 0x0

    .line 167
    const/4 v9, 0x0

    .line 168
    const/4 v10, 0x0

    .line 169
    invoke-static/range {v3 .. v11}, Ll/izs;->v(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIZZZLl/fn2;)V

    .line 170
    .line 171
    .line 172
    goto :goto_0

    .line 173
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;->i:Lv/VText;

    .line 174
    .line 175
    invoke-virtual {p1}, Ll/mpm0;->I()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->relationDetail:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 180
    .line 181
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;->startBgColor:Ljava/lang/String;

    .line 182
    .line 183
    invoke-static {v1}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 184
    .line 185
    .line 186
    move-result v1

    .line 187
    invoke-virtual {p1}, Ll/mpm0;->I()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;

    .line 188
    .line 189
    .line 190
    move-result-object v3

    .line 191
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->relationDetail:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 192
    .line 193
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;->endBgColor:Ljava/lang/String;

    .line 194
    .line 195
    invoke-static {v3}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 196
    .line 197
    .line 198
    move-result v3

    .line 199
    const/4 v4, 0x4

    .line 200
    sget-object v5, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 201
    .line 202
    invoke-static {v1, v3, v4, v5}, Ll/fc2;->k(IIILandroid/graphics/drawable/GradientDrawable$Orientation;)Landroid/graphics/drawable/GradientDrawable;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 207
    .line 208
    .line 209
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;->k:Lv/VText;

    .line 210
    .line 211
    invoke-virtual {p1}, Ll/mpm0;->I()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;

    .line 212
    .line 213
    .line 214
    move-result-object v1

    .line 215
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->level:I

    .line 216
    .line 217
    new-instance v3, Ljava/lang/StringBuilder;

    .line 218
    .line 219
    const-string v4, "Lv."

    .line 220
    .line 221
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v1

    .line 231
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 232
    .line 233
    .line 234
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;->l:Lv/VText;

    .line 235
    .line 236
    sget-object v1, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 237
    .line 238
    invoke-virtual {p1}, Ll/mpm0;->I()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;

    .line 239
    .line 240
    .line 241
    move-result-object v1

    .line 242
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->remainSeconds:I

    .line 243
    .line 244
    int-to-double v3, v1

    .line 245
    const-wide v5, 0x40f5180000000000L    # 86400.0

    .line 246
    .line 247
    .line 248
    .line 249
    .line 250
    div-double/2addr v3, v5

    .line 251
    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    .line 252
    .line 253
    .line 254
    move-result-wide v3

    .line 255
    double-to-int v1, v3

    .line 256
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 265
    .line 266
    .line 267
    move-result-object v1

    .line 268
    const-string v3, "\u5269\u4f59%s\u5929"

    .line 269
    .line 270
    invoke-static {v3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object v1

    .line 274
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 275
    .line 276
    .line 277
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;->j:Lv/VText;

    .line 278
    .line 279
    invoke-virtual {p1}, Ll/mpm0;->I()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;

    .line 280
    .line 281
    .line 282
    move-result-object v1

    .line 283
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->worth:I

    .line 284
    .line 285
    if-lez v1, :cond_1

    .line 286
    .line 287
    move v1, v2

    .line 288
    goto :goto_1

    .line 289
    :cond_1
    const/4 v1, 0x0

    .line 290
    :goto_1
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 291
    .line 292
    .line 293
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;->j:Lv/VText;

    .line 294
    .line 295
    invoke-virtual {p1}, Ll/mpm0;->I()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;

    .line 296
    .line 297
    .line 298
    move-result-object v1

    .line 299
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->worth:I

    .line 300
    .line 301
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/relationlist/view/LiveVoiceAuctionRelationListItem;->c(I)Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object v1

    .line 305
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 306
    .line 307
    .line 308
    invoke-virtual {p1}, Ll/mpm0;->I()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;

    .line 309
    .line 310
    .line 311
    move-result-object v0

    .line 312
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->userInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 313
    .line 314
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->avatar:Ljava/lang/String;

    .line 315
    .line 316
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 317
    .line 318
    .line 319
    invoke-virtual {p1}, Ll/mpm0;->I()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;

    .line 320
    .line 321
    .line 322
    move-result-object v1

    .line 323
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->otherUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 324
    .line 325
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->avatar:Ljava/lang/String;

    .line 326
    .line 327
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 328
    .line 329
    .line 330
    invoke-virtual {p1}, Ll/mpm0;->I()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;

    .line 331
    .line 332
    .line 333
    move-result-object v3

    .line 334
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->userInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 335
    .line 336
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->tagImage:Ljava/lang/String;

    .line 337
    .line 338
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 339
    .line 340
    .line 341
    invoke-virtual {p1}, Ll/mpm0;->I()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;

    .line 342
    .line 343
    .line 344
    move-result-object v4

    .line 345
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelationCard;->otherUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 346
    .line 347
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->tagImage:Ljava/lang/String;

    .line 348
    .line 349
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 350
    .line 351
    .line 352
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;->e:Lv/VDraweeView;

    .line 353
    .line 354
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 355
    .line 356
    .line 357
    move-result v6

    .line 358
    xor-int/2addr v6, v2

    .line 359
    invoke-static {v5, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 360
    .line 361
    .line 362
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;->f:Lv/VDraweeView;

    .line 363
    .line 364
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 365
    .line 366
    .line 367
    move-result v6

    .line 368
    xor-int/2addr v2, v6

    .line 369
    invoke-static {v5, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 370
    .line 371
    .line 372
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;->c:Lv/VDraweeView;

    .line 373
    .line 374
    const-string v5, "context_single_room"

    .line 375
    .line 376
    invoke-static {v5, v2, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 377
    .line 378
    .line 379
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;->d:Lv/VDraweeView;

    .line 380
    .line 381
    invoke-static {v5, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 382
    .line 383
    .line 384
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;->e:Lv/VDraweeView;

    .line 385
    .line 386
    invoke-static {v5, v0, v3}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 387
    .line 388
    .line 389
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;->f:Lv/VDraweeView;

    .line 390
    .line 391
    invoke-static {v5, v0, v4}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 392
    .line 393
    .line 394
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/relationlist/view/LiveVoiceAuctionRelationListItem;->b(Ll/mpm0;)V

    .line 395
    .line 396
    .line 397
    return-void
.end method

.method public final e()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    sget v1, Ll/qa00;->c:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->B(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/16 v2, 0x4b

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->p(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const/high16 v2, 0x41000000    # 8.0f

    .line 23
    .line 24
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->w(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const-string v2, "#ffffff"

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->r(Ljava/lang/String;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    const-string v2, "#FE7E1D"

    .line 39
    .line 40
    invoke-static {v2}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    filled-new-array {v2}, [I

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    sget v2, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 53
    .line 54
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    const-wide/16 v2, 0xbb8

    .line 59
    .line 60
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    const/high16 v2, 0x41a00000    # 20.0f

    .line 65
    .line 66
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    neg-int v2, v2

    .line 71
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    const/4 v2, 0x1

    .line 76
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->y(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    const/high16 v2, 0x41500000    # 13.0f

    .line 81
    .line 82
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    const-string v2, "\u957f\u6309\u8bd5\u4e00\u4e0b"

    .line 87
    .line 88
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 89
    .line 90
    .line 91
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionRelationItemBindings;->k:Lv/VText;

    .line 96
    .line 97
    const-string v2, "dissolveShipTip"

    .line 98
    .line 99
    invoke-virtual {v1, v0, p0, v2}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    sget-object p0, Ll/htd0;->e:Ll/htd0;

    .line 103
    .line 104
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    check-cast p0, Ll/ifv;

    .line 109
    .line 110
    iget-object p0, p0, Ll/ifv;->v:Ll/jxd0;

    .line 111
    .line 112
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 113
    .line 114
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    return-void
.end method
