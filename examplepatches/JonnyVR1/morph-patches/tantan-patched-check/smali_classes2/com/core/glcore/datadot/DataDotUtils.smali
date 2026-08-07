.class public Lcom/core/glcore/datadot/DataDotUtils;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static volatile instance:Lcom/core/glcore/datadot/DataDotUtils;


# instance fields
.field private mEditDataDotInfo:Lcom/core/glcore/datadot/EditDataDotInfo;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "edit_info"
    .end annotation
.end field

.field private mPhotoDataDotInfo:Lcom/core/glcore/datadot/PhotoDataDotInfo;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "photo_info"
    .end annotation
.end field

.field private mRecoderDataDotInfo:Lcom/core/glcore/datadot/RecoderDataDotInfo;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "recoder_info"
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getInstance()Lcom/core/glcore/datadot/DataDotUtils;
    .locals 2

    .line 1
    sget-object v0, Lcom/core/glcore/datadot/DataDotUtils;->instance:Lcom/core/glcore/datadot/DataDotUtils;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/core/glcore/datadot/DataDotUtils;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/core/glcore/datadot/DataDotUtils;->instance:Lcom/core/glcore/datadot/DataDotUtils;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/core/glcore/datadot/DataDotUtils;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/core/glcore/datadot/DataDotUtils;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/core/glcore/datadot/DataDotUtils;->instance:Lcom/core/glcore/datadot/DataDotUtils;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Lcom/core/glcore/datadot/DataDotUtils;->instance:Lcom/core/glcore/datadot/DataDotUtils;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public clearEditDataDotInfo()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/core/glcore/datadot/DataDotUtils;->mEditDataDotInfo:Lcom/core/glcore/datadot/EditDataDotInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Lcom/core/glcore/datadot/DataDotUtils;->mEditDataDotInfo:Lcom/core/glcore/datadot/EditDataDotInfo;

    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public clearPhotoDataDotInfo()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/core/glcore/datadot/DataDotUtils;->mPhotoDataDotInfo:Lcom/core/glcore/datadot/PhotoDataDotInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Lcom/core/glcore/datadot/DataDotUtils;->mPhotoDataDotInfo:Lcom/core/glcore/datadot/PhotoDataDotInfo;

    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public clearRecoderDataDotInfo()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/core/glcore/datadot/DataDotUtils;->mRecoderDataDotInfo:Lcom/core/glcore/datadot/RecoderDataDotInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Lcom/core/glcore/datadot/DataDotUtils;->mRecoderDataDotInfo:Lcom/core/glcore/datadot/RecoderDataDotInfo;

    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public getDataDot(Ljava/lang/String;)Lcom/core/glcore/datadot/DataDotUtils;
    .locals 1

    .line 1
    invoke-static {}, Lcom/core/glcore/util/JsonUtil;->getInstance()Lcom/core/glcore/util/JsonUtil;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-class v0, Lcom/core/glcore/datadot/DataDotUtils;

    .line 6
    .line 7
    invoke-virtual {p0, p1, v0}, Lcom/core/glcore/util/JsonUtil;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/core/glcore/datadot/DataDotUtils;

    .line 12
    .line 13
    return-object p0
.end method

.method public getEditDataDotInfo()Lcom/core/glcore/datadot/EditDataDotInfo;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/core/glcore/datadot/DataDotUtils;->mEditDataDotInfo:Lcom/core/glcore/datadot/EditDataDotInfo;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/core/glcore/datadot/EditDataDotInfo;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/core/glcore/datadot/EditDataDotInfo;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/core/glcore/datadot/DataDotUtils;->mEditDataDotInfo:Lcom/core/glcore/datadot/EditDataDotInfo;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/core/glcore/datadot/DataDotUtils;->mEditDataDotInfo:Lcom/core/glcore/datadot/EditDataDotInfo;

    .line 13
    .line 14
    return-object p0
.end method

.method public getPhotoDataDotInfo()Lcom/core/glcore/datadot/PhotoDataDotInfo;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/core/glcore/datadot/DataDotUtils;->mPhotoDataDotInfo:Lcom/core/glcore/datadot/PhotoDataDotInfo;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/core/glcore/datadot/PhotoDataDotInfo;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/core/glcore/datadot/PhotoDataDotInfo;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/core/glcore/datadot/DataDotUtils;->mPhotoDataDotInfo:Lcom/core/glcore/datadot/PhotoDataDotInfo;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/core/glcore/datadot/DataDotUtils;->mPhotoDataDotInfo:Lcom/core/glcore/datadot/PhotoDataDotInfo;

    .line 13
    .line 14
    return-object p0
.end method

.method public getRecoderDataDotInfo()Lcom/core/glcore/datadot/RecoderDataDotInfo;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/core/glcore/datadot/DataDotUtils;->mRecoderDataDotInfo:Lcom/core/glcore/datadot/RecoderDataDotInfo;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/core/glcore/datadot/RecoderDataDotInfo;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/core/glcore/datadot/RecoderDataDotInfo;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/core/glcore/datadot/DataDotUtils;->mRecoderDataDotInfo:Lcom/core/glcore/datadot/RecoderDataDotInfo;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/core/glcore/datadot/DataDotUtils;->mRecoderDataDotInfo:Lcom/core/glcore/datadot/RecoderDataDotInfo;

    .line 13
    .line 14
    return-object p0
.end method

.method public setEditDataDotInfo(Lcom/core/glcore/datadot/EditDataDotInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/core/glcore/datadot/DataDotUtils;->mEditDataDotInfo:Lcom/core/glcore/datadot/EditDataDotInfo;

    .line 2
    .line 3
    return-void
.end method

.method public setPhotoDataDotInfo(Lcom/core/glcore/datadot/PhotoDataDotInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/core/glcore/datadot/DataDotUtils;->mPhotoDataDotInfo:Lcom/core/glcore/datadot/PhotoDataDotInfo;

    .line 2
    .line 3
    return-void
.end method

.method public setRecoderDataDotInfo(Lcom/core/glcore/datadot/RecoderDataDotInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/core/glcore/datadot/DataDotUtils;->mRecoderDataDotInfo:Lcom/core/glcore/datadot/RecoderDataDotInfo;

    .line 2
    .line 3
    return-void
.end method

.method public toDataDot()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/core/glcore/util/JsonUtil;->getInstance()Lcom/core/glcore/util/JsonUtil;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/core/glcore/datadot/DataDotUtils;->instance:Lcom/core/glcore/datadot/DataDotUtils;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/core/glcore/util/JsonUtil;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
