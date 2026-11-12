.class public final Lfyf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:Landroid/graphics/Paint$Style;

.field public c:Landroid/graphics/Paint$Join;

.field public d:F

.field public e:F

.field public f:F

.field public g:I

.field public final h:Lcom/opera/hype/image/editor/TextBoxEditText;


# direct methods
.method public constructor <init>(ILcom/opera/hype/image/editor/TextBoxEditText;I)V
    .registers 8

    and-int/lit8 v0, p3, 0x1

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    move p1, v1

    :cond_6
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    sget-object v2, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    and-int/lit8 p3, p3, 0x8

    const/4 v3, 0x0

    if-eqz p3, :cond_11

    move p3, v3

    goto :goto_14

    :cond_11
    const p3, 0x3d23d70a    # 0.04f

    :goto_14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lfyf;->a:I

    iput-object v0, p0, Lfyf;->b:Landroid/graphics/Paint$Style;

    iput-object v2, p0, Lfyf;->c:Landroid/graphics/Paint$Join;

    iput p3, p0, Lfyf;->d:F

    iput v3, p0, Lfyf;->e:F

    iput v3, p0, Lfyf;->f:F

    iput v1, p0, Lfyf;->g:I

    iput-object p2, p0, Lfyf;->h:Lcom/opera/hype/image/editor/TextBoxEditText;

    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Paint;)V
    .registers 5

    iget v0, p0, Lfyf;->a:I

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lfyf;->b:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Lfyf;->c:Landroid/graphics/Paint$Join;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    iget v0, p0, Lfyf;->d:F

    const/4 v1, 0x0

    cmpg-float v2, v0, v1

    if-nez v2, :cond_19

    iget v0, p0, Lfyf;->e:F

    goto :goto_1e

    :cond_19
    invoke-virtual {p1}, Landroid/graphics/Paint;->getTextSize()F

    move-result v2

    mul-float/2addr v0, v2

    :goto_1e
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget v0, p0, Lfyf;->f:F

    iget p0, p0, Lfyf;->g:I

    invoke-virtual {p1, v0, v1, v1, p0}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    return-void
.end method
