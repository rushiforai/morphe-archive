.class final synthetic Lcom/google/firebase/iid/FirebaseInstanceId$$Lambda$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zdg0;


# instance fields
.field private final arg$1:Lcom/google/firebase/iid/FirebaseInstanceId;

.field private final arg$2:Ljava/lang/String;

.field private final arg$3:Ljava/lang/String;

.field private final arg$4:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/google/firebase/iid/FirebaseInstanceId;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/iid/FirebaseInstanceId$$Lambda$4;->arg$1:Lcom/google/firebase/iid/FirebaseInstanceId;

    iput-object p2, p0, Lcom/google/firebase/iid/FirebaseInstanceId$$Lambda$4;->arg$2:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/firebase/iid/FirebaseInstanceId$$Lambda$4;->arg$3:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/firebase/iid/FirebaseInstanceId$$Lambda$4;->arg$4:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public then(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;
    .locals 3

    iget-object v0, p0, Lcom/google/firebase/iid/FirebaseInstanceId$$Lambda$4;->arg$1:Lcom/google/firebase/iid/FirebaseInstanceId;

    iget-object v1, p0, Lcom/google/firebase/iid/FirebaseInstanceId$$Lambda$4;->arg$2:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/firebase/iid/FirebaseInstanceId$$Lambda$4;->arg$3:Ljava/lang/String;

    iget-object p0, p0, Lcom/google/firebase/iid/FirebaseInstanceId$$Lambda$4;->arg$4:Ljava/lang/String;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v0, v1, v2, p0, p1}, Lcom/google/firebase/iid/FirebaseInstanceId;->lambda$getInstanceId$0$FirebaseInstanceId(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method
