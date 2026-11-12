.class public final Lsik;
.super Landroid/text/style/ReplacementSpan;
.source "SourceFile"


# instance fields
.field public final a:Lfyf;

.field public final b:Lfyf;


# direct methods
.method public constructor <init>(ILcom/opera/hype/image/editor/TextBoxEditText;)V
    .registers 5

    invoke-direct {p0}, Landroid/text/style/ReplacementSpan;-><init>()V

    new-instance v0, Lfyf;

    const/16 v1, 0x76

    invoke-direct {v0, p1, p2, v1}, Lfyf;-><init>(ILcom/opera/hype/image/editor/TextBoxEditText;I)V

    iput-object v0, p0, Lsik;->a:Lfyf;

    new-instance p1, Lfyf;

    const/4 v0, 0x0

    const/16 v1, 0x7f

    invoke-direct {p1, v0, p2, v1}, Lfyf;-><init>(ILcom/opera/hype/image/editor/TextBoxEditText;I)V

    iput-object p1, p0, Lsik;->b:Lfyf;

    return-void
.end method


# virtual methods
.method public final draw(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFIIILandroid/graphics/Paint;)V
    .registers 12

    int-to-float p6, p7

    move-object p7, p9

    invoke-virtual/range {p1 .. p7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/CharSequence;IIFFLandroid/graphics/Paint;)V

    move-object v1, p7

    move p7, p6

    move-object p6, v1

    iget-object p8, p0, Lsik;->b:Lfyf;

    invoke-virtual {p8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p6}, Landroid/graphics/Paint;->getColor()I

    move-result p9

    iput p9, p8, Lfyf;->a:I

    invoke-virtual {p6}, Landroid/graphics/Paint;->getStyle()Landroid/graphics/Paint$Style;

    move-result-object p9

    iput-object p9, p8, Lfyf;->b:Landroid/graphics/Paint$Style;

    invoke-virtual {p6}, Landroid/graphics/Paint;->getStrokeJoin()Landroid/graphics/Paint$Join;

    move-result-object p9

    iput-object p9, p8, Lfyf;->c:Landroid/graphics/Paint$Join;

    const/4 p9, 0x0

    iput p9, p8, Lfyf;->d:F

    invoke-virtual {p6}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result p9

    iput p9, p8, Lfyf;->e:F

    iget-object p9, p8, Lfyf;->h:Lcom/opera/hype/image/editor/TextBoxEditText;

    invoke-virtual {p9}, Landroid/widget/TextView;->getShadowRadius()F

    move-result v0

    iput v0, p8, Lfyf;->f:F

    invoke-virtual {p9}, Landroid/widget/TextView;->getShadowColor()I

    move-result p9

    iput p9, p8, Lfyf;->g:I

    iget-object p0, p0, Lsik;->a:Lfyf;

    invoke-virtual {p0, p6}, Lfyf;->a(Landroid/graphics/Paint;)V

    move-object p0, p1

    move-object p1, p2

    move p2, p3

    move p3, p4

    move p4, p5

    move p5, p7

    invoke-virtual/range {p0 .. p6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/CharSequence;IIFFLandroid/graphics/Paint;)V

    invoke-virtual {p8, p6}, Lfyf;->a(Landroid/graphics/Paint;)V

    return-void
.end method

.method public final getSize(Landroid/graphics/Paint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;)I
    .registers 6

    if-eqz p5, :cond_5

    invoke-virtual {p1, p5}, Landroid/graphics/Paint;->getFontMetricsInt(Landroid/graphics/Paint$FontMetricsInt;)I

    :cond_5
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p3, p4}, Ldjh;->j(II)Lkotlin/ranges/IntRange;

    move-result-object p2

    iget p3, p2, Lkotlin/ranges/a;->a:I

    iget p2, p2, Lkotlin/ranges/a;->b:I

    add-int/lit8 p2, p2, 0x1

    invoke-virtual {p0, p3, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result p0

    float-to-int p0, p0

    return p0
.end method
