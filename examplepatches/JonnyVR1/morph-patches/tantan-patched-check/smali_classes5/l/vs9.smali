.class public Ll/vs9;
.super Ll/q8g0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/q8g0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static N(Ljava/lang/String;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, v0}, Ll/vs9;->O(Ljava/lang/String;ILandroid/graphics/Typeface;I)Landroid/text/SpannableStringBuilder;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static O(Ljava/lang/String;ILandroid/graphics/Typeface;I)Landroid/text/SpannableStringBuilder;
    .locals 6

    .line 1
    const-string v0, "-?[0-9]\\d*"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    :goto_0
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    const/16 v3, 0x21

    .line 21
    .line 22
    const-string v4, "sans-serif"

    .line 23
    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    new-instance v2, Lv/text/CustomTypefaceSpan;

    .line 27
    .line 28
    invoke-direct {v2, v4, p2, p1, p3}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    .line 36
    .line 37
    .line 38
    move-result v5

    .line 39
    invoke-virtual {v1, v2, v4, v5, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    const-string v0, "+"

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    const/4 v0, -0x1

    .line 50
    if-eq p0, v0, :cond_1

    .line 51
    .line 52
    new-instance v0, Lv/text/CustomTypefaceSpan;

    .line 53
    .line 54
    invoke-direct {v0, v4, p2, p1, p3}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 55
    .line 56
    .line 57
    add-int/lit8 p1, p0, 0x1

    .line 58
    .line 59
    invoke-virtual {v1, v0, p0, p1, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 60
    .line 61
    .line 62
    :cond_1
    return-object v1
.end method
