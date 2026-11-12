.class public final Lcom/opera/android/utilities/OperaPathUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static getAriaUserImagesDir()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    sget-object v0, Lsnf;->c:Ljava/lang/String;

    return-object v0
.end method

.method public static getBannerBlockerFile()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    sget-object v0, Lsnf;->a:Ljava/lang/String;

    return-object v0
.end method

.method public static getBreamDataStoreDirectory()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    :try_start_0
    sget-object v0, Lpd6;->a:Ljava/util/concurrent/FutureTask;

    sget-object v0, Lod6;->a:Ljava/lang/String;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_4} :catch_5

    return-object v0

    :catch_5
    const/4 v0, 0x0

    return-object v0
.end method

.method public static getIntentSignalsDir()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    sget-object v0, Lsnf;->e:Ljava/lang/String;

    return-object v0
.end method

.method public static getSiteJsFile()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    sget-object v0, Lsnf;->b:Ljava/lang/String;

    return-object v0
.end method
