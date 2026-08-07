.class public Lcom/p1/mobile/putong/core/view/CardLabelShowView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:I

.field public volatile b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/NewTags;",
            ">;"
        }
    .end annotation
.end field

.field public volatile c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/NewTags;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/NewTags;",
            ">;"
        }
    .end annotation
.end field

.field public volatile e:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field public f:Landroid/graphics/Paint;

.field public g:Landroid/graphics/Paint;

.field public h:Landroid/graphics/Paint;

.field public i:Landroid/graphics/Paint;

.field public j:Landroid/graphics/Paint;

.field public k:Landroid/graphics/Paint;

.field public l:I

.field public m:I

.field public n:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/RectF;",
            ">;"
        }
    .end annotation
.end field

.field public o:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/RectF;",
            ">;"
        }
    .end annotation
.end field

.field public p:I

.field public q:I

.field public r:Z

.field public s:I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation
.end field

.field public t:I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 65
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/view/CardLabelShowView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 64
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/view/CardLabelShowView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x2

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->a:I

    .line 6
    .line 7
    new-instance p1, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->b:Ljava/util/List;

    .line 13
    .line 14
    new-instance p1, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->c:Ljava/util/List;

    .line 20
    .line 21
    new-instance p1, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->d:Ljava/util/List;

    .line 27
    .line 28
    new-instance p1, Ljava/util/HashMap;

    .line 29
    .line 30
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->e:Ljava/util/HashMap;

    .line 34
    .line 35
    const/4 p1, 0x0

    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->i:Landroid/graphics/Paint;

    .line 37
    .line 38
    new-instance p1, Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->n:Ljava/util/List;

    .line 44
    .line 45
    new-instance p1, Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 48
    .line 49
    .line 50
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->o:Ljava/util/List;

    .line 51
    .line 52
    const/high16 p1, 0x40c00000    # 6.0f

    .line 53
    .line 54
    invoke-static {p1}, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->a(F)I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    iput p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->q:I

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->b()V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public static a(F)I
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 12
    .line 13
    mul-float/2addr v0, p0

    .line 14
    float-to-int p0, v0

    .line 15
    return p0
.end method


# virtual methods
.method public final b()V
    .locals 5

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->f:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->f:Landroid/graphics/Paint;

    .line 13
    .line 14
    sget-object v2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 15
    .line 16
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    sget v3, Ll/c9c0;->O:I

    .line 21
    .line 22
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->f:Landroid/graphics/Paint;

    .line 30
    .line 31
    sget-object v2, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 34
    .line 35
    .line 36
    new-instance v0, Landroid/graphics/Paint;

    .line 37
    .line 38
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->g:Landroid/graphics/Paint;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->g:Landroid/graphics/Paint;

    .line 47
    .line 48
    sget-object v3, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 49
    .line 50
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    sget v4, Ll/c9c0;->k0:I

    .line 55
    .line 56
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->g:Landroid/graphics/Paint;

    .line 64
    .line 65
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 66
    .line 67
    .line 68
    new-instance v0, Landroid/graphics/Paint;

    .line 69
    .line 70
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 71
    .line 72
    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->h:Landroid/graphics/Paint;

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->h:Landroid/graphics/Paint;

    .line 79
    .line 80
    sget-object v3, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 81
    .line 82
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    sget v4, Ll/c9c0;->S0:I

    .line 87
    .line 88
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->h:Landroid/graphics/Paint;

    .line 96
    .line 97
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 98
    .line 99
    .line 100
    new-instance v0, Landroid/graphics/Paint;

    .line 101
    .line 102
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 103
    .line 104
    .line 105
    iput-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->j:Landroid/graphics/Paint;

    .line 106
    .line 107
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 108
    .line 109
    .line 110
    new-instance v0, Landroid/graphics/Paint;

    .line 111
    .line 112
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 113
    .line 114
    .line 115
    iput-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->k:Landroid/graphics/Paint;

    .line 116
    .line 117
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->k:Landroid/graphics/Paint;

    .line 121
    .line 122
    const-string v2, "#FFFFFF"

    .line 123
    .line 124
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->k:Landroid/graphics/Paint;

    .line 132
    .line 133
    const/high16 v2, 0x41400000    # 12.0f

    .line 134
    .line 135
    invoke-static {v2}, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->a(F)I

    .line 136
    .line 137
    .line 138
    move-result v2

    .line 139
    int-to-float v2, v2

    .line 140
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 141
    .line 142
    .line 143
    new-instance v0, Landroid/graphics/Rect;

    .line 144
    .line 145
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 146
    .line 147
    .line 148
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->k:Landroid/graphics/Paint;

    .line 149
    .line 150
    const-string v3, "\u9ad8"

    .line 151
    .line 152
    const/4 v4, 0x0

    .line 153
    invoke-virtual {v2, v3, v4, v1, v0}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 154
    .line 155
    .line 156
    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 157
    .line 158
    iget v0, v0, Landroid/graphics/Rect;->top:I

    .line 159
    .line 160
    sub-int/2addr v1, v0

    .line 161
    const/high16 v0, 0x41c00000    # 24.0f

    .line 162
    .line 163
    invoke-static {v0}, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->a(F)I

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    sub-int/2addr v0, v1

    .line 168
    div-int/lit8 v0, v0, 0x2

    .line 169
    .line 170
    add-int/2addr v0, v1

    .line 171
    const/high16 v1, 0x3f800000    # 1.0f

    .line 172
    .line 173
    invoke-static {v1}, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->a(F)I

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    sub-int/2addr v0, v1

    .line 178
    iput v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->m:I

    .line 179
    .line 180
    return-void
