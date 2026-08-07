.class public final Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/middle/VoiceVirtualUserCardMiddleItemView;
.super Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0006\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u000f\u0010\t\u001a\u00020\u0008H\u0014\u00a2\u0006\u0004\u0008\t\u0010\nJ+\u0010\u0011\u001a\u00020\u00082\u0006\u0010\u000c\u001a\u00020\u000b2\n\u0010\u000e\u001a\u0006\u0012\u0002\u0008\u00030\r2\u0006\u0010\u0010\u001a\u00020\u000fH\u0007\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u0017\u0010\u0016\u001a\u00020\u00152\u0006\u0010\u0014\u001a\u00020\u0013H\u0002\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J\u0017\u0010\u0018\u001a\u00020\u00152\u0006\u0010\u0014\u001a\u00020\u0013H\u0002\u00a2\u0006\u0004\u0008\u0018\u0010\u0017J\u0017\u0010\u0019\u001a\u00020\u00152\u0006\u0010\u0014\u001a\u00020\u0013H\u0002\u00a2\u0006\u0004\u0008\u0019\u0010\u0017J\u0017\u0010\u001a\u001a\u00020\u00152\u0006\u0010\u0014\u001a\u00020\u0013H\u0002\u00a2\u0006\u0004\u0008\u001a\u0010\u0017\u00a8\u0006\u001b"
    }
    d2 = {
        "Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/middle/VoiceVirtualUserCardMiddleItemView;",
        "Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "",
        "onFinishInflate",
        "()V",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;",
        "model",
        "Ll/mkp0;",
        "presenter",
        "",
        "userId",
        "n0",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;Ll/mkp0;Ljava/lang/String;)V",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCardType;",
        "type",
        "",
        "l0",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCardType;)Z",
        "j0",
        "k0",
        "m0",
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
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static i0(Ll/mkp0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/middle/VoiceVirtualUserCardMiddleItemView;Ljava/lang/String;Landroid/view/View;)Lkotlin/Unit;
    .locals 1

    .line 1
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;->type:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCardType;

    .line 5
    .line 6
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p4}, Ll/mkp0;->p4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCardType;)V

    .line 10
    .line 11
    .line 12
    iget-object p4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;->type:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCardType;

    .line 13
    .line 14
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p2, p4}, Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/middle/VoiceVirtualUserCardMiddleItemView;->j0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCardType;)Z

    .line 18
    .line 19
    .line 20
    move-result p4

    .line 21
    if-eqz p4, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/mkp0;->n4()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object p4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;->type:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCardType;

    .line 28
    .line 29
    const-string v0, "contribute"

    .line 30
    .line 31
    invoke-static {p4, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result p4

    .line 35
    if-eqz p4, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0, p3}, Ll/mkp0;->o4(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    iget-object p3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;->schema:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 44
    .line 45
    .line 46
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;->type:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCardType;

    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/middle/VoiceVirtualUserCardMiddleItemView;->k0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCardType;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    xor-int/lit8 p1, p1, 0x1

    .line 56
    .line 57
    invoke-virtual {p0, p3, p1}, Ll/mkp0;->m4(Ljava/lang/String;Z)V

    .line 58
    .line 59
    .line 60
    :goto_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 61
    .line 62
    return-object p0
.end method


# virtual methods
.method public final j0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCardType;)Z
    .locals 0

    .line 1
    const-string p0, "auction"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final k0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCardType;)Z
    .locals 0

    .line 1
    const-string p0, "giftWall"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final l0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCardType;)Z
    .locals 0

    .line 1
    const-string p0, "sweetCp"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final m0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCardType;)Z
    .locals 0

    .line 1
    const-string p0, "contribute"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final n0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;Ll/mkp0;Ljava/lang/String;)V
    .locals 6
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/mkp0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;",
            "Ll/mkp0<",
            "*>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->e:Lv/VDraweeView;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ll/wlj;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-static {v1}, Lcom/facebook/drawee/generic/RoundingParams;->c(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->k:Lv/VText;

    .line 27
    .line 28
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;->title:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;->type:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCardType;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/middle/VoiceVirtualUserCardMiddleItemView;->l0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCardType;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    const/high16 v1, 0x41400000    # 12.0f

    .line 43
    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    iget-wide v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;->amount:J

    .line 47
    .line 48
    const-wide/16 v4, -0x1

    .line 49
    .line 50
    cmp-long v0, v2, v4

    .line 51
    .line 52
    if-nez v0, :cond_0

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->j:Lv/VText;

    .line 55
    .line 56
    const-string v2, "\u672a\u89e3\u9501"

    .line 57
    .line 58
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->j:Lv/VText;

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 64
    .line 65
    .line 66
    goto/16 :goto_2

    .line 67
    .line 68
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;->type:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCardType;

    .line 69
    .line 70
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/middle/VoiceVirtualUserCardMiddleItemView;->m0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCardType;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_1

    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->j:Lv/VText;

    .line 80
    .line 81
    const-string v2, "\u7c89\u4e1d\u699c"

    .line 82
    .line 83
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->j:Lv/VText;

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->e:Lv/VDraweeView;

    .line 92
    .line 93
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    check-cast v0, Ll/wlj;

    .line 98
    .line 99
    invoke-static {}, Lcom/facebook/drawee/generic/RoundingParams;->a()Lcom/facebook/drawee/generic/RoundingParams;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {v0, v1}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 104
    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;->type:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCardType;

    .line 108
    .line 109
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/middle/VoiceVirtualUserCardMiddleItemView;->l0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCardType;)Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-nez v0, :cond_4

    .line 117
    .line 118
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;->type:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCardType;

    .line 119
    .line 120
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 121
    .line 122
    .line 123
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/middle/VoiceVirtualUserCardMiddleItemView;->j0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCardType;)Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    if-eqz v0, :cond_2

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;->type:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCardType;

    .line 131
    .line 132
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 133
    .line 134
    .line 135
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/middle/VoiceVirtualUserCardMiddleItemView;->k0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCardType;)Z

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->j:Lv/VText;

    .line 140
    .line 141
    if-eqz v0, :cond_3

    .line 142
    .line 143
    iget-wide v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;->amount:J

    .line 144
    .line 145
    iget-wide v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;->totalAmount:J

    .line 146
    .line 147
    new-instance v0, Ljava/lang/StringBuilder;

    .line 148
    .line 149
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    const-string v2, "/"

    .line 156
    .line 157
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 168
    .line 169
    .line 170
    goto :goto_1

    .line 171
    :cond_3
    iget-wide v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;->amount:J

    .line 172
    .line 173
    long-to-double v2, v2

    .line 174
    invoke-static {v2, v3}, Ll/yau;->f(D)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 179
    .line 180
    .line 181
    goto :goto_1

    .line 182
    :cond_4
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->j:Lv/VText;

    .line 183
    .line 184
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;->amount:J

    .line 185
    .line 186
    long-to-double v1, v1

    .line 187
    invoke-static {v1, v2}, Ll/yau;->c(D)Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    new-instance v2, Ljava/lang/StringBuilder;

    .line 192
    .line 193
    const-string v3, "Lv."

    .line 194
    .line 195
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 206
    .line 207
    .line 208
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->j:Lv/VText;

    .line 209
    .line 210
    const/high16 v1, 0x41700000    # 15.0f

    .line 211
    .line 212
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 213
    .line 214
    .line 215
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->e:Lv/VDraweeView;

    .line 216
    .line 217
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;->icon:Ljava/lang/String;

    .line 218
    .line 219
    const-string v2, "context_livingAct"

    .line 220
    .line 221
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;->avatars:Ljava/util/List;

    .line 225
    .line 226
    check-cast v0, Ljava/util/Collection;

    .line 227
    .line 228
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 229
    .line 230
    .line 231
    move-result v0

    .line 232
    const/4 v1, 0x2

    .line 233
    const/4 v3, 0x0

    .line 234
    if-nez v0, :cond_5

    .line 235
    .line 236
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;->avatars:Ljava/util/List;

    .line 237
    .line 238
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 239
    .line 240
    .line 241
    move-result v0

    .line 242
    if-lt v0, v1, :cond_5

    .line 243
    .line 244
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->g:Lv/VDraweeView;

    .line 245
    .line 246
    const/4 v4, 0x1

    .line 247
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 248
    .line 249
    .line 250
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->f:Landroid/view/View;

    .line 251
    .line 252
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 253
    .line 254
    .line 255
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->i:Lv/VDraweeView;

    .line 256
    .line 257
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 258
    .line 259
    .line 260
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->h:Landroid/view/View;

    .line 261
    .line 262
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 263
    .line 264
    .line 265
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->g:Lv/VDraweeView;

    .line 266
    .line 267
    iget-object v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;->avatars:Ljava/util/List;

    .line 268
    .line 269
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 270
    .line 271
    .line 272
    move-result-object v5

    .line 273
    check-cast v5, Ljava/lang/String;

    .line 274
    .line 275
    invoke-static {v2, v0, v5}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 276
    .line 277
    .line 278
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->i:Lv/VDraweeView;

    .line 279
    .line 280
    iget-object v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;->avatars:Ljava/util/List;

    .line 281
    .line 282
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 283
    .line 284
    .line 285
    move-result-object v4

    .line 286
    check-cast v4, Ljava/lang/String;

    .line 287
    .line 288
    invoke-static {v2, v0, v4}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 289
    .line 290
    .line 291
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->f:Landroid/view/View;

    .line 292
    .line 293
    const-string v2, "#3B262D"

    .line 294
    .line 295
    const/16 v4, 0x64

    .line 296
    .line 297
    invoke-static {v2, v4}, Ll/n3d0;->c(Ljava/lang/String;I)Landroid/graphics/drawable/GradientDrawable;

    .line 298
    .line 299
    .line 300
    move-result-object v5

    .line 301
    invoke-virtual {v0, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 302
    .line 303
    .line 304
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->h:Landroid/view/View;

    .line 305
    .line 306
    invoke-static {v2, v4}, Ll/n3d0;->c(Ljava/lang/String;I)Landroid/graphics/drawable/GradientDrawable;

    .line 307
    .line 308
    .line 309
    move-result-object v2

    .line 310
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 311
    .line 312
    .line 313
    goto :goto_3

    .line 314
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->g:Lv/VDraweeView;

    .line 315
    .line 316
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 317
    .line 318
    .line 319
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->f:Landroid/view/View;

    .line 320
    .line 321
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 322
    .line 323
    .line 324
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->i:Lv/VDraweeView;

    .line 325
    .line 326
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 327
    .line 328
    .line 329
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->h:Landroid/view/View;

    .line 330
    .line 331
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 332
    .line 333
    .line 334
    :goto_3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;->type:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCardType;

    .line 335
    .line 336
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 337
    .line 338
    .line 339
    invoke-virtual {p2, v0}, Ll/mkp0;->q4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCardType;)V

    .line 340
    .line 341
    .line 342
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;->backgroundColor:Ljava/lang/String;

    .line 343
    .line 344
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 345
    .line 346
    .line 347
    move-result v0

    .line 348
    if-nez v0, :cond_6

    .line 349
    .line 350
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;->backgroundColor:Ljava/lang/String;

    .line 351
    .line 352
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 353
    .line 354
    .line 355
    const-string v2, "#"

    .line 356
    .line 357
    const/4 v4, 0x0

    .line 358
    invoke-static {v0, v2, v3, v1, v4}, Lkotlin/text/d;->J(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    .line 359
    .line 360
    .line 361
    move-result v0

    .line 362
    if-eqz v0, :cond_6

    .line 363
    .line 364
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->getRoot()Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/middle/VoiceVirtualUserCardMiddleItemView;

    .line 365
    .line 366
    .line 367
    move-result-object v0

    .line 368
    sget v1, Ll/qa00;->i:I

    .line 369
    .line 370
    invoke-static {v0, v1}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 371
    .line 372
    .line 373
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->getRoot()Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/middle/VoiceVirtualUserCardMiddleItemView;

    .line 374
    .line 375
    .line 376
    move-result-object v0

    .line 377
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;->backgroundColor:Ljava/lang/String;

    .line 378
    .line 379
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 380
    .line 381
    .line 382
    move-result v1

    .line 383
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 384
    .line 385
    .line 386
    goto :goto_4

    .line 387
    :cond_6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->getRoot()Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/middle/VoiceVirtualUserCardMiddleItemView;

    .line 388
    .line 389
    .line 390
    move-result-object v0

    .line 391
    sget v1, Ll/obc0;->N7:I

    .line 392
    .line 393
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 394
    .line 395
    .line 396
    :goto_4
    new-instance v0, Ll/kkp0;

    .line 397
    .line 398
    invoke-direct {v0, p2, p1, p0, p3}, Ll/kkp0;-><init>(Ll/mkp0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileMiddleCards;Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/middle/VoiceVirtualUserCardMiddleItemView;Ljava/lang/String;)V

    .line 399
    .line 400
    .line 401
    invoke-static {p0, v0}, Ll/czq;->c(Landroid/view/View;Lkotlin/jvm/functions/Function1;)V

    .line 402
    .line 403
    .line 404
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/bnl0;->y0()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/high16 v1, 0x42900000    # 72.0f

    .line 9
    .line 10
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    sub-int/2addr v0, v1

    .line 15
    div-int/lit8 v0, v0, 0x3

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    new-array v1, v1, [Landroid/view/View;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    aput-object p0, v1, v2

    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
