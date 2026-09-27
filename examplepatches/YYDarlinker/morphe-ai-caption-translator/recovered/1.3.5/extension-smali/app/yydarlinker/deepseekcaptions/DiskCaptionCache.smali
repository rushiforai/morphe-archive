.class final Lapp/yydarlinker/deepseekcaptions/DiskCaptionCache;
.super Ljava/lang/Object;
.source "DiskCaptionCache.java"


# static fields
.field private static final MAX_BYTES:J = 0x9600000L

.field private static final MAX_FILES:I = 0x12c

.field private static final VERSION:Ljava/lang/String; = "deepseek-caption-v10-source-atom-salvage"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static clear(Landroid/content/Context;)V
    .registers 4

    .line 97
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DiskCaptionCache;->directory(Landroid/content/Context;)Ljava/io/File;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p0

    if-nez p0, :cond_b

    goto :goto_17

    .line 99
    :cond_b
    array-length v0, p0

    const/4 v1, 0x0

    :goto_d
    if-ge v1, v0, :cond_17

    aget-object v2, p0, v1

    .line 101
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    :cond_17
    :goto_17
    return-void
.end method

.method private static directory(Landroid/content/Context;)Ljava/io/File;
    .registers 3

    .line 106
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object p0

    const-string v1, "deepseek-captions"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 107
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result p0

    if-nez p0, :cond_14

    .line 109
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    :cond_14
    return-object v0
.end method

