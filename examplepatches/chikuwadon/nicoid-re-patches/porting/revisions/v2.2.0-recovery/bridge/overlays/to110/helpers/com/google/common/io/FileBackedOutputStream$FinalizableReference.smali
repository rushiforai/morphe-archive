.class final Lcom/google/common/io/FileBackedOutputStream$FinalizableReference;
.super Lcom/google/common/base/FinalizablePhantomReference;
.source "FileBackedOutputStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/io/FileBackedOutputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "FinalizableReference"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/base/FinalizablePhantomReference<",
        "Lcom/google/common/io/ByteSource;",
        ">;"
    }
.end annotation


# static fields
.field static final referenceQueue:Lcom/google/common/base/FinalizableReferenceQueue;

.field static final references:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/google/common/io/FileBackedOutputStream$FinalizableReference;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final state:Lcom/google/common/io/FileBackedOutputStream$State;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 136
    new-instance v0, Lcom/google/common/base/FinalizableReferenceQueue;

    invoke-direct {v0}, Lcom/google/common/base/FinalizableReferenceQueue;-><init>()V

    sput-object v0, Lcom/google/common/io/FileBackedOutputStream$FinalizableReference;->referenceQueue:Lcom/google/common/base/FinalizableReferenceQueue;

    .line 137
    invoke-static {}, Lcom/google/common/collect/Sets;->newConcurrentHashSet()Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/google/common/io/FileBackedOutputStream$FinalizableReference;->references:Ljava/util/Set;

    return-void
.end method

.method constructor <init>(Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "referent"
        }
    .end annotation

    .line 150
    sget-object v0, Lcom/google/common/io/FileBackedOutputStream$FinalizableReference;->referenceQueue:Lcom/google/common/base/FinalizableReferenceQueue;

    invoke-direct {p0, p1, v0}, Lcom/google/common/base/FinalizablePhantomReference;-><init>(Ljava/lang/Object;Lcom/google/common/base/FinalizableReferenceQueue;)V

    .line 151
    iget-object p1, p1, Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;->state:Lcom/google/common/io/FileBackedOutputStream$State;

    iput-object p1, p0, Lcom/google/common/io/FileBackedOutputStream$FinalizableReference;->state:Lcom/google/common/io/FileBackedOutputStream$State;

    return-void
.end method

.method static register(Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "referent"
        }
    .end annotation

    .line 141
    :try_start_0
    sget-object v0, Lcom/google/common/io/FileBackedOutputStream$FinalizableReference;->references:Ljava/util/Set;

    new-instance v1, Lcom/google/common/io/FileBackedOutputStream$FinalizableReference;

    invoke-direct {v1, p0}, Lcom/google/common/io/FileBackedOutputStream$FinalizableReference;-><init>(Lcom/google/common/io/FileBackedOutputStream$FbosByteSource;)V

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 143
    invoke-static {p0}, Lcom/google/common/io/FileBackedOutputStream;->reachabilityFence(Ljava/lang/Object;)V

    return-void

    :catchall_0
    move-exception v0

    invoke-static {p0}, Lcom/google/common/io/FileBackedOutputStream;->reachabilityFence(Ljava/lang/Object;)V

    .line 144
    throw v0
.end method


# virtual methods
.method public finalizeReferent()V
    .registers 2

    .line 156
    sget-object v0, Lcom/google/common/io/FileBackedOutputStream$FinalizableReference;->references:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 158
    :try_start_0
    iget-object p0, p0, Lcom/google/common/io/FileBackedOutputStream$FinalizableReference;->state:Lcom/google/common/io/FileBackedOutputStream$State;

    invoke-virtual {p0}, Lcom/google/common/io/FileBackedOutputStream$State;->reset()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p0

    .line 160
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintStream;)V

    return-void
.end method
