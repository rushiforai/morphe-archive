.class public Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/middle/VoiceVirtualUserCardMiddleItemView;

.field public e:Lv/VDraweeView;

.field public f:Landroid/view/View;

.field public g:Lv/VDraweeView;

.field public h:Landroid/view/View;

.field public i:Lv/VDraweeView;

.field public j:Lv/VText;

.field public k:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public getRoot()Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/middle/VoiceVirtualUserCardMiddleItemView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->d:Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/middle/VoiceVirtualUserCardMiddleItemView;

    .line 2
    .line 3
    return-object p0
.end method

.method public h0(Landroid/view/ViewGroup;)V
    .locals 2

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/middle/VoiceVirtualUserCardMiddleItemView;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->d:Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/middle/VoiceVirtualUserCardMiddleItemView;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->e:Lv/VDraweeView;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const-string v0, "_icon"

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
    move-result-object v1

    .line 26
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->f:Landroid/view/View;

    .line 27
    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    const-string v0, "_left_user_icon_bg"

    .line 31
    .line 32
    :cond_1
    const/4 v1, 0x2

    .line 33
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Lv/VDraweeView;

    .line 38
    .line 39
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->g:Lv/VDraweeView;

    .line 40
    .line 41
    if-nez v1, :cond_2

    .line 42
    .line 43
    const-string v0, "_left_user_icon"

    .line 44
    .line 45
    :cond_2
    const/4 v1, 0x3

    .line 46
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->h:Landroid/view/View;

    .line 51
    .line 52
    if-nez v1, :cond_3

    .line 53
    .line 54
    const-string v0, "_right_user_icon_bg"

    .line 55
    .line 56
    :cond_3
    const/4 v1, 0x4

    .line 57
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    check-cast v1, Lv/VDraweeView;

    .line 62
    .line 63
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->i:Lv/VDraweeView;

    .line 64
    .line 65
    if-nez v1, :cond_4

    .line 66
    .line 67
    const-string v0, "_right_user_icon"

    .line 68
    .line 69
    :cond_4
    const/4 v1, 0x5

    .line 70
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    check-cast v1, Lv/VText;

    .line 75
    .line 76
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->j:Lv/VText;

    .line 77
    .line 78
    if-nez v1, :cond_5

    .line 79
    .line 80
    const-string v0, "_amount"

    .line 81
    .line 82
    :cond_5
    const/4 v1, 0x6

    .line 83
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    check-cast p1, Lv/VText;

    .line 88
    .line 89
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->k:Lv/VText;

    .line 90
    .line 91
    if-nez p1, :cond_6

    .line 92
    .line 93
    const-string v0, "_title"

    .line 94
    .line 95
    :cond_6
    if-nez v0, :cond_7

    .line 96
    .line 97
    return-void

    .line 98
    :cond_7
    const-string p0, "Missing required view with ID:"

    .line 99
    .line 100
    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceUserCardMiddleItemViewBindings;->h0(Landroid/view/ViewGroup;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
