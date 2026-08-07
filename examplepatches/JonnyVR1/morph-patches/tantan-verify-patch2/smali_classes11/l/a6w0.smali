.class public final Ll/a6w0;
.super Ll/zyu0$a;
.source "SourceFile"


# instance fields
.field public final synthetic e:Landroid/os/Bundle;

.field public final synthetic f:Landroid/app/Activity;

.field public final synthetic g:Ll/zyu0$d;


# direct methods
.method public constructor <init>(Ll/zyu0$d;Landroid/os/Bundle;Landroid/app/Activity;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/a6w0;->e:Landroid/os/Bundle;

    .line 2
    .line 3
    iput-object p3, p0, Ll/a6w0;->f:Landroid/app/Activity;

    .line 4
    .line 5
    iput-object p1, p0, Ll/a6w0;->g:Ll/zyu0$d;

    .line 6
    .line 7
    iget-object p1, p1, Ll/zyu0$d;->a:Ll/zyu0;

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
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/a6w0;->e:Landroid/os/Bundle;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/os/Bundle;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Ll/a6w0;->e:Landroid/os/Bundle;

    .line 11
    .line 12
    const-string v2, "com.google.app_measurement.screen_service"

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    iget-object v1, p0, Ll/a6w0;->e:Landroid/os/Bundle;

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    instance-of v3, v1, Landroid/os/Bundle;

    .line 27
    .line 28
    if-eqz v3, :cond_1

    .line 29
    .line 30
    check-cast v1, Landroid/os/Bundle;

    .line 31
    .line 32
    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const/4 v0, 0x0

    .line 37
    :cond_1
    :goto_0
    iget-object v1, p0, Ll/a6w0;->g:Ll/zyu0$d;

    .line 38
    .line 39
    iget-object v1, v1, Ll/zyu0$d;->a:Ll/zyu0;

    .line 40
    .line 41
    invoke-static {v1}, Ll/zyu0;->h(Ll/zyu0;)Ll/pgu0;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-static {v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    check-cast v1, Ll/pgu0;

    .line 50
    .line 51
    iget-object v2, p0, Ll/a6w0;->f:Landroid/app/Activity;

    .line 52
    .line 53
    invoke-static {v2}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    iget-wide v3, p0, Ll/zyu0$a;->b:J

    .line 58
    .line 59
    invoke-interface {v1, v2, v0, v3, v4}, Ll/pgu0;->onActivityCreated(Ll/p1m;Landroid/os/Bundle;J)V

    .line 60
    .line 61
    .line 62
    return-void
.end method
