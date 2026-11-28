.class public final Lcom/google/common/collect/Interners;
.super Ljava/lang/Object;
.source "Interners.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/Interners$InternerBuilder;,
        Lcom/google/common/collect/Interners$InternerFunction;,
        Lcom/google/common/collect/Interners$InternerImpl;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static asFunction(Lcom/google/common/collect/Interner;)Lcom/google/common/base/Function;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "interner"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/collect/Interner<",
            "TE;>;)",
            "Lcom/google/common/base/Function<",
            "TE;TE;>;"
        }
    .end annotation

    .line 165
    new-instance v0, Lcom/google/common/collect/Interners$InternerFunction;

    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/common/collect/Interner;

    invoke-direct {v0, p0}, Lcom/google/common/collect/Interners$InternerFunction;-><init>(Lcom/google/common/collect/Interner;)V

    return-object v0
.end method

.method public static newBuilder()Lcom/google/common/collect/Interners$InternerBuilder;
    .registers 2

    .line 95
    new-instance v0, Lcom/google/common/collect/Interners$InternerBuilder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/common/collect/Interners$InternerBuilder;-><init>(Lcom/google/common/collect/Interners$1;)V

    return-object v0
.end method

.method public static newStrongInterner()Lcom/google/common/collect/Interner;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/google/common/collect/Interner<",
            "TE;>;"
        }
    .end annotation

    .line 104
    invoke-static {}, Lcom/google/common/collect/Interners;->newBuilder()Lcom/google/common/collect/Interners$InternerBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/collect/Interners$InternerBuilder;->strong()Lcom/google/common/collect/Interners$InternerBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/collect/Interners$InternerBuilder;->build()Lcom/google/common/collect/Interner;

    move-result-object v0

    return-object v0
.end method

.method public static newWeakInterner()Lcom/google/common/collect/Interner;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/google/common/collect/Interner<",
            "TE;>;"
        }
    .end annotation

    .line 114
    invoke-static {}, Lcom/google/common/collect/Interners;->newBuilder()Lcom/google/common/collect/Interners$InternerBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/collect/Interners$InternerBuilder;->weak()Lcom/google/common/collect/Interners$InternerBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/collect/Interners$InternerBuilder;->build()Lcom/google/common/collect/Interner;

    move-result-object v0

    return-object v0
.end method
