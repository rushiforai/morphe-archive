.class public final Ll/zc4;
.super Ljava/lang/Object;


# static fields
.field public static a:Ll/jql;


# direct methods
.method public static a(Lcom/google/android/gms/maps/model/LatLng;F)Ll/yc4;
    .locals 2

    .line 1
    :try_start_0
    new-instance v0, Ll/yc4;

    .line 2
    .line 3
    invoke-static {}, Ll/zc4;->c()Ll/jql;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1, p0, p1}, Ll/jql;->g6(Lcom/google/android/gms/maps/model/LatLng;F)Ll/p1m;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-direct {v0, p0}, Ll/yc4;-><init>(Ll/p1m;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    .line 14
    return-object v0

    .line 15
    :catch_0
    move-exception p0

    .line 16
    invoke-static {p0}, Ll/v6k;->a(Landroid/os/RemoteException;)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public static b(Ll/jql;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/jql;

    .line 6
    .line 7
    sput-object p0, Ll/zc4;->a:Ll/jql;

    .line 8
    .line 9
    return-void
.end method

.method public static c()Ll/jql;
    .locals 2

    .line 1
    sget-object v0, Ll/zc4;->a:Ll/jql;

    .line 2
    .line 3
    const-string v1, "CameraUpdateFactory is not initialized"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ll/jql;

    .line 10
    .line 11
    return-object v0
.end method
