.class public Ll/cpn;
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

.method public static a(Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;Landroid/view/View;)V
    .locals 3

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
    check-cast v1, Lv/VDraweeView;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->d:Lv/VDraweeView;

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
    check-cast v2, Lv/VLinear;

    .line 18
    .line 19
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->e:Lv/VLinear;

    .line 20
    .line 21
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

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
    move-result-object v0

    .line 31
    check-cast v0, Lv/VText;

    .line 32
    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->f:Lv/VText;

    .line 34
    .line 35
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Landroid/view/ViewGroup;

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    check-cast v0, Lv/VText;

    .line 46
    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->g:Lv/VText;

    .line 48
    .line 49
    const/4 v0, 0x2

    .line 50
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Lv/VText;

    .line 55
    .line 56
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->h:Lv/VText;

    .line 57
    .line 58
    const/4 v0, 0x3

    .line 59
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    check-cast v0, Lv/VText;

    .line 64
    .line 65
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->i:Lv/VText;

    .line 66
    .line 67
    const/4 v0, 0x4

    .line 68
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Lv/VLinear;

    .line 73
    .line 74
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->j:Lv/VLinear;

    .line 75
    .line 76
    const/4 v0, 0x5

    .line 77
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    check-cast v0, Lv/VButton;

    .line 82
    .line 83
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->k:Lv/VButton;

    .line 84
    .line 85
    const/4 v0, 0x6

    .line 86
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    check-cast p1, Lv/VButton;

    .line 91
    .line 92
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;->l:Lv/VButton;

    .line 93
    .line 94
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/kec0;->J4:I

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
    invoke-static {p0, p1}, Ll/cpn;->a(Lcom/p1/mobile/putong/core/ui/hideandseek/IntlHideAndSeekInfoView;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
