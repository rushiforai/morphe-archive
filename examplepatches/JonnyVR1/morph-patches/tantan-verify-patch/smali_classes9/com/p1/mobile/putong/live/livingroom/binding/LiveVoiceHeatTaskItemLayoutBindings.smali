.class public Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHeatTaskItemLayoutBindings;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/virtual/room/guide/HeatTaskItemView;

.field public e:Lv/VDraweeView;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VText;


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
.method public getRoot()Lcom/p1/mobile/putong/live/livingroom/virtual/room/guide/HeatTaskItemView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHeatTaskItemLayoutBindings;->d:Lcom/p1/mobile/putong/live/livingroom/virtual/room/guide/HeatTaskItemView;

    .line 2
    .line 3
    return-object p0
.end method

.method public h0(Landroid/view/ViewGroup;)V
    .locals 2

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/guide/HeatTaskItemView;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHeatTaskItemLayoutBindings;->d:Lcom/p1/mobile/putong/live/livingroom/virtual/room/guide/HeatTaskItemView;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHeatTaskItemLayoutBindings;->e:Lv/VDraweeView;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const-string v0, "_user_icon"

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
    check-cast v1, Lv/VText;

    .line 27
    .line 28
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHeatTaskItemLayoutBindings;->f:Lv/VText;

    .line 29
    .line 30
    if-nez v1, :cond_1

    .line 31
    .line 32
    const-string v0, "_user_name"

    .line 33
    .line 34
    :cond_1
    const/4 v1, 0x2

    .line 35
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Lv/VText;

    .line 40
    .line 41
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHeatTaskItemLayoutBindings;->g:Lv/VText;

    .line 42
    .line 43
    if-nez v1, :cond_2

    .line 44
    .line 45
    const-string v0, "_description"

    .line 46
    .line 47
    :cond_2
    const/4 v1, 0x3

    .line 48
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    check-cast v1, Lv/VText;

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHeatTaskItemLayoutBindings;->h:Lv/VText;

    .line 55
    .line 56
    if-nez v1, :cond_3

    .line 57
    .line 58
    const-string v0, "_confirm_bt"

    .line 59
    .line 60
    :cond_3
    const/4 v1, 0x4

    .line 61
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    check-cast p1, Lv/VText;

    .line 66
    .line 67
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHeatTaskItemLayoutBindings;->i:Lv/VText;

    .line 68
    .line 69
    if-nez p1, :cond_4

    .line 70
    .line 71
    const-string v0, "_confirm_hint"

    .line 72
    .line 73
    :cond_4
    if-nez v0, :cond_5

    .line 74
    .line 75
    return-void

    .line 76
    :cond_5
    const-string p0, "Missing required view with ID:"

    .line 77
    .line 78
    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceHeatTaskItemLayoutBindings;->h0(Landroid/view/ViewGroup;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
