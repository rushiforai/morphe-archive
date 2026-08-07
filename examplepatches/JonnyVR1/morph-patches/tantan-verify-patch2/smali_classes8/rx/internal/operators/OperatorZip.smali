.class public final Lrx/internal/operators/OperatorZip;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/operators/OperatorZip$Zip;,
        Lrx/internal/operators/OperatorZip$ZipProducer;,
        Lrx/internal/operators/OperatorZip$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$c<",
        "TR;[",
        "Lrx/c<",
        "*>;>;"
    }
.end annotation


# instance fields
.field public final a:Ll/zcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/zcj<",
            "+TR;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/rcj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/edj;->a(Ll/rcj;)Ll/zcj;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lrx/internal/operators/OperatorZip;->a:Ll/zcj;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Ll/scj;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    invoke-static {p1}, Ll/edj;->b(Ll/scj;)Ll/zcj;

    move-result-object p1

    iput-object p1, p0, Lrx/internal/operators/OperatorZip;->a:Ll/zcj;

    return-void
.end method

.method public constructor <init>(Ll/tcj;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    invoke-static {p1}, Ll/edj;->c(Ll/tcj;)Ll/zcj;

    move-result-object p1

    iput-object p1, p0, Lrx/internal/operators/OperatorZip;->a:Ll/zcj;

    return-void
.end method

.method public constructor <init>(Ll/ucj;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    invoke-static {p1}, Ll/edj;->d(Ll/ucj;)Ll/zcj;

    move-result-object p1

    iput-object p1, p0, Lrx/internal/operators/OperatorZip;->a:Ll/zcj;

    return-void
.end method

.method public constructor <init>(Ll/vcj;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    invoke-static {p1}, Ll/edj;->e(Ll/vcj;)Ll/zcj;

    move-result-object p1

    iput-object p1, p0, Lrx/internal/operators/OperatorZip;->a:Ll/zcj;

    return-void
.end method

.method public constructor <init>(Ll/wcj;)V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    invoke-static {p1}, Ll/edj;->f(Ll/wcj;)Ll/zcj;

    move-result-object p1

    iput-object p1, p0, Lrx/internal/operators/OperatorZip;->a:Ll/zcj;

    return-void
.end method

.method public constructor <init>(Ll/xcj;)V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    invoke-static {p1}, Ll/edj;->g(Ll/xcj;)Ll/zcj;

    move-result-object p1

    iput-object p1, p0, Lrx/internal/operators/OperatorZip;->a:Ll/zcj;

    return-void
.end method

.method public constructor <init>(Ll/ycj;)V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    invoke-static {p1}, Ll/edj;->h(Ll/ycj;)Ll/zcj;

    move-result-object p1

    iput-object p1, p0, Lrx/internal/operators/OperatorZip;->a:Ll/zcj;

    return-void
.end method

.method public constructor <init>(Ll/zcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/zcj<",
            "+TR;>;)V"
        }
    .end annotation

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lrx/internal/operators/OperatorZip;->a:Ll/zcj;

    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)Ll/gcg0;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TR;>;)",
            "Ll/gcg0<",
            "-[",
            "Lrx/c;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/internal/operators/OperatorZip$Zip;

    .line 2
    .line 3
    iget-object v1, p0, Lrx/internal/operators/OperatorZip;->a:Ll/zcj;

    .line 4
    .line 5
    invoke-direct {v0, p1, v1}, Lrx/internal/operators/OperatorZip$Zip;-><init>(Ll/gcg0;Ll/zcj;)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Lrx/internal/operators/OperatorZip$ZipProducer;

    .line 9
    .line 10
    invoke-direct {v1, v0}, Lrx/internal/operators/OperatorZip$ZipProducer;-><init>(Lrx/internal/operators/OperatorZip$Zip;)V

    .line 11
    .line 12
    .line 13
    new-instance v2, Lrx/internal/operators/OperatorZip$a;

    .line 14
    .line 15
    invoke-direct {v2, p0, p1, v0, v1}, Lrx/internal/operators/OperatorZip$a;-><init>(Lrx/internal/operators/OperatorZip;Ll/gcg0;Lrx/internal/operators/OperatorZip$Zip;Lrx/internal/operators/OperatorZip$ZipProducer;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, v2}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v1}, Ll/gcg0;->f(Ll/vk90;)V

    .line 22
    .line 23
    .line 24
    return-object v2
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorZip;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
