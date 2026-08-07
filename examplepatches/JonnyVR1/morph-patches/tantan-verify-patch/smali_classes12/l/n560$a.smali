.class Ll/n560$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w350$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/n560;->b(Ll/pul;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/n560;


# direct methods
.method public constructor <init>(Ll/n560;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/n560$a;->a:Ll/n560;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/os/IBinder;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/immomo/momosec/device/oaid/OAIDException;,
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/n560$a;->a:Ll/n560;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/n560;->d(Landroid/os/IBinder;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/immomo/momosec/device/oaid/OAIDException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    return-object p0

    .line 8
    :catch_0
    move-exception p0

    .line 9
    new-instance p1, Lcom/immomo/momosec/device/oaid/OAIDException;

    .line 10
    .line 11
    invoke-direct {p1, p0}, Lcom/immomo/momosec/device/oaid/OAIDException;-><init>(Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    throw p1

    .line 15
    :catch_1
    move-exception p0

    .line 16
    throw p0
.end method
