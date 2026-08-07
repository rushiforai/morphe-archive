.class public Lrx/internal/operators/OperatorPublish$c$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorPublish$c;->j()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lrx/internal/operators/OperatorPublish$c;


# direct methods
.method public constructor <init>(Lrx/internal/operators/OperatorPublish$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/internal/operators/OperatorPublish$c$a;->a:Lrx/internal/operators/OperatorPublish$c;

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
    .locals 2

    .line 1
    iget-object v0, p0, Lrx/internal/operators/OperatorPublish$c$a;->a:Lrx/internal/operators/OperatorPublish$c;

    .line 2
    .line 3
    iget-object v0, v0, Lrx/internal/operators/OperatorPublish$c;->i:Ljava/util/concurrent/atomic/AtomicReference;

    .line 4
    .line 5
    sget-object v1, Lrx/internal/operators/OperatorPublish$c;->n:[Lrx/internal/operators/OperatorPublish$InnerProducer;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lrx/internal/operators/OperatorPublish$c$a;->a:Lrx/internal/operators/OperatorPublish$c;

    .line 11
    .line 12
    iget-object v0, p0, Lrx/internal/operators/OperatorPublish$c;->g:Ljava/util/concurrent/atomic/AtomicReference;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-static {v0, p0, v1}, Ll/m31;->a(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method
