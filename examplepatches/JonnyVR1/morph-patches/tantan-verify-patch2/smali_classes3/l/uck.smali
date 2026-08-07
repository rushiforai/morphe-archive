.class public Ll/uck;
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

.method public static a(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;Landroid/view/View;)V
    .locals 6

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroid/widget/LinearLayout;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;->a:Landroid/widget/LinearLayout;

    .line 5
    .line 6
    move-object v0, p1

    .line 7
    check-cast v0, Landroid/view/ViewGroup;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    check-cast v2, Landroid/widget/LinearLayout;

    .line 15
    .line 16
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;->b:Landroid/widget/LinearLayout;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Landroid/view/ViewGroup;

    .line 23
    .line 24
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Lv/VDraweeView;

    .line 29
    .line 30
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;->c:Lv/VDraweeView;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Landroid/view/ViewGroup;

    .line 37
    .line 38
    const/4 v3, 0x1

    .line 39
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;->d:Landroid/view/View;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    check-cast v2, Landroid/view/ViewGroup;

    .line 50
    .line 51
    const/4 v4, 0x2

    .line 52
    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    check-cast v2, Lv/VDraweeView;

    .line 57
    .line 58
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;->e:Lv/VDraweeView;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    check-cast v2, Landroid/view/ViewGroup;

    .line 65
    .line 66
    const/4 v5, 0x3

    .line 67
    invoke-virtual {v2, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;->f:Landroid/view/View;

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    check-cast v1, Landroid/view/ViewGroup;

    .line 78
    .line 79
    const/4 v2, 0x4

    .line 80
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    check-cast v1, Lv/VDraweeView;

    .line 85
    .line 86
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;->g:Lv/VDraweeView;

    .line 87
    .line 88
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    check-cast v1, Landroid/widget/LinearLayout;

    .line 93
    .line 94
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;->h:Landroid/widget/LinearLayout;

    .line 95
    .line 96
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    check-cast v1, Landroid/view/ViewGroup;

    .line 101
    .line 102
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    check-cast v1, Lv/VText;

    .line 107
    .line 108
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;->i:Lv/VText;

    .line 109
    .line 110
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    check-cast v0, Landroid/widget/LinearLayout;

    .line 115
    .line 116
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;->j:Landroid/widget/LinearLayout;

    .line 117
    .line 118
    sget v0, Ll/edc0;->h2:I

    .line 119
    .line 120
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    check-cast v0, Lv/VImage;

    .line 125
    .line 126
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;->k:Lv/VImage;

    .line 127
    .line 128
    check-cast p1, Landroid/view/ViewGroup;

    .line 129
    .line 130
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    check-cast v0, Landroid/view/ViewGroup;

    .line 135
    .line 136
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    check-cast v0, Lv/VText;

    .line 141
    .line 142
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;->l:Lv/VText;

    .line 143
    .line 144
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    check-cast v0, Landroid/widget/LinearLayout;

    .line 149
    .line 150
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;->m:Landroid/widget/LinearLayout;

    .line 151
    .line 152
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    check-cast v0, Landroid/view/ViewGroup;

    .line 157
    .line 158
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    check-cast v0, Lv/VText;

    .line 163
    .line 164
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;->n:Lv/VText;

    .line 165
    .line 166
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    check-cast v0, Landroid/widget/LinearLayout;

    .line 171
    .line 172
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;->o:Landroid/widget/LinearLayout;

    .line 173
    .line 174
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    check-cast p1, Landroid/view/ViewGroup;

    .line 179
    .line 180
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    check-cast p1, Lv/VText;

    .line 185
    .line 186
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;->p:Lv/VText;

    .line 187
    .line 188
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/qec0;->Y:I

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
    invoke-static {p0, p1}, Ll/uck;->a(Lcom/p1/mobile/putong/core/ui/greet/GreetMessageUserHeaderLayout;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
