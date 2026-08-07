.class final synthetic Lcom/google/firebase/iid/GmsRpc$$Lambda$0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/s26;


# instance fields
.field private final arg$1:Lcom/google/firebase/iid/GmsRpc;


# direct methods
.method public constructor <init>(Lcom/google/firebase/iid/GmsRpc;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/iid/GmsRpc$$Lambda$0;->arg$1:Lcom/google/firebase/iid/GmsRpc;

    return-void
.end method


# virtual methods
.method public then(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/google/firebase/iid/GmsRpc$$Lambda$0;->arg$1:Lcom/google/firebase/iid/GmsRpc;

    invoke-virtual {p0, p1}, Lcom/google/firebase/iid/GmsRpc;->lambda$extractResponseWhenComplete$0$GmsRpc(Lcom/google/android/gms/tasks/Task;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
