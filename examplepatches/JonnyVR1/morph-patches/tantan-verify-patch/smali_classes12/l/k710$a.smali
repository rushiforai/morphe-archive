.class Ll/k710$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w350$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/k710;->b(Ll/pul;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/k710;


# direct methods
.method public constructor <init>(Ll/k710;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/k710$a;->a:Ll/k710;

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
    invoke-static {p1}, Ll/j710$a;->O(Landroid/os/IBinder;)Ll/j710;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    invoke-interface {p0}, Ll/j710;->isSupported()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ll/j710;->j()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_0
    new-instance p0, Lcom/immomo/momosec/device/oaid/OAIDException;

    .line 19
    .line 20
    const/16 p1, 0x27

    .line 21
    .line 22
    new-array p1, p1, [B

    .line 23
    .line 24
    fill-array-data p1, :array_0

    .line 25
    .line 26
    .line 27
    invoke-static {p1}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-direct {p0, p1}, Lcom/immomo/momosec/device/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    throw p0

    .line 35
    :cond_1
    new-instance p0, Lcom/immomo/momosec/device/oaid/OAIDException;

    .line 36
    .line 37
    const/16 p1, 0x16

    .line 38
    .line 39
    new-array p1, p1, [B

    .line 40
    .line 41
    fill-array-data p1, :array_1

    .line 42
    .line 43
    .line 44
    invoke-static {p1}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-direct {p0, p1}, Lcom/immomo/momosec/device/oaid/OAIDException;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    throw p0

    .line 52
    nop

    .line 53
    :array_0
    .array-data 1
        0x7dt
        0x15t
        0x50t
        0x7et
        0x5t
        0x2ft
        0x5et
        0x12t
        0x54t
        0x45t
        0x7t
        0x7t
        0x53t
        0x3t
        0x12t
        0x5et
        0x12t
        0x35t
        0x45t
        0x16t
        0x41t
        0x58t
        0x13t
        0x12t
        0x55t
        0x2t
        0x11t
        0x45t
        0x4t
        0x12t
        0x45t
        0x14t
        0x5ft
        0x17t
        0x7t
        0x7t
        0x5ct
        0x15t
        0x54t
    .end array-data

    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    :array_1
    .array-data 1
        0x7dt
        0x15t
        0x50t
        0x7et
        0x5t
        0x2ft
        0x5et
        0x12t
        0x54t
        0x45t
        0x7t
        0x7t
        0x53t
        0x3t
        0x11t
        0x5et
        0x12t
        0x46t
        0x5et
        0x13t
        0x5dt
        0x5bt
    .end array-data
.end method
