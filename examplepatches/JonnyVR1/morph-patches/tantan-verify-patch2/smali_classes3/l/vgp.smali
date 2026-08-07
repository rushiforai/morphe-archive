.class public Ll/vgp;
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

.method public static a(Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeMeetFragTabBar;Landroid/view/View;)V
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
    check-cast v1, Landroid/widget/FrameLayout;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeMeetFragTabBar;->d:Landroid/widget/FrameLayout;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Landroid/view/ViewGroup;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lv/VText;

    .line 23
    .line 24
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeMeetFragTabBar;->e:Lv/VText;

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Lv/VLinear;

    .line 32
    .line 33
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeMeetFragTabBar;->f:Lv/VLinear;

    .line 34
    .line 35
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Landroid/view/ViewGroup;

    .line 40
    .line 41
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    check-cast v2, Lv/VText;

    .line 46
    .line 47
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeMeetFragTabBar;->g:Lv/VText;

    .line 48
    .line 49
    const/4 v2, 0x2

    .line 50
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    check-cast v3, Lv/VLinear;

    .line 55
    .line 56
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeMeetFragTabBar;->h:Lv/VLinear;

    .line 57
    .line 58
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    check-cast v3, Landroid/view/ViewGroup;

    .line 63
    .line 64
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Lv/VImage;

    .line 69
    .line 70
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeMeetFragTabBar;->i:Lv/VImage;

    .line 71
    .line 72
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    check-cast p1, Landroid/view/ViewGroup;

    .line 77
    .line 78
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    check-cast p1, Lv/VText_NoTopPadding;

    .line 83
    .line 84
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeMeetFragTabBar;->j:Lv/VText_NoTopPadding;

    .line 85
    .line 86
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeMeetFragTabBar;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/pec0;->X:I

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
    invoke-static {p0, p1}, Ll/vgp;->a(Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeMeetFragTabBar;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
