.class public Le/e/a/vendor/lang3/ClassUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ABBREVIATION_MAP:Ljava/util/Map;

.field public static final ARRAY_TAIL_PATTERN:Ljava/util/regex/Pattern;

.field public static final NAME_PRIMITIVE_MAP:Ljava/util/HashMap;

.field public static final WRAPPER_PRIMITIVE_MAP:Ljava/util/HashMap;


# direct methods
.method static constructor <clinit>()V
    .registers 11

    .line 93
    const-string v0, "(?:\\[\\])+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Le/e/a/vendor/lang3/ClassUtils;->ARRAY_TAIL_PATTERN:Ljava/util/regex/Pattern;

    const/16 v0, 0x2e

    .line 105
    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    const/16 v0, 0x24

    .line 115
    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    .line 120
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Le/e/a/vendor/lang3/ClassUtils;->NAME_PRIMITIVE_MAP:Ljava/util/HashMap;

    .line 123
    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    sget-object v2, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    sget-object v3, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    sget-object v4, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    sget-object v5, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    sget-object v7, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    sget-object v8, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    sget-object v9, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 140
    const-class v10, Ljava/lang/Boolean;

    invoke-virtual {v0, v1, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    const-class v10, Ljava/lang/Byte;

    invoke-virtual {v0, v2, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    const-class v10, Ljava/lang/Character;

    invoke-virtual {v0, v3, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    const-class v10, Ljava/lang/Short;

    invoke-virtual {v0, v8, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    const-class v10, Ljava/lang/Integer;

    invoke-virtual {v0, v6, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    const-class v10, Ljava/lang/Long;

    invoke-virtual {v0, v7, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    const-class v10, Ljava/lang/Double;

    invoke-virtual {v0, v4, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    const-class v10, Ljava/lang/Float;

    invoke-virtual {v0, v5, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    invoke-virtual {v0, v9, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    sput-object v9, Le/e/a/vendor/lang3/ClassUtils;->WRAPPER_PRIMITIVE_MAP:Ljava/util/HashMap;

    .line 157
    new-instance v9, Le/e/a/vendor/lang3/ClassUtils$0;

    invoke-direct {v9}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v0, v9}, Ljava/util/HashMap;->forEach(Ljava/util/function/BiConsumer;)V

    .line 176
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 177
    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    const-string v9, "I"

    invoke-virtual {v0, v6, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v6, "Z"

    invoke-virtual {v0, v1, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v5, "F"

    invoke-virtual {v0, v1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v5, "J"

    invoke-virtual {v0, v1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v5, "S"

    invoke-virtual {v0, v1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "B"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "D"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "C"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    sput-object v1, Le/e/a/vendor/lang3/ClassUtils;->ABBREVIATION_MAP:Ljava/util/Map;

    .line 186
    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object v0

    new-instance v1, Le/e/a/vendor/lang3/ClassUtils$3;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Le/e/a/vendor/lang3/ClassUtils$3;-><init>(B)V

    new-instance v2, Le/e/a/vendor/lang3/ClassUtils$3;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Le/e/a/vendor/lang3/ClassUtils$3;-><init>(B)V

    invoke-static {v1, v2}, Ljava/util/stream/Collectors;->toMap(Ljava/util/function/Function;Ljava/util/function/Function;)Ljava/util/stream/Collector;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    return-void
.end method

.method public static getClass(Ljava/lang/ClassLoader;Ljava/lang/String;Z)Ljava/lang/Class;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ClassLoader;",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    move-object v0, p1

    :cond_0
    const/4 v1, 0x0

    .line 963
    :try_start_0
    sget-object v2, Le/e/a/vendor/lang3/ClassUtils;->NAME_PRIMITIVE_MAP:Ljava/util/HashMap;

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Class;

    if-nez v2, :cond_6

    .line 1687
    invoke-static {v0}, Le/e/a/vendor/lang3/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 1690
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    .line 1691
    new-array v3, v2, [C

    move v4, v1

    move v5, v4

    :goto_0
    if-ge v4, v2, :cond_2

    .line 1694
    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v6

    if-nez v6, :cond_1

    add-int/lit8 v6, v5, 0x1

    .line 1695
    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v7

    aput-char v7, v3, v5

    move v5, v6

    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_2
    if-ne v5, v2, :cond_4

    :cond_3
    move-object v2, v0

    goto :goto_1

    :cond_4
    if-nez v5, :cond_5

    .line 1702
    const-string v2, ""

    goto :goto_1

    .line 1704
    :cond_5
    new-instance v2, Ljava/lang/String;

    invoke-direct {v2, v3, v1, v5}, Ljava/lang/String;-><init>([CII)V

    .line 1738
    :goto_1
    invoke-static {v2}, Le/e/a/vendor/lang3/ClassUtils;->toEncodedName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 642
    invoke-static {v2, p2, p0}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_6
    return-object v2

    :catch_0
    const/16 v2, 0x2e

    .line 644
    invoke-virtual {v0, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_7

    .line 646
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 v1, 0x24

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v2, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_7
    if-ne v2, v3, :cond_0

    .line 650
    new-instance p0, Ljava/lang/ClassNotFoundException;

    invoke-direct {p0, p1}, Ljava/lang/ClassNotFoundException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static toEncodedName(Ljava/lang/String;)Ljava/lang/String;
    .registers 15

    const v0, 0xffff

    .line 1770
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 1752
    const-string v2, "className"

    invoke-static {p0, v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 1753
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_e

    .line 1759
    const-string v2, "["

    invoke-virtual {p0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x1

    const-string v6, ";"

    if-eqz v3, :cond_0

    invoke-virtual {p0, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    move v3, v5

    goto :goto_0

    :cond_0
    move v3, v4

    .line 1760
    :goto_0
    const-string v7, "Class name greater than maximum length %,d"

    const-string v8, "Array dimension greater than JVM specification maximum of 255."

    const/16 v9, 0xff

    const-string v10, "L"

    if-eqz v3, :cond_3

    .line 1761
    invoke-virtual {p0, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v11

    if-gt v11, v9, :cond_2

    if-ltz v11, :cond_1

    .line 1768
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v12

    add-int/lit8 v11, v11, 0x2

    sub-int/2addr v12, v11

    if-le v12, v0, :cond_3

    .line 1770
    new-instance p0, Ljava/lang/IllegalArgumentException;

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {v7, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 1766
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Expected \'L\' after \'[\' for an array style string."

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 1763
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 1774
    :cond_3
    const-string v11, "[]"

    invoke-virtual {p0, v11}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v12

    if-lez v12, :cond_4

    move v13, v12

    goto :goto_1

    .line 1776
    :cond_4
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v13

    :goto_1
    if-le v13, v0, :cond_5

    if-nez v3, :cond_5

    .line 1778
    new-instance p0, Ljava/lang/IllegalArgumentException;

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {v7, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 1780
    :cond_5
    invoke-virtual {p0, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 1784
    invoke-virtual {p0, v12}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 1785
    sget-object v1, Le/e/a/vendor/lang3/ClassUtils;->ARRAY_TAIL_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 1788
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    sub-int/2addr v0, v12

    div-int/lit8 v0, v0, 0x2

    if-gt v0, v9, :cond_b

    .line 1792
    new-instance v1, Ljava/lang/StringBuilder;

    sget v3, Le/e/a/vendor/lang3/StringUtils;->$r8$clinit:I

    .line 6215
    const-string v3, ""

    if-lez v0, :cond_7

    if-eq v0, v5, :cond_9

    const/16 v2, 0x2000

    const/16 v5, 0x5b

    if-gt v0, v2, :cond_6

    if-lez v0, :cond_7

    .line 6191
    new-instance v2, Ljava/lang/String;

    new-array v0, v0, [C

    .line 129
    invoke-static {v0, v5}, Ljava/util/Arrays;->fill([CC)V

    .line 6191
    invoke-direct {v2, v0}, Ljava/lang/String;-><init>([C)V

    goto :goto_2

    :cond_6
    if-gtz v0, :cond_8

    :cond_7
    move-object v2, v3

    goto :goto_2

    .line 6191
    :cond_8
    new-instance v2, Ljava/lang/String;

    new-array v0, v0, [C

    .line 129
    invoke-static {v0, v5}, Ljava/util/Arrays;->fill([CC)V

    .line 6191
    invoke-direct {v2, v0}, Ljava/lang/String;-><init>([C)V

    .line 1792
    :cond_9
    :goto_2
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1793
    invoke-virtual {p0, v4, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 1794
    sget-object v0, Le/e/a/vendor/lang3/ClassUtils;->ABBREVIATION_MAP:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_a

    .line 1796
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 1798
    :cond_a
    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1800
    :goto_3
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 1790
    :cond_b
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 1786
    :cond_c
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Malformed array name: "

    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_d
    return-object p0

    .line 1754
    :cond_e
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Class name is empty"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
