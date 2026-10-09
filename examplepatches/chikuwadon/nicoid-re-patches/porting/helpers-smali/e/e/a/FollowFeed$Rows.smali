.class final Le/e/a/FollowFeed$Rows;
.super Landroid/widget/BaseAdapter;
.source "FollowFeed.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/FollowFeed;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Rows"
.end annotation


# instance fields
.field final a:Landroid/app/Activity;

.field final s:Le/e/a/FollowFeed$State;


# direct methods
.method constructor <init>(Landroid/app/Activity;Le/e/a/FollowFeed$State;)V
    .registers 3

    .line 283
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    iput-object p1, p0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/FollowFeed$Rows;->s:Le/e/a/FollowFeed$State;

    return-void
.end method


# virtual methods
.method public areAllItemsEnabled()Z
    .registers 2

    .line 289
    const/4 v0, 0x0

    return v0
.end method

.method public getCount()I
    .registers 3

    .line 284
    iget-object v0, p0, Le/e/a/FollowFeed$Rows;->s:Le/e/a/FollowFeed$State;

    iget-object v0, v0, Le/e/a/FollowFeed$State;->visible:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 3

    .line 285
    iget-object v0, p0, Le/e/a/FollowFeed$Rows;->s:Le/e/a/FollowFeed$State;

    iget-object v0, v0, Le/e/a/FollowFeed$State;->visible:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 p1, 0x0

    goto :goto_14

    :cond_c
    iget-object v0, p0, Le/e/a/FollowFeed$Rows;->s:Le/e/a/FollowFeed$State;

    iget-object v0, v0, Le/e/a/FollowFeed$State;->visible:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    :goto_14
    return-object p1
.end method

.method public getItemId(I)J
    .registers 4

    .line 286
    int-to-long v0, p1

    return-wide v0
.end method

