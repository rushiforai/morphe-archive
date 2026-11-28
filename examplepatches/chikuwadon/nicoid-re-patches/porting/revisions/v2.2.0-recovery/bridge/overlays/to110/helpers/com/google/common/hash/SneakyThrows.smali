.class final Lcom/google/common/hash/SneakyThrows;
.super Ljava/lang/Object;
.source "SneakyThrows.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Throwable;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static sneakyThrow(Ljava/lang/Throwable;)Ljava/lang/Error;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "t"
        }
    .end annotation

    .line 47
    new-instance v0, Lcom/google/common/hash/SneakyThrows;

    invoke-direct {v0}, Lcom/google/common/hash/SneakyThrows;-><init>()V

    invoke-direct {v0, p0}, Lcom/google/common/hash/SneakyThrows;->throwIt(Ljava/lang/Throwable;)Ljava/lang/Error;

    move-result-object p0

    throw p0
.end method

.method private throwIt(Ljava/lang/Throwable;)Ljava/lang/Error;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "t"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Throwable;",
            ")",
            "Ljava/lang/Error;",
            "^TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 52
    throw p1
.end method
