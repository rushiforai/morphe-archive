.class public final Le/e/a/FilterEditor110;
.super Ljava/lang/Object;
.source "FilterEditor110.java"


# static fields
.field static final ROWS:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/content/Context;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field static final SOURCES:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/content/Context;",
            "[",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 5
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/FilterEditor110;->SOURCES:Ljava/util/WeakHashMap;

    .line 6
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/FilterEditor110;->ROWS:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static confirm(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4

    .line 8
    sget-object v0, Le/e/a/FilterEditor110;->ROWS:Ljava/util/WeakHashMap;

    invoke-static {p0}, Le/e/a/UiDialogs;->owner(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_10

    invoke-static {p0, p1}, Le/e/a/ContentFilter;->confirmOwner(Landroid/content/Context;Ljava/lang/String;)V

    return-void

    :cond_10
    invoke-static {p0, p1, v0}, Le/e/a/FilterEditor110;->confirm(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public static confirm(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 6

    .line 9
    invoke-static {p0}, Le/e/a/UiDialogs;->owner(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    sget-object v1, Le/e/a/FilterEditor110;->SOURCES:Ljava/util/WeakHashMap;

    const-string v2, "title"

    invoke-static {p2, v2}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2, p1}, [Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p0, p1, p2}, Le/e/a/OwnerNg194;->confirmOwner(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public static edit(Landroid/app/Activity;Lorg/json/JSONArray;Lorg/json/JSONObject;ILjava/lang/Runnable;)V
    .registers 29

    .line 11
    invoke-static/range {p0 .. p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v6

    if-nez p2, :cond_d

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    move-object v7, v0

    goto :goto_f

    :cond_d
    move-object/from16 v7, p2

    :goto_f
    const-string v0, "category"

    move/from16 v1, p3

    invoke-virtual {v7, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x1

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v8, 0x0

    invoke-static {v8, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    filled-new-array {v0}, [I

    move-result-object v15

    sget-object v0, Le/e/a/FilterEditor110;->SOURCES:Ljava/util/WeakHashMap;

    move-object/from16 v14, p0

    invoke-virtual {v0, v14}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    const/4 v13, 0x2

    new-array v12, v13, [Ljava/lang/String;

    const-string v2, ""

    aput-object v2, v12, v8

    aput-object v2, v12, v1

    if-eqz v0, :cond_42

    aget-object v2, v0, v8

    aput-object v2, v12, v8

    aget-object v0, v0, v1

    aput-object v0, v12, v1

    :cond_42
    aget v0, v15, v8

    aget v2, v15, v8

    aget-object v2, v12, v2

    const-string v3, "value"

    invoke-virtual {v7, v3, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v12, v0

    invoke-static {v6}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v11

    invoke-static {v11}, Le/e/a/UiDialogs;->insetContent(Landroid/view/View;)V

    new-instance v10, Landroid/widget/CheckBox;

    invoke-direct {v10, v6}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    const-string v0, "Enabled"

    const-string v2, "\u555f\u7528"

    const-string v3, "\u6709\u52b9"

    invoke-static {v6, v3, v0, v2}, Le/e/a/FilterEditor110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    const-string v0, "enabled"

    invoke-virtual {v7, v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    invoke-virtual {v10, v0}, Landroid/widget/CheckBox;->setChecked(Z)V

    invoke-static {v10}, Le/e/a/PanelUi;->tint(Landroid/widget/CompoundButton;)V

    invoke-virtual {v11, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, v6}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-static {v6, v8}, Le/e/a/FilterUi110;->category(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v6, v2}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v9

    invoke-static {v6, v1}, Le/e/a/FilterUi110;->category(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v6, v2}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v5

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v3, 0x2c

    invoke-static {v6, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    const/high16 v13, 0x3f800000    # 1.0f

    invoke-direct {v2, v8, v4, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v9, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-static {v6, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-direct {v2, v8, v3, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v0, v5, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v11, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v13, Landroid/widget/RadioGroup;

    invoke-direct {v13, v6}, Landroid/widget/RadioGroup;-><init>(Landroid/content/Context;)V

    const-string v0, "exact"

    const-string v2, "regex"

    const-string v3, "partial"

    filled-new-array {v3, v0, v2}, [Ljava/lang/String;

    move-result-object v16

    move v0, v8

    :goto_bc
    const/4 v2, 0x3

    if-lt v0, v2, :cond_1d1

    invoke-virtual {v11, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v4, Landroid/widget/EditText;

    invoke-direct {v4, v6}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    const-string v0, "nicoid-managed-input"

    invoke-virtual {v4, v0}, Landroid/widget/EditText;->setTag(Ljava/lang/Object;)V

    aget v3, v15, v8

    aget-object v3, v12, v3

    invoke-virtual {v4, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v4, v2}, Landroid/widget/EditText;->setMaxLines(I)V

    const-string v2, "Blocked keyword"

    const-string v3, "\u5c01\u9396\u95dc\u9375\u5b57"

    const-string v8, "NG\u30ef\u30fc\u30c9"

    invoke-static {v6, v8, v2, v3}, Le/e/a/FilterEditor110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    invoke-virtual {v11, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string v2, "Clear input"

    const-string v3, "\u6e05\u9664\u8f38\u5165"

    const-string v8, "\u5165\u529b\u3092\u6d88\u53bb"

    invoke-static {v6, v8, v2, v3}, Le/e/a/FilterEditor110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v6, v2}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v2

    new-instance v3, Le/e/a/FilterEditor110$$ExternalSyntheticLambda0;

    invoke-direct {v3, v4}, Le/e/a/FilterEditor110$$ExternalSyntheticLambda0;-><init>(Landroid/widget/EditText;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v11, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v8, Landroid/widget/EditText;

    invoke-direct {v8, v6}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    invoke-virtual {v8, v0}, Landroid/widget/EditText;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v8, v1}, Landroid/widget/EditText;->setSingleLine(Z)V

    const/4 v0, 0x2

    invoke-virtual {v8, v0}, Landroid/widget/EditText;->setInputType(I)V

    const-string v0, "userId"

    invoke-virtual {v7, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    const-string v0, "Uploader ID (optional)"

    const-string v1, "\u6295\u7a3f\u8005ID\uff08\u9078\u586b\uff09"

    const-string v2, "\u6295\u7a3f\u8005ID\uff08\u4efb\u610f\uff09"

    invoke-static {v6, v2, v0, v1}, Le/e/a/FilterEditor110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    invoke-virtual {v11, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v17, Le/e/a/FilterEditor110$$ExternalSyntheticLambda1;

    move-object/from16 v0, v17

    move-object v1, v9

    move-object v2, v15

    move-object v3, v6

    move-object/from16 v18, v4

    move-object v4, v5

    move-object/from16 v19, v5

    move-object v5, v8

    invoke-direct/range {v0 .. v5}, Le/e/a/FilterEditor110$$ExternalSyntheticLambda1;-><init>(Landroid/widget/Button;[ILandroid/content/Context;Landroid/widget/Button;Landroid/widget/EditText;)V

    const/4 v0, 0x0

    :goto_138
    const/4 v1, 0x2

    if-lt v0, v1, :cond_1a3

    invoke-interface/range {v17 .. v17}, Ljava/lang/Runnable;->run()V

    new-instance v0, Landroid/widget/ScrollView;

    invoke-direct {v0, v6}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v11}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    invoke-static {v6}, Le/e/a/UiDialogs;->builder(Landroid/content/Context;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    if-nez p2, :cond_14f

    const-string v2, "NG\u767b\u9332"

    goto :goto_151

    :cond_14f
    const-string v2, "NG\u7de8\u96c6"

    :goto_151
    if-nez p2, :cond_156

    const-string v3, "Add NG rule"

    goto :goto_158

    :cond_156
    const-string v3, "Edit NG rule"

    :goto_158
    if-nez p2, :cond_15d

    const-string v4, "\u65b0\u589e NG \u898f\u5247"

    goto :goto_15f

    :cond_15d
    const-string v4, "\u7de8\u8f2f NG \u898f\u5247"

    :goto_15f
    invoke-static {v6, v2, v3, v4}, Le/e/a/FilterEditor110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x104000a

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/high16 v1, 0x1040000

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v12

    invoke-static {v12}, Le/e/a/PlaybackSession;->showForm(Landroid/app/AlertDialog;)V

    const/4 v0, -0x1

    invoke-virtual {v12, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v11

    new-instance v9, Le/e/a/FilterEditor110$$ExternalSyntheticLambda3;

    move-object v0, v9

    move-object/from16 v1, v18

    move-object v2, v8

    move-object/from16 v3, v16

    move-object v4, v13

    move-object v5, v6

    move-object v6, v15

    move-object v8, v10

    move-object v15, v9

    move-object/from16 v9, p2

    move-object/from16 v10, p1

    move-object v13, v11

    move-object/from16 v11, p0

    move-object v14, v13

    move-object/from16 v13, p4

    invoke-direct/range {v0 .. v13}, Le/e/a/FilterEditor110$$ExternalSyntheticLambda3;-><init>(Landroid/widget/EditText;Landroid/widget/EditText;[Ljava/lang/String;Landroid/widget/RadioGroup;Landroid/content/Context;[ILorg/json/JSONObject;Landroid/widget/CheckBox;Lorg/json/JSONObject;Lorg/json/JSONArray;Landroid/app/Activity;Landroid/app/AlertDialog;Ljava/lang/Runnable;)V

    invoke-virtual {v14, v15}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :cond_1a3
    if-nez v0, :cond_1a7

    move-object v5, v9

    goto :goto_1a9

    :cond_1a7
    move-object/from16 v5, v19

    :goto_1a9
    new-instance v2, Le/e/a/FilterEditor110$$ExternalSyntheticLambda2;

    move-object v4, v9

    move-object v9, v2

    move-object/from16 v20, v10

    move-object v10, v12

    move-object/from16 v21, v11

    move-object v11, v15

    move-object/from16 v22, v12

    move-object/from16 v12, v18

    move/from16 v23, v1

    move-object v1, v13

    move v13, v0

    move-object/from16 v14, v17

    invoke-direct/range {v9 .. v14}, Le/e/a/FilterEditor110$$ExternalSyntheticLambda2;-><init>([Ljava/lang/String;[ILandroid/widget/EditText;ILjava/lang/Runnable;)V

    invoke-virtual {v5, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    add-int/lit8 v0, v0, 0x1

    move-object/from16 v14, p0

    move-object v13, v1

    move-object v9, v4

    move-object/from16 v10, v20

    move-object/from16 v11, v21

    move-object/from16 v12, v22

    goto/16 :goto_138

    :cond_1d1
    move-object/from16 v19, v5

    move-object v4, v9

    move-object/from16 v20, v10

    move-object/from16 v21, v11

    move-object/from16 v22, v12

    move-object v2, v13

    const/16 v23, 0x2

    new-instance v5, Landroid/widget/RadioButton;

    invoke-direct {v5, v6}, Landroid/widget/RadioButton;-><init>(Landroid/content/Context;)V

    add-int/lit8 v8, v0, 0x64

    invoke-virtual {v5, v8}, Landroid/widget/RadioButton;->setId(I)V

    aget-object v8, v16, v0

    invoke-static {v6, v8}, Le/e/a/FilterUi110;->mode(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    invoke-static {v5}, Le/e/a/PanelUi;->tint(Landroid/widget/CompoundButton;)V

    invoke-virtual {v2, v5}, Landroid/widget/RadioGroup;->addView(Landroid/view/View;)V

    aget-object v8, v16, v0

    const-string v9, "mode"

    invoke-virtual {v7, v9, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_207

    invoke-virtual {v5, v1}, Landroid/widget/RadioButton;->setChecked(Z)V

    :cond_207
    add-int/lit8 v0, v0, 0x1

    move-object/from16 v14, p0

    move-object v13, v2

    move-object v9, v4

    move-object/from16 v5, v19

    move-object/from16 v10, v20

    move-object/from16 v11, v21

    move-object/from16 v12, v22

    const/4 v8, 0x0

    goto/16 :goto_bc
.end method

.method static synthetic lambda$0(Landroid/widget/EditText;Landroid/view/View;)V
    .registers 2

    .line 11
    const-string p1, ""

    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static synthetic lambda$1(Landroid/widget/Button;[ILandroid/content/Context;Landroid/widget/Button;Landroid/widget/EditText;)V
    .registers 7

    .line 11
    const/4 v0, 0x0

    aget v1, p1, v0

    if-nez v1, :cond_a

    invoke-static {p2}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v1

    goto :goto_e

    :cond_a
    invoke-static {p2}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result v1

    :goto_e
    invoke-virtual {p0, v1}, Landroid/widget/Button;->setTextColor(I)V

    aget p0, p1, v0

    const/4 v1, 0x1

    if-ne p0, v1, :cond_1b

    invoke-static {p2}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result p0

    goto :goto_1f

    :cond_1b
    invoke-static {p2}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result p0

    :goto_1f
    invoke-virtual {p3, p0}, Landroid/widget/Button;->setTextColor(I)V

    aget p0, p1, v0

    if-ne p0, v1, :cond_27

    goto :goto_29

    :cond_27
    const/16 v0, 0x8

    :goto_29
    invoke-virtual {p4, v0}, Landroid/widget/EditText;->setVisibility(I)V

    return-void
.end method

.method static synthetic lambda$2([Ljava/lang/String;[ILandroid/widget/EditText;ILjava/lang/Runnable;Landroid/view/View;)V
    .registers 8

    .line 11
    const/4 p5, 0x0

    aget v0, p1, p5

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    aput-object v1, p0, v0

    aput p3, p1, p5

    aget-object p0, p0, p3

    invoke-virtual {p2, p0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-interface {p4}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$3(Landroid/widget/EditText;Landroid/widget/EditText;[Ljava/lang/String;Landroid/widget/RadioGroup;Landroid/content/Context;[ILorg/json/JSONObject;Landroid/widget/CheckBox;Lorg/json/JSONObject;Lorg/json/JSONArray;Landroid/app/Activity;Landroid/app/AlertDialog;Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 25

    .line 11
    move-object v1, p0

    move-object v2, p4

    move-object/from16 v0, p6

    move-object/from16 v3, p9

    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p3}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result v6

    add-int/lit8 v6, v6, -0x64

    const/4 v7, 0x0

    invoke-static {v7, v6}, Ljava/lang/Math;->max(II)I

    move-result v6

    aget-object v6, p2, v6

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_3f

    const-string v0, "Enter a value"

    const-string v3, "\u8acb\u8f38\u5165\u6587\u5b57"

    const-string v4, "\u6587\u5b57\u3092\u5165\u529b\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p4, v4, v0, v3}, Le/e/a/FilterEditor110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    return-void

    :cond_3f
    aget v8, p5, v7

    const/4 v9, 0x1

    if-ne v8, v9, :cond_61

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_61

    const-string v8, "[0-9]+"

    invoke-virtual {v5, v8}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_61

    const-string v0, "Enter digits"

    const-string v1, "\u8acb\u8f38\u5165\u6578\u5b57"

    const-string v3, "\u6570\u5b57\u3067\u5165\u529b\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p4, v3, v0, v1}, Le/e/a/FilterEditor110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move-object v1, p1

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    return-void

    :cond_61
    :try_start_61
    const-string v8, "regex"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6c

    invoke-static {v4}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    :cond_6c
    const-string v8, "category"

    aget v10, p5, v7

    invoke-virtual {v0, v8, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v8

    const-string v10, "value"

    invoke-virtual {v8, v10, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v8, "mode"

    invoke-virtual {v4, v8, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v6, "enabled"

    invoke-virtual/range {p7 .. p7}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v8

    invoke-virtual {v4, v6, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    aget v4, p5, v7
    :try_end_8b
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_61 .. :try_end_8b} :catch_b9
    .catch Lorg/json/JSONException; {:try_start_61 .. :try_end_8b} :catch_b0

    const-string v6, "userId"

    if-ne v4, v9, :cond_93

    :try_start_8f
    invoke-virtual {v0, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_96

    :cond_93
    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    :goto_96
    if-nez p8, :cond_a4

    const-string v4, "date"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-virtual {v0, v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    invoke-virtual {v3, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :cond_a4
    move-object/from16 v0, p10

    invoke-static {v0, v3}, Le/e/a/ContentFilter;->save(Landroid/content/Context;Lorg/json/JSONArray;)V

    invoke-virtual/range {p11 .. p11}, Landroid/app/AlertDialog;->dismiss()V

    invoke-interface/range {p12 .. p12}, Ljava/lang/Runnable;->run()V
    :try_end_af
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_8f .. :try_end_af} :catch_b9
    .catch Lorg/json/JSONException; {:try_start_8f .. :try_end_af} :catch_b0

    goto :goto_c7

    :catch_b0
    move-exception v0

    const-string v1, "nicoid-filter"

    const-string v2, "Cannot save rule"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_c7

    :catch_b9
    move-exception v0

    const-string v0, "Invalid regular expression"

    const-string v3, "\u6b63\u898f\u8868\u793a\u5f0f\u7121\u6548"

    const-string v4, "\u6b63\u898f\u8868\u73fe\u304c\u4e0d\u6b63\u3067\u3059"

    invoke-static {p4, v4, v0, v3}, Le/e/a/FilterEditor110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    :goto_c7
    return-void
.end method

.method public static prepare(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 3

    .line 7
    sget-object p1, Le/e/a/FilterEditor110;->ROWS:Ljava/util/WeakHashMap;

    invoke-static {p0}, Le/e/a/UiDialogs;->owner(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p1, p0, p2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 10
    invoke-static {p0, p1, p2, p3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
