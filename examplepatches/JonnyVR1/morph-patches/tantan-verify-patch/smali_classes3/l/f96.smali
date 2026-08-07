.class public Ll/f96;
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

.method public static a(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;Landroid/view/View;)V
    .locals 4

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

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
    check-cast v1, Lv/VLinear;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->b:Lv/VLinear;

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Landroid/view/ViewGroup;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Lv/VFrame;

    .line 28
    .line 29
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->c:Lv/VFrame;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Landroid/view/ViewGroup;

    .line 36
    .line 37
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Landroid/view/ViewGroup;

    .line 42
    .line 43
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Lcom/tantan/library/svga/SVGAnimationView;

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    check-cast v1, Landroid/view/ViewGroup;

    .line 56
    .line 57
    const/4 v2, 0x1

    .line 58
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    check-cast v1, Lv/VText;

    .line 63
    .line 64
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->e:Lv/VText;

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    check-cast v1, Landroid/view/ViewGroup;

    .line 71
    .line 72
    const/4 v3, 0x2

    .line 73
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    check-cast v1, Lv/VText;

    .line 78
    .line 79
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->f:Lv/VText;

    .line 80
    .line 81
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    check-cast v0, Landroid/view/ViewGroup;

    .line 86
    .line 87
    const/4 v1, 0x4

    .line 88
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    check-cast v0, Landroid/widget/TextView;

    .line 93
    .line 94
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->g:Landroid/widget/TextView;

    .line 95
    .line 96
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    check-cast v0, Landroid/view/ViewStub;

    .line 101
    .line 102
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->h:Landroid/view/ViewStub;

    .line 103
    .line 104
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    check-cast v0, Lv/VRecyclerView;

    .line 109
    .line 110
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->i:Lv/VRecyclerView;

    .line 111
    .line 112
    const/4 v0, 0x3

    .line 113
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    check-cast v0, Lcom/tantan/library/svga/SVGAnimationView;

    .line 118
    .line 119
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->j:Lcom/tantan/library/svga/SVGAnimationView;

    .line 120
    .line 121
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->k:Landroid/view/View;

    .line 126
    .line 127
    return-void
.end method
