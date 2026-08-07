.class public Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceFunctionsDialogTabItemBindings;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/tab/VoiceFunctionsTabItemView;

.field public b:Lv/VFrame;

.field public c:Landroid/view/View;

.field public d:Lv/VImage;

.field public e:Lv/VText;

.field public f:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/ViewGroup;)V
    .locals 3

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/tab/VoiceFunctionsTabItemView;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceFunctionsDialogTabItemBindings;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/tab/VoiceFunctionsTabItemView;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Lv/VFrame;

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceFunctionsDialogTabItemBindings;->b:Lv/VFrame;

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    const-string v1, "_icon_root"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v1, 0x0

    .line 21
    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Landroid/view/ViewGroup;

    .line 26
    .line 27
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceFunctionsDialogTabItemBindings;->c:Landroid/view/View;

    .line 32
    .line 33
    if-nez v2, :cond_1

    .line 34
    .line 35
    const-string v1, "_background"

    .line 36
    .line 37
    :cond_1
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Landroid/view/ViewGroup;

    .line 42
    .line 43
    const/4 v2, 0x1

    .line 44
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Lv/VImage;

    .line 49
    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceFunctionsDialogTabItemBindings;->d:Lv/VImage;

    .line 51
    .line 52
    if-nez v0, :cond_2

    .line 53
    .line 54
    const-string v1, "_icon"

    .line 55
    .line 56
    :cond_2
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Lv/VText;

    .line 61
    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceFunctionsDialogTabItemBindings;->e:Lv/VText;

    .line 63
    .line 64
    if-nez v0, :cond_3

    .line 65
    .line 66
    const-string v1, "_auction_tag"

    .line 67
    .line 68
    :cond_3
    const/4 v0, 0x2

    .line 69
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    check-cast p1, Lv/VText;

    .line 74
    .line 75
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceFunctionsDialogTabItemBindings;->f:Lv/VText;

    .line 76
    .line 77
    if-nez p1, :cond_4

    .line 78
    .line 79
    const-string v1, "_name"

    .line 80
    .line 81
    :cond_4
    if-nez v1, :cond_5

    .line 82
    .line 83
    return-void

    .line 84
    :cond_5
    const-string p0, "Missing required view with ID:"

    .line 85
    .line 86
    invoke-virtual {p0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public getRoot()Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/tab/VoiceFunctionsTabItemView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceFunctionsDialogTabItemBindings;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/tab/VoiceFunctionsTabItemView;

    .line 2
    .line 3
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceFunctionsDialogTabItemBindings;->a(Landroid/view/ViewGroup;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
