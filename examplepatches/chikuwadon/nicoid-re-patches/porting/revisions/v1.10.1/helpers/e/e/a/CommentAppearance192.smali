.class final Le/e/a/CommentAppearance192;
.super Ljava/lang/Object;
.source "CommentAppearance192.java"


# static fields
.field static final DEFAULT:[I

.field static final KEYS:[Ljava/lang/String;

.field static final MAX:[I

.field static final MIN:[I


# instance fields
.field shadow:I

.field final values:[I


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .line 7
    const-string v4, "comment_duration_seconds"

    const-string v5, "comment_rows"

    const-string v0, "comment_size_percent"

    const-string v1, "comment_font_weight"

    const-string v2, "comment_opacity_percent"

    const-string v3, "comment_shadow_tenths"

    filled-new-array/range {v0 .. v5}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/CommentAppearance192;->KEYS:[Ljava/lang/String;

    .line 8
    const/4 v0, 0x6

    new-array v1, v0, [I

    const/4 v2, 0x0

    const/16 v3, 0xa

    aput v3, v1, v2

    const/16 v2, 0xc8

    const/4 v3, 0x1

    aput v2, v1, v3

    const/4 v2, 0x3

    aput v3, v1, v2

    const/4 v2, 0x4

    aput v3, v1, v2

    const/4 v2, 0x5

    aput v3, v1, v2

    sput-object v1, Le/e/a/CommentAppearance192;->MIN:[I

    new-array v1, v0, [I

    fill-array-data v1, :array_3a

    sput-object v1, Le/e/a/CommentAppearance192;->MAX:[I

    new-array v0, v0, [I

    fill-array-data v0, :array_4a

    sput-object v0, Le/e/a/CommentAppearance192;->DEFAULT:[I

    return-void

    nop

    :array_3a
    .array-data 4
        0xc8
        0x2bc
        0x64
        0x32
        0x14
        0x14
    .end array-data

    :array_4a
    .array-data 4
        0x64
        0x190
        0x64
        0x5
        0x5
        0xa
    .end array-data
.end method

.method constructor <init>(Landroid/content/Context;)V
    .registers 8

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    sget-object v0, Le/e/a/CommentAppearance192;->DEFAULT:[I

    invoke-virtual {v0}, [I->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    iput-object v0, p0, Le/e/a/CommentAppearance192;->values:[I

    .line 10
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_13
    const/4 v3, 0x6

    if-lt v2, v3, :cond_6d

    iget-object v2, p0, Le/e/a/CommentAppearance192;->values:[I

    invoke-static {v0}, Le/e/a/CommentStyle;->weight(Landroid/content/SharedPreferences;)I

    move-result v3

    const/4 v4, 0x1

    aput v3, v2, v4

    const/4 v2, 0x2

    :try_start_20
    iget-object v3, p0, Le/e/a/CommentAppearance192;->values:[I

    invoke-static {p1}, Le/e/a/CommentOptions;->size(Landroid/content/Context;)I

    move-result v5

    invoke-static {v1, v5}, Le/e/a/CommentAppearance192;->clamp(II)I

    move-result v5

    aput v5, v3, v1

    iget-object v3, p0, Le/e/a/CommentAppearance192;->values:[I

    invoke-static {p1}, Le/e/a/CommentOptions;->opacity(Landroid/content/Context;)I

    move-result v5

    invoke-static {v2, v5}, Le/e/a/CommentAppearance192;->clamp(II)I

    move-result v5

    aput v5, v3, v2

    iget-object v3, p0, Le/e/a/CommentAppearance192;->values:[I

    invoke-static {p1}, Le/e/a/ShadowSettings194;->magnitude(Landroid/content/Context;)F

    move-result p1

    const/high16 v5, 0x41200000    # 10.0f

    mul-float p1, p1, v5

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    const/4 v5, 0x3

    invoke-static {v5, p1}, Le/e/a/CommentAppearance192;->clamp(II)I

    move-result p1

    aput p1, v3, v5
    :try_end_4d
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_4d} :catch_4e

    goto :goto_4f

    :catch_4e
    move-exception p1

    :goto_4f
    const-string p1, "comment_shadow"

    const-string v3, "0"

    invoke-interface {v0, p1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "2"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_61

    const/4 v1, 0x2

    goto :goto_6a

    :cond_61
    const-string v0, "1"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6a

    const/4 v1, 0x1

    :cond_6a
    :goto_6a
    iput v1, p0, Le/e/a/CommentAppearance192;->shadow:I

    return-void

    :cond_6d
    iget-object v3, p0, Le/e/a/CommentAppearance192;->values:[I

    sget-object v4, Le/e/a/CommentAppearance192;->KEYS:[Ljava/lang/String;

    aget-object v4, v4, v2

    sget-object v5, Le/e/a/CommentAppearance192;->DEFAULT:[I

    aget v5, v5, v2

    invoke-interface {v0, v4, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    invoke-static {v2, v4}, Le/e/a/CommentAppearance192;->clamp(II)I

    move-result v4

    aput v4, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_13
.end method

.method static clamp(II)I
    .registers 4

    .line 11
    sget-object v0, Le/e/a/CommentAppearance192;->MIN:[I

    aget v0, v0, p0

    sget-object v1, Le/e/a/CommentAppearance192;->MAX:[I

    aget v1, v1, p0

    invoke-static {v1, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    const/4 v0, 0x1

    if-ne p0, v0, :cond_1d

    int-to-float p0, p1

    const/high16 p1, 0x42c80000    # 100.0f

    div-float/2addr p0, p1

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    mul-int/lit8 p1, p0, 0x64

    :cond_1d
    return p1
.end method

.method static value(II)Ljava/lang/String;
    .registers 4

    .line 14
    if-eqz p0, :cond_41

    const/4 v0, 0x2

    if-ne p0, v0, :cond_6

    goto :goto_41

    :cond_6
    const/4 v0, 0x1

    if-ne p0, v0, :cond_e

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_54

    :cond_e
    const/4 v1, 0x3

    if-ne p0, v1, :cond_27

    sget-object p0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    int-to-float p1, p1

    const/high16 v1, 0x41200000    # 10.0f

    div-float/2addr p1, v1

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string p1, "%.1fdp"

    invoke-static {p0, p1, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    goto :goto_54

    :cond_27
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x4

    if-ne p0, p1, :cond_36

    const-string p0, "\u79d2"

    goto :goto_38

    :cond_36
    const-string p0, "\u884c"

    :goto_38
    invoke-static {p0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    goto :goto_50

    :cond_41
    :goto_41
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p1, "%"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    :goto_50
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_54
    return-object p0
.end method


# virtual methods
.method apply(Landroid/content/SharedPreferences;)V
    .registers 6

    .line 13
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_6
    const/4 v2, 0x6

    if-lt v1, v2, :cond_29

    iget v1, p0, Le/e/a/CommentAppearance192;->shadow:I

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "comment_shadow"

    invoke-interface {p1, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    iget-object v1, p0, Le/e/a/CommentAppearance192;->values:[I

    const/4 v2, 0x1

    aget v1, v1, v2

    const/16 v3, 0x258

    if-lt v1, v3, :cond_1f

    const/4 v0, 0x1

    :cond_1f
    const-string v1, "comment_bold"

    invoke-interface {p1, v1, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void

    :cond_29
    sget-object v2, Le/e/a/CommentAppearance192;->KEYS:[Ljava/lang/String;

    aget-object v2, v2, v1

    iget-object v3, p0, Le/e/a/CommentAppearance192;->values:[I

    aget v3, v3, v1

    invoke-static {v1, v3}, Le/e/a/CommentAppearance192;->clamp(II)I

    move-result v3

    invoke-interface {p1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    add-int/lit8 v1, v1, 0x1

    goto :goto_6
.end method

.method reset()V
    .registers 5

    .line 12
    sget-object v0, Le/e/a/CommentAppearance192;->DEFAULT:[I

    iget-object v1, p0, Le/e/a/CommentAppearance192;->values:[I

    const/4 v2, 0x6

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iput v3, p0, Le/e/a/CommentAppearance192;->shadow:I

    return-void
.end method
