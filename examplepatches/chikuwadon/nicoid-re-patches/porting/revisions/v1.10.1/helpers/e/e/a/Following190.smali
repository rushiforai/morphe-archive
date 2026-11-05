.class public final Le/e/a/Following190;
.super Ljava/lang/Object;
.source "Following190.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/Following190$Gestures;,
        Le/e/a/Following190$Pager;,
        Le/e/a/Following190$UserRows;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static attach(Landroid/app/Activity;)V
    .registers 23

    .line 12
    move-object/from16 v0, p0

    :try_start_2
    const-string v1, "A"

    invoke-static {v0, v1}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    .line 13
    const-string v2, "C"

    invoke-static {v0, v2}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/widget/ListAdapter;

    .line 14
    invoke-virtual {v1}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v3

    .line 15
    instance-of v4, v3, Landroid/widget/HeaderViewListAdapter;

    if-eqz v4, :cond_20

    check-cast v3, Landroid/widget/HeaderViewListAdapter;

    invoke-virtual {v3}, Landroid/widget/HeaderViewListAdapter;->getWrappedAdapter()Landroid/widget/ListAdapter;

    move-result-object v3

    .line 16
    :cond_20
    instance-of v4, v3, Le/e/a/Following190$UserRows;

    if-eqz v4, :cond_2a

    check-cast v3, Le/e/a/Following190$UserRows;

    iget-object v3, v3, Le/e/a/Following190$UserRows;->original:Landroid/widget/ListAdapter;

    if-eq v3, v2, :cond_32

    :cond_2a
    new-instance v3, Le/e/a/Following190$UserRows;

    invoke-direct {v3, v2}, Le/e/a/Following190$UserRows;-><init>(Landroid/widget/ListAdapter;)V

    invoke-virtual {v1, v3}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 17
    :cond_32
    invoke-virtual {v1}, Landroid/widget/ListView;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    if-eqz v2, :cond_1a6

    instance-of v3, v2, Le/e/a/Following190$Pager;

    if-eqz v3, :cond_40

    goto/16 :goto_1a6

    .line 18
    :cond_40
    invoke-static/range {p0 .. p0}, Le/e/a/VideoDetails;->initializeCookies(Landroid/content/Context;)V

    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v3

    invoke-virtual {v1}, Landroid/widget/ListView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 19
    invoke-static/range {p0 .. p0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v10

    const-string v5, "nicoid_following_tabs"

    invoke-virtual {v10, v5}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    invoke-static {v10}, Le/e/a/ThemeChoice;->background(Landroid/view/View;)V

    const/4 v11, -0x1

    iput v11, v4, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v2, v10, v3, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 20
    new-instance v12, Landroid/widget/LinearLayout;

    invoke-direct {v12, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v13, -0x2

    invoke-direct {v2, v11, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v10, v12, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 21
    new-instance v14, Le/e/a/Following190$Pager;

    invoke-direct {v14, v0}, Le/e/a/Following190$Pager;-><init>(Landroid/content/Context;)V

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v11, v11}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v14, v1, v2}, Le/e/a/Following190$Pager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 22
    const/4 v15, 0x3

    new-array v9, v15, [Landroid/widget/LinearLayout;

    .line 23
    const/4 v8, 0x1

    move v2, v8

    :goto_80
    if-lt v2, v15, :cond_17f

    .line 24
    new-array v7, v15, [Landroid/widget/TextView;

    new-array v6, v15, [Landroid/view/View;

    new-array v5, v8, [Le/e/a/NetworkTask;

    new-array v4, v15, [Z

    const/4 v3, 0x0

    aput-boolean v8, v4, v3

    .line 25
    new-instance v2, Le/e/a/Following190$$ExternalSyntheticLambda0;

    invoke-direct {v2, v0}, Le/e/a/Following190$$ExternalSyntheticLambda0;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->post(Ljava/lang/Runnable;)Z

    .line 26
    new-instance v1, Le/e/a/Following190$$ExternalSyntheticLambda1;

    move-object/from16 v16, v1

    move-object/from16 v17, v2

    move-object v2, v14

    move v13, v3

    move-object/from16 v3, v17

    move-object/from16 v17, v4

    move-object v4, v6

    move-object/from16 v18, v5

    move-object/from16 v5, p0

    move-object/from16 v19, v6

    move-object v6, v7

    move-object/from16 v20, v7

    move-object/from16 v7, v17

    move/from16 v17, v8

    move-object/from16 v8, v18

    move-object/from16 v21, v9

    invoke-direct/range {v1 .. v9}, Le/e/a/Following190$$ExternalSyntheticLambda1;-><init>(Le/e/a/Following190$Pager;Ljava/lang/Runnable;[Landroid/view/View;Landroid/app/Activity;[Landroid/widget/TextView;[Z[Le/e/a/NetworkTask;[Landroid/widget/LinearLayout;)V

    move-object/from16 v1, v16

    iput-object v1, v14, Le/e/a/Following190$Pager;->changed:Ljava/lang/Runnable;

    .line 29
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v1, v11, v13, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v10, v14, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 30
    new-instance v1, Le/e/a/Following190$1;

    move-object/from16 v4, v18

    move-object/from16 v3, v21

    invoke-direct {v1, v4, v3}, Le/e/a/Following190$1;-><init>([Le/e/a/NetworkTask;[Landroid/widget/LinearLayout;)V

    invoke-virtual {v14, v1}, Le/e/a/Following190$Pager;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 31
    new-array v1, v15, [Ljava/lang/String;

    const-string v3, "\u30e6\u30fc\u30b6\u30fc"

    aput-object v3, v1, v13

    const-string v3, "\u30c1\u30e3\u30f3\u30cd\u30eb"

    aput-object v3, v1, v17

    const-string v3, "\u30de\u30a4\u30ea\u30b9\u30c8"

    const/4 v4, 0x2

    aput-object v3, v1, v4

    new-array v3, v15, [Ljava/lang/String;

    const-string v5, "Users"

    aput-object v5, v3, v13

    const-string v5, "Channels"

    aput-object v5, v3, v17

    const-string v5, "Mylists"

    aput-object v5, v3, v4

    new-array v5, v15, [Ljava/lang/String;

    const-string v6, "\u4f7f\u7528\u8005"

    aput-object v6, v5, v13

    const-string v6, "\u983b\u9053"

    aput-object v6, v5, v17

    const-string v6, "\u64ad\u653e\u6e05\u55ae"

    aput-object v6, v5, v4

    .line 32
    move v6, v13

    :goto_fc
    if-lt v6, v15, :cond_100

    .line 33
    goto/16 :goto_1af

    .line 32
    :cond_100
    invoke-static/range {p0 .. p0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v7

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v9, -0x2

    invoke-direct {v8, v13, v9, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v12, v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    aget-object v8, v1, v6

    aget-object v10, v3, v6

    aget-object v2, v5, v6

    invoke-static {v0, v8, v10, v2}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/16 v8, 0xe

    invoke-static {v0, v2, v8}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v2

    aput-object v2, v20, v6

    const/16 v8, 0x11

    invoke-virtual {v2, v8}, Landroid/widget/TextView;->setGravity(I)V

    aget-object v2, v20, v6

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v10, 0x30

    invoke-static {v0, v10}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v10

    invoke-direct {v8, v11, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v2, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/view/View;

    invoke-direct {v2, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    aput-object v2, v19, v6

    if-nez v6, :cond_142

    invoke-static/range {p0 .. p0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v8

    goto :goto_143

    :cond_142
    move v8, v13

    :goto_143
    invoke-virtual {v2, v8}, Landroid/view/View;->setBackgroundColor(I)V

    aget-object v2, v19, v6

    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {v0, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v10

    invoke-direct {v8, v11, v10}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v2, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    aget-object v2, v20, v6

    if-nez v6, :cond_15b

    move/from16 v8, v17

    goto :goto_15c

    :cond_15b
    move v8, v13

    :goto_15c
    invoke-virtual {v2, v8}, Landroid/widget/TextView;->setSelected(Z)V

    aget-object v2, v20, v6

    if-nez v6, :cond_168

    invoke-static/range {p0 .. p0}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v7

    goto :goto_16c

    :cond_168
    invoke-static/range {p0 .. p0}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result v7

    :goto_16c
    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setTextColor(I)V

    aget-object v2, v20, v6

    new-instance v7, Le/e/a/Following190$$ExternalSyntheticLambda2;

    invoke-direct {v7, v14, v6}, Le/e/a/Following190$$ExternalSyntheticLambda2;-><init>(Le/e/a/Following190$Pager;I)V

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    add-int/lit8 v6, v6, 0x1

    const/high16 v2, 0x3f800000    # 1.0f

    goto/16 :goto_fc

    .line 23
    :cond_17f
    move/from16 v17, v8

    move-object v3, v9

    move v9, v13

    new-instance v4, Landroid/widget/ScrollView;

    invoke-direct {v4, v0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-static/range {p0 .. p0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v5

    aput-object v5, v3, v2

    invoke-virtual {v4, v5}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v5, v11, v11}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v14, v4, v5}, Le/e/a/Following190$Pager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/16 v5, 0x8

    invoke-virtual {v4, v5}, Landroid/widget/ScrollView;->setVisibility(I)V
    :try_end_19e
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_19e} :catch_1a7

    add-int/lit8 v2, v2, 0x1

    move v13, v9

    move/from16 v8, v17

    move-object v9, v3

    goto/16 :goto_80

    .line 17
    :cond_1a6
    :goto_1a6
    return-void

    .line 33
    :catch_1a7
    move-exception v0

    const-string v1, "nicoid-following"

    const-string v2, "Unable to initialize following tabs"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1af
    return-void
.end method

.method static synthetic lambda$0(Landroid/app/Activity;)V
    .registers 8

    .line 25
    const-string v0, "Following"

    const-string v1, "\u8ffd\u8e64\u4e2d"

    const-string v2, "\u30d5\u30a9\u30ed\u30fc\u4e2d"

    invoke-static {p0, v2, v0, v1}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    :try_start_d
    const-string v1, "L"

    invoke-static {p0, v1}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "b"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Ljava/lang/CharSequence;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v3, [Ljava/lang/Object;

    aput-object v0, v2, v6

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_2c} :catch_2d

    goto :goto_2e

    :catch_2d
    move-exception p0

    :goto_2e
    return-void
.end method

.method static synthetic lambda$1(Le/e/a/Following190$Pager;Ljava/lang/Runnable;[Landroid/view/View;Landroid/app/Activity;[Landroid/widget/TextView;[Z[Le/e/a/NetworkTask;[Landroid/widget/LinearLayout;)V
    .registers 12

    .line 26
    iget p0, p0, Le/e/a/Following190$Pager;->selected:I

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    const/4 p1, 0x0

    move v0, p1

    :goto_7
    const/4 v1, 0x3

    const/4 v2, 0x1

    if-lt v0, v1, :cond_28

    .line 27
    if-lez p0, :cond_27

    aget-boolean p2, p5, p0

    if-nez p2, :cond_27

    aput-boolean v2, p5, p0

    if-ne p0, v2, :cond_22

    new-instance p2, Le/e/a/NetworkTask;

    invoke-direct {p2}, Le/e/a/NetworkTask;-><init>()V

    aput-object p2, p6, p1

    aget-object p0, p7, p0

    invoke-static {p3, p0, p2}, Le/e/a/CreatorPage;->loadFollowingChannels(Landroid/app/Activity;Landroid/widget/LinearLayout;Le/e/a/NetworkTask;)V

    goto :goto_27

    :cond_22
    aget-object p0, p7, p0

    invoke-static {p3, p0, v2}, Le/e/a/CreatorPage;->loadMylists(Landroid/app/Activity;Landroid/widget/LinearLayout;I)V

    .line 28
    :cond_27
    :goto_27
    return-void

    .line 26
    :cond_28
    aget-object v1, p2, v0

    if-ne v0, p0, :cond_31

    invoke-static {p3}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v3

    goto :goto_32

    :cond_31
    move v3, p1

    :goto_32
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundColor(I)V

    aget-object v1, p4, v0

    if-ne v0, p0, :cond_3a

    goto :goto_3b

    :cond_3a
    move v2, p1

    :goto_3b
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setSelected(Z)V

    aget-object v1, p4, v0

    if-ne v0, p0, :cond_47

    invoke-static {p3}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v2

    goto :goto_4b

    :cond_47
    invoke-static {p3}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result v2

    :goto_4b
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_7
.end method

.method static synthetic lambda$2(Le/e/a/Following190$Pager;ILandroid/view/View;)V
    .registers 3

    .line 32
    invoke-virtual {p0, p1}, Le/e/a/Following190$Pager;->select(I)V

    return-void
.end method

.method static roundAvatar(Landroid/view/View;)V
    .registers 2

    .line 48
    new-instance v0, Le/e/a/Following190$2;

    invoke-direct {v0}, Le/e/a/Following190$2;-><init>()V

    invoke-virtual {p0, v0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/view/View;->setClipToOutline(Z)V

    return-void
.end method

.method static sizeRow(Landroid/view/View;)V
    .registers 6

    .line 46
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const/16 v1, 0x40

    invoke-static {v0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/view/View;->setMinimumHeight(I)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const/16 v1, 0x10

    invoke-static {v0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    const/16 v3, 0xa

    invoke-static {v2, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {p0, v0, v2, v1, v3}, Landroid/view/View;->setPadding(IIII)V

    return-void
.end method

.method static style(Landroid/view/View;)V
    .registers 5

    .line 49
    instance-of v0, p0, Landroid/widget/TextView;

    const/4 v1, 0x0

    if-eqz v0, :cond_31

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    if-eqz v0, :cond_1e

    const/4 v2, -0x2

    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    instance-of v2, v0, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v2, :cond_1b

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    move-object v2, v0

    check-cast v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v3, 0x3f800000    # 1.0f

    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    :cond_1b
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_1e
    move-object v0, p0

    check-cast v0, Landroid/widget/TextView;

    const/high16 v2, 0x41800000    # 16.0f

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_31
    instance-of v0, p0, Landroid/widget/ImageView;

    if-eqz v0, :cond_62

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    const/16 v3, 0x2c

    invoke-static {v2, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    instance-of v2, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v2, :cond_51

    move-object v2, v0

    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {v2, v1, v1, v1, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    :cond_51
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    move-object v0, p0

    check-cast v0, Landroid/widget/ImageView;

    sget-object v2, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setAdjustViewBounds(Z)V

    invoke-static {p0}, Le/e/a/Following190;->roundAvatar(Landroid/view/View;)V

    :cond_62
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_79

    check-cast p0, Landroid/view/ViewGroup;

    :goto_68
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-lt v1, v0, :cond_6f

    goto :goto_79

    :cond_6f
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Le/e/a/Following190;->style(Landroid/view/View;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_68

    :cond_79
    :goto_79
    return-void
.end method
