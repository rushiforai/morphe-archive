.class public Lcom/ss/bytertc/engine/data/StandardPitchInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public duration:I

.field public pitch:I

.field public startTime:I


# direct methods
.method public constructor <init>(III)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/ss/bytertc/engine/data/StandardPitchInfo;->startTime:I

    .line 5
    .line 6
    iput p2, p0, Lcom/ss/bytertc/engine/data/StandardPitchInfo;->duration:I

    .line 7
    .line 8
    iput p3, p0, Lcom/ss/bytertc/engine/data/StandardPitchInfo;->pitch:I

    .line 9
    .line 10
    return-void
.end method

.method private static create(III)Lcom/ss/bytertc/engine/data/StandardPitchInfo;
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/data/StandardPitchInfo;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/ss/bytertc/engine/data/StandardPitchInfo;-><init>(III)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
