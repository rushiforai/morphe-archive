.class public Ll/mgq;
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

.method public static a(Lcom/p1/mobile/putong/core/ui/messages/ItemSwapAnswerMessage;Landroid/view/View;)V
    .locals 4

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwapAnswerMessage;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwapAnswerMessage;->c:Lcom/p1/mobile/putong/core/ui/messages/ItemSwapAnswerMessage;

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
    check-cast v1, Lv/VImage;

    .line 20
    .line 21
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwapAnswerMessage;->d:Lv/VImage;

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Landroid/view/ViewGroup;

    .line 28
    .line 29
    const/4 v2, 0x1

    .line 30
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Lv/VText_NoTopPadding;

    .line 35
    .line 36
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwapAnswerMessage;->e:Lv/VText_NoTopPadding;

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Landroid/view/ViewGroup;

    .line 43
    .line 44
    const/4 v3, 0x2

    .line 45
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    check-cast v1, Lv/VText_NoTopPadding;

    .line 50
    .line 51
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwapAnswerMessage;->f:Lv/VText_NoTopPadding;

    .line 52
    .line 53
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Landroid/view/ViewGroup;

    .line 58
    .line 59
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    check-cast v1, Lv/VImage;

    .line 64
    .line 65
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwapAnswerMessage;->g:Lv/VImage;

    .line 66
    .line 67
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    check-cast v1, Landroid/view/ViewGroup;

    .line 72
    .line 73
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    check-cast v1, Lv/VText_NoTopPadding;

    .line 78
    .line 79
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwapAnswerMessage;->h:Lv/VText_NoTopPadding;

    .line 80
    .line 81
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    check-cast v1, Landroid/view/ViewGroup;

    .line 86
    .line 87
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    check-cast v0, Lv/VImage;

    .line 92
    .line 93
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwapAnswerMessage;->i:Lv/VImage;

    .line 94
    .line 95
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    check-cast v0, Landroid/view/ViewGroup;

    .line 100
    .line 101
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    check-cast v0, Lv/VText_NoTopPadding;

    .line 106
    .line 107
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwapAnswerMessage;->j:Lv/VText_NoTopPadding;

    .line 108
    .line 109
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    check-cast v0, Landroid/view/ViewGroup;

    .line 114
    .line 115
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    check-cast v0, Lv/VImage;

    .line 120
    .line 121
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwapAnswerMessage;->k:Lv/VImage;

    .line 122
    .line 123
    const/4 v0, 0x3

    .line 124
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    check-cast p1, Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 129
    .line 130
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemSwapAnswerMessage;->l:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 131
    .line 132
    return-void
.end method
