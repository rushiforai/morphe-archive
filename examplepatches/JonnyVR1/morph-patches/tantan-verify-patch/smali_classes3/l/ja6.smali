.class public Ll/ja6;
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

.method public static a(Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;Landroid/view/View;)V
    .locals 6

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->a:Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;

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
    check-cast v1, Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->b:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

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
    check-cast v2, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 23
    .line 24
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->c:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

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
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->d:Landroid/view/View;

    .line 32
    .line 33
    const/4 v3, 0x3

    .line 34
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    iput-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->e:Landroid/view/View;

    .line 39
    .line 40
    const/4 v4, 0x4

    .line 41
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    iput-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->f:Landroid/view/View;

    .line 46
    .line 47
    const/4 v4, 0x5

    .line 48
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    check-cast v4, Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;

    .line 53
    .line 54
    iput-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->g:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;

    .line 55
    .line 56
    const/4 v4, 0x6

    .line 57
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    check-cast v5, Landroid/widget/FrameLayout;

    .line 62
    .line 63
    iput-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->h:Landroid/widget/FrameLayout;

    .line 64
    .line 65
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    check-cast v5, Landroid/view/ViewGroup;

    .line 70
    .line 71
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    check-cast v5, Lv/VImage;

    .line 76
    .line 77
    iput-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->i:Lv/VImage;

    .line 78
    .line 79
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    check-cast v5, Landroid/view/ViewGroup;

    .line 84
    .line 85
    invoke-virtual {v5, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    check-cast v1, Lv/VImage;

    .line 90
    .line 91
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->j:Lv/VImage;

    .line 92
    .line 93
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    check-cast v1, Landroid/view/ViewGroup;

    .line 98
    .line 99
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    check-cast v1, Lv/VImage;

    .line 104
    .line 105
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->k:Lv/VImage;

    .line 106
    .line 107
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    check-cast v1, Landroid/view/ViewGroup;

    .line 112
    .line 113
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    check-cast v1, Lv/VDraweeView;

    .line 118
    .line 119
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->l:Lv/VDraweeView;

    .line 120
    .line 121
    const/4 v1, 0x7

    .line 122
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    check-cast v1, Lv/VImage;

    .line 127
    .line 128
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->m:Lv/VImage;

    .line 129
    .line 130
    const/16 v1, 0x8

    .line 131
    .line 132
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    check-cast v1, Lv/VImage;

    .line 137
    .line 138
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->n:Lv/VImage;

    .line 139
    .line 140
    const/16 v1, 0x9

    .line 141
    .line 142
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    check-cast v2, Landroid/widget/FrameLayout;

    .line 147
    .line 148
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->o:Landroid/widget/FrameLayout;

    .line 149
    .line 150
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    check-cast p1, Landroid/view/ViewGroup;

    .line 155
    .line 156
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    check-cast p1, Lv/VText;

    .line 161
    .line 162
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/itemview/ConversationItemHeadView;->p:Lv/VText;

    .line 163
    .line 164
    return-void
.end method
