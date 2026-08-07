.class final Lcom/google/firebase/iid/InstanceIdResultImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/firebase/iid/InstanceIdResult;


# instance fields
.field private final id:Ljava/lang/String;

.field private final token:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/iid/InstanceIdResultImpl;->id:Ljava/lang/String;

    iput-object p2, p0, Lcom/google/firebase/iid/InstanceIdResultImpl;->token:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getId()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/firebase/iid/InstanceIdResultImpl;->id:Ljava/lang/String;

    return-object p0
.end method

.method public getToken()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/google/firebase/iid/InstanceIdResultImpl;->token:Ljava/lang/String;

    return-object p0
.end method
