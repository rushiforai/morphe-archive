.class public Ll/hc1;
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

.method public static a(Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;Landroid/view/View;)V
    .locals 5

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->a:Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;

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
    check-cast v1, Landroid/view/ViewGroup;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lv/VDraweeView;

    .line 20
    .line 21
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->b:Lv/VDraweeView;

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Lv/VText;

    .line 29
    .line 30
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->c:Lv/VText;

    .line 31
    .line 32
    const/4 v2, 0x2

    .line 33
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    check-cast v3, Lv/VText;

    .line 38
    .line 39
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->d:Lv/VText;

    .line 40
    .line 41
    const/4 v3, 0x4

    .line 42
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    check-cast v4, Landroid/view/ViewGroup;

    .line 47
    .line 48
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    iput-object v4, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->e:Landroid/view/View;

    .line 53
    .line 54
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    check-cast v4, Landroid/view/ViewGroup;

    .line 59
    .line 60
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    check-cast v4, Landroid/widget/RelativeLayout;

    .line 65
    .line 66
    iput-object v4, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->f:Landroid/widget/RelativeLayout;

    .line 67
    .line 68
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    check-cast v4, Landroid/view/ViewGroup;

    .line 73
    .line 74
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    check-cast v1, Landroid/view/ViewGroup;

    .line 79
    .line 80
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    check-cast v1, Lv/VText;

    .line 85
    .line 86
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->g:Lv/VText;

    .line 87
    .line 88
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    check-cast v1, Landroid/view/ViewGroup;

    .line 93
    .line 94
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    check-cast v1, Landroid/widget/RelativeLayout;

    .line 99
    .line 100
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->h:Landroid/widget/RelativeLayout;

    .line 101
    .line 102
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    check-cast v1, Landroid/view/ViewGroup;

    .line 107
    .line 108
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    check-cast v1, Landroid/view/ViewGroup;

    .line 113
    .line 114
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    check-cast v1, Lv/VText;

    .line 119
    .line 120
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->i:Lv/VText;

    .line 121
    .line 122
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    check-cast v1, Landroid/view/ViewGroup;

    .line 127
    .line 128
    const/4 v2, 0x3

    .line 129
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    check-cast v1, Landroid/widget/RelativeLayout;

    .line 134
    .line 135
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->j:Landroid/widget/RelativeLayout;

    .line 136
    .line 137
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    check-cast v1, Landroid/view/ViewGroup;

    .line 142
    .line 143
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    check-cast v1, Landroid/view/ViewGroup;

    .line 148
    .line 149
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    check-cast v1, Lv/VText;

    .line 154
    .line 155
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->k:Lv/VText;

    .line 156
    .line 157
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    check-cast v1, Landroid/view/ViewGroup;

    .line 162
    .line 163
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    check-cast v1, Landroid/widget/RelativeLayout;

    .line 168
    .line 169
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->l:Landroid/widget/RelativeLayout;

    .line 170
    .line 171
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    check-cast p1, Landroid/view/ViewGroup;

    .line 176
    .line 177
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    check-cast p1, Landroid/view/ViewGroup;

    .line 182
    .line 183
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 184
    .line 185
    .line 186
    move-result-object p1

    .line 187
    check-cast p1, Lv/VText;

    .line 188
    .line 189
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->m:Lv/VText;

    .line 190
    .line 191
    return-void
.end method
