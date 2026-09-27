.class final Lapp/yydarlinker/deepseekcaptions/RebuildCache;
.super Ljava/lang/Object;
.source "RebuildCache.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static declared-synchronized clear(Landroid/content/Context;)V
    .registers 6

    const-class v0, Lapp/yydarlinker/deepseekcaptions/RebuildCache;

    monitor-enter v0

    .line 44
    :try_start_3
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/RebuildCache;->directory(Landroid/content/Context;)Ljava/io/File;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p0

    if-eqz p0, :cond_1f

    .line 45
    array-length v1, p0

    const/4 v2, 0x0

    :goto_f
    if-ge v2, v1, :cond_1f

    aget-object v3, p0, v2

    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    move-result v4

    if-eqz v4, :cond_1c

    invoke-virtual {v3}, Ljava/io/File;->delete()Z
    :try_end_1c
    .catchall {:try_start_3 .. :try_end_1c} :catchall_21

    :cond_1c
    add-int/lit8 v2, v2, 0x1

    goto :goto_f

    .line 46
    :cond_1f
    monitor-exit v0

    return-void

    :catchall_21
    move-exception p0

    :try_start_22
    monitor-exit v0
    :try_end_23
    .catchall {:try_start_22 .. :try_end_23} :catchall_21

    throw p0
.end method

.method static directory(Landroid/content/Context;)Ljava/io/File;
    .registers 3

    .line 49
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object p0

    const-string v1, "caption-events-r2.12"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 50
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p0

    if-nez p0, :cond_14

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    :cond_14
    return-object v0
.end method

