.class final Lapp/yydarlinker/deepseekcaptions/RebuildNumbers;
.super Ljava/lang/Object;
.source "RebuildNumbers.java"


# static fields
.field static final EN:Ljava/util/regex/Pattern;

.field static final MONTHS:Ljava/lang/String; = "january february march april may june july august september october november december"

.field static final NUMBER:Ljava/util/regex/Pattern;

.field static final ZH:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "(?i)\\b("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, " "

    const-string v2, "|"

    const-string v3, "january february march april may june july august september october november december"

    invoke-virtual {v3, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ")\\s+(\\d{1,2})(?:st|nd|rd|th)?\\b"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildNumbers;->EN:Ljava/util/regex/Pattern;

    .line 9
    const-string v0, "(?<![0-9\u4e00\u4e8c\u4e09\u56db\u4e94\u516d\u4e03\u516b\u4e5d\u5341])([0-9]{1,2}|[\u4e00\u4e8c\u4e09\u56db\u4e94\u516d\u4e03\u516b\u4e5d\u5341]{1,3})\u6708\\s*([0-9]{1,2}|[\u4e00\u4e8c\u4e09\u56db\u4e94\u516d\u4e03\u516b\u4e5d\u5341]{1,3})(?:\u65e5|\u53f7)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildNumbers;->ZH:Ljava/util/regex/Pattern;

    .line 10
    const-string v0, "(?<![a-zA-Z0-9])[+-]?\\d+(?:,\\d{3})*(?:\\.\\d+)?"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildNumbers;->NUMBER:Ljava/util/regex/Pattern;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static dates(Ljava/lang/String;)Ljava/util/List;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 18
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/RebuildNumbers;->EN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    sget-object v2, Lapp/yydarlinker/deepseekcaptions/RebuildNumbers;->ZH:Ljava/util/regex/Pattern;

    invoke-virtual {v2, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 19
    const-string v2, "january february march april may june july august september october november december"

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    .line 20
    :cond_1d
    :goto_1d
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    const-string v4, ":"

    const/16 v5, 0x1f

    const/4 v6, 0x2

    const/4 v7, 0x1

    if-eqz v3, :cond_5a

    invoke-virtual {v1, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lapp/yydarlinker/deepseekcaptions/RebuildNumbers;->integer(Ljava/lang/String;)I

    move-result v3

    if-lt v3, v7, :cond_1d

    if-gt v3, v5, :cond_1d

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    sget-object v8, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v6, v8}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2, v6}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v6

    add-int/2addr v6, v7

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1d

    .line 21
    :cond_5a
    :goto_5a
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_90

    invoke-virtual {p0, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/RebuildNumbers;->integer(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/RebuildNumbers;->integer(Ljava/lang/String;)I

    move-result v2

    if-lt v1, v7, :cond_5a

    const/16 v3, 0xc

    if-gt v1, v3, :cond_5a

    if-lt v2, v7, :cond_5a

    if-gt v2, v5, :cond_5a

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_5a

    .line 22
    :cond_90
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    return-object v0
.end method

.method static integer(Ljava/lang/String;)I
    .registers 8

    .line 12
    const-string v0, "[0-9]+"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    return p0

    :cond_d
    const/16 v0, 0x5341

    .line 13
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, -0x1

    const/4 v2, 0x0

    const/4 v3, 0x1

    .line 14
    const-string v4, "\u96f6\u4e00\u4e8c\u4e09\u56db\u4e94\u516d\u4e03\u516b\u4e5d"

    if-ltz v0, :cond_41

    if-nez v0, :cond_1e

    move v5, v3

    goto :goto_26

    :cond_1e
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    :goto_26
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    sub-int/2addr v6, v3

    if-ne v0, v6, :cond_2e

    goto :goto_37

    :cond_2e
    add-int/2addr v0, v3

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result p0

    invoke-virtual {v4, p0}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    :goto_37
    if-ltz v5, :cond_40

    if-gez v2, :cond_3c

    goto :goto_40

    :cond_3c
    mul-int/lit8 v5, v5, 0xa

    add-int/2addr v5, v2

    return v5

    :cond_40
    :goto_40
    return v1

    .line 15
    :cond_41
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-ne v0, v3, :cond_50

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result p0

    invoke-virtual {v4, p0}, Ljava/lang/String;->indexOf(I)I

    move-result p0

    return p0

    :cond_50
    return v1
.end method

.method static numbers(Ljava/lang/String;)Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 25
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/RebuildNumbers;->NUMBER:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 26
    :catch_b
    :goto_b
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-eqz v1, :cond_2e

    :try_start_11
    new-instance v1, Ljava/math/BigDecimal;

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v2

    const-string v3, ","

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/RebuildClock$$ExternalSyntheticBackport0;->m(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v1

    invoke-virtual {v1}, Ljava/math/BigDecimal;->toPlainString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2d
    .catch Ljava/lang/NumberFormatException; {:try_start_11 .. :try_end_2d} :catch_b

    goto :goto_b

    :cond_2e
    return-object v0
.end method

.method static safe(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 6

    .line 30
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/RebuildNumbers;->dates(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/RebuildNumbers;->dates(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 31
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1c

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1c

    invoke-interface {v0, v1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1c

    const/4 p0, 0x0

    return p0

    .line 33
    :cond_1c
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_29

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_5c

    .line 34
    :cond_29
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_86

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_36

    goto :goto_86

    .line 35
    :cond_36
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/RebuildNumbers;->ZH:Ljava/util/regex/Pattern;

    sget-object v1, Lapp/yydarlinker/deepseekcaptions/RebuildNumbers;->EN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    const-string v2, " "

    invoke-virtual {p0, v2}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0, v2}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 36
    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 38
    :cond_5c
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/RebuildNumbers;->numbers(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/RebuildNumbers;->numbers(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 39
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-ne v2, v3, :cond_86

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-ne v2, v3, :cond_86

    const-string v2, "(?s).*[\u4e07\u4ebf].*"

    invoke-virtual {p1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_86

    const-string p1, "(?is).*\\b(million|billion|thousand)\\b.*"

    invoke-virtual {p0, p1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_81

    goto :goto_86

    .line 40
    :cond_81
    invoke-interface {v0, v1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_86
    :goto_86
    return v3
.end method
