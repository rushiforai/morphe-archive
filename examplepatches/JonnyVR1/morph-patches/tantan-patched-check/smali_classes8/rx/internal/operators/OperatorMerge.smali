.class public final Lrx/internal/operators/OperatorMerge;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/operators/OperatorMerge$c;,
        Lrx/internal/operators/OperatorMerge$d;,
        Lrx/internal/operators/OperatorMerge$MergeProducer;,
        Lrx/internal/operators/OperatorMerge$a;,
        Lrx/internal/operators/OperatorMerge$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$c<",
        "TT;",
        "Lrx/c<",
        "+TT;>;>;"
    }
.end annotation


# instance fields
.field public final a:Z

.field public final b:I


# direct methods
.method public constructor <init>(ZI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lrx/internal/operators/OperatorMerge;->a:Z

    .line 5
    .line 6
    iput p2, p0, Lrx/internal/operators/OperatorMerge;->b:I

    .line 7
    .line 8
    return-void
.end method

.method public static b(Z)Lrx/internal/operators/OperatorMerge;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(Z)",
            "Lrx/internal/operators/OperatorMerge<",
            "TT;>;"
        }
    .end annotation

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    sget-object p0, Lrx/internal/operators/OperatorMerge$a;->INSTANCE:Lrx/internal/operators/OperatorMerge;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    sget-object p0, Lrx/internal/operators/OperatorMerge$b;->INSTANCE:Lrx/internal/operators/OperatorMerge;

    .line 7
    .line 8
    return-object p0
.end method

.method public static c(ZI)Lrx/internal/operators/OperatorMerge;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(ZI)",
            "Lrx/internal/operators/OperatorMerge<",
            "TT;>;"
        }
    .end annotation

    .line 1
    if-lez p1, :cond_1

    .line 2
    .line 3
    const v0, 0x7fffffff

    .line 4
    .line 5
    .line 6
    if-ne p1, v0, :cond_0

    .line 7
    .line 8
    invoke-static {p0}, Lrx/internal/operators/OperatorMerge;->b(Z)Lrx/internal/operators/OperatorMerge;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_0
    new-instance v0, Lrx/internal/operators/OperatorMerge;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1}, Lrx/internal/operators/OperatorMerge;-><init>(ZI)V

    .line 16
    .line 17
    .line 18
    return-object v0

    .line 19
    :cond_1
    const-string p0, "maxConcurrent > 0 required but it was "

    .line 20
    .line 21
    invoke-static {p0, p1}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return-object p0
.end method


# virtual methods
.method public a(Ll/gcg0;)Ll/gcg0;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TT;>;)",
            "Ll/gcg0<",
            "Lrx/c<",
            "+TT;>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/internal/operators/OperatorMerge$d;

    .line 2
    .line 3
    iget-boolean v1, p0, Lrx/internal/operators/OperatorMerge;->a:Z

    .line 4
    .line 5
    iget p0, p0, Lrx/internal/operators/OperatorMerge;->b:I

    .line 6
    .line 7
    invoke-direct {v0, p1, v1, p0}, Lrx/internal/operators/OperatorMerge$d;-><init>(Ll/gcg0;ZI)V

    .line 8
    .line 9
    .line 10
    new-instance p0, Lrx/internal/operators/OperatorMerge$MergeProducer;

    .line 11
    .line 12
    invoke-direct {p0, v0}, Lrx/internal/operators/OperatorMerge$MergeProducer;-><init>(Lrx/internal/operators/OperatorMerge$d;)V

    .line 13
    .line 14
    .line 15
    iput-object p0, v0, Lrx/internal/operators/OperatorMerge$d;->h:Lrx/internal/operators/OperatorMerge$MergeProducer;

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, p0}, Ll/gcg0;->f(Ll/vk90;)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorMerge;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
