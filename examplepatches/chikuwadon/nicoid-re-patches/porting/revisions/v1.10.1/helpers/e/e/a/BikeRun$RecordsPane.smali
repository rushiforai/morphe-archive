.class final Le/e/a/BikeRun$RecordsPane;
.super Landroid/widget/LinearLayout;
.source "BikeRun.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/BikeRun;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "RecordsPane"
.end annotation


# instance fields
.field final labels:[Landroid/widget/TextView;

.field final lines:[Landroid/view/View;

.field final rows:Landroid/widget/LinearLayout;

.field final scroll:Le/e/a/BikeRun$SwipeScroll;

.field final subtitle:Landroid/widget/TextView;

.field final track:Le/e/a/BikeRun$Track;


# direct methods
.method constructor <init>(Le/e/a/BikeRun$Track;)V
    .registers 16

    .line 137
    invoke-virtual {p1}, Le/e/a/BikeRun$Track;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x3

    .line 131
    new-array v1, v0, [Landroid/widget/TextView;

    iput-object v1, p0, Le/e/a/BikeRun$RecordsPane;->labels:[Landroid/widget/TextView;

    .line 132
    new-array v1, v0, [Landroid/view/View;

    iput-object v1, p0, Le/e/a/BikeRun$RecordsPane;->lines:[Landroid/view/View;

    .line 137
    iput-object p1, p0, Le/e/a/BikeRun$RecordsPane;->track:Le/e/a/BikeRun$Track;

    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Le/e/a/BikeRun$RecordsPane;->setOrientation(I)V

    iget v2, p1, Le/e/a/BikeRun$Track;->background:I

    invoke-virtual {p0, v2}, Le/e/a/BikeRun$RecordsPane;->setBackgroundColor(I)V

    const/high16 v2, 0x41800000    # 16.0f

    .line 138
    invoke-virtual {p0, v2}, Le/e/a/BikeRun$RecordsPane;->dp(F)I

    move-result v2

    .line 139
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Le/e/a/BikeRun$RecordsPane;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 140
    const-string v4, "Recent 30"

    const-string v5, "\u6700\u8fd130\u6b21"

    const-string v6, "\u6700\u8fd130\u56de"

    invoke-virtual {p1, v6, v4, v5}, Le/e/a/BikeRun$Track;->text(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "Top 10"

    const-string v6, "\u6700\u4f7310\u6b21"

    const-string v7, "\u30d9\u30b9\u30c810"

    invoke-virtual {p1, v7, v5, v6}, Le/e/a/BikeRun$Track;->text(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "By version"

    const-string v7, "\u5404\u7248\u672c"

    const-string v8, "\u30d0\u30fc\u30b8\u30e7\u30f3\u5225"

    invoke-virtual {p1, v8, v6, v7}, Le/e/a/BikeRun$Track;->text(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    filled-new-array {v4, v5, v6}, [Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_4e
    const/4 v7, -0x1

    if-lt v6, v0, :cond_fc

    .line 153
    invoke-virtual {p0, v3}, Le/e/a/BikeRun$RecordsPane;->addView(Landroid/view/View;)V

    .line 154
    new-instance v0, Le/e/a/BikeRun$SwipeScroll;

    invoke-virtual {p0}, Le/e/a/BikeRun$RecordsPane;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v0, v3, p0}, Le/e/a/BikeRun$SwipeScroll;-><init>(Landroid/content/Context;Le/e/a/BikeRun$RecordsPane;)V

    iput-object v0, p0, Le/e/a/BikeRun$RecordsPane;->scroll:Le/e/a/BikeRun$SwipeScroll;

    invoke-virtual {v0, v1}, Le/e/a/BikeRun$SwipeScroll;->setFillViewport(Z)V

    .line 155
    new-instance v3, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Le/e/a/BikeRun$RecordsPane;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-virtual {v3, v2, v2, v2, v2}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 156
    new-instance v2, Landroid/widget/TextView;

    invoke-virtual {p0}, Le/e/a/BikeRun$RecordsPane;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Le/e/a/BikeRun$RecordsPane;->subtitle:Landroid/widget/TextView;

    const/high16 v4, 0x41400000    # 12.0f

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextSize(F)V

    iget v4, p1, Le/e/a/BikeRun$Track;->foreground:I

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 157
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v6, "Ranked within the same version"

    const-string v8, "\u6309\u540c\u4e00\u7248\u672c\u6392\u540d"

    const-string v9, "\u540c\u3058\u30d0\u30fc\u30b8\u30e7\u30f3\u5185\u3067\u96c6\u8a08"

    invoke-virtual {p1, v9, v6, v8}, Le/e/a/BikeRun$Track;->text(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, " \u00b7 v1.3.1"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 158
    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 159
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Le/e/a/BikeRun$RecordsPane;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Le/e/a/BikeRun$RecordsPane;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v1, 0x41000000    # 8.0f

    invoke-virtual {p0, v1}, Le/e/a/BikeRun$RecordsPane;->dp(F)I

    move-result v4

    invoke-virtual {p0, v1}, Le/e/a/BikeRun$RecordsPane;->dp(F)I

    move-result v1

    invoke-virtual {v2, v5, v4, v5, v1}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 160
    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v0, v3}, Le/e/a/BikeRun$SwipeScroll;->addView(Landroid/view/View;)V

    .line 161
    invoke-virtual {p0}, Le/e/a/BikeRun$RecordsPane;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v1, v1

    invoke-virtual {p0}, Le/e/a/BikeRun$RecordsPane;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v1, v2

    const v2, 0x3ee66666    # 0.45f

    mul-float v1, v1, v2

    const/high16 v2, 0x43b40000    # 360.0f

    invoke-static {v2, v1}, Ljava/lang/Math;->min(FF)F

    move-result v1

    invoke-virtual {p0, v1}, Le/e/a/BikeRun$RecordsPane;->dp(F)I

    move-result v1

    .line 162
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v7, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0, v2}, Le/e/a/BikeRun$RecordsPane;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 163
    iget p1, p1, Le/e/a/BikeRun$Track;->recordsPage:I

    invoke-virtual {p0, p1}, Le/e/a/BikeRun$RecordsPane;->select(I)V

    return-void

    .line 143
    :cond_fc
    new-instance v8, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Le/e/a/BikeRun$RecordsPane;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-direct {v8, v9}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v8, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 144
    new-instance v9, Landroid/widget/TextView;

    invoke-virtual {p0}, Le/e/a/BikeRun$RecordsPane;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-direct {v9, v10}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    aget-object v10, v4, v6

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v10, 0x41500000    # 13.0f

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setTextSize(F)V

    const/16 v10, 0x11

    .line 145
    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setGravity(I)V

    invoke-virtual {v9, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    const/high16 v10, 0x40000000    # 2.0f

    invoke-virtual {p0, v10}, Le/e/a/BikeRun$RecordsPane;->dp(F)I

    move-result v11

    invoke-virtual {p0, v10}, Le/e/a/BikeRun$RecordsPane;->dp(F)I

    move-result v12

    invoke-virtual {v9, v11, v5, v12, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 146
    iget-object v11, p0, Le/e/a/BikeRun$RecordsPane;->labels:[Landroid/widget/TextView;

    aput-object v9, v11, v6

    iget-object v11, p0, Le/e/a/BikeRun$RecordsPane;->lines:[Landroid/view/View;

    new-instance v12, Landroid/view/View;

    invoke-virtual {p0}, Le/e/a/BikeRun$RecordsPane;->getContext()Landroid/content/Context;

    move-result-object v13

    invoke-direct {v12, v13}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    aput-object v12, v11, v6

    .line 147
    new-instance v11, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v12, 0x42380000    # 46.0f

    invoke-virtual {p0, v12}, Le/e/a/BikeRun$RecordsPane;->dp(F)I

    move-result v12

    invoke-direct {v11, v7, v12}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v9, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 148
    iget-object v11, p0, Le/e/a/BikeRun$RecordsPane;->lines:[Landroid/view/View;

    aget-object v11, v11, v6

    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0, v10}, Le/e/a/BikeRun$RecordsPane;->dp(F)I

    move-result v10

    invoke-direct {v12, v7, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v8, v11, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 149
    invoke-virtual {v9, v1}, Landroid/widget/TextView;->setFocusable(Z)V

    new-instance v7, Le/e/a/BikeRun$RecordsPane$$ExternalSyntheticLambda1;

    invoke-direct {v7, p0, v6}, Le/e/a/BikeRun$RecordsPane$$ExternalSyntheticLambda1;-><init>(Le/e/a/BikeRun$RecordsPane;I)V

    invoke-virtual {v9, v7}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 150
    aget-object v7, v4, v6

    invoke-virtual {v9, v7}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 151
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v9, -0x2

    const/high16 v10, 0x3f800000    # 1.0f

    invoke-direct {v7, v5, v9, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v3, v8, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_4e
.end method


# virtual methods
.method dp(F)I
    .registers 3

    .line 165
    invoke-virtual {p0}, Le/e/a/BikeRun$RecordsPane;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float p1, p1, v0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    return p1
.end method

.method synthetic lambda$0$e-e-a-BikeRun$RecordsPane(ILandroid/view/View;)V
    .registers 3

    .line 149
    invoke-virtual {p0, p1}, Le/e/a/BikeRun$RecordsPane;->select(I)V

    return-void
.end method

.method select(I)V
    .registers 14

    const/4 v0, 0x2

    .line 167
    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    const/4 v1, 0x0

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iget-object v2, p0, Le/e/a/BikeRun$RecordsPane;->track:Le/e/a/BikeRun$Track;

    iput p1, v2, Le/e/a/BikeRun$Track;->recordsPage:I

    const/4 v2, 0x0

    :goto_f
    const/4 v3, 0x3

    const/4 v4, 0x1

    if-lt v2, v3, :cond_114

    .line 173
    iget-object v2, p0, Le/e/a/BikeRun$RecordsPane;->subtitle:Landroid/widget/TextView;

    if-ne p1, v4, :cond_19

    const/4 v3, 0x0

    goto :goto_1b

    :cond_19
    const/16 v3, 0x8

    :goto_1b
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 174
    iget-object v2, p0, Le/e/a/BikeRun$RecordsPane;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->removeAllViews()V

    if-ne p1, v0, :cond_2e

    .line 175
    iget-object v0, p0, Le/e/a/BikeRun$RecordsPane;->track:Le/e/a/BikeRun$Track;

    iget-object v0, v0, Le/e/a/BikeRun$Track;->records:Le/e/a/BikeRunRecords;

    invoke-virtual {v0}, Le/e/a/BikeRunRecords;->highScores()Ljava/util/List;

    move-result-object v0

    goto :goto_3f

    :cond_2e
    iget-object v0, p0, Le/e/a/BikeRun$RecordsPane;->track:Le/e/a/BikeRun$Track;

    iget-object v0, v0, Le/e/a/BikeRun$Track;->records:Le/e/a/BikeRunRecords;

    if-ne p1, v4, :cond_3b

    const-string v2, "1.3.1"

    invoke-virtual {v0, v2}, Le/e/a/BikeRunRecords;->best(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    goto :goto_3f

    :cond_3b
    invoke-virtual {v0}, Le/e/a/BikeRunRecords;->recent()Ljava/util/List;

    move-result-object v0

    .line 176
    :goto_3f
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_7b

    .line 177
    new-instance v2, Landroid/widget/TextView;

    invoke-virtual {p0}, Le/e/a/BikeRun$RecordsPane;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iget-object v3, p0, Le/e/a/BikeRun$RecordsPane;->track:Le/e/a/BikeRun$Track;

    iget v3, v3, Le/e/a/BikeRun$Track;->foreground:I

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    const/high16 v3, 0x41600000    # 14.0f

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 178
    iget-object v3, p0, Le/e/a/BikeRun$RecordsPane;->track:Le/e/a/BikeRun$Track;

    const-string v5, "No records yet"

    const-string v6, "\u6682\u65e0\u8bb0\u5f55"

    const-string v7, "\u8a18\u9332\u306f\u307e\u3060\u3042\u308a\u307e\u305b\u3093"

    invoke-virtual {v3, v7, v5, v6}, Le/e/a/BikeRun$Track;->text(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 v3, 0x41000000    # 8.0f

    .line 179
    invoke-virtual {p0, v3}, Le/e/a/BikeRun$RecordsPane;->dp(F)I

    move-result v5

    invoke-virtual {p0, v3}, Le/e/a/BikeRun$RecordsPane;->dp(F)I

    move-result v3

    invoke-virtual {v2, v1, v5, v1, v3}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v3, p0, Le/e/a/BikeRun$RecordsPane;->rows:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 181
    :cond_7b
    new-instance v3, Ljava/text/SimpleDateFormat;

    const-string v2, "yyyy/MM/dd HH:mm"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v5

    invoke-direct {v3, v2, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 183
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    const/4 v0, 0x0

    :goto_8b
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_97

    .line 189
    iget-object p1, p0, Le/e/a/BikeRun$RecordsPane;->scroll:Le/e/a/BikeRun$SwipeScroll;

    invoke-virtual {p1, v1, v1}, Le/e/a/BikeRun$SwipeScroll;->scrollTo(II)V

    return-void

    .line 183
    :cond_97
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/BikeRunRecords$Entry;

    add-int/2addr v0, v4

    .line 185
    new-instance v6, Ljava/lang/StringBuilder;

    iget-object v7, v2, Le/e/a/BikeRunRecords$Entry;->id:Ljava/lang/String;

    iget-object v8, p0, Le/e/a/BikeRun$RecordsPane;->track:Le/e/a/BikeRun$Track;

    iget-object v8, v8, Le/e/a/BikeRun$Track;->runId:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    const-string v8, ""

    if-eqz v7, :cond_b1

    const-string v7, "\u25b6 "

    goto :goto_b2

    :cond_b1
    move-object v7, v8

    :goto_b2
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-ne p1, v4, :cond_c9

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, ". "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    :cond_c9
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v7, v2, Le/e/a/BikeRunRecords$Entry;->score:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, " m \u00b7 v"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, v2, Le/e/a/BikeRunRecords$Entry;->version:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 186
    iget-wide v7, v2, Le/e/a/BikeRunRecords$Entry;->time:J

    const-wide/16 v9, 0x0

    cmp-long v11, v7, v9

    if-nez v11, :cond_f4

    iget-object v2, p0, Le/e/a/BikeRun$RecordsPane;->track:Le/e/a/BikeRun$Track;

    const-string v7, "Date unknown"

    const-string v8, "\u65e5\u671f\u672a\u77e5"

    const-string v9, "\u65e5\u6642\u4e0d\u660e"

    invoke-virtual {v2, v9, v7, v8}, Le/e/a/BikeRun$Track;->text(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_ff

    :cond_f4
    new-instance v7, Ljava/util/Date;

    iget-wide v8, v2, Le/e/a/BikeRunRecords$Entry;->time:J

    invoke-direct {v7, v8, v9}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v3, v7}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    .line 187
    :goto_ff
    iget-object v7, p0, Le/e/a/BikeRun$RecordsPane;->rows:Landroid/widget/LinearLayout;

    new-instance v8, Le/e/a/BikeRun$RecordRow;

    iget-object v9, p0, Le/e/a/BikeRun$RecordsPane;->track:Le/e/a/BikeRun$Track;

    invoke-direct {v8, v9, v6, v2}, Le/e/a/BikeRun$RecordRow;-><init>(Le/e/a/BikeRun$Track;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x1

    const/4 v9, -0x2

    invoke-direct {v2, v6, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v8, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_8b

    .line 169
    :cond_114
    iget-object v3, p0, Le/e/a/BikeRun$RecordsPane;->labels:[Landroid/widget/TextView;

    aget-object v3, v3, v2

    iget-object v5, p0, Le/e/a/BikeRun$RecordsPane;->track:Le/e/a/BikeRun$Track;

    if-ne v2, p1, :cond_11f

    iget v5, v5, Le/e/a/BikeRun$Track;->accent:I

    goto :goto_121

    :cond_11f
    iget v5, v5, Le/e/a/BikeRun$Track;->foreground:I

    :goto_121
    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 170
    iget-object v3, p0, Le/e/a/BikeRun$RecordsPane;->labels:[Landroid/widget/TextView;

    aget-object v3, v3, v2

    if-ne v2, p1, :cond_12b

    goto :goto_12c

    :cond_12b
    const/4 v4, 0x0

    :goto_12c
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setSelected(Z)V

    .line 171
    iget-object v3, p0, Le/e/a/BikeRun$RecordsPane;->lines:[Landroid/view/View;

    aget-object v3, v3, v2

    if-ne v2, p1, :cond_13a

    iget-object v4, p0, Le/e/a/BikeRun$RecordsPane;->track:Le/e/a/BikeRun$Track;

    iget v4, v4, Le/e/a/BikeRun$Track;->accent:I

    goto :goto_13b

    :cond_13a
    const/4 v4, 0x0

    :goto_13b
    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundColor(I)V

    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_f
.end method
