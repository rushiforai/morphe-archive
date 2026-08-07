.class public Ll/bqj;
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

.method public static a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;Landroid/view/View;)V
    .locals 6

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
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->d:Landroid/view/View;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;

    .line 16
    .line 17
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;

    .line 18
    .line 19
    const/4 v1, 0x2

    .line 20
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Lv/VDraweeView;

    .line 25
    .line 26
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->f:Lv/VDraweeView;

    .line 27
    .line 28
    const/4 v2, 0x3

    .line 29
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    check-cast v3, Lv/VDraweeView;

    .line 34
    .line 35
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->g:Lv/VDraweeView;

    .line 36
    .line 37
    const/4 v3, 0x4

    .line 38
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    check-cast v4, Landroid/widget/Space;

    .line 43
    .line 44
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->h:Landroid/widget/Space;

    .line 45
    .line 46
    const/4 v4, 0x5

    .line 47
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    check-cast v5, Landroid/widget/LinearLayout;

    .line 52
    .line 53
    iput-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->i:Landroid/widget/LinearLayout;

    .line 54
    .line 55
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v5

    .line 59
    check-cast v5, Landroid/view/ViewGroup;

    .line 60
    .line 61
    invoke-virtual {v5, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/receivegift/ReceiveGiftUsersView;

    .line 66
    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->j:Lcom/p1/mobile/putong/live/livingroom/increment/gift/receivegift/ReceiveGiftUsersView;

    .line 68
    .line 69
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Landroid/view/ViewGroup;

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;

    .line 80
    .line 81
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->k:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;

    .line 82
    .line 83
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    check-cast v0, Landroid/view/ViewGroup;

    .line 88
    .line 89
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoOfficialView;

    .line 94
    .line 95
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->l:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoOfficialView;

    .line 96
    .line 97
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    check-cast v0, Landroid/view/ViewGroup;

    .line 102
    .line 103
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;

    .line 108
    .line 109
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->m:Lcom/p1/mobile/putong/live/livingroom/increment/gift/wealth/GiftWealthLevelView;

    .line 110
    .line 111
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    check-cast v0, Landroid/view/ViewGroup;

    .line 116
    .line 117
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/progress/view/PacketProgressView;

    .line 122
    .line 123
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->n:Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/progress/view/PacketProgressView;

    .line 124
    .line 125
    const/4 v0, 0x6

    .line 126
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 131
    .line 132
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->o:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogGiftsView;

    .line 133
    .line 134
    const/4 v0, 0x7

    .line 135
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    check-cast v0, Landroid/view/ViewStub;

    .line 140
    .line 141
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->p:Landroid/view/ViewStub;

    .line 142
    .line 143
    const/16 v0, 0x8

    .line 144
    .line 145
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;

    .line 150
    .line 151
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->q:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;

    .line 152
    .line 153
    const/16 v0, 0x9

    .line 154
    .line 155
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftDialogShadeLayer;

    .line 160
    .line 161
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->r:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftDialogShadeLayer;

    .line 162
    .line 163
    const/16 v0, 0xa

    .line 164
    .line 165
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftOperationView;

    .line 170
    .line 171
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftOperationView;

    .line 172
    .line 173
    return-void
.end method
