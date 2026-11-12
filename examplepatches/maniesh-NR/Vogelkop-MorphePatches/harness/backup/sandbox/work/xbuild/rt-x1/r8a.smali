.class public final Lr8a;
.super Liph;
.source "SourceFile"


# instance fields
.field public final a:Landroidx/recyclerview/widget/RecyclerView;

.field public b:Ljava/lang/String;

.field public final c:Landroid/text/TextPaint;

.field public final d:I

.field public e:Landroid/text/StaticLayout;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Ljava/lang/String;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/text/TextPaint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/text/TextPaint;-><init>(I)V

    iput-object v0, p0, Lr8a;->c:Landroid/text/TextPaint;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iput-object p1, p0, Lr8a;->a:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p2, p0, Lr8a;->b:Ljava/lang/String;

    const p2, 0x7f07098d

    invoke-virtual {v1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    int-to-float p2, p2

    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setTextSize(F)V

    new-instance p2, Lpc5;

    const/16 v0, 0x1a

    invoke-direct {p2, p0, v0}, Lpc5;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v0

    if-eqz v0, :cond_32

    invoke-static {v0, p1, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_32
    invoke-virtual {p2, p1}, Lpc5;->a(Landroid/view/View;)V

    const p1, 0x7f07098c

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lr8a;->d:I

    return-void
.end method


# virtual methods
.method public final e()V
    .registers 14

    iget-object v0, p0, Lr8a;->e:Landroid/text/StaticLayout;

    iget-object v1, p0, Lr8a;->a:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v0, :cond_11

    invoke-virtual {v0}, Landroid/text/Layout;->getWidth()I

    move-result v0

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v2

    if-ne v0, v2, :cond_11

    return-void

    :cond_11
    new-instance v3, Landroid/text/StaticLayout;

    iget-object v4, p0, Lr8a;->b:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v8

    sget-object v9, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    const/high16 v11, 0x3f800000    # 1.0f

    const/4 v12, 0x0

    const/4 v5, 0x0

    iget-object v7, p0, Lr8a;->c:Landroid/text/TextPaint;

    const/high16 v10, 0x3f800000    # 1.0f

    invoke-direct/range {v3 .. v12}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;IILandroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    iput-object v3, p0, Lr8a;->e:Landroid/text/StaticLayout;

    return-void
.end method

.method public final getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V
    .registers 5

    invoke-virtual {p0}, Lr8a;->e()V

    invoke-static {p2}, Landroidx/recyclerview/widget/RecyclerView;->S(Landroid/view/View;)I

    move-result p2

    iget-object p3, p0, Lr8a;->a:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p3, p3, Landroidx/recyclerview/widget/RecyclerView;->n:Landroidx/recyclerview/widget/f;

    instance-of p4, p3, Landroidx/recyclerview/widget/CustomGridLayoutManager;

    if-eqz p4, :cond_14

    check-cast p3, Landroidx/recyclerview/widget/CustomGridLayoutManager;

    iget p3, p3, Landroidx/recyclerview/widget/CustomGridLayoutManager;->b:I

    goto :goto_15

    :cond_14
    const/4 p3, 0x1

    :goto_15
    if-ge p2, p3, :cond_1e

    iget p0, p0, Lr8a;->d:I

    const/4 p2, 0x0

    invoke-virtual {p1, p2, p0, p2, p2}, Landroid/graphics/Rect;->set(IIII)V

    return-void

    :cond_1e
    invoke-virtual {p1}, Landroid/graphics/Rect;->setEmpty()V

    return-void
.end method

.method public final onDraw(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V
    .registers 6

    invoke-virtual {p0}, Lr8a;->e()V

    const/4 p3, 0x0

    :goto_4
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-ge p3, v0, :cond_40

    invoke-virtual {p2, p3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Landroidx/recyclerview/widget/RecyclerView;->S(Landroid/view/View;)I

    move-result v1

    if-nez v1, :cond_3d

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result p2

    iget-object p3, p0, Lr8a;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p3}, Landroid/view/View;->getPaddingTop()I

    move-result p3

    sub-int/2addr p2, p3

    iget p3, p0, Lr8a;->d:I

    sub-int/2addr p2, p3

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget-object v0, p0, Lr8a;->e:Landroid/text/StaticLayout;

    invoke-virtual {v0}, Landroid/text/Layout;->getHeight()I

    move-result v0

    sub-int/2addr p3, v0

    div-int/lit8 p3, p3, 0x2

    add-int/2addr p3, p2

    int-to-float p2, p3

    const/4 p3, 0x0

    invoke-virtual {p1, p3, p2}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object p0, p0, Lr8a;->e:Landroid/text/StaticLayout;

    invoke-virtual {p0, p1}, Landroid/text/Layout;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void

    :cond_3d
    add-int/lit8 p3, p3, 0x1

    goto :goto_4

    :cond_40
    return-void
.end method
