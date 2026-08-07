.class Ll/m4k$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w350$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/m4k;->b(Ll/pul;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/m4k;


# direct methods
.method public constructor <init>(Ll/m4k;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/m4k$a;->a:Ll/m4k;

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
    invoke-static {p1}, Ll/rol$a;->O(Landroid/os/IBinder;)Ll/rol;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-interface {p0, p1}, Ll/rol;->D7(Z)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    const/16 p1, 0x28

    .line 13
    .line 14
    new-array p1, p1, [B

    .line 15
    .line 16
    fill-array-data p1, :array_0

    .line 17
    .line 18
    .line 19
    invoke-static {p1}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p1}, Ll/jmw;->a(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    invoke-interface {p0}, Ll/rol;->getId()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0

    .line 31
    :array_0
    .array-data 1
        0x65t
        0x15t
        0x54t
        0x45t
        0x41t
        0xet
        0x51t
        0x15t
        0x11t
        0x53t
        0x8t
        0x15t
        0x51t
        0x4t
        0x5dt
        0x52t
        0x5t
        0x46t
        0x51t
        0x2t
        0x47t
        0x52t
        0x13t
        0x12t
        0x59t
        0x15t
        0x58t
        0x59t
        0x6t
        0x46t
        0x59t
        0x2t
        0x54t
        0x59t
        0x15t
        0xft
        0x56t
        0xft
        0x54t
        0x45t
    .end array-data
.end method
