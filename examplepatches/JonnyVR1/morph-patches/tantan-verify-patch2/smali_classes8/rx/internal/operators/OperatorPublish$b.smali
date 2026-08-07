.class public final Lrx/internal/operators/OperatorPublish$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/operators/OperatorPublish;->g(Lrx/c;Ll/qcj;Z)Lrx/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lrx/c$a<",
        "TR;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ll/qcj;

.field public final synthetic c:Lrx/c;


# direct methods
.method public constructor <init>(ZLl/qcj;Lrx/c;)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lrx/internal/operators/OperatorPublish$b;->a:Z

    .line 2
    .line 3
    iput-object p2, p0, Lrx/internal/operators/OperatorPublish$b;->b:Ll/qcj;

    .line 4
    .line 5
    iput-object p3, p0, Lrx/internal/operators/OperatorPublish$b;->c:Lrx/c;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TR;>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/internal/operators/OnSubscribePublishMulticast;

    .line 2
    .line 3
    sget v1, Ll/urd0;->g:I

    .line 4
    .line 5
    iget-boolean v2, p0, Lrx/internal/operators/OperatorPublish$b;->a:Z

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Lrx/internal/operators/OnSubscribePublishMulticast;-><init>(IZ)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Lrx/internal/operators/OperatorPublish$b$a;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1, v0}, Lrx/internal/operators/OperatorPublish$b$a;-><init>(Lrx/internal/operators/OperatorPublish$b;Ll/gcg0;Lrx/internal/operators/OnSubscribePublishMulticast;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, v1}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lrx/internal/operators/OperatorPublish$b;->b:Ll/qcj;

    .line 22
    .line 23
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-interface {p1, v2}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Lrx/c;

    .line 32
    .line 33
    invoke-virtual {p1, v1}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lrx/internal/operators/OperatorPublish$b;->c:Lrx/c;

    .line 37
    .line 38
    invoke-virtual {v0}, Lrx/internal/operators/OnSubscribePublishMulticast;->subscriber()Ll/gcg0;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p1}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorPublish$b;->a(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
