.class public final Ll/tmv0;
.super Ll/zyu0$a;
.source "SourceFile"


# instance fields
.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Z

.field public final synthetic h:Ll/xhu0;

.field public final synthetic i:Ll/zyu0;


# direct methods
.method public constructor <init>(Ll/zyu0;Ljava/lang/String;Ljava/lang/String;ZLl/xhu0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/tmv0;->e:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p3, p0, Ll/tmv0;->f:Ljava/lang/String;

    .line 4
    .line 5
    iput-boolean p4, p0, Ll/tmv0;->g:Z

    .line 6
    .line 7
    iput-object p5, p0, Ll/tmv0;->h:Ll/xhu0;

    .line 8
    .line 9
    iput-object p1, p0, Ll/tmv0;->i:Ll/zyu0;

    .line 10
    .line 11
    invoke-direct {p0, p1}, Ll/zyu0$a;-><init>(Ll/zyu0;)V

    .line 12
    .line 13
    .line 14
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
    iget-object v0, p0, Ll/tmv0;->i:Ll/zyu0;

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
    iget-object v1, p0, Ll/tmv0;->e:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v2, p0, Ll/tmv0;->f:Ljava/lang/String;

    .line 16
    .line 17
    iget-boolean v3, p0, Ll/tmv0;->g:Z

    .line 18
    .line 19
    iget-object p0, p0, Ll/tmv0;->h:Ll/xhu0;

    .line 20
    .line 21
    invoke-interface {v0, v1, v2, v3, p0}, Ll/pgu0;->getUserProperties(Ljava/lang/String;Ljava/lang/String;ZLl/wmu0;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final b()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/tmv0;->h:Ll/xhu0;

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
