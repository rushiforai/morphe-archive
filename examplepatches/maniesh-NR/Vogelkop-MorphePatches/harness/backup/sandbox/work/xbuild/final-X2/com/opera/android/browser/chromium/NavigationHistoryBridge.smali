.class public final Lcom/opera/android/browser/chromium/NavigationHistoryBridge;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static addToIdMap(Ljava/util/Map;Lcom/opera/android/browser/NavigationEntry;I)V
    .registers 3
    .param p0    # Ljava/util/Map;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/opera/android/browser/NavigationEntry;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;",
            "Lcom/opera/android/browser/NavigationEntry;",
            "I)V"
        }
    .end annotation

    invoke-interface {p1}, Lcom/opera/android/browser/NavigationEntry;->getId()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static createNavigationEntry(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[B[B)Lcom/opera/android/browser/NavigationEntry;
    .registers 16
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # [B
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p6    # [B
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    new-instance v0, Lgke;

    const/4 v8, 0x0

    move v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    move-object v6, p5

    move-object v7, p6

    invoke-direct/range {v0 .. v8}, Lgke;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[B[BB)V

    return-object v0
.end method

.method public static getCurrentEntryIndex(Lcom/opera/android/browser/NavigationHistory;)I
    .registers 1
    .param p0    # Lcom/opera/android/browser/NavigationHistory;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-interface {p0}, Lcom/opera/android/browser/NavigationHistory;->j()I

    move-result p0

    return p0
.end method

.method public static getEntryAtIndex(Lcom/opera/android/browser/NavigationHistory;I)Lcom/opera/android/browser/NavigationEntry;
    .registers 2
    .param p0    # Lcom/opera/android/browser/NavigationHistory;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    invoke-interface {p0, p1}, Lcom/opera/android/browser/NavigationHistory;->i(I)Lcom/opera/android/browser/NavigationEntry;

    move-result-object p0

    return-object p0
.end method

.method public static getEntryCount(Lcom/opera/android/browser/NavigationHistory;)I
    .registers 1
    .param p0    # Lcom/opera/android/browser/NavigationHistory;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-interface {p0}, Lcom/opera/android/browser/NavigationHistory;->d()I

    move-result p0

    return p0
.end method

.method public static getIsOverridingUserAgent(Lcom/opera/android/browser/NavigationEntry;)Z
    .registers 1
    .param p0    # Lcom/opera/android/browser/NavigationEntry;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-interface {p0}, Lcom/opera/android/browser/NavigationEntry;->a()Z

    move-result p0

    return p0
.end method

.method public static getPageState(Lcom/opera/android/browser/NavigationEntry;)[B
    .registers 1
    .param p0    # Lcom/opera/android/browser/NavigationEntry;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    invoke-interface {p0}, Lcom/opera/android/browser/NavigationEntry;->c()[B

    move-result-object p0

    return-object p0
.end method

.method public static getTitle(Lcom/opera/android/browser/NavigationEntry;)Ljava/lang/String;
    .registers 1
    .param p0    # Lcom/opera/android/browser/NavigationEntry;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    invoke-interface {p0}, Lcom/opera/android/browser/NavigationEntry;->getTitle()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getUrl(Lcom/opera/android/browser/NavigationEntry;)Ljava/lang/String;
    .registers 1
    .param p0    # Lcom/opera/android/browser/NavigationEntry;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    invoke-interface {p0}, Lcom/opera/android/browser/NavigationEntry;->getUrl()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getUserData(Lcom/opera/android/browser/NavigationEntry;)[B
    .registers 1
    .param p0    # Lcom/opera/android/browser/NavigationEntry;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    invoke-interface {p0}, Lcom/opera/android/browser/NavigationEntry;->e()[B

    move-result-object p0

    return-object p0
.end method

.method public static getVirtualUrl(Lcom/opera/android/browser/NavigationEntry;)Ljava/lang/String;
    .registers 1
    .param p0    # Lcom/opera/android/browser/NavigationEntry;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    invoke-interface {p0}, Lcom/opera/android/browser/NavigationEntry;->d()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
