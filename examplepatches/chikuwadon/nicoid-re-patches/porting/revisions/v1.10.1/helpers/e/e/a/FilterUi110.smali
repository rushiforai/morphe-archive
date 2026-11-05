.class final Le/e/a/FilterUi110;
.super Ljava/lang/Object;
.source "FilterUi110.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/FilterUi110$Page;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static category(Landroid/content/Context;I)Ljava/lang/String;
    .registers 4

    .line 6
    if-nez p1, :cond_5

    const-string v0, "\u52d5\u753b\u30bf\u30a4\u30c8\u30eb"

    goto :goto_7

    :cond_5
    const-string v0, "\u6295\u7a3f\u8005\u30fb\u30c1\u30e3\u30f3\u30cd\u30eb\u540d"

    :goto_7
    if-nez p1, :cond_c

    const-string v1, "Video titles"

    goto :goto_e

    :cond_c
    const-string v1, "Uploaders / channels"

    :goto_e
    if-nez p1, :cond_13

    const-string p1, "\u5f71\u7247\u6a19\u984c"

    goto :goto_15

    :cond_13
    const-string p1, "\u6295\u7a3f\u8005\uff0f\u983b\u9053\u540d\u7a31"

    :goto_15
    invoke-static {p0, v0, v1, p1}, Le/e/a/FilterUi110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static date(J)Ljava/lang/String;
    .registers 5

    .line 8
    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-gtz v2, :cond_9

    const-string p0, "\u2014"

    goto :goto_1d

    :cond_9
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy/MM/dd HH:mm"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1, p0, p1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    :goto_1d
    return-object p0
.end method

.method static edit(Landroid/app/Activity;Lorg/json/JSONArray;Lorg/json/JSONObject;ILjava/lang/Runnable;)V
    .registers 5

    invoke-static/range {p0 .. p4}, Le/e/a/FilterEditor110;->edit(Landroid/app/Activity;Lorg/json/JSONArray;Lorg/json/JSONObject;ILjava/lang/Runnable;)V

    return-void
.end method