.method static get(Landroid/content/Context;Ljava/lang/String;)[B
    .registers 7

    .line 44
    new-instance v0, Ljava/io/File;

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DiskCaptionCache;->directory(Landroid/content/Context;)Ljava/io/File;

    move-result-object p0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ".caption"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 45
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result p0

    const/4 p1, 0x0

    if-nez p0, :cond_22

    return-object p1

    .line 47
    :cond_22
    :try_start_22
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long p0, v1, v3

    if-lez p0, :cond_6d

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v1

    const-wide/32 v3, 0x1000000

    cmp-long p0, v1, v3

    if-lez p0, :cond_38

    goto :goto_6d

    .line 52
    :cond_38
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v1

    long-to-int p0, v1

    new-array v1, p0, [B

    .line 53
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_44
    .catchall {:try_start_22 .. :try_end_44} :catchall_70

    const/4 v3, 0x0

    :goto_45
    if-ge v3, p0, :cond_5c

    sub-int v4, p0, v3

    .line 56
    :try_start_49
    invoke-virtual {v2, v1, v3, v4}, Ljava/io/FileInputStream;->read([BII)I

    move-result v4
    :try_end_4d
    .catchall {:try_start_49 .. :try_end_4d} :catchall_52

    if-gez v4, :cond_50

    goto :goto_5c

    :cond_50
    add-int/2addr v3, v4

    goto :goto_45

    :catchall_52
    move-exception p0

    .line 53
    :try_start_53
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_56
    .catchall {:try_start_53 .. :try_end_56} :catchall_57

    goto :goto_5b

    :catchall_57
    move-exception v0

    :try_start_58
    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_5b
    throw p0

    :cond_5c
    :goto_5c
    if-eq v3, p0, :cond_62

    .line 61
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    return-object p1

    :cond_62
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    .line 63
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/io/File;->setLastModified(J)Z

    return-object v1

    .line 49
    :cond_6d
    :goto_6d
    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_70
    .catchall {:try_start_58 .. :try_end_70} :catchall_70

    :catchall_70
    return-object p1
.end method

.method private static hex([B)Ljava/lang/String;
    .registers 8

    .line 134
    new-instance v0, Ljava/lang/StringBuilder;

    array-length v1, p0

    mul-int/lit8 v1, v1, 0x2

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 135
    array-length v1, p0

    const/4 v2, 0x0

    move v3, v2

    :goto_b
    if-ge v3, v1, :cond_28

    aget-byte v4, p0, v3

    sget-object v5, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    and-int/lit16 v4, v4, 0xff

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v4, v6, v2

    const-string v4, "%02x"

    invoke-static {v5, v4, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_b

    .line 136
    :cond_28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static key([BLapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 31
    const-string v0, "SHA-256"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 32
    const-string v1, "deepseek-caption-v10-source-atom-salvage"

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->update([B)V

    const/4 v1, 0x0

    .line 33
    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->update(B)V

    .line 34
    invoke-virtual {p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->fingerprint()Ljava/lang/String;

    move-result-object p1

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/security/MessageDigest;->update([B)V

    .line 35
    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->update(B)V

    if-nez p2, :cond_29

    .line 36
    const-string p2, ""

    :cond_29
    sget-object p1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 37
    invoke-virtual {p2, p1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    .line 36
    invoke-virtual {v0, p1}, Ljava/security/MessageDigest;->update([B)V

    .line 38
    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->update(B)V

    .line 39
    invoke-virtual {v0, p0}, Ljava/security/MessageDigest;->update([B)V

    .line 40
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object p0

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DiskCaptionCache;->hex([B)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$trim$0(Ljava/io/File;Ljava/lang/String;)Z
    .registers 2

    .line 115
    const-string p0, ".caption"

    invoke-virtual {p1, p0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static put(Landroid/content/Context;Ljava/lang/String;[B)V
    .registers 8

    if-eqz p2, :cond_86

    .line 71
    array-length v0, p2

    if-eqz v0, :cond_86

    array-length v0, p2

    const/high16 v1, 0x1000000

    if-le v0, v1, :cond_c

    goto/16 :goto_86

    .line 72
    :cond_c
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DiskCaptionCache;->directory(Landroid/content/Context;)Ljava/io/File;

    move-result-object p0

    .line 73
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".caption"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 74
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ".tmp-"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Thread;->getId()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 76
    :try_start_47
    new-instance p1, Ljava/io/FileOutputStream;

    invoke-direct {p1, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_4c
    .catchall {:try_start_47 .. :try_end_4c} :catchall_83

    .line 77
    :try_start_4c
    invoke-virtual {p1, p2}, Ljava/io/FileOutputStream;->write([B)V

    .line 78
    invoke-virtual {p1}, Ljava/io/FileOutputStream;->flush()V
    :try_end_52
    .catchall {:try_start_4c .. :try_end_52} :catchall_79

    .line 79
    :try_start_52
    invoke-virtual {p1}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object p2

    invoke-virtual {p2}, Ljava/io/FileDescriptor;->sync()V
    :try_end_59
    .catchall {:try_start_52 .. :try_end_59} :catchall_59

    .line 80
    :catchall_59
    :try_start_59
    invoke-virtual {p1}, Ljava/io/FileOutputStream;->close()V

    .line 81
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_6c

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result p1

    if-nez p1, :cond_6c

    .line 84
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    goto :goto_75

    .line 85
    :cond_6c
    invoke-virtual {v1, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p1

    if-nez p1, :cond_75

    .line 87
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 89
    :cond_75
    :goto_75
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DiskCaptionCache;->trim(Ljava/io/File;)V
    :try_end_78
    .catchall {:try_start_59 .. :try_end_78} :catchall_83

    goto :goto_86

    :catchall_79
    move-exception p0

    .line 76
    :try_start_7a
    invoke-virtual {p1}, Ljava/io/FileOutputStream;->close()V
    :try_end_7d
    .catchall {:try_start_7a .. :try_end_7d} :catchall_7e

    goto :goto_82

    :catchall_7e
    move-exception p1

    :try_start_7f
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_82
    throw p0
    :try_end_83
    .catchall {:try_start_7f .. :try_end_83} :catchall_83

    .line 92
    :catchall_83
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    :cond_86
    :goto_86
    return-void
.end method

.method private static trim(Ljava/io/File;)V
    .registers 9

    .line 115
    new-instance v0, Lapp/yydarlinker/deepseekcaptions/DiskCaptionCache$$ExternalSyntheticLambda1;

    invoke-direct {v0}, Lapp/yydarlinker/deepseekcaptions/DiskCaptionCache$$ExternalSyntheticLambda1;-><init>()V

    invoke-virtual {p0, v0}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object p0

    if-eqz p0, :cond_73

    .line 116
    array-length v0, p0

    if-nez v0, :cond_f

    goto :goto_73

    .line 117
    :cond_f
    new-instance v0, Ljava/util/ArrayList;

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 118
    new-instance p0, Lapp/yydarlinker/deepseekcaptions/DiskCaptionCache$$ExternalSyntheticLambda2;

    invoke-direct {p0}, Lapp/yydarlinker/deepseekcaptions/DiskCaptionCache$$ExternalSyntheticLambda2;-><init>()V

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/function/ToLongFunction;)Ljava/util/Comparator;

    move-result-object p0

    invoke-static {v0, p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/List;Ljava/util/Comparator;)V

    .line 121
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const-wide/16 v1, 0x0

    move-wide v3, v1

    :goto_2b
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_41

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v5

    invoke-static {v1, v2, v5, v6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v5

    add-long/2addr v3, v5

    goto :goto_2b

    .line 122
    :cond_41
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p0

    .line 123
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_49
    :goto_49
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_73

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/io/File;

    const-wide/32 v6, 0x9600000

    cmp-long v6, v3, v6

    if-gtz v6, :cond_61

    const/16 v6, 0x12c

    if-gt p0, v6, :cond_61

    goto :goto_73

    .line 125
    :cond_61
    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v6

    invoke-static {v1, v2, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    .line 126
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    move-result v5

    if-eqz v5, :cond_49

    sub-long/2addr v3, v6

    add-int/lit8 p0, p0, -0x1

    goto :goto_49

    :cond_73
    :goto_73
    return-void
.end method
