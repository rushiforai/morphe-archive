.class public final Ljqe;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"


# static fields
.field public static final synthetic e:[Lxtb;


# instance fields
.field public final a:Liqe;

.field public final b:Liqe;

.field public final c:Liqe;

.field public final d:Landroid/graphics/Paint;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    new-instance v0, Lpee;

    const-class v1, Ljqe;

    const-string v2, "color"

    const-string v3, "getColor()I"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Lpee;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v2, Lpee;

    const-string v3, "insetX"

    const-string v5, "getInsetX()I"

    invoke-direct {v2, v1, v3, v5, v4}, Lpee;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    new-instance v3, Lpee;

    const-string v5, "cornerRadius"

    const-string v6, "getCornerRadius()I"

    invoke-direct {v3, v1, v5, v6, v4}, Lpee;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x3

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    const/4 v0, 0x1

    aput-object v2, v1, v0

    const/4 v0, 0x2

    aput-object v3, v1, v0

    sput-object v1, Ljqe;->e:[Lxtb;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    new-instance v0, Liqe;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Liqe;-><init>(Ljqe;B)V

    iput-object v0, p0, Ljqe;->a:Liqe;

    new-instance v0, Liqe;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Liqe;-><init>(Ljqe;B)V

    iput-object v0, p0, Ljqe;->b:Liqe;

    new-instance v0, Liqe;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Liqe;-><init>(Ljqe;B)V

    iput-object v0, p0, Ljqe;->c:Liqe;

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Ljqe;->d:Landroid/graphics/Paint;

    return-void
.end method


# virtual methods
.method public final a()I
    .registers 3

    sget-object v0, Ljqe;->e:[Lxtb;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    iget-object p0, p0, Ljqe;->a:Liqe;

    iget-object p0, p0, La7f;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    return p0
.end method

.method public final b()I
    .registers 3

    sget-object v0, Ljqe;->e:[Lxtb;

    const/4 v1, 0x2

    aget-object v0, v0, v1

    iget-object p0, p0, Ljqe;->c:Liqe;

    iget-object p0, p0, La7f;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    return p0
.end method

.method public final c()I
    .registers 3

    sget-object v0, Ljqe;->e:[Lxtb;

    const/4 v1, 0x1

    aget-object v0, v0, v1

    iget-object p0, p0, Ljqe;->b:Liqe;

    iget-object p0, p0, La7f;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    return p0
.end method

.method public final draw(Landroid/graphics/Canvas;)V
    .registers 11

    invoke-virtual {p0}, Ljqe;->a()I

    move-result v0

    invoke-static {v0}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    if-nez v0, :cond_b

    return-void

    :cond_b
    invoke-virtual {p0}, Ljqe;->a()I

    move-result v0

    iget-object v8, p0, Ljqe;->d:Landroid/graphics/Paint;

    invoke-virtual {v8, v0}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    iget v1, v0, Landroid/graphics/Rect;->left:I

    invoke-virtual {p0}, Ljqe;->c()I

    move-result v2

    add-int/2addr v2, v1

    int-to-float v2, v2

    iget v1, v0, Landroid/graphics/Rect;->top:I

    int-to-float v3, v1

    iget v1, v0, Landroid/graphics/Rect;->right:I

    invoke-virtual {p0}, Ljqe;->c()I

    move-result v4

    sub-int/2addr v1, v4

    int-to-float v4, v1

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p0}, Ljqe;->b()I

    move-result v1

    add-int/2addr v1, v0

    int-to-float v5, v1

    invoke-virtual {p0}, Ljqe;->b()I

    move-result v0

    int-to-float v6, v0

    invoke-virtual {p0}, Ljqe;->b()I

    move-result p0

    int-to-float v7, p0

    move-object v1, p1

    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method public final getOpacity()I
    .registers 1

    const/4 p0, -0x3

    return p0
.end method

.method public final setAlpha(I)V
    .registers 2

    iget-object p0, p0, Ljqe;->d:Landroid/graphics/Paint;

    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    return-void
.end method

.method public final setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 2

    iget-object p0, p0, Ljqe;->d:Landroid/graphics/Paint;

    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    return-void
.end method