.method static synthetic lambda$0(Landroid/widget/LinearLayout;[I[Landroid/widget/Button;Landroid/content/Context;)V
    .registers 10

    .line 26
    const/4 v0, 0x0

    aget v1, p1, v0

    const/16 v2, 0x8

    const/4 v3, 0x1

    if-ne v1, v3, :cond_a

    const/4 v1, 0x0

    goto :goto_c

    :cond_a
    const/16 v1, 0x8

    :goto_c
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    const/4 p0, 0x0

    :goto_10
    const/4 v1, 0x2

    if-lt p0, v1, :cond_14

    return-void

    :cond_14
    aget-object v1, p2, p0

    invoke-static {v1}, Le/e/a/Ui110;->flat(Landroid/widget/Button;)V

    aget-object v1, p2, p0

    aget v4, p1, v0

    if-ne p0, v4, :cond_24

    invoke-static {p3}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v4

    goto :goto_28

    :cond_24
    invoke-static {p3}, Le/e/a/PanelUi;->ink(Landroid/content/Context;)I

    move-result v4

    :goto_28
    invoke-virtual {v1, v4}, Landroid/widget/Button;->setTextColor(I)V

    aget v1, p1, v0

    if-ne p0, v1, :cond_3b

    invoke-static {p3}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v1

    const v4, 0xffffff

    and-int/2addr v1, v4

    const/high16 v4, 0x22000000

    or-int/2addr v1, v4

    goto :goto_3f

    :cond_3b
    invoke-static {p3}, Le/e/a/UiDialogs;->surface(Landroid/content/Context;)I

    move-result v1

    :goto_3f
    invoke-static {p3, v1, v2}, Le/e/a/PanelUi;->round(Landroid/content/Context;II)Landroid/graphics/drawable/GradientDrawable;

    move-result-object v1

    invoke-static {p3, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v4

    aget v5, p1, v0

    if-ne p0, v5, :cond_50

    invoke-static {p3}, Le/e/a/UiDialogs;->accent(Landroid/content/Context;)I

    move-result v5

    goto :goto_58

    :cond_50
    invoke-static {p3}, Le/e/a/ThemeChoice;->isNight(Landroid/content/Context;)Z

    move-result v5

    invoke-static {v5}, Le/e/a/DialogColors;->muted(Z)I

    move-result v5

    :goto_58
    invoke-virtual {v1, v4, v5}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    aget-object v4, p2, p0

    invoke-virtual {v4, v1}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    add-int/lit8 p0, p0, 0x1

    goto :goto_10
.end method

.method static synthetic lambda$1([IILjava/lang/Runnable;Landroid/view/View;)V
    .registers 4

    .line 26
    const/4 p3, 0x0

    aput p1, p0, p3

    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static synthetic lambda$2(Landroid/widget/EditText;Landroid/view/View;)V
    .registers 2

    .line 26
    const-string p1, ""

    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static synthetic lambda$3(Landroid/widget/EditText;[Ljava/lang/String;Landroid/widget/RadioGroup;[ILandroid/widget/EditText;Landroid/content/Context;Lorg/json/JSONObject;Landroid/widget/CheckBox;Lorg/json/JSONObject;Lorg/json/JSONArray;Landroid/app/Activity;Landroid/app/AlertDialog;Ljava/lang/Runnable;Landroid/view/View;)V
    .registers 16

    .line 26
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p13

    invoke-virtual {p13}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p13

    invoke-virtual {p2}, Landroid/widget/RadioGroup;->getCheckedRadioButtonId()I

    move-result p2

    add-int/lit8 p2, p2, -0x64

    const/4 v0, 0x0

    invoke-static {v0, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    aget-object p1, p1, p2

    aget p2, p3, v0

    const/4 v1, 0x1

    if-ne p2, v1, :cond_27

    invoke-virtual {p4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p2

    goto :goto_29

    :cond_27
    const-string p2, ""

    :goto_29
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_45

    const-string v1, "[0-9]+"

    invoke-virtual {p2, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_45

    const-string p0, "Enter a numeric user ID"

    const-string p1, "\u8acb\u8f38\u5165\u6578\u5b57\u4f7f\u7528\u8005 ID"

    const-string p2, "\u30e6\u30fc\u30b6\u30fcID\u3092\u5165\u529b\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p5, p2, p0, p1}, Le/e/a/FilterUi110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p4, p0}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    return-void

    :cond_45
    invoke-virtual {p13}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    move-result p4

    if-eqz p4, :cond_63

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p4

    if-eqz p4, :cond_63

    const-string p1, "Enter a value"

    const-string p2, "\u8acb\u8f38\u5165\u6587\u5b57"

    const-string p3, "\u6587\u5b57\u3092\u5165\u529b\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p5, p3, p1, p2}, Le/e/a/FilterUi110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    return-void

    :cond_63
    :try_start_63
    const-string p4, "regex"

    invoke-virtual {p1, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_6e

    invoke-static {p13}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    :cond_6e
    const-string p4, "userId"

    invoke-virtual {p6, p4, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p2

    const-string p4, "value"

    invoke-virtual {p2, p4, p13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p2

    const-string p4, "mode"

    invoke-virtual {p2, p4, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p1

    const-string p2, "category"

    aget p3, p3, v0

    invoke-virtual {p1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object p1

    const-string p2, "enabled"

    invoke-virtual {p7}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p3

    invoke-virtual {p1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    if-nez p8, :cond_9f

    const-string p1, "date"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p2

    invoke-virtual {p6, p1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    invoke-virtual {p9, p6}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :cond_9f
    invoke-static {p10, p9}, Le/e/a/ContentFilter;->save(Landroid/content/Context;Lorg/json/JSONArray;)V

    invoke-virtual {p11}, Landroid/app/AlertDialog;->dismiss()V

    invoke-interface {p12}, Ljava/lang/Runnable;->run()V
    :try_end_a8
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_63 .. :try_end_a8} :catch_ab
    .catch Lorg/json/JSONException; {:try_start_63 .. :try_end_a8} :catch_a9

    goto :goto_b9

    :catch_a9
    move-exception p0

    goto :goto_b9

    :catch_ab
    move-exception p1

    const-string p1, "Invalid regular expression"

    const-string p2, "\u6b63\u898f\u8868\u793a\u5f0f\u7121\u6548"

    const-string p3, "\u6b63\u898f\u8868\u73fe\u304c\u4e0d\u6b63\u3067\u3059"

    invoke-static {p5, p3, p1, p2}, Le/e/a/FilterUi110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    :goto_b9
    return-void
.end method

.method static mode(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 7
    const-string v0, "regex"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-string v2, "exact"

    if-eqz v1, :cond_d

    const-string v1, "\u6b63\u898f\u8868\u73fe"

    goto :goto_18

    :cond_d
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_16

    const-string v1, "\u5b8c\u5168\u4e00\u81f4"

    goto :goto_18

    :cond_16
    const-string v1, "\u90e8\u5206\u4e00\u81f4"

    :goto_18
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_21

    const-string v3, "Regular expression"

    goto :goto_2c

    :cond_21
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2a

    const-string v3, "Exact match"

    goto :goto_2c

    :cond_2a
    const-string v3, "Partial match"

    :goto_2c
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_35

    const-string p1, "\u6b63\u898f\u8868\u793a\u5f0f"

    goto :goto_40

    :cond_35
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3e

    const-string p1, "\u5b8c\u5168\u76f8\u7b26"

    goto :goto_40

    :cond_3e
    const-string p1, "\u90e8\u5206\u76f8\u7b26"

    :goto_40
    invoke-static {p0, v1, v3, p1}, Le/e/a/FilterUi110;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static show(Landroid/preference/PreferenceActivity;)V
    .registers 2

    .line 9
    new-instance v0, Le/e/a/FilterUi110$Page;

    invoke-direct {v0, p0}, Le/e/a/FilterUi110$Page;-><init>(Landroid/preference/PreferenceActivity;)V

    invoke-virtual {v0}, Le/e/a/FilterUi110$Page;->show()V

    return-void
.end method

.method static tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 5
    invoke-static {p0, p1, p2, p3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
