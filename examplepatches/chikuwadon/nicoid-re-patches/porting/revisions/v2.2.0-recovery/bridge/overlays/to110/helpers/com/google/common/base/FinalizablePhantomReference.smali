.class public abstract Lcom/google/common/base/FinalizablePhantomReference;
.super Ljava/lang/ref/PhantomReference;
.source "FinalizablePhantomReference.java"

# interfaces
.implements Lcom/google/common/base/FinalizableReference;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/ref/PhantomReference<",
        "TT;>;",
        "Lcom/google/common/base/FinalizableReference;"
    }
.end annotation


# direct methods
.method protected constructor <init>(Ljava/lang/Object;Lcom/google/common/base/FinalizableReferenceQueue;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "referent",
            "queue"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/google/common/base/FinalizableReferenceQueue;",
            ")V"
        }
    .end annotation

    .line 45
    iget-object v0, p2, Lcom/google/common/base/FinalizableReferenceQueue;->queue:Ljava/lang/ref/ReferenceQueue;

    invoke-direct {p0, p1, v0}, Ljava/lang/ref/PhantomReference;-><init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    .line 46
    invoke-virtual {p2}, Lcom/google/common/base/FinalizableReferenceQueue;->cleanUp()V

    return-void
.end method
