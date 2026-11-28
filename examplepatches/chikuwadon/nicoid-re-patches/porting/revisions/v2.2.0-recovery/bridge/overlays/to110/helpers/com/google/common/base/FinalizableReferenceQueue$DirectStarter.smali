.class final Lcom/google/common/base/FinalizableReferenceQueue$DirectStarter;
.super Ljava/lang/Object;
.source "FinalizableReferenceQueue.java"

# interfaces
.implements Lcom/google/common/base/FinalizableReferenceQueue$FinalizerStarter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/base/FinalizableReferenceQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "DirectStarter"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 417
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/base/FinalizableReferenceQueue$1;)V
    .registers 2

    .line 417
    invoke-direct {p0}, Lcom/google/common/base/FinalizableReferenceQueue$DirectStarter;-><init>()V

    return-void
.end method


# virtual methods
.method public startFinalizer(Ljava/lang/Class;Ljava/lang/ref/ReferenceQueue;Ljava/lang/ref/PhantomReference;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "finalizableReferenceClass",
            "queue",
            "frqRef"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/ref/ReferenceQueue<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/ref/PhantomReference<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 423
    invoke-static {p1, p2, p3}, Lcom/google/common/base/internal/Finalizer;->startFinalizer(Ljava/lang/Class;Ljava/lang/ref/ReferenceQueue;Ljava/lang/ref/PhantomReference;)V

    return-void
.end method
