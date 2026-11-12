.class public final Lflf;
.super Lg3;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lflf;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final c:I

.field public final d:F

.field public final e:F

.field public final f:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ls0g;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ls0g;-><init>(B)V

    sput-object v0, Lflf;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;Ljava/lang/ClassLoader;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lg3;-><init>(Landroid/os/Parcel;Ljava/lang/ClassLoader;)V

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p2

    iput p2, p0, Lflf;->c:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result p2

    iput p2, p0, Lflf;->d:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result p2

    iput p2, p0, Lflf;->e:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lflf;->f:I

    return-void
.end method

.method public constructor <init>(Lj2d;IFFI)V
    .registers 6

    .line 28
    invoke-direct {p0, p1}, Lg3;-><init>(Landroid/os/Parcelable;)V

    .line 29
    iput p2, p0, Lflf;->c:I

    .line 30
    iput p3, p0, Lflf;->d:F

    .line 31
    iput p4, p0, Lflf;->e:F

    .line 32
    iput p5, p0, Lflf;->f:I

    return-void
.end method


# virtual methods
.method public final writeToParcel(Landroid/os/Parcel;I)V
    .registers 3

    invoke-super {p0, p1, p2}, Lg3;->writeToParcel(Landroid/os/Parcel;I)V

    iget p2, p0, Lflf;->c:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget p2, p0, Lflf;->d:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    iget p2, p0, Lflf;->e:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    iget p0, p0, Lflf;->f:I

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
