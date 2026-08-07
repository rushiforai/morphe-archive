.class public Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestItemView;
.super Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkAnchorItemView;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/TextView;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkAnchorItemView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkAnchorItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkAnchorItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/oa80;->a(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;Ll/z20;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestItemView;->e:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1, p3, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkAnchorItemView;->c(Landroid/widget/TextView;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;Ll/z20;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;)V

    .line 4
    .line 5
    .line 6
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestItemView;->a:Lv/VDraweeView;

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestItemView;->b:Landroid/widget/TextView;

    .line 9
    .line 10
    invoke-virtual {p0, p3, v0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkAnchorItemView;->b(Lv/VDraweeView;Landroid/widget/TextView;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;)V

    .line 11
    .line 12
    .line 13
    iget-object p3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->queryUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestItemView;->c:Landroid/widget/TextView;

    .line 20
    .line 21
    iget-object v1, p3, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 22
    .line 23
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestItemView;->c:Landroid/widget/TextView;

    .line 31
    .line 32
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    sget v1, Ll/obc0;->h0:I

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    sget v1, Ll/obc0;->H:I

    .line 42
    .line 43
    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_1

    .line 55
    .line 56
    sget v1, Ll/obc0;->Ja:I

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_1
    sget v1, Ll/obc0;->Ka:I

    .line 60
    .line 61
    :goto_1
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestItemView;->c:Landroid/widget/TextView;

    .line 66
    .line 67
    const/4 v2, 0x0

    .line 68
    invoke-virtual {v1, v0, v2, v2, v2}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p3, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 72
    .line 73
    iget v1, v0, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 74
    .line 75
    const v2, 0x186a0

    .line 76
    .line 77
    .line 78
    if-lt v1, v2, :cond_3

    .line 79
    .line 80
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 81
    .line 82
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 83
    .line 84
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    iget-object p3, p3, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 89
    .line 90
    if-nez v0, :cond_2

    .line 91
    .line 92
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 93
    .line 94
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 95
    .line 96
    goto :goto_2

    .line 97
    :cond_2
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 98
    .line 99
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Region;->country:Ljava/lang/String;

    .line 100
    .line 101
    goto :goto_2

    .line 102
    :cond_3
    const/4 p3, 0x0

    .line 103
    invoke-static {v1, p3}, Ll/q8g0;->p(IZ)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p3

    .line 107
    :goto_2
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;->id:Ljava/lang/String;

    .line 108
    .line 109
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;->queryLiveById(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    new-instance p2, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 116
    .line 117
    .line 118
    sget-object v0, Ll/htd0;->f:Ll/htd0;

    .line 119
    .line 120
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    check-cast v0, Ll/civ;

    .line 125
    .line 126
    invoke-virtual {v0}, Ll/civ;->n()Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    if-eqz v0, :cond_4

    .line 131
    .line 132
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 133
    .line 134
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->z3:I

    .line 135
    .line 136
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    goto :goto_3

    .line 141
    :cond_4
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 142
    .line 143
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->y3:I

    .line 144
    .line 145
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    :goto_3
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->memberCount:D

    .line 150
    .line 151
    invoke-static {v1, v2}, Ll/yau;->c(D)Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    iget-wide v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->rewardPoint:D

    .line 156
    .line 157
    invoke-static {v2, v3}, Ll/yau;->c(D)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    filled-new-array {v1, p1}, [Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    const-string p3, ", "

    .line 173
    .line 174
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestItemView;->d:Landroid/widget/TextView;

    .line 181
    .line 182
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 187
    .line 188
    .line 189
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestItemView;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
