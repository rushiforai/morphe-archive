.class public Ll/lg2;
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

.method public static a(Ll/kg2;Landroid/view/View;)V
    .locals 4

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 3
    .line 4
    iput-object v0, p0, Ll/kg2;->d:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 5
    .line 6
    check-cast p1, Landroid/view/ViewGroup;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Lv/VImage;

    .line 14
    .line 15
    iput-object v1, p0, Ll/kg2;->e:Lv/VImage;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Lv/VDraweeView;

    .line 23
    .line 24
    iput-object v2, p0, Ll/kg2;->f:Lv/VDraweeView;

    .line 25
    .line 26
    const/4 v2, 0x2

    .line 27
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzCircleCountdownView;

    .line 32
    .line 33
    iput-object v2, p0, Ll/kg2;->g:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzCircleCountdownView;

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    check-cast v2, Lv/VDraweeView;

    .line 41
    .line 42
    iput-object v2, p0, Ll/kg2;->h:Lv/VDraweeView;

    .line 43
    .line 44
    const/4 v2, 0x4

    .line 45
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    check-cast v2, Lcom/tantan/library/svga/SVGAnimationView;

    .line 50
    .line 51
    iput-object v2, p0, Ll/kg2;->i:Lcom/tantan/library/svga/SVGAnimationView;

    .line 52
    .line 53
    const/4 v2, 0x5

    .line 54
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    check-cast v2, Lv/VText;

    .line 59
    .line 60
    iput-object v2, p0, Ll/kg2;->j:Lv/VText;

    .line 61
    .line 62
    const/4 v2, 0x6

    .line 63
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    check-cast v3, Landroid/view/ViewGroup;

    .line 68
    .line 69
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Lv/VText;

    .line 74
    .line 75
    iput-object v0, p0, Ll/kg2;->k:Lv/VText;

    .line 76
    .line 77
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    check-cast v0, Landroid/view/ViewGroup;

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    check-cast v0, Lv/VImage;

    .line 88
    .line 89
    iput-object v0, p0, Ll/kg2;->l:Lv/VImage;

    .line 90
    .line 91
    const/4 v0, 0x7

    .line 92
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    check-cast v0, Lcom/tantan/library/svga/SVGAnimationView;

    .line 97
    .line 98
    iput-object v0, p0, Ll/kg2;->m:Lcom/tantan/library/svga/SVGAnimationView;

    .line 99
    .line 100
    const/16 v0, 0x8

    .line 101
    .line 102
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    check-cast v0, Lv/VText;

    .line 107
    .line 108
    iput-object v0, p0, Ll/kg2;->n:Lv/VText;

    .line 109
    .line 110
    const/16 v0, 0x9

    .line 111
    .line 112
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    check-cast v0, Lv/VText;

    .line 117
    .line 118
    iput-object v0, p0, Ll/kg2;->o:Lv/VText;

    .line 119
    .line 120
    const/16 v0, 0xa

    .line 121
    .line 122
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    check-cast v0, Landroid/view/ViewStub;

    .line 127
    .line 128
    iput-object v0, p0, Ll/kg2;->p:Landroid/view/ViewStub;

    .line 129
    .line 130
    const/16 v0, 0xb

    .line 131
    .line 132
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    check-cast p1, Lv/VText;

    .line 137
    .line 138
    iput-object p1, p0, Ll/kg2;->q:Lv/VText;

    .line 139
    .line 140
    return-void
.end method

.method public static b(Ll/kg2;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/mec0;->b:I

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
    invoke-static {p0, p1}, Ll/lg2;->a(Ll/kg2;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
