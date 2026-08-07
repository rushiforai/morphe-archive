.class Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility$UnfinishedManagement;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "UnfinishedManagement"
.end annotation


# static fields
.field private static mUnfinishedWarmUp:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static check(Landroid/content/Context;Ljava/lang/String;I)Z
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility;->unfinishedKey(Ljava/lang/String;I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p0, p1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility$UnfinishedManagement;->retryCount(Landroid/content/Context;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 p1, 0x3

    .line 10
    if-lt p0, p1, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public static checkAndMark(Landroid/content/Context;Ljava/lang/String;I)Z
    .locals 2

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility;->unfinishedKey(Ljava/lang/String;I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p0, p1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility$UnfinishedManagement;->retryCount(Landroid/content/Context;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    const/4 v0, 0x3

    .line 10
    if-lt p2, v0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_0
    sget-object v0, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility$UnfinishedManagement;->mUnfinishedWarmUp:Ljava/util/Map;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    add-int/2addr p2, v1

    .line 18
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    sget-object p1, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility$UnfinishedManagement;->mUnfinishedWarmUp:Ljava/util/Map;

    .line 26
    .line 27
    invoke-static {p0, p1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility;->flushUnfinishedMaps(Landroid/content/Context;Ljava/util/Map;)V

    .line 28
    .line 29
    .line 30
    return v1
.end method

.method public static result(Landroid/content/Context;Ljava/lang/String;IZ)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility;->unfinishedKey(Ljava/lang/String;I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p0, p1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility$UnfinishedManagement;->retryCount(Landroid/content/Context;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p3, :cond_0

    .line 10
    .line 11
    sget-object p2, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility$UnfinishedManagement;->mUnfinishedWarmUp:Ljava/util/Map;

    .line 12
    .line 13
    invoke-interface {p2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    sget-object p3, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility$UnfinishedManagement;->mUnfinishedWarmUp:Ljava/util/Map;

    .line 18
    .line 19
    add-int/lit8 p2, p2, 0x1

    .line 20
    .line 21
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-interface {p3, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    :goto_0
    sget-object p1, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility$UnfinishedManagement;->mUnfinishedWarmUp:Ljava/util/Map;

    .line 29
    .line 30
    invoke-static {p0, p1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility;->flushUnfinishedMaps(Landroid/content/Context;Ljava/util/Map;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private static retryCount(Landroid/content/Context;Ljava/lang/String;)I
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility$UnfinishedManagement;->mUnfinishedWarmUp:Ljava/util/Map;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility;->readUnfinishedMaps(Landroid/content/Context;)Ljava/util/Map;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sput-object p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility$UnfinishedManagement;->mUnfinishedWarmUp:Ljava/util/Map;

    .line 10
    .line 11
    :cond_0
    sget-object p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility$UnfinishedManagement;->mUnfinishedWarmUp:Ljava/util/Map;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ljava/lang/Integer;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0

    .line 26
    :cond_1
    const/4 p0, 0x0

    .line 27
    return p0
.end method
