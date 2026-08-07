.class public final Ll/gtx0;
.super Ll/lky0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/lky0<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lcom/google/android/gms/auth/api/credentials/CredentialRequest;


# direct methods
.method public constructor <init>(Ll/syx0;Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/auth/api/credentials/CredentialRequest;)V
    .locals 0

    .line 1
    iput-object p3, p0, Ll/gtx0;->a:Lcom/google/android/gms/auth/api/credentials/CredentialRequest;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ll/lky0;-><init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Ll/j3z0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    new-instance p1, Ll/a9y0;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Ll/a9y0;-><init>(Ll/gtx0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/gtx0;->a:Lcom/google/android/gms/auth/api/credentials/CredentialRequest;

    .line 7
    .line 8
    invoke-interface {p2, p1, p0}, Ll/j3z0;->S0(Ll/h0z0;Lcom/google/android/gms/auth/api/credentials/CredentialRequest;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic createFailedResult(Lcom/google/android/gms/common/api/Status;)Lcom/google/android/gms/common/api/Result;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/qqw0;->a(Lcom/google/android/gms/common/api/Status;)Ll/qqw0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
