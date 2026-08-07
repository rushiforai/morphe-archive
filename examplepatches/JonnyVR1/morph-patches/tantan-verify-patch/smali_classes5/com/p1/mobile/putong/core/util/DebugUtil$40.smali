.class Lcom/p1/mobile/putong/core/util/DebugUtil$40;
.super Lcom/p1/mobile/putong/data/User;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/util/DebugUtil;->Gj(Ll/y20;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field isMerged:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/User;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$40;->isMerged:Z

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public shouldMergeData()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$40;->isMerged:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$40;->isMerged:Z

    .line 9
    .line 10
    return v0
.end method
