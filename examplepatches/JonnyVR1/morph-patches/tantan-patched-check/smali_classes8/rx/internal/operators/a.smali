.class public final Lrx/internal/operators/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/operators/a$c;,
        Lrx/internal/operators/a$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$a<",
        "TR;>;"
    }
.end annotation


# instance fields
.field public final a:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "+TT;>;"
        }
    .end annotation
.end field

.field public final b:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "-TT;+",
            "Ljava/lang/Iterable<",
            "+TR;>;>;"
        }
    .end annotation
.end field

.field public final c:I


# direct methods
.method public constructor <init>(Lrx/c;Ll/qcj;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "+TT;>;",
            "Ll/qcj<",
            "-TT;+",
            "Ljava/lang/Iterable<",
            "+TR;>;>;I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrx/internal/operators/a;->a:Lrx/c;

    .line 5
    .line 6
    iput-object p2, p0, Lrx/internal/operators/a;->b:Ll/qcj;

    .line 7
    .line 8
    iput p3, p0, Lrx/internal/operators/a;->c:I

    .line 9
    .line 10
    return-void
.end method

.method public static b(Lrx/c;Ll/qcj;I)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Ll/qcj<",
            "-TT;+",
            "Ljava/lang/Iterable<",
            "+TR;>;>;I)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    instance-of v0, p0, Lrx/internal/util/ScalarSynchronousObservable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lrx/internal/util/ScalarSynchronousObservable;

    .line 6
    .line 7
    invoke-virtual {p0}, Lrx/internal/util/ScalarSynchronousObservable;->c()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance p2, Lrx/internal/operators/a$c;

    .line 12
    .line 13
    invoke-direct {p2, p0, p1}, Lrx/internal/operators/a$c;-><init>(Ljava/lang/Object;Ll/qcj;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p2}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_0
    new-instance v0, Lrx/internal/operators/a;

    .line 22
    .line 23
    invoke-direct {v0, p0, p1, p2}, Lrx/internal/operators/a;-><init>(Lrx/c;Ll/qcj;I)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
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
    new-instance v0, Lrx/internal/operators/a$b;

    .line 2
    .line 3
    iget-object v1, p0, Lrx/internal/operators/a;->b:Ll/qcj;

    .line 4
    .line 5
    iget v2, p0, Lrx/internal/operators/a;->c:I

    .line 6
    .line 7
    invoke-direct {v0, p1, v1, v2}, Lrx/internal/operators/a$b;-><init>(Ll/gcg0;Ll/qcj;I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Lrx/internal/operators/a$a;

    .line 14
    .line 15
    invoke-direct {v1, p0, v0}, Lrx/internal/operators/a$a;-><init>(Lrx/internal/operators/a;Lrx/internal/operators/a$b;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, v1}, Ll/gcg0;->f(Ll/vk90;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lrx/internal/operators/a;->a:Lrx/c;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/internal/operators/a;->a(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
