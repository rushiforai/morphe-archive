.class public final Ll/udr0;
.super Ll/z4s0;
.source "SourceFile"


# instance fields
.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Ll/uws0;


# direct methods
.method public constructor <init>(Ll/s3s0;Landroid/content/Context;Ll/uws0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/udr0;->b:Landroid/content/Context;

    .line 2
    .line 3
    iput-object p3, p0, Ll/udr0;->c:Ll/uws0;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/z4s0;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final bridge synthetic a()Ljava/lang/Object;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/udr0;->b:Landroid/content/Context;

    .line 2
    .line 3
    const-string v0, "out_of_context_tester"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/s3s0;->q(Landroid/content/Context;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method

.method public final bridge synthetic b(Ll/tbt0;)Ljava/lang/Object;
    .locals 3
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/udr0;->b:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0}, Ll/sgs0;->a(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    sget-object v0, Ll/sgs0;->m9:Ll/dgs0;

    .line 11
    .line 12
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v2, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ljava/lang/Boolean;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object p0, p0, Ll/udr0;->c:Ll/uws0;

    .line 29
    .line 30
    const v0, 0xe52bf80

    .line 31
    .line 32
    .line 33
    invoke-interface {p1, v1, p0, v0}, Ll/tbt0;->o6(Ll/p1m;Ll/uws0;I)Ll/tgu0;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0

    .line 38
    :cond_0
    const/4 p0, 0x0

    .line 39
    return-object p0
.end method

.method public final bridge synthetic c()Ljava/lang/Object;
    .locals 5
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/udr0;->b:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0}, Ll/sgs0;->a(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    sget-object v0, Ll/sgs0;->m9:Ll/dgs0;

    .line 11
    .line 12
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v2, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ljava/lang/Boolean;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const/4 v2, 0x0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    :try_start_0
    iget-object v0, p0, Ll/udr0;->b:Landroid/content/Context;

    .line 30
    .line 31
    const-string v3, "com.google.android.gms.ads.DynamiteOutOfContextTesterCreatorImpl"

    .line 32
    .line 33
    sget-object v4, Ll/kcr0;->a:Ll/kcr0;

    .line 34
    .line 35
    invoke-static {v0, v3, v4}, Ll/gct0;->b(Landroid/content/Context;Ljava/lang/String;Ll/fct0;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Ll/aiu0;

    .line 40
    .line 41
    iget-object v3, p0, Ll/udr0;->c:Ll/uws0;

    .line 42
    .line 43
    const v4, 0xe52bf80

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1, v3, v4}, Ll/aiu0;->m4(Ll/p1m;Ll/uws0;I)Ll/tgu0;

    .line 47
    .line 48
    .line 49
    move-result-object p0
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzcef; {:try_start_0 .. :try_end_0} :catch_2
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    return-object p0

    .line 51
    :catch_0
    move-exception v0

    .line 52
    goto :goto_0

    .line 53
    :catch_1
    move-exception v0

    .line 54
    goto :goto_0

    .line 55
    :catch_2
    move-exception v0

    .line 56
    :goto_0
    iget-object p0, p0, Ll/udr0;->b:Landroid/content/Context;

    .line 57
    .line 58
    invoke-static {p0}, Ll/w2t0;->c(Landroid/content/Context;)Ll/y2t0;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const-string v1, "ClientApiBroker.getOutOfContextTester"

    .line 63
    .line 64
    invoke-interface {p0, v0, v1}, Ll/y2t0;->b(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    :cond_0
    return-object v2
.end method
