.class final Le/e/a/ShortsBrowser$OrderRow;
.super Landroid/widget/LinearLayout;
.source "ShortsBrowser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/ShortsBrowser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "OrderRow"
.end annotation


# instance fields
.field final date:Landroid/widget/TextView;

.field final image:Landroid/widget/ImageView;

.field item:Le/e/a/ModernShorts$Item;

.field final title:Landroid/widget/TextView;

.field final views:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 9

    .line 422
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 423
    new-instance v0, Landroid/widget/AbsListView$LayoutParams;

    const/16 v1, 0x52

    # invokes: Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I
    invoke-static {p1, v1}, Le/e/a/ShortsBrowser;->access$100(Landroid/content/Context;I)I

    move-result v1

    const/4 v2, -0x1

    invoke-direct {v0, v2, v1}, Landroid/widget/AbsListView$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0}, Le/e/a/ShortsBrowser$OrderRow;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 424
    const/16 v0, 0xa

    # invokes: Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I
    invoke-static {p1, v0}, Le/e/a/ShortsBrowser;->access$100(Landroid/content/Context;I)I

    move-result v1

    const/16 v3, 0x8

    # invokes: Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I
    invoke-static {p1, v3}, Le/e/a/ShortsBrowser;->access$100(Landroid/content/Context;I)I

    move-result v3

    const/4 v4, 0x0

    invoke-virtual {p0, v1, v4, v3, v4}, Le/e/a/ShortsBrowser$OrderRow;->setPadding(IIII)V

    .line 425
    const/16 v1, 0x10

    invoke-virtual {p0, v1}, Le/e/a/ShortsBrowser$OrderRow;->setGravity(I)V

    .line 426
    new-instance v1, Landroid/widget/ImageView;

    invoke-direct {v1, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Le/e/a/ShortsBrowser$OrderRow;->image:Landroid/widget/ImageView;

    .line 427
    iget-object v1, p0, Le/e/a/ShortsBrowser$OrderRow;->image:Landroid/widget/ImageView;

    sget-object v3, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 428
    iget-object v1, p0, Le/e/a/ShortsBrowser$OrderRow;->image:Landroid/widget/ImageView;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v5, 0x2c

    # invokes: Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I
    invoke-static {p1, v5}, Le/e/a/ShortsBrowser;->access$100(Landroid/content/Context;I)I

    move-result v5

    const/16 v6, 0x3a

    # invokes: Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I
    invoke-static {p1, v6}, Le/e/a/ShortsBrowser;->access$100(Landroid/content/Context;I)I

    move-result v6

    invoke-direct {v3, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v1, v3}, Le/e/a/ShortsBrowser$OrderRow;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 429
    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 430
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 431
    # invokes: Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I
    invoke-static {p1, v0}, Le/e/a/ShortsBrowser;->access$100(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {v1, v0, v4, v4, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 432
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 433
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v5

    const v6, 0x1010036

    invoke-virtual {v5, v6, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 434
    iget v3, v0, Landroid/util/TypedValue;->resourceId:I

    if-nez v3, :cond_0

    iget v0, v0, Landroid/util/TypedValue;->data:I

    goto :goto_0

    :cond_0
    iget v0, v0, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    .line 435
    :goto_0
    const/16 v3, 0xe

    # invokes: Le/e/a/ShortsBrowser;->text(Landroid/content/Context;II)Landroid/widget/TextView;
    invoke-static {p1, v3, v0}, Le/e/a/ShortsBrowser;->access$200(Landroid/content/Context;II)Landroid/widget/TextView;

    move-result-object v3

    iput-object v3, p0, Le/e/a/ShortsBrowser$OrderRow;->title:Landroid/widget/TextView;

    .line 436
    iget-object v3, p0, Le/e/a/ShortsBrowser$OrderRow;->title:Landroid/widget/TextView;

    const/4 v5, 0x2

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 437
    iget-object v3, p0, Le/e/a/ShortsBrowser$OrderRow;->title:Landroid/widget/TextView;

    sget-object v5, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 438
    const/16 v3, 0xc

    # invokes: Le/e/a/ShortsBrowser;->text(Landroid/content/Context;II)Landroid/widget/TextView;
    invoke-static {p1, v3, v0}, Le/e/a/ShortsBrowser;->access$200(Landroid/content/Context;II)Landroid/widget/TextView;

    move-result-object v3

    iput-object v3, p0, Le/e/a/ShortsBrowser$OrderRow;->views:Landroid/widget/TextView;

    .line 439
    const/16 v3, 0xb

    # invokes: Le/e/a/ShortsBrowser;->text(Landroid/content/Context;II)Landroid/widget/TextView;
    invoke-static {p1, v3, v0}, Le/e/a/ShortsBrowser;->access$200(Landroid/content/Context;II)Landroid/widget/TextView;

    move-result-object v3

    iput-object v3, p0, Le/e/a/ShortsBrowser$OrderRow;->date:Landroid/widget/TextView;

    .line 440
    iget-object v3, p0, Le/e/a/ShortsBrowser$OrderRow;->title:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 441
    iget-object v3, p0, Le/e/a/ShortsBrowser$OrderRow;->views:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 442
    iget-object v3, p0, Le/e/a/ShortsBrowser$OrderRow;->date:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 443
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x2

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-direct {v3, v4, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {p0, v1, v3}, Le/e/a/ShortsBrowser$OrderRow;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 444
    const/16 v1, 0x16

    # invokes: Le/e/a/ShortsBrowser;->text(Landroid/content/Context;II)Landroid/widget/TextView;
    invoke-static {p1, v1, v0}, Le/e/a/ShortsBrowser;->access$200(Landroid/content/Context;II)Landroid/widget/TextView;

    move-result-object v0

    .line 445
    const-string v1, "\u2261"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {v0}, Le/e/a/ReorderMotion98;->grip(Landroid/widget/TextView;)V

    .line 446
    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 447
    const-string v1, "Reorder"

    const-string/jumbo v3, "\u91cd\u65b0\u6392\u5e8f"

    const-string v4, "\u4e26\u3079\u66ff\u3048"

    # invokes: Le/e/a/ShortsBrowser;->label(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {p1, v4, v1, v3}, Le/e/a/ShortsBrowser;->access$300(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 448
    new-instance v1, Le/e/a/ShortsBrowser$OrderRow$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Le/e/a/ShortsBrowser$OrderRow$$ExternalSyntheticLambda0;-><init>(Le/e/a/ShortsBrowser$OrderRow;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 450
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v3, 0x30

    # invokes: Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I
    invoke-static {p1, v3}, Le/e/a/ShortsBrowser;->access$100(Landroid/content/Context;I)I

    move-result p1

    invoke-direct {v1, p1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0, v1}, Le/e/a/ShortsBrowser$OrderRow;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 451
    return-void
.end method


# virtual methods
.method bind(Le/e/a/ModernShorts$Item;)V
    .registers 4

    .line 453
    iput-object p1, p0, Le/e/a/ShortsBrowser$OrderRow;->item:Le/e/a/ModernShorts$Item;

    .line 454
    iget-object v0, p0, Le/e/a/ShortsBrowser$OrderRow;->title:Landroid/widget/TextView;

    iget-object v1, p1, Le/e/a/ModernShorts$Item;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 455
    iget-object v0, p0, Le/e/a/ShortsBrowser$OrderRow;->views:Landroid/widget/TextView;

    # invokes: Le/e/a/ShortsBrowser;->showCounts(Landroid/widget/TextView;Le/e/a/ModernShorts$Item;)V
    invoke-static {v0, p1}, Le/e/a/ShortsBrowser;->access$400(Landroid/widget/TextView;Le/e/a/ModernShorts$Item;)V

    .line 456
    iget-object v0, p0, Le/e/a/ShortsBrowser$OrderRow;->date:Landroid/widget/TextView;

    iget-object v1, p1, Le/e/a/ModernShorts$Item;->posted:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 457
    iget-object v0, p0, Le/e/a/ShortsBrowser$OrderRow;->date:Landroid/widget/TextView;

    iget-object v1, p1, Le/e/a/ModernShorts$Item;->posted:Ljava/lang/String;

    if-nez v1, :cond_0

    const/16 v1, 0x8

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 458
    iget-object v0, p0, Le/e/a/ShortsBrowser$OrderRow;->image:Landroid/widget/ImageView;

    # invokes: Le/e/a/ShortsBrowser;->bindThumbnail(Landroid/widget/ImageView;Le/e/a/ModernShorts$Item;)V
    invoke-static {v0, p1}, Le/e/a/ShortsBrowser;->access$500(Landroid/widget/ImageView;Le/e/a/ModernShorts$Item;)V

    .line 459
    return-void
.end method

.method synthetic lambda$new$0$e-e-a-ShortsBrowser$OrderRow(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 6

    .line 448
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p2

    const/4 v0, 0x0

    if-nez p2, :cond_0

    .line 449
    const-string p2, ""

    invoke-static {p2, p2}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object p2

    invoke-static {p0}, Le/e/a/ReorderMotion98;->shadow(Landroid/view/View;)Landroid/view/View$DragShadowBuilder;

    move-result-object v1

    iget-object v2, p0, Le/e/a/ShortsBrowser$OrderRow;->item:Le/e/a/ModernShorts$Item;

    invoke-virtual {p1, p2, v1, v2, v0}, Landroid/view/View;->startDragAndDrop(Landroid/content/ClipData;Landroid/view/View$DragShadowBuilder;Ljava/lang/Object;I)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    nop

    .line 448
    :goto_0
    return v0
.end method
