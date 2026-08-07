.class public Lcom/ss/bytertc/engine/InternalAudioVolumeInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public linearVolume:I

.field public nonlinearVolume:I

.field public smoothVolume:I

.field public uid:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/InternalAudioVolumeInfo;->uid:Ljava/lang/String;

    .line 5
    .line 6
    iput p2, p0, Lcom/ss/bytertc/engine/InternalAudioVolumeInfo;->linearVolume:I

    .line 7
    .line 8
    iput p3, p0, Lcom/ss/bytertc/engine/InternalAudioVolumeInfo;->nonlinearVolume:I

    .line 9
    .line 10
    return-void
.end method

.method private static create(Ljava/lang/String;II)Lcom/ss/bytertc/engine/InternalAudioVolumeInfo;
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/InternalAudioVolumeInfo;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/ss/bytertc/engine/InternalAudioVolumeInfo;-><init>(Ljava/lang/String;II)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
