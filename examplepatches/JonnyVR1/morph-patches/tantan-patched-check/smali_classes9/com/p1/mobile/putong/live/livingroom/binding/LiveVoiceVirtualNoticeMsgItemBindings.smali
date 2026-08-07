.class public Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceVirtualNoticeMsgItemBindings;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/LiveVoiceVirtualNoticeMsgItemView;

.field public b:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/LiveAvatarClipItemView;

.field public c:Lv/VDraweeView;

.field public d:Lv/VText;

.field public e:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/ViewGroup;)V
    .locals 4

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/LiveVoiceVirtualNoticeMsgItemView;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceVirtualNoticeMsgItemBindings;->a:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/LiveVoiceVirtualNoticeMsgItemView;

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
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/LiveAvatarClipItemView;

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceVirtualNoticeMsgItemBindings;->b:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/LiveAvatarClipItemView;

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    const-string v1, "_avatar_root"

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
    check-cast v2, Lv/VDraweeView;

    .line 32
    .line 33
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceVirtualNoticeMsgItemBindings;->c:Lv/VDraweeView;

    .line 34
    .line 35
    if-nez v2, :cond_1

    .line 36
    .line 37
    const-string v1, "_avatar"

    .line 38
    .line 39
    :cond_1
    const/4 v2, 0x2

    .line 40
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    check-cast v3, Landroid/view/ViewGroup;

    .line 45
    .line 46
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lv/VText;

    .line 51
    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceVirtualNoticeMsgItemBindings;->d:Lv/VText;

    .line 53
    .line 54
    if-nez v0, :cond_2

    .line 55
    .line 56
    const-string v1, "_title"

    .line 57
    .line 58
    :cond_2
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    check-cast p1, Landroid/view/ViewGroup;

    .line 63
    .line 64
    const/4 v0, 0x1

    .line 65
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    check-cast p1, Lv/VText;

    .line 70
    .line 71
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceVirtualNoticeMsgItemBindings;->e:Lv/VText;

    .line 72
    .line 73
    if-nez p1, :cond_3

    .line 74
    .line 75
    const-string v1, "_content"

    .line 76
    .line 77
    :cond_3
    if-nez v1, :cond_4

    .line 78
    .line 79
    return-void

    .line 80
    :cond_4
    const-string p0, "Missing required view with ID:"

    .line 81
    .line 82
    invoke-virtual {p0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public getRoot()Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/LiveVoiceVirtualNoticeMsgItemView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceVirtualNoticeMsgItemBindings;->a:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/LiveVoiceVirtualNoticeMsgItemView;

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
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceVirtualNoticeMsgItemBindings;->a(Landroid/view/ViewGroup;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
