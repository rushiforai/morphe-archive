.class public Ll/lum0;
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

.method public static a(Ll/kum0;Landroid/view/View;)V
    .locals 4

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 3
    .line 4
    iput-object v0, p0, Ll/kum0;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

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
    iput-object v1, p0, Ll/kum0;->g:Lv/VImage;

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
    check-cast v2, Lv/VImage;

    .line 23
    .line 24
    iput-object v2, p0, Ll/kum0;->h:Lv/VImage;

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
    check-cast v2, Lcom/tantan/library/svga/SVGAnimationView;

    .line 32
    .line 33
    iput-object v2, p0, Ll/kum0;->i:Lcom/tantan/library/svga/SVGAnimationView;

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
    iput-object v2, p0, Ll/kum0;->j:Lv/VDraweeView;

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
    check-cast v2, Lv/VText;

    .line 50
    .line 51
    iput-object v2, p0, Ll/kum0;->k:Lv/VText;

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
    iput-object v2, p0, Ll/kum0;->l:Lv/VText;

    .line 61
    .line 62
    const/4 v2, 0x6

    .line 63
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    check-cast v2, Lv/VText;

    .line 68
    .line 69
    iput-object v2, p0, Ll/kum0;->m:Lv/VText;

    .line 70
    .line 71
    const/4 v2, 0x7

    .line 72
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    check-cast v2, Lv/VDraweeView;

    .line 77
    .line 78
    iput-object v2, p0, Ll/kum0;->n:Lv/VDraweeView;

    .line 79
    .line 80
    const/16 v2, 0x8

    .line 81
    .line 82
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    check-cast v2, Lv/VText;

    .line 87
    .line 88
    iput-object v2, p0, Ll/kum0;->o:Lv/VText;

    .line 89
    .line 90
    const/16 v2, 0x9

    .line 91
    .line 92
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    check-cast v3, Lv/VLinear;

    .line 97
    .line 98
    iput-object v3, p0, Ll/kum0;->p:Lv/VLinear;

    .line 99
    .line 100
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    check-cast v3, Landroid/view/ViewGroup;

    .line 105
    .line 106
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    check-cast v3, Lv/VText;

    .line 111
    .line 112
    iput-object v3, p0, Ll/kum0;->q:Lv/VText;

    .line 113
    .line 114
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    check-cast v2, Landroid/view/ViewGroup;

    .line 119
    .line 120
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    check-cast v1, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzFlowTagsView;

    .line 125
    .line 126
    iput-object v1, p0, Ll/kum0;->r:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/BuzzFlowTagsView;

    .line 127
    .line 128
    const/16 v1, 0xa

    .line 129
    .line 130
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    check-cast v1, Lv/VText;

    .line 135
    .line 136
    iput-object v1, p0, Ll/kum0;->s:Lv/VText;

    .line 137
    .line 138
    const/16 v1, 0xb

    .line 139
    .line 140
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    check-cast v1, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzMatchView;

    .line 145
    .line 146
    iput-object v1, p0, Ll/kum0;->t:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzMatchView;

    .line 147
    .line 148
    const/16 v1, 0xc

    .line 149
    .line 150
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    check-cast v2, Landroid/widget/FrameLayout;

    .line 155
    .line 156
    iput-object v2, p0, Ll/kum0;->u:Landroid/widget/FrameLayout;

    .line 157
    .line 158
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    check-cast v1, Landroid/view/ViewGroup;

    .line 163
    .line 164
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    check-cast v0, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/zebraprogress/ZebraProgress;

    .line 169
    .line 170
    iput-object v0, p0, Ll/kum0;->v:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/zebraprogress/ZebraProgress;

    .line 171
    .line 172
    const/16 v0, 0xd

    .line 173
    .line 174
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    check-cast v0, Lv/VText;

    .line 179
    .line 180
    iput-object v0, p0, Ll/kum0;->w:Lv/VText;

    .line 181
    .line 182
    const/16 v0, 0xe

    .line 183
    .line 184
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    check-cast p1, Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;

    .line 189
    .line 190
    iput-object p1, p0, Ll/kum0;->x:Lcom/p1/mobile/putong/core/ui/lovebuzz/voice/view/VoiceBuzzCallControlView;

    .line 191
    .line 192
    return-void
.end method

.method public static b(Ll/kum0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/mec0;->H:I

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
    invoke-static {p0, p1}, Ll/lum0;->a(Ll/kum0;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
