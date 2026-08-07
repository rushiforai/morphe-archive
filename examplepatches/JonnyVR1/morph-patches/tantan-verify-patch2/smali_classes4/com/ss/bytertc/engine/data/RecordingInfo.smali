.class public Lcom/ss/bytertc/engine/data/RecordingInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public filePath:Ljava/lang/String;

.field public height:I

.field public videoCodecType:Lcom/ss/bytertc/engine/data/VideoCodecType;

.field public width:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/ss/bytertc/engine/data/VideoCodecType;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/data/RecordingInfo;->filePath:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/ss/bytertc/engine/data/RecordingInfo;->videoCodecType:Lcom/ss/bytertc/engine/data/VideoCodecType;

    .line 7
    .line 8
    iput p3, p0, Lcom/ss/bytertc/engine/data/RecordingInfo;->width:I

    .line 9
    .line 10
    iput p4, p0, Lcom/ss/bytertc/engine/data/RecordingInfo;->height:I

    .line 11
    .line 12
    return-void
.end method

.method public static create(Ljava/lang/String;Lcom/ss/bytertc/engine/data/VideoCodecType;II)Lcom/ss/bytertc/engine/data/RecordingInfo;
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/data/RecordingInfo;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/ss/bytertc/engine/data/RecordingInfo;-><init>(Ljava/lang/String;Lcom/ss/bytertc/engine/data/VideoCodecType;II)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
