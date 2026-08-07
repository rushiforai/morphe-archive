.class Lcom/immomo/mediacore/sink/IjkWriter$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/mediacore/sink/IjkWriter;->prepare()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/immomo/mediacore/sink/IjkWriter;


# direct methods
.method public constructor <init>(Lcom/immomo/mediacore/sink/IjkWriter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mediacore/sink/IjkWriter$2;->this$0:Lcom/immomo/mediacore/sink/IjkWriter;

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
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/immomo/mediacore/sink/IjkWriter$2;->this$0:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/immomo/mediacore/sink/IjkWriter;->mContext:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 4
    .line 5
    if-eqz v1, :cond_1

    .line 6
    .line 7
    invoke-static {v0}, Lcom/immomo/mediacore/sink/IjkWriter;->access$000(Lcom/immomo/mediacore/sink/IjkWriter;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    const-wide/16 v2, 0x0

    .line 12
    .line 13
    cmp-long v0, v0, v2

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/immomo/mediacore/sink/IjkWriter$2;->this$0:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/immomo/mediacore/sink/IjkWriter;->access$100(Lcom/immomo/mediacore/sink/IjkWriter;)J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    cmp-long v0, v0, v2

    .line 24
    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    :cond_0
    iget-object p0, p0, Lcom/immomo/mediacore/sink/IjkWriter$2;->this$0:Lcom/immomo/mediacore/sink/IjkWriter;

    .line 28
    .line 29
    iget-object v0, p0, Lcom/immomo/mediacore/sink/IjkWriter;->mContext:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 30
    .line 31
    const/16 v1, -0x130

    .line 32
    .line 33
    const/4 v2, 0x1

    .line 34
    const/16 v3, 0x12c

    .line 35
    .line 36
    invoke-interface {v0, v3, v1, v2, p0}, Lcom/immomo/mediacore/strinf/NotifyCenter;->notify(IIILjava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method
