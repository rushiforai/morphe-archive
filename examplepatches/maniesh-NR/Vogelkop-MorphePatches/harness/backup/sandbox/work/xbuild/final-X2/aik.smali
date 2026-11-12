.class public abstract Laik;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:[Ljava/lang/String;

.field public static final b:Lu1b;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    const-string v0, "https://"

    const-string v1, "http://"

    const-string v2, "https://www."

    const-string v3, "http://www."

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Laik;->a:[Ljava/lang/String;

    const/4 v0, 0x2

    const-string v1, "HUAWEI"

    const-string v2, "HONOR"

    filled-new-array {v1, v2}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {v0, v1}, Lu1b;->p(I[Ljava/lang/Object;)Lu1b;

    move-result-object v0

    sput-object v0, Laik;->b:Lu1b;

    return-void
.end method

.method public static a(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-object p0

    :cond_7
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/String;->codePointAt(I)I

    move-result v0

    new-instance v1, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Character;->toUpperCase(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([C)V

    invoke-static {v0}, Ljava/lang/Character;->charCount(I)I

    move-result v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_7

    return-object p0

    :cond_7
    if-nez p1, :cond_c

    const-string p0, ""

    return-object p0

    :cond_c
    return-object p1
.end method

.method public static c(Ljava/lang/CharSequence;)Ljava/lang/String;
    .registers 1

    if-nez p0, :cond_5

    const-string p0, ""

    return-object p0

    :cond_5
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;)Landroid/util/Pair;
    .registers 14

    const/4 v0, -0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_11

    new-instance p0, Landroid/util/Pair;

    invoke-direct {p0, v1, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p0

    :cond_11
    invoke-static {}, Ljava/text/Collator;->getInstance()Ljava/text/Collator;

    move-result-object v2

    instance-of v3, v2, Ljava/text/RuleBasedCollator;

    if-nez v3, :cond_49

    invoke-static {p1}, Ljava/util/regex/Pattern;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x42

    invoke-static {p1, v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result p1

    if-eqz p1, :cond_43

    new-instance p1, Landroid/util/Pair;

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->start()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->end()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-direct {p1, v0, p0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p1

    :cond_43
    new-instance p0, Landroid/util/Pair;

    invoke-direct {p0, v1, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p0

    :cond_49
    check-cast v2, Ljava/text/RuleBasedCollator;

    invoke-static {p1, v2}, Laik;->k(Ljava/lang/String;Ljava/text/RuleBasedCollator;)[Landroid/util/Pair;

    move-result-object p1

    invoke-static {p0, v2}, Laik;->k(Ljava/lang/String;Ljava/text/RuleBasedCollator;)[Landroid/util/Pair;

    move-result-object v3

    array-length v4, p1

    new-array v4, v4, [I

    const/4 v5, 0x0

    aput v0, v4, v5

    const/4 v6, 0x1

    move v8, v0

    move v7, v6

    :goto_5c
    array-length v9, p1

    if-ge v7, v9, :cond_80

    aget-object v9, p1, v7

    :goto_61
    if-le v8, v0, :cond_70

    add-int/lit8 v10, v8, 0x1

    aget-object v10, p1, v10

    invoke-virtual {v10, v9}, Landroid/util/Pair;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_70

    aget v8, v4, v8

    goto :goto_61

    :cond_70
    add-int/lit8 v10, v8, 0x1

    aget-object v11, p1, v10

    invoke-virtual {v11, v9}, Landroid/util/Pair;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_7b

    move v8, v10

    :cond_7b
    aput v8, v4, v7

    add-int/lit8 v7, v7, 0x1

    goto :goto_5c

    :cond_80
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_8e

    new-array p0, v5, [I

    goto :goto_c5

    :cond_8e
    invoke-virtual {v2, p0}, Ljava/text/RuleBasedCollator;->getCollationElementIterator(Ljava/lang/String;)Ljava/text/CollationElementIterator;

    move-result-object p0

    invoke-virtual {p0}, Ljava/text/CollationElementIterator;->getOffset()I

    move-result v2

    :goto_96
    if-eq v2, v0, :cond_a8

    invoke-virtual {p0}, Ljava/text/CollationElementIterator;->getOffset()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Ljava/text/CollationElementIterator;->next()I

    move-result v2

    goto :goto_96

    :cond_a8
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result p0

    new-array v2, p0, [Ljava/lang/Integer;

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/Integer;

    new-array v7, p0, [I

    move v8, v5

    :goto_b7
    if-ge v8, p0, :cond_c4

    aget-object v9, v2, v8

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    aput v9, v7, v8

    add-int/lit8 v8, v8, 0x1

    goto :goto_b7

    :cond_c4
    move-object p0, v7

    :goto_c5
    array-length v2, v3

    array-length v7, p1

    move v8, v0

    :goto_c8
    if-ge v5, v2, :cond_103

    aget-object v9, v3, v5

    :goto_cc
    if-le v8, v0, :cond_db

    add-int/lit8 v10, v8, 0x1

    aget-object v10, p1, v10

    invoke-virtual {v10, v9}, Landroid/util/Pair;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_db

    aget v8, v4, v8

    goto :goto_cc

    :cond_db
    add-int/lit8 v10, v8, 0x1

    aget-object v11, p1, v10

    invoke-virtual {v11, v9}, Landroid/util/Pair;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_e6

    move v8, v10

    :cond_e6
    add-int/lit8 v9, v7, -0x1

    if-ne v8, v9, :cond_100

    new-instance p1, Landroid/util/Pair;

    sub-int v0, v5, v7

    add-int/2addr v0, v6

    aget v0, p0, v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    add-int/2addr v5, v6

    aget p0, p0, v5

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-direct {p1, v0, p0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p1

    :cond_100
    add-int/lit8 v5, v5, 0x1

    goto :goto_c8

    :cond_103
    new-instance p0, Landroid/util/Pair;

    invoke-direct {p0, v1, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p0
.end method

.method public static e(Ljava/util/Date;)Ljava/lang/String;
    .registers 8

    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    new-instance p0, Ljava/util/Date;

    invoke-direct {p0}, Ljava/util/Date;-><init>()V

    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    const-wide/32 v4, 0xea60

    const/high16 v6, 0x40000

    invoke-static/range {v0 .. v6}, Landroid/text/format/DateUtils;->getRelativeTimeSpanString(JJJI)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static f(Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    const-string v0, "://"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    const/4 v2, -0x1

    if-eq v0, v2, :cond_c

    add-int/lit8 v1, v0, 0x3

    :cond_c
    const/16 v0, 0x2f

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    const/16 v3, 0x3f

    invoke-virtual {p0, v3, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    if-eq v3, v2, :cond_1f

    if-eq v0, v2, :cond_1e

    if-ge v3, v0, :cond_1f

    :cond_1e
    move v0, v3

    :cond_1f
    const/16 v3, 0x23

    invoke-virtual {p0, v3, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    if-eq v3, v2, :cond_2c

    if-eq v0, v2, :cond_2b

    if-ge v3, v0, :cond_2c

    :cond_2b
    move v0, v3

    :cond_2c
    if-ne v0, v2, :cond_32

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    :cond_32
    const/16 v2, 0x40

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    if-lt v2, v1, :cond_3e

    if-ge v2, v0, :cond_3e

    add-int/lit8 v1, v2, 0x1

    :cond_3e
    const/16 v2, 0x3a

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    if-lt v2, v1, :cond_49

    if-ge v2, v0, :cond_49

    move v0, v2

    :cond_49
    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static g(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    invoke-static {p0}, Laik;->f(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "www."

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_11

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    :cond_11
    return-object p0
.end method

.method public static h(JLandroid/content/Context;)Ljava/lang/String;
    .registers 5

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_21

    const-string v1, "zh"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_21

    invoke-static {p0, p1}, Laik;->m(J)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_21
    invoke-static {p2, p0, p1}, Landroid/text/format/Formatter;->formatShortFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Laik;->n(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static i(JLandroid/content/Context;)Ljava/lang/String;
    .registers 5

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_21

    const-string v1, "zh"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_21

    invoke-static {p0, p1}, Laik;->m(J)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_21
    invoke-static {p2, p0, p1}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Laik;->n(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static j(JLandroid/content/Context;)Ljava/lang/String;
    .registers 8

    invoke-static {}, Ljava/text/DecimalFormatSymbols;->getInstance()Ljava/text/DecimalFormatSymbols;

    move-result-object v0

    invoke-virtual {v0}, Ljava/text/DecimalFormatSymbols;->getDecimalSeparator()C

    move-result v0

    invoke-static {p0, p1, p2}, Laik;->h(JLandroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    const/4 p2, 0x0

    move v1, p2

    move v2, v1

    :goto_15
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_35

    invoke-virtual {p0, v1}, Ljava/lang/String;->codePointAt(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isDigit(I)Z

    move-result v4

    if-nez v4, :cond_27

    if-ne v3, v0, :cond_2f

    :cond_27
    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v2

    :cond_2f
    invoke-static {v3}, Ljava/lang/Character;->charCount(I)I

    move-result v3

    add-int/2addr v1, v3

    goto :goto_15

    :cond_35
    if-gt p1, v2, :cond_67

    :try_start_37
    invoke-static {}, Ljava/text/NumberFormat;->getInstance()Ljava/text/NumberFormat;

    move-result-object v0

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {p0, p1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/NumberFormat;->parse(Ljava/lang/String;)Ljava/lang/Number;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0
    :try_end_49
    .catch Ljava/text/ParseException; {:try_start_37 .. :try_end_49} :catch_67

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {p0, p2, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    filled-new-array {p1, p2, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "%s%.0f%s"

    invoke-static {v1, p1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    :catch_67
    :cond_67
    return-object p0
.end method

.method public static k(Ljava/lang/String;Ljava/text/RuleBasedCollator;)[Landroid/util/Pair;
    .registers 5

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_f

    const/4 p0, 0x0

    new-array p0, p0, [Landroid/util/Pair;

    return-object p0

    :cond_f
    invoke-virtual {p1, p0}, Ljava/text/RuleBasedCollator;->getCollationElementIterator(Ljava/lang/String;)Ljava/text/CollationElementIterator;

    move-result-object p0

    invoke-virtual {p0}, Ljava/text/CollationElementIterator;->next()I

    move-result p1

    :goto_17
    const/4 v1, -0x1

    if-eq p1, v1, :cond_37

    invoke-static {p1}, Ljava/text/CollationElementIterator;->primaryOrder(I)I

    move-result v1

    invoke-static {p1}, Ljava/text/CollationElementIterator;->secondaryOrder(I)S

    move-result p1

    new-instance v2, Landroid/util/Pair;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-direct {v2, v1, p1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Ljava/text/CollationElementIterator;->next()I

    move-result p1

    goto :goto_17

    :cond_37
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p0

    new-array p0, p0, [Landroid/util/Pair;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Landroid/util/Pair;

    return-object p0
.end method

.method public static l(I)Ljava/lang/String;
    .registers 1

    packed-switch p0, :pswitch_data_3e

    :pswitch_3
    const/4 p0, 0x0

    return-object p0

    :pswitch_5
    const-string p0, "NR"

    return-object p0

    :pswitch_8
    const-string p0, "IWLAN"

    return-object p0

    :pswitch_b
    const-string p0, "TD_SCDMA"

    return-object p0

    :pswitch_e
    const-string p0, "GSM"

    return-object p0

    :pswitch_11
    const-string p0, "HSPA+"

    return-object p0

    :pswitch_14
    const-string p0, "eHRPD"

    return-object p0

    :pswitch_17
    const-string p0, "LTE"

    return-object p0

    :pswitch_1a
    const-string p0, "EVDO_B"

    return-object p0

    :pswitch_1d
    const-string p0, "iDen"

    return-object p0

    :pswitch_20
    const-string p0, "HSPA"

    return-object p0

    :pswitch_23
    const-string p0, "HSUPA"

    return-object p0

    :pswitch_26
    const-string p0, "HSDPA"

    return-object p0

    :pswitch_29
    const-string p0, "1xRTT"

    return-object p0

    :pswitch_2c
    const-string p0, "EVDO_A"

    return-object p0

    :pswitch_2f
    const-string p0, "EVDO_0"

    return-object p0

    :pswitch_32
    const-string p0, "CDMA"

    return-object p0

    :pswitch_35
    const-string p0, "UMTS"

    return-object p0

    :pswitch_38
    const-string p0, "EDGE"

    return-object p0

    :pswitch_3b
    const-string p0, "GPRS"

    return-object p0

    :pswitch_data_3e
    .packed-switch 0x1
        :pswitch_3b
        :pswitch_38
        :pswitch_35
        :pswitch_32
        :pswitch_2f
        :pswitch_2c
        :pswitch_29
        :pswitch_26
        :pswitch_23
        :pswitch_20
        :pswitch_1d
        :pswitch_1a
        :pswitch_17
        :pswitch_14
        :pswitch_11
        :pswitch_e
        :pswitch_b
        :pswitch_8
        :pswitch_3
        :pswitch_5
    .end packed-switch
.end method

.method public static m(J)Ljava/lang/String;
    .registers 8

    const-wide/16 v0, 0x400

    cmp-long v0, p0, v0

    if-gez v0, :cond_18

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p0, " B"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_18
    long-to-double p0, p0

    invoke-static {p0, p1}, Ljava/lang/Math;->log(D)D

    move-result-wide v0

    const-wide v2, 0x401bb9d3beb8c86bL    # 6.931471805599453

    div-double/2addr v0, v2

    double-to-int v0, v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-wide/high16 v2, 0x4090000000000000L    # 1024.0

    int-to-double v4, v0

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    div-double/2addr p0, v2

    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    add-int/lit8 v0, v0, -0x1

    const-string p1, "KMGTPE"

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result p1

    invoke-static {p1}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object p1

    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "%.1f %cB"

    invoke-static {v1, p1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static n(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    sget-object v0, Laik;->b:Lu1b;

    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    const-string v1, "en"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    const-string v0, "[\u202a\u202b\u202c\u200e\u200f]"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :cond_22
    return-object p0
.end method

.method public static o(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_7

    const/4 p0, 0x0

    :cond_7
    return-object p0
.end method

.method public static p(Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-object p0

    :cond_7
    const-string v0, "://"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x0

    if-ltz v0, :cond_13

    add-int/lit8 v0, v0, 0x3

    goto :goto_14

    :cond_13
    move v0, v1

    :goto_14
    const/16 v2, 0x2f

    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    const/16 v3, 0x23

    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    const/16 v4, 0x3f

    invoke-virtual {p0, v4, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v4

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ltz v2, :cond_30

    invoke-static {v2, v5}, Ljava/lang/Math;->min(II)I

    move-result v5

    :cond_30
    if-ltz v3, :cond_36

    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    move-result v5

    :cond_36
    if-ltz v4, :cond_3c

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v5

    :cond_3c
    const/16 v2, 0x40

    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    if-le v2, v0, :cond_6b

    if-ge v2, v5, :cond_6b

    const/16 v3, 0x3a

    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    if-ltz v0, :cond_6b

    add-int/lit8 v0, v0, 0x1

    if-ge v0, v2, :cond_6b

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "*****"

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :cond_6b
    return-object p0
.end method

.method public static q(Ljava/lang/String;Ljava/util/HashSet;)Ljava/lang/String;
    .registers 6

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_4c

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_19
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    add-int/lit8 v1, v1, 0x1

    move v0, v1

    :goto_25
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_41

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3e

    invoke-virtual {v2, p0, v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v1, 0x1

    :cond_3e
    add-int/lit8 v1, v1, 0x1

    goto :goto_25

    :cond_41
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p1

    invoke-virtual {v2, p0, v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :cond_4c
    return-object p0
.end method

.method public static r(ZLjava/lang/String;C)Ljava/util/ArrayList;
    .registers 8

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    move v3, v2

    :goto_b
    if-ge v2, v0, :cond_23

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ne p2, v4, :cond_20

    if-nez p0, :cond_17

    if-le v2, v3, :cond_1e

    :cond_17
    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1e
    add-int/lit8 v3, v2, 0x1

    :cond_20
    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    :cond_23
    if-nez p0, :cond_27

    if-le v2, v3, :cond_2e

    :cond_27
    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2e
    invoke-virtual {v1}, Ljava/util/ArrayList;->trimToSize()V

    return-object v1
.end method

.method public static s(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    array-length v0, p1

    const/4 v1, 0x0

    :goto_2
    if-ge v1, v0, :cond_18

    aget-object v2, p1, v1

    invoke-virtual {p0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_15

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_15
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_18
    return-object p0
.end method

.method public static t(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .registers 5

    const/4 v0, 0x0

    :goto_1
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-ge v0, v1, :cond_17

    invoke-static {p0, v0}, Ljava/lang/Character;->codePointAt(Ljava/lang/CharSequence;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(I)Z

    move-result v2

    if-eqz v2, :cond_17

    invoke-static {v1}, Ljava/lang/Character;->charCount(I)I

    move-result v1

    add-int/2addr v0, v1

    goto :goto_1

    :cond_17
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    :goto_1b
    if-le v1, v0, :cond_2d

    invoke-static {p0, v1}, Ljava/lang/Character;->codePointBefore(Ljava/lang/CharSequence;I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isWhitespace(I)Z

    move-result v3

    if-eqz v3, :cond_2d

    invoke-static {v2}, Ljava/lang/Character;->charCount(I)I

    move-result v2

    sub-int/2addr v1, v2

    goto :goto_1b

    :cond_2d
    invoke-interface {p0, v0, v1}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0
.end method
