.class public Ll/t880;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VDraweeView;

.field public c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

.field public d:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;Lv/VDraweeView;Lv/VDraweeView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/t880;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 5
    .line 6
    iput-object p2, p0, Ll/t880;->d:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 7
    .line 8
    iput-object p3, p0, Ll/t880;->a:Lv/VDraweeView;

    .line 9
    .line 10
    iput-object p4, p0, Ll/t880;->b:Lv/VDraweeView;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;->m0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lv/VDraweeView;Ljava/lang/String;Ll/x20;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    const-string v0, "context_livingAct"

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    invoke-interface {p2}, Ll/x20;->call()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;Ll/x20;)Lcom/tantan/library/svga/AnimListener;
    .locals 1

    .line 1
    new-instance v0, Ll/t880$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/t880$a;-><init>(Ll/t880;Landroid/view/View;Ll/x20;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public d(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/t880;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_2

    .line 6
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->players:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_2

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 25
    .line 26
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userId:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUserId()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_1

    .line 37
    .line 38
    iget-object v2, p0, Ll/t880;->b:Lv/VDraweeView;

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    iget-object v2, p0, Ll/t880;->a:Lv/VDraweeView;

    .line 42
    .line 43
    :goto_1
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->rankInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRankInfo;

    .line 44
    .line 45
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveRankInfo;->rankImage:Ljava/lang/String;

    .line 46
    .line 47
    const/4 v3, 0x1

    .line 48
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    const-string v3, "context_livingAct"

    .line 52
    .line 53
    invoke-static {v3, v2, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    :goto_2
    return-void
.end method

.method public e(Ll/sx70;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;Ll/x20;)V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/t880;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_2

    .line 6
    .line 7
    :cond_0
    new-instance v0, Landroid/text/TextPaint;

    .line 8
    .line 9
    invoke-direct {v0}, Landroid/text/TextPaint;-><init>()V

    .line 10
    .line 11
    .line 12
    const/high16 v1, 0x41200000    # 10.0f

    .line 13
    .line 14
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    int-to-float v1, v1

    .line 19
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 20
    .line 21
    .line 22
    const-string v1, "#FFF48F"

    .line 23
    .line 24
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 29
    .line 30
    .line 31
    const/4 v1, 0x1

    .line 32
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 36
    .line 37
    .line 38
    sget-object v2, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    .line 39
    .line 40
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 41
    .line 42
    .line 43
    iget-object v2, p2, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 44
    .line 45
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLivePk;->players:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    if-eqz v3, :cond_4

    .line 56
    .line 57
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 62
    .line 63
    iget-object v4, v3, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userId:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUserId()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 70
    .line 71
    .line 72
    move-result v4

    .line 73
    if-eqz v4, :cond_1

    .line 74
    .line 75
    iget-object v4, p0, Ll/t880;->d:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 76
    .line 77
    iget-object v5, p0, Ll/t880;->b:Lv/VDraweeView;

    .line 78
    .line 79
    const-string v6, "https://auto.tancdn.com/v1/raw/cb1473f4-4a7f-49b0-b647-a27c399b0b6812.svga"

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_1
    iget-object v4, p0, Ll/t880;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 83
    .line 84
    iget-object v5, p0, Ll/t880;->a:Lv/VDraweeView;

    .line 85
    .line 86
    const-string v6, "https://auto.tancdn.com/v1/raw/bc8d8741-7c1f-440a-b36b-102378b383b113.svga"

    .line 87
    .line 88
    :goto_1
    iget-object v7, v3, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->rankInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRankInfo;

    .line 89
    .line 90
    iget-object v7, v7, Lcom/p1/mobile/putong/live/base/data/BLiveRankInfo;->rankImage:Ljava/lang/String;

    .line 91
    .line 92
    new-instance v8, Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 93
    .line 94
    invoke-direct {v8}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;-><init>()V

    .line 95
    .line 96
    .line 97
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->rankInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRankInfo;

    .line 98
    .line 99
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveRankInfo;->rankName:Ljava/lang/String;

    .line 100
    .line 101
    const-string v9, "text01"

    .line 102
    .line 103
    invoke-virtual {v8, v3, v0, v9}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setDynamicText(Ljava/lang/String;Landroid/text/TextPaint;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    if-nez v3, :cond_3

    .line 111
    .line 112
    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    const-string v9, "http"

    .line 117
    .line 118
    invoke-virtual {v3, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 119
    .line 120
    .line 121
    move-result v3

    .line 122
    if-nez v3, :cond_2

    .line 123
    .line 124
    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    const-string v9, "https"

    .line 129
    .line 130
    invoke-virtual {v3, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 131
    .line 132
    .line 133
    move-result v3

    .line 134
    if-eqz v3, :cond_3

    .line 135
    .line 136
    :cond_2
    const-string v3, "badge"

    .line 137
    .line 138
    invoke-virtual {v8, v7, v3}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setDynamicImage(Ljava/lang/String;Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    :cond_3
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 142
    .line 143
    .line 144
    move-result-object v3

    .line 145
    invoke-static {v3}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 146
    .line 147
    .line 148
    move-result-object v3

    .line 149
    invoke-virtual {v3, v6}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 150
    .line 151
    .line 152
    move-result-object v3

    .line 153
    invoke-virtual {v3, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 154
    .line 155
    .line 156
    move-result-object v3

    .line 157
    invoke-virtual {v3, v8}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->dynamic(Lcom/tantan/library/svga/compose/SVGADynamicEntity;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 158
    .line 159
    .line 160
    move-result-object v3

    .line 161
    invoke-virtual {v3, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 162
    .line 163
    .line 164
    move-result-object v3

    .line 165
    new-instance v6, Ll/s880;

    .line 166
    .line 167
    invoke-direct {v6, v5, v7, p3}, Ll/s880;-><init>(Lv/VDraweeView;Ljava/lang/String;Ll/x20;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {p0, v4, v6}, Ll/t880;->c(Landroid/view/View;Ll/x20;)Lcom/tantan/library/svga/AnimListener;

    .line 171
    .line 172
    .line 173
    move-result-object v5

    .line 174
    invoke-virtual {v3, v5}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 175
    .line 176
    .line 177
    move-result-object v3

    .line 178
    invoke-virtual {v3, v4}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 179
    .line 180
    .line 181
    goto/16 :goto_0

    .line 182
    .line 183
    :cond_4
    :goto_2
    return-void
.end method

.method public f(Ll/sx70;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;ZLcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;)V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/t880;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_3

    .line 6
    .line 7
    :cond_0
    new-instance v0, Landroid/text/TextPaint;

    .line 8
    .line 9
    invoke-direct {v0}, Landroid/text/TextPaint;-><init>()V

    .line 10
    .line 11
    .line 12
    const/high16 v1, 0x41100000    # 9.0f

    .line 13
    .line 14
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    int-to-float v1, v1

    .line 19
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 20
    .line 21
    .line 22
    const/4 v1, -0x1

    .line 23
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 24
    .line 25
    .line 26
    const/4 v2, 0x1

    .line 27
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 28
    .line 29
    .line 30
    sget-object v3, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    .line 31
    .line 32
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 33
    .line 34
    .line 35
    new-instance v4, Landroid/text/TextPaint;

    .line 36
    .line 37
    invoke-direct {v4}, Landroid/text/TextPaint;-><init>()V

    .line 38
    .line 39
    .line 40
    sget v5, Ll/qa00;->i:I

    .line 41
    .line 42
    int-to-float v5, v5

    .line 43
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v4, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v4, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v4, v3}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 53
    .line 54
    .line 55
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 56
    .line 57
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->players:Ljava/util/List;

    .line 58
    .line 59
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    if-eqz v3, :cond_6

    .line 68
    .line 69
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 74
    .line 75
    iget-object v5, v3, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userId:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUserId()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v6

    .line 81
    invoke-static {v5, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 82
    .line 83
    .line 84
    move-result v5

    .line 85
    const-string v6, "https://auto.tancdn.com/v1/raw/065fef8c-1ea2-4565-9044-1547878f9b8412.svga"

    .line 86
    .line 87
    const-string v7, "https://auto.tancdn.com/v1/raw/1ee67d2a-f2f2-4710-bb3a-088f40587b3113.svga"

    .line 88
    .line 89
    if-eqz v5, :cond_3

    .line 90
    .line 91
    if-eqz p3, :cond_1

    .line 92
    .line 93
    move-object v6, v7

    .line 94
    :cond_1
    iget-object v5, p2, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 95
    .line 96
    iget-object v5, v5, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 97
    .line 98
    iget-boolean v5, v5, Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;->isTied:Z

    .line 99
    .line 100
    if-eqz v5, :cond_2

    .line 101
    .line 102
    const-string v6, "https://auto.tancdn.com/v1/raw/a350d65b-c31e-4d22-bc0a-f90446e2aac613.svga"

    .line 103
    .line 104
    :cond_2
    iget-object v5, p0, Ll/t880;->d:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_3
    if-eqz p3, :cond_4

    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_4
    move-object v6, v7

    .line 111
    :goto_1
    iget-object v5, p2, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 112
    .line 113
    iget-object v5, v5, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 114
    .line 115
    iget-boolean v5, v5, Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;->isTied:Z

    .line 116
    .line 117
    if-eqz v5, :cond_5

    .line 118
    .line 119
    const-string v5, "https://auto.tancdn.com/v1/raw/66c805a2-b2c6-4be0-82b5-e02e8f7c6dcc13.svga"

    .line 120
    .line 121
    move-object v6, v5

    .line 122
    :cond_5
    iget-object v5, p0, Ll/t880;->c:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 123
    .line 124
    :goto_2
    new-instance v7, Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 125
    .line 126
    invoke-direct {v7}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;-><init>()V

    .line 127
    .line 128
    .line 129
    iget-object v8, v3, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->rankWinTimesDesc:Ljava/lang/String;

    .line 130
    .line 131
    const-string v9, "text01"

    .line 132
    .line 133
    invoke-virtual {v7, v8, v0, v9}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setDynamicText(Ljava/lang/String;Landroid/text/TextPaint;Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->rankAmount:Ljava/lang/String;

    .line 137
    .line 138
    const-string v8, "text02"

    .line 139
    .line 140
    invoke-virtual {v7, v3, v4, v8}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setDynamicText(Ljava/lang/String;Landroid/text/TextPaint;Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    invoke-static {v3}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 148
    .line 149
    .line 150
    move-result-object v3

    .line 151
    invoke-virtual {v3, v6}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    invoke-virtual {v3, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 156
    .line 157
    .line 158
    move-result-object v3

    .line 159
    invoke-virtual {v3, v7}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->dynamic(Lcom/tantan/library/svga/compose/SVGADynamicEntity;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 160
    .line 161
    .line 162
    move-result-object v3

    .line 163
    invoke-virtual {v3, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 164
    .line 165
    .line 166
    move-result-object v3

    .line 167
    new-instance v6, Ll/r880;

    .line 168
    .line 169
    invoke-direct {v6, p4, p2}, Ll/r880;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/internal/PkViewInternal;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {p0, v5, v6}, Ll/t880;->c(Landroid/view/View;Ll/x20;)Lcom/tantan/library/svga/AnimListener;

    .line 173
    .line 174
    .line 175
    move-result-object v6

    .line 176
    invoke-virtual {v3, v6}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 177
    .line 178
    .line 179
    move-result-object v3

    .line 180
    invoke-virtual {v3, v5}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 181
    .line 182
    .line 183
    goto :goto_0

    .line 184
    :cond_6
    :goto_3
    return-void
.end method
