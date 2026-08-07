.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopLeaderBoardEffectView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopLeaderBoardEffectView;

.field public b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, -0x1

    .line 6
    invoke-direct {p0, p1, p2, v0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/e5j0;->a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopLeaderBoardEffectView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final b(Lcom/p1/mobile/longlink/msg/live/leaderboard/LongLinkLiveLeadBoardMsg$LeaderboardEffectInfo;Landroid/text/TextPaint;Landroid/text/TextPaint;Landroid/text/TextPaint;)Lcom/tantan/library/svga/compose/SVGADynamicEntity;
    .locals 2

    .line 1
    new-instance p0, Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/live/leaderboard/LongLinkLiveLeadBoardMsg$LeaderboardEffectInfo;->getTitle()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "text01"

    .line 11
    .line 12
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setDynamicText(Ljava/lang/String;Landroid/text/TextPaint;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/live/leaderboard/LongLinkLiveLeadBoardMsg$LeaderboardEffectInfo;->getUserName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    const-string v0, "text02"

    .line 20
    .line 21
    invoke-virtual {p0, p2, p3, v0}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setDynamicText(Ljava/lang/String;Landroid/text/TextPaint;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/live/leaderboard/LongLinkLiveLeadBoardMsg$LeaderboardEffectInfo;->getContent()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    const-string p3, "text03"

    .line 29
    .line 30
    invoke-virtual {p0, p2, p4, p3}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setDynamicText(Ljava/lang/String;Landroid/text/TextPaint;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/live/leaderboard/LongLinkLiveLeadBoardMsg$LeaderboardEffectInfo;->getUserPic()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const-string p2, "head"

    .line 38
    .line 39
    invoke-virtual {p0, p1, p2}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setDynamicImage(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-object p0
.end method

.method public final c(FZLjava/lang/String;Z)Landroid/text/TextPaint;
    .locals 2

    .line 1
    new-instance p0, Landroid/text/TextPaint;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/text/TextPaint;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p4, :cond_0

    .line 7
    .line 8
    sget p4, Ll/n9c0;->n1:I

    .line 9
    .line 10
    invoke-static {p4}, Ll/n3d0;->a(I)I

    .line 11
    .line 12
    .line 13
    move-result p4

    .line 14
    const/high16 v0, 0x41400000    # 12.0f

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {p0, v0, v1, v1, p4}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 24
    .line 25
    .line 26
    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 31
    .line 32
    .line 33
    const/4 p1, 0x1

    .line 34
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 35
    .line 36
    .line 37
    sget-object p1, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 40
    .line 41
    .line 42
    return-object p0
.end method

.method public d()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/longlink/msg/live/leaderboard/LongLinkLiveLeadBoardMsg$LeaderboardEffectInfo;Ll/x20;)V
    .locals 6

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/live/leaderboard/LongLinkLiveLeadBoardMsg$LeaderboardEffectInfo;->getType()Lcom/p1/mobile/longlink/msg/live/leaderboard/LongLinkLiveLeadBoardMsg$LeaderboardEffectType;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/longlink/msg/live/leaderboard/LongLinkLiveLeadBoardMsg$LeaderboardEffectType;->week:Lcom/p1/mobile/longlink/msg/live/leaderboard/LongLinkLiveLeadBoardMsg$LeaderboardEffectType;

    .line 6
    .line 7
    const/high16 v2, 0x41300000    # 11.0f

    .line 8
    .line 9
    const/high16 v3, 0x41600000    # 14.0f

    .line 10
    .line 11
    const/4 v4, 0x1

    .line 12
    const/4 v5, 0x0

    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    int-to-float v0, v0

    .line 20
    const-string v1, "#ffe9b7"

    .line 21
    .line 22
    invoke-virtual {p0, v0, v4, v1, v5}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopLeaderBoardEffectView;->c(FZLjava/lang/String;Z)Landroid/text/TextPaint;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    int-to-float v1, v1

    .line 31
    const-string v2, "#db8cfe"

    .line 32
    .line 33
    invoke-virtual {p0, v1, v5, v2, v5}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopLeaderBoardEffectView;->c(FZLjava/lang/String;Z)Landroid/text/TextPaint;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/live/leaderboard/LongLinkLiveLeadBoardMsg$LeaderboardEffectInfo;->getType()Lcom/p1/mobile/longlink/msg/live/leaderboard/LongLinkLiveLeadBoardMsg$LeaderboardEffectType;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    sget-object v1, Lcom/p1/mobile/longlink/msg/live/leaderboard/LongLinkLiveLeadBoardMsg$LeaderboardEffectType;->second:Lcom/p1/mobile/longlink/msg/live/leaderboard/LongLinkLiveLeadBoardMsg$LeaderboardEffectType;

    .line 43
    .line 44
    if-ne v0, v1, :cond_1

    .line 45
    .line 46
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    int-to-float v0, v0

    .line 51
    const-string v1, "#ffefc9"

    .line 52
    .line 53
    invoke-virtual {p0, v0, v4, v1, v5}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopLeaderBoardEffectView;->c(FZLjava/lang/String;Z)Landroid/text/TextPaint;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    int-to-float v1, v1

    .line 62
    const-string v2, "#8e6eec"

    .line 63
    .line 64
    invoke-virtual {p0, v1, v5, v2, v5}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopLeaderBoardEffectView;->c(FZLjava/lang/String;Z)Landroid/text/TextPaint;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    goto :goto_0

    .line 69
    :cond_1
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/live/leaderboard/LongLinkLiveLeadBoardMsg$LeaderboardEffectInfo;->getType()Lcom/p1/mobile/longlink/msg/live/leaderboard/LongLinkLiveLeadBoardMsg$LeaderboardEffectType;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    sget-object v1, Lcom/p1/mobile/longlink/msg/live/leaderboard/LongLinkLiveLeadBoardMsg$LeaderboardEffectType;->love:Lcom/p1/mobile/longlink/msg/live/leaderboard/LongLinkLiveLeadBoardMsg$LeaderboardEffectType;

    .line 74
    .line 75
    if-ne v0, v1, :cond_2

    .line 76
    .line 77
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    int-to-float v0, v0

    .line 82
    const-string v1, "#fcf0cd"

    .line 83
    .line 84
    invoke-virtual {p0, v0, v4, v1, v5}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopLeaderBoardEffectView;->c(FZLjava/lang/String;Z)Landroid/text/TextPaint;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    int-to-float v1, v1

    .line 93
    const-string v2, "#9c7845"

    .line 94
    .line 95
    invoke-virtual {p0, v1, v5, v2, v5}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopLeaderBoardEffectView;->c(FZLjava/lang/String;Z)Landroid/text/TextPaint;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    goto :goto_0

    .line 100
    :cond_2
    const/4 v0, 0x0

    .line 101
    move-object v1, v0

    .line 102
    :goto_0
    const/high16 v2, 0x41500000    # 13.0f

    .line 103
    .line 104
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    int-to-float v2, v2

    .line 109
    const-string v3, "#ffffff"

    .line 110
    .line 111
    invoke-virtual {p0, v2, v4, v3, v4}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopLeaderBoardEffectView;->c(FZLjava/lang/String;Z)Landroid/text/TextPaint;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-virtual {p0, p2, v0, v2, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopLeaderBoardEffectView;->b(Lcom/p1/mobile/longlink/msg/live/leaderboard/LongLinkLiveLeadBoardMsg$LeaderboardEffectInfo;Landroid/text/TextPaint;Landroid/text/TextPaint;Landroid/text/TextPaint;)Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-static {p1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/live/leaderboard/LongLinkLiveLeadBoardMsg$LeaderboardEffectInfo;->getSvgUrl()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p2

    .line 127
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-virtual {p1, v4}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->dynamic(Lcom/tantan/library/svga/compose/SVGADynamicEntity;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    new-instance p2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopLeaderBoardEffectView$a;

    .line 140
    .line 141
    invoke-direct {p2, p0, p3}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopLeaderBoardEffectView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopLeaderBoardEffectView;Ll/x20;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    invoke-virtual {p1, v4}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopLeaderBoardEffectView;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 153
    .line 154
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 155
    .line 156
    .line 157
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopLeaderBoardEffectView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
