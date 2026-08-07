.class public Lrx/c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/c$d;,
        Lrx/c$b;,
        Lrx/c$c;,
        Lrx/c$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field final onSubscribe:Lrx/c$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c$a<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lrx/c$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c$a<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrx/c;->onSubscribe:Lrx/c$a;

    .line 5
    .line 6
    return-void
.end method

.method public static amb(Ljava/lang/Iterable;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable<",
            "+",
            "Lrx/c<",
            "+TT;>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/vn50;->a(Ljava/lang/Iterable;)Lrx/c$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static amb(Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 10
    invoke-static {p0, p1}, Ll/vn50;->b(Lrx/c;Lrx/c;)Lrx/c$a;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static amb(Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 11
    invoke-static {p0, p1, p2}, Ll/vn50;->c(Lrx/c;Lrx/c;Lrx/c;)Lrx/c$a;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static amb(Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 12
    invoke-static {p0, p1, p2, p3}, Ll/vn50;->d(Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c$a;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static amb(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 13
    invoke-static {p0, p1, p2, p3, p4}, Ll/vn50;->e(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c$a;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static amb(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 14
    invoke-static/range {p0 .. p5}, Ll/vn50;->f(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c$a;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static amb(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 15
    invoke-static/range {p0 .. p6}, Ll/vn50;->g(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c$a;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static amb(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 16
    invoke-static/range {p0 .. p7}, Ll/vn50;->h(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c$a;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static amb(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 17
    invoke-static/range {p0 .. p8}, Ll/vn50;->i(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c$a;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static combineLatest(Ljava/lang/Iterable;Ll/zcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable<",
            "+",
            "Lrx/c<",
            "+TT;>;>;",
            "Ll/zcj<",
            "+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 26
    new-instance v0, Lrx/internal/operators/OnSubscribeCombineLatest;

    invoke-direct {v0, p0, p1}, Lrx/internal/operators/OnSubscribeCombineLatest;-><init>(Ljava/lang/Iterable;Ll/zcj;)V

    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static combineLatest(Ljava/util/List;Ll/zcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "+",
            "Lrx/c<",
            "+TT;>;>;",
            "Ll/zcj<",
            "+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 25
    new-instance v0, Lrx/internal/operators/OnSubscribeCombineLatest;

    invoke-direct {v0, p0, p1}, Lrx/internal/operators/OnSubscribeCombineLatest;-><init>(Ljava/lang/Iterable;Ll/zcj;)V

    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT1;>;",
            "Lrx/c<",
            "+TT2;>;",
            "Ll/rcj<",
            "-TT1;-TT2;+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    filled-new-array {p0, p1}, [Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p2}, Ll/edj;->a(Ll/rcj;)Ll/zcj;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p0, p1}, Lrx/c;->combineLatest(Ljava/util/List;Ll/zcj;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static combineLatest(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT1;>;",
            "Lrx/c<",
            "+TT2;>;",
            "Lrx/c<",
            "+TT3;>;",
            "Ll/scj<",
            "-TT1;-TT2;-TT3;+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 18
    filled-new-array {p0, p1, p2}, [Lrx/c;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-static {p3}, Ll/edj;->b(Ll/scj;)Ll/zcj;

    move-result-object p1

    invoke-static {p0, p1}, Lrx/c;->combineLatest(Ljava/util/List;Ll/zcj;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static combineLatest(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/tcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT1;>;",
            "Lrx/c<",
            "+TT2;>;",
            "Lrx/c<",
            "+TT3;>;",
            "Lrx/c<",
            "+TT4;>;",
            "Ll/tcj<",
            "-TT1;-TT2;-TT3;-TT4;+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 19
    filled-new-array {p0, p1, p2, p3}, [Lrx/c;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-static {p4}, Ll/edj;->c(Ll/tcj;)Ll/zcj;

    move-result-object p1

    invoke-static {p0, p1}, Lrx/c;->combineLatest(Ljava/util/List;Ll/zcj;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static combineLatest(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/ucj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "T5:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT1;>;",
            "Lrx/c<",
            "+TT2;>;",
            "Lrx/c<",
            "+TT3;>;",
            "Lrx/c<",
            "+TT4;>;",
            "Lrx/c<",
            "+TT5;>;",
            "Ll/ucj<",
            "-TT1;-TT2;-TT3;-TT4;-TT5;+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 20
    filled-new-array {p0, p1, p2, p3, p4}, [Lrx/c;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-static {p5}, Ll/edj;->d(Ll/ucj;)Ll/zcj;

    move-result-object p1

    invoke-static {p0, p1}, Lrx/c;->combineLatest(Ljava/util/List;Ll/zcj;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static combineLatest(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/vcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "T5:",
            "Ljava/lang/Object;",
            "T6:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT1;>;",
            "Lrx/c<",
            "+TT2;>;",
            "Lrx/c<",
            "+TT3;>;",
            "Lrx/c<",
            "+TT4;>;",
            "Lrx/c<",
            "+TT5;>;",
            "Lrx/c<",
            "+TT6;>;",
            "Ll/vcj<",
            "-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 21
    filled-new-array/range {p0 .. p5}, [Lrx/c;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-static {p6}, Ll/edj;->e(Ll/vcj;)Ll/zcj;

    move-result-object p1

    invoke-static {p0, p1}, Lrx/c;->combineLatest(Ljava/util/List;Ll/zcj;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static combineLatest(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/wcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "T5:",
            "Ljava/lang/Object;",
            "T6:",
            "Ljava/lang/Object;",
            "T7:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT1;>;",
            "Lrx/c<",
            "+TT2;>;",
            "Lrx/c<",
            "+TT3;>;",
            "Lrx/c<",
            "+TT4;>;",
            "Lrx/c<",
            "+TT5;>;",
            "Lrx/c<",
            "+TT6;>;",
            "Lrx/c<",
            "+TT7;>;",
            "Ll/wcj<",
            "-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 22
    filled-new-array/range {p0 .. p6}, [Lrx/c;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-static {p7}, Ll/edj;->f(Ll/wcj;)Ll/zcj;

    move-result-object p1

    invoke-static {p0, p1}, Lrx/c;->combineLatest(Ljava/util/List;Ll/zcj;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static combineLatest(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/xcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "T5:",
            "Ljava/lang/Object;",
            "T6:",
            "Ljava/lang/Object;",
            "T7:",
            "Ljava/lang/Object;",
            "T8:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT1;>;",
            "Lrx/c<",
            "+TT2;>;",
            "Lrx/c<",
            "+TT3;>;",
            "Lrx/c<",
            "+TT4;>;",
            "Lrx/c<",
            "+TT5;>;",
            "Lrx/c<",
            "+TT6;>;",
            "Lrx/c<",
            "+TT7;>;",
            "Lrx/c<",
            "+TT8;>;",
            "Ll/xcj<",
            "-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;-TT8;+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 23
    filled-new-array/range {p0 .. p7}, [Lrx/c;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-static {p8}, Ll/edj;->g(Ll/xcj;)Ll/zcj;

    move-result-object p1

    invoke-static {p0, p1}, Lrx/c;->combineLatest(Ljava/util/List;Ll/zcj;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static combineLatest(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/ycj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "T5:",
            "Ljava/lang/Object;",
            "T6:",
            "Ljava/lang/Object;",
            "T7:",
            "Ljava/lang/Object;",
            "T8:",
            "Ljava/lang/Object;",
            "T9:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT1;>;",
            "Lrx/c<",
            "+TT2;>;",
            "Lrx/c<",
            "+TT3;>;",
            "Lrx/c<",
            "+TT4;>;",
            "Lrx/c<",
            "+TT5;>;",
            "Lrx/c<",
            "+TT6;>;",
            "Lrx/c<",
            "+TT7;>;",
            "Lrx/c<",
            "+TT8;>;",
            "Lrx/c<",
            "+TT9;>;",
            "Ll/ycj<",
            "-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;-TT8;-TT9;+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 24
    filled-new-array/range {p0 .. p8}, [Lrx/c;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-static {p9}, Ll/edj;->h(Ll/ycj;)Ll/zcj;

    move-result-object p1

    invoke-static {p0, p1}, Lrx/c;->combineLatest(Ljava/util/List;Ll/zcj;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static combineLatestDelayError(Ljava/lang/Iterable;Ll/zcj;)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable<",
            "+",
            "Lrx/c<",
            "+TT;>;>;",
            "Ll/zcj<",
            "+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/internal/operators/OnSubscribeCombineLatest;

    .line 2
    .line 3
    sget v4, Ll/urd0;->g:I

    .line 4
    .line 5
    const/4 v5, 0x1

    .line 6
    const/4 v1, 0x0

    .line 7
    move-object v2, p0

    .line 8
    move-object v3, p1

    .line 9
    invoke-direct/range {v0 .. v5}, Lrx/internal/operators/OnSubscribeCombineLatest;-><init>([Lrx/c;Ljava/lang/Iterable;Ll/zcj;IZ)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static concat(Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+",
            "Lrx/c<",
            "+TT;>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lrx/internal/util/UtilityFunctions;->b()Ll/qcj;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Lrx/c;->concatMap(Ll/qcj;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static concat(Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 10
    invoke-static {p0, p1}, Lrx/c;->just(Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->concat(Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static concat(Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 11
    invoke-static {p0, p1, p2}, Lrx/c;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->concat(Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static concat(Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 12
    invoke-static {p0, p1, p2, p3}, Lrx/c;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->concat(Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static concat(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 13
    invoke-static {p0, p1, p2, p3, p4}, Lrx/c;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->concat(Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static concat(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 14
    invoke-static/range {p0 .. p5}, Lrx/c;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->concat(Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static concat(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 15
    invoke-static/range {p0 .. p6}, Lrx/c;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->concat(Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static concat(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 16
    invoke-static/range {p0 .. p7}, Lrx/c;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->concat(Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static concat(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 17
    invoke-static/range {p0 .. p8}, Lrx/c;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->concat(Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static concatDelayError(Ljava/lang/Iterable;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable<",
            "+",
            "Lrx/c<",
            "+TT;>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 10
    invoke-static {p0}, Lrx/c;->from(Ljava/lang/Iterable;)Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->concatDelayError(Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static concatDelayError(Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+",
            "Lrx/c<",
            "+TT;>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lrx/internal/util/UtilityFunctions;->b()Ll/qcj;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Lrx/c;->concatMapDelayError(Ll/qcj;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static concatEager(Ljava/lang/Iterable;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable<",
            "+",
            "Lrx/c<",
            "+TT;>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 21
    invoke-static {p0}, Lrx/c;->from(Ljava/lang/Iterable;)Lrx/c;

    move-result-object p0

    invoke-static {}, Lrx/internal/util/UtilityFunctions;->b()Ll/qcj;

    move-result-object v0

    invoke-virtual {p0, v0}, Lrx/c;->concatMapEager(Ll/qcj;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static concatEager(Ljava/lang/Iterable;I)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable<",
            "+",
            "Lrx/c<",
            "+TT;>;>;I)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 22
    invoke-static {p0}, Lrx/c;->from(Ljava/lang/Iterable;)Lrx/c;

    move-result-object p0

    invoke-static {}, Lrx/internal/util/UtilityFunctions;->b()Ll/qcj;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lrx/c;->concatMapEager(Ll/qcj;I)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static concatEager(Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+",
            "Lrx/c<",
            "+TT;>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 23
    invoke-static {}, Lrx/internal/util/UtilityFunctions;->b()Ll/qcj;

    move-result-object v0

    invoke-virtual {p0, v0}, Lrx/c;->concatMapEager(Ll/qcj;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static concatEager(Lrx/c;I)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+",
            "Lrx/c<",
            "+TT;>;>;I)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 24
    invoke-static {}, Lrx/internal/util/UtilityFunctions;->b()Ll/qcj;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lrx/c;->concatMapEager(Ll/qcj;I)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static concatEager(Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    filled-new-array {p0, p1}, [Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lrx/c;->concatEager(Ljava/lang/Iterable;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static concatEager(Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 14
    filled-new-array {p0, p1, p2}, [Lrx/c;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->concatEager(Ljava/lang/Iterable;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static concatEager(Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 15
    filled-new-array {p0, p1, p2, p3}, [Lrx/c;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->concatEager(Ljava/lang/Iterable;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static concatEager(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 16
    filled-new-array {p0, p1, p2, p3, p4}, [Lrx/c;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->concatEager(Ljava/lang/Iterable;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static concatEager(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 17
    filled-new-array/range {p0 .. p5}, [Lrx/c;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->concatEager(Ljava/lang/Iterable;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static concatEager(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 18
    filled-new-array/range {p0 .. p6}, [Lrx/c;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->concatEager(Ljava/lang/Iterable;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static concatEager(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 19
    filled-new-array/range {p0 .. p7}, [Lrx/c;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->concatEager(Ljava/lang/Iterable;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static concatEager(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 20
    filled-new-array/range {p0 .. p8}, [Lrx/c;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->concatEager(Ljava/lang/Iterable;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static create(Ll/s21;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<S:",
            "Ljava/lang/Object;",
            "T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/s21<",
            "TS;TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 12
    invoke-static {p0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static create(Lrx/c$a;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c$a<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/c;

    .line 2
    .line 3
    invoke-static {p0}, Ll/hrd0;->h(Lrx/c$a;)Lrx/c$a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Lrx/c;-><init>(Lrx/c$a;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public static create(Lrx/observables/SyncOnSubscribe;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<S:",
            "Ljava/lang/Object;",
            "T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/observables/SyncOnSubscribe<",
            "TS;TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 11
    invoke-static {p0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static defer(Ll/pcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/zn50;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/zn50;-><init>(Ll/pcj;)V

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

.method public static empty()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lrx/internal/operators/EmptyObservableHolder;->instance()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static error(Ljava/lang/Throwable;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Throwable;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/po50;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/po50;-><init>(Ljava/lang/Throwable;)V

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

.method public static from(Ljava/lang/Iterable;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 33
    new-instance v0, Lrx/internal/operators/OnSubscribeFromIterable;

    invoke-direct {v0, p0}, Lrx/internal/operators/OnSubscribeFromIterable;-><init>(Ljava/lang/Iterable;)V

    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static from(Ljava/util/concurrent/Future;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Future<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 34
    invoke-static {p0}, Ll/so50;->a(Ljava/util/concurrent/Future;)Lrx/c$a;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static from(Ljava/util/concurrent/Future;JLjava/util/concurrent/TimeUnit;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Future<",
            "+TT;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 30
    invoke-static {p0, p1, p2, p3}, Ll/so50;->b(Ljava/util/concurrent/Future;JLjava/util/concurrent/TimeUnit;)Lrx/c$a;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static from(Ljava/util/concurrent/Future;Ll/f2e0;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Future<",
            "+TT;>;",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 31
    invoke-static {p0}, Ll/so50;->a(Ljava/util/concurrent/Future;)Lrx/c$a;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    move-result-object p0

    .line 32
    invoke-virtual {p0, p1}, Lrx/c;->subscribeOn(Ll/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static from([Ljava/lang/Object;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    array-length v0, p0

    .line 2
    if-nez v0, :cond_0

    .line 3
    .line 4
    invoke-static {}, Lrx/c;->empty()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0

    .line 9
    :cond_0
    const/4 v1, 0x1

    .line 10
    if-ne v0, v1, :cond_1

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    aget-object p0, p0, v0

    .line 14
    .line 15
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_1
    new-instance v0, Lrx/internal/operators/OnSubscribeFromArray;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Lrx/internal/operators/OnSubscribeFromArray;-><init>([Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static fromAsync(Ll/y20;Lrx/AsyncEmitter$BackpressureMode;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/y20<",
            "Lrx/AsyncEmitter<",
            "TT;>;>;",
            "Lrx/AsyncEmitter$BackpressureMode;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/internal/operators/OnSubscribeFromAsync;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lrx/internal/operators/OnSubscribeFromAsync;-><init>(Ll/y20;Lrx/AsyncEmitter$BackpressureMode;)V

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

.method public static fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/eo50;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/eo50;-><init>(Ljava/util/concurrent/Callable;)V

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

.method public static interval(JJLjava/util/concurrent/TimeUnit;)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 16
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    move-result-object v5

    move-wide v0, p0

    move-wide v2, p2

    move-object v4, p4

    invoke-static/range {v0 .. v5}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static interval(JJLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/ro50;

    .line 2
    .line 3
    move-wide v1, p0

    .line 4
    move-wide v3, p2

    .line 5
    move-object v5, p4

    .line 6
    move-object v6, p5

    .line 7
    invoke-direct/range {v0 .. v6}, Ll/ro50;-><init>(JJLjava/util/concurrent/TimeUnit;Ll/f2e0;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 17
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    move-result-object v5

    move-wide v2, p0

    move-wide v0, p0

    move-object v4, p2

    invoke-static/range {v0 .. v5}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static interval(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    move-wide v2, p0

    move-wide v0, p0

    move-object v4, p2

    move-object v5, p3

    .line 15
    invoke-static/range {v0 .. v5}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static just(Ljava/lang/Object;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 10
    invoke-static {p0}, Lrx/internal/util/ScalarSynchronousObservable;->a(Ljava/lang/Object;)Lrx/internal/util/ScalarSynchronousObservable;

    move-result-object p0

    return-object p0
.end method

.method public static just(Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lrx/c;->from([Ljava/lang/Object;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;TT;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 11
    filled-new-array {p0, p1, p2}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->from([Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;TT;TT;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 12
    filled-new-array {p0, p1, p2, p3}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->from([Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;TT;TT;TT;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 13
    filled-new-array {p0, p1, p2, p3, p4}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->from([Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;TT;TT;TT;TT;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 14
    filled-new-array/range {p0 .. p5}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->from([Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;TT;TT;TT;TT;TT;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 15
    filled-new-array/range {p0 .. p6}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->from([Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;TT;TT;TT;TT;TT;TT;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 16
    filled-new-array/range {p0 .. p7}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->from([Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;TT;TT;TT;TT;TT;TT;TT;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 17
    filled-new-array/range {p0 .. p8}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->from([Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;TT;TT;TT;TT;TT;TT;TT;TT;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 18
    filled-new-array/range {p0 .. p9}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->from([Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method private mapNotification(Ll/qcj;Ll/qcj;Ll/pcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-TT;+TR;>;",
            "Ll/qcj<",
            "-",
            "Ljava/lang/Throwable;",
            "+TR;>;",
            "Ll/pcj<",
            "+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/r360;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p3}, Ll/r360;-><init>(Ll/qcj;Ll/qcj;Ll/pcj;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static merge(Ljava/lang/Iterable;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable<",
            "+",
            "Lrx/c<",
            "+TT;>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 31
    invoke-static {p0}, Lrx/c;->from(Ljava/lang/Iterable;)Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->merge(Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static merge(Ljava/lang/Iterable;I)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable<",
            "+",
            "Lrx/c<",
            "+TT;>;>;I)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 30
    invoke-static {p0}, Lrx/c;->from(Ljava/lang/Iterable;)Lrx/c;

    move-result-object p0

    invoke-static {p0, p1}, Lrx/c;->merge(Lrx/c;I)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static merge(Lrx/c;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+",
            "Lrx/c<",
            "+TT;>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-class v1, Lrx/internal/util/ScalarSynchronousObservable;

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    check-cast p0, Lrx/internal/util/ScalarSynchronousObservable;

    .line 10
    .line 11
    invoke-static {}, Lrx/internal/util/UtilityFunctions;->b()Ll/qcj;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Lrx/internal/util/ScalarSynchronousObservable;->d(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    invoke-static {v0}, Lrx/internal/operators/OperatorMerge;->b(Z)Lrx/internal/operators/OperatorMerge;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static merge(Lrx/c;I)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+",
            "Lrx/c<",
            "+TT;>;>;I)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 32
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lrx/internal/util/ScalarSynchronousObservable;

    if-ne v0, v1, :cond_0

    .line 33
    check-cast p0, Lrx/internal/util/ScalarSynchronousObservable;

    invoke-static {}, Lrx/internal/util/UtilityFunctions;->b()Ll/qcj;

    move-result-object p1

    invoke-virtual {p0, p1}, Lrx/internal/util/ScalarSynchronousObservable;->d(Ll/qcj;)Lrx/c;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 v0, 0x0

    .line 34
    invoke-static {v0, p1}, Lrx/internal/operators/OperatorMerge;->c(ZI)Lrx/internal/operators/OperatorMerge;

    move-result-object p1

    invoke-virtual {p0, p1}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static merge(Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 35
    filled-new-array {p0, p1}, [Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->merge([Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static merge(Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 36
    filled-new-array {p0, p1, p2}, [Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->merge([Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static merge(Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 37
    filled-new-array {p0, p1, p2, p3}, [Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->merge([Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static merge(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 38
    filled-new-array {p0, p1, p2, p3, p4}, [Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->merge([Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static merge(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 39
    filled-new-array/range {p0 .. p5}, [Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->merge([Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static merge(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 40
    filled-new-array/range {p0 .. p6}, [Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->merge([Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static merge(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 41
    filled-new-array/range {p0 .. p7}, [Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->merge([Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static merge(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 42
    filled-new-array/range {p0 .. p8}, [Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->merge([Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static merge([Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 43
    invoke-static {p0}, Lrx/c;->from([Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->merge(Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static merge([Lrx/c;I)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([",
            "Lrx/c<",
            "+TT;>;I)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 44
    invoke-static {p0}, Lrx/c;->from([Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    invoke-static {p0, p1}, Lrx/c;->merge(Lrx/c;I)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static mergeDelayError(Ljava/lang/Iterable;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable<",
            "+",
            "Lrx/c<",
            "+TT;>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 12
    invoke-static {p0}, Lrx/c;->from(Ljava/lang/Iterable;)Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->mergeDelayError(Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static mergeDelayError(Ljava/lang/Iterable;I)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable<",
            "+",
            "Lrx/c<",
            "+TT;>;>;I)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 13
    invoke-static {p0}, Lrx/c;->from(Ljava/lang/Iterable;)Lrx/c;

    move-result-object p0

    invoke-static {p0, p1}, Lrx/c;->mergeDelayError(Lrx/c;I)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static mergeDelayError(Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+",
            "Lrx/c<",
            "+TT;>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {v0}, Lrx/internal/operators/OperatorMerge;->b(Z)Lrx/internal/operators/OperatorMerge;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static mergeDelayError(Lrx/c;I)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+",
            "Lrx/c<",
            "+TT;>;>;I)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 11
    invoke-static {v0, p1}, Lrx/internal/operators/OperatorMerge;->c(ZI)Lrx/internal/operators/OperatorMerge;

    move-result-object p1

    invoke-virtual {p0, p1}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static mergeDelayError(Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 14
    invoke-static {p0, p1}, Lrx/c;->just(Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->mergeDelayError(Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static mergeDelayError(Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 15
    invoke-static {p0, p1, p2}, Lrx/c;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->mergeDelayError(Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static mergeDelayError(Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 16
    invoke-static {p0, p1, p2, p3}, Lrx/c;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->mergeDelayError(Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static mergeDelayError(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 17
    invoke-static {p0, p1, p2, p3, p4}, Lrx/c;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->mergeDelayError(Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static mergeDelayError(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 18
    invoke-static/range {p0 .. p5}, Lrx/c;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->mergeDelayError(Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static mergeDelayError(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 19
    invoke-static/range {p0 .. p6}, Lrx/c;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->mergeDelayError(Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static mergeDelayError(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 20
    invoke-static/range {p0 .. p7}, Lrx/c;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->mergeDelayError(Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static mergeDelayError(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 21
    invoke-static/range {p0 .. p8}, Lrx/c;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->mergeDelayError(Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static never()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lrx/internal/operators/NeverObservableHolder;->instance()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static range(II)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lrx/c<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-ltz p1, :cond_3

    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    invoke-static {}, Lrx/c;->empty()Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0

    .line 11
    :cond_0
    const/high16 v1, -0x80000000

    .line 12
    .line 13
    sub-int/2addr v1, p1

    .line 14
    if-gt p0, v1, :cond_2

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    if-ne p1, v0, :cond_1

    .line 18
    .line 19
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_1
    new-instance v1, Lrx/internal/operators/OnSubscribeRange;

    .line 29
    .line 30
    sub-int/2addr p1, v0

    .line 31
    add-int/2addr p1, p0

    .line 32
    invoke-direct {v1, p0, p1}, Lrx/internal/operators/OnSubscribeRange;-><init>(II)V

    .line 33
    .line 34
    .line 35
    invoke-static {v1}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0

    .line 40
    :cond_2
    const-string p0, "start + count can not exceed Integer.MAX_VALUE"

    .line 41
    .line 42
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-object v0

    .line 46
    :cond_3
    const-string p0, "Count can not be negative"

    .line 47
    .line 48
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-object v0
.end method

.method public static range(IILl/f2e0;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 52
    invoke-static {p0, p1}, Lrx/c;->range(II)Lrx/c;

    move-result-object p0

    invoke-virtual {p0, p2}, Lrx/c;->subscribeOn(Ll/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static sequenceEqual(Lrx/c;Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lrx/internal/util/InternalObservableUtils;->OBJECT_EQUALS:Lrx/internal/util/InternalObservableUtils$g;

    .line 2
    .line 3
    invoke-static {p0, p1, v0}, Lrx/c;->sequenceEqual(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static sequenceEqual(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT;>;",
            "Lrx/c<",
            "+TT;>;",
            "Ll/rcj<",
            "-TT;-TT;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 8
    invoke-static {p0, p1, p2}, Ll/c460;->b(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static subscribe(Ll/gcg0;Lrx/c;)Ll/kcg0;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/gcg0<",
            "-TT;>;",
            "Lrx/c<",
            "TT;>;)",
            "Ll/kcg0;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_3

    .line 3
    .line 4
    iget-object v1, p1, Lrx/c;->onSubscribe:Lrx/c$a;

    .line 5
    .line 6
    if-eqz v1, :cond_2

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/gcg0;->d()V

    .line 9
    .line 10
    .line 11
    instance-of v0, p0, Ll/nwd0;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Ll/nwd0;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/nwd0;-><init>(Ll/gcg0;)V

    .line 18
    .line 19
    .line 20
    move-object p0, v0

    .line 21
    :cond_0
    :try_start_0
    iget-object v0, p1, Lrx/c;->onSubscribe:Lrx/c$a;

    .line 22
    .line 23
    invoke-static {p1, v0}, Ll/hrd0;->p(Lrx/c;Lrx/c$a;)Lrx/c$a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p0}, Ll/hrd0;->o(Ll/kcg0;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    return-object p0

    .line 35
    :catchall_0
    move-exception p1

    .line 36
    invoke-static {p1}, Ll/j6f;->e(Ljava/lang/Throwable;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/gcg0;->isUnsubscribed()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    invoke-static {p1}, Ll/hrd0;->m(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {p0}, Ll/hrd0;->j(Ljava/lang/Throwable;)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    :try_start_1
    invoke-static {p1}, Ll/hrd0;->m(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-interface {p0, v0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 58
    .line 59
    .line 60
    :goto_0
    invoke-static {}, Ll/pcg0;->d()Ll/kcg0;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0

    .line 65
    :catchall_1
    move-exception p0

    .line 66
    invoke-static {p0}, Ll/j6f;->e(Ljava/lang/Throwable;)V

    .line 67
    .line 68
    .line 69
    new-instance v0, Lrx/exceptions/OnErrorFailedException;

    .line 70
    .line 71
    new-instance v1, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    const-string v2, "Error occurred attempting to subscribe ["

    .line 74
    .line 75
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string p1, "] and then again while trying to pass to onError."

    .line 86
    .line 87
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-direct {v0, p1, p0}, Lrx/exceptions/OnErrorFailedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 95
    .line 96
    .line 97
    invoke-static {v0}, Ll/hrd0;->m(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 98
    .line 99
    .line 100
    throw v0

    .line 101
    :cond_2
    const-string p0, "onSubscribe function can not be null."

    .line 102
    .line 103
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    return-object v0

    .line 107
    :cond_3
    const-string p0, "subscriber can not be null"

    .line 108
    .line 109
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    return-object v0
.end method

.method public static switchOnNext(Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+",
            "Lrx/c<",
            "+TT;>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ll/m460;->b(Z)Ll/m460;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static switchOnNextDelayError(Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+",
            "Lrx/c<",
            "+TT;>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {v0}, Ll/m460;->b(Z)Ll/m460;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static timer(JJLjava/util/concurrent/TimeUnit;)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    .line 2
    .line 3
    .line 4
    move-result-object v5

    .line 5
    move-wide v0, p0

    .line 6
    move-wide v2, p2

    .line 7
    move-object v4, p4

    .line 8
    invoke-static/range {v0 .. v5}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static timer(JJLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 13
    invoke-static/range {p0 .. p5}, Lrx/c;->interval(JJLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static timer(JLjava/util/concurrent/TimeUnit;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 14
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lrx/c;->timer(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static timer(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 15
    new-instance v0, Ll/qo50;

    invoke-direct {v0, p0, p1, p2, p3}, Ll/qo50;-><init>(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)V

    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static using(Ll/pcj;Ll/qcj;Ll/y20;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "Resource:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/pcj<",
            "TResource;>;",
            "Ll/qcj<",
            "-TResource;+",
            "Lrx/c<",
            "+TT;>;>;",
            "Ll/y20<",
            "-TResource;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 11
    invoke-static {p0, p1, p2, v0}, Lrx/c;->using(Ll/pcj;Ll/qcj;Ll/y20;Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static using(Ll/pcj;Ll/qcj;Ll/y20;Z)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "Resource:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/pcj<",
            "TResource;>;",
            "Ll/qcj<",
            "-TResource;+",
            "Lrx/c<",
            "+TT;>;>;",
            "Ll/y20<",
            "-TResource;>;Z)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/internal/operators/OnSubscribeUsing;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lrx/internal/operators/OnSubscribeUsing;-><init>(Ll/pcj;Ll/qcj;Ll/y20;Z)V

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

.method public static zip(Ljava/lang/Iterable;Ll/zcj;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable<",
            "+",
            "Lrx/c<",
            "*>;>;",
            "Ll/zcj<",
            "+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lrx/c;

    .line 21
    .line 22
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    new-array p0, p0, [Lrx/c;

    .line 31
    .line 32
    invoke-interface {v0, p0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    new-instance v0, Lrx/internal/operators/OperatorZip;

    .line 41
    .line 42
    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorZip;-><init>(Ll/zcj;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0
.end method

.method public static zip(Lrx/c;Ll/zcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+",
            "Lrx/c<",
            "*>;>;",
            "Ll/zcj<",
            "+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 51
    invoke-virtual {p0}, Lrx/c;->toList()Lrx/c;

    move-result-object p0

    sget-object v0, Lrx/internal/util/InternalObservableUtils;->TO_ARRAY:Lrx/internal/util/InternalObservableUtils$r;

    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    move-result-object p0

    new-instance v0, Lrx/internal/operators/OperatorZip;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorZip;-><init>(Ll/zcj;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static zip(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT1;>;",
            "Lrx/c<",
            "+TT2;>;",
            "Ll/rcj<",
            "-TT1;-TT2;+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 52
    filled-new-array {p0, p1}, [Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    new-instance p1, Lrx/internal/operators/OperatorZip;

    invoke-direct {p1, p2}, Lrx/internal/operators/OperatorZip;-><init>(Ll/rcj;)V

    invoke-virtual {p0, p1}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static zip(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT1;>;",
            "Lrx/c<",
            "+TT2;>;",
            "Lrx/c<",
            "+TT3;>;",
            "Ll/scj<",
            "-TT1;-TT2;-TT3;+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 53
    filled-new-array {p0, p1, p2}, [Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    new-instance p1, Lrx/internal/operators/OperatorZip;

    invoke-direct {p1, p3}, Lrx/internal/operators/OperatorZip;-><init>(Ll/scj;)V

    invoke-virtual {p0, p1}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static zip(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/tcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT1;>;",
            "Lrx/c<",
            "+TT2;>;",
            "Lrx/c<",
            "+TT3;>;",
            "Lrx/c<",
            "+TT4;>;",
            "Ll/tcj<",
            "-TT1;-TT2;-TT3;-TT4;+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 54
    filled-new-array {p0, p1, p2, p3}, [Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    new-instance p1, Lrx/internal/operators/OperatorZip;

    invoke-direct {p1, p4}, Lrx/internal/operators/OperatorZip;-><init>(Ll/tcj;)V

    invoke-virtual {p0, p1}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static zip(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/ucj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "T5:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT1;>;",
            "Lrx/c<",
            "+TT2;>;",
            "Lrx/c<",
            "+TT3;>;",
            "Lrx/c<",
            "+TT4;>;",
            "Lrx/c<",
            "+TT5;>;",
            "Ll/ucj<",
            "-TT1;-TT2;-TT3;-TT4;-TT5;+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 55
    filled-new-array {p0, p1, p2, p3, p4}, [Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    new-instance p1, Lrx/internal/operators/OperatorZip;

    invoke-direct {p1, p5}, Lrx/internal/operators/OperatorZip;-><init>(Ll/ucj;)V

    invoke-virtual {p0, p1}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static zip(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/vcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "T5:",
            "Ljava/lang/Object;",
            "T6:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT1;>;",
            "Lrx/c<",
            "+TT2;>;",
            "Lrx/c<",
            "+TT3;>;",
            "Lrx/c<",
            "+TT4;>;",
            "Lrx/c<",
            "+TT5;>;",
            "Lrx/c<",
            "+TT6;>;",
            "Ll/vcj<",
            "-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 56
    filled-new-array/range {p0 .. p5}, [Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    new-instance p1, Lrx/internal/operators/OperatorZip;

    invoke-direct {p1, p6}, Lrx/internal/operators/OperatorZip;-><init>(Ll/vcj;)V

    invoke-virtual {p0, p1}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static zip(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/wcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "T5:",
            "Ljava/lang/Object;",
            "T6:",
            "Ljava/lang/Object;",
            "T7:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT1;>;",
            "Lrx/c<",
            "+TT2;>;",
            "Lrx/c<",
            "+TT3;>;",
            "Lrx/c<",
            "+TT4;>;",
            "Lrx/c<",
            "+TT5;>;",
            "Lrx/c<",
            "+TT6;>;",
            "Lrx/c<",
            "+TT7;>;",
            "Ll/wcj<",
            "-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 57
    filled-new-array/range {p0 .. p6}, [Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    new-instance p1, Lrx/internal/operators/OperatorZip;

    invoke-direct {p1, p7}, Lrx/internal/operators/OperatorZip;-><init>(Ll/wcj;)V

    invoke-virtual {p0, p1}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static zip(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/xcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "T5:",
            "Ljava/lang/Object;",
            "T6:",
            "Ljava/lang/Object;",
            "T7:",
            "Ljava/lang/Object;",
            "T8:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT1;>;",
            "Lrx/c<",
            "+TT2;>;",
            "Lrx/c<",
            "+TT3;>;",
            "Lrx/c<",
            "+TT4;>;",
            "Lrx/c<",
            "+TT5;>;",
            "Lrx/c<",
            "+TT6;>;",
            "Lrx/c<",
            "+TT7;>;",
            "Lrx/c<",
            "+TT8;>;",
            "Ll/xcj<",
            "-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;-TT8;+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 58
    filled-new-array/range {p0 .. p7}, [Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    new-instance p1, Lrx/internal/operators/OperatorZip;

    invoke-direct {p1, p8}, Lrx/internal/operators/OperatorZip;-><init>(Ll/xcj;)V

    invoke-virtual {p0, p1}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static zip(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/ycj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "T5:",
            "Ljava/lang/Object;",
            "T6:",
            "Ljava/lang/Object;",
            "T7:",
            "Ljava/lang/Object;",
            "T8:",
            "Ljava/lang/Object;",
            "T9:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT1;>;",
            "Lrx/c<",
            "+TT2;>;",
            "Lrx/c<",
            "+TT3;>;",
            "Lrx/c<",
            "+TT4;>;",
            "Lrx/c<",
            "+TT5;>;",
            "Lrx/c<",
            "+TT6;>;",
            "Lrx/c<",
            "+TT7;>;",
            "Lrx/c<",
            "+TT8;>;",
            "Lrx/c<",
            "+TT9;>;",
            "Ll/ycj<",
            "-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;-TT8;-TT9;+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 59
    filled-new-array/range {p0 .. p8}, [Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    new-instance p1, Lrx/internal/operators/OperatorZip;

    invoke-direct {p1, p9}, Lrx/internal/operators/OperatorZip;-><init>(Ll/ycj;)V

    invoke-virtual {p0, p1}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static zip([Lrx/c;Ll/zcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">([",
            "Lrx/c<",
            "*>;",
            "Ll/zcj<",
            "+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 50
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    new-instance v0, Lrx/internal/operators/OperatorZip;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorZip;-><init>(Ll/zcj;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final all(Ll/qcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "-TT;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/u260;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/u260;-><init>(Ll/qcj;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final ambWith(Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, Lrx/c;->amb(Lrx/c;Lrx/c;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final asObservable()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/w260;->b()Ll/w260;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final buffer(I)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/c<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    .line 19
    invoke-virtual {p0, p1, p1}, Lrx/c;->buffer(II)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final buffer(II)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lrx/c<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    .line 20
    new-instance v0, Lrx/internal/operators/OperatorBufferWithSize;

    invoke-direct {v0, p1, p2}, Lrx/internal/operators/OperatorBufferWithSize;-><init>(II)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final buffer(JJLjava/util/concurrent/TimeUnit;)Lrx/c;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    .line 21
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    move-result-object v6

    move-object v0, p0

    move-wide v1, p1

    move-wide v3, p3

    move-object v5, p5

    invoke-virtual/range {v0 .. v6}, Lrx/c;->buffer(JJLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final buffer(JJLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    .line 22
    new-instance v0, Ll/z260;

    const v6, 0x7fffffff

    move-wide v1, p1

    move-wide v3, p3

    move-object v5, p5

    move-object v7, p6

    invoke-direct/range {v0 .. v7}, Ll/z260;-><init>(JJLjava/util/concurrent/TimeUnit;ILl/f2e0;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final buffer(JLjava/util/concurrent/TimeUnit;)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    const v4, 0x7fffffff

    .line 23
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    move-result-object v5

    move-object v0, p0

    move-wide v1, p1

    move-object v3, p3

    invoke-virtual/range {v0 .. v5}, Lrx/c;->buffer(JLjava/util/concurrent/TimeUnit;ILl/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final buffer(JLjava/util/concurrent/TimeUnit;I)Lrx/c;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "I)",
            "Lrx/c<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/z260;

    .line 2
    .line 3
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    .line 4
    .line 5
    .line 6
    move-result-object v7

    .line 7
    move-wide v3, p1

    .line 8
    move-wide v1, p1

    .line 9
    move-object v5, p3

    .line 10
    move v6, p4

    .line 11
    invoke-direct/range {v0 .. v7}, Ll/z260;-><init>(JJLjava/util/concurrent/TimeUnit;ILl/f2e0;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public final buffer(JLjava/util/concurrent/TimeUnit;ILl/f2e0;)Lrx/c;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "I",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    .line 25
    new-instance v0, Ll/z260;

    move-wide v3, p1

    move-wide v1, p1

    move-object v5, p3

    move v6, p4

    move-object v7, p5

    invoke-direct/range {v0 .. v7}, Ll/z260;-><init>(JJLjava/util/concurrent/TimeUnit;ILl/f2e0;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final buffer(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    move-wide v3, p1

    move-object v0, p0

    move-wide v1, p1

    move-object v5, p3

    move-object v6, p4

    .line 26
    invoke-virtual/range {v0 .. v6}, Lrx/c;->buffer(JJLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final buffer(Ll/pcj;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TClosing:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/pcj<",
            "+",
            "Lrx/c<",
            "+TTClosing;>;>;)",
            "Lrx/c<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    .line 24
    new-instance v0, Ll/x260;

    const/16 v1, 0x10

    invoke-direct {v0, p1, v1}, Ll/x260;-><init>(Ll/pcj;I)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final buffer(Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<B:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TB;>;)",
            "Lrx/c<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    const/16 v0, 0x10

    .line 28
    invoke-virtual {p0, p1, v0}, Lrx/c;->buffer(Lrx/c;I)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final buffer(Lrx/c;I)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<B:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TB;>;I)",
            "Lrx/c<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    .line 29
    new-instance v0, Ll/x260;

    invoke-direct {v0, p1, p2}, Ll/x260;-><init>(Lrx/c;I)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final buffer(Lrx/c;Ll/qcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TOpening:",
            "Ljava/lang/Object;",
            "TClosing:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TTOpening;>;",
            "Ll/qcj<",
            "-TTOpening;+",
            "Lrx/c<",
            "+TTClosing;>;>;)",
            "Lrx/c<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    .line 27
    new-instance v0, Ll/y260;

    invoke-direct {v0, p1, p2}, Ll/y260;-><init>(Lrx/c;Ll/qcj;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final cache()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Lrx/internal/operators/CachedObservable;->a(Lrx/c;)Lrx/internal/operators/CachedObservable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final cache(I)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 6
    invoke-virtual {p0, p1}, Lrx/c;->cacheWithInitialCapacity(I)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final cacheWithInitialCapacity(I)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, Lrx/internal/operators/CachedObservable;->b(Lrx/c;I)Lrx/internal/operators/CachedObservable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final cast(Ljava/lang/Class;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/a360;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/a360;-><init>(Ljava/lang/Class;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final collect(Ll/pcj;Ll/z20;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/pcj<",
            "TR;>;",
            "Ll/z20<",
            "TR;-TT;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/xn50;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/xn50;-><init>(Lrx/c;Ll/pcj;Ll/z20;)V

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

.method public compose(Lrx/c$d;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c$d<",
            "-TT;+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    invoke-interface {p1, p0}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lrx/c;

    .line 6
    .line 7
    return-object p0
.end method

.method public final concatMap(Ll/qcj;)Lrx/c;
    .locals 3
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
    instance-of v0, p0, Lrx/internal/util/ScalarSynchronousObservable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lrx/internal/util/ScalarSynchronousObservable;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lrx/internal/util/ScalarSynchronousObservable;->d(Ll/qcj;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance v0, Ll/yn50;

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-direct {v0, p0, p1, v1, v2}, Ll/yn50;-><init>(Lrx/c;Ll/qcj;II)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public final concatMapDelayError(Ll/qcj;)Lrx/c;
    .locals 2
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
    instance-of v0, p0, Lrx/internal/util/ScalarSynchronousObservable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lrx/internal/util/ScalarSynchronousObservable;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lrx/internal/util/ScalarSynchronousObservable;->d(Ll/qcj;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance v0, Ll/yn50;

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    invoke-direct {v0, p0, p1, v1, v1}, Ll/yn50;-><init>(Lrx/c;Ll/qcj;II)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public final concatMapEager(Ll/qcj;)Lrx/c;
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

    .line 32
    sget v0, Ll/urd0;->g:I

    invoke-virtual {p0, p1, v0}, Lrx/c;->concatMapEager(Ll/qcj;I)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final concatMapEager(Ll/qcj;I)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-TT;+",
            "Lrx/c<",
            "+TR;>;>;I)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    const/4 v0, 0x1

    if-lt p2, v0, :cond_0

    .line 30
    new-instance v0, Lrx/internal/operators/OperatorEagerConcatMap;

    const v1, 0x7fffffff

    invoke-direct {v0, p1, p2, v1}, Lrx/internal/operators/OperatorEagerConcatMap;-><init>(Ll/qcj;II)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0

    .line 31
    :cond_0
    const-string p0, "capacityHint > 0 required but it was "

    invoke-static {p0, p2}, Ll/za50;->a(Ljava/lang/String;I)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final concatMapEager(Ll/qcj;II)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-TT;+",
            "Lrx/c<",
            "+TR;>;>;II)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    if-lt p2, v0, :cond_1

    .line 3
    .line 4
    if-lt p3, v0, :cond_0

    .line 5
    .line 6
    new-instance v0, Lrx/internal/operators/OperatorEagerConcatMap;

    .line 7
    .line 8
    invoke-direct {v0, p1, p2, p3}, Lrx/internal/operators/OperatorEagerConcatMap;-><init>(Ll/qcj;II)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const-string p0, "maxConcurrent > 0 required but it was "

    .line 17
    .line 18
    invoke-static {p0, p2}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    return-object p0

    .line 23
    :cond_1
    const-string p0, "capacityHint > 0 required but it was "

    .line 24
    .line 25
    invoke-static {p0, p2}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    return-object p0
.end method

.method public final concatMapIterable(Ll/qcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-TT;+",
            "Ljava/lang/Iterable<",
            "+TR;>;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    sget v0, Ll/urd0;->g:I

    .line 2
    .line 3
    invoke-static {p0, p1, v0}, Lrx/internal/operators/a;->b(Lrx/c;Ll/qcj;I)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final concatWith(Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, Lrx/c;->concat(Lrx/c;Lrx/c;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final contains(Ljava/lang/Object;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lrx/internal/util/InternalObservableUtils;->equalsWith(Ljava/lang/Object;)Ll/qcj;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lrx/c;->exists(Ll/qcj;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final count()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    sget-object v1, Lrx/internal/util/InternalObservableUtils;->COUNTER:Lrx/internal/util/InternalObservableUtils$h;

    .line 7
    .line 8
    invoke-virtual {p0, v0, v1}, Lrx/c;->reduce(Ljava/lang/Object;Ll/rcj;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final countLong()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lrx/internal/util/InternalObservableUtils;->LONG_COUNTER:Lrx/internal/util/InternalObservableUtils$i;

    .line 8
    .line 9
    invoke-virtual {p0, v0, v1}, Lrx/c;->reduce(Ljava/lang/Object;Ll/rcj;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final debounce(JLjava/util/concurrent/TimeUnit;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 11
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lrx/c;->debounce(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final debounce(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 12
    new-instance v0, Ll/f360;

    invoke-direct {v0, p1, p2, p3, p4}, Ll/f360;-><init>(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final debounce(Ll/qcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-TT;+",
            "Lrx/c<",
            "TU;>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/e360;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/e360;-><init>(Ll/qcj;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final defaultIfEmpty(Ljava/lang/Object;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lrx/c;->switchIfEmpty(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final delay(JLjava/util/concurrent/TimeUnit;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 16
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lrx/c;->delay(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final delay(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 17
    new-instance v0, Ll/g360;

    invoke-direct {v0, p1, p2, p3, p4}, Ll/g360;-><init>(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final delay(Ll/pcj;Ll/qcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/pcj<",
            "+",
            "Lrx/c<",
            "TU;>;>;",
            "Ll/qcj<",
            "-TT;+",
            "Lrx/c<",
            "TV;>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lrx/c;->delaySubscription(Ll/pcj;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/h360;

    .line 6
    .line 7
    invoke-direct {v0, p0, p2}, Ll/h360;-><init>(Lrx/c;Ll/qcj;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public final delay(Ll/qcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-TT;+",
            "Lrx/c<",
            "TU;>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 15
    new-instance v0, Ll/h360;

    invoke-direct {v0, p0, p1}, Ll/h360;-><init>(Lrx/c;Ll/qcj;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final delaySubscription(JLjava/util/concurrent/TimeUnit;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 15
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lrx/c;->delaySubscription(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final delaySubscription(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/ao50;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-wide v2, p1

    .line 5
    move-object v4, p3

    .line 6
    move-object v5, p4

    .line 7
    invoke-direct/range {v0 .. v5}, Ll/ao50;-><init>(Lrx/c;JLjava/util/concurrent/TimeUnit;Ll/f2e0;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public final delaySubscription(Ll/pcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/pcj<",
            "+",
            "Lrx/c<",
            "TU;>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 16
    new-instance v0, Ll/co50;

    invoke-direct {v0, p0, p1}, Ll/co50;-><init>(Lrx/c;Ll/pcj;)V

    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final delaySubscription(Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TU;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 17
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    new-instance v0, Ll/bo50;

    invoke-direct {v0, p0, p1}, Ll/bo50;-><init>(Lrx/c;Lrx/c;)V

    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final dematerialize()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T2:",
            "Ljava/lang/Object;",
            ">()",
            "Lrx/c<",
            "TT2;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/i360;->b()Ll/i360;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final distinct()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 11
    invoke-static {}, Ll/j360;->b()Ll/j360;

    move-result-object v0

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final distinct(Ll/qcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-TT;+TU;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/j360;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/j360;-><init>(Ll/qcj;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final distinctUntilChanged()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 11
    invoke-static {}, Ll/k360;->c()Ll/k360;

    move-result-object v0

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final distinctUntilChanged(Ll/qcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-TT;+TU;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/k360;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/k360;-><init>(Ll/qcj;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final distinctUntilChanged(Ll/rcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/rcj<",
            "-TT;-TT;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 12
    new-instance v0, Ll/k360;

    invoke-direct {v0, p1}, Ll/k360;-><init>(Ll/rcj;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final doAfterTerminate(Ll/x20;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/x20;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/l360;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/l360;-><init>(Ll/x20;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final doOnCompleted(Ll/x20;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/x20;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/c40;->a()Ll/c40$b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/c40;->a()Ll/c40$b;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    new-instance v2, Ll/y30;

    .line 10
    .line 11
    invoke-direct {v2, v0, v1, p1}, Ll/y30;-><init>(Ll/y20;Ll/y20;Ll/x20;)V

    .line 12
    .line 13
    .line 14
    new-instance p1, Ll/m360;

    .line 15
    .line 16
    invoke-direct {p1, v2}, Ll/m360;-><init>(Ll/bb50;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public final doOnEach(Ll/bb50;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bb50<",
            "-TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 16
    new-instance v0, Ll/m360;

    invoke-direct {v0, p1}, Ll/m360;-><init>(Ll/bb50;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final doOnEach(Ll/y20;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lrx/Notification<",
            "-TT;>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/p30;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/p30;-><init>(Ll/y20;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ll/m360;

    .line 7
    .line 8
    invoke-direct {p1, v0}, Ll/m360;-><init>(Ll/bb50;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final doOnError(Ll/y20;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/c40;->a()Ll/c40$b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/c40;->a()Ll/c40$b;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    new-instance v2, Ll/y30;

    .line 10
    .line 11
    invoke-direct {v2, v0, p1, v1}, Ll/y30;-><init>(Ll/y20;Ll/y20;Ll/x20;)V

    .line 12
    .line 13
    .line 14
    new-instance p1, Ll/m360;

    .line 15
    .line 16
    invoke-direct {p1, v2}, Ll/m360;-><init>(Ll/bb50;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public final doOnNext(Ll/y20;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "-TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/c40;->a()Ll/c40$b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/c40;->a()Ll/c40$b;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    new-instance v2, Ll/y30;

    .line 10
    .line 11
    invoke-direct {v2, p1, v0, v1}, Ll/y30;-><init>(Ll/y20;Ll/y20;Ll/x20;)V

    .line 12
    .line 13
    .line 14
    new-instance p1, Ll/m360;

    .line 15
    .line 16
    invoke-direct {p1, v2}, Ll/m360;-><init>(Ll/bb50;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public final doOnRequest(Ll/y20;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Long;",
            ">;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/n360;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/n360;-><init>(Ll/y20;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final doOnSubscribe(Ll/x20;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/x20;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/o360;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/o360;-><init>(Ll/x20;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final doOnTerminate(Ll/x20;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/x20;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/c40;->a()Ll/c40$b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1}, Ll/c40;->b(Ll/x20;)Ll/y20;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    new-instance v2, Ll/y30;

    .line 10
    .line 11
    invoke-direct {v2, v0, v1, p1}, Ll/y30;-><init>(Ll/y20;Ll/y20;Ll/x20;)V

    .line 12
    .line 13
    .line 14
    new-instance p1, Ll/m360;

    .line 15
    .line 16
    invoke-direct {p1, v2}, Ll/m360;-><init>(Ll/bb50;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public final doOnUnsubscribe(Ll/x20;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/x20;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/p360;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/p360;-><init>(Ll/x20;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final elementAt(I)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/internal/operators/OperatorElementAt;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorElementAt;-><init>(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final elementAtOrDefault(ILjava/lang/Object;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/internal/operators/OperatorElementAt;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Lrx/internal/operators/OperatorElementAt;-><init>(ILjava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final exists(Ll/qcj;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "-TT;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/v260;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p1, v1}, Ll/v260;-><init>(Ll/qcj;Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public extend(Ll/qcj;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-",
            "Lrx/c$a<",
            "TT;>;+TR;>;)TR;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/c$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lrx/c$b;-><init>(Lrx/c;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1, v0}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final filter(Ll/qcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "-TT;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/do50;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/do50;-><init>(Lrx/c;Ll/qcj;)V

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

.method public final finallyDo(Ll/x20;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/x20;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    new-instance v0, Ll/l360;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/l360;-><init>(Ll/x20;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final first()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lrx/c;->take(I)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    invoke-virtual {p0}, Lrx/c;->single()Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final first(Ll/qcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "-TT;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 11
    invoke-virtual {p0, p1}, Lrx/c;->takeFirst(Ll/qcj;)Lrx/c;

    move-result-object p0

    invoke-virtual {p0}, Lrx/c;->single()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final firstOrDefault(Ljava/lang/Object;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lrx/c;->take(I)Lrx/c;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    invoke-virtual {p0, p1}, Lrx/c;->singleOrDefault(Ljava/lang/Object;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final firstOrDefault(Ljava/lang/Object;Ll/qcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ll/qcj<",
            "-TT;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 11
    invoke-virtual {p0, p2}, Lrx/c;->takeFirst(Ll/qcj;)Lrx/c;

    move-result-object p0

    invoke-virtual {p0, p1}, Lrx/c;->singleOrDefault(Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final flatMap(Ll/qcj;)Lrx/c;
    .locals 2
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
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-class v1, Lrx/internal/util/ScalarSynchronousObservable;

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    check-cast p0, Lrx/internal/util/ScalarSynchronousObservable;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lrx/internal/util/ScalarSynchronousObservable;->d(Ll/qcj;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0}, Lrx/c;->merge(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public final flatMap(Ll/qcj;I)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-TT;+",
            "Lrx/c<",
            "+TR;>;>;I)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 25
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lrx/internal/util/ScalarSynchronousObservable;

    if-ne v0, v1, :cond_0

    .line 26
    check-cast p0, Lrx/internal/util/ScalarSynchronousObservable;

    invoke-virtual {p0, p1}, Lrx/internal/util/ScalarSynchronousObservable;->d(Ll/qcj;)Lrx/c;

    move-result-object p0

    return-object p0

    .line 27
    :cond_0
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    move-result-object p0

    invoke-static {p0, p2}, Lrx/c;->merge(Lrx/c;I)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final flatMap(Ll/qcj;Ll/qcj;Ll/pcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-TT;+",
            "Lrx/c<",
            "+TR;>;>;",
            "Ll/qcj<",
            "-",
            "Ljava/lang/Throwable;",
            "+",
            "Lrx/c<",
            "+TR;>;>;",
            "Ll/pcj<",
            "+",
            "Lrx/c<",
            "+TR;>;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 28
    invoke-direct {p0, p1, p2, p3}, Lrx/c;->mapNotification(Ll/qcj;Ll/qcj;Ll/pcj;)Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->merge(Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final flatMap(Ll/qcj;Ll/qcj;Ll/pcj;I)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-TT;+",
            "Lrx/c<",
            "+TR;>;>;",
            "Ll/qcj<",
            "-",
            "Ljava/lang/Throwable;",
            "+",
            "Lrx/c<",
            "+TR;>;>;",
            "Ll/pcj<",
            "+",
            "Lrx/c<",
            "+TR;>;>;I)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 29
    invoke-direct {p0, p1, p2, p3}, Lrx/c;->mapNotification(Ll/qcj;Ll/qcj;Ll/pcj;)Lrx/c;

    move-result-object p0

    invoke-static {p0, p4}, Lrx/c;->merge(Lrx/c;I)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final flatMap(Ll/qcj;Ll/rcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-TT;+",
            "Lrx/c<",
            "+TU;>;>;",
            "Ll/rcj<",
            "-TT;-TU;+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 30
    new-instance v0, Ll/s360;

    invoke-direct {v0, p1, p2}, Ll/s360;-><init>(Ll/qcj;Ll/rcj;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    invoke-static {p0}, Lrx/c;->merge(Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final flatMap(Ll/qcj;Ll/rcj;I)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-TT;+",
            "Lrx/c<",
            "+TU;>;>;",
            "Ll/rcj<",
            "-TT;-TU;+TR;>;I)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 31
    new-instance v0, Ll/s360;

    invoke-direct {v0, p1, p2}, Ll/s360;-><init>(Ll/qcj;Ll/rcj;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    invoke-static {p0, p3}, Lrx/c;->merge(Lrx/c;I)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final flatMapIterable(Ll/qcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-TT;+",
            "Ljava/lang/Iterable<",
            "+TR;>;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 11
    sget v0, Ll/urd0;->g:I

    invoke-virtual {p0, p1, v0}, Lrx/c;->flatMapIterable(Ll/qcj;I)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final flatMapIterable(Ll/qcj;I)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-TT;+",
            "Ljava/lang/Iterable<",
            "+TR;>;>;I)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 10
    invoke-static {p0, p1, p2}, Lrx/internal/operators/a;->b(Lrx/c;Ll/qcj;I)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final flatMapIterable(Ll/qcj;Ll/rcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-TT;+",
            "Ljava/lang/Iterable<",
            "+TU;>;>;",
            "Ll/rcj<",
            "-TT;-TU;+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/s360;->b(Ll/qcj;)Ll/qcj;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1, p2}, Lrx/c;->flatMap(Ll/qcj;Ll/rcj;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final flatMapIterable(Ll/qcj;Ll/rcj;I)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-TT;+",
            "Ljava/lang/Iterable<",
            "+TU;>;>;",
            "Ll/rcj<",
            "-TT;-TU;+TR;>;I)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 12
    invoke-static {p1}, Ll/s360;->b(Ll/qcj;)Ll/qcj;

    move-result-object p1

    invoke-virtual {p0, p1, p2, p3}, Lrx/c;->flatMap(Ll/qcj;Ll/rcj;I)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final forEach(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "-TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final forEach(Ll/y20;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "-TT;>;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .line 5
    invoke-virtual {p0, p1, p2}, Lrx/c;->subscribe(Ll/y20;Ll/y20;)Ll/kcg0;

    return-void
.end method

.method public final forEach(Ll/y20;Ll/y20;Ll/x20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "-TT;>;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 6
    invoke-virtual {p0, p1, p2, p3}, Lrx/c;->subscribe(Ll/y20;Ll/y20;Ll/x20;)Ll/kcg0;

    return-void
.end method

.method public final groupBy(Ll/qcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-TT;+TK;>;)",
            "Lrx/c<",
            "Ll/oqk<",
            "TK;TT;>;>;"
        }
    .end annotation

    .line 21
    new-instance v0, Lrx/internal/operators/OperatorGroupBy;

    invoke-direct {v0, p1}, Lrx/internal/operators/OperatorGroupBy;-><init>(Ll/qcj;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final groupBy(Ll/qcj;Ll/qcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-TT;+TK;>;",
            "Ll/qcj<",
            "-TT;+TR;>;)",
            "Lrx/c<",
            "Ll/oqk<",
            "TK;TR;>;>;"
        }
    .end annotation

    .line 20
    new-instance v0, Lrx/internal/operators/OperatorGroupBy;

    invoke-direct {v0, p1, p2}, Lrx/internal/operators/OperatorGroupBy;-><init>(Ll/qcj;Ll/qcj;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final groupBy(Ll/qcj;Ll/qcj;Ll/qcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-TT;+TK;>;",
            "Ll/qcj<",
            "-TT;+TR;>;",
            "Ll/qcj<",
            "Ll/y20<",
            "TK;>;",
            "Ljava/util/Map<",
            "TK;",
            "Ljava/lang/Object;",
            ">;>;)",
            "Lrx/c<",
            "Ll/oqk<",
            "TK;TR;>;>;"
        }
    .end annotation

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    new-instance v0, Lrx/internal/operators/OperatorGroupBy;

    .line 4
    .line 5
    invoke-direct {v0, p1, p2, p3}, Lrx/internal/operators/OperatorGroupBy;-><init>(Ll/qcj;Ll/qcj;Ll/qcj;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_0
    const-string p0, "evictingMapFactory cannot be null"

    .line 14
    .line 15
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public final groupJoin(Lrx/c;Ll/qcj;Ll/qcj;Ll/rcj;)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T2:",
            "Ljava/lang/Object;",
            "D1:",
            "Ljava/lang/Object;",
            "D2:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT2;>;",
            "Ll/qcj<",
            "-TT;+",
            "Lrx/c<",
            "TD1;>;>;",
            "Ll/qcj<",
            "-TT2;+",
            "Lrx/c<",
            "TD2;>;>;",
            "Ll/rcj<",
            "-TT;-",
            "Lrx/c<",
            "TT2;>;+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/fo50;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move-object v3, p2

    .line 6
    move-object v4, p3

    .line 7
    move-object v5, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Ll/fo50;-><init>(Lrx/c;Lrx/c;Ll/qcj;Ll/qcj;Ll/rcj;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final ignoreElements()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/q360;->b()Ll/q360;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final isEmpty()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lrx/internal/util/InternalObservableUtils;->IS_EMPTY:Lrx/c$c;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final join(Lrx/c;Ll/qcj;Ll/qcj;Ll/rcj;)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TRight:",
            "Ljava/lang/Object;",
            "T",
            "LeftDuration:Ljava/lang/Object;",
            "TRightDuration:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TTRight;>;",
            "Ll/qcj<",
            "TT;",
            "Lrx/c<",
            "TT",
            "LeftDuration;",
            ">;>;",
            "Ll/qcj<",
            "TTRight;",
            "Lrx/c<",
            "TTRightDuration;>;>;",
            "Ll/rcj<",
            "TT;TTRight;TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/go50;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move-object v3, p2

    .line 6
    move-object v4, p3

    .line 7
    move-object v5, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Ll/go50;-><init>(Lrx/c;Lrx/c;Ll/qcj;Ll/qcj;Ll/rcj;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final last()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 15
    invoke-virtual {p0, v0}, Lrx/c;->takeLast(I)Lrx/c;

    move-result-object p0

    invoke-virtual {p0}, Lrx/c;->single()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final last(Ll/qcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "-TT;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-virtual {p0, p1}, Lrx/c;->takeLast(I)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Lrx/c;->single()Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public final lastOrDefault(Ljava/lang/Object;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 15
    invoke-virtual {p0, v0}, Lrx/c;->takeLast(I)Lrx/c;

    move-result-object p0

    invoke-virtual {p0, p1}, Lrx/c;->singleOrDefault(Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final lastOrDefault(Ljava/lang/Object;Ll/qcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ll/qcj<",
            "-TT;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p2, 0x1

    .line 6
    invoke-virtual {p0, p2}, Lrx/c;->takeLast(I)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0, p1}, Lrx/c;->singleOrDefault(Ljava/lang/Object;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public final lift(Lrx/c$c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c$c<",
            "+TR;-TT;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/ho50;

    .line 2
    .line 3
    iget-object p0, p0, Lrx/c;->onSubscribe:Lrx/c$a;

    .line 4
    .line 5
    invoke-direct {v0, p0, p1}, Ll/ho50;-><init>(Lrx/c$a;Lrx/c$c;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final limit(I)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lrx/c;->take(I)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final map(Ll/qcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-TT;+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/io50;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/io50;-><init>(Lrx/c;Ll/qcj;)V

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

.method public final materialize()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lrx/Notification<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/t360;->b()Ll/t360;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final mergeWith(Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, Lrx/c;->merge(Lrx/c;Lrx/c;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final nest()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lrx/c<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final observeOn(Ll/f2e0;)Lrx/c;
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

    .line 24
    sget v0, Ll/urd0;->g:I

    invoke-virtual {p0, p1, v0}, Lrx/c;->observeOn(Ll/f2e0;I)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final observeOn(Ll/f2e0;I)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/f2e0;",
            "I)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 22
    invoke-virtual {p0, p1, v0, p2}, Lrx/c;->observeOn(Ll/f2e0;ZI)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final observeOn(Ll/f2e0;Z)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/f2e0;",
            "Z)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 23
    sget v0, Ll/urd0;->g:I

    invoke-virtual {p0, p1, p2, v0}, Lrx/c;->observeOn(Ll/f2e0;ZI)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final observeOn(Ll/f2e0;ZI)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/f2e0;",
            "ZI)",
            "Lrx/c<",
            "TT;>;"
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
    invoke-virtual {p0, p1}, Lrx/internal/util/ScalarSynchronousObservable;->e(Ll/f2e0;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance v0, Ll/u360;

    .line 13
    .line 14
    invoke-direct {v0, p1, p2, p3}, Ll/u360;-><init>(Ll/f2e0;ZI)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public final ofType(Ljava/lang/Class;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lrx/internal/util/InternalObservableUtils;->isInstanceOf(Ljava/lang/Class;)Ll/qcj;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0, p1}, Lrx/c;->cast(Ljava/lang/Class;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final onBackpressureBuffer()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 11
    invoke-static {}, Ll/v360;->b()Ll/v360;

    move-result-object v0

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final onBackpressureBuffer(J)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/v360;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Ll/v360;-><init>(J)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final onBackpressureBuffer(JLl/x20;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ll/x20;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 12
    new-instance v0, Ll/v360;

    invoke-direct {v0, p1, p2, p3}, Ll/v360;-><init>(JLl/x20;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final onBackpressureBuffer(JLl/x20;Lrx/a$d;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ll/x20;",
            "Lrx/a$d;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 13
    new-instance v0, Ll/v360;

    invoke-direct {v0, p1, p2, p3, p4}, Ll/v360;-><init>(JLl/x20;Lrx/a$d;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final onBackpressureDrop()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 11
    invoke-static {}, Ll/w360;->b()Ll/w360;

    move-result-object v0

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final onBackpressureDrop(Ll/y20;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "-TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/w360;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/w360;-><init>(Ll/y20;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final onBackpressureLatest()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lrx/internal/operators/OperatorOnBackpressureLatest;->b()Lrx/internal/operators/OperatorOnBackpressureLatest;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final onErrorResumeNext(Ll/qcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "Ljava/lang/Throwable;",
            "+",
            "Lrx/c<",
            "+TT;>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/x360;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/x360;-><init>(Ll/qcj;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final onErrorResumeNext(Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 11
    invoke-static {p1}, Ll/x360;->c(Lrx/c;)Ll/x360;

    move-result-object p1

    invoke-virtual {p0, p1}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final onErrorReturn(Ll/qcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "Ljava/lang/Throwable;",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/x360;->d(Ll/qcj;)Ll/x360;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final onExceptionResumeNext(Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/x360;->b(Lrx/c;)Ll/x360;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final onTerminateDetach()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/internal/operators/OnSubscribeDetach;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lrx/internal/operators/OnSubscribeDetach;-><init>(Lrx/c;)V

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

.method public final publish()Ll/ax5;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ax5<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Lrx/internal/operators/OperatorPublish;->e(Lrx/c;)Ll/ax5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final publish(Ll/qcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-",
            "Lrx/c<",
            "TT;>;+",
            "Lrx/c<",
            "TR;>;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 6
    invoke-static {p0, p1}, Lrx/internal/operators/OperatorPublish;->f(Lrx/c;Ll/qcj;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final rebatchRequests(I)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    invoke-static {p1}, Ll/u360;->b(I)Lrx/c$c;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string p0, "n > 0 required but it was "

    .line 13
    .line 14
    invoke-static {p0, p1}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method

.method public final reduce(Ljava/lang/Object;Ll/rcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(TR;",
            "Ll/rcj<",
            "TR;-TT;TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 11
    new-instance v0, Ll/lo50;

    invoke-direct {v0, p0, p1, p2}, Ll/lo50;-><init>(Lrx/c;Ljava/lang/Object;Ll/rcj;)V

    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final reduce(Ll/rcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/rcj<",
            "TT;TT;TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/ko50;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/ko50;-><init>(Lrx/c;Ll/rcj;)V

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

.method public final repeat()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/jo50;->b(Lrx/c;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final repeat(J)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 7
    invoke-static {p0, p1, p2}, Ll/jo50;->c(Lrx/c;J)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final repeat(JLl/f2e0;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 8
    invoke-static {p0, p1, p2, p3}, Ll/jo50;->d(Lrx/c;JLl/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final repeat(Ll/f2e0;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 6
    invoke-static {p0, p1}, Ll/jo50;->g(Lrx/c;Ll/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final repeatWhen(Ll/qcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "-",
            "Lrx/c<",
            "+",
            "Ljava/lang/Void;",
            ">;+",
            "Lrx/c<",
            "*>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 10
    invoke-static {p1}, Lrx/internal/util/InternalObservableUtils;->createRepeatDematerializer(Ll/qcj;)Ll/qcj;

    move-result-object p1

    invoke-static {p0, p1}, Ll/jo50;->e(Lrx/c;Ll/qcj;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final repeatWhen(Ll/qcj;Ll/f2e0;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "-",
            "Lrx/c<",
            "+",
            "Ljava/lang/Void;",
            ">;+",
            "Lrx/c<",
            "*>;>;",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lrx/internal/util/InternalObservableUtils;->createRepeatDematerializer(Ll/qcj;)Ll/qcj;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p0, p1, p2}, Ll/jo50;->f(Lrx/c;Ll/qcj;Ll/f2e0;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final replay()Ll/ax5;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ax5<",
            "TT;>;"
        }
    .end annotation

    .line 27
    invoke-static {p0}, Lrx/internal/operators/OperatorReplay;->e(Lrx/c;)Ll/ax5;

    move-result-object p0

    return-object p0
.end method

.method public final replay(I)Ll/ax5;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ll/ax5<",
            "TT;>;"
        }
    .end annotation

    .line 32
    invoke-static {p0, p1}, Lrx/internal/operators/OperatorReplay;->f(Lrx/c;I)Ll/ax5;

    move-result-object p0

    return-object p0
.end method

.method public final replay(IJLjava/util/concurrent/TimeUnit;)Ll/ax5;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IJ",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Ll/ax5<",
            "TT;>;"
        }
    .end annotation

    .line 33
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    move-result-object v5

    move-object v0, p0

    move v1, p1

    move-wide v2, p2

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lrx/c;->replay(IJLjava/util/concurrent/TimeUnit;Ll/f2e0;)Ll/ax5;

    move-result-object p0

    return-object p0
.end method

.method public final replay(IJLjava/util/concurrent/TimeUnit;Ll/f2e0;)Ll/ax5;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Ll/f2e0;",
            ")",
            "Ll/ax5<",
            "TT;>;"
        }
    .end annotation

    if-ltz p1, :cond_0

    move-object v0, p5

    move p5, p1

    move-wide p1, p2

    move-object p3, p4

    move-object p4, v0

    .line 34
    invoke-static/range {p0 .. p5}, Lrx/internal/operators/OperatorReplay;->h(Lrx/c;JLjava/util/concurrent/TimeUnit;Ll/f2e0;I)Ll/ax5;

    move-result-object p0

    return-object p0

    .line 35
    :cond_0
    const-string p0, "bufferSize < 0"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final replay(ILl/f2e0;)Ll/ax5;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ll/f2e0;",
            ")",
            "Ll/ax5<",
            "TT;>;"
        }
    .end annotation

    .line 36
    invoke-virtual {p0, p1}, Lrx/c;->replay(I)Ll/ax5;

    move-result-object p0

    invoke-static {p0, p2}, Lrx/internal/operators/OperatorReplay;->k(Ll/ax5;Ll/f2e0;)Ll/ax5;

    move-result-object p0

    return-object p0
.end method

.method public final replay(JLjava/util/concurrent/TimeUnit;)Ll/ax5;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Ll/ax5<",
            "TT;>;"
        }
    .end annotation

    .line 37
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lrx/c;->replay(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Ll/ax5;

    move-result-object p0

    return-object p0
.end method

.method public final replay(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Ll/ax5;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Ll/f2e0;",
            ")",
            "Ll/ax5<",
            "TT;>;"
        }
    .end annotation

    .line 38
    invoke-static {p0, p1, p2, p3, p4}, Lrx/internal/operators/OperatorReplay;->g(Lrx/c;JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Ll/ax5;

    move-result-object p0

    return-object p0
.end method

.method public final replay(Ll/f2e0;)Ll/ax5;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/f2e0;",
            ")",
            "Ll/ax5<",
            "TT;>;"
        }
    .end annotation

    .line 39
    invoke-virtual {p0}, Lrx/c;->replay()Ll/ax5;

    move-result-object p0

    invoke-static {p0, p1}, Lrx/internal/operators/OperatorReplay;->k(Ll/ax5;Ll/f2e0;)Ll/ax5;

    move-result-object p0

    return-object p0
.end method

.method public final replay(Ll/qcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-",
            "Lrx/c<",
            "TT;>;+",
            "Lrx/c<",
            "TR;>;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 24
    invoke-static {p0}, Lrx/internal/util/InternalObservableUtils;->createReplaySupplier(Lrx/c;)Ll/pcj;

    move-result-object p0

    invoke-static {p0, p1}, Lrx/internal/operators/OperatorReplay;->j(Ll/pcj;Ll/qcj;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final replay(Ll/qcj;I)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-",
            "Lrx/c<",
            "TT;>;+",
            "Lrx/c<",
            "TR;>;>;I)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 25
    invoke-static {p0, p2}, Lrx/internal/util/InternalObservableUtils;->createReplaySupplier(Lrx/c;I)Ll/pcj;

    move-result-object p0

    invoke-static {p0, p1}, Lrx/internal/operators/OperatorReplay;->j(Ll/pcj;Ll/qcj;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final replay(Ll/qcj;IJLjava/util/concurrent/TimeUnit;)Lrx/c;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-",
            "Lrx/c<",
            "TT;>;+",
            "Lrx/c<",
            "TR;>;>;IJ",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 26
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    move-result-object v6

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-wide v3, p3

    move-object v5, p5

    invoke-virtual/range {v0 .. v6}, Lrx/c;->replay(Ll/qcj;IJLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final replay(Ll/qcj;IJLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-",
            "Lrx/c<",
            "TT;>;+",
            "Lrx/c<",
            "TR;>;>;IJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    if-ltz p2, :cond_0

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move v1, p2

    .line 5
    move-wide v2, p3

    .line 6
    move-object v4, p5

    .line 7
    move-object v5, p6

    .line 8
    invoke-static/range {v0 .. v5}, Lrx/internal/util/InternalObservableUtils;->createReplaySupplier(Lrx/c;IJLjava/util/concurrent/TimeUnit;Ll/f2e0;)Ll/pcj;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0, p1}, Lrx/internal/operators/OperatorReplay;->j(Ll/pcj;Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_0
    const-string p0, "bufferSize < 0"

    .line 18
    .line 19
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method public final replay(Ll/qcj;ILl/f2e0;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-",
            "Lrx/c<",
            "TT;>;+",
            "Lrx/c<",
            "TR;>;>;I",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 28
    invoke-static {p0, p2}, Lrx/internal/util/InternalObservableUtils;->createReplaySupplier(Lrx/c;I)Ll/pcj;

    move-result-object p0

    invoke-static {p1, p3}, Lrx/internal/util/InternalObservableUtils;->createReplaySelectorAndObserveOn(Ll/qcj;Ll/f2e0;)Ll/qcj;

    move-result-object p1

    invoke-static {p0, p1}, Lrx/internal/operators/OperatorReplay;->j(Ll/pcj;Ll/qcj;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final replay(Ll/qcj;JLjava/util/concurrent/TimeUnit;)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-",
            "Lrx/c<",
            "TT;>;+",
            "Lrx/c<",
            "TR;>;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 29
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lrx/c;->replay(Ll/qcj;JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final replay(Ll/qcj;JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-",
            "Lrx/c<",
            "TT;>;+",
            "Lrx/c<",
            "TR;>;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 30
    invoke-static {p0, p2, p3, p4, p5}, Lrx/internal/util/InternalObservableUtils;->createReplaySupplier(Lrx/c;JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Ll/pcj;

    move-result-object p0

    invoke-static {p0, p1}, Lrx/internal/operators/OperatorReplay;->j(Ll/pcj;Ll/qcj;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final replay(Ll/qcj;Ll/f2e0;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-",
            "Lrx/c<",
            "TT;>;+",
            "Lrx/c<",
            "TR;>;>;",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 31
    invoke-static {p0}, Lrx/internal/util/InternalObservableUtils;->createReplaySupplier(Lrx/c;)Ll/pcj;

    move-result-object p0

    invoke-static {p1, p2}, Lrx/internal/util/InternalObservableUtils;->createReplaySelectorAndObserveOn(Ll/qcj;Ll/f2e0;)Ll/qcj;

    move-result-object p1

    invoke-static {p0, p1}, Lrx/internal/operators/OperatorReplay;->j(Ll/pcj;Ll/qcj;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final retry()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 16
    invoke-static {p0}, Ll/jo50;->h(Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final retry(J)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 15
    invoke-static {p0, p1, p2}, Ll/jo50;->i(Lrx/c;J)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final retry(Ll/rcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/rcj<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Throwable;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lrx/c;->nest()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/y360;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/y360;-><init>(Ll/rcj;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public final retryWhen(Ll/qcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "-",
            "Lrx/c<",
            "+",
            "Ljava/lang/Throwable;",
            ">;+",
            "Lrx/c<",
            "*>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lrx/internal/util/InternalObservableUtils;->createRetryDematerializer(Ll/qcj;)Ll/qcj;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p0, p1}, Ll/jo50;->j(Lrx/c;Ll/qcj;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final retryWhen(Ll/qcj;Ll/f2e0;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "-",
            "Lrx/c<",
            "+",
            "Ljava/lang/Throwable;",
            ">;+",
            "Lrx/c<",
            "*>;>;",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 10
    invoke-static {p1}, Lrx/internal/util/InternalObservableUtils;->createRetryDematerializer(Ll/qcj;)Ll/qcj;

    move-result-object p1

    invoke-static {p0, p1, p2}, Ll/jo50;->k(Lrx/c;Ll/qcj;Ll/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final sample(JLjava/util/concurrent/TimeUnit;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 11
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lrx/c;->sample(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final sample(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/a460;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p3, p4}, Ll/a460;-><init>(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final sample(Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TU;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 12
    new-instance v0, Ll/z360;

    invoke-direct {v0, p1}, Ll/z360;-><init>(Lrx/c;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final scan(Ljava/lang/Object;Ll/rcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(TR;",
            "Ll/rcj<",
            "TR;-TT;TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 11
    new-instance v0, Ll/b460;

    invoke-direct {v0, p1, p2}, Ll/b460;-><init>(Ljava/lang/Object;Ll/rcj;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final scan(Ll/rcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/rcj<",
            "TT;TT;TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/b460;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/b460;-><init>(Ll/rcj;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final serialize()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/d460;->b()Ll/d460;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final share()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lrx/c;->publish()Ll/ax5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/ax5;->d()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final single()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/e460;->b()Ll/e460;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final single(Ll/qcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "-TT;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 10
    invoke-virtual {p0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    move-result-object p0

    invoke-virtual {p0}, Lrx/c;->single()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final singleOrDefault(Ljava/lang/Object;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/e460;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/e460;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final singleOrDefault(Ljava/lang/Object;Ll/qcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ll/qcj<",
            "-TT;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 11
    invoke-virtual {p0, p2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    move-result-object p0

    invoke-virtual {p0, p1}, Lrx/c;->singleOrDefault(Ljava/lang/Object;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final skip(I)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/f460;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/f460;-><init>(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final skip(JLjava/util/concurrent/TimeUnit;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 11
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lrx/c;->skip(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final skip(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 12
    new-instance v0, Ll/i460;

    invoke-direct {v0, p1, p2, p3, p4}, Ll/i460;-><init>(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final skipLast(I)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/g460;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/g460;-><init>(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final skipLast(JLjava/util/concurrent/TimeUnit;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 11
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lrx/c;->skipLast(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final skipLast(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 12
    new-instance v0, Ll/h460;

    invoke-direct {v0, p1, p2, p3, p4}, Ll/h460;-><init>(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final skipUntil(Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TU;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/j460;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/j460;-><init>(Lrx/c;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final skipWhile(Ll/qcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "-TT;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/k460;

    .line 2
    .line 3
    invoke-static {p1}, Ll/k460;->b(Ll/qcj;)Ll/rcj;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {v0, p1}, Ll/k460;-><init>(Ll/rcj;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public final startWith(Ljava/lang/Iterable;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lrx/c;->from(Ljava/lang/Iterable;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1, p0}, Lrx/c;->concat(Lrx/c;Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final startWith(Ljava/lang/Object;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 11
    invoke-static {p1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    move-result-object p1

    invoke-static {p1, p0}, Lrx/c;->concat(Lrx/c;Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final startWith(Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 12
    invoke-static {p1, p2}, Lrx/c;->just(Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;

    move-result-object p1

    invoke-static {p1, p0}, Lrx/c;->concat(Lrx/c;Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final startWith(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;TT;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 13
    invoke-static {p1, p2, p3}, Lrx/c;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;

    move-result-object p1

    invoke-static {p1, p0}, Lrx/c;->concat(Lrx/c;Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final startWith(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;TT;TT;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 14
    invoke-static {p1, p2, p3, p4}, Lrx/c;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;

    move-result-object p1

    invoke-static {p1, p0}, Lrx/c;->concat(Lrx/c;Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final startWith(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;TT;TT;TT;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 15
    invoke-static {p1, p2, p3, p4, p5}, Lrx/c;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;

    move-result-object p1

    invoke-static {p1, p0}, Lrx/c;->concat(Lrx/c;Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final startWith(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;TT;TT;TT;TT;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 16
    invoke-static/range {p1 .. p6}, Lrx/c;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;

    move-result-object p1

    invoke-static {p1, p0}, Lrx/c;->concat(Lrx/c;Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final startWith(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;TT;TT;TT;TT;TT;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 17
    invoke-static/range {p1 .. p7}, Lrx/c;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;

    move-result-object p1

    invoke-static {p1, p0}, Lrx/c;->concat(Lrx/c;Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final startWith(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;TT;TT;TT;TT;TT;TT;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 18
    invoke-static/range {p1 .. p8}, Lrx/c;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;

    move-result-object p1

    invoke-static {p1, p0}, Lrx/c;->concat(Lrx/c;Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final startWith(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;TT;TT;TT;TT;TT;TT;TT;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 19
    invoke-static/range {p1 .. p9}, Lrx/c;->just(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Lrx/c;

    move-result-object p1

    invoke-static {p1, p0}, Lrx/c;->concat(Lrx/c;Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final startWith(Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 10
    invoke-static {p1, p0}, Lrx/c;->concat(Lrx/c;Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final subscribe()Ll/kcg0;
    .locals 4

    .line 130
    invoke-static {}, Ll/c40;->a()Ll/c40$b;

    move-result-object v0

    .line 131
    sget-object v1, Lrx/internal/util/InternalObservableUtils;->ERROR_NOT_IMPLEMENTED:Ll/y20;

    .line 132
    invoke-static {}, Ll/c40;->a()Ll/c40$b;

    move-result-object v2

    .line 133
    new-instance v3, Ll/y30;

    invoke-direct {v3, v0, v1, v2}, Ll/y30;-><init>(Ll/y20;Ll/y20;Ll/x20;)V

    invoke-virtual {p0, v3}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    move-result-object p0

    return-object p0
.end method

.method public final subscribe(Ll/bb50;)Ll/kcg0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bb50<",
            "-TT;>;)",
            "Ll/kcg0;"
        }
    .end annotation

    .line 125
    instance-of v0, p1, Ll/gcg0;

    if-eqz v0, :cond_0

    .line 126
    check-cast p1, Ll/gcg0;

    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    move-result-object p0

    return-object p0

    :cond_0
    if-eqz p1, :cond_1

    .line 127
    new-instance v0, Ll/db50;

    invoke-direct {v0, p1}, Ll/db50;-><init>(Ll/bb50;)V

    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    move-result-object p0

    return-object p0

    .line 128
    :cond_1
    const-string p0, "observer is null"

    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final subscribe(Ll/gcg0;)Ll/kcg0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TT;>;)",
            "Ll/kcg0;"
        }
    .end annotation

    .line 129
    invoke-static {p1, p0}, Lrx/c;->subscribe(Ll/gcg0;Lrx/c;)Ll/kcg0;

    move-result-object p0

    return-object p0
.end method

.method public final subscribe(Ll/y20;)Ll/kcg0;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "-TT;>;)",
            "Ll/kcg0;"
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 113
    sget-object v0, Lrx/internal/util/InternalObservableUtils;->ERROR_NOT_IMPLEMENTED:Ll/y20;

    .line 114
    invoke-static {}, Ll/c40;->a()Ll/c40$b;

    move-result-object v1

    .line 115
    new-instance v2, Ll/y30;

    invoke-direct {v2, p1, v0, v1}, Ll/y30;-><init>(Ll/y20;Ll/y20;Ll/x20;)V

    invoke-virtual {p0, v2}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    move-result-object p0

    return-object p0

    .line 116
    :cond_0
    const-string p0, "onNext can not be null"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final subscribe(Ll/y20;Ll/y20;)Ll/kcg0;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "-TT;>;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;)",
            "Ll/kcg0;"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    if-eqz p2, :cond_0

    .line 117
    invoke-static {}, Ll/c40;->a()Ll/c40$b;

    move-result-object v0

    .line 118
    new-instance v1, Ll/y30;

    invoke-direct {v1, p1, p2, v0}, Ll/y30;-><init>(Ll/y20;Ll/y20;Ll/x20;)V

    invoke-virtual {p0, v1}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    move-result-object p0

    return-object p0

    .line 119
    :cond_0
    const-string p0, "onError can not be null"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    return-object v0

    .line 120
    :cond_1
    const-string p0, "onNext can not be null"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    return-object v0
.end method

.method public final subscribe(Ll/y20;Ll/y20;Ll/x20;)Ll/kcg0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "-TT;>;",
            "Ll/y20<",
            "Ljava/lang/Throwable;",
            ">;",
            "Ll/x20;",
            ")",
            "Ll/kcg0;"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    if-eqz p2, :cond_1

    if-eqz p3, :cond_0

    .line 121
    new-instance v0, Ll/y30;

    invoke-direct {v0, p1, p2, p3}, Ll/y30;-><init>(Ll/y20;Ll/y20;Ll/x20;)V

    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    move-result-object p0

    return-object p0

    .line 122
    :cond_0
    const-string p0, "onComplete can not be null"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    return-object v0

    .line 123
    :cond_1
    const-string p0, "onError can not be null"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    return-object v0

    .line 124
    :cond_2
    const-string p0, "onNext can not be null"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    return-object v0
.end method

.method public final subscribeOn(Ll/f2e0;)Lrx/c;
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
    instance-of v0, p0, Lrx/internal/util/ScalarSynchronousObservable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lrx/internal/util/ScalarSynchronousObservable;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lrx/internal/util/ScalarSynchronousObservable;->e(Ll/f2e0;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance v0, Ll/l460;

    .line 13
    .line 14
    invoke-direct {v0, p0, p1}, Ll/l460;-><init>(Lrx/c;Ll/f2e0;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public final switchIfEmpty(Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/n460;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/n460;-><init>(Lrx/c;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final switchMap(Ll/qcj;)Lrx/c;
    .locals 0
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
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lrx/c;->switchOnNext(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final switchMapDelayError(Ll/qcj;)Lrx/c;
    .locals 0
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
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lrx/c;->switchOnNextDelayError(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final take(I)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/o460;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/o460;-><init>(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final take(JLjava/util/concurrent/TimeUnit;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 11
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lrx/c;->take(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final take(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 12
    new-instance v0, Ll/r460;

    invoke-direct {v0, p1, p2, p3, p4}, Ll/r460;-><init>(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final takeFirst(Ll/qcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "-TT;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-virtual {p0, p1}, Lrx/c;->take(I)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final takeLast(I)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->ignoreElements()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 v0, 0x1

    .line 9
    if-ne p1, v0, :cond_1

    .line 10
    .line 11
    new-instance p1, Ll/oo50;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Ll/oo50;-><init>(Lrx/c;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p1}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_1
    new-instance v0, Ll/p460;

    .line 22
    .line 23
    invoke-direct {v0, p1}, Ll/p460;-><init>(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public final takeLast(IJLjava/util/concurrent/TimeUnit;)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IJ",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 31
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    move-result-object v5

    move-object v0, p0

    move v1, p1

    move-wide v2, p2

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lrx/c;->takeLast(IJLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final takeLast(IJLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 32
    new-instance v0, Ll/q460;

    move v1, p1

    move-wide v2, p2

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Ll/q460;-><init>(IJLjava/util/concurrent/TimeUnit;Ll/f2e0;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final takeLast(JLjava/util/concurrent/TimeUnit;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 33
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lrx/c;->takeLast(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final takeLast(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 34
    new-instance v0, Ll/q460;

    invoke-direct {v0, p1, p2, p3, p4}, Ll/q460;-><init>(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final takeLastBuffer(I)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/c<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lrx/c;->takeLast(I)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lrx/c;->toList()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final takeLastBuffer(IJLjava/util/concurrent/TimeUnit;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IJ",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    .line 10
    invoke-virtual {p0, p1, p2, p3, p4}, Lrx/c;->takeLast(IJLjava/util/concurrent/TimeUnit;)Lrx/c;

    move-result-object p0

    invoke-virtual {p0}, Lrx/c;->toList()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final takeLastBuffer(IJLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    .line 11
    invoke-virtual/range {p0 .. p5}, Lrx/c;->takeLast(IJLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;

    move-result-object p0

    invoke-virtual {p0}, Lrx/c;->toList()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final takeLastBuffer(JLjava/util/concurrent/TimeUnit;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    .line 12
    invoke-virtual {p0, p1, p2, p3}, Lrx/c;->takeLast(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    move-result-object p0

    invoke-virtual {p0}, Lrx/c;->toList()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final takeLastBuffer(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    .line 13
    invoke-virtual {p0, p1, p2, p3, p4}, Lrx/c;->takeLast(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;

    move-result-object p0

    invoke-virtual {p0}, Lrx/c;->toList()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final takeUntil(Ll/qcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "-TT;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 11
    new-instance v0, Ll/t460;

    invoke-direct {v0, p1}, Ll/t460;-><init>(Ll/qcj;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final takeUntil(Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TE;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/s460;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/s460;-><init>(Lrx/c;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final takeWhile(Ll/qcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "-TT;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/u460;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/u460;-><init>(Ll/qcj;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final throttleFirst(JLjava/util/concurrent/TimeUnit;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 11
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lrx/c;->throttleFirst(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final throttleFirst(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/v460;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p3, p4}, Ll/v460;-><init>(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final throttleLast(JLjava/util/concurrent/TimeUnit;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lrx/c;->sample(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final throttleLast(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 6
    invoke-virtual {p0, p1, p2, p3, p4}, Lrx/c;->sample(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final throttleWithTimeout(JLjava/util/concurrent/TimeUnit;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lrx/c;->debounce(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final throttleWithTimeout(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 6
    invoke-virtual {p0, p1, p2, p3, p4}, Lrx/c;->debounce(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final timeInterval()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/qzi0<",
            "TT;>;>;"
        }
    .end annotation

    .line 11
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    move-result-object v0

    invoke-virtual {p0, v0}, Lrx/c;->timeInterval(Ll/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final timeInterval(Ll/f2e0;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "Ll/qzi0<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/w460;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/w460;-><init>(Ll/f2e0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final timeout(JLjava/util/concurrent/TimeUnit;)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    const/4 v4, 0x0

    .line 23
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    move-result-object v5

    move-object v0, p0

    move-wide v1, p1

    move-object v3, p3

    invoke-virtual/range {v0 .. v5}, Lrx/c;->timeout(JLjava/util/concurrent/TimeUnit;Lrx/c;Ll/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final timeout(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    const/4 v4, 0x0

    move-object v0, p0

    move-wide v1, p1

    move-object v3, p3

    move-object v5, p4

    .line 26
    invoke-virtual/range {v0 .. v5}, Lrx/c;->timeout(JLjava/util/concurrent/TimeUnit;Lrx/c;Ll/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final timeout(JLjava/util/concurrent/TimeUnit;Lrx/c;)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 24
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    move-result-object v5

    move-object v0, p0

    move-wide v1, p1

    move-object v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lrx/c;->timeout(JLjava/util/concurrent/TimeUnit;Lrx/c;Ll/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final timeout(JLjava/util/concurrent/TimeUnit;Lrx/c;Ll/f2e0;)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lrx/c<",
            "+TT;>;",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 25
    new-instance v0, Ll/x460;

    move-wide v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Ll/x460;-><init>(JLjava/util/concurrent/TimeUnit;Lrx/c;Ll/f2e0;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final timeout(Ll/pcj;Ll/qcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/pcj<",
            "+",
            "Lrx/c<",
            "TU;>;>;",
            "Ll/qcj<",
            "-TT;+",
            "Lrx/c<",
            "TV;>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 20
    invoke-virtual {p0, p1, p2, v0}, Lrx/c;->timeout(Ll/pcj;Ll/qcj;Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final timeout(Ll/pcj;Ll/qcj;Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/pcj<",
            "+",
            "Lrx/c<",
            "TU;>;>;",
            "Ll/qcj<",
            "-TT;+",
            "Lrx/c<",
            "TV;>;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    new-instance v0, Ll/z460;

    .line 4
    .line 5
    invoke-direct {v0, p1, p2, p3}, Ll/z460;-><init>(Ll/pcj;Ll/qcj;Lrx/c;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_0
    const-string p0, "timeoutSelector is null"

    .line 14
    .line 15
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public final timeout(Ll/qcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-TT;+",
            "Lrx/c<",
            "TV;>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 21
    invoke-virtual {p0, v0, p1, v0}, Lrx/c;->timeout(Ll/pcj;Ll/qcj;Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final timeout(Ll/qcj;Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-TT;+",
            "Lrx/c<",
            "TV;>;>;",
            "Lrx/c<",
            "+TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 22
    invoke-virtual {p0, v0, p1, p2}, Lrx/c;->timeout(Ll/pcj;Ll/qcj;Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final timestamp()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/k0j0<",
            "TT;>;>;"
        }
    .end annotation

    .line 11
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    move-result-object v0

    invoke-virtual {p0, v0}, Lrx/c;->timestamp(Ll/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final timestamp(Ll/f2e0;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "Ll/k0j0<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/a560;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/a560;-><init>(Ll/f2e0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final toBlocking()Ll/o43;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/o43<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Ll/o43;->d(Lrx/c;)Ll/o43;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public toCompletable()Lrx/b;
    .locals 0

    .line 1
    invoke-static {p0}, Lrx/b;->f(Lrx/c;)Lrx/b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final toList()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/d560;->b()Ll/d560;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final toMap(Ll/qcj;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-TT;+TK;>;)",
            "Lrx/c<",
            "Ljava/util/Map<",
            "TK;TT;>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/b560;

    .line 2
    .line 3
    invoke-static {}, Lrx/internal/util/UtilityFunctions;->b()Ll/qcj;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, p1, v1}, Ll/b560;-><init>(Ll/qcj;Ll/qcj;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public final toMap(Ll/qcj;Ll/qcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-TT;+TK;>;",
            "Ll/qcj<",
            "-TT;+TV;>;)",
            "Lrx/c<",
            "Ljava/util/Map<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 15
    new-instance v0, Ll/b560;

    invoke-direct {v0, p1, p2}, Ll/b560;-><init>(Ll/qcj;Ll/qcj;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final toMap(Ll/qcj;Ll/qcj;Ll/pcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-TT;+TK;>;",
            "Ll/qcj<",
            "-TT;+TV;>;",
            "Ll/pcj<",
            "+",
            "Ljava/util/Map<",
            "TK;TV;>;>;)",
            "Lrx/c<",
            "Ljava/util/Map<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 16
    new-instance v0, Ll/b560;

    invoke-direct {v0, p1, p2, p3}, Ll/b560;-><init>(Ll/qcj;Ll/qcj;Ll/pcj;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final toMultimap(Ll/qcj;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-TT;+TK;>;)",
            "Lrx/c<",
            "Ljava/util/Map<",
            "TK;",
            "Ljava/util/Collection<",
            "TT;>;>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/c560;

    .line 2
    .line 3
    invoke-static {}, Lrx/internal/util/UtilityFunctions;->b()Ll/qcj;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, p1, v1}, Ll/c560;-><init>(Ll/qcj;Ll/qcj;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public final toMultimap(Ll/qcj;Ll/qcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-TT;+TK;>;",
            "Ll/qcj<",
            "-TT;+TV;>;)",
            "Lrx/c<",
            "Ljava/util/Map<",
            "TK;",
            "Ljava/util/Collection<",
            "TV;>;>;>;"
        }
    .end annotation

    .line 15
    new-instance v0, Ll/c560;

    invoke-direct {v0, p1, p2}, Ll/c560;-><init>(Ll/qcj;Ll/qcj;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final toMultimap(Ll/qcj;Ll/qcj;Ll/pcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-TT;+TK;>;",
            "Ll/qcj<",
            "-TT;+TV;>;",
            "Ll/pcj<",
            "+",
            "Ljava/util/Map<",
            "TK;",
            "Ljava/util/Collection<",
            "TV;>;>;>;)",
            "Lrx/c<",
            "Ljava/util/Map<",
            "TK;",
            "Ljava/util/Collection<",
            "TV;>;>;>;"
        }
    .end annotation

    .line 16
    new-instance v0, Ll/c560;

    invoke-direct {v0, p1, p2, p3}, Ll/c560;-><init>(Ll/qcj;Ll/qcj;Ll/pcj;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final toMultimap(Ll/qcj;Ll/qcj;Ll/pcj;Ll/qcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/qcj<",
            "-TT;+TK;>;",
            "Ll/qcj<",
            "-TT;+TV;>;",
            "Ll/pcj<",
            "+",
            "Ljava/util/Map<",
            "TK;",
            "Ljava/util/Collection<",
            "TV;>;>;>;",
            "Ll/qcj<",
            "-TK;+",
            "Ljava/util/Collection<",
            "TV;>;>;)",
            "Lrx/c<",
            "Ljava/util/Map<",
            "TK;",
            "Ljava/util/Collection<",
            "TV;>;>;>;"
        }
    .end annotation

    .line 17
    new-instance v0, Ll/c560;

    invoke-direct {v0, p1, p2, p3, p4}, Ll/c560;-><init>(Ll/qcj;Ll/qcj;Ll/pcj;Ll/qcj;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public toSingle()Lrx/d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/d<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/d;

    .line 2
    .line 3
    invoke-static {p0}, Ll/no50;->b(Lrx/c;)Ll/no50;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Lrx/d;-><init>(Lrx/d$b;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public final toSortedList()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/e560;

    .line 2
    .line 3
    const/16 v1, 0xa

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/e560;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final toSortedList(I)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/c<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    .line 14
    new-instance v0, Ll/e560;

    invoke-direct {v0, p1}, Ll/e560;-><init>(I)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final toSortedList(Ll/rcj;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/rcj<",
            "-TT;-TT;",
            "Ljava/lang/Integer;",
            ">;)",
            "Lrx/c<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    .line 13
    new-instance v0, Ll/e560;

    const/16 v1, 0xa

    invoke-direct {v0, p1, v1}, Ll/e560;-><init>(Ll/rcj;I)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final toSortedList(Ll/rcj;I)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/rcj<",
            "-TT;-TT;",
            "Ljava/lang/Integer;",
            ">;I)",
            "Lrx/c<",
            "Ljava/util/List<",
            "TT;>;>;"
        }
    .end annotation

    .line 15
    new-instance v0, Ll/e560;

    invoke-direct {v0, p1, p2}, Ll/e560;-><init>(Ll/rcj;I)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final unsafeSubscribe(Ll/gcg0;)Ll/kcg0;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TT;>;)",
            "Ll/kcg0;"
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-virtual {p1}, Ll/gcg0;->d()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lrx/c;->onSubscribe:Lrx/c$a;

    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/hrd0;->p(Lrx/c;Lrx/c$a;)Lrx/c$a;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p1}, Ll/hrd0;->o(Ll/kcg0;)Ll/kcg0;

    .line 14
    .line 15
    .line 16
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    return-object p0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    invoke-static {p0}, Ll/j6f;->e(Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    :try_start_1
    invoke-static {p0}, Ll/hrd0;->m(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-interface {p1, v0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 27
    .line 28
    .line 29
    invoke-static {}, Ll/pcg0;->d()Ll/kcg0;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :catchall_1
    move-exception p1

    .line 35
    invoke-static {p1}, Ll/j6f;->e(Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    new-instance v0, Lrx/exceptions/OnErrorFailedException;

    .line 39
    .line 40
    new-instance v1, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    const-string v2, "Error occurred attempting to subscribe ["

    .line 43
    .line 44
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string p0, "] and then again while trying to pass to onError."

    .line 55
    .line 56
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-direct {v0, p0, p1}, Lrx/exceptions/OnErrorFailedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v0}, Ll/hrd0;->m(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 67
    .line 68
    .line 69
    throw v0
.end method

.method public final unsubscribeOn(Ll/f2e0;)Lrx/c;
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
    new-instance v0, Ll/f560;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/f560;-><init>(Ll/f2e0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final window(I)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lrx/c<",
            "Lrx/c<",
            "TT;>;>;"
        }
    .end annotation

    .line 29
    invoke-virtual {p0, p1, p1}, Lrx/c;->window(II)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final window(II)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lrx/c<",
            "Lrx/c<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    if-lez p1, :cond_1

    .line 2
    .line 3
    if-lez p2, :cond_0

    .line 4
    .line 5
    new-instance v0, Lrx/internal/operators/OperatorWindowWithSize;

    .line 6
    .line 7
    invoke-direct {v0, p1, p2}, Lrx/internal/operators/OperatorWindowWithSize;-><init>(II)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    const-string p0, "skip > 0 required but it was "

    .line 16
    .line 17
    invoke-static {p0, p2}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    return-object p0

    .line 22
    :cond_1
    const-string p0, "count > 0 required but it was "

    .line 23
    .line 24
    invoke-static {p0, p1}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x0

    .line 28
    return-object p0
.end method

.method public final window(JJLjava/util/concurrent/TimeUnit;)Lrx/c;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/c<",
            "Lrx/c<",
            "TT;>;>;"
        }
    .end annotation

    const v6, 0x7fffffff

    .line 31
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    move-result-object v7

    move-object v0, p0

    move-wide v1, p1

    move-wide v3, p3

    move-object v5, p5

    invoke-virtual/range {v0 .. v7}, Lrx/c;->window(JJLjava/util/concurrent/TimeUnit;ILl/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final window(JJLjava/util/concurrent/TimeUnit;ILl/f2e0;)Lrx/c;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/concurrent/TimeUnit;",
            "I",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "Lrx/c<",
            "TT;>;>;"
        }
    .end annotation

    .line 33
    new-instance v0, Ll/j560;

    move-wide v1, p1

    move-wide v3, p3

    move-object v5, p5

    move v6, p6

    move-object v7, p7

    invoke-direct/range {v0 .. v7}, Ll/j560;-><init>(JJLjava/util/concurrent/TimeUnit;ILl/f2e0;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final window(JJLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/concurrent/TimeUnit;",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "Lrx/c<",
            "TT;>;>;"
        }
    .end annotation

    const v6, 0x7fffffff

    move-object v0, p0

    move-wide v1, p1

    move-wide v3, p3

    move-object v5, p5

    move-object v7, p6

    .line 32
    invoke-virtual/range {v0 .. v7}, Lrx/c;->window(JJLjava/util/concurrent/TimeUnit;ILl/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final window(JLjava/util/concurrent/TimeUnit;)Lrx/c;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")",
            "Lrx/c<",
            "Lrx/c<",
            "TT;>;>;"
        }
    .end annotation

    .line 34
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    move-result-object v6

    move-wide v3, p1

    move-object v0, p0

    move-wide v1, p1

    move-object v5, p3

    invoke-virtual/range {v0 .. v6}, Lrx/c;->window(JJLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final window(JLjava/util/concurrent/TimeUnit;I)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "I)",
            "Lrx/c<",
            "Lrx/c<",
            "TT;>;>;"
        }
    .end annotation

    .line 35
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    move-result-object v5

    move-object v0, p0

    move-wide v1, p1

    move-object v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lrx/c;->window(JLjava/util/concurrent/TimeUnit;ILl/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final window(JLjava/util/concurrent/TimeUnit;ILl/f2e0;)Lrx/c;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "I",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "Lrx/c<",
            "TT;>;>;"
        }
    .end annotation

    move-wide v3, p1

    move-object v0, p0

    move-wide v1, p1

    move-object v5, p3

    move v6, p4

    move-object v7, p5

    .line 36
    invoke-virtual/range {v0 .. v7}, Lrx/c;->window(JJLjava/util/concurrent/TimeUnit;ILl/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final window(JLjava/util/concurrent/TimeUnit;Ll/f2e0;)Lrx/c;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            "Ll/f2e0;",
            ")",
            "Lrx/c<",
            "Lrx/c<",
            "TT;>;>;"
        }
    .end annotation

    const v4, 0x7fffffff

    move-object v0, p0

    move-wide v1, p1

    move-object v3, p3

    move-object v5, p4

    .line 37
    invoke-virtual/range {v0 .. v5}, Lrx/c;->window(JLjava/util/concurrent/TimeUnit;ILl/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final window(Ll/pcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TClosing:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/pcj<",
            "+",
            "Lrx/c<",
            "+TTClosing;>;>;)",
            "Lrx/c<",
            "Lrx/c<",
            "TT;>;>;"
        }
    .end annotation

    .line 30
    new-instance v0, Ll/h560;

    invoke-direct {v0, p1}, Ll/h560;-><init>(Ll/pcj;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final window(Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TU;>;)",
            "Lrx/c<",
            "Lrx/c<",
            "TT;>;>;"
        }
    .end annotation

    .line 39
    new-instance v0, Ll/g560;

    invoke-direct {v0, p1}, Ll/g560;-><init>(Lrx/c;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final window(Lrx/c;Ll/qcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TOpening:",
            "Ljava/lang/Object;",
            "TClosing:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TTOpening;>;",
            "Ll/qcj<",
            "-TTOpening;+",
            "Lrx/c<",
            "+TTClosing;>;>;)",
            "Lrx/c<",
            "Lrx/c<",
            "TT;>;>;"
        }
    .end annotation

    .line 38
    new-instance v0, Ll/i560;

    invoke-direct {v0, p1, p2}, Ll/i560;-><init>(Lrx/c;Ll/qcj;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final withLatestFrom(Ljava/lang/Iterable;Ll/zcj;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable<",
            "Lrx/c<",
            "*>;>;",
            "Ll/zcj<",
            "TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 28
    new-instance v0, Ll/l560;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1, p1, p2}, Ll/l560;-><init>(Lrx/c;[Lrx/c;Ljava/lang/Iterable;Ll/zcj;)V

    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final withLatestFrom(Lrx/c;Ll/rcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<U:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TU;>;",
            "Ll/rcj<",
            "-TT;-TU;+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 20
    new-instance v0, Ll/k560;

    invoke-direct {v0, p1, p2}, Ll/k560;-><init>(Lrx/c;Ll/rcj;)V

    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final withLatestFrom(Lrx/c;Lrx/c;Ll/scj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT1;>;",
            "Lrx/c<",
            "TT2;>;",
            "Ll/scj<",
            "-TT;-TT1;-TT2;TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/l560;

    .line 2
    .line 3
    filled-new-array {p1, p2}, [Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 p2, 0x0

    .line 8
    invoke-static {p3}, Ll/edj;->b(Ll/scj;)Ll/zcj;

    .line 9
    .line 10
    .line 11
    move-result-object p3

    .line 12
    invoke-direct {v0, p0, p1, p2, p3}, Ll/l560;-><init>(Lrx/c;[Lrx/c;Ljava/lang/Iterable;Ll/zcj;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final withLatestFrom(Lrx/c;Lrx/c;Lrx/c;Ll/tcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT1;>;",
            "Lrx/c<",
            "TT2;>;",
            "Lrx/c<",
            "TT3;>;",
            "Ll/tcj<",
            "-TT;-TT1;-TT2;-TT3;TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 21
    new-instance v0, Ll/l560;

    filled-new-array {p1, p2, p3}, [Lrx/c;

    move-result-object p1

    const/4 p2, 0x0

    invoke-static {p4}, Ll/edj;->c(Ll/tcj;)Ll/zcj;

    move-result-object p3

    invoke-direct {v0, p0, p1, p2, p3}, Ll/l560;-><init>(Lrx/c;[Lrx/c;Ljava/lang/Iterable;Ll/zcj;)V

    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final withLatestFrom(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/ucj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT1;>;",
            "Lrx/c<",
            "TT2;>;",
            "Lrx/c<",
            "TT3;>;",
            "Lrx/c<",
            "TT4;>;",
            "Ll/ucj<",
            "-TT;-TT1;-TT2;-TT3;-TT4;TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 22
    new-instance v0, Ll/l560;

    filled-new-array {p1, p2, p3, p4}, [Lrx/c;

    move-result-object p1

    const/4 p2, 0x0

    invoke-static {p5}, Ll/edj;->d(Ll/ucj;)Ll/zcj;

    move-result-object p3

    invoke-direct {v0, p0, p1, p2, p3}, Ll/l560;-><init>(Lrx/c;[Lrx/c;Ljava/lang/Iterable;Ll/zcj;)V

    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final withLatestFrom(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/vcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "T5:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT1;>;",
            "Lrx/c<",
            "TT2;>;",
            "Lrx/c<",
            "TT1;>;",
            "Lrx/c<",
            "TT2;>;",
            "Lrx/c<",
            "TT1;>;",
            "Ll/vcj<",
            "-TT;-TT1;-TT2;-TT3;-TT4;-TT5;TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 23
    new-instance v0, Ll/l560;

    filled-new-array {p1, p2, p3, p4, p5}, [Lrx/c;

    move-result-object p1

    const/4 p2, 0x0

    invoke-static {p6}, Ll/edj;->e(Ll/vcj;)Ll/zcj;

    move-result-object p3

    invoke-direct {v0, p0, p1, p2, p3}, Ll/l560;-><init>(Lrx/c;[Lrx/c;Ljava/lang/Iterable;Ll/zcj;)V

    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final withLatestFrom(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/wcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "T5:",
            "Ljava/lang/Object;",
            "T6:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT1;>;",
            "Lrx/c<",
            "TT2;>;",
            "Lrx/c<",
            "TT1;>;",
            "Lrx/c<",
            "TT2;>;",
            "Lrx/c<",
            "TT1;>;",
            "Lrx/c<",
            "TT2;>;",
            "Ll/wcj<",
            "-TT;-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 24
    new-instance v0, Ll/l560;

    filled-new-array/range {p1 .. p6}, [Lrx/c;

    move-result-object p1

    const/4 p2, 0x0

    invoke-static {p7}, Ll/edj;->f(Ll/wcj;)Ll/zcj;

    move-result-object p3

    invoke-direct {v0, p0, p1, p2, p3}, Ll/l560;-><init>(Lrx/c;[Lrx/c;Ljava/lang/Iterable;Ll/zcj;)V

    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final withLatestFrom(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/xcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "T5:",
            "Ljava/lang/Object;",
            "T6:",
            "Ljava/lang/Object;",
            "T7:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT1;>;",
            "Lrx/c<",
            "TT2;>;",
            "Lrx/c<",
            "TT1;>;",
            "Lrx/c<",
            "TT2;>;",
            "Lrx/c<",
            "TT1;>;",
            "Lrx/c<",
            "TT2;>;",
            "Lrx/c<",
            "TT1;>;",
            "Ll/xcj<",
            "-TT;-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 25
    new-instance v0, Ll/l560;

    filled-new-array/range {p1 .. p7}, [Lrx/c;

    move-result-object p1

    const/4 p2, 0x0

    invoke-static {p8}, Ll/edj;->g(Ll/xcj;)Ll/zcj;

    move-result-object p3

    invoke-direct {v0, p0, p1, p2, p3}, Ll/l560;-><init>(Lrx/c;[Lrx/c;Ljava/lang/Iterable;Ll/zcj;)V

    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final withLatestFrom(Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Lrx/c;Ll/ycj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T1:",
            "Ljava/lang/Object;",
            "T2:",
            "Ljava/lang/Object;",
            "T3:",
            "Ljava/lang/Object;",
            "T4:",
            "Ljava/lang/Object;",
            "T5:",
            "Ljava/lang/Object;",
            "T6:",
            "Ljava/lang/Object;",
            "T7:",
            "Ljava/lang/Object;",
            "T8:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT1;>;",
            "Lrx/c<",
            "TT2;>;",
            "Lrx/c<",
            "TT1;>;",
            "Lrx/c<",
            "TT2;>;",
            "Lrx/c<",
            "TT1;>;",
            "Lrx/c<",
            "TT2;>;",
            "Lrx/c<",
            "TT1;>;",
            "Lrx/c<",
            "TT2;>;",
            "Ll/ycj<",
            "-TT;-TT1;-TT2;-TT3;-TT4;-TT5;-TT6;-TT7;-TT8;TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 26
    new-instance v0, Ll/l560;

    filled-new-array/range {p1 .. p8}, [Lrx/c;

    move-result-object p1

    const/4 p2, 0x0

    invoke-static {p9}, Ll/edj;->h(Ll/ycj;)Ll/zcj;

    move-result-object p3

    invoke-direct {v0, p0, p1, p2, p3}, Ll/l560;-><init>(Lrx/c;[Lrx/c;Ljava/lang/Iterable;Ll/zcj;)V

    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final withLatestFrom([Lrx/c;Ll/zcj;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">([",
            "Lrx/c<",
            "*>;",
            "Ll/zcj<",
            "TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 27
    new-instance v0, Ll/l560;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1, p2}, Ll/l560;-><init>(Lrx/c;[Lrx/c;Ljava/lang/Iterable;Ll/zcj;)V

    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final zipWith(Ljava/lang/Iterable;Ll/rcj;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T2:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable<",
            "+TT2;>;",
            "Ll/rcj<",
            "-TT;-TT2;+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/m560;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Ll/m560;-><init>(Ljava/lang/Iterable;Ll/rcj;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lrx/c;->lift(Lrx/c$c;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final zipWith(Lrx/c;Ll/rcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T2:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "+TT2;>;",
            "Ll/rcj<",
            "-TT;-TT2;+TR;>;)",
            "Lrx/c<",
            "TR;>;"
        }
    .end annotation

    .line 11
    invoke-static {p0, p1, p2}, Lrx/c;->zip(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
