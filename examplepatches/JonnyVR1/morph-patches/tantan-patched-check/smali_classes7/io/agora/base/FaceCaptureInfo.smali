.class public final Lio/agora/base/FaceCaptureInfo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/agora/base/IMetaInfo;


# static fields
.field public static final TAG:Ljava/lang/String; = "FaceCaptureInfo"


# instance fields
.field private mInfoStr:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lio/agora/base/FaceCaptureInfo;->mInfoStr:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static addFaceCapInfoToFrame(Lio/agora/base/FaceCaptureInfo;Lio/agora/base/VideoFrame;)V
    .locals 2
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    invoke-virtual {p1}, Lio/agora/base/VideoFrame;->getMetaInfo()Lio/agora/base/VideoFrameMetaInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x1

    .line 6
    new-array v0, v0, [Lio/agora/base/IMetaInfo;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    aput-object p0, v0, v1

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lio/agora/base/VideoFrameMetaInfo;->setCustomMetaInfo([Lio/agora/base/IMetaInfo;)I

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static extractFaceCaptureInfoFromVideoFrame(Lio/agora/base/VideoFrame;I)Lio/agora/base/FaceCaptureInfo;
    .locals 1
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lio/agora/base/VideoFrame;->getMetaInfo()Lio/agora/base/VideoFrameMetaInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lio/agora/base/FaceCaptureInfo;->TAG:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, v0, p1}, Lio/agora/base/VideoFrameMetaInfo;->getCustomMetaInfoAt(Ljava/lang/String;I)Lio/agora/base/IMetaInfo;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lio/agora/base/FaceCaptureInfo;

    .line 12
    .line 13
    return-object p0
.end method


# virtual methods
.method public getId()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    const/4 p0, 0x0

    return p0
.end method

.method public getInfoStr()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lio/agora/base/FaceCaptureInfo;->mInfoStr:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTag()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    sget-object p0, Lio/agora/base/FaceCaptureInfo;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/FaceCaptureInfo;->mInfoStr:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
