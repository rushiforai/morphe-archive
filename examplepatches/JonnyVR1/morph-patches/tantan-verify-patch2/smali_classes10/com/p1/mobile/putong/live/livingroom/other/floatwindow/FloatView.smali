.class public Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/lwl;


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Landroid/view/View;

.field public c:Landroid/view/ViewStub;

.field public d:Lv/VText;

.field public e:Lv/VImage;

.field public f:Lv/VImage;

.field public g:F

.field public h:F

.field public i:F

.field public j:F

.field public k:F

.field public l:F

.field public m:Landroid/content/Context;

.field public n:J

.field public o:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;

.field public p:Z

.field public q:Ll/fyd0;

.field public r:Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;

.field public s:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;

.field public t:Landroid/view/WindowManager$LayoutParams;

.field public u:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Landroid/view/WindowManager$LayoutParams;",
            ">;"
        }
    .end annotation
.end field

.field public v:Ll/fti;

.field public w:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/eti;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 16
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 15
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->p:Z

    .line 6
    .line 7
    new-instance p1, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->w:Ljava/util/List;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->l(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->r()V

    return-void
.end method

.method private getBottomMargin()I
    .locals 0

    .line 1
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {p0}, Ll/ynp0;->y(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 10
    .line 11
    invoke-static {p0}, Ll/bnl0;->I(Landroid/content/Context;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method private getTopMargin()I
    .locals 0

    .line 1
    invoke-static {}, Ll/bnl0;->F0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/gti;->a(Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public e(Ll/eti;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->w:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final f(Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;)V
    .locals 11

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v1, v0, [I

    .line 3
    .line 4
    invoke-virtual {p0, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 5
    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez p1, :cond_1

    .line 9
    .line 10
    aget p1, v1, v2

    .line 11
    .line 12
    int-to-float p1, p1

    .line 13
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->v:Ll/fti;

    .line 14
    .line 15
    iget v4, v3, Ll/fti;->g:I

    .line 16
    .line 17
    int-to-float v4, v4

    .line 18
    sub-float/2addr v4, p1

    .line 19
    iget v3, v3, Ll/fti;->e:I

    .line 20
    .line 21
    int-to-float v3, v3

    .line 22
    sub-float/2addr v4, v3

    .line 23
    cmpg-float p1, p1, v4

    .line 24
    .line 25
    if-gez p1, :cond_0

    .line 26
    .line 27
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;->Left:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;->Right:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;

    .line 31
    .line 32
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->getTopMargin()I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    sget-object v4, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView$a;->a:[I

    .line 37
    .line 38
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    aget v4, v4, v5

    .line 43
    .line 44
    const/4 v5, 0x1

    .line 45
    if-eq v4, v5, :cond_5

    .line 46
    .line 47
    if-eq v4, v0, :cond_4

    .line 48
    .line 49
    const/4 v0, 0x3

    .line 50
    if-eq v4, v0, :cond_3

    .line 51
    .line 52
    const/4 v0, 0x4

    .line 53
    if-eq v4, v0, :cond_2

    .line 54
    .line 55
    goto/16 :goto_2

    .line 56
    .line 57
    :cond_2
    aget v0, v1, v2

    .line 58
    .line 59
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->v:Ll/fti;

    .line 60
    .line 61
    iget v4, v3, Ll/fti;->h:I

    .line 62
    .line 63
    iget v3, v3, Ll/fti;->f:I

    .line 64
    .line 65
    sub-int/2addr v4, v3

    .line 66
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->getBottomMargin()I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    sub-int v3, v4, v3

    .line 71
    .line 72
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->o:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;

    .line 73
    .line 74
    sget-object v5, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;->Bottom:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;

    .line 75
    .line 76
    iget-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->t:Landroid/view/WindowManager$LayoutParams;

    .line 77
    .line 78
    iget v7, v6, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 79
    .line 80
    int-to-float v7, v7

    .line 81
    iget v6, v6, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 82
    .line 83
    int-to-float v6, v6

    .line 84
    aget v1, v1, v2

    .line 85
    .line 86
    int-to-float v8, v1

    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->v:Ll/fti;

    .line 88
    .line 89
    iget v2, v1, Ll/fti;->h:I

    .line 90
    .line 91
    iget v1, v1, Ll/fti;->f:I

    .line 92
    .line 93
    sub-int/2addr v2, v1

    .line 94
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->getBottomMargin()I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    sub-int/2addr v2, v1

    .line 99
    int-to-float v9, v2

    .line 100
    move v10, v7

    .line 101
    move v7, v6

    .line 102
    move v6, v10

    .line 103
    invoke-virtual/range {v4 .. v9}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->a(Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;FFFF)V

    .line 104
    .line 105
    .line 106
    :goto_1
    move v2, v0

    .line 107
    goto :goto_2

    .line 108
    :cond_3
    aget v0, v1, v2

    .line 109
    .line 110
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->getTopMargin()I

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->o:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;

    .line 115
    .line 116
    sget-object v5, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;->Top:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;

    .line 117
    .line 118
    iget-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->t:Landroid/view/WindowManager$LayoutParams;

    .line 119
    .line 120
    iget v7, v6, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 121
    .line 122
    int-to-float v7, v7

    .line 123
    iget v6, v6, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 124
    .line 125
    int-to-float v6, v6

    .line 126
    aget v1, v1, v2

    .line 127
    .line 128
    int-to-float v8, v1

    .line 129
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->getTopMargin()I

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    int-to-float v9, v1

    .line 134
    move v10, v7

    .line 135
    move v7, v6

    .line 136
    move v6, v10

    .line 137
    invoke-virtual/range {v4 .. v9}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->a(Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;FFFF)V

    .line 138
    .line 139
    .line 140
    goto :goto_1

    .line 141
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->v:Ll/fti;

    .line 142
    .line 143
    iget v2, v0, Ll/fti;->g:I

    .line 144
    .line 145
    iget v0, v0, Ll/fti;->e:I

    .line 146
    .line 147
    sub-int v3, v2, v0

    .line 148
    .line 149
    aget v1, v1, v5

    .line 150
    .line 151
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->o:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;

    .line 152
    .line 153
    sget-object v5, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;->Right:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;

    .line 154
    .line 155
    iget-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->t:Landroid/view/WindowManager$LayoutParams;

    .line 156
    .line 157
    iget v7, v6, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 158
    .line 159
    int-to-float v7, v7

    .line 160
    iget v6, v6, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 161
    .line 162
    int-to-float v6, v6

    .line 163
    sub-int/2addr v2, v0

    .line 164
    int-to-float v8, v2

    .line 165
    int-to-float v9, v1

    .line 166
    move v10, v7

    .line 167
    move v7, v6

    .line 168
    move v6, v10

    .line 169
    invoke-virtual/range {v4 .. v9}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->a(Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;FFFF)V

    .line 170
    .line 171
    .line 172
    move v2, v3

    .line 173
    move v3, v1

    .line 174
    goto :goto_2

    .line 175
    :cond_5
    aget v3, v1, v5

    .line 176
    .line 177
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->o:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;

    .line 178
    .line 179
    sget-object v5, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;->Left:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;

    .line 180
    .line 181
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->t:Landroid/view/WindowManager$LayoutParams;

    .line 182
    .line 183
    iget v1, v0, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 184
    .line 185
    int-to-float v6, v1

    .line 186
    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 187
    .line 188
    int-to-float v7, v0

    .line 189
    const/4 v8, 0x0

    .line 190
    int-to-float v9, v3

    .line 191
    invoke-virtual/range {v4 .. v9}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->a(Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;FFFF)V

    .line 192
    .line 193
    .line 194
    :goto_2
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->q:Ll/fyd0;

    .line 195
    .line 196
    int-to-double v5, v2

    .line 197
    int-to-double v7, v3

    .line 198
    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v9

    .line 202
    invoke-virtual/range {v4 .. v9}, Ll/fyd0;->g(DDLjava/lang/String;)Z

    .line 203
    .line 204
    .line 205
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->s:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;

    .line 206
    .line 207
    return-void
.end method

.method public g(F)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->h(F)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->a:Landroid/widget/FrameLayout;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->v:Ll/fti;

    .line 11
    .line 12
    iget v1, v0, Ll/fti;->a:I

    .line 13
    .line 14
    iput v1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 15
    .line 16
    iget v0, v0, Ll/fti;->b:I

    .line 17
    .line 18
    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->a:Landroid/widget/FrameLayout;

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->e:Lv/VImage;

    .line 26
    .line 27
    new-instance v0, Ll/ati;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Ll/ati;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->f:Lv/VImage;

    .line 36
    .line 37
    new-instance v0, Ll/bti;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Ll/bti;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;)V

    .line 40
    .line 41
    .line 42
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 43
    .line 44
    .line 45
    new-instance p1, Ll/cti;

    .line 46
    .line 47
    invoke-direct {p1, p0}, Ll/cti;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public getPlayerContainer()Landroid/widget/FrameLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->a:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getWindowParams()Landroid/view/WindowManager$LayoutParams;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->t:Landroid/view/WindowManager$LayoutParams;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h(F)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->m:Landroid/content/Context;

    .line 6
    .line 7
    sget-object v0, Ll/htd0;->e:Ll/htd0;

    .line 8
    .line 9
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ll/ifv;

    .line 14
    .line 15
    iget-object v0, v0, Ll/ifv;->s:Ll/fyd0;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->q:Ll/fyd0;

    .line 18
    .line 19
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;

    .line 20
    .line 21
    new-instance v1, Ll/dti;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/dti;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;)V

    .line 24
    .line 25
    .line 26
    const/16 v2, 0x320

    .line 27
    .line 28
    invoke-direct {v0, v1, p0, v2}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;-><init>(Ll/z20;Landroid/view/View;I)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->o:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->i(F)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->j()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final i(F)V
    .locals 9

    .line 1
    new-instance v0, Ll/fti;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/fti;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->v:Ll/fti;

    .line 7
    .line 8
    invoke-static {}, Ll/bnl0;->y0()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget-object v1, v1, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Landroid/content/Context;

    .line 31
    .line 32
    :goto_0
    if-nez v1, :cond_1

    .line 33
    .line 34
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 35
    .line 36
    :cond_1
    invoke-static {v1}, Ll/bnl0;->x0(Landroid/content/Context;)I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-static {p1}, Ll/vti;->a(F)[I

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    const/4 v2, 0x0

    .line 45
    aget v2, p1, v2

    .line 46
    .line 47
    const/4 v3, 0x1

    .line 48
    aget p1, p1, v3

    .line 49
    .line 50
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->v:Ll/fti;

    .line 51
    .line 52
    iput v2, v3, Ll/fti;->a:I

    .line 53
    .line 54
    iput p1, v3, Ll/fti;->b:I

    .line 55
    .line 56
    iput v2, v3, Ll/fti;->e:I

    .line 57
    .line 58
    iput p1, v3, Ll/fti;->f:I

    .line 59
    .line 60
    iput v0, v3, Ll/fti;->g:I

    .line 61
    .line 62
    iput v1, v3, Ll/fti;->h:I

    .line 63
    .line 64
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->q:Ll/fyd0;

    .line 65
    .line 66
    invoke-virtual {v3}, Ll/fyd0;->d()D

    .line 67
    .line 68
    .line 69
    move-result-wide v3

    .line 70
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->q:Ll/fyd0;

    .line 71
    .line 72
    invoke-virtual {v5}, Ll/fyd0;->e()D

    .line 73
    .line 74
    .line 75
    move-result-wide v5

    .line 76
    iget-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->q:Ll/fyd0;

    .line 77
    .line 78
    invoke-virtual {v7}, Ll/fyd0;->c()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v7

    .line 82
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 83
    .line 84
    .line 85
    move-result v8

    .line 86
    if-nez v8, :cond_3

    .line 87
    .line 88
    sget-object v8, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;->Right:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;

    .line 89
    .line 90
    invoke-virtual {v8}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v8

    .line 94
    invoke-static {v7, v8}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 95
    .line 96
    .line 97
    move-result v8

    .line 98
    if-eqz v8, :cond_2

    .line 99
    .line 100
    sub-int p1, v0, v2

    .line 101
    .line 102
    int-to-double v3, p1

    .line 103
    goto :goto_1

    .line 104
    :cond_2
    sget-object v8, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;->Bottom:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;

    .line 105
    .line 106
    invoke-virtual {v8}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v8

    .line 110
    invoke-static {v7, v8}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 111
    .line 112
    .line 113
    move-result v7

    .line 114
    if-eqz v7, :cond_3

    .line 115
    .line 116
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->getBottomMargin()I

    .line 117
    .line 118
    .line 119
    move-result v5

    .line 120
    add-int/2addr p1, v5

    .line 121
    sub-int p1, v1, p1

    .line 122
    .line 123
    int-to-double v5, p1

    .line 124
    :cond_3
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->v:Ll/fti;

    .line 125
    .line 126
    const-wide/16 v7, 0x0

    .line 127
    .line 128
    cmpg-double p1, v3, v7

    .line 129
    .line 130
    if-gez p1, :cond_4

    .line 131
    .line 132
    sub-int/2addr v0, v2

    .line 133
    goto :goto_2

    .line 134
    :cond_4
    double-to-int v0, v3

    .line 135
    :goto_2
    iput v0, p0, Ll/fti;->c:I

    .line 136
    .line 137
    cmpg-double p1, v5, v7

    .line 138
    .line 139
    if-gez p1, :cond_5

    .line 140
    .line 141
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    invoke-virtual {p1, v1}, Ll/vwt;->p5(I)I

    .line 146
    .line 147
    .line 148
    move-result p1

    .line 149
    goto :goto_3

    .line 150
    :cond_5
    double-to-int p1, v5

    .line 151
    :goto_3
    iput p1, p0, Ll/fti;->d:I

    .line 152
    .line 153
    return-void
.end method

.method public final j()V
    .locals 3

    .line 1
    new-instance v0, Landroid/view/WindowManager$LayoutParams;

    .line 2
    .line 3
    const/4 v1, -0x2

    .line 4
    invoke-direct {v0, v1, v1}, Landroid/view/WindowManager$LayoutParams;-><init>(II)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->t:Landroid/view/WindowManager$LayoutParams;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->m:Landroid/content/Context;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iput-object v1, v0, Landroid/view/WindowManager$LayoutParams;->packageName:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->t:Landroid/view/WindowManager$LayoutParams;

    .line 18
    .line 19
    const v1, 0x30388

    .line 20
    .line 21
    .line 22
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 23
    .line 24
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 25
    .line 26
    const/16 v2, 0x1a

    .line 27
    .line 28
    if-lt v1, v2, :cond_0

    .line 29
    .line 30
    const/16 v1, 0x7f6

    .line 31
    .line 32
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->type:I

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/16 v1, 0x7d3

    .line 36
    .line 37
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->type:I

    .line 38
    .line 39
    :goto_0
    const/4 v1, 0x1

    .line 40
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->format:I

    .line 41
    .line 42
    const v1, 0x800033

    .line 43
    .line 44
    .line 45
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->v:Ll/fti;

    .line 48
    .line 49
    iget v1, p0, Ll/fti;->a:I

    .line 50
    .line 51
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 52
    .line 53
    iget v1, p0, Ll/fti;->b:I

    .line 54
    .line 55
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 56
    .line 57
    iget v1, p0, Ll/fti;->c:I

    .line 58
    .line 59
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 60
    .line 61
    iget p0, p0, Ll/fti;->d:I

    .line 62
    .line 63
    iput p0, v0, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 64
    .line 65
    return-void
.end method

.method public final k()Z
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->m:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->k:F

    .line 12
    .line 13
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->i:F

    .line 14
    .line 15
    sub-float/2addr v1, v2

    .line 16
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    int-to-float v0, v0

    .line 21
    cmpl-float v1, v1, v0

    .line 22
    .line 23
    const/4 v2, 0x1

    .line 24
    const/4 v3, 0x0

    .line 25
    if-gtz v1, :cond_1

    .line 26
    .line 27
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->l:F

    .line 28
    .line 29
    iget v4, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->j:F

    .line 30
    .line 31
    sub-float/2addr v1, v4

    .line 32
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    cmpl-float v0, v1, v0

    .line 37
    .line 38
    if-lez v0, :cond_0

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    move v0, v3

    .line 42
    goto :goto_1

    .line 43
    :cond_1
    :goto_0
    move v0, v2

    .line 44
    :goto_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 45
    .line 46
    .line 47
    move-result-wide v4

    .line 48
    iget-wide v6, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->n:J

    .line 49
    .line 50
    sub-long/2addr v4, v6

    .line 51
    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    int-to-long v6, p0

    .line 56
    cmp-long p0, v4, v6

    .line 57
    .line 58
    if-gez p0, :cond_2

    .line 59
    .line 60
    move p0, v2

    .line 61
    goto :goto_2

    .line 62
    :cond_2
    move p0, v3

    .line 63
    :goto_2
    if-nez v0, :cond_3

    .line 64
    .line 65
    if-eqz p0, :cond_3

    .line 66
    .line 67
    return v2

    .line 68
    :cond_3
    return v3
.end method

.method public final synthetic l(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->w:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Ll/eti;

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    invoke-interface {p1, v0}, Ll/eti;->b(Z)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-void
.end method

.method public m(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->r:Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->c:Landroid/view/ViewStub;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->r:Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->r:Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;

    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->r:Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->g()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/view/LiveLoadingView;->h()V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->c:Landroid/view/ViewStub;

    .line 33
    .line 34
    const/4 p1, 0x0

    .line 35
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->d:Lv/VText;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->d:Lv/VText;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public o(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->d:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->d:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->o:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->b()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v0, :cond_6

    .line 8
    .line 9
    if-eq v0, v2, :cond_2

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    if-eq v0, v1, :cond_0

    .line 13
    .line 14
    goto/16 :goto_1

    .line 15
    .line 16
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->i:F

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->j:F

    .line 27
    .line 28
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->p:Z

    .line 29
    .line 30
    if-nez p1, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->k()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    xor-int/2addr p1, v2

    .line 37
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->p:Z

    .line 38
    .line 39
    goto/16 :goto_1

    .line 40
    .line 41
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->u()V

    .line 42
    .line 43
    .line 44
    goto/16 :goto_1

    .line 45
    .line 46
    :cond_2
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->p:Z

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->k()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->w:Ljava/util/List;

    .line 55
    .line 56
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-eqz p1, :cond_7

    .line 65
    .line 66
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    check-cast p1, Ll/eti;

    .line 71
    .line 72
    invoke-interface {p1}, Ll/eti;->a()V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->i:F

    .line 81
    .line 82
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->j:F

    .line 87
    .line 88
    iget p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->i:F

    .line 89
    .line 90
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->g:F

    .line 91
    .line 92
    sub-float/2addr p1, v0

    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->v:Ll/fti;

    .line 94
    .line 95
    iget v1, v0, Ll/fti;->e:I

    .line 96
    .line 97
    int-to-float v1, v1

    .line 98
    const/high16 v3, 0x40000000    # 2.0f

    .line 99
    .line 100
    div-float/2addr v1, v3

    .line 101
    neg-float v3, v1

    .line 102
    cmpg-float v3, p1, v3

    .line 103
    .line 104
    if-ltz v3, :cond_4

    .line 105
    .line 106
    add-float/2addr p1, v1

    .line 107
    iget v0, v0, Ll/fti;->g:I

    .line 108
    .line 109
    int-to-float v0, v0

    .line 110
    cmpl-float p1, p1, v0

    .line 111
    .line 112
    if-lez p1, :cond_5

    .line 113
    .line 114
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->w:Ljava/util/List;

    .line 115
    .line 116
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    if-nez p1, :cond_5

    .line 121
    .line 122
    goto :goto_1

    .line 123
    :cond_5
    const/4 p1, 0x0

    .line 124
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->f(Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;)V

    .line 125
    .line 126
    .line 127
    goto :goto_1

    .line 128
    :cond_6
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->p:Z

    .line 129
    .line 130
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->o:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;

    .line 131
    .line 132
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/AnimatorWrapper;->b()V

    .line 133
    .line 134
    .line 135
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 136
    .line 137
    .line 138
    move-result-wide v0

    .line 139
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->n:J

    .line 140
    .line 141
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->g:F

    .line 146
    .line 147
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->h:F

    .line 152
    .line 153
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->k:F

    .line 158
    .line 159
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 160
    .line 161
    .line 162
    move-result p1

    .line 163
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->l:F

    .line 164
    .line 165
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->k:F

    .line 166
    .line 167
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->i:F

    .line 168
    .line 169
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->j:F

    .line 170
    .line 171
    :cond_7
    :goto_1
    return v2
.end method

.method public p(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->b:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic q(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->f:Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    xor-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->w:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Ll/eti;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->f:Lv/VImage;

    .line 31
    .line 32
    invoke-virtual {v1}, Landroid/view/View;->isSelected()Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    invoke-interface {v0, v1}, Ll/eti;->c(Z)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    return-void
.end method

.method public final synthetic r()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->v:Ll/fti;

    .line 2
    .line 3
    iget v1, v0, Ll/fti;->e:I

    .line 4
    .line 5
    iget v0, v0, Ll/fti;->f:I

    .line 6
    .line 7
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->v(II)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public s(II)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->t(II)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->v:Ll/fti;

    .line 5
    .line 6
    iput p1, v0, Ll/fti;->a:I

    .line 7
    .line 8
    iput p1, v0, Ll/fti;->e:I

    .line 9
    .line 10
    iput p2, v0, Ll/fti;->b:I

    .line 11
    .line 12
    iput p2, v0, Ll/fti;->f:I

    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->s:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->f(Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/MoveDirection;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public setUpdateWindowAction(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Landroid/view/WindowManager$LayoutParams;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->u:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public setVoiceSelected(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->f:Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->a:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 8
    .line 9
    iput p2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->a:Landroid/widget/FrameLayout;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final u()V
    .locals 5

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->i:F

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->g:F

    .line 4
    .line 5
    sub-float/2addr v0, v1

    .line 6
    float-to-int v0, v0

    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->j:F

    .line 8
    .line 9
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->h:F

    .line 10
    .line 11
    sub-float/2addr v1, v2

    .line 12
    float-to-int v1, v1

    .line 13
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->getTopMargin()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-ge v1, v2, :cond_0

    .line 18
    .line 19
    move v1, v2

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->v:Ll/fti;

    .line 22
    .line 23
    iget v3, v2, Ll/fti;->h:I

    .line 24
    .line 25
    iget v2, v2, Ll/fti;->f:I

    .line 26
    .line 27
    sub-int v4, v3, v2

    .line 28
    .line 29
    if-le v1, v4, :cond_1

    .line 30
    .line 31
    sub-int v1, v3, v2

    .line 32
    .line 33
    :cond_1
    :goto_0
    if-gez v0, :cond_2

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    goto :goto_1

    .line 37
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->v:Ll/fti;

    .line 38
    .line 39
    iget v3, v2, Ll/fti;->g:I

    .line 40
    .line 41
    iget v2, v2, Ll/fti;->e:I

    .line 42
    .line 43
    sub-int v4, v3, v2

    .line 44
    .line 45
    if-le v0, v4, :cond_3

    .line 46
    .line 47
    sub-int v0, v3, v2

    .line 48
    .line 49
    :cond_3
    :goto_1
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->w(II)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final v(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->t:Landroid/view/WindowManager$LayoutParams;

    .line 2
    .line 3
    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 4
    .line 5
    iput p2, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->u:Ll/y20;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public w(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->t:Landroid/view/WindowManager$LayoutParams;

    .line 2
    .line 3
    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 4
    .line 5
    iput p2, v0, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->u:Ll/y20;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
