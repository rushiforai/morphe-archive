.class public Ll/ff6;
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

.method public static a(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;Landroid/view/View;)V
    .locals 4

    .line 1
    check-cast p1, Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    check-cast v1, Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->d:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lcom/p1/mobile/putong/ui/MultipleChatIconView;

    .line 18
    .line 19
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->e:Lcom/p1/mobile/putong/ui/MultipleChatIconView;

    .line 20
    .line 21
    const/4 v2, 0x2

    .line 22
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Lv/VImage;

    .line 27
    .line 28
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->f:Lv/VImage;

    .line 29
    .line 30
    const/4 v2, 0x3

    .line 31
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    check-cast v3, Landroid/widget/FrameLayout;

    .line 36
    .line 37
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->g:Landroid/widget/FrameLayout;

    .line 38
    .line 39
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    check-cast v2, Landroid/view/ViewGroup;

    .line 44
    .line 45
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    check-cast v2, Lv/VText;

    .line 50
    .line 51
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->h:Lv/VText;

    .line 52
    .line 53
    const/4 v2, 0x4

    .line 54
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    check-cast v2, Landroid/widget/TextView;

    .line 59
    .line 60
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->i:Landroid/widget/TextView;

    .line 61
    .line 62
    const/4 v2, 0x5

    .line 63
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    check-cast v2, Lv/VText;

    .line 68
    .line 69
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->j:Lv/VText;

    .line 70
    .line 71
    const/4 v2, 0x6

    .line 72
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    check-cast v3, Lv/VLinear;

    .line 77
    .line 78
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->k:Lv/VLinear;

    .line 79
    .line 80
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    check-cast v3, Landroid/view/ViewGroup;

    .line 85
    .line 86
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    check-cast v3, Lv/VText;

    .line 91
    .line 92
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->l:Lv/VText;

    .line 93
    .line 94
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    check-cast v3, Landroid/view/ViewGroup;

    .line 99
    .line 100
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    check-cast v3, Landroid/view/ViewGroup;

    .line 105
    .line 106
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    check-cast v0, Lv/VImage;

    .line 111
    .line 112
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->m:Lv/VImage;

    .line 113
    .line 114
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    check-cast v0, Landroid/view/ViewGroup;

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    check-cast v0, Landroid/view/ViewGroup;

    .line 125
    .line 126
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    check-cast v0, Lv/VText;

    .line 131
    .line 132
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->n:Lv/VText;

    .line 133
    .line 134
    const/4 v0, 0x7

    .line 135
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    check-cast p1, Lv/VText;

    .line 140
    .line 141
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemVirtualVoiceGroupView;->o:Lv/VText;

    .line 142
    .line 143
    return-void
.end method
