.class public Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkCreateItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Lv/VImage;

.field public f:Lv/VImage;

.field public g:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h0(Ll/y20;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final i0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/mm10;->a(Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkCreateItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j0(Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanelUser;ILl/y20;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanelUser;",
            "I",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkCreateItemView;->d:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/wlj;

    .line 8
    .line 9
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanelUser;->picked:Z

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkCreateItemView;->d:Lv/VDraweeView;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    sget v2, Ll/n9c0;->P:I

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ll/wlj;->C(Landroid/graphics/drawable/Drawable;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/4 v1, 0x0

    .line 30
    invoke-virtual {v0, v1}, Ll/wlj;->C(Landroid/graphics/drawable/Drawable;)V

    .line 31
    .line 32
    .line 33
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanelUser;->id:Ljava/lang/String;

    .line 34
    .line 35
    const-string v1, "-1"

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkCreateItemView;->g:Lv/VText;

    .line 42
    .line 43
    const/16 v2, 0x8

    .line 44
    .line 45
    if-nez v0, :cond_4

    .line 46
    .line 47
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanelUser;->name:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkCreateItemView;->d:Lv/VDraweeView;

    .line 53
    .line 54
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanelUser;->avatar:Ljava/lang/String;

    .line 55
    .line 56
    const-string v3, "context_single_room"

    .line 57
    .line 58
    invoke-static {v3, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkCreateItemView;->f:Lv/VImage;

    .line 62
    .line 63
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanelUser;->role:Ljava/lang/String;

    .line 64
    .line 65
    const-string v3, "spectator"

    .line 66
    .line 67
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    const/4 v3, 0x0

    .line 72
    if-nez v1, :cond_2

    .line 73
    .line 74
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanelUser;->picked:Z

    .line 75
    .line 76
    if-nez v1, :cond_1

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_1
    move v1, v2

    .line 80
    goto :goto_2

    .line 81
    :cond_2
    :goto_1
    move v1, v3

    .line 82
    :goto_2
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkCreateItemView;->e:Lv/VImage;

    .line 86
    .line 87
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiPkPanelUser;->picked:Z

    .line 88
    .line 89
    if-eqz p1, :cond_3

    .line 90
    .line 91
    move v2, v3

    .line 92
    :cond_3
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkCreateItemView;->g:Lv/VText;

    .line 96
    .line 97
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    sget v1, Ll/n9c0;->o1:I

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 108
    .line 109
    .line 110
    goto :goto_3

    .line 111
    :cond_4
    const-string p1, "\u5f85\u9080\u8bf7"

    .line 112
    .line 113
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    .line 115
    .line 116
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkCreateItemView;->g:Lv/VText;

    .line 117
    .line 118
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    sget v1, Ll/n9c0;->j1:I

    .line 123
    .line 124
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 129
    .line 130
    .line 131
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkCreateItemView;->d:Lv/VDraweeView;

    .line 132
    .line 133
    sget v0, Ll/obc0;->k6:I

    .line 134
    .line 135
    invoke-virtual {p1, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setActualImageResource(I)V

    .line 136
    .line 137
    .line 138
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkCreateItemView;->e:Lv/VImage;

    .line 139
    .line 140
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 141
    .line 142
    .line 143
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkCreateItemView;->f:Lv/VImage;

    .line 144
    .line 145
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 146
    .line 147
    .line 148
    :goto_3
    new-instance p1, Ll/lm10;

    .line 149
    .line 150
    invoke-direct {p1, p3, p2}, Ll/lm10;-><init>(Ll/y20;I)V

    .line 151
    .line 152
    .line 153
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 154
    .line 155
    .line 156
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiPk/dialog/view/MultiCallPkCreateItemView;->i0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
