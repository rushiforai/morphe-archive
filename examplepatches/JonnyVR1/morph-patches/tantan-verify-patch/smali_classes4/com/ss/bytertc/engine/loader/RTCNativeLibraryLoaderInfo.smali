.class public Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "RTCNativeLibraryLoaderInfo"


# instance fields
.field private mIsLoadSuccess:Z

.field private mLoadTimeStampMs:Ljava/lang/Long;

.field private mLoadTimes:I

.field private mLoaderClassName:Ljava/lang/String;

.field private mSdkVersion:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderInfo;->mSdkVersion:Ljava/lang/String;

    .line 7
    .line 8
    const-wide/16 v1, 0x0

    .line 9
    .line 10
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, p0, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderInfo;->mLoadTimeStampMs:Ljava/lang/Long;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderInfo;->mLoaderClassName:Ljava/lang/String;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput v0, p0, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderInfo;->mLoadTimes:I

    .line 20
    .line 21
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderInfo;->mIsLoadSuccess:Z

    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public getLoadTimeStamp()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderInfo;->mLoadTimeStampMs:Ljava/lang/Long;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public getLoaderClassName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderInfo;->mLoaderClassName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSdkVersion()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderInfo;->mSdkVersion:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isLoadSuccess()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderInfo;->mIsLoadSuccess:Z

    .line 2
    .line 3
    return p0
.end method

.method public loadLibrary()V
    .locals 1

    .line 1
    iget v0, p0, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderInfo;->mLoadTimes:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderInfo;->mLoadTimes:I

    .line 6
    .line 7
    return-void
.end method

.method public setLoadResult(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderInfo;->mIsLoadSuccess:Z

    .line 2
    .line 3
    return-void
.end method

.method public setLoadTimeStampMs(J)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderInfo;->mLoadTimeStampMs:Ljava/lang/Long;

    .line 6
    .line 7
    return-void
.end method

.method public setLoaderClassName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderInfo;->mLoaderClassName:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setSdkVersion(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderInfo;->mSdkVersion:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "RTCNativeLibraryLoaderInfo{SdkVersion=\'"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderInfo;->mSdkVersion:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "\', LoadTimeStamp="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderInfo;->mLoadTimeStampMs:Ljava/lang/Long;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ", LoaderClassName=\'"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderInfo;->mLoaderClassName:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, "\', LoadTimes="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderInfo;->mLoadTimes:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ", IsLoadSuccess="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/loader/RTCNativeLibraryLoaderInfo;->mIsLoadSuccess:Z

    .line 49
    .line 50
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const/16 p0, 0x7d

    .line 54
    .line 55
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method
