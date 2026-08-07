.class public Ll/qj6;
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

.method public static a(Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;Landroid/view/View;)V
    .locals 4

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;

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
    check-cast v1, Lv/VDraweeView;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->b:Lv/VDraweeView;

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
    check-cast v2, Landroid/view/ViewGroup;

    .line 23
    .line 24
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Lcom/p1/mobile/android/ui/label/CommonLabelView;

    .line 29
    .line 30
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->c:Lcom/p1/mobile/android/ui/label/CommonLabelView;

    .line 31
    .line 32
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Landroid/view/ViewGroup;

    .line 37
    .line 38
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    check-cast v2, Lcom/p1/mobile/android/ui/label/CommonLabelView;

    .line 43
    .line 44
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->d:Lcom/p1/mobile/android/ui/label/CommonLabelView;

    .line 45
    .line 46
    const/4 v2, 0x2

    .line 47
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    check-cast v3, Landroid/widget/FrameLayout;

    .line 52
    .line 53
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->e:Landroid/widget/FrameLayout;

    .line 54
    .line 55
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    check-cast v3, Landroid/view/ViewGroup;

    .line 60
    .line 61
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->f:Landroid/view/View;

    .line 66
    .line 67
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    check-cast v3, Landroid/view/ViewGroup;

    .line 72
    .line 73
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    check-cast v3, Lv/VImage;

    .line 78
    .line 79
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->g:Lv/VImage;

    .line 80
    .line 81
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    check-cast v3, Landroid/view/ViewGroup;

    .line 86
    .line 87
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    check-cast v3, Lv/VLinear;

    .line 92
    .line 93
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->h:Lv/VLinear;

    .line 94
    .line 95
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    check-cast v3, Landroid/view/ViewGroup;

    .line 100
    .line 101
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    check-cast v3, Landroid/view/ViewGroup;

    .line 106
    .line 107
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    check-cast v3, Landroid/view/ViewGroup;

    .line 112
    .line 113
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    check-cast v3, Lv/VText;

    .line 118
    .line 119
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->i:Lv/VText;

    .line 120
    .line 121
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    check-cast v3, Landroid/view/ViewGroup;

    .line 126
    .line 127
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    check-cast v3, Landroid/view/ViewGroup;

    .line 132
    .line 133
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    check-cast v0, Landroid/view/ViewGroup;

    .line 138
    .line 139
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    check-cast v0, Lv/VText;

    .line 144
    .line 145
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->j:Lv/VText;

    .line 146
    .line 147
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    check-cast v0, Landroid/view/ViewGroup;

    .line 152
    .line 153
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    check-cast v0, Landroid/view/ViewGroup;

    .line 158
    .line 159
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    check-cast v0, Lv/VText;

    .line 164
    .line 165
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->k:Lv/VText;

    .line 166
    .line 167
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    check-cast v0, Landroid/view/ViewGroup;

    .line 172
    .line 173
    const/4 v1, 0x3

    .line 174
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/RoundedCornerView;

    .line 179
    .line 180
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->l:Lcom/p1/mobile/putong/core/newui/messages/RoundedCornerView;

    .line 181
    .line 182
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    check-cast v0, Landroid/view/ViewGroup;

    .line 187
    .line 188
    const/4 v1, 0x4

    .line 189
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->m:Landroid/view/View;

    .line 194
    .line 195
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    check-cast p1, Landroid/view/ViewGroup;

    .line 200
    .line 201
    const/4 v0, 0x5

    .line 202
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    check-cast p1, Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 207
    .line 208
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationNewMatchItem;->n:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 209
    .line 210
    return-void
.end method
