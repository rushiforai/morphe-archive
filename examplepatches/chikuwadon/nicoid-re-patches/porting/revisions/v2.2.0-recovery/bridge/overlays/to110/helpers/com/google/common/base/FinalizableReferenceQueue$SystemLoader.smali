.class final Lcom/google/common/base/FinalizableReferenceQueue$SystemLoader;
.super Ljava/lang/Object;
.source "FinalizableReferenceQueue.java"

# interfaces
.implements Lcom/google/common/base/FinalizableReferenceQueue$FinalizerLoader;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/base/FinalizableReferenceQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "SystemLoader"
.end annotation


# static fields
.field static disabled:Z


# direct methods
.method constructor <init>()V
    .registers 1

    .line 295
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public loadFinalizer()Ljava/lang/Class;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 302
    sget-boolean p0, Lcom/google/common/base/FinalizableReferenceQueue$SystemLoader;->disabled:Z

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    return-object v0

    .line 305
    :cond_0
    # invokes: Lcom/google/common/base/FinalizableReferenceQueue;->isAndroid()Z
    invoke-static {}, Lcom/google/common/base/FinalizableReferenceQueue;->access$100()Z

    move-result p0

    if-eqz p0, :cond_1

    return-object v0

    .line 311
    :cond_1
    :try_start_0
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz p0, :cond_2

    .line 318
    :try_start_1
    const-string v1, "com.google.common.base.internal.Finalizer"

    invoke-virtual {p0, v1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    return-object p0

    :catch_0
    :cond_2
    return-object v0

    .line 313
    :catch_1
    # getter for: Lcom/google/common/base/FinalizableReferenceQueue;->logger:Ljava/util/logging/Logger;
    invoke-static {}, Lcom/google/common/base/FinalizableReferenceQueue;->access$200()Ljava/util/logging/Logger;

    move-result-object p0

    const-string v1, "Not allowed to access system class loader."

    invoke-virtual {p0, v1}, Ljava/util/logging/Logger;->info(Ljava/lang/String;)V

    return-object v0
.end method
