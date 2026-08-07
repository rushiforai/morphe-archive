.class Lio/agora/base/internal/video/EglRenderer$7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/internal/video/EglRenderer;->updateVsyncDuration(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/base/internal/video/EglRenderer;

.field final synthetic val$newVsyncDuration:J


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/EglRenderer;J)V
    .locals 0

    .line 1
    iput-object p1, p0, Lio/agora/base/internal/video/EglRenderer$7;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 2
    .line 3
    iput-wide p2, p0, Lio/agora/base/internal/video/EglRenderer$7;->val$newVsyncDuration:J

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
    .locals 4

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$7;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "update vsync duration, old:"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v2, p0, Lio/agora/base/internal/video/EglRenderer$7;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 11
    .line 12
    invoke-static {v2}, Lio/agora/base/internal/video/EglRenderer;->access$1400(Lio/agora/base/internal/video/EglRenderer;)J

    .line 13
    .line 14
    .line 15
    move-result-wide v2

    .line 16
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v2, " new:"

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget-wide v2, p0, Lio/agora/base/internal/video/EglRenderer$7;->val$newVsyncDuration:J

    .line 25
    .line 26
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-static {v0, v1}, Lio/agora/base/internal/video/EglRenderer;->access$1000(Lio/agora/base/internal/video/EglRenderer;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lio/agora/base/internal/video/EglRenderer$7;->this$0:Lio/agora/base/internal/video/EglRenderer;

    .line 37
    .line 38
    iget-wide v1, p0, Lio/agora/base/internal/video/EglRenderer$7;->val$newVsyncDuration:J

    .line 39
    .line 40
    invoke-static {v0, v1, v2}, Lio/agora/base/internal/video/EglRenderer;->access$1402(Lio/agora/base/internal/video/EglRenderer;J)J

    .line 41
    .line 42
    .line 43
    return-void
.end method
