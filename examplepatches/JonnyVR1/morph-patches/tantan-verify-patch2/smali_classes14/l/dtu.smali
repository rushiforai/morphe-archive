.class public Ll/dtu;
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

.method public static a(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;Landroid/view/View;)V
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
    check-cast v1, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;

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
    check-cast v2, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;

    .line 18
    .line 19
    iput-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;

    .line 20
    .line 21
    const/4 v2, 0x2

    .line 22
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    check-cast v3, Landroid/view/ViewGroup;

    .line 27
    .line 28
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatInfoView;

    .line 33
    .line 34
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;->c:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatInfoView;

    .line 35
    .line 36
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Landroid/view/ViewGroup;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;

    .line 47
    .line 48
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;->d:Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;

    .line 49
    .line 50
    const/4 v0, 0x3

    .line 51
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatMessageView;

    .line 56
    .line 57
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;->e:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatMessageView;

    .line 58
    .line 59
    const/4 v0, 0x4

    .line 60
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;

    .line 65
    .line 66
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;->f:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;

    .line 67
    .line 68
    const/4 v0, 0x5

    .line 69
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;

    .line 74
    .line 75
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;

    .line 76
    .line 77
    const/4 v0, 0x6

    .line 78
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;->h:Landroid/view/View;

    .line 83
    .line 84
    const/4 v0, 0x7

    .line 85
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatWaitingOrderView;

    .line 90
    .line 91
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;->i:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatWaitingOrderView;

    .line 92
    .line 93
    const/16 v0, 0x8

    .line 94
    .line 95
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;

    .line 100
    .line 101
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;->j:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;

    .line 102
    .line 103
    const/16 v0, 0x9

    .line 104
    .line 105
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    check-cast v0, Lv/VImage;

    .line 110
    .line 111
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;->k:Lv/VImage;

    .line 112
    .line 113
    const/16 v0, 0xa

    .line 114
    .line 115
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;

    .line 120
    .line 121
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;->l:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;

    .line 122
    .line 123
    const/16 v0, 0xb

    .line 124
    .line 125
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    check-cast p1, Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;

    .line 130
    .line 131
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;->m:Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;

    .line 132
    .line 133
    return-void
.end method
