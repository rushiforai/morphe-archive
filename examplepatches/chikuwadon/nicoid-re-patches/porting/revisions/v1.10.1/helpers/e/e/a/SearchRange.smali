.class public final Le/e/a/SearchRange;
.super Ljava/lang/Object;
.source "SearchRange.java"


# static fields
.field static final PREFIX:Ljava/lang/String; = "search_range_"

.field static settings:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static alignInput(Landroid/view/View;)V
    .registers 10

    .line 16
    instance-of v0, p0, Landroid/widget/AutoCompleteTextView;

    if-eqz v0, :cond_a8

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/RelativeLayout;

    if-nez v0, :cond_e

    goto/16 :goto_a8

    :cond_e
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    const/4 v1, 0x0

    const/4 v2, 0x0

    move v3, v1

    :goto_17
    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getChildCount()I

    move-result v4

    if-lt v3, v4, :cond_96

    if-nez v2, :cond_20

    return-void

    :cond_20
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    const/16 v4, 0x10

    invoke-static {v3, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getPaddingLeft()I

    move-result v4

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getPaddingTop()I

    move-result v5

    invoke-static {v5, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getPaddingRight()I

    move-result v5

    invoke-virtual {v0}, Landroid/widget/RelativeLayout;->getPaddingBottom()I

    move-result v6

    invoke-virtual {v0, v4, v3, v5, v6}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    const/4 v4, 0x2

    new-array v5, v4, [Landroid/view/View;

    aput-object p0, v5, v1

    const/4 v0, 0x1

    aput-object v2, v5, v0

    move v0, v1

    :goto_4a
    if-lt v0, v4, :cond_73

    move-object v0, p0

    check-cast v0, Landroid/widget/EditText;

    const v3, 0x800013

    invoke-virtual {v0, v3}, Landroid/widget/EditText;->setGravity(I)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setIncludeFontPadding(Z)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const/16 v1, 0x8

    invoke-static {p0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p0

    invoke-virtual {v0}, Landroid/widget/EditText;->getPaddingLeft()I

    move-result v1

    invoke-virtual {v0}, Landroid/widget/EditText;->getPaddingRight()I

    move-result v3

    invoke-virtual {v0, v1, p0, v3, p0}, Landroid/widget/EditText;->setPadding(IIII)V

    sget-object p0, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v2, p0}, Landroid/widget/ImageButton;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    return-void

    :cond_73
    aget-object v3, v5, v0

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Landroid/widget/RelativeLayout$LayoutParams;

    iput v1, v6, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    iput v1, v6, Landroid/widget/RelativeLayout$LayoutParams;->bottomMargin:I

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v7

    const/16 v8, 0x32

    invoke-static {v7, v8}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    iput v7, v6, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    const/16 v7, 0xf

    invoke-virtual {v6, v7}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    invoke-virtual {v3, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_4a

    :cond_96
    invoke-virtual {v0, v3}, Landroid/widget/RelativeLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    instance-of v4, v4, Landroid/widget/ImageButton;

    if-eqz v4, :cond_a4

    invoke-virtual {v0, v3}, Landroid/widget/RelativeLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageButton;

    :cond_a4
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_17

    :cond_a8
    :goto_a8
    return-void
.end method

.method static box(Landroid/content/Context;)Landroid/widget/LinearLayout;
    .registers 3

    .line 14
    invoke-static {p0}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    const/16 v1, 0x10

    invoke-static {p0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result p0

    invoke-virtual {v0, p0, p0, p0, p0}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    return-object v0
.end method

.method static button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;
    .registers 4

    .line 15
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Le/e/a/SearchRange;->rangeButton(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object p1

    new-instance v0, Le/e/a/SearchRange$$ExternalSyntheticLambda16;

    invoke-direct {v0, p2}, Le/e/a/SearchRange$$ExternalSyntheticLambda16;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    return-object p1
.end method

.method static date(J)Ljava/lang/String;
    .registers 5

    .line 9
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd"

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    const-string v1, "Asia/Tokyo"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1, p0, p1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static dates(Landroid/content/Context;[ILandroid/widget/Button;)V
    .registers 20

    .line 24
    move-object/from16 v6, p0

    move-object/from16 v7, p1

    invoke-static/range {p0 .. p0}, Le/e/a/SearchRange;->box(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Le/e/a/SearchRange;->day(J)Ljava/util/Calendar;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v13

    const/4 v1, 0x2

    aget v8, v7, v1

    sget-object v2, Le/e/a/SearchRange;->settings:Landroid/content/SharedPreferences;

    const-string v3, "search_range_from"

    invoke-interface {v2, v3, v13, v14}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v9

    sget-object v2, Le/e/a/SearchRange;->settings:Landroid/content/SharedPreferences;

    const-string v3, "search_range_to"

    invoke-interface {v2, v3, v13, v14}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v11

    invoke-static/range {v8 .. v14}, Le/e/a/SearchRange;->initialDates(IJJJ)[J

    move-result-object v2

    aget v3, v7, v1

    const/16 v4, 0x8

    const/4 v5, 0x0

    if-ne v3, v4, :cond_3b

    sget-object v3, Le/e/a/SearchRange;->settings:Landroid/content/SharedPreferences;

    const-string v4, "search_range_mode"

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    goto :goto_3c

    :cond_3b
    move v3, v5

    :goto_3c
    filled-new-array {v3}, [I

    move-result-object v3

    const/4 v4, 0x1

    new-array v8, v4, [Landroid/widget/Button;

    new-array v9, v4, [Landroid/widget/Button;

    new-instance v10, Le/e/a/SearchRange$$ExternalSyntheticLambda0;

    invoke-direct {v10, v8, v2, v9}, Le/e/a/SearchRange$$ExternalSyntheticLambda0;-><init>([Landroid/widget/Button;[J[Landroid/widget/Button;)V

    const-string v11, "\u6708"

    const-string v12, "\u5e74"

    const-string v13, "\u65e5"

    const-string v14, "\u9031"

    filled-new-array {v13, v14, v11, v12}, [Ljava/lang/String;

    move-result-object v11

    new-instance v12, Landroid/widget/LinearLayout;

    invoke-direct {v12, v6}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    move v13, v5

    :goto_5f
    const/4 v14, 0x4

    const/4 v15, -0x2

    if-lt v13, v14, :cond_f4

    .line 25
    new-instance v11, Le/e/a/SearchRange$$ExternalSyntheticLambda2;

    invoke-direct {v11, v6, v2, v10}, Le/e/a/SearchRange$$ExternalSyntheticLambda2;-><init>(Landroid/content/Context;[JLjava/lang/Runnable;)V

    const-string v12, ""

    invoke-static {v0, v12, v11}, Le/e/a/SearchRange;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v11

    aput-object v11, v8, v5

    new-instance v8, Le/e/a/SearchRange$$ExternalSyntheticLambda3;

    invoke-direct {v8, v6, v2, v10}, Le/e/a/SearchRange$$ExternalSyntheticLambda3;-><init>(Landroid/content/Context;[JLjava/lang/Runnable;)V

    invoke-static {v0, v12, v8}, Le/e/a/SearchRange;->button(Landroid/widget/LinearLayout;Ljava/lang/String;Ljava/lang/Runnable;)Landroid/widget/Button;

    move-result-object v8

    aput-object v8, v9, v5

    new-instance v14, Landroid/widget/LinearLayout;

    invoke-direct {v14, v6}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v14}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const/4 v8, -0x1

    filled-new-array {v8, v4}, [I

    move-result-object v16

    move v4, v5

    :goto_89
    if-lt v4, v1, :cond_d0

    invoke-interface {v10}, Ljava/lang/Runnable;->run()V

    invoke-static/range {p0 .. p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v4, "\u6295\u7a3f\u65e5\u306e\u7bc4\u56f2"

    invoke-virtual {v1, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-static {v0}, Le/e/a/SearchRange;->scrolled(Landroid/widget/LinearLayout;)Landroid/widget/ScrollView;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v8

    new-instance v9, Le/e/a/SearchRange$$ExternalSyntheticLambda5;

    move-object v0, v9

    move-object v1, v2

    move-object v2, v3

    move-object/from16 v3, p1

    move-object/from16 v4, p0

    move-object/from16 v5, p2

    invoke-direct/range {v0 .. v5}, Le/e/a/SearchRange$$ExternalSyntheticLambda5;-><init>([J[I[ILandroid/content/Context;Landroid/widget/Button;)V

    const-string v0, "\u9069\u7528"

    invoke-virtual {v8, v0, v9}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Le/e/a/SearchRange$$ExternalSyntheticLambda6;

    move-object/from16 v8, p2

    invoke-direct {v1, v7, v6, v8}, Le/e/a/SearchRange$$ExternalSyntheticLambda6;-><init>([ILandroid/content/Context;Landroid/widget/Button;)V

    const-string v2, "\u6307\u5b9a\u306a\u3057"

    invoke-virtual {v0, v2, v1}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-static {v0}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    return-void

    :cond_d0
    move-object/from16 v8, p2

    aget v9, v16, v4

    if-gez v9, :cond_d9

    const-string v11, "\u25c0 \u524d\u306e\u671f\u9593"

    goto :goto_db

    :cond_d9
    const-string v11, "\u6b21\u306e\u671f\u9593 \u25b6"

    :goto_db
    invoke-static {v6, v11}, Le/e/a/SearchRange;->rangeButton(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v11

    new-instance v12, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v13, 0x3f800000    # 1.0f

    invoke-direct {v12, v5, v15, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v14, v11, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v12, Le/e/a/SearchRange$$ExternalSyntheticLambda4;

    invoke-direct {v12, v2, v3, v9, v10}, Le/e/a/SearchRange$$ExternalSyntheticLambda4;-><init>([J[IILjava/lang/Runnable;)V

    invoke-virtual {v11, v12}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_89

    .line 24
    :cond_f4
    aget-object v14, v11, v13

    invoke-static {v6, v14}, Le/e/a/SearchRange;->rangeButton(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v14

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v1, v5, v15, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v12, v14, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Le/e/a/SearchRange$$ExternalSyntheticLambda1;

    invoke-direct {v1, v3, v13, v2, v10}, Le/e/a/SearchRange$$ExternalSyntheticLambda1;-><init>([II[JLjava/lang/Runnable;)V

    invoke-virtual {v14, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    add-int/lit8 v13, v13, 0x1

    const/4 v1, 0x2

    const/4 v4, 0x1

    goto/16 :goto_5f
.end method

.method static day(J)Ljava/util/Calendar;
    .registers 3

    .line 6
    const-string v0, "Asia/Tokyo"

    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    const/16 p0, 0xb

    const/4 p1, 0x0

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->set(II)V

    const/16 p0, 0xc

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->set(II)V

    const/16 p0, 0xd

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->set(II)V

    const/16 p0, 0xe

    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->set(II)V

    return-object v0
.end method

.method static durations(Landroid/content/Context;[ILandroid/widget/Button;)V
    .registers 26

    .line 27
    move-object/from16 v6, p0

    move-object/from16 v5, p1

    invoke-static/range {p0 .. p0}, Le/e/a/SearchRange;->box(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getPaddingLeft()I

    move-result v1

    const/16 v2, 0xa

    invoke-static {v6, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getPaddingRight()I

    move-result v3

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getPaddingBottom()I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const/4 v1, 0x3

    aget v2, v5, v1

    const/4 v3, 0x0

    const/16 v4, 0x8

    if-ne v2, v4, :cond_2e

    sget-object v2, Le/e/a/SearchRange;->settings:Landroid/content/SharedPreferences;

    const-string v7, "search_range_min"

    invoke-interface {v2, v7, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    goto :goto_34

    :cond_2e
    aget v2, v5, v1

    invoke-static {v2}, Le/e/a/SearchFilterRules;->min(I)I

    move-result v2

    :goto_34
    aget v7, v5, v1

    if-ne v7, v4, :cond_41

    sget-object v1, Le/e/a/SearchRange;->settings:Landroid/content/SharedPreferences;

    const-string v7, "search_range_max"

    invoke-interface {v1, v7, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    goto :goto_47

    :cond_41
    aget v1, v5, v1

    invoke-static {v1}, Le/e/a/SearchFilterRules;->max(I)I

    move-result v1

    .line 28
    :goto_47
    new-instance v15, Le/e/a/DurationRangeModel;

    const/16 v14, 0x384

    if-nez v1, :cond_52

    invoke-static {v14, v2}, Ljava/lang/Math;->max(II)I

    move-result v7

    goto :goto_53

    :cond_52
    move v7, v1

    :goto_53
    const/4 v13, 0x1

    if-nez v1, :cond_58

    move v1, v13

    goto :goto_59

    :cond_58
    move v1, v3

    :goto_59
    invoke-direct {v15, v2, v7, v1}, Le/e/a/DurationRangeModel;-><init>(IIZ)V

    .line 29
    new-instance v2, Landroid/widget/EditText;

    invoke-direct {v2, v6}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    new-instance v1, Landroid/widget/EditText;

    invoke-direct {v1, v6}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    filled-new-array {v2, v1}, [Landroid/widget/EditText;

    move-result-object v7

    move v8, v3

    :goto_6b
    const/16 v9, 0x34

    const/4 v12, 0x2

    if-lt v8, v12, :cond_20b

    invoke-virtual {v2, v13}, Landroid/widget/EditText;->setSingleLine(Z)V

    invoke-virtual {v1, v13}, Landroid/widget/EditText;->setSingleLine(Z)V

    const-string v7, "\u6700\u77ed\uff08\u5206:\u79d2\uff09"

    invoke-virtual {v2, v7}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    const-string v7, "\u6700\u9577\uff08\u5206:\u79d2\uff09"

    invoke-virtual {v1, v7}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    iget v7, v15, Le/e/a/DurationRangeModel;->low:I

    invoke-static {v7}, Le/e/a/SearchRange;->time(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget v7, v15, Le/e/a/DurationRangeModel;->high:I

    invoke-static {v7}, Le/e/a/SearchRange;->time(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    filled-new-array {v2, v1}, [Landroid/widget/EditText;

    move-result-object v10

    move v7, v3

    :goto_97
    const/4 v11, -0x1

    if-lt v7, v12, :cond_1e2

    .line 30
    new-instance v4, Landroid/widget/CheckBox;

    invoke-direct {v4, v6}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    const-string v7, "\u4e0a\u9650\u306a\u3057"

    invoke-virtual {v4, v7}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    iget-boolean v7, v15, Le/e/a/DurationRangeModel;->unlimited:Z

    invoke-virtual {v4, v7}, Landroid/widget/CheckBox;->setChecked(Z)V

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string v7, ""

    const/16 v8, 0x10

    invoke-static {v6, v7, v8}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v10

    invoke-virtual {v0, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 31
    new-instance v9, Le/e/a/DurationRangeBar;

    const/16 v7, 0x1c20

    iget v8, v15, Le/e/a/DurationRangeModel;->high:I

    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    move-result v7

    invoke-direct {v9, v6, v7}, Le/e/a/DurationRangeBar;-><init>(Landroid/content/Context;I)V

    new-array v8, v13, [Z

    .line 32
    new-instance v7, Le/e/a/SearchRange$$ExternalSyntheticLambda9;

    invoke-direct {v7, v9, v15, v1, v10}, Le/e/a/SearchRange$$ExternalSyntheticLambda9;-><init>(Le/e/a/DurationRangeBar;Le/e/a/DurationRangeModel;Landroid/widget/EditText;Landroid/widget/TextView;)V

    .line 33
    new-instance v3, Le/e/a/SearchRange$$ExternalSyntheticLambda10;

    move-object/from16 v16, v7

    move-object v7, v3

    move-object/from16 v17, v8

    move-object/from16 v18, v9

    move-object v9, v2

    move-object/from16 v19, v10

    move-object v10, v1

    move v5, v11

    move-object v11, v15

    move-object v12, v4

    move/from16 v21, v13

    move-object/from16 v13, v16

    invoke-direct/range {v7 .. v13}, Le/e/a/SearchRange$$ExternalSyntheticLambda10;-><init>([ZLandroid/widget/EditText;Landroid/widget/EditText;Le/e/a/DurationRangeModel;Landroid/widget/CheckBox;Ljava/lang/Runnable;)V

    .line 34
    new-instance v13, Le/e/a/SearchRange$1;

    move-object v7, v13

    move-object v9, v15

    move-object v10, v2

    move-object v11, v1

    move-object/from16 v12, v18

    move-object v5, v13

    move-object/from16 v13, v16

    move-object/from16 v14, v19

    invoke-direct/range {v7 .. v14}, Le/e/a/SearchRange$1;-><init>([ZLe/e/a/DurationRangeModel;Landroid/widget/EditText;Landroid/widget/EditText;Le/e/a/DurationRangeBar;Ljava/lang/Runnable;Landroid/widget/TextView;)V

    .line 35
    invoke-virtual {v2, v5}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    invoke-virtual {v1, v5}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 36
    new-instance v5, Le/e/a/SearchRange$$ExternalSyntheticLambda11;

    move-object v7, v5

    move-object v13, v3

    invoke-direct/range {v7 .. v13}, Le/e/a/SearchRange$$ExternalSyntheticLambda11;-><init>([ZLe/e/a/DurationRangeModel;Landroid/widget/EditText;Landroid/widget/EditText;Le/e/a/DurationRangeBar;Ljava/lang/Runnable;)V

    invoke-virtual {v4, v5}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 37
    new-instance v5, Le/e/a/SearchRange$$ExternalSyntheticLambda12;

    invoke-direct {v5, v15, v3}, Le/e/a/SearchRange$$ExternalSyntheticLambda12;-><init>(Le/e/a/DurationRangeModel;Ljava/lang/Runnable;)V

    move-object/from16 v13, v18

    iput-object v5, v13, Le/e/a/DurationRangeBar;->changed:Ljava/util/function/BiConsumer;

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v7, 0x40

    invoke-static {v6, v7}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    const/4 v8, -0x1

    invoke-direct {v5, v8, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v13, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 38
    const-string v5, "5\uff5e10\u5206"

    const-string v7, "10\u5206\u4ee5\u4e0a"

    const-string v9, "1\u5206\u4ee5\u5185"

    const-string v10, "1\uff5e5\u5206"

    filled-new-array {v9, v10, v5, v7}, [Ljava/lang/String;

    move-result-object v5

    const/4 v11, 0x2

    new-array v7, v11, [I

    const/16 v9, 0x3c

    aput v9, v7, v21

    const/16 v10, 0x12c

    filled-new-array {v9, v10}, [I

    move-result-object v9

    const/16 v11, 0x258

    filled-new-array {v10, v11}, [I

    move-result-object v10

    const/16 v12, 0x384

    filled-new-array {v11, v12}, [I

    move-result-object v11

    filled-new-array {v7, v9, v10, v11}, [[I

    move-result-object v14

    new-instance v12, Landroid/widget/LinearLayout;

    invoke-direct {v12, v6}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 39
    const/4 v11, 0x0

    :goto_14c
    const/4 v7, 0x4

    if-lt v11, v7, :cond_1a6

    .line 40
    invoke-interface/range {v16 .. v16}, Ljava/lang/Runnable;->run()V

    invoke-static/range {p0 .. p0}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    const-string v5, "\u52d5\u753b\u6642\u9593\u306e\u7bc4\u56f2"

    invoke-virtual {v3, v5}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    invoke-static {v0}, Le/e/a/SearchRange;->scrolled(Landroid/widget/LinearLayout;)Landroid/widget/ScrollView;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v3, "\u9069\u7528"

    const/4 v5, 0x0

    invoke-virtual {v0, v3, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v3, Le/e/a/SearchRange$$ExternalSyntheticLambda14;

    move-object/from16 v10, p1

    move-object/from16 v9, p2

    invoke-direct {v3, v10, v6, v9}, Le/e/a/SearchRange$$ExternalSyntheticLambda14;-><init>([ILandroid/content/Context;Landroid/widget/Button;)V

    const-string v7, "\u6307\u5b9a\u306a\u3057"

    invoke-virtual {v0, v7, v3}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v3, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-virtual {v0, v3, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v11

    invoke-static {v11}, Le/e/a/UiDialogs;->show(Landroid/app/AlertDialog;)V

    .line 41
    invoke-virtual {v11, v8}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v12

    new-instance v13, Le/e/a/SearchRange$$ExternalSyntheticLambda15;

    move-object v0, v13

    move-object/from16 v17, v1

    move-object v1, v15

    move-object/from16 v18, v2

    move-object v2, v4

    move-object/from16 v3, v18

    move-object/from16 v4, v17

    move-object/from16 v5, p1

    move-object/from16 v6, p0

    move-object/from16 v7, p2

    move-object v8, v11

    invoke-direct/range {v0 .. v8}, Le/e/a/SearchRange$$ExternalSyntheticLambda15;-><init>(Le/e/a/DurationRangeModel;Landroid/widget/CheckBox;Landroid/widget/EditText;Landroid/widget/EditText;[ILandroid/content/Context;Landroid/widget/Button;Landroid/app/AlertDialog;)V

    invoke-virtual {v12, v13}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 42
    return-void

    .line 39
    :cond_1a6
    move-object/from16 v10, p1

    move-object/from16 v9, p2

    move-object/from16 v17, v1

    move-object/from16 v18, v2

    aget-object v1, v5, v11

    invoke-static {v6, v1}, Le/e/a/SearchRange;->rangeButton(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v1

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x2

    const/high16 v8, 0x3f800000    # 1.0f

    move-object/from16 v19, v4

    const/4 v4, 0x0

    invoke-direct {v2, v4, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v12, v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Le/e/a/SearchRange$$ExternalSyntheticLambda13;

    move-object v7, v2

    const/4 v4, -0x1

    move-object v8, v15

    move-object v9, v14

    move v10, v11

    move/from16 v20, v11

    move-object v11, v13

    move-object/from16 v22, v12

    move-object v12, v3

    invoke-direct/range {v7 .. v12}, Le/e/a/SearchRange$$ExternalSyntheticLambda13;-><init>(Le/e/a/DurationRangeModel;[[IILe/e/a/DurationRangeBar;Ljava/lang/Runnable;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    add-int/lit8 v11, v20, 0x1

    move v8, v4

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    move-object/from16 v4, v19

    move-object/from16 v12, v22

    goto/16 :goto_14c

    .line 29
    :cond_1e2
    move-object/from16 v17, v1

    move-object/from16 v18, v2

    move v2, v11

    move v11, v12

    move/from16 v21, v13

    move v12, v14

    aget-object v1, v10, v7

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {v6, v9}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-direct {v3, v2, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-static {v6, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    iput v2, v3, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    invoke-virtual {v0, v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v7, v7, 0x1

    move-object/from16 v5, p1

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    const/4 v3, 0x0

    move v12, v11

    goto/16 :goto_97

    :cond_20b
    move-object/from16 v17, v1

    move-object/from16 v18, v2

    move/from16 v21, v13

    move v12, v14

    aget-object v1, v7, v8

    const-string v2, "nicoid-managed-input"

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setTag(Ljava/lang/Object;)V

    const/high16 v2, 0x41800000    # 16.0f

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setTextSize(F)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setIncludeFontPadding(Z)V

    invoke-static {v6, v9}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/widget/EditText;->setMinHeight(I)V

    invoke-virtual {v1}, Landroid/widget/EditText;->getPaddingLeft()I

    move-result v3

    invoke-static {v6, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v1}, Landroid/widget/EditText;->getPaddingRight()I

    move-result v9

    invoke-static {v6, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v10

    invoke-virtual {v1, v3, v5, v9, v10}, Landroid/widget/EditText;->setPadding(IIII)V

    add-int/lit8 v8, v8, 0x1

    move-object/from16 v5, p1

    move v3, v2

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    goto/16 :goto_6b
.end method

.method static initialDates(IJJJ)[J
    .registers 9

    .line 8
    const/16 v0, 0x8

    const/4 v1, 0x0

    if-ne p0, v0, :cond_22

    cmp-long p0, p1, p3

    if-gtz p0, :cond_22

    const/4 p0, 0x2

    new-array p0, p0, [J

    invoke-static {p1, p2}, Le/e/a/SearchRange;->day(J)Ljava/util/Calendar;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p1

    aput-wide p1, p0, v1

    invoke-static {p3, p4}, Le/e/a/SearchRange;->day(J)Ljava/util/Calendar;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p1

    const/4 p3, 0x1

    aput-wide p1, p0, p3

    goto :goto_26

    :cond_22
    invoke-static {v1, p5, p6}, Le/e/a/SearchRange;->preset(IJ)[J

    move-result-object p0

    :goto_26
    return-object p0
.end method

.method static install(Landroid/content/Context;Landroid/view/View;[I)V
    .registers 5

    .line 17
    invoke-static {p0}, Le/e/a/SearchSnapshot110;->preferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    sput-object v0, Le/e/a/SearchRange;->settings:Landroid/content/SharedPreferences;

    const v0, 0x7f080189

    const/4 v1, 0x2

    invoke-static {p0, p1, v0, p2, v1}, Le/e/a/SearchRange;->replace(Landroid/content/Context;Landroid/view/View;I[II)V

    const v0, 0x7f08018a

    const/4 v1, 0x3

    invoke-static {p0, p1, v0, p2, v1}, Le/e/a/SearchRange;->replace(Landroid/content/Context;Landroid/view/View;I[II)V

    return-void
.end method

.method static label([II)Ljava/lang/String;
    .registers 6

    .line 21
    aget v0, p0, p1

    const/16 v1, 0x8

    const/4 v2, 0x2

    const/4 v3, 0x0

    if-eq v0, v1, :cond_29

    const/4 v0, 0x7

    if-ne p1, v2, :cond_1a

    sget-object v1, Le/e/a/SearchFilters;->PERIOD:[Ljava/lang/String;

    aget p0, p0, p1

    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    invoke-static {v3, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    aget-object p0, v1, p0

    goto :goto_28

    :cond_1a
    sget-object v1, Le/e/a/SearchFilters;->LENGTH:[Ljava/lang/String;

    aget p0, p0, p1

    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    invoke-static {v3, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    aget-object p0, v1, p0

    :goto_28
    return-object p0

    :cond_29
    const-string p0, " \uff5e "

    if-ne p1, v2, :cond_63

    new-instance p1, Ljava/lang/StringBuilder;

    sget-object v0, Le/e/a/SearchRange;->settings:Landroid/content/SharedPreferences;

    const-string v1, "search_range_from"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    invoke-static {v0, v1}, Le/e/a/SearchRange;->date(J)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    sget-object p1, Le/e/a/SearchRange;->settings:Landroid/content/SharedPreferences;

    const-string v0, "search_range_to"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-interface {p1, v0, v1, v2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    invoke-static {v0, v1}, Le/e/a/SearchRange;->date(J)Ljava/lang/String;

    move-result-object p1

    :goto_5a
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_63
    sget-object p1, Le/e/a/SearchRange;->settings:Landroid/content/SharedPreferences;

    const-string v0, "search_range_min"

    invoke-interface {p1, v0, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    sget-object v0, Le/e/a/SearchRange;->settings:Landroid/content/SharedPreferences;

    const-string v1, "search_range_max"

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {p1}, Le/e/a/SearchRange;->time(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    if-nez v0, :cond_89

    const-string p1, "\u4e0a\u9650\u306a\u3057"

    goto :goto_5a

    :cond_89
    invoke-static {v0}, Le/e/a/SearchRange;->time(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_5a
.end method

.method static synthetic lambda$0(Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 2

    .line 15
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$1(ILandroid/content/Context;[ILandroid/widget/Button;Landroid/view/View;)V
    .registers 5

    .line 18
    const/4 p4, 0x2

    if-ne p0, p4, :cond_7

    invoke-static {p1, p2, p3}, Le/e/a/SearchRange;->dates(Landroid/content/Context;[ILandroid/widget/Button;)V

    goto :goto_a

    :cond_7
    invoke-static {p1, p2, p3}, Le/e/a/SearchRange;->durations(Landroid/content/Context;[ILandroid/widget/Button;)V

    :goto_a
    return-void
.end method

.method static synthetic lambda$10([J[I[ILandroid/content/Context;Landroid/widget/Button;Landroid/content/DialogInterface;I)V
    .registers 10

    .line 25
    sget-object p5, Le/e/a/SearchRange;->settings:Landroid/content/SharedPreferences;

    invoke-interface {p5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p5

    const/4 p6, 0x0

    aget-wide v0, p0, p6

    const-string v2, "search_range_from"

    invoke-interface {p5, v2, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p5

    const/4 v0, 0x1

    aget-wide v0, p0, v0

    const-string p0, "search_range_to"

    invoke-interface {p5, p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p5, "search_range_mode"

    aget p1, p1, p6

    invoke-interface {p0, p5, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    const/16 p0, 0x8

    const/4 p1, 0x2

    aput p0, p2, p1

    invoke-static {p3, p2, p1, p4}, Le/e/a/SearchRange;->render(Landroid/content/Context;[IILandroid/widget/Button;)V

    return-void
.end method

.method static synthetic lambda$11([ILandroid/content/Context;Landroid/widget/Button;Landroid/content/DialogInterface;I)V
    .registers 5

    .line 25
    const/4 p3, 0x0

    const/4 p4, 0x2

    aput p3, p0, p4

    invoke-static {p1, p0, p4, p2}, Le/e/a/SearchRange;->render(Landroid/content/Context;[IILandroid/widget/Button;)V

    return-void
.end method

.method static synthetic lambda$12(Le/e/a/DurationRangeBar;Le/e/a/DurationRangeModel;Landroid/widget/EditText;Landroid/widget/TextView;)V
    .registers 6

    .line 32
    iget v0, p1, Le/e/a/DurationRangeModel;->low:I

    iput v0, p0, Le/e/a/DurationRangeBar;->low:I

    iget v0, p1, Le/e/a/DurationRangeModel;->high:I

    iput v0, p0, Le/e/a/DurationRangeBar;->high:I

    iget-boolean v0, p1, Le/e/a/DurationRangeModel;->unlimited:Z

    iput-boolean v0, p0, Le/e/a/DurationRangeBar;->unlimited:Z

    iget v0, p1, Le/e/a/DurationRangeModel;->low:I

    iget v1, p1, Le/e/a/DurationRangeModel;->high:I

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/16 v1, 0x1c20

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Le/e/a/DurationRangeBar;->max:I

    invoke-virtual {p0}, Le/e/a/DurationRangeBar;->invalidate()V

    iget-boolean p0, p1, Le/e/a/DurationRangeModel;->unlimited:Z

    xor-int/lit8 p0, p0, 0x1

    invoke-virtual {p2, p0}, Landroid/widget/EditText;->setEnabled(Z)V

    new-instance p0, Ljava/lang/StringBuilder;

    iget p2, p1, Le/e/a/DurationRangeModel;->low:I

    invoke-static {p2}, Le/e/a/SearchRange;->time(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p2, " \uff5e "

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    iget-boolean p2, p1, Le/e/a/DurationRangeModel;->unlimited:Z

    if-eqz p2, :cond_42

    const-string p1, "\u4e0a\u9650\u306a\u3057"

    goto :goto_48

    :cond_42
    iget p1, p1, Le/e/a/DurationRangeModel;->high:I

    invoke-static {p1}, Le/e/a/SearchRange;->time(I)Ljava/lang/String;

    move-result-object p1

    :goto_48
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p3, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static synthetic lambda$13([ZLandroid/widget/EditText;Landroid/widget/EditText;Le/e/a/DurationRangeModel;Landroid/widget/CheckBox;Ljava/lang/Runnable;)V
    .registers 8

    .line 33
    const/4 v0, 0x1

    const/4 v1, 0x0

    aput-boolean v0, p0, v1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    invoke-virtual {p2, v0}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    iget v0, p3, Le/e/a/DurationRangeModel;->low:I

    invoke-static {v0}, Le/e/a/SearchRange;->time(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget p1, p3, Le/e/a/DurationRangeModel;->high:I

    invoke-static {p1}, Le/e/a/SearchRange;->time(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-boolean p1, p3, Le/e/a/DurationRangeModel;->unlimited:Z

    invoke-virtual {p4, p1}, Landroid/widget/CheckBox;->setChecked(Z)V

    aput-boolean v1, p0, v1

    invoke-interface {p5}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$14([ZLe/e/a/DurationRangeModel;Landroid/widget/EditText;Landroid/widget/EditText;Le/e/a/DurationRangeBar;Ljava/lang/Runnable;Landroid/widget/CompoundButton;Z)V
    .registers 8

    .line 36
    const/4 p6, 0x0

    aget-boolean p0, p0, p6

    if-eqz p0, :cond_6

    return-void

    :cond_6
    iput-boolean p7, p1, Le/e/a/DurationRangeModel;->unlimited:Z

    :try_start_8
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/SearchRange;->parse(Ljava/lang/String;)I

    move-result p0

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Le/e/a/SearchRange;->parse(Ljava/lang/String;)I

    move-result p2

    if-eqz p7, :cond_25

    iget p3, p1, Le/e/a/DurationRangeModel;->high:I

    goto :goto_31

    :cond_25
    invoke-virtual {p3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Le/e/a/SearchRange;->parse(Ljava/lang/String;)I

    move-result p3

    :goto_31
    invoke-static {p2, p3}, Ljava/lang/Math;->max(II)I

    move-result p2

    invoke-virtual {p1, p0, p2}, Le/e/a/DurationRangeModel;->typed(II)V

    const/4 p0, 0x1

    invoke-virtual {p4, p0}, Le/e/a/DurationRangeBar;->setEnabled(Z)V

    invoke-interface {p5}, Ljava/lang/Runnable;->run()V
    :try_end_3f
    .catch Ljava/lang/IllegalArgumentException; {:try_start_8 .. :try_end_3f} :catch_40

    goto :goto_44

    :catch_40
    move-exception p0

    invoke-virtual {p4, p6}, Le/e/a/DurationRangeBar;->setEnabled(Z)V

    :goto_44
    return-void
.end method

.method static synthetic lambda$15(Le/e/a/DurationRangeModel;Ljava/lang/Runnable;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .registers 4

    .line 37
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result p3

    invoke-virtual {p0, p2, p3}, Le/e/a/DurationRangeModel;->dragged(II)V

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$16(Le/e/a/DurationRangeModel;[[IILe/e/a/DurationRangeBar;Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 7

    .line 39
    aget-object p5, p1, p2

    const/4 v0, 0x0

    aget p5, p5, v0

    iput p5, p0, Le/e/a/DurationRangeModel;->low:I

    aget-object p1, p1, p2

    const/4 p5, 0x1

    aget p1, p1, p5

    iput p1, p0, Le/e/a/DurationRangeModel;->high:I

    const/4 p1, 0x3

    if-ne p2, p1, :cond_12

    move v0, p5

    :cond_12
    iput-boolean v0, p0, Le/e/a/DurationRangeModel;->unlimited:Z

    invoke-virtual {p3, p5}, Le/e/a/DurationRangeBar;->setEnabled(Z)V

    invoke-interface {p4}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$17([ILandroid/content/Context;Landroid/widget/Button;Landroid/content/DialogInterface;I)V
    .registers 5

    .line 40
    const/4 p3, 0x0

    const/4 p4, 0x3

    aput p3, p0, p4

    invoke-static {p1, p0, p4, p2}, Le/e/a/SearchRange;->render(Landroid/content/Context;[IILandroid/widget/Button;)V

    return-void
.end method

.method static synthetic lambda$18(Le/e/a/DurationRangeModel;Landroid/widget/CheckBox;Landroid/widget/EditText;Landroid/widget/EditText;[ILandroid/content/Context;Landroid/widget/Button;Landroid/app/AlertDialog;Landroid/view/View;)V
    .registers 9

    .line 41
    :try_start_0
    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    iput-boolean p1, p0, Le/e/a/DurationRangeModel;->unlimited:Z

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/SearchRange;->parse(Ljava/lang/String;)I

    move-result p1

    iget-boolean p8, p0, Le/e/a/DurationRangeModel;->unlimited:Z

    if-eqz p8, :cond_19

    iget p3, p0, Le/e/a/DurationRangeModel;->high:I

    goto :goto_25

    :cond_19
    invoke-virtual {p3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Le/e/a/SearchRange;->parse(Ljava/lang/String;)I

    move-result p3

    :goto_25
    invoke-virtual {p0, p1, p3}, Le/e/a/DurationRangeModel;->typed(II)V

    sget-object p1, Le/e/a/SearchRange;->settings:Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p3, "search_range_min"

    iget p8, p0, Le/e/a/DurationRangeModel;->low:I

    invoke-interface {p1, p3, p8}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p3, "search_range_max"

    invoke-virtual {p0}, Le/e/a/DurationRangeModel;->maximum()I

    move-result p0

    invoke-interface {p1, p3, p0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    const/16 p0, 0x8

    const/4 p1, 0x3

    aput p0, p4, p1

    invoke-static {p5, p4, p1, p6}, Le/e/a/SearchRange;->render(Landroid/content/Context;[IILandroid/widget/Button;)V

    invoke-virtual {p7}, Landroid/app/AlertDialog;->dismiss()V
    :try_end_4e
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_4e} :catch_4f

    goto :goto_55

    :catch_4f
    move-exception p0

    const-string p0, "\u5206:\u79d2\u3067\u3001\u6700\u77ed \u2266 \u6700\u9577\u306b\u306a\u308b\u3088\u3046\u6307\u5b9a\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-virtual {p2, p0}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    :goto_55
    return-void
.end method

.method static synthetic lambda$2(JLjava/util/function/LongConsumer;Landroid/widget/DatePicker;III)V
    .registers 7

    .line 23
    invoke-static {p0, p1}, Le/e/a/SearchRange;->day(J)Ljava/util/Calendar;

    move-result-object p0

    invoke-virtual {p0, p4, p5, p6}, Ljava/util/Calendar;->set(III)V

    invoke-virtual {p0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p0

    invoke-interface {p2, p0, p1}, Ljava/util/function/LongConsumer;->accept(J)V

    return-void
.end method

.method static synthetic lambda$3([Landroid/widget/Button;[J[Landroid/widget/Button;)V
    .registers 7

    .line 24
    const/4 v0, 0x0

    aget-object p0, p0, v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\u958b\u59cb\u65e5\uff1a"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    aget-wide v2, p1, v0

    invoke-static {v2, v3}, Le/e/a/SearchRange;->date(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    aget-object p0, p2, v0

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "\u7d42\u4e86\u65e5\uff1a"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v0, 0x1

    aget-wide v0, p1, v0

    invoke-static {v0, v1}, Le/e/a/SearchRange;->date(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static synthetic lambda$4([II[JLjava/lang/Runnable;Landroid/view/View;)V
    .registers 7

    .line 24
    const/4 p4, 0x0

    aput p1, p0, p4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {p1, v0, v1}, Le/e/a/SearchRange;->preset(IJ)[J

    move-result-object p0

    aget-wide v0, p0, p4

    aput-wide v0, p2, p4

    const/4 p1, 0x1

    aget-wide v0, p0, p1

    aput-wide v0, p2, p1

    invoke-interface {p3}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$5(Landroid/content/Context;[JLjava/lang/Runnable;)V
    .registers 6

    .line 25
    const/4 v0, 0x0

    aget-wide v0, p1, v0

    new-instance v2, Le/e/a/SearchRange$$ExternalSyntheticLambda8;

    invoke-direct {v2, p1, p2}, Le/e/a/SearchRange$$ExternalSyntheticLambda8;-><init>([JLjava/lang/Runnable;)V

    invoke-static {p0, v0, v1, v2}, Le/e/a/SearchRange;->picker(Landroid/content/Context;JLjava/util/function/LongConsumer;)V

    return-void
.end method

.method static synthetic lambda$6([JLjava/lang/Runnable;J)V
    .registers 7

    .line 25
    const/4 v0, 0x0

    aput-wide p2, p0, v0

    const/4 v0, 0x1

    aget-wide v1, p0, v0

    cmp-long v1, v1, p2

    if-gez v1, :cond_c

    aput-wide p2, p0, v0

    :cond_c
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$7(Landroid/content/Context;[JLjava/lang/Runnable;)V
    .registers 6

    .line 25
    const/4 v0, 0x1

    aget-wide v0, p1, v0

    new-instance v2, Le/e/a/SearchRange$$ExternalSyntheticLambda17;

    invoke-direct {v2, p1, p2}, Le/e/a/SearchRange$$ExternalSyntheticLambda17;-><init>([JLjava/lang/Runnable;)V

    invoke-static {p0, v0, v1, v2}, Le/e/a/SearchRange;->picker(Landroid/content/Context;JLjava/util/function/LongConsumer;)V

    return-void
.end method

.method static synthetic lambda$8([JLjava/lang/Runnable;J)V
    .registers 7

    .line 25
    const/4 v0, 0x1

    aput-wide p2, p0, v0

    const/4 v0, 0x0

    aget-wide v1, p0, v0

    cmp-long v1, v1, p2

    if-lez v1, :cond_c

    aput-wide p2, p0, v0

    :cond_c
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$9([J[IILjava/lang/Runnable;Landroid/view/View;)V
    .registers 8

    .line 25
    const/4 p4, 0x0

    aget-wide v0, p0, p4

    invoke-static {v0, v1}, Le/e/a/SearchRange;->day(J)Ljava/util/Calendar;

    move-result-object v0

    aget v1, p1, p4

    const/4 v2, 0x1

    if-nez v1, :cond_e

    const/4 p1, 0x5

    goto :goto_1c

    :cond_e
    aget v1, p1, p4

    if-ne v1, v2, :cond_14

    const/4 p1, 0x3

    goto :goto_1c

    :cond_14
    aget p1, p1, p4

    const/4 v1, 0x2

    if-ne p1, v1, :cond_1b

    move p1, v1

    goto :goto_1c

    :cond_1b
    move p1, v2

    :goto_1c
    invoke-virtual {v0, p1, p2}, Ljava/util/Calendar;->add(II)V

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    aput-wide v0, p0, p4

    aget-wide v0, p0, v2

    invoke-static {v0, v1}, Le/e/a/SearchRange;->day(J)Ljava/util/Calendar;

    move-result-object p4

    invoke-virtual {p4, p1, p2}, Ljava/util/Calendar;->add(II)V

    invoke-virtual {p4}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p1

    aput-wide p1, p0, v2

    invoke-interface {p3}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static parse(Ljava/lang/String;)I
    .registers 5

    .line 44
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    const-string v0, ":"

    const/4 v1, -0x1

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object p0

    array-length v0, p0

    const/4 v1, 0x2

    if-gt v0, v1, :cond_3a

    array-length v0, p0

    if-eqz v0, :cond_3a

    const/4 v0, 0x0

    aget-object v2, p0, v0

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    array-length v3, p0

    if-ne v3, v1, :cond_23

    const/4 v0, 0x1

    aget-object p0, p0, v0

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    :cond_23
    if-ltz v2, :cond_34

    if-ltz v0, :cond_34

    const/16 p0, 0x3b

    if-gt v0, p0, :cond_34

    const p0, 0x186a0

    if-gt v2, p0, :cond_34

    mul-int/lit8 v2, v2, 0x3c

    add-int/2addr v2, v0

    return v2

    :cond_34
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p0

    :cond_3a
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p0
.end method

.method static picker(Landroid/content/Context;JLjava/util/function/LongConsumer;)V
    .registers 12

    .line 23
    invoke-static {p1, p2}, Le/e/a/SearchRange;->day(J)Ljava/util/Calendar;

    move-result-object v0

    new-instance v7, Landroid/app/DatePickerDialog;

    invoke-static {p0}, Le/e/a/UiTheme191;->context(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v2

    new-instance v3, Le/e/a/SearchRange$$ExternalSyntheticLambda18;

    invoke-direct {v3, p1, p2, p3}, Le/e/a/SearchRange$$ExternalSyntheticLambda18;-><init>(JLjava/util/function/LongConsumer;)V

    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Ljava/util/Calendar;->get(I)I

    move-result v4

    const/4 p0, 0x2

    invoke-virtual {v0, p0}, Ljava/util/Calendar;->get(I)I

    move-result v5

    const/4 p0, 0x5

    invoke-virtual {v0, p0}, Ljava/util/Calendar;->get(I)I

    move-result v6

    move-object v1, v7

    invoke-direct/range {v1 .. v6}, Landroid/app/DatePickerDialog;-><init>(Landroid/content/Context;Landroid/app/DatePickerDialog$OnDateSetListener;III)V

    invoke-virtual {v7}, Landroid/app/DatePickerDialog;->show()V

    invoke-static {v7}, Le/e/a/UiDialogs;->style(Landroid/app/AlertDialog;)V

    return-void
.end method

.method static preset(IJ)[J
    .registers 8

    .line 7
    invoke-static {p1, p2}, Le/e/a/SearchRange;->day(J)Ljava/util/Calendar;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    const/4 p2, 0x2

    const/4 v2, 0x1

    if-ne p0, v2, :cond_12

    const/4 p0, 0x5

    const/4 v3, -0x7

    invoke-virtual {p1, p0, v3}, Ljava/util/Calendar;->add(II)V

    goto :goto_1f

    :cond_12
    const/4 v3, -0x1

    if-ne p0, p2, :cond_19

    invoke-virtual {p1, p2, v3}, Ljava/util/Calendar;->add(II)V

    goto :goto_1f

    :cond_19
    const/4 v4, 0x3

    if-ne p0, v4, :cond_1f

    invoke-virtual {p1, v2, v3}, Ljava/util/Calendar;->add(II)V

    :cond_1f
    :goto_1f
    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p0

    new-array p2, p2, [J

    const/4 v3, 0x0

    aput-wide p0, p2, v3

    aput-wide v0, p2, v2

    return-object p2
.end method

.method static rangeButton(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;
    .registers 2

    .line 11
    invoke-static {p0, p1}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object p0

    invoke-static {p0}, Le/e/a/UiDialogs;->secondaryButton(Landroid/widget/Button;)V

    return-object p0
.end method

.method static render(Landroid/content/Context;[IILandroid/widget/Button;)V
    .registers 9

    .line 19
    const-string v0, "\u6295\u7a3f\u671f\u9593"

    const-string v1, "\u6642\u9593"

    const/4 v2, 0x2

    if-ne p2, v2, :cond_9

    move-object v3, v0

    goto :goto_a

    :cond_9
    move-object v3, v1

    :goto_a
    if-ne p2, v2, :cond_f

    const-string v4, "Posted"

    goto :goto_11

    :cond_f
    const-string v4, "Duration"

    :goto_11
    if-ne p2, v2, :cond_14

    goto :goto_15

    :cond_14
    move-object v0, v1

    :goto_15
    invoke-static {p0, v3, v4, v0}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, p2}, Le/e/a/SearchRange;->label([II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le/e/a/SearchRange;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-ne p2, v2, :cond_31

    aget p1, p1, v2

    const/16 p2, 0x8

    if-ne p1, p2, :cond_31

    const-string p1, " \uff5e "

    const-string p2, "\n\uff5e "

    invoke-virtual {v1, p1, p2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    :cond_31
    new-instance p1, Landroid/text/SpannableString;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p2, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "\n"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    new-instance p2, Landroid/text/style/ForegroundColorSpan;

    invoke-static {p0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result p0

    invoke-static {p0}, Le/e/a/DialogColors;->muted(Z)I

    move-result p0

    invoke-direct {p2, p0}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result p0

    const/4 v1, 0x0

    const/16 v2, 0x21

    invoke-virtual {p1, p2, v1, p0, v2}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    new-instance p0, Landroid/text/style/AbsoluteSizeSpan;

    const/16 p2, 0xc

    const/4 v3, 0x1

    invoke-direct {p0, p2, v3}, Landroid/text/style/AbsoluteSizeSpan;-><init>(IZ)V

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result p2

    invoke-virtual {p1, p0, v1, p2, v2}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    new-instance p0, Landroid/text/style/AbsoluteSizeSpan;

    const/16 p2, 0xf

    invoke-direct {p0, p2, v3}, Landroid/text/style/AbsoluteSizeSpan;-><init>(IZ)V

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result p2

    add-int/2addr p2, v3

    invoke-virtual {p1}, Landroid/text/SpannableString;->length()I

    move-result v0

    invoke-virtual {p1, p0, p2, v0, v2}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    invoke-virtual {p3, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static replace(Landroid/content/Context;Landroid/view/View;I[II)V
    .registers 14

    .line 18
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_f7

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    instance-of p2, p2, Landroid/view/ViewGroup;

    if-nez p2, :cond_10

    goto/16 :goto_f7

    :cond_10
    instance-of p2, p1, Landroid/widget/Spinner;

    const/4 v0, 0x0

    if-eqz p2, :cond_1b

    move-object p2, p1

    check-cast p2, Landroid/widget/Spinner;

    invoke-virtual {p2, v0}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    :cond_1b
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    check-cast p2, Landroid/view/ViewGroup;

    const-string v1, ""

    invoke-static {p0, v1}, Le/e/a/SearchRange;->rangeButton(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v1

    const-string v2, "nicoid-range-control"

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setBackgroundColor(I)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setElevation(F)V

    const v2, 0x800033

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setGravity(I)V

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setIncludeFontPadding(Z)V

    const/16 v2, 0xc

    invoke-static {p0, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-static {p0, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-static {p0, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    const/16 v5, 0x8

    invoke-static {p0, v5}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-virtual {v1, v3, v4, v2, v6}, Landroid/widget/Button;->setPadding(IIII)V

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setMinHeight(I)V

    const/16 v2, 0x38

    invoke-static {p0, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setMinimumHeight(I)V

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setSingleLine(Z)V

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setMaxLines(I)V

    invoke-static {p0, p3, p4, v1}, Le/e/a/SearchRange;->render(Landroid/content/Context;[IILandroid/widget/Button;)V

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    instance-of v4, p2, Landroid/widget/LinearLayout;

    const/4 v6, -0x2

    if-eqz v4, :cond_b5

    move-object v3, p2

    check-cast v3, Landroid/widget/LinearLayout;

    invoke-virtual {v3, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const/high16 v7, 0x40000000    # 2.0f

    invoke-virtual {v3, v7}, Landroid/widget/LinearLayout;->setWeightSum(F)V

    invoke-virtual {v3, v0, v0, v0, v0}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    const/16 v7, 0x10

    invoke-virtual {v3, v7}, Landroid/widget/LinearLayout;->setGravity(I)V

    invoke-static {p0}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v7

    invoke-static {p0}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v8

    invoke-static {v7, v8}, Le/e/a/DialogColors;->secondary(IZ)I

    move-result v7

    const/16 v8, 0xa

    invoke-static {p0, v7, v8}, Le/e/a/PanelUi;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v7

    invoke-virtual {v3, v7}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    if-eqz v7, :cond_ad

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    iput v6, v7, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v3, v7}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_ad
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-direct {v3, v0, v6, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    goto :goto_b7

    :cond_b5
    iput v6, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    :goto_b7
    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v0

    invoke-virtual {p1, v5}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p2, v1, v0, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    if-ne p4, v2, :cond_ef

    if-eqz v4, :cond_ef

    new-instance p1, Landroid/view/View;

    invoke-direct {p1, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    invoke-static {p0}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result v0

    const v2, 0xffffff

    and-int/2addr v0, v2

    const/high16 v2, 0x22000000

    or-int/2addr v0, v2

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    invoke-virtual {p2, v1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v0

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, 0x1

    invoke-static {p0, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    const/16 v4, 0x24

    invoke-static {p0, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-direct {v2, v3, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, p1, v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    :cond_ef
    new-instance p1, Le/e/a/SearchRange$$ExternalSyntheticLambda7;

    invoke-direct {p1, p4, p0, p3, v1}, Le/e/a/SearchRange$$ExternalSyntheticLambda7;-><init>(ILandroid/content/Context;[ILandroid/widget/Button;)V

    invoke-virtual {v1, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_f7
    :goto_f7
    return-void
.end method

.method static scrolled(Landroid/widget/LinearLayout;)Landroid/widget/ScrollView;
    .registers 5

    .line 12
    new-instance v0, Landroid/widget/ScrollView;

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, p0, v1}, Landroid/widget/ScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method static stamp(J)Ljava/lang/String;
    .registers 5

    .line 10
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd\'T\'HH:mm:ssXXX"

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    const-string v1, "Asia/Tokyo"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1, p0, p1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static time(I)Ljava/lang/String;
    .registers 3

    .line 22
    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    div-int/lit8 v1, p0, 0x3c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    rem-int/lit8 p0, p0, 0x3c

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {v1, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string v1, "%d:%02d"

    invoke-static {v0, v1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static title([II)Ljava/lang/String;
    .registers 2

    .line 13
    invoke-static {p0, p1}, Le/e/a/SearchRange;->label([II)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static tr(Ljava/lang/String;)Ljava/lang/String;
    .registers 1

    .line 20
    invoke-static {p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static url([ILjava/lang/String;)Ljava/lang/String;
    .registers 9

    .line 45
    invoke-static {p0, p1}, Le/e/a/SearchFilterRules;->url([ILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    sget-object v0, Le/e/a/SearchRange;->settings:Landroid/content/SharedPreferences;

    if-nez v0, :cond_14

    sget-object v0, Le/e/a/CacheFolders;->context:Landroid/content/Context;

    if-eqz v0, :cond_14

    sget-object v0, Le/e/a/CacheFolders;->context:Landroid/content/Context;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    sput-object v0, Le/e/a/SearchRange;->settings:Landroid/content/SharedPreferences;

    :cond_14
    sget-object v0, Le/e/a/SearchRange;->settings:Landroid/content/SharedPreferences;

    if-nez v0, :cond_19

    return-object p1

    :cond_19
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x2

    aget p1, p0, p1

    const/16 v1, 0x8

    if-ne p1, v1, :cond_72

    sget-object p1, Le/e/a/SearchRange;->settings:Landroid/content/SharedPreferences;

    const-string v2, "search_range_from"

    const-wide/16 v3, 0x0

    invoke-interface {p1, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    sget-object p1, Le/e/a/SearchRange;->settings:Landroid/content/SharedPreferences;

    const-string v4, "search_range_to"

    invoke-interface {p1, v4, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    invoke-static {v4, v5}, Le/e/a/SearchRange;->day(J)Ljava/util/Calendar;

    move-result-object p1

    const/4 v4, 0x5

    const/4 v5, 0x1

    invoke-virtual {p1, v4, v5}, Ljava/util/Calendar;->add(II)V

    const-string v4, "&minRegisteredAt="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v2, v3}, Le/e/a/SearchRange;->day(J)Ljava/util/Calendar;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Le/e/a/SearchRange;->stamp(J)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Le/e/a/SearchFilterRules;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "&maxRegisteredAt="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v3

    const-wide/16 v5, 0x3e8

    sub-long/2addr v3, v5

    invoke-static {v3, v4}, Le/e/a/SearchRange;->stamp(J)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/SearchFilterRules;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_72
    const/4 p1, 0x3

    aget p0, p0, p1

    if-ne p0, v1, :cond_9e

    sget-object p0, Le/e/a/SearchRange;->settings:Landroid/content/SharedPreferences;

    const-string p1, "search_range_min"

    const/4 v1, 0x0

    invoke-interface {p0, p1, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    sget-object p1, Le/e/a/SearchRange;->settings:Landroid/content/SharedPreferences;

    const-string v2, "search_range_max"

    invoke-interface {p1, v2, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    if-lez p0, :cond_93

    const-string v1, "&minDuration="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    :cond_93
    if-lez p1, :cond_9e

    const-string p0, "&maxDuration="

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    :cond_9e
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/SearchSnapshot110;->url(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
