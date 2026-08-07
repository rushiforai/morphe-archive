.class public Ll/gms;
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

.method public static a(Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;Landroid/view/View;)V
    .locals 4

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->d:Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;

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
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->e:Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;

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
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 23
    .line 24
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->f:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 25
    .line 26
    const/4 v2, 0x2

    .line 27
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Lv/VDraweeView;

    .line 32
    .line 33
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->g:Lv/VDraweeView;

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

    .line 41
    .line 42
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->h:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

    .line 43
    .line 44
    const/4 v2, 0x4

    .line 45
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    check-cast v2, Lv/VText;

    .line 50
    .line 51
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->i:Lv/VText;

    .line 52
    .line 53
    const/4 v2, 0x5

    .line 54
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    check-cast v2, Lv/VDraweeView;

    .line 59
    .line 60
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->j:Lv/VDraweeView;

    .line 61
    .line 62
    const/4 v2, 0x6

    .line 63
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    check-cast v2, Lv/VImage;

    .line 68
    .line 69
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->k:Lv/VImage;

    .line 70
    .line 71
    const/4 v2, 0x7

    .line 72
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    check-cast v2, Lv/VText;

    .line 77
    .line 78
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->l:Lv/VText;

    .line 79
    .line 80
    const/16 v2, 0x8

    .line 81
    .line 82
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    check-cast v3, Landroid/widget/LinearLayout;

    .line 87
    .line 88
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->m:Landroid/widget/LinearLayout;

    .line 89
    .line 90
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    check-cast v3, Landroid/view/ViewGroup;

    .line 95
    .line 96
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    check-cast v0, Lv/VText;

    .line 101
    .line 102
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->n:Lv/VText;

    .line 103
    .line 104
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    check-cast v0, Landroid/view/ViewGroup;

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    check-cast v0, Lv/VText;

    .line 115
    .line 116
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->o:Lv/VText;

    .line 117
    .line 118
    const/16 v0, 0x9

    .line 119
    .line 120
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    check-cast v0, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 125
    .line 126
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->p:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 127
    .line 128
    const/16 v0, 0xa

    .line 129
    .line 130
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    check-cast v0, Lv/VDraweeView;

    .line 135
    .line 136
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->q:Lv/VDraweeView;

    .line 137
    .line 138
    const/16 v0, 0xb

    .line 139
    .line 140
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    check-cast p1, Lv/VDraweeView;

    .line 145
    .line 146
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LiveGiftTrayView;->r:Lv/VDraweeView;

    .line 147
    .line 148
    return-void
.end method
