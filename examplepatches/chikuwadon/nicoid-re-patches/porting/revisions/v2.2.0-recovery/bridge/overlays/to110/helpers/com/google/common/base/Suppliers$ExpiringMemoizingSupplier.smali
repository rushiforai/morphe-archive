.class final Lcom/google/common/base/Suppliers$ExpiringMemoizingSupplier;
.super Ljava/lang/Object;
.source "Suppliers.java"

# interfaces
.implements Lcom/google/common/base/Supplier;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/base/Suppliers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ExpiringMemoizingSupplier"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/common/base/Supplier<",
        "TT;>;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J


# instance fields
.field final delegate:Lcom/google/common/base/Supplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/base/Supplier<",
            "TT;>;"
        }
    .end annotation
.end field

.field final durationNanos:J

.field volatile transient expirationNanos:J

.field private transient lock:Ljava/lang/Object;

.field volatile transient value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/common/base/Supplier;J)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "delegate",
            "durationNanos"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/base/Supplier<",
            "TT;>;J)V"
        }
    .end annotation

    .line 289
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 281
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/google/common/base/Suppliers$ExpiringMemoizingSupplier;->lock:Ljava/lang/Object;

    .line 290
    iput-object p1, p0, Lcom/google/common/base/Suppliers$ExpiringMemoizingSupplier;->delegate:Lcom/google/common/base/Supplier;

    .line 291
    iput-wide p2, p0, Lcom/google/common/base/Suppliers$ExpiringMemoizingSupplier;->durationNanos:J

    return-void
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "in"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 334
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 335
    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/base/Suppliers$ExpiringMemoizingSupplier;->lock:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public get()Ljava/lang/Object;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 305
    iget-wide v0, p0, Lcom/google/common/base/Suppliers$ExpiringMemoizingSupplier;->expirationNanos:J

    .line 306
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v6, v0, v4

    if-eqz v6, :cond_0

    sub-long v6, v2, v0

    cmp-long v6, v6, v4

    if-ltz v6, :cond_3

    .line 308
    :cond_0
    iget-object v6, p0, Lcom/google/common/base/Suppliers$ExpiringMemoizingSupplier;->lock:Ljava/lang/Object;

    monitor-enter v6

    .line 309
    :try_start_0
    iget-wide v7, p0, Lcom/google/common/base/Suppliers$ExpiringMemoizingSupplier;->expirationNanos:J

    cmp-long v0, v0, v7

    if-nez v0, :cond_2

    .line 310
    iget-object v0, p0, Lcom/google/common/base/Suppliers$ExpiringMemoizingSupplier;->delegate:Lcom/google/common/base/Supplier;

    invoke-interface {v0}, Lcom/google/common/base/Supplier;->get()Ljava/lang/Object;

    move-result-object v0

    .line 311
    iput-object v0, p0, Lcom/google/common/base/Suppliers$ExpiringMemoizingSupplier;->value:Ljava/lang/Object;

    .line 312
    iget-wide v7, p0, Lcom/google/common/base/Suppliers$ExpiringMemoizingSupplier;->durationNanos:J

    add-long/2addr v2, v7

    cmp-long v1, v2, v4

    if-nez v1, :cond_1

    const-wide/16 v2, 0x1

    .line 315
    :cond_1
    iput-wide v2, p0, Lcom/google/common/base/Suppliers$ExpiringMemoizingSupplier;->expirationNanos:J

    .line 316
    monitor-exit v6

    return-object v0

    .line 318
    :cond_2
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 321
    :cond_3
    iget-object p0, p0, Lcom/google/common/base/Suppliers$ExpiringMemoizingSupplier;->value:Ljava/lang/Object;

    invoke-static {p0}, Lcom/google/common/base/NullnessCasts;->uncheckedCastNullableTToT(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 318
    :goto_0
    :try_start_1
    monitor-exit v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 328
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Suppliers.memoizeWithExpiration("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/google/common/base/Suppliers$ExpiringMemoizingSupplier;->delegate:Lcom/google/common/base/Supplier;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/google/common/base/Suppliers$ExpiringMemoizingSupplier;->durationNanos:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p0, ", NANOS)"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
