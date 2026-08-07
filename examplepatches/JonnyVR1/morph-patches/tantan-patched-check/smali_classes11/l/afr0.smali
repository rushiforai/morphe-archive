.class public final synthetic Ll/afr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/tasks/OnCompleteListener;


# instance fields
.field public final synthetic a:Ll/vnd0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/util/concurrent/ScheduledFuture;


# direct methods
.method public synthetic constructor <init>(Ll/vnd0;Ljava/lang/String;Ljava/util/concurrent/ScheduledFuture;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/afr0;->a:Ll/vnd0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/afr0;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ll/afr0;->c:Ljava/util/concurrent/ScheduledFuture;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final onComplete(Lcom/google/android/gms/tasks/Task;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/afr0;->a:Ll/vnd0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/afr0;->b:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Ll/afr0;->c:Ljava/util/concurrent/ScheduledFuture;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p0, p1}, Ll/vnd0;->h(Ljava/lang/String;Ljava/util/concurrent/ScheduledFuture;Lcom/google/android/gms/tasks/Task;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
