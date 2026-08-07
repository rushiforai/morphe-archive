.class public Lcom/p1/mobile/putong/core/view/CardLabelShowView4;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/view/CardLabelShowView4$a;
    }
.end annotation


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

.field public k:I

.field public l:I

.field public m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/RectF;",
            ">;"
        }
    .end annotation
.end field

.field public n:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/RectF;",
            ">;"
        }
    .end annotation
.end field

.field public o:Z

.field public p:I

.field public q:I

.field public r:I

.field public s:I

.field public t:Z

.field public u:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 61
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 60
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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
    const/4 p1, 0x1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->a:I

    .line 6
    .line 7
    new-instance p1, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->b:Ljava/util/List;

    .line 13
    .line 14
    new-instance p1, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->c:Ljava/util/List;

    .line 20
    .line 21
    new-instance p1, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->d:Ljava/util/List;

    .line 27
    .line 28
    new-instance p1, Ljava/util/HashMap;

    .line 29
    .line 30
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->e:Ljava/util/HashMap;

    .line 34
    .line 35
    new-instance p1, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->m:Ljava/util/List;

    .line 41
    .line 42
    new-instance p1, Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->n:Ljava/util/List;

    .line 48
    .line 49
    const/4 p1, 0x0

    .line 50
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->o:Z

    .line 51
    .line 52
    sget p1, Ll/qa00;->g:I

    .line 53
    .line 54
    iput p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->r:I

    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->b()V

    .line 57
    .line 58
    .line 59
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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->f:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->f:Landroid/graphics/Paint;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->f:Landroid/graphics/Paint;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->g:Landroid/graphics/Paint;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->g:Landroid/graphics/Paint;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->g:Landroid/graphics/Paint;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->h:Landroid/graphics/Paint;

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->h:Landroid/graphics/Paint;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->h:Landroid/graphics/Paint;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->i:Landroid/graphics/Paint;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->j:Landroid/graphics/Paint;

    .line 116
    .line 117
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->j:Landroid/graphics/Paint;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->j:Landroid/graphics/Paint;

    .line 132
    .line 133
    const/high16 v2, 0x41400000    # 12.0f

    .line 134
    .line 135
    invoke-static {v2}, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->a(F)I

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
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->j:Landroid/graphics/Paint;

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
    invoke-static {v0}, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->a(F)I

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
    invoke-static {v1}, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->a(F)I

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    sub-int/2addr v0, v1

    .line 178
    iput v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->l:I

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
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->t:Z

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->c:Ljava/util/List;

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
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->c:Ljava/util/List;

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
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->c:Ljava/util/List;

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

