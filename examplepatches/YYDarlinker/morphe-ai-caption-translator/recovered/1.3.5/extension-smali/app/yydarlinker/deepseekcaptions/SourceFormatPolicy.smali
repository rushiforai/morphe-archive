.class final Lapp/yydarlinker/deepseekcaptions/SourceFormatPolicy;
.super Ljava/lang/Object;
.source "SourceFormatPolicy.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static decode(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 19
    :try_start_0
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v0}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_a} :catch_a

    :catch_a
    return-object p0
.end method

.method static json3(Ljava/lang/String;)Ljava/lang/String;
    .registers 15

    if-nez p0, :cond_4

    const/4 p0, 0x0

    return-object p0

    :cond_4
    const/16 v0, 0x23

    .line 9
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const-string v1, ""

    if-gez v0, :cond_10

    move-object v2, v1

    goto :goto_14

    :cond_10
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    :goto_14
    const/4 v3, 0x0

    if-gez v0, :cond_19

    move-object v0, p0

    goto :goto_1d

    .line 10
    :cond_19
    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :goto_1d
    const/16 v4, 0x3f

    invoke-virtual {v0, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    if-gez v4, :cond_26

    goto :goto_2c

    :cond_26
    add-int/lit8 v1, v4, 0x1

    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    :goto_2c
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 12
    const-string v6, "&"

    invoke-virtual {v1, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    array-length v7, v1

    move v8, v3

    :goto_39
    if-ge v8, v7, :cond_89

    aget-object v9, v1, v8

    .line 13
    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_44

    goto :goto_86

    :cond_44
    const/16 v10, 0x3d

    invoke-virtual {v9, v10}, Ljava/lang/String;->indexOf(I)I

    move-result v10

    if-gez v10, :cond_4e

    move-object v11, v9

    goto :goto_52

    :cond_4e
    invoke-virtual {v9, v3, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v11

    :goto_52
    invoke-static {v11}, Lapp/yydarlinker/deepseekcaptions/SourceFormatPolicy;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 14
    const-string v12, "sparams"

    invoke-virtual {v12, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    const-string v13, "fmt"

    if-eqz v12, :cond_7d

    if-ltz v10, :cond_7d

    add-int/lit8 v10, v10, 0x1

    invoke-virtual {v9, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lapp/yydarlinker/deepseekcaptions/SourceFormatPolicy;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v12, ","

    invoke-virtual {v10, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v10

    invoke-interface {v10, v13}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_7d

    return-object p0

    .line 15
    :cond_7d
    invoke-virtual {v13, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_86

    invoke-interface {v5, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_86
    :goto_86
    add-int/lit8 v8, v8, 0x1

    goto :goto_39

    .line 17
    :cond_89
    const-string p0, "fmt=json3"

    invoke-interface {v5, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    if-gez v4, :cond_96

    goto :goto_9a

    :cond_96
    invoke-virtual {v0, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :goto_9a
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "?"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v6, v5}, Lapp/yydarlinker/deepseekcaptions/RebuildClock$$ExternalSyntheticBackport0;->m(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
