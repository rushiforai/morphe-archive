.class public final Lwmj;
.super Landroid/view/View;
.source "SourceFile"

# interfaces
.implements Lk2c;


# instance fields
.field public a:Ljava/lang/String;

.field public b:Lvmj;

.field public final c:Ll2c;

.field public final d:Lfr;

.field public e:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v1, v0}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance v0, Ll2c;

    invoke-direct {v0, p0, p0, v1}, Ll2c;-><init>(Landroid/view/View;Lk2c;Landroid/util/AttributeSet;)V

    iput-object v0, p0, Lwmj;->c:Ll2c;

    invoke-static {p1, v1}, Lfr;->f(Landroid/content/Context;Landroid/util/AttributeSet;)Lfr;

    move-result-object p1

    iput-object p1, p0, Lwmj;->d:Lfr;

    if-eqz p1, :cond_17

    invoke-virtual {p1, p0}, Lfr;->e(Landroid/view/View;)V

    :cond_17
    return-void
.end method


# virtual methods
.method public final b()Ll2c;
    .registers 1

    iget-object p0, p0, Lwmj;->c:Ll2c;

    return-object p0
.end method

.method public final i(I)V
    .registers 2

    iget-object p1, p0, Lwmj;->d:Lfr;

    if-eqz p1, :cond_7

    invoke-virtual {p1, p0}, Lfr;->e(Landroid/view/View;)V

    :cond_7
    return-void
.end method

.method public final onDraw(Landroid/graphics/Canvas;)V
    .registers 7

    iget-object v0, p0, Lwmj;->a:Ljava/lang/String;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lwmj;->b:Lvmj;

    if-nez v0, :cond_41

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lwmj;->a:Ljava/lang/String;

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v3

    sget v4, Lvmj;->g:I

    const/16 v4, 0x30

    invoke-static {v0, v1, v2, v3, v4}, Ltmj;->j(Landroid/content/Context;Ljava/lang/String;III)Lvmj;

    move-result-object v0

    iput-object v0, p0, Lwmj;->b:Lvmj;

    iget-boolean v1, p0, Lwmj;->e:Z

    if-eqz v1, :cond_41

    iget-object v1, v0, Lvmj;->f:Landroid/graphics/Bitmap;

    if-nez v1, :cond_41

    iget v1, v0, Lvmj;->a:I

    iget v2, v0, Lvmj;->b:I

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2, v3}, Lz5i;->u(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_3e

    new-instance v2, Landroid/graphics/Canvas;

    invoke-direct {v2, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v0, v2}, Lvmj;->a(Landroid/graphics/Canvas;)V

    goto :goto_3f

    :cond_3e
    const/4 v1, 0x0

    :goto_3f
    iput-object v1, v0, Lvmj;->f:Landroid/graphics/Bitmap;

    :cond_41
    iget-object v0, p0, Lwmj;->b:Lvmj;

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object p0, p0, Lwmj;->b:Lvmj;

    invoke-virtual {p0, p1}, Lvmj;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public final onMeasure(II)V
    .registers 5

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    if-nez v1, :cond_10

    if-lez v0, :cond_10

    invoke-virtual {p0, v0, v0}, Landroid/view/View;->setMeasuredDimension(II)V

    return-void

    :cond_10
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    return-void
.end method
