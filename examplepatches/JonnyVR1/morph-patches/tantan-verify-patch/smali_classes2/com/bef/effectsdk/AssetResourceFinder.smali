.class public final Lcom/bef/effectsdk/AssetResourceFinder;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bef/effectsdk/ResourceFinder;


# instance fields
.field private final mAssetManager:Landroid/content/res/AssetManager;

.field private final mDir:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/res/AssetManager;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/bef/effectsdk/AssetResourceFinder;->mAssetManager:Landroid/content/res/AssetManager;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/bef/effectsdk/AssetResourceFinder;->mDir:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method private static native nativeCreateAssetResourceFinder(JLandroid/content/res/AssetManager;Ljava/lang/String;)J
.end method

.method private static native nativeReleaseAssetResourceFinder(J)V
.end method


# virtual methods
.method public declared-synchronized createNativeResourceFinder(J)J
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/bef/effectsdk/AssetResourceFinder;->mAssetManager:Landroid/content/res/AssetManager;

    .line 3
    .line 4
    iget-object v1, p0, Lcom/bef/effectsdk/AssetResourceFinder;->mDir:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {p1, p2, v0, v1}, Lcom/bef/effectsdk/AssetResourceFinder;->nativeCreateAssetResourceFinder(JLandroid/content/res/AssetManager;Ljava/lang/String;)J

    .line 7
    .line 8
    .line 9
    move-result-wide p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    monitor-exit p0

    .line 11
    return-wide p1

    .line 12
    :catchall_0
    move-exception p1

    .line 13
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    throw p1
.end method

.method public declared-synchronized release(J)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-static {p1, p2}, Lcom/bef/effectsdk/AssetResourceFinder;->nativeReleaseAssetResourceFinder(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    .line 5
    monitor-exit p0

    .line 6
    return-void

    .line 7
    :catchall_0
    move-exception p1

    .line 8
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 9
    throw p1
.end method