.method public d(Ljava/util/List;ZZI)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/NewTags;",
            ">;ZZI)V"
        }
    .end annotation

    .line 1
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->t:Z

    .line 2
    .line 3
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->u:Z

    .line 4
    .line 5
    iput p4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->s:I

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->c(Ljava/util/List;)Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-nez p2, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->d:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 17
    .line 18
    .line 19
    iget-object p2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->b:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 22
    .line 23
    .line 24
    iget-object p2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->b:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {p2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->e:Ljava/util/HashMap;

    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/util/HashMap;->clear()V

    .line 32
    .line 33
    .line 34
    const/4 p1, 0x0

    .line 35
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->b:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    if-ge p1, p2, :cond_1

    .line 42
    .line 43
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 44
    .line 45
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    iget-object p3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->b:Ljava/util/List;

    .line 50
    .line 51
    invoke-interface {p3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p3

    .line 55
    check-cast p3, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 56
    .line 57
    iget p3, p3, Lcom/p1/mobile/putong/core/data/NewTags;->loadIcon:I

    .line 58
    .line 59
    invoke-static {p2, p3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    iget-object p3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->e:Ljava/util/HashMap;

    .line 64
    .line 65
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p4

    .line 69
    invoke-virtual {p3, p4, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    add-int/lit8 p1, p1, 0x1

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 6

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->d:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-ge v0, v1, :cond_3

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->m:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Landroid/graphics/RectF;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->d:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 28
    .line 29
    iget-boolean v3, v2, Lcom/p1/mobile/putong/core/data/NewTags;->localIsCommonLabel:Z

    .line 30
    .line 31
    if-nez v3, :cond_1

    .line 32
    .line 33
    iget-object v3, v2, Lcom/p1/mobile/putong/core/data/NewTags;->bgColor:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->f:Landroid/graphics/Paint;

    .line 40
    .line 41
    if-nez v3, :cond_0

    .line 42
    .line 43
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/NewTags;->bgColor:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    invoke-virtual {v4, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 50
    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_0
    sget-object v2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 54
    .line 55
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    sget v3, Ll/c9c0;->O:I

    .line 60
    .line 61
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    invoke-virtual {v4, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 66
    .line 67
    .line 68
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->m:Ljava/util/List;

    .line 69
    .line 70
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    check-cast v2, Landroid/graphics/RectF;

    .line 75
    .line 76
    iget v3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->r:I

    .line 77
    .line 78
    int-to-float v4, v3

    .line 79
    int-to-float v3, v3

    .line 80
    iget-object v5, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->g:Landroid/graphics/Paint;

    .line 81
    .line 82
    invoke-virtual {p1, v2, v4, v3, v5}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 83
    .line 84
    .line 85
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->m:Ljava/util/List;

    .line 86
    .line 87
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    check-cast v2, Landroid/graphics/RectF;

    .line 92
    .line 93
    iget v3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->r:I

    .line 94
    .line 95
    int-to-float v4, v3

    .line 96
    int-to-float v3, v3

    .line 97
    iget-object v5, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->f:Landroid/graphics/Paint;

    .line 98
    .line 99
    invoke-virtual {p1, v2, v4, v3, v5}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 100
    .line 101
    .line 102
    goto :goto_2

    .line 103
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->m:Ljava/util/List;

    .line 104
    .line 105
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    check-cast v2, Landroid/graphics/RectF;

    .line 110
    .line 111
    iget v3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->r:I

    .line 112
    .line 113
    int-to-float v4, v3

    .line 114
    int-to-float v3, v3

    .line 115
    iget-object v5, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->h:Landroid/graphics/Paint;

    .line 116
    .line 117
    invoke-virtual {p1, v2, v4, v3, v5}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 118
    .line 119
    .line 120
    :goto_2
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->e:Ljava/util/HashMap;

    .line 121
    .line 122
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    check-cast v2, Landroid/graphics/Bitmap;

    .line 131
    .line 132
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->n:Ljava/util/List;

    .line 133
    .line 134
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v3

    .line 138
    check-cast v3, Landroid/graphics/RectF;

    .line 139
    .line 140
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->i:Landroid/graphics/Paint;

    .line 141
    .line 142
    const/4 v5, 0x0

    .line 143
    invoke-virtual {p1, v2, v5, v3, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 144
    .line 145
    .line 146
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->d:Ljava/util/List;

    .line 147
    .line 148
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v2

    .line 152
    check-cast v2, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 153
    .line 154
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/NewTags;->nameColor:Ljava/lang/String;

    .line 155
    .line 156
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 157
    .line 158
    .line 159
    move-result v2

    .line 160
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->j:Landroid/graphics/Paint;

    .line 161
    .line 162
    if-nez v2, :cond_2

    .line 163
    .line 164
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->d:Ljava/util/List;

    .line 165
    .line 166
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    check-cast v2, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 171
    .line 172
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/NewTags;->nameColor:Ljava/lang/String;

    .line 173
    .line 174
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 175
    .line 176
    .line 177
    move-result v2

    .line 178
    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 179
    .line 180
    .line 181
    goto :goto_3

    .line 182
    :cond_2
    const-string v2, "#FFFFFF"

    .line 183
    .line 184
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 185
    .line 186
    .line 187
    move-result v2

    .line 188
    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 189
    .line 190
    .line 191
    :goto_3
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->d:Ljava/util/List;

    .line 192
    .line 193
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    move-result-object v2

    .line 197
    check-cast v2, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 198
    .line 199
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/NewTags;->localShowName:Ljava/lang/String;

    .line 200
    .line 201
    iget v3, v1, Landroid/graphics/RectF;->left:F

    .line 202
    .line 203
    const/high16 v4, 0x41c00000    # 24.0f

    .line 204
    .line 205
    invoke-static {v4}, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->a(F)I

    .line 206
    .line 207
    .line 208
    move-result v4

    .line 209
    int-to-float v4, v4

    .line 210
    add-float/2addr v3, v4

    .line 211
    iget v1, v1, Landroid/graphics/RectF;->top:F

    .line 212
    .line 213
    iget v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->l:I

    .line 214
    .line 215
    int-to-float v4, v4

    .line 216
    add-float/2addr v1, v4

    .line 217
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->j:Landroid/graphics/Paint;

    .line 218
    .line 219
    invoke-virtual {p1, v2, v3, v1, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 220
    .line 221
    .line 222
    add-int/lit8 v0, v0, 0x1

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :cond_3
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
    invoke-static {v2}, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->a(F)I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    sub-int/2addr v1, v3

    .line 14
    iput v1, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->k:I

    .line 15
    .line 16
    iget-boolean v3, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->u:Z

    .line 17
    .line 18
    if-eqz v3, :cond_0

    .line 19
    .line 20
    iget v3, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->s:I

    .line 21
    .line 22
    sub-int/2addr v1, v3

    .line 23
    iput v1, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->k:I

    .line 24
    .line 25
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    iget v3, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->k:I

    .line 30
    .line 31
    if-lez v3, :cond_1

    .line 32
    .line 33
    iget-object v3, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->b:Ljava/util/List;

    .line 34
    .line 35
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->c(Ljava/util/List;)Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-nez v3, :cond_1

    .line 40
    .line 41
    if-lez v1, :cond_1

    .line 42
    .line 43
    iget v3, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->k:I

    .line 44
    .line 45
    iget v4, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->q:I

    .line 46
    .line 47
    if-ne v3, v4, :cond_1

    .line 48
    .line 49
    iget v3, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->p:I

    .line 50
    .line 51
    if-ne v1, v3, :cond_1

    .line 52
    .line 53
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    iget v2, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->p:I

    .line 58
    .line 59
    invoke-virtual {v0, v1, v2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    iget-object v1, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->m:Ljava/util/List;

    .line 64
    .line 65
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 66
    .line 67
    .line 68
    iget-object v1, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->d:Ljava/util/List;

    .line 69
    .line 70
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 71
    .line 72
    .line 73
    iget-object v1, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->n:Ljava/util/List;

    .line 74
    .line 75
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 76
    .line 77
    .line 78
    iget-object v1, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->b:Ljava/util/List;

    .line 79
    .line 80
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    const/4 v3, 0x1

    .line 85
    const/4 v4, 0x0

    .line 86
    if-lez v1, :cond_2

    .line 87
    .line 88
    move v1, v3

    .line 89
    goto :goto_0

    .line 90
    :cond_2
    move v1, v4

    .line 91
    :goto_0
    const/4 v5, 0x0

    .line 92
    move v6, v4

    .line 93
    move v7, v5

    .line 94
    :goto_1
    iget-object v8, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->b:Ljava/util/List;

    .line 95
    .line 96
    invoke-interface {v8}, Ljava/util/List;->size()I

    .line 97
    .line 98
    .line 99
    move-result v8

    .line 100
    const/high16 v9, 0x41c00000    # 24.0f

    .line 101
    .line 102
    if-ge v6, v8, :cond_b

    .line 103
    .line 104
    add-int/lit8 v8, v1, -0x1

    .line 105
    .line 106
    const/high16 v10, 0x42000000    # 32.0f

    .line 107
    .line 108
    invoke-static {v10}, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->a(F)I

    .line 109
    .line 110
    .line 111
    move-result v11

    .line 112
    mul-int/2addr v8, v11

    .line 113
    new-instance v11, Landroid/graphics/RectF;

    .line 114
    .line 115
    invoke-direct {v11}, Landroid/graphics/RectF;-><init>()V

    .line 116
    .line 117
    .line 118
    iget-object v12, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->j:Landroid/graphics/Paint;

    .line 119
    .line 120
    iget-object v13, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->b:Ljava/util/List;

    .line 121
    .line 122
    invoke-interface {v13, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v13

    .line 126
    check-cast v13, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 127
    .line 128
    iget-object v13, v13, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 129
    .line 130
    invoke-virtual {v12, v13}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 131
    .line 132
    .line 133
    move-result v12

    .line 134
    add-float v13, v7, v12

    .line 135
    .line 136
    const/high16 v14, 0x41f00000    # 30.0f

    .line 137
    .line 138
    invoke-static {v14}, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->a(F)I

    .line 139
    .line 140
    .line 141
    move-result v15

    .line 142
    int-to-float v15, v15

    .line 143
    add-float/2addr v13, v15

    .line 144
    iget v15, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->k:I

    .line 145
    .line 146
    int-to-float v15, v15

    .line 147
    cmpl-float v15, v13, v15

    .line 148
    .line 149
    if-lez v15, :cond_7

    .line 150
    .line 151
    const/high16 v13, 0x42a00000    # 80.0f

    .line 152
    .line 153
    invoke-static {v13}, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->a(F)I

    .line 154
    .line 155
    .line 156
    move-result v13

    .line 157
    int-to-float v13, v13

    .line 158
    add-float/2addr v13, v7

    .line 159
    iget-boolean v15, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->o:Z

    .line 160
    .line 161
    if-eqz v15, :cond_5

    .line 162
    .line 163
    iget v15, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->k:I

    .line 164
    .line 165
    int-to-float v15, v15

    .line 166
    cmpg-float v13, v13, v15

    .line 167
    .line 168
    if-gez v13, :cond_5

    .line 169
    .line 170
    cmpl-float v10, v7, v5

    .line 171
    .line 172
    if-nez v10, :cond_3

    .line 173
    .line 174
    move v7, v5

    .line 175
    goto :goto_2

    .line 176
    :cond_3
    invoke-static {v2}, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->a(F)I

    .line 177
    .line 178
    .line 179
    move-result v10

    .line 180
    int-to-float v10, v10

    .line 181
    add-float/2addr v7, v10

    .line 182
    :goto_2
    iput v7, v11, Landroid/graphics/RectF;->left:F

    .line 183
    .line 184
    int-to-float v7, v8

    .line 185
    iput v7, v11, Landroid/graphics/RectF;->top:F

    .line 186
    .line 187
    iget v7, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->k:I

    .line 188
    .line 189
    int-to-float v7, v7

    .line 190
    iput v7, v11, Landroid/graphics/RectF;->right:F

    .line 191
    .line 192
    invoke-static {v9}, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->a(F)I

    .line 193
    .line 194
    .line 195
    move-result v7

    .line 196
    add-int/2addr v7, v8

    .line 197
    int-to-float v7, v7

    .line 198
    iput v7, v11, Landroid/graphics/RectF;->bottom:F

    .line 199
    .line 200
    iget-object v7, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->m:Ljava/util/List;

    .line 201
    .line 202
    invoke-interface {v7, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 203
    .line 204
    .line 205
    iget-object v7, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->d:Ljava/util/List;

    .line 206
    .line 207
    iget-object v8, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->b:Ljava/util/List;

    .line 208
    .line 209
    invoke-interface {v8, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 210
    .line 211
    .line 212
    move-result-object v8

    .line 213
    check-cast v8, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 214
    .line 215
    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 216
    .line 217
    .line 218
    add-int/lit8 v1, v1, 0x1

    .line 219
    .line 220
    iget v7, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->a:I

    .line 221
    .line 222
    if-le v1, v7, :cond_4

    .line 223
    .line 224
    move v1, v7

    .line 225
    goto/16 :goto_8

    .line 226
    .line 227
    :cond_4
    move v12, v5

    .line 228
    goto :goto_3

    .line 229
    :cond_5
    add-int/lit8 v7, v1, 0x1

    .line 230
    .line 231
    iget v8, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->a:I

    .line 232
    .line 233
    if-le v7, v8, :cond_6

    .line 234
    .line 235
    move v1, v8

    .line 236
    goto/16 :goto_8

    .line 237
    .line 238
    :cond_6
    invoke-static {v14}, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->a(F)I

    .line 239
    .line 240
    .line 241
    move-result v8

    .line 242
    int-to-float v8, v8

    .line 243
    add-float/2addr v12, v8

    .line 244
    invoke-static {v10}, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->a(F)I

    .line 245
    .line 246
    .line 247
    move-result v8

    .line 248
    mul-int/2addr v1, v8

    .line 249
    iput v5, v11, Landroid/graphics/RectF;->left:F

    .line 250
    .line 251
    int-to-float v8, v1

    .line 252
    iput v8, v11, Landroid/graphics/RectF;->top:F

    .line 253
    .line 254
    iput v12, v11, Landroid/graphics/RectF;->right:F

    .line 255
    .line 256
    invoke-static {v9}, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->a(F)I

    .line 257
    .line 258
    .line 259
    move-result v8

    .line 260
    add-int/2addr v8, v1

    .line 261
    int-to-float v1, v8

    .line 262
    iput v1, v11, Landroid/graphics/RectF;->bottom:F

    .line 263
    .line 264
    iget-object v1, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->m:Ljava/util/List;

    .line 265
    .line 266
    invoke-interface {v1, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 267
    .line 268
    .line 269
    iget-object v1, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->d:Ljava/util/List;

    .line 270
    .line 271
    iget-object v8, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->b:Ljava/util/List;

    .line 272
    .line 273
    invoke-interface {v8, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 274
    .line 275
    .line 276
    move-result-object v8

    .line 277
    check-cast v8, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 278
    .line 279
    invoke-interface {v1, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 280
    .line 281
    .line 282
    move v1, v7

    .line 283
    :goto_3
    move v7, v12

    .line 284
    goto :goto_7

    .line 285
    :cond_7
    cmpl-float v10, v7, v5

    .line 286
    .line 287
    if-nez v10, :cond_8

    .line 288
    .line 289
    move v7, v5

    .line 290
    goto :goto_4

    .line 291
    :cond_8
    invoke-static {v2}, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->a(F)I

    .line 292
    .line 293
    .line 294
    move-result v12

    .line 295
    int-to-float v12, v12

    .line 296
    add-float/2addr v7, v12

    .line 297
    :goto_4
    iput v7, v11, Landroid/graphics/RectF;->left:F

    .line 298
    .line 299
    int-to-float v7, v8

    .line 300
    iput v7, v11, Landroid/graphics/RectF;->top:F

    .line 301
    .line 302
    if-nez v10, :cond_9

    .line 303
    .line 304
    move v7, v4

    .line 305
    goto :goto_5

    .line 306
    :cond_9
    invoke-static {v2}, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->a(F)I

    .line 307
    .line 308
    .line 309
    move-result v7

    .line 310
    :goto_5
    int-to-float v7, v7

    .line 311
    add-float/2addr v7, v13

    .line 312
    iput v7, v11, Landroid/graphics/RectF;->right:F

    .line 313
    .line 314
    invoke-static {v9}, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->a(F)I

    .line 315
    .line 316
    .line 317
    move-result v7

    .line 318
    add-int/2addr v7, v8

    .line 319
    int-to-float v7, v7

    .line 320
    iput v7, v11, Landroid/graphics/RectF;->bottom:F

    .line 321
    .line 322
    iget-object v7, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->m:Ljava/util/List;

    .line 323
    .line 324
    invoke-interface {v7, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 325
    .line 326
    .line 327
    iget-object v7, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->d:Ljava/util/List;

    .line 328
    .line 329
    iget-object v8, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->b:Ljava/util/List;

    .line 330
    .line 331
    invoke-interface {v8, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 332
    .line 333
    .line 334
    move-result-object v8

    .line 335
    check-cast v8, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 336
    .line 337
    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 338
    .line 339
    .line 340
    if-nez v10, :cond_a

    .line 341
    .line 342
    move v7, v4

    .line 343
    goto :goto_6

    .line 344
    :cond_a
    invoke-static {v2}, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->a(F)I

    .line 345
    .line 346
    .line 347
    move-result v7

    .line 348
    :goto_6
    int-to-float v7, v7

    .line 349
    add-float/2addr v13, v7

    .line 350
    move v7, v13

    .line 351
    :goto_7
    add-int/lit8 v6, v6, 0x1

    .line 352
    .line 353
    goto/16 :goto_1

    .line 354
    .line 355
    :cond_b
    :goto_8
    move v5, v4

    .line 356
    :goto_9
    iget-object v6, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->d:Ljava/util/List;

    .line 357
    .line 358
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 359
    .line 360
    .line 361
    move-result v6

    .line 362
    if-ge v5, v6, :cond_f

    .line 363
    .line 364
    iget-object v6, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->m:Ljava/util/List;

    .line 365
    .line 366
    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 367
    .line 368
    .line 369
    move-result-object v6

    .line 370
    check-cast v6, Landroid/graphics/RectF;

    .line 371
    .line 372
    new-instance v7, Landroid/graphics/RectF;

    .line 373
    .line 374
    invoke-direct {v7}, Landroid/graphics/RectF;-><init>()V

    .line 375
    .line 376
    .line 377
    iget v8, v6, Landroid/graphics/RectF;->top:F

    .line 378
    .line 379
    invoke-static {v2}, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->a(F)I

    .line 380
    .line 381
    .line 382
    move-result v10

    .line 383
    int-to-float v10, v10

    .line 384
    add-float/2addr v8, v10

    .line 385
    iput v8, v7, Landroid/graphics/RectF;->top:F

    .line 386
    .line 387
    iget v8, v6, Landroid/graphics/RectF;->left:F

    .line 388
    .line 389
    const/high16 v10, 0x40c00000    # 6.0f

    .line 390
    .line 391
    invoke-static {v10}, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->a(F)I

    .line 392
    .line 393
    .line 394
    move-result v11

    .line 395
    int-to-float v11, v11

    .line 396
    add-float/2addr v8, v11

    .line 397
    iput v8, v7, Landroid/graphics/RectF;->left:F

    .line 398
    .line 399
    const/high16 v11, 0x41600000    # 14.0f

    .line 400
    .line 401
    invoke-static {v11}, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->a(F)I

    .line 402
    .line 403
    .line 404
    move-result v12

    .line 405
    int-to-float v12, v12

    .line 406
    add-float/2addr v8, v12

    .line 407
    iput v8, v7, Landroid/graphics/RectF;->right:F

    .line 408
    .line 409
    iget v8, v7, Landroid/graphics/RectF;->top:F

    .line 410
    .line 411
    invoke-static {v11}, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->a(F)I

    .line 412
    .line 413
    .line 414
    move-result v11

    .line 415
    int-to-float v11, v11

    .line 416
    add-float/2addr v8, v11

    .line 417
    iput v8, v7, Landroid/graphics/RectF;->bottom:F

    .line 418
    .line 419
    iget-object v8, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->n:Ljava/util/List;

    .line 420
    .line 421
    invoke-interface {v8, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 422
    .line 423
    .line 424
    iget-object v7, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->j:Landroid/graphics/Paint;

    .line 425
    .line 426
    iget-object v8, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->d:Ljava/util/List;

    .line 427
    .line 428
    invoke-interface {v8, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 429
    .line 430
    .line 431
    move-result-object v8

    .line 432
    check-cast v8, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 433
    .line 434
    iget-object v8, v8, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 435
    .line 436
    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 437
    .line 438
    .line 439
    move-result v7

    .line 440
    iget v8, v6, Landroid/graphics/RectF;->right:F

    .line 441
    .line 442
    invoke-static {v10}, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->a(F)I

    .line 443
    .line 444
    .line 445
    move-result v10

    .line 446
    int-to-float v10, v10

    .line 447
    sub-float/2addr v8, v10

    .line 448
    iget v6, v6, Landroid/graphics/RectF;->left:F

    .line 449
    .line 450
    sub-float/2addr v8, v6

    .line 451
    invoke-static {v9}, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->a(F)I

    .line 452
    .line 453
    .line 454
    move-result v6

    .line 455
    int-to-float v6, v6

    .line 456
    sub-float/2addr v8, v6

    .line 457
    cmpl-float v6, v8, v7

    .line 458
    .line 459
    iget-object v10, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->d:Ljava/util/List;

    .line 460
    .line 461
    if-ltz v6, :cond_c

    .line 462
    .line 463
    invoke-interface {v10, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 464
    .line 465
    .line 466
    move-result-object v6

    .line 467
    check-cast v6, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 468
    .line 469
    iget-object v7, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->d:Ljava/util/List;

    .line 470
    .line 471
    invoke-interface {v7, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 472
    .line 473
    .line 474
    move-result-object v7

    .line 475
    check-cast v7, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 476
    .line 477
    iget-object v7, v7, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 478
    .line 479
    iput-object v7, v6, Lcom/p1/mobile/putong/core/data/NewTags;->localShowName:Ljava/lang/String;

    .line 480
    .line 481
    goto :goto_b

    .line 482
    :cond_c
    div-float/2addr v8, v7

    .line 483
    invoke-interface {v10, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 484
    .line 485
    .line 486
    move-result-object v6

    .line 487
    check-cast v6, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 488
    .line 489
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 490
    .line 491
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 492
    .line 493
    .line 494
    move-result v6

    .line 495
    int-to-float v6, v6

    .line 496
    mul-float/2addr v8, v6

    .line 497
    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    .line 498
    .line 499
    .line 500
    move-result v6

    .line 501
    if-lez v6, :cond_e

    .line 502
    .line 503
    iget-object v7, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->d:Ljava/util/List;

    .line 504
    .line 505
    invoke-interface {v7, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 506
    .line 507
    .line 508
    move-result-object v7

    .line 509
    check-cast v7, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 510
    .line 511
    iget-object v7, v7, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 512
    .line 513
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    .line 514
    .line 515
    .line 516
    move-result v7

    .line 517
    iget-object v8, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->d:Ljava/util/List;

    .line 518
    .line 519
    const/4 v10, 0x5

    .line 520
    if-le v7, v10, :cond_d

    .line 521
    .line 522
    invoke-interface {v8, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 523
    .line 524
    .line 525
    move-result-object v7

    .line 526
    check-cast v7, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 527
    .line 528
    iget-object v7, v7, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 529
    .line 530
    add-int/lit8 v6, v6, -0x2

    .line 531
    .line 532
    invoke-virtual {v7, v4, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 533
    .line 534
    .line 535
    move-result-object v6

    .line 536
    goto :goto_a

    .line 537
    :cond_d
    invoke-interface {v8, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 538
    .line 539
    .line 540
    move-result-object v7

    .line 541
    check-cast v7, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 542
    .line 543
    iget-object v7, v7, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 544
    .line 545
    add-int/lit8 v6, v6, -0x1

    .line 546
    .line 547
    invoke-virtual {v7, v4, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 548
    .line 549
    .line 550
    move-result-object v6

    .line 551
    goto :goto_a

    .line 552
    :cond_e
    const-string v6, ""

    .line 553
    .line 554
    :goto_a
    iget-object v7, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->d:Ljava/util/List;

    .line 555
    .line 556
    invoke-interface {v7, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 557
    .line 558
    .line 559
    move-result-object v7

    .line 560
    check-cast v7, Lcom/p1/mobile/putong/core/data/NewTags;

    .line 561
    .line 562
    const-string v8, "..."

    .line 563
    .line 564
    invoke-virtual {v6, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 565
    .line 566
    .line 567
    move-result-object v6

    .line 568
    iput-object v6, v7, Lcom/p1/mobile/putong/core/data/NewTags;->localShowName:Ljava/lang/String;

    .line 569
    .line 570
    :goto_b
    add-int/lit8 v5, v5, 0x1

    .line 571
    .line 572
    goto/16 :goto_9

    .line 573
    .line 574
    :cond_f
    if-lez v1, :cond_10

    .line 575
    .line 576
    mul-int/lit8 v2, v1, 0x18

    .line 577
    .line 578
    sub-int/2addr v1, v3

    .line 579
    mul-int/lit8 v1, v1, 0x8

    .line 580
    .line 581
    add-int/2addr v2, v1

    .line 582
    int-to-float v1, v2

    .line 583
    invoke-static {v1}, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->a(F)I

    .line 584
    .line 585
    .line 586
    move-result v4

    .line 587
    :cond_10
    iput v4, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->p:I

    .line 588
    .line 589
    iget v1, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->k:I

    .line 590
    .line 591
    iput v1, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->q:I

    .line 592
    .line 593
    iget-object v1, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->c:Ljava/util/List;

    .line 594
    .line 595
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 596
    .line 597
    .line 598
    iget-object v1, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->c:Ljava/util/List;

    .line 599
    .line 600
    iget-object v2, v0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->b:Ljava/util/List;

    .line 601
    .line 602
    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 603
    .line 604
    .line 605
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 606
    .line 607
    .line 608
    move-result v1

    .line 609
    invoke-virtual {v0, v1, v4}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 610
    .line 611
    .line 612
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    move v3, v2

    .line 11
    :goto_0
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->m:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    if-ge v3, v4, :cond_1

    .line 18
    .line 19
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->m:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    check-cast v4, Landroid/graphics/RectF;

    .line 26
    .line 27
    invoke-virtual {v4, v0, v1}, Landroid/graphics/RectF;->contains(FF)Z

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    if-eqz v4, :cond_0

    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x1

    .line 37
    return p0

    .line 38
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    return v2
.end method

.method public setMostLine(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->a:I

    .line 2
    .line 3
    return-void
.end method

.method public setNewTags(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/NewTags;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/high16 v0, 0x42a80000    # 84.0f

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->a(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, p1, v1, v1, v0}, Lcom/p1/mobile/putong/core/view/CardLabelShowView4;->d(Ljava/util/List;ZZI)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setOnTagClickListener(Lcom/p1/mobile/putong/core/view/CardLabelShowView4$a;)V
    .locals 0

    return-void
.end method
