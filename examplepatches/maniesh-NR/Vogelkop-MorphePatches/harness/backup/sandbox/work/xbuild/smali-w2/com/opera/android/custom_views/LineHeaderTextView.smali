.class public Lcom/opera/android/custom_views/LineHeaderTextView;
.super Lcom/opera/android/custom_views/StylingTextView;
.source "SourceFile"


# static fields
.field public static final synthetic p:I


# instance fields
.field public final m:I

.field public final n:I

.field public final o:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v1, 0x41000000    # 8.0f

    invoke-static {v1, v0}, Lfan;->a(FLandroid/content/res/Resources;)I

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/opera/android/custom_views/StylingTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p2, Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-direct {p2, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p2, p0, Lcom/opera/android/custom_views/LineHeaderTextView;->o:Landroid/graphics/Paint;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-static {v1, p2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p2

    iput p2, p0, Lcom/opera/android/custom_views/LineHeaderTextView;->m:I

    const/high16 p2, 0x3f800000    # 1.0f

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-static {p2, p1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p1

    iput p1, p0, Lcom/opera/android/custom_views/LineHeaderTextView;->n:I

    new-instance p1, Llzb;

    const/4 p2, 0x3

    invoke-direct {p1, p0, p2}, Llzb;-><init>(Ljava/lang/Object;B)V

    sget-object p2, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object p2

    if-eqz p2, :cond_40

    invoke-static {p2, p0, p1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_40
    const/16 p1, 0x11

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setGravity(I)V

    return-void
.end method


# virtual methods
.method public final onAttachedToWindow()V
    .registers 4

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f04084a

    const v2, 0x7f0600a8

    invoke-static {v1, v0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    iget-object v1, p0, Lcom/opera/android/custom_views/LineHeaderTextView;->o:Landroid/graphics/Paint;

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public final onDraw(Landroid/graphics/Canvas;)V
    .registers 19

    move-object/from16 v0, p0

    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v2

    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {v0}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/text/Layout;->getLineWidth(I)F

    move-result v3

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v4

    sub-int/2addr v4, v3

    const/4 v5, 0x2

    div-int/2addr v4, v5

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v6

    add-int/2addr v6, v3

    div-int/2addr v6, v5

    iget v3, v0, Lcom/opera/android/custom_views/LineHeaderTextView;->m:I

    sub-int/2addr v4, v3

    invoke-static {v1, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    add-int/2addr v6, v3

    invoke-static {v2, v6}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v6

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v7

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v8

    sub-int/2addr v7, v8

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v8

    sub-int/2addr v7, v8

    iget v8, v0, Lcom/opera/android/custom_views/LineHeaderTextView;->n:I

    invoke-static {v7, v8, v5, v6}, Lz1m;->d(IIII)I

    move-result v5

    invoke-virtual {v0}, Landroid/view/View;->getScrollX()I

    move-result v6

    add-int/2addr v1, v6

    int-to-float v10, v1

    int-to-float v11, v5

    add-int/2addr v4, v6

    int-to-float v12, v4

    add-int v1, v5, v8

    int-to-float v13, v1

    iget-object v14, v0, Lcom/opera/android/custom_views/LineHeaderTextView;->o:Landroid/graphics/Paint;

    move-object/from16 v9, p1

    invoke-virtual/range {v9 .. v14}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    add-int/2addr v3, v6

    int-to-float v12, v3

    add-int/2addr v6, v2

    int-to-float v0, v6

    add-int/2addr v5, v8

    int-to-float v15, v5

    move v13, v11

    move-object/from16 v16, v14

    move-object/from16 v11, p1

    move v14, v0

    invoke-virtual/range {v11 .. v16}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    return-void
.end method
