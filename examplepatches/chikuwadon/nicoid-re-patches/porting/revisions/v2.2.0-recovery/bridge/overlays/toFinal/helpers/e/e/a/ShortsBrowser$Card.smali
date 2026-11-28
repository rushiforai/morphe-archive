.class final Le/e/a/ShortsBrowser$Card;
.super Landroid/widget/FrameLayout;
.source "ShortsBrowser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/ShortsBrowser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Card"
.end annotation


# instance fields
.field final date:Landroid/widget/TextView;

.field final duration:Landroid/widget/TextView;

.field final image:Landroid/widget/ImageView;

.field item:Le/e/a/ModernShorts$Item;

.field final paid:Landroid/widget/FrameLayout;

.field final title:Landroid/widget/TextView;

.field final views:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/app/Activity;Le/e/a/ModernShorts$State;)V
    .registers 13

    .line 342
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 343
    new-instance v0, Landroid/widget/AbsListView$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/AbsListView$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0}, Le/e/a/ShortsBrowser$Card;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 344
    invoke-static {p1}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v0

    const/16 v3, 0xc

    # invokes: Le/e/a/ShortsBrowser;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;
    invoke-static {p1, v0, v3}, Le/e/a/ShortsBrowser;->access$000(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Le/e/a/ShortsBrowser$Card;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 345
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Le/e/a/ShortsBrowser$Card;->setClipToOutline(Z)V

    .line 346
    new-instance v4, Landroid/widget/ImageView;

    invoke-direct {v4, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Le/e/a/ShortsBrowser$Card;->image:Landroid/widget/ImageView;

    .line 347
    iget-object v4, p0, Le/e/a/ShortsBrowser$Card;->image:Landroid/widget/ImageView;

    sget-object v5, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 348
    iget-object v4, p0, Le/e/a/ShortsBrowser$Card;->image:Landroid/widget/ImageView;

    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v5, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v4, v5}, Le/e/a/ShortsBrowser$Card;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 349
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 350
    invoke-virtual {v4, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 351
    const/16 v5, 0xa

    # invokes: Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I
    invoke-static {p1, v5}, Le/e/a/ShortsBrowser;->access$100(Landroid/content/Context;I)I

    move-result v6

    const/16 v7, 0x8

    # invokes: Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I
    invoke-static {p1, v7}, Le/e/a/ShortsBrowser;->access$100(Landroid/content/Context;I)I

    move-result v7

    const/16 v8, 0x21

    # invokes: Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I
    invoke-static {p1, v8}, Le/e/a/ShortsBrowser;->access$100(Landroid/content/Context;I)I

    move-result v8

    const/16 v9, 0x9

    # invokes: Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I
    invoke-static {p1, v9}, Le/e/a/ShortsBrowser;->access$100(Landroid/content/Context;I)I

    move-result v9

    invoke-virtual {v4, v6, v7, v8, v9}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 352
    const/high16 v6, -0x37000000    # -524288.0f

    invoke-virtual {v4, v6}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 353
    # invokes: Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I
    invoke-static {p1, v0}, Le/e/a/ShortsBrowser;->access$100(Landroid/content/Context;I)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {v4, v0}, Landroid/widget/LinearLayout;->setElevation(F)V

    .line 354
    const/16 v0, 0xe

    # invokes: Le/e/a/ShortsBrowser;->text(Landroid/content/Context;II)Landroid/widget/TextView;
    invoke-static {p1, v0, v1}, Le/e/a/ShortsBrowser;->access$200(Landroid/content/Context;II)Landroid/widget/TextView;

    move-result-object v0

    iput-object v0, p0, Le/e/a/ShortsBrowser$Card;->title:Landroid/widget/TextView;

    .line 355
    iget-object v0, p0, Le/e/a/ShortsBrowser$Card;->title:Landroid/widget/TextView;

    const/4 v6, 0x2

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 356
    iget-object v0, p0, Le/e/a/ShortsBrowser$Card;->title:Landroid/widget/TextView;

    sget-object v7, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 357
    iget-object v0, p0, Le/e/a/ShortsBrowser$Card;->title:Landroid/widget/TextView;

    invoke-virtual {v4, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 358
    const v0, -0x212122

    # invokes: Le/e/a/ShortsBrowser;->text(Landroid/content/Context;II)Landroid/widget/TextView;
    invoke-static {p1, v3, v0}, Le/e/a/ShortsBrowser;->access$200(Landroid/content/Context;II)Landroid/widget/TextView;

    move-result-object v7

    iput-object v7, p0, Le/e/a/ShortsBrowser$Card;->views:Landroid/widget/TextView;

    .line 359
    const/16 v7, 0xb

    # invokes: Le/e/a/ShortsBrowser;->text(Landroid/content/Context;II)Landroid/widget/TextView;
    invoke-static {p1, v7, v0}, Le/e/a/ShortsBrowser;->access$200(Landroid/content/Context;II)Landroid/widget/TextView;

    move-result-object v0

    iput-object v0, p0, Le/e/a/ShortsBrowser$Card;->date:Landroid/widget/TextView;

    .line 360
    iget-object v0, p0, Le/e/a/ShortsBrowser$Card;->date:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->setSingleLine()V

    .line 361
    iget-object v0, p0, Le/e/a/ShortsBrowser$Card;->date:Landroid/widget/TextView;

    sget-object v7, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 362
    iget-object v0, p0, Le/e/a/ShortsBrowser$Card;->views:Landroid/widget/TextView;

    invoke-virtual {v4, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 363
    iget-object v0, p0, Le/e/a/ShortsBrowser$Card;->date:Landroid/widget/TextView;

    invoke-virtual {v4, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 364
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v7, 0x50

    invoke-direct {v0, v1, v2, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {p0, v4, v0}, Le/e/a/ShortsBrowser$Card;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 365
    # invokes: Le/e/a/ShortsBrowser;->text(Landroid/content/Context;II)Landroid/widget/TextView;
    invoke-static {p1, v3, v1}, Le/e/a/ShortsBrowser;->access$200(Landroid/content/Context;II)Landroid/widget/TextView;

    move-result-object v0

    iput-object v0, p0, Le/e/a/ShortsBrowser$Card;->duration:Landroid/widget/TextView;

    .line 366
    iget-object v0, p0, Le/e/a/ShortsBrowser$Card;->duration:Landroid/widget/TextView;

    const/4 v3, 0x7

    # invokes: Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I
    invoke-static {p1, v3}, Le/e/a/ShortsBrowser;->access$100(Landroid/content/Context;I)I

    move-result v4

    # invokes: Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I
    invoke-static {p1, v6}, Le/e/a/ShortsBrowser;->access$100(Landroid/content/Context;I)I

    move-result v7

    # invokes: Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I
    invoke-static {p1, v3}, Le/e/a/ShortsBrowser;->access$100(Landroid/content/Context;I)I

    move-result v3

    # invokes: Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I
    invoke-static {p1, v6}, Le/e/a/ShortsBrowser;->access$100(Landroid/content/Context;I)I

    move-result v8

    invoke-virtual {v0, v4, v7, v3, v8}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 367
    iget-object v0, p0, Le/e/a/ShortsBrowser$Card;->duration:Landroid/widget/TextView;

    const v3, -0x33eeeeef    # -3.8028356E7f

    # invokes: Le/e/a/ShortsBrowser;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;
    invoke-static {p1, v3, v5}, Le/e/a/ShortsBrowser;->access$000(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 368
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const v3, 0x800035

    invoke-direct {v0, v2, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 369
    const/4 v2, 0x6

    # invokes: Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I
    invoke-static {p1, v2}, Le/e/a/ShortsBrowser;->access$100(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/widget/FrameLayout$LayoutParams;->setMarginEnd(I)V

    .line 370
    # invokes: Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I
    invoke-static {p1, v2}, Le/e/a/ShortsBrowser;->access$100(Landroid/content/Context;I)I

    move-result v2

    iput v2, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 371
    iget-object v2, p0, Le/e/a/ShortsBrowser$Card;->duration:Landroid/widget/TextView;

    invoke-virtual {p0, v2, v0}, Le/e/a/ShortsBrowser$Card;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 372
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le/e/a/ShortsBrowser$Card;->paid:Landroid/widget/FrameLayout;

    .line 373
    iget-object v0, p0, Le/e/a/ShortsBrowser$Card;->paid:Landroid/widget/FrameLayout;

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0, v2}, Le/e/a/ShortsBrowser$Card;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 374
    const/16 v0, 0x17

    # invokes: Le/e/a/ShortsBrowser;->text(Landroid/content/Context;II)Landroid/widget/TextView;
    invoke-static {p1, v0, v1}, Le/e/a/ShortsBrowser;->access$200(Landroid/content/Context;II)Landroid/widget/TextView;

    move-result-object v0

    .line 375
    const-string v1, "\u22ee"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 376
    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 377
    const-string v1, "Video menu"

    const-string/jumbo v2, "\u5f71\u7247\u9078\u55ae"

    const-string v3, "\u52d5\u753b\u30e1\u30cb\u30e5\u30fc"

    # invokes: Le/e/a/ShortsBrowser;->label(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {p1, v3, v1, v2}, Le/e/a/ShortsBrowser;->access$300(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 378
    # invokes: Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I
    invoke-static {p1, v6}, Le/e/a/ShortsBrowser;->access$100(Landroid/content/Context;I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setElevation(F)V

    .line 379
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v2, 0x26

    # invokes: Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I
    invoke-static {p1, v2}, Le/e/a/ShortsBrowser;->access$100(Landroid/content/Context;I)I

    move-result v2

    const/16 v3, 0x30

    # invokes: Le/e/a/ShortsBrowser;->dp(Landroid/content/Context;I)I
    invoke-static {p1, v3}, Le/e/a/ShortsBrowser;->access$100(Landroid/content/Context;I)I

    move-result v3

    const v4, 0x800055

    invoke-direct {v1, v2, v3, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {p0, v0, v1}, Le/e/a/ShortsBrowser$Card;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 380
    new-instance v1, Le/e/a/ShortsBrowser$Card$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Le/e/a/ShortsBrowser$Card$$ExternalSyntheticLambda0;-><init>(Le/e/a/ShortsBrowser$Card;Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 381
    new-instance v1, Le/e/a/ShortsBrowser$Card$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1}, Le/e/a/ShortsBrowser$Card$$ExternalSyntheticLambda1;-><init>(Le/e/a/ShortsBrowser$Card;Landroid/app/Activity;)V

    invoke-virtual {p0, v1}, Le/e/a/ShortsBrowser$Card;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 382
    new-instance v1, Le/e/a/ShortsBrowser$Card$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, p1, p2}, Le/e/a/ShortsBrowser$Card$$ExternalSyntheticLambda2;-><init>(Le/e/a/ShortsBrowser$Card;Landroid/app/Activity;Le/e/a/ModernShorts$State;)V

    invoke-virtual {p0, v1}, Le/e/a/ShortsBrowser$Card;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 383
    invoke-static {v0}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    .line 384
    invoke-static {p0}, Le/e/a/PressFeedback;->apply(Landroid/view/View;)V

    .line 385
    return-void
.end method


# virtual methods
.method bind(Le/e/a/ModernShorts$Item;)V
    .registers 7

    .line 391
    iput-object p1, p0, Le/e/a/ShortsBrowser$Card;->item:Le/e/a/ModernShorts$Item;

    .line 392
    iget-object v0, p0, Le/e/a/ShortsBrowser$Card;->title:Landroid/widget/TextView;

    iget-object v1, p1, Le/e/a/ModernShorts$Item;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 393
    iget-object v0, p0, Le/e/a/ShortsBrowser$Card;->views:Landroid/widget/TextView;

    # invokes: Le/e/a/ShortsBrowser;->showCounts(Landroid/widget/TextView;Le/e/a/ModernShorts$Item;)V
    invoke-static {v0, p1}, Le/e/a/ShortsBrowser;->access$400(Landroid/widget/TextView;Le/e/a/ModernShorts$Item;)V

    .line 394
    iget-object v0, p0, Le/e/a/ShortsBrowser$Card;->date:Landroid/widget/TextView;

    iget-object v1, p1, Le/e/a/ModernShorts$Item;->posted:Ljava/lang/String;

    const-string v2, ""

    if-nez v1, :cond_0

    move-object v1, v2

    goto :goto_0

    :cond_0
    iget-object v1, p1, Le/e/a/ModernShorts$Item;->posted:Ljava/lang/String;

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 395
    iget-object v0, p0, Le/e/a/ShortsBrowser$Card;->date:Landroid/widget/TextView;

    iget-object v1, p1, Le/e/a/ModernShorts$Item;->posted:Ljava/lang/String;

    const/16 v3, 0x8

    const/4 v4, 0x0

    if-nez v1, :cond_1

    move v1, v3

    goto :goto_1

    :cond_1
    move v1, v4

    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 396
    iget-object v0, p0, Le/e/a/ShortsBrowser$Card;->duration:Landroid/widget/TextView;

    iget v1, p1, Le/e/a/ModernShorts$Item;->duration:I

    if-lez v1, :cond_2

    iget v1, p1, Le/e/a/ModernShorts$Item;->duration:I

    int-to-long v1, v1

    invoke-static {v1, v2}, Landroid/text/format/DateUtils;->formatElapsedTime(J)Ljava/lang/String;

    move-result-object v2

    :cond_2
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 397
    iget-object v0, p0, Le/e/a/ShortsBrowser$Card;->duration:Landroid/widget/TextView;

    iget v1, p1, Le/e/a/ModernShorts$Item;->duration:I

    if-lez v1, :cond_3

    move v3, v4

    :cond_3
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 398
    iget-object v0, p0, Le/e/a/ShortsBrowser$Card;->image:Landroid/widget/ImageView;

    # invokes: Le/e/a/ShortsBrowser;->bindThumbnail(Landroid/widget/ImageView;Le/e/a/ModernShorts$Item;)V
    invoke-static {v0, p1}, Le/e/a/ShortsBrowser;->access$500(Landroid/widget/ImageView;Le/e/a/ModernShorts$Item;)V

    .line 399
    iget-object v0, p0, Le/e/a/ShortsBrowser$Card;->paid:Landroid/widget/FrameLayout;

    iget-boolean p1, p1, Le/e/a/ModernShorts$Item;->paid:Z

    invoke-static {v0, p1}, Le/e/a/PaidVideos;->show(Landroid/view/ViewGroup;Z)V

    .line 400
    return-void
.end method

.method synthetic lambda$new$0$e-e-a-ShortsBrowser$Card(Landroid/app/Activity;Landroid/view/View;)V
    .registers 4

    .line 380
    new-instance p2, Le/e/a/ShortsVideoMenu;

    iget-object v0, p0, Le/e/a/ShortsBrowser$Card;->item:Le/e/a/ModernShorts$Item;

    invoke-direct {p2, p1, v0}, Le/e/a/ShortsVideoMenu;-><init>(Landroid/app/Activity;Le/e/a/ModernShorts$Item;)V

    invoke-virtual {p2, p0}, Le/e/a/ShortsVideoMenu;->onLongClick(Landroid/view/View;)Z

    return-void
.end method

.method synthetic lambda$new$1$e-e-a-ShortsBrowser$Card(Landroid/app/Activity;Landroid/view/View;)Z
    .registers 5

    .line 381
    new-instance v0, Le/e/a/ShortsVideoMenu;

    iget-object v1, p0, Le/e/a/ShortsBrowser$Card;->item:Le/e/a/ModernShorts$Item;

    invoke-direct {v0, p1, v1}, Le/e/a/ShortsVideoMenu;-><init>(Landroid/app/Activity;Le/e/a/ModernShorts$Item;)V

    invoke-virtual {v0, p2}, Le/e/a/ShortsVideoMenu;->onLongClick(Landroid/view/View;)Z

    move-result p1

    return p1
.end method

.method synthetic lambda$new$2$e-e-a-ShortsBrowser$Card(Landroid/app/Activity;Le/e/a/ModernShorts$State;Landroid/view/View;)V
    .registers 5

    .line 382
    iget-object p3, p2, Le/e/a/ModernShorts$State;->feed:Le/e/a/ModernShorts$Feed;

    iget-object p3, p3, Le/e/a/ModernShorts$Feed;->items:Ljava/util/ArrayList;

    iget-object v0, p0, Le/e/a/ShortsBrowser$Card;->item:Le/e/a/ModernShorts$Item;

    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p3

    invoke-static {p1, p2, p3}, Le/e/a/ModernShorts;->launch(Landroid/app/Activity;Le/e/a/ModernShorts$State;I)V

    return-void
.end method

.method protected onMeasure(II)V
    .registers 4

    .line 387
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    .line 388
    int-to-float p2, p2

    const v0, 0x3fe38e39

    mul-float/2addr p2, v0

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    const/high16 v0, 0x40000000    # 2.0f

    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 389
    return-void
.end method
