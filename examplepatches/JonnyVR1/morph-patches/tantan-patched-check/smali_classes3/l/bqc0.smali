.class public Ll/bqc0;
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

.method public static a(Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;Landroid/view/View;)V
    .locals 4

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->d:Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;

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
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->e:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

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
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->f:Lv/VFrame;

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
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->g:Lv/VRelative;

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
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->h:Lcom/p1/mobile/putong/core/newui/talk/view/NewTalkProgressView;

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
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->i:Lv/VDraweeView;

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
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->j:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

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
    check-cast v2, Lv/VFrame;

    .line 106
    .line 107
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->k:Lv/VFrame;

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
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    check-cast v2, Landroid/view/ViewGroup;

    .line 120
    .line 121
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    check-cast v0, Lv/VImage;

    .line 126
    .line 127
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->l:Lv/VImage;

    .line 128
    .line 129
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    check-cast v0, Landroid/view/ViewGroup;

    .line 134
    .line 135
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    check-cast v0, Landroid/view/ViewGroup;

    .line 140
    .line 141
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    check-cast v0, Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 146
    .line 147
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->m:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 148
    .line 149
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    check-cast p1, Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 154
    .line 155
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/RecommendNormalUserView;->n:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 156
    .line 157
    return-void
.end method