.method public getItemViewType(I)I
    .registers 3

    .line 288
    iget-object v0, p0, Le/e/a/FollowFeed$Rows;->s:Le/e/a/FollowFeed$State;

    iget-object v0, v0, Le/e/a/FollowFeed$State;->visible:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 p1, 0x2

    goto :goto_1b

    :cond_c
    iget-object v0, p0, Le/e/a/FollowFeed$Rows;->s:Le/e/a/FollowFeed$State;

    iget-object v0, v0, Le/e/a/FollowFeed$State;->visible:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    instance-of p1, p1, Ljava/lang/Integer;

    if-eqz p1, :cond_1a

    const/4 p1, 0x0

    goto :goto_1b

    :cond_1a
    const/4 p1, 0x1

    :goto_1b
    return p1
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 20

    .line 291
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual/range {p0 .. p1}, Le/e/a/FollowFeed$Rows;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    .line 292
    const/16 v3, 0x18

    const/16 v4, 0x30

    const/4 v5, 0x0

    if-nez v2, :cond_6a

    .line 293
    instance-of v2, v1, Landroid/widget/TextView;

    if-eqz v2, :cond_16

    check-cast v1, Landroid/widget/TextView;

    goto :goto_1e

    :cond_16
    iget-object v1, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    const/16 v2, 0xf

    # invokes: Le/e/a/FollowFeed;->label(Landroid/app/Activity;IZ)Landroid/widget/TextView;
    invoke-static {v1, v2, v5}, Le/e/a/FollowFeed;->access$0(Landroid/app/Activity;IZ)Landroid/widget/TextView;

    move-result-object v1

    :goto_1e
    const/16 v2, 0x11

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setGravity(I)V

    .line 294
    iget-object v2, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v2, v3}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v2

    iget-object v5, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v5, v4}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v5

    iget-object v6, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v6, v3}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v3

    iget-object v6, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v6, v4}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v4

    invoke-virtual {v1, v2, v5, v3, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 295
    iget-object v2, v0, Le/e/a/FollowFeed$Rows;->s:Le/e/a/FollowFeed$State;

    iget-boolean v2, v2, Le/e/a/FollowFeed$State;->busy:Z

    if-eqz v2, :cond_47

    const-string v2, ""

    goto :goto_66

    :cond_47
    iget-object v2, v0, Le/e/a/FollowFeed$Rows;->s:Le/e/a/FollowFeed$State;

    iget-boolean v2, v2, Le/e/a/FollowFeed$State;->failed:Z

    if-eqz v2, :cond_5a

    iget-object v2, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    const-string v3, "Could not load activity"

    const-string v4, "\u7121\u6cd5\u8f09\u5165\u52d5\u614b"

    const-string v5, "\u65b0\u7740\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    # invokes: Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v2, v5, v3, v4}, Le/e/a/FollowFeed;->access$2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_66

    .line 296
    :cond_5a
    iget-object v2, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    const-string v3, "No activity matches these filters"

    const-string v4, "\u6c92\u6709\u7b26\u5408\u6b64\u689d\u4ef6\u7684\u52d5\u614b"

    const-string v5, "\u3053\u306e\u6761\u4ef6\u306b\u4e00\u81f4\u3059\u308b\u65b0\u7740\u306f\u3042\u308a\u307e\u305b\u3093"

    # invokes: Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v2, v5, v3, v4}, Le/e/a/FollowFeed;->access$2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 295
    :goto_66
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 297
    return-object v1

    .line 299
    :cond_6a
    instance-of v6, v2, Ljava/lang/Integer;

    const/16 v7, 0xc

    const/16 v8, 0x10

    const/4 v9, 0x1

    if-eqz v6, :cond_ab

    .line 300
    instance-of v4, v1, Landroid/widget/TextView;

    if-eqz v4, :cond_7a

    check-cast v1, Landroid/widget/TextView;

    goto :goto_80

    :cond_7a
    iget-object v1, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->label(Landroid/app/Activity;IZ)Landroid/widget/TextView;
    invoke-static {v1, v8, v9}, Le/e/a/FollowFeed;->access$0(Landroid/app/Activity;IZ)Landroid/widget/TextView;

    move-result-object v1

    .line 301
    :goto_80
    iget-object v4, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v4, v8}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v4

    iget-object v5, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v5, v3}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v3

    iget-object v5, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v5, v8}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v5

    iget-object v6, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v6, v7}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v6

    invoke-virtual {v1, v4, v3, v5, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v3, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    # invokes: Le/e/a/FollowFeed;->period(Landroid/content/Context;I)Ljava/lang/String;
    invoke-static {v3, v2}, Le/e/a/FollowFeed;->access$3(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-object v1

    .line 303
    :cond_ab
    check-cast v2, Le/e/a/FollowFeedData$Item;

    .line 304
    const/16 v3, 0x8

    if-nez v1, :cond_30e

    .line 305
    new-instance v1, Landroid/widget/LinearLayout;

    iget-object v6, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    invoke-direct {v1, v6}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v6, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v6, v8}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v6

    iget-object v10, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v10, v7}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v10

    iget-object v11, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v11, v8}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v11

    iget-object v12, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v12, v7}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v12

    invoke-virtual {v1, v6, v10, v11, v12}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v6, Le/e/a/FollowFeed$Holder;

    const/4 v10, 0x0

    invoke-direct {v6, v10}, Le/e/a/FollowFeed$Holder;-><init>(Le/e/a/FollowFeed$Holder;)V

    .line 306
    new-instance v10, Landroid/widget/LinearLayout;

    iget-object v11, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    invoke-direct {v10, v11}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v10, v8}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 307
    iget-object v11, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->imageBox(Landroid/app/Activity;Z)Landroid/widget/FrameLayout;
    invoke-static {v11, v9}, Le/e/a/FollowFeed;->access$4(Landroid/app/Activity;Z)Landroid/widget/FrameLayout;

    move-result-object v11

    iput-object v11, v6, Le/e/a/FollowFeed$Holder;->avatar:Landroid/widget/FrameLayout;

    iget-object v11, v6, Le/e/a/FollowFeed$Holder;->avatar:Landroid/widget/FrameLayout;

    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v13, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    const/16 v14, 0x28

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v13, v14}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v13

    iget-object v15, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v15, v14}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v14

    invoke-direct {v12, v13, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v10, v11, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 308
    new-instance v11, Landroid/widget/LinearLayout;

    iget-object v12, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    invoke-direct {v11, v12}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v11, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v12, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v12, v7}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v12

    invoke-virtual {v11, v12, v5, v5, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 309
    new-instance v12, Landroid/widget/LinearLayout;

    iget-object v13, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    invoke-direct {v12, v13}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v12, v8}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 310
    iget-object v13, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    const/16 v14, 0xe

    # invokes: Le/e/a/FollowFeed;->label(Landroid/app/Activity;IZ)Landroid/widget/TextView;
    invoke-static {v13, v14, v9}, Le/e/a/FollowFeed;->access$0(Landroid/app/Activity;IZ)Landroid/widget/TextView;

    move-result-object v13

    iput-object v13, v6, Le/e/a/FollowFeed$Holder;->name:Landroid/widget/TextView;

    iget-object v13, v6, Le/e/a/FollowFeed$Holder;->name:Landroid/widget/TextView;

    invoke-virtual {v13, v9}, Landroid/widget/TextView;->setSingleLine(Z)V

    iget-object v13, v6, Le/e/a/FollowFeed$Holder;->name:Landroid/widget/TextView;

    sget-object v15, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v13, v15}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 311
    iget-object v13, v6, Le/e/a/FollowFeed$Holder;->name:Landroid/widget/TextView;

    new-instance v15, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v4, -0x2

    const/high16 v14, 0x3f800000    # 1.0f

    invoke-direct {v15, v5, v4, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v12, v13, v15}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v13, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->label(Landroid/app/Activity;IZ)Landroid/widget/TextView;
    invoke-static {v13, v7, v5}, Le/e/a/FollowFeed;->access$0(Landroid/app/Activity;IZ)Landroid/widget/TextView;

    move-result-object v13

    iput-object v13, v6, Le/e/a/FollowFeed$Holder;->date:Landroid/widget/TextView;

    iget-object v13, v6, Le/e/a/FollowFeed$Holder;->date:Landroid/widget/TextView;

    const v15, 0x3f266666    # 0.65f

    invoke-virtual {v13, v15}, Landroid/widget/TextView;->setAlpha(F)V

    iget-object v13, v6, Le/e/a/FollowFeed$Holder;->date:Landroid/widget/TextView;

    invoke-virtual {v12, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 312
    invoke-virtual {v11, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v12, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->label(Landroid/app/Activity;IZ)Landroid/widget/TextView;
    invoke-static {v12, v7, v5}, Le/e/a/FollowFeed;->access$0(Landroid/app/Activity;IZ)Landroid/widget/TextView;

    move-result-object v12

    iput-object v12, v6, Le/e/a/FollowFeed$Holder;->event:Landroid/widget/TextView;

    iget-object v12, v6, Le/e/a/FollowFeed$Holder;->event:Landroid/widget/TextView;

    const v13, 0x3f333333    # 0.7f

    invoke-virtual {v12, v13}, Landroid/widget/TextView;->setAlpha(F)V

    iget-object v12, v6, Le/e/a/FollowFeed$Holder;->event:Landroid/widget/TextView;

    invoke-virtual {v11, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v12, v5, v4, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v10, v11, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v1, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 313
    new-instance v10, Landroid/widget/LinearLayout;

    iget-object v11, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    invoke-direct {v10, v11}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v10, v6, Le/e/a/FollowFeed$Holder;->card:Landroid/widget/LinearLayout;

    iget-object v10, v6, Le/e/a/FollowFeed$Holder;->card:Landroid/widget/LinearLayout;

    invoke-virtual {v10, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v10, v6, Le/e/a/FollowFeed$Holder;->card:Landroid/widget/LinearLayout;

    iget-object v11, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    iget-object v12, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->surface(Landroid/content/Context;)I
    invoke-static {v12}, Le/e/a/FollowFeed;->access$5(Landroid/content/Context;)I

    move-result v12

    # invokes: Le/e/a/FollowFeed;->shape(Landroid/content/Context;IIZ)Landroid/graphics/drawable/GradientDrawable;
    invoke-static {v11, v12, v7, v9}, Le/e/a/FollowFeed;->access$6(Landroid/content/Context;IIZ)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v7

    invoke-virtual {v10, v7}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object v7, v6, Le/e/a/FollowFeed$Holder;->card:Landroid/widget/LinearLayout;

    invoke-virtual {v7, v9}, Landroid/widget/LinearLayout;->setClipToOutline(Z)V

    .line 314
    new-instance v7, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v10, -0x1

    invoke-direct {v7, v10, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget-object v11, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    const/16 v12, 0x34

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v11, v12}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v11

    iget-object v12, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v12, v3}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v12

    invoke-virtual {v7, v11, v12, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    iget-object v11, v6, Le/e/a/FollowFeed$Holder;->card:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v11, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 315
    iget-object v7, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->imageBox(Landroid/app/Activity;Z)Landroid/widget/FrameLayout;
    invoke-static {v7, v5}, Le/e/a/FollowFeed;->access$4(Landroid/app/Activity;Z)Landroid/widget/FrameLayout;

    move-result-object v7

    iput-object v7, v6, Le/e/a/FollowFeed$Holder;->thumbnail:Landroid/widget/FrameLayout;

    iget-object v7, v6, Le/e/a/FollowFeed$Holder;->card:Landroid/widget/LinearLayout;

    iget-object v11, v6, Le/e/a/FollowFeed$Holder;->thumbnail:Landroid/widget/FrameLayout;

    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v12, v10, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v11, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 316
    iget-object v7, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    const/16 v11, 0xb

    # invokes: Le/e/a/FollowFeed;->label(Landroid/app/Activity;IZ)Landroid/widget/TextView;
    invoke-static {v7, v11, v9}, Le/e/a/FollowFeed;->access$0(Landroid/app/Activity;IZ)Landroid/widget/TextView;

    move-result-object v7

    iput-object v7, v6, Le/e/a/FollowFeed$Holder;->badge:Landroid/widget/TextView;

    iget-object v7, v6, Le/e/a/FollowFeed$Holder;->badge:Landroid/widget/TextView;

    invoke-virtual {v7, v10}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v7, v6, Le/e/a/FollowFeed$Holder;->badge:Landroid/widget/TextView;

    iget-object v12, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    const/4 v13, 0x5

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v12, v13}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v12

    iget-object v15, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    const/4 v14, 0x2

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v15, v14}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v15

    iget-object v8, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v8, v13}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v8

    iget-object v13, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v13, v14}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v13

    invoke-virtual {v7, v12, v15, v8, v13}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v7, v6, Le/e/a/FollowFeed$Holder;->badge:Landroid/widget/TextView;

    iget-object v8, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    const v12, -0x44eeeeef

    const/4 v13, 0x3

    # invokes: Le/e/a/FollowFeed;->shape(Landroid/content/Context;IIZ)Landroid/graphics/drawable/GradientDrawable;
    invoke-static {v8, v12, v13, v5}, Le/e/a/FollowFeed;->access$6(Landroid/content/Context;IIZ)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 317
    new-instance v7, Landroid/widget/FrameLayout$LayoutParams;

    const v8, 0x800033

    invoke-direct {v7, v4, v4, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    iget-object v8, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v8, v3}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v8

    iget-object v15, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v15, v3}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v15

    invoke-virtual {v7, v8, v15, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    iget-object v8, v6, Le/e/a/FollowFeed$Holder;->thumbnail:Landroid/widget/FrameLayout;

    iget-object v15, v6, Le/e/a/FollowFeed$Holder;->badge:Landroid/widget/TextView;

    invoke-virtual {v8, v15, v7}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 318
    iget-object v7, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->label(Landroid/app/Activity;IZ)Landroid/widget/TextView;
    invoke-static {v7, v11, v9}, Le/e/a/FollowFeed;->access$0(Landroid/app/Activity;IZ)Landroid/widget/TextView;

    move-result-object v7

    iput-object v7, v6, Le/e/a/FollowFeed$Holder;->duration:Landroid/widget/TextView;

    iget-object v7, v6, Le/e/a/FollowFeed$Holder;->duration:Landroid/widget/TextView;

    invoke-virtual {v7, v10}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v7, v6, Le/e/a/FollowFeed$Holder;->duration:Landroid/widget/TextView;

    iget-object v8, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    const/4 v9, 0x5

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v8, v9}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v8

    iget-object v10, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v10, v14}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v10

    iget-object v11, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v11, v9}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v9

    iget-object v11, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v11, v14}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v11

    invoke-virtual {v7, v8, v10, v9, v11}, Landroid/widget/TextView;->setPadding(IIII)V

    iget-object v7, v6, Le/e/a/FollowFeed$Holder;->duration:Landroid/widget/TextView;

    iget-object v8, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->shape(Landroid/content/Context;IIZ)Landroid/graphics/drawable/GradientDrawable;
    invoke-static {v8, v12, v13, v5}, Le/e/a/FollowFeed;->access$6(Landroid/content/Context;IIZ)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 319
    new-instance v7, Landroid/widget/FrameLayout$LayoutParams;

    const v8, 0x800055

    invoke-direct {v7, v4, v4, v8}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    iget-object v8, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v8, v3}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v8

    iget-object v9, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v9, v3}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v9

    invoke-virtual {v7, v5, v5, v8, v9}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    iget-object v8, v6, Le/e/a/FollowFeed$Holder;->thumbnail:Landroid/widget/FrameLayout;

    iget-object v9, v6, Le/e/a/FollowFeed$Holder;->duration:Landroid/widget/TextView;

    invoke-virtual {v8, v9, v7}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 320
    new-instance v7, Landroid/widget/LinearLayout;

    iget-object v8, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    invoke-direct {v7, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v8, 0x10

    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v8, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    const/16 v9, 0xa

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v8, v9}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v8

    iget-object v9, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v9, v3}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v9

    iget-object v10, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v10, v3}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v10

    invoke-virtual {v7, v8, v9, v5, v10}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 321
    iget-object v8, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    const/16 v9, 0xe

    # invokes: Le/e/a/FollowFeed;->label(Landroid/app/Activity;IZ)Landroid/widget/TextView;
    invoke-static {v8, v9, v5}, Le/e/a/FollowFeed;->access$0(Landroid/app/Activity;IZ)Landroid/widget/TextView;

    move-result-object v8

    iput-object v8, v6, Le/e/a/FollowFeed$Holder;->title:Landroid/widget/TextView;

    iget-object v8, v6, Le/e/a/FollowFeed$Holder;->title:Landroid/widget/TextView;

    invoke-virtual {v8, v13}, Landroid/widget/TextView;->setMaxLines(I)V

    iget-object v8, v6, Le/e/a/FollowFeed$Holder;->title:Landroid/widget/TextView;

    sget-object v9, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    iget-object v8, v6, Le/e/a/FollowFeed$Holder;->title:Landroid/widget/TextView;

    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v10, 0x3f800000    # 1.0f

    invoke-direct {v9, v5, v4, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v7, v8, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 322
    iget-object v4, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    const-string v8, "\u22ee"

    # invokes: Le/e/a/FollowFeed;->chip(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/Button;
    invoke-static {v4, v8}, Le/e/a/FollowFeed;->access$7(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v4

    iput-object v4, v6, Le/e/a/FollowFeed$Holder;->menu:Landroid/widget/Button;

    iget-object v4, v6, Le/e/a/FollowFeed$Holder;->menu:Landroid/widget/Button;

    const/high16 v8, 0x41c00000    # 24.0f

    invoke-virtual {v4, v8}, Landroid/widget/Button;->setTextSize(F)V

    iget-object v4, v6, Le/e/a/FollowFeed$Holder;->menu:Landroid/widget/Button;

    invoke-virtual {v4, v5, v5, v5, v5}, Landroid/widget/Button;->setPadding(IIII)V

    iget-object v4, v6, Le/e/a/FollowFeed$Holder;->menu:Landroid/widget/Button;

    iget-object v8, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    const-string v9, "Video menu"

    const-string v10, "\u5f71\u7247\u9078\u55ae"

    const-string v11, "\u52d5\u753b\u30e1\u30cb\u30e5\u30fc"

    # invokes: Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v8, v11, v9, v10}, Le/e/a/FollowFeed;->access$2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object v4, v6, Le/e/a/FollowFeed$Holder;->menu:Landroid/widget/Button;

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v9, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    const/16 v10, 0x30

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v9, v10}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v9

    iget-object v11, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->dp(Landroid/content/Context;I)I
    invoke-static {v11, v10}, Le/e/a/FollowFeed;->access$1(Landroid/content/Context;I)I

    move-result v10

    invoke-direct {v8, v9, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v4, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v4, v6, Le/e/a/FollowFeed$Holder;->card:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 323
    invoke-virtual {v1, v6}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 324
    goto :goto_317

    :cond_30e
    check-cast v1, Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getTag()Ljava/lang/Object;

    move-result-object v4

    move-object v6, v4

    check-cast v6, Le/e/a/FollowFeed$Holder;

    .line 325
    :goto_317
    iget-object v4, v6, Le/e/a/FollowFeed$Holder;->name:Landroid/widget/TextView;

    iget-object v7, v2, Le/e/a/FollowFeedData$Item;->actor:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_32c

    iget-object v7, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    const-string v8, "Creator"

    const-string v9, "\u6295\u7a3f\u8005"

    # invokes: Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v7, v9, v8, v9}, Le/e/a/FollowFeed;->access$2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    goto :goto_32e

    :cond_32c
    iget-object v7, v2, Le/e/a/FollowFeedData$Item;->actor:Ljava/lang/String;

    :goto_32e
    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v4, v6, Le/e/a/FollowFeed$Holder;->date:Landroid/widget/TextView;

    invoke-static {v2}, Le/e/a/FollowFeedData;->date(Le/e/a/FollowFeedData$Item;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v4, v6, Le/e/a/FollowFeed$Holder;->event:Landroid/widget/TextView;

    iget-object v7, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->event(Landroid/app/Activity;Le/e/a/FollowFeedData$Item;)Ljava/lang/String;
    invoke-static {v7, v2}, Le/e/a/FollowFeed;->access$8(Landroid/app/Activity;Le/e/a/FollowFeedData$Item;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 326
    iget-object v4, v6, Le/e/a/FollowFeed$Holder;->title:Landroid/widget/TextView;

    iget-object v7, v2, Le/e/a/FollowFeedData$Item;->title:Ljava/lang/String;

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v4, v6, Le/e/a/FollowFeed$Holder;->badge:Landroid/widget/TextView;

    iget-object v7, v0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    # invokes: Le/e/a/FollowFeed;->badge(Landroid/app/Activity;Le/e/a/FollowFeedData$Item;)Ljava/lang/String;
    invoke-static {v7, v2}, Le/e/a/FollowFeed;->access$9(Landroid/app/Activity;Le/e/a/FollowFeedData$Item;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v4, v6, Le/e/a/FollowFeed$Holder;->duration:Landroid/widget/TextView;

    iget v7, v2, Le/e/a/FollowFeedData$Item;->duration:I

    invoke-static {v7}, Le/e/a/FollowFeedData;->duration(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v4, v6, Le/e/a/FollowFeed$Holder;->duration:Landroid/widget/TextView;

    iget v7, v2, Le/e/a/FollowFeedData$Item;->duration:I

    if-lez v7, :cond_369

    goto :goto_36b

    :cond_369
    const/16 v5, 0x8

    :goto_36b
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 327
    iget-object v3, v6, Le/e/a/FollowFeed$Holder;->avatar:Landroid/widget/FrameLayout;

    iget-object v4, v2, Le/e/a/FollowFeedData$Item;->author:Le/e/a/FollowFeedData$Actor;

    iget-object v4, v4, Le/e/a/FollowFeedData$Actor;->icon:Ljava/lang/String;

    # invokes: Le/e/a/FollowFeed;->bindImage(Landroid/widget/FrameLayout;Ljava/lang/String;)V
    invoke-static {v3, v4}, Le/e/a/FollowFeed;->access$10(Landroid/widget/FrameLayout;Ljava/lang/String;)V

    iget-object v3, v6, Le/e/a/FollowFeed$Holder;->thumbnail:Landroid/widget/FrameLayout;

    iget-object v4, v2, Le/e/a/FollowFeedData$Item;->thumbnail:Ljava/lang/String;

    # invokes: Le/e/a/FollowFeed;->bindImage(Landroid/widget/FrameLayout;Ljava/lang/String;)V
    invoke-static {v3, v4}, Le/e/a/FollowFeed;->access$10(Landroid/widget/FrameLayout;Ljava/lang/String;)V

    .line 328
    iget-object v3, v6, Le/e/a/FollowFeed$Holder;->card:Landroid/widget/LinearLayout;

    iget-object v4, v2, Le/e/a/FollowFeedData$Item;->title:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object v3, v6, Le/e/a/FollowFeed$Holder;->card:Landroid/widget/LinearLayout;

    new-instance v4, Le/e/a/FollowFeed$Rows$$ExternalSyntheticLambda3;

    invoke-direct {v4, v0, v2}, Le/e/a/FollowFeed$Rows$$ExternalSyntheticLambda3;-><init>(Le/e/a/FollowFeed$Rows;Le/e/a/FollowFeedData$Item;)V

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v3, v6, Le/e/a/FollowFeed$Holder;->thumbnail:Landroid/widget/FrameLayout;

    new-instance v4, Le/e/a/FollowFeed$Rows$$ExternalSyntheticLambda4;

    invoke-direct {v4, v0, v2}, Le/e/a/FollowFeed$Rows$$ExternalSyntheticLambda4;-><init>(Le/e/a/FollowFeed$Rows;Le/e/a/FollowFeedData$Item;)V

    invoke-virtual {v3, v4}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v3, v6, Le/e/a/FollowFeed$Holder;->title:Landroid/widget/TextView;

    new-instance v4, Le/e/a/FollowFeed$Rows$$ExternalSyntheticLambda5;

    invoke-direct {v4, v0, v2}, Le/e/a/FollowFeed$Rows$$ExternalSyntheticLambda5;-><init>(Le/e/a/FollowFeed$Rows;Le/e/a/FollowFeedData$Item;)V

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 329
    iget-object v3, v6, Le/e/a/FollowFeed$Holder;->menu:Landroid/widget/Button;

    new-instance v4, Le/e/a/FollowFeed$Rows$$ExternalSyntheticLambda6;

    invoke-direct {v4, v0, v2}, Le/e/a/FollowFeed$Rows$$ExternalSyntheticLambda6;-><init>(Le/e/a/FollowFeed$Rows;Le/e/a/FollowFeedData$Item;)V

    invoke-virtual {v3, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 337
    return-object v1
.end method

.method public getViewTypeCount()I
    .registers 2

    .line 287
    const/4 v0, 0x3

    return v0
.end method

.method public isEnabled(I)Z
    .registers 3

    .line 289
    invoke-virtual {p0, p1}, Le/e/a/FollowFeed$Rows;->getItemViewType(I)I

    move-result p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_8

    return v0

    :cond_8
    const/4 p1, 0x0

    return p1
.end method

.method synthetic lambda$0$e-e-a-FollowFeed$Rows(Le/e/a/FollowFeedData$Item;Landroid/view/View;)V
    .registers 4

    .line 328
    iget-object p2, p0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    const/4 v0, 0x0

    # invokes: Le/e/a/FollowFeed;->open(Landroid/app/Activity;Le/e/a/FollowFeedData$Item;Z)V
    invoke-static {p2, p1, v0}, Le/e/a/FollowFeed;->access$11(Landroid/app/Activity;Le/e/a/FollowFeedData$Item;Z)V

    return-void
.end method

.method synthetic lambda$1$e-e-a-FollowFeed$Rows(Le/e/a/FollowFeedData$Item;Landroid/view/View;)V
    .registers 4

    .line 328
    iget-object p2, p0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    const/4 v0, 0x0

    # invokes: Le/e/a/FollowFeed;->open(Landroid/app/Activity;Le/e/a/FollowFeedData$Item;Z)V
    invoke-static {p2, p1, v0}, Le/e/a/FollowFeed;->access$11(Landroid/app/Activity;Le/e/a/FollowFeedData$Item;Z)V

    return-void
.end method

.method synthetic lambda$2$e-e-a-FollowFeed$Rows(Le/e/a/FollowFeedData$Item;Landroid/view/View;)V
    .registers 4

    .line 328
    iget-object p2, p0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    const/4 v0, 0x0

    # invokes: Le/e/a/FollowFeed;->open(Landroid/app/Activity;Le/e/a/FollowFeedData$Item;Z)V
    invoke-static {p2, p1, v0}, Le/e/a/FollowFeed;->access$11(Landroid/app/Activity;Le/e/a/FollowFeedData$Item;Z)V

    return-void
.end method

.method synthetic lambda$3$e-e-a-FollowFeed$Rows(Le/e/a/FollowFeedData$Item;Landroid/view/View;)V
    .registers 8

    .line 330
    new-instance v0, Landroid/widget/PopupMenu;

    iget-object v1, p0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    invoke-direct {v0, v1, p2}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 331
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object p2

    iget-object v1, p0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    const-string v2, "Play"

    const-string v3, "\u64ad\u653e"

    const-string v4, "\u518d\u751f"

    # invokes: Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v1, v4, v2, v3}, Le/e/a/FollowFeed;->access$2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p2, v1}, Landroid/view/Menu;->add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p2

    new-instance v1, Le/e/a/FollowFeed$Rows$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Le/e/a/FollowFeed$Rows$$ExternalSyntheticLambda0;-><init>(Le/e/a/FollowFeed$Rows;Le/e/a/FollowFeedData$Item;)V

    invoke-interface {p2, v1}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 332
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object p2

    iget-object v1, p0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    const-string v2, "Video details"

    const-string v3, "\u5f71\u7247\u8cc7\u8a0a"

    const-string v4, "\u52d5\u753b\u60c5\u5831"

    # invokes: Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v1, v4, v2, v3}, Le/e/a/FollowFeed;->access$2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p2, v1}, Landroid/view/Menu;->add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p2

    new-instance v1, Le/e/a/FollowFeed$Rows$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1}, Le/e/a/FollowFeed$Rows$$ExternalSyntheticLambda1;-><init>(Le/e/a/FollowFeed$Rows;Le/e/a/FollowFeedData$Item;)V

    invoke-interface {p2, v1}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 333
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object p2

    iget-object v1, p0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    const-string v2, "Share"

    const-string v3, "\u5206\u4eab"

    const-string v4, "\u5171\u6709"

    # invokes: Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v1, v4, v2, v3}, Le/e/a/FollowFeed;->access$2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p2, v1}, Landroid/view/Menu;->add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p2

    new-instance v1, Le/e/a/FollowFeed$Rows$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, p1}, Le/e/a/FollowFeed$Rows$$ExternalSyntheticLambda2;-><init>(Le/e/a/FollowFeed$Rows;Le/e/a/FollowFeedData$Item;)V

    invoke-interface {p2, v1}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 335
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->show()V

    .line 336
    return-void
.end method

.method synthetic lambda$4$e-e-a-FollowFeed$Rows(Le/e/a/FollowFeedData$Item;Landroid/view/MenuItem;)Z
    .registers 4

    .line 331
    iget-object p2, p0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    const/4 v0, 0x0

    # invokes: Le/e/a/FollowFeed;->open(Landroid/app/Activity;Le/e/a/FollowFeedData$Item;Z)V
    invoke-static {p2, p1, v0}, Le/e/a/FollowFeed;->access$11(Landroid/app/Activity;Le/e/a/FollowFeedData$Item;Z)V

    const/4 p1, 0x1

    return p1
.end method

.method synthetic lambda$5$e-e-a-FollowFeed$Rows(Le/e/a/FollowFeedData$Item;Landroid/view/MenuItem;)Z
    .registers 4

    .line 332
    iget-object p2, p0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    const/4 v0, 0x1

    # invokes: Le/e/a/FollowFeed;->open(Landroid/app/Activity;Le/e/a/FollowFeedData$Item;Z)V
    invoke-static {p2, p1, v0}, Le/e/a/FollowFeed;->access$11(Landroid/app/Activity;Le/e/a/FollowFeedData$Item;Z)V

    return v0
.end method

.method synthetic lambda$6$e-e-a-FollowFeed$Rows(Le/e/a/FollowFeedData$Item;Landroid/view/MenuItem;)Z
    .registers 7

    .line 334
    iget-object p2, p0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.SEND"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "text/plain"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "https://www.nicovideo.jp/watch/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p1, p1, Le/e/a/FollowFeedData$Item;->id:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "android.intent.extra.TEXT"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    iget-object v0, p0, Le/e/a/FollowFeed$Rows;->a:Landroid/app/Activity;

    const-string v1, "Share"

    const-string v2, "\u5206\u4eab"

    const-string v3, "\u5171\u6709"

    # invokes: Le/e/a/FollowFeed;->text(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v0, v3, v1, v2}, Le/e/a/FollowFeed;->access$2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    const/4 p1, 0x1

    return p1
.end method
