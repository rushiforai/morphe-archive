.class public abstract Lcom/ss/bytertc/engine/handler/IExternalVideoEncoderEventHandler;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public abstract onActiveVideoLayer(Lcom/ss/bytertc/engine/data/StreamIndex;IZ)V
.end method

.method public abstract onRateUpdate(Lcom/ss/bytertc/engine/data/StreamIndex;III)V
.end method

.method public abstract onRequestKeyFrame(Lcom/ss/bytertc/engine/data/StreamIndex;I)V
.end method

.method public abstract onStart(Lcom/ss/bytertc/engine/data/StreamIndex;)V
.end method

.method public abstract onStop(Lcom/ss/bytertc/engine/data/StreamIndex;)V
.end method
