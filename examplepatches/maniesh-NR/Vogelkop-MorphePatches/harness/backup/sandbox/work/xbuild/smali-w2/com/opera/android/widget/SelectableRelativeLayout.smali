.class public Lcom/opera/android/widget/SelectableRelativeLayout;
.super Lcom/opera/android/custom_views/LayoutDirectionRelativeLayout;
.source "SourceFile"


# static fields
.field public static final synthetic h:I


# instance fields
.field public final d:Landroid/graphics/Paint;

.field public e:Z

.field public f:I

.field public g:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-virtual {p0, p1, p2}, Lcom/opera/android/custom_views/LayoutDirectionRelativeLayout;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/opera/android/widget/SelectableRelativeLayout;->d:Landroid/graphics/Paint;

    new-instance p1, Lkkf;

    const/16 p2, 0x10

    invoke-direct {p1, p0, p2}, Lkkf;-><init>(Ljava/lang/Object;B)V

    sget-object p2, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object p2

    if-eqz p2, :cond_24

    invoke-static {p2, p0, p1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_24
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const p2, 0x7f0402e3

    const v0, 0x7f06063b

    invoke-static {p2, p1, v0}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    iput p1, p0, Lcom/opera/android/widget/SelectableRelativeLayout;->f:I

    return-void
.end method


# virtual methods
.method public final d(Z)V
    .registers 3

    iget-boolean v0, p0, Lcom/opera/android/widget/SelectableRelativeLayout;->e:Z

    if-eq v0, p1, :cond_f

    iput-boolean p1, p0, Lcom/opera/android/widget/SelectableRelativeLayout;->e:Z

    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    move-result p1

    if-eqz p1, :cond_f

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_f
    return-void
.end method

.method public final onDraw(Landroid/graphics/Canvas;)V
    .registers 9

    iget-boolean v0, p0, Lcom/opera/android/widget/SelectableRelativeLayout;->e:Z

    if-eqz v0, :cond_26

    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    move-result v0

    if-eqz v0, :cond_26

    iget v0, p0, Lcom/opera/android/widget/SelectableRelativeLayout;->g:I

    if-nez v0, :cond_10

    iget v0, p0, Lcom/opera/android/widget/SelectableRelativeLayout;->f:I

    :cond_10
    iget-object v6, p0, Lcom/opera/android/widget/SelectableRelativeLayout;->d:Landroid/graphics/Paint;

    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-float v4, v0

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v5, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    goto :goto_27

    :cond_26
    move-object v1, p1

    :goto_27
    invoke-super {p0, v1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    return-void
.end method
