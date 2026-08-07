.class public Lcom/ss/bytertc/engine/InternalGameAudioVolumeInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public userId:Ljava/lang/String;

.field public volume:I


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/InternalGameAudioVolumeInfo;->userId:Ljava/lang/String;

    .line 5
    .line 6
    iput p2, p0, Lcom/ss/bytertc/engine/InternalGameAudioVolumeInfo;->volume:I

    .line 7
    .line 8
    return-void
.end method

.method private static create(Ljava/lang/String;I)Lcom/ss/bytertc/engine/InternalGameAudioVolumeInfo;
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/InternalGameAudioVolumeInfo;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/ss/bytertc/engine/InternalGameAudioVolumeInfo;-><init>(Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
