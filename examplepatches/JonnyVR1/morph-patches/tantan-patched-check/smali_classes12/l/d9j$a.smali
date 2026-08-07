.class Ll/d9j$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w350$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/d9j;->b(Ll/pul;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/d9j;


# direct methods
.method public constructor <init>(Ll/d9j;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/d9j$a;->a:Ll/d9j;

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
    invoke-static {p1}, Ll/ufm$a;->O(Landroid/os/IBinder;)Ll/ufm;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ll/ufm;->j()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    new-instance p0, Lcom/immomo/momosec/device/oaid/OAIDException;

    .line 13
    .line 14
    const/16 p1, 0x13

    .line 15
    .line 16
    new-array p1, p1, [B

    .line 17
    .line 18
    fill-array-data p1, :array_0

    .line 19
    .line 20
    .line 21
    invoke-static {p1}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-direct {p0, p1}, Lcom/immomo/momosec/device/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    throw p0

    .line 29
    :array_0
    .array-data 1
        0x79t
        0x2t
        0x42t
        0x64t
        0x14t
        0x16t
        0x40t
        0xat
        0x58t
        0x52t
        0x13t
        0x46t
        0x59t
        0x15t
        0x11t
        0x59t
        0x14t
        0xat
        0x5ct
    .end array-data
.end method
