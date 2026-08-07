.class public final Ll/p3v0;
.super Ll/zyu0$a;
.source "SourceFile"


# instance fields
.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Ll/xhu0;

.field public final synthetic h:Ll/zyu0;


# direct methods
.method public constructor <init>(Ll/zyu0;Ljava/lang/String;Ljava/lang/String;Ll/xhu0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/p3v0;->e:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p3, p0, Ll/p3v0;->f:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p4, p0, Ll/p3v0;->g:Ll/xhu0;

    .line 6
    .line 7
    iput-object p1, p0, Ll/p3v0;->h:Ll/zyu0;

    .line 8
    .line 9
    invoke-direct {p0, p1}, Ll/zyu0$a;-><init>(Ll/zyu0;)V

    .line 10
    .line 11
    .line 12
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
    iget-object v0, p0, Ll/p3v0;->h:Ll/zyu0;

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
    iget-object v1, p0, Ll/p3v0;->e:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v2, p0, Ll/p3v0;->f:Ljava/lang/String;

    .line 16
    .line 17
    iget-object p0, p0, Ll/p3v0;->g:Ll/xhu0;

    .line 18
    .line 19
    invoke-interface {v0, v1, v2, p0}, Ll/pgu0;->getConditionalUserProperties(Ljava/lang/String;Ljava/lang/String;Ll/wmu0;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final b()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/p3v0;->g:Ll/xhu0;

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
