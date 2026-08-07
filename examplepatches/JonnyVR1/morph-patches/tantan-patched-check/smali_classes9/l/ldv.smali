.class public Ll/ldv;
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

.method public static a(Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoiceVirtualPaymentGuideDialog;Landroid/view/View;)V
    .locals 4

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
    move-result-object v1

    .line 8
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoiceVirtualPaymentGuideDialog;->d:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonAnimMaskAvatarView;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lv/VText;

    .line 18
    .line 19
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoiceVirtualPaymentGuideDialog;->e:Lv/VText;

    .line 20
    .line 21
    const/4 v2, 0x2

    .line 22
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Lv/VText;

    .line 27
    .line 28
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoiceVirtualPaymentGuideDialog;->f:Lv/VText;

    .line 29
    .line 30
    const/4 v2, 0x3

    .line 31
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    check-cast v3, Landroid/widget/LinearLayout;

    .line 36
    .line 37
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoiceVirtualPaymentGuideDialog;->g:Landroid/widget/LinearLayout;

    .line 38
    .line 39
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    check-cast v3, Landroid/view/ViewGroup;

    .line 44
    .line 45
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Lv/VDraweeView;

    .line 50
    .line 51
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoiceVirtualPaymentGuideDialog;->h:Lv/VDraweeView;

    .line 52
    .line 53
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Landroid/view/ViewGroup;

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    check-cast v0, Lv/VText;

    .line 64
    .line 65
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoiceVirtualPaymentGuideDialog;->i:Lv/VText;

    .line 66
    .line 67
    const/4 v0, 0x4

    .line 68
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    check-cast p1, Lv/VText;

    .line 73
    .line 74
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/payGuide/LiveVoiceVirtualPaymentGuideDialog;->j:Lv/VText;

    .line 75
    .line 76
    return-void
.end method
