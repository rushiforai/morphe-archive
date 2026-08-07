.class public abstract Lcom/tantanapp/common/utils/ThreadUtil$PriorityRunnable;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/common/utils/ThreadUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "PriorityRunnable"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/common/utils/ThreadUtil$PriorityRunnable$Priority;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Runnable;",
        "Ljava/lang/Comparable<",
        "Lcom/tantanapp/common/utils/ThreadUtil$PriorityRunnable;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/tantanapp/common/utils/ThreadUtil$PriorityRunnable$Priority;


# direct methods
.method public static synthetic a(Lcom/tantanapp/common/utils/ThreadUtil$PriorityRunnable;)Lcom/tantanapp/common/utils/ThreadUtil$PriorityRunnable$Priority;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/utils/ThreadUtil$PriorityRunnable;->a:Lcom/tantanapp/common/utils/ThreadUtil$PriorityRunnable$Priority;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public abstract b(Lcom/tantanapp/common/utils/ThreadUtil$PriorityRunnable;)I
.end method
