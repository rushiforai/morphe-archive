.class public final Lz5n;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final A:Landroid/graphics/LinearGradient;

.field public static final B:Landroid/graphics/LinearGradient;

.field public static final C:Landroid/graphics/LinearGradient;

.field public static final t:[I

.field public static final u:[I

.field public static final v:[I

.field public static final w:[I

.field public static final x:[I

.field public static final y:[I

.field public static final z:[I


# instance fields
.field public final a:Landroid/view/View;

.field public b:Landroid/content/res/ColorStateList;

.field public c:Landroid/content/res/ColorStateList;

.field public d:Landroid/content/res/ColorStateList;

.field public e:Landroid/content/res/ColorStateList;

.field public final f:I

.field public final g:I

.field public final h:Z

.field public final i:Z

.field public final j:Landroid/graphics/Matrix;

.field public final k:Landroid/graphics/Paint;

.field public final l:Landroidx/collection/ArrayMap;

.field public final m:Z

.field public n:Z

.field public o:Z

.field public p:Z

.field public q:Landroid/content/res/ColorStateList;

.field public r:Landroid/content/res/ColorStateList;

.field public final s:Z


# direct methods
.method static constructor <clinit>()V
    .registers 10

    const v0, 0x7f04046b

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lz5n;->t:[I

    const v0, 0x7f040468

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lz5n;->u:[I

    const v0, 0x7f04046a

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lz5n;->v:[I

    const v0, 0x7f040469

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lz5n;->w:[I

    const v0, 0x7f040467

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lz5n;->x:[I

    const v0, 0x7f04046f

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lz5n;->y:[I

    const v0, 0x7f04046e

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lz5n;->z:[I

    new-instance v1, Landroid/graphics/LinearGradient;

    sget-object v9, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v5, 0x0

    const/4 v6, -0x1

    const v7, 0xffffff

    move-object v8, v9

    invoke-direct/range {v1 .. v8}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    sput-object v1, Lz5n;->A:Landroid/graphics/LinearGradient;

    new-instance v2, Landroid/graphics/LinearGradient;

    const/4 v7, -0x1

    const v8, 0xffffff

    const/4 v4, 0x0

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-direct/range {v2 .. v9}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    sput-object v2, Lz5n;->B:Landroid/graphics/LinearGradient;

    new-instance v2, Landroid/graphics/LinearGradient;

    const/high16 v0, 0x1b000000

    const/4 v1, 0x0

    const/high16 v3, 0x49000000    # 524288.0f

    filled-new-array {v3, v0, v1}, [I

    move-result-object v7

    const/4 v0, 0x3

    new-array v8, v0, [F

    fill-array-data v8, :array_78

    const/4 v3, 0x0

    invoke-direct/range {v2 .. v9}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    sput-object v2, Lz5n;->C:Landroid/graphics/LinearGradient;

    return-void

    :array_78
    .array-data 4
        0x0
        0x3f000000    # 0.5f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>(Landroid/view/View;Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 13

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lz5n;->j:Landroid/graphics/Matrix;

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lz5n;->k:Landroid/graphics/Paint;

    new-instance v2, Landroidx/collection/ArrayMap;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lhkj;-><init>(I)V

    iput-object v2, p0, Lz5n;->l:Landroidx/collection/ArrayMap;

    iput-object p1, p0, Lz5n;->a:Landroid/view/View;

    sget-object v2, Lkhh;->T:[I

    invoke-virtual {p2, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v2

    :try_start_22
    invoke-static {p2}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/ViewConfiguration;->getScaledFadingEdgeLength()I

    move-result v4

    invoke-virtual {v2, v3, v4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v4

    iput v4, p0, Lz5n;->f:I

    const/16 v4, 0xa

    invoke-virtual {v2, v4}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v4

    iput-object v4, p0, Lz5n;->q:Landroid/content/res/ColorStateList;

    const/16 v4, 0xc

    invoke-virtual {v2, v4, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v4

    iput-boolean v4, p0, Lz5n;->s:Z

    const/16 v4, 0x9

    invoke-virtual {v2, v4}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v4

    iput-object v4, p0, Lz5n;->r:Landroid/content/res/ColorStateList;

    const/16 v4, 0x8

    invoke-virtual {v2, v4, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v4

    iput-boolean v4, p0, Lz5n;->m:Z

    const/4 v4, 0x7

    invoke-virtual {v2, v4, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v4

    iput-boolean v4, p0, Lz5n;->n:Z

    invoke-virtual {p1, v3}, Landroid/view/View;->setVerticalFadingEdgeEnabled(Z)V

    invoke-virtual {p1, v3}, Landroid/view/View;->setHorizontalFadingEdgeEnabled(Z)V

    const/16 v4, 0xd

    invoke-virtual {v2, v4, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v4

    iput-boolean v4, p0, Lz5n;->h:Z

    invoke-virtual {v2, v1, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Lz5n;->i:Z

    if-nez v4, :cond_a4

    if-nez v1, :cond_a4

    const/4 p2, 0x6

    invoke-virtual {v2, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_85

    invoke-virtual {v2, p2}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p2

    iput-object p2, p0, Lz5n;->e:Landroid/content/res/ColorStateList;

    iput-object p2, p0, Lz5n;->d:Landroid/content/res/ColorStateList;

    iput-object p2, p0, Lz5n;->c:Landroid/content/res/ColorStateList;

    iput-object p2, p0, Lz5n;->b:Landroid/content/res/ColorStateList;

    iput v3, p0, Lz5n;->g:I

    goto :goto_c1

    :cond_85
    const/4 p2, 0x3

    invoke-virtual {v2, p2}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p2

    iput-object p2, p0, Lz5n;->b:Landroid/content/res/ColorStateList;

    const/4 p2, 0x5

    invoke-virtual {v2, p2}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p2

    iput-object p2, p0, Lz5n;->c:Landroid/content/res/ColorStateList;

    const/4 p2, 0x4

    invoke-virtual {v2, p2}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p2

    iput-object p2, p0, Lz5n;->d:Landroid/content/res/ColorStateList;

    const/4 p2, 0x2

    invoke-virtual {v2, p2}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p2

    iput-object p2, p0, Lz5n;->e:Landroid/content/res/ColorStateList;

    iput v3, p0, Lz5n;->g:I

    goto :goto_c1

    :cond_a4
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/high16 v4, 0x40800000    # 4.0f

    invoke-static {v4, v1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v1

    iput v1, p0, Lz5n;->f:I

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const/4 v1, 0x0

    invoke-static {v1, p2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p2

    const/16 v1, 0xb

    invoke-virtual {v2, v1, p2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lz5n;->g:I
    :try_end_c1
    .catchall {:try_start_22 .. :try_end_c1} :catchall_108

    :goto_c1
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    const/4 p2, -0x1

    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setColor(I)V

    new-instance p2, Lzg;

    invoke-direct {p2, p1, p3, v3}, Lzg;-><init>(Landroid/view/View;Landroid/util/AttributeSet;I)V

    sget-object p3, Lz5n;->y:[I

    invoke-static {p2, p3}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v2

    sget-object p3, Lz5n;->z:[I

    invoke-static {p2, p3}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v3

    sget-object p3, Lz5n;->t:[I

    invoke-static {p2, p3}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v4

    sget-object p3, Lz5n;->u:[I

    invoke-static {p2, p3}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v5

    sget-object p3, Lz5n;->v:[I

    invoke-static {p2, p3}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v6

    sget-object p3, Lz5n;->w:[I

    invoke-static {p2, p3}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v7

    sget-object p3, Lz5n;->x:[I

    invoke-static {p2, p3}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object v8

    new-instance v0, Ly5n;

    move-object v1, p0

    invoke-direct/range {v0 .. v8}, Ly5n;-><init>(Lz5n;Lff2;Lff2;Lff2;Lff2;Lff2;Lff2;Lff2;)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p0

    if-nez p0, :cond_104

    return-void

    :cond_104
    invoke-static {p0, p1, v0}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void

    :catchall_108
    move-exception v0

    move-object p0, v0

    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    throw p0
.end method

.method public static d(Landroid/content/res/ColorStateList;[I)I
    .registers 3

    const/4 v0, 0x0

    if-nez p0, :cond_4

    return v0

    :cond_4
    invoke-virtual {p0, p1, v0}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result p0

    return p0
.end method


# virtual methods
.method public final a(Landroid/graphics/Canvas;Landroid/view/View;FFFF)V
    .registers 36

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v7, p2

    move/from16 v2, p4

    move/from16 v3, p6

    iget-object v4, v0, Lz5n;->a:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getDrawableState()[I

    move-result-object v4

    iget-object v5, v0, Lz5n;->b:Landroid/content/res/ColorStateList;

    invoke-static {v5, v4}, Lz5n;->d(Landroid/content/res/ColorStateList;[I)I

    move-result v8

    iget-object v5, v0, Lz5n;->c:Landroid/content/res/ColorStateList;

    invoke-static {v5, v4}, Lz5n;->d(Landroid/content/res/ColorStateList;[I)I

    move-result v5

    iget-object v6, v0, Lz5n;->d:Landroid/content/res/ColorStateList;

    invoke-static {v6, v4}, Lz5n;->d(Landroid/content/res/ColorStateList;[I)I

    move-result v9

    iget-object v6, v0, Lz5n;->e:Landroid/content/res/ColorStateList;

    invoke-static {v6, v4}, Lz5n;->d(Landroid/content/res/ColorStateList;[I)I

    move-result v10

    iget-object v6, v0, Lz5n;->q:Landroid/content/res/ColorStateList;

    invoke-static {v6, v4}, Lz5n;->d(Landroid/content/res/ColorStateList;[I)I

    move-result v11

    iget-object v6, v0, Lz5n;->r:Landroid/content/res/ColorStateList;

    invoke-static {v6, v4}, Lz5n;->d(Landroid/content/res/ColorStateList;[I)I

    move-result v12

    invoke-virtual {v7}, Landroid/view/View;->getWidth()I

    move-result v13

    invoke-virtual {v7}, Landroid/view/View;->getHeight()I

    move-result v14

    invoke-virtual {v7}, Landroid/view/View;->getScrollY()I

    move-result v15

    invoke-virtual {v7}, Landroid/view/View;->getScrollX()I

    move-result v4

    iget-boolean v6, v0, Lz5n;->o:Z

    move/from16 v16, v11

    const/high16 v11, 0x3f800000    # 1.0f

    if-eqz v6, :cond_4e

    move v6, v11

    goto :goto_4f

    :cond_4e
    move v6, v2

    :goto_4f
    invoke-static {v11, v6}, Ljava/lang/Math;->min(FF)F

    move-result v6

    const/4 v11, 0x0

    invoke-static {v11, v6}, Ljava/lang/Math;->max(FF)F

    move-result v6

    iget v11, v0, Lz5n;->f:I

    int-to-float v11, v11

    mul-float/2addr v6, v11

    float-to-int v6, v6

    move/from16 v18, v4

    iget v4, v0, Lz5n;->g:I

    invoke-static {v6, v4}, Ljava/lang/Math;->max(II)I

    move-result v6

    move/from16 v19, v11

    move/from16 v20, v12

    const/high16 v11, 0x3f800000    # 1.0f

    invoke-static {v11, v3}, Ljava/lang/Math;->min(FF)F

    move-result v12

    const/4 v11, 0x0

    invoke-static {v11, v12}, Ljava/lang/Math;->max(FF)F

    move-result v12

    mul-float v12, v12, v19

    float-to-int v12, v12

    invoke-static {v12, v4}, Ljava/lang/Math;->max(II)I

    move-result v12

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static {v4, v2}, Ljava/lang/Math;->min(FF)F

    move-result v3

    invoke-static {v11, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    mul-float v3, v3, v19

    float-to-int v3, v3

    iget-boolean v11, v0, Lz5n;->p:Z

    if-eqz v11, :cond_8e

    move v11, v4

    goto :goto_90

    :cond_8e
    move/from16 v11, p6

    :goto_90
    invoke-static {v4, v11}, Ljava/lang/Math;->min(FF)F

    move-result v11

    const/4 v4, 0x0

    invoke-static {v4, v11}, Ljava/lang/Math;->max(FF)F

    move-result v11

    mul-float v11, v11, v19

    float-to-int v11, v11

    move/from16 v2, p3

    move/from16 v21, v9

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-static {v9, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    invoke-static {v4, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    mul-float v2, v2, v19

    float-to-int v2, v2

    move/from16 p3, v2

    move/from16 v2, p5

    invoke-static {v9, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    invoke-static {v4, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    mul-float v2, v2, v19

    float-to-int v9, v2

    const/4 v4, 0x1

    if-gt v3, v4, :cond_c4

    if-gt v11, v4, :cond_c4

    const/16 v19, 0x0

    goto :goto_c6

    :cond_c4
    move/from16 v19, v4

    :goto_c6
    iget-boolean v2, v0, Lz5n;->m:Z

    move/from16 v22, v2

    const/4 v2, -0x1

    if-eqz v22, :cond_dc

    invoke-virtual {v7, v4}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v22

    if-eqz v22, :cond_dc

    invoke-virtual {v7, v2}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v22

    if-nez v22, :cond_dc

    const/16 v22, 0x0

    goto :goto_de

    :cond_dc
    move/from16 v22, v4

    :goto_de
    iget-boolean v2, v0, Lz5n;->s:Z

    if-eqz v19, :cond_e4

    if-nez v22, :cond_e6

    :cond_e4
    if-eqz v2, :cond_f3

    :cond_e6
    if-eqz v16, :cond_f3

    const/16 v17, 0x0

    cmpl-float v24, p4, v17

    if-eqz v24, :cond_f0

    if-gt v6, v4, :cond_f3

    :cond_f0
    move/from16 v24, v4

    goto :goto_f5

    :cond_f3
    const/16 v24, 0x0

    :goto_f5
    if-eqz v19, :cond_104

    if-eqz v20, :cond_104

    const/16 v17, 0x0

    cmpl-float v25, p6, v17

    if-eqz v25, :cond_101

    if-gt v12, v4, :cond_104

    :cond_101
    move/from16 v25, v4

    goto :goto_106

    :cond_104
    const/16 v25, 0x0

    :goto_106
    iget-boolean v4, v0, Lz5n;->h:Z

    move/from16 v26, v2

    sget-object v2, Lz5n;->B:Landroid/graphics/LinearGradient;

    move-object/from16 p4, v2

    move/from16 v27, v3

    sget-object v3, Lz5n;->C:Landroid/graphics/LinearGradient;

    iget-object v2, v0, Lz5n;->k:Landroid/graphics/Paint;

    if-eqz v4, :cond_11b

    const/4 v4, 0x1

    if-le v6, v4, :cond_11b

    if-eqz v24, :cond_11f

    :cond_11b
    iget-boolean v4, v0, Lz5n;->o:Z

    if-eqz v4, :cond_156

    :cond_11f
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    move-result v5

    int-to-float v4, v15

    move-object/from16 v24, v2

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v4}, Landroid/graphics/Canvas;->translate(FF)V

    int-to-float v2, v6

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-virtual {v1, v4, v2}, Landroid/graphics/Canvas;->scale(FF)V

    move-object v4, v3

    const/4 v3, 0x0

    move-object v6, v4

    int-to-float v4, v13

    move/from16 v27, v5

    move v5, v2

    const/4 v2, 0x0

    move-object v7, v6

    move/from16 v28, v8

    move/from16 v23, v14

    move-object/from16 v6, v24

    move/from16 v14, v27

    const/4 v8, 0x1

    move/from16 v24, v18

    move/from16 v18, v9

    move-object/from16 v9, p4

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    invoke-virtual {v1, v14}, Landroid/graphics/Canvas;->restoreToCount(I)V

    goto :goto_18b

    :cond_156
    move-object v6, v2

    move-object v7, v3

    move/from16 v28, v8

    move/from16 v23, v14

    move/from16 v24, v18

    const/4 v8, 0x1

    move/from16 v18, v9

    move-object/from16 v9, p4

    if-eqz v5, :cond_18b

    move/from16 v2, v27

    if-le v2, v8, :cond_18b

    invoke-virtual {v6, v9}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    invoke-virtual {v0, v5}, Lz5n;->c(I)Landroid/graphics/PorterDuffColorFilter;

    move-result-object v3

    invoke-virtual {v6, v3}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    move-result v14

    int-to-float v3, v15

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v3}, Landroid/graphics/Canvas;->translate(FF)V

    int-to-float v5, v2

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-virtual {v1, v4, v5}, Landroid/graphics/Canvas;->scale(FF)V

    const/4 v3, 0x0

    int-to-float v4, v13

    const/4 v2, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    invoke-virtual {v1, v14}, Landroid/graphics/Canvas;->restoreToCount(I)V

    :cond_18b
    :goto_18b
    iget-boolean v2, v0, Lz5n;->i:Z

    iget-object v14, v0, Lz5n;->j:Landroid/graphics/Matrix;

    if-eqz v2, :cond_1bc

    if-le v12, v8, :cond_1bc

    if-nez v25, :cond_1bc

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    const/4 v4, 0x0

    invoke-virtual {v6, v4}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    move-result v7

    add-int v2, v15, v23

    int-to-float v2, v2

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v2}, Landroid/graphics/Canvas;->translate(FF)V

    neg-int v2, v12

    int-to-float v2, v2

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-virtual {v14, v4, v2}, Landroid/graphics/Matrix;->setScale(FF)V

    invoke-virtual {v1, v14}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    int-to-float v4, v13

    int-to-float v5, v12

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    invoke-virtual {v1, v7}, Landroid/graphics/Canvas;->restoreToCount(I)V

    goto :goto_1e9

    :cond_1bc
    if-eqz v10, :cond_1e9

    if-le v11, v8, :cond_1e9

    invoke-virtual {v6, v9}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    invoke-virtual {v0, v10}, Lz5n;->c(I)Landroid/graphics/PorterDuffColorFilter;

    move-result-object v2

    invoke-virtual {v6, v2}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    move-result v7

    add-int v2, v15, v23

    int-to-float v2, v2

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v2}, Landroid/graphics/Canvas;->translate(FF)V

    neg-int v2, v11

    int-to-float v2, v2

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-virtual {v14, v4, v2}, Landroid/graphics/Matrix;->setScale(FF)V

    invoke-virtual {v1, v14}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    int-to-float v4, v13

    int-to-float v5, v11

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    invoke-virtual {v1, v7}, Landroid/graphics/Canvas;->restoreToCount(I)V

    :cond_1e9
    :goto_1e9
    sget-object v7, Lz5n;->A:Landroid/graphics/LinearGradient;

    if-eqz v28, :cond_21a

    if-lez p3, :cond_21a

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    move/from16 v2, v28

    invoke-virtual {v0, v2}, Lz5n;->c(I)Landroid/graphics/PorterDuffColorFilter;

    move-result-object v2

    invoke-virtual {v6, v2}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    move-result v9

    move/from16 v10, v24

    int-to-float v2, v10

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v4}, Landroid/graphics/Canvas;->translate(FF)V

    move/from16 v2, p3

    int-to-float v4, v2

    const/high16 v11, 0x3f800000    # 1.0f

    invoke-virtual {v1, v4, v11}, Landroid/graphics/Canvas;->scale(FF)V

    const/4 v3, 0x0

    move/from16 v11, v23

    int-to-float v5, v11

    const/4 v2, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    invoke-virtual {v1, v9}, Landroid/graphics/Canvas;->restoreToCount(I)V

    goto :goto_21e

    :cond_21a
    move/from16 v11, v23

    move/from16 v10, v24

    :goto_21e
    if-eqz v21, :cond_24f

    if-lez v18, :cond_24f

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    move/from16 v2, v21

    invoke-virtual {v0, v2}, Lz5n;->c(I)Landroid/graphics/PorterDuffColorFilter;

    move-result-object v2

    invoke-virtual {v6, v2}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    move-result v7

    add-int v4, v10, v13

    int-to-float v2, v4

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v4}, Landroid/graphics/Canvas;->translate(FF)V

    move/from16 v2, v18

    neg-int v3, v2

    int-to-float v3, v3

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-virtual {v14, v3, v4}, Landroid/graphics/Matrix;->setScale(FF)V

    invoke-virtual {v1, v14}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    int-to-float v4, v2

    int-to-float v5, v11

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    invoke-virtual {v1, v7}, Landroid/graphics/Canvas;->restoreToCount(I)V

    :cond_24f
    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static {v4, v2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v7

    if-eqz v19, :cond_25d

    if-nez v22, :cond_25f

    :cond_25d
    if-eqz v26, :cond_26e

    :cond_25f
    int-to-float v1, v10

    int-to-float v2, v15

    add-int v4, v10, v13

    int-to-float v3, v4

    add-int v4, v15, v7

    int-to-float v4, v4

    move-object/from16 v5, p1

    move/from16 v6, v16

    invoke-static/range {v1 .. v6}, Lvj6;->a(FFFFLandroid/graphics/Canvas;I)V

    :cond_26e
    if-eqz v19, :cond_297

    iget-boolean v1, v0, Lz5n;->p:Z

    if-nez v1, :cond_287

    iget-boolean v0, v0, Lz5n;->n:Z

    if-eqz v0, :cond_287

    move-object/from16 v0, p2

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v1

    if-eqz v1, :cond_287

    invoke-virtual {v0, v8}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v0

    if-eqz v0, :cond_297

    :cond_287
    int-to-float v0, v10

    add-int/2addr v15, v11

    sub-int v1, v15, v7

    int-to-float v1, v1

    add-int v4, v10, v13

    int-to-float v2, v4

    int-to-float v3, v15

    move-object/from16 v4, p1

    move/from16 v5, v20

    invoke-static/range {v0 .. v5}, Lvj6;->a(FFFFLandroid/graphics/Canvas;I)V

    :cond_297
    return-void
.end method

.method public final b(Landroid/widget/FrameLayout;)F
    .registers 4

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-nez v0, :cond_8

    const/4 p0, 0x0

    return p0

    :cond_8
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getPaddingBottom()I

    move-result v1

    sub-int/2addr v0, v1

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    move-result v1

    invoke-virtual {p1}, Landroid/view/View;->getScrollY()I

    move-result p1

    sub-int/2addr v1, p1

    sub-int/2addr v1, v0

    iget p0, p0, Lz5n;->f:I

    if-ge v1, p0, :cond_28

    int-to-float p1, v1

    int-to-float p0, p0

    div-float/2addr p1, p0

    return p1

    :cond_28
    const/high16 p0, 0x3f800000    # 1.0f

    return p0
.end method

.method public final c(I)Landroid/graphics/PorterDuffColorFilter;
    .registers 4

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-object p0, p0, Lz5n;->l:Landroidx/collection/ArrayMap;

    invoke-virtual {p0, v0}, Lhkj;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/PorterDuffColorFilter;

    if-nez v0, :cond_1c

    new-instance v0, Landroid/graphics/PorterDuffColorFilter;

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v0, p1, v1}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1, v0}, Lhkj;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1c
    return-object v0
.end method

.method public final e(Z)V
    .registers 3

    iget-boolean v0, p0, Lz5n;->p:Z

    if-ne p1, v0, :cond_5

    return-void

    :cond_5
    iput-boolean p1, p0, Lz5n;->p:Z

    iget-object p0, p0, Lz5n;->a:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public final f(Z)V
    .registers 3

    iget-boolean v0, p0, Lz5n;->o:Z

    if-ne p1, v0, :cond_5

    return-void

    :cond_5
    iput-boolean p1, p0, Lz5n;->o:Z

    iget-object p0, p0, Lz5n;->a:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method
