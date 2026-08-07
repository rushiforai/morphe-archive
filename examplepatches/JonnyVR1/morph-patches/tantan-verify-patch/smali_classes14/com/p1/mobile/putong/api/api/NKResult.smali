.class public Lcom/p1/mobile/putong/api/api/NKResult;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/p1/mobile/putong/api/api/NKResult;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field iv:[B

.field ivLength:I

.field res:[B

.field resLength:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/api/api/NKResult$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/api/api/NKResult$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/api/api/NKResult;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/api/api/NKResult;->res:[B

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/api/api/NKResult;->iv:[B

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Lcom/p1/mobile/putong/api/api/NKResult;->resLength:I

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, Lcom/p1/mobile/putong/api/api/NKResult;->ivLength:I

    .line 20
    .line 21
    iget v1, p0, Lcom/p1/mobile/putong/api/api/NKResult;->resLength:I

    .line 22
    .line 23
    new-array v1, v1, [B

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/api/api/NKResult;->res:[B

    .line 26
    .line 27
    new-array v0, v0, [B

    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/api/api/NKResult;->iv:[B

    .line 30
    .line 31
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->readByteArray([B)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/NKResult;->iv:[B

    .line 35
    .line 36
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->readByteArray([B)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public constructor <init>([B[B)V
    .locals 1

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 41
    iput-object v0, p0, Lcom/p1/mobile/putong/api/api/NKResult;->res:[B

    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/api/api/NKResult;->iv:[B

    .line 43
    array-length v0, p1

    iput v0, p0, Lcom/p1/mobile/putong/api/api/NKResult;->resLength:I

    .line 44
    iput-object p1, p0, Lcom/p1/mobile/putong/api/api/NKResult;->res:[B

    .line 45
    array-length p1, p2

    iput p1, p0, Lcom/p1/mobile/putong/api/api/NKResult;->ivLength:I

    .line 46
    iput-object p2, p0, Lcom/p1/mobile/putong/api/api/NKResult;->iv:[B

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 1
    iget p2, p0, Lcom/p1/mobile/putong/api/api/NKResult;->resLength:I

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 4
    .line 5
    .line 6
    iget p2, p0, Lcom/p1/mobile/putong/api/api/NKResult;->ivLength:I

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, Lcom/p1/mobile/putong/api/api/NKResult;->res:[B

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByteArray([B)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/NKResult;->iv:[B

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeByteArray([B)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
