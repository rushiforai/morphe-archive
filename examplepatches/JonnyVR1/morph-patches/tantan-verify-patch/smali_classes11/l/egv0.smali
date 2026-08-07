.class public final Ll/egv0;
.super Ll/azs0;
.source "SourceFile"


# instance fields
.field public final a:Ll/scv0;

.field public final synthetic b:Ll/fgv0;


# direct methods
.method public synthetic constructor <init>(Ll/fgv0;Ll/scv0;Ll/dgv0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/egv0;->b:Ll/fgv0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/azs0;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/egv0;->a:Ll/scv0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final c(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/egv0;->a:Ll/scv0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/scv0;->c:Ll/g8u0;

    .line 4
    .line 5
    check-cast p0, Ll/vev0;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0, p1}, Ll/vev0;->G0(ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final f(Lcom/google/android/gms/ads/internal/client/zze;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/egv0;->a:Ll/scv0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/scv0;->c:Ll/g8u0;

    .line 4
    .line 5
    check-cast p0, Ll/vev0;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/vev0;->N4(Lcom/google/android/gms/ads/internal/client/zze;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final v6(Ll/rxs0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/egv0;->b:Ll/fgv0;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/fgv0;->c(Ll/fgv0;Ll/rxs0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/egv0;->a:Ll/scv0;

    .line 7
    .line 8
    iget-object p0, p0, Ll/scv0;->c:Ll/g8u0;

    .line 9
    .line 10
    check-cast p0, Ll/vev0;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/vev0;->zzo()V

    .line 13
    .line 14
    .line 15
    return-void
.end method
