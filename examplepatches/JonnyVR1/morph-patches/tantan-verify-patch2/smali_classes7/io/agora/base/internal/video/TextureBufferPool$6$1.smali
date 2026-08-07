.class Lio/agora/base/internal/video/TextureBufferPool$6$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/internal/video/TextureBufferPool$6;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lio/agora/base/internal/video/TextureBufferPool$6;


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/TextureBufferPool$6;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/TextureBufferPool$6$1;->this$1:Lio/agora/base/internal/video/TextureBufferPool$6;

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
    .locals 3

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/TextureBufferPool$6$1;->this$1:Lio/agora/base/internal/video/TextureBufferPool$6;

    .line 2
    .line 3
    iget-object v1, v0, Lio/agora/base/internal/video/TextureBufferPool$6;->this$0:Lio/agora/base/internal/video/TextureBufferPool;

    .line 4
    .line 5
    iget-object v0, v0, Lio/agora/base/internal/video/TextureBufferPool$6;->val$texInfo:Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;

    .line 6
    .line 7
    invoke-static {v1, v0}, Lio/agora/base/internal/video/TextureBufferPool;->access$700(Lio/agora/base/internal/video/TextureBufferPool;Lio/agora/base/internal/video/TextureBufferPool$TextureInfo;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lio/agora/base/internal/video/TextureBufferPool$6$1;->this$1:Lio/agora/base/internal/video/TextureBufferPool$6;

    .line 11
    .line 12
    iget-object v0, v0, Lio/agora/base/internal/video/TextureBufferPool$6;->this$0:Lio/agora/base/internal/video/TextureBufferPool;

    .line 13
    .line 14
    invoke-static {v0}, Lio/agora/base/internal/video/TextureBufferPool;->access$400(Lio/agora/base/internal/video/TextureBufferPool;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lio/agora/base/internal/video/TextureBufferPool$6$1;->this$1:Lio/agora/base/internal/video/TextureBufferPool$6;

    .line 21
    .line 22
    iget-object v0, v0, Lio/agora/base/internal/video/TextureBufferPool$6;->this$0:Lio/agora/base/internal/video/TextureBufferPool;

    .line 23
    .line 24
    invoke-virtual {v0}, Lio/agora/base/internal/video/TextureBufferPool;->anyTextureInUse()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    invoke-static {}, Lio/agora/base/internal/video/TextureBufferPool;->access$200()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 37
    .line 38
    .line 39
    iget-object v2, p0, Lio/agora/base/internal/video/TextureBufferPool$6$1;->this$1:Lio/agora/base/internal/video/TextureBufferPool$6;

    .line 40
    .line 41
    iget-object v2, v2, Lio/agora/base/internal/video/TextureBufferPool$6;->this$0:Lio/agora/base/internal/video/TextureBufferPool;

    .line 42
    .line 43
    invoke-static {v2}, Lio/agora/base/internal/video/TextureBufferPool;->access$500(Lio/agora/base/internal/video/TextureBufferPool;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v2, " ready to release since no buffer in flight"

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-static {v0, v1}, Lio/agora/base/internal/Logging;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lio/agora/base/internal/video/TextureBufferPool$6$1;->this$1:Lio/agora/base/internal/video/TextureBufferPool$6;

    .line 63
    .line 64
    iget-object v0, v0, Lio/agora/base/internal/video/TextureBufferPool$6;->this$0:Lio/agora/base/internal/video/TextureBufferPool;

    .line 65
    .line 66
    invoke-static {v0}, Lio/agora/base/internal/video/TextureBufferPool;->access$600(Lio/agora/base/internal/video/TextureBufferPool;)V

    .line 67
    .line 68
    .line 69
    :cond_0
    iget-object v0, p0, Lio/agora/base/internal/video/TextureBufferPool$6$1;->this$1:Lio/agora/base/internal/video/TextureBufferPool$6;

    .line 70
    .line 71
    iget-object v0, v0, Lio/agora/base/internal/video/TextureBufferPool$6;->val$bufferReleaseCallback:Ljava/lang/Runnable;

    .line 72
    .line 73
    if-eqz v0, :cond_1

    .line 74
    .line 75
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 76
    .line 77
    .line 78
    :cond_1
    iget-object v0, p0, Lio/agora/base/internal/video/TextureBufferPool$6$1;->this$1:Lio/agora/base/internal/video/TextureBufferPool$6;

    .line 79
    .line 80
    iget-object v0, v0, Lio/agora/base/internal/video/TextureBufferPool$6;->this$0:Lio/agora/base/internal/video/TextureBufferPool;

    .line 81
    .line 82
    invoke-static {v0}, Lio/agora/base/internal/video/TextureBufferPool;->access$800(Lio/agora/base/internal/video/TextureBufferPool;)Ljava/lang/Runnable;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    if-eqz v0, :cond_2

    .line 87
    .line 88
    iget-object p0, p0, Lio/agora/base/internal/video/TextureBufferPool$6$1;->this$1:Lio/agora/base/internal/video/TextureBufferPool$6;

    .line 89
    .line 90
    iget-object p0, p0, Lio/agora/base/internal/video/TextureBufferPool$6;->this$0:Lio/agora/base/internal/video/TextureBufferPool;

    .line 91
    .line 92
    invoke-static {p0}, Lio/agora/base/internal/video/TextureBufferPool;->access$800(Lio/agora/base/internal/video/TextureBufferPool;)Ljava/lang/Runnable;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 97
    .line 98
    .line 99
    :cond_2
    return-void
.end method
