.class public final Lrx/internal/util/ScalarSynchronousObservable;
.super Lrx/c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/util/ScalarSynchronousObservable$f;,
        Lrx/internal/util/ScalarSynchronousObservable$ScalarAsyncProducer;,
        Lrx/internal/util/ScalarSynchronousObservable$e;,
        Lrx/internal/util/ScalarSynchronousObservable$d;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lrx/c<",
        "TT;>;"
    }
.end annotation


# static fields
.field public static final b:Z


# instance fields
.field public final a:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "rx.just.strong-mode"

    .line 2
    .line 3
    const-string v1, "false"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    sput-boolean v0, Lrx/internal/util/ScalarSynchronousObservable;->b:Z

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/internal/util/ScalarSynchronousObservable$d;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lrx/internal/util/ScalarSynchronousObservable$d;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/hrd0;->h(Lrx/c$a;)Lrx/c$a;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-direct {p0, v0}, Lrx/c;-><init>(Lrx/c$a;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lrx/internal/util/ScalarSynchronousObservable;->a:Ljava/lang/Object;

    .line 14
    .line 15
    return-void
.end method

.method public static a(Ljava/lang/Object;)Lrx/internal/util/ScalarSynchronousObservable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Lrx/internal/util/ScalarSynchronousObservable<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/internal/util/ScalarSynchronousObservable;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lrx/internal/util/ScalarSynchronousObservable;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static b(Ll/gcg0;Ljava/lang/Object;)Ll/vk90;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/gcg0<",
            "-TT;>;TT;)",
            "Ll/vk90;"
        }
    .end annotation

    .line 1
    sget-boolean v0, Lrx/internal/util/ScalarSynchronousObservable;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lrx/internal/producers/SingleProducer;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1}, Lrx/internal/producers/SingleProducer;-><init>(Ll/gcg0;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-object v0

    .line 11
    :cond_0
    new-instance v0, Lrx/internal/util/ScalarSynchronousObservable$f;

    .line 12
    .line 13
    invoke-direct {v0, p0, p1}, Lrx/internal/util/ScalarSynchronousObservable$f;-><init>(Ll/gcg0;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method


# virtual methods
.method public c()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lrx/internal/util/ScalarSynchronousObservable;->a:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ll/qcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-TT;+",
            "Lrx/c<",
            "+TR;>;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/internal/util/ScalarSynchronousObservable$c;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lrx/internal/util/ScalarSynchronousObservable$c;-><init>(Lrx/internal/util/ScalarSynchronousObservable;Ll/qcj;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public e(Ll/f2e0;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    instance-of v0, p1, Ll/z4f;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/z4f;

    .line 6
    .line 7
    new-instance v0, Lrx/internal/util/ScalarSynchronousObservable$a;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1}, Lrx/internal/util/ScalarSynchronousObservable$a;-><init>(Lrx/internal/util/ScalarSynchronousObservable;Ll/z4f;)V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    new-instance v0, Lrx/internal/util/ScalarSynchronousObservable$b;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1}, Lrx/internal/util/ScalarSynchronousObservable$b;-><init>(Lrx/internal/util/ScalarSynchronousObservable;Ll/f2e0;)V

    .line 16
    .line 17
    .line 18
    :goto_0
    new-instance p1, Lrx/internal/util/ScalarSynchronousObservable$e;

    .line 19
    .line 20
    iget-object p0, p0, Lrx/internal/util/ScalarSynchronousObservable;->a:Ljava/lang/Object;

    .line 21
    .line 22
    invoke-direct {p1, p0, v0}, Lrx/internal/util/ScalarSynchronousObservable$e;-><init>(Ljava/lang/Object;Ll/qcj;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p1}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method
