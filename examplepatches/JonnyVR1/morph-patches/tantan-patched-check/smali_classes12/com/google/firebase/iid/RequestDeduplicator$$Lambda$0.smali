.class final synthetic Lcom/google/firebase/iid/RequestDeduplicator$$Lambda$0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/s26;


# instance fields
.field private final arg$1:Lcom/google/firebase/iid/RequestDeduplicator;

.field private final arg$2:Landroid/util/Pair;


# direct methods
.method public constructor <init>(Lcom/google/firebase/iid/RequestDeduplicator;Landroid/util/Pair;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/iid/RequestDeduplicator$$Lambda$0;->arg$1:Lcom/google/firebase/iid/RequestDeduplicator;

    iput-object p2, p0, Lcom/google/firebase/iid/RequestDeduplicator$$Lambda$0;->arg$2:Landroid/util/Pair;

    return-void
.end method


# virtual methods
.method public then(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/iid/RequestDeduplicator$$Lambda$0;->arg$1:Lcom/google/firebase/iid/RequestDeduplicator;

    iget-object p0, p0, Lcom/google/firebase/iid/RequestDeduplicator$$Lambda$0;->arg$2:Landroid/util/Pair;

    invoke-virtual {v0, p0, p1}, Lcom/google/firebase/iid/RequestDeduplicator;->lambda$getOrStartGetTokenRequest$0$RequestDeduplicator(Landroid/util/Pair;Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;

    return-object p1
.end method
