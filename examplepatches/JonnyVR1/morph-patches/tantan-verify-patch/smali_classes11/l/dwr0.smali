.class public final Ll/dwr0;
.super Ll/wzr0;
.source "SourceFile"


# instance fields
.field public final synthetic a:Z


# direct methods
.method public constructor <init>(Ll/x0s0;Lcom/google/android/gms/common/api/GoogleApiClient;Z)V
    .locals 0

    .line 1
    iput-boolean p3, p0, Ll/dwr0;->a:Z

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ll/wzr0;-><init>(Lcom/google/android/gms/common/api/GoogleApiClient;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final bridge synthetic doExecute(Lcom/google/android/gms/common/api/Api$AnyClient;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    check-cast p1, Ll/f5u0;

    .line 2
    .line 3
    iget-boolean v0, p0, Ll/dwr0;->a:Z

    .line 4
    .line 5
    invoke-static {p0}, Ll/x0s0;->a(Lcom/google/android/gms/common/api/internal/BaseImplementation$ResultHolder;)Ll/sni0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, v0, p0}, Ll/f5u0;->c(ZLl/sni0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
