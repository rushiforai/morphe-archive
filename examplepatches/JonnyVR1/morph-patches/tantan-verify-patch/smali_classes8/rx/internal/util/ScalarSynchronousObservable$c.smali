.class public Lrx/internal/util/ScalarSynchronousObservable$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lrx/internal/util/ScalarSynchronousObservable;->d(Ll/qcj;)Lrx/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
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
.field public final synthetic a:Ll/qcj;

.field public final synthetic b:Lrx/internal/util/ScalarSynchronousObservable;


# direct methods
.method public constructor <init>(Lrx/internal/util/ScalarSynchronousObservable;Ll/qcj;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/internal/util/ScalarSynchronousObservable$c;->b:Lrx/internal/util/ScalarSynchronousObservable;

    .line 2
    .line 3
    iput-object p2, p0, Lrx/internal/util/ScalarSynchronousObservable$c;->a:Ll/qcj;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TR;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lrx/internal/util/ScalarSynchronousObservable$c;->a:Ll/qcj;

    .line 2
    .line 3
    iget-object p0, p0, Lrx/internal/util/ScalarSynchronousObservable$c;->b:Lrx/internal/util/ScalarSynchronousObservable;

    .line 4
    .line 5
    iget-object p0, p0, Lrx/internal/util/ScalarSynchronousObservable;->a:Ljava/lang/Object;

    .line 6
    .line 7
    invoke-interface {v0, p0}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lrx/c;

    .line 12
    .line 13
    instance-of v0, p0, Lrx/internal/util/ScalarSynchronousObservable;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    check-cast p0, Lrx/internal/util/ScalarSynchronousObservable;

    .line 18
    .line 19
    iget-object p0, p0, Lrx/internal/util/ScalarSynchronousObservable;->a:Ljava/lang/Object;

    .line 20
    .line 21
    invoke-static {p1, p0}, Lrx/internal/util/ScalarSynchronousObservable;->b(Ll/gcg0;Ljava/lang/Object;)Ll/vk90;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p1, p0}, Ll/gcg0;->f(Ll/vk90;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-static {p1}, Ll/icg0;->c(Ll/gcg0;)Ll/gcg0;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p1}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/internal/util/ScalarSynchronousObservable$c;->a(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
