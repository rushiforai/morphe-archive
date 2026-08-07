.class public abstract Ll/jx50$a;
.super Landroid/os/Binder;
.source "SourceFile"

# interfaces
.implements Ll/jx50;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/jx50;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/jx50$a$a;
    }
.end annotation


# static fields
.field private static final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x35

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sput-object v0, Ll/jx50$a;->a:Ljava/lang/String;

    .line 13
    .line 14
    return-void

    .line 15
    :array_0
    .array-data 1
        0x53t
        0x9t
        0x5ct
        0x19t
        0x14t
        0x9t
        0x54t
        0xft
        0x42t
        0x19t
        0xet
        0x16t
        0x55t
        0x8t
        0x55t
        0x52t
        0x17t
        0xft
        0x53t
        0x3t
        0x1ft
        0x56t
        0x8t
        0x2t
        0x5ct
        0x48t
        0x7et
        0x47t
        0x4t
        0x8t
        0x74t
        0x3t
        0x47t
        0x5et
        0x2t
        0x3t
        0x79t
        0x2t
        0x54t
        0x59t
        0x15t
        0xft
        0x56t
        0xft
        0x54t
        0x45t
        0x32t
        0x3t
        0x42t
        0x10t
        0x58t
        0x54t
        0x4t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x35

    .line 5
    .line 6
    new-array v0, v0, [B

    .line 7
    .line 8
    fill-array-data v0, :array_0

    .line 9
    .line 10
    .line 11
    invoke-static {v0}, Ll/qmw;->a([B)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, p0, v0}, Landroid/os/Binder;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :array_0
    .array-data 1
        0x53t
        0x9t
        0x5ct
        0x19t
        0x14t
        0x9t
        0x54t
        0xft
        0x42t
        0x19t
        0xet
        0x16t
        0x55t
        0x8t
        0x55t
        0x52t
        0x17t
        0xft
        0x53t
        0x3t
        0x1ft
        0x56t
        0x8t
        0x2t
        0x5ct
        0x48t
        0x7et
        0x47t
        0x4t
        0x8t
        0x74t
        0x3t
        0x47t
        0x5et
        0x2t
        0x3t
        0x79t
        0x2t
        0x54t
        0x59t
        0x15t
        0xft
        0x56t
        0xft
        0x54t
        0x45t
        0x32t
        0x3t
        0x42t
        0x10t
        0x58t
        0x54t
        0x4t
    .end array-data
.end method

.method public static O(Landroid/os/IBinder;)Ll/jx50;
    .locals 2

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    sget-object v0, Ll/jx50$a;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    instance-of v1, v0, Ll/jx50;

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    check-cast v0, Ll/jx50;

    .line 18
    .line 19
    return-object v0

    .line 20
    :cond_1
    new-instance v0, Ll/jx50$a$a;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/jx50$a$a;-><init>(Landroid/os/IBinder;)V

    .line 23
    .line 24
    .line 25
    return-object v0
.end method

.method public static P2()Ll/jx50;
    .locals 1

    .line 1
    sget-object v0, Ll/jx50$a$a;->b:Ll/jx50;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .locals 0

    .line 1
    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    sget-object v0, Ll/jx50$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq p1, v1, :cond_2

    .line 5
    .line 6
    const/4 v2, 0x2

    .line 7
    if-eq p1, v2, :cond_1

    .line 8
    .line 9
    const v2, 0x5f4e5446

    .line 10
    .line 11
    .line 12
    if-eq p1, v2, :cond_0

    .line 13
    .line 14
    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0

    .line 19
    :cond_0
    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return v1

    .line 23
    :cond_1
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-interface {p0}, Ll/jx50;->j5()Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p3, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 34
    .line 35
    .line 36
    return v1

    .line 37
    :cond_2
    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-interface {p0}, Ll/jx50;->k4()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p3}, Landroid/os/Parcel;->writeNoException()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p3, p0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return v1
.end method
