.class final Lapp/yydarlinker/deepseekcaptions/CaptionEngine;
.super Ljava/lang/Object;
.source "CaptionEngine.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lapp/yydarlinker/deepseekcaptions/CaptionEngine$Source;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static loadSource(Landroid/content/Context;Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/CaptionEngine$Source;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 20
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource;->load(Landroid/content/Context;Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;

    move-result-object p0

    .line 21
    new-instance p1, Lapp/yydarlinker/deepseekcaptions/CaptionEngine$Source;

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;->body:[B

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;->contentType:Ljava/lang/String;

    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;->sourceUrl:Ljava/lang/String;

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/RawCaptionSource$Source;->document:Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;

    invoke-direct {p1, v0, v1, v2, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionEngine$Source;-><init>([BLjava/lang/String;Ljava/lang/String;Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Parsed;)V

    return-object p1
.end method

.method static requestKey(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    .line 26
    const-string v0, ""

    :try_start_2
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->load(Landroid/content/Context;)Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;

    move-result-object p0

    .line 27
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->fromUrl(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/TargetLanguage;

    move-result-object v1

    .line 28
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->baseUrl:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->fingerprint()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->apiKey:Ljava/lang/String;

    .line 29
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    if-nez v1, :cond_37

    move-object p0, v0

    goto :goto_39

    .line 30
    :cond_37
    iget-object p0, v1, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->code:Ljava/lang/String;

    :goto_39
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 31
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/CaptionEngine;->sourceCaptionUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v2, 0x7c

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 32
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_64
    .catchall {:try_start_2 .. :try_end_64} :catchall_65

    return-object p0

    :catchall_65
    if-nez p1, :cond_68

    move-object p1, v0

    :cond_68
    return-object p1
.end method

.method static sourceCaptionUrl(Ljava/lang/String;)Ljava/lang/String;
    .registers 12

    if-nez p0, :cond_4

    const/4 p0, 0x0

    return-object p0

    :cond_4
    const/16 v0, 0x23

    .line 40
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 41
    const-string v1, ""

    if-ltz v0, :cond_13

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_14

    :cond_13
    move-object v2, v1

    :goto_14
    const/4 v3, 0x0

    if-ltz v0, :cond_1b

    .line 43
    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    :cond_1b
    const/16 v0, 0x3f

    .line 46
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ltz v0, :cond_9e

    .line 47
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-ne v0, v4, :cond_2d

    goto/16 :goto_9e

    .line 51
    :cond_2d
    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    add-int/lit8 v0, v0, 0x1

    .line 52
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    const/4 v0, -0x1

    .line 53
    const-string v5, "&"

    invoke-virtual {p0, v5, v0}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object p0

    .line 54
    new-instance v0, Ljava/util/ArrayList;

    array-length v6, p0

    invoke-direct {v0, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 55
    array-length v6, p0

    move v7, v3

    :goto_46
    if-ge v7, v6, :cond_72

    aget-object v8, p0, v7

    .line 56
    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_51

    goto :goto_6f

    :cond_51
    const/16 v9, 0x3d

    .line 57
    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v9

    if-gez v9, :cond_5b

    move-object v9, v8

    goto :goto_5f

    .line 58
    :cond_5b
    invoke-virtual {v8, v3, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 61
    :goto_5f
    :try_start_5f
    invoke-static {v9}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9
    :try_end_63
    .catchall {:try_start_5f .. :try_end_63} :catchall_63

    .line 65
    :catchall_63
    const-string v10, "tlang"

    invoke-virtual {v10, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_6c

    goto :goto_6f

    .line 66
    :cond_6c
    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_6f
    add-int/lit8 v7, v7, 0x1

    goto :goto_46

    .line 68
    :cond_72
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_81

    goto :goto_93

    :cond_81
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "?"

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v5, v0}, Lapp/yydarlinker/deepseekcaptions/RebuildClock$$ExternalSyntheticBackport0;->m(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_93
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 48
    :cond_9e
    :goto_9e
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
