.class public Ll/ea40;
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

.method public static a(Lcom/p1/mobile/putong/core/newui/NewPictureView;Landroid/view/View;)V
    .locals 3

    .line 1
    sget v0, Ll/adc0;->N5:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lv/VDraweeView;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->a:Lv/VDraweeView;

    .line 10
    .line 11
    sget v0, Ll/adc0;->O0:I

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lv/VFrame_ColorFilter;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->b:Lv/VFrame_ColorFilter;

    .line 20
    .line 21
    sget v0, Ll/adc0;->qa:I

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Landroid/widget/ImageView;

    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->c:Landroid/widget/ImageView;

    .line 30
    .line 31
    sget v0, Ll/adc0;->F7:I

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lv/VProgressBar;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->d:Lv/VProgressBar;

    .line 40
    .line 41
    sget v0, Ll/adc0;->t9:I

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Landroid/widget/ImageView;

    .line 48
    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->e:Landroid/widget/ImageView;

    .line 50
    .line 51
    sget v0, Ll/adc0;->S6:I

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Landroid/widget/LinearLayout;

    .line 58
    .line 59
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->f:Landroid/widget/LinearLayout;

    .line 60
    .line 61
    move-object v0, p1

    .line 62
    check-cast v0, Landroid/view/ViewGroup;

    .line 63
    .line 64
    const/4 v1, 0x2

    .line 65
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    check-cast v1, Landroid/view/ViewGroup;

    .line 70
    .line 71
    const/4 v2, 0x0

    .line 72
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    check-cast v1, Lv/VText;

    .line 77
    .line 78
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->g:Lv/VText;

    .line 79
    .line 80
    sget v1, Ll/adc0;->ma:I

    .line 81
    .line 82
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    check-cast v1, Lv/VText;

    .line 87
    .line 88
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->h:Lv/VText;

    .line 89
    .line 90
    sget v1, Ll/adc0;->u8:I

    .line 91
    .line 92
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    check-cast v1, Lv/VImage;

    .line 97
    .line 98
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->i:Lv/VImage;

    .line 99
    .line 100
    sget v1, Ll/adc0;->q9:I

    .line 101
    .line 102
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    check-cast p1, Lv/VText;

    .line 107
    .line 108
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->j:Lv/VText;

    .line 109
    .line 110
    const/4 p1, 0x3

    .line 111
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    check-cast v1, Landroid/widget/LinearLayout;

    .line 116
    .line 117
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->k:Landroid/widget/LinearLayout;

    .line 118
    .line 119
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    check-cast v1, Landroid/view/ViewGroup;

    .line 124
    .line 125
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    check-cast v1, Lv/VText;

    .line 130
    .line 131
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->l:Lv/VText;

    .line 132
    .line 133
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    check-cast p1, Landroid/view/ViewGroup;

    .line 138
    .line 139
    const/4 v0, 0x1

    .line 140
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    check-cast p1, Lv/VImage;

    .line 145
    .line 146
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/NewPictureView;->m:Lv/VImage;

    .line 147
    .line 148
    return-void
.end method
