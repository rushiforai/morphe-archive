.class public Lcom/immomo/velib/anim/path/PathView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/Path;",
            ">;"
        }
    .end annotation
.end field

.field b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/dj60;",
            ">;"
        }
    .end annotation
.end field

.field c:Landroid/graphics/Paint;

.field d:Ll/dj60;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/immomo/velib/anim/path/PathView;->a:Ljava/util/List;

    .line 10
    .line 11
    new-instance p1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/immomo/velib/anim/path/PathView;->b:Ljava/util/List;

    .line 17
    .line 18
    invoke-direct {p0}, Lcom/immomo/velib/anim/path/PathView;->a()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 22
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 23
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/immomo/velib/anim/path/PathView;->a:Ljava/util/List;

    .line 24
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/immomo/velib/anim/path/PathView;->b:Ljava/util/List;

    .line 25
    invoke-direct {p0}, Lcom/immomo/velib/anim/path/PathView;->a()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 26
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 27
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/immomo/velib/anim/path/PathView;->a:Ljava/util/List;

    .line 28
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/immomo/velib/anim/path/PathView;->b:Ljava/util/List;

    .line 29
    invoke-direct {p0}, Lcom/immomo/velib/anim/path/PathView;->a()V

    return-void
.end method

.method private a()V
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Lcom/immomo/velib/anim/path/PathView;->c:Landroid/graphics/Paint;

    .line 8
    .line 9
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/immomo/velib/anim/path/PathView;->c:Landroid/graphics/Paint;

    .line 15
    .line 16
    const/high16 v1, -0x10000

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/immomo/velib/anim/path/PathView;->c:Landroid/graphics/Paint;

    .line 22
    .line 23
    const/high16 v0, 0x40a00000    # 5.0f

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 26
    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 7

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/immomo/velib/anim/path/PathView;->a:Ljava/util/List;

    .line 5
    .line 6
    const/high16 v1, -0x10000

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/immomo/velib/anim/path/PathView;->c:Landroid/graphics/Paint;

    .line 12
    .line 13
    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 14
    .line 15
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/immomo/velib/anim/path/PathView;->c:Landroid/graphics/Paint;

    .line 19
    .line 20
    const/16 v3, -0x100

    .line 21
    .line 22
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 23
    .line 24
    .line 25
    move v0, v2

    .line 26
    :goto_0
    iget-object v3, p0, Lcom/immomo/velib/anim/path/PathView;->a:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-ge v0, v3, :cond_1

    .line 33
    .line 34
    iget-object v3, p0, Lcom/immomo/velib/anim/path/PathView;->c:Landroid/graphics/Paint;

    .line 35
    .line 36
    if-nez v0, :cond_0

    .line 37
    .line 38
    const v4, -0xff0100

    .line 39
    .line 40
    .line 41
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 42
    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_0
    invoke-virtual {v3, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 46
    .line 47
    .line 48
    :goto_1
    iget-object v3, p0, Lcom/immomo/velib/anim/path/PathView;->a:Ljava/util/List;

    .line 49
    .line 50
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    check-cast v3, Landroid/graphics/Path;

    .line 55
    .line 56
    iget-object v4, p0, Lcom/immomo/velib/anim/path/PathView;->c:Landroid/graphics/Paint;

    .line 57
    .line 58
    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 59
    .line 60
    .line 61
    add-int/lit8 v0, v0, 0x1

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    iget-object v0, p0, Lcom/immomo/velib/anim/path/PathView;->c:Landroid/graphics/Paint;

    .line 65
    .line 66
    sget-object v3, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    .line 67
    .line 68
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/immomo/velib/anim/path/PathView;->c:Landroid/graphics/Paint;

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/immomo/velib/anim/path/PathView;->d:Ll/dj60;

    .line 77
    .line 78
    if-eqz v0, :cond_2

    .line 79
    .line 80
    iget v1, v0, Ll/dj60;->a:F

    .line 81
    .line 82
    iget v0, v0, Ll/dj60;->b:F

    .line 83
    .line 84
    const/high16 v3, 0x41a00000    # 20.0f

    .line 85
    .line 86
    iget-object v4, p0, Lcom/immomo/velib/anim/path/PathView;->c:Landroid/graphics/Paint;

    .line 87
    .line 88
    invoke-virtual {p1, v1, v0, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 89
    .line 90
    .line 91
    :cond_2
    iget-object v0, p0, Lcom/immomo/velib/anim/path/PathView;->b:Ljava/util/List;

    .line 92
    .line 93
    if-eqz v0, :cond_7

    .line 94
    .line 95
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-lez v0, :cond_7

    .line 100
    .line 101
    iget-object v0, p0, Lcom/immomo/velib/anim/path/PathView;->c:Landroid/graphics/Paint;

    .line 102
    .line 103
    const v1, -0xffff01

    .line 104
    .line 105
    .line 106
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 107
    .line 108
    .line 109
    :goto_2
    iget-object v0, p0, Lcom/immomo/velib/anim/path/PathView;->b:Ljava/util/List;

    .line 110
    .line 111
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-ge v2, v0, :cond_7

    .line 116
    .line 117
    iget-object v0, p0, Lcom/immomo/velib/anim/path/PathView;->b:Ljava/util/List;

    .line 118
    .line 119
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    check-cast v0, Ll/dj60;

    .line 124
    .line 125
    iget v1, v0, Ll/dj60;->a:F

    .line 126
    .line 127
    iget v3, v0, Ll/dj60;->b:F

    .line 128
    .line 129
    iget-object v4, p0, Lcom/immomo/velib/anim/path/PathView;->c:Landroid/graphics/Paint;

    .line 130
    .line 131
    const/high16 v5, 0x41200000    # 10.0f

    .line 132
    .line 133
    invoke-virtual {p1, v1, v3, v5, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 134
    .line 135
    .line 136
    iget v1, v0, Ll/dj60;->c:F

    .line 137
    .line 138
    const/4 v3, 0x0

    .line 139
    cmpl-float v4, v1, v3

    .line 140
    .line 141
    if-gtz v4, :cond_3

    .line 142
    .line 143
    iget v4, v0, Ll/dj60;->d:F

    .line 144
    .line 145
    cmpl-float v4, v4, v3

    .line 146
    .line 147
    if-lez v4, :cond_4

    .line 148
    .line 149
    :cond_3
    iget v4, v0, Ll/dj60;->d:F

    .line 150
    .line 151
    iget-object v6, p0, Lcom/immomo/velib/anim/path/PathView;->c:Landroid/graphics/Paint;

    .line 152
    .line 153
    invoke-virtual {p1, v1, v4, v5, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 154
    .line 155
    .line 156
    :cond_4
    iget v1, v0, Ll/dj60;->e:F

    .line 157
    .line 158
    cmpl-float v4, v1, v3

    .line 159
    .line 160
    if-gtz v4, :cond_5

    .line 161
    .line 162
    iget v4, v0, Ll/dj60;->f:F

    .line 163
    .line 164
    cmpl-float v3, v4, v3

    .line 165
    .line 166
    if-lez v3, :cond_6

    .line 167
    .line 168
    :cond_5
    iget v0, v0, Ll/dj60;->f:F

    .line 169
    .line 170
    iget-object v3, p0, Lcom/immomo/velib/anim/path/PathView;->c:Landroid/graphics/Paint;

    .line 171
    .line 172
    invoke-virtual {p1, v1, v0, v5, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 173
    .line 174
    .line 175
    :cond_6
    add-int/lit8 v2, v2, 0x1

    .line 176
    .line 177
    goto :goto_2

    .line 178
    :cond_7
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setPath(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/graphics/Path;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/immomo/velib/anim/path/PathView;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/immomo/velib/anim/path/PathView;->a:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/immomo/velib/anim/path/PathView;->a:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public setPathPoint(Ll/dj60;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/anim/path/PathView;->d:Ll/dj60;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setPathPoints(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/dj60;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/immomo/velib/anim/path/PathView;->b:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
