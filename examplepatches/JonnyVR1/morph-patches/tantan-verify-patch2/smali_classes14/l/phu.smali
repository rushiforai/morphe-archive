.class public Ll/phu;
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

.method public static a(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;Landroid/view/View;)V
    .locals 5

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;

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
    check-cast v1, Lv/VImage;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->b:Lv/VImage;

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
    check-cast v2, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 23
    .line 24
    iput-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 25
    .line 26
    const/4 v2, 0x2

    .line 27
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Lv/VDraweeView;

    .line 32
    .line 33
    iput-object v3, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->d:Lv/VDraweeView;

    .line 34
    .line 35
    const/4 v3, 0x3

    .line 36
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    check-cast v3, Lv/VImage;

    .line 41
    .line 42
    iput-object v3, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->e:Lv/VImage;

    .line 43
    .line 44
    const/4 v3, 0x4

    .line 45
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    check-cast v4, Lv/VLinear;

    .line 50
    .line 51
    iput-object v4, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->f:Lv/VLinear;

    .line 52
    .line 53
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    check-cast v4, Landroid/view/ViewGroup;

    .line 58
    .line 59
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    check-cast v4, Lv/VText;

    .line 64
    .line 65
    iput-object v4, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->g:Lv/VText;

    .line 66
    .line 67
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    check-cast v4, Landroid/view/ViewGroup;

    .line 72
    .line 73
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    check-cast v4, Lv/VLinear;

    .line 78
    .line 79
    iput-object v4, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->h:Lv/VLinear;

    .line 80
    .line 81
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    check-cast v4, Landroid/view/ViewGroup;

    .line 86
    .line 87
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    check-cast v4, Landroid/view/ViewGroup;

    .line 92
    .line 93
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    check-cast v4, Lv/VText;

    .line 98
    .line 99
    iput-object v4, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->i:Lv/VText;

    .line 100
    .line 101
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    check-cast v3, Landroid/view/ViewGroup;

    .line 106
    .line 107
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    check-cast v2, Landroid/widget/TextView;

    .line 112
    .line 113
    iput-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->j:Landroid/widget/TextView;

    .line 114
    .line 115
    const/4 v2, 0x5

    .line 116
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    check-cast v3, Landroid/view/ViewGroup;

    .line 121
    .line 122
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    check-cast v3, Lv/VFrame;

    .line 127
    .line 128
    iput-object v3, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->k:Lv/VFrame;

    .line 129
    .line 130
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    check-cast v2, Landroid/view/ViewGroup;

    .line 135
    .line 136
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    check-cast v2, Landroid/view/ViewGroup;

    .line 141
    .line 142
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    check-cast v2, Lv/VImage;

    .line 147
    .line 148
    iput-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->l:Lv/VImage;

    .line 149
    .line 150
    const/4 v2, 0x6

    .line 151
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    check-cast v3, Lv/VRelative;

    .line 156
    .line 157
    iput-object v3, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->m:Lv/VRelative;

    .line 158
    .line 159
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 160
    .line 161
    .line 162
    move-result-object v3

    .line 163
    check-cast v3, Landroid/view/ViewGroup;

    .line 164
    .line 165
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    check-cast v0, Lv/VText;

    .line 170
    .line 171
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->n:Lv/VText;

    .line 172
    .line 173
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    check-cast p1, Landroid/view/ViewGroup;

    .line 178
    .line 179
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    check-cast p1, Lv/VText;

    .line 184
    .line 185
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->o:Lv/VText;

    .line 186
    .line 187
    return-void
.end method
