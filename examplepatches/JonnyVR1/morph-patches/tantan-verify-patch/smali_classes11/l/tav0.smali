.class public final Ll/tav0;
.super Ll/zyu0$a;
.source "SourceFile"


# instance fields
.field public final synthetic e:Ll/zyu0;


# direct methods
.method public constructor <init>(Ll/zyu0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tav0;->e:Ll/zyu0;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/zyu0$a;-><init>(Ll/zyu0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/tav0;->e:Ll/zyu0;

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
    iget-wide v1, p0, Ll/zyu0$a;->a:J

    .line 14
    .line 15
    invoke-interface {v0, v1, v2}, Ll/pgu0;->resetAnalyticsData(J)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
