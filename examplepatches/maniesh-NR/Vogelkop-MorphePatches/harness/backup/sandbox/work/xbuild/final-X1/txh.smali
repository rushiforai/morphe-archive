.class public final Ltxh;
.super Lpxh;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Ltxh;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:I

.field public final b:I

.field public final c:[Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lzug;

    const/16 v1, 0xf

    invoke-direct {v0, v1}, Lzug;-><init>(B)V

    sput-object v0, Ltxh;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>([Ljava/lang/Object;II)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Ltxh;->a:I

    iput p3, p0, Ltxh;->b:I

    iput-object p1, p0, Ltxh;->c:[Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final describeContents()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_2c

    if-eqz p1, :cond_9

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    const-class v1, Ltxh;

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2a

    check-cast p1, Ltxh;

    iget v0, p0, Ltxh;->a:I

    iget v1, p1, Ltxh;->a:I

    if-ne v0, v1, :cond_2a

    iget v0, p0, Ltxh;->b:I

    iget v1, p1, Ltxh;->b:I

    if-ne v0, v1, :cond_2a

    iget-object p0, p0, Ltxh;->c:[Ljava/lang/Object;

    iget-object p1, p1, Ltxh;->c:[Ljava/lang/Object;

    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2c

    :cond_2a
    const/4 p0, 0x0

    return p0

    :cond_2c
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget v0, p0, Ltxh;->a:I

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Ltxh;->b:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Ltxh;->c:[Ljava/lang/Object;

    invoke-static {p0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .registers 5

    iget p2, p0, Ltxh;->a:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget p2, p0, Ltxh;->b:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget-object p0, p0, Ltxh;->c:[Ljava/lang/Object;

    array-length p2, p0

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v0, 0x0

    :goto_11
    if-eq v0, p2, :cond_1b

    aget-object v1, p0, v0

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeValue(Ljava/lang/Object;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_11

    :cond_1b
    return-void
.end method
