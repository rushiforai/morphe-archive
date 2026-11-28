.class public final synthetic Lnicoid/network238/okhttp3/internal/_UtilJvmKt$1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/concurrent/ThreadFactory;


# annotations
.annotation runtime Lnicoid/network238/com/android/tools/r8/annotations/LambdaMethod;
    holder = "Lnicoid/network238/okhttp3/internal/_UtilJvmKt;"
    method = "threadFactory$lambda$0"
    proto = "(Ljava/lang/String;ZLjava/lang/Runnable;)Ljava/lang/Thread;"
.end annotation


# instance fields
.field public final synthetic f$0:Ljava/lang/String;

.field public final synthetic f$1:Z


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Z)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt$1;->f$0:Ljava/lang/String;

    iput-boolean p2, p0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt$1;->f$1:Z

    return-void
.end method


# virtual methods
.method public final newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 4

    .line 0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt$1;->f$0:Ljava/lang/String;

    iget-boolean v1, p0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt$1;->f$1:Z

    invoke-static {v0, v1, p1}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->threadFactory$lambda$0(Ljava/lang/String;ZLjava/lang/Runnable;)Ljava/lang/Thread;

    move-result-object p1

    return-object p1
.end method
