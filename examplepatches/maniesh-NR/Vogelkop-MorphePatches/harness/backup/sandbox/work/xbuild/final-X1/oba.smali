.class public final Loba;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Loba;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:[I

.field public final b:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Luz8;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Luz8;-><init>(B)V

    sput-object v0, Loba;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public synthetic constructor <init>(II[I)V
    .registers 4

    and-int/lit8 p1, p1, 0x1

    if-eqz p1, :cond_7

    const/4 p1, 0x0

    new-array p3, p1, [I

    :cond_7
    const/4 p1, 0x3

    invoke-direct {p0, p3, p1}, Loba;-><init>([II)V

    return-void
.end method

.method public constructor <init>([I)V
    .registers 4

    const/4 v0, 0x2

    const/4 v1, 0x0

    .line 15
    invoke-direct {p0, v0, v1, p1}, Loba;-><init>(II[I)V

    return-void
.end method

.method public constructor <init>([II)V
    .registers 3

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Loba;->a:[I

    .line 14
    iput p2, p0, Loba;->b:I

    return-void
.end method


# virtual methods
.method public final describeContents()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    if-eqz p1, :cond_b

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    goto :goto_c

    :cond_b
    const/4 v1, 0x0

    :goto_c
    const-class v2, Loba;

    invoke-virtual {v2, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_16

    return v2

    :cond_16
    check-cast p1, Loba;

    iget-object v1, p0, Loba;->a:[I

    iget-object v3, p1, Loba;->a:[I

    invoke-static {v1, v3}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v1

    if-nez v1, :cond_23

    return v2

    :cond_23
    iget p0, p0, Loba;->b:I

    iget p1, p1, Loba;->b:I

    if-eq p0, p1, :cond_2a

    return v2

    :cond_2a
    return v0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Loba;->a:[I

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([I)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget p0, p0, Loba;->b:I

    add-int/2addr v0, p0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .registers 3

    iget-object p2, p0, Loba;->a:[I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeIntArray([I)V

    iget p0, p0, Loba;->b:I

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
