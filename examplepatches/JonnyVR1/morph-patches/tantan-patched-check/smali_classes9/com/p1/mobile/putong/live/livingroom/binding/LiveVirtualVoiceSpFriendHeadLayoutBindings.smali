.class public Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpFriendHeadLayoutBindings;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Ll/k3m;",
        ">",
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public a:Ll/k3m;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public b:Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/cp/VirtualVoiceSpFriendHeadView;

.field public c:Lv/VDraweeView;

.field public d:Landroid/widget/TextView;

.field public e:Lv/VLinear;

.field public f:Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/cp/VirtualVoiceSpFriendItemView;

.field public g:Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/cp/VirtualVoiceSpFriendItemView;

.field public h:Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/cp/VirtualVoiceSpFriendItemView;

.field public i:Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/cp/VirtualVoiceSpFriendItemView;

.field public j:Lv/VImage;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpFriendHeadLayoutBindings;->getRoot()Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/cp/VirtualVoiceSpFriendHeadView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public a(Landroid/view/ViewGroup;)V
    .locals 5

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/cp/VirtualVoiceSpFriendHeadView;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpFriendHeadLayoutBindings;->b:Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/cp/VirtualVoiceSpFriendHeadView;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lv/VDraweeView;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpFriendHeadLayoutBindings;->c:Lv/VDraweeView;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const-string v0, "_background"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    :goto_0
    const/4 v1, 0x1

    .line 22
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Landroid/widget/TextView;

    .line 27
    .line 28
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpFriendHeadLayoutBindings;->d:Landroid/widget/TextView;

    .line 29
    .line 30
    if-nez v2, :cond_1

    .line 31
    .line 32
    const-string v0, "_title"

    .line 33
    .line 34
    :cond_1
    const/4 v2, 0x2

    .line 35
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    check-cast v3, Lv/VLinear;

    .line 40
    .line 41
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpFriendHeadLayoutBindings;->e:Lv/VLinear;

    .line 42
    .line 43
    if-nez v3, :cond_2

    .line 44
    .line 45
    const-string v0, "_linear_list"

    .line 46
    .line 47
    :cond_2
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    check-cast v3, Landroid/view/ViewGroup;

    .line 52
    .line 53
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/cp/VirtualVoiceSpFriendItemView;

    .line 58
    .line 59
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpFriendHeadLayoutBindings;->f:Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/cp/VirtualVoiceSpFriendItemView;

    .line 60
    .line 61
    if-nez v1, :cond_3

    .line 62
    .line 63
    const-string v0, "_linear_list_item1"

    .line 64
    .line 65
    :cond_3
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    check-cast v1, Landroid/view/ViewGroup;

    .line 70
    .line 71
    const/4 v3, 0x3

    .line 72
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/cp/VirtualVoiceSpFriendItemView;

    .line 77
    .line 78
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpFriendHeadLayoutBindings;->g:Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/cp/VirtualVoiceSpFriendItemView;

    .line 79
    .line 80
    if-nez v1, :cond_4

    .line 81
    .line 82
    const-string v0, "_linear_list_item2"

    .line 83
    .line 84
    :cond_4
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    check-cast v1, Landroid/view/ViewGroup;

    .line 89
    .line 90
    const/4 v4, 0x5

    .line 91
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/cp/VirtualVoiceSpFriendItemView;

    .line 96
    .line 97
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpFriendHeadLayoutBindings;->h:Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/cp/VirtualVoiceSpFriendItemView;

    .line 98
    .line 99
    if-nez v1, :cond_5

    .line 100
    .line 101
    const-string v0, "_linear_list_item3"

    .line 102
    .line 103
    :cond_5
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    check-cast v1, Landroid/view/ViewGroup;

    .line 108
    .line 109
    const/4 v2, 0x7

    .line 110
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/cp/VirtualVoiceSpFriendItemView;

    .line 115
    .line 116
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpFriendHeadLayoutBindings;->i:Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/cp/VirtualVoiceSpFriendItemView;

    .line 117
    .line 118
    if-nez v1, :cond_6

    .line 119
    .line 120
    const-string v0, "_linear_list_item4"

    .line 121
    .line 122
    :cond_6
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    check-cast p1, Lv/VImage;

    .line 127
    .line 128
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpFriendHeadLayoutBindings;->j:Lv/VImage;

    .line 129
    .line 130
    if-nez p1, :cond_7

    .line 131
    .line 132
    const-string v0, "_more_bt"

    .line 133
    .line 134
    :cond_7
    if-nez v0, :cond_8

    .line 135
    .line 136
    return-void

    .line 137
    :cond_8
    const-string p0, "Missing required view with ID:"

    .line 138
    .line 139
    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public getRoot()Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/cp/VirtualVoiceSpFriendHeadView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpFriendHeadLayoutBindings;->b:Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/cp/VirtualVoiceSpFriendHeadView;

    .line 2
    .line 3
    return-object p0
.end method

.method public i1(Ll/k3m;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpFriendHeadLayoutBindings;->a:Ll/k3m;

    .line 2
    .line 3
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/yec0;->j7:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    move-object p2, p1

    .line 9
    check-cast p2, Landroid/view/ViewGroup;

    .line 10
    .line 11
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpFriendHeadLayoutBindings;->a(Landroid/view/ViewGroup;)V

    .line 12
    .line 13
    .line 14
    return-object p1
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceSpFriendHeadLayoutBindings;->a(Landroid/view/ViewGroup;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
