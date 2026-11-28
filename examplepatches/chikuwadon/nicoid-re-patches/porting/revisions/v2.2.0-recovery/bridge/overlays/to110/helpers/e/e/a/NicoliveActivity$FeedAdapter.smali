.class final Le/e/a/NicoliveActivity$FeedAdapter;
.super Landroid/widget/BaseAdapter;
.source "NicoliveActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/NicoliveActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "FeedAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Le/e/a/NicoliveActivity;

.field final visible:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/NicoliveData$Program;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Le/e/a/NicoliveActivity;)V
    .registers 2

    .line 1066
    iput-object p1, p0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 1065
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Le/e/a/NicoliveActivity$FeedAdapter;->visible:Ljava/util/ArrayList;

    .line 1066
    invoke-virtual {p0}, Le/e/a/NicoliveActivity$FeedAdapter;->filter()V

    return-void
.end method


# virtual methods
.method filter()V
    .registers 6

    .line 1067
    iget-object v0, p0, Le/e/a/NicoliveActivity$FeedAdapter;->visible:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    iget-object v0, v0, Le/e/a/NicoliveActivity;->programs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x3

    if-nez v1, :cond_2

    iget-object v0, p0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    iget v0, v0, Le/e/a/NicoliveActivity;->hubTab:I

    if-eqz v0, :cond_1

    iget-object v0, p0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    iget v0, v0, Le/e/a/NicoliveActivity;->hubTab:I

    if-eq v0, v2, :cond_1

    return-void

    :cond_1
    iget-object v0, p0, Le/e/a/NicoliveActivity$FeedAdapter;->visible:Ljava/util/ArrayList;

    iget-object p0, p0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    # invokes: Le/e/a/NicoliveActivity;->activeSort()Le/e/a/NicoliveCatalog$Sort;
    invoke-static {p0}, Le/e/a/NicoliveActivity;->access$1(Le/e/a/NicoliveActivity;)Le/e/a/NicoliveCatalog$Sort;

    move-result-object p0

    iget-object p0, p0, Le/e/a/NicoliveCatalog$Sort;->comparator:Ljava/util/Comparator;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->sort(Ljava/util/Comparator;)V

    return-void

    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/NicoliveData$Program;

    iget-object v3, p0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    iget v3, v3, Le/e/a/NicoliveActivity;->hubTab:I

    if-nez v3, :cond_5

    iget-object v3, p0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    iget v3, v3, Le/e/a/NicoliveActivity;->category:I

    if-eqz v3, :cond_5

    iget-object v3, p0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    iget v3, v3, Le/e/a/NicoliveActivity;->category:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_3

    iget-object v3, v1, Le/e/a/NicoliveData$Program;->provider:Ljava/lang/String;

    const-string v4, "community"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    iget-object v3, v1, Le/e/a/NicoliveData$Program;->provider:Ljava/lang/String;

    const-string v4, "user"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    :cond_3
    iget-object v3, p0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    iget v3, v3, Le/e/a/NicoliveActivity;->category:I

    const/4 v4, 0x2

    if-ne v3, v4, :cond_4

    iget-object v3, v1, Le/e/a/NicoliveData$Program;->provider:Ljava/lang/String;

    const-string v4, "official"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    :cond_4
    iget-object v3, p0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    iget v3, v3, Le/e/a/NicoliveActivity;->category:I

    if-ne v3, v2, :cond_0

    iget-object v2, v1, Le/e/a/NicoliveData$Program;->provider:Ljava/lang/String;

    const-string v3, "channel"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    :cond_5
    iget-object v2, p0, Le/e/a/NicoliveActivity$FeedAdapter;->visible:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public getCount()I
    .registers 1

    .line 1069
    iget-object p0, p0, Le/e/a/NicoliveActivity$FeedAdapter;->visible:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 2

    .line 1069
    iget-object p0, p0, Le/e/a/NicoliveActivity$FeedAdapter;->visible:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public getItemId(I)J
    .registers 2

    int-to-long p0, p1

    return-wide p0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    .line 1070
    invoke-virtual/range {p0 .. p1}, Le/e/a/NicoliveActivity$FeedAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/NicoliveData$Program;

    instance-of v3, v1, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_0

    check-cast v1, Landroid/widget/LinearLayout;

    goto :goto_0

    :cond_0
    iget-object v1, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    invoke-static {v1}, Le/e/a/NicoliveUi;->row(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v1

    .line 1071
    :goto_0
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v3

    const/4 v4, 0x4

    const-string v6, ""

    const/4 v7, 0x1

    const/4 v8, 0x0

    if-nez v3, :cond_1

    iget-object v3, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    const/high16 v9, 0x41000000    # 8.0f

    invoke-static {v3, v9}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v3

    iget-object v10, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    const/high16 v11, 0x40000000    # 2.0f

    invoke-static {v10, v11}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v10

    iget-object v12, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    invoke-static {v12, v9}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v12

    iget-object v13, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    invoke-static {v13, v11}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v11

    invoke-virtual {v1, v3, v10, v12, v11}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    iget-object v3, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    const/high16 v10, 0x42b00000    # 88.0f

    invoke-static {v3, v10}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setMinimumHeight(I)V

    new-instance v3, Landroid/widget/FrameLayout;

    iget-object v10, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    invoke-direct {v3, v10}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 1073
    iget-object v10, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    invoke-static {v10, v4}, Le/e/a/NicoliveUi;->panel(Landroid/content/Context;I)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v10

    invoke-virtual {v3, v10}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 1074
    new-instance v10, Landroid/widget/ImageView;

    iget-object v11, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    invoke-direct {v10, v11}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 1075
    sget-object v11, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 1076
    new-instance v11, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v12, -0x1

    invoke-direct {v11, v12, v12}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, v10, v11}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1077
    iget-object v10, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    const/16 v11, 0xa

    invoke-static {v10, v6, v11}, Le/e/a/NicoliveUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v10

    .line 1078
    invoke-virtual {v10, v12}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1079
    sget-object v13, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v10, v13, v7}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 1080
    iget-object v13, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    const/high16 v14, 0x40800000    # 4.0f

    invoke-static {v13, v14}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v13

    .line 1081
    invoke-virtual {v10, v13, v8, v13, v8}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 1082
    new-instance v14, Landroid/widget/FrameLayout$LayoutParams;

    iget-object v15, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    const/high16 v4, 0x41880000    # 17.0f

    invoke-static {v15, v4}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v15

    const/4 v5, -0x2

    const/16 v9, 0x33

    invoke-direct {v14, v5, v15, v9}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 1083
    invoke-virtual {v14, v13, v13, v8, v8}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 1084
    invoke-virtual {v3, v10, v14}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1085
    iget-object v10, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    invoke-static {v10, v6, v11}, Le/e/a/NicoliveUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v10

    .line 1086
    invoke-virtual {v10, v12}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1087
    sget-object v11, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v10, v11, v7}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 1088
    invoke-virtual {v10, v13, v8, v13, v8}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 1089
    new-instance v11, Landroid/widget/FrameLayout$LayoutParams;

    iget-object v12, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    invoke-static {v12, v4}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v4

    invoke-direct {v11, v5, v4, v9}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 1090
    invoke-virtual {v11, v13, v13, v8, v8}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 1091
    invoke-virtual {v3, v10, v11}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1092
    iget-object v4, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    const/high16 v9, 0x42e00000    # 112.0f

    invoke-static {v4, v9}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v4

    iget-object v9, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    const/high16 v10, 0x43200000    # 160.0f

    invoke-static {v9, v10}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v9

    iget-object v10, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    invoke-virtual {v10}, Le/e/a/NicoliveActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    invoke-virtual {v10}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v10

    iget v10, v10, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v10, v10

    const v11, 0x3eb851ec    # 0.36f

    mul-float/2addr v10, v11

    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v10

    invoke-static {v9, v10}, Ljava/lang/Math;->min(II)I

    move-result v9

    invoke-static {v4, v9}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 1093
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    int-to-float v10, v4

    const v11, 0x3fe38e39

    div-float/2addr v10, v11

    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v10

    invoke-direct {v9, v4, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v3, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1094
    iget-object v3, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    invoke-static {v3}, Le/e/a/NicoliveUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v3

    iget-object v4, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    const/high16 v9, 0x41000000    # 8.0f

    invoke-static {v4, v9}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v4

    invoke-virtual {v3, v4, v8, v8, v8}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    iget-object v4, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    const/16 v9, 0xb

    invoke-static {v4, v6, v9}, Le/e/a/NicoliveUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v4

    invoke-static {v4}, Le/e/a/DynamicTheme;->secondaryTextColor(Landroid/view/View;)I

    move-result v10

    invoke-virtual {v4, v10}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v4, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    const/16 v10, 0xe

    invoke-static {v4, v6, v10}, Le/e/a/NicoliveUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v4

    const/4 v10, 0x2

    invoke-virtual {v4, v10}, Landroid/widget/TextView;->setMaxLines(I)V

    sget-object v10, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v4, v10}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v4, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    const/16 v10, 0xc

    invoke-static {v4, v6, v10}, Le/e/a/NicoliveUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v4

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setSingleLine(Z)V

    sget-object v10, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v4, v10}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    invoke-static {v4}, Le/e/a/DynamicTheme;->secondaryTextColor(Landroid/view/View;)I

    move-result v10

    invoke-virtual {v4, v10}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v4, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    invoke-static {v4, v6, v9}, Le/e/a/NicoliveUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v4

    invoke-static {v4}, Le/e/a/DynamicTheme;->secondaryTextColor(Landroid/view/View;)I

    move-result v9

    invoke-virtual {v4, v9}, Landroid/widget/TextView;->setTextColor(I)V

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-direct {v4, v8, v5, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 1095
    :cond_1
    invoke-virtual {v1, v8}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/FrameLayout;

    .line 1096
    invoke-static {v3}, Le/e/a/ThumbnailCorners;->applyFrame(Landroid/view/View;)V

    .line 1097
    invoke-virtual {v3, v8}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    .line 1098
    invoke-virtual {v3, v7}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 1099
    invoke-virtual {v2}, Le/e/a/NicoliveData$Program;->onAir()Z

    move-result v9

    invoke-virtual {v2}, Le/e/a/NicoliveData$Program;->scheduled()Z

    move-result v10

    const/16 v11, 0x8

    if-nez v9, :cond_2

    if-nez v10, :cond_2

    move v12, v11

    goto :goto_1

    :cond_2
    move v12, v8

    .line 1100
    :goto_1
    invoke-virtual {v5, v12}, Landroid/widget/TextView;->setVisibility(I)V

    const/high16 v12, 0x40400000    # 3.0f

    if-nez v9, :cond_4

    if-eqz v10, :cond_3

    .line 1102
    const-string/jumbo v13, "\u653e\u9001\u4e88\u5b9a"

    goto :goto_3

    :cond_3
    :goto_2
    const/4 v5, 0x2

    goto :goto_5

    :cond_4
    const-string v13, "LIVE"

    :goto_3
    invoke-virtual {v5, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1103
    new-instance v13, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v13}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 1104
    iget-object v14, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    invoke-static {v14, v12}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v14

    int-to-float v14, v14

    invoke-virtual {v13, v14}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    if-eqz v9, :cond_5

    const v14, -0x40dac9

    goto :goto_4

    :cond_5
    const v14, -0xde9966

    .line 1105
    :goto_4
    invoke-virtual {v13, v14}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 1106
    invoke-virtual {v5, v13}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_2

    .line 1108
    :goto_5
    invoke-virtual {v3, v5}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 1109
    invoke-virtual {v2}, Le/e/a/NicoliveData$Program;->accessLabel()Ljava/lang/String;

    move-result-object v5

    .line 1110
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v13

    if-nez v13, :cond_6

    move v11, v8

    :cond_6
    invoke-virtual {v3, v11}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1111
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_8

    .line 1112
    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1113
    new-instance v5, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v5}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 1114
    iget-object v11, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    invoke-static {v11, v12}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v11

    int-to-float v11, v11

    invoke-virtual {v5, v11}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    const v11, -0x26dadadb

    .line 1115
    invoke-virtual {v5, v11}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 1116
    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 1117
    invoke-virtual {v3}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/widget/FrameLayout$LayoutParams;

    if-nez v9, :cond_7

    if-nez v10, :cond_7

    const/4 v9, 0x4

    goto :goto_6

    :cond_7
    const/16 v9, 0x19

    .line 1119
    :goto_6
    iget-object v11, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    int-to-float v9, v9

    invoke-static {v11, v9}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v9

    iput v9, v5, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 1120
    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1122
    :cond_8
    iget-object v3, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    iget v3, v3, Le/e/a/NicoliveActivity;->hubTab:I

    iget-object v5, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    const/4 v9, 0x2

    if-ne v3, v9, :cond_9

    iget-object v3, v5, Le/e/a/NicoliveActivity;->browser:Le/e/a/NicoliveBrowser;

    invoke-virtual {v3, v2, v4}, Le/e/a/NicoliveBrowser;->historyImage(Le/e/a/NicoliveData$Program;Landroid/widget/ImageView;)V

    goto :goto_7

    :cond_9
    iget-object v3, v5, Le/e/a/NicoliveActivity;->browser:Le/e/a/NicoliveBrowser;

    iget-object v5, v2, Le/e/a/NicoliveData$Program;->thumbnail:Ljava/lang/String;

    invoke-virtual {v3, v5, v4}, Le/e/a/NicoliveBrowser;->image(Ljava/lang/String;Landroid/widget/ImageView;)V

    .line 1123
    :goto_7
    invoke-virtual {v1, v7}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    invoke-virtual {v3, v8}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iget-object v5, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    iget v5, v5, Le/e/a/NicoliveActivity;->hubTab:I

    const/4 v8, 0x4

    if-ne v5, v8, :cond_a

    new-instance v5, Ljava/lang/StringBuilder;

    add-int/lit8 v8, p1, 0x1

    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v5, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v8, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    const-string v9, " / "

    const-string v11, "\u540d\uff0f"

    const-string v12, "\u4f4d / "

    invoke-static {v8, v12, v9, v11}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v8, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    invoke-virtual {v8, v2}, Le/e/a/NicoliveActivity;->programLabel(Le/e/a/NicoliveData$Program;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_8

    :cond_a
    iget-object v5, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    invoke-virtual {v5, v2}, Le/e/a/NicoliveActivity;->programLabel(Le/e/a/NicoliveData$Program;)Ljava/lang/String;

    move-result-object v5

    :goto_8
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v3, v7}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iget-object v5, v2, Le/e/a/NicoliveData$Program;->title:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v5, 0x2

    invoke-virtual {v3, v5}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iget-object v5, v2, Le/e/a/NicoliveData$Program;->owner:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v4, 0x3

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    if-eqz v10, :cond_c

    .line 1125
    iget-wide v4, v2, Le/e/a/NicoliveData$Program;->reservations:J

    const-wide/16 v7, 0x0

    cmp-long v0, v4, v7

    if-ltz v0, :cond_b

    sget-object v0, Ljava/util/Locale;->JAPAN:Ljava/util/Locale;

    const-string v4, "\u30bf\u30a4\u30e0\u30b7\u30d5\u30c8\u4e88\u7d04 %,d"

    invoke-static {v4}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iget-wide v5, v2, Le/e/a/NicoliveData$Program;->reservations:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v4, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    :cond_b
    invoke-virtual {v3, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v0, 0x0

    .line 1126
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    return-object v1

    .line 1128
    :cond_c
    iget-object v4, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    iget-wide v5, v2, Le/e/a/NicoliveData$Program;->views:J

    iget-wide v7, v2, Le/e/a/NicoliveData$Program;->comments:J

    invoke-static {v4, v5, v6, v7, v8}, Le/e/a/NicoliveUi;->statistics(Landroid/content/Context;JJ)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1129
    new-instance v4, Ljava/lang/StringBuilder;

    iget-object v5, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    const-string v6, "Viewers: "

    const-string/jumbo v7, "\u89c0\u773e\uff1a"

    const-string/jumbo v8, "\u6765\u5834 "

    invoke-static {v5, v8, v6, v7}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v5, v2, Le/e/a/NicoliveData$Program;->views:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    iget-object v0, v0, Le/e/a/NicoliveActivity$FeedAdapter;->this$0:Le/e/a/NicoliveActivity;

    const-string v5, ", comments: "

    const-string/jumbo v6, "\uff0c\u7559\u8a00\uff1a"

    const-string v7, "\u3001\u30b3\u30e1\u30f3\u30c8 "

    invoke-static {v0, v7, v5, v6}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v5, v2, Le/e/a/NicoliveData$Program;->comments:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    return-object v1
.end method

.method public notifyDataSetChanged()V
    .registers 1

    .line 1068
    invoke-virtual {p0}, Le/e/a/NicoliveActivity$FeedAdapter;->filter()V

    invoke-super {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    return-void
.end method
