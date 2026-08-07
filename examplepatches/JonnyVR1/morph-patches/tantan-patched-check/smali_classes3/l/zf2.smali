.class public Ll/zf2;
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

.method public static a(Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;Landroid/view/View;)V
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
    check-cast v1, Lv/VImage;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->d:Lv/VImage;

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
    check-cast v2, Lcom/tantan/library/svga/SVGAnimationView;

    .line 18
    .line 19
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 20
    .line 21
    const/4 v2, 0x2

    .line 22
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    check-cast v3, Lv/VLinear;

    .line 27
    .line 28
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->f:Lv/VLinear;

    .line 29
    .line 30
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    check-cast v3, Landroid/view/ViewGroup;

    .line 35
    .line 36
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    check-cast v3, Landroid/view/ViewGroup;

    .line 41
    .line 42
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    check-cast v3, Lv/VText;

    .line 47
    .line 48
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->g:Lv/VText;

    .line 49
    .line 50
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    check-cast v3, Landroid/view/ViewGroup;

    .line 55
    .line 56
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Landroid/view/ViewGroup;

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Lv/VImage;

    .line 67
    .line 68
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->h:Lv/VImage;

    .line 69
    .line 70
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Landroid/view/ViewGroup;

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Lv/VText;

    .line 81
    .line 82
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->i:Lv/VText;

    .line 83
    .line 84
    const/4 v0, 0x3

    .line 85
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    check-cast v0, Lv/VText;

    .line 90
    .line 91
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->j:Lv/VText;

    .line 92
    .line 93
    const/4 v0, 0x4

    .line 94
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    check-cast v0, Lv/VText;

    .line 99
    .line 100
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->k:Lv/VText;

    .line 101
    .line 102
    const/4 v0, 0x5

    .line 103
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    check-cast v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzProgressBar;

    .line 108
    .line 109
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->l:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzProgressBar;

    .line 110
    .line 111
    const/4 v0, 0x6

    .line 112
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;->m:Landroid/view/View;

    .line 117
    .line 118
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/mec0;->A:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p0, p1}, Ll/zf2;->a(Lcom/p1/mobile/putong/core/ui/lovebuzz/pop/BaseBuzzNotifyPop;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
