.class public Ly46;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5

    .line 228
    const/4 v0, 0x2

    iput-byte v0, p0, Ly46;->a:B

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lhcb;Lhcb;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Ly46;->a:B

    .line 229
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 230
    iput-object p2, p0, Ly46;->b:Ljava/lang/Object;

    .line 231
    iput-object p3, p0, Ly46;->c:Ljava/lang/Object;

    .line 232
    invoke-virtual {p0, v0}, Landroid/view/View;->setClickable(Z)V

    .line 233
    invoke-virtual {p0, v0}, Landroid/view/View;->setFocusable(Z)V

    return-void
.end method

.method public constructor <init>(Lcom/google/android/libraries/ads/mobile/sdk/common/AdActivity;Ljava/lang/String;Lads_mobile_sdk/yu;)V
    .registers 13

    const/4 v0, 0x3

    iput-byte v0, p0, Ly46;->a:B

    iget v0, p3, Lads_mobile_sdk/yu;->a:I

    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance v1, Landroid/widget/ImageButton;

    invoke-direct {v1, p1}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Ly46;->c:Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/4 v2, 0x0

    :try_start_14
    const-string v3, "white"

    invoke-static {p2, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_24

    const p2, 0x7f0801c0

    invoke-virtual {v1, p2, v2}, Landroid/content/res/Resources;->getDrawable(ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    goto :goto_33

    :cond_24
    const-string v3, "black"

    invoke-static {p2, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_34

    const p2, 0x7f0801bf

    invoke-virtual {v1, p2, v2}, Landroid/content/res/Resources;->getDrawable(ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object p2
    :try_end_33
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_14 .. :try_end_33} :catch_34

    :goto_33
    move-object v2, p2

    :catch_34
    :cond_34
    iget-object p2, p0, Ly46;->c:Ljava/lang/Object;

    check-cast p2, Landroid/widget/ImageButton;

    if-nez v2, :cond_41

    const v1, 0x1080017

    invoke-virtual {p2, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_4d

    :cond_41
    invoke-virtual {p2, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object p2, p0, Ly46;->c:Ljava/lang/Object;

    check-cast p2, Landroid/widget/ImageButton;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p2, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    :goto_4d
    iget-object p2, p0, Ly46;->c:Ljava/lang/Object;

    check-cast p2, Landroid/widget/ImageButton;

    const/4 v1, 0x0

    invoke-virtual {p2, v1}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object p2, p0, Ly46;->c:Ljava/lang/Object;

    check-cast p2, Landroid/widget/ImageButton;

    iget v2, p3, Lads_mobile_sdk/yu;->c:I

    iget p3, p3, Lads_mobile_sdk/yu;->b:I

    int-to-float v3, v0

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    const/4 v5, 0x1

    invoke-static {v5, v3, v4}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v3

    float-to-int v3, v3

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v4

    const/4 v6, 0x0

    invoke-static {v5, v6, v4}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v4

    float-to-int v4, v4

    int-to-float v6, p3

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v7

    invoke-static {v5, v6, v7}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v6

    float-to-int v6, v6

    int-to-float v7, v2

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v8

    invoke-static {v5, v7, v8}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v7

    float-to-int v7, v7

    invoke-virtual {p2, v3, v4, v6, v7}, Landroid/view/View;->setPadding(IIII)V

    iget-object p2, p0, Ly46;->c:Ljava/lang/Object;

    check-cast p2, Landroid/widget/ImageButton;

    const-string v3, "Fullscreen ad close button"

    invoke-virtual {p2, v3}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance p2, Lmlp;

    invoke-direct {p2, p0, v1}, Lmlp;-><init>(Ly46;B)V

    invoke-virtual {p0, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p2, p0, Ly46;->c:Ljava/lang/Object;

    check-cast p2, Landroid/widget/ImageButton;

    new-instance v1, Lmlp;

    invoke-direct {v1, p0, v5}, Lmlp;-><init>(Ly46;B)V

    invoke-virtual {p2, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p2, p0, Ly46;->c:Ljava/lang/Object;

    check-cast p2, Landroid/widget/ImageButton;

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    add-int/lit8 v0, v0, 0x32

    add-int/2addr v0, p3

    int-to-float p3, v0

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    invoke-static {v5, p3, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p3

    float-to-int p3, p3

    add-int/lit8 v2, v2, 0x32

    int-to-float v0, v2

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    invoke-static {v5, v0, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    float-to-int p1, p1

    invoke-direct {v1, p3, p1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, p2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public constructor <init>(Lz46;Landroid/content/Context;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Ly46;->a:B

    .line 234
    iput-object p1, p0, Ly46;->c:Ljava/lang/Object;

    .line 235
    invoke-direct {p0, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 236
    new-instance p2, Ltni;

    invoke-direct {p2}, Ltni;-><init>()V

    iput-object p2, p0, Ly46;->b:Ljava/lang/Object;

    .line 237
    invoke-virtual {p2, p1}, Ltni;->a(Lsni;)V

    const/4 p1, 0x4

    .line 238
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method


# virtual methods
.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 7

    iget-byte v0, p0, Ly46;->a:B

    packed-switch v0, :pswitch_data_60

    invoke-super {p0, p1}, Landroid/view/View;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    return-void

    :pswitch_9
    invoke-super {p0, p1}, Landroid/view/View;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object v0, p0, Ly46;->b:Ljava/lang/Object;

    check-cast v0, Ltni;

    invoke-virtual {v0, p1}, Ltni;->b(Landroid/content/res/Configuration;)V

    iget-object p0, p0, Ly46;->c:Ljava/lang/Object;

    check-cast p0, Lz46;

    const p1, 0x7f0a02d2

    invoke-virtual {p0, p1}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/view/ViewGroup;

    if-eqz p0, :cond_5e

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0700a5

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    sget-object v0, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {p0}, Li5n;->a(Landroid/view/View;)Lg3o;

    move-result-object v0

    if-eqz v0, :cond_44

    const/16 v1, 0x287

    iget-object v0, v0, Lg3o;->a:Ld3o;

    invoke-virtual {v0, v1}, Ld3o;->i(I)Lr9b;

    move-result-object v0

    iget v1, v0, Lr9b;->a:I

    iget v2, v0, Lr9b;->c:I

    iget v0, v0, Lr9b;->d:I

    goto :goto_47

    :cond_44
    const/4 v1, 0x0

    move v0, v1

    move v2, v0

    :goto_47
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    instance-of v4, v3, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v4, :cond_5b

    move-object v4, v3

    check-cast v4, Landroid/view/ViewGroup$MarginLayoutParams;

    add-int/2addr v1, p1

    iput v1, v4, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr p1, v2

    iput p1, v4, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    invoke-virtual {p0, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_5b
    invoke-static {v0, p0}, Lp37;->p0(ILandroid/view/View;)V

    :cond_5e
    return-void

    nop

    :pswitch_data_60
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method

.method public final onMeasure(II)V
    .registers 5

    iget-byte v0, p0, Ly46;->a:B

    packed-switch v0, :pswitch_data_34

    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    return-void

    :pswitch_9
    iget-object v0, p0, Ly46;->b:Ljava/lang/Object;

    check-cast v0, Lhcb;

    const/high16 v1, 0x40000000    # 2.0f

    if-eqz v0, :cond_1d

    invoke-interface {v0}, Lhcb;->getAsInt()I

    move-result v0

    invoke-static {v0, p1}, Landroid/view/View;->getDefaultSize(II)I

    move-result p1

    invoke-static {p1, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    :cond_1d
    iget-object v0, p0, Ly46;->c:Ljava/lang/Object;

    check-cast v0, Lhcb;

    if-eqz v0, :cond_2f

    invoke-interface {v0}, Lhcb;->getAsInt()I

    move-result v0

    invoke-static {v0, p2}, Landroid/view/View;->getDefaultSize(II)I

    move-result p2

    invoke-static {p2, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    :cond_2f
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    return-void

    nop

    :pswitch_data_34
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method

.method public final onWindowFocusChanged(Z)V
    .registers 3

    iget-byte v0, p0, Ly46;->a:B

    packed-switch v0, :pswitch_data_1e

    invoke-super {p0, p1}, Landroid/view/View;->onWindowFocusChanged(Z)V

    return-void

    :pswitch_9
    invoke-super {p0, p1}, Landroid/view/View;->onWindowFocusChanged(Z)V

    if-eqz p1, :cond_1d

    iget-object p1, p0, Ly46;->b:Ljava/lang/Object;

    check-cast p1, Ltni;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    invoke-virtual {p1, p0}, Ltni;->b(Landroid/content/res/Configuration;)V

    :cond_1d
    return-void

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method
