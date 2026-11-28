.class final Lcom/google/common/collect/Iterables$UnmodifiableIterable;
.super Lcom/google/common/collect/FluentIterable;
.source "Iterables.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Iterables;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "UnmodifiableIterable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/FluentIterable<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final iterable:Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Iterable<",
            "+TT;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ljava/lang/Iterable;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "iterable"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+TT;>;)V"
        }
    .end annotation

    .line 107
    invoke-direct {p0}, Lcom/google/common/collect/FluentIterable;-><init>()V

    .line 108
    iput-object p1, p0, Lcom/google/common/collect/Iterables$UnmodifiableIterable;->iterable:Ljava/lang/Iterable;

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/Iterable;Lcom/google/common/collect/Iterables$1;)V
    .registers 3

    .line 103
    invoke-direct {p0, p1}, Lcom/google/common/collect/Iterables$UnmodifiableIterable;-><init>(Ljava/lang/Iterable;)V

    return-void
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TT;>;"
        }
    .end annotation

    .line 113
    iget-object p0, p0, Lcom/google/common/collect/Iterables$UnmodifiableIterable;->iterable:Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/collect/Iterators;->unmodifiableIterator(Ljava/util/Iterator;)Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object p0

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 1

    .line 118
    iget-object p0, p0, Lcom/google/common/collect/Iterables$UnmodifiableIterable;->iterable:Ljava/lang/Iterable;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
