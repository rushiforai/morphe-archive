.class public final Ll/n9v0;
.super Ll/zyu0$a;
.source "SourceFile"


# instance fields
.field public final synthetic e:Ljava/lang/Boolean;

.field public final synthetic f:Ll/zyu0;


# direct methods
.method public constructor <init>(Ll/zyu0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/n9v0;->e:Ljava/lang/Boolean;

    .line 2
    .line 3
    iput-object p1, p0, Ll/n9v0;->f:Ll/zyu0;

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
    iget-object v0, p0, Ll/n9v0;->e:Ljava/lang/Boolean;

    .line 2
    .line 3
    iget-object v1, p0, Ll/n9v0;->f:Ll/zyu0;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {v1}, Ll/zyu0;->h(Ll/zyu0;)Ll/pgu0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/pgu0;

    .line 16
    .line 17
    iget-object v1, p0, Ll/n9v0;->e:Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iget-wide v2, p0, Ll/zyu0$a;->a:J

    .line 24
    .line 25
    invoke-interface {v0, v1, v2, v3}, Ll/pgu0;->setMeasurementEnabled(ZJ)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-static {v1}, Ll/zyu0;->h(Ll/zyu0;)Ll/pgu0;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ll/pgu0;

    .line 38
    .line 39
    iget-wide v1, p0, Ll/zyu0$a;->a:J

    .line 40
    .line 41
    invoke-interface {v0, v1, v2}, Ll/pgu0;->clearMeasurementEnabled(J)V

    .line 42
    .line 43
    .line 44
    return-void
.end method
