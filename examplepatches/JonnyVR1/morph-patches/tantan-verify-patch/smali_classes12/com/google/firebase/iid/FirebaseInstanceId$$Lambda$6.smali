.class final synthetic Lcom/google/firebase/iid/FirebaseInstanceId$$Lambda$6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/to50;


# instance fields
.field private final arg$1:Lcom/google/firebase/iid/FirebaseInstanceId;

.field private final arg$2:Lcom/google/firebase/iid/Store$Token;


# direct methods
.method public constructor <init>(Lcom/google/firebase/iid/FirebaseInstanceId;Lcom/google/firebase/iid/Store$Token;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/iid/FirebaseInstanceId$$Lambda$6;->arg$1:Lcom/google/firebase/iid/FirebaseInstanceId;

    iput-object p2, p0, Lcom/google/firebase/iid/FirebaseInstanceId$$Lambda$6;->arg$2:Lcom/google/firebase/iid/Store$Token;

    return-void
.end method


# virtual methods
.method public onSuccess(Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/iid/FirebaseInstanceId$$Lambda$6;->arg$1:Lcom/google/firebase/iid/FirebaseInstanceId;

    iget-object p0, p0, Lcom/google/firebase/iid/FirebaseInstanceId$$Lambda$6;->arg$2:Lcom/google/firebase/iid/Store$Token;

    check-cast p1, Lcom/google/firebase/iid/InstanceIdResult;

    invoke-virtual {v0, p0, p1}, Lcom/google/firebase/iid/FirebaseInstanceId;->lambda$getInstanceId$1$FirebaseInstanceId(Lcom/google/firebase/iid/Store$Token;Lcom/google/firebase/iid/InstanceIdResult;)V

    return-void
.end method
