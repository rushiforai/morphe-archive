.class public Lio/agora/meta/MetaBundleInfo;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/meta/MetaBundleInfo$BundleType;
    }
.end annotation


# instance fields
.field public mAssets:Ljava/lang/String;

.field public mBundleCode:Ljava/lang/String;

.field public mBundleId:J

.field public mBundleName:Ljava/lang/String;

.field public mBundlePath:Ljava/lang/String;

.field public mBundleSize:J

.field public mBundleType:I

.field public mDescription:Ljava/lang/String;

.field public mExtraInfo:Ljava/lang/String;

.field public mSceneId:J

.field public mThumbnailPath:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lio/agora/meta/MetaBundleInfo;->mBundleId:J

    iput-wide v0, p0, Lio/agora/meta/MetaBundleInfo;->mSceneId:J

    const/4 v2, 0x1

    iput v2, p0, Lio/agora/meta/MetaBundleInfo;->mBundleType:I

    const-string v2, ""

    iput-object v2, p0, Lio/agora/meta/MetaBundleInfo;->mBundleCode:Ljava/lang/String;

    iput-object v2, p0, Lio/agora/meta/MetaBundleInfo;->mBundleName:Ljava/lang/String;

    iput-object v2, p0, Lio/agora/meta/MetaBundleInfo;->mDescription:Ljava/lang/String;

    iput-object v2, p0, Lio/agora/meta/MetaBundleInfo;->mBundlePath:Ljava/lang/String;

    iput-object v2, p0, Lio/agora/meta/MetaBundleInfo;->mThumbnailPath:Ljava/lang/String;

    iput-object v2, p0, Lio/agora/meta/MetaBundleInfo;->mAssets:Ljava/lang/String;

    iput-object v2, p0, Lio/agora/meta/MetaBundleInfo;->mExtraInfo:Ljava/lang/String;

    iput-wide v0, p0, Lio/agora/meta/MetaBundleInfo;->mBundleSize:J

    return-void
.end method

.method public constructor <init>(JJILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lio/agora/meta/MetaBundleInfo;->mBundleId:J

    iput-wide p3, p0, Lio/agora/meta/MetaBundleInfo;->mSceneId:J

    iput p5, p0, Lio/agora/meta/MetaBundleInfo;->mBundleType:I

    iput-object p6, p0, Lio/agora/meta/MetaBundleInfo;->mBundleCode:Ljava/lang/String;

    iput-object p7, p0, Lio/agora/meta/MetaBundleInfo;->mBundleName:Ljava/lang/String;

    iput-object p8, p0, Lio/agora/meta/MetaBundleInfo;->mDescription:Ljava/lang/String;

    iput-object p9, p0, Lio/agora/meta/MetaBundleInfo;->mBundlePath:Ljava/lang/String;

    iput-object p10, p0, Lio/agora/meta/MetaBundleInfo;->mThumbnailPath:Ljava/lang/String;

    iput-object p11, p0, Lio/agora/meta/MetaBundleInfo;->mAssets:Ljava/lang/String;

    iput-object p12, p0, Lio/agora/meta/MetaBundleInfo;->mExtraInfo:Ljava/lang/String;

    iput-wide p13, p0, Lio/agora/meta/MetaBundleInfo;->mBundleSize:J

    return-void
.end method


# virtual methods
.method public getAssets()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/meta/MetaBundleInfo;->mAssets:Ljava/lang/String;

    return-object p0
.end method

.method public getBundleCode()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/meta/MetaBundleInfo;->mBundleCode:Ljava/lang/String;

    return-object p0
.end method

.method public getBundleId()J
    .locals 2
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-wide v0, p0, Lio/agora/meta/MetaBundleInfo;->mBundleId:J

    return-wide v0
.end method

.method public getBundleName()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/meta/MetaBundleInfo;->mBundleName:Ljava/lang/String;

    return-object p0
.end method

.method public getBundlePath()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/meta/MetaBundleInfo;->mBundlePath:Ljava/lang/String;

    return-object p0
.end method

.method public getBundleSize()J
    .locals 2
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-wide v0, p0, Lio/agora/meta/MetaBundleInfo;->mBundleSize:J

    return-wide v0
.end method

.method public getBundleType()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget p0, p0, Lio/agora/meta/MetaBundleInfo;->mBundleType:I

    return p0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/meta/MetaBundleInfo;->mDescription:Ljava/lang/String;

    return-object p0
.end method

.method public getExtraInfo()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/meta/MetaBundleInfo;->mExtraInfo:Ljava/lang/String;

    return-object p0
.end method

.method public getSceneId()J
    .locals 2
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-wide v0, p0, Lio/agora/meta/MetaBundleInfo;->mSceneId:J

    return-wide v0
.end method

.method public getThumbnailPath()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/meta/MetaBundleInfo;->mThumbnailPath:Ljava/lang/String;

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "MetaBundleInfo{mBundleId="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v1, p0, Lio/agora/meta/MetaBundleInfo;->mBundleId:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", mSceneId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lio/agora/meta/MetaBundleInfo;->mSceneId:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", mBundleType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lio/agora/meta/MetaBundleInfo;->mBundleType:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mBundleCode=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/meta/MetaBundleInfo;->mBundleCode:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', mBundleName=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/meta/MetaBundleInfo;->mBundleName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', mDescription=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/meta/MetaBundleInfo;->mDescription:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', mBundlePath=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/meta/MetaBundleInfo;->mBundlePath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', mThumbnailPath=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/meta/MetaBundleInfo;->mThumbnailPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', mAssets=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/meta/MetaBundleInfo;->mAssets:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', mExtraInfo=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/meta/MetaBundleInfo;->mExtraInfo:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', mBundleSize="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lio/agora/meta/MetaBundleInfo;->mBundleSize:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const/16 p0, 0x7d

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
