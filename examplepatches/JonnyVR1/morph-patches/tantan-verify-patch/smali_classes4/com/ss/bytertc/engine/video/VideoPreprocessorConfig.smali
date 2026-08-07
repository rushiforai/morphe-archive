.class public Lcom/ss/bytertc/engine/video/VideoPreprocessorConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public requiredPixelFormat:Lcom/ss/bytertc/engine/data/VideoPixelFormat;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->UNKNOWN:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/ss/bytertc/engine/video/VideoPreprocessorConfig;->requiredPixelFormat:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 7
    .line 8
    return-void
.end method
