.class Lio/agora/base/internal/video/VideoFrameSenderExImpl$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/internal/video/VideoFrameSenderExImpl;->dispose()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/base/internal/video/VideoFrameSenderExImpl;


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/VideoFrameSenderExImpl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/VideoFrameSenderExImpl$2;->this$0:Lio/agora/base/internal/video/VideoFrameSenderExImpl;

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
    iget-object p0, p0, Lio/agora/base/internal/video/VideoFrameSenderExImpl$2;->this$0:Lio/agora/base/internal/video/VideoFrameSenderExImpl;

    .line 2
    .line 3
    invoke-static {p0}, Lio/agora/base/internal/video/VideoFrameSenderExImpl;->access$100(Lio/agora/base/internal/video/VideoFrameSenderExImpl;)Lio/agora/base/internal/video/YuvConverter;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lio/agora/base/internal/video/YuvConverter;->release()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
