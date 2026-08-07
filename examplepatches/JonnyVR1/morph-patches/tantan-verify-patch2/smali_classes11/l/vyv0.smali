.class public final Ll/vyv0;
.super Ll/zyu0$a;
.source "SourceFile"


# instance fields
.field public final synthetic e:Ll/xhu0;

.field public final synthetic f:I

.field public final synthetic g:Ll/zyu0;


# direct methods
.method public constructor <init>(Ll/zyu0;Ll/xhu0;I)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/vyv0;->e:Ll/xhu0;

    .line 2
    .line 3
    iput p3, p0, Ll/vyv0;->f:I

    .line 4
    .line 5
    iput-object p1, p0, Ll/vyv0;->g:Ll/zyu0;

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
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/vyv0;->g:Ll/zyu0;

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
    iget-object v1, p0, Ll/vyv0;->e:Ll/xhu0;

    .line 14
    .line 15
    iget p0, p0, Ll/vyv0;->f:I

    .line 16
    .line 17
    invoke-interface {v0, v1, p0}, Ll/pgu0;->getTestFlag(Ll/wmu0;I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final b()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/vyv0;->e:Ll/xhu0;

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
