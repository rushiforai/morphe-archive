.class public final Le/e/a/ContentFilter;
.super Ljava/lang/Object;
.source "ContentFilter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/ContentFilter$Rules;
    }
.end annotation


# static fields
.field private static final CHANNELS:Ljava/lang/String; = "nicoid_content_channels"

.field private static final KEY:Ljava/lang/String; = "nicoid_content_keywords"

.field private static final STORE:Ljava/lang/String; = "nicoid_content_rules_v2"

.field private static volatile compiled:Le/e/a/ContentFilter$Rules;

.field private static volatile rowOwner:Ljava/lang/reflect/Field;

.field private static volatile rowValue:Ljava/lang/reflect/Method;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static blocked(Landroid/content/Context;Ljava/lang/String;)Z
    .registers 3

    .line 12
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Le/e/a/ContentFilter;->blocked(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static blocked(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 3

    .line 12
    invoke-static {p0}, Le/e/a/ContentFilter;->rules(Landroid/content/Context;)Le/e/a/ContentFilter$Rules;

    move-result-object p0

    invoke-virtual {p0, p1, p2}, Le/e/a/ContentFilter$Rules;->blocked(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private static category(Landroid/content/Context;I)Ljava/lang/String;
    .registers 4

    .line 13
    if-nez p1, :cond_9

    const-string p1, "Video titles"

    const-string v0, "\u5f71\u7247\u6a19\u984c"

    const-string v1, "\u52d5\u753b\u30bf\u30a4\u30c8\u30eb"

    goto :goto_f

    :cond_9
    const-string p1, "Uploaders / channels"

    const-string v0, "\u6295\u7a3f\u8005\uff0f\u983b\u9053\u540d\u7a31"

    const-string v1, "\u6295\u7a3f\u8005\u30fb\u30c1\u30e3\u30f3\u30cd\u30eb\u540d"

    :goto_f
    invoke-static {p0, v1, p1, v0}, Le/e/a/ContentFilter;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static edit(Landroid/preference/PreferenceActivity;Lorg/json/JSONArray;IILjava/lang/Runnable;)V
    .registers 19

    .line 18
    invoke-static {p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v4

    if-gez p2, :cond_c

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    goto :goto_10

    :cond_c
    invoke-virtual/range {p1 .. p2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    :goto_10
    invoke-static {v4}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v1

    const/16 v2, 0x10

    invoke-static {v4, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-static {v4, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    const/4 v5, 0x0

    invoke-virtual {v1, v3, v5, v2, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v6, Landroid/widget/CheckBox;

    invoke-direct {v6, v4}, Landroid/widget/CheckBox;-><init>(Landroid/content/Context;)V

    const-string v2, "Enabled"

    const-string v3, "\u555f\u7528"

    const-string v7, "\u6709\u52b9"

    invoke-static {v4, v7, v2, v3}, Le/e/a/ContentFilter;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v2}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    const-string v2, "enabled"

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-virtual {v6, v2}, Landroid/widget/CheckBox;->setChecked(Z)V

    invoke-static {v6}, Le/e/a/PanelUi;->tint(Landroid/widget/CompoundButton;)V

    invoke-virtual {v1, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    const-string v2, "category"

    move/from16 v7, p3

    invoke-virtual {v0, v2, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v2

    filled-new-array {v2}, [I

    move-result-object v7

    new-instance v2, Ljava/lang/StringBuilder;

    aget v8, v7, v5

    invoke-static {v4, v8}, Le/e/a/ContentFilter;->category(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v2, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v8, " \u25be"

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v2

    new-instance v8, Le/e/a/ContentFilter$$ExternalSyntheticLambda7;

    invoke-direct {v8, v4, v7, v2}, Le/e/a/ContentFilter$$ExternalSyntheticLambda7;-><init>(Landroid/content/Context;[ILandroid/widget/Button;)V

    invoke-virtual {v2, v8}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v8, Landroid/widget/RadioGroup;

    invoke-direct {v8, v4}, Landroid/widget/RadioGroup;-><init>(Landroid/content/Context;)V

    const-string v2, "exact"

    const-string v9, "regex"

    const-string v10, "partial"

    filled-new-array {v10, v2, v9}, [Ljava/lang/String;

    move-result-object v2

    :goto_87
    const/4 v9, 0x3

    if-lt v5, v9, :cond_117

    invoke-virtual {v1, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v3, Landroid/widget/EditText;

    invoke-direct {v3, v4}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    const-string v5, "value"

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-static {v4}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result v0

    invoke-virtual {v3, v0}, Landroid/widget/EditText;->setTextColor(I)V

    invoke-static {v4}, Le/e/a/ThemeChoice;->accent(Landroid/content/Context;)I

    move-result v0

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/EditText;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    const/4 v0, 0x2

    invoke-virtual {v3, v0}, Landroid/widget/EditText;->setMinLines(I)V

    const v0, 0x20001

    invoke-virtual {v3, v0}, Landroid/widget/EditText;->setInputType(I)V

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, v4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v5, "Edit NG rule"

    const-string v9, "\u7de8\u8f2f NG \u898f\u5247"

    const-string v10, "NG\u7de8\u96c6"

    invoke-static {v4, v10, v5, v9}, Le/e/a/ContentFilter;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "OK"

    const/4 v5, 0x0

    invoke-virtual {v0, v1, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Cancel"

    const-string v9, "\u53d6\u6d88"

    const-string v10, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {v4, v10, v1, v9}, Le/e/a/ContentFilter;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v11

    invoke-static {v11}, Le/e/a/PlaybackSession;->showForm(Landroid/app/AlertDialog;)V

    invoke-static {v4}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result v0

    invoke-virtual {v3, v0}, Landroid/widget/EditText;->setTextColor(I)V

    invoke-static {p0}, Le/e/a/ThemeChoice;->accent(Landroid/content/Context;)I

    move-result v0

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/EditText;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    const/4 v0, -0x1

    invoke-virtual {v11, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v12

    new-instance v13, Le/e/a/ContentFilter$$ExternalSyntheticLambda8;

    move-object v0, v13

    move-object v1, v3

    move-object v3, v8

    move-object v5, v7

    move/from16 v7, p2

    move-object v8, p1

    move-object v9, p0

    move-object/from16 v10, p4

    invoke-direct/range {v0 .. v11}, Le/e/a/ContentFilter$$ExternalSyntheticLambda8;-><init>(Landroid/widget/EditText;[Ljava/lang/String;Landroid/widget/RadioGroup;Landroid/content/Context;[ILandroid/widget/CheckBox;ILorg/json/JSONArray;Landroid/preference/PreferenceActivity;Ljava/lang/Runnable;Landroid/app/AlertDialog;)V

    invoke-virtual {v12, v13}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :cond_117
    new-instance v9, Landroid/widget/RadioButton;

    invoke-direct {v9, v4}, Landroid/widget/RadioButton;-><init>(Landroid/content/Context;)V

    add-int/lit8 v11, v5, 0x64

    invoke-virtual {v9, v11}, Landroid/widget/RadioButton;->setId(I)V

    aget-object v11, v2, v5

    invoke-static {v4, v11}, Le/e/a/ContentFilter;->mode(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v11}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    invoke-static {v9}, Le/e/a/PanelUi;->tint(Landroid/widget/CompoundButton;)V

    invoke-virtual {v8, v9}, Landroid/widget/RadioGroup;->addView(Landroid/view/View;)V

    const-string v11, "mode"

    invoke-virtual {v0, v11, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    aget-object v12, v2, v5

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_141

    invoke-virtual {v9, v3}, Landroid/widget/RadioButton;->setChecked(Z)V

    :cond_141
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_87
.end method

.method public static filter(Ljava/lang/Object;)V
    .registers 13

    .line 58
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 59
    const-string v1, "d"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Context;

    .line 60
    invoke-static {v1}, Le/e/a/ContentFilter;->rules(Landroid/content/Context;)Le/e/a/ContentFilter$Rules;

    move-result-object v1

    .line 61
    invoke-virtual {v1}, Le/e/a/ContentFilter$Rules;->empty()Z

    move-result v2

    if-eqz v2, :cond_1b

    return-void

    .line 62
    :cond_1b
    const-string v2, "b"

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/ArrayList;

    .line 63
    sget-object v0, Le/e/a/ContentFilter;->rowValue:Ljava/lang/reflect/Method;

    sget-object v2, Le/e/a/ContentFilter;->rowOwner:Ljava/lang/reflect/Field;

    .line 64
    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v0, :cond_31

    if-nez v2, :cond_50

    .line 65
    :cond_31
    const-string v0, "e.e.a.x1"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 66
    const-string v2, "a"

    new-array v5, v4, [Ljava/lang/Class;

    const-class v6, Ljava/lang/String;

    aput-object v6, v5, v3

    invoke-virtual {v0, v2, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    const-string v5, "y"

    invoke-virtual {v0, v5}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 67
    sput-object v2, Le/e/a/ContentFilter;->rowValue:Ljava/lang/reflect/Method;

    sput-object v0, Le/e/a/ContentFilter;->rowOwner:Ljava/lang/reflect/Field;

    move-object v11, v2

    move-object v2, v0

    move-object v0, v11

    .line 69
    :cond_50
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v5

    sub-int/2addr v5, v4

    :goto_55
    if-gez v5, :cond_59

    .line 77
    nop

    .line 80
    return-void

    .line 70
    :cond_59
    invoke-virtual {p0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    .line 71
    new-array v7, v4, [Ljava/lang/Object;

    const-string v8, "title"

    aput-object v8, v7, v3

    invoke-virtual {v0, v6, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 72
    new-array v8, v4, [Ljava/lang/Object;

    const-string v9, "videourl"

    aput-object v9, v8, v3

    invoke-virtual {v0, v6, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .line 73
    invoke-virtual {v2, v6}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 74
    if-eqz v8, :cond_a8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    const-string v10, "/watch/"

    invoke-virtual {v9, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_8f

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v9, "/shorts/"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_a8

    .line 75
    :cond_8f
    const/4 v8, 0x0

    if-nez v7, :cond_94

    move-object v7, v8

    goto :goto_98

    :cond_94
    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    :goto_98
    if-nez v6, :cond_9b

    goto :goto_9f

    :cond_9b
    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    :goto_9f
    invoke-virtual {v1, v7, v8}, Le/e/a/ContentFilter$Rules;->blocked(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_a8

    invoke-virtual {p0, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    :try_end_a8
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_a8} :catch_ab

    .line 69
    :cond_a8
    add-int/lit8 v5, v5, -0x1

    goto :goto_55

    .line 77
    :catch_ab
    move-exception p0

    .line 78
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Unsupported video list"

    invoke-direct {v0, v1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method static synthetic lambda$0(Landroid/preference/PreferenceActivity;Landroid/preference/Preference;)Z
    .registers 2

    .line 6
    invoke-static {p0}, Le/e/a/ContentFilter;->list(Landroid/preference/PreferenceActivity;)V

    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$1(Landroid/widget/LinearLayout;[Landroid/widget/Button;Landroid/content/Context;[ILandroid/widget/Button;[ZLandroid/widget/Button;Landroid/widget/Button;Ljava/util/Set;Lorg/json/JSONArray;[Ljava/lang/Runnable;Landroid/preference/PreferenceActivity;)V
    .registers 28

    .line 16
    move-object/from16 v0, p0

    move-object/from16 v10, p2

    move-object/from16 v1, p6

    invoke-virtual/range {p0 .. p0}, Landroid/widget/LinearLayout;->removeAllViews()V

    const/4 v11, 0x0

    const/4 v2, 0x0

    :goto_b
    const/4 v3, 0x2

    if-lt v2, v3, :cond_16e

    aget-boolean v2, p5, v11

    const/16 v3, 0x8

    if-eqz v2, :cond_17

    const/16 v2, 0x8

    goto :goto_18

    :cond_17
    const/4 v2, 0x0

    :goto_18
    move-object/from16 v4, p4

    invoke-virtual {v4, v2}, Landroid/widget/Button;->setVisibility(I)V

    aget-boolean v2, p5, v11

    if-eqz v2, :cond_23

    const/4 v2, 0x0

    goto :goto_25

    :cond_23
    const/16 v2, 0x8

    :goto_25
    invoke-virtual {v1, v2}, Landroid/widget/Button;->setVisibility(I)V

    aget-boolean v2, p5, v11

    if-eqz v2, :cond_2d

    const/4 v3, 0x0

    :cond_2d
    move-object/from16 v5, p7

    invoke-virtual {v5, v3}, Landroid/widget/Button;->setVisibility(I)V

    invoke-interface/range {p8 .. p8}, Ljava/util/Set;->isEmpty()Z

    move-result v2

    const/4 v12, 0x1

    xor-int/2addr v2, v12

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setEnabled(Z)V

    const/4 v1, 0x0

    const/4 v13, 0x0

    :goto_3d
    invoke-virtual/range {p9 .. p9}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-lt v13, v2, :cond_59

    if-nez v1, :cond_58

    const-string v1, "No rules"

    const-string v2, "\u5c1a\u7121\u898f\u5247"

    const-string v3, "\u767b\u9332\u3055\u308c\u305f\u9805\u76ee\u306f\u3042\u308a\u307e\u305b\u3093"

    invoke-static {v10, v3, v1, v2}, Le/e/a/ContentFilter;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0xe

    invoke-static {v10, v1, v2}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :cond_58
    return-void

    :cond_59
    move-object/from16 v14, p9

    invoke-virtual {v14, v13}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v9

    if-eqz v9, :cond_168

    const-string v2, "category"

    invoke-virtual {v9, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    aget v3, p3, v11

    if-eq v2, v3, :cond_6d

    goto/16 :goto_168

    :cond_6d
    add-int/lit8 v15, v1, 0x1

    invoke-static/range {p2 .. p2}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v8

    new-instance v1, Ljava/lang/StringBuilder;

    aget-boolean v2, p5, v11

    if-eqz v2, :cond_8b

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    move-object/from16 v7, p8

    invoke-interface {v7, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_88

    const-string v2, "\u2713 "

    goto :goto_8f

    :cond_88
    const-string v2, "\u25a1 "

    goto :goto_8f

    :cond_8b
    move-object/from16 v7, p8

    const-string v2, ""

    :goto_8f
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "value"

    invoke-virtual {v9, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x10

    invoke-static {v10, v1, v2}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v8, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "enabled"

    invoke-virtual {v9, v2, v12}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_be

    const-string v2, "Enabled"

    const-string v3, "\u555f\u7528"

    const-string v4, "\u6709\u52b9"

    goto :goto_c4

    :cond_be
    const-string v2, "Disabled"

    const-string v3, "\u505c\u7528"

    const-string v4, "\u7121\u52b9"

    :goto_c4
    invoke-static {v10, v4, v2, v3}, Le/e/a/ContentFilter;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, " \u00b7 "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "mode"

    const-string v3, "partial"

    invoke-virtual {v9, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v10, v2}, Le/e/a/ContentFilter;->mode(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "date"

    invoke-virtual {v9, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-lez v6, :cond_130

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "   "

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static/range {p2 .. p2}, Landroid/text/format/DateFormat;->getDateFormat(Landroid/content/Context;)Ljava/text/DateFormat;

    move-result-object v4

    new-instance v5, Ljava/util/Date;

    invoke-direct {v5, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v4, v5}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, " "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static/range {p2 .. p2}, Landroid/text/format/DateFormat;->getTimeFormat(Landroid/content/Context;)Ljava/text/DateFormat;

    move-result-object v4

    new-instance v5, Ljava/util/Date;

    invoke-direct {v5, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v4, v5}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_130
    const/16 v2, 0xc

    invoke-static {v10, v1, v2}, Le/e/a/PanelUi;->text(Landroid/content/Context;Ljava/lang/String;I)Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v8, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v6, Le/e/a/ContentFilter$$ExternalSyntheticLambda9;

    move-object v1, v6

    move-object/from16 v2, p5

    move-object/from16 v3, p8

    move v4, v13

    move-object/from16 v5, p10

    move-object v12, v6

    move-object/from16 v6, p11

    move-object/from16 v7, p9

    move-object v11, v8

    move-object/from16 v8, p3

    invoke-direct/range {v1 .. v8}, Le/e/a/ContentFilter$$ExternalSyntheticLambda9;-><init>([ZLjava/util/Set;I[Ljava/lang/Runnable;Landroid/preference/PreferenceActivity;Lorg/json/JSONArray;[I)V

    invoke-virtual {v11, v12}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v12, Le/e/a/ContentFilter$$ExternalSyntheticLambda10;

    move-object v1, v12

    move-object/from16 v6, p2

    move-object v7, v9

    move-object/from16 v8, p9

    move-object/from16 v9, p11

    invoke-direct/range {v1 .. v9}, Le/e/a/ContentFilter$$ExternalSyntheticLambda10;-><init>([ZLjava/util/Set;I[Ljava/lang/Runnable;Landroid/content/Context;Lorg/json/JSONObject;Lorg/json/JSONArray;Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v11, v12}, Landroid/widget/LinearLayout;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    invoke-virtual {v0, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-static/range {p0 .. p0}, Le/e/a/PanelUi;->divider(Landroid/widget/LinearLayout;)V

    move v1, v15

    :cond_168
    :goto_168
    add-int/lit8 v13, v13, 0x1

    const/4 v11, 0x0

    const/4 v12, 0x1

    goto/16 :goto_3d

    :cond_16e
    move-object/from16 v4, p4

    move-object/from16 v5, p7

    move-object/from16 v14, p9

    aget-object v3, p1, v2

    invoke-static {v3}, Le/e/a/ThemeChoice;->button(Landroid/widget/Button;)V

    aget-object v3, p1, v2

    invoke-static/range {p2 .. p2}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result v6

    invoke-virtual {v3, v6}, Landroid/widget/Button;->setTextColor(I)V

    aget-object v3, p1, v2

    const/4 v6, 0x0

    aget v7, p3, v6

    if-ne v2, v7, :cond_197

    invoke-static/range {p2 .. p2}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v7

    if-eqz v7, :cond_193

    const v7, -0xbbb7af

    goto :goto_1a4

    :cond_193
    const v7, -0x2a2621

    goto :goto_1a4

    :cond_197
    invoke-static/range {p2 .. p2}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v7

    if-eqz v7, :cond_1a1

    const v7, -0xd6d3ce

    goto :goto_1a4

    :cond_1a1
    const v7, -0x111112

    :goto_1a4
    invoke-static {v7}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v7

    invoke-virtual {v3, v7}, Landroid/widget/Button;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    add-int/lit8 v2, v2, 0x1

    const/4 v11, 0x0

    goto/16 :goto_b
.end method

.method static synthetic lambda$10(Ljava/util/Set;Lorg/json/JSONArray;Landroid/preference/PreferenceActivity;[Z[Ljava/lang/Runnable;Landroid/content/DialogInterface;I)V
    .registers 7

    .line 17
    new-instance p5, Ljava/util/ArrayList;

    invoke-direct {p5, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {}, Ljava/util/Collections;->reverseOrder()Ljava/util/Comparator;

    move-result-object p6

    invoke-static {p5, p6}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    invoke-virtual {p5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p5

    :goto_10
    invoke-interface {p5}, Ljava/util/Iterator;->hasNext()Z

    move-result p6

    if-nez p6, :cond_25

    invoke-static {p2, p1}, Le/e/a/ContentFilter;->save(Landroid/content/Context;Lorg/json/JSONArray;)V

    invoke-interface {p0}, Ljava/util/Set;->clear()V

    const/4 p0, 0x0

    aput-boolean p0, p3, p0

    aget-object p0, p4, p0

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void

    :cond_25
    invoke-interface {p5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p6

    check-cast p6, Ljava/lang/Integer;

    invoke-virtual {p6}, Ljava/lang/Integer;->intValue()I

    move-result p6

    invoke-virtual {p1, p6}, Lorg/json/JSONArray;->remove(I)Ljava/lang/Object;

    goto :goto_10
.end method

.method static synthetic lambda$11(Landroid/preference/PreferenceActivity;Lorg/json/JSONArray;Landroid/content/Context;Landroid/content/DialogInterface;)V
    .registers 6

    .line 17
    const-string p3, "nicoid_filter_list"

    invoke-virtual {p0, p3}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object p0

    if-eqz p0, :cond_2a

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p3, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p1, " rules: applies when the next list loads"

    const-string v0, "\u9805\uff1a\u4e0b\u6b21\u8f09\u5165\u6e05\u55ae\u6642\u5957\u7528"

    const-string v1, "\u4ef6\uff1a\u6b21\u306e\u4e00\u89a7\u8aad\u307f\u8fbc\u307f\u304b\u3089\u53cd\u6620"

    invoke-static {p2, v1, p1, v0}, Le/e/a/ContentFilter;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    :cond_2a
    return-void
.end method

.method static synthetic lambda$12(Landroid/content/Context;[ILandroid/widget/Button;Landroid/view/View;)V
    .registers 8

    .line 18
    const/4 p3, 0x0

    invoke-static {p0, p3}, Le/e/a/ContentFilter;->category(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v1}, Le/e/a/ContentFilter;->category(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    new-instance v1, Le/e/a/ContentFilter$1;

    const v2, 0x109000f

    invoke-direct {v1, p0, v2, v0, p0}, Le/e/a/ContentFilter$1;-><init>(Landroid/content/Context;I[Ljava/lang/String;Landroid/content/Context;)V

    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    aget p3, p1, p3

    new-instance v3, Le/e/a/ContentFilter$$ExternalSyntheticLambda14;

    invoke-direct {v3, p1, p2, v0}, Le/e/a/ContentFilter$$ExternalSyntheticLambda14;-><init>([ILandroid/widget/Button;[Ljava/lang/String;)V

    invoke-virtual {v2, v1, p3, v3}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems(Landroid/widget/ListAdapter;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string p2, "Cancel"

    const-string p3, "\u53d6\u6d88"

    const-string v0, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {p0, v0, p2, p3}, Le/e/a/ContentFilter;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 p2, 0x0

    invoke-virtual {p1, p0, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-static {p0}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    return-void
.end method

.method static synthetic lambda$13([ILandroid/widget/Button;[Ljava/lang/String;Landroid/content/DialogInterface;I)V
    .registers 6

    .line 18
    const/4 v0, 0x0

    aput p4, p0, v0

    new-instance p0, Ljava/lang/StringBuilder;

    aget-object p2, p2, p4

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p2, " \u25be"

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    invoke-interface {p3}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method static synthetic lambda$14(Landroid/widget/EditText;[Ljava/lang/String;Landroid/widget/RadioGroup;Landroid/content/Context;[ILandroid/widget/CheckBox;ILorg/json/JSONArray;Landroid/preference/PreferenceActivity;Ljava/lang/Runnable;Landroid/app/AlertDialog;Landroid/view/View;)V
    .registers 14

    .line 18
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p11

    invoke-virtual {p11}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p11

    invoke-virtual {p2}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result p2

    add-int/lit8 p2, p2, -0x64

    const/4 v0, 0x0

    invoke-static {v0, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    aget-object p1, p1, p2

    invoke-virtual {p11}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_2d

    const-string p1, "Enter a value"

    const-string p2, "\u8acb\u8f38\u5165\u6587\u5b57"

    const-string p4, "\u6587\u5b57\u3092\u5165\u529b\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p3, p4, p1, p2}, Le/e/a/ContentFilter;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    return-void

    :cond_2d
    :try_start_2d
    const-string p2, "regex"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_38

    invoke-static {p11}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    :cond_38
    new-instance p2, Lorg/json/JSONObject;

    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "value"

    invoke-virtual {p2, v1, p11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p2

    const-string p11, "mode"

    invoke-virtual {p2, p11, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    const-string p2, "category"

    aget p4, p4, v0

    invoke-virtual {p1, p2, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object p1

    const-string p2, "enabled"

    invoke-virtual {p5}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p4

    invoke-virtual {p1, p2, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p1

    const-string p2, "date"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p4

    invoke-virtual {p1, p2, p4, p5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    move-result-object p1

    if-gez p6, :cond_6b

    invoke-virtual {p7, p1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_6e

    :cond_6b
    invoke-virtual {p7, p6, p1}, Lorg/json/JSONArray;->put(ILjava/lang/Object;)Lorg/json/JSONArray;

    :goto_6e
    invoke-static {p8, p7}, Le/e/a/ContentFilter;->save(Landroid/content/Context;Lorg/json/JSONArray;)V

    invoke-interface {p9}, Ljava/lang/Runnable;->run()V

    invoke-virtual {p10}, Landroid/app/AlertDialog;->dismiss()V
    :try_end_77
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_2d .. :try_end_77} :catch_7a
    .catch Ljava/lang/Exception; {:try_start_2d .. :try_end_77} :catch_78

    goto :goto_88

    :catch_78
    move-exception p0

    goto :goto_88

    :catch_7a
    move-exception p1

    const-string p1, "Invalid regular expression"

    const-string p2, "\u6b63\u898f\u8868\u793a\u5f0f\u7121\u6548"

    const-string p4, "\u6b63\u898f\u8868\u73fe\u304c\u4e0d\u6b63\u3067\u3059"

    invoke-static {p3, p4, p1, p2}, Le/e/a/ContentFilter;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    :goto_88
    return-void
.end method

.method static synthetic lambda$2([ZLjava/util/Set;I[Ljava/lang/Runnable;Landroid/preference/PreferenceActivity;Lorg/json/JSONArray;[ILandroid/view/View;)V
    .registers 8

    .line 16
    const/4 p7, 0x0

    aget-boolean p0, p0, p7

    if-eqz p0, :cond_1c

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-interface {p1, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_16

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-interface {p1, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    :cond_16
    aget-object p0, p3, p7

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    goto :goto_23

    :cond_1c
    aget p0, p6, p7

    aget-object p1, p3, p7

    invoke-static {p4, p5, p2, p0, p1}, Le/e/a/ContentFilter;->edit(Landroid/preference/PreferenceActivity;Lorg/json/JSONArray;IILjava/lang/Runnable;)V

    :goto_23
    return-void
.end method

.method static synthetic lambda$3([ZLjava/util/Set;I[Ljava/lang/Runnable;Landroid/content/Context;Lorg/json/JSONObject;Lorg/json/JSONArray;Landroid/preference/PreferenceActivity;Landroid/view/View;)Z
    .registers 12

    .line 16
    const/4 p8, 0x0

    aget-boolean v0, p0, p8

    if-eqz v0, :cond_1c

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-interface {p1, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_16

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-interface {p1, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    :cond_16
    aget-object p0, p3, p8

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    goto :goto_71

    :cond_1c
    new-instance p8, Landroid/app/AlertDialog$Builder;

    invoke-direct {p8, p4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v0, "Delete rule"

    const-string v1, "\u522a\u9664\u898f\u5247"

    const-string v2, "\u9805\u76ee\u3092\u524a\u9664"

    invoke-static {p4, v2, v0, v1}, Le/e/a/ContentFilter;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p8, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p8

    const-string v0, "value"

    invoke-virtual {p5, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p5

    invoke-virtual {p8, p5}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p5

    const-string p8, "Delete"

    const-string v0, "\u522a\u9664"

    const-string v1, "\u524a\u9664"

    invoke-static {p4, v1, p8, v0}, Le/e/a/ContentFilter;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p8

    new-instance v0, Le/e/a/ContentFilter$$ExternalSyntheticLambda11;

    invoke-direct {v0, p6, p2, p7, p3}, Le/e/a/ContentFilter$$ExternalSyntheticLambda11;-><init>(Lorg/json/JSONArray;ILandroid/preference/PreferenceActivity;[Ljava/lang/Runnable;)V

    invoke-virtual {p5, p8, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p5

    const-string p6, "Select multiple"

    const-string p7, "\u9078\u53d6\u591a\u500b"

    const-string p8, "\u8907\u6570\u9078\u629e"

    invoke-static {p4, p8, p6, p7}, Le/e/a/ContentFilter;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p6

    new-instance p7, Le/e/a/ContentFilter$$ExternalSyntheticLambda12;

    invoke-direct {p7, p0, p1, p2, p3}, Le/e/a/ContentFilter$$ExternalSyntheticLambda12;-><init>([ZLjava/util/Set;I[Ljava/lang/Runnable;)V

    invoke-virtual {p5, p6, p7}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string p1, "Cancel"

    const-string p2, "\u53d6\u6d88"

    const-string p3, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {p4, p3, p1, p2}, Le/e/a/ContentFilter;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    :goto_71
    const/4 p0, 0x1

    return p0
.end method

.method static synthetic lambda$4(Lorg/json/JSONArray;ILandroid/preference/PreferenceActivity;[Ljava/lang/Runnable;Landroid/content/DialogInterface;I)V
    .registers 6

    .line 16
    invoke-virtual {p0, p1}, Lorg/json/JSONArray;->remove(I)Ljava/lang/Object;

    invoke-static {p2, p0}, Le/e/a/ContentFilter;->save(Landroid/content/Context;Lorg/json/JSONArray;)V

    const/4 p0, 0x0

    aget-object p0, p3, p0

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$5([ZLjava/util/Set;I[Ljava/lang/Runnable;Landroid/content/DialogInterface;I)V
    .registers 6

    .line 16
    const/4 p4, 0x1

    const/4 p5, 0x0

    aput-boolean p4, p0, p5

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-interface {p1, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    aget-object p0, p3, p5

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$6([IILjava/util/Set;[Z[Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 6

    .line 17
    const/4 p5, 0x0

    aput p1, p0, p5

    invoke-interface {p2}, Ljava/util/Set;->clear()V

    aput-boolean p5, p3, p5

    aget-object p0, p4, p5

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$7(Landroid/preference/PreferenceActivity;Lorg/json/JSONArray;[I[Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 5

    .line 17
    const/4 p4, 0x0

    aget p2, p2, p4

    aget-object p3, p3, p4

    const/4 p4, -0x1

    invoke-static {p0, p1, p4, p2, p3}, Le/e/a/ContentFilter;->edit(Landroid/preference/PreferenceActivity;Lorg/json/JSONArray;IILjava/lang/Runnable;)V

    return-void
.end method

.method static synthetic lambda$8(Ljava/util/Set;[Z[Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 4

    .line 17
    invoke-interface {p0}, Ljava/util/Set;->clear()V

    const/4 p0, 0x0

    aput-boolean p0, p1, p0

    aget-object p0, p2, p0

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$9(Landroid/content/Context;Ljava/util/Set;Lorg/json/JSONArray;Landroid/preference/PreferenceActivity;[Z[Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 15

    .line 17
    new-instance p6, Landroid/app/AlertDialog$Builder;

    invoke-direct {p6, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v0, "Delete selected rules?"

    const-string v1, "\u522a\u9664\u6240\u9078\u898f\u5247\uff1f"

    const-string v2, "\u9078\u629e\u3057\u305f\u9805\u76ee\u3092\u524a\u9664\u3057\u307e\u3059\u304b\uff1f"

    invoke-static {p0, v2, v0, v1}, Le/e/a/ContentFilter;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p6, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p6

    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p6, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p6

    const-string v0, "Delete"

    const-string v1, "\u522a\u9664"

    const-string v2, "\u524a\u9664"

    invoke-static {p0, v2, v0, v1}, Le/e/a/ContentFilter;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v7, Le/e/a/ContentFilter$$ExternalSyntheticLambda13;

    move-object v1, v7

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v1 .. v6}, Le/e/a/ContentFilter$$ExternalSyntheticLambda13;-><init>(Ljava/util/Set;Lorg/json/JSONArray;Landroid/preference/PreferenceActivity;[Z[Ljava/lang/Runnable;)V

    invoke-virtual {p6, v0, v7}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const-string p2, "Cancel"

    const-string p3, "\u53d6\u6d88"

    const-string p4, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    invoke-static {p0, p4, p2, p3}, Le/e/a/ContentFilter;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 p2, 0x0

    invoke-virtual {p1, p0, p2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    return-void
.end method

.method private static list(Landroid/preference/PreferenceActivity;)V
    .registers 33

    .line 15
    move-object/from16 v13, p0

    invoke-static/range {p0 .. p0}, Le/e/a/PlaybackSession;->dialogContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v14

    invoke-static/range {p0 .. p0}, Le/e/a/ContentFilter;->stored(Landroid/content/Context;)Lorg/json/JSONArray;

    move-result-object v15

    invoke-static {v14}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v0

    const/16 v1, 0xc

    invoke-static {v14, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v2

    invoke-static {v14, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    const/4 v12, 0x0

    invoke-virtual {v0, v2, v12, v1, v12}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v14}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-static {v14, v12}, Le/e/a/ContentFilter;->category(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v14, v2}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {v14, v3}, Le/e/a/ContentFilter;->category(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v14, v4}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v4

    const/4 v11, 0x2

    new-array v10, v11, [Landroid/widget/Button;

    aput-object v2, v10, v12

    aput-object v4, v10, v3

    const/4 v2, 0x0

    :goto_3a
    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v5, -0x2

    if-lt v2, v11, :cond_18c

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-instance v1, Landroid/widget/ScrollView;

    invoke-direct {v1, v14}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    invoke-static {v14}, Le/e/a/PanelUi;->column(Landroid/content/Context;)Landroid/widget/LinearLayout;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v7, 0x140

    invoke-static {v14, v7}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-virtual {v14}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v8

    iget v8, v8, Landroid/util/DisplayMetrics;->heightPixels:I

    div-int/2addr v8, v11

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v7

    const/4 v8, -0x1

    invoke-direct {v6, v8, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, v14}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const-string v6, "Add"

    const-string v7, "\u65b0\u589e"

    const-string v8, "\u8ffd\u52a0"

    invoke-static {v14, v8, v6, v7}, Le/e/a/ContentFilter;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v14, v6}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v9

    const-string v6, "Delete selected"

    const-string v7, "\u522a\u9664\u6240\u9078\u9805\u76ee"

    const-string v8, "\u9078\u629e\u3057\u305f\u9805\u76ee\u3092\u524a\u9664"

    invoke-static {v14, v8, v6, v7}, Le/e/a/ContentFilter;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v14, v6}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v8

    const-string v6, "Clear selection"

    const-string v7, "\u53d6\u6d88\u9078\u53d6"

    const-string v11, "\u9078\u629e\u89e3\u9664"

    invoke-static {v14, v11, v6, v7}, Le/e/a/ContentFilter;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v14, v6}, Le/e/a/PanelUi;->button(Landroid/content/Context;Ljava/lang/String;)Landroid/widget/Button;

    move-result-object v11

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v12, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v9, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v12, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v8, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v6, v12, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v11, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    new-array v7, v3, [I

    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    new-array v5, v3, [Z

    new-array v4, v3, [Ljava/lang/Runnable;

    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, v14}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v3, "NG list"

    const-string v12, "NG \u6e05\u55ae"

    move-object/from16 v18, v4

    const-string v4, "NG\u30ea\u30b9\u30c8"

    invoke-static {v14, v4, v3, v12}, Le/e/a/ContentFilter;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Close"

    const-string v3, "\u95dc\u9589"

    const-string v4, "\u9589\u3058\u308b"

    invoke-static {v14, v4, v1, v3}, Le/e/a/ContentFilter;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v12

    .line 16
    new-instance v19, Le/e/a/ContentFilter$$ExternalSyntheticLambda1;

    move-object/from16 v0, v19

    move-object v1, v2

    move-object v2, v10

    move-object v3, v14

    move-object/from16 v23, v18

    move-object v4, v7

    move-object/from16 v24, v5

    move-object v5, v9

    move-object/from16 v25, v6

    move-object/from16 v6, v24

    move-object/from16 v26, v14

    move-object v14, v7

    move-object v7, v8

    move-object/from16 v27, v8

    move-object v8, v11

    move-object/from16 v28, v9

    move-object/from16 v9, v25

    move-object/from16 v29, v10

    move-object v10, v15

    move-object/from16 v30, v11

    const/4 v13, 0x2

    move-object/from16 v11, v23

    move-object/from16 v31, v12

    const/4 v13, 0x0

    move-object/from16 v12, p0

    invoke-direct/range {v0 .. v12}, Le/e/a/ContentFilter$$ExternalSyntheticLambda1;-><init>(Landroid/widget/LinearLayout;[Landroid/widget/Button;Landroid/content/Context;[ILandroid/widget/Button;[ZLandroid/widget/Button;Landroid/widget/Button;Ljava/util/Set;Lorg/json/JSONArray;[Ljava/lang/Runnable;Landroid/preference/PreferenceActivity;)V

    move-object/from16 v7, v23

    aput-object v19, v7, v13

    .line 17
    const/4 v12, 0x0

    :goto_11e
    const/4 v6, 0x2

    if-lt v12, v6, :cond_163

    new-instance v0, Le/e/a/ContentFilter$$ExternalSyntheticLambda3;

    move-object/from16 v8, p0

    invoke-direct {v0, v8, v15, v14, v7}, Le/e/a/ContentFilter$$ExternalSyntheticLambda3;-><init>(Landroid/preference/PreferenceActivity;Lorg/json/JSONArray;[I[Ljava/lang/Runnable;)V

    move-object/from16 v9, v28

    invoke-virtual {v9, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Le/e/a/ContentFilter$$ExternalSyntheticLambda4;

    move-object/from16 v11, v24

    move-object/from16 v10, v25

    invoke-direct {v0, v10, v11, v7}, Le/e/a/ContentFilter$$ExternalSyntheticLambda4;-><init>(Ljava/util/Set;[Z[Ljava/lang/Runnable;)V

    move-object/from16 v1, v30

    invoke-virtual {v1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v9, Le/e/a/ContentFilter$$ExternalSyntheticLambda5;

    move-object v0, v9

    move-object/from16 v1, v26

    move-object v2, v10

    move-object v3, v15

    move-object/from16 v4, p0

    move-object v5, v11

    move-object v6, v7

    invoke-direct/range {v0 .. v6}, Le/e/a/ContentFilter$$ExternalSyntheticLambda5;-><init>(Landroid/content/Context;Ljava/util/Set;Lorg/json/JSONArray;Landroid/preference/PreferenceActivity;[Z[Ljava/lang/Runnable;)V

    move-object/from16 v0, v27

    invoke-virtual {v0, v9}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Le/e/a/ContentFilter$$ExternalSyntheticLambda6;

    move-object/from16 v2, v26

    invoke-direct {v0, v8, v15, v2}, Le/e/a/ContentFilter$$ExternalSyntheticLambda6;-><init>(Landroid/preference/PreferenceActivity;Lorg/json/JSONArray;Landroid/content/Context;)V

    move-object/from16 v3, v31

    invoke-virtual {v3, v0}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    aget-object v0, v7, v13

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    invoke-static {v3}, Le/e/a/PlaybackSession;->showDialog(Landroid/app/AlertDialog;)V

    return-void

    :cond_163
    move-object/from16 v8, p0

    move-object/from16 v11, v24

    move-object/from16 v10, v25

    move-object/from16 v2, v26

    move-object/from16 v0, v27

    move-object/from16 v9, v28

    move-object/from16 v1, v30

    move-object/from16 v3, v31

    aget-object v4, v29, v12

    new-instance v5, Le/e/a/ContentFilter$$ExternalSyntheticLambda2;

    move-object/from16 v17, v5

    move-object/from16 v18, v14

    move/from16 v19, v12

    move-object/from16 v20, v10

    move-object/from16 v21, v11

    move-object/from16 v22, v7

    invoke-direct/range {v17 .. v22}, Le/e/a/ContentFilter$$ExternalSyntheticLambda2;-><init>([IILjava/util/Set;[Z[Ljava/lang/Runnable;)V

    invoke-virtual {v4, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    add-int/lit8 v12, v12, 0x1

    goto :goto_11e

    .line 15
    :cond_18c
    move-object/from16 v29, v10

    move-object v8, v13

    move-object v12, v14

    const/4 v6, 0x2

    const/4 v13, 0x0

    aget-object v7, v29, v2

    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v9, v13, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v7, v9}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v2, v2, 0x1

    move-object v13, v8

    const/4 v11, 0x2

    const/4 v12, 0x0

    goto/16 :goto_3a
.end method

.method private static mode(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 14
    const-string v0, "regex"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_13

    const-string p1, "Regular expression"

    const-string v0, "\u6b63\u898f\u8868\u793a\u5f0f"

    const-string v1, "\u6b63\u898f\u8868\u73fe"

    :goto_e
    invoke-static {p0, v1, p1, v0}, Le/e/a/ContentFilter;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_29

    :cond_13
    const-string v0, "exact"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_22

    const-string p1, "Exact match"

    const-string v0, "\u5b8c\u5168\u76f8\u7b26"

    const-string v1, "\u5b8c\u5168\u4e00\u81f4"

    goto :goto_e

    :cond_22
    const-string p1, "Partial match"

    const-string v0, "\u90e8\u5206\u76f8\u7b26"

    const-string v1, "\u90e8\u5206\u4e00\u81f4"

    goto :goto_e

    :goto_29
    return-object p0
.end method

.method public static owner(Lorg/json/JSONObject;)Ljava/lang/String;
    .registers 10

    .line 23
    const-string v0, ""

    if-nez p0, :cond_5

    return-object v0

    .line 24
    :cond_5
    invoke-static {p0}, Le/e/a/PaidVideos;->remember(Lorg/json/JSONObject;)V

    .line 25
    const-string v1, "user"

    const-string v2, "channel"

    const-string v3, "owner"

    filled-new-array {v3, v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_14
    const/4 v4, 0x3

    if-lt v3, v4, :cond_2a

    .line 35
    const-string v1, "ownerName"

    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 36
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_29

    const-string v1, "uploaderName"

    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_29
    return-object v1

    .line 25
    :cond_2a
    aget-object v4, v1, v3

    .line 26
    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 27
    if-nez v4, :cond_33

    goto :goto_4a

    .line 28
    :cond_33
    const-string v5, "nickname"

    const-string v6, "name"

    filled-new-array {v5, v6}, [Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    :goto_3c
    const/4 v7, 0x2

    if-lt v6, v7, :cond_4d

    .line 32
    invoke-static {v4}, Le/e/a/ContentFilter;->owner(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v4

    .line 33
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_4a

    return-object v4

    .line 25
    :cond_4a
    :goto_4a
    add-int/lit8 v3, v3, 0x1

    goto :goto_14

    .line 28
    :cond_4d
    aget-object v7, v5, v6

    .line 29
    invoke-virtual {v4, v7, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 30
    invoke-virtual {v7}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_5a

    return-object v7

    .line 28
    :cond_5a
    add-int/lit8 v6, v6, 0x1

    goto :goto_3c
.end method

.method public static rememberHistory(Lorg/json/JSONObject;)V
    .registers 5

    .line 40
    :try_start_0
    const-string v0, "e.e.a.ModernPlayback"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "latestWatch"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    .line 41
    if-nez v0, :cond_16

    :goto_15
    goto :goto_1d

    :cond_16
    const-string v1, "video"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    goto :goto_15

    .line 42
    :goto_1d
    if-eqz v1, :cond_51

    const-string v2, "videourl"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "id"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Le/e/a/HistoryRules;->same(Ljava/lang/String;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_51

    .line 43
    const-string v1, "isPaymentRequired"

    invoke-static {v0}, Le/e/a/PaidVideos;->watchRequired(Lorg/json/JSONObject;)Z

    move-result v2

    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 44
    invoke-static {p0}, Le/e/a/PaidVideos;->remember(Lorg/json/JSONObject;)V

    .line 45
    invoke-static {v0}, Le/e/a/ContentFilter;->owner(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_51

    const-string v1, "ownerName"

    invoke-virtual {p0, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_4c
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_4c} :catch_4f
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_4c} :catch_4d

    goto :goto_50

    .line 48
    :catch_4d
    move-exception p0

    goto :goto_50

    :catch_4f
    move-exception p0

    :goto_50
    nop

    .line 49
    :cond_51
    return-void
.end method

.method public static restoreHistory(Ljava/lang/Object;Lorg/json/JSONObject;)V
    .registers 4

    .line 51
    invoke-static {p1}, Le/e/a/PaidVideos;->remember(Lorg/json/JSONObject;)V

    .line 52
    :try_start_3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "y"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-static {p1}, Le/e/a/ContentFilter;->owner(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_14
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_3 .. :try_end_14} :catch_15

    .line 54
    return-void

    .line 53
    :catch_15
    move-exception p0

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Unsupported history row"

    invoke-direct {p1, v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1
.end method

.method public static rules(Landroid/content/Context;)Le/e/a/ContentFilter$Rules;
    .registers 4

    .line 11
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "nicoid_content_rules_v2"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_13

    const-string p0, "[]"

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_1b

    :cond_13
    invoke-static {p0}, Le/e/a/ContentFilter;->stored(Landroid/content/Context;)Lorg/json/JSONArray;

    move-result-object p0

    invoke-virtual {p0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_1b
    sget-object v0, Le/e/a/ContentFilter;->compiled:Le/e/a/ContentFilter$Rules;

    if-eqz v0, :cond_28

    iget-object v1, v0, Le/e/a/ContentFilter$Rules;->snapshot:Ljava/lang/String;

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_28

    return-object v0

    :cond_28
    new-instance v0, Le/e/a/ContentFilter$Rules;

    invoke-direct {v0, p0}, Le/e/a/ContentFilter$Rules;-><init>(Ljava/lang/String;)V

    sput-object v0, Le/e/a/ContentFilter;->compiled:Le/e/a/ContentFilter$Rules;

    return-object v0
.end method

.method private static save(Landroid/content/Context;Lorg/json/JSONArray;)V
    .registers 3

    .line 8
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "nicoid_content_rules_v2"

    invoke-virtual {p1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    const/4 p0, 0x0

    sput-object p0, Le/e/a/ContentFilter;->compiled:Le/e/a/ContentFilter$Rules;

    return-void
.end method

.method public static settings(Landroid/preference/PreferenceActivity;)V
    .registers 7

    .line 6
    invoke-virtual {p0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    const-string v1, "nicoid_content_filter"

    invoke-virtual {p0, v1}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v2

    check-cast v2, Landroid/preference/PreferenceCategory;

    if-nez v2, :cond_47

    new-instance v3, Landroid/preference/PreferenceCategory;

    invoke-direct {v3, p0}, Landroid/preference/PreferenceCategory;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v1}, Landroid/preference/PreferenceCategory;->setKey(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v1

    const/4 v2, 0x0

    :goto_1b
    invoke-virtual {v0}, Landroid/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v4

    if-lt v2, v4, :cond_2d

    mul-int/lit8 v1, v1, 0x2

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v3, v1}, Landroid/preference/PreferenceCategory;->setOrder(I)V

    invoke-virtual {v0, v3}, Landroid/preference/PreferenceGroup;->addPreference(Landroid/preference/Preference;)Z

    move-object v2, v3

    goto :goto_47

    :cond_2d
    invoke-virtual {v0, v2}, Landroid/preference/PreferenceGroup;->getPreference(I)Landroid/preference/Preference;

    move-result-object v4

    mul-int/lit8 v5, v2, 0x2

    invoke-virtual {v4, v5}, Landroid/preference/Preference;->setOrder(I)V

    const-string v5, "comment"

    invoke-virtual {v4}, Landroid/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_44

    add-int/lit8 v1, v2, 0x1

    :cond_44
    add-int/lit8 v2, v2, 0x1

    goto :goto_1b

    :cond_47
    :goto_47
    const-string v0, "Other"

    const-string v1, "\u5176\u4ed6"

    const-string v3, "\u305d\u306e\u4ed6"

    invoke-static {p0, v3, v0, v1}, Le/e/a/ContentFilter;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/preference/PreferenceCategory;->setTitle(Ljava/lang/CharSequence;)V

    const-string v0, "nicoid_filter_list"

    invoke-virtual {p0, v0}, Landroid/preference/PreferenceActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    if-nez v1, :cond_a2

    new-instance v1, Landroid/preference/Preference;

    invoke-direct {v1, p0}, Landroid/preference/Preference;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setKey(Ljava/lang/String;)V

    const-string v0, "Content filter"

    const-string v3, "\u5167\u5bb9\u7be9\u9078"

    const-string v4, "\u30b3\u30f3\u30c6\u30f3\u30c4\u30d5\u30a3\u30eb\u30bf\u30fc"

    invoke-static {p0, v4, v0, v3}, Le/e/a/ContentFilter;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p0}, Le/e/a/ContentFilter;->stored(Landroid/content/Context;)Lorg/json/JSONArray;

    move-result-object v3

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, " rules: applies when the next list loads"

    const-string v4, "\u9805\uff1a\u4e0b\u6b21\u8f09\u5165\u6e05\u55ae\u6642\u5957\u7528"

    const-string v5, "\u4ef6\uff1a\u6b21\u306e\u4e00\u89a7\u8aad\u307f\u8fbc\u307f\u304b\u3089\u53cd\u6620"

    invoke-static {p0, v5, v3, v4}, Le/e/a/ContentFilter;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setSummary(Ljava/lang/CharSequence;)V

    new-instance v0, Le/e/a/ContentFilter$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Le/e/a/ContentFilter$$ExternalSyntheticLambda0;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v1, v0}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    invoke-virtual {v2, v1}, Landroid/preference/PreferenceCategory;->addPreference(Landroid/preference/Preference;)Z

    :cond_a2
    return-void
.end method

.method private static stored(Landroid/content/Context;)Lorg/json/JSONArray;
    .registers 11

    .line 7
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "nicoid_content_rules_v2"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1f

    :try_start_c
    new-instance p0, Lorg/json/JSONArray;

    const-string v2, "[]"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_17} :catch_18

    return-object p0

    :catch_18
    move-exception p0

    new-instance p0, Lorg/json/JSONArray;

    invoke-direct {p0}, Lorg/json/JSONArray;-><init>()V

    return-object p0

    :cond_1f
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_26
    const/4 v4, 0x2

    if-lt v3, v4, :cond_2a

    :goto_29
    goto :goto_72

    :cond_2a
    if-nez v3, :cond_2f

    :try_start_2c
    const-string v4, "nicoid_content_keywords"

    goto :goto_31

    :cond_2f
    const-string v4, "nicoid_content_channels"

    :goto_31
    const-string v5, ""

    invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Le/e/a/ContentFilterRules;->keywords(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    array-length v5, v4

    const/4 v6, 0x0

    :goto_3d
    if-lt v6, v5, :cond_42

    add-int/lit8 v3, v3, 0x1

    goto :goto_26

    :cond_42
    aget-object v7, v4, v6

    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    const-string v9, "category"

    invoke-virtual {v8, v9, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v8

    const-string v9, "value"

    invoke-virtual {v8, v9, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "mode"

    const-string v9, "partial"

    invoke-virtual {v7, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "enabled"

    const/4 v9, 0x1

    invoke-virtual {v7, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "date"

    invoke-virtual {v7, v8, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v7

    invoke-virtual {v1, v7}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_6d
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_6d} :catch_70

    add-int/lit8 v6, v6, 0x1

    goto :goto_3d

    :catch_70
    move-exception v0

    goto :goto_29

    :goto_72
    invoke-static {p0, v1}, Le/e/a/ContentFilter;->save(Landroid/content/Context;Lorg/json/JSONArray;)V

    return-object v1
.end method

.method private static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 5
    invoke-static {p0, p1, p2, p3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
