.class public final Ll/nwv0;
.super Ll/zyu0$a;
.source "SourceFile"


# instance fields
.field public final synthetic e:Z

.field public final synthetic f:Ll/zyu0;


# direct methods
.method public constructor <init>(Ll/zyu0;Z)V
    .locals 0

    .line 1
    iput-boolean p2, p0, Ll/nwv0;->e:Z

    .line 2
    .line 3
    iput-object p1, p0, Ll/nwv0;->f:Ll/zyu0;

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
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/nwv0;->f:Ll/zyu0;

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
    iget-boolean p0, p0, Ll/nwv0;->e:Z

    .line 14
    .line 15
    invoke-interface {v0, p0}, Ll/pgu0;->setDataCollectionEnabled(Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
