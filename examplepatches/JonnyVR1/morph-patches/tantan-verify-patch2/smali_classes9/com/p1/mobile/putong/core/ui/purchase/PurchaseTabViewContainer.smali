.class public Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer$a;
    }
.end annotation


# instance fields
.field public final a:F

.field public final b:F

.field public final c:Landroid/graphics/Paint;

.field public final d:Landroid/graphics/Paint;

.field public final e:Landroid/graphics/Paint;

.field public f:I

.field public g:F

.field public h:I

.field public i:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer$a;

.field public j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;"
        }
    .end annotation
.end field

.field public final k:[I

.field public final l:[I

.field public final m:[F

.field public n:[I

.field public o:I

.field public final p:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 146
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 145
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 7
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    sget p1, Ll/qa00;->n:I

    .line 5
    .line 6
    int-to-float p1, p1

    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->a:F

    .line 8
    .line 9
    sget p1, Ll/qa00;->l:I

    .line 10
    .line 11
    int-to-float p1, p1

    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->b:F

    .line 13
    .line 14
    new-instance p1, Landroid/graphics/Paint;

    .line 15
    .line 16
    const/4 p2, 0x1

    .line 17
    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->c:Landroid/graphics/Paint;

    .line 21
    .line 22
    new-instance p3, Landroid/graphics/Paint;

    .line 23
    .line 24
    invoke-direct {p3, p2}, Landroid/graphics/Paint;-><init>(I)V

    .line 25
    .line 26
    .line 27
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->d:Landroid/graphics/Paint;

    .line 28
    .line 29
    new-instance v0, Landroid/graphics/Paint;

    .line 30
    .line 31
    invoke-direct {v0, p2}, Landroid/graphics/Paint;-><init>(I)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->e:Landroid/graphics/Paint;

    .line 35
    .line 36
    const-string p2, "#19979797"

    .line 37
    .line 38
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->f:I

    .line 43
    .line 44
    const/4 p2, -0x1

    .line 45
    filled-new-array {p2, p2, p2, p2, p2}, [I

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->k:[I

    .line 50
    .line 51
    const-string v2, "#191510"

    .line 52
    .line 53
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    const-string v4, "#4F4733"

    .line 58
    .line 59
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    move-result v5

    .line 63
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result v6

    .line 67
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result v4

    .line 71
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    filled-new-array {v3, v5, v6, v4, v2}, [I

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->l:[I

    .line 80
    .line 81
    const/4 v2, 0x5

    .line 82
    new-array v2, v2, [F

    .line 83
    .line 84
    fill-array-data v2, :array_0

    .line 85
    .line 86
    .line 87
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->m:[F

    .line 88
    .line 89
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->n:[I

    .line 90
    .line 91
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->o:I

    .line 92
    .line 93
    sget v1, Ll/qa00;->a:I

    .line 94
    .line 95
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->p:I

    .line 96
    .line 97
    const/4 v1, 0x0

    .line 98
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 99
    .line 100
    .line 101
    new-instance v2, Landroid/graphics/drawable/ShapeDrawable;

    .line 102
    .line 103
    invoke-direct {v2}, Landroid/graphics/drawable/ShapeDrawable;-><init>()V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v2, v1}, Landroid/graphics/drawable/ShapeDrawable;->setIntrinsicWidth(I)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v2, v1}, Landroid/graphics/drawable/ShapeDrawable;->setAlpha(I)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->setDividerDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 113
    .line 114
    .line 115
    const/4 v1, 0x2

    .line 116
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setShowDividers(I)V

    .line 117
    .line 118
    .line 119
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 120
    .line 121
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 122
    .line 123
    .line 124
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->f:I

    .line 125
    .line 126
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p3, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 130
    .line 131
    .line 132
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->o:I

    .line 133
    .line 134
    invoke-virtual {p3, p0}, Landroid/graphics/Paint;->setColor(I)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    nop

    .line 145
    :array_0
    .array-data 4
        0x0
        0x3e800000    # 0.25f
        0x3f000000    # 0.5f
        0x3f400000    # 0.75f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->d(ILandroid/view/View;)V

    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->i:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer$a;

    .line 2
    .line 3
    return-void
.end method

.method public c(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->j:Ljava/util/List;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    move v1, v0

    .line 5
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-ge v1, v2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-static {v2}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    sget v3, Ll/rec0;->U1:I

    .line 20
    .line 21
    invoke-virtual {v2, v3, p0, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabView;

    .line 26
    .line 27
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 32
    .line 33
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabView;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 34
    .line 35
    .line 36
    new-instance v3, Ll/jib0;

    .line 37
    .line 38
    invoke-direct {v3, p0, v1}, Ll/jib0;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;I)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 42
    .line 43
    .line 44
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 45
    .line 46
    const/4 v4, -0x1

    .line 47
    invoke-direct {v3, v0, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 48
    .line 49
    .line 50
    const/high16 v4, 0x3f000000    # 0.5f

    .line 51
    .line 52
    iput v4, v3, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 53
    .line 54
    invoke-virtual {p0, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 55
    .line 56
    .line 57
    add-int/lit8 v1, v1, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    return-void
.end method

.method public final synthetic d(ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->setSelectTabPosition(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final e()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->c:Landroid/graphics/Paint;

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->f:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->d:Landroid/graphics/Paint;

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->o:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->g()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public f(IF)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/high16 v1, 0x3f800000    # 1.0f

    .line 3
    .line 4
    if-ne p1, v0, :cond_0

    .line 5
    .line 6
    move p2, v1

    .line 7
    :cond_0
    const/4 p1, 0x0

    .line 8
    invoke-static {p1, p2}, Ljava/lang/Math;->max(FF)F

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    invoke-static {v1, p1}, Ljava/lang/Math;->min(FF)F

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->g:F

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public g()V
    .locals 10

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    new-instance v2, Landroid/graphics/LinearGradient;

    .line 10
    .line 11
    int-to-float v5, v0

    .line 12
    int-to-float v6, v1

    .line 13
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->n:[I

    .line 14
    .line 15
    iget-object v8, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->m:[F

    .line 16
    .line 17
    sget-object v9, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    const/4 v4, 0x0

    .line 21
    invoke-direct/range {v2 .. v9}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->e:Landroid/graphics/Paint;

    .line 25
    .line 26
    invoke-virtual {p0, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public getSelectedTabPosition()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public h(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p1, "#131212"

    .line 4
    .line 5
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->f:I

    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->l:[I

    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->n:[I

    .line 14
    .line 15
    const-string p1, "#1c1917"

    .line 16
    .line 17
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->o:I

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const-string p1, "#19979797"

    .line 25
    .line 26
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->f:I

    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->k:[I

    .line 33
    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->n:[I

    .line 35
    .line 36
    const/4 p1, -0x1

    .line 37
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->o:I

    .line 38
    .line 39
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->e()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public i(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->l:[I

    .line 4
    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->n:[I

    .line 6
    .line 7
    const-string p1, "#FFF2CD"

    .line 8
    .line 9
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->o:I

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->k:[I

    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->n:[I

    .line 19
    .line 20
    const/4 p1, -0x1

    .line 21
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->o:I

    .line 22
    .line 23
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->e()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    .line 23
    .line 24
    .line 25
    move-result v5

    .line 26
    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    .line 27
    .line 28
    .line 29
    move-result v6

    .line 30
    int-to-float v10, v1

    .line 31
    int-to-float v11, v2

    .line 32
    iget v12, v0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->a:F

    .line 33
    .line 34
    iget-object v14, v0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->c:Landroid/graphics/Paint;

    .line 35
    .line 36
    const/4 v8, 0x0

    .line 37
    const/4 v9, 0x0

    .line 38
    move v13, v12

    .line 39
    move-object/from16 v7, p1

    .line 40
    .line 41
    invoke-virtual/range {v7 .. v14}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 42
    .line 43
    .line 44
    sub-int/2addr v1, v3

    .line 45
    sub-int/2addr v1, v5

    .line 46
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 47
    .line 48
    .line 49
    move-result v5

    .line 50
    div-int/2addr v1, v5

    .line 51
    int-to-float v3, v3

    .line 52
    int-to-float v5, v1

    .line 53
    iget v7, v0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->g:F

    .line 54
    .line 55
    mul-float/2addr v5, v7

    .line 56
    add-float/2addr v3, v5

    .line 57
    float-to-int v3, v3

    .line 58
    int-to-float v5, v3

    .line 59
    int-to-float v7, v4

    .line 60
    add-int/2addr v1, v3

    .line 61
    int-to-float v8, v1

    .line 62
    sub-int/2addr v2, v6

    .line 63
    int-to-float v6, v2

    .line 64
    iget v9, v0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->b:F

    .line 65
    .line 66
    iget-object v10, v0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->e:Landroid/graphics/Paint;

    .line 67
    .line 68
    move/from16 v21, v9

    .line 69
    .line 70
    move-object/from16 v15, p1

    .line 71
    .line 72
    move/from16 v16, v5

    .line 73
    .line 74
    move/from16 v19, v6

    .line 75
    .line 76
    move/from16 v17, v7

    .line 77
    .line 78
    move/from16 v18, v8

    .line 79
    .line 80
    move/from16 v20, v9

    .line 81
    .line 82
    move-object/from16 v22, v10

    .line 83
    .line 84
    invoke-virtual/range {v15 .. v22}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 85
    .line 86
    .line 87
    iget v5, v0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->p:I

    .line 88
    .line 89
    add-int/2addr v3, v5

    .line 90
    int-to-float v3, v3

    .line 91
    add-int/2addr v4, v5

    .line 92
    int-to-float v4, v4

    .line 93
    sub-int/2addr v1, v5

    .line 94
    int-to-float v1, v1

    .line 95
    sub-int/2addr v2, v5

    .line 96
    int-to-float v2, v2

    .line 97
    iget v5, v0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->b:F

    .line 98
    .line 99
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->d:Landroid/graphics/Paint;

    .line 100
    .line 101
    move/from16 v21, v5

    .line 102
    .line 103
    move/from16 v18, v1

    .line 104
    .line 105
    move/from16 v19, v2

    .line 106
    .line 107
    move/from16 v16, v3

    .line 108
    .line 109
    move/from16 v17, v4

    .line 110
    .line 111
    move/from16 v20, v5

    .line 112
    .line 113
    move-object/from16 v22, v6

    .line 114
    .line 115
    invoke-virtual/range {v15 .. v22}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    .line 119
    .line 120
    .line 121
    invoke-super/range {p0 .. p1}, Landroid/widget/LinearLayout;->onDraw(Landroid/graphics/Canvas;)V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public setSelectTabPosition(I)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-le p1, v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    if-gez p1, :cond_1

    .line 13
    .line 14
    move p1, v0

    .line 15
    :cond_1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->h:I

    .line 16
    .line 17
    move p1, v0

    .line 18
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-ge p1, v1, :cond_6

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabView;

    .line 29
    .line 30
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->j:Ljava/util/List;

    .line 31
    .line 32
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-nez v2, :cond_2

    .line 37
    .line 38
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->j:Ljava/util/List;

    .line 39
    .line 40
    sget-object v3, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_O_DIAMOND:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 41
    .line 42
    invoke-interface {v2, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-eqz v2, :cond_2

    .line 47
    .line 48
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->j:Ljava/util/List;

    .line 49
    .line 50
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->h:I

    .line 51
    .line 52
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    check-cast v2, Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 57
    .line 58
    invoke-static {v2}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    goto :goto_1

    .line 63
    :cond_2
    move v2, v0

    .line 64
    :goto_1
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->h:I

    .line 65
    .line 66
    if-ne p1, v3, :cond_3

    .line 67
    .line 68
    const/4 v3, 0x1

    .line 69
    goto :goto_2

    .line 70
    :cond_3
    move v3, v0

    .line 71
    :goto_2
    invoke-virtual {v1, v3, v2}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabView;->d(ZZ)V

    .line 72
    .line 73
    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->i:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer$a;

    .line 75
    .line 76
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-eqz v1, :cond_5

    .line 81
    .line 82
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->h:I

    .line 83
    .line 84
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer;->i:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer$a;

    .line 85
    .line 86
    if-ne p1, v1, :cond_4

    .line 87
    .line 88
    invoke-interface {v2, p1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer$a;->b(I)V

    .line 89
    .line 90
    .line 91
    goto :goto_3

    .line 92
    :cond_4
    invoke-interface {v2, p1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseTabViewContainer$a;->a(I)V

    .line 93
    .line 94
    .line 95
    :cond_5
    :goto_3
    add-int/lit8 p1, p1, 0x1

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_6
    return-void
.end method
