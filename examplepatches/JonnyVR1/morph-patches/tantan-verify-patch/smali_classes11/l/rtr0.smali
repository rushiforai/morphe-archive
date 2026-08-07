.class public final Ll/rtr0;
.super Ll/wzr0;
.source "SourceFile"


# instance fields
.field public final synthetic a:Landroid/app/PendingIntent;


# direct methods
.method public constructor <init>(Ll/x0s0;Lcom/google/android/gms/common/api/GoogleApiClient;Landroid/app/PendingIntent;)V
    .locals 0

    .line 1
    iput-object p3, p0, Ll/rtr0;->a:Landroid/app/PendingIntent;

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
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    check-cast p1, Ll/f5u0;

    .line 2
    .line 3
    iget-object v0, p0, Ll/rtr0;->a:Landroid/app/PendingIntent;

    .line 4
    .line 5
    invoke-static {p0}, Ll/x0s0;->a(Lcom/google/android/gms/common/api/internal/BaseImplementation$ResultHolder;)Ll/sni0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p1, v0, p0, v1}, Ll/f5u0;->f(Landroid/app/PendingIntent;Ll/sni0;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
