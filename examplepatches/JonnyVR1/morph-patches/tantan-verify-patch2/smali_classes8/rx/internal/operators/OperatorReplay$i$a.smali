.class public Lrx/internal/operators/OperatorReplay$i$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorReplay$i;->i()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lrx/internal/operators/OperatorReplay$i;


# direct methods
.method public constructor <init>(Lrx/internal/operators/OperatorReplay$i;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/internal/operators/OperatorReplay$i$a;->a:Lrx/internal/operators/OperatorReplay$i;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public call()V
    .locals 6

    .line 1
    iget-object v0, p0, Lrx/internal/operators/OperatorReplay$i$a;->a:Lrx/internal/operators/OperatorReplay$i;

    .line 2
    .line 3
    iget-boolean v0, v0, Lrx/internal/operators/OperatorReplay$i;->h:Z

    .line 4
    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lrx/internal/operators/OperatorReplay$i$a;->a:Lrx/internal/operators/OperatorReplay$i;

    .line 8
    .line 9
    iget-object v0, v0, Lrx/internal/operators/OperatorReplay$i;->i:Ll/qx50;

    .line 10
    .line 11
    monitor-enter v0

    .line 12
    :try_start_0
    iget-object v1, p0, Lrx/internal/operators/OperatorReplay$i$a;->a:Lrx/internal/operators/OperatorReplay$i;

    .line 13
    .line 14
    iget-boolean v1, v1, Lrx/internal/operators/OperatorReplay$i;->h:Z

    .line 15
    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    iget-object v1, p0, Lrx/internal/operators/OperatorReplay$i$a;->a:Lrx/internal/operators/OperatorReplay$i;

    .line 19
    .line 20
    iget-object v1, v1, Lrx/internal/operators/OperatorReplay$i;->i:Ll/qx50;

    .line 21
    .line 22
    invoke-virtual {v1}, Ll/qx50;->f()V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lrx/internal/operators/OperatorReplay$i$a;->a:Lrx/internal/operators/OperatorReplay$i;

    .line 26
    .line 27
    iget-wide v2, v1, Lrx/internal/operators/OperatorReplay$i;->k:J

    .line 28
    .line 29
    const-wide/16 v4, 0x1

    .line 30
    .line 31
    add-long/2addr v2, v4

    .line 32
    iput-wide v2, v1, Lrx/internal/operators/OperatorReplay$i;->k:J

    .line 33
    .line 34
    iget-object p0, p0, Lrx/internal/operators/OperatorReplay$i$a;->a:Lrx/internal/operators/OperatorReplay$i;

    .line 35
    .line 36
    const/4 v1, 0x1

    .line 37
    iput-boolean v1, p0, Lrx/internal/operators/OperatorReplay$i;->h:Z

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception p0

    .line 41
    goto :goto_1

    .line 42
    :cond_0
    :goto_0
    monitor-exit v0

    .line 43
    return-void

    .line 44
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    throw p0

    .line 46
    :cond_1
    return-void
.end method
