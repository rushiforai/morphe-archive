.class public final Ll/vsv0;
.super Ll/zyu0$a;
.source "SourceFile"


# instance fields
.field public final synthetic e:Landroid/os/Bundle;

.field public final synthetic f:Ll/xhu0;

.field public final synthetic g:Ll/zyu0;


# direct methods
.method public constructor <init>(Ll/zyu0;Landroid/os/Bundle;Ll/xhu0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/vsv0;->e:Landroid/os/Bundle;

    .line 2
    .line 3
    iput-object p3, p0, Ll/vsv0;->f:Ll/xhu0;

    .line 4
    .line 5
    iput-object p1, p0, Ll/vsv0;->g:Ll/zyu0;

    .line 6
    .line 7
    invoke-direct {p0, p1}, Ll/zyu0$a;-><init>(Ll/zyu0;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/vsv0;->g:Ll/zyu0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/zyu0;->h(Ll/zyu0;)Ll/pgu0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ll/pgu0;

    .line 12
    .line 13
    iget-object v1, p0, Ll/vsv0;->e:Landroid/os/Bundle;

    .line 14
    .line 15
    iget-object v2, p0, Ll/vsv0;->f:Ll/xhu0;

    .line 16
    .line 17
    iget-wide v3, p0, Ll/zyu0$a;->a:J

    .line 18
    .line 19
    invoke-interface {v0, v1, v2, v3, v4}, Ll/pgu0;->performAction(Landroid/os/Bundle;Ll/wmu0;J)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final b()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/vsv0;->f:Ll/xhu0;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Ll/xhu0;->zza(Landroid/os/Bundle;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