.method static hash(Ljava/lang/String;)Ljava/lang/String;
    .registers 9

    .line 15
    :try_start_0
    const-string v0, "SHA-256"

    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object p0

    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    array-length v1, p0

    const/4 v2, 0x0

    move v3, v2

    :goto_18
    if-ge v3, v1, :cond_35

    aget-byte v4, p0, v3

    sget-object v5, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v6, "%02x"

    and-int/lit16 v4, v4, 0xff

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v4, v7, v2

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_18

    .line 18
    :cond_35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_39
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_39} :catch_3a

    return-object p0

    :catch_3a
    move-exception p0

    .line 20
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method static identity(Lapp/yydarlinker/deepseekcaptions/RebuildSource;Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 25
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "event-rebuild-r2.12|"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    invoke-virtual {p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig$Snapshot;->fingerprint()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p1, 0x7c

    .line 29
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 30
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildSource;->words:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1c
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_4d

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;

    const/16 p2, 0xa

    .line 32
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-wide v1, p1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->start:J

    .line 33
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const/16 p2, 0x3a

    .line 34
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-wide v1, p1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->end:J

    .line 35
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 36
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v1, p1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->precision:Lapp/yydarlinker/deepseekcaptions/RebuildSource$Precision;

    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 38
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object p1, p1, Lapp/yydarlinker/deepseekcaptions/RebuildSource$Word;->text:Ljava/lang/String;

    .line 39
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1c

    .line 40
    :cond_4d
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/RebuildCache;->hash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$write$0(Ljava/io/File;Ljava/lang/String;)Z
    .registers 2

    .line 84
    const-string p0, ".json"

    invoke-virtual {p1, p0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static read(Landroid/content/Context;Ljava/lang/String;Lapp/yydarlinker/deepseekcaptions/RebuildSource;Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;)Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;
    .registers 9

    .line 55
    new-instance v0, Ljava/io/File;

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/RebuildCache;->directory(Landroid/content/Context;)Ljava/io/File;

    move-result-object p0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "-"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->id()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ".json"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 56
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result p0

    const/4 p1, 0x0

    if-nez p0, :cond_2e

    return-object p1

    .line 58
    :cond_2e
    :try_start_2e
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v1

    const-wide/32 v3, 0x3e800

    cmp-long p0, v1, v3

    if-gtz p0, :cond_56

    .line 59
    new-instance p0, Ljava/lang/String;

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/io/File;)Ljava/nio/file/Path;

    move-result-object v1

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/nio/file/Path;)[B

    move-result-object v1

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {p0, v1, v2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 60
    invoke-static {p0, p2, p3}, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol;->parseBound(Ljava/lang/String;Lapp/yydarlinker/deepseekcaptions/RebuildSource;Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;)Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;

    move-result-object p0

    .line 61
    iget-object p2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->issues:Ljava/util/List;

    invoke-static {p2}, Lapp/yydarlinker/deepseekcaptions/RebuildReview;->score(Ljava/util/List;)I

    move-result p2

    if-nez p2, :cond_55

    return-object p0

    :cond_55
    return-object p1

    .line 58
    :cond_56
    new-instance p0, Ljava/io/IOException;

    const-string p2, "oversized"

    invoke-direct {p0, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_5e
    .catch Ljava/lang/Exception; {:try_start_2e .. :try_end_5e} :catch_5e

    .line 63
    :catch_5e
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    return-object p1
.end method

.method static declared-synchronized write(Landroid/content/Context;Ljava/lang/String;Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;)V
    .registers 9

    const-class v0, Lapp/yydarlinker/deepseekcaptions/RebuildCache;

    monitor-enter v0

    .line 70
    :try_start_3
    iget-object v1, p3, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->issues:Ljava/util/List;

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/RebuildReview;->score(Ljava/util/List;)I

    move-result v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_cf

    if-lez v1, :cond_d

    monitor-exit v0

    return-void

    .line 71
    :cond_d
    :try_start_d
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/RebuildCache;->directory(Landroid/content/Context;)Ljava/io/File;

    move-result-object p0

    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "-"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Lapp/yydarlinker/deepseekcaptions/RebuildPlanner$Block;->id()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ".json"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_33
    .catchall {:try_start_d .. :try_end_33} :catchall_cf

    const/4 p1, 0x0

    .line 74
    :try_start_34
    const-string p2, "events-"

    const-string v2, ".tmp"

    invoke-static {p2, v2, p0}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object p1

    .line 75
    new-instance p2, Ljava/io/FileOutputStream;

    invoke-direct {p2, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_41
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_41} :catch_ca
    .catchall {:try_start_34 .. :try_end_41} :catchall_c3

    .line 76
    :try_start_41
    iget-object p3, p3, Lapp/yydarlinker/deepseekcaptions/RebuildProtocol$Plan;->json:Ljava/lang/String;

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p3, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/io/FileOutputStream;->write([B)V

    .line 77
    invoke-virtual {p2}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object p3

    invoke-virtual {p3}, Ljava/io/FileDescriptor;->sync()V
    :try_end_53
    .catchall {:try_start_41 .. :try_end_53} :catchall_b9

    .line 78
    :try_start_53
    invoke-virtual {p2}, Ljava/io/FileOutputStream;->close()V

    .line 80
    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/io/File;)Ljava/nio/file/Path;

    move-result-object p2

    .line 81
    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/io/File;)Ljava/nio/file/Path;

    move-result-object p3

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/nio/file/CopyOption;

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m()Ljava/nio/file/StandardCopyOption;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m$1()Ljava/nio/file/StandardCopyOption;

    move-result-object v2

    const/4 v4, 0x1

    aput-object v2, v1, v4

    .line 79
    invoke-static {p2, p3, v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/nio/file/Path;Ljava/nio/file/Path;[Ljava/nio/file/CopyOption;)Ljava/nio/file/Path;

    .line 84
    new-instance p2, Lapp/yydarlinker/deepseekcaptions/RebuildCache$$ExternalSyntheticLambda6;

    invoke-direct {p2}, Lapp/yydarlinker/deepseekcaptions/RebuildCache$$ExternalSyntheticLambda6;-><init>()V

    invoke-virtual {p0, p2}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object p0
    :try_end_7b
    .catch Ljava/lang/Exception; {:try_start_53 .. :try_end_7b} :catch_ca
    .catchall {:try_start_53 .. :try_end_7b} :catchall_c3

    if-nez p0, :cond_84

    if-eqz p1, :cond_82

    .line 94
    :try_start_7f
    invoke-virtual {p1}, Ljava/io/File;->delete()Z
    :try_end_82
    .catchall {:try_start_7f .. :try_end_82} :catchall_cf

    .line 85
    :cond_82
    monitor-exit v0

    return-void

    .line 86
    :cond_84
    :try_start_84
    new-instance p2, Lapp/yydarlinker/deepseekcaptions/DiskCaptionCache$$ExternalSyntheticLambda2;

    invoke-direct {p2}, Lapp/yydarlinker/deepseekcaptions/DiskCaptionCache$$ExternalSyntheticLambda2;-><init>()V

    invoke-static {p2}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/function/ToLongFunction;)Ljava/util/Comparator;

    move-result-object p2

    invoke-static {p2}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles$$ExternalSyntheticApiModelOutline0;->m(Ljava/util/Comparator;)Ljava/util/Comparator;

    move-result-object p2

    invoke-static {p0, p2}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    const-wide/16 p2, 0x0

    .line 88
    :goto_96
    array-length v1, p0

    if-ge v3, v1, :cond_b3

    .line 89
    aget-object v1, p0, v3

    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v1

    add-long/2addr p2, v1

    const/16 v1, 0x100

    if-ge v3, v1, :cond_ab

    const-wide/32 v1, 0x4000000

    cmp-long v1, p2, v1

    if-lez v1, :cond_b0

    .line 90
    :cond_ab
    aget-object v1, p0, v3

    invoke-virtual {v1}, Ljava/io/File;->delete()Z
    :try_end_b0
    .catch Ljava/lang/Exception; {:try_start_84 .. :try_end_b0} :catch_ca
    .catchall {:try_start_84 .. :try_end_b0} :catchall_c3

    :cond_b0
    add-int/lit8 v3, v3, 0x1

    goto :goto_96

    :cond_b3
    if-eqz p1, :cond_cd

    .line 94
    :goto_b5
    :try_start_b5
    invoke-virtual {p1}, Ljava/io/File;->delete()Z
    :try_end_b8
    .catchall {:try_start_b5 .. :try_end_b8} :catchall_cf

    goto :goto_cd

    :catchall_b9
    move-exception p0

    .line 75
    :try_start_ba
    invoke-virtual {p2}, Ljava/io/FileOutputStream;->close()V
    :try_end_bd
    .catchall {:try_start_ba .. :try_end_bd} :catchall_be

    goto :goto_c2

    :catchall_be
    move-exception p2

    :try_start_bf
    invoke-virtual {p0, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_c2
    throw p0
    :try_end_c3
    .catch Ljava/lang/Exception; {:try_start_bf .. :try_end_c3} :catch_ca
    .catchall {:try_start_bf .. :try_end_c3} :catchall_c3

    :catchall_c3
    move-exception p0

    if-eqz p1, :cond_c9

    .line 94
    :try_start_c6
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 95
    :cond_c9
    throw p0
    :try_end_ca
    .catchall {:try_start_c6 .. :try_end_ca} :catchall_cf

    :catch_ca
    if-eqz p1, :cond_cd

    goto :goto_b5

    .line 96
    :cond_cd
    :goto_cd
    monitor-exit v0

    return-void

    :catchall_cf
    move-exception p0

    :try_start_d0
    monitor-exit v0
    :try_end_d1
    .catchall {:try_start_d0 .. :try_end_d1} :catchall_cf

    throw p0
.end method