.end method

.method public c(Ljava/util/List;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/NewTags;",
            ">;)Z"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->r:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_5

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->c:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->c:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eq v0, v2, :cond_2

    .line 33
    .line 34
    return v1

    .line 35
    :cond_2
    const/4 v0, 0x0

    .line 36
    move v2, v0

    .line 37
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-ge v2, v3, :cond_4

    .line 42
    .line 43
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    check-cast v3, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 48
    .line 49
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 50
    .line 51
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->c:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    check-cast v4, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 58
    .line 59
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    if-nez v3, :cond_3

    .line 66
    .line 67
    return v1

    .line 68
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_4
    return v0

    .line 72
    :cond_5
    :goto_1
    return v1
.end method

.method public d(Ljava/util/List;Z)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/NewTags;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->r:Z

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->c(Ljava/util/List;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->d:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 13
    .line 14
    .line 15
    iget-object p2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->b:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 18
    .line 19
    .line 20
    iget-object p2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->b:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {p2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->e:Ljava/util/HashMap;

    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/util/HashMap;->clear()V

    .line 28
    .line 29
    .line 30
    const/4 p1, 0x0

    .line 31
    move p2, p1

    .line 32
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->b:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-ge p2, v0, :cond_2

    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->b:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/NewTags;->localTagCategories:Ljava/util/List;

    .line 49
    .line 50
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_1

    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->b:Ljava/util/List;

    .line 57
    .line 58
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    check-cast v0, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 63
    .line 64
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/NewTags;->localTagCategories:Ljava/util/List;

    .line 65
    .line 66
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Lcom/p1/mobile/putong/core/data/TagCategories;

    .line 71
    .line 72
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 73
    .line 74
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/TagCategories;->iconWhite:Ljava/lang/String;

    .line 75
    .line 76
    new-instance v3, Lcom/p1/mobile/putong/core/view/CardLabelShowView$a;

    .line 77
    .line 78
    invoke-direct {v3, p0, v0}, Lcom/p1/mobile/putong/core/view/CardLabelShowView$a;-><init>(Lcom/p1/mobile/putong/core/view/CardLabelShowView;Lcom/p1/mobile/putong/core/data/TagCategories;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v1, v2, v3}, Ll/fsb0;->I(Ljava/lang/String;Ll/y20;)V

    .line 82
    .line 83
    .line 84
    :cond_1
    add-int/lit8 p2, p2, 0x1

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public e(II)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->s:I

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->t:I

    .line 4
    .line 5
    new-instance p1, Landroid/graphics/Paint;

    .line 6
    .line 7
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->i:Landroid/graphics/Paint;

    .line 11
    .line 12
    const/4 p2, 0x1

    .line 13
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->i:Landroid/graphics/Paint;

    .line 17
    .line 18
    sget-object p1, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 12

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    move v1, v0

    .line 6
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->d:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-ge v1, v2, :cond_4

    .line 13
    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->n:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Landroid/graphics/RectF;

    .line 21
    .line 22
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->d:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    check-cast v3, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 29
    .line 30
    iget-boolean v3, v3, Lcom/p1/mobile/putong/core/data/NewTags;->localIsCommonLabel:Z

    .line 31
    .line 32
    if-nez v3, :cond_0

    .line 33
    .line 34
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->n:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    check-cast v3, Landroid/graphics/RectF;

    .line 41
    .line 42
    iget v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->q:I

    .line 43
    .line 44
    int-to-float v5, v4

    .line 45
    int-to-float v4, v4

    .line 46
    iget-object v6, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->g:Landroid/graphics/Paint;

    .line 47
    .line 48
    invoke-virtual {p1, v3, v5, v4, v6}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 49
    .line 50
    .line 51
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->n:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    check-cast v3, Landroid/graphics/RectF;

    .line 58
    .line 59
    iget v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->q:I

    .line 60
    .line 61
    int-to-float v5, v4

    .line 62
    int-to-float v4, v4

    .line 63
    iget-object v6, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->f:Landroid/graphics/Paint;

    .line 64
    .line 65
    invoke-virtual {p1, v3, v5, v4, v6}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 66
    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_0
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->i:Landroid/graphics/Paint;

    .line 70
    .line 71
    if-eqz v3, :cond_1

    .line 72
    .line 73
    new-instance v4, Landroid/graphics/LinearGradient;

    .line 74
    .line 75
    iget v7, v2, Landroid/graphics/RectF;->right:F

    .line 76
    .line 77
    iget v9, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->s:I

    .line 78
    .line 79
    iget v10, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->t:I

    .line 80
    .line 81
    sget-object v11, Landroid/graphics/Shader$TileMode;->MIRROR:Landroid/graphics/Shader$TileMode;

    .line 82
    .line 83
    const/4 v5, 0x0

    .line 84
    const/4 v6, 0x0

    .line 85
    const/4 v8, 0x0

    .line 86
    invoke-direct/range {v4 .. v11}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 90
    .line 91
    .line 92
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->n:Ljava/util/List;

    .line 93
    .line 94
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    check-cast v3, Landroid/graphics/RectF;

    .line 99
    .line 100
    iget v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->q:I

    .line 101
    .line 102
    int-to-float v5, v4

    .line 103
    int-to-float v4, v4

    .line 104
    iget-object v6, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->i:Landroid/graphics/Paint;

    .line 105
    .line 106
    invoke-virtual {p1, v3, v5, v4, v6}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 107
    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_1
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->n:Ljava/util/List;

    .line 111
    .line 112
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    check-cast v3, Landroid/graphics/RectF;

    .line 117
    .line 118
    iget v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->q:I

    .line 119
    .line 120
    int-to-float v5, v4

    .line 121
    int-to-float v4, v4

    .line 122
    iget-object v6, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->h:Landroid/graphics/Paint;

    .line 123
    .line 124
    invoke-virtual {p1, v3, v5, v4, v6}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 125
    .line 126
    .line 127
    :goto_1
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->b:Ljava/util/List;

    .line 128
    .line 129
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    check-cast v3, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 134
    .line 135
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/NewTags;->localTagCategories:Ljava/util/List;

    .line 136
    .line 137
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v3

    .line 141
    check-cast v3, Lcom/p1/mobile/putong/core/data/TagCategories;

    .line 142
    .line 143
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->e:Ljava/util/HashMap;

    .line 144
    .line 145
    iget-object v5, v3, Lcom/p1/mobile/putong/core/data/TagCategories;->iconWhite:Ljava/lang/String;

    .line 146
    .line 147
    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object v4

    .line 151
    if-eqz v4, :cond_2

    .line 152
    .line 153
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->e:Ljava/util/HashMap;

    .line 154
    .line 155
    iget-object v5, v3, Lcom/p1/mobile/putong/core/data/TagCategories;->iconWhite:Ljava/lang/String;

    .line 156
    .line 157
    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object v4

    .line 161
    check-cast v4, Landroid/graphics/Bitmap;

    .line 162
    .line 163
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 164
    .line 165
    .line 166
    move-result v4

    .line 167
    if-nez v4, :cond_2

    .line 168
    .line 169
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->e:Ljava/util/HashMap;

    .line 170
    .line 171
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/TagCategories;->iconWhite:Ljava/lang/String;

    .line 172
    .line 173
    invoke-virtual {v4, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object v3

    .line 177
    check-cast v3, Landroid/graphics/Bitmap;

    .line 178
    .line 179
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->o:Ljava/util/List;

    .line 180
    .line 181
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object v4

    .line 185
    check-cast v4, Landroid/graphics/RectF;

    .line 186
    .line 187
    iget-object v5, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->j:Landroid/graphics/Paint;

    .line 188
    .line 189
    const/4 v6, 0x0

    .line 190
    invoke-virtual {p1, v3, v6, v4, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 191
    .line 192
    .line 193
    goto :goto_2

    .line 194
    :cond_2
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->e:Ljava/util/HashMap;

    .line 195
    .line 196
    iget-object v5, v3, Lcom/p1/mobile/putong/core/data/TagCategories;->iconWhite:Ljava/lang/String;

    .line 197
    .line 198
    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    move-result-object v4

    .line 202
    if-eqz v4, :cond_3

    .line 203
    .line 204
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->e:Ljava/util/HashMap;

    .line 205
    .line 206
    iget-object v5, v3, Lcom/p1/mobile/putong/core/data/TagCategories;->iconWhite:Ljava/lang/String;

    .line 207
    .line 208
    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    move-result-object v4

    .line 212
    check-cast v4, Landroid/graphics/Bitmap;

    .line 213
    .line 214
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 215
    .line 216
    .line 217
    move-result v4

    .line 218
    if-eqz v4, :cond_3

    .line 219
    .line 220
    sget-object v4, Ll/uqb0;->G:Ll/fsb0;

    .line 221
    .line 222
    iget-object v5, v3, Lcom/p1/mobile/putong/core/data/TagCategories;->iconWhite:Ljava/lang/String;

    .line 223
    .line 224
    new-instance v6, Lcom/p1/mobile/putong/core/view/CardLabelShowView$b;

    .line 225
    .line 226
    invoke-direct {v6, p0, v3}, Lcom/p1/mobile/putong/core/view/CardLabelShowView$b;-><init>(Lcom/p1/mobile/putong/core/view/CardLabelShowView;Lcom/p1/mobile/putong/core/data/TagCategories;)V

    .line 227
    .line 228
    .line 229
    invoke-virtual {v4, v5, v6}, Ll/fsb0;->I(Ljava/lang/String;Ll/y20;)V

    .line 230
    .line 231
    .line 232
    :cond_3
    :goto_2
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->d:Ljava/util/List;

    .line 233
    .line 234
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 235
    .line 236
    .line 237
    move-result-object v3

    .line 238
    check-cast v3, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 239
    .line 240
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/NewTags;->localShowName:Ljava/lang/String;

    .line 241
    .line 242
    iget v4, v2, Landroid/graphics/RectF;->left:F

    .line 243
    .line 244
    const/high16 v5, 0x41b00000    # 22.0f

    .line 245
    .line 246
    invoke-static {v5}, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->a(F)I

    .line 247
    .line 248
    .line 249
    move-result v5

    .line 250
    int-to-float v5, v5

    .line 251
    add-float/2addr v4, v5

    .line 252
    iget v2, v2, Landroid/graphics/RectF;->top:F

    .line 253
    .line 254
    iget v5, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->m:I

    .line 255
    .line 256
    int-to-float v5, v5

    .line 257
    add-float/2addr v2, v5

    .line 258
    iget-object v5, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->k:Landroid/graphics/Paint;

    .line 259
    .line 260
    invoke-virtual {p1, v3, v4, v2, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 261
    .line 262
    .line 263
    add-int/lit8 v1, v1, 0x1

    .line 264
    .line 265
    goto/16 :goto_0

    .line 266
    .line 267
    :cond_4
    return-void
.end method

.method public onMeasure(II)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/high16 v2, 0x40a00000    # 5.0f

    .line 8
    .line 9
    invoke-static {v2}, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->a(F)I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    sub-int/2addr v1, v3

    .line 14
    iput v1, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->l:I

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iget v3, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->l:I

    .line 21
    .line 22
    if-lez v3, :cond_0

    .line 23
    .line 24
    iget-object v3, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->b:Ljava/util/List;

    .line 25
    .line 26
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->c(Ljava/util/List;)Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-nez v3, :cond_0

    .line 31
    .line 32
    if-lez v1, :cond_0

    .line 33
    .line 34
    iget v3, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->p:I

    .line 35
    .line 36
    if-ne v1, v3, :cond_0

    .line 37
    .line 38
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    iget v2, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->p:I

    .line 43
    .line 44
    invoke-virtual {v0, v1, v2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->n:Ljava/util/List;

    .line 49
    .line 50
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 51
    .line 52
    .line 53
    iget-object v1, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->d:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 56
    .line 57
    .line 58
    iget-object v1, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->o:Ljava/util/List;

    .line 59
    .line 60
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 61
    .line 62
    .line 63
    iget-object v1, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->b:Ljava/util/List;

    .line 64
    .line 65
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    const/4 v3, 0x0

    .line 70
    const/4 v4, 0x1

    .line 71
    if-lez v1, :cond_1

    .line 72
    .line 73
    move v1, v4

    .line 74
    goto :goto_0

    .line 75
    :cond_1
    move v1, v3

    .line 76
    :goto_0
    const/4 v5, 0x0

    .line 77
    move v6, v3

    .line 78
    move v7, v5

    .line 79
    :goto_1
    iget-object v8, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->b:Ljava/util/List;

    .line 80
    .line 81
    invoke-interface {v8}, Ljava/util/List;->size()I

    .line 82
    .line 83
    .line 84
    move-result v8

    .line 85
    if-ge v6, v8, :cond_a

    .line 86
    .line 87
    add-int/lit8 v8, v1, -0x1

    .line 88
    .line 89
    const/high16 v9, 0x42000000    # 32.0f

    .line 90
    .line 91
    invoke-static {v9}, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->a(F)I

    .line 92
    .line 93
    .line 94
    move-result v10

    .line 95
    mul-int/2addr v8, v10

    .line 96
    new-instance v10, Landroid/graphics/RectF;

    .line 97
    .line 98
    invoke-direct {v10}, Landroid/graphics/RectF;-><init>()V

    .line 99
    .line 100
    .line 101
    iget-object v11, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->k:Landroid/graphics/Paint;

    .line 102
    .line 103
    iget-object v12, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->b:Ljava/util/List;

    .line 104
    .line 105
    invoke-interface {v12, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v12

    .line 109
    check-cast v12, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 110
    .line 111
    iget-object v12, v12, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 112
    .line 113
    invoke-virtual {v11, v12}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 114
    .line 115
    .line 116
    move-result v11

    .line 117
    add-float v12, v7, v11

    .line 118
    .line 119
    const/high16 v13, 0x41f00000    # 30.0f

    .line 120
    .line 121
    invoke-static {v13}, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->a(F)I

    .line 122
    .line 123
    .line 124
    move-result v14

    .line 125
    int-to-float v14, v14

    .line 126
    add-float/2addr v12, v14

    .line 127
    iget v14, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->l:I

    .line 128
    .line 129
    int-to-float v14, v14

    .line 130
    cmpl-float v14, v12, v14

    .line 131
    .line 132
    const/high16 v15, 0x41c00000    # 24.0f

    .line 133
    .line 134
    if-lez v14, :cond_6

    .line 135
    .line 136
    const/high16 v12, 0x42a00000    # 80.0f

    .line 137
    .line 138
    invoke-static {v12}, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->a(F)I

    .line 139
    .line 140
    .line 141
    move-result v12

    .line 142
    int-to-float v12, v12

    .line 143
    add-float/2addr v12, v7

    .line 144
    iget v14, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->l:I

    .line 145
    .line 146
    int-to-float v14, v14

    .line 147
    cmpg-float v12, v12, v14

    .line 148
    .line 149
    if-gez v12, :cond_4

    .line 150
    .line 151
    cmpl-float v9, v7, v5

    .line 152
    .line 153
    if-nez v9, :cond_2

    .line 154
    .line 155
    move v7, v5

    .line 156
    goto :goto_2

    .line 157
    :cond_2
    invoke-static {v2}, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->a(F)I

    .line 158
    .line 159
    .line 160
    move-result v9

    .line 161
    int-to-float v9, v9

    .line 162
    add-float/2addr v7, v9

    .line 163
    :goto_2
    iput v7, v10, Landroid/graphics/RectF;->left:F

    .line 164
    .line 165
    int-to-float v7, v8

    .line 166
    iput v7, v10, Landroid/graphics/RectF;->top:F

    .line 167
    .line 168
    iget v7, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->l:I

    .line 169
    .line 170
    int-to-float v7, v7

    .line 171
    iput v7, v10, Landroid/graphics/RectF;->right:F

    .line 172
    .line 173
    invoke-static {v15}, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->a(F)I

    .line 174
    .line 175
    .line 176
    move-result v7

    .line 177
    add-int/2addr v7, v8

    .line 178
    int-to-float v7, v7

    .line 179
    iput v7, v10, Landroid/graphics/RectF;->bottom:F

    .line 180
    .line 181
    iget-object v7, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->n:Ljava/util/List;

    .line 182
    .line 183
    invoke-interface {v7, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    iget-object v7, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->d:Ljava/util/List;

    .line 187
    .line 188
    iget-object v8, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->b:Ljava/util/List;

    .line 189
    .line 190
    invoke-interface {v8, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    move-result-object v8

    .line 194
    check-cast v8, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 195
    .line 196
    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    add-int/lit8 v1, v1, 0x1

    .line 200
    .line 201
    iget v7, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->a:I

    .line 202
    .line 203
    if-le v1, v7, :cond_3

    .line 204
    .line 205
    move v1, v7

    .line 206
    goto/16 :goto_8

    .line 207
    .line 208
    :cond_3
    move v11, v5

    .line 209
    goto :goto_3

    .line 210
    :cond_4
    add-int/lit8 v7, v1, 0x1

    .line 211
    .line 212
    iget v8, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->a:I

    .line 213
    .line 214
    if-le v7, v8, :cond_5

    .line 215
    .line 216
    move v1, v8

    .line 217
    goto/16 :goto_8

    .line 218
    .line 219
    :cond_5
    invoke-static {v13}, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->a(F)I

    .line 220
    .line 221
    .line 222
    move-result v8

    .line 223
    int-to-float v8, v8

    .line 224
    add-float/2addr v11, v8

    .line 225
    invoke-static {v9}, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->a(F)I

    .line 226
    .line 227
    .line 228
    move-result v8

    .line 229
    mul-int/2addr v1, v8

    .line 230
    iput v5, v10, Landroid/graphics/RectF;->left:F

    .line 231
    .line 232
    int-to-float v8, v1

    .line 233
    iput v8, v10, Landroid/graphics/RectF;->top:F

    .line 234
    .line 235
    iput v11, v10, Landroid/graphics/RectF;->right:F

    .line 236
    .line 237
    invoke-static {v15}, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->a(F)I

    .line 238
    .line 239
    .line 240
    move-result v8

    .line 241
    add-int/2addr v8, v1

    .line 242
    int-to-float v1, v8

    .line 243
    iput v1, v10, Landroid/graphics/RectF;->bottom:F

    .line 244
    .line 245
    iget-object v1, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->n:Ljava/util/List;

    .line 246
    .line 247
    invoke-interface {v1, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 248
    .line 249
    .line 250
    iget-object v1, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->d:Ljava/util/List;

    .line 251
    .line 252
    iget-object v8, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->b:Ljava/util/List;

    .line 253
    .line 254
    invoke-interface {v8, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 255
    .line 256
    .line 257
    move-result-object v8

    .line 258
    check-cast v8, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 259
    .line 260
    invoke-interface {v1, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 261
    .line 262
    .line 263
    move v1, v7

    .line 264
    :goto_3
    move v7, v11

    .line 265
    goto :goto_7

    .line 266
    :cond_6
    cmpl-float v9, v7, v5

    .line 267
    .line 268
    if-nez v9, :cond_7

    .line 269
    .line 270
    move v7, v5

    .line 271
    goto :goto_4

    .line 272
    :cond_7
    invoke-static {v2}, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->a(F)I

    .line 273
    .line 274
    .line 275
    move-result v11

    .line 276
    int-to-float v11, v11

    .line 277
    add-float/2addr v7, v11

    .line 278
    :goto_4
    iput v7, v10, Landroid/graphics/RectF;->left:F

    .line 279
    .line 280
    int-to-float v7, v8

    .line 281
    iput v7, v10, Landroid/graphics/RectF;->top:F

    .line 282
    .line 283
    if-nez v9, :cond_8

    .line 284
    .line 285
    move v7, v3

    .line 286
    goto :goto_5

    .line 287
    :cond_8
    invoke-static {v2}, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->a(F)I

    .line 288
    .line 289
    .line 290
    move-result v7

    .line 291
    :goto_5
    int-to-float v7, v7

    .line 292
    add-float/2addr v7, v12

    .line 293
    iput v7, v10, Landroid/graphics/RectF;->right:F

    .line 294
    .line 295
    invoke-static {v15}, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->a(F)I

    .line 296
    .line 297
    .line 298
    move-result v7

    .line 299
    add-int/2addr v7, v8

    .line 300
    int-to-float v7, v7

    .line 301
    iput v7, v10, Landroid/graphics/RectF;->bottom:F

    .line 302
    .line 303
    iget-object v7, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->n:Ljava/util/List;

    .line 304
    .line 305
    invoke-interface {v7, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 306
    .line 307
    .line 308
    iget-object v7, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->d:Ljava/util/List;

    .line 309
    .line 310
    iget-object v8, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->b:Ljava/util/List;

    .line 311
    .line 312
    invoke-interface {v8, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 313
    .line 314
    .line 315
    move-result-object v8

    .line 316
    check-cast v8, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 317
    .line 318
    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 319
    .line 320
    .line 321
    if-nez v9, :cond_9

    .line 322
    .line 323
    move v7, v3

    .line 324
    goto :goto_6

    .line 325
    :cond_9
    invoke-static {v2}, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->a(F)I

    .line 326
    .line 327
    .line 328
    move-result v7

    .line 329
    :goto_6
    int-to-float v7, v7

    .line 330
    add-float/2addr v12, v7

    .line 331
    move v7, v12

    .line 332
    :goto_7
    add-int/lit8 v6, v6, 0x1

    .line 333
    .line 334
    goto/16 :goto_1

    .line 335
    .line 336
    :cond_a
    :goto_8
    move v2, v3

    .line 337
    :goto_9
    iget-object v5, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->d:Ljava/util/List;

    .line 338
    .line 339
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 340
    .line 341
    .line 342
    move-result v5

    .line 343
    if-ge v2, v5, :cond_d

    .line 344
    .line 345
    iget-object v5, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->n:Ljava/util/List;

    .line 346
    .line 347
    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 348
    .line 349
    .line 350
    move-result-object v5

    .line 351
    check-cast v5, Landroid/graphics/RectF;

    .line 352
    .line 353
    new-instance v6, Landroid/graphics/RectF;

    .line 354
    .line 355
    invoke-direct {v6}, Landroid/graphics/RectF;-><init>()V

    .line 356
    .line 357
    .line 358
    iget v7, v5, Landroid/graphics/RectF;->top:F

    .line 359
    .line 360
    const/high16 v8, 0x40800000    # 4.0f

    .line 361
    .line 362
    invoke-static {v8}, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->a(F)I

    .line 363
    .line 364
    .line 365
    move-result v9

    .line 366
    int-to-float v9, v9

    .line 367
    add-float/2addr v7, v9

    .line 368
    iput v7, v6, Landroid/graphics/RectF;->top:F

    .line 369
    .line 370
    iget v7, v5, Landroid/graphics/RectF;->left:F

    .line 371
    .line 372
    invoke-static {v8}, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->a(F)I

    .line 373
    .line 374
    .line 375
    move-result v8

    .line 376
    int-to-float v8, v8

    .line 377
    add-float/2addr v7, v8

    .line 378
    iput v7, v6, Landroid/graphics/RectF;->left:F

    .line 379
    .line 380
    const/high16 v8, 0x41800000    # 16.0f

    .line 381
    .line 382
    invoke-static {v8}, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->a(F)I

    .line 383
    .line 384
    .line 385
    move-result v9

    .line 386
    int-to-float v9, v9

    .line 387
    add-float/2addr v7, v9

    .line 388
    iput v7, v6, Landroid/graphics/RectF;->right:F

    .line 389
    .line 390
    iget v7, v6, Landroid/graphics/RectF;->top:F

    .line 391
    .line 392
    invoke-static {v8}, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->a(F)I

    .line 393
    .line 394
    .line 395
    move-result v8

    .line 396
    int-to-float v8, v8

    .line 397
    add-float/2addr v7, v8

    .line 398
    iput v7, v6, Landroid/graphics/RectF;->bottom:F

    .line 399
    .line 400
    iget-object v7, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->o:Ljava/util/List;

    .line 401
    .line 402
    invoke-interface {v7, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 403
    .line 404
    .line 405
    iget-object v6, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->k:Landroid/graphics/Paint;

    .line 406
    .line 407
    iget-object v7, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->d:Ljava/util/List;

    .line 408
    .line 409
    invoke-interface {v7, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 410
    .line 411
    .line 412
    move-result-object v7

    .line 413
    check-cast v7, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 414
    .line 415
    iget-object v7, v7, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 416
    .line 417
    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 418
    .line 419
    .line 420
    move-result v6

    .line 421
    iget v7, v5, Landroid/graphics/RectF;->right:F

    .line 422
    .line 423
    const/high16 v8, 0x41000000    # 8.0f

    .line 424
    .line 425
    invoke-static {v8}, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->a(F)I

    .line 426
    .line 427
    .line 428
    move-result v8

    .line 429
    int-to-float v8, v8

    .line 430
    sub-float/2addr v7, v8

    .line 431
    iget v5, v5, Landroid/graphics/RectF;->left:F

    .line 432
    .line 433
    sub-float/2addr v7, v5

    .line 434
    const/high16 v5, 0x41b00000    # 22.0f

    .line 435
    .line 436
    invoke-static {v5}, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->a(F)I

    .line 437
    .line 438
    .line 439
    move-result v5

    .line 440
    int-to-float v5, v5

    .line 441
    sub-float/2addr v7, v5

    .line 442
    cmpl-float v5, v7, v6

    .line 443
    .line 444
    iget-object v8, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->d:Ljava/util/List;

    .line 445
    .line 446
    if-ltz v5, :cond_b

    .line 447
    .line 448
    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 449
    .line 450
    .line 451
    move-result-object v5

    .line 452
    check-cast v5, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 453
    .line 454
    iget-object v6, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->d:Ljava/util/List;

    .line 455
    .line 456
    invoke-interface {v6, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 457
    .line 458
    .line 459
    move-result-object v6

    .line 460
    check-cast v6, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 461
    .line 462
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 463
    .line 464
    iput-object v6, v5, Lcom/p1/mobile/putong/core/data/NewTags;->localShowName:Ljava/lang/String;

    .line 465
    .line 466
    goto :goto_b

    .line 467
    :cond_b
    div-float/2addr v7, v6

    .line 468
    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 469
    .line 470
    .line 471
    move-result-object v5

    .line 472
    check-cast v5, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 473
    .line 474
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 475
    .line 476
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 477
    .line 478
    .line 479
    move-result v5

    .line 480
    int-to-float v5, v5

    .line 481
    mul-float/2addr v7, v5

    .line 482
    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    .line 483
    .line 484
    .line 485
    move-result v5

    .line 486
    if-lez v5, :cond_c

    .line 487
    .line 488
    iget-object v6, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->d:Ljava/util/List;

    .line 489
    .line 490
    invoke-interface {v6, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 491
    .line 492
    .line 493
    move-result-object v6

    .line 494
    check-cast v6, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 495
    .line 496
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 497
    .line 498
    add-int/lit8 v5, v5, -0x1

    .line 499
    .line 500
    invoke-virtual {v6, v3, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 501
    .line 502
    .line 503
    move-result-object v5

    .line 504
    goto :goto_a

    .line 505
    :cond_c
    const-string v5, ""

    .line 506
    .line 507
    :goto_a
    iget-object v6, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->d:Ljava/util/List;

    .line 508
    .line 509
    invoke-interface {v6, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 510
    .line 511
    .line 512
    move-result-object v6

    .line 513
    check-cast v6, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 514
    .line 515
    const-string v7, "..."

    .line 516
    .line 517
    invoke-virtual {v5, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 518
    .line 519
    .line 520
    move-result-object v5

    .line 521
    iput-object v5, v6, Lcom/p1/mobile/putong/core/data/NewTags;->localShowName:Ljava/lang/String;

    .line 522
    .line 523
    :goto_b
    add-int/lit8 v2, v2, 0x1

    .line 524
    .line 525
    goto/16 :goto_9

    .line 526
    .line 527
    :cond_d
    if-lez v1, :cond_e

    .line 528
    .line 529
    mul-int/lit8 v2, v1, 0x18

    .line 530
    .line 531
    sub-int/2addr v1, v4

    .line 532
    mul-int/lit8 v1, v1, 0x8

    .line 533
    .line 534
    add-int/2addr v2, v1

    .line 535
    int-to-float v1, v2

    .line 536
    invoke-static {v1}, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->a(F)I

    .line 537
    .line 538
    .line 539
    move-result v3

    .line 540
    :cond_e
    iput v3, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->p:I

    .line 541
    .line 542
    iget-object v1, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->c:Ljava/util/List;

    .line 543
    .line 544
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 545
    .line 546
    .line 547
    iget-object v1, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->c:Ljava/util/List;

    .line 548
    .line 549
    iget-object v2, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->b:Ljava/util/List;

    .line 550
    .line 551
    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 552
    .line 553
    .line 554
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 555
    .line 556
    .line 557
    move-result v1

    .line 558
    invoke-virtual {v0, v1, v3}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 559
    .line 560
    .line 561
    return-void
.end method

.method public setMostLine(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->a:I

    .line 2
    .line 3
    return-void
.end method

.method public setNewTags(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/NewTags;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/view/CardLabelShowView;->d(Ljava/util/List;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
