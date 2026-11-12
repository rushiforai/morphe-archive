.class public Lorg/chromium/components/embedder_support/delegate/HtmlColorPickerAdvanced;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# instance fields
.field public final a:Lua7;

.field public final b:Lua7;

.field public final c:Lua7;

.field public d:Lvma;

.field public e:I

.field public final f:[F


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 10

    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x3

    new-array p2, p1, [F

    iput-object p2, p0, Lorg/chromium/components/embedder_support/delegate/HtmlColorPickerAdvanced;->f:[F

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const v1, 0x7f14047c

    const/16 v2, 0x168

    invoke-virtual {p0, v1, v2, p0}, Lorg/chromium/components/embedder_support/delegate/HtmlColorPickerAdvanced;->a(IILorg/chromium/components/embedder_support/delegate/HtmlColorPickerAdvanced;)Lua7;

    move-result-object v1

    iput-object v1, p0, Lorg/chromium/components/embedder_support/delegate/HtmlColorPickerAdvanced;->a:Lua7;

    const v1, 0x7f14047e

    const/16 v2, 0x64

    invoke-virtual {p0, v1, v2, p0}, Lorg/chromium/components/embedder_support/delegate/HtmlColorPickerAdvanced;->a(IILorg/chromium/components/embedder_support/delegate/HtmlColorPickerAdvanced;)Lua7;

    move-result-object v1

    iput-object v1, p0, Lorg/chromium/components/embedder_support/delegate/HtmlColorPickerAdvanced;->b:Lua7;

    const v1, 0x7f14047f

    invoke-virtual {p0, v1, v2, p0}, Lorg/chromium/components/embedder_support/delegate/HtmlColorPickerAdvanced;->a(IILorg/chromium/components/embedder_support/delegate/HtmlColorPickerAdvanced;)Lua7;

    move-result-object v1

    iput-object v1, p0, Lorg/chromium/components/embedder_support/delegate/HtmlColorPickerAdvanced;->c:Lua7;

    aget v1, p2, v0

    const/high16 v3, 0x42c80000    # 100.0f

    mul-float/2addr v1, v3

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    const/4 v4, 0x0

    invoke-static {v1, v4}, Ljava/lang/Math;->max(II)I

    move-result v1

    const/4 v5, 0x2

    aget v6, p2, v5

    mul-float/2addr v6, v3

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v3

    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-static {v2, v4}, Ljava/lang/Math;->max(II)I

    move-result v2

    iget-object v3, p0, Lorg/chromium/components/embedder_support/delegate/HtmlColorPickerAdvanced;->a:Lua7;

    aget p2, p2, v4

    iget-object v3, v3, Lua7;->c:Ljava/lang/Object;

    check-cast v3, Landroid/widget/SeekBar;

    float-to-int p2, p2

    invoke-virtual {v3, p2}, Landroid/widget/ProgressBar;->setProgress(I)V

    iget-object p2, p0, Lorg/chromium/components/embedder_support/delegate/HtmlColorPickerAdvanced;->b:Lua7;

    int-to-float v1, v1

    iget-object p2, p2, Lua7;->c:Ljava/lang/Object;

    check-cast p2, Landroid/widget/SeekBar;

    float-to-int v1, v1

    invoke-virtual {p2, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    iget-object p2, p0, Lorg/chromium/components/embedder_support/delegate/HtmlColorPickerAdvanced;->c:Lua7;

    int-to-float v1, v2

    iget-object p2, p2, Lua7;->c:Ljava/lang/Object;

    check-cast p2, Landroid/widget/SeekBar;

    float-to-int v1, v1

    invoke-virtual {p2, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    new-array p1, p1, [F

    const/high16 p2, 0x3f800000    # 1.0f

    aput p2, p1, v0

    aput p2, p1, v5

    const/4 p2, 0x7

    new-array v0, p2, [I

    move v1, v4

    :goto_7b
    if-ge v1, p2, :cond_8c

    int-to-float v2, v1

    const/high16 v3, 0x42700000    # 60.0f

    mul-float/2addr v2, v3

    aput v2, p1, v4

    invoke-static {p1}, Landroid/graphics/Color;->HSVToColor([F)I

    move-result v2

    aput v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_7b

    :cond_8c
    iget-object p1, p0, Lorg/chromium/components/embedder_support/delegate/HtmlColorPickerAdvanced;->a:Lua7;

    invoke-virtual {p1, v0}, Lua7;->Q([I)V

    invoke-virtual {p0}, Lorg/chromium/components/embedder_support/delegate/HtmlColorPickerAdvanced;->b()V

    invoke-virtual {p0}, Lorg/chromium/components/embedder_support/delegate/HtmlColorPickerAdvanced;->c()V

    return-void
.end method


# virtual methods
.method public final a(IILorg/chromium/components/embedder_support/delegate/HtmlColorPickerAdvanced;)Lua7;
    .registers 7

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "layout_inflater"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    const v1, 0x7f0d00ca

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    new-instance p0, Lua7;

    invoke-direct {p0, v0, p1, p2, p3}, Lua7;-><init>(Landroid/view/View;IILorg/chromium/components/embedder_support/delegate/HtmlColorPickerAdvanced;)V

    return-object p0
.end method

.method public final b()V
    .registers 5

    const/4 v0, 0x3

    new-array v0, v0, [F

    iget-object v1, p0, Lorg/chromium/components/embedder_support/delegate/HtmlColorPickerAdvanced;->f:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    aput v1, v0, v2

    const/4 v1, 0x0

    const/4 v2, 0x1

    aput v1, v0, v2

    const/4 v1, 0x2

    const/high16 v3, 0x3f800000    # 1.0f

    aput v3, v0, v1

    invoke-static {v0}, Landroid/graphics/Color;->HSVToColor([F)I

    move-result v1

    aput v3, v0, v2

    invoke-static {v0}, Landroid/graphics/Color;->HSVToColor([F)I

    move-result v0

    filled-new-array {v1, v0}, [I

    move-result-object v0

    iget-object p0, p0, Lorg/chromium/components/embedder_support/delegate/HtmlColorPickerAdvanced;->b:Lua7;

    invoke-virtual {p0, v0}, Lua7;->Q([I)V

    return-void
.end method

.method public final c()V
    .registers 5

    const/4 v0, 0x3

    new-array v0, v0, [F

    iget-object v1, p0, Lorg/chromium/components/embedder_support/delegate/HtmlColorPickerAdvanced;->f:[F

    const/4 v2, 0x0

    aget v3, v1, v2

    aput v3, v0, v2

    const/4 v2, 0x1

    aget v1, v1, v2

    aput v1, v0, v2

    const/4 v1, 0x0

    const/4 v2, 0x2

    aput v1, v0, v2

    invoke-static {v0}, Landroid/graphics/Color;->HSVToColor([F)I

    move-result v1

    const/high16 v3, 0x3f800000    # 1.0f

    aput v3, v0, v2

    invoke-static {v0}, Landroid/graphics/Color;->HSVToColor([F)I

    move-result v0

    filled-new-array {v1, v0}, [I

    move-result-object v0

    iget-object p0, p0, Lorg/chromium/components/embedder_support/delegate/HtmlColorPickerAdvanced;->c:Lua7;

    invoke-virtual {p0, v0}, Lua7;->Q([I)V

    return-void
.end method

.method public final onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .registers 5

    if-eqz p3, :cond_4d

    iget-object p1, p0, Lorg/chromium/components/embedder_support/delegate/HtmlColorPickerAdvanced;->a:Lua7;

    iget-object p1, p1, Lua7;->c:Ljava/lang/Object;

    check-cast p1, Landroid/widget/SeekBar;

    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getProgress()I

    move-result p1

    int-to-float p1, p1

    iget-object p2, p0, Lorg/chromium/components/embedder_support/delegate/HtmlColorPickerAdvanced;->f:[F

    const/4 p3, 0x0

    aput p1, p2, p3

    iget-object p1, p0, Lorg/chromium/components/embedder_support/delegate/HtmlColorPickerAdvanced;->b:Lua7;

    iget-object p1, p1, Lua7;->c:Ljava/lang/Object;

    check-cast p1, Landroid/widget/SeekBar;

    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getProgress()I

    move-result p1

    int-to-float p1, p1

    const/high16 p3, 0x42c80000    # 100.0f

    div-float/2addr p1, p3

    const/4 v0, 0x1

    aput p1, p2, v0

    iget-object p1, p0, Lorg/chromium/components/embedder_support/delegate/HtmlColorPickerAdvanced;->c:Lua7;

    iget-object p1, p1, Lua7;->c:Ljava/lang/Object;

    check-cast p1, Landroid/widget/SeekBar;

    invoke-virtual {p1}, Landroid/widget/ProgressBar;->getProgress()I

    move-result p1

    int-to-float p1, p1

    div-float/2addr p1, p3

    const/4 p3, 0x2

    aput p1, p2, p3

    invoke-static {p2}, Landroid/graphics/Color;->HSVToColor([F)I

    move-result p1

    iput p1, p0, Lorg/chromium/components/embedder_support/delegate/HtmlColorPickerAdvanced;->e:I

    invoke-virtual {p0}, Lorg/chromium/components/embedder_support/delegate/HtmlColorPickerAdvanced;->b()V

    invoke-virtual {p0}, Lorg/chromium/components/embedder_support/delegate/HtmlColorPickerAdvanced;->c()V

    iget-object p1, p0, Lorg/chromium/components/embedder_support/delegate/HtmlColorPickerAdvanced;->d:Lvma;

    if-eqz p1, :cond_4d

    iget p0, p0, Lorg/chromium/components/embedder_support/delegate/HtmlColorPickerAdvanced;->e:I

    iget-object p1, p1, Lvma;->a:Lorg/chromium/base/Callback;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-interface {p1, p0}, Lorg/chromium/base/Callback;->onResult(Ljava/lang/Object;)V

    :cond_4d
    return-void
.end method

.method public final onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2

    return-void
.end method

.method public final onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2

    return-void
.end method
