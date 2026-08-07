.class public final Ll/i8v0;
.super Ll/zyu0$a;
.source "SourceFile"


# instance fields
.field public final synthetic e:Landroid/os/Bundle;

.field public final synthetic f:Ll/zyu0;


# direct methods
.method public constructor <init>(Ll/zyu0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/i8v0;->e:Landroid/os/Bundle;

    .line 2
    .line 3
    iput-object p1, p0, Ll/i8v0;->f:Ll/zyu0;

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ll/zyu0$a;-><init>(Ll/zyu0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/i8v0;->f:Ll/zyu0;

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
    iget-object v1, p0, Ll/i8v0;->e:Landroid/os/Bundle;

    .line 14
    .line 15
    iget-wide v2, p0, Ll/zyu0$a;->a:J

    .line 16
    .line 17
    invoke-interface {v0, v1, v2, v3}, Ll/pgu0;->setConsent(Landroid/os/Bundle;J)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
