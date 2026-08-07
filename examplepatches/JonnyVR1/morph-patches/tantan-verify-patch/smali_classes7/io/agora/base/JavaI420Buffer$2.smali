.class Lio/agora/base/JavaI420Buffer$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/JavaI420Buffer;->cropAndScaleI420(Lio/agora/base/VideoFrame$I420Buffer;IIIIII)Lio/agora/base/VideoFrame$Buffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic val$buffer:Lio/agora/base/VideoFrame$I420Buffer;


# direct methods
.method public constructor <init>(Lio/agora/base/VideoFrame$I420Buffer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/JavaI420Buffer$2;->val$buffer:Lio/agora/base/VideoFrame$I420Buffer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lio/agora/base/JavaI420Buffer$2;->val$buffer:Lio/agora/base/VideoFrame$I420Buffer;

    .line 2
    .line 3
    invoke-interface {p0}, Lio/agora/base/VideoFrame$Buffer;->release()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
