.class public Ll/fk6;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;Landroid/view/View;)V
    .locals 5

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->d:Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;

    .line 5
    .line 6
    check-cast p1, Landroid/view/ViewGroup;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Lv/VFrame;

    .line 23
    .line 24
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->f:Lv/VFrame;

    .line 25
    .line 26
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Landroid/view/ViewGroup;

    .line 31
    .line 32
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Lv/VRelative;

    .line 37
    .line 38
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->g:Lv/VRelative;

    .line 39
    .line 40
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    check-cast v2, Landroid/view/ViewGroup;

    .line 45
    .line 46
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    check-cast v2, Landroid/view/ViewGroup;

    .line 51
    .line 52
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    check-cast v2, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;

    .line 57
    .line 58
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->h:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;

    .line 59
    .line 60
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    check-cast v2, Landroid/view/ViewGroup;

    .line 65
    .line 66
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    check-cast v2, Landroid/view/ViewGroup;

    .line 71
    .line 72
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    check-cast v2, Lv/VDraweeView;

    .line 77
    .line 78
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->i:Lv/VDraweeView;

    .line 79
    .line 80
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    check-cast v2, Landroid/view/ViewGroup;

    .line 85
    .line 86
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    check-cast v2, Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 91
    .line 92
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->j:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 93
    .line 94
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    check-cast v2, Landroid/view/ViewGroup;

    .line 99
    .line 100
    const/4 v3, 0x2

    .line 101
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    check-cast v2, Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 106
    .line 107
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->k:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 108
    .line 109
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    check-cast v2, Landroid/view/ViewGroup;

    .line 114
    .line 115
    const/4 v4, 0x3

    .line 116
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    check-cast v2, Lv/VImage;

    .line 121
    .line 122
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->l:Lv/VImage;

    .line 123
    .line 124
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    check-cast v2, Landroid/view/ViewGroup;

    .line 129
    .line 130
    const/4 v4, 0x4

    .line 131
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    check-cast v2, Lv/VImage;

    .line 136
    .line 137
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->m:Lv/VImage;

    .line 138
    .line 139
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    check-cast v2, Landroid/view/ViewGroup;

    .line 144
    .line 145
    const/4 v4, 0x5

    .line 146
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    check-cast v2, Lv/VFrame;

    .line 151
    .line 152
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->n:Lv/VFrame;

    .line 153
    .line 154
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    check-cast v2, Landroid/view/ViewGroup;

    .line 159
    .line 160
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    check-cast v2, Landroid/view/ViewGroup;

    .line 165
    .line 166
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    check-cast v0, Lv/VImage;

    .line 171
    .line 172
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->o:Lv/VImage;

    .line 173
    .line 174
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    check-cast v0, Landroid/view/ViewGroup;

    .line 179
    .line 180
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    check-cast v0, Landroid/view/ViewGroup;

    .line 185
    .line 186
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    check-cast v0, Lv/VText;

    .line 191
    .line 192
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->p:Lv/VText;

    .line 193
    .line 194
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    check-cast p1, Lv/VText;

    .line 199
    .line 200
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationRecommendItemView;->q:Lv/VText;

    .line 201
    .line 202
    return-void
.end method
