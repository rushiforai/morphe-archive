.class public Lcom/p1/mobile/putong/core/newui/discovery/SuggestTabItem;
.super Lv/VRelative;
.source "SourceFile"


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Lv/VDraweeView;

.field public f:Lv/VText;

.field public g:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VRelative;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/discovery/SuggestTabItem;->p(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/c2h0;->a(Lcom/p1/mobile/putong/core/newui/discovery/SuggestTabItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public q(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/SuggestTabItem;->f:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    sget v2, Ll/c9c0;->b:I

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/SuggestTabItem;->e:Lv/VDraweeView;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/discovery/SuggestTabItem;->d:Lv/VDraweeView;

    .line 25
    .line 26
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/discovery/SuggestTabItem;->g:Landroid/view/View;

    .line 30
    .line 31
    const/4 p1, 0x1

    .line 32
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public z(Lcom/p1/mobile/putong/core/data/GPTopicCard;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/SuggestTabItem;->g:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/SuggestTabItem;->e:Lv/VDraweeView;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_4

    .line 18
    .line 19
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GPTopicCard;->pictures:Ljava/util/List;

    .line 20
    .line 21
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    goto/16 :goto_1

    .line 28
    .line 29
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GPTopicCard;->pictures:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/GPTopicCard;->name:Ljava/lang/String;

    .line 36
    .line 37
    const/16 v4, 0x28

    .line 38
    .line 39
    const/4 v5, 0x2

    .line 40
    if-ne v0, v2, :cond_2

    .line 41
    .line 42
    invoke-static {v3}, Ll/ljj;->a(Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 49
    .line 50
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/discovery/SuggestTabItem;->e:Lv/VDraweeView;

    .line 51
    .line 52
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GPTopicCard;->pictures:Ljava/util/List;

    .line 53
    .line 54
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 59
    .line 60
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v0, v2, p1, v5, v4}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 67
    .line 68
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/discovery/SuggestTabItem;->e:Lv/VDraweeView;

    .line 69
    .line 70
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GPTopicCard;->pictures:Ljava/util/List;

    .line 71
    .line 72
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 77
    .line 78
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v0, v2, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    :goto_0
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 84
    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/SuggestTabItem;->d:Lv/VDraweeView;

    .line 86
    .line 87
    sget v1, Ll/dbc0;->gv:I

    .line 88
    .line 89
    invoke-virtual {p1, v0, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 90
    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_2
    invoke-static {v3}, Ll/ljj;->a(Ljava/lang/String;)Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-eqz v0, :cond_3

    .line 98
    .line 99
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 100
    .line 101
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/discovery/SuggestTabItem;->e:Lv/VDraweeView;

    .line 102
    .line 103
    iget-object v6, p1, Lcom/p1/mobile/putong/core/data/GPTopicCard;->pictures:Ljava/util/List;

    .line 104
    .line 105
    invoke-interface {v6, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 110
    .line 111
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 112
    .line 113
    invoke-virtual {v0, v3, v1, v5, v4}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 114
    .line 115
    .line 116
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 117
    .line 118
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/discovery/SuggestTabItem;->d:Lv/VDraweeView;

    .line 119
    .line 120
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GPTopicCard;->pictures:Ljava/util/List;

    .line 121
    .line 122
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 127
    .line 128
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 129
    .line 130
    invoke-virtual {v0, v1, p1, v5, v4}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 131
    .line 132
    .line 133
    goto :goto_2

    .line 134
    :cond_3
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 135
    .line 136
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/discovery/SuggestTabItem;->e:Lv/VDraweeView;

    .line 137
    .line 138
    iget-object v4, p1, Lcom/p1/mobile/putong/core/data/GPTopicCard;->pictures:Ljava/util/List;

    .line 139
    .line 140
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 145
    .line 146
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 147
    .line 148
    invoke-virtual {v0, v3, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 152
    .line 153
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/discovery/SuggestTabItem;->d:Lv/VDraweeView;

    .line 154
    .line 155
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GPTopicCard;->pictures:Ljava/util/List;

    .line 156
    .line 157
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 162
    .line 163
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 164
    .line 165
    invoke-virtual {v0, v1, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    goto :goto_2

    .line 169
    :cond_4
    :goto_1
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 170
    .line 171
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/SuggestTabItem;->e:Lv/VDraweeView;

    .line 172
    .line 173
    sget v1, Ll/dbc0;->gv:I

    .line 174
    .line 175
    invoke-virtual {p1, v0, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 176
    .line 177
    .line 178
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 179
    .line 180
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/discovery/SuggestTabItem;->d:Lv/VDraweeView;

    .line 181
    .line 182
    sget v1, Ll/dbc0;->gv:I

    .line 183
    .line 184
    invoke-virtual {p1, v0, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 185
    .line 186
    .line 187
    :goto_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/discovery/SuggestTabItem;->f:Lv/VText;

    .line 188
    .line 189
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    sget v0, Ll/c9c0;->s1:I

    .line 194
    .line 195
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 196
    .line 197
    .line 198
    move-result p0

    .line 199
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 200
    .line 201
    .line 202
    return-void
.end method
