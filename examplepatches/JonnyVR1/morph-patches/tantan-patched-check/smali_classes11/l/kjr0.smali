.class public final Ll/kjr0;
.super Ll/z4s0;
.source "SourceFile"


# instance fields
.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Ll/uws0;


# direct methods
.method public constructor <init>(Ll/s3s0;Landroid/content/Context;Ll/uws0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/kjr0;->b:Landroid/content/Context;

    .line 2
    .line 3
    iput-object p3, p0, Ll/kjr0;->c:Ll/uws0;

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
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final bridge synthetic b(Ll/tbt0;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/kjr0;->b:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/kjr0;->c:Ll/uws0;

    .line 8
    .line 9
    const v1, 0xe52bf80

    .line 10
    .line 11
    .line 12
    invoke-interface {p1, v0, p0, v1}, Ll/tbt0;->t1(Ll/p1m;Ll/uws0;I)Ll/k1t0;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public final bridge synthetic c()Ljava/lang/Object;
    .locals 4
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/kjr0;->b:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :try_start_0
    iget-object v1, p0, Ll/kjr0;->b:Landroid/content/Context;

    .line 8
    .line 9
    const-string v2, "com.google.android.gms.ads.DynamiteOfflineUtilsCreatorImpl"

    .line 10
    .line 11
    sget-object v3, Ll/uhr0;->a:Ll/uhr0;

    .line 12
    .line 13
    invoke-static {v1, v2, v3}, Ll/gct0;->b(Landroid/content/Context;Ljava/lang/String;Ll/fct0;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/n1t0;

    .line 18
    .line 19
    iget-object p0, p0, Ll/kjr0;->c:Ll/uws0;

    .line 20
    .line 21
    const v2, 0xe52bf80

    .line 22
    .line 23
    .line 24
    invoke-interface {v1, v0, p0, v2}, Ll/n1t0;->s0(Ll/p1m;Ll/uws0;I)Ll/k1t0;

    .line 25
    .line 26
    .line 27
    move-result-object p0
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzcef; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    return-object p0

    .line 29
    :catch_0
    const/4 p0, 0x0

    .line 30
    return-object p0
.end method
