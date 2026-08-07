.class public Lio/agora/meta/MetaSceneAssetsInfo;
.super Ljava/lang/Object;


# instance fields
.field public mBundles:[Lio/agora/meta/MetaBundleInfo;

.field public mDescription:Ljava/lang/String;

.field public mExtraInfo:Ljava/lang/String;

.field public mParentScenePath:Ljava/lang/String;

.field public mSceneConfig:Ljava/lang/String;

.field public mSceneId:J

.field public mSceneLocalVersion:Ljava/lang/String;

.field public mSceneName:Ljava/lang/String;

.field public mScenePath:Ljava/lang/String;

.field public mSceneVersion:Ljava/lang/String;

.field public mThumbnailPath:Ljava/lang/String;

.field public mTotalSize:J


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mSceneId:J

    const-string v2, ""

    iput-object v2, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mSceneName:Ljava/lang/String;

    iput-object v2, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mThumbnailPath:Ljava/lang/String;

    iput-object v2, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mScenePath:Ljava/lang/String;

    iput-object v2, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mParentScenePath:Ljava/lang/String;

    iput-object v2, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mDescription:Ljava/lang/String;

    iput-object v2, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mSceneConfig:Ljava/lang/String;

    iput-object v2, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mExtraInfo:Ljava/lang/String;

    const/4 v3, 0x0

    new-array v3, v3, [Lio/agora/meta/MetaBundleInfo;

    iput-object v3, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mBundles:[Lio/agora/meta/MetaBundleInfo;

    iput-object v2, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mSceneVersion:Ljava/lang/String;

    iput-object v2, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mSceneLocalVersion:Ljava/lang/String;

    iput-wide v0, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mTotalSize:J

    return-void
.end method

.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Lio/agora/meta/MetaBundleInfo;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mSceneId:J

    iput-object p3, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mSceneName:Ljava/lang/String;

    iput-object p4, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mThumbnailPath:Ljava/lang/String;

    iput-object p5, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mScenePath:Ljava/lang/String;

    iput-object p6, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mParentScenePath:Ljava/lang/String;

    iput-object p7, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mDescription:Ljava/lang/String;

    iput-object p8, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mSceneConfig:Ljava/lang/String;

    iput-object p9, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mExtraInfo:Ljava/lang/String;

    iput-object p10, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mBundles:[Lio/agora/meta/MetaBundleInfo;

    iput-object p11, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mSceneVersion:Ljava/lang/String;

    iput-object p12, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mSceneLocalVersion:Ljava/lang/String;

    iput-wide p13, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mTotalSize:J

    return-void
.end method


# virtual methods
.method public getBundles()[Lio/agora/meta/MetaBundleInfo;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mBundles:[Lio/agora/meta/MetaBundleInfo;

    return-object p0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mDescription:Ljava/lang/String;

    return-object p0
.end method

.method public getExtraInfo()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mExtraInfo:Ljava/lang/String;

    return-object p0
.end method

.method public getParentScenePath()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mParentScenePath:Ljava/lang/String;

    return-object p0
.end method

.method public getSceneConfig()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mSceneConfig:Ljava/lang/String;

    return-object p0
.end method

.method public getSceneId()J
    .locals 2
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-wide v0, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mSceneId:J

    return-wide v0
.end method

.method public getSceneLocalVersion()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mSceneLocalVersion:Ljava/lang/String;

    return-object p0
.end method

.method public getSceneName()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mSceneName:Ljava/lang/String;

    return-object p0
.end method

.method public getScenePath()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mScenePath:Ljava/lang/String;

    return-object p0
.end method

.method public getSceneVersion()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mSceneVersion:Ljava/lang/String;

    return-object p0
.end method

.method public getThumbnailPath()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mThumbnailPath:Ljava/lang/String;

    return-object p0
.end method

.method public getTotalSize()J
    .locals 2
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-wide v0, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mTotalSize:J

    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "MetaSceneAssetsInfo{mSceneId="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v1, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mSceneId:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", mSceneName=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mSceneName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', mThumbnailPath=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mThumbnailPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', mScenePath=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mScenePath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', mParentScenePath=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mParentScenePath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', mDescription=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mDescription:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', mSceneConfig=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mSceneConfig:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', mExtraInfo=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mExtraInfo:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', mBundles="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mBundles:[Lio/agora/meta/MetaBundleInfo;

    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", mSceneVersion=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mSceneVersion:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', mSceneLocalVersion=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mSceneLocalVersion:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', mTotalSize="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lio/agora/meta/MetaSceneAssetsInfo;->mTotalSize:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const/16 p0, 0x7d

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
