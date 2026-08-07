.class public Ll/nh80;
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

.method public static a(Lcom/p1/mobile/putong/feed/ui/PlayerView;Landroid/view/View;)V
    .locals 5

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroid/view/ViewGroup;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/view/TextureView;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PlayerView;->a:Landroid/view/TextureView;

    .line 12
    .line 13
    sget v0, Ll/hdc0;->D:I

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lv/AutoVDraweeView;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PlayerView;->b:Lv/AutoVDraweeView;

    .line 22
    .line 23
    move-object v0, p1

    .line 24
    check-cast v0, Landroid/view/ViewGroup;

    .line 25
    .line 26
    const/4 v2, 0x2

    .line 27
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Lv/VProgressBar;

    .line 32
    .line 33
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/ui/PlayerView;->c:Lv/VProgressBar;

    .line 34
    .line 35
    const/4 v3, 0x3

    .line 36
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    check-cast v4, Lv/VLinear;

    .line 41
    .line 42
    iput-object v4, p0, Lcom/p1/mobile/putong/feed/ui/PlayerView;->d:Lv/VLinear;

    .line 43
    .line 44
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    check-cast v4, Landroid/view/ViewGroup;

    .line 49
    .line 50
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    check-cast v1, Lv/VText;

    .line 55
    .line 56
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/ui/PlayerView;->e:Lv/VText;

    .line 57
    .line 58
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    check-cast v1, Landroid/view/ViewGroup;

    .line 63
    .line 64
    const/4 v4, 0x1

    .line 65
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    check-cast v1, Lv/VProgressBar;

    .line 70
    .line 71
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/ui/PlayerView;->f:Lv/VProgressBar;

    .line 72
    .line 73
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    check-cast v0, Landroid/view/ViewGroup;

    .line 78
    .line 79
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    check-cast v0, Lv/VText;

    .line 84
    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PlayerView;->g:Lv/VText;

    .line 86
    .line 87
    sget v0, Ll/hdc0;->n:I

    .line 88
    .line 89
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    check-cast v0, Lv/VFrame_ColorFilter;

    .line 94
    .line 95
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PlayerView;->h:Lv/VFrame_ColorFilter;

    .line 96
    .line 97
    sget v0, Ll/hdc0;->q1:I

    .line 98
    .line 99
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    check-cast v0, Landroid/widget/ImageView;

    .line 104
    .line 105
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/ui/PlayerView;->i:Landroid/widget/ImageView;

    .line 106
    .line 107
    sget v0, Ll/hdc0;->H0:I

    .line 108
    .line 109
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    check-cast p1, Lv/VProgressBar;

    .line 114
    .line 115
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/PlayerView;->j:Lv/VProgressBar;

    .line 116
    .line 117
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/feed/ui/PlayerView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/tec0;->Q3:I

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
    invoke-static {p0, p1}, Ll/nh80;->a(Lcom/p1/mobile/putong/feed/ui/PlayerView;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
