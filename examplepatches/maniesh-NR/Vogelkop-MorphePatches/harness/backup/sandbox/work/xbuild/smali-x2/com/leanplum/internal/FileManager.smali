.class public Lcom/leanplum/internal/FileManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/leanplum/internal/FileManager$HashResults;,
        Lcom/leanplum/internal/FileManager$DownloadFileResult;,
        Lcom/leanplum/internal/FileManager$ResourceUpdateCallback;
    }
.end annotation


# static fields
.field public static filenameToURLs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static initializing:Z

.field static final initializingLock:Ljava/lang/Object;

.field private static isInitialized:Z

.field public static resources:Lcom/leanplum/Var;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/leanplum/Var<",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private static updateCallback:Lcom/leanplum/internal/FileManager$ResourceUpdateCallback;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/leanplum/internal/FileManager;->initializingLock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic access$000(Ljava/util/List;Ljava/util/List;)V
    .registers 2

    invoke-static {p0, p1}, Lcom/leanplum/internal/FileManager;->enableResourceSyncing(Ljava/util/List;Ljava/util/List;)V

    return-void
.end method

.method private static appBundlePath()Ljava/lang/String;
    .registers 1

    const-string v0, ""

    return-object v0
.end method

.method private static bundlePath()Ljava/lang/String;
    .registers 3

    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Leanplum_Bundle"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static compilePatterns(Ljava/util/List;)Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/util/regex/Pattern;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p0, :cond_9

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Ljava/util/ArrayList;-><init>(I)V

    return-object p0

    :cond_9
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_16
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_38

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    :try_start_22
    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_29
    .catch Ljava/util/regex/PatternSyntaxException; {:try_start_22 .. :try_end_29} :catch_2a

    goto :goto_16

    :catch_2a
    const-string v3, "Ignoring malformed resource syncing pattern: \""

    const-string v4, "\". Patterns must be regular expressions."

    invoke-static {v3, v2, v4}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-array v3, v0, [Ljava/lang/Object;

    invoke-static {v2, v3}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_16

    :cond_38
    return-object v1
.end method

.method private static documentsPath()Ljava/lang/String;
    .registers 3

    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_12

    const-string v1, "Leanplum_Documents"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_12
    const/4 v0, 0x0

    return-object v0
.end method

.method private static enableResourceSyncing(Ljava/util/List;Ljava/util/List;)V
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/regex/Pattern;",
            ">;",
            "Ljava/util/List<",
            "Ljava/util/regex/Pattern;",
            ">;)V"
        }
    .end annotation

    const-string v0, "__Android Resources"

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0, v1}, Lcom/leanplum/Var;->define(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/Var;

    move-result-object v0

    sput-object v0, Lcom/leanplum/internal/FileManager;->resources:Lcom/leanplum/Var;

    const-string v0, "res/drawable"

    const-string v1, "res/layout"

    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    :try_start_17
    new-instance v5, Ljava/util/zip/ZipInputStream;

    new-instance v6, Ljava/io/FileInputStream;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageResourcePath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v6, v2}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v5, v6}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_25
    .catch Ljava/io/IOException; {:try_start_17 .. :try_end_25} :catch_f8
    .catchall {:try_start_17 .. :try_end_25} :catchall_13c

    :cond_25
    :goto_25
    :try_start_25
    invoke-virtual {v5}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v2

    if-eqz v2, :cond_df

    invoke-virtual {v2}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_3b

    invoke-virtual {v4, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_25

    :cond_3b
    const/4 v6, 0x4

    invoke-virtual {v4, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    if-eqz p0, :cond_62

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v7

    if-lez v7, :cond_62

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_4c
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_25

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/regex/Pattern;

    invoke-virtual {v8, v6}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/regex/Matcher;->matches()Z

    move-result v8

    if-eqz v8, :cond_4c

    :cond_62
    if-eqz p1, :cond_7f

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_68
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_7f

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/regex/Pattern;

    invoke-virtual {v8, v6}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/regex/Matcher;->matches()Z

    move-result v8

    if-eqz v8, :cond_68

    goto :goto_25

    :cond_7f
    new-instance v7, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v7}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v8, 0x2000

    new-array v8, v8, [B

    move v9, v3

    :goto_89
    invoke-virtual {v5, v8}, Ljava/io/InputStream;->read([B)I

    move-result v10

    const/4 v11, -0x1

    if-eq v10, v11, :cond_95

    invoke-virtual {v7, v8, v3, v10}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    add-int/2addr v9, v10

    goto :goto_89

    :cond_95
    invoke-virtual {v5}, Ljava/util/zip/ZipInputStream;->closeEntry()V

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, ""

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/util/zip/ZipEntry;->getTime()J

    move-result-wide v10

    invoke-virtual {v8, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, ""

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "__Android Resources."

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, "."

    const-string v11, "\\."

    invoke-virtual {v6, v10, v11}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v6

    const/16 v10, 0x2f

    const/16 v11, 0x2e

    invoke-virtual {v6, v10, v11}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v7

    invoke-static {v6, v4, v9, v2, v7}, Lcom/leanplum/Var;->defineResource(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;[B)Lcom/leanplum/Var;
    :try_end_dd
    .catch Ljava/io/IOException; {:try_start_25 .. :try_end_dd} :catch_f5
    .catchall {:try_start_25 .. :try_end_dd} :catchall_f2

    goto/16 :goto_25

    :cond_df
    :try_start_df
    invoke-virtual {v5}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_e2
    .catch Ljava/io/IOException; {:try_start_df .. :try_end_e2} :catch_e3

    goto :goto_127

    :catch_e3
    move-exception p0

    const-string p1, "Failed to close ZipInputStream."

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_127

    :catchall_f2
    move-exception p0

    move-object v4, v5

    goto :goto_13d

    :catch_f5
    move-exception p0

    move-object v4, v5

    goto :goto_f9

    :catch_f8
    move-exception p0

    :goto_f9
    :try_start_f9
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Error occurred when trying to enable resource syncing."

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-array p1, v3, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_113
    .catchall {:try_start_f9 .. :try_end_113} :catchall_13c

    if-eqz v4, :cond_127

    :try_start_115
    invoke-virtual {v4}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_118
    .catch Ljava/io/IOException; {:try_start_115 .. :try_end_118} :catch_119

    goto :goto_127

    :catch_119
    move-exception p0

    const-string p1, "Failed to close ZipInputStream."

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_127
    :goto_127
    const/4 p0, 0x1

    sput-boolean p0, Lcom/leanplum/internal/FileManager;->isInitialized:Z

    sget-object p0, Lcom/leanplum/internal/FileManager;->initializingLock:Ljava/lang/Object;

    monitor-enter p0

    :try_start_12d
    sput-boolean v3, Lcom/leanplum/internal/FileManager;->initializing:Z

    sget-object p1, Lcom/leanplum/internal/FileManager;->updateCallback:Lcom/leanplum/internal/FileManager$ResourceUpdateCallback;

    if-eqz p1, :cond_136

    invoke-interface {p1}, Lcom/leanplum/internal/FileManager$ResourceUpdateCallback;->onResourceSyncFinish()V

    :cond_136
    monitor-exit p0

    return-void

    :goto_138
    monitor-exit p0
    :try_end_139
    .catchall {:try_start_12d .. :try_end_139} :catchall_13a

    throw p1

    :catchall_13a
    move-exception p1

    goto :goto_138

    :catchall_13c
    move-exception p0

    :goto_13d
    if-eqz v4, :cond_151

    :try_start_13f
    invoke-virtual {v4}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_142
    .catch Ljava/io/IOException; {:try_start_13f .. :try_end_142} :catch_143

    goto :goto_151

    :catch_143
    move-exception p1

    const-string v0, "Failed to close ZipInputStream."

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_151
    :goto_151
    throw p0
.end method

.method public static enableResourceSyncing(Ljava/util/List;Ljava/util/List;Z)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    const/4 v0, 0x1

    .line 338
    sput-boolean v0, Lcom/leanplum/internal/FileManager;->initializing:Z

    .line 339
    sget-boolean v0, Lcom/leanplum/internal/FileManager;->isInitialized:Z

    if-eqz v0, :cond_8

    return-void

    .line 340
    :cond_8
    :try_start_8
    invoke-static {p0}, Lcom/leanplum/internal/FileManager;->compilePatterns(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    .line 341
    invoke-static {p1}, Lcom/leanplum/internal/FileManager;->compilePatterns(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    if-eqz p2, :cond_1f

    .line 342
    invoke-static {}, Lcom/leanplum/internal/OperationQueue;->sharedInstance()Lcom/leanplum/internal/OperationQueue;

    move-result-object p2

    new-instance v0, Lcom/leanplum/internal/FileManager$1;

    invoke-direct {v0, p0, p1}, Lcom/leanplum/internal/FileManager$1;-><init>(Ljava/util/List;Ljava/util/List;)V

    invoke-virtual {p2, v0}, Lcom/leanplum/internal/OperationQueue;->addParallelOperation(Ljava/lang/Runnable;)V

    return-void

    .line 343
    :cond_1f
    invoke-static {p0, p1}, Lcom/leanplum/internal/FileManager;->enableResourceSyncing(Ljava/util/List;Ljava/util/List;)V
    :try_end_22
    .catchall {:try_start_8 .. :try_end_22} :catchall_23

    return-void

    :catchall_23
    move-exception p0

    .line 344
    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static fileExistsAtPath(Ljava/lang/String;)Z
    .registers 2

    if-eqz p0, :cond_f

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p0

    if-eqz p0, :cond_f

    const/4 p0, 0x1

    return p0

    :cond_f
    const/4 p0, 0x0

    return p0
.end method

.method public static fileMD5HashCreateWithPath(Ljava/io/InputStream;)Lcom/leanplum/internal/FileManager$HashResults;
    .registers 9

    const-string v0, "Failed to close InputStream."

    const/4 v1, 0x0

    :try_start_3
    const-string v2, "MD5"

    invoke-static {v2}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2
    :try_end_9
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_3 .. :try_end_9} :catch_7a
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_9} :catch_75

    :try_start_9
    new-instance v3, Ljava/security/DigestInputStream;

    invoke-direct {v3, p0, v2}, Ljava/security/DigestInputStream;-><init>(Ljava/io/InputStream;Ljava/security/MessageDigest;)V
    :try_end_e
    .catchall {:try_start_9 .. :try_end_e} :catchall_5f

    const/16 p0, 0x2000

    :try_start_10
    new-array p0, p0, [B

    const/4 v4, 0x0

    move v5, v4

    :goto_14
    invoke-virtual {v3, p0}, Ljava/io/InputStream;->read([B)I

    move-result v6
    :try_end_18
    .catchall {:try_start_10 .. :try_end_18} :catchall_5d

    const/4 v7, -0x1

    if-eq v6, v7, :cond_1d

    add-int/2addr v5, v6

    goto :goto_14

    :cond_1d
    :try_start_1d
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_20
    .catch Ljava/io/IOException; {:try_start_1d .. :try_end_20} :catch_21
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1d .. :try_end_20} :catch_7a

    goto :goto_2d

    :catch_21
    move-exception p0

    :try_start_22
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    :goto_2d
    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    move-result-object p0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    array-length v2, p0

    :goto_37
    if-ge v4, v2, :cond_53

    aget-byte v3, p0, v4

    and-int/lit16 v3, v3, 0xff

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    const/4 v7, 0x1

    if-ne v6, v7, :cond_4d

    const/16 v6, 0x30

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_4d
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x1

    goto :goto_37

    :cond_53
    new-instance p0, Lcom/leanplum/internal/FileManager$HashResults;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, v5}, Lcom/leanplum/internal/FileManager$HashResults;-><init>(Ljava/lang/String;I)V
    :try_end_5c
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_22 .. :try_end_5c} :catch_7a
    .catch Ljava/io/IOException; {:try_start_22 .. :try_end_5c} :catch_75

    return-object p0

    :catchall_5d
    move-exception p0

    goto :goto_62

    :catchall_5f
    move-exception v2

    move-object v3, p0

    move-object p0, v2

    :goto_62
    if-eqz v3, :cond_74

    :try_start_64
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_67
    .catch Ljava/io/IOException; {:try_start_64 .. :try_end_67} :catch_68
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_64 .. :try_end_67} :catch_7a

    goto :goto_74

    :catch_68
    move-exception v2

    :try_start_69
    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_74
    :goto_74
    throw p0
    :try_end_75
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_69 .. :try_end_75} :catch_7a
    .catch Ljava/io/IOException; {:try_start_69 .. :try_end_75} :catch_75

    :catch_75
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    return-object v1

    :catch_7a
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    return-object v1
.end method

.method private static fileRelativeTo(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    const-string v0, "/"

    invoke-static {p0, v0, p1}, Lsko;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static fileRelativeToAppBundle(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    if-nez p0, :cond_4

    const/4 p0, 0x0

    return-object p0

    :cond_4
    invoke-static {}, Lcom/leanplum/internal/FileManager;->appBundlePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/leanplum/internal/FileManager;->fileRelativeTo(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static fileRelativeToDocuments(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    if-nez p0, :cond_4

    const/4 p0, 0x0

    return-object p0

    :cond_4
    invoke-static {}, Lcom/leanplum/internal/FileManager;->documentsPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/leanplum/internal/FileManager;->fileRelativeTo(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static fileRelativeToLPBundle(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    if-nez p0, :cond_4

    const/4 p0, 0x0

    return-object p0

    :cond_4
    invoke-static {}, Lcom/leanplum/internal/FileManager;->bundlePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/leanplum/internal/FileManager;->fileRelativeTo(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static fileValue(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    const/4 v0, 0x0

    .line 124
    invoke-static {p0, p0, v0}, Lcom/leanplum/internal/FileManager;->fileValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static fileValue(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/String;
    .registers 5

    if-nez p0, :cond_4

    const/4 p0, 0x0

    return-object p0

    :cond_4
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    invoke-static {p1}, Lcom/leanplum/internal/FileManager;->fileRelativeToAppBundle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/leanplum/internal/FileManager;->fileExistsAtPath(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_15

    return-object v0

    :cond_15
    if-nez p2, :cond_41

    :try_start_17
    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p2

    invoke-virtual {p2, p0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_23} :catch_48
    .catchall {:try_start_17 .. :try_end_23} :catchall_3f

    if-eqz p1, :cond_47

    :try_start_25
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_28} :catch_29

    return-object p0

    :catch_29
    move-exception p1

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Failed to close InputStream: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    new-array p2, p2, [Ljava/lang/Object;

    invoke-static {p1, p2}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object p0

    :catchall_3f
    move-exception p0

    throw p0

    :cond_41
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_48

    :cond_47
    return-object p0

    :catch_48
    :cond_48
    invoke-static {p0}, Lcom/leanplum/internal/FileManager;->fileRelativeToLPBundle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/leanplum/internal/FileManager;->fileExistsAtPath(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_7b

    invoke-static {p0}, Lcom/leanplum/internal/FileManager;->fileRelativeToDocuments(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/leanplum/internal/FileManager;->fileExistsAtPath(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_7b

    invoke-static {p0}, Lcom/leanplum/internal/FileManager;->fileRelativeToAppBundle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/leanplum/internal/FileManager;->fileExistsAtPath(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_7b

    invoke-static {p1}, Lcom/leanplum/internal/FileManager;->fileRelativeToLPBundle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/leanplum/internal/FileManager;->fileExistsAtPath(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_7b

    invoke-static {p1}, Lcom/leanplum/internal/FileManager;->fileRelativeToAppBundle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/leanplum/internal/FileManager;->fileExistsAtPath(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_7b

    return-object p1

    :cond_7b
    return-object p2
.end method

.method public static getFileSize(Ljava/lang/String;)I
    .registers 3

    if-nez p0, :cond_4

    const/4 p0, -0x1

    return p0

    :cond_4
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    long-to-int p0, v0

    return p0
.end method

.method public static initializing()Z
    .registers 1

    sget-boolean v0, Lcom/leanplum/internal/FileManager;->initializing:Z

    return v0
.end method

.method public static isNewerLocally(Ljava/util/Map;Ljava/util/Map;)Z
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation

    const/4 v0, 0x1

    if-nez p1, :cond_4

    return v0

    :cond_4
    const-string v1, "hash"

    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v3, "size"

    invoke-interface {p0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-interface {p1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    if-eqz p1, :cond_36

    if-eqz p0, :cond_2a

    invoke-virtual {p0, p1}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_36

    :cond_2a
    if-eqz v2, :cond_34

    if-eqz v1, :cond_36

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_36

    :cond_34
    const/4 p0, 0x0

    return p0

    :cond_36
    return v0
.end method

.method public static isResourceSyncingEnabled()Z
    .registers 1

    sget-boolean v0, Lcom/leanplum/internal/FileManager;->initializing:Z

    if-nez v0, :cond_a

    sget-boolean v0, Lcom/leanplum/internal/FileManager;->isInitialized:Z

    if-nez v0, :cond_a

    const/4 v0, 0x0

    return v0

    :cond_a
    const/4 v0, 0x1

    return v0
.end method

.method public static maybeDownloadFile(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)Lcom/leanplum/internal/FileManager$DownloadFileResult;
    .registers 6

    const-string v0, "Failed to close InputStream."

    if-eqz p1, :cond_a4

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_a4

    if-eqz p0, :cond_12

    invoke-static {p1}, Lcom/leanplum/internal/VarCache;->getResIdFromPath(Ljava/lang/String;)I

    move-result p0

    if-nez p0, :cond_a4

    :cond_12
    const/4 p0, 0x0

    :try_start_13
    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p2

    invoke-virtual {p2, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0

    if-eqz p0, :cond_38

    sget-object p1, Lcom/leanplum/internal/FileManager$DownloadFileResult;->EXISTS_IN_ASSETS:Lcom/leanplum/internal/FileManager$DownloadFileResult;
    :try_end_27
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_27} :catch_5f
    .catchall {:try_start_13 .. :try_end_27} :catchall_4b

    :try_start_27
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_2a
    .catch Ljava/io/IOException; {:try_start_27 .. :try_end_2a} :catch_2b

    return-object p1

    :catch_2b
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object p1

    :cond_38
    if-eqz p0, :cond_71

    :try_start_3a
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_3d
    .catch Ljava/io/IOException; {:try_start_3a .. :try_end_3d} :catch_3e

    goto :goto_71

    :catch_3e
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_71

    :catchall_4b
    move-exception p1

    if-eqz p0, :cond_5e

    :try_start_4e
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_51
    .catch Ljava/io/IOException; {:try_start_4e .. :try_end_51} :catch_52

    goto :goto_5e

    :catch_52
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_5e
    :goto_5e
    throw p1

    :catch_5f
    if-eqz p0, :cond_71

    :try_start_61
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_64
    .catch Ljava/io/IOException; {:try_start_61 .. :try_end_64} :catch_65

    goto :goto_71

    :catch_65
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_71
    :goto_71
    invoke-static {p1}, Lcom/leanplum/internal/FileManager;->fileRelativeToAppBundle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/leanplum/internal/FileManager;->fileExistsAtPath(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_a4

    invoke-static {p1}, Lcom/leanplum/internal/FileManager;->fileRelativeToDocuments(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/leanplum/internal/FileManager;->fileExistsAtPath(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_a4

    sget-object p0, Lcom/leanplum/internal/FileManager;->filenameToURLs:Ljava/util/Map;

    if-eqz p0, :cond_9a

    invoke-interface {p0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_9a

    if-nez p3, :cond_9a

    sget-object p0, Lcom/leanplum/internal/FileManager;->filenameToURLs:Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    move-object p3, p0

    check-cast p3, Ljava/lang/String;

    :cond_9a
    invoke-static {}, Lcom/leanplum/internal/FileTransferManager;->getInstance()Lcom/leanplum/internal/FileTransferManager;

    move-result-object p0

    invoke-virtual {p0, p1, p3, p4, p4}, Lcom/leanplum/internal/FileTransferManager;->downloadFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    sget-object p0, Lcom/leanplum/internal/FileManager$DownloadFileResult;->DOWNLOADING:Lcom/leanplum/internal/FileManager$DownloadFileResult;

    return-object p0

    :cond_a4
    sget-object p0, Lcom/leanplum/internal/FileManager$DownloadFileResult;->NONE:Lcom/leanplum/internal/FileManager$DownloadFileResult;

    return-object p0
.end method

.method public static setFilenameToURLs(Ljava/util/Map;)V
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    sput-object p0, Lcom/leanplum/internal/FileManager;->filenameToURLs:Ljava/util/Map;

    return-void
.end method

.method public static setResourceSyncFinishBlock(Lcom/leanplum/internal/FileManager$ResourceUpdateCallback;)V
    .registers 1

    sput-object p0, Lcom/leanplum/internal/FileManager;->updateCallback:Lcom/leanplum/internal/FileManager$ResourceUpdateCallback;

    return-void
.end method

.method public static stream(ZLjava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;[B)Ljava/io/InputStream;
    .registers 10

    const-string v0, "android.resource://"

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_a

    return-object v2

    :cond_a
    :try_start_a
    invoke-static {}, Lcom/leanplum/Leanplum;->getContext()Landroid/content/Context;

    move-result-object v1

    if-eqz p0, :cond_1e

    invoke-virtual {p3, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1e

    if-eqz p5, :cond_1e

    new-instance p0, Ljava/io/ByteArrayInputStream;

    invoke-direct {p0, p5}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object p0

    :cond_1e
    if-eqz p0, :cond_66

    invoke-virtual {p3, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_66

    if-nez p5, :cond_66

    invoke-static {p3}, Lcom/leanplum/internal/Util;->generateIdFromResourceName(Ljava/lang/String;)I

    move-result p0

    if-eqz p0, :cond_65

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->getResourcePackageName(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p3, 0x2f

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->getResourceTypeName(I)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p0
    :try_end_64
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_64} :catch_97

    return-object p0

    :cond_65
    return-object v2

    :cond_66
    if-nez p2, :cond_71

    :try_start_68
    invoke-virtual {v1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p0

    invoke-virtual {p0, p3}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0
    :try_end_70
    .catch Ljava/io/IOException; {:try_start_68 .. :try_end_70} :catch_83

    return-object p0

    :cond_71
    :try_start_71
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-nez p0, :cond_8e

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_83

    invoke-virtual {p3, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_8e

    :catch_83
    :cond_83
    new-instance p0, Ljava/io/FileInputStream;

    new-instance p1, Ljava/io/File;

    invoke-direct {p1, p3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    return-object p0

    :cond_8e
    invoke-virtual {v1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p0

    invoke-virtual {p0, p3}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0
    :try_end_96
    .catch Ljava/io/IOException; {:try_start_71 .. :try_end_96} :catch_97

    return-object p0

    :catch_97
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Failed to load a stream."

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v2
.end method
