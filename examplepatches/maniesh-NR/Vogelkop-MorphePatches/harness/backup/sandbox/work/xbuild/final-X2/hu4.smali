.class public final Lhu4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lhu4;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:J

.field public final b:Z

.field public final c:Ljava/lang/String;

.field public final d:J

.field public final e:Ljava/lang/String;

.field public final f:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lhh3;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lhh3;-><init>(B)V

    sput-object v0, Lhu4;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(JZLjava/lang/String;JLjava/lang/String;Z)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lhu4;->a:J

    iput-boolean p3, p0, Lhu4;->b:Z

    iput-object p4, p0, Lhu4;->c:Ljava/lang/String;

    iput-wide p5, p0, Lhu4;->d:J

    iput-object p7, p0, Lhu4;->e:Ljava/lang/String;

    iput-boolean p8, p0, Lhu4;->f:Z

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

    if-eq p0, p1, :cond_3a

    instance-of v0, p1, Lhu4;

    if-eqz v0, :cond_38

    check-cast p1, Lhu4;

    iget-wide v0, p0, Lhu4;->a:J

    iget-wide v2, p1, Lhu4;->a:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_38

    iget-boolean v0, p0, Lhu4;->b:Z

    iget-boolean v1, p1, Lhu4;->b:Z

    if-ne v0, v1, :cond_38

    iget-object v0, p0, Lhu4;->c:Ljava/lang/String;

    iget-object v1, p1, Lhu4;->c:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_38

    iget-wide v0, p0, Lhu4;->d:J

    iget-wide v2, p1, Lhu4;->d:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_38

    iget-object v0, p0, Lhu4;->e:Ljava/lang/String;

    iget-object v1, p1, Lhu4;->e:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_38

    iget-boolean p0, p0, Lhu4;->f:Z

    iget-boolean p1, p1, Lhu4;->f:Z

    if-eq p0, p1, :cond_3a

    :cond_38
    const/4 p0, 0x0

    return p0

    :cond_3a
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 6

    iget-wide v0, p0, Lhu4;->a:J

    invoke-static {v0, v1}, Ljava/lang/Long;->hashCode(J)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lhu4;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    const/4 v2, 0x0

    iget-object v3, p0, Lhu4;->c:Ljava/lang/String;

    if-nez v3, :cond_16

    move v3, v2

    goto :goto_1a

    :cond_16
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_1a
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-wide v3, p0, Lhu4;->d:J

    invoke-static {v0, v1, v3, v4}, Lz1m;->e(IIJ)I

    move-result v0

    iget-object v3, p0, Lhu4;->e:Ljava/lang/String;

    if-eqz v3, :cond_2a

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v2

    :cond_2a
    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-boolean p0, p0, Lhu4;->f:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

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

    iget-wide v0, p0, Lhu4;->a:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    iget-boolean p2, p0, Lhu4;->b:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    iget-object p2, p0, Lhu4;->c:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-wide v0, p0, Lhu4;->d:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    iget-object p2, p0, Lhu4;->e:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-boolean p0, p0, Lhu4;->f:Z

    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
