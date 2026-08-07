.class Lcom/mm/mmfile/MMFileRegister;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field static volatile sMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/mm/mmfile/Strategy;",
            ">;"
        }
    .end annotation
.end field

.field static strategies:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Lcom/mm/mmfile/Strategy;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/mm/mmfile/MMFileRegister;->sMap:Ljava/util/Map;

    .line 7
    .line 8
    new-instance v0, Ljava/util/HashSet;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/mm/mmfile/MMFileRegister;->strategies:Ljava/util/HashSet;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getFileWriteConfig(Lcom/mm/mmfile/FileUploadConfig;)Lcom/mm/mmfile/core/FileWriteConfig;
    .locals 3

    .line 1
    sget-object v0, Lcom/mm/mmfile/MMFileRegister;->strategies:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/mm/mmfile/Strategy;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/mm/mmfile/Strategy;->getFileUploadConfig()Lcom/mm/mmfile/FileUploadConfig;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    if-ne v2, p0, :cond_0

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/mm/mmfile/Strategy;->getFileWriteConfig()Lcom/mm/mmfile/core/FileWriteConfig;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_1
    const/4 p0, 0x0

    .line 31
    return-object p0
.end method

.method public static getStrategy(Ljava/lang/String;)Lcom/mm/mmfile/Strategy;
    .locals 1

    .line 1
    sget-object v0, Lcom/mm/mmfile/MMFileRegister;->sMap:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/mm/mmfile/Strategy;

    .line 8
    .line 9
    return-object p0
.end method

.method public static varargs install([Lcom/mm/mmfile/Strategy;)V
    .locals 9

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x0

    .line 3
    move v2, v1

    .line 4
    :goto_0
    if-ge v2, v0, :cond_2

    .line 5
    .line 6
    aget-object v3, p0, v2

    .line 7
    .line 8
    sget-object v4, Lcom/mm/mmfile/MMFileRegister;->strategies:Ljava/util/HashSet;

    .line 9
    .line 10
    invoke-virtual {v4, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    invoke-virtual {v3}, Lcom/mm/mmfile/Strategy;->getFileWriteConfig()Lcom/mm/mmfile/core/FileWriteConfig;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    invoke-static {v4}, Lcom/mm/mmfile/MMFile;->register(Lcom/mm/mmfile/core/FileWriteConfig;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v3}, Lcom/mm/mmfile/Strategy;->getBusinesses()[Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    if-eqz v4, :cond_1

    .line 25
    .line 26
    array-length v5, v4

    .line 27
    move v6, v1

    .line 28
    :goto_1
    if-ge v6, v5, :cond_1

    .line 29
    .line 30
    aget-object v7, v4, v6

    .line 31
    .line 32
    sget-object v8, Lcom/mm/mmfile/MMFileRegister;->sMap:Ljava/util/Map;

    .line 33
    .line 34
    invoke-interface {v8, v7, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v8

    .line 38
    check-cast v8, Lcom/mm/mmfile/Strategy;

    .line 39
    .line 40
    if-nez v8, :cond_0

    .line 41
    .line 42
    add-int/lit8 v6, v6, 0x1

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_0
    const-string p0, "business: "

    .line 46
    .line 47
    const-string v0, " can not map multiple strategy type"

    .line 48
    .line 49
    invoke-static {p0, v7, v0}, Ll/xmw;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    invoke-static {}, Lcom/mm/mmfile/MMFileUploader;->get()Lcom/mm/mmfile/MMFileUploader;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    invoke-virtual {v3}, Lcom/mm/mmfile/Strategy;->getFileUploadConfig()Lcom/mm/mmfile/FileUploadConfig;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-virtual {v4, v3}, Lcom/mm/mmfile/MMFileUploader;->register(Lcom/mm/mmfile/FileUploadConfig;)V

    .line 62
    .line 63
    .line 64
    add-int/lit8 v2, v2, 0x1

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    return-void
.end method

.method public static isRegistered(Ljava/lang/String;)Z
    .locals 1

    .line 1
    sget-object v0, Lcom/mm/mmfile/MMFileRegister;->sMap:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
