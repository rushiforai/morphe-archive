.class public final Ls5h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Ls5h;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Ln8g;

.field public final b:Z

.field public final c:I

.field public final d:Lnil;

.field public final e:Z

.field public final f:Ln8g;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lzug;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lzug;-><init>(B)V

    sput-object v0, Ls5h;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Ln8g;ZILnil;ZLn8g;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ls5h;->a:Ln8g;

    iput-boolean p2, p0, Ls5h;->b:Z

    iput p3, p0, Ls5h;->c:I

    iput-object p4, p0, Ls5h;->d:Lnil;

    iput-boolean p5, p0, Ls5h;->e:Z

    iput-object p6, p0, Ls5h;->f:Ln8g;

    return-void
.end method

.method public static a(Ls5h;Ln8g;ZII)Ls5h;
    .registers 13

    sget-object v0, Lnil;->b:Lnil;

    and-int/lit8 v1, p4, 0x1

    if-eqz v1, :cond_8

    iget-object p1, p0, Ls5h;->a:Ln8g;

    :cond_8
    move-object v2, p1

    and-int/lit8 p1, p4, 0x2

    if-eqz p1, :cond_f

    iget-boolean p2, p0, Ls5h;->b:Z

    :cond_f
    move v3, p2

    and-int/lit8 p1, p4, 0x4

    if-eqz p1, :cond_16

    iget p3, p0, Ls5h;->c:I

    :cond_16
    move v4, p3

    and-int/lit8 p1, p4, 0x8

    if-eqz p1, :cond_1d

    iget-object v0, p0, Ls5h;->d:Lnil;

    :cond_1d
    move-object v5, v0

    and-int/lit8 p1, p4, 0x10

    if-eqz p1, :cond_26

    iget-boolean p1, p0, Ls5h;->e:Z

    :goto_24
    move v6, p1

    goto :goto_28

    :cond_26
    const/4 p1, 0x0

    goto :goto_24

    :goto_28
    and-int/lit8 p4, p4, 0x20

    if-eqz p4, :cond_30

    iget-object p1, p0, Ls5h;->f:Ln8g;

    :goto_2e
    move-object v7, p1

    goto :goto_32

    :cond_30
    const/4 p1, 0x0

    goto :goto_2e

    :goto_32
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Ls5h;

    invoke-direct/range {v1 .. v7}, Ls5h;-><init>(Ln8g;ZILnil;ZLn8g;)V

    return-object v1
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
    instance-of v1, p1, Ls5h;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Ls5h;

    iget-object v1, p0, Ls5h;->a:Ln8g;

    iget-object v3, p1, Ls5h;->a:Ln8g;

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget-boolean v1, p0, Ls5h;->b:Z

    iget-boolean v3, p1, Ls5h;->b:Z

    if-eq v1, v3, :cond_1a

    return v2

    :cond_1a
    iget v1, p0, Ls5h;->c:I

    iget v3, p1, Ls5h;->c:I

    if-eq v1, v3, :cond_21

    return v2

    :cond_21
    iget-object v1, p0, Ls5h;->d:Lnil;

    iget-object v3, p1, Ls5h;->d:Lnil;

    if-eq v1, v3, :cond_28

    return v2

    :cond_28
    iget-boolean v1, p0, Ls5h;->e:Z

    iget-boolean v3, p1, Ls5h;->e:Z

    if-eq v1, v3, :cond_2f

    return v2

    :cond_2f
    iget-object p0, p0, Ls5h;->f:Ln8g;

    iget-object p1, p1, Ls5h;->f:Ln8g;

    if-eq p0, p1, :cond_36

    return v2

    :cond_36
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Ls5h;->a:Ln8g;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Ls5h;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget v2, p0, Ls5h;->c:I

    invoke-static {v2, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object v2, p0, Ls5h;->d:Lnil;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-boolean v0, p0, Ls5h;->e:Z

    invoke-static {v2, v1, v0}, Lfki;->k(IIZ)I

    move-result v0

    iget-object p0, p0, Ls5h;->f:Ln8g;

    if-nez p0, :cond_29

    const/4 p0, 0x0

    goto :goto_2d

    :cond_29
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    :goto_2d
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

    iget-object p2, p0, Ls5h;->a:Ln8g;

    invoke-virtual {p2}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-boolean p2, p0, Ls5h;->b:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget p2, p0, Ls5h;->c:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget-object p2, p0, Ls5h;->d:Lnil;

    invoke-virtual {p2}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-boolean p2, p0, Ls5h;->e:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget-object p0, p0, Ls5h;->f:Ln8g;

    if-nez p0, :cond_2a

    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    return-void

    :cond_2a
    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method
