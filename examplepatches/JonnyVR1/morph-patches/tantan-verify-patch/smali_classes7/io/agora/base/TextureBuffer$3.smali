.class Lio/agora/base/TextureBuffer$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/TextureBuffer;->toI010()Lio/agora/base/VideoFrame$I010Buffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/base/TextureBuffer;

.field final synthetic val$i010Buffer:[Lio/agora/base/VideoFrame$I010Buffer;


# direct methods
.method public constructor <init>(Lio/agora/base/TextureBuffer;[Lio/agora/base/VideoFrame$I010Buffer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/TextureBuffer$3;->this$0:Lio/agora/base/TextureBuffer;

    .line 2
    .line 3
    iput-object p2, p0, Lio/agora/base/TextureBuffer$3;->val$i010Buffer:[Lio/agora/base/VideoFrame$I010Buffer;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lio/agora/base/TextureBuffer$3;->val$i010Buffer:[Lio/agora/base/VideoFrame$I010Buffer;

    .line 2
    .line 3
    iget-object v1, p0, Lio/agora/base/TextureBuffer$3;->this$0:Lio/agora/base/TextureBuffer;

    .line 4
    .line 5
    invoke-static {v1}, Lio/agora/base/TextureBuffer;->access$000(Lio/agora/base/TextureBuffer;)Lio/agora/base/internal/video/YuvConverter;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object p0, p0, Lio/agora/base/TextureBuffer$3;->this$0:Lio/agora/base/TextureBuffer;

    .line 10
    .line 11
    invoke-virtual {v1, p0}, Lio/agora/base/internal/video/YuvConverter;->convertI010(Lio/agora/base/VideoFrame$TextureBuffer;)Lio/agora/base/JavaI010Buffer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 v1, 0x0

    .line 16
    aput-object p0, v0, v1

    .line 17
    .line 18
    return-void
.end method
